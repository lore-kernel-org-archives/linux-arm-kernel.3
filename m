Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E494C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0x49pZTwdiDXr2gd+qMECRg1QrcMDZNfZWb+FgYBKNA=; b=1FG2A0PjBRP6+lHIEywX1HN4z7
	EypQSqkuckyveqQPZA3oHzaDqnZ0dk/sOnj2FqglujsyjJEjbtR0FHJgL4PLKeBuXxM0PY8fA8ig1
	Lw1Z/ZrN38ISE4PMK57TsdIQJi9Ag7Zn16B+Bvic/Mz8Lzkekd5YgtHaiXjAEqb2fGZmQ9auEVQr3
	HdFls0+6f/b2uFoGmVaFa/P2BARsHaMufwoWTzkuivJSCd/Px8dc1Dgt8JC2b3Udm2fiubhlHPD2R
	4UaD2cIi4XWCREiL9clOvHftBV9vzBArJ8D2+Xqfyktgghvxblurkskp7UI6j4B5n4xm3F8ZJ6ff2
	1pRwCyKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIec-0000000Del5-1BGO;
	Thu, 19 Jun 2025 17:02:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEVt-0000000D4kF-3kO0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35FB3A543E4;
	Thu, 19 Jun 2025 12:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D063EC4CEEA;
	Thu, 19 Jun 2025 12:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750336624;
	bh=5RsgnPconllRbfnixRhtoqpNREXw2H2Ipf16oI9O5rk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uw8uZTPkzLcmoPvmUWRcnY7YFleRsMVDgyQsrOutK4c5a4rWBzvWibdqrc+zOLEGO
	 qk5vyYlgnJaIbY5H5eZYhCov9MtaKtbOzIAySgMU6NnhNzf6hscTgLHN2cCQnWItal
	 x+XPBVCpaXWPSOVzIC4VKRp4AJVOE4wBaI2gclPcZXCoHZk6pUCyrQ9xUZuKBq3tnw
	 CambOoBAwEODCJ+VCOLDeuYfpmS/qNXDveKKjqK8AzJPcAHUkAsstlTILlVITSTc6L
	 Mu6j6LMnRGe9Og6M35XpEQrnaM0N/N/EeEYTJ5khAaCgR686QjTjEZVfiCY4Ut2PMs
	 zhrnNG+z7AsfQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uSEVq-008Ff6-Lj;
	Thu, 19 Jun 2025 13:37:02 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	stable@vger.kernel.org,
	tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH 0/7] KVM: arm64: trap fixes and cleanup
Date: Thu, 19 Jun 2025 13:36:58 +0100
Message-Id: <175033660259.3069733.12635205080587210406.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250617133718.4014181-1-mark.rutland@arm.com>
References: <20250617133718.4014181-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, broonie@kernel.org, catalin.marinas@arm.com, kvmarm@lists.linux.dev, oliver.upton@linux.dev, stable@vger.kernel.org, tabba@google.com, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_053705_997555_6A5FD20F 
X-CRM114-Status: GOOD (  10.90  )
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

On Tue, 17 Jun 2025 14:37:11 +0100, Mark Rutland wrote:
> This series fixes some issues with the way KVM manages traps in VHE
> mode, with some cleanups/simplifications atop.
> 
> Patch 1 fixes a theoretical issue with debug register manipulation,
> which has been around forever. This was found by inspection while
> working on other fixes.
> 
> [...]

Applied to fixes, thanks!

[1/7] KVM: arm64: VHE: Synchronize restore of host debug registers
      commit: cade3d57e456e69f67aa9894bf89dc8678796bb7
[2/7] KVM: arm64: VHE: Synchronize CPTR trap deactivation
      commit: 257d0aa8e2502754bc758faceceb6ff59318af60
[3/7] KVM: arm64: Reorganise CPTR trap manipulation
      commit: e62dd507844fa47f0fdc29f3be5a90a83f297820
[4/7] KVM: arm64: Remove ad-hoc CPTR manipulation from fpsimd_sve_sync()
      commit: 59e6e101a6fa542a365dd5858affd18ba3e84cb8
[5/7] KVM: arm64: Remove ad-hoc CPTR manipulation from kvm_hyp_handle_fpsimd()
      commit: 186b58bacd74d9b7892869f7c7d20cf865a3c237
[6/7] KVM: arm64: Remove cpacr_clear_set()
      commit: 3a300a33e4063fb44c7887bec3aecd2fd6966df8
[7/7] KVM: arm64: VHE: Centralize ISBs when returning to host
      commit: 04c5355b2a94ff3191ce63ab035fb7f04d036869

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



