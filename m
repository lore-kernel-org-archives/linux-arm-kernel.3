Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6B0C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNOjnLRACDOPWRZKVVKbg9U7d4b+QVB/orVEDglJFaU=; b=PlufsXn1ZVT7zG+ePICM/6CKHl
	Uh0Pfu7klsNviaPrxvvg6oxgUZ2y+h+87aJ38aOtXMvnl/hVqVKBb1CIfwba+RescIPQWbKZsdU4y
	WSYazK1ad+Ke9zy0JSuoDBxrTR7uD2//3QLADM0UR7IzeZlZskMeOLnhYoBDhhA3XbB1TH5LvHeUU
	XHCh2fq5+wmutqcFrNpWwhr9Qlx0Gr/a2DAyaD0GdXieONsnIf7ZyO3aCHPYRQCd0qEyIDh9zeNXL
	B0gWF2QjYMMKUtbXjjoWRUD/ZjwgV3HQCC4MzqDSDcrrKUHupjhyrid2l7xatgq6mNRduEL1jSiVP
	x6cWKdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjD-00000004poL-3DMI;
	Mon, 16 Jun 2025 15:26:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fG-00000004VIh-0rCf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YNOjnLRACDOPWRZKVVKbg9U7d4b+QVB/orVEDglJFaU=; b=q/SSkdE/vtAD9+IcqsxBwP0nrp
	W6bA1lwZvMgmv5ymc84sIvML96eFyTrKmogIvD9E2VPCRKuKHqwSz6b2G4pXF/WBeATfcABS3SARt
	KRbOwTGWUZtWHaJQ7JPwsraRKAn1amk/bZYeaCSeJ3Q9vlQXwA/fe2OonwmmIU9h1BFFRrNay5W2N
	PrNKCLIdltr8oE4OzdVNGZenyPpBmLSX7MRimloUfW0IuHFcXBGwtHbVRN5QJ+wQFgZJAmVWGZ12k
	5UaacM97GWTuspzIC2Mj4NRaYo0/x0XtiAsi35PNOhSPM3fg28G+aVSb2u48Hf3lhYkmGomBKJ3uy
	IIuch9QQ==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fB-00000003aQA-3Nv2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079638;
	bh=YNOjnLRACDOPWRZKVVKbg9U7d4b+QVB/orVEDglJFaU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MTxP81veaxRXticdcirQZoVeYQf/6K29Oc8GVg15i0BLTrSDSCYMPnnBUkfjOUgNU
	 CsLtsKhqBFpBR6Szbov6sVSjZFzCvrU4AC8UwmvBXMF804+500fjOwzqlHQPau3pPh
	 0+AXXvj4F1/BNPMJo3I+eD6pMT5syY/Amujjm3goVLaxbIVCypU3ehCNQTDbGft0Xj
	 PdnL957OzqylE/UwX9P5AbnYdbXkNbRr6BC3pqG8tWkKGd0fbAmmuJVNmpVit2gkQC
	 3cbLtHQXuRZf46nXMVaHtQPc5LaEDZ3Gkh46GZXZveQ4g9BTdOKGYgIvYVPR2bprHB
	 RFw4Jbf/9Kbhg==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 837D668818;
	Mon, 16 Jun 2025 21:13:57 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:38 +0930
Subject: [PATCH v2 01/10] soc: aspeed: lpc-snoop: Cleanup resources in
 stack-order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-1-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_141414_617156_C2D225AD 
X-CRM114-Status: UNSURE (   9.10  )
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

Free the kfifo after unregistering the miscdev in
aspeed_lpc_disable_snoop() as the kfifo is initialised before the
miscdev in aspeed_lpc_enable_snoop().

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Cc: stable@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>
Acked-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index ef8f355589a584d76bfac2b130ba9965c9b06ba5..59c18afa649cd672f54f947066f468f2a78c0d5d 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -263,8 +263,8 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		return;
 	}
 
-	kfifo_free(&lpc_snoop->chan[channel].fifo);
 	misc_deregister(&lpc_snoop->chan[channel].miscdev);
+	kfifo_free(&lpc_snoop->chan[channel].fifo);
 }
 
 static int aspeed_lpc_snoop_probe(struct platform_device *pdev)

-- 
2.39.5


