Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70612CDDE5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUI1/6mprU1D2+b2S5gFN7qEb+oqmep3Nffc9peEuDk=; b=DxB2M9yRXrLp/Er//0PfomEla9
	idp/ncYzVPDRcTg9DFjZ499wZptcPRoNL03n9gOQVqs3sBVe+G4ZvpBh8SmCrbtBtRZ2dzVt+hE+U
	4TBbM7tSI3fizT0QhcEC3jT92T3Y2puMx6eb7vvZEwdeZcrlDLfylX/NdgxlRAqHSjB5R1kUmanJA
	kHqrtQKzS2uLLoC6NLM0mzpa6TSt72nfiN3TUT0cmSuvX/AK9kHu+GPuId9PyVHXLAlBBXQxAZmkA
	XZ7mPBhJqGkactsHd3V3pvSBWvTFU4VhOpFv1sd4WIRMVmroKBe+nlada++rJsaOBMBuWXUHxFJSp
	TxtF8Nnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ykh-0000000E0mV-00TK;
	Wed, 23 Oct 2024 10:38:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YBx-0000000DunR-0sTF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:02:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21A775C0553;
	Wed, 23 Oct 2024 10:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC1BC4CEC6;
	Wed, 23 Oct 2024 10:02:08 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Steven Price <steven.price@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v7 00/11] arm64: Support for running as a guest in Arm CCA
Date: Wed, 23 Oct 2024 11:02:06 +0100
Message-Id: <172967739783.1412028.8494484908145931121.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241017131434.40935-1-steven.price@arm.com>
References: <20241017131434.40935-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_030213_316183_C980960C 
X-CRM114-Status: GOOD (  13.58  )
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

On Thu, 17 Oct 2024 14:14:23 +0100, Steven Price wrote:
> This series adds support for running Linux in a protected VM under the
> Arm Confidential Compute Architecture (CCA). This is a minor update
> following the feedback from the v6 posting[1]. Thanks for the feedback!
> 
> Individual patches have a change log. The biggest changes are in patch
> 10 where Gavin gave some great feedback to tidy things up a bit.
> 
> [...]

Applied to arm64 (for-next/guest-cca), thanks!

Note that this branch cannot be tested in isolation as it doesn't have
the irqchip CCA changes. I pulled tip irq/core into the arm64
for-kernelci. Please give the latter branch a go (or linux-next when the
patches turn up).

[01/11] arm64: rsi: Add RSI definitions
        https://git.kernel.org/arm64/c/b880a80011f5
[02/11] arm64: Detect if in a realm and set RIPAS RAM
        https://git.kernel.org/arm64/c/c077711f718b
[03/11] arm64: realm: Query IPA size from the RMM
        https://git.kernel.org/arm64/c/399306954996
[04/11] arm64: rsi: Add support for checking whether an MMIO is protected
        https://git.kernel.org/arm64/c/371589437616
[05/11] arm64: rsi: Map unprotected MMIO as decrypted
        https://git.kernel.org/arm64/c/3c6c70613956
[06/11] efi: arm64: Map Device with Prot Shared
        https://git.kernel.org/arm64/c/491db21d8256
[07/11] arm64: Enforce bounce buffers for realm DMA
        https://git.kernel.org/arm64/c/fbf979a01375
[08/11] arm64: mm: Avoid TLBI when marking pages as valid
        https://git.kernel.org/arm64/c/0e9cb5995b25
[09/11] arm64: Enable memory encrypt for Realms
        https://git.kernel.org/arm64/c/42be24a4178f
[10/11] virt: arm-cca-guest: TSM_REPORT support for realms
        https://git.kernel.org/arm64/c/7999edc484ca
[11/11] arm64: Document Arm Confidential Compute
        https://git.kernel.org/arm64/c/972d755f0195

-- 
Catalin


