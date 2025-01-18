Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40987C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=; b=F4Y7pvdk9uXBtYzIiCFM3/B2/3
	lr9tOsiQTFW0tyFOlOYRtsP5qXr5dD3JfaRzdBo3ev5MnVPOnumLJ1jgStA+PU57bDNfmboJ0pISB
	oj+2s9TkMT98xxLuxLAbjtvyOSJJlCVT0PHaiZ+gVElfgC2BILOZJJ5Y0WD8ZG9TSVpjFNeJOWY56
	7S7MlLdx/Ir4gWg5rN/bkiGP9tlTGk/aGOe7DHLhK/VqYpNH6PCxKnSHN7iIoiOj81tmK2kCeALw2
	pxZjakrqzbS8beM7942Kt/RBRnbt5l8FU+VlYYqZ/kOgAYltGqrKckFcZ9d5cZsY8YvqUx5KRgBcK
	A1RA1BDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8JT-00000002PMM-2UEC;
	Sat, 18 Jan 2025 12:52:31 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88S-00000002NAJ-3TO0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:09 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso551762766b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204067; x=1737808867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=EhOCx9hSMBwDY+4dknSkopXz96NWcPp2A9uKHpcv/I/tADdeYiUz8M5HUJCpfSxO6I
         zT8IUKDQt+tXvsWR13+7n45wn4MowAZB28SfRYAnyQVg0DoVc6xNgqySk939o+83ytdK
         Thkfcj/rV3ThDf63MIasUkSPi6fCqSJ0D5krQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204067; x=1737808867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=UgIAJlMAWsC5fx5Qh97+7tzxDmbqLtpV33eHZBvVp+6rcQceS4YtRrpVdtfWyozx2U
         op4j//rrhwhLMkvBOYk5Nnnyf70YZnEdG3Y0xJg6r4C4YQztilwahzCw/1bAqWg8lYR3
         Ko/AfRnxKmnRr4miD3tgXG55UANqVWxe7FyV2pO+CRxuxVZ55h6USwLy6rtxUQ6XOH2N
         JSG/UQtUqd++fkYzYL1pDzA40nWIAMRutoU16VvGMxZn8mU0TZwF9UCL4TFAJBjKKyrX
         puAgJHyAGuqaM/EiMqviwrfK/Q/HjzCsUuFE7X4gOhLXHyGmJbEQfcVz76cbjfWcyxcG
         /58w==
X-Forwarded-Encrypted: i=1; AJvYcCXVLiI19VExHlUFpkiSKyIeFUcTRgl9F4sYnfv+vlu3VuBvBBB2kODoifjjursBia5gnqewq+Tg76XUuNU0VqQY@lists.infradead.org
X-Gm-Message-State: AOJu0YwWaz2e879ppT/9l3m+1HoJ7eYSQLFMZL+BVoNhZ6JZx2Djxy7j
	chSA8Jng+L+B38Qthp70rKTsLG5vDW+hZK+yA9ZfaK4KmVV4TNXx9WjvgqjQCI4=
X-Gm-Gg: ASbGnctIkgNBkGoGOlf5Zr2XoIniTm7PLWMVOCnvwrWpm6/eyd47imnFmK1wiqnJrE2
	iTlRH2w7zwxEIyriBKvawkJD2sd9h9wqp2L6pwWQZht0XDSnb8O659yivPjbpVw9nyQPzxmHGfN
	Gx9HQaAUmWwOjLvBeCxgIfrZsulwnvb9b5TdQ5KHsLZC8Z6aHoN2otd0mKFUajL6ww1+3Ykw04v
	y6LIyZJ4kiHUTjpwzTT183ssVfKAE5y2wj2vm8FFrjYKKSdyGJb9rMH2dRrbud1UTtBEMcNYUJT
	SdpTnX/qV6Hjp5BRRoyXnx6Uo7PvB3Gr/2n8A4y4/LUNtVvGPPdSdykdorNMGc4mM+xv4OshkFM
	cAcuG/VMUcE9D5dVh/LklFGZ46PyCs7Ulll12
X-Google-Smtp-Source: AGHT+IHX2I9yy/tg03FjOqBgNh1ud5x4FkNGAAghKsVjSyjjnfF7XR2jyfI8B0AX0C2mCSM8Nkikkw==
X-Received: by 2002:a17:907:7256:b0:aae:85b4:a07 with SMTP id a640c23a62f3a-ab38b19146dmr492323466b.8.1737204067196;
        Sat, 18 Jan 2025 04:41:07 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 08/23] arm64: dts: imx8mp: add anatop clocks
Date: Sat, 18 Jan 2025 13:39:51 +0100
Message-ID: <20250118124044.157308-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044108_863082_83A23DE4 
X-CRM114-Status: UNSURE (   9.08  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..0b928e173f29 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


