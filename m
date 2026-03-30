Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CB51061B08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itki3S53hN5ghJ+TbLPQdNLhKu/I8y2gwGAHgQqiXFA=; b=34nsc+1aX7F0BXZwGmxjn2hUK0
	wZeuTCTa5Klud/6h9gle/nurt0gtXRunA97tUH4A95mla4nGLN2ITmgxB0YlW2Y1YDq8AW+6Ynqxl
	thGUPSZz6Moz1LWen+knKBw3nzzqpn+RkDob3vVS+hfxAfYZfalxKmKajco6oW3gmkJ998pQ7FNhR
	9E2l+AM2IfRJMvps49+tF8Eb0vPMBsBI6Wud+lLDVDwuwl+CcAYtGwidrdU2WBXtF/F2H85J0Awy0
	A3KPQhha/0CZVYhzQ2kF7QoylRO2VSp36M47kM7zItg/Cha1WlKYmsxv5omo7otx1n+EzryYJsSjC
	FqNoRKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jw2-0000000BtWN-1TYb;
	Mon, 30 Mar 2026 21:14:10 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jvy-0000000BtW1-3OkL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:14:08 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c76b0cda2aeso34506a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774905245; x=1775510045; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=itki3S53hN5ghJ+TbLPQdNLhKu/I8y2gwGAHgQqiXFA=;
        b=zIwvnWr7iqy5X2U4n/SMEbbVdAof6YVgVFOWRKAeSBidGr2HGn/wQUPf+Z5UKthI95
         +zNN/6H2riktiaf3h8JfWqB7Zjuu2znadPvbNv0X6/NjQXnnUJ1cMzAjGYZx5+96AMsq
         YHxBf6Q87kFKOZeYWDfFUk44xbu0JrtOkLGC5WI8uTrDuGafsPZqRfkhO0LaYu8myqQ4
         rfqW25f7FiGW34H1xG4m0Wzjms50er1dcC2FONPiFRJNHFAhWCrL6x3HsppTX+D18KwN
         LP6cJL2OO17aKcSwDNqwTwRrudUIJXDoBbKJERLWp+gdAEB8hOWwSeGe+wErvjiSeQqx
         u3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905245; x=1775510045;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itki3S53hN5ghJ+TbLPQdNLhKu/I8y2gwGAHgQqiXFA=;
        b=ig+tefmSJB9ZaJYz/dNCV97xJpbh7ZcurmjBME6B7jX+3lfCkN1iHBofptnUSMujKM
         8BZEPkvSxxOki27DdfUrUmb9ytOz1pInNaCkLfoiRt29FrWGqiXQnRQB5tngiQ4mSxBz
         6rSZWspb0UVDciWgAMmCaFo2i7RlaGY2xOuWz5BhDvrcaW0s8iQN51hdfV/e/aBFMw4V
         Ib/pvAuc+hcylOxpsPaL2zZ1tx1FKprR/cK98ZAvF0qe83l/XlVrdP5bU5vSC5Ok4+6e
         jWxuCsJdby/5Br3WMlQfo+ZqUI+cCu3PEdG7pIteOG3xgJji2dbT8LnUAXrfYuSxybXJ
         a1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXRv68zCERho0O1c3PS91MaWCzwqQgnUzONmEDnLcUfe8Qb/+JnUmW2aXMv05g9qSrkfWestmWANlBWNcJeqevs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5N4U4PeHmwBWiIgPlUdI0KoA6yCcO75tXDnh9CdCFSrBO3PgG
	OEzkW9QEeUSYDevziBM/+EWRAdNaSIDpeg5dQPx6mjA1BlvtBZREbBkBkv+RKtHH76g=
X-Gm-Gg: ATEYQzxWJn5pvyrzTHb22rviDNqXV4i1geuODErfl6iaguOHxwboK6Ff7bsf+zo1ixM
	7RZvT5gTl7dypzBMguzgkdaQPMQ0sY9nmgWI08xRiLAitoiKFUxZaMBi8vHyMkCgL+cTeBL4TEH
	VBF6yZJ1l/UjmKOBCq76p1TFEgWE72f7Zbzmz9g5+VcLfivwgTUqPqWPBrjM05ssluCzz1N0jEw
	cW1YrNy9zjJbtBiZRb5LFNWA0iFkETjI1ggl4h3ZXtpeKA25870/R31zHKDyCtYouPWYX+PwD6H
	WdBgnWzgNKapSHeEBa8srv+qw3hKYHes+rChNaB/Bjximbh5qaze1LiQE6XN/cgtc2uaHXlsU+W
	BRqrszRN/W0llFJaKUGQnwFkLsfSiLnG/cAEfcPzkBQvjMuiUpK9m+KFJY2r8QmrsKE2RAC7dvS
	+MCM5dJukXs9ckB5q82D8=
X-Received: by 2002:a17:902:d541:b0:2ae:c981:2a29 with SMTP id d9443c01a7336-2b0cdbf7bddmr141880015ad.2.1774905245314;
        Mon, 30 Mar 2026 14:14:05 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242676e13sm93479195ad.28.2026.03.30.14.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:14:04 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Bajjuri Praneeth <praneeth@ti.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Louis
 Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: ti: Enable overlays for am335x
 BeagleBoard devicetrees
In-Reply-To: <20260324103934.7d259008@kmaincent-XPS-13-7390>
References: <20260216-feature_bbge-v2-1-22805cfdbf62@bootlin.com>
 <177275924369.1445909.1029086854461649971.b4-ty@baylibre.com>
 <20260324103934.7d259008@kmaincent-XPS-13-7390>
Date: Mon, 30 Mar 2026 14:14:04 -0700
Message-ID: <7h341hvx43.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_141406_985300_4D7684CC 
X-CRM114-Status: GOOD (  16.79  )
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

Kory Maincent <kory.maincent@bootlin.com> writes:

> Hello Kevin,
>
> On Thu, 05 Mar 2026 17:07:23 -0800
> Kevin Hilman <khilman@baylibre.com> wrote:
>
>> On Mon, 16 Feb 2026 17:55:52 +0100, Kory Maincent (TI) wrote:
>> > Allow overlays to be applied to am335x BeagleBoard boards. This adds
>> > around ~40% to the total size of the DTB files on average.
>> > 
>> >   
>> 
>> Applied, thanks!
>> 
>> [1/3] ARM: dts: ti: Enable overlays for am335x BeagleBoard devicetrees
>>       commit: 18161bb01ede109fed41c66efa2624a4c27377f7
>> 
>> Best regards,
>
> Thanks for merging it.
> I see that you have merged patch 1 and 2 in your for-next branch.
> Is there a reason to not merge the patch 3? Are you waiting for a dts
> maintainer ack?
>
> Maybe I can resend only the 3rd patch to ping the dts maintainers.

Not necessary.  I'm not sure how/why I missed patch 3.  It's now queued
in my tree.

Thanks for letting me know,

Kevin

