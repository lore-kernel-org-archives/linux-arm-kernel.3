Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DDED6407A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrrOmhiyiOq4yDJCEVzWpuHvN8KFfb2K+eM0p+8fJ70=; b=R2PFFnuoQZyFcRtJlVBjUN7m0r
	j/VrABc5uZc+hiGQqy+oDCUy5h4x37YGhIoZkaLeXjTlPiMKYGd9iUIX/vq49wtEhDHwl+pStu23H
	W2GUmbIW+UAK9rrEQbPHpKRaA0o4sli+ILLE3GpXljrGe3B3jQGLnLf1o1kTk+8Ab6kdVtgfRu9sM
	yNe53etsWAfNSf7fO05Ktztef/iCxBh9BJ+legqAc3J7imgO2Lhujckr9f0bRnSOMlFefhASFq+Rz
	+4EmE8lucNmRNwNogUhH6A8Z4cY+NBCXM8gx16Jj5SfUcGu3Yw6MtduiRdlqWS8WlfRDuw+ub90Ab
	rciOSmQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqwZ-00000006oLV-2fWL;
	Wed, 17 Dec 2025 12:47:51 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqwW-00000006oKd-407T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 12:47:50 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251217124741epoutp023896f9c2a5350e72c1dfa159e8619239~CAYIKtjjG0778407784epoutp02R
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 12:47:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251217124741epoutp023896f9c2a5350e72c1dfa159e8619239~CAYIKtjjG0778407784epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765975661;
	bh=YrrOmhiyiOq4yDJCEVzWpuHvN8KFfb2K+eM0p+8fJ70=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=DactHyrvwkaASRA+9HuxX9PhTjnxnphj8NJUKFheXEq/6ot+Z4PIPsog9Q1DYWXlE
	 qleM7jfZR6yJ8ttUaLeBxyG8QRc1qNsBIVI8WJK13HT6nyLO3j/vVwNafFl3LKFRZi
	 IeWtE6SEK9QKCyTr/O6Cesua6mqPRBOB7DUDuhdg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251217124740epcas5p3a5b1b2050b6c3d8e3e9e6d5dedff6f6f~CAYHSVT7Y0703507035epcas5p3Q;
	Wed, 17 Dec 2025 12:47:40 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dWYVM706Cz6B9m5; Wed, 17 Dec
	2025 12:47:39 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251217124738epcas5p4eb8ba44b348c02adf77fddc8ac38a7c9~CAYFG2oVJ0801908019epcas5p4V;
	Wed, 17 Dec 2025 12:47:38 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217124732epsmtip1b0e3f2327a7b0a6251274a38d05cf3d8~CAX-p-MpQ1194311943epsmtip1L;
	Wed, 17 Dec 2025 12:47:32 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chandan.vn@samsung.com>,
	<dev.tailor@samsung.com>, <karthik.sun@samsung.com>
In-Reply-To: <20251119114744.1914416-4-raghav.s@samsung.com>
Subject: RE: [PATCH 3/3] arm64: dts: exynosautov920: add CMU_MFD clock DT
 nodes
Date: Wed, 17 Dec 2025 18:17:29 +0530
Message-ID: <139b01dc6f53$534e6e90$f9eb4bb0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH7EhboaEaVd13SrnoN6ZCnkjrAPAJkRUHKAfQSjhO0xb9t8A==
Content-Language: en-us
X-CMS-MailID: 20251217124738epcas5p4eb8ba44b348c02adf77fddc8ac38a7c9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119113935epcas5p33c4cac5a961ce334bde5988ef74b09ed
References: <20251119114744.1914416-1-raghav.s@samsung.com>
	<CGME20251119113935epcas5p33c4cac5a961ce334bde5988ef74b09ed@epcas5p3.samsung.com>
	<20251119114744.1914416-4-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_044749_305186_E30329DC 
X-CRM114-Status: UNSURE (   9.49  )
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

Hello Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Wednesday, November 19, 2025 5:18 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; sunyeal.hong@samsung.com;
> shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; chandan.vn@samsung.com;
> dev.tailor@samsung.com; karthik.sun@samsung.com; Raghav Sharma
> <raghav.s@samsung.com>
> Subject: [PATCH 3/3] arm64: dts: exynosautov920: add CMU_MFD clock DT
> nodes
> 
> Add required dt node for cmu_mfd block, which provides clocks for MFD IP
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



