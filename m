Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DA3C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4luyYPlKfAPRsR57HWe+RkabsdRokVmRAf5ceEum6xg=; b=tFobJkLOaiPcBCqyl4XXr+LYMF
	7M3qDSvPaPUzqx8lfxY+QAi/k+ZPbHxkq3WRVmN7j4Y8dcfA3H1X4J45vRvnkyFkQvEYS8oaMeiDA
	ih3Ibx6AziRfw6ZXalAYwl3fSFLb2ZR9FJ/xwIMuOJza1g0AKsgVSp8LmS5FAy7AciqXsgfFAvBuR
	37h2qU84g1ziuOwx1JlLTAhtNqdYfPEJs6+ntS1yIB1I8s1AonVMKbEK9JhTuw4EaNjYw6GF+4YuQ
	3GfF+fW8wMI+++d8+Hg9mmU6EvrQ164Eo+aMNmuDadw5jSsMVrqA6giCqLPJAeb5g6mUd65A/2V+V
	+ein3HGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Sqf-00000006eYG-3uap;
	Tue, 15 Sep 2026 13:05:21 +0000
Received: from mail-oo2-x0d.google.com ([2607:f8b0:4864:31::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Sqc-00000006eXo-2niq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 13:05:20 +0000
Received: by mail-oo2-x0d.google.com with SMTP id 006d021491bc7-6b1ae721872so103419eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 06:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789477517; x=1790082317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4luyYPlKfAPRsR57HWe+RkabsdRokVmRAf5ceEum6xg=;
        b=fet7aKicjrT9u76UHGC/phFX1Pa5BHW9G18TuGDWvstz+w6gxkpAmdaYCn5XzK1yX3
         a8V+iaZvuJ+cVDDp6fWGX5dO8YGxZzrz3KaZGl7aZ7Ro1noKUf7ot6u3hLJYTOzIh/sz
         XSylCdAeKxMSCR0+tA5vOYOdho3HtfY4vbGRO+xRI9pbaDg9zCCQE/6T30+6RTX2GmCJ
         49ZwWNA+O4BUrOOqFIEJmQiM+k9Tmhla2b5xGWDIPmPn3vbQ7NXaoglo4ekIzxl+w7bM
         fdmcJdU9kdu8eNO225nMcg+L2Q1JZjGpN6Yivb3/iaT0CI80fd8qVRdgznmvA8F2vpV2
         vYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477517; x=1790082317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4luyYPlKfAPRsR57HWe+RkabsdRokVmRAf5ceEum6xg=;
        b=TzAvkDZB72gVDEk1Wkfjsrg0yVOd9MUT+T8BZf0y29R4X4N4e9WxCbZpNtFZYGxF/b
         Vt57aXfgICKfFAjGFrFSgHELytxVzFwdlbYbJKjMPNblCcFzdNA/O0u4QbxOArgQW6ra
         SE2+rSII/Z9qjP9lyC3e2MQiqgWVDb+wDMu/fh2rJr5VpfP54c4Pii577vcUhKqwCpqv
         MuHhFredmM+NGxq0ufePqlZDZOGjIjY/ZdDZCFetp20+B4NbRAOkIGPFriWzU2ncRhD7
         +/Feihma9300Kxu3gGRmA9e90EQfFxc2PElDHxLp+Tsc28sXY51FtcWGeAfsVgoMCvwj
         NERw==
X-Forwarded-Encrypted: i=1; AKwUvByiXD4sUmvGSRxb+a056SGgM2WEUwppn9iBe/tvZZ4W3laQDtGWPfTrajNE4KvO+d54tZKS9tSxKP5exSzOG13t@lists.infradead.org
X-Gm-Message-State: AFuF++lJ+oi0yENVqKEFE3pXSa1U4EyWiANOer3JLDbF0i+QpM9T0Uo0
	FqW+dVF+pDL/EU8wG8sCtciYKHLf9JHOpIgxg5X3EFLZlUKzrO5o1LLL
X-Gm-Gg: AYBFou2Er7biYvOCptfj7Z+uVB9R9VBUhNNSzImkOYlzRs5nEPmODLawULdrTZha1cg
	rUFQnkSMzY6MVru/UDMWVrnrF7jRnCHawAwe2lHoJsR5/NXCCDQJdcWoese/iE8LSv7STOgj0h+
	PJADRH35UnwSCwDUae1yDFjKNgbih1K8HAhq8SA5Xc5bKzqINiW2qcorcuYqYaJEEzU41n2rFM3
	UN2DZhIwa41XBnLw10WgQZtgI86tBFqPLHTrnHWsaynzRasy5A/5WlsYur/68TRXTuyGnfsLG0q
	vDuiFoYsLS5k1jkGLkvJTmZgUj/w6C/FErcOfz2fmjZogBsgtxtO03mZ7dKXSqWW+2APtoFVc+h
	fk9HXuT/7zwM2AnU6fzbgGhWQFRQei+zxKrV+lr6Dn78MiEGZHmC759vda34GIEG3o9hHxEEvi0
	6aE4e0kJebYR7JryuHdABQykMdMO+P6M1ag1ndUGzm6cdXMa/+XXznI6ykSDL6fPkWUEoB24D9B
	+pWStjin2VKbqd3
X-Received: by 2002:a05:6820:1985:b0:6b7:83d6:292b with SMTP id 006d021491bc7-6c739c72294mr552478eaf.46.1789477516775;
        Tue, 15 Sep 2026 06:05:16 -0700 (PDT)
Received: from ai-agent-sv-01.. ([43.135.169.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf11e6af6sm1299889eec.3.2026.09.15.06.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:05:15 -0700 (PDT)
From: NoNine <chenmin83@gmail.com>
X-Google-Original-From: NoNine <min.chen@siengine.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Min Chen <min.chen@siengine.com>
Subject: [PATCH 0/1] coresight: tmc-etr: Sync the trace buffer for the device
Date: Tue, 15 Sep 2026 21:05:02 +0800
Message-ID: <20260915130503.645953-1-min.chen@siengine.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_060518_719332_F31025F8 
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

From: Min Chen <min.chen@siengine.com>

The flat ETR trace buffer is allocated with dma_alloc_noncoherent(), which
reaches dma_alloc_pages().  That API zeroes the buffer with CPU stores and
requires the caller to sync the memory for the device before the device
writes into it.  The TMC driver only ever syncs for the CPU afterwards, so
a non-coherent sink is handed a buffer whose zero fill is still dirty in
cache.

On an AD1000 EVB this shows up as 64-byte-aligned runs of all-zero
formatter frames in the first window of a freshly allocated buffer
(1,100-2,400 runs in the leading ~4 MiB; later windows and reused buffers
are clean).  Writing a known pattern over the buffer before the arm and
cleaning it removes every run, which pins the loss to the buffer
hand-over.  The ETR node is not marked dma-coherent.

The patch adds a sync_for_device() buffer operation, implemented by the
flat buffer, and calls it from __tmc_etr_enable_hw() before the TMC is
enabled.  It is intentionally flat-only: the ETR_SG and CATU data pages
are allocated and immediately dma_map_page()d, so the map performs the
architecture's for-device maintenance for the first hand-over.  Their one
remaining corner case - a barrier packet written into a full buffer before
a live drain re-arms the same buffer - has no reproducer here and is left
out.

Tested on the AD1000 EVB: five first windows on freshly allocated buffers,
including the first capture of a boot, carry no all-zero-frame runs and
show the ordinary clean-stream profile (2.851% zero bytes), against
1,141-2,360 runs for the same measurement without the change.  The patch
was rebased onto the Coresight for-next/queue tip 5442d22da7db and builds
with arm64 defconfig (Image and modules, no warnings or errors).  The
hardware run used the vendor 6.6.87 tree; the rebase carries the same
change.

Min Chen (1):
  coresight: tmc-etr: Sync the trace buffer for the device

 .../hwtracing/coresight/coresight-tmc-etr.c   | 29 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
 2 files changed, 30 insertions(+)

-- 
2.34.1

