Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB911E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 18:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gn4trLvMBAMR4aZ+MLGr8jrQ1U/yR6acN3A6+c+wOU=; b=BghSCXFHrEnI6iuFw2irof6M8O
	HQPTcQu1CwddCTDqeX8Wz6fPEtdtjiaREsfO0k5sBuxyYQtFSRKNeFFl1eyIvivjHJoJhNanRPoTU
	Q0bhsW3LzMlB/X40aHzMORwYo7fNtR3oWhqcCQZO97K00e4ZQbZTqMrWbNSaPSS7wy1lHbxeprQiw
	8JQ7VDcFQ0f/+RR62vsdt3rNzz52K0rBrkM1h1g28cJ/r5hTAHgD3ffMBODF4V0KngaMJ27f+nIEz
	LcmQ1FrF8RkWItSLOXtLCWvZ9zSpBsPJmbNpzLbEVtoyVMG2vEsGWLUNx5fhG88NW3PxwzAYi/MkF
	Vr3yTZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVaSY-00000009TJu-1MkF;
	Wed, 08 Jan 2025 18:07:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZ5I-00000009DG6-0Dmv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:39:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8918B5C0EFA;
	Wed,  8 Jan 2025 16:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5CCC4AF0C;
	Wed,  8 Jan 2025 16:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736354347;
	bh=9n73VRAg92lJzjOneubPEnzgsMyJ10eVPaHaUXDovVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wi2PdbOqqmQI6sc7idiKNc/tDJ8VFvnhPsxMGKur/N5pkBefJkn61CRcL/hL8U6bW
	 0R3M657MO5iVCYJpuDpe28ci0gm4pHM3/uZkHMh3GePlNAjn+As/Zo5OnKjIMVgO3k
	 UW8d5/8YLvnHEC0FURPjUZGkO1oa3XeX/XMte5tFmxWyPjy3RJEFLs/1GaWm686q1D
	 i7vmwMlBCe9z/JRw/KlpdPVgyVK7G9HxgHeoqA1aWc1su3Zt9hvLbH9ti08zdq1D2q
	 dWFKYxtcCy4V7cuR+yTw0AERfbx9i3nqXmx/f9k4nUSBtXRChedHzhApnmeSZ6qfW4
	 rNTlBx+8Uxbxw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Peter Collingbourne <pcc@google.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] arm64/sme: Move storage of reg_smidr to __cpuinfo_store_cpu()
Date: Wed,  8 Jan 2025 16:38:52 +0000
Message-Id: <173627015564.294742.14608056095112096112.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241217-arm64-fix-boot-cpu-smidr-v3-1-7be278a85623@kernel.org>
References: <20241217-arm64-fix-boot-cpu-smidr-v3-1-7be278a85623@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_083908_132901_5C8A2666 
X-CRM114-Status: GOOD (  14.02  )
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

On Tue, 17 Dec 2024 21:59:48 +0000, Mark Brown wrote:
> In commit 892f7237b3ff ("arm64: Delay initialisation of
> cpuinfo_arm64::reg_{zcr,smcr}") we moved access to ZCR, SMCR and SMIDR
> later in the boot process in order to ensure that we don't attempt to
> interact with them if SVE or SME is disabled on the command line.
> Unfortunately when initialising the boot CPU in init_cpu_features() we work
> on a copy of the struct cpuinfo_arm64 for the boot CPU used only during
> boot, not the percpu copy used by the sysfs code. The expectation of the
> feature identification code was that the ID registers would be read in
> __cpuinfo_store_cpu() and the values not modified by init_cpu_features().
> 
> [...]

SME is still disabled, but this is straightforward enough and I don't
want to lose track of it so I've applied it to arm64
(for-next/cpufeature), thanks!

[1/1] arm64/sme: Move storage of reg_smidr to __cpuinfo_store_cpu()
      https://git.kernel.org/arm64/c/d3c7c48d004f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

