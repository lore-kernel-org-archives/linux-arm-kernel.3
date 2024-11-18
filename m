Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049AFD10F57
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 05:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9IN5OznuVVvXmBLPtTBjQEWZ4OA6WUbSbNTYMWN6WA=; b=pgX0KxiYXw4miCjIaRwPfXzvM1
	GlYvxhb12VmvCJM4na198v2MIVyLhYxh4VfSEo6goa41nXQ1M3kHjB1ofICGV+BGTM25sHwEhGN2S
	iwYjwgrL5fRsLg5PXzl1Noqyns4vW0zxetLQHPL2Xa83xK8vf67zyVrhaoOb+YkoRKxBLvQWteyAN
	8AfbOUdS3qaWgUFvSMp2cxyE8iD3uejhlW9Ib41BK+VfdG5i7xZKMLsmfx0IIgkWtm5Mj8bB0AAue
	O3LbEjdsnFFTL0812XLLJgTZADpuvheoG8hRS2INAEjVUh1BllpG78agk4/CbWdLq6Twrnnk2BZU5
	BV6BNSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuDK-00000008NUV-1wGa;
	Mon, 18 Nov 2024 05:22:18 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuAm-00000008N0w-2jTj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 05:19:42 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AI5JSDQ028295;
	Sun, 17 Nov 2024 23:19:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731907168;
	bh=s9IN5OznuVVvXmBLPtTBjQEWZ4OA6WUbSbNTYMWN6WA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=K6E0u7e3WsIjif7EOuC9F3PTnNOWSQB8+jUwLn0vzZ61QkP36fat2C7kpe1XNUFfY
	 7MOZcbqFMYOcOV7P5Lec7KlWPisr66sHDrOBJeO36SCs02RZ6dbudnO4Z+tZSEzlqo
	 gRoArPSH81jwbP5k4of75z5+uG4QEwN5b48JGf9Y=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AI5JStC124683
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 17 Nov 2024 23:19:28 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 17
 Nov 2024 23:19:28 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 17 Nov 2024 23:19:28 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AI5JRj6025092;
	Sun, 17 Nov 2024 23:19:27 -0600
Date: Mon, 18 Nov 2024 10:49:26 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Rob Herring <robh@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-pinctrl: Introduce deep sleep
 macros
Message-ID: <5b35c736-74d6-4fe9-ae82-272dc2e98b82@ti.com>
References: <20241112115650.988943-1-s-vadapalli@ti.com>
 <20241112115650.988943-2-s-vadapalli@ti.com>
 <20241115154822.GA2954187-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241115154822.GA2954187-robh@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_211940_786154_AE91FB88 
X-CRM114-Status: GOOD (  21.05  )
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

On Fri, Nov 15, 2024 at 09:48:22AM -0600, Rob Herring wrote:

Hello Rob,

> On Tue, Nov 12, 2024 at 05:26:49PM +0530, Siddharth Vadapalli wrote:
> > The behavior of pins in deep sleep mode can be configured by programming
> > the corresponding bits in the respective Pad Configuration register. Add
> > macros to support this.
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-pinctrl.h | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> > index 22b8d73cfd32..cac7cccc1112 100644
> > --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> > +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> > @@ -12,6 +12,12 @@
> >  #define PULLTYPESEL_SHIFT	(17)
> >  #define RXACTIVE_SHIFT		(18)
> >  #define DEBOUNCE_SHIFT		(11)
> > +#define FORCE_DS_EN_SHIFT	(15)
> > +#define DS_EN_SHIFT		(24)
> > +#define DS_OUT_DIS_SHIFT	(25)
> > +#define DS_OUT_VAL_SHIFT	(26)
> > +#define DS_PULLUD_EN_SHIFT	(27)
> > +#define DS_PULLTYPE_SEL_SHIFT	(28)
> >  
> >  #define PULL_DISABLE		(1 << PULLUDEN_SHIFT)
> >  #define PULL_ENABLE		(0 << PULLUDEN_SHIFT)
> > @@ -38,6 +44,19 @@
> >  #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
> >  #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
> >  
> > +#define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
> > +#define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
> > +#define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
> > +#define PIN_DS_IO_OVERRIDE_ENABLE	(1 << DS_IO_OVERRIDE_EN_SHIFT)
> > +#define PIN_DS_OUT_ENABLE		(0 << DS_OUT_DIS_SHIFT)
> > +#define PIN_DS_OUT_DISABLE		(1 << DS_OUT_DIS_SHIFT)
> > +#define PIN_DS_OUT_VALUE_ZERO		(0 << DS_OUT_VAL_SHIFT)
> > +#define PIN_DS_OUT_VALUE_ONE		(1 << DS_OUT_VAL_SHIFT)
> > +#define PIN_DS_PULLUD_ENABLE		(0 << DS_PULLUD_EN_SHIFT)
> > +#define PIN_DS_PULLUD_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
> > +#define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
> > +#define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)
> 
> Are you going to go add the 0 defines to all the existing cases? If you 
> do, it's a lot of pointless churn. If you don't, then it is inconsistent 
> when they do get used. I would drop them all.

The "0 defines" are present for the existing cases as well, namely:
PULL_ENABLE, PULL_DOWN and INPUT_DISABLE are all "0 defines".

Other existing macros are defined in terms of the above, due to which it
might have appeared to be the case that only some of the "0 defines" are
present. For example, the following macros make use of the "0 defines":
PIN_OUTPUT, PIN_OUTPUT_PULLUP, PIN_OUTPUT_PULLDOWN and PIN_INPUT_PULLDOWN

So the current patch is consistent with the existing convention followed
in the k3-pinctrl.h file. Please let me know if I should still drop the
"0 defines" in this patch.

Regards,
Siddharth.

