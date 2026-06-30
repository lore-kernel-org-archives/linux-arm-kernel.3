Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31F3C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfmIKm5rHIJIAW9GcZYFiHLu+bo2uk/pPVU4wB7S6jA=; b=B1XpnGzlTdq8ZdUfXjc7JFjAgU
	L8eOgt+U514vQP5k+4fBWYfXPeIbwsI+cy9EvaGj9w7cXAXvksgw9cMISZKUDRiMhP5fUJEbqwlej
	yskt35fwdpUzTVNW0BFWR3/QCugELHCsykmcUcsMKUkFZR0MZuyF1rpMXaXve/gaPAnyrYi9ti9bK
	gAnNAlhw9UM+asMERKpA+YBPhKSo334dhxiVWbfjDschwD9bZkQ/AVsDRz6QPJubjbL0UleDpr52q
	RJUA6sbn2XtbRvuXf//Fkcqj4KdDElwmlxlQORON9QHDcdHl81/Zkzpz8P5H9xTNTVN3REKbSPhOP
	kJ/rNM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaYE-0000000HOH0-180S;
	Tue, 30 Jun 2026 15:39:06 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaYA-0000000HOFD-49gz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:39:05 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-845e47133c9so305344b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782833942; x=1783438742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfmIKm5rHIJIAW9GcZYFiHLu+bo2uk/pPVU4wB7S6jA=;
        b=DrW4XDVRhYKGGHejagc2FTLu5sASqbqMlKQEAsdQn/ZAzalaF5Gm/r0P9tsAVVoKNA
         vsQKc53/QFx87n7Lbl4m+GuWS3wMHZ3wXGLrXJHlhKG1eGcEE7dRwLSkU/eAfp0hoOlR
         hicRQ46H/Q15kO69VFwl7p5fiJxO9ilf8eOu02Z3JqgxSqVJTFXuEK0GPSq0ESqLgZJr
         M7O2U5H2L53rb+tUQ7t6ISoTEmvLGKrDDzteB1NDh2oMxabbhsKKJ+tstl8ypxMOcrHn
         5iIzHF/IeSFYGlHW0iHfrMqbazYt1rQGRbxH0t9ddQYNdrQ780TK7araW6HGFGI/3/W5
         KmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833942; x=1783438742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WfmIKm5rHIJIAW9GcZYFiHLu+bo2uk/pPVU4wB7S6jA=;
        b=q1CPMjHBYF/nVz4kQxtDxL57Dyy/aIbrAthAYCPP3lbSaiHZ/P0Nz/aKxsXy/3mfbz
         2njl4yUQ4G8d3rA6srOkZPy7qiFW3A+UuBzDg+LZQvrfKZV9eHIbij6KRCIIeCFroY32
         +Zpxp3zIub0TLrvxP6qd6nrOlkIHgpXRPjFzWjbCy0bqqDm7uP48ZOBK4WmBq0oi2LrT
         PTylW2Hgf/u5U7C86pEf2i5pYQ5IkXmbA8TAAcKN82vKvp4LmIeFvE4q+rj/p6YQn4DT
         PJcccCxxwnSbsgGLXdLaD9YV3TwXPdFQUbAsm3u/bstqWmCMCsPE73JTUL68oOD1sg5T
         A4Nw==
X-Forwarded-Encrypted: i=1; AHgh+RpQpwAzrUaCqpuseP8KPQEdPAicmBdGUcULVYN9EPHhQYBUU2RjF22vA/6WhQD0NoyfX83SCVCi3p6ZiyfllJTV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx149D4R3R3nMBCUjgCqLkVT/GP8lM0n5wE0hS+pruULGSQkwpC
	kPNYI5cN+jsPBWbz02UwLtF0UTNJLQDfGPhwrQVIdC4+CxmCSFJdbQNe
X-Gm-Gg: AfdE7cn+D71GxNjNoXebVmyNxhuoEg6uZsXuqfFchEGvVjRObkLurqwJdrJZRdjmx8G
	XYkICR9xIhFuGHBRcVsyFFWr1ChGAg3IV3OUG61Z4T+uAWHqyKbMCDq+CCyEf/IXBoJXdS+lvyJ
	0He9YKS3fQdqwfRk4ceI/bsYT+0jSlWgEBuUBNODITFoaEAOmhy+jnKAQbk2Bs16eV1DTrq0eP6
	lVxX8bcklRqlyYK9m2ZticvVDsMpfHk67FiWqB6Jzj9oRgPkxx4HsiNo+77MvBdTc9OW/loX+FE
	Ag1WOIW2gXnIy+qS+XF/OhTXVIgHI3M9Mu+7MjulM3eX3Cp8Yei6ZbO9hcbG07dkm8qmm4kViyJ
	kjUUzDo/fuU3UFeJ+K3nhvQROestVpGGEOSVrwjK9x7MoLL+TCI5u4n2q5wfYHkpsEnoMd70md9
	PYJSoqS66yfNY=
X-Received: by 2002:a05:6a00:f8b:b0:847:9223:9726 with SMTP id d2e1a72fcca58-847a82d9976mr1775094b3a.18.1782833942073;
        Tue, 30 Jun 2026 08:39:02 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03cb50esm2413695b3a.60.2026.06.30.08.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:39:01 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
Date: Tue, 30 Jun 2026 23:38:11 +0800
Message-ID: <20260630153810.3574714-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630153810.3574714-2-coiaprant@gmail.com>
References: <20260630153810.3574714-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_083903_033538_B5A96408 
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

Document Graperain G3568 v2
 which is a development board based on RK3568 SoC.

This series also have an SBC series with the suffix "box".

This board is development board series, not SBC series.

Link: https://www.graperain.cn/RK3568/RK3568-Development/ (China)
Link: https://www.graperain.com/ARM-Embedded-RK3568-Development-Board/ (Global)
Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6daddec9e400458816dd4c57ba807fc3.pdf

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d0..9eb2f66ba3856 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -684,6 +684,12 @@ properties:
           - const: google,veyron
           - const: rockchip,rk3288
 
+      - description: Graperain G3568 series board
+        items:
+          - enum:
+              - graperain,g3568-v2
+          - const: rockchip,rk3568
+
       - description: H96 Max V58 TV Box
         items:
           - const: haochuangyi,h96-max-v58
-- 
2.47.3


