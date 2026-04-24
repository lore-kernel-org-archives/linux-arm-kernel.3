Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ACAFB44A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 05:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mq7kvweBVwKu99p8xpmRLJVZ17neeuneObD0eiz9l0A=; b=O0/OGHesuhHSLkOuh+hOggLBxi
	02mM8iuRbTB6jp79QlWaqR5P/IAPYcRUwybWGzrmG4oHEtUy7etViwQxmtkzmYphr1DpZ5YQxIjx2
	1kqlIydHVs2DcgccQYxBwBHcmNybnSWXbBjpSmLGkiWC1SkVu0ZIZ+nsDdvo3qlmWukhL0hds8ZOO
	FsBhiqvVyJT/ZU9/aUWxrESPlGOswO4tuhDwGc0GOLdgt6Ik/kpupzPvLOw1UjJunKSTeTNLwvxWW
	0vSB0+j3RTsUalo1zUhfudFDGUGI/sK5uBgcYRyUCZKkfaEOSl7t32PfqD8xuRmhNuCir2iVQ5M5o
	n77uBxFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG9Xy-0000000Cgfq-0duo;
	Fri, 24 Apr 2026 05:57:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG9Xv-0000000Cgec-2qnC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 05:57:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D25411BC0;
	Thu, 23 Apr 2026 22:57:39 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1F173F23F;
	Thu, 23 Apr 2026 22:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777010265; bh=dTNza0KEYrjBEa6YZ5hzfCt/Ar2RAGWr/4ZMUagfrm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oe+6nX2Bl77VP10ARS83jN4HK85wFcLCFAXYd40mLXLBqZV1OIDDgfS6b4AgRW/ak
	 NOdIClJEzKWOV1JwA4VBULgTUCmX1/R+SQ8NsifWR2plQ4uq32gw42eErrQl74oPqa
	 2DoOsoRSS8V5lkMdL0CiZGa6C23BZC52Dc5zDwww=
Date: Fri, 24 Apr 2026 06:57:39 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, roberto.sassu@huawei.com,
	Jonathan McDowell <noodles@earth.li>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	jmorris@namei.org, serge@hallyn.com, dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com
Subject: Re: [RFC PATCH v2 1/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
Message-ID: <aesGU8a3mbVzvteH@e129823.arm.com>
References: <aeoAlVEwzRUPrlVe@e129823.arm.com>
 <aeoRxWPyOHGJd+Jh@e129823.arm.com>
 <aeoWO2Cwo04YYu2l@earth.li>
 <bd908e28298d968740d03c97bc7e441de188b7b4.camel@linux.ibm.com>
 <aeokwrC86WI7uT+K@e129823.arm.com>
 <aeomlp3I0eVE5mce@earth.li>
 <aeotq8nPVu4wvEx5@e129823.arm.com>
 <e4e242ae5533d5762a3647186a178764881bf9ff.camel@linux.ibm.com>
 <aephL3MzYoqFGaT5@e129823.arm.com>
 <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_225747_909426_37C2F509 
X-CRM114-Status: GOOD (  15.41  )
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

Hi Paul,

> On Thu, Apr 23, 2026 at 2:13 PM Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> >
> > Sounds good. Once the patch is posted, I’ll review it as well.
> > Sorry again for the noise, and thanks for your patience ;)
>
> My apologies for not getting a chance to look at this patchset sooner.
>
> This seems like an obvious, perhaps even stupid, question, but I have
> to ask: if IMA can be properly initialized via late_initcall_sync(),
> why not simply do the initialization in late_initcall_sync() and drop
> the late_initcall() initialization?
>
> Does any IMA functionality suffer if initialization waits until
> late_initcall_sync()?  If so, it seems non-critical if waiting until
> _sync() is acceptable, as it appears in these patches/comments.

This is the way first patch did, and here is some discussion for this
(Might you have seen, but in case of you missed):
  - https://lore.kernel.org/all/a6a0e15286c983d720de227c6827adbe976c5b9b.camel@linux.ibm.com/

Thanks.

--
Sincerely,
Yeoreum Yun

