Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3A7E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 11:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrQzcpsEZrRxzYneklGMKbZSVevXccoK1hLw4KZeU8Y=; b=hy9aHI6FDDLHSNTEi4+RqE4jnd
	O2dmO6KDuwkkO5BmShNYAQvtCn5VmDMjRFbmNpZyFy7wzdcaWRte2//00+DBzhXWmNjy7qX2iHLPW
	PL3ckbW7VuviKqKzUNxX1AvE2YY54oMcgT+1D/fR32ZthcUzMwBth8MZn6BTkUdcWUR87jmevPpWE
	AFjCXYUycRIuQ4aQkIZ8wTnCuj/Uvgs8zT1zeFKNjLxXOnpgVkoiCGHfo0G5AuZteUoBjcsfHo1VC
	qDvTxl4mnSWunq3ay/C2PhVSwHb+DOW1Fv9NWhTHdQsFrhjf8nfkgEQgXqRyAEa+9/GqEHxr/juAf
	w+dHi8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR8TJ-000000005d9-3son;
	Fri, 27 Dec 2024 11:25:37 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR8DL-000000002m8-1Fci
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 11:09:08 +0000
Received: from eig-obgw-5008a.ext.cloudfilter.net ([10.0.29.246])
	by cmsmtp with ESMTPS
	id R46ftX9ANxoE1R8DLtkirH; Fri, 27 Dec 2024 11:09:07 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8DItwrwUN0LRR8DJtphZe; Fri, 27 Dec 2024 11:09:06 +0000
X-Authority-Analysis: v=2.4 cv=erfZzJpX c=1 sm=1 tr=0 ts=676e8ad2
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=YmDlHjd7AAAA:8
 a=vU9dKmh3AAAA:8 a=L4MHaItcyTsGJ2lxC4sA:9 a=QEXdDO2ut3YA:10
 a=jsfG_yEu7aiiUYXEnMLs:22 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VrQzcpsEZrRxzYneklGMKbZSVevXccoK1hLw4KZeU8Y=; b=MmADfID++vJZInjAxO+ke3ncQv
	k6lDqXSc4xRJRQohMx7+LLBZKxvH1xCViQfbOqiPtcZEsw6Xc2KDYaIIzyHbR7By5EjVCFAC5UA1I
	GpyA2pMYVBexWEIKqbqEVyiEl2F6JQh528r3RGK8C2FoewaEE8/LLPoh/E/l6/OlYAwRlQWKXHq4y
	DgvNtopjCF4ciuHzdjwNUN8lLJJ3MOedR5+iGqItg7ho6Yud07Ym5sIckOxvdIiI/9DiATpbVFIHF
	EWpx8Xw1xRpsZMFzOsMBCbgB1MubFm6SeBYmKggJ31teQEqgTZLmlUAuChhch3yFYtloavFK2U2N3
	/9ykVKRQ==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8D5-000bEK-2z;
	Fri, 27 Dec 2024 16:38:51 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:37:54 +0530
Subject: [PATCH 07/22] dt-bindings: vendor-prefixes: Shenzhen Baijie
 Technology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-7-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=835;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=jfPsPwWKRhhV21IwFSRmL+uw8EZXVaV/9179PemDy/M=;
 b=CJOVx2TC4fLDcjQ6xgq4N4Mi1niTuzwwERJ6yiEMANOEwpSEoLqBhfJmD+PDB56mjpO3si6jf
 jx7xLttFSJpD3tHngJF3gIva/96uOpoEpuitCdS8Sqx1ZgpvNpSt7UF
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR8D5-000bEK-2z
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 209
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHlDUiQ3dT+0EAgjEAVGQDMUrSaA9Lx3Q5kxa4+JuEit3j57L1R0t42BiKehl1j93P4JjB8uWBDnKIvrkj7Hz+/H58Ou9RXaofX0VowSx6T/uSRLavmD
 Ws9XkDPQt5vEQjB1rtPj9PrI6U4Psuz7sYjOZtewGIEcYOwsrbN7zQOz6wECT3msluzdjdK+H8yJqZEI7U7y9khDgZlC7ybywk/4L9Hn5GPfhz2N6i+0pl2a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_030907_425076_E960C82A 
X-CRM114-Status: UNSURE (   5.23  )
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

Add entry for Shenzhen Baijie Technology (https://szbaijie.com)

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c7..81cbc8b6b195 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1466,6 +1466,8 @@ patternProperties:
   "^synopsys,.*":
     description: Synopsys, Inc. (deprecated, use snps)
     deprecated: true
+  "^szbaijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^tbs,.*":
     description: TBS Technologies
   "^tbs-biometrics,.*":

-- 
2.39.5


