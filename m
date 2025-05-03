Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6013AC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 11:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYFsZT9R2VetUjXXmQTVLyqYCEKJfHUeK1FBA0cF88Y=; b=Ovvb02lYkV+sHfjDfXMiDNra0n
	zb75Gzds5OtGGSES81Xex7Ut7diJTZGSy0C0O8h5I3du7FMFMZcZv/Iz8xEbNrj0e5L0k80SnuQeX
	V/UcThpMjceRnq+wr4zLpaYjiEub7Nv+F4cbQ1VQTbizVI4PDj2z10lttTjQ+aQHPzQS+080glacr
	AeVXCkJ0gGxrc2/6reLqb1dUfB3ZybMtSk9Lb9ApymiwKOkT+oHZq008wdvHnh23mPTd2nHmE6T3j
	6uxf3SU2OrFCJIVWgFPVl5o2bZDbr+0h6PtqRs1NH7zWjuLg+pcACywL7syfPjfeUGIT/SDtOr5rK
	KgEO/uYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBBTy-00000003q7X-2pfD;
	Sat, 03 May 2025 11:56:38 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBBQF-00000003peG-11DR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 11:52:48 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-736b98acaadso2938625b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 May 2025 04:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746273166; x=1746877966; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYFsZT9R2VetUjXXmQTVLyqYCEKJfHUeK1FBA0cF88Y=;
        b=PaiRfv59Ui4iStIt5HVAXhmV2w2qrwq6dBxeHlImoQvUVbWORDB/BbJkAPOonyuyKA
         qNKhOiBV4vGtbrBvnGSmZugN8Yq2VhDWsq4+5Uk+3wIaNkW7iMBdC+MYwLDzyRSuyQ1R
         Ey0+ptuLrWZhyrLrXThclYzF9ydHUVt3MuvY7DuvWpFy08iNF/Ldt84ftSJL8Ao2Ym3Y
         x8Eo80FyV0iltawZLHxcO/WLXUXd6CfWf2Xbrlqvu5WRDpv9AZtmf4lu0w8GhVhvgS6W
         uRUMcTWm3JNr1zzt9L+Qized0A3e4EJ/DL6eZs89BvQKpGQJAU3qg2sIpQt/nIER+lWo
         bejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746273166; x=1746877966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYFsZT9R2VetUjXXmQTVLyqYCEKJfHUeK1FBA0cF88Y=;
        b=HIgNX9Z53c66GNOdWSPLWky7LDSwL8p4Z+L4PNbWAGDN1RhClk7rpswVXuXljMmDQp
         r5djzJyzB7a5gUTzOK5pJbr09GMe23zutslVF5b0dcvWvy/VbaTr5C9x6fY8LtOQwE7f
         JpaNJTzRJl88NJEr3KgqfIgSMEWscQzQIt3eNc2fKgC2f/pKeVxVpk1+wYM5P0w/+PHh
         k3iKYEH6K9mKKALvAvQ0loJod8IZAIrV/WmtppRCLdhr1frHHc1kjcLSAlgNY+4B/mcx
         bQ0iJZb6bBqZdYRXnD+74WW8bo4qTqzYplihEEvZN3/+TYTId0to/O2bjzxEkHakXNQ7
         ZtNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYoG0dDXPNiAxH6e6KBidHvjSvJto7xPr6S4G1KXSQYwKXtgcUulP6r5UgKHDwwoRozPwbP0pmHFlXC+CIqqbq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9qrGduuq9gYEeoegLFTt9qQpKJatd7iXqtcdt38OAYjRDnNjR
	0eQDe5dtOAAA5iuoNLY2orWjSiaR3AHMQfI+RJe49OIz9nJ7wXg8
X-Gm-Gg: ASbGnct88URrrcrFH3qghaD9IJhAW5s0DUhW5FZHelxFnu3oWayqhX88zfLmaOAEGkB
	aioWskQ2ZYpj4fiYhd5aJ7fdacPQcDar8y8Z3a305FT567YIglSmmEULiGkCGxzKihHPubNlZf3
	33fWtRYUVm+0CxBzeCaIQs3iqrqeTzRGRqxNf6TZh9FRGfg/DXTTxLkOAT9SUZTTNvIRdSiwLA7
	+FXYYs2dkV6dnGNGfJ6rboEpSHQ0HZizClQIqIj2ZtXNFsYPpCdW7C80WhLYnxiPe8Ka46aj1x7
	za16twmG6rCXE5cvvJcX/8ZQklz2eXcESDBEnlUK4I/0CImMehDJ
X-Google-Smtp-Source: AGHT+IHzLqx/Mq4tjxRSZGRUqqxUAcZk4Rr55wtw7HQwhDfPrVgPnRa9BXlPqHPX1lZMyz81Ef7Dqg==
X-Received: by 2002:a17:90b:51c2:b0:2fe:994d:613b with SMTP id 98e67ed59e1d1-30a5aedd058mr4089145a91.35.1746273166217;
        Sat, 03 May 2025 04:52:46 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f9a0sm4879878a91.5.2025.05.03.04.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 04:52:45 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 03 May 2025 15:52:31 +0400
Subject: [PATCH v3 1/3] dt-bindings: hwinfo: Add VIA/WonderMedia SoC
 identification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-wmt-soc-driver-v3-1-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
In-Reply-To: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746273161; l=1709;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=tyWqtL/rut5YPhdVN3q+GvWjCSJidX/06j4iYfBzgBw=;
 b=aBVAj3FRh3C/HeLG1KrEZgKHxNVznXy3dLXZzSekK/QXHKCFcyGSzx6Vc+6KcMmBIQVus65V8
 ASkpJiy/j07AVcBP9xhmuag+j68tcuVX/SD+BkOLAtnHPf0kKNjFANI
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_045247_295864_1CEAE32B 
X-CRM114-Status: GOOD (  12.54  )
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

VIA/WonderMedia SoC's have a chip ID register inside their system
configuration controller space, which can be used to identify
appropriate hardware quirks at runtime. Add binding for it.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../bindings/hwinfo/via,vt8500-scc-id.yaml         | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml b/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b0f425a4a882be8537f9873fdaa4ddf49d3c825c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwinfo/via,vt8500-scc-id.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/WonderMedia SoC system configuration information
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+description:
+  The system configuration controller on VIA/WonderMedia SoC's contains a chip
+  identifier and revision used to differentiate between different hardware
+  versions of on-chip IP blocks having their own peculiarities which may or
+  may not be captured by their respective DT compatible strings
+
+properties:
+  compatible:
+    items:
+      - const: via,vt8500-scc-id
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    chipid@d8120000 {
+        compatible = "via,vt8500-scc-id";
+        reg = <0xd8120000 0x4>;
+    };

-- 
2.49.0


