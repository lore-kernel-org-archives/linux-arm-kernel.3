Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF8DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 05:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arr1cIQDWQ85UNxT0vXH42mAmapJQ1QAA5R92t31ZZo=; b=CLDqQNuX8xJx30HCDn7LZRQEGd
	eE4iPU6JqD73UPn2odJ0XzflgaofW+UHhx2xJgMBV4Hb5wWPAzS7R7MfQhjGRw0+Rnizeewv3YB2e
	X0GmMKMGKW56YvLUFX03XCVtG75R8DIMpeZpBVRYlTxx/rO8oVYEJ0UUmbW49zEZDYuyN5KolXLyr
	BPNj4F26/drG0USA7wBBwWkCGRGYbcxDhWO3Ql0lsP9CUYjy6kXMoUWQ3hqnE8JH6IyXgo7oaM6FE
	hO7+EWzTOjWIFDGgqewbwKhh/pn0TjB7k/hI9X/OGxolpX2WHFjrA/1n4AfPD+bTfTGdFjTMquYgq
	QBpdwX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgLW-0000000CbE2-0zWs;
	Wed, 04 Jun 2025 05:07:26 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgJM-0000000Cb83-2dIS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 05:05:14 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-742c9907967so6333153b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 22:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749013511; x=1749618311; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=arr1cIQDWQ85UNxT0vXH42mAmapJQ1QAA5R92t31ZZo=;
        b=QkShUQUzk67IQK/XOfI7WMqMdY0O9MMyhtilskJ7C5CigdJ4lmk3WPpC1Lb8f3EsHQ
         gcosp84sh4ck31yU+/atRbVuH8sEzQu/5rQQc/k/TYRpxyJGI2QJWXGGqzs26gJ57wZF
         ab2+6cdaibV0A/0FiWMapV7VzSxim5l0lApLx8oAAdKbDHUy8fU90cHWJTx2BhTyl4PY
         UAdNqm/9HgHShgl8OrVZ9s5b92YldaUpiWKA0zArw0f7/77HjaOMntzjvTwsLe9fixZe
         /DZJtNAO7YLqoBFbUw70x8D02ZuykMOri3NZZRifLRcfOiNF+VmxZXrQkK8qkBliVBAI
         Ls2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749013511; x=1749618311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arr1cIQDWQ85UNxT0vXH42mAmapJQ1QAA5R92t31ZZo=;
        b=LTt4GNohfKce3yxDiHi4uRkfOSBZvpdLdtw3MU6f44gIJkdQKd16vQYo/kXemyfKQY
         1LRNP0sD8Je9DjJz9pxIx3GgbXfpATCBXuwehLLvEEIYbwF2axQCRgT/sJoVEdZJJap6
         ktGZAAuNuzEF6uITBba/e4SfAhBAT0dahd3bUUkdvXm42l20UVbvaJwLAV2I5doOYrMu
         AG7mCbZ8HK74hq0sjEDDsHD4ZPdyBUkzWVOgza/TzY1lgm5TiBACi9QX2wJ1deN17tlK
         tVgQPWTT9NsMdNLXTlLoFL1KnwDg/CtYWKLmb3eL6mPdvFsA1zYPgX+BCiKRkKGOiWNp
         4vaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW28n5bCZAVbkAN2kw0nPvBA8AFeFwchRptBX+XnXfy4Q5feuxUO2o2jS8NWW4eCRHezgMtbDw6foMqBYv/WDvN@lists.infradead.org
X-Gm-Message-State: AOJu0YwCBRryAFlDXYVouR7hoFY2kMRt+jyObNb9L+lXGcI7MUNtploI
	1GRIAh9jAr6nBk/yp8TAgypz2qa5Om/D+Df0xSitfxMCgMc6iH+Wz25VRTMIsvHxL1Q=
X-Gm-Gg: ASbGncvpWvRbKP+ifhLWUjkWZm7wyFYzLAR//hey1RwCIIRQo+ozP32Uy5R5YBxedfT
	T+HNHPE+xIB/3GP7fEWHRJIwaTQ/UZJh5DLQFaouWqdE7n3dNrtfQ8tZnXwekujxPF9k9/EhoAO
	ecvTQzGQBITUumgorVID9uFKvYVxfXl8iLM9CQyy36A31OV52Cz7qNeUb1gfKGnclyz8ZG49bDj
	76jLkE8KM0HfFT21rYc02aFA+qn6QJyKjh8D4ENxSUFaulJLJBOAtU3+WPb3bKDPAKZcyPf5gIv
	NOpmwXTv3hwiKk+5GZpZQHGZNxV9pgnAB0zPyUgqji6EY/POUCiTTyluj/vrGKU=
X-Google-Smtp-Source: AGHT+IGXoCzXSG926c8igF9Ar55RaA8MOKgOfyKdu8B04UZV+x5lFohpMa4DlNWuLNw1egbXPvIZyw==
X-Received: by 2002:a05:6a00:14d4:b0:742:a82c:d832 with SMTP id d2e1a72fcca58-7480b4650abmr2704742b3a.24.1749013511524;
        Tue, 03 Jun 2025 22:05:11 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed33casm10249004b3a.73.2025.06.03.22.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 22:05:10 -0700 (PDT)
Date: Wed, 4 Jun 2025 10:35:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Fix struct ffa_indirect_msg_hdr
Message-ID: <20250604050508.wvxggosu5tcwp3ie@vireshk-i7>
References: <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
 <20250603-jovial-whimsical-vole-029c39@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-jovial-whimsical-vole-029c39@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_220512_686094_F09DA227 
X-CRM114-Status: GOOD (  12.88  )
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

On 03-06-25, 14:00, Sudeep Holla wrote:
> On Tue, Jun 03, 2025 at 04:38:53PM +0530, Viresh Kumar wrote:
> > As per the spec, one 32 bit reserved entry is missing here, add it.
> > 
> 
> Nice catch! Not sure how it was missed.
> 
> If there is no objection, we must add
> 
> Fixes: 910cc1acc9b4 ("firmware: arm_ffa: Add support for passing UUID in FFA_MSG_SEND2")
> 
> I will fix up when applying.

Sure.

-- 
viresh

