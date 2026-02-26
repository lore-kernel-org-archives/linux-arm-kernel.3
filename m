Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428C0FD9E0A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbfzS89JWVR35E98rC5lcOrcboNxD6VC9rm/fk4PuH4=; b=2ag33Arn7IBeW4roSMm+jBkWbs
	MQtAsEupfbcTER8FAWMzc1Xyzssv0vdSSUrarQi3oKd0EYpnOBQRb7F6Yuc6NOsLA6u1S1fWurd6P
	Nev45nv4wXbaVmKCeh2jS2VhlFRNzhMaPcklfbkQ9heG77OYotBg11MBOZhSLrbMjFkoNWkVF1W8T
	NJZPuXk5TLfHk2u0CKKgBShNzN2hajwyTqjCsyW8ss4ae5ZRdTnUfgHXaP4iYlfoizn4pgRtH1BWy
	qCDm3E9b/g0+dk2BWQ0zXjw1uTO9ideiRRdkeCkpoq8U4J/C2430AOnPTQ3er2+TjMuaGMvPE9V/F
	v+NcBMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhrq-00000007AGX-0eMX;
	Thu, 26 Feb 2026 20:21:50 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhrj-00000007AEw-2w2A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 20:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Zbfz
	S89JWVR35E98rC5lcOrcboNxD6VC9rm/fk4PuH4=; b=eeYG9FwRG0mF2I+WxzL1
	HGUVggUjRhJIyqBUgN423pjLFOP3EUNQMylCmEbSZGMmely6B7Su6xr33ZSTAz27
	SHnHjRn+9CBdL1Z5essMXvI9XzDXsz+428ZavPheXWtpy/EERqut52qTJGYgLInj
	1cPeVACjybOFSolGqBL66SBDtoill7iLu9mR53JzlthU1P2siXpr4UvDoiwBZK4P
	D+ZMgeqjfaj43lU0FiQfg2DtV2v1koFsm8uL49Ad9xjswrOn2+549Br4yoMLqJxK
	9GzPFpASEH9OL6r96XiSCy8XkQ0v/gCyT3gjRNbBaPRYGavOshN70z8O6k1xV87h
	TA==
Received: (qmail 1209289 invoked from network); 26 Feb 2026 21:21:36 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Feb 2026 21:21:36 +0100
X-UD-Smtp-Session: l3s3148p1@f2ID3r9LPOkujnuU
Date: Thu, 26 Feb 2026 21:21:35 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aaCrT1SvMCIKQDmc@ninjato>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_122144_727054_34399B8D 
X-CRM114-Status: GOOD (  21.12  )
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

On Mon, Feb 23, 2026 at 09:59:29AM +0100, Bartosz Golaszewski wrote:
> It's been another year of discussing the object life-time problems at
> conferences. I2C is one of the offenders and its problems are more
> complex than those of some other subsystems. It seems the revocable[1]
> API may make its way into the kernel this year but even with it in
> place, I2C won't be able to use it as there's currently nothing to
> *revoke*. The struct device is embedded within the i2c_adapter struct
> whose lifetime is tied to the provider device being bound to its driver.
> 
> Fixing this won't be fast and easy but nothing's going to happen if we
> don't start chipping away at it. The ultimate goal in order to be able
> to use an SRCU-based solution (revocable or otherwise) is to convert the
> embedded struct device in struct i2c_adapter into an __rcu pointer that
> can be *revoked*. To that end we need to hide all dereferences of
> adap->dev in drivers.
> 
> This series addresses the usage of adap->dev in device printk() helpers
> (dev_err() et al). It introduces a set of i2c-specific helpers and
> starts using them across bus drivers. For now just 12 patches but I'll
> keep on doing it if these get accepted. Once these get upstream for
> v6.20/7.0, we'll be able to also start converting i2c drivers outside of
> drivers/i2c/.

I applied the series to for-current but squashed the user conversions
into patch 1. Changes are trivial enough and I don't want the pull
request to look excessive, so it can go in smoothly. Hope you are fine
with it.


