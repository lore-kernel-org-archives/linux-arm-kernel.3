Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2617DC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xn5syabkc8Ac7FLEHgBkaPrtGwoPhZlqa7sfgImM52A=; b=Y++cZR5vPfRLZycLwOMpbREv2i
	fXhM0z2U96TbRYnS4IMmi+zSVjm/Yoj5YXq18BAdEbAzUHuuJEtRHKS/G8VtS6ZXb7nZBYPGfvyNf
	Lh/3f0cLioCO5dANmx9cgKhQm71O52O7c8zSl2ygCwMBiXZ2xtNT/+ZDbrrr82KwWJJRERvkB0+Lr
	8+7J14LeK1rm614ZnrH6I9xsIrCNgSsgVd54eRPruCMum0VaqztBO9DMzGrXmNK97yG3ja2mGZM+3
	7d/KDmXMliD6bzJfsDY1/ajAe3hUu/1Y1Cpww9MUx20hFUozg1RcatzMolQhccrTGkTOeSi7xQ1wY
	mRd1/M2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQYp-0000000BwNF-46uF;
	Mon, 10 Aug 2026 14:01:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQYl-0000000BwKU-02Y3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:01:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4955de8797cso12778615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786370456; x=1786975256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xn5syabkc8Ac7FLEHgBkaPrtGwoPhZlqa7sfgImM52A=;
        b=qMPF+UjCYNSyNeCniopfG2gCqiqZx3OZE5ATu4NYnoXZ7ZJbFZIbek6ydSFpyu6vwm
         Z64ywL1VX9ZbLcxaGVFOwgfANTyx+nrk8K7gFdziFJM40Z++5SOsm37edfRrJ2SQNKfs
         oTB1vAqTyFRUbpslR6E8zLhrV67Fb9pdWwflXE90y/Y0WNFjV8885+C+L1Iqel97pyYY
         OYZtg8nU6Ukyx/p0ZEtkmKvqbkBBH7Hi74O+G8F3+cg0zZovqRG/IprVPxX04rWblDP5
         u+BJD7BwAxMyExeWvBSP8CZv7jKyfeuEczVONH8gclakKSzADY9Kr1buU9EodjB9llOt
         GPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370456; x=1786975256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xn5syabkc8Ac7FLEHgBkaPrtGwoPhZlqa7sfgImM52A=;
        b=cOF961Sz5PUB/1B/YpKoaenmYkUDlxZhiEczVNVeRlGzqMcx8KdWtxMMWnSMVq0lqg
         TcC4wUO3SDobIZPlF/VypT3zCFKa0syHjs6ha2a/JyeQVkD6w7cBuUrgurTiEROp2ZQV
         xkkAAbVXL+/NkVvr0bpfl7iz3aR/W6JZfUy1gCipZsQx64jhhXWXMBbmk4upd0krXNIK
         IypUoH76LR0OxJDZ/m5vBYLvWpTKVlGWT8QwxEG2gQSz0UJXyWs5xbfdfCXSQhFS/wb0
         ryCzXixxh/oMFF/XqgmB8Q90EkrXUhp72H7TDTUwBSqv73U/DQEWJPa/TkS1UR0CVaL7
         tBqw==
X-Forwarded-Encrypted: i=1; AHgh+RpfUkuaC8oNAe7wLwyWGPh0l8lXDViZBQreZHkF55YOV0LFjIW2LMpSpowSZxeCuJx+Ar7HcRJlOsj6hZqZSGXl@lists.infradead.org
X-Gm-Message-State: AOJu0YytYkD2Rmd5G8ALAKCrIsSkHA6pz6wjhZDmtgV7oSvgI712/F/Y
	fbYXz5BQEed3TV7VLEszcgwuaUJZusLKVuV2b+jRfFgKE/81rrKBZ5gO
X-Gm-Gg: AR+sD134suIafh/IegD/TI3oIqxhBWqtsJFAXH/tiXxRuXTR5dnUcz+NIhQe2hIbTif
	hEIoTEflhU2ByTI8RXvoEY+igF0rvUPiR1JTd3vBf0Fqd4DtBnqC0wtbhYEgtztDFziY3G8y7Sw
	4/Y4AxeTBo+neMPPpMiTQWONc+4JEICepazj14QmLiECf9MYRxQzVRCal8SQj0Sn9TB+2UCMfUW
	gMcVq486J6iOG5kz3aCG7bmzhvPLngmo11OppcdRgAmj0z3iIKcTynTYBD7e+rQe4j2nS3mboRs
	0x5spdsTQ9TgW4Ti3qOOjY1F9/44cjDyQvwUMPXW9CZ1wU2bEt3skF2Wt42m3c8W/P/GY9ICus3
	JoGlvjFj6LJW0hJUqTvTlrLHDExE8NB0wxsaLCEOSyrHVqJ+K8rHzr+/2HsAXGDqzDVGaN7hT+l
	gk+KDl4jPr0Q+prYr4doaUlE2k1jW2raHmATEJ2sm4lSjpQfqe+gm9hvq1YL4aW4PsX24=
X-Received: by 2002:a05:600c:3b29:b0:498:261:dd93 with SMTP id 5b1f17b1804b1-4995e0eccfbmr294905755e9.18.1786370456383;
        Mon, 10 Aug 2026 07:00:56 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm291661565e9.4.2026.08.10.07.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:00:55 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Mon, 10 Aug 2026 16:00:51 +0200
Message-ID: <20260810140053.2793495-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810140053.2793495-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_070059_069560_6D6B2CF0 
X-CRM114-Status: GOOD (  12.01  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

pinctrl_gpio_ext describes the three Colibri EXT_IO pins, but no node
references it, so the pin controller never applies it and the pads keep
whatever mux and bias they came up with. It is the only pin group in the
Vybrid Colibri device trees that is defined and never used.

The three pins are GPIOs on gpio2 and belong to no device, so hog the
group on that controller. Referencing it from &iomuxc would work too, but
the pin controller would then depend on one of its own children, which
fw_devlink reports as a dependency cycle.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 98f9ee1..74afc7b 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,15 @@
 	status = "okay";
 };
 
+&gpio2 {
+	/*
+	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
+	 * than on the pin controller, which would depend on its own child.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_ext>;
+};
+
 &iomuxc {
 	pinctrl_flexcan0: can0grp {
 		fsl,pins = <
-- 
2.54.0


