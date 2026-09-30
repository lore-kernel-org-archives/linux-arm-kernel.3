Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CFACA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 12:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0RmXNnXCxeVohZ66oOPYxcuOud2wa1FSlJwADS8egM=; b=je9x5j1gf13UuIcB0+Kuo1cA4U
	kTonZkr36qvIEuHuasjTOd9t4vSLszf9LmxR9J+keEXebRuG1pjKEymWzOL6e50zpzG035MT7atD1
	eCmDyxDknKuiANiCpFjWYlY6JaZ54oUNnh3v4akzgzEX0xxBE2ltbtQrhgXD1WnKNBgHRR6X9Hnvq
	9R5dwcV0fzVp+pTwIL2aFBLmB6pEfLHlrRM2WxId6eAjxGoT8KtwYwelTUAbgfyzutUy8b11ZZLlp
	3fRYLFU2eYuGp0KVk6I9WtJXEGK0yBkj7VJJf9u0Gqkhpur0pdaUXJ0xBazY/h1EqQjzFOoC1CzNj
	U8m/+BZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtWr-000000060OX-1n1X;
	Wed, 30 Sep 2026 12:35:21 +0000
Received: from out-110.mta0.migadu.com ([2001:41d0:1004:224b::6e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtWm-000000060NR-2Otj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 12:35:19 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=5jJpaYHmzwnaHuefeCeSgSHSsu0Ck7lHvt0zzvmE6Jk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790771714; v=1; x=1791376514;
 b=cZ0omPbHlpq92s1zLPZNjNXOXK4Z3KLC4IzVooMwUS5qBvFEUGN4ER1VayEJ0rj2iSbF66RV
 xAXXm6hI6gKk62A2hTqdYvUybfstmjrW8tnckQwCr8Nt7D1cmc+HRRigCm6Frj230/Er/oCmtRi
 qVyIMC5BTDINjIbuSlGYly80=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5214a99a2885709c;
	Wed, 30 Sep 2026 12:35:13 +0000
X-Mizu-Trace-ID: 5214a99a2885709c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b8f42bb8a9so527e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 05:35:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxfPX9NiQbbkapausKRH6365yJaiv28apRtrRJ9+ox8DAh6NqRB7ArtsPWB1FGuc3dTB+tXR3iuPFIlgR4mRSTd@lists.infradead.org
X-Gm-Message-State: AFq9FYIBz50Ok3mQ5DcO5X1bAyVA9Fft7GdibTPz+NkGlpgOVK2Ko4P/
	Qnu9rDYiqdQEqSenJ+Roe/jkL/+oe+G84QE3w63iCVIumXDWoy6vAujHmumYi+8UIbqr874n7Qy
	Yzm6anCWwXOJcdOxoCNhMw7OWnpo+NI9NIF9sVv+6
X-Received: by 2002:ac2:4e14:0:b0:5b5:e890:1953 with SMTP id
 2adb3069b0e04-5ba3d1a32bdmr110742e87.12.1790771708519; Wed, 30 Sep 2026
 05:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260929093548.3598547-1-maz@kernel.org> <cover.1790708299.git.fuad.tabba@linux.dev>
 <e6bf4bc51a311df19866a0ee3e27970846257b70.1790708299.git.fuad.tabba@linux.dev>
 <861pab3p5s.wl-maz@kernel.org>
In-Reply-To: <861pab3p5s.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 30 Sep 2026 13:34:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzP01b4J+ppK9fq-=5Kh-kEfynk0YfDmg57H7NekWHD=Q@mail.gmail.com>
X-Gm-Features: AclHuK-qXXX5RGymd7eG9Ryi-Ik6oairQlvSl5zFzxSRfF9xO6C1aISVYLK76aY
Message-ID: <CA+EHjTzP01b4J+ppK9fq-=5Kh-kEfynk0YfDmg57H7NekWHD=Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] KVM: arm64: selftests: Add an ITS MOVALL test
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Yuchao Zhang <ndaugoing@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_053517_296273_3768E613 
X-CRM114-Status: GOOD (  16.23  )
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

Hi Marc,

On Wed, 30 Sept 2026 at 13:21, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 29 Sep 2026 20:04:52 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > Map LPI A to vCPU0's collection and LPI B to vCPU1's, remap vCPU0's
> > collection to vCPU2 and MOVALL vCPU0's LPIs there, then inject both. A
> > must be taken on vCPU2 and B on vCPU1. KVM's MAPC handling already moves
> > A to vCPU2, so only MOVALL handling can move B: without "KVM: arm64:
> > vgic-its: Fix MOVALL handling of source redistributor", it moves B to
> > vCPU2 as well.
>
> MOVALL is about moving the pending bits (see 5.3.13 in the IHI0069H.b
> spec).  Doing MOVALL first and only then injecting the interrupts
> doesn't quite check the MOVALL requirement. That doesn't impact KVM
> itself (we don't use pending tables at all), but you probably don't
> want to hardcode implementation specific behaviours here.

Ack.

[...]
>
> There seem to be a lot of commonality with the existing
> vgic_lpi_stress test.  I'd rather we make this test the container for
> most ITS-related tests, instead of coming up with new individual
> tests.

If you think this test is worth having, I'll respin v2 that way.

Cheers,
/fuad

> Thanks,
>
>         N,
>
> --
> Without deviation from the norm, progress is not possible.

