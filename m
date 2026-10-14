Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D727CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAZtpu7tZLidRJW+aD48BAqdK2POfMXabmeV5YjcAE8=; b=bU2RXKMy55WmJ5v/59Y/EwOR+R
	dyA/cqRmKb/bY3t6D8IgCbd36g+6njcehwSfkwCcUOu/WoSBIbPDbsJTe/Hv4sLmd4iKy7Mrjnb0Y
	tVC1cB/FGfcLvHkJykXGNxe0B+XR963qK98Ri3PRXpQdPGVbFiiuK//Y9o0HcTUyDX8s8SliNHK86
	0ZFBI+arYAx+IHqOV82KltQHihTfNYROuN3WwnrWOMzrN+wkGMXEzDjsB+6dIyzjreudDGPcdtrRG
	Bzsg9OFMdsZ3u7WHa680+qomHgK5rWcT95SA/uf/u3oZQjRDY5KGwye5TybI8QLaxFoNnJpMUXQE/
	F75k7JEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsx9-0000000Eg8u-42xR;
	Wed, 14 Oct 2026 06:59:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsx7-0000000Eg8m-2ekg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:59:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24B3343EEF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 06:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092C11F0089E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 06:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791961145;
	bh=KAZtpu7tZLidRJW+aD48BAqdK2POfMXabmeV5YjcAE8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CRs/Sp1YPRlanqNVtez8FMfw+YNQg5wonpJMpXu4fq6bHoG70Preyga3d8IiyRowU
	 2mr/YMGJvy2Tpg6mGr4huz1fHMoP3ZvS2/wTr7m1ntfjA3w2dwVgzYHUVrNJAQu0Cw
	 EITmZfqrydou8CiMHzMhM11p1iFX1EOkMPFvPxUJFRiXxDChOnVdYTsQjTUdL8rC0C
	 Lf4Pv5l8dP4Ot+mGxYpm+YPm/2EDpuI+bPrNCURD7d1QjlXouv5VKFA1iSuQmaKL+P
	 AhuQcaDKak8IsRsSCqwJJaCPB1LLqHMrK0nEG1hyESq/+bgiQzOTInQ2Ic0tE8T9I3
	 FxF46SUp8VcLg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b8f5e2ce5eso3476229e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:59:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycfcf68H6cIIabE/1KdU1iOOT1I6w5kTV6WAYtfQdqFTy+1NM8QNWugVQhGCdV5kUWwjfj0G2RaFPV2vvrclo+@lists.infradead.org
X-Gm-Message-State: AFq9FYLQW6PT8+pMeIAHFH5vz06+KD7gMZnOrHJuJvJBFGJi/ACdQJkZ
	giJhTydcERzx6W+V0ScCwJ/Oojld+t9BvJfeGpTZV3wFmm6OVIXPH3cFhiAwuOvrO8Ttj0QAcIj
	d1GOuJG2ARs8j+8hN6PHJkEGwpRKz8qU=
X-Received: by 2002:a05:6512:3e1a:b0:5b6:184c:7d9b with SMTP id
 2adb3069b0e04-5bcde6d14f5mr5713827e87.36.1791961143711; Tue, 13 Oct 2026
 23:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261012-genexis-xg6846-smp-v7-3-rc1-v1-0-a51d4afde4a7@kernel.org>
 <CAHi4H7Es9xGBUfrShXxkMJ0gK+KmO0KKxag0JXCU3wVN_UFhuA@mail.gmail.com>
In-Reply-To: <CAHi4H7Es9xGBUfrShXxkMJ0gK+KmO0KKxag0JXCU3wVN_UFhuA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 08:58:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLmOYCg8aLDoPhbj7tEPVUKLTXNBmvehnU0dyy1bX=z-4g@mail.gmail.com>
X-Gm-Features: AclHuK_cdnOQUaw87Ys2ghDBRDKkVUCpnfcTrce8oKg9ZjHyonwcQJ7bUo5_vXU
Message-ID: <CAD++jLmOYCg8aLDoPhbj7tEPVUKLTXNBmvehnU0dyy1bX=z-4g@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: bcm: Enable SMP on the Genexis XG6846B
To: William Zhang <william.zhang@broadcom.com>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Oct 14, 2026 at 3:11=E2=80=AFAM William Zhang
<william.zhang@broadcom.com> wrote:

> The change ties the implementation to a specific board and includes
> GPIO register definitions in the c code.  I suggest we define these
> through the dts itself so the code can be generic and apply to other
> boards via the dts.

Good idea!

> In Broadcom's reference design, we introduce an SMP method for this
> GPIO-based smp boot up support:
>     enable-method =3D "brcm,bca-smp"
> and implement through the CPU_METHOD_OF_DECLARE(bcm_smp,
> "brcm,bca-smp", &bcm_smp_ops). This way we don't have to check the
> board id but automatically run the smp init code using dts
> "brcm,bca-smp" method.
>
> We can also define gpio register in the cpu node along with the
> enable-method property
>     cpu-release-addr =3D <0xFF800568>;

ARM64 has this file:
arch/arm64/kernel/smp_spin_table.c

I think we might want to look into doing something the same
generic for ARM.

Yours,
Linus Walleij

