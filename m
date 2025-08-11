Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BED1C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cf1E63YQegoXIdd2DBi5rbtHO9LWiPBmAG70QSxh1/o=; b=VatzDUIvFjRvOvHhmxS+CTRnqa
	w9tIhqR8o1LZUdzJYUvOmUBMxIB4eGAtrFtWl693bNbvTZrM4VUBOKzZk8BrGtzwcwBTQWPUbIZ/i
	cYv5/e3va+QWqyv3jsqeK4XVjYyEDBSRgrqLxdKeoyZ7OzYs33KbOaBTkozo8ym8tdw9WtIY6jzzR
	ZoFyWntUJcJwugFi1I+tyesSaztAGvkHxE/q1lv6smA0Wq6eSHPKDRgD53l+XWXJm2ewZEUwqOOun
	SwvBX6KPObAbvUs1kAXpZZXTP3HpLAhfozKDPLR/OV/DfEdPS3MrmEQoypaCkY50Rc/vY78+Sj2GQ
	1OdkmfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRTg-00000007cQA-3CK4;
	Mon, 11 Aug 2025 12:18:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRPi-00000007bsb-0pVm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 12:14:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DD112641;
	Mon, 11 Aug 2025 05:13:54 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 733573F738;
	Mon, 11 Aug 2025 05:14:01 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:13:52 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, fanqincui <fanqincui@163.com>,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Fanqin Cui <cuifq1@chinatelecom.cn>,
	hanht2@chinatelecom.cn
Subject: Re: [PATCH] arm64/module: Support for patching modules during runtime
Message-ID: <aJnegL4HcT2evOnR@J2N7QTR9R3>
References: <20250807072700.348514-1-fanqincui@163.com>
 <aJXlegQfZTdimS3k@willie-the-truck>
 <3d4011c0.6aaa.198981027d7.Coremail.fanqincui@163.com>
 <86zfc68exk.wl-maz@kernel.org>
 <aJnccgC5E-ui2Oqo@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJnccgC5E-ui2Oqo@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_051406_272951_655C600C 
X-CRM114-Status: GOOD (  21.23  )
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

On Mon, Aug 11, 2025 at 01:05:06PM +0100, Will Deacon wrote:
> On Mon, Aug 11, 2025 at 09:01:43AM +0100, Marc Zyngier wrote:
> > On Mon, 11 Aug 2025 08:37:32 +0100,
> > fanqincui <fanqincui@163.com> wrote:
> > > 
> > > Hi will,
> > > Yes, you are right. The alternative callback function lives inside the module.
> > > This callback function is actually similar to kvm_update_va_mask in KVM;
> > > 
> > > The module's callback function calculates some values based on
> > > the current CPU features and then performs the replacement.
> > > 
> > > The .text.alternative_cb section is actually marked as SHF_EXECINSTR | SHF_ALLOC
> > > during compilation, so intersections() includes this section and sets it as executable later.
> > 
> > I'm worried there is a chicken-and-egg problem here. What if the
> > callback itself requires patching via some other alternative? Is there
> > a guarantee that this always performed in the correct order?
> 
> Maybe we should just reject loading modules that have alternative
> callbacks that don't reside in the kernel text? 

I think that would be sensible. We never *intended* to support arbitrary
callbacks in modules, and if that's something people want, they need to
provide some actual justification.

> I _think_ that should cover all the in-tree users, although I didn't
> get a reply to my question asking which module triggered this bug
> report.

To the best of my knowledge, that covers all in-tree users. From a quick
grep for 'alternative_cb' and 'ALTERNATIVE_CB' in v6.17-rc1, all of the
patching functions are non-modular. AFAICT the only one we export is
alt_cb_patch_nops().

Mark.

