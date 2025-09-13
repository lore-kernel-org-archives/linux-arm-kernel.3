Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BF4CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 00:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1c3CBG/NboBfPVJVTzHzXXMWP+/wIvK4O9TlNT+vRDg=; b=TQOxwXQASpPSqDuAzcRwOZ6JUY
	tss0cWJVK+3aH/X5D5As+noAK6uCryzW+oHx9IUZb8aPgztgS3d409qdhXTNi3xzrewjDl/63TbVq
	o3W2b+R1VUJbeOAonzK28aaK8aic0fdBUzCLMmYLc7vv+GA0uiM3Op3pzbE73uSNSZZaCIHTVLOxD
	ZSR6Q8o2Ycn2GSPNXJ1CFtih3WlJXIjfD3ZGX59H3m3iZ2RLULCTqk62+E/ONvngqnCjMIKiGTgOy
	W1WqIeiI0PBE7OoUrfJpcXBcXMhJkMZJuqpTAYKKv8Tk/2hy+nlSEsk5i1+bCYgpILgdYm8eDvqGc
	lmb9Hg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxE1m-0000000CHpA-2Smu;
	Sat, 13 Sep 2025 00:22:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxE1g-0000000CHkt-3Hhl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 00:22:02 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2445806e03cso27791305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 17:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757722920; x=1758327720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1c3CBG/NboBfPVJVTzHzXXMWP+/wIvK4O9TlNT+vRDg=;
        b=Rwd67cPi5GAuuxLMUY409Z+AC9K3fKqwFS8xa1NlWohKU2KR6DxdkTyDhHV2pMbaxg
         TxLZWwEdk7IRYcOXeJ92cbqZ7bPFdRcKgZq/IjKGseIAmd3WQLGUjie6eDWLb/qOLmW2
         mOkGq/3++TK4L2xvbPS6agJ1gMMGXFXqxonX+q8TzJAWijVZWhMG3Wnm/BxGizi5L8TS
         DU22xeQV/2WpxOFRBacoNBiu+Y/kMC+T9w+z5F2IG5B6Sf0M7JS+imP0ocBr5Aa10ngd
         D/njJpy+KiaO4jJtyFTzskcJ7z5XM7XyKldFvf/LTW3j8rflnJHadboAMkxI1x5rA4/0
         LdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757722920; x=1758327720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1c3CBG/NboBfPVJVTzHzXXMWP+/wIvK4O9TlNT+vRDg=;
        b=kD063FnvSM6e6K/As25ckHTiuVRU1lsGapAJhOAuhlGwnerQQcXnNgKykJVebjUzRC
         HrKBi8f4K0glDwaO0Z1BHWRfACwF/KonEcECqWZtjGQmqMWxLSgeb2lKrQj3SQyxH2ET
         UekspKPQcFhWRQzpkxzKb3Vy+BlTCLffyQAYdXspcIRL3zYumljPEJbfj14vS7cWOUgy
         gZ6jUFFR+5bve8ENEImjFL479ueuzUx/ZsMWK8FHEwVQG2l4MnCUYrCwoL4QZF0BLcz+
         GcXkWo0/Ir5C3kd/x1H4x0OOxo3la8wRFDM2jdxrCLoFkrUwG4BRLUc79SQwOUTW6B/M
         f3TQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6hdSog19IXNiOhmh9QkrgD5KhfKIY8pDRu7cA5M/5vZffBNBuROoHphIih7Wuz1a/fjqCidoWzlxs+I5vsoI4@lists.infradead.org
X-Gm-Message-State: AOJu0YzU9ZKa77822dsiHn4rq0CnHxB95/vwPSblAFXAiC7dHjZweR2o
	KpGkxiNrmnXIDVe80zPDrMbxkL0m0nQcWdUfYVq1mvDo1NRguXTBcTuy
X-Gm-Gg: ASbGncupz6Nm+873gkliQHfyTSl8u1CBeY+U/RUd9uZtNHRVWAfJavS+tx1pyZX7Uh0
	jeWvG1Hf6AGYT2sB4ftBGyeVsKlw9/awedSfRHI3IpKN5tFlULUP5Gd2CQR7W+yfIyrabny4d+x
	CxjwVdjp8ew8klvTluKvM1KsV4qgEyGWM30l9uR1lymkf6vluRcTatu3uvFuELnHTLHdXSHY3u0
	oR70BCdXnEQC3FnplJQCF28eJVZiQjX8aZ+nVZb7+fMJckmwp++wwMK/1cqIW4LLJuft/VFDKdb
	dKQIIFp5UNR7D4N9RLg68mR+IuWUGywekrAeG6RHERGROHPMkqMZAQH7sUDe6TIJKJe/TpH1LF4
	QXAXStnZ5oSfGZXJTcQUjZKNsi+5FnT3kpFf6xM4NUulZG/qeiJDd21/jsg/D9W1XhBRB/jfPj4
	uSkPf6jXUKCA==
X-Google-Smtp-Source: AGHT+IF+nK5Fq9ofZfzYEh11WCYZrbZLJT0mADN5dCYbpAjIJMEjmIB/u1gmzzXb0gcqRVsJ1Y5rMg==
X-Received: by 2002:a17:902:f78f:b0:248:79d4:93a9 with SMTP id d9443c01a7336-25d2713422dmr52089335ad.55.1757722920172;
        Fri, 12 Sep 2025 17:22:00 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com. [34.125.3.185])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-25c37294b4fsm59866135ad.34.2025.09.12.17.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 17:21:59 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
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
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
Date: Fri, 12 Sep 2025 17:21:54 -0700
Message-ID: <20250913002155.1163908-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250913002155.1163908-1-olvaffe@gmail.com>
References: <20250913002155.1163908-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_172200_823350_908AD6AC 
X-CRM114-Status: GOOD (  10.71  )
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

MediaTek MT8196 has Mali-G925-Immortalis GPU. panthor drm driver gained
support for it recently.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

---
v2: update commit message
---
 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index a5b4e00217587..7ad5a3ffc5f5c 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt8196-mali
               - rockchip,rk3588-mali
           - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
 
-- 
2.51.0.384.g4c02a37b29-goog


