Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC54BD132B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWjZ2fAcFvfnugj2MZeg8kZ1+ISzIxVNaHCOGBN1kPI=; b=ZLSEyPKqmc5DNkYQwafmGt76yS
	sFDQkZlEeVnf8ME7F3uajylmDc3E7Zo23lm1L6aunRnKiHUBfFDS65Oewb2d/TMv/cUqkZMqW76eb
	oIXB/MD4Y/G5cJmsO+Mi4bCLufiJtbjT79ozPQKDLIi1DaIfp/OkWbbEgJoLW0chvM6Gz6K8GEUh1
	SRBl/umFXtstu6upcBtvwkFntS/3V4lszz7tHgd3hAABHgouq8JtyRBAYOWmqDAPasTdHnWYBIWBg
	84cE+yw4n/jYBmgKUgr035Eyt/CPwv2zkUOkhEdUIOtPG3RFphteVVn3HoTRoOqA7JXi7xXly0rue
	T3NWdvIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vpm-0000000DdYl-2JCm;
	Mon, 04 Nov 2024 12:05:26 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vc6-0000000DbQl-0YGy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:51:19 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539d9fffea1so4220773e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 03:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730721076; x=1731325876; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gWjZ2fAcFvfnugj2MZeg8kZ1+ISzIxVNaHCOGBN1kPI=;
        b=vtld6hzywUG1im1WsAVvIxGBzdrN6Yx83E27hCzGSd9dQfNP2KQUaiR10xyjygXv1+
         rDucaoSUc3MAopm+esBpG5dUvfsAuKFggptZpt2zCikWAz83UD0Z4rVnVfe5/i3B+Gme
         w/xIo5XPzp6nUa/3+sA+i3atAp8y8eXG0BlFQdLtr/zzthMqI5Ikt/8D8cBmdqToSjNL
         jhd58ACrZrvVcoFCLUpmm49LDbwxu+yvq53Nfl7tg8rGTq3BkHGHfmzi0KUqxYT6tOAw
         PjW2UYYXmW37ghUtBsJ464Ef39IDpekTBb4Zc56n2K9bhxetKEr/oB+eorwhVPh1v/GV
         FMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730721076; x=1731325876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWjZ2fAcFvfnugj2MZeg8kZ1+ISzIxVNaHCOGBN1kPI=;
        b=fNVkO1gcmv/EHL90oipFOIvjTkmAhOEWo1uKgf4ey4HMq5+3UXB9RAdNKWLS2+Kp5N
         +WfkfMWs1RqS/8ePJ6S9cE6BmO5DkWW2LSTLMqrIPQ8NiPH9tVJAdWO1uwt9XcVQYk//
         3iWncBkaeTwKkAkgrSENhxICO6Fmf2Gzs5RR1oIkKbEbrVeOyP4kKEsAOKDD+rOaxcxY
         2Jj9OC/WEC8igm9cOvcKjswyAdYvP8935eRpCxj80RKX4YFxm01l1JWeDSXq7ynMS0/S
         sNlBo3cbvisROBa+1PIz8JTt2BzP0csHEtL3lCBzvY6gSXVWGOvtRm6zey6Vl1j0z81z
         kY1Q==
X-Gm-Message-State: AOJu0Yx4nR9MQ7zjURRehHDdlCFAYLQQtS4O/0N1JmvaVEOjZ19Fyg5/
	jpmrygHTUHQA8Tv/h7olGTQUq+C/S5MEx7bkHztkx863e2p3kTC56OYBcX6tReM=
X-Google-Smtp-Source: AGHT+IEsY3WjapLgqqKasH08PLy7V+a6fwGhSfU7jg1V7TNXGG6HrJAt/MV9sJGj+pU1ZVOUP2LHAA==
X-Received: by 2002:a05:6512:31c1:b0:530:c239:6fad with SMTP id 2adb3069b0e04-53b347234femr15796297e87.0.1730721075949;
        Mon, 04 Nov 2024 03:51:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9c0b5sm1643431e87.98.2024.11.04.03.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 03:51:14 -0800 (PST)
Date: Mon, 4 Nov 2024 13:51:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
Message-ID: <dk7dxsyunx47gvmlnarjkqx63en52hktdnzwyyeyhohts7rkjn@a6lx6sq46vb4>
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_035118_190376_0B6D089E 
X-CRM114-Status: GOOD (  19.92  )
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

On Mon, Oct 14, 2024 at 04:55:19PM +0300, Dmitry Baryshkov wrote:
> Follow the ARM64 platform and implement simple cache information driver.
> As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
> limited to the ARMv7 / ARMv7M, providing simple fallback or just
> returning -EOPNOTSUPP in case of older platforms.
> 
> In theory we should be able to skip CLIDR reading and assume that Dcache
> and Icache (or unified L1 cache) always exist if CTR is supported and
> returns sensible value. However I think this better be handled by the
> maintainers of corresponding platforms.
> 
> Other than just providing information to the userspace, this patchset is
> required in order to implement L2 cache driver (and in the end CPU
> frequency scaling) on ARMv7-based Qualcomm devices.

Sudeep, Ard, Arnd, Russell, I have been struggling to get reviews for
this for several months. Is there a chance to hear anything? I'd really
like to scratch this off my 'pending' list.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Handle cores like ARM1176, which have cpu_architecture() ==
>   CPU_ARCH_ARMv7 (because of VMSAv7 implementation), but no CLIDR
>   register (because they are ARMv6) (Arnd).
> - Link to v1: https://lore.kernel.org/r/20231231-armv7-cacheinfo-v1-0-9e8d440b59d9@linaro.org

-- 
With best wishes
Dmitry

