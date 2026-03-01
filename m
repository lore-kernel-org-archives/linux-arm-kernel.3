Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C8CFD0078
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 17:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7Qvpmm0BSIgSGfKJUy6zw21fbkD+euzZ9GDF4/TlXo=; b=f4nmzgWoNxolQp2CkWfFDZh1Ge
	yGYC1AIcOpdZWH3pYs7DcUdSr7UTp7yiZGCnGmyfHWjY3jHqq4icWTWSXmZ3ZrRl8oJ3sGZRtvOu1
	VFptrkhcTcZo2CMomWcwyCtng1AlberfA1i5SmlualalH3FSu9WsH2/y3R4sSwVoOF+n7LlXF5sYl
	luXUEV82rAcr5I3AWuo+pJTAIfq99H2tO+Jvayewkc6jTM8GgUt3xc3WZStemCOLmJVw4HfPzQeEV
	R0ZEQq7LwOhBhIv1y95JV/B2YMTVrlShrrw0smFGY6knJqFPDAx+OhaLwL2Iucsc+2ljLUS+RPuu+
	PUzXKV6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkwy-0000000BjvV-02aI;
	Sun, 01 Mar 2026 17:51:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkws-0000000BjqO-32yS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 17:51:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2670A44558;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA744C2BC86;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387480;
	bh=53WHfGqqSMrj0Jn3TMtTuxOcR8r6avGv76zZSnG4JUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JScHEKDeJnP87v0I/Jqc035udD/zNgdpn7XvcSUKDkHOnLnqofkWFC6vklzq7tO3j
	 iYgqv8gJO5Yyi4nJfUKzdpNeSmxQAcXgowRgeFS2cs7rfH9gUj2/vzCh+LtnH3tBS3
	 39d9lJ4gr7LtS8oicga7xrfijSFb5VnqpPWuQ9NtCCLizhdnvpqTjFSc5UkJhY6BpA
	 sMxuhnyFMCh+xgEzNOHTRDw5Q29nYlobfR5xn26XgjGWOVe/7Yk2lkH2ktx4r29/Qp
	 KZwxY1mFX3RZHFocQkDssXoJiKakZC+W8Cp7zi5pmNgthkDpbn42KoF/0dTZe5yn73
	 ojcMtijYE5LUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00C1FD0075;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:22 +0100
Subject: [PATCH 08/10] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=hq9RJ0MPDH3qjbBs4V4v4YyIoe73PSNk1u1yb638HiY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyVCoxRU7IViUqu//ep20pNs3plY0LsjQwgQ
 lDE67NHdlWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lQAKCRBgAj/E00kg
 co93D/9PCMgQHcgoRm260zPygFP00u9m2DCOEZSMzuD4dRL4nBeebVnK7tWlZOCUgc1Tk0pyxf0
 QvYfnMkKFpTQwqj+S+Tje/BEeqI2XP77/OW8qTx4pVab7h88y1lo1z1G/T1nGqfnedrn3iQFpG3
 7Unluofdg94QhqjPVx18olmR6T3OuY467B6j2fK5UjZMkv84ndIJF5AUFRiZgNPffoWAWO8v77F
 foYfGO4Biy1VtPIkyozYea9ZDTsO5z2j8Y3x52Eet3bUITLySIvC15ocbPaxT6qroGf9JICPAz6
 NxlnqhAKnBNK9V4sGzHQ/o8aRPoIs2P8svd4WjJyA3eu+CEy1ILbJQ5RTc9Qu2HULTDdtr8wMKo
 3OmhYBpX0bqHjb2HRN3wX7bFVwENH46wM+hAPmhzQUcY0nAywkME7d9GvdcH7SYt/Dd0G5vUz5c
 6XtPfKED2ok1y4wvFZJ9BdnxrK48bXVqUBAp9L4CpwjKtaDu4uRRBtyVZXNUjATH1+W/qmrkjYT
 8K35YL7wyplFX369igIdXYxrGAiEGJhOhE2BQgYikAw/xj1G9D2yixFq+NhH++Ypke1yixmXVVf
 dcvXvW8T3dq8/TUlD8FqLdqHLxOgceK/qlcIqz68odYJdJCKkTjSgpoTp+AbVMDmrHnQZfqQKFA
 hgcL0puDUAOlU4w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_095122_809968_4BE38C95 
X-CRM114-Status: UNSURE (   9.15  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

Introduce more recent STM FTS5 touchscreen support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/input/touchscreen/st,stmfts.yaml           | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 64c4f24ea3dd0..329d89977bdbc 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -19,7 +19,9 @@ allOf:
 
 properties:
   compatible:
-    const: st,stmfts
+    enum:
+      - st,stmfts
+      - st,stmfts5
 
   reg:
     maxItems: 1
@@ -53,6 +55,19 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: st,stmfts5
+    then:
+      properties:
+        switch-gpio:
+          description: Switch between SLPI and AP mode.
+
+      required:
+        - switch-gpio
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>

-- 
2.51.0



