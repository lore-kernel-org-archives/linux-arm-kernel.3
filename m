Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A92EF36E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JW0MZcJRk2sqhLDVCnNP5rTQ0hweIcxDtGuzOsuQ5ts=; b=YLmWbYaZfSCTTfeHll5DKj4IgR
	76Zx0opVmEVO+M7nVNDbYlq7orp1c3d1FxclapwXj8bks+jH62BuNXrJ18zcCQP0M7MnT17Gy3d6y
	6WX3Pn+La+SuZ12ofseI8lYlcqa2MAsLF3stT/gMxpsEZ4QyLn6hH3e/hRBNlDO+6k5kJfzZ7lZjy
	zB4tqOvpMg3IaixF8eV6o1q8e0KL20G8lZu0a68NoBj3xfIpPtfDwoyTHI50wfePFEibPdkRgLS/p
	Fa27tr6l2ZRUzM11LGjcZsR60srAW/IE7wm1Uog+LxSD4oRg1OHzp+LFs9F0Do6rU9yvqemwt2fmR
	ZTuCT5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUId-00000006kMR-1e1J;
	Mon, 09 Mar 2026 06:41:07 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUIZ-00000006kM4-2LUv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 06:41:06 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35691a231a7so6958959a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 23:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773038462; x=1773643262; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JW0MZcJRk2sqhLDVCnNP5rTQ0hweIcxDtGuzOsuQ5ts=;
        b=Kp47prTL3eHa+JN1ajJBMkGOssKca/bnwjq4F9pNsIumlY5beDP/gEjAcKYBlIm7Js
         QRtIZba73GYK4FEq8Uejcu3Ndp/3V+6KOckL/VSL4MNt6QGG3DeARmLkA+xR2Po/kjBr
         FUrx9KyJU8McHsxtylv+70qLbGt/rpST4vx/7te9Qvw51WKJufSnYXcZmZCHSpYdHpH5
         3QrmmO2gDlLvTgVS9guOHCZ034HufqqJWXEtxROF2kvYZZBkCQQZF4b7c5sRGvNNp7BB
         tcSlY+c/t8qM3tJ5qzsRdBpFTCObfS0zgKiYMknOl+PlbER8GbnwPWcwPdIhOW/XwhSV
         TYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038462; x=1773643262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JW0MZcJRk2sqhLDVCnNP5rTQ0hweIcxDtGuzOsuQ5ts=;
        b=Rnp8RV4lEU3JueBKbjgwDAYo15rftOZBdOcOypvm9lSGpogr1xs0B5IDToKAFiY+4b
         UudlFZPJgale5rBcez92Ef6Ib+zXhT+IaLHdcjI2fupDDCFiE0hGvao0RpD93hLyC9YB
         ASLLpixUszRikOAUhGPxBHKHAEeaijzr9JvHhSqkfWtY0xCdozswaqy0Gm9d2YGQchg6
         bJhiQM0ac7y1DgoN+N4bKvqf1D302mNK4OGnAeqy76e8WlMhdyqMA2rIb4UFT/58YkBI
         U8+nOpPEP3RIEPV7I/giQlhWiTXT9AAQABktwI7YfUD1tK7n30lS5SSOQvhh/3Y/A+pp
         H6Lg==
X-Forwarded-Encrypted: i=1; AJvYcCX7F+qTNH1uYkCAahBHX7R9RL9VxzX9Q2Cy2QoQfBUnEggTCxsr+FY0cw4JAWmMvB8CfxXSaVG4EuwI92cgk3wM@lists.infradead.org
X-Gm-Message-State: AOJu0YwskqAwLl+ny+IgK92zDE5n/0UE4qCx6IXQgy0FBmm6A3L4THc3
	BF4p9v2UTZYNwDDkgE1Vv/Weg6QOVyzxGtUoRbj4uN3rl9Sy/rOlkFHvrHeS4wAIUgI=
X-Gm-Gg: ATEYQzzVZEViZWB5KB/JgLvp45zWccNz+rDC3LV8FnAMGaByP61SzFspbIMCJuUXvyT
	Go8YwUpOU4/A9rcXVbSnjzyCS79Yn7TTyRVrHzg/NJinBMCemK9XW5fGpYCVcCIXg7zdj8R1+30
	g1284t36341aseWE3poznuhcKONsbesPmHOtWYFAJKzUuuMQfx2jIwsIkjxdTv2X+LCfpJWZ8sI
	JNEG/EuW7RxPz9gLtE9IjDIjJ09HOBGua+BNKKCwJnsW6L1PhSqbJgXAM5tx9InBD8kKbqaSZpw
	ITMmfSWR4oazyuXiGKu8Fvv84WiJJ+U/upbEf+I45v5XHS/Q3uf8Hh8mXQSMRgFjNOdYqEyrmus
	yZod003Gksnlfs2dwQJpc1s3l5Xg52zXNChlaFS7JxAsWHLgrKw4gXHhS2/nIzLbQlNiNjyXwIy
	fivlOJs7ux2/vm9QIPgEfbJTq9
X-Received: by 2002:a17:90b:2496:b0:359:8564:dc0e with SMTP id 98e67ed59e1d1-359be21aab6mr4814181a91.3.1773038461889;
        Sun, 08 Mar 2026 23:41:01 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bbced910sm3768239a91.5.2026.03.08.23.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:41:01 -0700 (PDT)
Date: Mon, 9 Mar 2026 12:10:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: sudeep.holla@kernel.org, rafael@kernel.org, cristian.marussi@arm.com, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scmi: Fix of_node use-after-free in
 scmi_dev_used_by_cpus()
Message-ID: <4txmeyv4b2r3avz4rrkpzyyvenywn65qqhqmxw7zxewcp2engl@pxzekwutillr>
References: <20260302155348.26374-1-18255117159@163.com>
 <4lbgs3xszh75i4nucdhkbi2j33xvu6y3qfkilrshswbn73kpo4@kp36dhmrpogk>
 <5507e0c8-9733-47e1-bd8e-a335d39ad5ce@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5507e0c8-9733-47e1-bd8e-a335d39ad5ce@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_234103_631505_35FDF4B2 
X-CRM114-Status: UNSURE (   8.86  )
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

On 09-03-26, 10:20, Hans Zhang wrote:
> Thank you very much for your reply. Then, do you think this patch is
> necessary?

No, this patch isn't required I think.

-- 
viresh

