Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C09FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3WJUuLYLKlUU9PEJvbVOINZTWXF/IXQxNI11S4qng8=; b=iNfeWpRwGftnJKbsfwqgFqAW2c
	BBfqE/PM8rrqf+fJY64JVmKcfcQo59G81+kJCAhhYGf81ieUDzYiTUElSSGScyazPw3Umr5UpmHO3
	9Ek+qFruVaQ/+ULeBwK8kaWDDiEYCSfsY5Oa8+nLcmXJiz2ZKpcmoade/OhffIQX3jGJLb03JG1OS
	VJVBeD1OeDp1jFN7vWZdNdcJxHDvl4px5JlGIAPRdr+eVgIJnrNAxvGIjkr7qgqhi5F4tzmA2RIMg
	08YkErWuwD/kcGVQgjLPCZvLfiV6VDy+NsNXVfTW169Xj+yCD/rLxadlL/NQRZ08P7p+Tx70Kmube
	s2/yCgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfakD-00000006XWo-3mWN;
	Fri, 03 Jul 2026 10:03:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfakB-00000006XW7-102Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:03:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E68F61A9A;
	Fri,  3 Jul 2026 03:03:29 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 792253F905;
	Fri,  3 Jul 2026 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783073014; bh=1sS9BFLEnZ4UmIZvkVfUaEhfSe59VnDVcNTWDHrlVEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e63NJo9jbxv1KwKVLSTotTdwFBkdu8GYmBVN02MI6U7Q+5Ad72jGxsPQzYu3ceZSS
	 t6vbraOZ8QXodtkQbaOV8oKAiYrnrVXS2Mt4WOZdR9DzaSsUBJOjQeMleffxCr2Pce
	 Eb4rxnk836g3EP0+lcONyjLd57eQCcWnpu2BocMY=
Date: Fri, 3 Jul 2026 11:03:30 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org
Subject: Re: [PATCH] arm64: Clarify ARM64_WORKAROUND_REPEAT_TLBI semantics
Message-ID: <akeI8rsrkfLNs4Kb@J2N7QTR9R3>
References: <20260629100953.385435-1-mark.rutland@arm.com>
 <8d72230b-d636-447c-873e-b95304457a5a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d72230b-d636-447c-873e-b95304457a5a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_030335_333393_701D6B25 
X-CRM114-Status: GOOD (  15.18  )
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

On Mon, Jun 29, 2026 at 07:05:35PM +0100, Vladimir Murzin wrote:
> On 6/29/26 11:09, Mark Rutland wrote:
> > Will notes that the ARM64_WORKAROUND_REPEAT_TLBI name is potentially
> > misleading, and that it would be nice to rename that and add some
> > documentation. See:
> > 
> >   https://lore.kernel.org/linux-arm-kernel/ajKn_Pt50CmOUrsP@willie-the-truck/
> > 
> > To that end, I've renamed the Kconfig symbol and hwcap from:
> > 
> >   [CONFIG_]ARM64_WORKAROUND_REPEAT_TLBI
> > 
> > ... to:
> > 
> >   [CONFIG_]ARM64_WORKAROUND_REPEAT_TLBI_SYNC
> > 
> > ... and I've added some rationale alongside the Kconfig. As the Kconfig
> > symbol isn't user selectable, the usual 'help' section won't appear in
> > menuconfig, so I've added this as a comment.
> > 
> 
> Although it won't appear in menuconfig, 3rd party tools that
> index config symbols may still consume the help section.
> I'm not sure how much we care about such tools...

FWIW, I'm happy either way -- I'll defer to Will's preference.

Mark.

