Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4C3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuIneu7pM5DIf0S1GOG5o8U5Cu3F83SLWq90fihZ9gA=; b=aKn0yqmotVtfCWiT0M1+5H5ezM
	CHO+lNd9pY47k8TlmPtKt5rJVAuREf8E/Bkg7iAO4VrfMRI13QSZWrJxyP3yJD4pP6D/cTXoOwApD
	IsjiJRJmi3USzwKqfvevfdY2luSboUleDumbWvm1rG5XYaoxx/Zrev02tGXROrjJmyYh+kEoenDrU
	IZYVRO8VgIRvTTUlVVVkHC0DN+ZHHYfiwOimYcuRwQFCkPw4p52yQj3fUmSzV9bR/YVY59qN55EtA
	dV2RHMUQsfqotbrLJjzmQM9I6rGM+v0i6EjIPiysW+TaTaZRUA0Mis7Di362vrE7tMzQT3/qvtwsD
	CAg0zXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEWj-00000001e7E-3dJx;
	Mon, 14 Jul 2025 08:27:10 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubENd-00000001bax-32Ty
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 08:17:50 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250714081739epoutp016b22c71c51daea4369d159811b58360f~SED0aSYHe2569125691epoutp01U
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 08:17:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250714081739epoutp016b22c71c51daea4369d159811b58360f~SED0aSYHe2569125691epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752481059;
	bh=vuIneu7pM5DIf0S1GOG5o8U5Cu3F83SLWq90fihZ9gA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=GPSTHLpvrIdCbHkiVrB8Uo8ZndCQxfWHLVW/ZFGV+G6QkE8ul31rhAy8YHFT4b/Bv
	 L0n3+KUbGgpyKaYVtctzkWtujiCPruPBcrPNhNDfOJfxLsIKMJQY2YW52RtDVp2pYF
	 phsw6gTYCtKrHXUMKbsMl6NGIw0JRnQ4ELUP9WdU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250714081739epcas2p19bbac4165e91d7dacad9ecaeb7ece5f7~SED0G2MI91346213462epcas2p1n;
	Mon, 14 Jul 2025 08:17:39 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bgZtp57PYz2SSKy; Mon, 14 Jul
	2025 08:17:38 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250714081738epcas2p224d4cc8d164531794da6ce8dfe668ffc~SEDzGQRXB1610116101epcas2p2C;
	Mon, 14 Jul 2025 08:17:38 +0000 (GMT)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250714081738epsmtip207db5f8791a72e34b9535829bb5af1b7~SEDzC9ZwS1814318143epsmtip2Q;
	Mon, 14 Jul 2025 08:17:38 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <alim.akhtar@samsung.com>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <422fc81c-81d7-4473-92b6-9d112e6e247a@kernel.org>
Subject: RE: [PATCH v3 RESEND 3/5] watchdog: s3c2410_wdt: Increase max
 timeout value of watchdog
Date: Mon, 14 Jul 2025 17:17:37 +0900
Message-ID: <001c01dbf497$c2b0b040$481210c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIEaJ+ioIR5Yp9zWAA/UcLZjjUhMgF6s7ZMAnq+8xsBNs3P4bO2+lkg
Content-Language: ko
X-CMS-MailID: 20250714081738epcas2p224d4cc8d164531794da6ce8dfe668ffc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055858epcas2p47b849c0141fdb556288333f7abe00372
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055858epcas2p47b849c0141fdb556288333f7abe00372@epcas2p4.samsung.com>
	<20250714055440.3138135-4-sw617.shin@samsung.com>
	<422fc81c-81d7-4473-92b6-9d112e6e247a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_011747_864477_28895E02 
X-CRM114-Status: GOOD (  11.96  )
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

On Mon, 14 Jul 2025 08:04:47 +0200, Krzysztof Kozlowski wrote:
> I claim that this patch fixes nothing, because there is no user of
> QUIRK_HAS_32BIT_MAXCNT.

Dear Krzysztof,

Thank you for your review.
Are you suggesting that we combine the patches labeled as =5Bv3 3/5=5D and =
=5Bv3 4/5=5D into one?

Best regards,
Sangwook Shin


