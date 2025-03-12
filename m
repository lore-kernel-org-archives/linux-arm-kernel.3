Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E3AC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=nYzmAloJgMWfnQGtVRz2+KakhQLybe8oRE6g4jnnmwQ=; b=qJ1XIkDfPW0l59Fv0u0D8VDhMY
	SPUGrhZcvfdkAQmeG7NJV0ByhI/iGP86cN37t26x/qPmjRIWiIzd+x0JUOW5c6u1ABJq+aw9BpEee
	sem+K7ae6znQV5wZZ0H66vALfrC+D6xJm+A2QQ3u1gYbjrL+6A1QKHTbaCO3OyLu16njazw6K3gC1
	CGNv6EOF+3R9riGbTKsiFJf8cHRJUBh8lqTC4GPN1gagieOvcT2etOq0yAPsnYoEaVfBGY2BJNkSN
	IVv80UjFMKhM21K26WtwviDJtSSLvtlp3gLyELTnxNVlaNZPPoWTuENixLM47UxFUetE4mVijpxf+
	p6ijCm2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGfB-00000007iYU-0SQL;
	Wed, 12 Mar 2025 07:38:01 +0000
Received: from [203.254.224.33] (helo=mailout3.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGdV-00000007iLD-22kk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 07:36:19 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250312073608epoutp034b7f483935367948d944f012252b68d9~r-gLR_W1L2660026600epoutp03a
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 07:36:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250312073608epoutp034b7f483935367948d944f012252b68d9~r-gLR_W1L2660026600epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741764969;
	bh=nYzmAloJgMWfnQGtVRz2+KakhQLybe8oRE6g4jnnmwQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=HgnRqHJaLhoXrJCgwRbwJDWYIoBagbu/xY8CyV3t4MMqql0bWSjVFj4k8582APQwH
	 5ZqWQbFZ/qhlEz0KT3tXVLQSyQyZ4M8v7FpadasPZfFhuoc448/UjbXxsMsnaFQBl/
	 XEP8rDEW5MhJKzOiid87fnAwuSM6/0d9JrNxl5xM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250312073605epcas5p4c8d1eee147097f83250f641ca18b70fe~r-gISmIFW1209912099epcas5p4u;
	Wed, 12 Mar 2025 07:36:05 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4ZCMr43DxFz4x9Q1; Wed, 12 Mar
	2025 07:36:04 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A0.EA.19933.46931D76; Wed, 12 Mar 2025 16:36:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250312061053epcas5p3b33ffac4d9af89de5ef01d42f6157c47~r_Vu5PMjE3187631876epcas5p36;
	Wed, 12 Mar 2025 06:10:53 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250312061053epsmtrp18e12ed5322127dd6d6eb70c800f65f0d~r_Vu4ZsdO1995219952epsmtrp1b;
	Wed, 12 Mar 2025 06:10:53 +0000 (GMT)
X-AuditID: b6c32a4a-b87c770000004ddd-0e-67d13964241d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	BB.6C.33707.D6521D76; Wed, 12 Mar 2025 15:10:53 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250312061051epsmtip128e0306e6f842b40f3c37e72f9d3179b~r_VtHIbGI2855128551epsmtip1k;
	Wed, 12 Mar 2025 06:10:51 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: alim.akhtar@samsung.com, dev.tailor@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	faraz.ata@samsung.com, rosa.pila@samsung.com, suyash.bitti@samsung.com,
	abhijeet.s23@samsung.com
Subject: [PATCH 1/2] tty: serial: samsung_tty: update UART_NR for
 ExynosAutov920
Date: Wed, 12 Mar 2025 11:49:31 +0530
Message-Id: <20250312061932.1797993-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmum6K5cV0g++vxS2+djhbPJi3jc1i
	zd5zTBb3dixjt5h/5ByrxbUbC9ktXs66x2ax6fE1VovLu+awWcw4v4/J4v+eHewWX34+YLaY
	Pb/Ggddj06pONo/NS+o9+rasYvT4vEkugCUq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzA
	UNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6DglhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFK
	ToFJgV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbGwmVfmQr6WCuuHn3E3MC4mKWLkZNDQsBEYsaM
	TvYuRi4OIYHdjBJTTzSxgSSEBD4xSry6VAeRALL/zZvHDtNxZ/tNFojETkaJ06sWMUI47xkl
	tn85BjaXTUBdYuaNI2C2iEC+xPUTu8BsZoG3jBKvV0aC2MICQRI/G68ygdgsAqoSG2fsBVvN
	K2Aj8WLeVaht8hL7D55lhogLSpyc+QRqjrxE89bZzCCLJQTesku8a18C1eAicenCNyYIW1ji
	1fEtUHEpiZf9bVC2j8Tko9+AruYAsjMk7qwVgQjbS6xecIYVJMwsoCmxfpc+RFhWYuqpdUwQ
	a/kken8/gZrOK7FjHoytLHFyzx5WCFtS4tDtF1C2h8TSdbOYICEaK7Hl8H6mCYzys5B8MwvJ
	N7MQNi9gZF7FKJlaUJybnlpsWmCUl1oOj9fk/NxNjOAkquW1g/Hhgw96hxiZOBgPMUpwMCuJ
	8K62vZAuxJuSWFmVWpQfX1Sak1p8iNEUGMQTmaVEk/OBaTyvJN7QxNLAxMzMzMTS2MxQSZy3
	eWdLupBAemJJanZqakFqEUwfEwenVAPTLB2n1JXVEyxi7UoLktezC+UrvrAIcl8/7QxnrlBR
	+BS1HxE+046+OeP7K7XT9UhXHE/9uczLzE9NJs0ISnNRiamd2pW38cNKQ4MGpmhxdrGtQu1/
	WZgL0k17Ju0/LvQ6IvfQ6mmZu6Lkvxi/kfq2ZeJvJZYD0lE/rkz8dujeKq0zU59s0z9TvMv9
	acqyyb9ZHl9cJ57Zff0sq8HzyrN/hU9F7N/7wrL6fPkvR93Qi7GZc27cDrirbml/cs3cdw52
	a76Z8xcubvzX8LFO85N9U4KzR3ERf/FBvZIMlzknggofPl9+OGTaxPuskokMb2Ye+n5st0C9
	xpr5nbw7FGKmPQ0QuxzJvzOYx7WI2eOJEktxRqKhFnNRcSIAEH9UvisEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrALMWRmVeSWpSXmKPExsWy7bCSnG6u6sV0gyk3uCy+djhbPJi3jc1i
	zd5zTBb3dixjt5h/5ByrxbUbC9ktXs66x2ax6fE1VovLu+awWcw4v4/J4v+eHewWX34+YLaY
	Pb/Ggddj06pONo/NS+o9+rasYvT4vEkugCWKyyYlNSezLLVI3y6BK2Phsq9MBX2sFVePPmJu
	YFzM0sXIySEhYCJxZ/tNIJuLQ0hgO6PEmRk/mSASkhKHn95lhbCFJVb+e84OUfSWUeLhrzlg
	CTYBdYmZN44AdXNwiAiUSpx/mAhSwyzwlVHi8JWpTCBxYYEAieMvbUDKWQRUJTbO2MsGYvMK
	2Ei8mHeVHWK+vMT+g2eZIeKCEidnPgE7jhko3rx1NvMERr5ZSFKzkKQWMDKtYhRNLSjOTc9N
	LjDUK07MLS7NS9dLzs/dxAgOZK2gHYzL1v/VO8TIxMF4iFGCg1lJhHe17YV0Id6UxMqq1KL8
	+KLSnNTiQ4zSHCxK4rzKOZ0pQgLpiSWp2ampBalFMFkmDk6pBqYg8cszv/dECbg9bPT8zWbz
	KTm675dT8w1F022TLwQzMM/UXztNLWl15Ym5Pr/U3VNat0WuN/+ylTVYuPfeqtfHc3dutulf
	+8PohtHyF3+f7M/Zk/NwcWrZ7soCQbv2439C7FZcbo36fMflc37KFaUiwQdvVlUlXn+Xdken
	L6IxqTnyb/vSg4tv5f3R97Zje/xPe+XcMIVD22N/Lj2y8uWzmP1PZaYIbZP5vCNs+fXIBpXA
	JW/SH601Ptek+JBtler9/Lc+bu3GqywNDbIvntBvdTf4f3mFwzPrC9/m/HOTun75r8TaP7/P
	Fi3sOcPyU4LviKax7PI8/3TFgKZXk0qEVhdwcq29K2l689Bb7ugMJZbijERDLeai4kQAyUdc
	LNMCAAA=
X-CMS-MailID: 20250312061053epcas5p3b33ffac4d9af89de5ef01d42f6157c47
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250312061053epcas5p3b33ffac4d9af89de5ef01d42f6157c47
References: <CGME20250312061053epcas5p3b33ffac4d9af89de5ef01d42f6157c47@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_003618_207648_1F92AFF5 
X-CRM114-Status: GOOD (  14.92  )
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

ExynosAutov920 SoC supports 18 UART ports, update
the value of UART_NR to accommodate the same.

Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
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


