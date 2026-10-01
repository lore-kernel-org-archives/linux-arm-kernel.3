Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20629CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qq+6EUhmiZleFP8JaAHh/mFkJt4aJ2uekt5AzQtFZ/Q=; b=f8m5Zi2+av9hocSUr28aPRTffO
	rEzpYAAK3D4jK8QB1iI9zSIdFYxullbBjADbMhj+k31O1Ay4TQGGMPJi4antGfMHvugGAlCSQMVhK
	gW7OlYFzjD0eVjOTtsPuX0feMIWQxtTyuBC/Boxh4I28nHQ3bln5xyznOALy/m1cL1BTKXj0y0BPQ
	bJS6uEjGdiw21kyxYZq+ZAE5pwg80W4N1g5odtPuzXhrN+YkpjmWPzaiYWXXY3yZen2GQkGHopeSi
	A0F50Fxlu6JudfKdMDADNRF9obH1/zySGf/L7H7nqApSRCK+6jaLFVw1BwJjaogtpFIkfImvFMZAU
	yVF0TNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJog-00000009k7q-1C8P;
	Thu, 01 Oct 2026 16:39:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJoe-00000009k6Q-0sNV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:39:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE5E9497;
	Thu,  1 Oct 2026 09:39:22 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2E613F85F;
	Thu,  1 Oct 2026 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790872766; bh=q4SvOgTXIsNqlpMUOj2ef8MMWb7VA7YCONSmXTiArQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thPgHjGq4KLCxFCMOxTNwhO46NGyh+WVwgUMuprlxt+Nen4cbvbV1B/AetnyZ63cI
	 qjGPOelzghxSe5sU3NpQYJCnPiPTWokp39L+895qwgszRoFOfxxUCOOwc2wmQus0+8
	 blikHLD31ZKL4WOfKOE2CFaiphHnqEPP7yfAwj2U=
Date: Thu, 1 Oct 2026 17:39:20 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, gongruiqi1@huawei.com
Subject: Re: [PATCH RFC 0/3] security: ima: support TSM measurement registers
Message-ID: <ar6MuKSDQc9J8o-6@e129823.arm.com>
References: <20260930-ima_tgx_integration_v2-v1-0-722c35370548@arm.com>
 <ebe68f6463f8ece8a5cd8ce70bba292ec4f64a41.camel@huaweicloud.com>
 <c4fe5315d70fc162f1e5648e3fccb1676710d5e6.camel@huaweicloud.com>
 <20261001151801.GC3019323@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001151801.GC3019323@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_093928_325104_E1C8A7FF 
X-CRM114-Status: GOOD (  24.55  )
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

Hi Jason,

> On Thu, Oct 01, 2026 at 01:45:26PM +0200, Roberto Sassu wrote:
> > On Thu, 2026-10-01 at 13:27 +0200, Roberto Sassu wrote:
> > > On Wed, 2026-09-30 at 14:43 +0100, Yeoreum Yun wrote:
> > > > Confidential computing guests without a TPM can use TSM measurement
> > > > registers to record IMA measurement digests instead of TPM PCRs.
> > 
> > + Gong Ruiqi, of course.
> 
> We are working very seriously on this same problem too.
> 
> For some time we did investigate extending tsm_mr to do more things,
> have a better uAPI, but that eventually evolved into the realization
> that tsm_mr is simply too narrowly focused. It looks like James got to
> this idea before we did. I agree with his remarks in the 2025 thread
> with Gong.
> 
> So we've started work on a new comprehensive "Attestation subsytem"
> that will pull in all forms of ROTs, TPM, CC stuff and SPDM use cases
> to give a consistent user API to work with this class of HW. In many
> ways I view this as a rename of tsm_mr (it will eventually fully
> absorb it), but the name evokes the broader goal and encourages
> everyone to come in, not just CC world.
> 
> Our overall goal would be for something like systemd to have a single
> uniform kernel API that allows it interwork with any ROT someone may
> have. A uAPI to do "Extend", "Quote", "Get Log" operations so that the
> existing TPM support in systemd can be improved to work on any ROT
> flexibly without having to hard code specific ROT behaviors into
> systemd.
> 
> I've felt the ultimate end goal would be to make all the in-kernel tpm
> users go through the proposed attestation subsystem so they can have
> ROT and "PCR profile" agility. Certainly I've heard enough people
> asking for this.
> 
> This is a broader topic than just IMA. For example DRTM also has to
> use the TPM, and other ROTs. It also brings in a global shift of how
> the system wide "PCR Profile" should work as post-DRTM has a different
> TPM locality and access to the protected DRTM-only PCRs that are
> normally blocked.
> 
> Jiri posted his current state here:
>   https://lore.kernel.org/r/arzr32ZDComnfmny@FV6GYCPJ69

Thanks to let me know. I'll take a look for this.

-- 
Sincerely,
Yeoreum Yun

