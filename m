Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DF9C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RahFSryNV2h00UnSYy5JYEqMRM4Y9ZJoDKq5mJW5y2k=; b=IumkOour/nFyLPq79JirQ7l1zK
	8J9PiitBK2Vw//EM0XNJVVI2Ev9CNmnFQPva7A36gCvALN19kMnh6oeGbJcqtcW9dBamT0nM+BQay
	o814bv/EzZdsaBwS538XqHPjUf1RrRHlXv+CRy9KShz8cHROUu85eDZ7OtjS0bZH26vobxxKyrOIJ
	XHb3soxkUfuwHB4Bzb8/R6yS15GCrGli8V8iTiS+2RXTWbpYAoSGY77bbunLB6sCrYYJ3T0KLWlbw
	/VSJjqLzVIutgxn9pfC4SZnBSViGnvtYWTZw3rt4WmHN7kiBhX5CtObt6Se81W4AEDNINQixvtuCN
	If1wVhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeyn-0000000EIiV-19zA;
	Fri, 04 Jul 2025 11:53:21 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeZw-0000000EEZs-06jH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 11:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751628455;
	bh=t3/010+HIox3JcYzNG1vFfxeAMvyLUTNHCTRTUHcYI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhE5MU9C4JMbn2IuFIChkriZ9OjuVEsKflh0Ab57PM34Bxis505hH1WSc60KxFhGC
	 N2b39HaX2lDEnVWdo/pCozB1WW/mrZRfEbrf3CV1yff0MsfJ8VMZs4/klEzeG0oNhu
	 xaVgVm7N2JeuQ2s/VlIndFiCzt9Ajs2pIeHOxWlY=
Date: Fri, 4 Jul 2025 13:27:28 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mark Brown <broonie@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Christian Brauner <brauner@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/4] kselftest/arm64: Add coverage for the interaction
 of vfork() and GCS
Message-ID: <f438fc60-e602-4301-a7dd-bee43c020720@t-8ch.de>
References: <20250703-arm64-gcs-vfork-exit-v3-0-1e9a9d2ddbbe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-arm64-gcs-vfork-exit-v3-0-1e9a9d2ddbbe@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_042740_244878_F1E192E2 
X-CRM114-Status: GOOD (  18.44  )
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

On 2025-07-03 17:00:14+0100, Mark Brown wrote:
> I had cause to look at the vfork() support for GCS and realised that we
> don't have any direct test coverage, this series does so by adding
> vfork() to nolibc and then using that in basic-gcs to provide some
> simple vfork() coverage.

Thanks. I applied the patches, but moved the arm64 selftest patch to be
the last one.

FYI nolibc now has a proper prctl() implementation you might want to use.
Also your vfork() selftest uncovered a bug in the brandnew SuperH support.

> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Changes in v3:
> - Stylistic nits in the GCS vfork() test.
> - SPARC has a non-standard vfork() ABI which needs handling.
> - Link to v2: https://lore.kernel.org/r/20250610-arm64-gcs-vfork-exit-v2-0-929443dfcf82@kernel.org
> 
> Changes in v2:
> - Add replacement of ifdef with if defined() in nolibc since the code
>   doesn't reflect the coding style.
> - Remove check for arch specific vfork().
> - Link to v1: https://lore.kernel.org/r/20250609-arm64-gcs-vfork-exit-v1-0-baad0f085747@kernel.org
> 
> ---
> Mark Brown (4):
>       tools/nolibc: Replace ifdef with if defined() in sys.h
>       tools/nolibc: Provide vfork()
>       kselftest/arm64: Add a test for vfork() with GCS
>       selftests/nolibc: Add coverage of vfork()
> 
>  tools/include/nolibc/arch-sparc.h             | 16 +++++++
>  tools/include/nolibc/sys.h                    | 59 ++++++++++++++++++-------
>  tools/testing/selftests/arm64/gcs/basic-gcs.c | 63 +++++++++++++++++++++++++++
>  tools/testing/selftests/nolibc/nolibc-test.c  | 23 ++++++++--
>  4 files changed, 142 insertions(+), 19 deletions(-)
> ---
> base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> change-id: 20250528-arm64-gcs-vfork-exit-4a7daf7652ee
> 
> Best regards,
> --  
> Mark Brown <broonie@kernel.org>
> 

