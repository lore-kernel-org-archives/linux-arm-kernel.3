Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AD6CEE33F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CgtAgrmeRzOovZcSVQUeYNGVY0SIC5cB+Px6JYEsC0=; b=4WXP50Hm6bH3N3z6V+pR1f2Ad4
	Skpkpf9UH2P+sr7317o7y8ydIKl0Wb+rK8VcaLbtAVjVV1KJTJfal43tfthK7vPmydMDiHQ/bSVcX
	jY/8aykVqwFjVzjlkZ7ytx7ZvgucTdejpRcI8ZOSItB2c0LxazF+5aE+lPPQzUmE2hGKFsug+Vdc3
	JLBxp6fQAxN13ef5pFB5VDLhla6FI9AU4y4nAeTCe868MA2DBDoVwSuSud7OfP4JNlONBH1NwWEnq
	wpVcCmCCriZ6MpWpibTZCRdAj6W0zzYAwEZ+m8BUYD5iZvvQ4CXxsjzVasQJEiFQAzPwIg2WQFdT/
	VS3ooK/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPLR-00000000qSM-1Km3;
	Tue, 18 Nov 2025 17:18:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPLP-00000000qRx-0n9S;
	Tue, 18 Nov 2025 17:18:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83A464087D;
	Tue, 18 Nov 2025 17:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1A7C4CEF1;
	Tue, 18 Nov 2025 17:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763486298;
	bh=1wHwuQs+KyZl1yodXT0yg2BEqvi1f1TTUhu+LxUU8GQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LRCAJX0oKd0lqfZIIz9qm2DQH9x++4W0Rqi4wLfSn7Gaeiu3LgztD6PqX4xut/MP4
	 pc8KyM8sEBvZ3zG0x/UBt7gSHiElvE4IThaggzpADKhINojZkohQXHkJLRa+w/oojJ
	 KTEbmVeTN3E32VSabX+mxr7/CjiJ7kAv0xysHrovD8PdGs7/3/nGsTeSbtsttNeZdK
	 SA7HohyzyJ2x5xKotD6EBSFbiq3Zo63zThivF8bfzoJTq2Wz/rWOjXXYd/5SY6jK71
	 DeT5rTgq7uLGNdhlEXUgOgQvYErjn7mpbLGjIPBR//zGRnREFKT8aWy0okkz9c7ad9
	 CDLTaHo3ttjDA==
From: Vinod Koul <vkoul@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20251001-can-v7-0-fad29efc3884@nxp.com>
References: <20251001-can-v7-0-fad29efc3884@nxp.com>
Subject: Re: (subset) [PATCH v7 0/8] phy: phy-can-transceiver: Support
 TJA1048/TJA1051
Message-Id: <176348629150.62598.2560301627293635701.b4-ty@kernel.org>
Date: Tue, 18 Nov 2025 22:48:11 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_091819_251729_C97977F8 
X-CRM114-Status: UNSURE (   7.99  )
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


On Wed, 01 Oct 2025 21:22:31 +0800, Peng Fan wrote:
> TJA1048 is a Dual channel can transceiver with Sleep mode supported.
> TJA105{1,7} is a Single Channel can transceiver with Sleep mode supported.
> 
> To support them:
> patch 1: add binding doc
> patch 2/3: To support dual channel,
>    - Introduce new flag CAN_TRANSCEIVER_DUAL_CH to indicate the phy
>      has two channels.
>    - Introduce can_transceiver_priv as a higher level encapsulation for
>      phy, mux_state, num_ch.
>    - Alloc a phy for each channel
> patch 4: Simplify code
> patch 5: Add TJA1051,7 support
> Others: Update dts to use phys.
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: phy: ti,tcan104x-can: Document NXP TJA105X/1048
      commit: 05ace63d0bcfe131e741923394c7ce03322a141e
[2/8] phy: phy-can-transceiver: Introduce can_transceiver_priv
      commit: c77464bd9b4155891a135e51f8e916e1ab94fc14
[3/8] phy: phy-can-transceiver: Add dual channel support for TJA1048
      commit: 6e9fe9409e10ed25b43928062832037752630979
[4/8] phy: phy-can-transceiver: Drop the gpio desc check
      commit: d02a7eb12924b7473a62d5a6c9e670fe5bf6e4b7
[5/8] phy: phy-can-transceiver: Add support for TJA105{1,7}
      commit: b817f505926b8ffbdea8aa87b66a622acb9b96e9

Best regards,
-- 
~Vinod



