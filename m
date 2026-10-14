Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918A2CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WndwsVBnokaEULAtUgcH4KgNi79vCmesxGK8Y8PtXoU=; b=XQoSj9SBUHp9GwiryGBTxAjj74
	qi0F9fSR4L/bvuDTlM3bchDT/w/XR0A8WfNWxNdifu08hdAtUSiNwBpUwpBK+EYLFdrmc42BDmGYF
	BcnuJMNRv6Agr1tYcULR8QIzhhH8EtGJaMnmMnnA5184NNwnCuo1RAgUdrM3PmYbKzMnLx3F/xBXf
	+CXylmsxUtazR+Cv6ytdHKhALjDWjyFzG+QjvTYFLGV+cUSq0Lj9qsodKmTzVwNz8h9N36dJPYbza
	88VNRkRBzChHi/g2bBl52uKTNKUYwcrag0JRsG0Nne22waCdedgzNWH8u+D5lFgzPhzMWopO99wpt
	auJJxjaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsCj-0000000Eabv-07I3;
	Wed, 14 Oct 2026 06:11:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsCf-0000000Eab4-3nwF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:11:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso5590995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791958264; x=1792563064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WndwsVBnokaEULAtUgcH4KgNi79vCmesxGK8Y8PtXoU=;
        b=p2q0EjFjKsEpAwpEH7pMW9rlzI0VbyNC0Vz9FOg01POL5lpjgTV/xEYsfYXqVTBkBn
         FTjHfYbg2+9YuDkdTWdoV/ZLsNahwsftYyk6ioraXHWrBwmtqvmhQ0NeV/HRWVl7JQku
         UW0BLfVuee0VJoO3T9TXWSxJS5u3pNa+yHyXApoCTGL7e9OEhSco1iW+RW/6uVX78y1M
         wMioiEwMh7jnVyT0ooqrlay8Z2mu/XmGcfY0jej/lRSFnXYj9hRp1ltxgZVfwfg/1Cz7
         NdZRpv8KCI/2xCbId++hYiKCz+7/RhVe3GpuM5Xmk3AUUKKmEV1fJYH7Sa5R08zcioHK
         rzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791958264; x=1792563064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WndwsVBnokaEULAtUgcH4KgNi79vCmesxGK8Y8PtXoU=;
        b=tFpAIRuyeKPCQ7PeN36PUH2Js87R2PBjJEs3hXbO6c6iY3LVkK+dUaoWvjoMfs/r95
         kQrCQ7/qXaev+VEAmboo/6TX7AD1xHSL56yoUG+Bey3d9FjtadHhhBu5vFpvySEDmctA
         V8EignUzzwuNDRcYqUv2LzZmw4uWe+TJwOCdHobWfbe/4Bowj/l3E1VNP6Y7kp6aWvrD
         pln5dF+zfsztDrmLhfiswOdzlackZyL1o+zTggGNQ9LOiL29jkePffJOsaSq3e84eTuo
         B7DrI11QQ7RfDvxuhORLzOhO0GkFdo5up+pJx9WvIWNDzrcl8ZyPzoNmqkz2sO1irGY0
         T5sw==
X-Forwarded-Encrypted: i=1; AKwUvBwWsNhVrW5SwmBi2MSr9XzccIeeyNMbS8uCZLrINlWXAWu6/K0i0fANMs2jqCRYvg9bu8BtWGqJA2VZDYbYm7JM@lists.infradead.org
X-Gm-Message-State: AFq9FYIxlFyLcvZgQoVY+paBAvoeTi812ji2yR6jaae+UnokGbEYXoOV
	BKsZHLDdaILZsoXY9pJ6wNaQGcrYmI3FMsNUXMNSkExGQXIo+hothph4qMfhf9ep
X-Gm-Gg: AYBFou0ssTc/wptTFFMsytgRfs0Du6qYwtTxEjd3OCT/9Z/J/Ost2+bM/1dQNY8TcWk
	n4UMYl99u+dH3trzyfQDi0KCqU8syOR+gueC2uJB26rJ8Ka4WvHBf/l3HGGrdoN9Mzlssp50FLQ
	4sZGjoDLpcABoJlizaCsxqbVQvUQU/W0f4b7MRRfzOMlFSDAWKEkgWPKVxaBt0cFEWav50AxN+z
	rZqPKtMvKcj1JMc5e2VGEOpjBCxZ+YczKINxDOPOcG4W6G7adKFM4Vs8yHyHRoU+hLl4FwSgpyC
	qXxGDrFvvIeWUtcwuxvEl41IfvuyoVV+rR4dV4nA6WnXYIr5FkVOUHEJ5rM7CukgHv5CEQbYBZg
	CYtkE780UPtX8wD8bwpA5X4hJVSeKwT0ekZxpPidJtqtCuZ8k2PMb+657F3iHKOxn6qTxSB00Qg
	ftPoU9B2iWwsB7I7YY/giDyWjpOH7Htl3lk05jldtqSnGqq/GVe8C25HXs6A+XkRQyA29Ow+Pwm
	udgv/dR/xW0cu5/vJtfpYoAME89pIG67HC7CzetvkYJQMrzNCwUzKETxBL0yXpLWMoqMFmTnm2D
	LQi4TpZm9iMeO65TiMbB1LAs9OpJMZs10ieaeTb6AsguoJJl4LIVYyZfOf49j7B5dEMhTMIwtNY
	5UmKCxb/i
X-Received: by 2002:a05:600c:5251:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a18e4d5a01mr289077105e9.32.1791958263735;
        Tue, 13 Oct 2026 23:11:03 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.local (dynamic-2a02-3100-aed1-da01-ddff-863b-8308-ab16.310.pool.telefonica.de. [2a02:3100:aed1:da01:ddff:863b:8308:ab16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm554130545e9.11.2026.10.13.23.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:11:00 -0700 (PDT)
Date: Wed, 14 Oct 2026 08:10:59 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: milbeaut: Drop the select of the nonexistent
 CONFIG_PINCTRL_MILBEAUT
Message-ID: <as8cCOZ2kmXq0prn@gmail.com>
References: <20260905080648.34615-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905080648.34615-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_231105_950563_EC4CB5CA 
X-CRM114-Status: GOOD (  11.62  )
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

On Sat, Sep 05, 2026 at 10:06:48AM +0100, Karl Mehltretter wrote:
> No Kconfig symbol CONFIG_PINCTRL_MILBEAUT exists, and git log -S finds
> no Kconfig file that has ever defined one, so the select in
> CONFIG_ARCH_MILBEAUT_M10V is silently ignored. Remove it.
> CONFIG_PINCTRL itself is still selected on the line above.
> 
> Fixes: 9fb29c734f9e ("ARM: milbeaut: Add basic support for Milbeaut m10v SoC")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Friendly ping on this cleanup patch.

Thanks,
Karl

