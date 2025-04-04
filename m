Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B001FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 15:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=Fqe5UR8NLUMbvmsRcMfe7BrQFW64ZYVHfs3OeiLu72Y=; b=XCpBwc5SyNoU1dPSwfMG2ehyHB
	H2/g3SY/0EK++tDHKoHL8mXvao6RGoH6a2Hs8Y3KipMy/Xe4gMua72+cKQbPQ89TWwPew72XEMNXQ
	kbdaKWvCQKkzgMILsrjvc62S2k5eQTaHD3MWcYhRcsapAzq3HAj2pvdm1prMcxlIFhNAZ+bBxDvc9
	PaB8Eep6mcsKjxJo2W7DLaPL+Mz+vMCPTu7LpVq8soFmQESiLe4mSP3E51N0sbOMGw/Y6PgQ5xSvn
	QxQGgZHsVcF0S5xvbEnUdna8NNWF+aPIbJAmxkepcHkzXc9EWDVxOjMR5Q+qfGBRL5u01ChS75mOY
	obyeHVGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ibR-0000000C6O9-0abP;
	Fri, 04 Apr 2025 15:05:05 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iZe-0000000C5tR-1fyK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 15:03:17 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250404150305epoutp045057dd1c812ce40fa03063b98aba7763~zJb9-AafX1804418044epoutp04S
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Apr 2025 15:03:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250404150305epoutp045057dd1c812ce40fa03063b98aba7763~zJb9-AafX1804418044epoutp04S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743778985;
	bh=Fqe5UR8NLUMbvmsRcMfe7BrQFW64ZYVHfs3OeiLu72Y=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Er4k41tkMCJQCimEJqZm3ZIYpUVEEc3v1li43o08v+VoPh3BXUZv2rf7yTw2/4oWv
	 8mHrv4S97v8ZOS5KCNVQiC0ZFfAWPHdphaXx/LuFJlQGgbVuWlr9cY55QrN3aG/ReL
	 eFmwU3SkqGdxcHBTYFvTda9TIupjvqGdQ9eXDKQc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250404150304epcas5p2fd379e74fc61094e6d1e3ecd40865774~zJb9MCh7m2466524665epcas5p24;
	Fri,  4 Apr 2025 15:03:04 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZThgB28Qqz6B9m5; Fri,  4 Apr
	2025 15:03:02 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	74.0C.09853.6A4FFE76; Sat,  5 Apr 2025 00:03:02 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250404134131epcas5p4794f2b1e5d289e1faa142c9093ea45e5~zIUwOGZqY1479514795epcas5p4k;
	Fri,  4 Apr 2025 13:41:31 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250404134131epsmtrp217cd8027a798845e407ad84070c04594~zIUwNL65L0404004040epsmtrp2G;
	Fri,  4 Apr 2025 13:41:31 +0000 (GMT)
X-AuditID: b6c32a4a-03cdf7000000267d-0a-67eff4a6120d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	FE.C0.08805.B81EFE76; Fri,  4 Apr 2025 22:41:31 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250404134129epsmtip1623c5c8b8a5ece2d4912ce92d0f7317a~zIUuo3BpF0898808988epsmtip1a;
	Fri,  4 Apr 2025 13:41:29 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: alim.akhtar@samsung.com, krzk+dt@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, Faraz Ata
	<faraz.ata@samsung.com>
Subject: [PATCH v2] tty: serial: samsung_tty: support 18 uart ports
Date: Fri,  4 Apr 2025 19:20:06 +0530
Message-Id: <20250404135006.1263827-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmlu6yL+/TDd6d47V4MG8bm8W9HcvY
	La7dWMhu0bx4PZvFu7kyFi9n3WOz2PT4GqvF5V1z2CxmnN/HZHFmcS+7xZefD5gduD02repk
	89g/dw27x+Yl9R59W1YxenzeJBfAGpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hp
	Ya6kkJeYm2qr5OIToOuWmQN0mJJCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwKRA
	rzgxt7g0L10vL7XEytDAwMgUqDAhO6PlwlfGghssFVvvfWZvYPzI3MXIySEhYCJxaMcdFhBb
	SGA3o8TyA7pdjFxA9idGiY5FUxkhnG+MEp1f1zLCdDxdfhwqsZdR4tDfY+wQzntGifmXDrGC
	VLEJqEvMvHEEbK6IQLLEl8OH2UFsZoH7QKM+ZIPYwgLOEu8OrQKq4eBgEVCVuNGXABLmFbCR
	eDZ9ARPEMnmJ/QfPMkPEBSVOznzCAjFGXqJ562xmkL0SAm/ZJV49WQ/1j4vE2f1noS4Vlnh1
	fAs7hC0l8fndXjYI20di8tFvjCB7JQQyJO6sFYEI20usXnCGFSTMLKApsX6XPkRYVmLqqXVM
	EGv5JHp/P4E6jVdixzwYW1ni5J49rBC2pMSh2y+gbA+J7+9bWSGhGyuxc9U+5gmM8rOQfDML
	yTezEDYvYGRexSiZWlCcm55abFpglJdaDo/W5PzcTYzg1KnltYPx4YMPeocYmTgYDzFKcDAr
	ifDezXmfLsSbklhZlVqUH19UmpNafIjRFBjCE5mlRJPzgck7ryTe0MTSwMTMzMzE0tjMUEmc
	t3lnS7qQQHpiSWp2ampBahFMHxMHp1QDU8QDntAwmXwHmUX2FVpSSy5NiF02ZYreUeuFefP0
	vSJYj3Z6q20+Lzvr/QZj2/i5r1WOZ/uUr6zo+qgeX/X+mLuZvELI/POKL9NW+sn0fwmY7N/O
	s01h0UdfHQalRS0q69ufx7/aIVWd9DfUYkrEce3ddh9qGXPM9z97/WKT0fUZbVM7GcQd/9XG
	s+X/OloSLvz4RwnbYeUFhiu4hc9ZVgtZd5kfs5zjILmqoGDukbvnWtKfTHNijV8kI2CfsvRG
	bldr6NFfIU9vbV2yJqMjy9P4fvyiPanxDgrLjkZk33u23u4Jt8A5h9een37b/fghYBfRyn2V
	o3ediMa0c7ePOe9YE7oi5bKG5NT+qeePKrEUZyQaajEXFScCAH3dmO4mBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrILMWRmVeSWpSXmKPExsWy7bCSnG73w/fpBquuc1k8mLeNzeLejmXs
	FtduLGS3aF68ns3i3VwZi5ez7rFZbHp8jdXi8q45bBYzzu9jsjizuJfd4svPB8wO3B6bVnWy
	eeyfu4bdY/OSeo++LasYPT5vkgtgjeKySUnNySxLLdK3S+DKaLnwlbHgBkvF1nuf2RsYPzJ3
	MXJySAiYSDxdfpyxi5GLQ0hgN6PEytu/WSASkhKHn95lhbCFJVb+e84OUfSWUaJ17kM2kASb
	gLrEzBtHwBpEBNIllnzZzQRSxCzwlFFi7u53YCuEBZwl3h1aBVTEwcEioCpxoy8BJMwrYCPx
	bPoCJogF8hL7D55lhogLSpyc+QRsJjNQvHnrbOYJjHyzkKRmIUktYGRaxSiZWlCcm55bbFhg
	lJdarlecmFtcmpeul5yfu4kRHMpaWjsY96z6oHeIkYmD8RCjBAezkgjv3Zz36UK8KYmVValF
	+fFFpTmpxYcYpTlYlMR5v73uTRESSE8sSc1OTS1ILYLJMnFwSjUwzeNcJ6Fx/03x7ebUVf+f
	b2CXNQt6nXki7drR2hblL/MYN3fNPm3JwMOlv5vlUZmajFSVVGC7k+Qe+bLqNQEcm5Yz3jvh
	YOqSHWL8/dqJTXe3zViwYu4FS26HM8v2vzP4EXiizrma6x6/w7GUGSFTVt4Ie+rQ/W7S44f9
	Lek927jVZ/6Wd1dtPy1ylkNfTONdqrnomZmcsX9M+8/1Tfix0yNxtvY+kSf/3kV3Lijbcbp/
	opLK3CNCL7K75wWIuK2O6n20Im7pmUWTFmtuUvj/tql6zZLL+w962ltUN35dvLKsZcd7+7L0
	JxzVU5/4Ny9sOKuZcb//w57JFudNGBrXXa/XieXVF1Vgs42dsjP7nhJLcUaioRZzUXEiACdF
	nKDUAgAA
X-CMS-MailID: 20250404134131epcas5p4794f2b1e5d289e1faa142c9093ea45e5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250404134131epcas5p4794f2b1e5d289e1faa142c9093ea45e5
References: <CGME20250404134131epcas5p4794f2b1e5d289e1faa142c9093ea45e5@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_080315_068843_DF9680F8 
X-CRM114-Status: GOOD (  14.25  )
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

Exynos Auto v920 SoC supports up to 18 UART ports.
Hence changing the value of UART_NR to 18.
---
 drivers/tty/serial/samsung_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 210fff7164c1..9a5211b730fb 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -52,7 +52,7 @@
 #define S3C24XX_SERIAL_MINOR	64
 
 #ifdef CONFIG_ARM64
-#define UART_NR			12
+#define UART_NR			18
 #else
 #define UART_NR			CONFIG_SERIAL_SAMSUNG_UARTS
 #endif
-- 
2.34.1


