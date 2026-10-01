Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469D5CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ag6+/GkxMCWZ0gyOTMJWIz6nOKWNtLtlkOUsQnDCd70=; b=crIevOSQRMJ58FAw+MXCHx7VQZ
	1RWIRNQuky89+sNfo4RThN0X4jVpnK164w1Bwuvez/rnyisNcixrtFuwj8mM7J12E3aNFyoJgWiWv
	D9kKzK3QJ6keiBHOc7SeautMn5gvTOFJSk9NYaLvZ35DpYcHHdjeKgpp7IY461wSZ1fOVxoh/u0N3
	qOZI7pnXCNDfkoS4YRjrcKbqGV8iP040sNVJjqabA1+RZxvYPWjp2K8fhLDNFseAMaerbPhEkskuL
	jSKGHEvQ04k35hH8h6lGn4lQdZoH70V4T5UEp2t3FbepMsFOHMHAcxj1OVcbXUC/Enl+FAuWaUiy9
	jp5OvAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCApj-00000007wft-2KVO;
	Thu, 01 Oct 2026 07:03:59 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAph-00000007wfW-1P3R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:03:58 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5ba3d84150dso1490998e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790838235; cv=none;
        d=google.com; s=arc-20260327;
        b=c18ICHEosKtYGiUaOpTg+GC/IMzc9bRVtHkIiHNgmD2UdbREAu00jRc0dELx3yhjAf
         UAfKefaWlLRjG1iqNZVbtvKkOtoS+73hcPbKXYDOgrvG242P7/EGO3dWdEB2pTzhNX4R
         2SoEM0gyu/s5EFJNf5gDTJpU3Rpfm/o3pzeWd86kHC4tiU744yBXsNEOlGaZO6hM7Zbu
         S39pGl5MmF9+ArchKTveeqg0HPlZJrSeHAx0yjSpjCgg5fecYFJnJ5gRja6hES7y6WTi
         JzzCBDEYCO3QsENDzf4jgwoM+H64FB+XWDiu1S1F8HvbEb06/309aw0sIpXSpjOEhwyn
         bf9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ag6+/GkxMCWZ0gyOTMJWIz6nOKWNtLtlkOUsQnDCd70=;
        fh=lDGRW2TzXCWHfVSMMM4/aMf1SPiHWbOidoFA7N811J0=;
        b=gchajjEgPRjSpZQuSYfvQbNj2Bcwo332N3+NF1ag1XcTIsXj5bk8FiB1808CmtWN0J
         MLoS2Zh3nw2hgXU6/8UqpR8g+5ECbrl63FEQr5zkoQliXToZ+5c4WbXlOAc4klzE9tMW
         42qhUl+HdFiP4z8vsGRkl037jRzIlH8h9TO05xQKVjLiFCGZeY4TpjCpY9ZvHvHKpwf7
         s2QdpjV9LgfcO77mAodTF1AN56alIfQhg42HUX2Jd+FFoaRqnwuyEhfAT3C4xXHswxuN
         HM6RjkbmP/78YTu94ruLQVrNRhhQavRA7k0i+Z7fsieV08JYr9OQjtxMvxCckNExKpSe
         z4og==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790838235; x=1791443035; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ag6+/GkxMCWZ0gyOTMJWIz6nOKWNtLtlkOUsQnDCd70=;
        b=DZq272o+nt4ELA20srn/dcWRWY9dcAwogWa39OFHzBdzXtQQpmEfhlI+giAtnF1xKn
         pUAejv0zW2ZDDdTjFX0bsENaonliLuZsBtS/WPT1JgZwOZSlwW7lNtOUnLXgCg/qT26+
         cXyQ0KDWRzez518VZB6ihs7ewEfQRT26NelDc4U/oniHg0UiEYyh62twtfrjyzFMhiyW
         YjoRuiwepBxaY4kYsYpkYKHmS54F2EJQ6/HWRHzvN7Dt0g0kzZCsgN6Tr2n4x1TstI4w
         pF3Zs1312lat0PJVRymEhooghkP33uFCvFQqVzMmnj++krb9toEuYAJiOs9NOHbR6is1
         Z5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790838235; x=1791443035;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ag6+/GkxMCWZ0gyOTMJWIz6nOKWNtLtlkOUsQnDCd70=;
        b=gl1EreMXX7b7zzxu8PtxD3Pqx9KEv85EhkUlFUotlSnRyo9qQy3K/0/OcBxRnw72c4
         Mi5DCH5WclwhhDqSJTmEtXL0+r/39CpE7jekeqmWe3KeSWI6hWS4GLDHbVkL1LeOXBba
         5GOigFPqeNPjZiSNUgwrQBWzbXeVzbkUQkomCk7EQAejToajXTCLCAUgB/6fAD7yRzbR
         KfP2GFYNK97eQKETXyXRCwiQPX1LygiT1WnQXgTLlb5bbumjTTm6XVTAIqWWSLILJJE8
         53Nr58Fa5j+5Er5KF0ahlsGtnm0OSsjiJlq39z3SSJD8Mu4YCJNJ0XitqwL9t3kQOrzV
         aUPw==
X-Gm-Message-State: AFq9FYLRGKOGKwC9gzDM//XPq3V1wMfdcqpGjINjtlJkmIyceiSAznyQ
	oBodUaAPf+al96uqP60hW9S2wNsGI3ahj3kY3ROqyj9+J11BaLNtq+kivCN4YNB4pANFmCU3Zb3
	lcaMHo7OBlNUp6Fay041I6K08Dkptt5w=
X-Gm-Gg: AYBFou3cq6RgV3EndOC93IjxMUvJC9bH46U4tqQOKMmGnWySL1G9HAmAs25hbLJ++Ix
	DnATbAVSdfjM2JYsKdWzzual7MZk8QDejrBXVJ5Xbkzks4GHEQdk5atKkPvjDJ9+eKbNfqxkjzH
	wyMrMKLU9eKEf0NUUtOeK2OKpfM03Sn/cUSTg11SUqo8VRZrcdD/K/SPqX6Qt9ysjiFCS8D2S2o
	/mCctatzdKwwcy7a3VS+qnnG909//xSThfpnJkkVamUEmk6Zq4VaM8Eg7M9rGcCIpP0AOBqACgJ
	CZdfTGrS8aJU/OaYR/rNtyHoZ6KUn6i9GyGEDgDQyy8HSiJuDwHgbFqRfw==
X-Received: by 2002:a05:6512:33d3:b0:5b5:e8d5:7fe2 with SMTP id
 2adb3069b0e04-5ba402b1598mr1495490e87.5.1790838234915; Thu, 01 Oct 2026
 00:03:54 -0700 (PDT)
MIME-Version: 1.0
From: Kian <kianprogramer@gmail.com>
Date: Thu, 1 Oct 2026 10:33:42 +0330
X-Gm-Features: AclHuK9v9IWAa-Zm8vVN5oXY6hVZIfnTT2Oe0yzhsz7sRc8LNSBCZc4BGg3ti-Y
Message-ID: <CAC-nSOxO_9tSE8jNGGQZKPtiKPq0qn2sgGWppzD_8yu1q=Wamg@mail.gmail.com>
Subject: =?UTF-8?Q?Samsung_Galaxy_J7_Pro_=28j7y17lte=29_=E2=80=94_Upstream_Linux_?=
	=?UTF-8?Q?support?=
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_000357_394129_C7BABBA2 
X-CRM114-Status: GOOD (  13.66  )
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

Hello,

I am reaching out regarding mainline Linux support for the Samsung
Galaxy J7 Pro (SM-J730F, j7y17lte), which is based on the Samsung
Exynos 7870 SoC.

The Exynos 7870 already has upstream Linux support and ongoing
community development, including Device Tree support for the SoC and
several devices based on it.

There have also been several community projects and attempts
specifically targeting the J7 Pro. For example, there are existing
Device Tree sources such as exynos7870-j7y17lte.dts, previous attempts
to boot newer Linux kernels on the device, and Linux/postmarketOS work
targeting the actual J7 Pro hardware.

These projects are useful starting points, but each of them has its
own limitations, missing functionality, or unresolved issues, and none
of them provides complete upstream support for the J7 Pro. I can
provide links to these projects and repositories so that the existing
work can be reviewed and compared.

Rather than creating yet another unofficial downstream kernel or
another separate community project with its own limitations, I would
like to try to bring the existing work together and work toward proper
upstream Linux support for the device.

Would someone familiar with the Exynos 7870 platform and Samsung
Device Trees be interested in reviewing the existing J7 Pro work and
assessing what is still required for mainline support?

I own a physical SM-J730F and have access to the actual device for
development and testing. I can provide the links to the existing
community projects, Device Tree sources, repositories, and other
relevant work.

I am willing to do anything that is reasonably within my ability to
help with the upstreaming effort. I can perform hardware testing,
collect boot logs and dmesg output, investigate hardware and Device
Tree information, reproduce issues, test kernel and Device Tree
changes, test patches on the actual device, and provide reproducible
test results. If additional information or specific tests are needed,
I am also willing to carry them out and learn whatever is necessary to
help with the development process.

I do not want to simply create another unofficial project for the J7
Pro. My goal is to make use of the work that already exists, identify
what is missing or needs to be fixed, and help move the device toward
a clean and maintainable upstream implementation.

If there is interest in working on this, I can provide the relevant
project and repository links, Device Tree sources, logs, and any other
hardware information I have available.

I would be very interested in helping bring the J7 Pro into the
upstream Linux ecosystem, and I am willing to contribute wherever I
can.

Thank you for your time and for your work on Samsung Exynos support in
the Linux kernel.

Best regards,

A J7 Pro owner and contributor

