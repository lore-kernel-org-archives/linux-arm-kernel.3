Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AA7FD530C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8/5bI+d66y81V2rFiaH4FWnj6qjMkY7SACemFjjFkQ=; b=3oVABTIEOshwXBbR5xqccWuwGo
	v4oBe/X31S/3x6BkkEpbQr8B83clCDZ60PuFUFraK0qJWtooxvlaOX4ZmMkL629nuEZ8VUvuzbpBX
	g/AjzEyL1E0M97gWpKqwEFySFsbrxAP7oHraTvXp7Akz4WO+ZbPs6NxgLzTp0jkwCGTtmg9rVgIdC
	Hs6KKWCx8JvtBVerimOtN/u4kdRK0dZKJyS7yRWEzaXfSGx493c0k5wcB5rprwPjgwQUISXWlayhx
	AwwCllsjnRpZwBsR8EAzmN0fDKrWI1Aj7sKys45Q7nKCzM4L5MKikG8RyIAkex/1pSLWkS76qqcZt
	NF/LUZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtNa-000000080wU-2BQ1;
	Fri, 27 Feb 2026 08:39:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtMh-00000007zp3-376t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:38:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5509F444AB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 08:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D48C2BCB9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772181507;
	bh=B8/5bI+d66y81V2rFiaH4FWnj6qjMkY7SACemFjjFkQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=rRWuw9/TnLwpOnG2Dpa/ftMLizMNL6RcO4Fp7w9HPl1gDrgoIXsuZRVJ6muNILsPc
	 WTjb91b2F65aXORG6g28JbNgIdZUHVWHJCAYlCQB8eDyHhU2yeJG1YJp69uC4e/CwC
	 C0WF8d5iqzKBJGc7+Qab+/E74MhB/O1WKKr6mEg7uf7NIV1JZyKDDlJ2rrXEWD+ary
	 1INp5PzUpApixPN78wGg9+v+Eh6SP0OMrTYQVbJy9DjJjxQvsYdEOZ+O/rczHUzo63
	 cXpJVCvz6/uOeaet8B4gG0IwxYWqKZC01R4d9xkn15DBakmkYwAbstEp170PWksfep
	 hGiLJ/2BmEn+g==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-389e268a9b4so19938371fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 00:38:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTcJEqyB/OU2VGDbCpkINpCOYToAhUmsUJ5xDbND+F5jfCYe1/Q+3xZUkARHUYICvxTXikFF+EfaUPC+PTKWKi@lists.infradead.org
X-Gm-Message-State: AOJu0YwhP2Tg/TWiQoR/Dc64vwIqwCZA//94sPkrR4HL+e7TgfaaXiqO
	Gg41YLIU+IEA4K9UNLSEN2CxYzr9u6U6oHhK7riLuo4/9VQJ5GEjtScmUQwN704QGSWJZNuwLgb
	vED+gmt8V1DDz/N/sk3NiDdzC+B+jUHfXI9Umu7CFfA==
X-Received: by 2002:a2e:a10b:0:b0:389:ef35:fb9e with SMTP id
 38308e7fff4ca-389ff15f2f5mr11325631fa.24.1772181505403; Fri, 27 Feb 2026
 00:38:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Feb 2026 00:38:23 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Feb 2026 00:38:23 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aaCrT1SvMCIKQDmc@ninjato>
MIME-Version: 1.0
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com> <aaCrT1SvMCIKQDmc@ninjato>
Date: Fri, 27 Feb 2026 00:38:23 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfwR7TfAFXO4opu7a=v84MK9hY048woPg+-09wkGJgWFg@mail.gmail.com>
X-Gm-Features: AaiRm52Yb9kd_att7B9hKBtSpFgOcTtzo7FDwU7A01PqlXP6UIrlHqDUHcGb-x8
Message-ID: <CAMRc=MfwR7TfAFXO4opu7a=v84MK9hY048woPg+-09wkGJgWFg@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-media@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_003827_871772_E2C66348 
X-CRM114-Status: GOOD (  19.10  )
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

On Thu, 26 Feb 2026 21:21:35 +0100, Wolfram Sang
<wsa+renesas@sang-engineering.com> said:
> On Mon, Feb 23, 2026 at 09:59:29AM +0100, Bartosz Golaszewski wrote:
>> It's been another year of discussing the object life-time problems at
>> conferences. I2C is one of the offenders and its problems are more
>> complex than those of some other subsystems. It seems the revocable[1]
>> API may make its way into the kernel this year but even with it in
>> place, I2C won't be able to use it as there's currently nothing to
>> *revoke*. The struct device is embedded within the i2c_adapter struct
>> whose lifetime is tied to the provider device being bound to its driver.
>>
>> Fixing this won't be fast and easy but nothing's going to happen if we
>> don't start chipping away at it. The ultimate goal in order to be able
>> to use an SRCU-based solution (revocable or otherwise) is to convert the
>> embedded struct device in struct i2c_adapter into an __rcu pointer that
>> can be *revoked*. To that end we need to hide all dereferences of
>> adap->dev in drivers.
>>
>> This series addresses the usage of adap->dev in device printk() helpers
>> (dev_err() et al). It introduces a set of i2c-specific helpers and
>> starts using them across bus drivers. For now just 12 patches but I'll
>> keep on doing it if these get accepted. Once these get upstream for
>> v6.20/7.0, we'll be able to also start converting i2c drivers outside of
>> drivers/i2c/.
>
> I applied the series to for-current but squashed the user conversions
> into patch 1. Changes are trivial enough and I don't want the pull
> request to look excessive, so it can go in smoothly. Hope you are fine
> with it.
>

Sure, do you still want me to send these changes in separate patches for
review?

Bart

