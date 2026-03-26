Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553E3109E546
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gz8iuoLUofR9ZYC8plHS1fC055EhXSSpkNZYn54JfOE=; b=MVF/Xa4HUyFE4ET7wrsnmR2ar3
	hK4GS0mhduNEkI+gYxVKSMCUkx6Oc92sfkDTXihtPGfzxBO0gJvILplQNJwmXPnUoH0SSoRRYRlqe
	Mi68mZMpu2+ReEeXr0v8JuhhVXoitHdlSftcDk/XgrHYQkxbYYsabjxfYrKGJAuH20eYrK89Q80Ha
	zpkQzWPutot8+NpXr7yGHFA4eU0CYaAP5y2jeziKH1hRVDcHqwQ1NPgP7jP23t8AeBIBV2s7D3D8G
	lKp9C6EI6+BucKTJsXV0HbXTipwRKFKWJyZrONRBAz+RVJE47/Ak5hwppsV5mG/8V7s5WP9UPV+nv
	ZTOImeEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cGk-00000004fcI-0BZb;
	Thu, 26 Mar 2026 04:24:30 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cGh-00000004faH-035X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:24:28 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fh9dy3wnqz9tQP;
	Thu, 26 Mar 2026 05:24:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gz8iuoLUofR9ZYC8plHS1fC055EhXSSpkNZYn54JfOE=;
	b=jlAxbEg0yC3imFvd2R1nHS5j0oNPp2IkXAldtOCbfcVtQ/oSM7gKdnklnPL06lRXEREA+A
	0bsdNdMuAkTXKblyTp5tkX02f6kQZqW1np0Kt+HvnnIB1EaSI7JlSXJ76rOQoT/FHvMVai
	3IIsFOWwIAaqt7OtE4qX0Yu8w/K8h8RjROOo7g1ZfDXP7SukK2ZFAqeFCIz9D+CTE4+LRT
	Wd+lAY+S6BFDVfzLPs8ZeHpHWp9BL/iw1mZFZNmSK+D0XssuswpW8hy0B93k14Y/U4Cbf3
	+1uq6DZCWP5aBXeaqlL6HL5Ht0KNyTmkW6pJZQZAm/3BXER6CkYgSUYCZiJUsw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=JC5Lxzg3;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gz8iuoLUofR9ZYC8plHS1fC055EhXSSpkNZYn54JfOE=;
	b=JC5Lxzg3aOVdFVeZ+AYsxNjj/KTzpZgK8hYLEVSpROVH/lWt6cK0Tiwte27XJL3pv4WoRl
	RJQCWIJ7n+3iJIgDq05kjjPYI7cZxFrxk4Pn3wyBCZ32NqYDY3bHFED0eIgYcZS6bv6kjC
	ul5hH7ox+F5xZxAI5qK7R2bnknyvSlzA9R+8p1uWs9ODD/ftV/h0iQmmOAH81Or2/IWNKc
	L1Lu5e8LTCxC6DB5grbmiqM/QEC+2GZBTRtqz6YlZkorUuXJTNVP08AwnUISHu27wtiZ9m
	R41JMvqlvCVzorh6GIugYi7eNuXWXdYGWNHYLOFpaPN5DTVQEcOOdN+e8h35jg==
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
Subject: [PATCH 1/4] arm64: dts: renesas: Fix missing cells and reg in Draak/Ebisu panel DTO
Date: Thu, 26 Mar 2026 05:23:58 +0100
Message-ID: <20260326042411.215241-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 65319e4c90fd8c39f46
X-MBO-RS-META: m5gzf5u5rteu7g3pc8n4f1u6u999tsa3
X-Rspamd-Queue-Id: 4fh9dy3wnqz9tQP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_212427_193192_8A5643DB 
X-CRM114-Status: GOOD (  10.49  )
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

Add missing cells and reg DT property into Draak/Ebisu panel DTO to fix
the following warning:

"
arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
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
 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
index 258f8668ca361..90767d74e21b2 100644
--- a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
+++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
@@ -27,7 +27,12 @@ &lvds1 {
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@1 {
+			reg = <1>;
+
 			lvds1_out: endpoint {
 				remote-endpoint = <&panel_in>;
 			};
-- 
2.53.0


