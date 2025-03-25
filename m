Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347E7C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 19:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeGlPWnHaDeM/prZ2XLHvdOPSI3NsSge/Kw4R1fl9sA=; b=vz/pU3KtAUv7ILF8wRCVrw6EvL
	fj5yBo2+PpLEcq4uhDGYagwnURyoD2HFE3Tl+ico6TfzAr6FVMF/36Nis59JvpFrKNe5j3u9JoBq7
	SCQZbpyEeW8GdkNU0HDW7X6m7gahJiAh8nUzfvxc0Gss7w5dy6j2hUiirMrzOa58H+2/j7dt/r0nB
	rwcGs+trAELhcxTjknHk6vRJc18AjTNy54WsQp2FE0wJP2/iZ4vSEsP1H1oHQK8tT0+jY7ergwdSS
	t/603Ncd8/Bg0CRbW747dwgXaQLsH9DRft8buGZSKh/UgS78nY3cOiyeFi3wPrJ03QgMdNNeNYDzT
	5YGLn9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txAQ9-00000006v6B-0Pnx;
	Tue, 25 Mar 2025 19:58:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txALa-00000006ucE-10j5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 19:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742932441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PeGlPWnHaDeM/prZ2XLHvdOPSI3NsSge/Kw4R1fl9sA=;
	b=Kl/vnFtxndK3KOL6MFCMBhp+N5ylatUe5ITOaVL4rGNJg9g+zd+ESNrabxwIxFE7NfhpOo
	pvgmwuMqAdY2yKY8MaazuUP1MMgi1LX79JPd0boP8/w53MtGRuvaZfg4R5/UPlcnnIAYZr
	0OLwzPuPkUVSKMLBvSQyyTOKN4X5Olg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-292-0eW4VSkBPmyptagoFpJyiQ-1; Tue,
 25 Mar 2025 15:52:07 -0400
X-MC-Unique: 0eW4VSkBPmyptagoFpJyiQ-1
X-Mimecast-MFC-AGG-ID: 0eW4VSkBPmyptagoFpJyiQ_1742932326
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B137F1933B41;
	Tue, 25 Mar 2025 19:52:05 +0000 (UTC)
Received: from puchatek.local (unknown [10.44.33.225])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D6E4B19560AD;
	Tue, 25 Mar 2025 19:52:01 +0000 (UTC)
From: Marcin Juszkiewicz <mjuszkiewicz@redhat.com>
Date: Tue, 25 Mar 2025 20:51:47 +0100
Subject: [PATCH 2/2] arm64: dts: rockchip: enable HDMI sound on
 FriendlyElec NanoPC-T6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-nanopc-t6-hdmi-v1-2-299a2ed45878@redhat.com>
References: <20250325-nanopc-t6-hdmi-v1-0-299a2ed45878@redhat.com>
In-Reply-To: <20250325-nanopc-t6-hdmi-v1-0-299a2ed45878@redhat.com>
To: linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Johan Jonker <jbx6244@gmail.com>, 
 Rick Wertenbroek <rick.wertenbroek@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marcin Juszkiewicz <mjuszkiewicz@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_125402_396951_606CFF72 
X-CRM114-Status: GOOD (  10.30  )
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

We have both video outputs showing pixels, time to play some noise.

Signed-off-by: Marcin Juszkiewicz <mjuszkiewicz@redhat.com>
Message-ID: <98484da08d8d9b7e1af63551facf141a64dbc556.1742931830.git.mjuszkiewicz@redhat.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 8542d9ebb6c0ddcf90cbe6ac8c231e7fdc5b4bcd..cecfb788bf9e2734d8ca3bb7bc99df866895b9aa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -371,6 +371,9 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi0_sound {
+	status = "okay";
+};
 
 &hdmi1 {
 	status = "okay";
@@ -388,6 +391,10 @@ hdmi1_out_con: endpoint {
 	};
 };
 
+&hdmi1_sound {
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -563,6 +570,14 @@ i2s0_8ch_p0_0: endpoint {
 	};
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
+&i2s6_8ch {
+	status = "okay";
+};
+
 &pcie2x1l0 {
 	reset-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;

-- 
2.49.0


