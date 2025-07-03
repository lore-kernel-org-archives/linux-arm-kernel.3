Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8AAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVtlXpVBnt09uXL3XZrGYiLQsNJ+PMpaSA1ET+UsFIU=; b=ugiZY5E9BnE7n5PnnJaqNa6p9Z
	pWvIYqqWgG/8THuGBh0o7yi/7hcP1jtAajjgzMGV38ZyNAwh+DXsW8iu3D7Y5pyqx6uL0+1jf7A27
	hE6TO6VmXYzn45/nzUsqYkScD9ijtGJ0cGZfbiXuOgPfsinRjpNGHWgX+MXm13aHvrdQb+gu+WsJw
	ZUawBX34aaYJbAJV+cgTXzny8E3VzxOCFbT/gusQvlMOzR2QZUO6lWqnTOUnn8X7JPsoyBu/0ViZB
	wXLDZ3KaCT/MecbJ0SV7b6Pw5+5r9teyC4vj7Jal3TR6GQy5pN4aj/P7+MHveGRT0hLcCrxeBxIhB
	UuDQFoAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGT9-0000000Arfa-43xw;
	Thu, 03 Jul 2025 09:43:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGQp-0000000ArMK-0PLu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 09:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9275C5C5D0E;
	Thu,  3 Jul 2025 09:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395B5C4CEE3;
	Thu,  3 Jul 2025 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751535638;
	bh=V9a0E8RceAANb+Yuvv7Oj5gTG12x/beot48Z5f4hU4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BIsHOjuDGZrX8q0UtuPMNzzLn9yMAxgPIv35rChjnRaLkVhGzkZ3MzRS729YAI/1W
	 Ij1j+DF0Ta63RmrfcQ/n2V6Azyo4zb4o5isMioJkXYLUHUgBHlW2Tr9G01gaewWOZJ
	 vnAQRd9ylNpwpX60paDbsVXA2i5T+8E01wurDZ6nL0oc8xS7mnoY068W6+BCyM7a8e
	 jRWvaOoIy/q/XGtk36HK3nphGKbcVmbIOy+MAq40eb2mBCMwMQ6rfVgKGhAXryFjoK
	 WZ9U9ADBBcLqaL0ptOuVAGc0Jso6+saFERSurKjEs+NvhBQOSHwL1CoyOtk4rT3PRb
	 +fFzI/J8+l0sg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uXGQl-00CFW0-VI;
	Thu, 03 Jul 2025 10:40:36 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH] KVM: arm64: Remove kvm_arch_vcpu_run_map_fp()
Date: Thu,  3 Jul 2025 10:40:30 +0100
Message-Id: <175153562298.946959.15144867841994544212.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250619134817.4075340-1-mark.rutland@arm.com>
References: <20250619134817.4075340-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, broonie@kernel.org, catalin.marinas@arm.com, kvmarm@lists.linux.dev, oliver.upton@linux.dev, tabba@google.com, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_024039_174610_1D9A6B64 
X-CRM114-Status: GOOD (  10.74  )
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

On Thu, 19 Jun 2025 14:48:17 +0100, Mark Rutland wrote:
> Historically KVM hyp code saved the host's FPSIMD state into the hosts's
> fpsimd_state memory, and so it was necessary to map this into the hyp
> Stage-1 mappings before running a vCPU.
> 
> This is no longer necessary as of commits:
> 
> * fbc7e61195e2 ("KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state")
> * 8eca7f6d5100 ("KVM: arm64: Remove host FPSIMD saving for non-protected KVM")
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Remove kvm_arch_vcpu_run_map_fp()
      commit: 42ce432522a17685f5a84529de49e555477c0a1f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



