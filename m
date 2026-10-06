Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D507CA6006
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 20:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7d8+d8Jg6e4zgR7b55B5I4HUSkrjz23uBlGgAf5rGA=; b=tfN4Fwywc6dFRIY7l29YznTIYk
	tRxISbp1FZPR1kWxtv5kEg4SJ8tUvBn6W9D5VnN1tiufKN1lGcUeWZ/umMsrox+OJUkq6vSVeD0Vi
	6Q30t9IZSt3LfFBg0DEy5nsDrVxCfOShMMvPvZqRQk/5iF5X9DGFIG+O5M4FqckCReGMm7/2sMb31
	9BEOFloy4WZj54fNtl24S/rgknWv9hCAeCds/jYI2i3GmZcfiAOtR5ZaFzsW+mNCrHl4eKoRMRaz8
	WefQxRQlVUX9TERwY4a2WnEj+Ys2pLoZG01yKrCEe1HMkot0x0WqYxLqVr48ZjCCC7Z7ZwDFc018E
	85IdVeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjP-00000001MMk-3Ej1;
	Tue, 06 Oct 2026 20:25:47 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjM-00000001ML9-2whD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 20:25:46 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6dd4f3f696aso518397eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 13:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318344; x=1791923144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7d8+d8Jg6e4zgR7b55B5I4HUSkrjz23uBlGgAf5rGA=;
        b=ahWTMuqDOYu/NAOs+1m8dBwTk+gBJIJhRQaNOkGTTJEb1Uojqz/VKRRO6Wt5+FV4P4
         k9dU5rlJqkcWCsJP4CBvyk58Uhct0Ev0MYP1yza6vv+8QwV30RXTeANF+nXk6TDKsMvx
         ymyCl+bZAOGxwkYLFkmciGeIyGLRH7JbewHAyakSX9SxdrRe9kGuhp+++Xuf6ZYLYhiO
         8HlroZ+5ENgDjg79lboUzA1HE+tlsLqS5/6umB5d7VOKF3rEOpyNn6aEfKc01G+1rdYr
         v/5RTHhTPtm5mPezMVR7PGO0I/MVlGHCmiad1V0gJo1hRb4qCiuT7bhQrhAOouNBK4q8
         eHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318344; x=1791923144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7d8+d8Jg6e4zgR7b55B5I4HUSkrjz23uBlGgAf5rGA=;
        b=qdRuspTuMkmdRdjYggMF44Im1Hsci/UF9KgrV6ThnfwQKOPMKXQUjh6rbwG2Ze1mBB
         vAbrx3GtBrnmLKomOs1mOxJhBv7cl0DGJ1cnwB3AfG3pF3jvd3VIotnDhUO286Iw3bw7
         w4Bceuwi4XQNwT/jNyg0psx8g6h7y5uv+EJE8i+jWSzYhfAKaplejKMQhYi1Aai3xjGI
         Wb5sWmL6mXx/sYARpsZfIgqRjBk2Rc4W5puLOwiRMhcc4OemLuHLswbW9ZfT9GjuSE38
         j/SNxUgQNJataqzF2iNtVPVWEpCTCaQflpv20seQxGp4HLYyJPE+uUl2u6yp0YiqN1A8
         qSFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6Kso456d4Ir2I1yaa2o6AlPacA4TO6c0j0enWgJsYPGgUQ5tfDojDLwurZ0PIz57ERak5tSEwTSmjnSQcYRJ7@lists.infradead.org
X-Gm-Message-State: AFuF++kKOprEZJw5RdZFjw0SeFqf1aqABpnyyc3w6fyOqW8UJokyRr7z
	nC2Klv98aFCj7YIhggKo1WCB6K0FwKgRf+ZAPeZ6XD2LQFL56Hsqs6RkYuBYMgXE33g=
X-Gm-Gg: AYBFou3/bhHvYsyFWsURYH/VcGQaR6Iz9BEbckw4sxMrm/ZytLFxjscQeX1U14/hgXH
	Xn4XLfqPfaKvl2eqIccrgR+OSjY6FSWU0X2MqGGaUjoceuv4nvcTthvsR1OUdKuF1R9Zo04c1NF
	RHlM/O1kn3VH//qfa+IO9l3tAIAdDH4FGWjwRYsA0hPoCp/5xm6+n4omOK0mz2SQP94GwvD73lQ
	WsOyT0zDNbOLcUVJMQYFhAid5tCdFS5sB+KyJyuaye/ZOayITNHdR78Q6UHKx77pFqMhKZUb4tp
	ukOSDT0uMGNA1r1dCZh1LOirNqAwSQoPmoWwyi9J7QFycYArFdHVAG06494L0L2MFi0phvTCM6j
	yVcC1hTkIShfgju96vwFFAjinzjGU/ZtbebCcnZiQeFwHc09qZN2rYsfRYIHRE8yOpINtuWfesw
	/l0HiXUn9yHssH1j/GtSQziUJzpfTtvyz1NFdI/3eZbYIN+JKdio6btQhatKRDG5AdgnOwvYvb9
	as=
X-Received: by 2002:a05:6820:c89:b0:6e0:8fc2:84a3 with SMTP id 006d021491bc7-6e7a9125036mr295388eaf.39.1791318343680;
        Tue, 06 Oct 2026 13:25:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:43 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:01 -0500
Subject: [PATCH 1/4] dt-bindings: display: panel: himax,hx8279: add
 vddp-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-1-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=+6mowQPvO5/qbWu07+JM4tpqCNNR0Oy6FVUyr6NCfh4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVklqqKz9ZZ5EYTPs3b/ghtQnZoefwxQSM+W0
 GisMCHkGeSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZJQAKCRDCzCAB/wGP
 wOHSCACcvVmVgg5xUxBOP/pHIgPMZ2Lhcfg4VZwwLRNcQLQE+uS/SQ4GV4kNd5pon4GVAyGLWMA
 hluJJJ+r7f4HXO+LMEXHe4siAm4FrOxhHWzzfvdZbpAes5TzM2ZzBI35cytFG01QQjODNLk31Ju
 ok2s6QEW3pyKLzVkkCJX1n4NCk4D0Tpcxu+wDjeWatZ49EPobpXz/MDhRyCL5eucimvRxWQkN+c
 q+XA6vMhr3/TSrVZwvozFK8v9/O75FHHxwIqe3DrzkJYxxRzxfNfE1s3Vh2BidaQN4hdgc0/qc3
 88m33Uam4PLXxnMeUHzrcdShGxwdILR/UCB3o87IYotFEd3M
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_132544_776256_54DD9636 
X-CRM114-Status: GOOD (  13.78  )
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

Add a vddp-supply property and make it required for the Startek
KD070FHFID078 panel.

The Startek KD070FHFID078 panel has a separate VDDP power input, which
feeds its DC-DC converter, in addition to VDD and IOVCC. On the MediaTek
Genio 520 and 720 EVKs, VDDP is switched by its own GPIO-controlled
regulator, and on the Genio 1200 EVK it comes from its own PMIC LDO.
In both cases it is separate from the other two supplies, so it needs to
be described to power the panel.

Making it required means existing device trees with this panel without
it no longer validate. This is ok since the Linux driver will still work
with them because the regulator core uses a dummy regulator for any
missing supply. And anyone who sees the warning about the missing
supply should add it to their device tree.

It stays optional for the Aoly SL101PM1794FOG-V15 panel, as it is not
known whether that panel has a VDDP input.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 .../devicetree/bindings/display/panel/himax,hx8279.yaml     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
index f619aea82bdf..c79056c39037 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
@@ -37,6 +37,9 @@ properties:
   vdd-supply:
     description: Panel power supply
 
+  vddp-supply:
+    description: Panel DC-DC converter power supply (VDDP)
+
 required:
   - compatible
   - reg
@@ -45,6 +48,15 @@ required:
   - iovcc-supply
   - vdd-supply
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: startek,kd070fhfid078
+then:
+  required:
+    - vddp-supply
+
 unevaluatedProperties: false
 
 examples:
@@ -63,6 +75,7 @@ examples:
             reset-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
             iovcc-supply = <&vreg_lcm_vio>;
             vdd-supply = <&vreg_lcm_vdd>;
+            vddp-supply = <&vreg_lcm_vddp>;
 
             port {
                 panel_in: endpoint {

-- 
2.53.0


