Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C35C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 11:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=vL0cr7fBrUc/KWtU42iEj3Tt+KU0GKzlaCQEW9YfGIQ=; b=IUr77uvOQFuoajxGbSRhWE/Zda
	ufqiPd+YGrBHoO9gVGSFT5V++73IkP56QjIQ/OawONxxZ1j7hQp4605elg4s2Nf3xtBdBl7v0pW0I
	Gm3JDhe/fftGNWJI9W8t1C3QsoxaLVn3BuqwLdQcAXPpNcXCbEaITKywEEXiRrVlp4tosUmxfWuQT
	/NbIqhyD4FCTp2Zv4evD6LIetzM5Vic9P+xWjMa6Hff3M6q1iVIM2E84S9NfKyvo+L+RXF+TQAYCA
	UITP0wNpDN2vHh5MAN8AzJ4hCm4ljw0Risiue9l1HDvc3A5v06JUj0SHq63knNp3b4/Ws6ilrtghH
	jbzDt7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnQZ-0000000CD8k-39tr;
	Tue, 13 May 2025 11:04:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmNi-0000000BzWW-0VgC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 09:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
	bh=vL0cr7fBrUc/KWtU42iEj3Tt+KU0GKzlaCQEW9YfGIQ=; b=a1c583GjaLd76jvW25eFhcVrMT
	2etlz1JdOC0uHRKfU4G8pbsRAEaWgzg+d29zAU6h8WgiFJCyCusXOilxm3njW8naz52rSv0o/+lPj
	EZVPipQ+mQjNi2qLViLUxns/sKbU1h4jxLjf5WJu2gVMlEFUiVYm4yjkoa8UwDWdrQhY1NbfyZBhN
	F7PegPNQrJiOR32PhZORgXhMgJNY92WANc5HLNNkjrbXRzrFyGOdpwJA5k7HtPaeLqFw9VhjFjEwN
	ifU32wmDej7wNz3wDBNAYIPzyyVYJGgEIRiFTRcTJ6sEvZHcybkKfMezUbrmpFmMn3SPcoM16iZhb
	fbqUYf1Q==;
Received: from mailout2.samsung.com ([203.254.224.25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEmNd-0000000GuWe-4BEk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 09:57:00 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250513095648epoutp0216b53b9fcbfe5c83c7e1efba15e850c4~-DarmPzU52723227232epoutp02C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 09:56:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250513095648epoutp0216b53b9fcbfe5c83c7e1efba15e850c4~-DarmPzU52723227232epoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747130208;
	bh=vL0cr7fBrUc/KWtU42iEj3Tt+KU0GKzlaCQEW9YfGIQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=a8dZUktSSnJm22q/vzFl17YWK5rjaO/OOZkmKCaRaIbLdSyLazAO/DfI97ShxvhDF
	 BIl47+knvAljmZDGGaQDjeG2qJzQxDJ+j6k7qyz9iVEFrOEJHPGsA9V8VofaVI9e+s
	 2LEGX/qvcslkXTnJPxu8bFYJJeH742r8qUoRwv3o=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250513095647epcas2p1281a6e30d6ea62b48b23b2638f9f0061~-DarI2ian1927019270epcas2p10;
	Tue, 13 May 2025 09:56:47 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.99]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZxX1q22yNz6B9m7; Tue, 13 May
	2025 09:56:47 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250513095646epcas2p189a3681a52ba1ecda3452fd0ae84bffb~-DaqASh-U1927019270epcas2p1z;
	Tue, 13 May 2025 09:56:46 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250513095646epsmtrp11d4de783d27dcb344adb08f35f42ee01~-Dap-PMHc1976619766epsmtrp1F;
	Tue, 13 May 2025 09:56:46 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-1d-6823175e555e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	17.DD.08766.E5713286; Tue, 13 May 2025 18:56:46 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250513095646epsmtip24254bfc5695cd06dc6df339e29d9d31e~-Daps4WzU2427724277epsmtip2W;
	Tue, 13 May 2025 09:56:46 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH 0/3] Increase max timeout value of s3c2410 watchdog
Date: Tue, 13 May 2025 18:47:08 +0900
Message-Id: <20250513094711.2691059-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRmVeSWpSXmKPExsWy7bCSvG6cuHKGQdN8XosH87axWZw/v4Hd
	YtPja6wWl3fNYbOYcX4fk8WNdfvYLZ4sPMNkMWPxSTaLxy//MTtwemxa1cnmsXLNGlaPzUvq
	PXZ+b2D36NuyitHj8ya5ALYoLpuU1JzMstQifbsErox5s88xFixhrdj6ciFLA+Mmli5GTg4J
	AROJd83XgWwuDiGB3YwSJ349ZO1i5ABKSEm8e2YJUSMscb/lCCtEzQdGidbHp9hAEmwCOhLT
	/90GGyQiECdxrH0zM0gRs8BORomW6b+ZQRLCAs4SzQc3sYLYLAKqEhOuPmQEWcArYCvxd5oP
	xAJ5iZmXvrOD2LwCghInZz4Bm8kMFG/eOpt5AiPfLCSpWUhSCxiZVjFKphYU56bnFhsWGOal
	lusVJ+YWl+al6yXn525iBAewluYOxu2rPugdYmTiYDzEKMHBrCTC27hdMUOINyWxsiq1KD++
	qDQntfgQozQHi5I4r/iL3hQhgfTEktTs1NSC1CKYLBMHp1QD0wZ5Tqevm/ZMX+55Y8MPxven
	Dt7z1ApWXxmd+4RtoQWL1n2/jImTZflOiPZP0UkuzI1ltTHnFdTuuc97fXLVoVk99X7bGE7Y
	RiUbhOSsCH1fk7FCYqnTilqPc3drs5nSHl8NE2413fHD3ZZn6cxf5xzOr7CVChUxl+EwCl3r
	by7z0PWKoeXMKs+3sTt3dy4pedFVwLsrZsVrYeZd37mNahfcLVd42/Jew0440FZsQVLnidRn
	PxZ79bFNZ98k0yw7qZ8tVea34uINr7T7udlNVGQEj33eF+tUzCQmMC001q9AtuZav/e7VYzf
	++UNOd/cmLiOeynz7pBStg1uVfrn5p/44NQrN0mwxOekzT0lluKMREMt5qLiRACvEETczwIA
	AA==
X-CMS-MailID: 20250513095646epcas2p189a3681a52ba1ecda3452fd0ae84bffb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250513095646epcas2p189a3681a52ba1ecda3452fd0ae84bffb
References: <CGME20250513095646epcas2p189a3681a52ba1ecda3452fd0ae84bffb@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_105658_915557_5274A4B3 
X-CRM114-Status: GOOD (  11.53  )
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

The ExynosAutoV9 and ExynosAutoV920 SoCs have a 32-bit counter register,
but due to code constraints, only 16-bit values could be used.
This series enables these SoCs to use the 32-bit counter.
Additionally, it addresses the issue where the ExynosAutoV9 SoC supports
the DBGACK bit but it was not set.

Sangwook Shin (3):
  watchdog: s3c2410_wdt: Increase max timeout value of watchdog
  watchdog: s3c2410_wdt: exynosautov920: Enable QUIRK_HAS_32BIT_MAXCNT
  watchdog: s3c2410_wdt: exynosautov9: Enable supported features

 drivers/watchdog/s3c2410_wdt.c | 40 ++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 12 deletions(-)

-- 
2.40.1


