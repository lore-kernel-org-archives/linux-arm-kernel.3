Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28D0606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xv1sbJo2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aY49vEqh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Rlq0AlUVPysrDth/CxuMoGsaxPC731Hkjxmxyzg8dD8=; b=xv1sbJo2JkMjwd0ltSkWOtsT6h
	hbC/RYJAIQXE5nBNVn0pt4HeuIfnF/ddhu0bE530L5R7tjQvSyPY3BwqZMlBeFYdUliS6bfzeJAVl
	vWzs2mIaSMgOOlOUUItPqA4kRKBcUi6S4/LqFb5J07i36Jz0trxvTe94/mjenpKF02RpPKI5rbAQa
	BDIN2dz8GngSo3w+OygD/w8Lz+RcfGiXTdSb6QxDKWkpiGcoyXmvTVO4tKw0rMuMFRXMlZgT8aDkv
	UOmwMpFe4lx8KQZFHKh6uGt/BhW02k5c1ZeJ/PWcsiyyuEIU00RtJkEU0dMBvvL/Tx1G50JeNIq7M
	DawIZZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYqO-000000056hh-3zyx;
	Wed, 04 Nov 2026 11:07:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYqN-000000056h6-0YYE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:07:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9562A4196E;
	Wed,  4 Nov 2026 11:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F7C1F000C1;
	Wed,  4 Nov 2026 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790470;
	bh=Rlq0AlUVPysrDth/CxuMoGsaxPC731Hkjxmxyzg8dD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aY49vEqhN62ykjnMpkAIKjZ28H6cualZd/MRlIWKbcuXlUAiePZ7oko52CH53WrCf
	 5QLRqjDPRUepLCarInRwxW6dlhNi0IIus/ayByqiRUDFHfCKOXsjeHCgeowIJzJ1cI
	 xRMQucEJ10m3Qj/A7AFs6sgZLNeJAmYQPdVllMYM8NBAUC8ir+4h7EoquEsRxeFmkT
	 Txyxm2AT3QJJu5RtITSGjtJpUdDX6HQ170BhDfXKPERGoFiISmyb8tV7czHxrstT4C
	 ocC2cwEBC52bCs/pAE9+oFZ+Z077xKs+5jgpR5JE0bH5Svk6OQhvb7WeoqTnVdG4k7
	 sfIhcA8/Y2LOg==
Date: Wed, 4 Nov 2026 12:07:46 +0100
From: Thorsten Blum <blum@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: cacheinfo: Simplify init_cache_level()
Message-ID: <ausSAhn0qRagNcrz@kernel.org>
References: <20261104083632.65715-2-blum@kernel.org>
 <0534c6f4-3bb8-4249-816c-502cf8ccb287@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0534c6f4-3bb8-4249-816c-502cf8ccb287@arm.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ben,

On Wed, Nov 04, 2026 at 10:32:58AM +0000, Ben Horgan wrote:
> Hi Thorsten,
> 
> On 04/11/2026 08:36, Thorsten Blum wrote:
> > acpi_get_cache_info() already sets fw_level to 0 on failure, so drop the
> > redundant check and the manual assignment.
> 
> This doesn't seem to be the case when CONFIG_ACPI_PPTT is not defined. Can the dummy implementation
> in include/linux/cacheinfo.h be called from init_cache_level()? For the implementation in

On arm64, ACPI_PPTT is selected when ACPI is enabled. When ACPI is
disabled, acpi_disabled = 1 and init_cache_level() won't call the stub.

> drivers/acpi/pptt.c levels is documented as "Number of levels if success." and so would be good to
> mention what happens in the error case if it needs to be relied on.

Below the parameter descriptions, it already says:

  "Errors caused by lack of a PPTT table, or otherwise, return 0
   indicating we didn't find any cache levels."

Thanks,
Thorsten

