Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B8ACAC583
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 05:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SD8nn1i7Yhdi7+TnIzuBsyz3lWTKZHkEomf2hy/RkVM=; b=N13ezuXOF2nIjlw6wF/GzGEOok
	rwyttHQhGi/5NyGQOWh+wmhKcOEdtPTx4Ra72NHu6zpgIJKSyKNUxlSoleoKCP586uGK/9P16KEGc
	a2B6MtepuwtD1MNEHPO5dnByr43KOM4uaNVwwDmhmBewKvVNC/fXet6ZtaHB122EZ8xYzL+skNk7z
	HT4EUlOFofLYM4a/U+tCmrgu9Emx/kgquhFCVEUp+4GLRT+WAadvfYNnA/qUmtP7pelO/pMAxC7Jy
	geTNPmRX3d4weqnZz6MuFRI0nOJbQfqihCVkgNlY1mT+BjrlhfnQB4UXrRBgU+SPCkGdyEI6NPYcd
	H6MzYKMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwZmT-00000000zl7-2Tv8;
	Thu, 11 Sep 2025 05:23:37 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwZmQ-00000000zi6-2qxl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 05:23:35 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-560888dc903so302337e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 22:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757568212; x=1758173012; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SD8nn1i7Yhdi7+TnIzuBsyz3lWTKZHkEomf2hy/RkVM=;
        b=i2Cq+kNB2adOaB9thl02H6lZvA9KWSB7x3qfce4eXMbid8WYhsoNWNca0Ud2o1jBHF
         cRzjU8cK7H6JKQ/0t48kkRQ4vJfT8dAFdcqX8iRNg8mx6avYWNZUKhinTbU6nHVDK9J1
         t3ljayscWmrRje3mU5ywbslnXc65michZuEYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757568212; x=1758173012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SD8nn1i7Yhdi7+TnIzuBsyz3lWTKZHkEomf2hy/RkVM=;
        b=ENPGf2vdHMrDM+os6D2p648ATQILQwGYlTt2quqCd5Fr3QVmzEpolGVkbbOBrDRE9K
         zKfTadOxyd0VRsSLwNdFaKXKT4APLFs3+bVIUxZbC6ljNKUj6W/gqq8Kr/Pi+vv6HOgV
         zcaZKDXM4p/2CPvya35YJbQsfjzRERru4sUeJiY8mjVTgrtbg1w4k9d4Ygp358IFDh9Z
         6slcZ40aoIXsc12Ad3w7LD4yyhmm367l/kj6ftMUmGwSmm1h2U6CPWK4ta2x4wLA0vUk
         hxKSTKo2g2dpZPGLk+thcatHHv2zjzLT5A1lKSCBadJaRALKFBe+W3DpWAxG2GK/EBZq
         mNfg==
X-Forwarded-Encrypted: i=1; AJvYcCUbMjkdRE5H/DOcw/RKVz7MBfbdT5fAjxtRrjccPe8s8fEQJGMGfqU/U/9Hxvo+/7M+CzsBdUSiLbIY2IqZDrak@lists.infradead.org
X-Gm-Message-State: AOJu0YylOe4c+r2oit+Q647BfZ2keHykMsdwNGyMFFxdnRr37VR9Z9QI
	66ZGgJmJ3gsN3zk4koCjJTrm6ZQGsZx1uT+8fTfTd5f8z3QNg3BCUcbN+YUcvLn/lpX5a+UZXjb
	VdmsXua2gruuG9CDIb1m/6Af225TaKMtEgftZ3CKX
X-Gm-Gg: ASbGncsmqIrRosZy7W2Pp6YTXLD45qr7PVkNItLG3ijMk5dH+1RKC28GBHTY2A/xqRW
	QTST64joJDQhJoLIsZU+A7ryfmf8AsxSxRmcjceVA6nF16bGwMr+7zoBzvnl0jLNy2wo3Am6iss
	9HmFOdsqKrYzrPjsuuULvNdHw5378mlbWhZU+u/wfCtuBjIHNs1gogumvZm1yjlXd4drFttrmHj
	6GKez3rVYkx9Ndnhv/02SFgcYUeDMr5ZhoYsEHV3TlonFLj
X-Google-Smtp-Source: AGHT+IHsFO2dCnG3xagTwvzbaLyKjSsIEhuxrfLgoWTOpuWAQAOR7jHFD/yhONhTl/D9cmXdDuX5rvWYbwhJsjrUtPo=
X-Received: by 2002:a05:6512:3512:b0:563:2efc:dea7 with SMTP id
 2adb3069b0e04-5632efce08fmr4010317e87.34.1757568212192; Wed, 10 Sep 2025
 22:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <46756067-ca2f-4053-b9e9-bc6e66170b21@gmail.com>
In-Reply-To: <46756067-ca2f-4053-b9e9-bc6e66170b21@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 11 Sep 2025 13:23:21 +0800
X-Gm-Features: Ac12FXxOIWG_n6zS7cykVQ7wuyEIUs7mj_P9ko2kp2L5pATmRwMSO2clSnhg8Mw
Message-ID: <CAGXv+5F=uPnzrpDtPXc2ipwp5AhiEwGdxhuhPtjwWhAxWJMc_Q@mail.gmail.com>
Subject: Re: [GIT PULL] MediaTek ARM64 DTS updates for v6.18
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_222334_759223_E3296417 
X-CRM114-Status: GOOD (  20.48  )
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

Hi,

On Wed, Sep 10, 2025 at 11:04=E2=80=AFPM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
> Hi Arnd,
>
> can you please have a look on the following patches.
>
> Thanks a lot,
> Matthias

I still have some patches outstanding for some time. Could you perhaps
take them as well?

[PATCH v2 2/2] arm64: dts: mediatek: mt8188: Change efuse fallback
compatible to mt8186
https://lore.kernel.org/all/20250610063431.2955757-3-wenst@chromium.org/

[PATCH] arm64: dts: mediatek: mt8186-tentacruel: Fix touchscreen model
https://lore.kernel.org/all/20250812090135.3310374-1-wenst@chromium.org/

[PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
https://lore.kernel.org/all/20250814092510.211672-1-wenst@chromium.org/


Thanks
ChenYu

> ---
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>
>    Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>
> are available in the Git repository at:
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/
> tags/v6.17-next-dts64
>
> for you to fetch changes up to 12a565af705542c4380e95f4e3a505a2c25ad754:
>
>    dt-bindings: arm: mediatek: Add grinn,genio-510-sbc (2025-09-10 11:51:=
16 +0200)
>
> ----------------------------------------------------------------
> mt7988 (bpi r4):
> * enable network
>
> mt7986:
> * add dedicated sram node
> * add interrupts for RSS to ethernet
>
> mt7981:
> * add thermal sensor and auxadc nodes
>
> mt8395 (NIO 12L):
> * enable UFS
> * add gpio keys to the PMIC
>
> mt8195:
> * drop reset for PCIe device
>
> ----------------------------------------------------------------
> Aleksander Jan Bajkowski (1):
>        arm64: dts: mediatek: add thermal sensor support on mt7981
>
> Frank Wunderlich (7):
>        arm64: dts: mediatek: mt7986: add sram node
>        arm64: dts: mediatek: mt7986: add interrupts for RSS and interrupt=
 names
>        arm64: dts: mediatek: mt7988: add basic ethernet-nodes
>        arm64: dts: mediatek: mt7988: add switch node
>        arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
>        arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gm=
ac
>        arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and le=
ds
>
> Guoqing Jiang (1):
>        arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from p=
cie0
>
> Julien Massot (2):
>        arm64: dts: mediatek: mt8395-nio-12l: Enable UFS
>        arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys suppo=
rt
>
> Mateusz Koza (2):
>        dt-bindings: arm: mediatek: Add grinn,genio-700-sbc
>        dt-bindings: arm: mediatek: Add grinn,genio-510-sbc
>
> Rob Herring (Arm) (1):
>        arm64: dts: mediatek: mt8183: Fix out of range pull values
>
>   .../devicetree/bindings/arm/mediatek.yaml          |   2 +
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  31 ++-
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |  20 +-
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts   |  11 +
>   .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  19 ++
>   .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi |  86 +++++++
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi          | 285 ++++++++++++++=
++++++-
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  14 +-
>   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  14 +-
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi           |   3 -
>   .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |  46 ++++
>   11 files changed, 508 insertions(+), 23 deletions(-)
>

