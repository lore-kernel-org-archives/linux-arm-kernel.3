Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D224ACA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 13:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNI2qDnLiaqV8BxH9fuxXcoBvBHpUmc8du3BEbYd2ug=; b=jHMLW5iWIGnb+UYaWMxIOyRVUO
	DUehM0kd1DY79Sahz9rZjbNj1uQbhN/5pc3/bDW+ZBAN02EOoK39KIgydLeoz6sq+aAsvSQ4nVjmF
	5gzqNQ1VF0aDvUWe7nWyzXP/2rKajocusXyAoX3/NmRHNepqDLFXq7e2nQ9Rd2tTjNHrdonIdUY+R
	rtesJ5U896BVu/T303jVesy00PwRDKIT0878ijgokProxMNqWloSLw6nACtndcgqDJ0lo5wsy5aXs
	AwoQ+YUcU79mg3sxpzxneHETR5AKure7cgKizAnpSkeiwuQI+bnLda/fzH14vFxbMnzt7a1iq5BKw
	UwvXCfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMRq-0000000ErAC-2l3Z;
	Sun, 04 Oct 2026 13:40:14 +0000
Received: from out-160.mta0.migadu.com ([2001:41d0:1004:224b::a0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMRn-0000000Er9i-2Fmd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 13:40:13 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PNI2qDnLiaqV8BxH9fuxXcoBvBHpUmc8du3BEbYd2ug=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791121208; v=1; x=1791726008;
 b=n7384kgFTnYSpuQ2b29ZFzkEQrV0WEbGXRRmk76HZJrdfRKoq5shRI1aK5M5haeFhUMM1cc1
 Sx0JRx60U3BiV6odCialgnU1KPISUUxLbLfaDfy2kjFRI42Am3FocEZKmadqqKk0Y6vkRZ98l7k
 j/VP+3tOb2kHPFl+/YIi8MZk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 22ccb7e257ac288e;
	Sun, 04 Oct 2026 13:40:07 +0000
X-Mizu-Trace-ID: 22ccb7e257ac288e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so3726e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 06:40:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy5zwhu9ELePFAfcK/NtnlKRmpzNd45Pw+sJTXnVEGpzHwqsUiNbxJgtHV5C/yotgWwCM7pbEoNxJ7Y7+g7iEqS@lists.infradead.org
X-Gm-Message-State: AFq9FYJHk+KtCpIAe/TaAg5xyq9LTXz9p/Wyf/iG5+DZ1TfARK77X4QY
	cJDHh/dplccHJFXsyU7dKoJDuT9HyvQBXXERLbuPcHuDsbG/2kfbEAsATmKu8tRt25k9J46zxun
	5jOm6NbeJPuG6MTYYorl3evnBFPEQiitWoBxGwivq
X-Received: by 2002:a05:6512:23a1:b0:5bb:27df:415f with SMTP id
 2adb3069b0e04-5bcb62e44a6mr80016e87.15.1791121206347; Sun, 04 Oct 2026
 06:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
 <ar-xtsSOqwWK9jWQ@willie-the-truck> <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
 <ar-5CnttybD-1ojM@willie-the-truck> <ar_E5HUSTxMSRZhL@arm.com>
 <CA+EHjTzemfoX9e8Ppw+AcuUpNND_CipLCUM9xgid1eYXmV=jzg@mail.gmail.com>
 <ar_QOXqCYTGargBe@arm.com> <asIQ1ZwUjkmNJbRP@willie-the-truck>
In-Reply-To: <asIQ1ZwUjkmNJbRP@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 4 Oct 2026 14:39:29 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwYMT6gKZiBf70S9JgNtzBj2jES_4xkzVUVKHHd6mPNvg@mail.gmail.com>
X-Gm-Features: AclHuK_ztBU3Lp4brNTuBuj0lY992tOQjsYAyS5cYhB7Md0NCpETrVALGjPVujw
Message-ID: <CA+EHjTwYMT6gKZiBf70S9JgNtzBj2jES_4xkzVUVKHHd6mPNvg@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, "Rob Herring (Arm)" <robh@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_064012_301463_130E9B4D 
X-CRM114-Status: GOOD (  11.09  )
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

On Sun, 04 Oct 2026 09:39:49 +0100, Will Deacon <will@kernel.org> wrote:
[...]
> I wonder if it would be worth having some #defines for some of the common
> conditions, so we could avoid having the bare immediates each time in
> future? (obviously, that would be a separate cleanup rather than part of
> this fix).

Thanks Will. I think it would. There are only a handful outside
arch/arm64/lib, so it's small. I'd name each value after the condition
the following branch tests, e.g. CCMP_NZCV_LT rather than #8, so
nobody has to work out the flags by hand. I'll send something once
this is in your tree.

Cheers,
/fuad

