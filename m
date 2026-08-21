Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AECC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hxifr1UYcEhHY7h9xgxgiO7sFgG/cENK8WDrS7E9Mf0=; b=e2rAYDv7jlSmgAtifp/3EVbdrO
	2guS20C1P6HDBusGPDEx/GLKdRb57jb2xKqqG0mr5ALXPrPaJzGoIlQ0Hu510PPjUG9DruLPq9YFr
	FpRySmX195BtVkQkSNz4fPensQqpqePsH4t8g4z85bpTaRQZwA1hqLwTL7VuJ83hp+yLdhGGLWwrA
	riOIo61H5Nc8zAWCnSuI+j5qNl3cDXpYbFsteD3RhAGa53xzMZ4GWFTQmJ+i54o02uOM3N9+n97um
	R3Pj4LbMSLf8ruiObW7Qn3aCz4musRSa5teomYXFzQlYAUEniYZLEX03gvguf4MTfYcS5usDaWb8q
	UoB6HmNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOQp-0000000DKlk-1WGd;
	Fri, 21 Aug 2026 12:33:11 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOQk-0000000DKl8-2oJ1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:33:09 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cf52d15d88so7782015ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315586; x=1787920386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hxifr1UYcEhHY7h9xgxgiO7sFgG/cENK8WDrS7E9Mf0=;
        b=QKhSRgFfBJFWKUck3iqxIShczKE4VwIcVB4zPh621DV9TWziRsWfW317uiRKyCSne9
         L+FEtWIeyhoqjUXYJspC9h4XVLVITSEMibRYzuHYjfsSPLn0RMxDpZP6nvntuxO2NJ8G
         huOPSdPE/xaDG64fLWHOepvWJ5bJuYO6cfzA0u07ZUO/JvmIoomNX8aB6OOpEVwN7Cz0
         FgaSAhyksQFSodHWLtGjgpL5OZo5Nf6dpvvgQEOZTsNvll0kh/4DkUlJoZ9AS41NVW01
         jz1d03hJNd33PBQHn6HtDkIo1o5O4mhMRxYqzkSczdVEii9k90vNuRf2oC6x03yYK9Id
         uxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315586; x=1787920386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hxifr1UYcEhHY7h9xgxgiO7sFgG/cENK8WDrS7E9Mf0=;
        b=hL53+Ns7FfgBxpXTKjNEzGvxZpnZT8lR088laKNnviscQK6uwH5OjG0119BDhZbyGT
         9XcgUt3XnGjELTmpOzJjrgjRXBd5ZOEEZbEbslv+pmykzGsCIpP0dTSGzO0wO5kxuT1z
         Apmt2RRFx2vCKtaAV4q+anLHAmm3x1UQanzSCoLcpChz0C96WxNKh/ltN0wVVKBuZT28
         W6nqNbQWze8EETJUn1kxvsPrpgBy/EKySvJDzoG5WR69BgYSULYwhkZCcwGdMVisW2a6
         cIwtXeX8lN+HqtkmthBS18yM9QP8ZSzQVJzbswBVfc2nSmBaQo2F0nB0Cas3UnLu80j/
         IVnA==
X-Forwarded-Encrypted: i=1; AHgh+Rpka7FUV7dUEVN/ddApqAaU0FQF3j5/+DMHU8Pce57gK560AINFQGE7m90NY8VlyhFMeQUDSf46acvHPqNVOXFT@lists.infradead.org
X-Gm-Message-State: AFuF++kqBmD6uPQne1fLzMfZVcbeK5XVOn+QfvADj/+NAfFz3GvuqkKP
	mqjWm4h+z+fodDKbZE0D93rtF6U5eOKBM9b/fMdebaY3ITX5mnWbskqs
X-Gm-Gg: AR+sD13ln/Dn4/SHBGEpZqVgdrpEToNC8F8m2foo+EjBCV7M8BW/cIjTWq88T+au9km
	WNIGGrtns95qo4Sd7EOa58aK/iDUgUDtJojylS9Q29wG1EepdZ+0ixGwGGTZmcwmnnegSat6HH7
	hDebNr9gF7fYwGhx0uT0flpHNSv/OyCqni4TC1zHe4yzGDNlSDCh5KHrWLmfInbCklmXX+LjBJO
	+fTPRB9ZalO/9WpZ4LoGvmb3MZUuROBxMJIHApERwS7kI1OPB0T3WdGFbLgO2TpK5303CsdnhYh
	BEuUs6RvLFswUGy5Sc/SAfopqTe9l7P0KZnQkshesOv/ApsjG+XAbZQDnBudeVlAJbvo99+EYvc
	Y5Pea0bG0EjAzjoMClFVXGLhHB7V5d6W1T9w2LH2XIbXSVo+CMeop1qwoa/AVNbl774GpOxioaC
	xHjot1yzpbRjgVdw0JNy+/SYhOb6XzlQbB08injRCpowGbZSc5Q3M0yots6bkkhP8fFtAldJu3X
	HMjIckZhHeC7jxlpOQTxF7Zcz55Jsa3Cziq4wSYY7D/eOxHtiShRVr+hVi8vtHXmGsRlrzhBJbo
	hSP6
X-Received: by 2002:a17:903:1ac4:b0:2d5:cb05:49e0 with SMTP id d9443c01a7336-2d64b0162efmr128195065ad.12.1787315585738;
        Fri, 21 Aug 2026 05:33:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1d8sm18402285ad.52.2026.08.21.05.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:33:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net v4 0/3] net: xilinx: axienet: Fix IRQ error handling
Date: Fri, 21 Aug 2026 19:32:46 +0700
Message-ID: <20260821123249.41527-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053306_712046_C8AC1E55 
X-CRM114-Status: UNSURE (   9.74  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes IRQ error handling in the Xilinx AXI Ethernet driver

Handle errors from optional IRQ lookup and preserve the original error
codes instead of returning -ENOMEM.

The changes were found by manual code inspection and compile-tested
only.

Link v1 : 
https://lore.kernel.org/all/20260811034715.6034-1-phucduc.bui@gmail.com/
Link v2 : 
https://lore.kernel.org/all/20260813042012.17631-1-phucduc.bui@gmail.com/
Link v3 :
https://lore.kernel.org/all/20260817105241.63345-1-phucduc.bui@gmail.com/

Changes in v2 : 
 - Split one patch from v1 into two patches.
Changes in v3 :
 - Move the lp->eth_irq check below instead of handling it immediately 
   after platform_get_irq_optional()
 - Add error handling for platform_get_irq()
Changes in v4 : 
 - Add Reviewed-by tags
 - Add error handling for irq_of_parse_and_map()
 
Best regards,
Phuc

bui duc phuc (3):
  net: xilinx: axienet: Propagate errors from optional IRQ lookup
  net: xilinx: axienet: Handle optional IRQ return value correctly
  net: xilinx: axienet: Fix IRQ error handling

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.43.0


