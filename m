Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBC8CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM+m2eCUmMkGv/JWcVqrZUI1hPEFHjAma0mQL3kbae4=; b=bZmlf7fIj5uQFQEyVtsuKmkwGi
	C3mXDFoOcbrhLH8B/rLSnuzFh/VWBHTUCMA6C9XgHNn93N1u7hX2xB2zs4wvZNgLQLmy0UFVHvvcn
	hYMrz+SqTa5fkVHj7jcZpM7SkBrLZAGAOPwh3jdc2QILqRkJ8O8Td4OwA3sVZfhRiGFOEOGqkJvn9
	+Td1pR9VwrnrgkcoWfvrYu2Cw5iIlAsdQR8OD7vgMHapP3q2Xz8krrJApR8s5qTwcOKzUf2oMTzTT
	nmI712QA/dF4pHuFlYVWpnR3ont/u6BeXVGVqKo3MXAiI96zRsWKeVIRTVrY7wrfeP1BwWJfpHz7g
	kbygn/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKY5T-00000000GQP-1E7H;
	Wed, 06 May 2026 08:58:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKY5S-00000000GQ5-13SY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:58:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F2AC1A25;
	Wed,  6 May 2026 01:58:27 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2E203F836;
	Wed,  6 May 2026 01:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778057913; bh=qmBmjzeAcJ5nql9S7tzn6aZ63xzXy+8siom1eVtABjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQg9q3wMZNS1Lu5L5NkIQs4DobfTcUmY2PhRDEDniXlR58HKmmfpRpdh3Aa8RmmBn
	 fJrO031dJgDWxwpzKa7fbFC5z3tMFCLuNVdeAurF7QW3BOT+hLdvJ0Oi+8wtkoAw1J
	 7KfSmYPOZnWpMoT140ilwt+hj1udjhcYEogZrObE=
Date: Wed, 6 May 2026 09:58:27 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	jarkko@kernel.org, zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 2/3] firmware: arm_ffa: initialise ff-a after
 finalising pKVM initialisation
Message-ID: <afsCs56KfpoMhPH9@e129823.arm.com>
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
 <20260505095409.1948371-3-yeoreum.yun@arm.com>
 <20260505-super-gecko-of-argument-655030@sudeepholla>
 <afoHizU8NgFWzvYW@e129823.arm.com>
 <20260505-adaptable-mussel-of-virtuosity-2751db@sudeepholla>
 <afohuFhVBIyUFEMT@e129823.arm.com>
 <20260506-warm-deer-of-energy-522bfa@sudeepholla>
 <afrygFx4OoCbbr+a@e129823.arm.com>
 <20260506-colossal-bee-of-discussion-08ac76@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-colossal-bee-of-discussion-08ac76@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_015834_345533_8318C516 
X-CRM114-Status: GOOD (  12.77  )
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

> On Wed, May 06, 2026 at 08:49:20AM +0100, Yeoreum Yun wrote:
> > Hi,
> > 
> > I mean like DT node, it seems to add some "FF-A" device for this.
> > Anyway, right now as your suggestion, let me respin with platform device
> > again.
> > 
> 
> Please check my branch ffa_plat_dev [1] as I noted in the last email.
> 
> -- 
> Regards,
> Sudeep
> 
> [1] https://git.kernel.org/sudeep.holla/l/ffa_plat_dev

Sorry, I've seen this email after I sent former mail.

And since platform_driver_probe() prevents deferred probe.
I think it need to change jsut platform_driver_register()
for ffa_driver.

Thanks!

-- 
Sincerely,
Yeoreum Yun

