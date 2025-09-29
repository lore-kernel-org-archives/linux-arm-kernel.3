Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB79CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYKIS6AUB4jbN6LRMHpfAVlAKJeZBTFDpfK2oWN9FEQ=; b=PUizZ4rQMUIgCQ7C4vXYJhaGhm
	tdO+TXN8+L+Bki3KbPzMRMRPF0bxkHHS1IzzBN7Kn4qtIy5BlQPUW7fol1JaDg6Q79YnGOJ10l2yh
	78TSnFjNOU6sDI3Vo2GntT2XAUb4JL3FrqdxVKHJYf6QeOmeYFmk3bFboIWeuPGeglvaxw/fkO6YM
	Vb5RQfYxfzQrMlzDIY3wx6uy+SsX4RcK6SGchyT04e3Tz8YdXKihNQP83+wwkdV8LYVZuhpfGZhOo
	337YLOQA50vKF9iT9xdoWpek1tVdYS7e3ia/nv4h0GBWIayMn1sqTGa4Mk2Rs+PqpH9JanMO/xGPo
	xemlDT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNp-00000002ObG-3ZyW;
	Mon, 29 Sep 2025 11:49:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNk-00000002OXS-313K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:49:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46e48d6b95fso19525185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146567; x=1759751367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYKIS6AUB4jbN6LRMHpfAVlAKJeZBTFDpfK2oWN9FEQ=;
        b=H7GTstg0lkiugMuFPHkNJG9/v/nXxkN3IrowTRr41SlIkt92Crnqxxn3Y1No2h3k/s
         DrDxQnkkCyy+vYO06MHE7TkDI/kOTgemnZUQqcz4R0vmlKEdfXiIdm6muye5rrybPfp7
         momq0GWgbRAytfofmYIGO3I4c9NPdicCsLvgQt00oqtvy7GFSCSh6ry2eMtC+OI0CMbS
         wq0Yo3kCjcl+ekMeR8ybDU1Sm7rNDAV1KmKYx1h3SZmaDSyhdf6bgDjqtK9h4ftuuJZ1
         yAIYhF+VH9a1hBO48BlOg99B4Oa+WR1APgzXED0M4SO49O0jqLu3W6TJPjS3NqK9OrlZ
         0Kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146567; x=1759751367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYKIS6AUB4jbN6LRMHpfAVlAKJeZBTFDpfK2oWN9FEQ=;
        b=bl+kOXjhiTRfMakUHAH/nMMiWlaif+xAViePoqN2FTVEc33ORvM61hGrOp2uP3fqd3
         /MeLGI0Rk11A5jSbILXufs+5BqfVK66jVeZhBfG1JzuFAbImG/CXGGWLirqoEODU/Ffm
         1PMeF6zjxbZjLtrkwMQ19XnpSVOldBKKGKmqw+ACmcsGRkGaGgM/ju9t9qeYyA+HNCg8
         cFEvScKCY71ijgrmrafTChmYvK4BLZ8oHNfFHIXErjv3cDL7SRZfbxJa1+oN2rfiJZE3
         ht3HBKuySfWhvEO28t5CCLdj5r0u89yz0vR/IbHV5DjnjE5HrV8waJOOH26QAIjgXzka
         0YMg==
X-Forwarded-Encrypted: i=1; AJvYcCW2wTxTXpWiJU0JWDaY8ZpQKPJgzjCEIEnxt4myhVK2iIZCNSMjK4uXPnuTeGP8k8Ea38aU+g5H5z/74l0mDD/n@lists.infradead.org
X-Gm-Message-State: AOJu0YzWRJEmPcOhix6g+zk6LIx1ZeSRgrE0Jv1rxERujAr2Zwvgizfv
	WjcjdLlRUC7RiXOSEzc60hWoyhqOxsBEWDcflq++vEUKYTioE8ygV4OV
X-Gm-Gg: ASbGncvek9AqIKW23LMRX3s4A+WNwTSdhliHFRozM72W6BkQIoFEu3BS2Cz49pyUUY0
	E4FC170WeqTJtkwHRlLUPzetW0+m67U671caemLOQIEomuPfZerhNh/IXRZVdPL0Yk6zxuP65Pw
	d/4EcuKOxKoLcG5fQ7bm6f3732J7hIW5i+HKqfIcamYNxszbV8okdxksEVxMHU70TniJurqHSrN
	drQDHQmxg8Z9FPElCj7gR3Red9OZIFQnSC0pwIhuITGVvTRhq0bPJcfvoMxXwxT/fHiz9CV4p3D
	WRPp0SdO7uB+g/cE/vBcblLouumKu7p43mKAl/wcQpZQR33nYbK69emFCPYERcn3xuTLhpKMUx0
	keS3hNH48zliwPJcBE7r4v8cdNANm0KZNev54NW9lw0uHa37h7KW4D2pMLPDxpE7QrFIvd0A=
X-Google-Smtp-Source: AGHT+IGuqXMPmewneHZfTKdYco1M53FvKmmiliFcGFMcT7OaxUtdD6+QR3/I0y4H9RP2qzHFLrfHpg==
X-Received: by 2002:a05:600c:468a:b0:46e:4705:4958 with SMTP id 5b1f17b1804b1-46e47054a6fmr69438625e9.30.1759146566851;
        Mon, 29 Sep 2025 04:49:26 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f77956sm10030835e9.20.2025.09.29.04.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:49:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 1/4] dt-bindings: crypto: Add support for Airoha AN7583 SoC
Date: Mon, 29 Sep 2025 13:49:12 +0200
Message-ID: <20250929114917.5501-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929114917.5501-1-ansuelsmth@gmail.com>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_044928_794468_C498AF93 
X-CRM114-Status: GOOD (  11.13  )
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

Add compatible for Airoha AN7583 SoC. The implementation is exactly the
same of Airoha EN7581 hence we add the compatible in addition to EN7581
ones.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/crypto/inside-secure,safexcel-eip93.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
index 997bf9717f9e..2269d78a4a80 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -30,6 +30,10 @@ description: |
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: airoha,an7583-eip93
+          - const: airoha,en7581-eip93
+          - const: inside-secure,safexcel-eip93ies
       - items:
           - const: airoha,en7581-eip93
           - const: inside-secure,safexcel-eip93ies
-- 
2.51.0


