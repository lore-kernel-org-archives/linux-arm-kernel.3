Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3261CFD45F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 00:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANyBf3kE4iNfEXkE69RNPvOtClQp7JDz8CQQzRUcCds=; b=gK1/zgm7VT5am3C1EeyLsIs6WS
	S0+W+PIs3iM9JAGuVQMZ1j6HnXgHHkZbqiJIR70tkR8P5CoNZb8gnqlEZ4+DvMm5NtREyumLtYrsY
	GHWhIc64GVxSTdJAkVsa2UkA5gUKpVUCooCGgpkgnlZe0R+hf2a3LwEvOsw8X04KlwWNPpth6WqHb
	+MuP6Ql6kKARWybbfbKOxQQMy0COY29+ble2eCD1oi43KWZC420UjZ6WjFOekDhhFRSXsZrHp/EXb
	EH/Gck9XxEPgu1TTeVceS7DBlSZx2HVM0YZP0U/KVTDhb6jYl84ARb04j59tiHfRrG36Tza+93J0L
	ckKfYg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOuJ-0000000571e-0I22;
	Thu, 26 Feb 2026 00:07:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOuG-00000005715-4BfL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 00:07:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E077341700;
	Thu, 26 Feb 2026 00:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B149DC116D0;
	Thu, 26 Feb 2026 00:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772064422;
	bh=s3Girc+bNp3czkHfjQVBAR5NXjL6Cl0HPW+PD8Y36FU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FqbEmP6ndwJwSoNn1OmPZrIdYccIrFSuMbfAEVkBpQsVCDiqpjEdsAYvgvH2M/Wxy
	 iCHEQQuHduhx0HR9PjYvdCegefDG+KzAWSBn4HxIQpYlk0aj/aDS0ZuLhvulmYGLwd
	 g/AsniZSbzWeVMg+bs+PJTov2mVOrT3KZFIwG1sCJ0L8HDZIXErHXTwmTm9RekL4Yo
	 nTd0bP6K8S4VnC9Sv5key+738g/JAXz+DLwZMDgbR7MbzfpMSFtzQbgUzx7Lr/4EZT
	 9Ua6Ckb8FNsUIGTRYXLxGpkDQbcBolOmDFsfiCpllmFmaGE2CIW5KnGtLJiKoapczd
	 vkchkAlid2xHw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 0/3] arm64: Assorted GCS fixes
Date: Thu, 26 Feb 2026 00:06:52 +0000
Message-ID: <177204923879.3245937.13575031331477938583.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223174533.1478164-1-catalin.marinas@arm.com>
References: <20260223174533.1478164-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_160705_078677_8A2BB1C7 
X-CRM114-Status: GOOD (  11.13  )
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

On Mon, 23 Feb 2026 17:45:29 +0000, Catalin Marinas wrote:
> A couple of GCS fixes and a corresponding kselftest. The first fix
> solves a kernel panic when LPA2 is present. The second ensures that the
> shadow stack is not accessible after mprotect(PROT_NONE). The test is
> fairly close to gcs_write_fault.c but performs a normal read from the
> shadow stack before and after mprotect(PROT_NOTE).
> 
> v1 here:
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/3] arm64: gcs: Do not set PTE_SHARED on GCS mappings if FEAT_LPA2 is enabled
      https://git.kernel.org/arm64/c/8a85b3131225
[2/3] arm64: gcs: Honour mprotect(PROT_NONE) on shadow stack mappings
      https://git.kernel.org/arm64/c/47a8aad135ac
[3/3] kselftest: arm64: Check access to GCS after mprotect(PROT_NONE)
      https://git.kernel.org/arm64/c/9d1a7c4a457e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

