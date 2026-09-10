Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C01C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QS/rswidDYc7zKh1QoD1+mqk8IZbOAibmQnAiC6jcYg=; b=IOAfWJIP6W4hCi9oFEEV0wgKcp
	CU1SRdloWmg3H8FHiHRI5DBoZqG6i6YrgdDnOVyMBrW5RsPnpaLqtt3W5wCEGkdNe/miJsq79ZBLN
	cTHbrqRA5l/PvbHdf7p3RlvDimaSJWJgEfUGZQ5s/JYeKboc1oN/q1rnLqu18CBrYZp+aXBaCwHZK
	W/fbPQTzsGjI0DY9cjXtI64erx8LjDhwBETgYJnpb3KM+qEJwIAbTWlOfMsomVVa7uqzTue0bP3A0
	Y8eyB5olnI1upUFjYGrOlTQboyr46YJK2u07WigVOjaFClPddLBgDkvGcyx/VWCXi0egbDRkkz8hZ
	2JmCgjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YOk-0000000DXWr-2kTq;
	Thu, 10 Sep 2026 06:36:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YOf-0000000DXUd-1saD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:36:37 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso63629865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022191; x=1789626991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QS/rswidDYc7zKh1QoD1+mqk8IZbOAibmQnAiC6jcYg=;
        b=OiQLsWKoUpCQabdFpF6F4JRwWzmzg6VZu7DgyH7lxLIAOVxxkdl28mq8qcWoZ4gQAo
         4XIANO08lAiX+zczIhSyhNqnIU5YDKIX5U8uTXt74lvqZfbGkEmlZpnWJnoumTuagAaP
         ws7G7Pm/Ec37x9LCikYgwtQ+jkFD0y5KUxlLut13UvuprtubQApIO8YoyhEzl+cWoq4t
         KsPsZMLSop0MUQcB9Xl4mKodsBSh8W0Wyg7gVAGOJcRwGfYrCZjFarnqAalYLjYJaZHi
         0Fx2Dtt3iZ4yfvhQGx7nHoP5LP3kstjHxIiNjABW1JunJtzdFiADZwENxdJWK2xHi/ev
         wm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022191; x=1789626991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QS/rswidDYc7zKh1QoD1+mqk8IZbOAibmQnAiC6jcYg=;
        b=ERAtk6kaCui9J22OrGRs0rSb3BrB955Mal7e3CbtFQzn5n/gzxZHFz9zgOcH6No9jq
         8CGHoDoRiyR83Iq4jIm1rOU/Ud+GFLpQt9B7ooTjJunr1vZ2shuWsKrohDmaslVtBf65
         A2HZH29m2xgu+JFSXH4kzpxfqX4WVKNlZBVjrLUCMibJd+6VJMwWahStDeRBCmDXpLjU
         mmeCNPBTrIWC2/3O7GWYHGJ3+Wev+QELe7cNoAwCJOw97CZTnIQPpYKxJvjxnv8LiCeC
         ihJ2dq5Gc/y92RP0r+Z4lzayA1rgB1rnSq8a/ApJpbdJU6k01oK+0ZJak7ohHtN7UWKs
         o1qw==
X-Forwarded-Encrypted: i=1; AKwUvBxszUERp7RrmlDQn4TQaWTTLZfRmeMnrY5cbWalPAOAafIrKck4uO7Zn4+5mmUP7VIXyYkwTiwTSAgKJ4dSa781@lists.infradead.org
X-Gm-Message-State: AFuF++mv3SBApFbeurKE4RS3dFz0x9Cri61PlQf1fVBmziZ8eOHqnjgk
	ItrU+XA9KAkabCCKDNu7ECMQeX+SX1sD+wV39xXpncAaoG8prn7OvYfw
X-Gm-Gg: AYBFou05gKk3LbLb+d/KW1rOJSXaJpQtjpcrNkl0OUx5tgBVElQWMkY+vRqqs/TuoLi
	fQ5ttxiiO/pmJqmswK5sEC8WDkzsM37H8i3R2rAM98wSpG6SG6qV+i6Mdkr00Krm4QNVJouH3aO
	/Q3a1r8vvtInctwuUsoyJXGI4JRUuEl7q+gQh2d+MSFnmcvRyiGnCDIqIkfCUMX4qEw757anGc1
	V7e14gbKrJfGG8dP46QmrvsCdqq3of/RK3FLeZBIFHCFbpG9DBifHYLNzHs3meVTQTUPuNE4dYy
	BeMrYwXETXf3+5Rmox1fvxscSVbNAUeF0h/Jx2myKEUZ3zE0uJerox/0bFzhORTmfN4hJXP/sRv
	+9rB7tHzy4hds+tAD2ns9aGVpyF1p4iGfZUetxSxU0wYs7qk8jykBGdwjsDBIA4QYNT5ZZm1M+r
	8RYSyRAQsLJAEzPN6GH5tV2Y5GMS7OXUvmtIuaFlS69C+ScFjR0YDZs2MFuZDTi/ytkP40IamfN
	r7uqRgnypVB32bnsLEIc/0xz+11RCXTZmbjEeA5NTh+8JvM8fhm5aPgAC4o/7vKZu1TxlAjNAWc
	jVFpWkGF8FlG656e1BuO606GKxwgmCR1qcjIzdRUUxlln5GKJRpMpFBrGFi8uLXhU7W2i/RMvgO
	HAvqY
X-Received: by 2002:a05:600c:19d0:b0:49d:1840:4fd2 with SMTP id 5b1f17b1804b1-49d18405074mr152224855e9.23.1789022191188;
        Wed, 09 Sep 2026 23:36:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bfdb4asm47766655e9.11.2026.09.09.23.36.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:36:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/2] ARM: preserve DMA_FROM_DEVICE buffer contents
Date: Thu, 10 Sep 2026 08:36:18 +0200
Message-Id: <20260910063620.17768-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_233633_512449_AC084BC9 
X-CRM114-Status: GOOD (  16.09  )
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

This series prevents a DMA_FROM_DEVICE map from discarding CPU-written
buffer contents on non-coherent 32-bit ARM. It is based on
v7.3-rc1-324-g986c24e0fe44.

ARM currently invalidates these buffers before the device writes them.
If the device writes only part of a buffer, discarded dirty cache lines
can expose older memory contents in the untouched bytes. A stock USB
webcam demonstrated this through usbfs. Short isochronous packets left
gaps, and usbfs returned non-zero data to userspace from bytes it had
cleared.

arm64 changed this handoff from invalidate to clean in 2022 with commit
c50f11c6196f ("arm64: mm: Don't invalidate FROM_DEVICE buffers at start
of DMA transfer"). Arnd Bergmann's 2023 ARM32 cache-maintenance series
left DMA_FROM_DEVICE preservation unresolved [1]. This series keeps the
existing ownership hooks.

Patch 1 covers v6, v7, v7-M and the common outer-cache path. These paths
already invalidate when ownership returns to the CPU. Patch 2 makes the
legacy write-back backends use their existing clean-and-invalidate
operation at device handoff. Their no-op ownership-return hooks remain
unchanged, avoiding the additional completion traversal raised during
review [2].

[1] https://lore.kernel.org/r/20230327121317.4081816-1-arnd@kernel.org
[2] https://lists.infradead.org/pipermail/linux-riscv/2023-March/029740.html

Testing:

  - An ARM11 MPCore (ARMv6) in a New Nintendo 2DS XL lost 402,080 of
    409,600 CPU-written bytes in a mapping-only test. With patch 1, none
    were lost. The UP kernel used out-of-tree platform support and the
    same map-time invalidate as mainline.

  - On an ARM926EJ-S (ARMv5TEJ) SAM9X75, eleven mapping-only runs lost
    339,936 to 351,744 of 409,600 bytes with the existing code. Five
    usbfs runs checked 245,708 unwritten gap bytes and exposed 29,403 of
    them as non-zero. With this series, five fresh 100-iteration
    mapping-only runs on the same board each lost 0 of 409,600 bytes.

  - A Cortex-A72 running AArch32/LPAE did not reproduce the loss in 22
    existing-kernel runs. This does not establish whether other v7 cores
    are affected.

The one-pass series passed focused W=1 object builds for ARM926,
Feroceon, XScale, ARM940 and v7. The remaining legacy backends have
source review and compile coverage from the previous two-pass revision.

Neither patch adds a cache traversal. Patch 2 changes the legacy
DMA_FROM_DEVICE operation from invalidate to clean-and-invalidate. This
can add per-line work and memory writes on dirty buffers. Throughput and
CPU cost have not been measured.

Karl Mehltretter (2):
  ARM: dma-mapping: preserve DMA_FROM_DEVICE buffer contents
  ARM: dma-mapping: flush FROM_DEVICE buffers on legacy backends

 arch/arm/mm/cache-fa.S          | 1 -
 arch/arm/mm/cache-v4wb.S        | 1 -
 arch/arm/mm/cache-v6.S          | 2 --
 arch/arm/mm/cache-v7.S          | 2 --
 arch/arm/mm/cache-v7m.S         | 2 --
 arch/arm/mm/dma-mapping-nommu.c | 5 +----
 arch/arm/mm/dma-mapping.c       | 8 +-------
 arch/arm/mm/proc-arm1020.S      | 1 -
 arch/arm/mm/proc-arm1020e.S     | 1 -
 arch/arm/mm/proc-arm1022.S      | 1 -
 arch/arm/mm/proc-arm1026.S      | 1 -
 arch/arm/mm/proc-arm920.S       | 1 -
 arch/arm/mm/proc-arm922.S       | 1 -
 arch/arm/mm/proc-arm925.S       | 1 -
 arch/arm/mm/proc-arm926.S       | 1 -
 arch/arm/mm/proc-arm940.S       | 1 -
 arch/arm/mm/proc-arm946.S       | 1 -
 arch/arm/mm/proc-feroceon.S     | 2 --
 arch/arm/mm/proc-mohawk.S       | 1 -
 arch/arm/mm/proc-xsc3.S         | 1 -
 arch/arm/mm/proc-xscale.S       | 1 -
 21 files changed, 2 insertions(+), 34 deletions(-)

-- 
2.53.0

