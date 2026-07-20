Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D45C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dEo1zfdAxyxkmckxTePHzZtAsHT/hlKIP/V7KkMgw7A=; b=Mypvbb92grLUXT2LnjY9WP/HPb
	79RjnyLyj1rOsgwdMG4UC6XXwZXQDV97VwuW1Z+A7xwmJjCkcb+vFHPwnw0vh4DnDB/45SaHoWLn2
	QI6JbabhIveYj9JhNZskKbFxfAHr4WAETIYMVQBehoSygj0g6NyeH8kmZQa+4ao5/PvnQ0bd9DMNs
	U0tXQJNNr6ThHObFtJxVLRLisI3AmtGSnLJ5NL1iyDMfgrbCd4deYsFDQaMPLkwN83WDl2jHCI4Jw
	+TxYPogjxaAW9jOEEs5ljjm3HQW40rek2256cu3+vvRy/T1K+5ErLAyASyT/rhQ6u4bS50hjkrbwi
	Y/09bLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkBz-00000006I9z-2iIN;
	Mon, 20 Jul 2026 09:21:43 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkBw-00000006I8e-3CYm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:21:42 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so57676875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784539299; x=1785144099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEo1zfdAxyxkmckxTePHzZtAsHT/hlKIP/V7KkMgw7A=;
        b=dcI/oyYxqNRimBCjEDeWa82vXHOMgxs7TX97uuoQDRyxFHhq6GxjpOzHISh7mFHxYT
         TBAFBGhB3Eot66G6AbvG4lutcgiI8Vmym4iKBMSsQp0R4+8jeAu9bjPIq676ZeVlNtU0
         +hydMbgqWKk/bu/C3ok2yOGUqXVhCnNHReFoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539299; x=1785144099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEo1zfdAxyxkmckxTePHzZtAsHT/hlKIP/V7KkMgw7A=;
        b=fuWcKCyajQBYQc7kbDXJuxtkE3digeeLSIXb8V9NIXhEYU7XuE2ZGa8pxOBJ0PDTmj
         qlHJlL0SNky0aYaYwa+H9Q1OYnkeuZ24wgrbQUW1NXCfqyuBvbZaF61+tOXYFxyt08Zm
         pEUWmEy38blGkZj9FYa+VM6Cd9T8dARs8ND3uU4TokJxfje6iPxpCsmS2vQrm+RJoA4u
         10klGgh3B8w2sTLfU5Y7bL/RsiZ04SPn5fE2l+F0OY/YKmhHdHZfJwktPO+9w701Rvkv
         ZjHeOXqQk8zsWO1Ah6xD82XQ8X3n5sebaR2RsCYeDBZVpr/GY6xXs+ewYyDWRLtrO5d8
         fzsw==
X-Forwarded-Encrypted: i=1; AHgh+RpgGwAVakv4DKgAbl0UWgwVuu8uRn9+PwZsRhm2gwyB6pya0kbgKlTEai5ACFz2P3V0hMzCFCTc3UarxNqYVJfW@lists.infradead.org
X-Gm-Message-State: AOJu0YyqplD4sU3bRsGm/ga81WkEgLq4O+yJB7jckJWDc+67shmuA4f+
	hW3Y4fd8fZbrSnfV2iCuWvsxg8RC/PT/kgWhYipFmVqv8kmCWY02ncnQsluBFhWiDQ==
X-Gm-Gg: AfdE7cnO1tsHQPS5cfIRjs3beNh/70FBiIZ1T+DobFFTJl3m4RU+Fy8KQZMovz0ffUb
	YStJoP1XxkOF9krTNN6acDElsJkc8pu6GWP0JdeleJVhX45mFqlQluDpRdFDgkAWW8BR8sbk9dT
	LCBjtlXhhnfF7UmGeGEidKcYZ6A4y0cG87W+st9kt8mQnZRj6XDvBZEcS5jDhf7OquWzDQIfxu8
	saXhLQYKKQJ5zuG/Wa+w4lmb4k2mvVfUMatSAOb03hRSP209l0Y2VtU5BQkPwEpV5C8iH9JlnSG
	O7wS2pNeU1vjesINcoj+EeYLrRmtmCL7UGMYvZ01T3WkqzRwtq914l3WXryUBT0jcqkRBW3CIw7
	0GkXc4yGfBUExNHAMVnyG1kQlP6yzWr2u4UP5BMT57ajSjRb3c1bsoSnMlPQuuarrTXBZAJNOlB
	LSVWAO3ItDQi8pm2RpjCzN/MnpVQG65zBMG58n1eF9inarTM77DCm7+wIpw+tYu9UY4XzTBg==
X-Received: by 2002:a17:902:e80e:b0:2cc:8267:31b5 with SMTP id d9443c01a7336-2cf3489a830mr141008405ad.19.1784539299565;
        Mon, 20 Jul 2026 02:21:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344be458sm53775345ad.25.2026.07.20.02.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:21:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH RESEND] dt-bindings: PCI: mediatek-gen3: Allow memory-region for restricted DMA buffer
Date: Mon, 20 Jul 2026 17:21:15 +0800
Message-ID: <20260720092116.1823562-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_022140_801753_6A271DED 
X-CRM114-Status: GOOD (  13.10  )
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

On some SoCs without an IOMMU behind the PCIe controller, the PCIe
controller memory access could be limited to a small region by the
firmware configuring a memory protection unit. This memory region
must be assigned to the PCIe controller so that the OS knows to
use that region. Otherwise PCIe devices would not work properly.

Allow the memory-region property with one item pointing to a
restricted DMA buffer.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Can we get this merged for v7.2? A matching device tree change was
already merged in v7.2-rc1.


 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index fbc0378392d4..b88717dec1fa 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -116,6 +116,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description: phandle to restricted DMA buffer
+
   mediatek,pbus-csr:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-- 
2.55.0.229.g6434b31f56-goog


