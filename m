Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF88D116FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4a79qbAhHSz0GVRGOuPPFX29zZ9ssNqofDb2WClFfw=; b=X/OQAQfeypyqLfenBKgFMkXV7B
	ZJDzWkiLu/NXwXXww3bnvutx1Cj4s7RlSYBn6BAWcYUOULjHoA9Bqw7mEH7b9cBgiZW0J0K/7VDPw
	ywiPyqXjrM8q9TSCRSRFwDWrVOpa/G3JyazFDKaJwpn0MQ9+D1lala6h3OQN+lct4EmdJE+USHIoT
	aJEHVmynkPfQohCR4MLXdFpf0YhMmU9FihIskdAx8AIZpexVZTpsdKq0ejotbKkOnzuWdCtTYpHIw
	6JNvJ6kLrv16+Cu+pEp9UDwE/MxHDM9vqD0LLP/ytHc400OwGt6uFTWneOH17LIBnUv+3JMbf6rRY
	hwL6jkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14I-00000003JYd-1Fwe;
	Mon, 01 Dec 2025 10:23:42 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14B-00000003JS9-2Rbm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:23:40 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42e2ba54a6fso468042f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 02:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764584614; x=1765189414; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4a79qbAhHSz0GVRGOuPPFX29zZ9ssNqofDb2WClFfw=;
        b=nZEV9eMoOv/fObas80t1io7amVWJufXYw7oz6YA9qt2s5U1T+rzmAPrQ19o+/RgALK
         BRD8w2xblOhT/geMyAgycYNiPV+eMpcTU6hZxzY8iEi1rjVMAAX5RNto+dK8dhN2XIOT
         L/uaVsC8uDVHW/yTS4VHJ3WhNW6T/KaXTZ3kaXW2Y8cEmZFj8CGcxjZmNQ9NO9JgwX4P
         CTTCxq2CzWo85IRmSgQLayj7W9UVJyj5VYs549/qoC8jES3Jo5cAN1oImoky7in6MKLW
         bM8G8c89FJ19/HGcztYby6npziLgW8tS9kTUcipY5CJQDMO72iVxS+yFL6Ttsj76w1FB
         A02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584614; x=1765189414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o4a79qbAhHSz0GVRGOuPPFX29zZ9ssNqofDb2WClFfw=;
        b=A0zeGhMXBogifWSiXubUkYDh4ORDHBgJSA3KFKKW8O4+2fy7ng56y5Vc0+3gBN+aW9
         7fDb5/jqnR0+O3yRdWlPzu9d7/g2vF7OEYMLVLObsi5GduWxAKrb7bVoJizc+paICOyt
         JDpYm8j80ImiNbVGLXJCXI8MQCjlCfdtYPHHGPhhxHiEvz5H9eB4X1RsbdN3n3IUnMX8
         XhrQbBCFPv56Dm/7MDbKzYqX2jOSJVRxW8jGISFXYe16dF0PymnXsQDMD1aqPSS/g8od
         DoVreRX6ctI3g9oeTqo7aZ91V9Zk+4tCUBL6EZZEzl38RG2RwtCbOYyJLf6Do7SV1/gr
         zjWw==
X-Forwarded-Encrypted: i=1; AJvYcCVao1VseU6IgKHz4Cm4s9VS11yhmcf2U1PUuGp0HicexzfJMTmh+7HKuMgbS/3S8ab4VlP16LnpJF7K9CyYDDkF@lists.infradead.org
X-Gm-Message-State: AOJu0YyiTPlmsuXRxif8XETjzMx+Gh7u+Fa74OcMTtpBGtg+5pvQkGOB
	zVAyFxmygkarBrxtcGkoicvDW+MCiQ7aAel/guPFEwpsUzBxxtY7PDfc
X-Gm-Gg: ASbGnctaH1kdOLNdsS4HVggCaqPX+UCv65cLSm5OpmUN4+lcdpJaP2W/33F9JfGplKy
	FgFUp9zUWo1TpoY1hCWFxuxFDjOHLKk9EPq/a9MArrQpxR0BzfCwSUV0AagF1ZgoLrc3Os4SOWU
	32eVOO3RLaWNiWAWB2Qoz7R0xu4boHh/TH4NAJNBwfQerrvhfldRDR5DM2GpvjQbBPGI+FnYS3W
	NYZTZP0S4Ow4q0bf8/jxlKdc7ZiWRFw9zwo07B9iuin3nHTkaLUEVOxj2KH5AOmHKwXZI1kjRHz
	0id2kulNEmGoCyPMl58Cfyklb64n7MKZydgFqaQzJL9Mf5U54KG6ix39pwtVgHUiVRpQH1PObkg
	237t3gN24b0m5bkrTu7X+Zo3NusfTViSlCCJClHcu4JpsAOMPl3b09DF4h9Zgr7x9WeknNDC3Th
	7iSmTwHIAr6ltevkm18qJ3pxtBlA==
X-Google-Smtp-Source: AGHT+IEvoJmHWGBhQjM5psKaj7CFsvFQ9IZtp2KXdt++ZNs4WoTdza7+ouoOPLPDIL9YaHNygYGdtA==
X-Received: by 2002:a5d:64e6:0:b0:42b:3131:5437 with SMTP id ffacd0b85a97d-42cc1d2e213mr40229023f8f.34.1764584613796;
        Mon, 01 Dec 2025 02:23:33 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c8csm29466439f8f.2.2025.12.01.02.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:23:33 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 01 Dec 2025 11:23:15 +0100
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add Ezurio LLC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-review-v2-1-dc2df44eec7e@gmail.com>
References: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
In-Reply-To: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764584612; l=810;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=sBILIkJb6G+DOCCDeAbWnW+wLLUhfq8ymrsck8EV9Jo=;
 b=N/TCEjh7vDWCZR+tSZvOuJvefgjFJU8DubFOCGtYvMnX0LIupKiqkZKFQFM2O6F2iHf8ZY85J
 fheYbSvw0rfClXGV/sNSTTcBPpI5Jl0CH2cQE49gVhdvAQ1wIdsgNni
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_022335_640709_576F254A 
X-CRM114-Status: GOOD (  10.14  )
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

Ezurio is the new name of Laird Connectivity after it acquired Boundary
Devices.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..e76e6c5be726 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: Exegin Technologies Limited
   "^ezchip,.*":
     description: EZchip Semiconductor
+  "^ezurio,.*":
+    description: Ezurio LLC
   "^facebook,.*":
     description: Facebook
   "^fairchild,.*":

-- 
2.43.0


