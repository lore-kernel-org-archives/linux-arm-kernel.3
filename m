Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CC3109E548
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbx8jFx3M2eb7AnI2uKjWeapl9oX7jNVDSMqkUhIy8c=; b=ddBqGw6L8/FdladvlZpCv9oCsc
	lTugE8gjGDPP9VBOwhxGqcbmvSJ2GG1V09MRIYzcZ+X/JI9k4XwrLkH2nIOAlZYZ2OBPieQIvD1N3
	AdKEG/C3nxVAJi0OxWkFX+sl5SWx1diP/bGJZCljo8T9xi+3OZk4AEiQmqLU2F+GSMYBe1O4Cfq8/
	40KJsQQ097ZaNKCAVE9Yl716nTDzNO5fHZAXmQ05GgJfd3Ul3oyqgj7D+O/0tlqYXIfA1zaGHO9NE
	oyax5KTunEZCUViadTd/1bdaQiY5KJ6PGx129loqHvya1+XtJremRdGLXfoh//CsHhDUdiVmttw8o
	Kc0hAu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cGu-00000004fgG-0tFb;
	Thu, 26 Mar 2026 04:24:40 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cGi-00000004fbA-2wlL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:24:29 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fh9f30Yg0z9tWG;
	Thu, 26 Mar 2026 05:24:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbx8jFx3M2eb7AnI2uKjWeapl9oX7jNVDSMqkUhIy8c=;
	b=Y4cXG5WdSj3nlnFqwgwGbwc9FL3Aq9l3X3oHWWMrknCphjcJGqS8/xswft6uvpVKLgvdvm
	IcO7ExHffo/Mmy0f62ojB8RjCPmAPpRqzDJ76r3pRszt+OwDdx0IMC4mMa3YqKt2VUZD0a
	wPXk4US7KOiMvvVxqxzSZX3rBuBqdRgWFOdOP9m1ibWbHAL6kfE5dw21/pcFfy/zZK4Ksg
	5qwVxlbLe1WdPE2Tx3QTWzv725Yv089ZaGKRd/oDq9oxAHhfiHpFurEBAdcIQckhmjQTGi
	MiDEwIzCQJoTggInmZWSN3FUTEqx34hUf3wbuBgKBO+TB+XKjKoGSAmeuGkMUA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=NL3QQmtK;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbx8jFx3M2eb7AnI2uKjWeapl9oX7jNVDSMqkUhIy8c=;
	b=NL3QQmtKlM4pCvSy0WxilKLQN3uGHRhFlxQThpHHOBitOqqiD42bwn7iXNuNKexZBLsehK
	z42YtrGxIZYCHm87bHneWDDM7mFyRBD8RPnd42q7zjYhsFe6XaZqaRUJBpV47AsAjTlRoh
	Uf7AxjHdvuliL08Ti51nXkRH1msWtgNyCO2ijU81+MGo68Hf5v/UapfLH1bZqF5u9DEf7w
	uHTtu8EGCp1GVVpy2BO3cpFxM5fRc4GXea3kwWO0bap6y1P3OvvqJsUVSp3/hNYEr1bA9g
	Ww6Ws5PWdaoYaYW7qIzpXN8jnxU6+W3Ky15rRdVPGhcOFwaWY6QltFRyPgrtcw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells and reg into CSI2 subnode
Date: Thu, 26 Mar 2026 05:24:00 +0100
Message-ID: <20260326042411.215241-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e661c0dd2b16a8b0406
X-MBO-RS-META: dgjao7ukhtr53uru7qohhyj68ndc73jf
X-Rspamd-Queue-Id: 4fh9f30Yg0z9tWG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_212428_905711_B66C97D2 
X-CRM114-Status: GOOD (  10.46  )
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

Add missing cells and reg DT property into CSI2 subnode to fix
the following warning:

"
arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi:49.10-55.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
"

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
index 4d2b0655859ab..3feffa4f16a9a 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
@@ -46,7 +46,12 @@ &csi2 {
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@0 {
+			reg = <0>;
+
 			csi2_in: endpoint {
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
-- 
2.53.0


