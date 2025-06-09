Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9969C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 08:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cN9o5yJb7lDfiZzuAc8Z6y89aiz9604YtYG7xD9tzTw=; b=EXlMFfO40tCiBfnEkBWXoL5zMP
	B7yVDBEDESrwmpDBwdvRIDpdzJzOVZfAZ4UHpivrwnQmtZEjgzCUx7uLnZhlepjH+6vKWciaztOR2
	DrWuzTZFv6fOxo41FspTWWyzdWIJImfcxEOg0vsBPgAc9SEoFL7oh06xyiJDYaFCrFfrDnmD3E3gN
	y+nMDT3r9abQkL+5mv1XxK+28q/oTlV25V029vMURaFEG04Rafhqhwhxi3h6VYquvGF9QtwNSQtNy
	pxs9ztn5zaAHQw3qrsSeQtgCNWNxD9/SmIFhqDCXT9S5XADGLA58tgJC6mE+VgFPfcpdWOZDTP6wR
	n4lPdhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXbX-00000003dpl-1jdG;
	Mon, 09 Jun 2025 08:11:39 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXZN-00000003dbj-0oGU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 08:09:28 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250609080918epoutp041b95d506a931c0f5db7550ea67c5ff29~HUXh-c1Tx0961009610epoutp04u
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Jun 2025 08:09:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250609080918epoutp041b95d506a931c0f5db7550ea67c5ff29~HUXh-c1Tx0961009610epoutp04u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749456558;
	bh=cN9o5yJb7lDfiZzuAc8Z6y89aiz9604YtYG7xD9tzTw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=pgasgp+6AQvZMrxhGTbMIerWhFBSld2H6TzZ7CFtP5CLFGFT4rFuzqFGJ6Mn9J/T+
	 u0GYDLTHXpEe2ScN/ZVneDJQykIp22rpIMNLTSifMrqlCEKYsA5GE4yix1oKPjYNzN
	 F7Ro9455b4wmU3M12HxR5rieWlL1Ja6o/aL3cnfY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250609080917epcas5p17c6704d44ba3593428bcb9b96f039e56~HUXhnjq5Y2375323753epcas5p1M;
	Mon,  9 Jun 2025 08:09:17 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.179]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bG4MH15c4z3hhT9; Mon,  9 Jun
	2025 08:09:15 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250609080914epcas5p4d304dbdc3a5741045d7e489c370c4417~HUXeeC5qH1804718047epcas5p4z;
	Mon,  9 Jun 2025 08:09:14 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250609080911epsmtip1e3e91558507d9affa05a8678865f25f8~HUXcEjzBR1204112041epsmtip1a;
	Mon,  9 Jun 2025 08:09:11 +0000 (GMT)
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
In-Reply-To: <20250529112640.1646740-3-raghav.s@samsung.com>
Subject: RE: [PATCH v3 2/4] dt-bindings: clock: exynosautov920: add hsi2
 clock definitions
Date: Mon, 9 Jun 2025 13:39:10 +0530
Message-ID: <043e01dbd915$c9e043a0$5da0cae0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRyuXPQglR2pg1tLiplohNF2WAzQMeJa83AJLEY+CzcMpuQA==
Content-Language: en-us
X-CMS-MailID: 20250609080914epcas5p4d304dbdc3a5741045d7e489c370c4417
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529111711epcas5p48afd16e6f771a18e3b287b07edd83c22
References: <20250529112640.1646740-1-raghav.s@samsung.com>
	<CGME20250529111711epcas5p48afd16e6f771a18e3b287b07edd83c22@epcas5p4.samsung.com>
	<20250529112640.1646740-3-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_010925_868295_F742DD10 
X-CRM114-Status: UNSURE (   9.35  )
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
> Subject: [PATCH v3 2/4] dt-bindings: clock: exynosautov920: add hsi2 clock
> definitions
> 
> Add device tree clock binding definitions for CMU_HSI2
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


