Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82C8CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8d252bNXxfK7aWnUfmLYfK0MNvm91wjWgg9oavzJ3QE=; b=r3FdZjaQ9jETuZQARwztLKevhz
	EqM1SLN1SwNtORn3synvHfNlwSrjReKJq4FQhLA/1KOocjSX8j3ULO+Q5Fbf5b+7CuzK9Thg2FZ0t
	vdpWEDnZSczLgI37iUEgcjyoIMzjo0bjO/25uWcGZ9LVVaoaGzGXLbl7morCH4OYTaQpaE2MY8hVI
	t6e7Zaj6t+lt/DE7GGS/nQK8nlObyFUAzJO5RszwjDUldo+Etqs7rrU3Wh/Q4oUk8KSrDuZZQ/a/S
	Tcj5/eBG4QsEqnCKr2Jn2cJNi3Un1BOzlgb4FOczt+NfefKwBNChCGQqj9VdsyQhRuZ977TKbw7f7
	Y6SRfa1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrzR-0000000EVmL-20ir;
	Mon, 18 May 2026 07:02:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrzO-0000000EVlb-2hzb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:02:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I26Yjj1462932
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8d252bNXxfK7aWnUfmLYfK0M
	Nvm91wjWgg9oavzJ3QE=; b=U5rlg/xeJ12UN5reNjt6RouHjoASyq3cQd4O3j9Z
	Rc7NuUs6N5saLAwrcf0uzV1B6cheRN4kv1w3nVEyADNyD+bwsz4cdndwXCGaYTZa
	K0bxsV4vs+5KzijwehqCk6bI+rNgcvfd0Zaf0TX0zCfAsJaFOpz+CLCH/qJD8UhE
	s8kGs7qFTkWqhe33Q9m1jayMs7W66JeOO0EeerWAQQRy4Z8MOWqMdUOWtgO4/d5v
	tNDXnRPW3ITTN3DBVXIZakWe3EQBk9fRrabQTw1oiPBepl77Iczvd89p4TtApw/b
	1TVCIMEckGzMjfNJXpQn4SV35Km0aDwtDkmki/AVZPUYwg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g52pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:02:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f73835016so1104859e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 00:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779087729; x=1779692529; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8d252bNXxfK7aWnUfmLYfK0MNvm91wjWgg9oavzJ3QE=;
        b=RKBWpbfSxyqMUNzlZps5fZWjpy86iQm/lKOc4FsEEsBwbWkcEKLujMiOlxJHqdT5xx
         Wi8mhCY32dyyxsYVZDWxwjz2NdilECZZ01CJYzBjTlEIWBRMJjzn3seelN7ADRVnJjyh
         SgesneTix2u88fB9BRLICqJxhu2/0MrIpoBFyAJmDrEoGq8EfxeUQ5ngRZAY8FvwhDMj
         rhg/hCZ8hpxORMiSB13vB9Luqk1b0t3WCPu+40N1kS5I+I02DyiDtXQDlVJGEeKixJfo
         ZVxlSK/763YoVzSZkFirmlGfcL6gkqweM4AAKxuLwY4FKyNOBxq/jjIL+VWNTHT/PB9k
         TGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779087729; x=1779692529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8d252bNXxfK7aWnUfmLYfK0MNvm91wjWgg9oavzJ3QE=;
        b=bFqYaeRjpyNmHnPInCC5JYEhAyxmJEWtcvdleGjYhP2PH3Pzqrf6x0yVln1UY1LWRX
         AKbzFW1ojYCnAqRdTWWXHFXIHmLN+EHRCS/cXtrdUmbY/6qrwk/WToUPJbY89IAReHmI
         LMWvHjpZqIvsNfhpg467DmAAN3M05LUQSC3AFpQV1ayYWSvmlZpt9c6GCGUP7f75WOp3
         kPEJbopev7KVfXixWdfM68xjYxUKnoi0ZNEqbePg/fhfOL8LQq3FG60hnxDjDbjz4jU4
         2c8VQo2/DFsXDms2V+ULv8M7MIwsto+yoARFaoiF3QswaVEhXMhUEl2HGoHBXQq51An9
         mFRA==
X-Forwarded-Encrypted: i=1; AFNElJ9EdfdukoQ+qn07NYyxTiIRa33wGbf9y0JBeK+673PGe4wCarhxdMEdCUvmEbQjsMtVx7wFR80ka8rsv6OvIMia@lists.infradead.org
X-Gm-Message-State: AOJu0YxMh640rdPNBF8DVq51mAWERxErAoK7G6M/+MyQJhTZp4DN3gBh
	BCy46To70HUFIxrMkVuBxkSRUt/naaUt+k9U9S+e02364dFGk+Qw1Wemruay3xRgzOCNcsO/JRs
	ffAyD58G3nJ61EuUvvnXHgLQlLQeMQqukwMuVF8bwO5er+pLfGvrUlCUQ+fiL8gzb1+GogkfKGA
	yBsA==
X-Gm-Gg: Acq92OE7e+mobAwburOdovy54xL6G2/QSHiQ1Auk0+AKgpBj09H/V1oFn3gvWKtBNKN
	nZ/STgUSs7pmn3uGAvAEXe0iILBaTBNey4d+7CwH6leEfrc0QBH25E6CpTNILhFfRDnctakx2YP
	4rPxXc2PQmxdo0OrAw9HnSa36tz0qjkspMKRtdWunR/jSumcSvrUW9jPAAX0xqp9RlKnfScWvwI
	e6wsHCvUm9KF9zvlsNl+XYfWyoXCC4rXZkCNbd43/XnbBETxMf6TQ6tOl646N61Kfj0JtFQVFyk
	7ngGahetFQt9ecIx4uv7wsCWrUi7vGR/WxBz5aXjvXeVwQhVpCcGXtu3DC8kdxUPO81ojabjEBm
	a0FJfgQ8VKnhJYCEvigq+sfay0kAEFwY3Ths=
X-Received: by 2002:a05:6122:4006:b0:56f:b2df:1791 with SMTP id 71dfb90a1353d-5760c043936mr6788623e0c.9.1779087728148;
        Mon, 18 May 2026 00:02:08 -0700 (PDT)
X-Received: by 2002:a05:6122:4006:b0:56f:b2df:1791 with SMTP id 71dfb90a1353d-5760c043936mr6788579e0c.9.1779087727532;
        Mon, 18 May 2026 00:02:07 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe78aadsm73144795e9.29.2026.05.18.00.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:02:06 -0700 (PDT)
Date: Mon, 18 May 2026 10:02:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
        Saravana Kannan <saravanak@google.com>,
        "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Message-ID: <ks5m7sfdhbtu3njyx7bj7drxng7qnncw4rbg7uhou5nddiubbh@b5e6k3pwdyox>
References: <9f36af74-ef1a-4777-a1c3-ff13b68c2221@pengutronix.de>
 <20260409091643.3787112-1-paul.geurts@prodrive-technologies.com>
 <95e718b9-c281-4336-9c1e-3bf8aff68457@pengutronix.de>
 <GVXPR02MB109689E26A9BAE94C2BAA34FDBD2C2@GVXPR02MB10968.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GVXPR02MB109689E26A9BAE94C2BAA34FDBD2C2@GVXPR02MB10968.eurprd02.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2NiBTYWx0ZWRfXzKJ4XahTTXOX
 jkbKSNRpRpZdU1wSGwazcT7TibKscnsHJbgCkeuEJ+lcbmLjwrvUPyW4FJy3oYDi3yGAlzruYmp
 zHgLq2LR5zvbodTTeoe1DYAJGaFnX+Nc/obeeXsqbEsua3YrDScIektI+g8hskW823yL8oHJC1+
 EKfTHLqQVuXUSFIbBque1OuwUCUyT8EdNTP0XpC4LXJssUDWVlyii9wb4fJt2sc7PBe1Mj5Z6o9
 dfjyI7ot1ZGorvIwM4k9JyvH3B+pNdhnf6+msjF2lv8Ex9X+mx1urrd0Nes2Mti2LnbgjRICy5P
 LhjLnlz2UuYJX+oBKiKX6y00TKcFhxHiO+HFmc67oQXFVjnzke+zeCQ2HxSezV+x2Zkpqr0M2P9
 YWFisuWrRtsr4rR12VhwvwOPEdJD8DFWF215VcJS62XnsFQGDVK+iF93u1bBwgwyHzItszVQbO7
 7Jv5dBfC15M1/Vnqa6Q==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0ab971 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=eaySs-uAEo-cwj1-tAcA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: C3V6ZCDuDr9oqb7jxWdZLcJR8_z9Mg64
X-Proofpoint-ORIG-GUID: C3V6ZCDuDr9oqb7jxWdZLcJR8_z9Mg64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_000210_690617_A36A36B7 
X-CRM114-Status: GOOD (  42.17  )
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

On 26-04-21 12:00:43, Paul Geurts wrote:
> > Hello Paul,
> > 
> > Cc += Saravana
> > 
> > On 4/9/26 11:16 AM, Paul Geurts wrote:
> >>> Hello Paul,
> >>>
> >>> On 4/8/26 12:13 PM, Paul Geurts wrote:
> >>>> The i.MX8MM clock driver is implemented as module_platform_driver();,
> >>>> which makes it initialize in device_initcall(). This means that all
> >>>> drivers referencing the clock driver nodes in the device tree are
> >>>> deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> >>>>
> >>>> Explicitly initialize the clock driver in arch_initcall(), to make sure
> >>>> the clock driver is ready when the rest of the drivers are probed.
> >>>>
> >>>> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")
> >>>
> >>> Your commit message doesn't explain why this was a problem for you.
> >>> Does it delay your boot? What makes this patch a fix?
> >>
> >> Yes I could update that in the commit description. The problem is that because
> >> of this, _all_ hardware is initialized in late_initcall, as that is where
> >> deferred probes are handled.
> > 
> > There's no one initcall order that will make drivers across all systems
> > equally happy. That's why there are probe deferrals in the first place.
> 
> I understand. But this order makes all i.MX systems equally unhappy :-P.
> 
> > 
> >> For embedded devices, some sign of life is
> >> expected by most people during boot. Especially when an initrd needs to be
> >> unpacked, this sign of life is going to take a very long time.
> > 
> > Ok, so the problem is that the probes happen too late. Does the total
> > boot time take considerably longer or are you just unhappy with the
> > ordering?
> 
> Both. It takes longer, and interfaces I would expect to be live "early" are very late.
> 
> > 
> >> Some display
> >> controllers don't even get enough time to show the boot logo because of this.
> >> I don't think the idea behind the initcall levels is that _everything_ is
> >> initialized in late.
> > 
> > I suspect we could improve the situation with "post-init-providers"
> > hints, but I haven't used it myself so far.
> > Maybe Saravana could give some advice once the problem is better understood?
> 
> I could look into this, thanks!
> 
> > 
> >>> What happens if you build the driver as module with your changes applied?
> >>
> >> On module insertion, there is no initcall level, and initialization is
> >> performed on insertion (AFAIK). Fact is that the system would probably
> >> not boot when this is built as a module, as there are no peripheral clocks
> >> without it.
> > 
> > Ok, then this is patch is not acceptable. What's buildable as module
> > should work as module. I don't personally build it as module either, but
> > removing the possibility will break users relying on it for Android GKI,
> > I presume.
> 
> This patch doesn't change anything about whether the driver is usable as
> a module. I think the original driver is already not useable as a module,
> independent of this patch.

What? Why is it not usable as a module?

