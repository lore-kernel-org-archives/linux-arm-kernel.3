Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ACBC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/yCBdXULN/7dimob9RM70hBvraS8nfz9TzFTVD+37g=; b=bkfveW4hX92zd/sShmM3vmfygU
	dcljroSoUbcH++Rp1fagKXMWf/SCmi5h3CjPWFJV+of/1y9Vn2+d6PpejRZrmK8tIMs8ubhL/KbCB
	nMR0/qp844COA2KTadVzTfICOo7dtyH+vO67nO4xNdX7mdoLpxOeZ1rnZM2aH3gIP27eksTsdK+Ki
	w/UrZnBh7hsnQrMy8g3qM9/8yA5nuLso/FIHLH0DhwHh/OKUay5uThuOfJFgwG3fj9ZyL2xOjrvYU
	0kYgM4ThExlTOb3cI0L3/Am9rWVfp7NQyBEHtNaL0CUT341aUwDEKSEkxn9A0Au5r0RG8dbLujEF2
	DQrOFdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ov6-00000000gtS-1cbY;
	Fri, 25 Apr 2025 19:41:08 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Opa-00000000fSr-1i8z;
	Fri, 25 Apr 2025 19:35:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745609714; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Dd5PbieyEc/C+5e1O1b11wZALoNtvt6yM+/kg08ARgdyUhpmzP/NhBN1CKmNf8AaLntYnmgLTChakcyeMaVN8WRfyUWDNENQtDeLYqmzk6Zt6l9IIWJfSo+R5j+9jpJIBlDKuLSmAebBDQFqHka3O0+y5zoIZpfa8yC0JqaZquE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745609714; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r/yCBdXULN/7dimob9RM70hBvraS8nfz9TzFTVD+37g=; 
	b=Y0+ebmMQPjK2p3ZeqgQ4Rhj+IigsGl4R1yNgcS6Rl/gnxuF/9Nke5pfIc10hpopuCJluT+mBr9L0bkiSwsubz9hYoapoYsJlDL0fOWacUhjdiHkbrh1ojoBnWkkGHwGQIiYgwyl9BKHw8hkwMH4JNAcbTnGlLBJ9h6KmPJUz1Xc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745609714;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=r/yCBdXULN/7dimob9RM70hBvraS8nfz9TzFTVD+37g=;
	b=kdn0Si4LxDoOzrxLzkKFSkVrcD993k4FD4Kje2SS/5wabMI22WWPRplacrKMDifc
	vjDz/S11+9xs1hOmz6+e1BDNeE4xQUwvGkBo4/kSlMNrOFRtLw0AMZCjo4DuUpQZKFs
	cSgHEv5ws01yAWARhnoNeTQGpZHhJlIpy4HBoKw4=
Received: by mx.zohomail.com with SMTPS id 1745609712399137.5838901988809;
	Fri, 25 Apr 2025 12:35:12 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 25 Apr 2025 21:34:36 +0200
Subject: [PATCH v5 2/7] dt-bindings: rockchip-thermal: Add RK3576
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-rk3576-tsadc-upstream-v5-2-0c840b99c30e@collabora.com>
References: <20250425-rk3576-tsadc-upstream-v5-0-0c840b99c30e@collabora.com>
In-Reply-To: <20250425-rk3576-tsadc-upstream-v5-0-0c840b99c30e@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_123526_538327_CB47AE1B 
X-CRM114-Status: UNSURE (   7.98  )
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

Add a new compatible for the thermal sensor device on the RK3576 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index b717ea8261ca24ebaf709f410ec6372de1366b8a..49ceed68c92ce5a32ed8d4f39bd88fd052de0e80 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -21,6 +21,7 @@ properties:
       - rockchip,rk3368-tsadc
       - rockchip,rk3399-tsadc
       - rockchip,rk3568-tsadc
+      - rockchip,rk3576-tsadc
       - rockchip,rk3588-tsadc
       - rockchip,rv1108-tsadc
 

-- 
2.49.0


