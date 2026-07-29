Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB55C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDalj4wabDKvXxxdpuvhrZ8sM+mh/PoM2BIg7cLyOyM=; b=0XgweQ7AGunGgTrBcGptGqkV0Z
	drQvStWg78sT+uctKEsWig2gWLRKO69YDPhit4jKHzxVHN3b3+sGMF1D7dHhCmVh6N1QXceRl2YYi
	3YinEj7d3mttwDUpb8RmI+aaxIe2DeZInap34LuCUWXXmXa4ZTtIvTF2lPRD7V3rRbOm5wrjOQrhI
	6wD8WebfTx5r/Au67n+bVoZeiOILDpy56kw86dP1Imye6W+vAR75b3FvGlPEzCsQpwaWjxgq670Bh
	8D/D3ndNk51m43vuBe82gQk6ZCWcq0Ip2bQYvqr3OomUHOWW0QLNSOU4S7qM+T7bDOtxMoCBacYSe
	chjfN2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5e0-00000008IQF-0ytU;
	Wed, 29 Jul 2026 14:52:28 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5dx-00000008IPR-153l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:52:26 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoYhwgczaYtbwGR+JLyuZgmV937FohTeO7n935YfFxqYKH0OKHFzD0oai8SUbA+MNB2cAvz4W5A1z5z3FLo2O1G@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785336742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XDalj4wabDKvXxxdpuvhrZ8sM+mh/PoM2BIg7cLyOyM=;
	b=exLgIPvIGqzIlCZtMWtnkIlpHy2g1uitdWkNYArxlGxlbmOqSr+N/CKNLirSv0onE/Xnij
	E8WiiR7jbvb/KYvoAK/jud3d6+xwBKfWwkpgOKHavDTA2fEjTcaUZVW5E/J/QriJjAa6kq
	IShl1Val3fO6G36lvVvPo9yHW/7de4I=
X-Gm-Message-State: AOJu0Yy2k8qjdpdxyqolpGJhW4SIay1TtVInYMVmgBNfPHicWw1TMOh+
	DJhHZyBWgIXiI0w6fY0f/OPp+I4k87LaMUYE5Wg7Oq923vb/Zusf1psvLHPz9MLaaVozboIiJbr
	kLT1W6P1MYLWS94dkPwOlmcfFGKisq4BayRPT0vnk
X-Received: by 2002:a05:622a:1312:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-52b2cc8596amr9690121cf.11.1785336736189; Wed, 29 Jul 2026
 07:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260729131823.2021516-1-fuad.tabba@linux.dev>
 <20260729131823.2021516-3-fuad.tabba@linux.dev> <amoFnupIKfDEzN0F@e143914.arm.com>
In-Reply-To: <amoFnupIKfDEzN0F@e143914.arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 15:51:39 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzjb+LX-+C=DkXXkVLiradjHqQN8H_df1hUVk6aoT8+vg@mail.gmail.com>
X-Gm-Features: AUfX_mwhvTt4R2cSbWIXoLFDxC4tUlnWCCLFknIFzYSOsoQTGMFyW5qhd6pEU7I
Message-ID: <CA+EHjTzjb+LX-+C=DkXXkVLiradjHqQN8H_df1hUVk6aoT8+vg@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Quentin Perret <qperret@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_075225_440308_1730FD47 
X-CRM114-Status: GOOD (  11.08  )
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

Hi Joey,

On Wed, 29 Jul 2026 at 14:52, Joey Gouly <joey.gouly@arm.com> wrote:

...

> > +/* In nVHE hyp code, registers are always in memory: use the raw accessors. */
> > +#if defined(__KVM_NVHE_HYPERVISOR__)
> > +#define vcpu_read_sys_reg(v, r)              __vcpu_sys_reg(v, r)
> > +#define vcpu_write_sys_reg(v, x, r)  __vcpu_assign_sys_reg(v, r, x)
> > +#endif
> > +
>
> Does this make sense in arch/arm64/include/asm/kvm_host.h instead? Next
> to the definitions of __vcpu_sys_reg() etc.

It could go in kvm_host.h, but not next to __vcpu_sys_reg() as
suggested: the redirect has to come after the
vcpu_{read,write}_sys_reg() prototypes it overrides, or the nVHE
preprocessor expands the prototypes themselves. A placement that
builds has to sit below those prototypes, not next to the raw
accessors, so it wouldn't group with them the way you're suggesting
anyway.

It's currently in kvm_emulate.h, after those prototypes, which is
where Marc suggested putting it when he moved the patch off the
earlier rename [1]. I'd prefer to keep it there.

Cheers,
/fuad

[1] https://lore.kernel.org/all/86h5m1o79h.wl-maz@kernel.org/

