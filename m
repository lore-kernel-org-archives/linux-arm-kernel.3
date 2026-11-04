Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6722606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mKWZ7TNu;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=U2a4Njyg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tc6smF+Vh/7CE2W9Q/F22hD5NIH3zyct+Y2aCzOC+DA=; b=mKWZ7TNumVlC0o+OO4hNYoHevl
	qxKKWJNPOLTqdRqk+zXPNNc8sa0X1Ivk5Jz8x57GVLWI22Ric+6kWx1G2J8dgMM5LZd+Zk64ipz0I
	P/dTczgCSODScVmEx4hZVCN2o3uwYUhYGfoKQBNHupJG5tfXV99T0gPcwRYyLDIUDGCscFJBAPwCz
	PFmhzTo54FUUD13t/E+TzDrzF12rvJcA1h+X5Rly3Rl92UUHUG7q6/RoXqYT9LHR2qMCaS/doKtu4
	RvASR75dbVwPhfUWtHBtkVcPWXosuwpvVz71d7JnHlgcWE8JyI/EuPUzTdkTc7BpjSY5PYQi24Ejs
	we0ma2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdrj-00000005ywt-3R9J;
	Wed, 04 Nov 2026 16:29:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdrh-00000005yvu-3VfV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:29:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB3A5169C;
	Wed,  4 Nov 2026 08:29:29 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81C573F632;
	Wed,  4 Nov 2026 08:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793809772; bh=ydxgtyBO23MN1U/TWCJdx3UsLKm/E3RiNWlRo8QZ6KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2a4Njyg1d4kBYH6XRCD/4nFi8EGVsAiy1I04x+liwPLk0pEpt9bibEPLsXaoB/yi
	 4nmRDin7U5A1xAVGyj7UxPTcXv/GtfdroRU+DW/DsiqXVajn7MYTHNZXWuFipL+JaM
	 WO8nG2dhgkauSdKkPH7PF4jORybqs1tD87KXTzUM=
Date: Wed, 4 Nov 2026 16:29:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: michael.reeves077@gmail.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Myria Sarvay <myrialsarvay@gmail.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: Add CPU part numbers for newer Apple
 Silicon CPUs
Message-ID: <autdZ07WVQ0MMR3A@arm.com>
References: <20261021-apple-m3-m4-kvm-v2-0-04905152cc2a@gmail.com>
 <20261021-apple-m3-m4-kvm-v2-1-04905152cc2a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-apple-m3-m4-kvm-v2-1-04905152cc2a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_082933_910531_7314C444 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 21, 2026 at 10:53:20AM +1100, Michael Reeves via B4 Relay wrote:
> From: Myria Sarvay <myrialsarvay@gmail.com>
> 
> Add CPU part numbers and MIDR definitions for M3, M3 Pro, M3 Max,
> base M4, A18 Pro and M5 Pro so CPU workarounds can identify these cores.
> 
> Use the SoC codenames for M4, A18 Pro and M5 Pro, with suffixes for
> their core types, as separate core codenames are not known.
> 
> Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

