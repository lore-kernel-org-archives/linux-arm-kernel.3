Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130E2606A322
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eppvBfpS;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=krTZQ7DU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MN0UiazmxeHW7SqU7RVeg38ZMCu0rsCgqZRvdUxxdfo=; b=eppvBfpSNgaKL6hlxzJkPgnAkf
	VMqXpBLQpymAnq4IASRNbhWDuxfSLbokEA6tCKBgrKUtG7YndMi4fw8W7D64Ynl6Y31fFe4+4cps8
	r1eB8PduFi3UaI1C65JPqpz0RnNGgO6c5zn8XQVBKvmiVg3981FvxSb5epXezTuJB2HxTJH8MZ4xZ
	Aw7IwhyR57UAG5z4YQW5ChbDhgdhGIM2/du9TXTVbS77WX+F/AimzEe26Y0YSKdgloImPanYZrfpu
	MIASDfeUUXQhg0VMl7OTxrFhTN8eKsYE9VplYB8TXvIkssR+xxEzSFHgyTj1Fi2CKqYP0SMzXClnw
	TWYRwDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvTq-0000000ETIy-2eKl;
	Thu, 22 Oct 2026 16:17:26 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvTn-0000000ETIK-0coh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 16:17:25 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EFFF61FB4F;
	Thu, 22 Oct 2026 18:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792685839;
	bh=MN0UiazmxeHW7SqU7RVeg38ZMCu0rsCgqZRvdUxxdfo=; h=From:To:Subject;
	b=krTZQ7DUtT0stj2dVB8QD+m2a5CLYrzcVr3zk9IutgFqpT2z9HhO95gbkV5KbZj/D
	 kkdJ9I9S5VCm8+cU3n5VeJZ6x8Sjr1mrPh02zmpDAVMpKmgcy77wZe1sHXESQSIioW
	 fX8xRnTF6wzkUn3xAC+moTMEfTBJUm0NM+frmKHJBVoO+ZHHci2Q9/FqDgNB+7Rask
	 AGYsiCo5ZnDFMZb3MpMqialws5eykADppY4iC+ut/R+sfBl86YLgzqIfArTdgpvxsZ
	 ZxNexj5KK8OMYx+O+TjLabCCl4sfIexEFrdryMztsmQBM/nmT9uN2JrUVy1E4i7SFW
	 DiMYxNU+eUCPg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: colibri-imx8x-aster: Enable I2C bus
Date: Thu, 22 Oct 2026 18:17:06 +0200
Message-ID: <20261022161708.690702-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_091724_127527_239FA64E 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Colibri standard I2C bus (SODIMM 194/196) is available on the Aster
carrier board on the 40-pin extension header X20, the Arduino UNO header
X18 and the capacitive touch connector X3, with pull-ups on the carrier.

Enable the bus to allow userspace access to I2C devices connected
through this interface.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
index f7bbb2153ae0..11b1d45e5dfd 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
@@ -26,6 +26,11 @@ &fec1 {
 	status = "okay";
 };
 
+/* Colibri I2C */
+&i2c1 {
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog0>;
-- 
2.47.3


