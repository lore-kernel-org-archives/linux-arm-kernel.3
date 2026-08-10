Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE562C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 17:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q4Fe/KOMaxyN3MKU9219/iuMnmc5Z0NpUYJStevNPkg=; b=tlkrLhXizM1/NxW1ezRlwYjEzs
	Y7QQtdotbKDwP3ZHfjFl7f/RexJzVLEirMiH4EgyiTL0XODu03HKRoaXNSQBwREG+FDXOj4R8hY5i
	vIOF3HdgOQZJ9ivjKhLJEyfhQsKiG7B9JeyD4LtqqSyl7tPEbSxWmt5cSthqiVyXj3xSb9EKr2AmU
	JwRg/cKwzyzXWZO2kUPi/Om78/URAvMO4GTa9GRaaPYwyCMIINgCzZPCvIvJ1yEGBs4GNYaMesm6z
	htLXriKFJPpL1Zn/eybA645bdSnRFd8wvY1k/NvhUZ9QPoGDRQUo21g1KmWFf2z++r9BldfFtlNLK
	txt0ncmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUDB-0000000CZc9-2j5o;
	Mon, 10 Aug 2026 17:54:57 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUD8-0000000CZbq-0j55
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 17:54:55 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1543877a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786384493; x=1786989293; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4Fe/KOMaxyN3MKU9219/iuMnmc5Z0NpUYJStevNPkg=;
        b=qNG1oZzTgJRW4dERdsC6vJQbWPnUvCLss4I2NxSdQvroDJKqIhnUyoCz/N+0SJRYfA
         FJ3QzqfEzxuuxTCSFYvo78Pz2mJmZevuL0ChrCM4U4Qd7THT7tdc9DqoL0Rr6WLVxnML
         KQuzN1L9ZCFvJgiUxEcRlaxbRMS1amhTm9dSuNkwK3QOMzJKigV1nR7wzHCfgG2AGExv
         p0ZLsI1m8F0h/rSn2ViKzrma0HZDnPkmcU+HUnl1X3r/anrum6SkEZ5dn7ya9juGMOPw
         oFhggWt8MCO1/tQO8kCTnfkQlfb3Zw4EuZcyRVcV0OJ+f6kjj1rTZryZ+tHgm2kyKaWw
         m13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786384493; x=1786989293;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4Fe/KOMaxyN3MKU9219/iuMnmc5Z0NpUYJStevNPkg=;
        b=XRsxHbKHn+vJ8glf/QF5zDm/FKfFmUV+EuufWWEbUSzeRK2JgbdY1+z0DTWoPIit4M
         kXgXVkh6PQ1ZypCyzYSFYfzOJMiNX+L4MXeH7wX4JZLXUiVAn8KBTTZL+j7Swtc76UUY
         tERfYgIvdl8l185OexTfLfV3pDB7wOSdRIX2fn9Z9CxM1eNfH6qrM+a3tA+yGq2QB0Eu
         hxKylr4lZ5afZFYzFyo3YUZ0h+/UR+1Fc7eq+EK6sWZgZhL+A3KTmX0CUsoC3GdVUm4M
         gJ+KRJfpvgnPPmcWirm6dpJDrIoIUxvQfQQWdB46di3MtxkQSK1lctjH84aDcxL9UMu9
         sWNw==
X-Forwarded-Encrypted: i=1; AHgh+RpJa6+G5vMxb7RehHqprZ+kCDakXSMAoAROAcLLsYX03b/K6PCrmqjRHKBLuUCzFWHGIZrOXQgr1WrTECRCKVye@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5um/z3bg8dExz8Ym3HszL7N1Y3vmfBLoSGX0ujiwBj4TqmSXu
	ToFRVXcJAdf6Kl/ad477KnpX+T3q3x4sZ3pWzz9ZUC9J4agQUZiPLtyj
X-Gm-Gg: AR+sD12kpZKjoLjSf8sM/Zj/t5Z9TwdSpDAhIZ7p2DWnbEgzl8bo2einusC90UcOaRz
	2v2rnK+73i7m4GEtaI74cr6xEevjeFU7hKW8BwYHLtOepzUhWV0GxcV+8xI5mkXLQRQwC1U5h32
	fg6WmHmZMspsWDgbb5NWKEG2P1KjbwAqBHc7bap103w5sw+5XeEEWbnR6hC7SqIOWT7sZ445XTg
	uKDzRYv50zGRllA2uBjyYv8ui7RCfzK/2eriBSsXczqb8pMzhx+syyJUJT3tnk46HnwVoBq3d4u
	4nIUFKU3bT15AVuA1zoXAFci1G+r3WIoMfqciSfrwwqLM0jDbe3mZrhQ9fkKzKUv71d6oc80DRO
	C6xAhRuAUlZBOIB4uAvPZ13TfX353PL1EXWg8EdoG353xTlkQobsxDXPg7ZtYEjvPJ1pWSisD1b
	i/udR7Ldz7T2mRIe5V2+sr2IT4J4lNFgfxNOGgdoflB5QMGVBHk5lPSiKPrPmt0gtrQdQ=
X-Received: by 2002:a17:90b:5444:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-392821fc107mr21840689a91.2.1786384492786;
        Mon, 10 Aug 2026 10:54:52 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm421004a91.17.2026.08.10.10.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:54:52 -0700 (PDT)
Date: Mon, 10 Aug 2026 14:54:45 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com
Cc: regressions@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	leonardo.costa@toradex.com, francesco@dolcini.it
Subject: [REGRESSION] mainline/master: PCI link creation fails on Apalis iMX6
Message-ID: <bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_105454_218206_69F38889 
X-CRM114-Status: UNSURE (   7.28  )
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

Hello,

We are seeing a regression on Apalis iMX6 where connected PCI device
links fail to come up at initialization, as shown below. The issue is
not on the devices' physical connection, as they worked properly on v7.1
and are working on other stable kernel versions.

    [    0.154243] imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000 ranges:
    [    0.154400] imx6q-pcie 1ffc000.pcie:       IO 0x0001f80000..0x0001f8ffff -> 0x0000000000
    [    0.154439] imx6q-pcie 1ffc000.pcie:      MEM 0x0001000000..0x0001efffff -> 0x0001000000
    [    0.154553] imx6q-pcie 1ffc000.pcie: config reg[1] 0x01f00000 == cpu 0x01f00000
    [    0.356072] imx6q-pcie 1ffc000.pcie: iATU: unroll F, 4 ob, 4 ib, align 64K, limit 4G
    [    0.356181] imx6q-pcie 1ffc000.pcie: Link: Only Gen1 is enabled
    [    1.364757] imx6q-pcie 1ffc000.pcie: Link failed to come up. LTSSM: POLL_CONFIG
    [    1.365056] imx6q-pcie 1ffc000.pcie: probe with driver imx6q-pcie failed with error -110

Complete logs: https://paste.debian.net/hidden/f08cdf68

This may have been caused by commit [1], which was introduced to solve
an issue where the Apalis iMX6 module wasn't booting, and this second
regression went unnoticed since then.

Is it possible for all PCI changes to be reverted back to how they were
in v7.1 before the next release?

[1] 7678e81498e2 ("PCI: imx6: Fix i.MX6Q/DL boot hang caused by improper PHY power sequencing")
Link: https://lore.kernel.org/all/20260629143439.361560-1-leoreis.costa@gmail.com/

