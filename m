Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8871CCD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7vfilyN7JRkYppcEdLbkM+WwTn5eActEOggTfymGRQ=; b=x17DNYXRyf+Qg0UW+RPlbyNK5E
	Eiecr48UXYpYDSgPfcprR+pKsufgG8Kjc2OrZq1Y8bWS8Pndkm2y6I+Z51RR4Db/upHjevl9w6Pzf
	xSeVHKo7LuOCm6A4JDkabsczXwPOhTopkGoLZvnZZlULINqL+IGYsFWaTZmi/0l7YQVS5YsP5I7DN
	LlL3R5Eq6VL1+EgK4NiE8oplKrqojBd1ncl7atFSFYnPt9IulG3zKFuNA34alUQB01Saru//JKsfa
	zfE7mgPnZrRxlEyLGXJqA61pnUuDcT9drpb+1BaWOd6P9fKZHPF7czifX55UhyaeGj/b/OzIjhbBu
	LrMTSeLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74x-00000002Ecy-2fuT;
	Wed, 13 May 2026 10:44:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74s-00000002EUs-1mDr;
	Wed, 13 May 2026 10:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=p7vfilyN7JRkYppcEdLbkM+WwTn5eActEOggTfymGRQ=; b=hZ11ZoD5uZ5Mi+Kdv+wAXX5rsa
	4Z4lOPw0jklR+VT49efaDoYKul8oRLaOvebFljqnUdvspeu9dw6kgXTotQ/ilBX3L+g+/AcCYHMad
	lIafjs7xrZBmMLns353W0cc3TOfQm2kf/Mcb0UYx2UvpZFxOYfSIAJRtYjR3DzGqLZYn51+rL98yV
	0NZVSuU6V8OmyvS/a3j+AGr0k8ZfDuq7WsR6Wv10s/Vgn+uxqCxj6+47PhLmASwKFQrr2Iu5ai2Wv
	M6DWxd5Qj4z/SANgPMphIajJzgB78OMjyPoguR3RdZVKXENfyqvio6kxI6xUWP5PlG6h5KP4QkD5O
	NhZzMgKw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74n-0000000HBNj-1VfM;
	Wed, 13 May 2026 10:44:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 601AD443CA;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C7E5C2BCB8;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778669066;
	bh=AVnCN6kymER6wy+4kacjuFr2lYcaGoCedkDJ0zolop0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UkTtBFwhz5qvnpqKSbhXOQT6p5elGLeyJCNRsQNpheaIJAKTLtDyhjXtshr3Kl4GH
	 o79RM8utGGbZ5LmoH1F0PyOn3VztjK3i0bARlEGb1WyrMk6twcLcYs5FBQKy1gK9RZ
	 GwtZ3DKuJ9JwYAxyR20i/6xWn06uxMdTwTd21VyGQcxzhFgkaUi4sLyNZ79N8BOuaW
	 MaWP5jFZ5hMPA2pC9nrqWVMzFVH7C7fch2ph9pKMZ+4s99WBN+QvDEferElsOpEeaM
	 Wtal+I4e32gujlIBaY1x5VHJ5dobFi7q69WNlJ6Tl904DGftdycOioBr7m/vAr9Nua
	 OMX7a+f2/mUKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A51CD4F24;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 13 May 2026 12:43:55 +0200
Subject: [PATCH v2 3/3] arm64: dts: amlogic: t7: khadas-vim4: add
 PWM-driven status LED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-add-kvim4-sysled-v2-3-3ec9779e8875@aliel.fr>
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
In-Reply-To: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=2xdbcwmGmHmxRvinJQMTjDVB63/BF5fZ22AOjpf30NU=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxZLGAe/2O2a+3P475ob7pLlVj5TH3PE96Vip/GKqam2/
 LtVTP53lLIwiHExyIopsvTPtTzx7vLRM1/3qKfAzGFlAhnCwMUpABOxZWb4H8rz9ZbCD4fdmnPv
 fm6YeX9D6AqvSVOr/7fvWzMjwq193XuG/26NkW8q47RFz+RJuS00FPyzrT+VY/eZGWc3+OzWeFQ
 3lR0A
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_114430_392034_33CC814F 
X-CRM114-Status: UNSURE (   8.45  )
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The VIM4 board exposes a status LED wired to the PWM_AO_C_D output.
Enable the pwm_ao_cd controller with its pinmux, and declare a
pwm-leds node with a heartbeat trigger.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index fd1b983354a01..c41525a34b721 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -53,6 +53,16 @@ dc_in: regulator-dc-in {
 		regulator-always-on;
 	};
 
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		status {
+			linux,default-trigger="heartbeat";
+			max-brightness = <255>;
+			pwms = <&pwm_ao_cd 0 30040 0>;
+		};
+	};
+
 	sd_3v3: regulator-sdcard-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "SD_3V3";
@@ -163,6 +173,12 @@ &pwm_ab {
 	pinctrl-names = "default";
 };
 
+&pwm_ao_cd {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_c_d_pins>;
+	pinctrl-names = "default";
+};
+
 /* SDIO */
 &sd_emmc_a {
 	status = "okay";

-- 
2.49.0



