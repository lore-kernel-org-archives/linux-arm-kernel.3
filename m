Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A57A606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MFpqwpnn;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VwC0qHuV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3RaNVpitPtQwc0pZksDRL8hgfwXn6BMG3yrnetP97t0=; b=MFpqwpnnNp1D2U6QqVt3VkrRPi
	1ZF1KG9D5eo5Ysy7x5qhXW4Uxj/8EZ77yDuc7exbYehXIGjlBa/U2bqYlbNyu+WZHhUTIH6Lh4vkH
	KfMz/5cpXS1e5uJMfGf68w4a8EmC4Q9pd0H+RqNNf/sCP7R5hFSG4qP2bEnZkYcrErRRfhczCHZR7
	Buq1IUS5OIx7/R4NiU2DUyjwaKvPTZXJfBdkw3h+J2JGaIYR3CPpkguda7oKgvTdcORrhyZu4Zaol
	sYW2Y79jqQPfYTiOzz92q/MR7q5HObqa68k1B31r64xDdWfu+T2psGKJozDaoBlNuK0NfEftveN6K
	OzzfQVIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqro-0000000GPtd-3TCX;
	Mon, 02 Nov 2026 12:10:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqrk-0000000GPtF-0Kzf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:10:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C92B1FC4;
	Mon,  2 Nov 2026 04:10:15 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF3B93F59E;
	Mon,  2 Nov 2026 04:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793621418; bh=kH4wduj8rCU9JrOnkhZ6pZU1rzL9URyPOvDKS+QGHkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VwC0qHuVb3TAXcufxcWHnvaPcBsK56AleG1Lpa9845YIDHNBw/EIEqriPowVEpX6T
	 XzCrwXx+5Lq2A415gJAGOLEd3LcGoSbJ+SYR1pllJGhbw4g2lHxWt9S5lqQPCqoM2H
	 GwNVzTOxVdnJu2vat6eT2F77+zNgSSZXSWQ3j3Bs=
Date: Mon, 2 Nov 2026 12:10:14 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dexuan Cui <DECUI@microsoft.com>
Cc: Kameron Carr <kameroncarr@linux.microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	"mhklinux@outlook.com" <mhklinux@outlook.com>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"Mark.Rutland" <Mark.Rutland@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	"will@kernel.org" <will@kernel.org>
Subject: Re: [PATCH v6 1/6] arm64: rsi: Add RSI host call structure and
 helper function
Message-ID: <auh9pgBvIDD1PjXr@arm.com>
References: <20261031001412.4150488-1-kameroncarr@linux.microsoft.com>
 <20261031001412.4150488-2-kameroncarr@linux.microsoft.com>
 <CH4PPF0966F22FCBBF24F0929E97AC69951BF6C2@CH4PPF0966F22FC.namprd21.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH4PPF0966F22FCBBF24F0929E97AC69951BF6C2@CH4PPF0966F22FC.namprd21.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_041020_167138_3B820158 
X-CRM114-Status: GOOD (  15.25  )
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

On Sat, Oct 31, 2026 at 04:51:21AM +0000, Dexuan Cui wrote:
> > From: Kameron Carr <kameroncarr@linux.microsoft.com>
> > Sent: Friday, October 30, 2026 5:14 PM
> > To: Dexuan Cui <DECUI@microsoft.com>; Haiyang Zhang
> > <haiyangz@microsoft.com>; mhklinux@outlook.com; wei.liu@kernel.org
> > Cc: arnd@arndb.de; catalin.marinas@arm.com; linux-arch@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-hyperv@vger.kernel.org; linux-
> > kernel@vger.kernel.org; lpieralisi@kernel.org; Mark.Rutland
> > <Mark.Rutland@arm.com>; sudeep.holla@kernel.org; thuth@redhat.com;
> > will@kernel.org
> > Subject: [PATCH v6 1/6] arm64: rsi: Add RSI host call structure and helper
> > function
> > 
> > Add struct rsi_host_call to arm-smccc-rsi.h, which represents the host
> > call data structure used by the Realm Management Monitor (RMM) for the
> > RSI_HOST_CALL interface. The structure contains a 16-bit immediate field
> > and 31 general-purpose register values, aligned to 256 bytes as required
> > by the CCA RMM specification.
> > 
> > Add rsi_host_call() static inline wrapper in arm-rsi-cmds.h that invokes
> > SMC_RSI_HOST_CALL with the physical address of the host call structure.
> > This will be used by Hyper-V guest code to route hypercalls through the
> > RSI interface when running inside an Arm CCA Realm.
> > 
> > Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> > Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
> > ---
> 
> Catalin provided Reviewed-by to v5's patch #1, which is the same
> as v6's patch #1:
> https://lore.kernel.org/all/auPOxoaRbdOEHnv_@arm.com/

Yes, my review still stands.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

