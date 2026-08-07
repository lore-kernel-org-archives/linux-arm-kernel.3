Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7F1C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37E29zaFhLGOrDb/ZTD96WxUaP6LZSPazQ7ZZ2/0O0I=; b=cO4VuPV9s7QdnkYFf+bYulbtWj
	1s59fG6q1fYODb5MwznFT16CCJsPyqRE5X+w67QgeNsl/1IqTEnNjNt3vIJzoae7Wg1VsC9ksZ8mM
	2b3Xy3GJ/tRMUH88L1gmwzTSHeaSfUgLaPc/Cpr9Z+oMPvVJOFIj75h0Z+HD+PBI94ubsTbgju2VL
	GqXqToz3SI+cdVcUmCcbOyhf0BaswlXh86Oox60y292Mu8WtDiD83lGtQ5a10U8gtLMS1i2KjSHFk
	7yiVMHl99M0INwaja6Cki+ij2thT6Tbr4QIBB3LuDAmxuAYs2cmlw58rONRCwDLpTGJ6rPq1fbEBT
	dizOBX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCJ-00000007FuL-3J9D;
	Fri, 07 Aug 2026 07:40:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCG-00000007FrH-1W7q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:40:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-472326ca506so1994113f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088450; x=1786693250; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=37E29zaFhLGOrDb/ZTD96WxUaP6LZSPazQ7ZZ2/0O0I=;
        b=vFknm8WSEZif9w1Dm3VYIlZT6zCxy4fFft47/M1DtclyYCIF9Dp0PIhyU23LjKWu3T
         hVcjWGuNoofx9A1Oze8nipha5cPir0VoZmnIf+XM8J1GF3Ztfbb4/+poli0K+ZOtfSw4
         q4EcVYn+VgupLac+k5tkId+qGTysJWrGSMzAdyUQthYRxmBtva8t3BxtLftvSAECfHY1
         sMqNKp5yvVebxk4sMqVr+W5jFTFoh1MqcV8vX0rd015qYQwvqI+l1SG4zcmH/sO+84Gj
         BifrdT08DiFGeilh2dF9jbRxARa+BImRpMG+9eUR35syxr+ur7fKMdBIF5m/RxnCKF3a
         al6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088450; x=1786693250;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37E29zaFhLGOrDb/ZTD96WxUaP6LZSPazQ7ZZ2/0O0I=;
        b=oGCmN4d5OILZzQ3AMyvm8B2uSjDmpbufrNiuuxbkGhIysSGdymDAPbzArEYx/KfFHE
         3mknh5YSagR6+7tQhsnwcnmPgGSvsr9jflHr71989gSGkey0D7669mzr1uuXlQjU3IyM
         eMea3XlsfrzuRIMgBRmDk331nxco3QzFtlkTZIWmnmTgvoZLoM6BB3uh4z3b7OBlYCOr
         IjcviHb/x4TTy3sCUls5Y2UzYW251dMbjLvRaHwOD16nKnWSB9cj4fzIhvBIHDGiOLao
         yDGIXJAKbY4UtxisrSG+vlayBgpo5uENLbvfTx7ejHANKf3vc93zxmoiN+AruMozBEk8
         +fSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpe5sejOMr5zP3Yv651HZFDZ+Gsxl3Qr73HARGCemi9q7lQ5CF3BodxNOfqH+/sx2lUj0tOHy9ZMJu3lKKIn1qk@lists.infradead.org
X-Gm-Message-State: AOJu0YwR+hJ5Je66dJABxTuJ+OvXIF/8D9bZyhn4vE325IqKlgewBy0X
	yG4mzdH5+fVy4kiF48Gm5cDVyxECD4zFcBfc3ZzJmOHhbDSCFdaibTUfDmMm76WPvd07
X-Gm-Gg: AR+sD13snBcQycyIsK8juARUWFRmB02MeTnsAQLk2Py40wozwZaEcOt1B3QiHpYtHkP
	22DFoHwRo6DrPdM8GLfK51i+39W7A0iCCb/KUHp88+mfPz67Tqb8tG9DXvH/61fNlElh88IZjGe
	q5z1HUHkMuQO3C+ANcerI51Pisht/OqjhURW0fEDQ/SmOQjp03AmML6xkSw52Dk96O3IrfavwHf
	A0d5hnXPh0dZVtQgh52fmwMWgmq+qigbwYfcb5ErEJhca+3DaBw9zd3aXDLJxXwzV+JMmT3SgXO
	hQNDAsRMLrZ9T1GXYnmrm6RrU8sPj6j8nZ58iBes3t0tq5m2Udv3avx7Ca9t6CoPgPNyB77Rdab
	j2VUtg7UoJkOHRuy2pQxV4t0hIGAlT0Zdm28yEt2OZXhKV7ALRZDH4NoUT37MJvX4ZTpnuHFY+1
	sNbJFHN8VctuxtnQiQwtEjWcE33Jm5CrsbiFOqAzwkhiXteNDODqh2jRnYcvB+toc=
X-Received: by 2002:a5d:6f0c:0:b0:47e:9f16:c0bf with SMTP id ffacd0b85a97d-47fec63e205mr36677851f8f.30.1786088450464;
        Fri, 07 Aug 2026 00:40:50 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:40:49 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 1/6] dt-bindings: bao: add IPC shared-memory device
Date: Fri,  7 Aug 2026 08:39:28 +0100
Message-ID: <7fe7fbabed8d932a9d8d82e64c9c4d76100964c6.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004052_452790_7C42D4B1 
X-CRM114-Status: GOOD (  17.40  )
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

Add the device-tree binding for the Bao hypervisor IPC shared-memory
device, used by a Bao guest to exchange data with a peer guest over a
shared-memory region.

Co-developed-by: José Martins <jose@osyx.tech>
Signed-off-by: José Martins <jose@osyx.tech>
Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v3:
- Describe the read and write channels through reg/reg-names instead of the
  custom read-channel/write-channel properties; drop those properties and the
  "id" property; add a vendor "bao,id" for the hypercall channel id; use a
  generic node name (shmem@...) (Krzysztof Kozlowski).
- Clarify the "bao" vendor-prefix description.
- Subject: drop the redundant trailing "binding" (Krzysztof Kozlowski).
- Add José's and David's Co-developed-by/Signed-off-by.

 .../devicetree/bindings/bao/bao,ipcshmem.yaml | 59 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml

diff --git a/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
new file mode 100644
index 000000000000..60947150d576
--- /dev/null
+++ b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bao/bao,ipcshmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bao Hypervisor IPC Shared Memory Device
+
+maintainers:
+  - João Peixoto <jpeixoto@osyx.tech>
+  - José Martins <jose@osyx.tech>
+  - David Cerdeira <davidmcerdeira@osyx.tech>
+
+description: |
+  Shared-memory device exposed by the Bao hypervisor to a guest so that it
+  can exchange data with a peer guest. The hypervisor provides two
+  contiguous memory regions, one the guest reads from (written by the peer)
+  and one the guest writes to (read by the peer). A write is signalled to
+  the peer through a hypercall identified by bao,id.
+
+properties:
+  compatible:
+    const: bao,ipcshmem
+
+  reg:
+    items:
+      - description: region read by this guest and written by the peer
+      - description: region written by this guest and read by the peer
+
+  reg-names:
+    items:
+      - const: read
+      - const: write
+
+  bao,id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Hypervisor-assigned identifier of this shared-memory channel. The
+      guest passes it to the Bao hypercall that notifies the peer of a
+      write, so it must match the identifier configured for the channel in
+      the hypervisor.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - bao,id
+
+additionalProperties: false
+
+examples:
+  - |
+    shmem@f0000000 {
+        compatible = "bao,ipcshmem";
+        reg = <0xf0000000 0x2000>,
+              <0xf0002000 0x2000>;
+        reg-names = "read", "write";
+        bao,id = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..b11b3dd995a5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -231,6 +231,8 @@ patternProperties:
     description: Shenzhen AZW Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
+  "^bao,.*":
+    description: Bao Project (https://github.com/bao-project)
   "^bananapi,.*":
     description: BIPAI KEJI LIMITED
   "^beacon,.*":
-- 
2.43.0


