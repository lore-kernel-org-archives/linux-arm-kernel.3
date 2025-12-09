Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D796CD3B9A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 23:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3jCcH3Xgezm79mxgx029VSUYm6yGyEUJIAZ/PVp5as=; b=avv4ze+ZCf/6d3AF3XdFXHr7sw
	fb7vJKYMv8f8dWhliTzVRUsqJiAJZ8PoZGLqXNvHbFTdEm8VCmVIwNwodfQOGiid16CH+tPTIqg3a
	hKtWakR0aF907bfOs5IaE9aDP4AA3aFHrqWbD918ZkDcgKgQaf9jvokXshqDslj06R2vGFSswLR8y
	UW5g2xgTUxhQHOxB9cT9QD1ymxioS57Sryjrs9s1FmlGMT1BSB4LHoEOlZuiRt+OCAlhZEXxDqDkC
	zIkSTl5NfMphahNPj15B+sv2QjR9ttpWcO8zq6Y49LYXgGlhhaMOzwSp63mWHkhHUYGchKmpUVLYA
	ne2HCkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6hb-0000000EtB3-05bj;
	Tue, 09 Dec 2025 23:01:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6ha-0000000EtAw-266p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 23:01:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1C166015A;
	Tue,  9 Dec 2025 23:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360C2C4CEF5;
	Tue,  9 Dec 2025 23:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765321261;
	bh=/ah7Zqz2nEXNAxPK4fIH6Lzc/09WmhDQtHjd6n9mOeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1Z2s9JWfojscSVTnJwydD7UV4xdGcvwgbFKC8mdeuCUIQGwCGyf+uTghHKUBkIbu
	 ZPRz8fO0uNalxMF/ozlxNYLd+Apyru/mijc2WT70RTagFeAOyjPcLQAU4zLBxFcMCl
	 PcjmeDS2LWJ2KAibw5ZtxQdXj/FP62jnY69/yJ8KzjFOsqNxk3bj/WbI9aAMzQrnwo
	 p3B3CkuN3cfv46RHfhNytOPrt5Qn9eFQrZr+py3CzHyMWVIX/dQb3/n5njtU3b0Ip0
	 udpcHzXK1FdWrvrirQyGdPNfrzcAy3d5nEfHa6ssb2rKx+7J54erVlG5dJEepmb+EN
	 HPka7oYuHd9og==
Date: Tue, 9 Dec 2025 15:00:59 -0800
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 00/24] ARM64 PMU Partitioning
Message-ID: <aTiqK7gKKKzGGwgW@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
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

On Tue, Dec 09, 2025 at 08:50:57PM +0000, Colton Lewis wrote:
> This series creates a new PMU scheme on ARM, a partitioned PMU that
> allows reserving a subset of counters for more direct guest access,
> significantly reducing overhead. More details, including performance
> benchmarks, can be read in the v1 cover letter linked below.
> 
> An overview of what this series accomplishes was presented at KVM
> Forum 2025. Slides [1] and video [2] are linked below.
> 
> The long duration between v4 and v5 is due to time spent on this
> project being monopolized preparing this feature for internal
> production. As a result, there are too many improvements to fully list
> here, but I will cover the notable ones.

Thanks for reposting. I think there's still quite a bit of ground to
cover on the KVM side of this, but I would definitely appreciate it if
someone with more context on the perf side of things could chime in.

Will, IIRC you had some thoughts around counter allocation, right?

Best,
Oliver

