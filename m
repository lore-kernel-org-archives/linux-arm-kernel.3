Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523B5FD7F91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0g4LFeOMQNabDbEN1SEpgHn4gL32KVE/yFttvbA2u7Q=; b=m1Zs2Uz9bWUd1Lq3fmr59AghST
	g2VL9zlMijWSAOsp6lqK5aOadA/EQcsLOlLudEJr5TxzBTkEPFGxug9KPsWtTqZ4S+8h9uAEtefmx
	mHSQW7Howp3w5XBqSS7yJNl6L8BTsNpIRP8UhUINi30x8hIMK6aPh9hRqK1Hd6CJg+GZerHHSU7BT
	Sns9fO3ATiAPX7y6MYW93aLJ+ShExy0bY9g+I1Jq6X1w1bUqi2HQwxk91iMncl3wV8RCSQltoTPC6
	PeC8Hh0LiA+NBkUr8lJQVoJ6wIf5XATu3m2knjFv+Q9EgzmC4ZIxojfJMY+A82NiDXkFn5M2G8Pig
	5FDt+8WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvri-00000008HKb-415x;
	Fri, 27 Feb 2026 11:18:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvrg-00000008HKF-0veV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 11:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772191115; x=1803727115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Q9ZXUDFipE8x52hW22LWJAvtNBHxdCp6GqAciobODLs=;
  b=X0K/SavOVH5VW3KC/u6Sgv2xUstDKKk07eBIvoudiZH7X3k0RolCc+IV
   PsG2oGC31zCB5899gQjfKdUHAd2L61yT8XrJJuDYZTwjX+verPWqKgAqv
   pld3y9dJ83IMKx31eVEguP7BLDk7CzeYnWBe7y/qFPj6alNT7D6Ps0DGF
   B1iSTe+wF6zJgL1/49jYMdiL67xZcYtmApfy16K9zqKJyhFgL9wuukYEk
   c01TQfUwFEGdUfBYBcLowJ36W+ZwtGr1rwDFk8skoIL2Kr2XRvBFt6aZ6
   FbwWOfZLXXrIyiI7ohXo4wmxwhuwpadmxuRadcOpHjejF+e1UdAqyXoiJ
   A==;
X-CSE-ConnectionGUID: FI/nyN4FSjm9Av5WSGCRkg==
X-CSE-MsgGUID: Yr/hDMIqSn2wugENkqifRA==
X-IronPort-AV: E=Sophos;i="6.21,314,1763449200"; 
   d="scan'208";a="221247481"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 04:18:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 27 Feb 2026 04:17:51 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 27 Feb 2026 04:17:49 -0700
Date: Fri, 27 Feb 2026 12:17:48 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Bartosz
 Golaszewski" <brgl@kernel.org>, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robert.marko@sartura.hr>, <Steen.Hegelund@microchip.com>
Subject: Re: [PATCH] arm64: Kconfig: provide a top-level switch for Microchip
 platforms
Message-ID: <20260227111748.ddqdf4avpvfzu4cm@DEN-DL-M70577>
References: <20260226143615.65788-1-bartosz.golaszewski@oss.qualcomm.com>
 <84da053d-97d5-4d07-8e76-b162a5b23d2a@kernel.org>
 <CAMRc=MehMLoBL573cWjQNN2eCiTCyqCv1xwVKqfkZ5isBhBUaA@mail.gmail.com>
 <10bb25d3-2f46-4b62-affb-31257d51e24f@app.fastmail.com>
 <CAMRc=MfupCCr8J+qnJACVeri4nZZCnULWaRgSvi4LWs4J3-5vw@mail.gmail.com>
 <9132501f-76e9-46c0-839d-bde7246c3883@kernel.org>
 <244fdbad-0d9f-42bc-a005-5f5ef34d067d@app.fastmail.com>
 <20260227-wolverine-slogan-7af0661f6e44@spud>
 <c9df99ef-9bd6-43a0-9f22-721bd6bfc90c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9df99ef-9bd6-43a0-9f22-721bd6bfc90c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_031836_530469_0D350C3B 
X-CRM114-Status: GOOD (  22.34  )
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

> On 27/02/2026 11:15, Conor Dooley wrote:
> > On Fri, Feb 27, 2026 at 10:28:53AM +0100, Arnd Bergmann wrote:
> >> On Fri, Feb 27, 2026, at 10:21, Krzysztof Kozlowski wrote:
> >>> On 27/02/2026 09:51, Bartosz Golaszewski wrote:
> >>>> On Fri, Feb 27, 2026 at 9:49 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >>> I don't think this is fixable, that's why I wrote that I accept the
> >>> negative impact because I like the cleanup more.
> >>
> >> Agreed. I remember when we split up the ethernet drivers into per-vendor
> >> subdirectories and had to add 'default y' to each one in 88f07484ccdf
> >> ("drivers/net/ethernet/*: Enabled vendor Kconfig options"). Changing the
> >> default to 'n' would be a regression now as much as it was then, so it's
> >> not something we can expect to do more easily in the future.
> >>
> >> If the Microchip maintainers think the change will cause too much
> >> extra work, we can leave the current version forever, otherwise lets
> >> apply it for 7.1.
> >
> > Here's the previous discussion when this was added not too long ago:
> > https://lore.kernel.org/all/20250811122053.4bfyoefln7wpz2a4@DEN-DL-M70577/
> >
> > Daniel is probably the one that "needs" to answer this, I think the
> > lan969x is added recently enough for this to not be particularly
> > disruptive.
> 
> I don't get arguments there. The policy is one ARCH per vendor, so why
> exactly upstream would like to "having more granular control with
> separate"? That's downstream or vendor wishlist, not upstream.
> 
> 
> Best regards,
> Krzysztof

The out-of-tree defconfig impact is minimal for us. As Conor mentioned, lan969x
was added fairly recently, so the number of affected users should be small.

/Daniel

