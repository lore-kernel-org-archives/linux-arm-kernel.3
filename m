Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FECAC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHnVBlF4wYci/RZsgkLzQMCMrqMGBmRZG+6jo4SMbzM=; b=OIiK8X6bOh7R25OEOmsso3Jl6q
	ZwPwrpsX3cL5ufV1cJhLEJskxKvxW/ed7AANhI6kP8oSce6R/thldQqVKveWSDUpOp5UfxsIx6xGq
	U1qPUoXKAZ2MfH2lTCpawXjCFcTZ9cj8YyMq1WLeWKSupIURm4wuTEmYKbi2V1AMeQ6gLbzTXARky
	cKRzQab/Bx5Be5AHyOsGJz8y14hH9B08CN3KYkEkIWYrwGzOc2uQ4IT9alQjfVF3hoNA1uet5uTG8
	JulnZb4xfCnd7tEWC2DrOP4H8AkXgDWIDtq01l/07HA3ub7UDQpcxHNdLxcpXOFqvo9MBJtv3kBR2
	2f1Si5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPntT-0000000ENiL-3Ne3;
	Thu, 12 Jun 2025 19:47:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPmVR-0000000E6s4-1K7g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 18:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749752306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XHnVBlF4wYci/RZsgkLzQMCMrqMGBmRZG+6jo4SMbzM=;
	b=Tf0nOF65Ql1HEnuMOuKAKPAzNx3WTFJ1HQaWTg2nS4LtNYAUK+mO/MLpHZNdAfvNenzwOb
	4Xw4/tJtCsA1FXzyoMRGIjLbMzgo6sq79nWOFOHB1PehSPCVfIUC9mBwqbJqdyE6EGK1jw
	D3SYWcWPq4O5Oam1p23aRf+NhT5mkI0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-369-KHPFWJRlPie7RQ7JVr7v0Q-1; Thu,
 12 Jun 2025 14:18:22 -0400
X-MC-Unique: KHPFWJRlPie7RQ7JVr7v0Q-1
X-Mimecast-MFC-AGG-ID: KHPFWJRlPie7RQ7JVr7v0Q_1749752301
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F38B318002E4;
	Thu, 12 Jun 2025 18:18:20 +0000 (UTC)
Received: from localhost (unknown [10.22.64.141])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C5501955F57;
	Thu, 12 Jun 2025 18:18:19 +0000 (UTC)
Date: Thu, 12 Jun 2025 15:18:18 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 00/13] arm64: debug: remove hook registration, split
 exception entry
Message-ID: <aEsZ6pwRcoI_wUqe@uudg.org>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
In-Reply-To: <20250609173413.132168-1-ada.coupriediaz@arm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Liu_KwDLR0G5EfDc131NUC7br13WdskyX1lqf5GHegg_1749752301
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_111830_211821_7B58C8F6 
X-CRM114-Status: GOOD (  30.83  )
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

On Mon, Jun 09, 2025 at 06:34:00PM +0100, Ada Couprie Diaz wrote:
> Hi,
> 
> This series simplifies the debug exception entry path by removing handler
> registration mechanisms for the debug exception handlers, a holdover from
> the arm kernel, as well as the break and stepping handlers.
> This moves much of the code related to debug exceptions outside of
> `mm/fault.c` where it didn't make much sense.
> This allows us to split the debug exception entries: going from one common
> path per EL for all debug exceptions to a unique one per exception and EL.
> 
> The result is a much simpler and fully static exception entry path, which
> we tailor to the different exceptions and their constraints.
> 
> The series is structured as such :
> 1 : related clean-up in the signle step handler
> 2 : related refactor of `aarch32_break_handler()`
> 3-5 : software breakpoints and single step handlers registration removal
> 6: preparatory function move that is made internal in patch 13
> 8: preparatory refactor of `reinstall_suspended_bps()`
> 7, 9-13 : debug exception splitting and handler registration removal
> 
> * Patch 3 copies and extends the `early_brk64` break handling for the
> normal path, byassing the dynamic registration.
> * Patch 4 does something similar for the single stepping handlers.
> * Patches 7, and 9 through 13 split each individual debug exception from
> the unified path by creating specific handlers, adapting them to
> their constraints and calling into them, bypassing the dynamically
> registered handlers used before.
> * Patch 8 refactors `reinstall_suspended_bps()` in preparation for the
> single-step exception entry split, as it is moved out of the handler.
> This could be squashed in patch 9 (the single-step exception split), but
> I opted to separate it for clarity (and because the commit message
> for patch 9 is already 45 lines long !).
> * Patches 5 and 13 are clean-ups removing the code that has been replaced
> and made redundant by the preceding patches.
> 
> PREEMPT_RT
> ===
> 
> Of note, this allows us to make the single exception handling mostly
> preemptible coming from EL0 in patch 9, fixing an issue with PREEMPT_RT[0].
> The commit message details the reasoning on why this should be safe.
> It is *definitely* not preemptible at EL1 in the current state, given
> that the EL1 software step exception is handled by KGDB.
> 
> CC-ing Luis as he did a lot of testing on v2 and originally
> reported the issue.
> 
> Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
> 
> We can do the same for the software break exception coming from EL0,
> which works in a very similar way.
> 
> However, the hardware breakpoint and watchpoint exceptions also have
> a sleeping while non-preemptible issue with PREEMPT_RT, but this is
> much trickier to fix, so this won't be fixed in this series.
> A bit more details in [1].
> 
> I hesitated to add comments within the BRK64 and single-step handlers,
> on the EL0 paths, to highlight that they would be preemptible and to be
> wary if modifying or adding to them, but I opted not to in the end.
> (Partly as I didn't find a satisfactory way to do it !)
> I would be happy to add some if anyone finds it would be beneficial.

Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>

Works as advertised, fixes the reported RT problem, fails on the specific
case Ada described above. :)

Best regards,
Luis


