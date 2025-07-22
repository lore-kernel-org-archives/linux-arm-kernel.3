Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBDFC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2YZhtgtm394RnnixdV7wmfgGT2M2V2KUAeO2GpI0Os=; b=dVnhXnnukEhD+muz+lUg4jcXcR
	GBgVGHjAhqmJenPGe2ZWWN+YEyrtLWmrwTRHc49EYNIBbeWC1UDSgnSLwwhZVuXAHX5nK0a30qMwT
	IA9dT47NaxMkGlFyCS8Wdx9x3/q+DsSOK8SmTNJDUsQBvaJ2DT541LEZmd/Alz/N/qyLfFp1KVrXp
	ivBn6huVKYPytVkA4rFAK7dAojg5QBTrvRTckPoyrbEHb+kbIdtFfiyFra+GyOmfE+zlPriO8fkOY
	Z2lUoCQjGgueWBLc0FFKqA40GGWwTGES+iA0kSh48y03e74UrzMjGPUKfiSOggtY+MFlevZPk1B7R
	3gqLvpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAIY-00000002AIo-1sDL;
	Tue, 22 Jul 2025 10:32:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9xq-000000027ho-0Vu7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:11:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9ED1C5C53B6;
	Tue, 22 Jul 2025 10:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A3AC4CEEB;
	Tue, 22 Jul 2025 10:11:11 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Test FPSIMD format data writes via NT_ARM_SVE in fp-ptrace
Date: Tue, 22 Jul 2025 11:11:09 +0100
Message-Id: <175317903265.3058188.1426905529254051034.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718-arm64-fp-ptrace-sve-fpsimd-v1-1-7ecda32aa297@kernel.org>
References: <20250718-arm64-fp-ptrace-sve-fpsimd-v1-1-7ecda32aa297@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_031114_212652_5B5CC748 
X-CRM114-Status: GOOD (  11.05  )
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

On Fri, 18 Jul 2025 23:03:26 +0100, Mark Brown wrote:
> The NT_ARM_SVE register set supports two data formats, the native SVE one
> and an alternative format where we embed a copy of user_fpsimd_data as used
> for NT_PRFPREG in the SVE register set. The register data is set as for a
> write to NT_PRFPREG and changes in vector length and streaming mode are
> handled as for any NT_ARM_SVE write. This has not previously been tested by
> fp-ptrace, add coverage of it.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Test FPSIMD format data writes via NT_ARM_SVE in fp-ptrace
      https://git.kernel.org/arm64/c/b84d2b27954f

-- 
Catalin


