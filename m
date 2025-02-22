Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05020C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 02:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6a9yEXkQW/x3v6N0CLqKYAXEvtTz6ogyBVtKlZQTKQ=; b=Av2zrkbDjT3RhjTL9z7QptAOjL
	T70Z1CECLqnmVKcKuansFTLrVa9QNz1oVBMozzB68/EtohkXembs31NlRDm4C4KVCveTuPkYunIZN
	3yeU0SM4/wvU7TDQx51vZ56EfvirdR31PvGIG2+IPkjwIjqWR3taKfZoJhT0Bx2cZWJNvcD+U6g3u
	qPzpB5EBFitTIjyQEUbQzDgsJgcKiddF6smKqHKP2pgYND2Sqnfcd5ev2HvWizwdYFR36xCTyNVtT
	un1Q2c/aVUJeEfMZjWhi2xJR6HEUbr25aAtwfEUOzIKlj6VOc2OtxyZ/Xz5WyEQkvV6NChOzltyeZ
	9ODchXWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlfKm-00000007MD1-38hb;
	Sat, 22 Feb 2025 02:33:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlfJK-00000007M8D-2k5p
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 02:32:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B6D6C68391;
	Sat, 22 Feb 2025 02:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F89C4CED6;
	Sat, 22 Feb 2025 02:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740191528;
	bh=FZnMFdDa2eWIl4oFcL24l5BAuNQWfTpFEGTebUgjJk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1YVU2h2yeY3oks9GLiIqAziMoxE84y+9gFwXdo+kGhQdEkbgSefJim69X1+OjmxB
	 sUl+TKn1d7tnDfsRtl6LqPpN4Zqp5FCE/T1tCHT91DI2AiTUJSqykBnBhxGLOsfpRJ
	 nHL8Rq0zDyXPQzxne70Hsg50VNNcBJDXXcQrCmocIJK/QeKSWlP4/iL/yyDEnSsOGy
	 jeR2zK3eXpNSi8hfI+/26IVx3Q4rxYprYdcA+0+chH4C+7rAPJM86cWqwytsMIUF0L
	 7Cuk393b/czhZL+xrIt2EJL5/a/jZSuA/oT4F6sDau4qKPMwDg7Z2kKUcv2z1n+/0H
	 PiWAzh7xsQqYg==
Date: Sat, 22 Feb 2025 02:32:06 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	iommu@lists.linux.dev, mhklinux@outlook.com,
	eahariha@linux.microsoft.com, mukeshrathor@microsoft.com,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
	arnd@arndb.de, jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com, skinsburskii@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] Introduce CONFIG_MSHV_ROOT for root partition code
Message-ID: <Z7k3Jh9O8noNZXGt@liuwe-devbox-debian-v2>
References: <1740167795-13296-1-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1740167795-13296-1-git-send-email-nunodasneves@linux.microsoft.com>
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

On Fri, Feb 21, 2025 at 11:56:32AM -0800, Nuno Das Neves wrote:
> Running in the root partition is a unique and specialized case that
> requires additional code. CONFIG_MSHV_ROOT allows Hyper-V guest kernels
> to exclude this code, which is important since significant additional code
> specific to the root partition is expected to be added over time.
> 
> To do this, change hv_root_partition to be a function which is stubbed out
> to return false if CONFIG_MSHV_ROOT=n, and don't compile hv_proc.c at all,
> stubbing out those functions with inline versions.
> 
> Store the partition type (guest or root) in an enum hv_curr_partition_type,
> which can be extended beyond just guest and root partition.
> 
> While at it, introduce hv_result_to_errno() to convert Hyper-V status codes
> to regular linux errors. This is useful because the caller of a hypercall
> helper function (such as those in hv_proc.c) usually can't and doesn't
> interpret the Hyper-V status, so it is better to convert it to an error code
> and reduce the possibility of misinterpreting it. This also alows the stubbed
> versions of the hv_proc.c functions to just return a linux error code.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>

No need to sign this off. :-)

> 
> Nuno Das Neves (3):
>   hyperv: Convert hypercall statuses to linux error codes
>   hyperv: Change hv_root_partition into a function
>   hyperv: Add CONFIG_MSHV_ROOT to gate root partition support
> 

Applied to hyperv-next. Thanks.

