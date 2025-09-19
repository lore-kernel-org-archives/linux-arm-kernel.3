Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8614CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 08:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kd4+r2dhQsnGJWDtpIiRBK1eOzcnNFsZ+J1UvHrl0i8=; b=PhU2YMIKNZEK4+oeKcyq1eHJxL
	14oDy2y79MNqElTDbZkNuTvW0Ak3+FvVEw4zywb2hWUcWtBcf/3SRef/sn0yOCxeLQecZf7AAfJNO
	lyXmvMM4MO7hnTlNiuVTT7ow2K++u0tMa+GUSUNjqtQYdPlAD7z4PMtX9AE41/MsU1J1m6Rf1KbmA
	s24/ztWG2Z7iR9DmO5kuVIp19qWBjpxsNFdtfWBAPKxvzLyZ3jj6nx6cg+nHN5C0Cy7cN7H9ot+ml
	lJ7aG0gTk3MmqxeiAve5yi+rehZWjFg0VTNedTRwuPU6zEslwnDVfg80o8NtU27vRkDlD2P4GcHAW
	krWSBaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWxp-00000002Ja2-0qHI;
	Fri, 19 Sep 2025 08:59:33 +0000
Received: from mail-pj1-f53.google.com ([209.85.216.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWxm-00000002JZD-1aTW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 08:59:31 +0000
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3306eb96da1so1152744a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 01:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758272369; x=1758877169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kd4+r2dhQsnGJWDtpIiRBK1eOzcnNFsZ+J1UvHrl0i8=;
        b=iEw7/TS9HWIDQuLBKrWIwQ6ZDKoJYSgjiBYuVhQwLiFjPhIhpqqmCEuHizE+mTLggr
         VjpQD++FONjbDecrt1/OLI4w2VN5B8wuydBcx5pRIHdX62X48q0i4ddGq4XG5xSCVDwD
         QTOyWCh1PQ3XdSHt1skHgfcRLRNxP5DU/b0vUA49KCaLKUMLs8pKe+wM4AjO4ccikZZS
         RISKtT+r+Y/B9GEqwXMrIFJlWmG+AUe+C9Vg7b6frZZbK7t4V7iQS6VHTtOMx8Kp/bTW
         QvPrZ1lTW6ROhqAHg9mQAF/mN6Deb1ZQxDOGdr1JmJviD+7/1XdkmEilmrndQuKl9SQ8
         /zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758272369; x=1758877169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kd4+r2dhQsnGJWDtpIiRBK1eOzcnNFsZ+J1UvHrl0i8=;
        b=P4St4NFhJA3vdwxxVqCGblzLj3Y6P/XG11HpBInpg6xd/AcdoDN+BR8FZ5jH0kZSxx
         rKsbxqylKrjiuGDWa/T9pdGPZMaVU1+MEG4ksV/ZEcq+YAiGHlwKnkylkstC3QOOZkD0
         dMWKHRdJ4FgFZUBr5+NcWWH/2d6JVOm9dbold3+GVA8W+4gv2u3Ndk4bkskiyn4DkT5N
         tXfKszisjL5VDRFtLYsamsARGQzVaeAzzZB9vf/YtxTIEjPo1Joixo+8bCfhYyFlgEGc
         XUieHNaxmHzFEmkURgQj3WZg8jvxmPhf5reH+rrzm64TpJnTPkqupbaY/bu3maLTeEiq
         0KPg==
X-Forwarded-Encrypted: i=1; AJvYcCUwkfIQOWIH7fJ+hZaXma3khgSdz7K5gcOwLTb7mJ/yMGcZajcblhndSqW72ng1W2agsN3TYVrkiLG8Ht2u7Eso@lists.infradead.org
X-Gm-Message-State: AOJu0YzypSFYZ2TlCKaDQJ4E4N0DzRt5utqLKvMsJp8MI5NWk97C5atc
	93aAk6AyUMjeYosPereJzUXFuMLV1l+OJDZW3diu7YbVIWmthc4xcBoU6q5NKLHKXaI=
X-Gm-Gg: ASbGncvgayZqIfV/Yg3rVMBAJLbzH4l80P0ifmwW8P0quwWKtvKtQyrIkOyNhCqUF1G
	Wl37DTmMHsvRySzcVj1uVAD8Ihr6wqbW2WA8EKbeQn0VSbEj3snM6MEeUhfS+jgRpfWYjQD0Md0
	3wNf+t8VRCjmznBiAZlH4HS1AXxTihL0F+WKioEvu4Iw8WpvI4/Vs1X6v1JP245nuwIDC0L7DkD
	9Y9T6vN5jpaZ/BLpsj4rYE05rQm9PT4NHxkD6PCmzyiChbAG0bGeVc+yLWhq6q8mMNr3IXdblnH
	wPAsgBOAkaJB4tVFfHHZ70ZYickz9Eq/Cv9UeLMBAZsnekEWPigma4iLgW4HQpwBamVAcIzsWpD
	3AiZ5ag08Yu7rMAImF5ICUN2vDPVJnq6fElGApynQzu36V538U5EEDi3r5t8SBtA=
X-Google-Smtp-Source: AGHT+IHKd0DN1mMgIsdoDc2vCyjSm4FEnZTd1jI/4gD2C7NwmhKkFKPKgahyIRBmjtrslXkABEcCGA==
X-Received: by 2002:a17:90b:2fce:b0:32b:a2b9:b200 with SMTP id 98e67ed59e1d1-33097fee7c1mr2630942a91.13.1758272369344;
        Fri, 19 Sep 2025 01:59:29 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb7ab97sm4687456b3a.14.2025.09.19.01.59.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 01:59:29 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@arm.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	beata.michalska@arm.com,
	ptsm@linux.microsoft.com,
	sumitg@nvidia.com,
	yangyicong@hisilicon.com,
	cuiyunhui@bytedance.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] Add support for parse_acpi_topology() on RISC-V
Date: Fri, 19 Sep 2025 16:59:17 +0800
Message-Id: <20250919085918.5442-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_015930_418785_7B148480 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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

v1->v2:
Place the struct cpu_smt_info{} in drivers/base/arch_topology.c instead of arch_topology.h

v2->v3:
Modify the return values of acpi_pptt_cpu_is_thread()

Yunhui Cui (1):
  arch_topology: move parse_acpi_topology() to common code

 arch/arm64/kernel/topology.c  | 87 +---------------------------------
 drivers/base/arch_topology.c  | 89 ++++++++++++++++++++++++++++++++++-
 include/linux/arch_topology.h |  1 +
 3 files changed, 90 insertions(+), 87 deletions(-)

-- 
2.39.5


