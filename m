Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7D2FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=; b=hagJZ6GCwAZwQ1MBZY4s0rjlEU
	8QHi8HCbicAsGSh6z6Pba20LEGgD6ZDvGsKDw+ELXATkbKr/h1QH5ET4WFDi3ZlpRmRcb6YytIkQB
	GHB8kDxsiIvQQU716xVfyL4g6L6NiI3FjizSMktx4D/1MXFbJsaSMtTGA+mmBROQD4ajx7vcYMuuI
	iFKhuUru1VNzJVSHE1lUVZvPvQ+DLaJDuGcyO/Uc8WV7UMveXLmI1liV/B4m3Cl/Po0D2+nxmAxoz
	91j7yhRn7kq/6HdKg/G3KAkDDUkMM/YyPERnT2fjgJttwi/FmvcS3y/d0+Iq14H8UZGtSow6O6MA5
	W50CoqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyua-000000036UX-2SAQ;
	Wed, 29 Apr 2026 07:00:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyuZ-000000036SX-2OoX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 07:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=; b=iuvCgdX1II1/AObo2OEWEHxaqo
	AL+rpktE1yxba1i36mLXYx7/hYcLoT2nT3S3icu73wVo/VInKnfEotS8A9MRkVhEil9shpVtZtj34
	qpwQwQM+uQn8XBI2/895XX3B3Xu4zm4MZF5i5g5Wq5BDN4HmiDmfigj2h3LZfUIfa+xgA4ry1oK5I
	NfE3WN1AT4PEoGOvI6xAkhyPtvTLeVM8y+qSni4ZXTKGvA+qI3r/FIEgeo/NNMTCW1+Gq+kLldli4
	SQ659NeuvrZe/9bDwPNFA8yMr5uHBu/QTWlmbGQ7zTYxwcHEfyU+RfyZnkKeGMVxf+TGShwS8IDNr
	EyXizMmQ==;
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyuR-000000059Nh-3fLR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:00:42 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-82f8893bff3so5739723b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 00:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446033; x=1778050833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=;
        b=rDknmEs4Zu+JXpQFAPO5Y6kVw+FJb/8DbnbYrCTQwoSI/d5SyWP3t1X9+zMMSGt31h
         +JXkNeT7zPz8JUeBaVYnhQW5w5jauKPGxnSlmwy8wzv138QngJ5Mc9OBhsrGDp3gvSke
         Eqwkk8tXv+eOyixtpxKtpmobvvyr7fSiNaONR/n4+pJ/Hn/XnjBsecer2WkfaRyOlzla
         jBUvEEyh9HyaXUobMX4p6eQiZuxJrJmxFyXaT4jHO1nUz4VqKrwKbubBLuvBVLRc6s61
         YVgoRst9X4CIiFItz1GUnR1ZFEwnple2GFA56vFvmmQvfz1aWs7dD1XmjGWzkXjzilzK
         kYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446033; x=1778050833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=;
        b=szCICGhsQKpbErfMKbVPTrojlISvormicIVhrAEG7lOHTfdwO+0R4yRdNsaaP4A9gE
         VpQ3f4HBBY8K5dIY34MuAa4VGEMgLn8QntwDbOc1BZXCFT5Nf/0Mp6lf6bOyKPu23xL3
         kPQt6mlypc3NeSBLx32LhYMQvrlELI2jf70WiaF017dApKuw6BpC6DtNdnLXA/mr5J9v
         mpZZYfzVgDnqPhUwKkAqMVZRQ69EJKxB1HrR+OqybZJhcClTUnHdhbhNK4N1EBXeQjSp
         3KCCQ9DsHqIEwzB5ZdVFRma8NeUTSJs3Oa9XhnXYxHOP+a7Nh6XRdhwbjpnMntaXoylM
         LsvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+L3hcUau05aXzA8JWlZJ/wfOZWCHXg4bvXvCU0pYxP93cF1UEpkDXLjQ2TzUeFfZQf2UFxPhrC5s3tkff5Y6g@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+7H3Hs/B+LgTPYaZhF6NWn3VfVQ89ldK3nuC14Bnq8IIdvaCC
	O7aDpdm33zRRrUyTdtl6GDOYnjQZyi6sPuVH33BNuJxqA6rZXsqtxopH
X-Gm-Gg: AeBDieu6W497R2M3kyj+sHDyMSsnjaXDwEmX/RztFzTNQHyMHaSC2MQ7hvH4In8N8Jl
	pM8dwMwTazGQ7Nj2e7+W+BbosoCcQeubdfb9mD2HxPDhIzYhZyv/MHJrZFfBz6QLhXOR895DqD4
	8QcaeCwkENPTAt3w2ERLg+4M77zHDVhiP3trmle6BcncFikQNl9YaFmu7i3dTHOy0KRO2+aixfk
	FGRJqfulhqKZ/HpKPV1m00k/hTwnpoVQ5c4EFFfElqgbvMvPyBBBQNll6MVE409x3Apg1bl1gNq
	+52l0c3I8mh1hwV5VfSiwvsCBWO2cbtrk1T7t2gVsegioDqP5C7Z32f5x03OQzBn1n3jcIzfWGt
	ynm/EaYNYVD7sylFxyT/eBP5iU0Pe+osYHld4q7ueDn/Tmsa+4Ouu0Lpzh6pRmHWwCUXTPuyRB3
	oWEkgAwhRD56Z43qcD0GmbTSGau8yeCtG0DZrxrfnoV6rNYMXE
X-Received: by 2002:a05:6a00:a14:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-834ddc14f4emr6920159b3a.24.1777446032715;
        Wed, 29 Apr 2026 00:00:32 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:32 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 11/11] Documentation: admin-guide: kdump: document linux,no-dump DT property
Date: Wed, 29 Apr 2026 14:58:31 +0800
Message-ID: <20260429065831.1510858-12-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_080035_937575_487A0EE2 
X-CRM114-Status: GOOD (  15.06  )
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

Describe the new 'linux,no-dump' reserved-memory device tree property
and the automatic exclusion of /memreserve/ entries from the kdump
vmcore.

The section covers:

 - The two mechanisms that exclude reserved memory from the vmcore
   (firmware /memreserve/ entries and linux,no-dump child nodes).
 - Intended use cases (firmware-owned GPU, DSP and modem carveouts).
 - Interaction with the existing 'no-map' and 'reusable' flags, with
   the silent-ignore precedence implemented by the kernel.
 - Architectures honouring the hint (arm64, riscv, loongarch).
 - An illustrative reserved-memory DTS snippet.

The DT binding for the property itself is maintained in dt-schema.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 7587caadbae1..c2246888e84d 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -600,6 +600,65 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
 3. After the dump-capture kerne get booted, restore the keys to user keyring
    echo yes > /sys/kernel/crash_dm_crypt_keys/restore
 
+Excluding reserved memory regions from the vmcore (device tree)
+===============================================================
+
+On architectures that boot from a device tree and use kexec_file for
+kdump (arm64, riscv, loongarch), specific reserved memory regions can
+be excluded from the ELF PT_LOAD segments of the crash dump.
+
+Two mechanisms contribute to the exclusion:
+
+1) /memreserve/ entries from the FDT header.
+
+   These are firmware-level memory reservations with no associated
+   device tree node and therefore no driver-level description. Their
+   contents are typically firmware scratch areas that carry no value
+   for kernel crash analysis, so they are excluded from the vmcore
+   automatically.
+
+2) Reserved-memory nodes carrying the 'linux,no-dump' property.
+
+   Device tree authors can add this boolean hint to any
+   /reserved-memory child node to request that the kernel skip that
+   region when constructing the elfcorehdr. This is intended for
+   firmware-owned carveouts such as GPU, DSP and modem memory, whose
+   contents tend to significantly inflate the vmcore without aiding
+   kernel crash analysis.
+
+   Example::
+
+       reserved-memory {
+               #address-cells = <2>;
+               #size-cells = <2>;
+               ranges;
+
+               gpu_fw@a0000000 {
+                       reg = <0x0 0xa0000000 0x0 0x01000000>;
+                       no-map;
+                       linux,no-dump;
+               };
+
+               modem_fw@b0000000 {
+                       reg = <0x0 0xb0000000 0x0 0x02000000>;
+                       linux,no-dump;
+               };
+       };
+
+Interaction with other reserved-memory flags:
+
+- 'no-map': the region is already absent from the kernel linear map,
+  so it does not appear in the vmcore to begin with. Combining
+  'linux,no-dump' with 'no-map' is harmless but redundant.
+
+- 'reusable': the region is actively used by the kernel for movable
+  page allocations (CMA) and its contents are relevant to crash
+  analysis. 'linux,no-dump' is silently ignored on a reusable region.
+
+The property is an operating-system hint; DTBs that do not set it
+retain the legacy behaviour (all memory is dumped). Architectures
+that do not honour the hint simply ignore it.
+
 Contact
 =======
 
-- 
2.43.0


