Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF966CFD65A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvVGowKlmlOk8ufl2dgbwZUQhdQ7tHUGcyk69lSV+dw=; b=yDDTfqzhmbCuuApGWlQMNvUlSK
	plrwyb1lIyKaCPTmJMwW68k8U/vRV4n2185lj2aVwHHFd3Lqw1A7F7icuotepuq3bjQovXQEfpaG4
	KtfTKc0smF3cOWDtcMRfpGkCelyfQ8AFa/76YA9lB8em9prVwXoSLh804A1FXy6nk+yboORdZI9kr
	q4cXpCGo+oJXvuUvfZeoq/nGIpifdZunlU3HlOTkKWuQAuwDQpZ/QoGr7ZTULudA6v34K2IqvYHCL
	sWQ+Zm8T9+dfjLcviRxykAT4IsXn97ewlv3avDsR5w8C2E737jFQgJQ2nTx26lt2SP65cb95yPhLz
	zTaV3UXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPe-0000000FHmp-3sze;
	Wed, 07 Jan 2026 16:29:34 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPc-0000000FHlP-1I4T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:29:33 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so15559975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 08:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803370; x=1768408170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvVGowKlmlOk8ufl2dgbwZUQhdQ7tHUGcyk69lSV+dw=;
        b=mn7l7iMENyEX9Kq/lpqibuEAFziatJodzkgy62My9uschU+/q66ZufE4UF3DyBkQbA
         0QNogYGXt2ciyF0AmDhFTTW029enwhtpeZv6DBS3dn698bc4n2TYMKU1gOvDhl9xkzF0
         YTUM7c8pUyJHN5Scj78XUN/kK4ytopPFUa4zhUnHiSFG/1fLoOfQURC0ydImSFF0D2S1
         JTns2PLHgSV7mVxC5MCbWvdCpgcOO7R+ATnD9t75P4ATza0Hhk2LCZgTcG7OWtvPj+4N
         5hJIr+KZGNNtQbCRjKEpGrjNEbcI7U02BsZd6Kq7sKzfc2YKnFfbPcO4xlqntvGNFCmj
         hqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803370; x=1768408170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dvVGowKlmlOk8ufl2dgbwZUQhdQ7tHUGcyk69lSV+dw=;
        b=hPmtYb8PjSzX/hXLdaYTbvGmSWnz8o1AvDLDmkuj35unnQ1Ec4xCucsnKm9F+UMVNE
         ebMkWwXDbkIXCcnXjf9ASVaI2QjrGh26VResGYuahzUG9x3cznwj5GZNeNrzAm6fJuM/
         5GfVwrbQb8dDmbJhDZpSRSZyxzKzU0iam24G3leXMbXv21EJCJAdCynRpJFJ2/510sL7
         s5YGh/rXu8PyZGMrS4PtgmYDp04Lm+PVvXrbd0mTVF+FXuIDCeX8ReKV8YyrG8uTnyFw
         8TFarwbQxdEwundbVQbwFTlcmBTu6IJnv5nVPDb4hTSNwBHSl1STMD3kfaY4tyH3Yq//
         W+jA==
X-Forwarded-Encrypted: i=1; AJvYcCUMt+9TcxNoKSW9B+dIlW90tMLRXx0iqAmWSmv+wRJYrGq78Ksgs8VJKDVFM3yiOnFmRnsKRMWkI7LCUxqwCAZK@lists.infradead.org
X-Gm-Message-State: AOJu0YygX+Z2uDP6CHY/8bE51a56CAI3POea4rVmU3j5pfJ4omqVlP1t
	nAPG6SNbqNkEvxAQzrTxFQW+Ow0SJEtF+yhQwKThmkb5tRsYFALOzVtkhjm0aUTYhZDL
X-Gm-Gg: AY/fxX4C/GLIOF+NI5QBB56zMwQaGmF1KXHamCyQOlcqRDKP1lvvJ25BqCbYK5EGpfw
	mEyTCnCLpZP+//Ss4TeZGUgCX+pM4JkMESIll6IdDEOW0rinkR0FAxP6aAHoHbniNEvgG9kIfWl
	IBiyyOEf8HtVnYQDf2zU/ECKihef8aCvl1X5nCTwi9K/BRGENKtnDX9dTOjD1fdV7QPwqHqP9v9
	JbE6TAhUl2qH91lYKsOFSJ7DEqMYnv5E8DHneuv88BjqzDMgO0lLesUR8FLTjn3U9fKUf3h5U7A
	HbelgN3sKxGyQE5rYPQZ7XL/saTLHHf7PtamFXaWy2n84o5qw6gn+k3TkQcW711gVmRSG6BlpH2
	qhc/npn+50FCrTfUiZa7ESzDnhXtvRbAE5mcc2dVIXqHgU4nElFnX3irY7fTCUcYPON72IjnyaO
	RqtvpVKZMaUP+1GRt83F6aC/l7RhNp
X-Google-Smtp-Source: AGHT+IGZvgVIRVCpFA27SlFxqTQCtBZyTJkVQlpD5nx0fxVjL9cGeTsV0wkJ5rzD4sY1Y62BW2/V+g==
X-Received: by 2002:a05:6000:144f:b0:431:54c:6f8 with SMTP id ffacd0b85a97d-432c377239fmr3846262f8f.1.1767803370264;
        Wed, 07 Jan 2026 08:29:30 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:29 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 1/6] dt-bindings: Add Bao IPC shared memory driver binding
Date: Wed,  7 Jan 2026 16:28:24 +0000
Message-ID: <20260107162829.416885-2-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082932_375709_51B3A681 
X-CRM114-Status: GOOD (  15.93  )
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

From: João Peixoto <joaopeixoto@osyx.tech>

This patch introduces a device tree binding for the Bao IPC Shared Memory
device, which enables communication between Bao hypervisor guests through
dedicated shared-memory regions.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 .../devicetree/bindings/bao/bao,ipcshmem.yaml | 82 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml

diff --git a/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
new file mode 100644
index 000000000000..fa91800db99a
--- /dev/null
+++ b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bao/bao,ipcshmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bao IPC Shared Memory Device
+
+maintainers:
+  - José Martins <jose@osyx.tech>
+  - David Cerdeira <davidmcerdeira@osyx.tech>
+  - João Peixoto <joaopeixoto@osyx.tech>
+
+description: |
+  Shared memory based communication device for Bao hypervisor guests.
+
+  The device describes a set of shared-memory regions used for
+  communication between Bao guests. Each guest instantiating this
+  device uses one region for reading data produced by a peer guest
+  and another region for writing data consumed by that peer.
+
+properties:
+  compatible:
+    const: bao,ipcshmem
+
+  reg:
+    description:
+      Shared memory region used for IPC.
+    minItems: 2
+    maxItems: 2
+
+  read-channel:
+    description: |
+      Shared-memory sub-region that this guest reads from.
+
+      This region is written by the peer Bao guest and read by the
+      guest instantiating this device.
+
+      Consists of two cells:
+        - offset into the shared-memory region defined by `reg`
+        - size in bytes
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+
+  write-channel:
+    description: |
+      Shared-memory sub-region that this guest writes to.
+
+      This region is written by the guest instantiating this device and
+      read by the peer Bao guest.
+
+      Consists of two cells:
+        - offset into the shared-memory region defined by `reg`
+        - size in bytes
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+
+  id:
+    description:
+      Driver instance ID.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - read-channel
+  - write-channel
+  - id
+
+additionalProperties: false
+
+examples:
+  - |
+    bao-ipc@f0000000 {
+        compatible = "bao,ipcshmem";
+        reg = <0x0 0xf0000000 0x0 0x00010000>;
+        read-channel = <0x0 0x2000>;
+        write-channel = <0x2000 0x2000>;
+        id = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..c047fbd6b91a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -223,6 +223,8 @@ patternProperties:
     description: Shenzhen AZW Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
+  "^bao,.*":
+    description: Bao Hypervisor
   "^bananapi,.*":
     description: BIPAI KEJI LIMITED
   "^beacon,.*":
-- 
2.43.0


