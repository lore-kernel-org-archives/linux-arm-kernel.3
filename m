Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4783EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 12:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=RSyKLRIDfZUqc02NXZVKLH+houRYwWh9aD2SxU7TZ8U=; b=l1bYF9IR3ETMZnOphbEb2QB6BZ
	r51HiDiFWfyFSSzXypbvIlWpDpfyM613fWTPp+5HpFU/+fq24YDF/DglIlSnmzkKxYN6uzyPujvBj
	zB683c/WYFVOE8zSvCXPbVSgChrKGroKf+R5tEGBYgBe7Q/o3i0muo25xQcaUo6nutEP6FnOMsm0i
	t1tPrSzNYQvaMPV3pVE8AOHOJNfC5tVV6ltQY323h5HpJoVTkZdaRuBpz/FPkLa2qoTwGv7lMaB6o
	6J/yChBiEev8+bkUhX+fRR21PTcb9r9o97bl8CmWcJRPX19Ox5YQ5Iq5TAJ58MThqpaEODdn4QEbc
	vQ7nTB8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jle-00000009c3b-0pLx;
	Tue, 29 Apr 2025 12:08:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jjj-00000009bqQ-0iIj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 12:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
	bh=RSyKLRIDfZUqc02NXZVKLH+houRYwWh9aD2SxU7TZ8U=; b=F7CgRXJwgKy1a1XBiDjmi9V6NT
	KYeGgOr35SXuzhIb9hSkieTvGdT4Q+jF+ge7RqXlg7iw0kaddy/0juT1Xhmij40FknFkM0pBe6Nqm
	xrAjLbEGo2efE+Irnp8lio4wmTQ92D2TpzzyvtvIb38Oyc53F3GEAJR9rL5G3mwYMz8N3REsFzJGO
	iG9kSz28ONSghzb00V/GCjNio1y2i/5BSMQ3NMqbVOIyqL+tlQWco5H8o5fZfLMTmJAL+4cG5BX4V
	t301eeZlcLVbqFRqLr+6r6D2eaUrPn7cpVb9eQ8iXZv35rBwtslIqZHsfuJI2YillNEgJWOhZLO/J
	7V16AxYA==;
Received: from mailout4.samsung.com ([203.254.224.34])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9jje-0000000DJQw-2SnL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:06:54 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250429120639epoutp0400fd5d10f274a47c676aefb686749b2b~6yKDul4mU2052420524epoutp04r
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 12:06:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250429120639epoutp0400fd5d10f274a47c676aefb686749b2b~6yKDul4mU2052420524epoutp04r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745928399;
	bh=RSyKLRIDfZUqc02NXZVKLH+houRYwWh9aD2SxU7TZ8U=;
	h=From:To:Cc:Subject:Date:References:From;
	b=F6A3lSBe+gvEoieXDYc6jNW2TaNH7akSKj28hu5OkpvieEDc6N1UkDuQyQWBoGKCJ
	 JxFaa6gqRAJhUTeFtyp1lWuuB2fzcSGfXefjxjY3nyKzHeRSYeao2LpqD/IpCm9z+6
	 Qd1zsV+ejKla4KuHgtVTSpZt7kG1LZs4ZVk+4FIg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250429120638epcas5p4b8f04554cb03b9b4817cea66fb3076ee~6yKDF0dl22706927069epcas5p4M;
	Tue, 29 Apr 2025 12:06:38 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.174]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZmzZ42tHlz6B9m9; Tue, 29 Apr
	2025 12:06:36 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250429101953epcas5p4604a6bd79548ebc29e1c72bdc64965a4~6ws2Qmttv0416804168epcas5p4f;
	Tue, 29 Apr 2025 10:19:53 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250429101953epsmtrp219cade6a3671e0473c443dd011e5dbab~6ws2PtFAG0222002220epsmtrp2q;
	Tue, 29 Apr 2025 10:19:53 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-d6-6810a7c9d902
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0D.23.07818.9C7A0186; Tue, 29 Apr 2025 19:19:53 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250429101951epsmtip16df3344d040194e5d7b75e331b376fdf~6ws0p8Gx50829508295epsmtip1s;
	Tue, 29 Apr 2025 10:19:51 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: alim.akhtar@samsung.com, krzk@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	dev.tailor@samsung.com, rosa.pila@samsung.com, faraz.ata@samsung.com
Subject: [PATCH v4] tty: serial: samsung_tty: support 18 uart ports
Date: Tue, 29 Apr 2025 15:59:41 +0530
Message-Id: <20250429102941.4138463-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrILMWRmVeSWpSXmKPExsWy7bCSnO7J5QIZBjueq1g8mLeNzeLejmXs
	FtduLGS3aF68ns3i3VwZi/PnN7BbbHp8jdXi8q45bBYzzu9jsjizuJfd4svPB8wO3B6bVnWy
	eeyfu4bdY/OSeo++LasYPT5vkgtgjeKySUnNySxLLdK3S+DK+D6nk61gNXfFt8MPWRsYv3N2
	MXJySAiYSDzp+c7SxcjFISSwm1Hi3r817BAJSYnDT++yQtjCEiv/PWeHKHrLKPFz8zKwIjYB
	dYmZN44AdXNwiAikSOy/ywRSwyxwk1Fia+tSsBphAWeJVQ8/MoLYLAKqEr+62phBbF4BG4md
	U6YwQyyQl9h/8CxUXFDi5MwnLCA2M1C8eets5gmMfLOQpGYhSS1gZFrFKJlaUJybnptsWGCY
	l1quV5yYW1yal66XnJ+7iREcyloaOxjffWvSP8TIxMF4iFGCg1lJhLfKgD9DiDclsbIqtSg/
	vqg0J7X4EKM0B4uSOO9Kw4h0IYH0xJLU7NTUgtQimCwTB6dUA5PR+oOX0lM+375caTVp0Rz3
	e59+fXd/kTXx27ziXXHZ0SuPdf27n3UhcfPXl6z7Z36L+z3765+WBHF/64bEm/f87vQ9Mniq
	sWK/4Y1lGXpdj+VDXizNafzHanvRf+HBWfk3nnzmulf4Op3r0D873xWHPJo3u+Z8aPy1gvep
	YSvvlE0LMg3/VldMs2RzD5DUzSpUE5HKZvntLmDlx7NYJW2Rqs6TG9EN/I2rzhk6ex350pyR
	WPsjbL7joe3qjVwWXlPvW5534vOYZjfnh3ut1Fmr0mcbux/9Eop5o7hh6q2Xi33ddl5cFzhp
	bXT7nvj5ch6cybOnH7iZf0vh+selEb0rub7e5F3/YFG197PASfv+KrEUZyQaajEXFScCACeH
	nVHUAgAA
X-CMS-MailID: 20250429101953epcas5p4604a6bd79548ebc29e1c72bdc64965a4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250429101953epcas5p4604a6bd79548ebc29e1c72bdc64965a4
References: <CGME20250429101953epcas5p4604a6bd79548ebc29e1c72bdc64965a4@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_130651_357950_8305DD51 
X-CRM114-Status: GOOD (  11.14  )
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
Changes in v4:
- Updated v3 change-log as discussed with Greg[2]
- The patch itself remains unchanged, only the change logs have been updated.
- Link to v3: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250417043427.1205626-1-faraz.ata@samsung.com/
- Reference: [2] https://lore.kernel.org/linux-samsung-soc/2025042829-heroics-deskwork-e74d@gregkh/

Changes in v3:
- Added changes-log (as pointed by Krzysztof[1]
- Link to v2: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20250404135006.1263827-1-faraz.ata@samsung.com/
- Reference: [1] https://lore.kernel.org/linux-samsung-soc/03cc01dbaaaa$4dea13f0$e9be3bd0$@samsung.com/

Changes in v2:
- Rebased on the latest linux-next and added reviewers as per get_maintainer.
- Link to v1: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20250312061932.1797993-1-faraz.ata@samsung.com/

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


