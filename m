Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F9DC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 01:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGKYpm3NtQnK1t7E2NOgTePh2Nswpahf23hIRl2lOT4=; b=Hm9sKmniQH5Snn0ZmKHeltoOnN
	5TDWJrnBGHDwEYWObERXaJGWLy4zJgzF2PH4YjT4CRIt+yO2rBxnVaHhY01LKker+dFh0HaaCqR0+
	8xKpUzPsnnsjVcaDRPvN2Xp65dd9Ufm5bSHgOVraxzdnYDk6q7sU595Gg6Goc17jNSyLvhMLL5+6W
	K/0f0XciH1h5NsZwJI+iu+TiTcD7Oa4ayb0DKUnQcU6toJfITbFS8jFmcBWOg3E7Oq7z1AzbOgdcr
	AvVZ+wssdoIYqWsObZVgitDy1lYSzvxnPitbUf6TyWFMukQnP4doKCIcM8VzPzirKSIiODjFuYXXX
	tlGaAKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9WM-00000006wS8-3my1;
	Fri, 07 Aug 2026 01:37:14 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9WJ-00000006wRl-0DwY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 01:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786066629; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=JGKYpm3NtQnK1t7E2NOgTePh2Nswpahf23hIRl2lOT4=;
	b=aQvAQD7RuZ8kb/qmvFB4Llit9Y0WgZIW3pnH8F4AFxKLgch0I2mNWfYskxPIYYuhws6HbKxtwjZ36rbOSdjyVYvbqOB6k2cBIwmKTcN7bZqCcIm2PpZ8yi0N5MLGsKl7JLLstVPop5haFpPUirFfVFm7+JNS3SpqJ7o4x0YNxfM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R901e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X8VGXri_1786066627;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X8VGXri_1786066627 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Aug 2026 09:37:08 +0800
Date: Fri, 7 Aug 2026 09:37:06 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, tabba@google.com, 
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH] KVM: arm64: Fix hvhe and broken CNTVOFF_EL2
Message-ID: <gm2w76lflkw67xc4io2ornvfugvijbwotzvwmmefsfcqvrasgp@qkybjxr6lukr>
References: <20260806150105.4010701-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806150105.4010701-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_183711_787248_F3DA407E 
X-CRM114-Status: GOOD (  20.89  )
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

On Thu, Aug 06, 2026 at 03:01:05PM +0800, Mostafa Saleh wrote:
> When running on a setup affected with broken CNTVOFF_EL2
> (has_broken_cntvoff())
>
> Booting with VHE or protected mode(nvhe) (id_aa64mmfr1.vh=0
> and arm64_sw.hvhe=0) works fine.
>
> However launching a protected VM with protected hvhe mode panics the
> guest kernel:

...

> And for non protected VMs seems to hang or progress really slowly.
>
> The workaround avoids setting non-zero CNTVOFF_EL2 and trapping the
> virtual counter to emulate the offset.
> In the VHE path (timer_set_traps()), traps are only enabled when the
> guest actually has a non-zero virtual timer offset.
> However, __timer_enable_traps() in hyp/nvhe/timer-sr.c unconditionally
> set CNTHCTL_EL1TVT and CNTHCTL_EL1TVCT whenever has_broken_cntvoff()
> was true.
>
> Which causes 2 issues:
> 1) Protected VMs: kvm_handle_pvm_sysreg() does not find "cntv_ctl_el0"
> in pvm_sys_reg_descs and injects undefined instruction exceptions.
>
> 2) non-protected guests are trapped all the time even with offset of
> zero.
>
> Fix this by adding a check in __timer_enable_traps() similar to the one in
> timer_set_traps()

Hi Saleh,

May more fix is needed for case that guest real have virtual
offset, due to no cntv_ctl_el0 handler there. For current
fix for virtual offset is zero:

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>
> Fixes: 0bc9a9e85fcf ("KVM: arm64: Work around x1e's CNTVOFF_EL2 bogosity")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/timer-sr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/timer-sr.c b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
> index ff176f4ce7de..98b6e37ee8fa 100644
> --- a/arch/arm64/kvm/hyp/nvhe/timer-sr.c
> +++ b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
> @@ -10,6 +10,7 @@
>
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
> +#include <hyp/switch.h>
>
>  void __kvm_timer_set_cntvoff(u64 cntvoff)
>  {
> @@ -63,7 +64,7 @@ void __timer_enable_traps(struct kvm_vcpu *vcpu)
>  	 * Trap the virtual counter/timer if we have a broken cntvoff
>  	 * implementation.
>  	 */
> -	if (has_broken_cntvoff())
> +	if (has_broken_cntvoff() && hyp_timer_get_offset(vcpu_vtimer(vcpu)))
>  		set |= CNTHCTL_EL1TVT | CNTHCTL_EL1TVCT;
>
>  	sysreg_clear_set(cnthctl_el2, clr, set);
> --
> 2.55.0.654.g21b8a5bc05-goog
>

