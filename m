Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E25CCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgCFdCCWYH6zzrjaRzkFqvyYkR8RkN4EztSbFJXUycw=; b=Koh4BOauH5FL1wqUtGiRdF8Wmk
	SQCs9PK3qMLl3L3yqf2Iw53/pu0cARxTfAEtkwToyohYgtJ1bqqyjA+A+tpaz00j1lSIReoTqgUf8
	fWMn7gwN4KVisrGqaCdg2s8l6iWKjnb/5c2/OkxMf5gyZ9CSckkv26uybNPdjqYv4KG/OJ/Ik+pvq
	uJoFecNkZ7dMIFrRAPRZ9E45EfGEbktueVdKUMyD/JGpPypMdshV34IzANJVfdemreDeEfJ8KgrNT
	keGGOdbMzKVP7a/mgVzAslOO3LvNpXvYolYIq2TeN8xvzXS0q9HVS3MqWH5iJWPOAMORhNDNojNB0
	ggD3Ou2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZ21-00000000Qec-1uLU;
	Wed, 06 May 2026 09:59:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZ20-00000000Qe0-1VZ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8F8960180;
	Wed,  6 May 2026 09:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB80C2BCB8;
	Wed,  6 May 2026 09:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061543;
	bh=sge0Aq4orDl1UUhYfuWpyGkDYKF/J+FuAik5kVD3tJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SiaNJ+8SKoxpxU1+QfXofbZfQTU/LjV5CQxA+MAk4yI5RxtFOutp9OCk/+e+nM/3A
	 2d3r5fHk3fkMdey4aup3VaFW7XJwImcRKbCtTbkdrlp5rQgWNLkLmegzEFnqofUX+c
	 qRH/b6xmbFV3KB5EZynGQjacqBFYBjRwT81eGpliA80taMZVr9ZH14VEBQ6eV9rA9f
	 TkvnlJL9+LysvDRRZzOKMmXSft0llZZZ12e3hzd0ySHsULeTwYylRCf1Rbwsu0ZvxP
	 OciVtzlVBlkmTD/1P2x5pB/cA7yignXtv9i6wf8+ZF5IOYmqQCZwjO0vAfLolFLms2
	 7pGD6p4mCZv0w==
Date: Wed, 6 May 2026 10:58:57 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	jarkko@kernel.org, zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 2/3] firmware: arm_ffa: initialise ff-a after
 finalising pKVM initialisation
Message-ID: <20260506-flawless-rousing-quoll-3acab5@sudeepholla>
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
 <20260505095409.1948371-3-yeoreum.yun@arm.com>
 <20260505-super-gecko-of-argument-655030@sudeepholla>
 <afoHizU8NgFWzvYW@e129823.arm.com>
 <20260505-adaptable-mussel-of-virtuosity-2751db@sudeepholla>
 <afohuFhVBIyUFEMT@e129823.arm.com>
 <20260506-warm-deer-of-energy-522bfa@sudeepholla>
 <afrygFx4OoCbbr+a@e129823.arm.com>
 <20260506-colossal-bee-of-discussion-08ac76@sudeepholla>
 <afsCs56KfpoMhPH9@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afsCs56KfpoMhPH9@e129823.arm.com>
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

On Wed, May 06, 2026 at 09:58:27AM +0100, Yeoreum Yun wrote:
> > On Wed, May 06, 2026 at 08:49:20AM +0100, Yeoreum Yun wrote:
> > > Hi,
> > > 
> > > I mean like DT node, it seems to add some "FF-A" device for this.
> > > Anyway, right now as your suggestion, let me respin with platform device
> > > again.
> > > 
> > 
> > Please check my branch ffa_plat_dev [1] as I noted in the last email.
> > 
> > -- 
> > Regards,
> > Sudeep
> > 
> > [1] https://git.kernel.org/sudeep.holla/l/ffa_plat_dev
> 
> Sorry, I've seen this email after I sent former mail.
> 
> And since platform_driver_probe() prevents deferred probe.
> I think it need to change jsut platform_driver_register()
> for ffa_driver.
> 

Thanks for pointing that out. Forgot about that as I was focussing on keeping
it as simple as possible. I have updated the branch now.

-- 
Regards,
Sudeep

