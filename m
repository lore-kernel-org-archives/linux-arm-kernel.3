Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BA6E6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICmam0m9XXB2moqNxOPa2+pC0cmBSXKD1nCIxD4Mx1U=; b=uUI090dBnIA8Ehn4bNWhjEq+nv
	M8Agui1c+pm+5f9sP2weYmTg//dJkGgVNWzFtxIabZut6wN0TahtHDuLveJ02wfE3rB/pJZN7f28a
	0eBTmLp/bUUI6mvVcxEMHbd8AHPpnkGhOWWgMZCDcug5F+56kWUuZ11ui7C2ypMa7JVJuvVACw8Jd
	r7aDWpVNRAxUkRCSCCn5AnhI25c3PbqhG+cFMHEh/9ygA1l+Ip0+RM4Fw92qatOKQn2XpT4QfyeMh
	m6bm15PkJBB+TCqWKtRWpIZyN5eIHJPRpgFWorWA4cf8AtixqfUmU00gmekdE66vbkRsQzJ90kKlo
	60tsQBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3Iz-0000000FbeN-0WOu;
	Tue, 23 Dec 2025 14:24:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3Iw-0000000FbdU-0ure;
	Tue, 23 Dec 2025 14:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93A0640806;
	Tue, 23 Dec 2025 14:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67551C113D0;
	Tue, 23 Dec 2025 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766499841;
	bh=LVIPzMudx/3KFt0kpQO0KjKHpoGH1y/OUS9xlATtlVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T2BqBSVEvD8+egd2DKh0M7CRaA07nAPvAIGKjOh7dXuv92V35/4lUGDfIix3vJJOH
	 czLv1diFXWHMpuNqZOAhFZChYdIuHY+tDBVVzzZgV5ZlNznGxvTOBj6gQ1HZL+1RRn
	 ciFQUYyqf9ZKutUfnwb+tzowRzQc7rx3Dnlf3nyXGwKLfaDfs8gstN7zHth8wwAEiH
	 gMsEdVuEdYYz49ksnN/blIurAI7UHMrJ/fUJlv9jQWJ0mwlo0EGyuRVKwHnBJsV5vW
	 0TnFS3XwiqLf4367PRa9pYG5wOO3w6CGtBH57P6Vvf4JrokPtbdx3aetWFutDVt6nM
	 w0H5zVnptbNpA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vY3Is-0000000036w-41rb;
	Tue, 23 Dec 2025 15:23:59 +0100
Date: Tue, 23 Dec 2025 15:23:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aUql_tZisfH8E1bq@hovoldconsulting.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_062402_293065_CF7F40D5 
X-CRM114-Status: GOOD (  20.30  )
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

On Tue, Dec 23, 2025 at 11:02:22AM +0100, Bartosz Golaszewski wrote:
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

No, this is not the way to do it. You start with designing and showing
what the end result will look like *before* you start rewriting world
like you are doing here.

We should not be making driver code less readable just to address some
really niche corner cases like hot pluggable i2c controllers.

But in any case, don't get ahead of things by posting changes that we
most likely don't want in the end anyway.

> This series addresses the usage of adap->dev in device printk() helpers
> (dev_err() et al). It introduces a set of i2c-specific helpers and
> starts using them across bus drivers. For now just 12 patches but I'll
> keep on doing it if these get accepted. Once these get upstream for
> v6.20/7.0, we'll be able to also start converting i2c drivers outside of
> drivers/i2c/.

Same comment applies to the other two series you posted today.

Johan

