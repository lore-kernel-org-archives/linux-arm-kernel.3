Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08544C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3b+ZfD6jmXaoPiUIvtyccSAa2rETaHp00CS2te7EAw=; b=obX25gU5crpg2MqlzGP2vJ4SUf
	6IlF8vEitCjkP8XXuyxrUZ6v9ZA79pm7uld67X5Xnbw8EyF0jFXOV12z6cKEuObu5YX8tTGJia9TK
	XOgX8MD6edm+1FYAFK+vlpN+/OtKMnihEPeofdhq8HF5quiq3Nc9uENl+2g8vU/6ZwNGjbxepJW4V
	SrJ+80EMeJ2NryTyQB1nS+tQZTsrJb0LxIzSaK4fL5l1ulCwCT+DVGKOVwN8a9OKHJIjnQN+p3Ogf
	cA6mYc3JtSjIreaOLm7xhzZtSSCw0xMfQfElmqslb9Rxb2j1zOB+PvnN2AQJ0lohroZGghusRxt1V
	JrSSUmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYCZ-00000000r6R-2LKU;
	Mon, 10 Feb 2025 18:08:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYBB-00000000qvo-2Awa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:06:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A8C4A41DE4;
	Mon, 10 Feb 2025 18:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5FBC4CED1;
	Mon, 10 Feb 2025 18:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739210804;
	bh=rEjX/y5k2wIkN5VomTNPMfAyy9Yr49DktqV5dC3V3Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiJ4BPF1ex+vGFRQWPQoDOu3R1NRwt9+mBZRxPP7Uj8A+Z7uecAIz0D4UXwracO7b
	 YFpSEoplurLtGfL01oBZ1LoN6Qvn4UiRr8Lh9yt3PZGS/eZAQNYnOpb6eNoo+B4MID
	 0oZ26Z7UhL86B1XNPvV+9UZDZWTbT9hZRKkv2S2uHJX8Xyp9JXdOP5d8jQXtI/8kPW
	 29i6IavU1KcotYuCEcTIwOw2JfD3GD41s5R2f3VUhVeWUlsOoX2d3a6Z46BskeYLu9
	 F9LDS36eNh3y4IKiYgqTtVvmeT62v5cp+c1Z9FXqgDYLSc4mxOvpFLJ3UhlwGu53RH
	 PCxZDKYw1MtPg==
Date: Mon, 10 Feb 2025 18:06:38 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 2/8] KVM: arm64: Remove host FPSIMD saving for
 non-protected KVM
Message-ID: <20250210180637.GA7926@willie-the-truck>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-3-mark.rutland@arm.com>
 <20250210161242.GC7568@willie-the-truck>
 <Z6owjEPNaJ55e9LM@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6owjEPNaJ55e9LM@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_100645_617954_31D245E8 
X-CRM114-Status: GOOD (  15.31  )
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

On Mon, Feb 10, 2025 at 04:59:56PM +0000, Mark Rutland wrote:
> On Mon, Feb 10, 2025 at 04:12:43PM +0000, Will Deacon wrote:
> > On Thu, Feb 06, 2025 at 02:10:56PM +0000, Mark Rutland wrote:
> | static inline bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
> | {
> | 	...
> | 
> | 	/* Valid trap */
> | 
> | 	/*
> | 	 * Enable everything EL2 might need to save/restore state.
> | 	 * Maybe each of the bits should depend on system_has_xxx()
> | 	 */
> | 	cpacr_clear_set(0, CPACR_EL1_FPEN | CPACR_EL1_ZEN | CPACR_EL1_SMEN */
> | 	isb();
> | 
> | 	...
> | 
> | 	/* Write out the host state if it's in the registers */
> | 	if (is_protected_kvm_enabled() && host_owns_fp_regs())
> | 		kvm_hyp_save_fpsimd_host(vcpu);
> | 	
> | 	/* Restore guest state */
> | 
> | 	...
> | 
> | 	/*
> | 	 * Enable traps for the VCPU. The ERET will cause the traps to
> | 	 * take effect in the guest, so no ISB is necessary.
> | 	 */
> | 	cpacr_guest = CPACR_EL1_FPEN;
> | 	if (vcpu_has_sve(vcpu))
> | 		cpacr_guest |= CPACR_EL1_ZEN;
> | 	if (vcpu_has_sme(vcpu))			// whenever we add this
> | 		cpacr_guest |= CPACR_EL1_SMEN;
> | 	cpacr_clear_set(CPACR_EL1_FPEN | CPACR_EL1_ZEN | CPACR_EL1_SMEN,
> | 			cpacr_guest);
> | 
> | 	return true;
> | }
> 
> ... where we'd still have the CPACR write to re-enable traps, but it'd
> be unconditional, and wouldn't need an extra ISB.
> 
> If that makes sense to you, I can go spin that as a subsequent cleanup
> atop this series.

That looks very clean, yes please! Don't forget to drop the part from
kvm_hyp_save_fpsimd_host() too.

Will

