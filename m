Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB00E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VFkSGyCgykSC5OiEZAY9YZlDtzKCaFVTljqXIH3rhhQ=; b=TXDNBcf9fc+LYIWq9iEFRXHawp
	z9ikUMGPX50OSPNYkUz6ykI1YXFYAyzxRVwGAvX3q1xku26zZRbcbDyMo3nTli0+VOz01c9paErgY
	x49Vxgij9/FeQByhbRvWJIgAtLt7G6J8ww5+vtwNtTMhA6qOscJeXKsAZ8G03JZQlXZEdrszJ8oZ1
	iBw9cUHh7UmDH3VJSMY8lu2BUUeSj9F3YaQPBDj/62ZqO8FQNILZgEYqPJtR4bhyKs8H7m6+in9ft
	3CBQSwKnUvNWrOD+fqnnenuA+W/71f3g/JCUi6CucGejDDju40SvhA4FTJ+ufu5CUoMoSUeKQp1D5
	yTprENBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdxI-0000000CbdL-26mR;
	Fri, 03 Jan 2025 09:26:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdtr-0000000Cb6X-1pji
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 09:23:24 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-216401de828so156744515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 01:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1735896202; x=1736501002; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFkSGyCgykSC5OiEZAY9YZlDtzKCaFVTljqXIH3rhhQ=;
        b=AHc4mUbvD1stoYSXP3KXoW6IsumcIbURcUXm2+lkRE+RLLG5SZygHPYGhd875PpeI0
         /TbfYTUOJBaVteMPQxe0YQt0tzhk5t8q6uP5aDzXjsQIELwko9P011+6Ommr7JVrRNI+
         b4xavPM/Ec0jpBYMaVRDF0PzYi8IZtPbWf8UMa4sbZ4+KIQ0+dhZ9qSF5kEyVaMglJc/
         eNVW9Z/SWJkKzDUIn92PsYPzB7qig5UibXDHehsQC3+u5FoEV9dEYOpdzhHrPta7MENQ
         ol/Vp72/NzlXy1f7ZL6cbCMt3+/tz1h4n+JwCkKbSRtQyHEOXEHUDdCusvfH6hodH03J
         oKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896202; x=1736501002;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFkSGyCgykSC5OiEZAY9YZlDtzKCaFVTljqXIH3rhhQ=;
        b=BwAMatFSlJZHkZObHa+rVwHKaj5f3dNjx+Ukm1dSiO1trQte0gFRCinD6KdUyZTjz5
         NuwUUVbZPUzpKMqP6DpYRmazLIcaxT/CuzxatY7YlIjzwdxYxyonyvwjq65FYfhJVGLr
         Mhytt7Tqa4CgneZk6nI0V6qPRZJdRWmyzyaDh4Y6hVh+yTujkS4ETRnr8E0YgRIJfHto
         5P5Nk36VtIGjTy6L8f2R5IZbSD/yks4PXkv0byiV9wg/43iwmNPITfweCKvRhwsRUZtc
         oZGmsuFcr9OeDn5cfAhIKujtWSPYMeCYABXcLp7eNYfdCoWUJVlJpILQeogqtnXAVHJf
         WfGg==
X-Forwarded-Encrypted: i=1; AJvYcCVPcSCwhI78kqweIG8NRX/ZaXBLl/V7R8PU3LuKhl4XHs6te407M+jzsk/nKyluyKq0Ma0BzpCYKnP8vqGU2Zq7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx70mpmPRegah4O8gF/04HYROona+gv4xWovVNoAHslOOiA/0OD
	ksDjpvk9mzsEMciOZZWCwG9RvE7QXQoIyztJVFkKQpd5SHvXvNjCYsJjrpnaTNg=
X-Gm-Gg: ASbGncu4vJH8YlVs4yhkyevCCxTshCWpEwUQhunqNxei/eQQjpIO49qVJUvHOdyc4qu
	Ar0aYqY5nhGgkQ8zJxidvxVxQD4IE8Jd5R4yISgwUJ3wBKd0EKZaoI/jAqPZSImZZisY4hVmmp6
	Qa3StoeQQTVauT7yaRuldCgkwZaWZsIZUlQozdY/zgaqXM6r7eoBu/jS7TvFCGycBEjp6KMqlP8
	c2PyG7bptDtv9lCD+2tmAuDcChG/H5J+YtTZzzFWN++HOASiL6yZ5+hkQRaQGWEOdIz6/Yh8JMw
	YMU9IFUBERrnonthq1bhLMu1VUijfvno3iuW4I6A4X0jJcjcpFSqUh0gywX/Poj0zcHjUrQ16nG
	127+bh7uDK7Lb2E3A
X-Google-Smtp-Source: AGHT+IEnZKKebuabwrL995yGg4GRRyQw7Q+1H1NtZOkoQn4B6vDV5xv+vAG3ASFFqKYXfzHyLA+94Q==
X-Received: by 2002:a05:6a20:2443:b0:1e1:ace6:c98 with SMTP id adf61e73a8af0-1e5e081cb7dmr79088381637.43.1735896202223;
        Fri, 03 Jan 2025 01:23:22 -0800 (PST)
Received: from [127.0.1.1] (2001-b400-e203-a4ff-54cb-33de-dc32-ee26.emome-ip6.hinet.net. [2001:b400:e203:a4ff:54cb:33de:dc32:ee26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad836b90sm25920870b3a.72.2025.01.03.01.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:23:21 -0800 (PST)
From: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
Date: Fri, 03 Jan 2025 17:23:06 +0800
Subject: [PATCH] dt-bindings: arm: mediatek: Add MT8186 Skitty Chromebooks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-b4-add_mt8186_skitty-v1-1-96ac770842d8@pegatron.corp-partner.google.com>
X-B4-Tracking: v=1; b=H4sIAHmsd2cC/x3MTQqAIBBA4avErBPUSqyrRITlWEP0g0oU0d2Tl
 t/ivQcCesIATfaAx5MC7VuCyDMYZ7NNyMgmg+Sy4oIXbCiZsbZfoxZa9WGhGG/mkJdWq6KqpYO
 UHh4dXf+27d73AwitZc5mAAAA
X-Change-ID: 20250103-b4-add_mt8186_skitty-fe04d863592f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 herbert1_wu@pegatron.corp-partner.google.com, 
 Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735896197; l=1486;
 i=geoffrey_chien@pegatron.corp-partner.google.com; s=20241216;
 h=from:subject:message-id; bh=HzsCZIYPQLN3rAhPo+FvZIU1phcYLS/kN+/o6gpGYeQ=;
 b=olJZOewFQWoF5LLhRDRPvCLVP7JbvxWk4SLZyYu089uODsS9kNuNclDZO33vFQwZaccBb7JiI
 qGNpn2GSqEUAGzjFGhoXCtnD6NTGgPOJmd9TIfubjivajy+K/hyoElK
X-Developer-Key: i=geoffrey_chien@pegatron.corp-partner.google.com; a=ed25519;
 pk=P8X+ifKsuR9w8T8cIa35nudXKmZX6qk0iS+5EcuwtrU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_012323_755664_A37DC28F 
X-CRM114-Status: UNSURE (   9.57  )
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

Add an entry for the MT8186 based Skitty Chromebooks, also known as the
HP Chromebook G1m 11 inch. The device is a clamshell laptop with an
optional touchscreen or keyboard.

Signed-off-by: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d9aadb7b77e144a474b79da005056..b57e86946d7565720fdee31b2bbef288b0508769 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -263,6 +263,14 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Skitty (HP Chromebook G1m 11 inch)
+        items:
+          - const: google,skitty-sku1
+          - const: google,skitty-sku2
+          - const: google,skitty-sku3
+          - const: google,skitty-sku4
+          - const: google,skitty
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:

---
base-commit: 0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
change-id: 20250103-b4-add_mt8186_skitty-fe04d863592f

Best regards,
-- 
Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>


