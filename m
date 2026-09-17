Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C34BC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eru9y9o+7vLe6dnxOH8yqEDmHQEgZ9pEQ1CmtX6bNJY=; b=Ubsrgen3zD5qIufwkUSHDQP+2m
	nW9lGAk6RrL2I66DTxil2S1bYVXZhd50NpmR9nAEMmabSJZTSjPeyr44JePlBAswyCi8U2PiIH0qC
	a0AJLIVrtVevjst/6O6U/jzsSAtcbsc0n1WAEv3qTcItWwtD5o7rOiyCgpi7YvfHk0YyvrmNkyZMI
	fX9WVqF9qOsLbgI89Pv6JkNIH6bsyXaZxDqu3IkMP0fuj56GyR7rxjvAn9SD8chylVoTT2Wkp7pWh
	dSnvQCPkG9dIDPtmqqMv0WWSQtFsi8FhauZahG+rz3Ol9hdVJiSkB5rHV/5d1pEO+rIQe+pBl2Fdx
	7ppP/DbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Jvt-0000000CaZn-14Fv;
	Thu, 17 Sep 2026 21:46:17 +0000
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Jvq-0000000CaZ0-1KIX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789681579; x=1821217579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G6VEcTe0RdoY9YKFGLw9AYrd5zP6uMtJfwKDShjkvKg=;
  b=oV6zDCAypMOzIoB+QhPY4QhbCfSKemYwW1PP4YkFrPCg6kGODezB7Sph
   en7CTUUNBAmcl1Yui80OuYgQ/NxYopu+GoOb2eniSSeAtsqOWp1k6Hft/
   +hlZWtODitwWbmwfBWSqXQIXThXuyO17XI1cY2O4f9hGg013oGtzpkRCL
   zsKa9k3dqB6yhPx4Tu0fxN8HtiWZFAgDRS1aTDJMOwF98oN193nTSc0TG
   /adC0VaQFm9BzbMTUkrOhiCXUhCD8obZKgcSGdZg58V6tgzOUQ9tvvEW1
   bODLHJ+89FTefK86SlQq3k+5odDi9Ghc/qz/AG1P52Lc03gmOYXMbQ6ip
   w==;
X-CSE-ConnectionGUID: tYw0Hwj5ToajZf2uFMs6ZQ==
X-CSE-MsgGUID: 1Z7NsSDXSOuz+4e0pDlWgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="255341900"
X-IronPort-AV: E=Sophos;i="6.27,103,1786978800"; 
   d="scan'208";a="255341900"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:46:12 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1259A4DEE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:46:12 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B2EA6C012B3
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:46:11 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 9AB4618002F1;
	Thu, 17 Sep 2026 21:46:05 +0000 (UTC)
Date: Fri, 18 Sep 2026 06:46:02 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Wei-Lin Chang <weilin.chang@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v6 0/7] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <aqxfmvvHlCwemeNp@sm-arm-grace07>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
 <aqm9hXB6X9IQ8wHz@sm-arm-grace07>
 <m6ldbr7hdafmoycx7xjcbsg62mblcakcu52ndowwzqgxdjb3q3@huv4i5bfxtza>
 <aqnUWp_VJXUCcJnQ@sm-arm-grace07>
 <86ld9165cr.wl-maz@kernel.org>
 <aquN5ytDxt44uORD@sm-arm-grace07>
 <867bkk5n07.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867bkk5n07.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_144614_867388_416F2834 
X-CRM114-Status: GOOD (  11.14  )
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

On Thu, Sep 17, 2026 at 08:56:56AM +0100, Marc Zyngier wrote:

> What have you tested exactly? If you're not able to boot a working L1
> guest as a NV2 hypervisor, you're probably doing something wrong.

Can you just stop being dismissive, if you can?

Thanks,
Itaru.

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

