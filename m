Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE5BE92716
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 17:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0o7m6LM84ZCONFK2tcEX26ZxZDumLuj8aKYXMop/gcM=; b=IGUgHYrdpyi+O5gN+GevX2hUEo
	C7J91zT+/TroAdT6EhPrIqWmS27Xumwo0xNETjptwahQvaouN+1oLJtvjluZ1ZLZo8n14aeU6/RR5
	XVLIR8pDmbjUzqqvGPd0iUR0QH9CBvR5Rbgal41y9n8l1zTozLFhQ0TCHlH82ZHrQS/NTTR0wMET/
	b5ID+deAdV3/LcajIROSzmeVa7SHTFdmLQedpgEbHLj1W4+R5yO/yorJyWASQBhxtVz60vO8/NUuN
	v9KB6eOjUm0d4vg3S7kxnh4EhApCuqDN+zVYzToBAbVVuYZcRqAeD0rmT5h3k66EuCxB+/btS2ZhX
	jAPQYXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZYG3-000000026tl-0vnW;
	Sat, 27 Dec 2025 17:39:15 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZYFz-000000026tM-01Xe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 17:39:13 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251227173901epoutp02d0c62c0c05625baea90ebe81ff16a7f2~FIzWOEWdn0599005990epoutp02d
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 17:39:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251227173901epoutp02d0c62c0c05625baea90ebe81ff16a7f2~FIzWOEWdn0599005990epoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1766857141;
	bh=0o7m6LM84ZCONFK2tcEX26ZxZDumLuj8aKYXMop/gcM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=nmxOoLL2AcAoJDieTpqmZbAbu1NQ3Wre4rfbbvXef/OYG2r0pzzKZOH8w9a7CH7OC
	 es8TMK0EQTu5b3WA2f1NwacHCdcPSND76JK1AUHSDfOkPf4CXUMeO343t211bfAvSC
	 AgS0IpxZvPVhb1XHT5PTrvigSuFw4hYnNjcqzJY4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPS id
	20251227173901epcas1p24cd12e1adf067a989adaf7f75100dbc2~FIzV092EB2381623816epcas1p2l;
	Sat, 27 Dec 2025 17:39:01 +0000 (GMT)
Received: from epcas1p2.samsung.com (unknown [182.195.38.120]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ddqTx0jb6z6B9m6; Sat, 27 Dec
	2025 17:39:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251227173900epcas1p18df710bd3fa96bdc1cda04104b18a6fc~FIzU6wR7x2371723717epcas1p1M;
	Sat, 27 Dec 2025 17:39:00 +0000 (GMT)
Received: from sgsupark03 (unknown [10.252.69.53]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251227173900epsmtip167fa2dae32c225dd0b9c064a596d5453~FIzU1dwjm2637726377epsmtip14;
	Sat, 27 Dec 2025 17:39:00 +0000 (GMT)
From: "Seongsu Park" <sgsu.park@samsung.com>
To: "'Yeo Reum Yun'" <YeoReum.Yun@arm.com>
Cc: "'Catalin Marinas'" <Catalin.Marinas@arm.com>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <GV1PR08MB105210D9BD328C2446CA8C551FBB1A@GV1PR08MB10521.eurprd08.prod.outlook.com>
Subject: RE: [PATCH] arm64: Fix PIE_E1 mapping for _PAGE_READONLY_EXEC
Date: Sun, 28 Dec 2025 02:38:59 +0900
Message-ID: <000001dc7757$af3294a0$0d97bde0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHMhyfnFqGChs3boQoryTGZWw6pewEgY9GSAjEz1Ra1OxNcwA==
Content-Language: ko
X-CMS-MailID: 20251227173900epcas1p18df710bd3fa96bdc1cda04104b18a6fc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251227070633epcas1p3a8f7c19c9f5114a46765073fa16ba449
References: <CGME20251227070633epcas1p3a8f7c19c9f5114a46765073fa16ba449@epcas1p3.samsung.com>
	<20251227070625.217349-1-sgsu.park@samsung.com>
	<GV1PR08MB105210D9BD328C2446CA8C551FBB1A@GV1PR08MB10521.eurprd08.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_093911_639975_7DEF2CB3 
X-CRM114-Status: UNSURE (   9.68  )
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

Hi Yeoreum,

> NIT: This looks like it allows executing user code from the kernel.
> Why is this necessary?

Good Catch. You're absolutely right.
I misunderstood how PIE separates EL0/EL1 permissions.
The kernel should only have read access to the executing user code pages.
The original PIE_EL1 mapping to PIE_R is correct.
My patch would be a security regression. Please disregard.

Thanks for the careful review,
Seongsu Park.


