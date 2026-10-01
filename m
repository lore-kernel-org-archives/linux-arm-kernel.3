Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D735CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KcOYGwo3ka+oNeQbD2okrFirOHUtYboYlH+ghZugxI=; b=ifdAjX8p3N84Mr8QRmjszEiTeG
	bNRleCM63T33O/GlnJWRzn+1bpb2AnGIULMT46hyPgDRKE2XgiUb4aFGqJVltcNIVDOYTye/ENjSn
	1iorKUiDykDkYFa0VqlBDWJjtaa5MokgDIVHZ2i3zO7ubGwD/h6RO+TCt6tpif47akSx+XlaV10nU
	oq+qznA3SHLjOTasjq0llGedGZv1g+HitjeosF7p1LVQDXbqjB5fSmtRNONxtnsaShunq7cLqaa73
	/U8Jjcf4LhWpPQqROFtriSAFYOGsh9BM/P+rX1X0SgUOByZSObtbCICnPUNgjwTzAQ7rwTKjVxM5F
	7D97eB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHif-00000009MeW-0iGg;
	Thu, 01 Oct 2026 14:25:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHic-00000009MdT-3aYn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:25:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87EDD497;
	Thu,  1 Oct 2026 07:24:59 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6FAA3F85F;
	Thu,  1 Oct 2026 07:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790864702; bh=1hHoKyAPD/b2cGTc6dQTSAgCcK5RPRJLB0llMk6ht/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vXAk2mOiEzPgG8p0QPPgnsQD9c5SttjpCm6UTeqpSxuv3JpF0R9stnfs2sdooXT1+
	 +mCwykU1KCsMii36XRamLizkeQxtZpwHbBx36tBChLs0b2MUBc+3jhX+h4uZmD5BNU
	 l8S2Mq3+aGtDdpe0Qwus2ffDKEwIB9946i46aoYk=
Date: Thu, 1 Oct 2026 15:24:57 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Dan Williams <djbw@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, gongruiqi1@huawei.com
Subject: Re: [PATCH RFC 0/3] security: ima: support TSM measurement registers
Message-ID: <ar5tOUor0bp3MtQ6@e129823.arm.com>
References: <20260930-ima_tgx_integration_v2-v1-0-722c35370548@arm.com>
 <ebe68f6463f8ece8a5cd8ce70bba292ec4f64a41.camel@huaweicloud.com>
 <c4fe5315d70fc162f1e5648e3fccb1676710d5e6.camel@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4fe5315d70fc162f1e5648e3fccb1676710d5e6.camel@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072507_210296_20939922 
X-CRM114-Status: GOOD (  29.76  )
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

Hi Roberto,

> On Thu, 2026-10-01 at 13:27 +0200, Roberto Sassu wrote:
> > On Wed, 2026-09-30 at 14:43 +0100, Yeoreum Yun wrote:
> > > Confidential computing guests without a TPM can use TSM measurement
> > > registers to record IMA measurement digests instead of TPM PCRs.
> 
> + Gong Ruiqi, of course.
> 
> Roberto
> 
> > Hi Yeoreum
> > 
> > a similar patch set has been sent to the linux-integrity mailing list:
> > 
> > https://lore.kernel.org/linux-integrity/20250630125928.765285-1-gongruiqi1@huawei.com/
> > 
> > Could you please work with Gong Ruiqi to have a unified proposal?
> > 
> > Thanks
> > 
> > Roberto
> > 

Thanks for letting me know and I think the proposal is almost the same
with the different terminology only.

@Gong, what do you think?

> > > This series introduces in-kernel interfaces for accessing TSM
> > > measurement registers, abstracts IMA's measurement-register operations,
> > > and adds a TSM backend for Intel TDX and Arm CCA.
> > > 
> > > The following mappings between TPM PCR indices and TSM measurement
> > > registers are defined for Intel TDX [0] and proposed for Arm CCA [1]:
> > > 
> > >   TPM PCR index | Intel TDX register | Arm CCA register
> > >   --------------+--------------------+-----------------
> > >   0             | MRTD               | RIM
> > >   1, 7          | RTMR[0]            | REM[0]
> > >   2-6           | RTMR[1]            | REM[1]
> > >   8-15          | RTMR[2]            | REM[2]
> > > 
> > > These mappings allow IMA to translate PCR indices into the corresponding
> > > TSM measurement registers.
> > > 
> > > The TPM backend remains preferred when it is available at IMA
> > > initialization. Otherwise, IMA falls back to a supported TSM backend.
> > > Only one backend is selected; IMA measurements are not extended to both
> > > TPM PCRs and TSM measurement registers.
> > > 
> > > The attestation proccess for guest with TSM measurement register will
> > > be done with Confidential Compute Event Log (CCEL) which is exported by
> > > /sys/firmware/acpi/tables/data/CCEL. Here is brief process in arm64:
> > > 
> > >   Verifier                 Realm guest              RMM / Platform
> > >      |                         |                           |
> > >      |--- Challenge (nonce) -->|                           |
> > >      |                         |--- Request token -------->|
> > >      |                         |    with challenge         |
> > >      |                         |                           |
> > >      |                         |<-- CCA token T -----------|
> > >      |<-- CCA token T ---------|                           |
> > >      |<-- CCEL event log ------|                           |
> > >      |<-- IMA measurement log -|                           |
> > >      |                         |                           |
> > >  Verify token T:               |                           |
> > >   - signatures                 |                           |
> > >   - Platform/Realm             |                           |
> > >     token binding              |                           |
> > >   - challenge freshness        |                           |
> > >   - platform/RIM policy        |                           |
> > >   - verify measurement logs    |                           |
> > >      |                         |                           |
> > >      | ----ACCEPT / REJECT---->|                           |
> > > 
> > > This patch based on arm-cca-mr series [3].
> > > 
> > > Link: [0] https://uefi.org/specs/UEFI/2.11/38_Confidential_Computing.html#intel-trust-domain-extension
> > > Link: [1] https://github.com/tianocore/edk2/issues/11383
> > > Link: [2] https://github.com/tianocore/edk2/issues/11384
> > > Link: [3] https://lore.kernel.org/all/20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com/
> > > 
> > > ---
> > > Yeoreum Yun (3):
> > >       virt: coco: introduce tsm_default_tm() and tsm_mr_read()/write()
> > >       security: IMA: introduce ima_mr structure
> > >       security: IMA: use TSM measurement registers
> > > 
> > >  drivers/virt/coco/guest/tsm-mr.c          | 159 +++++++++++++---
> > >  include/linux/tsm-mr.h                    |  26 +++
> > >  security/integrity/ima/Makefile           |   3 +-
> > >  security/integrity/ima/ima.h              |   7 +-
> > >  security/integrity/ima/ima_api.c          |   4 +-
> > >  security/integrity/ima/ima_crypto.c       | 137 +++++---------
> > >  security/integrity/ima/ima_fs.c           |  16 +-
> > >  security/integrity/ima/ima_init.c         |   7 +-
> > >  security/integrity/ima/ima_mr.c           |  48 +++++
> > >  security/integrity/ima/ima_mr.h           |  76 ++++++++
> > >  security/integrity/ima/ima_mr_tpm.c       | 155 ++++++++++++++++
> > >  security/integrity/ima/ima_mr_tsm.c       | 290 ++++++++++++++++++++++++++++++
> > >  security/integrity/ima/ima_queue.c        |  39 ++--
> > >  security/integrity/ima/ima_template.c     |   4 +-
> > >  security/integrity/ima/ima_template_lib.c |   2 +-
> > >  15 files changed, 819 insertions(+), 154 deletions(-)
> > > ---
> > > base-commit: b561246f45174b7472c24b75358ea95bae72b7b8
> > > change-id: 20260929-ima_tgx_integration_v2-1c54aeeaeaee
> > > 
> > > Best regards,
> 

-- 
Sincerely,
Yeoreum Yun

