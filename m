Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC71C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=; b=xW+YPzje+a0JuZbAOwEDlWtN6j
	psGOx0GZmIaWm34ZGu9TqKz4qNVRvVHVx3XFX1x3QmUfuoowE/cj2Qp9JOnSIhHgj6dbfLTuQmFDZ
	EyYSeXcMeyaCT5E/Eq+geXDaj6emR6Wt8A5pQ08JT9wbChmB5fYvj+IR9wwRch+RNdE9Nlp6P3cYU
	bLlnzpEBUArkUucqukQZhuNf2T5VyPgNCa/LXjQDcgTb9dsWTkpGPbJJ0lUAKYwJotcFWatipqBOF
	+n4gFr0rRWVHmygK6bZQ4ABVjdroASPDhzAu1nFInJyKfwxSLxnixyTHIoZPw4St6iKiEsO/tYoIs
	TV9uhFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dMP-0000000FJhx-2Te4;
	Fri, 18 Sep 2026 18:30:57 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dMM-0000000FJgv-3mGd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 18:30:56 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso707070a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 11:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756253; cv=none;
        d=google.com; s=arc-20260327;
        b=WYog8TZTXetRVhPM/VQ/az30scJHR0URCFG7P8C9E2YsT9kfwCMqTrK0La54sechA7
         jSp2GXFtUS3iWDxJW6GNvYRbGaSroL8QM+lP857/RCUae4D+Wer+7ilPU6dEZ10oTDyZ
         +u/nKgUIknapvjCfhUbOMHwH0yNH07JBcTuk0QSvxKXsdNQJThMFFc1yLRayl7yG1oe8
         zhZkjKB6814A6hwGpgFVpv+XzKt6TNn/zz/uOKHAL+1NCACX9gqYbUlrWfA6PsUTvr/i
         oiVhui/F5czKwcBL+X2pl5Y85B5yua9fOSK7niOsHHtDG3T4nemIvzDjOX9ZTNPJzYpQ
         UShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        fh=9KjdOpNjmLAxsqSiPhFZqRAlhMS4mYV/UbYrLpGvofw=;
        b=ULdLFtmT2wPTO0TeNSKRTDvnnVe9ysQ6b0jC1rVd3AiLDVOD0pgMy6lNW6YD6Ndk5m
         U64qK3tiylHDT0TugbEvl6ah9xY+zNsNe2OFZVdWZ1Ylk2s5e8QmoEaX6ED8J8ivRGUx
         brwzzjALNyE3re/U4pm7kYletzCngOrx60ADb2x3ryplw+NMVSAvvajFxStM87F8pQ/Y
         tNN6s9DnQcgvxPFgHgr4h4Gbq11r1iVh1HX/Wuyo7mxfvzCWuj4YdpT9J33PbdZUKZew
         2HACd8lkCMtZe9Jz+3ySSccSk4csvyINLUQpyKoZ5KnTz2a9R66agQ74u8UAD4kxvzKv
         aX6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756253; x=1790361053; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=RydFIpVhlpg4mqTJ7kOGY5CAD/CZ0idd685xsyHS5BVdKr2tp8WIVV8gRb4yqssMCz
         esKkftT1qQtwN+SiUA1F/qFsJCTWIoLzb7Nl2FVdzFL0wddpGVPkpN/hw1NHFXZA6QJ7
         yVEvMQKS2IcAPlAgkKl0EVReN1+ijnWRIQDGbMzR79BOBCCG3tiAnyK/WCHbB/CNQbTT
         +jtJvFRVE+8QefjMMUcAoK1ybZzrJQCZ33kDBULbmb7juXd2jeuLWD1kwWSVlbqCUe88
         35mxnf3X3oIKZVK3pT1CQsRoiswGRuJ4TI+cQ8HY2Jl8Hg+vCFsObz//uDpYconMZtEJ
         TvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756253; x=1790361053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=LI73MUJvxJIHqGhde/wZI+tvS4FjXn+vF9XxZ0rn1KZAT7nTNJGDQF78p5iuRKQY7a
         DEj3TVawxPG2enD/N8TOnX1oHlysHCJtKGWVPU7Oztq2cE71LEBCnFyGSwOfChF5KCpb
         N00tCV7SvCbNXwTVgfQCvUayirJiiPi8xTlySat0D+sARwYD9FZ/ypIAumnkrwxFfxeN
         PuxgXxzEz7xFb0cxjknD3wZAUIKRgwowyJz4GP2zybdMG93olWElUHMehIPjpOzhGbD/
         fePYQwh/lmzN54rjsAgV6693okZdcRMnhru1lSMYAmXhPZfi28EhJUpWgJkmXRV9sVga
         iRyg==
X-Forwarded-Encrypted: i=1; AKwUvBwuqm+AUyFhWV8jak3mXP1RhyTorqkFzfNqHsMEtJ+KTKyb4nXmSDHcpZrh2FbtxA/PHWnUssPpd8JchrDEWVe7@lists.infradead.org
X-Gm-Message-State: AFuF++mANaj+Bhfq64IOstasfsPWmtjiJwk5lNjD2QkiaoV3hE2yHOTP
	V5cDyZWSJiJZuaCBgTmreuoS65eeTAh7AV2sk3ELzI5y1T6e7bzpVE6AkKTHgfv5C3uj0W+hdRp
	kjcwYF8uXK0w3H4QS7eSUkd5uug8N68s=
X-Gm-Gg: AYBFou2Lu18KuOLG2maBmqBygAkru+26uGOTzWthgNVHOAeUXKFBgiMCCPw4jwGVs3N
	bHdfyPd2Uyyv0awaI2M3Z0QOCVKkwM2MB+u67sqGwdkJQZARb9Bh/rm9tpvdDt+oP/EA6kCM+bK
	eINKRnkHMXt8A8nO7+cCfnlPDPJZjjmm8Ip7n9wYWzSQN6ivYWNfvPpbQeGvgFl3Ttrde54QtBI
	lsC5v8saDrVppWwVMq3TKtc/y7a7wDQGqBLMM0F/5UJjHNHCbemKru4oxafmyZJPYl9PGSjpMn2
	SISC8ekumBPBuPJbaaM6xC6YEcVHbWZtt1J2bPvQrQ0fNNW0mJA2Sqk46syLvZP/ScznJIwPvEu
	6jf0zUKD/YUa3
X-Received: by 2002:a17:90b:2681:b0:39e:6c69:f482 with SMTP id
 98e67ed59e1d1-39e6c69f55fmr655165a91.65.1789756253090; Fri, 18 Sep 2026
 11:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Sep 2026 21:30:41 +0300
X-Gm-Features: AcwNN1UUuDTcQsQdT6LSC3YiQR-XJenFcyp7p3MxtUdbO4cYi1dTxigUEDSEcPc
Message-ID: <CAPVz0n2pZukL2tnaJef-N=kRiudVLN7RsTjKJJkTqp9-_k7HwA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] ARM: tegra: Convert to new media orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_113055_273034_6B8CCF51 
X-CRM114-Status: GOOD (  13.47  )
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

=D0=BF=D1=82, 18 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:44 Kier=
an Bingham
<kieran.bingham@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the nvidia device trees to use the new
> definitions.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - Fix MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
> ---
>  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++=
-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
>  4 files changed, 9 insertions(+), 4 deletions(-)
>

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>

