Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05F6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SlMSJwVD;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JyiOShVY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YV+w23NqXtPUxzbWxdPwKnpLJ73OpZwUZwdP8XjSzow=; b=SlMSJwVDS5UQilyxvVo0I5ffY0
	Qdo10m7ht9pScXd6QGaVs92f5mt1u+GQqaWuU6AEZ8CvnglCdQOpUbDmWSY/NzzGUJqfa0Oz77rh7
	R/SCM3Hz4uq41iBvhvUDVi1aY3s2Y8LV1e0HJnjNNtXnGMkXIrExcyEl7NYSlR0qZaCwhrQFwFdZN
	pl40DMwURKTO0yCADVyDQ0MyphQM74WBSjVIIXEas2plD0LPXSfab7LPNq8Smo8vh9j7673WwLrAM
	z0Kn9BJ0g9HbT0FA/4fvivKcGoDItnG9rtHSi/v9SZqgIDGdfbg2EAKQaCeoaMY1snaAWjkRO4Ef4
	BthUcVGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSEZ-00000009eHX-0bHy;
	Thu, 29 Oct 2026 15:40:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSEV-00000009eGi-1IIV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 15:40:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A780415A1;
	Thu, 29 Oct 2026 08:39:56 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86DD63F59E;
	Thu, 29 Oct 2026 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793288399; bh=u95ndNvigggwQi3q2TAN5S5kuUVT6f7RZYvAm5JASi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JyiOShVYAILhlWnkyYvD5iT4yzYZcgaleDs6rVnTCL0XV8eoq/EKzTkeMFkk7EzLe
	 VDykIKew6nPCqrzrFvebMQdYIjYQZgZuGgF3tMkvvHKjp3YaNK/kKA1mymjZ5ZhFkx
	 JMMcU8qmj+OR4wZPwHCR5UjOH1U+kf/+SH63Tnts=
Date: Thu, 29 Oct 2026 15:39:42 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	James Clark <james.clark@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Thomas Huth <thuth@redhat.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: Re: [PATCH v2 4/4] KVM: arm64: Convert TCR_EL2 to config-driven
 sanitisation
Message-ID: <dhd5aaoxaeb43ili6bcr324gs5n7ziasssz4ttx6iprdso73at@jcwxs47m5wd6>
References: <20260917214215.74135-1-weilin.chang@arm.com>
 <20260917214215.74135-5-weilin.chang@arm.com>
 <auM-TnZ0i_1G01ad@e143914.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auM-TnZ0i_1G01ad@e143914.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_084003_592871_7EF8EBFD 
X-CRM114-Status: GOOD (  18.91  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 12:38:38PM +0000, Joey Gouly wrote:
> On Thu, Sep 17, 2026 at 10:42:14PM +0100, Wei-Lin Chang wrote:
> > Feature dependencies of the fields in TCR_EL2 are extracted from
> > Registers.json of the BSD licenced AARCHMRS
> > (AARCHMRS_OPENSOURCE_A_profile_FAT-2026-06).
> > 
> > Places where we slightly deviate from the above:
> > 
> >  - Stick to the ARM ARM M.c requirement for TCR_EL2.TCMA*, which only
> >    depends on FEAT_MTE2. This avoids updating ID_AA64PFR2_EL1 with new
> >    VMTE* definitions that we don't know the meaning of, as they aren't
> >    present in the ARM ARM yet.
> > 
> >  - Ignore TCR_EL2.DS's requirement of needing the effective value of
> >    TCR2_EL2.D128 be 0. This requires runtime detection of TCR2_EL2.D128
> >    and we don't have D128 support yet.
> > 
> >  - TCR_EL2.AS is dependent on FEAT_ASID16, this information is missing
> >    from the json.
> 
> In the 2026-9 release, FEAT_ASID16 is now there for TCR_EL2.AS.
> Otherwise I think this matches the newer release.
> 
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks for the review!

I'm planning to update this series to the 2026-9 release and repost.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Joey

[...]

