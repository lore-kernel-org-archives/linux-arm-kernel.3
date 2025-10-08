Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB624CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l0Mgl8edq5RLxNSk2dSPCx05BkpJ5f+Ni5BOyoikFEM=; b=UoQnUAe0XSi4aDC6JlILi3y+Gs
	h3xWF3RWb0iZJ+pJS65KSjpK/ehdvQdsmBZSZX2nBmyxqzZBWJsHx0f9WywMcJkPUGuzBUeV0ON5c
	71cYpg4BdnVkaKceafzEIEIVptO7ic2AKqzScPzMwWCjlix7bfvk7oMp2/nBxgbaijGPdi1P/HOEc
	i2+VSvlZFqMkphcyNfc6/ZgUIsIyarz35pF2I0+47FVd0Vxz50qEwQmbpGNc1JHCq2SowFMfMqFcY
	wSQJ0t2gvI28zuqywamhJbftPbKl0xbphfxgJ2nfsldKn0cX6+E3DtGcb4uYMHBGg8kWEIL+CPE2/
	wZxTVdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6UzP-000000041Wh-0Mxg;
	Wed, 08 Oct 2025 14:17:59 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6UzM-000000041WJ-1Jvw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 14:17:57 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b4539dddd99so1171335066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759933074; x=1760537874; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0Mgl8edq5RLxNSk2dSPCx05BkpJ5f+Ni5BOyoikFEM=;
        b=YEh3u54kH/sGKyQLY//Ke95WJc70jhB2cPMKncuGZBcRfEP7UBAk6Ax3N4g4nj/YDa
         NUSPiXqyKZenajSPYn5vChkNJbt+cZLKE7pDLAcSiAMHvfC+w5f+aLw5K6pHYQ5J2JlG
         8CDHdvi6g3u5cnO9GyCfmUQKXtWvzZimIehy/IP8KuaYl603LYla0oolMYUGhCFNaqG7
         05Rsg9BFFOtQ5OrG+nv2JH4NxlJzlscH/2CNvAA48mzEoAoP79hd9CzfJXTblSa8n4Ew
         9tysIA45hsvM+uRc6mr7miQCSyFFPfKDzKW5rN3RSeLD7qANYIPNIiim5c8RQejxMOgV
         9BfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759933074; x=1760537874;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0Mgl8edq5RLxNSk2dSPCx05BkpJ5f+Ni5BOyoikFEM=;
        b=gN8iBJpOS+9PTqOp8g7wNd//WKBFdQL7vbFtxV0NmtNZ44cLYzb11nbQbEs/hWwYUb
         VkDNxJL5LJklhNDdTd9KUHIipAxZt/eHsOjHGVY0qiF+xkI0tXN2zr6gcQJdxDB5VaH/
         xSNs2Pvu7iuQALjjumxWnHyOL5UzxbSQLaelBVVrFMGUrX167Q9Dl7jE15pR8wKoyaBC
         stRpm4qpKc8OimeIEUy2MrIgISFd1bQctRMtmQ74qFkSX2W4MAW5Z1nKY5oreUBgsXQD
         xDoAAVofdZy33LptAg3p3QA97624+EKEItXuTU0yemex2kMcSjmvlC3qzXxtePd1ta9O
         Xmyw==
X-Forwarded-Encrypted: i=1; AJvYcCU20W8rV8Syc1uaM0tXlfgS8kis5aLs54r+EVG4+hdaFppFHwlgvmKsG8XhqLkfLdTOm+/FX4GoYs6gc9wd2x5V@lists.infradead.org
X-Gm-Message-State: AOJu0YwmdQXM6bUIdXWbul1OUi1OQmHq3wChVywFgbUnoYxXrQNrlSoC
	ArF1GF6DgD2U4FkIEcXYZI7yJEoMMWwFpBDRji1zHN7tyzdjXUY9h56Ze9GWdIMdptw=
X-Gm-Gg: ASbGncuEqIe/yTlKf+Zf1uWw1FsO/c1kyCj56/sRVDbdls/H3WICS+sOFs4A6PHV+Pj
	gpKM3vxmjlt13t1xqbpBBwYX9G3Bl6OB4Xowo4iyPhW8FFbFQmy2IEMf5rm8+zya2ibL9aFXFb5
	avZ3E8dZfWnpuKVdCWY+kPohwrdw8zXJZEB3/R1r32m8i4+7MQf3c+PnzVniPUMK0yAPYbXvt0K
	VaovJSJwCs1n/TiCkxM5asLurbRNldO24KfSjGwvCW/sKeGnNKixUQNXZvxZHLksCHtAmpPdKo4
	8aSQ3M0jM7CmvNmlzKz85ghgTThshj80e1yd1+xRohWHpiUEgFLTRQKckVvSufhLSA6Bzak5B1C
	Q3iLCKVvlg0Lw36pcQBxYq3kde0nO4s6YPYDNfG0DkaZLnL3UDZRUceog9vC4zSj0tJIZaHeIkE
	fMAhDuxa8qli8z2L8fk96JIGj+rrobG7ehGFnfU9rJ
X-Google-Smtp-Source: AGHT+IEC+Khx6oHHPzc66dMG7HFLPgpbH+NvJ4gD7eI0FKThBdRGPlHYqDkbnKuylc90hYn877bNzQ==
X-Received: by 2002:a17:906:794f:b0:b3a:a16e:3db8 with SMTP id a640c23a62f3a-b50aa38733cmr389753666b.20.1759933074280;
        Wed, 08 Oct 2025 07:17:54 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ea1sm1656287366b.16.2025.10.08.07.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:17:53 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 08 Oct 2025 15:17:53 +0100
Subject: [PATCH] dt-bindings: soc: samsung: exynos-sysreg: add
 power-domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251008-power-domains-dt-bindings-soc-samsung-exynos-sysreg-v1-1-ab41c517dec6@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJBy5mgC/x2NMQ7CMAwAv1J5xlISqFD5CmJIYxM81KliCq2q/
 p2I8W6428G4Chvcuh0qf8SkaAN/6iC9omZGocYQXOi9c1ecy5crUpmiqCG9cRQl0WxoJaHFyRb
 NyOumpanNKmfsic6XYfBhdAlaea78lPV/vT+O4wcZQ5+DhQAAAA==
X-Change-ID: 20251007-power-domains-dt-bindings-soc-samsung-exynos-sysreg-5dd349912b0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_071756_550368_6D04652E 
X-CRM114-Status: UNSURE (   8.66  )
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

Sysreg can be part of a power domain, so we need to allow the relevant
property 'power-domains'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..c27d9f33d5a0501018aa3a52962a59257b723fa7 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -73,6 +73,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251007-power-domains-dt-bindings-soc-samsung-exynos-sysreg-5dd349912b0c

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


