Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A57C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5h9k35W8VUkZ64zZtOtJ4NycMcBJ361EMKMeseKsgfc=; b=qhljre22QUfN8jqS0wOYM/V51C
	dAUQw0h+rUAMaoc2uTpRDe/93DfUdMUw5DjXdZtzdg4wBhgGbu+xonuXETfR3pLAZ81TQdc8HNGKd
	im2gL1gBsvZLI4ZCacXxtWMk1uC+XNoInqw8F0ezJ1jzzb1sCKxey2bJaNJndU5kDmuVdAPb2XG7D
	MesSSohDaklSlrEOVM/0fREgO/MOnzeiG+S9tv8IJ3kfJ4UAMqnQGYwaL5trBKwFVHQpD/TkCFKhJ
	KtyAeC3uk4MtKQ8TmNftWC5S+EkZvTWgFfjTMQUGxlJTcPnxQ9ZaieoDT43qrYMISDW6onq7dJjM2
	ajonlHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRX4K-00000007VOZ-23fd;
	Tue, 17 Jun 2025 14:13:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWch-00000007P5C-1Q6z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:45:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so64317485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 06:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167910; x=1750772710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h9k35W8VUkZ64zZtOtJ4NycMcBJ361EMKMeseKsgfc=;
        b=ZDrmLSiSOB60zq+G4xm2tL4SlhHkI/tFleVZrVJtff2sm+UKHHAjMv8TS4izV7zHGR
         Qz5+eW6bA0H01omOE+GO8sdMM67F84tlhmI338VTv6t6AznlrN3nnZx9guSwCDRmDzFh
         B3PWx7TK9vWOBSWxAWGWZMnBbVNc8oY1j5YnT1RlsbxAvynhyAbQ+G2hcNg3IB4rW59G
         StcEnu6fiDEFaUDBXsEagwlYQpqxB2SyFszlf91Uz2ShyEXIVomKFIdE/nlb0QHj2siV
         0YgY3SyCYycOSVGTk8u+i2IZfPC1GS8t+7e56ww6VstTcg7grfJfl2EVFJzmTxe9iow/
         uBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167910; x=1750772710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h9k35W8VUkZ64zZtOtJ4NycMcBJ361EMKMeseKsgfc=;
        b=Evy/kpsrCxFUyHuuTQUVFYy9j8vn4+nbcGSljVf9h0a85Uq4K7gqcGoAqXJFYIQEre
         JnTxvO+Qb2FYCq4CnjPCQ2ZCx5kAXUy07h+i28dGCH5DXAVGUqYMcV3TW5fz+8ukOmvm
         i8VgxL7eziqPE2FJjZH7+NboWfq6vKjbCIeuLyifi2JqReykXrCFJ4srpzlONYjyANlM
         NJHPLBDoiVoVmqYg66km7aR+afWikIM2W98FjYsJaO6ysiy203bOvmInGa97+NK2dvZe
         DPDMBV0HoYg+4RKLk6ZGAVSuCUbDl3atU4ruVbFwz6XM97POq+lK68el2tX1snYa8sn1
         wHMw==
X-Gm-Message-State: AOJu0Yw78iTpbuzS4RhYFEAy6zLdzWN2bRFLYcJBIDpRUaDXKvT7f7aN
	YYhZt/SE3lUqHzkgl3lgdn1p/CBnM/G2z8++Tqb+RkETYf7lbY9ISfP1
X-Gm-Gg: ASbGncsmPuRcfmOpk9cJS1dsRwhfxaBnzZlgHrFFFujDk4zhsJqwPJMDA8lRz/+jVh7
	oQVgWkrlF9aoPEabMLJELT7bvh+pv7+nF2oABlSf9KCgll2R805Yft4Eu8lFSkoadefqFwtZhex
	LiipZHO7bUwR1LFl3KBWCC8JKiGXGp/KXBvug0FyggE+qoykxiVlJAM+R7mPUEuvsPpV+sA850j
	ysd4IMn+VgXAAXx0mp5IAihesIypSjXkBPVIF/bAHaDrf/2kM+/i+Tb8CoDjlRY7gCX8zRJWAgx
	42m4rjYxR2Lr991mpENSSglRmQkJlHQnzYWKP61b8P6dE4ZbYPiw6Pf+L5I317s06wyA7kLx0rC
	9c/T62uZcHIk=
X-Google-Smtp-Source: AGHT+IHrFwv0zGTdQiCUWhPQoi5s2M4Vk3TK1s6lXyW205P9aB6tfhvsg0QfD5fzGErUUi4TPkOybQ==
X-Received: by 2002:a05:600c:1e1d:b0:442:ccfa:1461 with SMTP id 5b1f17b1804b1-4533ca6ace2mr138962895e9.13.1750167909601;
        Tue, 17 Jun 2025 06:45:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v12 3/7] dt-bindings: serial: renesas,rsci: Document RZ/N2H support
Date: Tue, 17 Jun 2025 14:45:00 +0100
Message-ID: <20250617134504.126313-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_064511_380270_74DE90CD 
X-CRM114-Status: GOOD (  13.16  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add documentation for the serial communication interface (RSCI) found on
the Renesas RZ/N2H (R9A09G087) SoC. The RSCI IP on this SoC is identical
to that on the RZ/T2H (R9A09G077) SoC. Therefore, "renesas,r9a09g077-rsci"
is used as a fallback compatible string for RZ/N2H.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note, this patch was sent out individually [1] and is now
merged into the series for convenience.
[1] https://lore.kernel.org/all/20250609192344.293317-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 .../devicetree/bindings/serial/renesas,rsci.yaml          | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index 548225e509e5..f50d8e02f476 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -15,7 +15,13 @@ allOf:
 
 properties:
   compatible:
-    const: renesas,r9a09g077-rsci      # RZ/T2H
+    oneOf:
+      - items:
+          - const: renesas,r9a09g087-rsci # RZ/N2H
+          - const: renesas,r9a09g077-rsci # RZ/T2H
+
+      - items:
+          - const: renesas,r9a09g077-rsci # RZ/T2H
 
   reg:
     maxItems: 1
-- 
2.49.0


