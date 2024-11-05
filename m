Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11628D12670
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nnqa2pPYuuC5Cap6gt5UkBzeNS3a7p0T+6rmPXsBpW4=; b=g84u5PCh58hPDN7OzSB/hoG57Y
	gxFvOmZDyZqXUr3OWOma/NBYbh31sd0XwvP3OaXnwzF0LDJ6ezkMgPNKXn2RGIa+R11HVHbiwG5/1
	zI7bg+19ZFhrKp9Md+qvXc3YaGeQA3UOMgjhtM8beGsI0OrLAYkhWX046W005nLw23+RsSs9bDMJV
	RLUpinu1eYadumFWnuJWUfbHZqJjb5Gmn3ieGx24ezkDtsuF4G4/m0Gt7Cpz8bQSUVXtCjhzEh7Og
	E2KTpbBuVBeeTb/9jlSZ8vBZGSLx6h40EcepVaT4AdXU4n96fclVExSqS10GpB05zrRPx7dkUvU9U
	hSmJITPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Fz8-0000000GXPI-1WoE;
	Tue, 05 Nov 2024 09:36:26 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FvS-0000000GW8v-3kT2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:32:40 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c9978a221so52831905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 01:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730799157; x=1731403957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nnqa2pPYuuC5Cap6gt5UkBzeNS3a7p0T+6rmPXsBpW4=;
        b=Vd9BGBstRFuFkGKM2/nhQG0bTolYRhrnMoPQDyRMcG1teel5Q6k3+pQpn5PkGUE4XM
         ebf8b4plGbgMzzlO+l9eBKGzx5esVdAA/RvwMEHd06bx2wnLR8zzsFQcQdV93azwKlYJ
         ooYfaLY7sa4Mba5xgtC8hCmphT7t3vtehYBIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730799157; x=1731403957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nnqa2pPYuuC5Cap6gt5UkBzeNS3a7p0T+6rmPXsBpW4=;
        b=s6UPc7pbJ1lZHVjh6ohk1g9lM8v6bdh9E9GfyUxT6wrUDP0AG34FndeamfqCHoqN32
         m4bOTZdQrvb+T46/2gApbaQFJNpNmlXGzb7ovisgCX/V5ojWrUzDxPKT7r8R8AZyFrqd
         n4whbpycAU8yMQr9rZFWBzRed/5e5liyQb69qZVkkiKTyjEgyPsqVq4zwc9Fwd4qzHG9
         JWvU408XomFrgXyfbaWx1XIsp8l+SQ0sZQfchkqc1QaGFVb12qgg1JrlPpATuk0Hp+8D
         zNhQPY7I9PmXvlEke8ih4WcuB89HKY4JdjEf7U4xuRt1DG9BlzQ2I9lq/TPcbCiUkXYV
         O9CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmEdeX7E8qkf2YNyUdw0jO5SzQJoPf6O6wpE/RTk4BGETGowiiGXqbpzED7ea559Kyz8A1eLMsJkvxF4sX4i0b@lists.infradead.org
X-Gm-Message-State: AOJu0YyCbjrLXsJ5xV6WbMO5he7GFj/gx6UODnMi7OSMwqgITRfRGbBj
	ydH3xI4XEz9GtRJmcSM0RA0xvrbZyZ33Vi9X6BNpekqEzBqKA24PPx0dOQiTAg==
X-Google-Smtp-Source: AGHT+IGOGQ1HZ0I0tBq/EN9OnU8jHABvUHtmvm4AuXTRezpGH+/Gkd1vzZSmZS+YuGC8dwHeP6ckbA==
X-Received: by 2002:a17:902:d50a:b0:20b:57f0:b38b with SMTP id d9443c01a7336-210c68d748amr489451335ad.19.1730799157354;
        Tue, 05 Nov 2024 01:32:37 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:20ee:3712:ce0b:1ed7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ed8fbsm74149565ad.6.2024.11.05.01.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:32:37 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fei Shao <fshao@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8188 Lenovo Chromebook Duet (11", 9)
Date: Tue,  5 Nov 2024 17:30:12 +0800
Message-ID: <20241105093222.4055774-2-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241105093222.4055774-1-fshao@chromium.org>
References: <20241105093222.4055774-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_013238_972070_1A9C0DBE 
X-CRM114-Status: GOOD (  10.74  )
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

Add entries for the MT8188-based Chromebook "Ciri", also known as
Lenovo Chromebook Duet (11", 9).

This device features a detachable design with touchscreen, detachable
keyboard and USI 2.0 Stylus support, and has 8 SKUs to accommodate the
combinations of second-source components.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..4b68f0baf010 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -307,6 +307,19 @@ properties:
           - enum:
               - mediatek,mt8186-evb
           - const: mediatek,mt8186
+      - description: Google Ciri (Lenovo Chromebook Duet (11", 9))
+        items:
+          - enum:
+              - google,ciri-sku0
+              - google,ciri-sku1
+              - google,ciri-sku2
+              - google,ciri-sku3
+              - google,ciri-sku4
+              - google,ciri-sku5
+              - google,ciri-sku6
+              - google,ciri-sku7
+          - const: google,ciri
+          - const: mediatek,mt8188
       - items:
           - enum:
               - mediatek,mt8188-evb
-- 
2.47.0.277.g8800431eea-goog


