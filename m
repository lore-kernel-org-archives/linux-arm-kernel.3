Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2186CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KpXoMlUBIo07hkMUGdEi14XEgmQe4bZb6aHSf3DYdw=; b=ISVlUwKOF0Qsl1Xq9RVntAKNgH
	QEM5FMGUG+1alIguN9sBggavSdbK+uCXZbHKYXGHc+7nTei8dj5oDARcLlR22fCLuoEokKw1cFh2J
	Ho2mvo/YLH4gcok4rh16r9/YS3CH20gLMoxAKRiTIRai9BF6gPMateUyPotffQNcp5JKYWqmT4nYJ
	h0Yd5qg0pRq7DiuA5kwhgGcSn6k6N4XmA3HTJThELDcO2RiNqJMCWSJ7E/msfAVGAPMtFp8tf/xYp
	5Cr4rPsukEDH6HlMPlu1yqgF+12B0ESm2leB3NTv/++jwKs8/XHrUivq5RzXVnui93lQPrEvI7Hk9
	QxSQrjrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWNt-00000005Qln-1jiZ;
	Thu, 28 May 2026 08:46:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWNr-00000005QlJ-444K
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 May 2026 08:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5KpXoMlUBIo07hkMUGdEi14XEgmQe4bZb6aHSf3DYdw=; b=Gwr8Dnphbt2wk4qo1Mc/8BPSUu
	pLoC/CeEYtlLvvYV2/zA0pYijo6nUydiRpboNpLpC4MpfZmj+r3JisHLopbxMA8wdD3joYtrHQ4BY
	VvDnsxwAL6hqmGWJkDKi2X1/SupC75cA+Xvay3N1w9vhmsuPwG75a/mKyZ4OOnapMdsFJajEd/GHM
	a2aZqvwMLV90HqzTHQGZDnx1Xg876c/LMFVYbz7Kyohes7d2EAwjtePdGtAWxXMchhx56Rb9s8EVw
	QcRgWA82yWaLVRlAFs14b50AtopWzmJb4lqUZDX4jHxWwwdL3xNHGoebCstm1PeCQ/iTmCWFsCdw/
	XuRMJnWw==;
Received: from [210.118.77.12] (helo=mailout2.w1.samsung.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWNo-0000000FstD-1FN1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:46:30 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260528084621euoutp02e7f434b094a789c3169c3a940c5f398f~zrlpzwDXk0465804658euoutp02D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 08:46:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260528084621euoutp02e7f434b094a789c3169c3a940c5f398f~zrlpzwDXk0465804658euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779957981;
	bh=5KpXoMlUBIo07hkMUGdEi14XEgmQe4bZb6aHSf3DYdw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=KeoZE8GVf5b1OEe6UFSGQLiROB02q4qaaDAArsfCMX58Gd8ErSxREKheEPOmUfWRH
	 RzZ6Y2XEuMP4Sq73zIHdLdmIdbNEjS4pR8bktyU1TVRld9xxAu+gI0BGhwXaizQAQv
	 6Cyx4MHBwN7y1xtNUj6SZg+6MZO6Xu2FKJoXoUck=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260528084620eucas1p178159f6b7f3eed6806a848db6587a9f7~zrlpjYHfw0286802868eucas1p1U;
	Thu, 28 May 2026 08:46:20 +0000 (GMT)
Received: from AMDN5751 (unknown [106.210.134.141]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260528084620eusmtip158031719a5ee8ffa2ec70f2df3e3bb3c~zrlpDenNy3061430614eusmtip1_;
	Thu, 28 May 2026 08:46:20 +0000 (GMT)
From: "Sylwester Nawrocki" <s.nawrocki@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Chanwoo
 Choi'" <cw00.choi@samsung.com>, =?UTF-8?Q?'Andr=C3=A9_Draszik'?=
	<andre.draszik@linaro.org>, "'Tudor Ambarus'" <tudor.ambarus@linaro.org>,
	"'Stephen Boyd'" <sboyd@kernel.org>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Brian Masney'" <bmasney@redhat.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20260527-samsung-clk-maintainer-v1-1-97b179224ca5@linaro.org>
Subject: RE: [PATCH] MAINTAINERS: add myself as a co-maintainer for Samsung
 SoC clock drivers
Date: Thu, 28 May 2026 10:46:20 +0200
Message-ID: <001a01dcee7e$75221490$5f663db0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMRLRiS7x6EsXGdyHJNlMCP943byQGZPUDss63YNJA=
Content-Language: pl
X-CMS-MailID: 20260528084620eucas1p178159f6b7f3eed6806a848db6587a9f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260527205405eucas1p15ef3a9c4021f760ababa4bfdde18251f
X-EPHeader: CA
X-CMS-RootMailID: 20260527205405eucas1p15ef3a9c4021f760ababa4bfdde18251f
References: <CGME20260527205405eucas1p15ef3a9c4021f760ababa4bfdde18251f@eucas1p1.samsung.com>
	<20260527-samsung-clk-maintainer-v1-1-97b179224ca5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_094628_764230_0FB38519 
X-CRM114-Status: GOOD (  11.06  )
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
> From: Peter Griffin <peter.griffin@linaro.org>

> Subject: [PATCH] MAINTAINERS: add myself as a co-maintainer for Samsung
> SoC clock drivers
> 
> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on the Samsung SoC clock drivers and have an interest in helping
> maintain this code in the kernel.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> This follows discussions with Krzysztof about expanding the Samsung SoC
> maintenance team in the kernel.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>


