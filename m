Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09E6C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 06:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wF4cOYbAGgO/RufcLN3HIyG7NCa0ScnR/GNeXKWmqEY=; b=102z5NUlNAb49P+RQ0PrSg02kz
	l5E4cMC/M58dYnOb6W9pTD3mayYk72JlUZj7kO65HGjkw58OrRB/KBnwqxq9Xra5xnoD/s/SN99Re
	RJQz89ewSjWn9WB6eoGygmfxqt2j9sNsqhyl6UCBKUdEzZNVBm62bYrCv2D3cw2XaXWpeWQLWAU4M
	/yJDaPAhzLtx0Qr2BmlSl2vj5zd4TGOL8Z+nt4j0aO3eOZxZynaMHL4J474Q/JHs/AdZ7KeoL/JX/
	a2HHYQmk/J05PGfelddn0WiZm4C5E9As0H9OwahB8ITTsut9R3534TokDPkkw3ilciESnVIbzrVW7
	uI9Ub51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta7Ut-00000006yBi-3hCb;
	Tue, 21 Jan 2025 06:12:23 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta7Td-00000006y8e-10bf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 06:11:06 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2a3c075ddb6so2936341fac.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 22:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1737439859; x=1738044659; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wF4cOYbAGgO/RufcLN3HIyG7NCa0ScnR/GNeXKWmqEY=;
        b=NWig+TU3mc5c/M/weEP1rsKLDU2okhqlweh07mzXITtp9uImA9Lq4f0YhS3vkHjvi5
         0Qp7hU6XXkzesGqt2i9jv6c2UWc/LfqG0uou/KjH0NQ2ClDSAAURP4mpP/To6MyBcPhH
         UyJrfGPXoyPFHNAEz0R6D5SNceMpIz5ik8iL8yV9jjoZwm/8KSJdtFuEHgX37YLyz0p9
         QEWpHDqhcnqEmouJRK5NguPqAmAMUsceUz7C9CHZLRPDa0ah+/qVx9ClVDZaBwHAfyw2
         vHgkEpD/mxOx1d+OpOYyxBFU4uNyNSRIOuXPPhWDPMo/tNAtCboAY7599G64UekZzw3l
         yNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737439859; x=1738044659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wF4cOYbAGgO/RufcLN3HIyG7NCa0ScnR/GNeXKWmqEY=;
        b=dcspLf7cVH4IJEw365IA2p/KGGayFJfD4ztepaaSx+vv5cfk2rJMcxxd/KTYv6tEqU
         YkcviyZKRm3+B3IbiRyCTikfW5zknOEhygfLtIpGVmGZMy6FEzc0JkiYPEyaIgDkMyOS
         boiDLbtnsFwSLQObqcpN6eB97VmQ117C81gbE/VHifYlIpT3cq+WdLxdoEgm2fSfgDPw
         UMB5V2w7unDvlB7YKXNLlZfZca1ti3+McIVWzm5i/So6ipz8l3iPPy+ufia/CxXZMqmW
         C/IZcS2wE1BugNgf1cWr8RI/MBzeXXLHq2E1OtZHxgw7Csqhbz2XBV0WbFhBXsI9+0hW
         fX/A==
X-Forwarded-Encrypted: i=1; AJvYcCUKGYDdpUYHcJHc1uLfV2Bm6n32lnZ8RDa3qxUyJ87dh4S2Nef+BLA3hv/oi3fLUChFrXtnxji/KkFRe3W3Vpv2@lists.infradead.org
X-Gm-Message-State: AOJu0YxNZR+EkMJYS7waszjs23ZjLLkZiHOitp53Bt3hoIJ12qEhFHZV
	MjOcQ9s3Rxh6CvOgye4MxodOrwXJVhYr6HKjVrKEbsOLVkQ2+TYk5ZpBChffkByL3z7HLcBkpAT
	PFyxdDNh9L/ZSo+gU3eKKtmJyrXz+8/1UVa7ywk5eJyYc/0HeX7LLi6vAr0oIQ1Ey2aSUVIjVIx
	BuL8Nu3Q==
X-Gm-Gg: ASbGncsVq83rxeGSWGKufg4W/bJnZg8KJh7mKYITenLekmRRFgsdZ3xdNqelNWGvbZ8
	9POVrvSxDS9/i5XxY/Rm3FRI06JSyfSOEqfvvFtNkyTNwIeameFwqoxrD/mZF8vq2pqO0aCsbWw
	D4ov1ArDQhItRZucZv+qwuDY3XH4TsmInuFxWrCIHEdtvIckbLtBHJlK49MjkPCUAnh33FGbVxf
	GKXoxdRfhSIjByfFgvvCcB+TklCL/H+EPv51Hl1vAolblbe84Ufbf4uUyIKkYzKWMp1FGVnSgEW
	aWGP/LuD30GbKs/dHZ54tdOR65a7htsV
X-Google-Smtp-Source: AGHT+IFYx8DTwR4EYN24qsSl35fQVXwjk20eSy/eyrx/w4w7hv/zybodC9ah8qtt+C9HHOtDYV5LZA==
X-Received: by 2002:a05:6a00:3487:b0:725:456e:76e with SMTP id d2e1a72fcca58-72daf94f68dmr21324015b3a.6.1737439413834;
        Mon, 20 Jan 2025 22:03:33 -0800 (PST)
Received: from zenbook (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8b3dsm8465180b3a.95.2025.01.20.22.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 22:03:33 -0800 (PST)
Date: Tue, 21 Jan 2025 14:04:26 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Bjorn Andersson <andersson@kernel.org>, 
	Christoffer Dall <christoffer.dall@arm.com>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	Chase Conklin <chase.conklin@arm.com>, Eric Auger <eauger@redhat.com>, r09922117@csie.ntu.edu.tw
Subject: Re: [PATCH v2 09/12] KVM: arm64: nv: Propagate
 CNTHCTL_EL2.EL1NV{P,V}CT bits
Message-ID: <2uvoet55pchhcwafgdkcjca5m4mrvtwpgbmg4gmltimv62oauo@p4cipsni3a2q>
References: <20241217142321.763801-1-maz@kernel.org>
 <20241217142321.763801-10-maz@kernel.org>
 <qbmqsm3llnpy2t4ig3uyggkapwlbox2wnfu52gksbhcq4vfpqx@dz5bbn3asn5s>
 <86wmetv57c.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86wmetv57c.wl-maz@kernel.org>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_221105_282650_0C166035 
X-CRM114-Status: GOOD (  34.35  )
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

On Fri, Jan 17, 2025 at 03:19:03PM +0000, Marc Zyngier wrote:
> On Mon, 06 Jan 2025 02:33:39 +0000,
> Wei-Lin Chang <r09922117@csie.ntu.edu.tw> wrote:
> > 
> > Hi Marc and other KVM ARM developers,
> > 
> > I have a question while learning about NV and reading the code:
> > 
> > On Tue, Dec 17, 2024 at 02:23:17PM +0000, Marc Zyngier wrote:
> > > Allow a guest hypervisor to trap accesses to CNT{P,V}CT_EL02 by
> > > propagating these trap bits to the host trap configuration.
> > > 
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/kvm/arch_timer.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> > > index 6f04f31c0a7f2..e5951e6eaf236 100644
> > > --- a/arch/arm64/kvm/arch_timer.c
> > > +++ b/arch/arm64/kvm/arch_timer.c
> > > @@ -824,6 +824,10 @@ static void timer_set_traps(struct kvm_vcpu *vcpu, struct timer_map *map)
> > >  	 * Apply the enable bits that the guest hypervisor has requested for
> > >  	 * its own guest. We can only add traps that wouldn't have been set
> > >  	 * above.
> > > +	 * Implementation choices: we do not support NV when E2H=0 in the
> > > +	 * guest, and we don't support configuration where E2H is writable
> > > +	 * by the guest (either FEAT_VHE or FEAT_E2H0 is implemented, but
> > > +	 * not both). This simplifies the handling of the EL1NV* bits.
> > 
> > Previously I was not aware that KVM ARM has these constraints on guest's
> > view of NV and E2H, so I appreciate this comment very much. However,
> > after digging through the code I could not find anywhere where these
> > constraints are enforced, for example initially I thought I would find
> > ID_AA64MMFR2_EL1_NV being zeroed in limit_nv_id_regs(), or HCR_NV added
> > to the res0 mask of HCR_EL2, base on whether FEAT_VHE or FEAT_E2H0 is
> > available to the guest. But seems like in these places the code applies
> > constraints looking at the host's capabilities, not the guest's.
> > Do you mind providing some pointers for me to investigate the code mode?
> 
> Where have you looked?
> 
> These constraints are enforced in the kvm-arm64/nv-e2h-select
> branch[1], which is pulled in the kvm-arm64/nv-next branch[2].
> 
> The NV support is split in discrete series in order to make things
> easier to review, but you need to have seen them all to somehow
> connect the dots.

Ah, that makes sense. I was only looking at kvmarm/next, and wasn't
really sure what the other branches are up to.
Thanks for telling me, looks like I got a lot more (complex) code to
study. :)

Sincerely,
Wei-Lin Chang

> 
> HTH,
> 
> 	M.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-e2h-select
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-next
> 
> -- 
> Without deviation from the norm, progress is not possible.

