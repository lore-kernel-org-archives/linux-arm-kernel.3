Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C601F364A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 18:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpE7+x6WnT6OsjQpEgPED01LqDMlc6+faCosrOBzazI=; b=MMSCd4rE77CYLGTg7q5GQeWeKb
	W8pAF2GKZlPzm/PLWq0tgFBplF/oDl25w0iKX2OCksJ1+omv0RfYnRIeS3SA8p4Lxfj5TiQO2tOPA
	5z/IVgGKRHOCGyoJRQGH+xoOK/R83wCZRRxGp9hx/ZoAUC3xPYtOXqTG0qYVvTVFqelHTMbrst3WA
	gn11lma2iAV7g/XZy+0qYDFYqtDw7bl5aL7DkebYdxhDTz7vT29E5CTtib9+HC6MDeM0dVYxVZ4Vy
	PsqP4UlttqJJoRAod5c57KgbG2T58CagIlCUiqGe7ZI7GnvQkNAQvjs+PpM/9ILAyrfE/DVdn1pIM
	7pyTcS1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuCF-0000000B5zp-1GAc;
	Thu, 09 Apr 2026 18:33:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuCC-0000000B5zS-18BN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 18:33:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E40262008;
	Thu,  9 Apr 2026 11:33:32 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E1043FAF5;
	Thu,  9 Apr 2026 11:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775759618; bh=2Mke9B5xsH/9FIs5H7tLC+6ccGXXOxuntv3Vt8y46q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPxcErhrEGrfcTD6Otef5JEhCmD9tgWrdUbCZtE/ZbHXWQKao0p7SVr2LaWwhDwnT
	 7Ad8rEg/X0nOWekqlpbOWRk3NwrmYCbm2aXm94fmBuPxceaIbJ36ndpYcz2EfDBu+a
	 CIInQmS/s+86kndcxnpn3wZnaGnmfQcNGIlb8s0U=
Date: Thu, 9 Apr 2026 19:33:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Message-ID: <adfw_hNDsIWwSAIv@arm.com>
References: <20260330161705.3349825-2-ryan.roberts@arm.com>
 <ac7VD4Z85nS30GCp@arm.com>
 <ac-W9oNM_O5RTtaf@arm.com>
 <beacee23-c177-47a1-b8b5-743844b617a8@arm.com>
 <adTPFrlVCEt-hioX@arm.com>
 <bc4a0246-33bb-443e-a885-a31b24d4a022@arm.com>
 <adTh8d9k3y5ybemL@arm.com>
 <567dff89-9f0f-40a0-ab10-22e061b4faaf@arm.com>
 <adfDoatH8hj6zN7_@arm.com>
 <07054475-6b07-4b19-a393-cbe037adef8b@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07054475-6b07-4b19-a393-cbe037adef8b@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_113340_429955_A038FEC7 
X-CRM114-Status: GOOD (  19.15  )
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

On Thu, Apr 09, 2026 at 09:48:58AM -0700, Yang Shi wrote:
> On 4/9/26 8:20 AM, Catalin Marinas wrote:
> > On Thu, Apr 09, 2026 at 11:53:41AM +0200, Kevin Brodsky wrote:
> > > What would make more sense to me is to enable the use of BBML2-noabort
> > > unconditionally if !force_pte_mapping(). We can then have
> > > can_set_direct_map() return true if we have BBML2-noabort, and we no
> > > longer need to check it in map_mem().
> > 
> > Indeed.
> 
> I'm trying to wrap up my head for this discussion. IIUC, if none of the
> features is enabled, it means we don't need do anything because the direct
> map is not changed. For example, if vmalloc doesn't change direct map
> permission when rodata != full, there is no need to call
> set_direct_map_*_noflush(). So unconditionally checking BBML2_NOABORT will
> change the behavior unnecessarily. Did I miss something?
> 
> I think the only exception is secretmem if I don't miss something.
> Currently, secretmem is actually not supported if none of the features is
> enabled. But BBML2_NOABORT allows to lift the restriction.

Yes, it's secretmem only AFAICT. I think execmem will only change the
linear map if rodata_full anyway.

-- 
Catalin

