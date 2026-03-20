Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AD41093180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99wvnBqkOMOuTm7m/8LXi4xBzDlTYHcDi1Go4VKhvmw=; b=HuukoZWFzqm1+Cf1645OxXuM77
	VKBA7xYZxDSRd3NmJS0QnYX6gUaJ2CXK0KM5Pe3UOCTuDX7Rnefu8xRwRwKKV2DD72yV3UvDVU5Wx
	1nEGB87eaNrxFJAPzCgsrGRVa3WQERPdSGNysMVOyJzSdmXNtNZEjXuwbFuO8sZJ6C+l2pmJLcjHd
	2d8dsBrpheHCznVySjr8dx0XoVUjnyGzzt1yhROE7w8VhlroaoArHgcpb6sEZZUMXwih971uZnkU5
	pU7cpQ2ItUhEhvLeWJ99XYCVgs+bWzyiWrel4/poR9ldHRQsp8l1atDjlI04Ws2GCjAF+FbTAFzh2
	P0Td64EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UEB-0000000CFY2-2R0Y;
	Fri, 20 Mar 2026 07:25:03 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UE6-0000000CFSZ-1fI4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 07:25:00 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-829a27414a3so215173b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 00:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991497; x=1774596297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99wvnBqkOMOuTm7m/8LXi4xBzDlTYHcDi1Go4VKhvmw=;
        b=eGmuozuThsdfiXxIGzAnIbAMRxxwfw69q4mfxf4J+RCgO4FPogHqY0gEFnZFxv8oBv
         T8SyzlsWz2/g7kic1Mh25Y+lNHBI2Tb/hM+tw0CYrrub9iHHBtqWJ3WGqbF8p/rZfy2p
         cD1fy1scSiiwJiNRJMIl7A0ioB2Xhs0Uzs0vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991497; x=1774596297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99wvnBqkOMOuTm7m/8LXi4xBzDlTYHcDi1Go4VKhvmw=;
        b=PY9F90edx7tmrLJBq4QmsGpfZdTXizejyYCAma2a/AkVu1zcHYcnU4eUiQeJo001RS
         bld2mN5iGBtioogbaMnRusuEi3YYScoVYMfJdipCNIwx9zt8xEZ+ThchHVCXPuZW7n0M
         N74WpP08i5MsG77TvfnK8XKux9mqqE+EAA0tFfWPMNrQyMpbTFioZXtgFGvG5G8E9I5y
         8GpP4xTUA/v8nuLy2Sl95qGH+aPhd39oczubzQgE9q/r/F6rHJ6aN/bvNQB4zrLlMben
         aifogVhLf8/h90mdOk+GlR8a/+7+95wP7AMk//MIFKl98JVMzBl4XO8kMACOORhTxJUa
         qnhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhUjEjU7yCls70QVXFhfjjXA5qvYDRsyUfgHnLCc5uLTVGhxJiHk9P8e9G1UtcgrmXYZ5NtMO3/023FNu227VG@lists.infradead.org
X-Gm-Message-State: AOJu0YxemZrad4E96YFywULRL9l8OgeYd2WIFbYa+0BNHmlqTS1RSo1m
	fk3puRbH/neGy6sarOj27FFubU6zd6GI2UtSxwkBZICxG7nu7RjbVSjFJBAjgwS7dA==
X-Gm-Gg: ATEYQzzolyUce+md+EQFBdzYiQNEoUS3QxXZY/NjzGVZO2h2S+ftqgspbhZHV+769E5
	jx+dwBbwVb4TUxOVoLdWehFFdPxZ3oz7jmDZBDG8S9Vs/7o8Rt3heYT+UJ9YutWSHq7OqA0U0Y7
	D2QNO1ejmhvbH27czTCN3l9CLVBuBKE1eXkgAJK5k0jmMy3mxJ67Gfpvhtzy9JiuuQuaEw7v+Ip
	I28OOfOA8NHtIcFObBnf9xtVqoyBVuU0sYjq0joVzaXtSBuXPy4YYW9nKKb4CDmYKFdlHNe/Uzu
	UYZA+8y2X6jl/OtyYHUf2HAxnhGo2WPnjQaUQbK31mHMRNLp45BFHuTSt9gnPQRS9K7aUcSzmCL
	DKUUj+BCzS771Kqwg413le+eeHydAj9rJ/xyYa7eA629nq6ip2N+IJC/gApW57qw31l6VAPZAN1
	a73aowS68s39xZc1tnnlRRPzMKYDjO6TN8b96xcelH/tQrmy+7ddRc/4VN+AxXIfgWBi/WsP5Be
	gKrCygI
X-Received: by 2002:a05:6a00:13a9:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-82a8c2804cfmr1615737b3a.15.1773991497498;
        Fri, 20 Mar 2026 00:24:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04222f42sm1452447b3a.61.2026.03.20.00.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:24:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/5] regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
Date: Fri, 20 Mar 2026 15:24:34 +0800
Message-ID: <20260320072440.2403318-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320072440.2403318-1-wenst@chromium.org>
References: <20260320072440.2403318-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002458_447549_3F685C22 
X-CRM114-Status: UNSURE (   9.26  )
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

The name of the regulator should match what the board design specifies
for the power rail. There should be no limitations on what the name can
be, and they definitely don't always the PMIC's own names.

Drop the restrictions on regulator-name.

Fixes: 8771456635d5 ("dt-bindings: regulator: Add document for MT6359 regulator")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6359-regulator.yaml  | 43 -------------------
 1 file changed, 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index fe4ac9350ba0..ac925334ae83 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -18,84 +18,41 @@ patternProperties:
   "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
-
     unevaluatedProperties: false
 
   "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
-
     unevaluatedProperties: false
 
   "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(fe|bif|io)28$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(fe|bif|io)28$"
-
     unevaluatedProperties: false
 
   "^ldo_v(aud|io|aux|rf|m)18$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(aud|io|aux|rf|m)18$"
-
     unevaluatedProperties: false
 
   "^ldo_vsim[12]$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsim[12]$"
-
-    required:
-      - regulator-name
-
     unevaluatedProperties: false
 
 additionalProperties: false
-- 
2.53.0.959.g497ff81fa9-goog


