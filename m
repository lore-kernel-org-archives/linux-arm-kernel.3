Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2E9CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 01:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60J2VG6f80i0xtDeR4IknW0h4MKxDdpuTKlVp7+7Fow=; b=gVboOQkcQBf4RbT5RZYD5NJg2Z
	0AtWAb4ja3bxaPq6J+bY68m8x7aT/fRiL7Wn8p9zCILi5fpFgGet+4tQIxp6ppGBOX8fQyxx67lki
	Qymt8aa5lru8RnlN7fdn6nqKHf98HMIVXQ9s9NdJTpde/XMYDyr174u7i5QKWQY9WGMUa/B3iMlEr
	0L4LGHByZPEcKLtupbe5sc+jzBuKHbW05wMAuZNI5GlQI15A0U6BlRVEntACdC2zDO2uvDe+1o6TH
	TJC1OHPfDKyQeehYQaxdvKXedH7AxcxN++utUWi08R8owwU+4FCbFI4XcWB7TEwaN6p1KaHMNVGnq
	/f8GHO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhxU-00000008bVx-3uIw;
	Sun, 11 Oct 2026 01:02:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhxS-00000008bVc-3old
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 01:02:36 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso5108025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 18:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791680552; x=1792285352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60J2VG6f80i0xtDeR4IknW0h4MKxDdpuTKlVp7+7Fow=;
        b=ScejhVnbNgjmWkr3nzTtaqGNwkSuSvOgVAfq1e9ErgSyFCjc34LbSrD6PgH33T1svZ
         s/vb673KlfQfNTDY4pfHAW7tCAAAw/wtkole0Ace03l8+Mpt4wlGVIrfAV9Qv5+JP4GG
         bD3+5/LE3LoJsMoy0qB51fqCDNHK0pH/qFTsz60bKdEPm5QfPE4zDK/P6GKhJyy5bn5f
         8BQRrwxV0TxvQEj4n+3xQdWA8EQqYjQUmxSxiaRDdfuj+3XoYGgElSkJ23eygQ54tcXj
         urEei+prpgaRrYmEVXcl2qd9hk4ObnytcMz5sJxfy71hU+92hEM2HaiQRz/7DfyKm4cS
         sl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791680552; x=1792285352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=60J2VG6f80i0xtDeR4IknW0h4MKxDdpuTKlVp7+7Fow=;
        b=gjzT0thjki4iusrurgGwMeO1BEVMn80kJFRgxyNgVBFTfWXDLdprX9iVQ1AiAKZxa8
         76iwNBy0rNV5MToxyxm+UVj+vwJDnrO2o8RiqtiEqolxcctCL7cdGz111oNU86wWqoNS
         hVu1g96iIEnd5aTzB6ldjjLtZ3BJR4AYT2GONkwAfKC5D+96rXJltkYanjZzT+ZpMGBu
         7uswrQXdUq5Ugfsoxtb3SndOJY/fevsReBBYMjSE/eEbFcZMzrNTej2+eZkLxeAkRe/g
         Mq1nFp1B8fTwn2cX8pM2UTjrbWqBSZCR2Qep1XxfjutZMTjIRdT1GfCvLjVLRCCbM3Nq
         i8Pw==
X-Gm-Message-State: AFq9FYJNXgqQG3KZ0AwzdurcEW+kaVB07PELpZC/0ZdBrOP+8TzFl7EG
	DCDuKFaro0gp4ko4yv5danEMF4PaEbfwrAvfTcxqNdOqExdyzIH5nMLzVp43+QeErFLi1w==
X-Gm-Gg: AYBFou14m9tykMHpEmQ60QXBQN/eDcPOGgqassor27pHM2er1BwUAc8xOfUPwe6Fqa6
	XgqCSIpo90ptf9qkChaBSz6xLSt+e+JITpS+SeBseiG6671LbSnT7D/dyz04IPO5kz5GypKMbX/
	pyJhdi4LokTQsBJuxY49WX3VnR3tCyetTcFsXMpIA8rt3IWPScjmECtgJBLDl03+uhUB2FgnwfU
	nvRsVwN0E8sx27fnQ5dqtDbX4f7qR4YGmJYQl8U+1jYF6j6fMI2u5Wl5zFo6PZpw4cn1CrDl+Yh
	2rP+dXEcfSGzEx3Q4p204qfnQylz2pWGMrbyJmCqzOSsV1KFmpmMMu57j56ZKlzT5w4gxp3Az4c
	DGfwOoESXj+e5FB8jV/oexyd4Z0BtxLGZk9442pGxYciFnh6Mj8fv6294lCzrKhTWCAjD/D9j84
	ujZFxRnJyKuufrhjI78jHr5xUTzR9t0ziOPW/o2pmXJbF9m8GvCZ0cx7tBZAR8SO/a+LcPjiT8Y
	4kexzKGPeqrggviXnfwDJ5LgizCkLjCTJGzz/ur/jVNFsfjzqbxMvlrbSF3cL1Dbyt37i+3uBYY
	WXqi0MzWdsbGkDPUw7ifUCJN8/hk0O5VZnyYySqwIdzhlXxy3nN043OQJKQnmw==
X-Received: by 2002:a05:600c:8184:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a18e4f2221mr83201325e9.32.1791680552214;
        Sat, 10 Oct 2026 18:02:32 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6b3cbsm139970805e9.0.2026.10.10.18.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 18:02:31 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stefandoesinger@gmail.com,
	linux@armlinux.org.uk,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when requested
Date: Sun, 11 Oct 2026 02:02:23 +0100
Message-ID: <20261011010223.2379347-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
References: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_180235_006735_7B0373F5 
X-CRM114-Status: GOOD (  11.79  )
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

Hi Arnd,

Thank you again for the suggestion to test arm,outer-sync-disable. I have now completed extensive hardware tests on the physical ZTE ZXHN H3600 across multiple bring-up orders and load scenarios, and unfortunately disabling outer-sync alone is not sufficient to prevent the interconnect deadlock.

Here is what I tested:
1. Added arm,outer-sync-disable to the l2cc node in the device tree (zx279128s.dtsi).
2. Rebuilt the kernel with CONFIG_CACHE_L2X0_IO_LOCK disabled and completely removed my custom read lock from both cache-l2x0 and mt76.
3. Netbooted the initramfs uImage over TFTP into RAM via U-Boot (zero flash modification).

The kernel booted cleanly and confirmed the configuration:
[    0.000000] L2C: disabling outer sync
[    0.000000] L2C-310 cache controller enabled, 16 ways, 256 kB

Both MT7915 cards enumerated over PCIe and initialized firmware. Here are the observed results across the different test scenarios:

1. Sequential Bring-Up with Long Delays:
When bringing up one radio and waiting several seconds until it was completely idle before bringing up the second radio, the system survived temporarily. Because idle beaconing generates very few register reads, the collision window was small enough that it avoided a collision purely by timing chance.

2. Simultaneous Bring-Up ('wifi up'):
When enabling both radios simultaneously in UCI and triggering 'wifi up' to bring up both 2.4 GHz and 5 GHz interfaces together, the interconnect froze solid immediately. The serial console went completely silent, Ethernet ping dropped to 100% loss with zero panic or oops output from the CPU, and the router required a physical power-cycle to recover.

3. Concurrent Wi-Fi Scans and Traffic:
Even when the radios were brought up sequentially, the moment concurrent operations were triggered across both PCIe endpoints (such as spectrum scan triggers via 'iw dev scan trigger' or active data traffic while DMA cache maintenance was running), the SoC interconnect locked up dead every time.

Looking into arch/arm/mm/cache-l2x0.c, arm,outer-sync-disable only suppresses standalone outer_sync() calls by setting fns.sync to NULL. It does not touch the line-by-line cache maintenance inside l2c210_clean_range(), l2c210_inv_range(), or l2c210_flush_range(). During active dual-band Wi-Fi operation, network DMA continuously invokes these range operations, which collide with the high frequency of PCIe MMIO register reads across the internal Sanechips AXI crossbar.

By contrast, my serialization lock approach (which serializes PCIe register reads with L2C maintenance operations) successfully passed 240+ continuous stress reload cycles and boots under heavy Wi-Fi traffic without a single freeze. Interestingly, examining ZTE's original stock kernel (Linux 4.1.25) reveals that ZTE's own chip engineers used this exact same solution, implementing a global spinlock around PCIe reads (fixed_pci_read_u32()) and L2C maintenance to work around this hardware erratum.

Given that this is a silicon crossbar flaw that requires software serialization, what would you recommend as the cleanest, most acceptable way to structure this for upstream? Would you prefer keeping the serialization lock as an SoC-specific quirk in cache-l2x0, or is there an alternative architectural mechanism you would suggest?

Best regards,
Navid

