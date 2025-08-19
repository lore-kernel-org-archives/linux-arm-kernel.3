Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BA3CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 10:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4fL/8JBrq5kOKmq4jMwuejeo43P8qbr6SDXfMQV2ZM=; b=uiUkfBRJN42ARyxFuDNNAVgcsi
	2pbqA0PqyovQv1po0drhpLZczCna5LlcQLBzBKUriZvOk7MN87kIdhEmP+QobpRKh3+dzT+sNU0Wz
	9eyssnbcnLGzy/2MPXRxNdo+j6KeRCO6F1VdWLOg9Q6L20yLZhf5Dn4WX+jaiHV6659mysrZZSBTG
	WCM8Rk2pt9ZA1kF8fPP3gBrG1DVX1vJnuhhNwbMebr7v8qcwXxaWeCE2CyXYLul4VPPfEgKInm+FB
	0Ou0/rfLBtic2r46nJMjScljzm4+31+OAvFw08NYWtV5/uyXgW66rTbQ8IW2TIOcm9or0L5sYr4kz
	TPkLbkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJHb-0000000A5FR-2ee1;
	Tue, 19 Aug 2025 10:09:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHrw-00000009pXX-1TFq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 08:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7CDB4425A;
	Tue, 19 Aug 2025 08:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E14C4CEF1;
	Tue, 19 Aug 2025 08:38:56 +0000 (UTC)
Date: Tue, 19 Aug 2025 09:38:54 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com,
	joey.gouly@arm.com, james.morse@arm.com, ardb@kernel.org,
	scott@os.amperecomputing.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm64: futex: support futex with FEAT_LSUI
Message-ID: <aKQ4HvqZa_7Q7oDu@arm.com>
References: <20250811163635.1562145-1-yeoreum.yun@arm.com>
 <20250811163635.1562145-6-yeoreum.yun@arm.com>
 <aJ9oIes7LLF3Nsp1@arm.com>
 <aKB55rPj1Qe8G+zF@e129823.arm.com>
 <aKCcbQWioNfG1MMQ@e129823.arm.com>
 <aKNyj_6dZVp9O4BA@arm.com>
 <aKOE1aqe6EljRkuB@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKOE1aqe6EljRkuB@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_013900_409220_6ACAA259 
X-CRM114-Status: GOOD (  18.31  )
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

On Mon, Aug 18, 2025 at 08:53:57PM +0100, Yeoreum Yun wrote:
> > On Sat, Aug 16, 2025 at 03:57:49PM +0100, Yeoreum Yun wrote:
> > > why we need to care about the different settings for tag checking when
> > > we use uaccess_disable_privileged()?
[...]
> > > But, although tag check fault happens in kernel side,
> > > It seems to be handled by fixup code if user address is wrong.
> >
> > The user may know it is wrong and not care (e.g. one wants to keep using
> > a buggy application).
> 
> Then Does this example -- ignoring wrong and keep using a buggy
> application shows us that we need to enable TCO when
> we runs the LSUI instruction?
> 
> AFAIK, LSUI instruction also check memory tag -- i.e) ldtadd.
> if passed user address which has unmatched tag and if user isn't
> interested in tah check, It can meet the unexpected report from KASAN.

That's a valid point w.r.t. PSTATE.TCO that applies to copy_to/from_user
as well. I don't think we documented it but we don't expect the user
PSTATE.TCO state to be taken into account while doing uaccess from the
kernel. We do, however, expect SCTLR_EL1.TCF0 to be honoured and that's
what the user normally tweaks via a prctl(). The TCO is meant to
disable tag checking briefly when TCF enabled the tag check faults.

-- 
Catalin

