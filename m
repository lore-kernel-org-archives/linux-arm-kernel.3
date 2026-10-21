Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCE8606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VchyYLnX;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=g4DWlf64
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WEyiM5jVzOlufAoK40II4YYcsd0cpnT1mchqY1Loq2k=; b=VchyYLnX/fJFWz2HogZZGdKLCT
	Rg6t/jMk5slb7IVT9sGHxZyxvgW6/NNA1mOKamFxuHQpLXCpamDGm8oYIfHVsoHGZgaWeTCEgN3t0
	XAPEgrJTJlfVnLJMwhzAOL/4gJujRwtsHRf00okfd408aTmDlzFYVwgO3ZUOhlbLOOwi4iFxFOUV5
	7teAkS4GHIyaQpy/FMaIcGTiLB7ZOA203R1WHJ39PqMp8qAApe/XQf1zvfAqZJRsHrWmlCuqxW2H8
	jM0cc8iLjWpi5h/TfRidDlUg9ZShH/LS7L6S0nt253PN2ESqcr9jRHvXn1x/dfmO3nDai5Ei9N89n
	VT91KsNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTrE-0000000Be0z-3Ljy;
	Wed, 21 Oct 2026 10:47:44 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTr8-0000000Bdwt-3ZfO;
	Wed, 21 Oct 2026 10:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=WE
	yiM5jVzOlufAoK40II4YYcsd0cpnT1mchqY1Loq2k=; b=g4DWlf64eSz/XX8BJO
	cjF0eqrLJPQnGeFJKUz+r4OCNsQ5qxNY4ET7hxRS0Gp/mWRd/9OWLbpJ+f0kx2mC
	6i3jy0ed0ancCdTSU5OEToKbVCgwKqKuK3BqcN8UXIOVVxijuxaD8+f8g1F53X2+
	kZ70L8lXYBm4rHx+I2uXqWlMU=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDX3xM5mNhq3MNSBw--.27855S2;
	Wed, 21 Oct 2026 18:47:22 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	John Youn <johnyoun@synopsys.com>,
	Felipe Balbi <balbi@ti.com>,
	Mian Yousaf Kaukab <yousaf.kaukab@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/4] usb: initialize debugfs command buffers
Date: Wed, 21 Oct 2026 18:47:15 +0800
Message-Id: <20261021104720.4106961-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX3xM5mNhq3MNSBw--.27855S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWUKr15CryUJr48XFy7Jrb_yoW3trXEv3
	sYkrWDXw4kuFWjq34xArWYvayUua13Xrn7XF9Iqw4xuw48Z398Zr4kCr92qr15CFyUZr4D
	Cr1fJr18Xa42gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU85Ef7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BsFP2rYmDvdWAAA3F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_034739_194499_75D47559 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several USB debugfs write handlers copy user input into uninitialized stack
buffers and then compare fixed command lengths. A short write that matches a
command prefix can therefore make strncmp() inspect uninitialized bytes.

Zero-initialize the affected command buffers so every copied input is
terminated and the comparisons do not depend on stale stack contents.

Jiale Yao (4):
  usb: dwc2: initialize debugfs command buffer
  usb: gadget: renesas_usb3: initialize debugfs command buffer
  xhci: debugfs: initialize command buffer
  usb: mtu3: initialize debugfs command buffer

 drivers/usb/dwc2/debugfs.c            | 2 +-
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 drivers/usb/host/xhci-debugfs.c       | 2 +-
 drivers/usb/mtu3/mtu3_debugfs.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1


