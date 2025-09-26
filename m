Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08465CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zyeSrCviALKLwpxVGFG8rZWElA3nuGww42zxu/BiFw=; b=H9YFH/DfJpIt1oRMTtZZUvKv7L
	4jV0QnjEf15VGyQ+bq2oA8H4z3YrwwRfU8ln4Ask8qwF/gPxm7uiYnb0g2Z8CZXPbWxh42iStbKs4
	IetFh+rKLDvMpGb8K1BKlhnIm4XrV+KrdTuL8Vk3n3bq0us0k29MUOQMUjcRJpTxCc56JF67TuMHw
	ehbiawowhFdZQ2RIvMvh72aR3OznaFxynxun/xJJQUqTrhFciIvrMko/VCYBfqahfRVMSkmsc0wEx
	3XGdCqHqB3HSEW5bt+S3Y1FrMF8V74+1Te38Q5CnOOQseYjdcyK/s5FYDiGSoY+p3tJ0KDYem+o0e
	Jg9af1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25L0-00000000Esg-2Hb3;
	Fri, 26 Sep 2025 10:06:02 +0000
Received: from mail.simonwunderlich.de ([2a01:4f8:c17:e8c0::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25Kt-00000000Ejv-3II5;
	Fri, 26 Sep 2025 10:05:57 +0000
Received: from sven-desktop.home.narfation.org (p200300C597166BE00000000000000c00.dip0.t-ipconnect.de [IPv6:2003:c5:9716:6be0::c00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with ESMTPSA id 45E62FA182;
	Fri, 26 Sep 2025 12:05:53 +0200 (CEST)
From: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Date: Fri, 26 Sep 2025 12:04:53 +0200
Subject: [PATCH mt76 v2 2/3] dt-bindings: net: wireless: mt76: introduce
 backoff limit properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-backoff-table-support-v2-2-16d3726646c4@simonwunderlich.de>
References: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
In-Reply-To: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, 
 "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3962; i=se@simonwunderlich.de;
 h=from:subject:message-id; bh=uBaOvLBEYw6cM2ZE3ZNKPKFL8pnovauxKrJogvIVOw0=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBnXUivUEs2uzDGR6H+Uue2e2eWwvV1ps35aeW+K41ulf
 WuJJ4dnRykLgxgXg6yYIsueK/nnN7O/lf887eNRmDmsTCBDGLg4BWAi0W8Y/gpUezLuO37AtPfK
 i+gAoSauq+vnfFkXfa40XN4tP2jz7uOMDMsrQtMfXt8S/Df33yEb1sB/ku/Lz2wX4F0r80B4fve
 qb3wA
X-Developer-Key: i=se@simonwunderlich.de; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_030556_005995_B7F53F89 
X-CRM114-Status: UNSURE (   8.33  )
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

Introduce path backoff limit properties in mt76 binding in order to specify
beamforming and non-beamforming backoff limits for 802.11n/ac/ax.

Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
---
 .../bindings/net/wireless/mediatek,mt76.yaml       | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index f8f72f3f1b1dd185b4797be38b87c621ef3eac08..0b06455ce955c38b324efebf8c7762bee33b57f6 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -215,6 +215,66 @@ properties:
                       minItems: 13
                       maxItems: 13
 
+                  paths-cck:
+                    $ref: /schemas/types.yaml#/definitions/uint8-array
+                    minItems: 4
+                    maxItems: 4
+                    description:
+                      4 half-dBm backoff values (1 - 4 antennas, single spacial
+                      stream)
+
+                  paths-ofdm:
+                    $ref: /schemas/types.yaml#/definitions/uint8-array
+                    minItems: 4
+                    maxItems: 4
+                    description:
+                      4 half-dBm backoff values (1 - 4 antennas, single spacial
+                      stream)
+
+                  paths-ofdm-bf:
+                    $ref: /schemas/types.yaml#/definitions/uint8-array
+                    minItems: 4
+                    maxItems: 4
+                    description:
+                      4 half-dBm backoff values for beamforming
+                      (1 - 4 antennas, single spacial stream)
+
+                  paths-ru:
+                    $ref: /schemas/types.yaml#/definitions/uint8-matrix
+                    description:
+                      Sets of half-dBm backoff values for 802.11ax rates for
+                      1T1ss (aka 1 transmitting antenna with 1 spacial stream),
+                      2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss, 4T3ss
+                      and 4T4ss.
+                      Each set starts with the number of channel bandwidth or
+                      resource unit settings for which the rate set applies,
+                      followed by 10 power limit values. The order of the
+                      channel resource unit settings is RU26, RU52, RU106,
+                      RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
+                    minItems: 1
+                    maxItems: 7
+                    items:
+                      minItems: 11
+                      maxItems: 11
+
+                  paths-ru-bf:
+                    $ref: /schemas/types.yaml#/definitions/uint8-matrix
+                    description:
+                      Sets of half-dBm backoff (beamforming) values for 802.11ax
+                      rates for 1T1ss (aka 1 transmitting antenna with 1 spacial
+                      stream), 2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss,
+                      4T3ss and 4T4ss.
+                      Each set starts with the number of channel bandwidth or
+                      resource unit settings for which the rate set applies,
+                      followed by 10 power limit values. The order of the
+                      channel resource unit settings is RU26, RU52, RU106,
+                      RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
+                    minItems: 1
+                    maxItems: 7
+                    items:
+                      minItems: 11
+                      maxItems: 11
+
                   txs-delta:
                     $ref: /schemas/types.yaml#/definitions/uint32-array
                     description:

-- 
2.47.3


