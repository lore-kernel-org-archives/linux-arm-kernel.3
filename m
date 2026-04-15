Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2268BFA0C47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZQHwfruCmDImIKCFoohEJdAn2LxEw8uanQlnpjvvL0=; b=T7Oyry/Vsu2KV9JPVUtlCgemL9
	3uZHz4IFMcTU4dGVnViVmBPybvDiXTlzbSjHWmkRQDCqKra4xnO/iE2oPXkM0rwvcGg4J2+3z1PvB
	G/6P+71yfflCSteniVUzF1EWRiGkOlzZFtmzW4vLP+gH7e6Y51nM01xYQxIL3rKCKPw77kC2x/QGk
	ia3V+h/xyM8QCQVZMYIQtWekqigZZVgCF38FeaUDyQdgOIkn0nwZGemXmiZjIhprU5I5yd/dYja+r
	hwAED9nVotG9bepYDIueWUSQFAawpnoey85y34OXBp/8tjMyXBgPkCUTAPopCxoXGyEOsOfE4jBvz
	G/jlNN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvJw-00000000mIB-3XAd;
	Wed, 15 Apr 2026 08:10:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvJt-00000000mHJ-46qo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 08:09:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C35494FBA;
	Wed, 15 Apr 2026 01:09:50 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DF5E3F86F;
	Wed, 15 Apr 2026 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776240596; bh=OXrb+0YI5chogZ453hZG4hR0T4d+2x4jCT8A9v7REVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HD4JJ/1G1kgD5UVmQwAX6OSbffYQA+GeAIj1cX4zpoPJddLjAn0JJ0f5SH+Ixvu0u
	 gok/JlYNdFMj98h6jjaoZcEIj+KI7YWSWcwQ2k5ItHWLdEFYFc5tyWpq90r1qcEgcU
	 4/sDp90N1D9VmffyTc/0YYUYZTWazFBu0pE2OjsM=
Date: Wed, 15 Apr 2026 09:09:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/8] arm64/hwcap: Generate the KERNEL_HWCAP_ definitions
 for the hwcaps
Message-ID: <ad9H0BiD4le07P-a@arm.com>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
 <20260302-arm64-dpisa-2025-v1-1-0855e7f41689@kernel.org>
 <8745494.GXAFRqVoOG@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8745494.GXAFRqVoOG@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_010958_057734_F3A941EB 
X-CRM114-Status: GOOD (  11.06  )
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

On Wed, Apr 15, 2026 at 08:24:22AM +0200, Alexander Stein wrote:
> Am Montag, 2. März 2026, 23:53:16 CEST schrieb Mark Brown:
> > Currently for each hwcap we define both the HWCAPn_NAME definition which is
> > exposed to userspace and a kernel internal KERNEL_HWCAP_NAME definition
> > which we use internally. This is tedious and repetitive, instead use a
> > script to generate the KERNEL_HWCAP_ definitions from the UAPI definitions.
> > 
> > No functional changes intended.
> 
> Somehow this change causes to delete and generate kernel-hwcap.h on each
> make call. This results in compiling essentially everything each time.

Does this fix it:

https://lore.kernel.org/r/20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@kernel.org

It's queued, it will go in before -rc1.

-- 
Catalin

