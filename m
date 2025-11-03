Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DF8CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 08:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/74cktSMYLp+ktcjEue6HWwDM7axHBFgOQmdgvIC1gs=; b=PncFnnS0gA42kNvW2ptx16dCqx
	6vB3datNqcHeQznp9JyK13J3e7Y2DHcRw80yPAFcpb9MoXFjP7wnyLJTZ1IWkRMOALH7jmwtrnssE
	PugxEuSZ+0qeymH4c0IknKeSP91qiYo2IstPrgT8dRe/t1F8axhMa5ZQUdNDgHSBVAA1pD6XKfvRa
	HTSiHB6KRmSeEguYq14SFySSayKeehzQjtcDM4xv5PgULxqbQnf1DIKpMhpY6h/NQxwqsIL/27v2N
	hPxt2VjQil3ryikVb6pBZUBf1bzlRWH/lKHXlckkXidEkVdCBil3UYe1VULS9RVRCgs9bQ+rb8baS
	M3ruxJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpZJ-00000009PYK-1xrC;
	Mon, 03 Nov 2025 08:05:37 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpZG-00000009PXQ-1DmA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 08:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1762157129; x=1762761929; i=markus.elfring@web.de;
	bh=/74cktSMYLp+ktcjEue6HWwDM7axHBFgOQmdgvIC1gs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qaJIqKJP9ZwNzwvm53OZ8AD/3L3yjImYrj+/LsoEf0J7cHj60eZIAnHhv1lCJ649
	 AY1f4S/TRmRMAlZugyOPgg9OlrSMT+PhGnQSHRXVAV3A0e9OOul+3TsrMFnvlEnxt
	 YqcrwUlcvzN7Wt/OmSTuuURJeFZiPIWmEaafkx64mxKGSsqwuT9UyH/Rz1l/r553n
	 DX7KObEPmW8IgCaE8oKvP0mHanDG017376A9TjWYuWQuyZLtr8Se0JEhL3IZ66kt2
	 30vRTQToxjeVrkQCCPYO5HzpF335XaByVlAH4+FQ7T28zz6Z9FP4IE+JGV++SpIJj
	 lrTRhyOucBvULtuEQA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.186]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M8TBS-1vKFQ12BSi-00FRkI; Mon, 03
 Nov 2025 09:05:29 +0100
Message-ID: <65eda66d-a6cd-408f-ad00-c23b8f675a73@web.de>
Date: Mon, 3 Nov 2025 09:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: clk: keystone: sci-clk: use devm_kmemdup_array() once more in
 ti_sci_scan_clocks_from_fw()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>,
 Raag Jadav <raag.jadav@intel.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Tero Kristo <kristo@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonathan Corbet <corbet@lwn.net>
References: <a8e94921-a426-4db8-aed6-b6e17e88b8e3@web.de>
 <aQTLHlv2_V9Pgjk3@smile.fi.intel.com>
 <06be737a-365d-4a2e-89dd-72fe415bc7d5@web.de>
 <aQheXQLhrn_fOnyz@smile.fi.intel.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aQheXQLhrn_fOnyz@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:QGujYg4NANfYF8P89orDyKUdGs0nUSvUGX7V/iErFROWOCTMr54
 BoynwWdOCgeLn1k2Ad1m4uh25eN4KFGGdjnuVuD0nUao2ke8Z9UkXBpqvCLL7A8AI4cRLKu
 erDooRE0txexIxsFSHtsLmGZFZbPWlkj+zYtcfD3S9INyNC6KlUjBr186aPpIMRfyyRm8bD
 b3c5LwHiXKlmKXgTGIW/Q==
UI-OutboundReport: notjunk:1;M01:P0:NUrLSnLVcLI=;wdNnC3K5R7MW9Fneki44Pw3ep1K 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_000534_687993_86020EE2 
X-CRM114-Status: UNSURE (   4.36  )
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

>>>> Fixes: 3c13933c60338ce6fb2369bd0e93f91e52ddc17d ("clk: keystone: sci-clk: add support for dynamically probing clocks")

Will further adjustments become more helpful for the affected function implementation?

Regards,
Markus

