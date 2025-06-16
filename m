Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41A7C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkrvKj4WRhOO8zn50L5JIugDkJwYWJauK6qeewS2paw=; b=Fb5Jvf/KcwC+qbloXZy85jj5NX
	dcZ6eKCTwjT29F4EXnkCHAfXAvtDDRl+qywo4ZYZwS5OaszPRspnwK2WtXQ6DaPw558ebiGlUbA2X
	r1RWAo52HJ2Y+r7YjFwsaKOkl8BjF7EIhWV6BvzAPDJrn+Fb8hzTwBFl1QUjDJmPcq6nsUPq/dUUb
	gs59ybDNJar0wNR6AC1Mo0nD6uWZDU3xFoVnTOwsi35ikatY1DX33rmYSnC7XOZcAEv/Duk553uKq
	6/nA9WvQ7+VdxyT98eYILTyzAv3k9fmMzAJ9jno+/VmoFlQFV4mOp0kp+K6q9WOl5/S9g/V3WbCBK
	AHY3J/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLG-000000054kS-1YPM;
	Mon, 16 Jun 2025 17:09:54 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAxn-00000004j2g-3gWT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 14:37:34 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b2fc93728b2so3687001a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1750084651; x=1750689451; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AkrvKj4WRhOO8zn50L5JIugDkJwYWJauK6qeewS2paw=;
        b=LWpGsR8+TLCqU7bUADD3msbTYlRBh0fYMtqIPeMdoyaIjTO6wB/2alUzIh5zxBVYam
         vtkzJVOcClRNmZB5brBzhKfxzqlFCHnTGPASK/d1DU/V88t6eULJisFYrca+zA7lYO0g
         m78vheUGHmgv9Fs3KP6vRQ+eoShkZeR2l7bbCEEJWF8UEGWwZn/fgWLkkFQm0yRm9h/A
         3PiJb6xB+D9SKmnny4NZsaIW1SYhfYnzrs1UFRlGctaWogIHY9JbyWU13PqpSZ6Xn7Nu
         idqyGdlcOJkum/7608F+v5dzCM4Xhv/jV22e/gmLxUDlMLqpuhagIDsG8guz/FrBfEhb
         7WXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084651; x=1750689451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkrvKj4WRhOO8zn50L5JIugDkJwYWJauK6qeewS2paw=;
        b=jez+TlAnhSCdvdUEXlqIzPO78YbKQm2nYCMkFkoFvKpTrnCelKXSWlQNgTidPTtZP4
         QNIsCQdnNzM84NYB2Hecp4sbwDy5z0CMQudaMr6n7gpI+YOny8UUmA38roum/fvaIJSB
         PaEaw3xYtKoihiLkX3SzDU4jjb9WgLTv801KkA9LQueY1ITaogZpcBtM/zwDbVAFs0ZN
         9VKxKY9GEcZtw6kL9ynxDaJ+zgzvTj+dOSeBjbi2eXK0AsuoOgiBSZPi5ef9HegSkZ+c
         MCF7se2/VMkpZJWY5ZXwmb24vpO5/XFo7kPSDpvrriWe7/+O2uzCckDKM7X+/SOIKn1v
         cVUw==
X-Gm-Message-State: AOJu0YxkMDHC1eTG2HoCDasTXGzryLTJ4OWiIgU/pb3sZew8jYbQQ4OT
	GyT2H6xsbbJ190rUID0YO8BKGAN0bCB7jbJmmGC8ex++2uCryjQa6Dvqv7zLTpi42lSMKVMrUYz
	UC63KjOySHQ6aZi9SIVT5IPKqFlbJk5d8GBwJqysnBuBGdzLKGgTR9Krox0BWax1AdeQ2lw==
X-Gm-Gg: ASbGncugG9qT3sLewakRv1mELudWlVRGIwbFgVGh0/DsPauOp3ttaDTLjbu7U+WVPuA
	STN8FY5S1dW77fdw9OrOSsKJoOiRPgRAkOUYyDxZy/5KyYcqCHEQYVJFJbifD59Fe+zLXhqMmUD
	R5o9il4WOc/Cy3rMMMMGlgufVV8DNs+4F43xod2Eq/wmWVyQeJj8mhJKIrZLUHxcnxglyFwvprP
	rxJbfVDkD7dfjldzZ6y5XV8sWALXLun3xZH/YR1qwIJbo73j4rZk1YDBeXV6tUEgdRLC7fasc4G
	KOIXn4zYl/Bs7EuL32A+C7XFfZ+GBqIk3KxdMnKuQa36Ub055DibjGWl9I/eW+KbhS597RCl983
	fcOcrlM663PU6Q0xjZNMymnUllV6z8iGblhM=
X-Google-Smtp-Source: AGHT+IHiHWhPvC3rzDccVIiloYznB+/CDW0xPfXegwCPoIernL0gBJI4EEGAaNyjQ6pQCOBf+YUk3g==
X-Received: by 2002:a05:6a21:600b:b0:218:76dd:a66 with SMTP id adf61e73a8af0-21fbd527f54mr16043044637.13.1750084651197;
        Mon, 16 Jun 2025 07:37:31 -0700 (PDT)
Received: from zenbook (36-228-20-239.dynamic-ip.hinet.net. [36.228.20.239])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe168a4b2sm6996769a12.61.2025.06.16.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:37:30 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:40:03 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jintack Lim <jintack@cs.columbia.edu>, Christoffer Dall <christoffer.dall@arm.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix s_cpu_if->vgic_lr[] indexing in
 vgic_v3_put_nested()
Message-ID: <b5jwzhkkg2ensclxfj4uozpbibo5sgbcdm7tngharnjmqxswqc@ktywljdle6of>
References: <20250614145721.2504524-1-r09922117@csie.ntu.edu.tw>
 <aE-xyGGpHXdJ_pcF@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE-xyGGpHXdJ_pcF@linux.dev>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_073731_914499_B242AFEE 
X-CRM114-Status: GOOD (  15.62  )
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

On Sun, Jun 15, 2025 at 10:55:20PM -0700, Oliver Upton wrote:
> On Sat, Jun 14, 2025 at 10:57:21PM +0800, Wei-Lin Chang wrote:
> > s_cpu_if->vgic_lr[] is filled continuously from index 0 to
> > s_cpu_if->used_lrs - 1, but vgic_v3_put_nested() is indexing it using
> > the positions of the set bits in shadow_if->lr_map. So correct it.
> 
> The changelog is a bit too mechanical and doesn't actually add anything
> to the diff. Maybe:
> 
>   Shadow LRs may exist at different indices from the corresponding LRs
>   in the guest hypervisor's vgic, as the shadow LRs are populated
>   contiguously in vgic_v3_create_shadow_lr().
> 
>   Use the correct shadow LR index when forwarding vIRQ state back to the
>   guest hypervisor's vgic in vgic_v3_put_nested().
> 

Hi Oliver,

Although we're not taking this, I still appreciate your help on the
commit message.

Thanks,
Wei-Lin Chang

> Diff itself LGTM.
> 
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> 
> Thanks,
> Oliver

