Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6AACAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GzTtM9WAsK07z8tZ50EdByhyU/vMqn0St2F82RyVOyM=; b=MSa3yzclHPwOfCshGiiu4iMDcw
	1S20oN/Ix6R4ktddfPwWvdjMTrbil981ZbUyNyFRDndp6rLMDoq0HphFxq7pAcNgmD7U8xnWUryFn
	dsFm3ABijI8BgngmZFVvnLl3LRL5+vzyJDILLJx2l5GF2NaFymx29l0P/0VXGCg/JhY3cjm4sr+W8
	FIUea2NU3F0Z3kJ7X6gt9BWkqxFVMhK7ANrB+7fcoYPTVRvu+ZZ2ZM3hgfYjVLPBGDdvY2ryCa4zi
	sOYpeQQEF6stY83Okjfed9TYDF1I9bVnM2i9npFYrbSA2uV8Qhpgy8DQp+j5Y99clzz73BCZTgl4M
	R9sWQevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Sjk-00000001sFJ-3Xx8;
	Wed, 24 Sep 2025 16:53:00 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Sjh-00000001sCr-343J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 16:52:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46c889b310dso10510515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 09:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758732775; x=1759337575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GzTtM9WAsK07z8tZ50EdByhyU/vMqn0St2F82RyVOyM=;
        b=M80dNTDmmsNa+MHDTH/RO6SVAdD81SxxtRZosUEbf/H301/j//5fsIIVUbZHxaYNOI
         /lD4nCRXOWb6i2y5xDbJh93ap/pnLGXm871xlUdqk2vU+N47VPeHPsfpWnXxt4ZlazuY
         X5NP2yM2Kky6LiLKdct6TWgCK2YVteYysUHq2xvRxoMv1GVfGsDBQTNRzPXQhw+2GZXO
         NbzmCrLR2gZPgzVz+2igdhC5swcIA63hm6/j1qaOKj8gn0KjbmkB2gaKforI2JqsM8eT
         YrTnzJZ+xCHMtdadXTQ8dRxx8r8oc/nlJWAE7e06jkFrxvLJnNeq6YB3NhxbfEskR0na
         2Clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758732775; x=1759337575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzTtM9WAsK07z8tZ50EdByhyU/vMqn0St2F82RyVOyM=;
        b=gVWHburfFpVFxalk5PwWVm3fGlplQx9nHzWBwqJvBC+kL7pEfxMjiO2snhRKyuu4mf
         9OADVOljWkubtcSr+lF5lwTIItLXwgojcmNJJ7PcIgV9fHqewuRVMHWEtVRS0U3lMDGj
         c3Q7PqNoaariqixNqaFLhihgJDNaN1zHBttcFM+cNmOrHk0E/wh8/nNzUfWFiPz6x5je
         dTElIAK73nfXOJcNd3XGhTUTbZORaSlhcAGmJ0pAA4UO7LqP+KtosTpjVJi20A/YHpgA
         oXrzT6h8hF3p7u+xrCCVctz8DrkYNtBp8AfoQ/NAPi8fUssnvXy/fmMvGR+Zgt2ah5U1
         gONQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOqzpJTcOkoYrzRQ/b9/RipRwbXGgIxjIhNCOQOBmTDoyBaMiZo3hVnBhOvHwV/VCH9um3Ot/TO8Z9XyPaFhwi@lists.infradead.org
X-Gm-Message-State: AOJu0YwqSCeY/ECr/Pb0gd6isUvZKjNaZb0PKOOWzRLoC1LWtC8eJIKL
	s9n4ip+6DDerUSICEQs/lyWUQ54pDZEowBtrWXvH6SQQgMqFYjfcSHkuihc4nQCPeP0=
X-Gm-Gg: ASbGnct/CwT2RwKqfHetrBlCM2LCu1QcItyn0CzJiOoxenN2OfIUtzkW3XL+PWRChaZ
	x+JDLuWSJrS9S8HYgRgnFy8YiOaEVxDAhvleCgKKruvDGVhx1DT4knlu9CvcfZ3Mb/HuL8SIouP
	evPwuY9WiTowiqJxLQCpsa3FH5ipZKH4J9vgDrHNsvFzfXI7gciYyKqMaGhgAR4sGgJvT8KRHSw
	1Jj7OfP+O2nFbbk3eTMV4xeCKSHdrokX/wwmcZciPLcJpfYWbUm79mkzumcaX3YvGl49gPCNvmi
	wRuM0hOeync61HrdNxfg9MlblMJ4nG9XDQOxoEaQGpaeX6xzzCGHM82XX3J2i9suW8Kdskm2Hn9
	6uFzbJGNBM343FC8xxV8kqpGCD5oB6R8Mv4UZ0eQFrKU7ZaA/xVbJDL4klCjdG0LI7eGE4SYR3E
	TA4g9x2dH7yQ==
X-Google-Smtp-Source: AGHT+IHV6Of+qXakfqJ0XhbATMb2AIuLl9e0wcQPO7/GLftVgSTayzqBT8eCMUUPgRnR+4vlJm1a1w==
X-Received: by 2002:a05:600c:45c6:b0:46b:2fd3:b55f with SMTP id 5b1f17b1804b1-46e32c2f45amr3319005e9.4.1758732775255;
        Wed, 24 Sep 2025 09:52:55 -0700 (PDT)
Received: from radijator.localnet (93-138-236-234.adsl.net.t-com.hr. [93.138.236.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3f02f332c31sm22789020f8f.45.2025.09.24.09.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:52:54 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: soc@lists.linux.dev
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
Subject: [GIT PULL] PXA1908 DT changes for 6.18
Date: Wed, 24 Sep 2025 18:52:52 +0200
Message-ID: <4685744.LvFx2qVVIh@radijator>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_095257_788459_351831DC 
X-CRM114-Status: UNSURE (   7.79  )
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

Hi SoC maintainers,

Here's the first batch of PXA1908 DT changes for 6.18.

Regards,
Duje

The following changes since commit 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c:

  Linux 6.17-rc5 (2025-09-07 14:22:57 -0700)

are available in the Git repository at:

  https://gitlab.com/pxa1908-mainline/linux.git tags/pxa1908-dt-for-6.18

for you to fetch changes up to efab3844c6f18327886c5c2e0e40acccaf976a89:

  arm64: dts: marvell: samsung,coreprimevelte: Add USB connector (2025-09-2=
0 14:08:32 +0200)

=2D---------------------------------------------------------------
PXA1908 DT changes for 6.18

Rollup of hardware support which has accumulated since support for the
SoC and coreprimevelte board was merged. This most notably includes
eMMC, PMIC, backlight and touchscreen. A few QoL fixes are also
included.

=2D---------------------------------------------------------------
Duje Mihanovi=C4=87 (9):
      arm64: dts: marvell: samsung,coreprimevelte: Add backlight
      arm64: dts: marvell: samsung,coreprimevelte: Correct CD GPIO
      arm64: dts: marvell: samsung,coreprimevelte: Enable eMMC
      arm64: dts: marvell: pxa1908: Add PWMs
      arm64: dts: marvell: samsung,coreprimevelte: Add vibrator
      arm64: dts: marvell: pxa1908: Move ramoops to SoC dtsi
      arm64: dts: marvell: samsung,coreprimevelte: Drop some reserved memory
      arm64: dts: marvell: samsung,coreprimevelte: Fill in memory node
      arm64: dts: marvell: samsung,coreprimevelte: Add USB connector

Karel Balej (3):
      arm64: dts: samsung,coreprimevelte: add PMIC
      arm64: dts: samsung,coreprimevelte: add touchscreen
      arm64: dts: samsung,coreprimevelte: add SDIO

 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 266 +++++++++++++++++=
+---
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |  46 ++++
 2 files changed, 278 insertions(+), 34 deletions(-)




