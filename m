Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE3BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eK58TLlJnYs4DpvxbqSmQLRIluJEvRYUiOzTtDtI3+c=; b=lf/U4MAfKVn8OSaxtU4zEBfLTp
	dF0K+wXu5QwKLYjCfB+l2xcDQV+IADTg8N+0Utj2mDk6SCl4bKrBcfNX+vFKFW2txwEUUHCu5bNRG
	dro1xHriZO384NdNSqXgUBAwRWL9eYjq839dKBvJIBiDaNxI69bWs0rgsxV1nbJ01Y9nTdTs4+seR
	SKCVTkrJUoCAlcc7b5ynfDyX8wzBUqL0aeKIL2pm2gu8tGB4bopb2LcU/WUeOZjsOxuYOygJjAg/k
	sWiGPqmuxJ5tou3gF4WIM0zzyl/yCEGntBFc/Ykp5GVwlNqKEITAez5jxRcvLLOU35hoZAUfG4UjI
	q5Mb/r4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHZA-00000002f8F-0yWk;
	Fri, 09 May 2025 06:50:40 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHWZ-00000002efQ-1FTS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 06:48:00 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5496lrAE1327694
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 01:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746773273;
	bh=eK58TLlJnYs4DpvxbqSmQLRIluJEvRYUiOzTtDtI3+c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IYY8x33gKiwejVo0tvlfS8U5sVeupJ9RbHkt+/GPceStVRaZ93dV8Grw0nF+ZRC2+
	 Cn942mk1WhviXOHInDyPkrUnVVSBieUosnHfgxLinhlU7WDoUcvMdgK3ite0zaiRtE
	 I8/514C+CT/sspGPoW6+oMt95CgnxXmUKADnCQI0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5496lrrQ014593
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 01:47:53 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 01:47:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 01:47:53 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5496lrlj014571;
	Fri, 9 May 2025 01:47:53 -0500
Date: Fri, 9 May 2025 01:47:53 -0500
From: Nishanth Menon <nm@ti.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-sk: Add power/temperature
 sensors
Message-ID: <20250509064753.4ntxyozwlebnskod@compound>
References: <20250505-am625-sk-sensors-v1-1-688fb928b390@pengutronix.de>
 <20250507120104.4mhuaabe5auukarn@banter>
 <aB2hdA8mfKGlk8d8@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aB2hdA8mfKGlk8d8@pengutronix.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_234759_497230_B2D60131 
X-CRM114-Status: GOOD (  31.54  )
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

On 08:32-20250509, Sascha Hauer wrote:
> Hi Nishanth,
> 
> On Wed, May 07, 2025 at 07:01:04AM -0500, Nishanth Menon wrote:
> > On 15:24-20250505, Sascha Hauer wrote:
> > > The AM625-SK has six power sensors and two temperature sensors connected
> > > to I2C. Add them to the device tree.
> > > 
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > ---
> > > The AM625-SK has six power sensors and two temperature sensors connected
> > > to I2C. Add them to the device tree.
> > 
> > Sascha,
> > 
> > I suggest making this as overlay. The reason is as follows: AM625-SK
> > among other TI evms do have automated power measurement capability from
> > XDS110 (accessible via USB port for jtag - appears as a rudimentary
> > menu option). The way this works is that it uses TM4C1294NCPDT to use
> > I2C commands to control the INA226/231 depending on the evm.
> > 
> > This firmware should be flashed by default on production boards (if
> > not, starting up CCS[1], autodetects older firmware and updates - at
> > least to my understanding) - by the way, this firmware also does test
> > automation, such as boot mode switch control, reset control etc.
> > 
> > This is the primary framework meant to be used by test automation and
> > indeed it is the default inside TI.
> > 
> > Challenge here is this: if we make this default in Linux, the test
> > automation system configures the INA226/231 in a different sampling
> > mode depending on usecase etc Vs what Linux does (even though the
> > shunt and the bus voltage for a given INA is the same). And just like
> > Linux, the firmware power measurement logic has changed over the
> > years.
> > 
> > Anyways, while I know that the SoC and TM4C can both handle
> > multi-master, the challenge is the same INA controlled and
> > mix-configured by two masters (and there is no synchronization between
> > the two).
> > 
> > To avoid this entire conflict and headache, I suggest adding it as
> > overlay that can be applied depending on the preference of measurement
> > desired.
> 
> Thanks for this explanation. I'll go for the overlay then.

Thanks. do check if the default defconfig needs to be updated as well -
i didn't get a chance to cross verify - will be good to ensure deferred
devices are 0. if something to be enabled, do enable them as modules,
i'd gladly pull it in.

just a headsup - i plan on closing the window today and pick last set of
patches and tag on monday. a bit tight given the window currently..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

