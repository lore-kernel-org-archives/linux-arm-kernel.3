Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AB3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 22:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PpirUN4t;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YdAmEVvy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gUsEdTCZCen2ya5mfIqI1V3L46WdjmRn9nLkUV+DgkU=; b=PpirUN4tEEOJSgQyB9GeGno+wY
	vDfrhnKLNvEh3HW9IMkc9AsSCkzU8z1XbGwsJtfC3bs4304S43WDEJkvhrbWbf0u1r7tkVns38CYW
	D6g8CUObrAU5C6NMdyeUdmvd2qLItVS+myL289vMIAHHtjIomUA2scELTmRiLK6YoFy16N5j5/uV/
	3xlBsiZRus+8Ya8oyRkdotilW+3gWy6Geons//f6uOO2XXzQEU1lvUEAJPPbLsGIlOiXLMUCUprUV
	iUlPcArPMw4M5YUPLedE0pgKMKOWWFKuArzXUOtuni6W2PF7wEbxe4xSklOnjHmEYWu89lcNMeXvY
	sjQ5EdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZ1i-0000000AVai-0XGS;
	Thu, 29 Oct 2026 22:55:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZ1Z-0000000AVZL-2vPo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 22:55:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38052169E;
	Thu, 29 Oct 2026 15:55:04 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34A6A3F673;
	Thu, 29 Oct 2026 15:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793314507; bh=/IfRaxU3Nul4k0T2WVvt2X2CtI8TxghS+GLQv9LfQX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YdAmEVvyuWfOrvI0K8oHzeizVLRf5tnnf2q4PSt+Bil1PYpt0EQZx6L/LqScpX51E
	 z0lhgXvgtL2AdW/iql+ikQ27908N1yErS2wF+HPTCcg7srGMcOlum7vhbNJxnp82d+
	 4+ruaYRoK/6HS33BQpWgXzNf+3a+gRWr3/jIcG2M=
Date: Thu, 29 Oct 2026 22:55:02 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	mhklinux@outlook.com, will@kernel.org, mark.rutland@arm.com,
	lpieralisi@kernel.org, sudeep.holla@kernel.org, arnd@arndb.de,
	thuth@redhat.com, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v5 1/6] arm64: rsi: Add RSI host call structure and
 helper function
Message-ID: <auPOxoaRbdOEHnv_@arm.com>
References: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
 <20261002215725.2015959-2-kameroncarr@linux.microsoft.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002215725.2015959-2-kameroncarr@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_155509_797431_C938AD32 
X-CRM114-Status: GOOD (  10.13  )
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

On Fri, Oct 02, 2026 at 02:57:20PM -0700, Kameron Carr wrote:
> Add struct rsi_host_call to arm-smccc-rsi.h, which represents the host
> call data structure used by the Realm Management Monitor (RMM) for the
> RSI_HOST_CALL interface. The structure contains a 16-bit immediate field
> and 31 general-purpose register values, aligned to 256 bytes as required
> by the CCA RMM specification.
> 
> Add rsi_host_call() static inline wrapper in arm-rsi-cmds.h that invokes
> SMC_RSI_HOST_CALL with the physical address of the host call structure.
> This will be used by Hyper-V guest code to route hypercalls through the
> RSI interface when running inside an Arm CCA Realm.
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>

This looks fine.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

