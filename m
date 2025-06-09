Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7905BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 04:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0Ty8uQC2ggf7ArBdnQeDtKQVIMY78+qF9VWC+NFGdo=; b=zlfC7kBDBwSdfUHDfb7awM8O1d
	Ja6xEUqdCHrrvVaRYjfV6H332MPRoO0wk7L3Pb4mGOat3uK/lUx67Mp9PNopvhShiN7EmhnBDZkZh
	rKMmQxrMR8gqvLGT1vljI4Ryb5mykQQk6orlwhyplJj1/CExtRhtmA7eQeaped4BPuo+piekuhu2/
	F0M/cgoPnv3Xl6kti34xDe/dobfhOfK64fOChr+MPBzY4p4EKVDGzNUCfhdv9UG7XtcYKSLNw6e/w
	2WUYebjJZBPV8ckl3bIY+BGMtZtAHrrwmKujaC2a/lh0Gf/qsmE0HYVdrYaUC4vHw69MXrkIbctjf
	WFoSSnnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOTnu-00000003NV1-2PYE;
	Mon, 09 Jun 2025 04:08:10 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOTll-00000003NON-2AnJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 04:06:00 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250609040550epoutp02d0a5897844a8d5dd4e36ba0d8804d2cc~HRC9jKV6D2360523605epoutp02p
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Jun 2025 04:05:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250609040550epoutp02d0a5897844a8d5dd4e36ba0d8804d2cc~HRC9jKV6D2360523605epoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749441950;
	bh=W0Ty8uQC2ggf7ArBdnQeDtKQVIMY78+qF9VWC+NFGdo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=rN3/KtQrvZoO5EJWpXFAE+yCgtvoPe7amkm1tf5cMF7fvZ8T0UTH9fjy4usrOHJAh
	 NpvEbnOX/rv9zDxq2MAyKUMi3Yaxq6RwNNpFqVXAjg7IFwLMnndpieOCpPNZacU381
	 079KqPrn/a2xLCYM8AuH05zDe665qLdT1Lp6xaPs=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250609040550epcas5p44ffe74ab72a0659449132c1e2595348c~HRC9FgbNP1796017960epcas5p4L;
	Mon,  9 Jun 2025 04:05:50 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.175]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bFyyH4tpDz2SSKY; Mon,  9 Jun
	2025 04:05:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250609040543epcas5p4a339f4920addf5bd274e54778172e78b~HRC2pfZzh2015720157epcas5p4t;
	Mon,  9 Jun 2025 04:05:43 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250609040540epsmtip23ac06c81db24768155a370ce8cdcaa13~HRC0J7VFH1644916449epsmtip2m;
	Mon,  9 Jun 2025 04:05:40 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <richardcochran@gmail.com>,
	<sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<chandan.vn@samsung.com>, <karthik.sun@samsung.com>,
	<dev.tailor@samsung.com>
In-Reply-To: <20250529112640.1646740-2-raghav.s@samsung.com>
Subject: RE: [PATCH v3 1/4] dt-bindings: clock: exynosautov920: sort clock
 definitions
Date: Mon, 9 Jun 2025 09:35:38 +0530
Message-ID: <03cd01dbd8f3$c4c18130$4e448390$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRyuXPQglR2pg1tLiplohNF2WAzQJJNEBAALUq35Ozdl5VAA==
Content-Language: en-us
X-CMS-MailID: 20250609040543epcas5p4a339f4920addf5bd274e54778172e78b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529111708epcas5p232b8bb6b05795b7014d718003daef0cb
References: <20250529112640.1646740-1-raghav.s@samsung.com>
	<CGME20250529111708epcas5p232b8bb6b05795b7014d718003daef0cb@epcas5p2.samsung.com>
	<20250529112640.1646740-2-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_210558_195476_9FC6142E 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Thursday, May 29, 2025 4:57 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; richardcochran@gmail.com;
> sunyeal.hong@samsung.com; shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; netdev@vger.kernel.org;
> chandan.vn@samsung.com; karthik.sun@samsung.com;
> dev.tailor@samsung.com; Raghav Sharma <raghav.s@samsung.com>
> Subject: [PATCH v3 1/4] dt-bindings: clock: exynosautov920: sort clock
> definitions
> 
> Sort all the clock compatible strings in alphabetical order
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


