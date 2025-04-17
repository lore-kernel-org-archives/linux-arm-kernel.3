Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A360FC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 04:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=0Mic3eQzqMW/WfkrWpTIHGqVKKLxGpW/SU0aNfBKGsc=; b=3Y3oEjj/z/ZNAffHOJBz8Culrq
	/TgUAYeALVFNE8K/lFZ+WgRXQiFld11Vai0cmZiOKsW3gyBI6gauT00ZD5i7+jscatXoIoGngiRjm
	dq04Gd6v7ablB/NFv9LA5z9p+tTaJxvC/jljB2vUZ33H2DqG0ECzvbmjMUosmjIevKcAGEiNya5sB
	gwenMjXWqgiXJSNooUkvqN2AQ7GtbIdLyso82cCamdIx37LeQhXQE+7b0O/yh/WTG2id8OHffXmrK
	/j1mRVgyDyCjplXphfSpyjnyIKW+M22Thw7ROjT/fQ/GPGkbjuTWdydQF3rs/vhfk4lO7Yb8dzs89
	3hM2S+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Gs3-0000000BgKj-3JCA;
	Thu, 17 Apr 2025 04:29:03 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5GqC-0000000BgBj-07vA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 04:27:10 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250417042701epoutp049b082bd8a29ff3728ed70fd8e1b10736~3AJU8Sim73161031610epoutp04h
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 04:27:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250417042701epoutp049b082bd8a29ff3728ed70fd8e1b10736~3AJU8Sim73161031610epoutp04h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744864021;
	bh=0Mic3eQzqMW/WfkrWpTIHGqVKKLxGpW/SU0aNfBKGsc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=GbeIeKCOgd9mws+jvTRMqzlGrxn1BmIpcGpaSscdqOnJjPBFPpyhVDV6LmtP4LrqS
	 QrcIOyHIW+l2eEUql0xbbIWBYt7AQYjB2hxuprpWItFQc8JLXq3BwCz3lEQIh3TMYu
	 Wp/ZjQfYeuMr/rTadqNGOi4fCJOeKVER9aX9To2M=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250417042700epcas5p2514834948b2daceefd1688f1ccb002fc~3AJUDAH1G0731807318epcas5p29;
	Thu, 17 Apr 2025 04:27:00 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZdPxG3CVGz3hhTH; Thu, 17 Apr
	2025 04:26:58 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	47.76.10173.21380086; Thu, 17 Apr 2025 13:26:58 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250417042427epcas5p2df3d35803adcb24da7d83e5df586380d~3AHFOTaz21902119021epcas5p2L;
	Thu, 17 Apr 2025 04:24:27 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250417042427epsmtrp1b1574df5707787771602dac61e22863d~3AHFLvhO22341023410epsmtrp1p;
	Thu, 17 Apr 2025 04:24:27 +0000 (GMT)
X-AuditID: b6c32a44-8b5fb700000027bd-86-680083128d7b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	43.6C.07818.B7280086; Thu, 17 Apr 2025 13:24:27 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250417042425epsmtip17c9190f71841f505db572cea3f01579a~3AHDr5wkd0578705787epsmtip1L;
	Thu, 17 Apr 2025 04:24:25 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: alim.akhtar@samsung.com, krzk@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	dev.tailor@samsung.com, rosa.pila@samsung.com, faraz.ata@samsung.com
Subject: [PATCH v3] tty: serial: samsung_tty: support 18 uart ports
Date: Thu, 17 Apr 2025 10:04:27 +0530
Message-Id: <20250417043427.1205626-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIJsWRmVeSWpSXmKPExsWy7bCmuq5QM0OGQfM/UYsH87axWdzbsYzd
	4tqNhewWzYvXs1m8mytjcf78BnaLTY+vsVpc3jWHzWLG+X1MFmcW97JbfPn5gNmB22PTqk42
	j/1z17B7bF5S79G3ZRWjx+dNcgGsUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW
	5koKeYm5qbZKLj4Bum6ZOUCHKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKTAr0
	ihNzi0vz0vXyUkusDA0MjEyBChOyMzb9+cdUsICjYsfsZqYGxk72LkZODgkBE4m7bdeBbC4O
	IYHdjBJXrvUzQjifGCUezPvGCuF8Y5Q49HszUxcjB1jLkx9mIN1CAnsZJXbNjoWoeQ/U8HgC
	K0iCTUBdYuaNIywgtohAgkTnhyNMIEXMAhcZJZ6sP84IkhAWcJY4O+Ee2FAWAVWJTQ3KIGFe
	ARuJY9PeMEOcJy+x/+BZZoi4oMTJmU/AZjIDxZu3zmYGmSkh8JZd4vmNJ4wQx7lIHOmNgegV
	lnh1fAvUm1ISL/vboGwficlHv0GVZ0jcWSsCEbaXWL3gDCtImFlAU2L9Ln2IsKzE1FPrmCC2
	8kn0/n7CBBHnldgxD8ZWlji5Zw8rhC0pcej2CyjbQ2LJo0awkUICsRL7XsROYJSfheSXWUh+
	mYWweAEj8ypGydSC4tz01GTTAsO81HJ4pCbn525iBKdNLZcdjDfm/9M7xMjEwXiIUYKDWUmE
	95z5v3Qh3pTEyqrUovz4otKc1OJDjKbA8J3ILCWanA9M3Hkl8YYmlgYmZmZmJpbGZoZK4rzN
	O1vShQTSE0tSs1NTC1KLYPqYODilGpjYmRhK7/YzpaVfZPefY+nTnsVke3zbNSFgtK9gC9H4
	cH/PrOhtsjnTc2ZZKOdJdrKlexz4XporqC7dc/Z6Pc8U45y9dWxXNKdoWOr9W3Dgeoymqo6J
	EvuZQ1N1nOY9fn+0ZKrdl3t991/ZVCjwOD65UJhh+2nmjGVqh2UiZ039v1+Dder8ws/HhXeu
	iLYs6xD5b6+3q2qLvGF4jVLEiWreD7dn3ps4R/hI2s9EgZQFTuEXY6edCOG9Yb7v+IxJXfnq
	hsFsgovMPHZuSPbk2rCi+I1SxLRDK4v7V3vukHy8IlanKdbocfsqD2X/24rfLf47vLmTGOPJ
	V9b2neXKZa8NP4oDHu1+82pZSPLmuUosxRmJhlrMRcWJAO48mbwkBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPLMWRmVeSWpSXmKPExsWy7bCSnG51E0OGweE3XBYP5m1js7i3Yxm7
	xbUbC9ktmhevZ7N4N1fG4vz5DewWmx5fY7W4vGsOm8WM8/uYLM4s7mW3+PLzAbMDt8emVZ1s
	HvvnrmH32Lyk3qNvyypGj8+b5AJYo7hsUlJzMstSi/TtErgyNv35x1SwgKNix+xmpgbGTvYu
	Rg4OCQETiSc/zLoYuTiEBHYzSjz8vwMozgkUl5Q4/PQuK4QtLLHy33N2iKK3jBKda2czgiTY
	BNQlZt44wgIySEQgRWL/XSaQGmaBm4wSW1uXgg0SFnCWODvhHhNIDYuAqsSmBmWQMK+AjcSx
	aW+YIebLS+w/eJYZIi4ocXLmExYQmxko3rx1NvMERr5ZSFKzkKQWMDKtYpRMLSjOTc9NNiww
	zEst1ytOzC0uzUvXS87P3cQIDmMtjR2M77416R9iZOJgPMQowcGsJMJ7zvxfuhBvSmJlVWpR
	fnxRaU5q8SFGaQ4WJXHelYYR6UIC6YklqdmpqQWpRTBZJg5OqQamBFOm00HW9e9y/7/JFZLj
	clvpmVm84s8jzv/sHJN3TnrLwi1yoTklKur7L8Va38v/zi8rDvSXPrY++8vVkxv/VUzxslZf
	o+lhKXxtw70f6coS3lEm3XPVf+curvrWNsVgr2ra5ekTy1527kto39OsKL0vIT77wdW1Wr4f
	Xz3bt/FDdbzgr6a77iGWfo9utzpsM88W/PR41zxd9zynTXPXRU8urhAWzV5wz2zDodVF/5L/
	HMz+K63NEvsk3dqO3S4lac61b1c9qn/9897/99yvR3klK1YuNclUXpIx4WjelsIA+RqWNY3p
	4Uf6s/zrT+4++9Nj74xFT+Y0Wk7/u6qq101EbZKNeNlpi6VaV0pKlFiKMxINtZiLihMBcGMY
	sdICAAA=
X-CMS-MailID: 20250417042427epcas5p2df3d35803adcb24da7d83e5df586380d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250417042427epcas5p2df3d35803adcb24da7d83e5df586380d
References: <CGME20250417042427epcas5p2df3d35803adcb24da7d83e5df586380d@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_212708_714352_57A154CB 
X-CRM114-Status: GOOD (  14.46  )
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
Changes in v3:
- Fixed review comments from Krzysztof
- Link to v2: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20250404135006.1263827-1-faraz.ata@samsung.com/

Changes in v2:
- Rebased on the latest linux-next and added reviewers as per get_maintainer
- Link to v1: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20250312061932.1797993-1-faraz.ata@samsung.com/

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


