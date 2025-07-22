Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC06C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kdf8X4J/jcert7Oy366J013o511ypI3G7B5H2prGBPQ=; b=JW22bEhY0oFYIPrfSXWumF0uM7
	o8QjO39iSh38jDmKiMQgzcrmDug+8f1EzBLQ2riL7E8/EeEqwQr28lOeovcxgBRvE0GV6tQg0tQM4
	zzDqmx6VUpskS2v+RF4A65urXiKVXrwhDGgTIl5tWjcYTxYbt8O73QgS5rwr/lSq82TV8JbbEsQnY
	6exQRRf548vsKE+AShH+uIMYvNWGxqDt8XR7pCO/0bVY6Bilux66Y7vnZdjeLqkRdlrvBvI2DT+OL
	Tn3bZelT06NIsQMFmM1vSetqJIhiJ4jbjjXa3ObJ0e5DbO+sEn/nK+FAZYZMddEHDrZ4ztVbTAT9/
	KSuj64qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFfP-00000002zb1-07yf;
	Tue, 22 Jul 2025 16:16:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEWa-00000002oFj-296k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 15:03:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AD6F6A56212;
	Tue, 22 Jul 2025 15:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF76C4CEEB;
	Tue, 22 Jul 2025 15:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753196603;
	bh=kXPT0dANIkrJJY1VuefhAj1+pXyPTF/bsoGD7gD8RZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bxvFj3Ids7b5ooeDjHKGD+kxXcO/wCmcOJUTUv+9O4ljd/fMgmlBWSkkNk6lP+VH2
	 Dv6d+/9uw7ecXZ4YTO3Kl036ISUbGBztHVqOYvF4Ap7a9napJt1E5bYBBiK403YiK6
	 Gof5xNITzx1V4i7n1S8R/aFOqN9pgO7eAeO/IaT/oF6Kvy9d5iqY9IC350JAQEefF+
	 Kg9ldnZreptFPNqnyT4Ooi7IgSxESJ2X3Im0QQsm9qL8rQNc/qUBx3MDQI5bz/yNA6
	 0q33fmsR3m21zc+YxPqJSVT10XBF597UISvKN6EHl8SQA2v4MdZ32wvcue7R8Fv6p8
	 JnnQhHwwj4otQ==
Date: Tue, 22 Jul 2025 16:03:16 +0100
From: Will Deacon <will@kernel.org>
To: Per Larsen <perl@immunant.com>
Cc: perlarsen@google.com, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, ahomescu@google.com,
	armellel@google.com, arve@android.com, ayrton@google.com,
	qperret@google.com, sebastianene@google.com, qwandor@google.com
Subject: Re: [PATCH v7 5/5] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
 host handler
Message-ID: <aH-oNE4xTakicyC_@willie-the-truck>
References: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
 <20250701-virtio-msg-ffa-v7-5-995afc3d385e@google.com>
 <aHpRvBO864x1vvqP@willie-the-truck>
 <25ba5929-79c0-40b8-b529-79a37914605d@immunant.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25ba5929-79c0-40b8-b529-79a37914605d@immunant.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_080324_680499_B33B388F 
X-CRM114-Status: GOOD (  31.85  )
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

On Mon, Jul 21, 2025 at 03:43:42PM -0700, Per Larsen wrote:
> 
> 
> On 7/18/25 6:53 AM, Will Deacon wrote:
> > On Tue, Jul 01, 2025 at 10:06:38PM +0000, Per Larsen via B4 Relay wrote:
> > > From: Per Larsen <perlarsen@google.com>
> > > 
> > > FF-A 1.2 adds the DIRECT_REQ2 messaging interface which is similar to
> > > the existing FFA_MSG_SEND_DIRECT_{REQ,RESP} functions except that it
> > > uses the SMC calling convention v1.2 which allows calls to use x4-x17 as
> > > argument and return registers. Add support for FFA_MSG_SEND_DIRECT_REQ2
> > > in the host ffa handler.
> > > 
> > > Signed-off-by: Per Larsen <perlarsen@google.com>
> > > ---
> > >   arch/arm64/kvm/hyp/nvhe/ffa.c | 24 +++++++++++++++++++++++-
> > >   include/linux/arm_ffa.h       |  2 ++
> > >   2 files changed, 25 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > index 79d834120a3f3d26e17e9170c60012b60c6f5a5e..21225988a9365219ccfd69e8e599d7403b5cdf05 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > @@ -679,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
> > >   	case FFA_NOTIFICATION_GET:
> > >   	case FFA_NOTIFICATION_INFO_GET:
> > >   	/* Optional interfaces added in FF-A 1.2 */
> > > -	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
> > 
> > I think that's the only change needed. In fact, maybe just don't add it
> > in the earlier patch?
> > 
> > >   	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
> > >   	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
> > >   	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
> > > @@ -862,6 +861,22 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
> > >   	hyp_spin_unlock(&host_buffers.lock);
> > >   }
> > > +static void do_ffa_direct_msg2(struct arm_smccc_1_2_regs *regs,
> > > +			       struct kvm_cpu_context *ctxt,
> > > +			       u64 vm_handle)
> > > +{
> > > +	DECLARE_REG(u32, endp, ctxt, 1);
> > > +
> > > +	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
> > > +
> > > +	if (FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != vm_handle) {
> > > +		ffa_to_smccc_error(regs, FFA_RET_INVALID_PARAMETERS);
> > > +		return;
> > > +	}
> > 
> > Why do we care about checking the src id? We don't check that for
> > FFA_MSG_SEND_DIRECT_REQ and I don't think we need to care about it here
> > either.
> FFA_MSG_SEND_DIRECT_REQ is handled by do_ffa_direct_msg [0] (in the android
> common kernels, I'm not aware of efforts to upstream this).
>
> I patterned the check in do_ffa_direct_msg2 off the checking done in
> do_ffa_direct_msg. I pressume your reasoning is that this check can
> never fail since we pass in HOST_FFA_ID in kvm_host_ffa_handler. My
> thinking was that we do need to validate the source ID once we start
> using this function for requests that come from a guest VM. I could
> of course add the check in an android-specific patch, WDYT is best?

As long as upstream only has one ID for the whole of non-secure, I don't
think it makes sense to check it. So either we drop this patch or teach
upstream about different IDs, which is probably a separate series.

What I want to avoid is upstream becoming a frankenkernel comprised of
random parts of Android that don't make sense in isolation.

Will

