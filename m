Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DA3606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MDQccvvc;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lET5Iiwm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=42kWpsG9Z6lrlCHz9cuZnhbJ9wiLjaLNz5DpNtMKtpU=; b=MDQccvvcVWbDRMCdIHw6PG8ESR
	bB+Q273UJRptusZUBWv7+gFq8FsIEd8Y+yVc6OeN6Q9LAhURjR6GFILPdvLWrCrg6mcCODaNtcmt7
	Nsx7SYa51AMpYzBEw++13+v5BD6LtBxYNt9mBExYKKxMUb+P/2wJpBMR9djhLWEvqYWtNG5FOM1IS
	AzDw5opa9pycVb3Sqw8KFUQCGNsyYa3jDV6CFsxRsX9K81RhK6JQQK5z4j66jt7neI+Fno2q3fXKT
	es0yrreqv84iQkV27zZgz8UnYfbBotgeq8pipsWink+jsxB5r4fKMUZ+wcavGSB/G2mdjbC9MUf1z
	GiIQs/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqts-0000000GQ2i-0P2M;
	Mon, 02 Nov 2026 12:12:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqtq-0000000GQ25-02Mk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:12:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8CBE153B;
	Mon,  2 Nov 2026 04:12:25 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 258A73F59E;
	Mon,  2 Nov 2026 04:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793621548; bh=LDLkhtz2J8kntAj62nqHKUXzSrEajnevTEiXeI9yeaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lET5IiwmXEcuJA3mJ7t/gUqnS0VPO7JCdGNxr0QsWHhd4sv5NHofA/ZHd5Z/g2OFK
	 C4D2e3pSJmF97NDdhXdPHU9XbNr2LyxExsHN2futubQMCfp6EXS0Hf1fb/tvYlnBIG
	 Ab1SR41yNpxvRZTecGKGt6tmMDPlI186uS1SMNcI=
Date: Mon, 2 Nov 2026 12:12:24 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: decui@microsoft.com, haiyangz@microsoft.com, mhklinux@outlook.com,
	wei.liu@kernel.org, arnd@arndb.de, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, lpieralisi@kernel.org,
	mark.rutland@arm.com, sudeep.holla@kernel.org, thuth@redhat.com,
	will@kernel.org
Subject: Re: [PATCH v6 2/6] arm64: hyperv: Detect Hyper-V via RSI host call
 in CCA Realms
Message-ID: <auh-KP-4gFxHtO1z@arm.com>
References: <20261031001412.4150488-1-kameroncarr@linux.microsoft.com>
 <20261031001412.4150488-3-kameroncarr@linux.microsoft.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031001412.4150488-3-kameroncarr@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_041230_089577_D622A423 
X-CRM114-Status: GOOD (  13.11  )
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

On Fri, Oct 30, 2026 at 05:14:08PM -0700, Kameron Carr wrote:
> When booting without ACPI, hyperv_detect_via_smccc() detects Hyper-V by
> querying the SMCCC vendor hypervisor UID. In an Arm CCA Realm the SMCCC
> call is handled by the RMM rather than by the hypervisor, so the
> query never reaches Hyper-V and detection fails.
> 
> When running in a Realm, forward ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID
> to the host with RSI_HOST_CALL instead, which is how Hyper-V hypercalls
> are issued from a Realm.
> 
> This is done in the Hyper-V code rather than in the generic
> arm_smccc_hypervisor_has_uuid() because the other users expect different
> behavior.
> 
> hyperv_init() is an early_initcall and runs before the secondary CPUs
> are brought up, so a single __initdata host call structure is used
> without locking.
> 
> ACPI-based detection and non-Realm guests are unaffected.
> 
> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>

This works for me, thanks. I replied to Dexuan clarifying my objection
to v5 do the UUID check generically.

-- 
Catalin

