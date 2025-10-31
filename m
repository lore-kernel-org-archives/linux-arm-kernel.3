Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6573CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPyVbe7btBrb/kbufU+DTPGJAkd1ax44z1PEdLO1daY=; b=UOH6UxAS+gbDsMnnBrL/oyWEh9
	ceC7is/Bs9YCG/n/tEovJOBAKxOjhrqv8lc4A4NK6QtmEx3h6oNINhHX/gQ1njWStXGQ/3OVeBuud
	vmWZBFL4IGgkLCHcbT4YaQSfkk7uKiNeIR9F1o7FLAOOCSLLEmkAUdZg8DCZGR5pwE4pU1Zmv6N25
	8EC36zEMBnqRefJPDKd9DikVjGXmyR5OQGt18pVzt/c3F9lTv3eHtv2gtrzTk06Wnapfgb/8fN1Dq
	1juix7xQmT9Hks3r/Crbz/IRRrma+hkYVtUzgyxOImrEqM5t7/eqv2l6EOZCD8uHwBXRfTLiz6gYQ
	1OG++6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkha-00000005fqy-3wWn;
	Fri, 31 Oct 2025 08:41:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkhV-00000005fqc-3qIo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:41:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-295395ceda3so92695ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761900096; x=1762504896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPyVbe7btBrb/kbufU+DTPGJAkd1ax44z1PEdLO1daY=;
        b=MS3mT8au4jb/SmP00e6GEXfZGc0DrNAuGXjA57EDOnhG8wBORE2Bc96RIHvpxrR0nB
         wo74NlH9Ys5zNw8O5z8JXEb25nnM1S0lJpsLFZahasq6Q5/ZB5DJOsgleiLBStpL0fnX
         LOKNetjkrBKS65p+rpcHkOUd/rMuFZw0c7pY3Zlox3UO6YhV/I6JPBijHxqIjCYDzO7i
         jo2U/FgZFkVFFauW9e18kwEhdMfRvZERM53Mz399HvuLtv+0nI16UQY7ly20IL/4c5AJ
         X7waouLMDAuhrcbFghRIP7QmQKWvklUUf4tH0AQogiKkrOysGtJcuk6t7NMZlLoMr5dW
         Y/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761900096; x=1762504896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPyVbe7btBrb/kbufU+DTPGJAkd1ax44z1PEdLO1daY=;
        b=N7VqRJqBZ1RXvNCPJlGJQKez9DGgvcFTH1J0qRIFiIj+9nOxFyGaGfdjV0l6qKp/Xk
         Eja5hfXeY0qVRlChRhBZNO+zvQdgoiOeMuRMlxc4WMCWphWOEI45+wZtRhiS3pmuJ9hD
         ZUwd8kPs6X3bQJYA9+FMA2Rcu6xOXde5tucEAIMNXnR2j9TrKgNo5Wq7ZPhjPNLILHdA
         Oe1Pi2zc2sj9PSvxLOMrILd7spRI7Sb5PEtIkFBpom4lh3mth+nZYa+ZX+j6d+SAVLUD
         szPMZJQa2df4ORy9iYPWWdvRXomuvGlFV/jC9kuZ89ehvBH6Gkk/Q48V4Aw5s3NBr8IN
         E3kg==
X-Forwarded-Encrypted: i=1; AJvYcCV5fxIZ6hgnUChS7bqEMkN8FwSppriVPm8DxtZ6vSg4F7rzbOAQFiS4IPzEAr9S+JZyp6+Bu9NiazTjR5slnq6/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ZrL1hZlCoMHEvjAV1jNLeUSjFmcQIKnP0HXxVT7r3mruJ97+
	FaCRlrbyiccqu3CgXrZWwa1w5vQX88PbSDe1n+ys8gETv6KHWKbqbPOgD1/3GpYE8w==
X-Gm-Gg: ASbGncu6Lg45HRS7UxqeiQ1k2XRyLY6adRHPiLleOv/i0x+2m0v28y+3RZZeIwPEkck
	oQJldkjZv4T9cfQ6ewHOBWKnW8/rggcDDcVW89OKpyVyOfPe9MUofTsUf8Z3NorgE004mltxv56
	5sXtCSlDZP/5G/Uc+JsKsbhtBABYDwgXBBi2RcXvGY4gn6Qt40s6QByJ8rt1J4i5ggXWGgqmqvJ
	M0C2u+MZG1GDGVF/qQl8LvfhDlm/nS72wcGdGJLuO5ll6aLpdt5NsyIrfG8IaoEmfkMm+piNS9h
	XDM+U1imVAkNbL5nJY3JOeP7sjDWlHl8UnBAA3FNF8afdgUYea1Mf563vro+eK/wHjWu23D9mz8
	Af/JMvOWZCOJLtYO3YZgZBDlnlaaRkQ8QH10q1neq9S5SDU9uLHM5TIdH6uepzAuExAtVBAn++T
	aPNl4JBwmV3Kbhlho5srWDHKilQzvlHnMs5a+pAhulPj9bfKQ=
X-Google-Smtp-Source: AGHT+IFRjA11KiQtuDLyXpyzr+cH+MBZZXOEiapTRE2mqruvh26mmlGWuUYPHkHWLSUbX3DkbIXD+g==
X-Received: by 2002:a17:903:38c8:b0:295:37ac:8d54 with SMTP id d9443c01a7336-29537ac8ec7mr1773595ad.9.1761900096398;
        Fri, 31 Oct 2025 01:41:36 -0700 (PDT)
Received: from adriana-dmi-upstream.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c9dbsm15333505ad.84.2025.10.31.01.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 01:41:35 -0700 (PDT)
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
	Adriana Nicolae <adriana@arista.com>
Subject: [PATCH v3 0/2] DMI: Scan for DMI table from DTS info
Date: Fri, 31 Oct 2025 01:40:59 -0700
Message-ID: <20251031084101.701159-1-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022114527.618908-1-adriana@arista.com>
References: <20251022114527.618908-1-adriana@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_014138_134713_5D846F0F 
X-CRM114-Status: GOOD (  14.36  )
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

From: Adriana Nicolae <adriana@arista.com>

Some bootloaders like U-boot, particularly for the ARM architecture,
provide SMBIOS/DMI tables at a specific memory address. However, these
systems often do not boot using a full UEFI environment, which means the
kernel's standard EFI DMI scanner cannot find these tables.

This series adds support for the kernel to find these tables by
reading the associated property from the Device Tree /chosen node. The
bootloader can specify the physical addresses using "linux,smbios3-table".

The first patch introduces the device tree binding documentation for this
new ABI, and the second patch implements the driver logic in dmi_scan.c.

Changes in v3:
  - Removed linux,smbios-table property, only keep the SMBIOSv3 property
    (Patch 1/2).
  - Search DT for linux,smbios3-table only, removed the code searching
    for the previous property (Patch 2/2).

Changes in v2:
  - Add missing Device Tree binding documentation (Patch 1/2).
  - Split the original patch into a 2-part series (binding + driver).
  - (No functional changes to the driver code in patch 2/2).

Adriana Nicolae (2):
  dt-bindings: firmware: Add binding for SMBIOS /chosen properties
  drivers: firmware: dmi_scan: Add support for reading SMBIOS from DT

 .../bindings/firmware/linux,smbios-table.yaml | 26 +++++++++
 drivers/firmware/dmi_scan.c                   | 58 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml

-- 
2.51.0


