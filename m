Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FA010AB830
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhwQ3iwD3rKe33JdbcyziY0LAl0yrH8VvKtX0KHIFPk=; b=jIZwo+Jm146oLVyQkaRKMuGtoy
	3sVFOWHeukq6MnzPH7ZBLusvg19mTTr1EoeVahM6Nn3T10A95zfSxOoE4vF7SUrGfeJgnWt4fDqZ2
	0hHmfeMhN0xNbHFCHT+9fN412f5xuDXvslGV+xLugqCTn9ZAq6Ru5IxKT+r+Xb/luepyp38Wp2rDI
	FlmJ5dYh5mC/IhVixJvKvknomXwTpVVrrLHPm0Z/F+/lAKO2suRiZgLGOiQsnocI2ra4RABItuzuF
	g24ooiv2exiZ6192QZ8HYIQCR/Wc5PvLFRO1D4Vw/vJ+fbt9U32hWm8LzjLFpAUznN/1kZASHay0G
	heHOvEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68XN-00000007dro-21Xh;
	Fri, 27 Mar 2026 14:51:49 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68XK-00000007drM-36zy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:51:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47989101589;
	Fri, 27 Mar 2026 15:51:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1774623097;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zhwQ3iwD3rKe33JdbcyziY0LAl0yrH8VvKtX0KHIFPk=;
	b=OE69HoY02URaEnVSplB8hY3g0T4Iq2x1RvedSLyFZgHdTSV8YGHQWWEHP7x2ImL54/nQtA
	ixgQk7Bhbsj/xP3wmk7aWIAfT5kM/JHd33BHrh1qq5vVrE3kSNdEc1sG33GzntOuCegwh2
	IVJsKDxdKRMHFR2qXw948dCf7kwUhrHO/ClMIQhaG3cGlUx9FAmWt69AZO1sUjNSBmPE8o
	o2IPO/+rbh5Nn9XPhwoSiOYSG5GtBdEtK0ecTB9cbMAz/Vjptao+F8WAlgY9YJuPTNOSB4
	FssWUvmQQmuXxKkJz/F7akendVrP0+uyc2DYXNXc4bjUitH8JccB5Dt2Ovl4Ng==
Message-ID: <a25a1b42-5f68-4033-b8cf-d2e12d3de26d@nabladev.com>
Date: Fri, 27 Mar 2026 15:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
To: Rahul Navale <rahulnavale04@gmail.com>,
 Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
 suraj.gupta2@amd.com, thomas.gessler@brueckmann-gmbh.de,
 radhey.shyam.pandey@amd.com, tomi.valkeinen@ideasonboard.com,
 Michal Simek <monstr@monstr.eu>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260318123524.4959-1-rahulnavale04@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260318123524.4959-1-rahulnavale04@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_075146_997095_DEA417F0 
X-CRM114-Status: UNSURE (   6.62  )
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

On 3/18/26 1:35 PM, Rahul Navale wrote:

Hello Rahul,

>> If yes,make sure you only test these three
> I have confirmed no other pathes applied on xilinx dma driver.
> I have applied only three patches provided by you.
> and tested audio but facing same issue.

Can you please add [1] to the patch stack and let me know whether that 
improves the behavior ?

Thank you

[1] 
https://lore.kernel.org/linux-sound/20260327143014.54867-1-marex@nabladev.com/

