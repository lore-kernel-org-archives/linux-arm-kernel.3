Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A0CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmq+bAz1UkNsQtohwkVTzYtE5dGD+y13agWhpu9mVtU=; b=nM+IRC8KsrlToAMtA0I7EZLiNG
	MGn4OVK54xyz6G6TlMmO50lMH+wnDwrz9qgGLwXICFGmDguCIo86uYR+b3RMUx2WrmWziJWXb+h3W
	0Ml1G3fbTetetXouOHzrOEvJo7gV3GJTdsd1u+LrImLBbD2eNg02xtoA4da0D4Esm+9SIusXpTOBk
	eJhEoLrWTzEJHj8sRDT5azq6PBRc5OKId3O1LIzFwIjAGL/pFQVicAJ5uI+0UfNUyT8beqtpZOliq
	Ujx5CjqBenvnQuo46E/jbgwtZwQVkcLPhalNYzbu0PcapecNoH+/Z44cRqZRzdblXWCFW96VrRqot
	zLskdKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEm5V-00000005rsT-3nC4;
	Fri, 31 Oct 2025 10:10:29 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEm5S-00000005rrM-3wSg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:10:28 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-295351ad2f5so359175ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761905426; x=1762510226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmq+bAz1UkNsQtohwkVTzYtE5dGD+y13agWhpu9mVtU=;
        b=FtNM64DRuU7Vj8bZFO81HQcMperWt5QXBA9aalmuz0Dan7CcrvA3wtnLNBh/+Xh1kG
         POLggPkgtfbpdP0kQ/NFFdPHk8+NwWYmde4j1ORbTQVc6jebjXUQVBxgE2WGMaTWOKSv
         o2vg1PglLJynrY+MiBV0iRGsb2kKjlvfrSIAzcW9kGew0E87F+3d+5SH2Vr0LnUrcnHD
         HTiP3cnKa8UPBI0IHzpe03zEpfPsLTTYpmkeWSBwycPvZ6I4BCn0DobefOAWEndeHAzq
         BP+0Cl8WdzaDtPdsCOpG+icbO1gXa562ZJwnrxgB9hs4FTdl7Y7WbVcKFeIu0fwNnaAQ
         4eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761905426; x=1762510226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmq+bAz1UkNsQtohwkVTzYtE5dGD+y13agWhpu9mVtU=;
        b=RcCFe537DtwBM6/XMVIKbEMLbsoHdEkQ7fB3M5DiIhcwzrWfKPCPbYnWP1v5OgA01C
         K/ltFKgk9eAlgqq1UWkYpebykErm72qoeMBbgdyAwMWzatU4O4tCLzA3nWYVYrrxUFY9
         9vCRMGpFRyqmjxdGXiJIaJJSthRma8wYLwJFnr3+o04Ni4CPRcGSmIxdzUVQemHX13WF
         t9r98ohCkI2v+8rTZoqt3EAk69wgrJsd7dSv0ZE418QSdZNYjZv09ei52Nqr1gTtwWKG
         1YEsEeyEYPludwifopLeKXclGnAVd19PY5ucZQCXYv2F6VjYDSBdjoj9m36nabSIi8OJ
         comw==
X-Forwarded-Encrypted: i=1; AJvYcCWsa95YfzKcFXXIfywTycqDsBoReGIY6h7AjUcHEvlkM1wIE/4j8BNTGccDt5TclQbqocUtbU6EcOri+4PMhwPK@lists.infradead.org
X-Gm-Message-State: AOJu0YyyEME/vnt3kZBzkbSiiBy2RBhMXUF6XMdj/GVMcu4jNPIWypQh
	V3z1bfxa8MnVwh+XY+wVu7TEXnEc6m/ENF+CM+IhdrS4k7kR+VBPlGQl6nGRb40ijtl/0K61/Fr
	hCZlCMQ==
X-Gm-Gg: ASbGnctbwZdq5PSOp4bMaFlqpI6bejcEcZNlzclG9GAdT7Lkarrdb5SiM9a6NP96t8M
	5E2sI7ZCzARyKSj25Tq3T4F1QaV2BxXP+apWRubfVCldFgy9uUW4+6vWpSzKq5iOViJE95DRKgv
	qcLEtNc4EKhb112piD1+GmV+DIzHH5SNWsWlL6Iuq15IroCthmfOxeet6GQITKpwgptswu522dy
	zeiFMv3HlD1TM4xbXwOXR6kMAq0mdt19WEXnt8odWQuoitsmOM8wYPvHI+bJ61mB/oaWhlb5ItC
	yt0GMpGRummX6y+cgqjlxnePBF6k0dCCVADuPMhpHqv0T2SQOCWfneFZ6/w80oI2QCwI7JzrY3e
	TwdpDkw/vpvPkBCG0zD9j2efBj3PF5swcJt+13f1WMQOrQt+v/XyY5+sLR3hdWiMnBswIooGULX
	58GeFNlCBl6G8ZUnWGi+Iu7cb7roB4hDsaCrC/tE8LCCIKlJw=
X-Google-Smtp-Source: AGHT+IHP0KcJILf7X9uuGPb4TLUcbh/zJGOXAc0JvgPUtH5JkTiBAWLIYK309sM/jCBKRYZpJQMPaA==
X-Received: by 2002:a17:902:c94d:b0:27e:e96a:4bf with SMTP id d9443c01a7336-2951a37bb0dmr23125135ad.2.1761905425939;
        Fri, 31 Oct 2025 03:10:25 -0700 (PDT)
Received: from adriana-dmi-upstream.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952774570bsm17458545ad.99.2025.10.31.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 03:10:25 -0700 (PDT)
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
Subject: [PATCH v4 0/2] DMI: Scan for DMI table from DTS info
Date: Fri, 31 Oct 2025 03:10:07 -0700
Message-ID: <20251031101009.704759-1-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031084101.701159-1-adriana@arista.com>
References: <20251031084101.701159-1-adriana@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_031027_075156_568289F4 
X-CRM114-Status: GOOD (  15.02  )
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
"linux,smbios3-entrypoint".

The first patch introduces the device tree binding documentation for this
new ABI, and the second patch implements the driver logic in dmi_scan.c.

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

adriana (2):
  dt-bindings: firmware: Add binding for SMBIOS /chosen properties
  drivers: firmware: dmi_scan: Add support for reading SMBIOS from DT

 .../firmware/linux,smbios3-entrypoint.yaml    | 25 +++++++++
 drivers/firmware/dmi_scan.c                   | 54 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/linux,smbios3-entrypoint.yaml

-- 
2.51.0


