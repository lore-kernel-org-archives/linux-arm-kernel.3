Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49EDD3CCA7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 04:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+n8GlhqjGW9h/LpOBUoPhtr9TRrvBPIYxXAgf01A/8Q=; b=Le1wdBykev+FKNt5lpO2aYOF3H
	g/PwtFGW+CFRqRSfaqvot/MjICYyxIgojkUWFo3VT9uzAxWEMLkqSbXhGP7hk1fbXZDqTJyEQBOyz
	4VWAmANOf3Jmc/SA98uMpgDmi6F8Yq8racCoWQ8WlEy5kJexajMgYzU4FuqhOQRLb+tSiOA35WKwG
	HMv5NKC3MoRfVv10sjElGRkWOzbdEuMtuGKi1eYhNrLjhuYhbSZej3q1BBeacoRzTFgtEcG+Q36Li
	Nezq6xKURQijd1ZCEsGpi8VHxoX32sd21umGvlRTzBtZRCnzh7X/mxTdNMFJwDAW2fZsoS1WSmIv9
	LoY1YyBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgEjD-0000000BkLx-3LBZ;
	Thu, 15 Jan 2026 04:12:59 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgEjB-0000000BkLL-3qnk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 04:12:58 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-81f3fba4a11so427877b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 20:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768450377; x=1769055177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+n8GlhqjGW9h/LpOBUoPhtr9TRrvBPIYxXAgf01A/8Q=;
        b=zdwPeM0zU8wed2wx+2STwCcZWsoWJYT8kqs0kMN0fo8/QKtSeGiIShRPZAlJLZXCKa
         vz8gDavf1FElzHW7ulSfCo0yM4V35bEjBbomkOLYqFJvnwPHn35owFHDTeuGMYOUX9f3
         xr5tFIDlT1vIEF3lqZnnB0JmTVwNKa+WSlY3X3oy6prhe4DqjzAR5MKh0RlPeqCFoO47
         YqACpznHj6Bn0qD3iWnbrkeFvdlDwK/EqZEGErXD9a0XIdfBkFyV/uGoPvdJ5AIMPjco
         UWnfl3zTrIH1pN9PJW5c95fUQoRyvxUhI4CwDtJsVqyUZoXRZK3NAWmuNTZwzt6kb1Xs
         SnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768450377; x=1769055177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+n8GlhqjGW9h/LpOBUoPhtr9TRrvBPIYxXAgf01A/8Q=;
        b=S183bw4Jzj32yjf+BDIex/Okk8qsn4obvmpI7sVtT041b5JgMHrzNt+fJiBwQLgANI
         ebnAGceJWuHonyfkgFCGlvdT4ZqWOFkCBOFcbBdb9MfKl2JdEuIgLFSBlSIFF+LjNeBf
         LlmxvkuFza0Gg4vek5ZGcAfWn/ebgxS8Q59wX16iqKaZBfjZRbQgUG7eh1qPC8H9xjQx
         lxKW0dwd0VfpD7JEGZYRpucKKuL5g1BGiOvDBGJoVtNuCFQug3eIKGD1Ok10Gina4Rr2
         z46qs6fqklvShRBdGyyarW3vYrJHznp8h0RsashW8UAg0Scjzh0RqO4QNHCO2ej54Hch
         e3Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWtEKUh4XD73N9abAuXz8aKGSrDY/ifnAlt0JnkjHtt7Ug9fSPE9jQC3kX7GDwnNrysziGymH01mC7GRZf7h5V8@lists.infradead.org
X-Gm-Message-State: AOJu0YyU6N3vjyqa4Cv3VEfMYiqdTrQCChe3gu/CNjg+X2KKxO46499M
	iEw0rRmhXepaOqqA4jf53qeGQsMhQb4+6U9Z63CSFxzU4OEenL5YcZqOlhQ0SPm/S7A=
X-Gm-Gg: AY/fxX7FqEt1py5JGnHbTB+ep16MJYjZ0RemgUvlhds6D+n9atqGd84wCL6O4321QOg
	+lK1Suc6Cg3UD53UoTd+9c2HG2ylgaxaxLdont+j75ceVe/vIhQyRGsLewtWX6W5/jxBODZZSal
	+Qjk3UDWz8+qkB6jsuZOiWD242hb/RIwh2EFeb5bcZ3UTlO+rU3Ydv5ijnLiHe7u8b9W4aFRjVm
	57sMEY0EL83nrrTC1ClCStYLHg0gicTlHd5oKQT61bBtm1BA5DYSCjtOpJPD/RXPh1x5UhEu9s3
	SEwQJADTUDfLrnRgE6DQXAlBM05gQAvhP2fqGSO8TVuofhWSUvO0fbS8bUzo2OT/Vh+CalEzq4d
	fQN/FbDhlBS3PcubFi3GUSX6rffd0hA9UiG/NjO1htrK9Sp3SVftyHsfYcRscV6peKWMAU7hEWn
	8XJcvSg/rX17I=
X-Received: by 2002:a05:6a00:1d92:b0:7b8:ac7f:5969 with SMTP id d2e1a72fcca58-81f81ce46eemr5018354b3a.4.1768450376695;
        Wed, 14 Jan 2026 20:12:56 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e65097asm1012975b3a.37.2026.01.14.20.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 20:12:55 -0800 (PST)
Date: Thu, 15 Jan 2026 09:42:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpufreq: scmi: correct SCMI explanation
Message-ID: <reqgrcf6j4t5fxtuoe4fr7rygpfxaiapzyt5rhrpts45rdmaoj@wghppcuxvcuk>
References: <e6c2e7af-ad87-4d38-9dbb-f9d6ae81fe83@auroraos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6c2e7af-ad87-4d38-9dbb-f9d6ae81fe83@auroraos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_201257_957233_7C39C7E7 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 13-01-26, 22:33, Sergey Shtylyov wrote:
> SCMI stands for System Control and Management Interface, not System Control
> and Power Interface -- apparently, Sudeep Holla copied this line from his
> SCPI driver and then just forgot to update the acronym explanation... :-)
> 
> Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

Applied. Thanks.

-- 
viresh

