Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5F5CAC5BA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:CC:To:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLhrPrJ/nxo/JR0QIrb3ulTfkmpHmQZXFDh+6QpJP+Y=; b=lly7C+2L2UseiRgBsi67U6p440
	yRKEQQcbe0X+1uSO19bkPC1iv/dQWdwY26nK+LZSOFbTWfxFeEP6Qc2IhKcndqODmuqTcG8JIB8Jl
	xJItpUGdfgJOKF20bWBIwuJIQbCa6UnVR0+8brbPYxqel/WD7S7aRUKvrU3lUzgCkEcNFcDdOdvO3
	OvzLdUH+/tvReXniJryCZ1rm4mNSfkB5+BS+gkd6IEaugrZUqlWrXY9edUj7yqXoIA2fmblElCo4P
	F+ga5tqiPYs4KcyNL5BZv1WldWmFCEQEiJBN0Y/Fl/Rpd1YcKnpw8gox8DMk0UWv/+dfk/Md8GFPn
	lZ/02l0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1qm5-0000000Bxd1-0q7H;
	Thu, 25 Sep 2025 18:33:01 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1qm2-0000000Bxb9-2tmk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 18:33:00 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PIWcmG1982853;
	Thu, 25 Sep 2025 13:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758825158;
	bh=YLhrPrJ/nxo/JR0QIrb3ulTfkmpHmQZXFDh+6QpJP+Y=;
	h=Date:To:CC:Subject:From:References:In-Reply-To;
	b=mYzfNO0NcLI02J71eFtQCotuLVhjtjaITQ1N4lrLwB6x2aQSYNwoqLLTCb8P5i4bg
	 cZv9s/7o4VOR/0hcRC0Yn+BGQ/J+VPFQHzWAfeovWwWKLkKNIx6DPqNqCknC137cZt
	 thznWX/1Eh2RDnpG3fwOY8W2rzLOK7/mxp9wVPrI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PIWbXk3402736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 25 Sep 2025 13:32:37 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 13:32:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 13:32:37 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PIWb6h001964;
	Thu, 25 Sep 2025 13:32:37 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 25 Sep 2025 13:32:37 -0500
Message-ID: <DD23HER39PNM.O17TMFNNWD37@ti.com>
To: Maxime Ripard <mripard@kernel.org>, Randolph Sapp <rs@ti.com>
CC: Kevin Hilman <khilman@kernel.org>, Michael Walle <mwalle@kernel.org>,
        Frank Binns <frank.binns@imgtec.com>,
        Matt Coster <matt.coster@imgtec.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann
	<tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Nishanth Menon"
	<nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Andrew
 Davis <afd@ti.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org> <7hv7lhp0e8.fsf@baylibre.com>
 <DD1IXJDTBQ72.2XIEIIN0YA713@ti.com>
 <20250925-elephant-of-absolute-prowess-a97fcd@penduick>
In-Reply-To: <20250925-elephant-of-absolute-prowess-a97fcd@penduick>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_113258_863964_F33D47B9 
X-CRM114-Status: GOOD (  27.32  )
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

On Thu Sep 25, 2025 at 6:43 AM CDT, Maxime Ripard wrote:
> On Wed, Sep 24, 2025 at 09:26:17PM -0500, Randolph Sapp wrote:
>> On Wed Sep 17, 2025 at 10:24 AM CDT, Kevin Hilman wrote:
>> > Michael Walle <mwalle@kernel.org> writes:
>> >
>> >> The TISCI firmware will return 0 if the clock or consumer is not
>> >> enabled although there is a stored value in the firmware. IOW a call =
to
>> >> set rate will work but at get rate will always return 0 if the clock =
is
>> >> disabled.
>> >> The clk framework will try to cache the clock rate when it's requeste=
d
>> >> by a consumer. If the clock or consumer is not enabled at that point,
>> >> the cached value is 0, which is wrong.
>> >
>> > Hmm, it also seems wrong to me that the clock framework would cache a
>> > clock rate when it's disabled.  On platforms with clocks that may have
>> > shared management (eg. TISCI or other platforms using SCMI) it's
>> > entirely possible that when Linux has disabled a clock, some other
>> > entity may have changed it.
>> >
>> > Could another solution here be to have the clk framework only cache wh=
en
>> > clocks are enabled?
>>=20
>> So I looked into that. There are still about 34 clock operations that ar=
e
>> functionally uncached, but it does seem more logical than treating every=
thing as
>> uncached.
>>=20
>> Side note, why would someone even want to read the rate of an unprepared=
 clock?
>> I dumped some debug info for all the clocks tripping this new uncached p=
ath.
>> Seems weird that it's even happening this often. Even weirder that it's
>> apparently happening 3 times to cpu0's core clock on the board I'm curre=
ntly
>> testing.
>
> The short, unsatisfying, answer is that the API explicitly allowed it so =
far.
>
> It's also somewhat natural when you have a functional rate to set it up
> before enabling it and the logic driven by it so that you would avoid a
> rate change, or something like a cycle where you would enable, shut
> down, reparent, enable the clock again.
>
> In such a case, we would either need the cache, or to read the rate, to
> know if we have to change the clock rate in the first place.
>
> Maxime

Thanks Maxime. I'll take this as a hint to stop digging for the moment. Rig=
ht
now, treating unprepared clocks as untrusted / uncached makes sense and
shouldn't be too much of a performance issue.

- Randolph

