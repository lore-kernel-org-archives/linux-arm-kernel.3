Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4563CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYs14aBXiZWShSI4VzmjOlQav3e6tetAz3KKSYpGQ1U=; b=fvIXpw+W2epw/BmDp03JA2romb
	y+p8IcEY9CDwOp3biyG21IrpHoSEK04SN3NrSK6A+5we55ByYlWl8ozYUgu0hNLlY2cxSfhtXf4JC
	0heaL2RosIOethAdj5SX2pR5cGy9MQ6CkU4CV0GewMvwfarSQKfMpzAyd2igtvmh4+MTpZzi5UGjM
	XiaEo8xLFeqkaQo/q+mlTe1KUFVvYgkKhIH2KspcBiffOuax/BzEpvjjvc3GAbfVTM4LjH0w05ibb
	9isvBLfPHg8GXnCP66fhLKhKDn4zKZiv9zFFvWsAjPPc94g+jpxQPUEBa8iryc/GBJY6MMJDWW0JE
	sVL1Vt9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVRE-00000004S7z-1GP8;
	Thu, 30 Oct 2025 16:23:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVRB-00000004S61-0CYp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 16:23:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7248F40053;
	Thu, 30 Oct 2025 16:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51835C4CEF8;
	Thu, 30 Oct 2025 16:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841424;
	bh=QWMPQo2xAH0nVjguJgabX/CKiz1G+XFeSJIPZzq2RX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lC2Qf7z3gzI4hcYBakTotXArYL+2a4IRhcLv37Duop1VcKGrYfMjGqwxyXmKgljIy
	 T1vvj1uVxs4U2hrwzYFO7yOV5/5NMs8E3JqvxeFdyvn5NRwZ6UvBDpBmg9AGSYk5OC
	 8U0KBCqTlBQ/cfmYoEh3szJ4u+7MvabgyL2di2MLM/q9Dby9GUu93zKOMvwpHWcpf5
	 K1MxvgjofTR+PRj5ZQLG3CMUX+QraE4nqGObZQt755y6KFINTsDgQXBZwGKXelZgue
	 +sRkDbSudpSR0W92FZ2axAUMg2NYSJy5AZwZspVkITKpxUaONsxEzmj30L/favqFzS
	 CWtuo57c4BZDw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vEVR8-000000013BL-0vbN;
	Thu, 30 Oct 2025 16:23:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: oliver.upton@linux.dev,
	will@kernel.org,
	catalin.marinas@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	joey.gouly@arm.com,
	Sebastian Ene <sebastianene@google.com>
Cc: ayrton@google.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	vdonnefort@google.com,
	kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Check the untrusted offset in FF-A memory share
Date: Thu, 30 Oct 2025 16:23:39 +0000
Message-ID: <176184141934.2037838.2419455993784869828.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251017075710.2605118-1-sebastianene@google.com>
References: <20251017075710.2605118-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, will@kernel.org, catalin.marinas@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, joey.gouly@arm.com, sebastianene@google.com, ayrton@google.com, yuzenghui@huawei.com, qperret@google.com, vdonnefort@google.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_092345_106415_E18B4F27 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

On Fri, 17 Oct 2025 07:57:10 +0000, Sebastian Ene wrote:
> Verify the offset to prevent OOB access in the hypervisor
> FF-A buffer in case an untrusted large enough value
> [U32_MAX - sizeof(struct ffa_composite_mem_region) + 1, U32_MAX]
> is set from the host kernel.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: Check the untrusted offset in FF-A memory share
      commit: 103e17aac09cdd358133f9e00998b75d6c1f1518

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



