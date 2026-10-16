Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E801CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5k/Nx254skplKaHZfy+hhUKCjKjMi13IPnfogdi4XtM=; b=qQMpqOsiG2Ot57Hj+MHRR0Hoh1
	hRKlAXj3dt3aMLVdOk8VBO/51eQpE6FQbmnV0Yg8BfULz0gEd50xK6Vzl5q0EiDO3v35AhyJVbe/O
	yf8AmPdvgfehdKehTo5wHtTeVEZw/XVvzU8e4y0Y0sICJCGK9YsJIrPyU95ArohrlRBT3/r/u3gEn
	tVKW7URLIIu4nlSW5+a3ll5Ag/CHaGlOCGjT528GBOV+1bmFmqgZ0Ib8Q0enhvI+bDdl6B2ymGNxY
	qO/ZgV5PXNc01Ej/o4RVTVcqcT0pIQknit0LKnp7srsjEhqBqjvoYZYzv7GN9hZP3YiWbEGpWY0xe
	zm6OkGhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfDH-00000002d6L-2oKI;
	Fri, 16 Oct 2026 10:30:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfDE-00000002d1C-01mo
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5k/Nx254skplKaHZfy+hhUKCjKjMi13IPnfogdi4XtM=; b=Emol06tSEcovlg0uRL8HoQ/YAc
	fHUCP/ynpgXH0q4J4aktK9f5jFj28V+fNT1k+ueB1LnOzv6PWoPlq2CwJtWjpg3hjVsKBAbW5o5uA
	bn8iTBbiJrgDwZlY9XInINiB/Tt0z42o3oFns6zhd2nxMJ2fMe7z1PYFFL7aF8v7c2VqF4BbXj7iF
	7ExebQj0AkaCfDzK4Zs230e/zFH1iJEmkuhu+Na/wQ6RpihgsHw6x6Mifkrt4VbvZKqEUfUjoDN/P
	J8TYxF/ibOuyxZRLCZES5jbidavlxlyvyUirJfHwm2HXiSOGZRi+DUfwa6nRQzssgnt6yHGuBTIvh
	OKBDJvmA==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfD7-00000001NrE-0iLm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:30:52 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so318277a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146647; x=1792751447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5k/Nx254skplKaHZfy+hhUKCjKjMi13IPnfogdi4XtM=;
        b=U4YsIDqwZ/9DUEtVVPdyJ8Q16LZlotS8F8uW0z5uhwmUYNHHeSKfsSzkc1fiLMIXvu
         8CuHSex8TkgCd0md6MkYSTJqyUIgm23Lnir8yfErdC8cz7dcR0wCiRfeA16GBZ8Vxjmn
         D5B0ME1V95SD/BK1UUfYnxK2AKzWRZVoQpdyel2ZZXXjrJneqya9ojPyd+RhoAU4rwJw
         F2WlrYxhbRZhCDiiVHMLAo6WYA8nnVn0S/A8EpPnBU1ixDOWtkprAoJXD29pmNxC9A1x
         n2W+maNFe8XGEqvppzXa+LN2P5zmJpLz7E2jgokoV+GIFiwMoROvtnAsM7D2N3P+6tXg
         zJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146647; x=1792751447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5k/Nx254skplKaHZfy+hhUKCjKjMi13IPnfogdi4XtM=;
        b=V0PXaTJSmxcPhiPS1j1DqmT4PftSE57LRJ2Kfp26bah0CFsNgkDkilz6ULwwkP0cQ4
         JXexb4qgycYDnqjLG4t5HntOeXOZL0q+tX1zM16ujc6wnaBClO1U3M17IhjiSriGV6cw
         79Xq71dQCgqXU5E5DN2otRluKGUEru9rDRvYf3kJ2sHaB/cm6fiwR1QbxR19QnIjJIzi
         Ip5OVWSaxdpVBLvrf8ORMcvl2AveMsM/kWvhtIBBRSYuSnL0/nXd9NLmNmyQmrjBuLlF
         NKftDOm8TVQOkJf9RjkJvSF0OuYYoqX/ODGgYKjSYFGYXdCjj9ccLTZbqOJzrDWiXo7G
         p0eQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJNsz0PTrumfk+HZwAhZa+GBlcWZRP6NfnftTy2+33PPipJ0ig9B1nY7R08SvFpVpAnAyuEkfqVGANjAiaSc6y@lists.infradead.org
X-Gm-Message-State: AFq9FYLmbMQ477mLjopfX4qTs2CIbCSJmNYcR7Wxmc9TY66ahnamDiCv
	NIXfQgmRb87xgel0wudTXigAwOHiV2KmTegbXWlfa1H5xbLsiNHK7ABc
X-Gm-Gg: AYBFou3PD1bHyMyVx8M+1rgg55tkAHt9aZT+k24zI0AiZWDEq3DzGt8MdVhgxJvo4I1
	Qa8/NkH+mU2Ipy8lafTxEhahxHWdlvePw6J+A8F6vYW5M/U4SLnCWHx4A2Vme86Ujj8skYPSv0E
	r74IrC/L6KMmtAMYIj/cfH3+QQLkly9IfxRxh6ioj7Q35RY3AYFUHe6abfyziJuxs7G2OSv5QGh
	pDUVlBsisuGCJwp4IQYs2D0kdIXnyJHgnnKDwxhswjyzqdiCjy8JlHN3fMF11P35XenyixZ+DMj
	OfoDco1rTpzFpYQ5OrKE0BFQqMwmoG21Mk1cZDOKUGMcje9RjHSEfk7sD4pYZwlT8dZYGWUDPDz
	0AmWB+uSlp0lYmTwjQJfiMzeui/46XX08YJNK9mmwSLLR03hZGUtyql49dWSJC8Mf+XSaYRt7H8
	+44tevye4frCXgi8tLTWKgo+MkvhBH312C6Sq7nHd9adgvCBk5ISNWKRNmEXeYK9mDE5iYQ9s7a
	vydC2eN/RH5
X-Received: by 2002:a17:907:d1b:b0:c29:4a1f:76be with SMTP id a640c23a62f3a-c31aa013b5bmr2062189666b.20.1792146647503;
        Fri, 16 Oct 2026 03:30:47 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm60613866b.31.2026.10.16.03.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:30:47 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Fri, 16 Oct 2026 15:29:37 +0500
Subject: [PATCH v2 5/5] arm64: dts: rockchip: add FIT-PCIE-SATA overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ok3568-c-v2-5-068d68430e6d@gmail.com>
References: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
In-Reply-To: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146625; l=2276;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=BU4GHjU/addW49Fi5owY8SmKZGnqIixi6vq82uwwdHk=;
 b=L6u76hvhoFC1VxSmQLMBau5CcR67ge6OIBk/TdlLnbx3Gjxy2lnT5flh1/HFTDlutOvBF0orb
 uvcNsyj5RxQDcjFvDJgMbKc0qpdj8XXPdVnnu+FBW8dVEo/93Pokamp
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113049_580244_09A7B629 
X-CRM114-Status: GOOD (  15.06  )
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

FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C board
and allows to connect SATA drives to the device.

Add overlay to use combphy2 in SATA mode.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile                    |  5 +++++
 .../boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 48c83f79f83b..45e94a44107e 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -155,6 +155,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-mecsbc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-odroid-m1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-photonicat.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233.dtb
@@ -275,6 +276,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-lion-haikou-haikou-video-demo.dtb
 rk3368-lion-haikou-haikou-video-demo-dtbs := rk3368-lion-haikou.dtb \
 	rk3368-lion-haikou-video-demo.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtb
+rk3568-ok3568-c-fit-pcie-sata-dtbs := rk3568-ok3568-c.dtb \
+	rk3568-ok3568-c-fit-pcie-sata.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou-haikou-video-demo.dtb
 rk3399-puma-haikou-haikou-video-demo-dtbs := rk3399-puma-haikou.dtb \
 	rk3399-puma-haikou-video-demo.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
new file mode 100644
index 000000000000..474488ea994b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C
+ * board and allows to connect SATA drives to the device.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie2x1 {
+	status = "disabled";
+};
+
+&sata2 {
+	status = "okay";
+};

-- 
2.56.0


