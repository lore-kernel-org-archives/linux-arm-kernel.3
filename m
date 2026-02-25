Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CEDFCEE91
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IizUq26mU0IFus36KtptiQJycd4Ah24lnhNyzSKAepg=; b=3Gt6kMXSe+PFRvYNLBf9H5kyaW
	CNgw2Mgu5n8qjQ/Aeg71cuXblwxzmbLSlBVpJEthyjPV2tmCspmuw2nTJP97u3WuCujfi3CaDWpwG
	tK0C/LLHWUTtkuHKD6ao9BJrdzlGVMO4E4zyBSR38C/nVO3i7IruRT58j7wOtctf3Mczi4S/VpNg8
	8/mgUM7FESx4/ase4QLuEDcULJ2tS4luGZvhDetqAHctWaLYdjIAQ/AvIO4Rqj8CdxgtQHjwUmvwf
	WhulB9WyQxgDLhgmkD47C1KUj5crqpR7PnUY3095MdVoL83HJTlg8YiYVQKeE83PrEarscQ6SupHu
	37TZgJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDb8-00000003xfb-0gRA;
	Wed, 25 Feb 2026 12:02:34 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDb5-00000003xfF-1Afk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 12:02:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772020938; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TNJv7kHvKUjGqmcwqmsA3x0Le/gXxWBaVPK9MVwLfT0THMVAbnnQafEgk4xL24tsUzOtwk5HHaO7z/S46vhBpb1zdwWLVPIMrGQpcUeBP29lrbkbUywNE9BJqL5Hd2FNpTvxF0nz23wenBDorGxfuwYEshJOxbVn+mh+ru9ski4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772020938; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IizUq26mU0IFus36KtptiQJycd4Ah24lnhNyzSKAepg=; 
	b=OCSRMenj1mEEe8LNXJ4se7RyUl8bq3NAXYRIYzTPesWb0vXEPNFzJAGKLYUT1NMPmZlLloEjQhlTlP2CjrKMUqI4zblo60nLKvGf5u1Qk6hVU/VpsAWQ6mzhb4g+H2xhGtbRlY2qJULoJMmyZHwx3ZJZEqiPT36/nqnKWaDkCCM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772020938;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=IizUq26mU0IFus36KtptiQJycd4Ah24lnhNyzSKAepg=;
	b=k9FhMGUzjDF6Zv9rpTWG7kHQfLXoH3dpXC1A2r40o3ZV9uctEqbdPyvh4ZjlJm61
	XiS2C33j+JVBS8KJcrVPa1IAnBN/LojPSdNyOTuPC8LmkUYWJChQmOEdwQ6/YoHc7Ls
	Ggv2L55nMYeb7L2cx03R245+LsUb0Hx+5OBs7Ux0=
Received: by mx.zohomail.com with SMTPS id 177202093493336.86441168143767;
	Wed, 25 Feb 2026 04:02:14 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 20:02:03 +0800
Message-Id: <DGO0ZQ827ZV8.4EO0ONZBR8CL@pigmoral.tech>
Cc: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/7] rtc: sun6i: Add support for Allwinner A733 SoC
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Chen-Yu Tsai" <wens@kernel.org>, "Samuel Holland" <samuel@sholland.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Maxime Ripard" <mripard@kernel.org>,
 "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
 <5061953.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <5061953.GXAFRqVoOG@jernej-laptop>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_040231_712370_4D84C572 
X-CRM114-Status: GOOD (  21.26  )
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

Hi Jernej,
Thanks for your review.

On Sun Feb 22, 2026 at 6:41 PM CST, Jernej =C5=A0krabec wrote:
> Hi!
>
> Dne sreda, 21. januar 2026 ob 11:59:06 Srednjeevropski standardni =C4=8Da=
s je Junhui Liu napisal(a):
>> Add support for the Allwinner A733 RTC and its internal Clock Control
>> Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
>> SoC-specific RTC CCU driver to handle the hardware's evolved clock
>> structure.
>>=20
>> To facilitate this addition and improve driver modularity, transition
>> the binding between the RTC and its internal CCU from direct
>> cross-subsystem function calls to the auxiliary bus. Also extract shared
>> IOSC and 32kHz clock logic into a standalone ccu_rtc module for reuse
>> across newer SoC generations.
>>=20
>> The A733 implementation supports hardware detection of three external
>> crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
>> the driver via read-only mux operations. Implement logic to derive a
>> normalized 32kHz reference from these DCXO sources using fixed
>> pre-dividers. Additionally, provide several new DCXO gate clocks for
>> peripherals, including SerDes, HDMI, and UFS.
>
> This work looks nice, but I have some questions/comments:
> - you're missing RTC SPI clock, which is needed for RTC, at least accordi=
ng
>   to vendor 5.15 DT. Could it be that this bit set by vendor U-Boot so yo=
u
>   missed it during testing? Manual says that it's disabled by default.

You're right! I tried disabling the RTC SPI clock in U-Boot and found
that the output of UART became garbled during booting kernel. I will add
it in the next version.

> - Vendor DT has strange RTC CCU phandles for UFS and HDMI. In first case
>   uses RTC wakeup and in second DCXO, which doesn't make any sense. Did y=
ou
>   do any experimentation with these clocks? It wouldn't be the first time
>   that either code or manual contained some kind of error.

Regarding UFS, I am still working on getting UFS functional on the
mainline kernel. I will investigate the actual relationship between the
RTC wakeup clock and UFS during this process.

As for HDMI, I believe it actually requires the hosc_hdmi_clk
(DCXO_HDMI_GATING in the manual) provided by the RTC module.

>
> Btw, switch last two patches. With current order during bisection you wou=
ld
> get a complaint that A733 RTC CCU driver is not present.

Okay, I will do it.

>
> Best regards,
> Jernej

--=20
Best regards,
Junhui Liu


