Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E760ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqPGPofsDjLbOGH0rnbeWAJ0+JsLnxZQ9584rgmYpJM=; b=WdmuElsnFqpWUvT8GqBb05H86C
	D1h2I6Vf3iCQyk/BYR8FEppjswsN6XA/K+Q+xl8Q2MHwg7I/38OO+qIWXSqsws8Y6RaRMQt31AI9h
	3YHfUIeLQ+w+ah99nQBhLx/bdaUedpLsMsUXQzTwz/EtXSiBHWlTkCkkVNpfsVTaPV2ctXNgM9Ozo
	f57ozyQxNwimcO1NPj1PdXBnGHBvZk8qRFBlE3JI55RDrrrkLtrKVFmOHMk5/EoGAFO1Y+8y93HBm
	uLDBk2DDomwObaOiUvjwKfRXO8umZX78XH0qCb4Xb75tZJ431xrJ2bYTj38tiOx7+owryglX/bTGc
	aD7naFGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnmw-0000000632g-0Egc;
	Fri, 31 Oct 2025 11:59:26 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnms-0000000631z-302l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:59:24 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7a43936c035so152643b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761911962; x=1762516762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqPGPofsDjLbOGH0rnbeWAJ0+JsLnxZQ9584rgmYpJM=;
        b=az2NhG/H+8RylpUmJgUkU5vt6t/isHY+7FVJvnlkG6cciEs2BcEiak+e493GBzEGaZ
         azJ32uGgEKzuV8VPk5wAXfIun+xo95cBFKSkyRqtI5RkM10HxvLLyqGwrv0wB0ScyuSi
         YB2kgEHVwbGAHeH6lk55Sk3+wfLAJ+Xve4v1lzN36wnvnqcNbsf3IM6wPE0H45eQV7D4
         VakXQ/ZmtHrdvJPH34na3nzwYF6E4IkNkfJNs/XDjw4cSlFxu9//3j021krFAWTRPsBw
         uxIyliPd3RhVJuxtEWlfm+88+0YmsjsQaT3qIwOIyp/eKY1M60ZKe+tW7++iIXkf6U6y
         rrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911962; x=1762516762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqPGPofsDjLbOGH0rnbeWAJ0+JsLnxZQ9584rgmYpJM=;
        b=qMnpQYZIwrwqH5OPI99Sy7HIiyaX249YbufGQl1l7Pf9sOxrnp3kAk0OkgT6ZHTvUM
         iqmEeNkLDl7geBYEv9nASNdygl8LxD9wmkMl1u+W0yv/FLHIYGaa5fwho2YLxrmlsqyS
         gmSEPQB+h+ZfI1U27ftFQ/KxEiw+NRGUOFGElh9nTHj5Ud7/nFg2IhiNV8MckHYMfS3e
         xoR/x4fXAsVBvJ5wbw3XJjcFuBJwTC8FRkWAldQXo407EzXnBInffiHkOU14vD6ETQ2k
         ev/u4eJ33hcPUeuseV6R+ztrvtVzroagerXFiuNv8cmay67yz43bfc7MGJsWd0jct6jQ
         R9sQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2XBZ7a9txpQCXFQfJ+GlFb5q3QBYdprx6ERV3N2qEIme8617E+jhco0qkUL5xAW06Y+Ql6uFjOzMUSInbsCNL@lists.infradead.org
X-Gm-Message-State: AOJu0YwM0QzSo7nUbGNbnHf79zoAWeAMuko6+1A8JR1MWuSU4zoDXX0o
	wbeUN/M3ZKw3hEC7upt7+7qMusV9cHVCXsmFg2JC8oitkQUNO/WDXmuCZc/J2y6EUQ==
X-Gm-Gg: ASbGncs+/HwRVj2SPTlENm8Gwgp7cbzIh7E2u24n/LaEBggUfSEUin1POdPZ45tzNVT
	JwjNuWugdzsj2lT/LWIGTkpkyQ8wDRWBhT0EpuneXCYw5nawCwUBPCFW85QaQsOEn4e7ui1neRU
	4R2ik80dmWW4z7ILA1EfiTfTGypobsexqqHVwsfQcUHvtoru3fdvwf6s+8inw44c2W3Kk1TUdTW
	aDP1vh7a0UteGf7ShdKdA7K6ZYvib3UB4o2TQcXiKE+j+jhyCUZLtfRy7R2rvbl5XZvP1xOQR6n
	nESzhamP1kpdcGZ11yB1ZDiL22D+LhDvawpaqvPbJc7mDFmyWI1z2tayP0Lo+xQef7FT8YsTlGC
	jIP6CCGwxqbWIAFVZTp1H3eilOvoISUxJjyqvhjqMp74nveywvGVu1K2plblLyAZK2QRFo9aZwN
	O2c8HJCUvKsC4ACPBMybxD2KjX+icGIrvu1jwzOgeEb14bc8k=
X-Google-Smtp-Source: AGHT+IG5NB5+LRZtm0ExsbVUC4NOlOx/SwbXsQNMfhC5es5sBTc2hH9ErmodwvJH/vPOTN6UenpeVA==
X-Received: by 2002:a05:6a00:39a0:b0:77e:ec80:b3d0 with SMTP id d2e1a72fcca58-7a7797c305emr2344339b3a.3.1761911961486;
        Fri, 31 Oct 2025 04:59:21 -0700 (PDT)
Received: from adriana-dmi-upstream.sjc.aristanetworks.com ([74.123.28.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7dbb61839sm1973837b3a.71.2025.10.31.04.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:59:21 -0700 (PDT)
From: adriana <adriana@arista.com>
To: ilias.apalodimas@linaro.org,
	ardb@kernel.org,
	trini@konsulko.com,
	robh@kernel.org
Cc: krzk@kernel.org,
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
Subject: [PATCH v5 0/1] DMI: Scan for DMI table from DTS info
Date: Fri, 31 Oct 2025 04:59:16 -0700
Message-ID: <20251031115917.713105-1-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031101009.704759-1-adriana@arista.com>
References: <20251031101009.704759-1-adriana@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_045922_855503_31DCD7DF 
X-CRM114-Status: GOOD (  13.54  )
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

Some bootloaders like U-boot, particularly for the ARM architecture,
provide SMBIOS/DMI tables at a specific memory address. However, these
systems often do not boot using a full UEFI environment, which means the
kernel's standard EFI DMI scanner cannot find these tables.

This series adds support for the kernel to find these tables by
reading the associated property from the Device Tree /chosen node. The
bootloader can specify the physical addresses using the property
"smbios3-entrypoint".

This patch implements the driver logic in dmi_scan.c.

Changes in v5:
  - Removed linux,smbios3-entrypoint.yaml file and the first patch.
  - Renamed property to "smbios3-entrypoint".

Changes in v4:
  - Renamed linux,smbios3-table.yaml file, removed mention of ARM/ARM64
    (Patch 1/2).
  - Drop the second definition of dmi_scan_from_dt() and fold checking
    for CONFIG_OF (Patch 2/2).
  - Drop unnecessary goto on the success case (Patch 2/2).
  - Replace magic number for entrypoint size with SMBIOS3_ENTRY_POINT_SIZE
    definition (Patch 2/2).

Changes in v3:
  - Removed linux,smbios-table property, only keep the SMBIOSv3 property
    (Patch 1/2).
  - Search DT for linux,smbios3-table only, removed the code searching
    for the previous property (Patch 2/2).

Changes in v2:
  - Add missing Device Tree binding documentation (Patch 1/2).
  - Split the original patch into a 2-part series (binding + driver).
  - (No functional changes to the driver code in patch 2/2).

adriana (1):
  drivers: firmware: dmi_scan: Add support for reading SMBIOS from DT

 drivers/firmware/dmi_scan.c | 54 +++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

-- 
2.51.0


