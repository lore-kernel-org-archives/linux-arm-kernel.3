Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021FDCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qm9QBhEQ0YB2AXes3jM+Kp4ITvGr2+JfvL/tfEuQ2tI=; b=CfU42qiJC8BvSXCIFD3vd9DWUr
	8FRn3j/YdzWYe8TKLedLfP15O3s36S6x8PI5QPGQDUmhPrmnC7GczTFhDH/egC2ufrIZ7VPxw5/aR
	8bGyozt7knVUNDKAJ7UONejIchar5za0VOoX27pOI0gWqFEuY7SE8E1mJT5CijNnp4xeIZp/wQhDl
	m88JbMcBaWCPDsQIwYWOPcag9tuzt16CnqBLDQNL+YSOEdYg22v8/yzfjGCq+Um/UqL8bFz7obxh1
	h2sE7veHPOw+jxcQ8ZdJ6V2nmoUHb/y0EqKX6D9Z912xHG4L49pdih1OP7wMepN/zjrFcogjSw3R/
	Uz1HvAOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1di-00000006O2M-44DJ;
	Tue, 23 Jun 2026 13:58:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1dg-00000006O1L-3Gpg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 13:58:09 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4908b92904fso80758745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 06:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782223086; x=1782827886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qm9QBhEQ0YB2AXes3jM+Kp4ITvGr2+JfvL/tfEuQ2tI=;
        b=j3g3hqiONa7DsLffh1cx5ZFSed6f+K6r+P/ildEyyhMyP5QdV52XVYXVazfLRYnmrS
         PimThzWpKsSvOxDwKKXEb81zjcj8+qvi9do5IpY0v8/JHYSgmRboaPNoH/QQPXvfRMgK
         tSLGCnpzHsqhjwGvVdoNF7Mo25IkLy3PCJ98xrQPsiNwjJUYJ88BPIm7jOrBHC9q7Izx
         Aw/j0Kc59msvPkUCoxDq9JGOTEHx8S6dmkPfK2s3sYGWmVl8mqNikiUiJGJgT0tPrwBI
         TYl3319wEjPr+gaqI0HTBG9hxX1jDcRUN8/wg/xPJVFneAgibGfZUdEbdNmwT6y3h52A
         4Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782223086; x=1782827886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm9QBhEQ0YB2AXes3jM+Kp4ITvGr2+JfvL/tfEuQ2tI=;
        b=FddwJiqj/LMbxAo8m6t7MlGEE9fHWgvQbn1QzPgoK20or3A5uHxLlnxDbOSapR9did
         genlVEsZvuET4NBB8qFLi+TVhOk9gUfNU7ootyLwpirBgLo4RspTbCH+gdTslshINAK1
         fHeI2Y9xE6vwVqTpMp9vKCmA4a65HqFMAiFLaYfqt3hSFzAszrR73MrJCpeXkzxHNiWF
         o9kU9GqNrkpSj0Gk7pHrmNo0wrKsUPpXsFamVWNGZbDGyWxVN+MVsR0APtmDL4+wlAVb
         wxTnA2dOQuyDtU1xPtTRbzu6QLMqolzhyV0tpky2SSUgQb8Yr9oa1/nDYPs6kZEDG4Rl
         OlUw==
X-Forwarded-Encrypted: i=1; AFNElJ9jw0BT4dbH8LgLf1EIk/hofZUZDdXhlHOqf0vOD+INn50qfog1xVtLX7pzu27ed6kOJdpjcGvdAAPeXBUV+7UC@lists.infradead.org
X-Gm-Message-State: AOJu0YzcPnXTqrrdM7fPLDt0B61GcEPjTsI5cBCj+jklxaloNd3MYr2b
	uv2ANtAIvBtkuKwp3YE1dINdw7Xq3YFyG+CrAl6xCBuvjB7Lf4Is+Xbx
X-Gm-Gg: AfdE7cnhh4f2HQoFRlyk7DZNr5rzB+FIKlA72sf1ztDH1OAS/3lZw79+YmoWcwufJQ5
	HS8g04eGIoCQR3ex7puzKaYEqmZ0QrH+ZmLO7d7iz62Wd98pI1m9/qqQJGFdQM+3oMNdnBwDVqV
	WuAVsybKi96AUlhGqaOjvrd8rALc+Zca3oDHJ2v4WN0UQ52+LctaegMeKb+3ofoGitduHsoSCNq
	fqMFENgJ8kPBNxUBTABxNOiHn/0AooHgXX5x3pet2AneFDGcqUWgWqtXRVIIodyYl7M1v+fhcTA
	NiuTa6OYWRGTjvme4OP1Q/EduLxiyGsvPNUxJ+GQ/sAk7DLu3tnevetgvNQbbTtLNutyX8rEP+Z
	YcM4jWAOsUvncJA7Ti7qkp9sCB7oChBlm2fa4WGbz3Z5+4K23ASdmmJwGqnCsDS76SW8lYcSE79
	17uR2PHA==
X-Received: by 2002:a05:600c:3110:b0:492:463d:b2af with SMTP id 5b1f17b1804b1-4925b38ca04mr38947105e9.31.1782223086132;
        Tue, 23 Jun 2026 06:58:06 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f56aasm35145716f8f.6.2026.06.23.06.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:58:05 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: mediatek: cec: Correct the compatibles for mt7623-mt8167
Date: Tue, 23 Jun 2026 15:57:53 +0200
Message-ID: <20260623135757.5111-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_065808_836125_6A487183 
X-CRM114-Status: GOOD (  10.40  )
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

The HDMI CEC driver for both mt7623 and mt8167 is actually the same as
mt8173-cec and the mt7623n.dtsi board include file already uses mt8173-cec
compatible as a fallback, but the documentation lists them as separate
entries. Correct the binding by adding the correct fallback.

This change fixes a dtbs_check error.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/display/mediatek/mediatek,cec.yaml       | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
index 080cf321209e..4d741ba415e8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
@@ -15,10 +15,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7623-cec
-      - mediatek,mt8167-cec
-      - mediatek,mt8173-cec
+    oneOf:
+      - const: mediatek,mt8173-cec
+      - items:
+        - enum:
+          - mediatek,mt7623-cec
+          - mediatek,mt8167-cec
+        - const: mediatek,mt8173-cec
 
   reg:
     maxItems: 1
-- 
2.43.0


