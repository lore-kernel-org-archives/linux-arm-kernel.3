Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A430ECCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCqSLgxWkeVXekojaut52uxcCHN+33LWNwdmvrJ9Ias=; b=kYy0cTr2wONQBVKhBFHncgLJhZ
	7YChy4yVPFuzAIjN8yaDIHxgIToK2h4AGbitR+s52lUMd9V6Uf5IQe2boDBz5upSPI/cTHGQOq9Pr
	MWGhekibmcKenRBtMXsxQRdY6W8weY4nzbHoSxRl2dMeB3iT6BVm+953mVARBs0+ekBH3Yln0I/0o
	0ZUSN6+s+nQol0BO+cibz8fH001oTuJ/ZPxIctHtRCNLg3Jb1Emvc4jw756XrSEFiWGoOOJSFQO21
	j80OsceYDKStUjh3IcmCcLrxqC5TIlnPYwYddy3DaG0lB1s6ClXlmhigvBws3kj9T+UuLqT7zH6QM
	MN5rTCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEm5e-00000005rvK-0YNA;
	Fri, 31 Oct 2025 10:10:38 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEm5V-00000005rsB-0uiZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:10:32 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b6a42754723so121907a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761905428; x=1762510228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCqSLgxWkeVXekojaut52uxcCHN+33LWNwdmvrJ9Ias=;
        b=BPy/LKxfx8fALwhPWNCASGFPor+gackP+w2JnE49iBdoBnCo6YdHyetzU2JajT6pDv
         JLLtRj1mDmNmEuy3wf+opZuBJcJJGOFFNyTQuy7D/mUOo+WD0/xUfOT1QgmUyRRqOVKl
         fg98MaBieBrgOI3f7PJNCf8qanDkbWZcPDkOpoMGTFMTo7Cpmh0HIFa4WHTTefUkFZgH
         IOFyCvWasDwin34BMk2uz3pyy7V3cjtntMH6XNEvQkpQcqvx5JhlnIBd9DKqTKWgmij8
         ILhUGBdGVkWrGoZzb/9qmGj1chlDMJMjiX0nXCtDL5bRjv9qyj74MH5OIhUwRiY8zE0s
         jNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761905428; x=1762510228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCqSLgxWkeVXekojaut52uxcCHN+33LWNwdmvrJ9Ias=;
        b=N9LzcDC04bkQGJ2/fgeYoXwIQSnWIOc1p+7OeOgy7Tkxc+lvOEE9R2hH7nsVagNIgL
         LLUO+LOOjjJQY3DbWpr9p2n634aACR1Mcc07X89fqfSINH+P6N4To1aYsmNTfRV4nh4Q
         KBGZFM8AXC6yPfTHyMHHrMtIO1gp/Q5IfXIc00655w7ADbb2MAIq/CMDoKYCJpWV9d5j
         C/NIX/LLv7X7F98MdDxrtPmbqgI/C9dyU/04G8snyiFBctZdQ9hvKLT+BlLEiB0LUIkp
         SbpRsldTfIYHKd1uYw5CphI9kH2r0wZEN/7yx8caKTLGRK497oy2fqZYZC3oF+bWTSRR
         AI8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMJVqoWgXfF2d+sJLl8KGBoAM3THM3J+j/obbnfZ17LRcU+Wiuo9k/mNdxU2CR0AV5lt98zDAoEpkeI5u2IEJn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8RIs2BJpveGRJSOSDpEXdp8KGIS1SDlffwCXEUodaSisTu59T
	beUp3Uc15THsA/dqkjTbCTtLgBrUyYr5xsTQHa8Z3NNZyzDPyvP2inS5baB6mame6g==
X-Gm-Gg: ASbGnctTClAdy23ONz/TWwKk5ZwH1lhSRuCcLK6hM6DEIhZ4lNIT4kgd3Yfjp7+Lyhm
	yGRcpvNosgSAokJPYuVR2Ku59QyQ7laZWR+TWVs2Uitb6wq9JLAwbeKkIZpO55rHBo9q16DdEj/
	Tod5KGlvybkwK4gLYaBCXhWART44azChqz+YmtsjJakJF7mENU6aGhpRZMg0zKIH9TaKmqry1Ps
	W4TnGvZ+rBdR/8mhpRiXIy0rw/E7t5bSTsifAoduGeh5TzJPVvHt4q7l5SjmdWngstEyFEHzMyz
	tDDmm1GeiYD3Wfwafp5z55Rqwz1QMe4mqqQ+aKYE+4bYeliZiAgt1GB96hFuBgeUVBCOHy6iiLe
	kwBkqpMNELd1hWdi1aswYFfDrjeeslvXjH63Nndyef68V1aO+n+JlaHdrwNS/uR34/4duR02P3/
	j76ysuYuNQvXV5RR10Q66Nd9tMtsRGtFgamGv4
X-Google-Smtp-Source: AGHT+IGBRA0aoJzpM2hpeOsBENB5JR9uquyfQ/tR+Q/1DkGVQwwAaqar76fSPxcZLwaLxPBcSDvpSQ==
X-Received: by 2002:a17:902:ec86:b0:290:8d7b:4041 with SMTP id d9443c01a7336-2951a524b65mr23527095ad.10.1761905428261;
        Fri, 31 Oct 2025 03:10:28 -0700 (PDT)
Received: from adriana-dmi-upstream.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952774570bsm17458545ad.99.2025.10.31.03.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 03:10:28 -0700 (PDT)
From: adriana <adriana@arista.com>
To: ilias.apalodimas@linaro.org,
	ardb@kernel.org,
	trini@konsulko.com
Cc: robh@kernel.org,
	krzk@kernel.org,
	jdelvare@suse.com,
	frowand.list@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	vasilykh@arista.com,
	arm.ebbr-discuss@arm.com,
	boot-architecture@lists.linaro.org,
	linux-efi@vger.kernel.org,
	uefi-discuss@lists.uefi.org,
	linux-arm-kernel@lists.infradead.org,
	adriana <adriana@arista.com>
Subject: [PATCH v4 1/2] dt-bindings: firmware: Add binding for SMBIOS /chosen properties
Date: Fri, 31 Oct 2025 03:10:08 -0700
Message-ID: <20251031101009.704759-2-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031101009.704759-1-adriana@arista.com>
References: <20251031084101.701159-1-adriana@arista.com>
 <20251031101009.704759-1-adriana@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_031029_263479_DBE585B3 
X-CRM114-Status: GOOD (  12.55  )
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

Signed-off-by: adriana <adriana@arista.com>
---
 .../firmware/linux,smbios3-entrypoint.yaml    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/linux,smbios3-entrypoint.yaml

diff --git a/Documentation/devicetree/bindings/firmware/linux,smbios3-entrypoint.yaml b/Documentation/devicetree/bindings/firmware/linux,smbios3-entrypoint.yaml
new file mode 100644
index 000000000000..4d1521c685ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/linux,smbios3-entrypoint.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Arista Networks
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/linux,smbios3-entrypoint.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Memory location for SMBIOS entry point 
+
+description: |
+  This property is used in the /chosen node to pass the physical address
+  of SMBIOS (System Management BIOS) or DMI (Desktop Management Interface)
+  tables from firmware to the kernel. This is typically used on non-EFI.
+  
+maintainers:
+  - Adriana Nicolae <adriana@arista.com>
+  - Rob Herring <robh+dt@kernel.org>
+
+properties:
+  linux,smbios3-entrypoint:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      The 64-bit physical address of the SMBIOSv3 entry point structure.
+
+additionalProperties: true
-- 
2.51.0


