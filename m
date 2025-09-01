Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2155FCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 12:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJinoXYbXnzNjHDgh/TK+DIXPD7XvP744ic5UKGRCZE=; b=mCAjL8Ly+7Fui1lfVe0Vt81r8E
	mm1te/Kk/kdU8Q2IcnAjcBXGMa8FPGq/c9SNiv8P6KpS7sZJmiQqFVQEo4T8V+6dhNVbepvZ/41h1
	K1Fm6PWuKYSK507kzRwMjJ3H7Nn6Mbp/cGjdsqCs71AuTtUeWuwl/ez0f1JVhIUwYbBWP5oP99U9n
	lyJNOGQD04pUpemdIStjMn5YcYEdgeisHaPqf2zjn+fDgTFPhWe5Zq7lSBsAMuJQm+P/a1NxpF6Uh
	KrB8wh+fkm2i/rJev3+DqpOpkXCIG8n0I8+4LFXTQJFSCSCTot0Xq2oDn8GjTLH7/Q90z5MZriQac
	Tw1/a8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut484-0000000CbpH-3VeU;
	Mon, 01 Sep 2025 12:59:24 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2GA-0000000Byt3-1Qxt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:59:39 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-71d5fb5e34cso40733597b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1756724377; x=1757329177; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EJinoXYbXnzNjHDgh/TK+DIXPD7XvP744ic5UKGRCZE=;
        b=byWqTOiIsD4/uQVdCo7mAci9rwtGh9kqXgj3Rb8i55GrZ8AlcM/7yrsuq01nYbvIiZ
         nFzDyB9Xxp//CiKjFiwBDhckGxgok0XhKpB3NJX74z8YLOpXjF0qO+nrD0O17wxFiqSg
         T6dOuDlR5iu97y6JAGURBVSuRp2UyQCu9+E82pcDCrV6UfvZn+Tm3QFh5g1N+9JiJGDk
         RrewezOCR8USE1uGy2apAqf0t7ErIzNXYs8MAJPA6J82Rl68Xp48AtTpuamk4nsVY/Ng
         SFLup+MtOEne2a0E+fanDyNisHWKWP7TpWfBlDNzF3ECFGJdLHanNx7PntOnv62VqBW+
         Qiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724377; x=1757329177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJinoXYbXnzNjHDgh/TK+DIXPD7XvP744ic5UKGRCZE=;
        b=FRvNksvdWlcezi0oGArffxY2IlA9BKatCtHb2/wT7zsr/j47z8/Jv67yXQgKB7gdE8
         h10Vut8lv3XeV0zq7uyM+iacBMpWXf+bAADfPNg7zmFiNYLY/YpiwP0jg+QflMeJILDw
         xCNNo9HANuH7tP634RmSNFvpFM6KLtO33VY1eZH9ifiHokvPrHkzFDVHkmJrcdmIYeUu
         shBuKww++a9rvjvsyQ54vCIlVxmHslErvfnOC41ZRuvu5sU/NU9gTI5iUilvBGb1MRPq
         5v621rC/lqPS6iVywCCRRbtc7QQgbnz1RUH/+6+HN/szkvJbpYmtVSMZRB4ztmVBsKiC
         47Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVLO7Bu/W7S6+sggOzYpW/7bvD/J2dd1VJiaZSxFZcKUCJ6KBYs6U5Mxq/zvY0LNhQ3lZMq5du4RhYegO4WR/wy@lists.infradead.org
X-Gm-Message-State: AOJu0YwfvBuCmoyxGSJxdgw4Cbk9wqQrA72jTjX6xcje1p7j18mV02MY
	lqrPQuWIQ9yhEQQ0RPW97AoGZsVIkgMxjheZPxiomeR53filX74CXAv05v1t0e0mJm7fwH3r3bo
	tX1qmcuq3rvSZSbBFclz4Pd5hMZr/hZVoIRQsmVtHcQ==
X-Gm-Gg: ASbGncsQClxjREOHnBkLds/LnqIcMGHuuNqA2eqC5vvrxGqVb4aAZMwbpt25OCujp48
	lSewuAp8HNGqOYZPF+u8UcnQT7n5Pg5IrS1jjtLhbJ2u9nixr+cnubIXeIjU+yNHyTTO6gDA8sZ
	4tucsoXM3mkA/KSO9Dgi43lnxMxrDlZRoNDxANFVQ7tUx2rogkI8Li3WVivzFJetpc/VccR0R4x
	kBptj3mVXr0dsHmJB8px99CuZkvfkBXOqk+DAX0zxNzf9+Sxg==
X-Google-Smtp-Source: AGHT+IG3E5X8rSS4MCzpFL4c7/+B+nTiuZn7QkYnuaa8FdJ3F1U3keZEV+jrL6NCLwW8aPKh0SfR0DXjN6ikye0mpJc=
X-Received: by 2002:a05:690c:338f:b0:71c:3e81:cca2 with SMTP id
 00721157ae682-72276337a67mr91487627b3.1.1756724376904; Mon, 01 Sep 2025
 03:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-4-5052a0d81c42@ideasonboard.com> <731ead88-8dc9-4032-86f5-7a2dd5044b22@gmx.net>
In-Reply-To: <731ead88-8dc9-4032-86f5-7a2dd5044b22@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 1 Sep 2025 11:59:22 +0100
X-Gm-Features: Ac12FXx_JRISJwP0UMdGitDY4fzYmnwpQn6tyyu_Q6GUhjhAClChc8Uz64aD8Lo
Message-ID: <CAPY8ntDz9duSU_TcqE5CPYYCmSTnvm=RgwG56qQ0xe07uzWFLA@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: staging: Drop bcm2835-camera driver
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_035938_468342_237F8325 
X-CRM114-Status: GOOD (  19.38  )
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

Hi Stefan

On Wed, 27 Aug 2025 at 20:18, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Jai,
>
> Am 27.08.25 um 08:24 schrieb Jai Luthra:
> > The bcm2835-camera driver is replaced by the V4L2 bcm2835-unicam driver
> > that is already upstream. So drop it from staging.
> AFAIK the old Raspberry Pi Camera V1 isn't supported by V4L2
> bcm2835-unicam.

The Pi v1 camera is Omnivision's OV5647.
There is a driver in drivers/media/i2c/ov5647.c, and that is supported
on the Pi via libcamera.

It does look like we have a number of downstream patches to that
driver that I ought to upstream - always something to do.

  Dave

> Personally i'm fine with this, but this must be clear in
> the commit message.Did you already talked to distributions like Redhat &
> OpenSuSE about this step?
> > This also simplifies destaging of VCHIQ MMAL, by reducing the users of
> > the MMAL API (this driver is one of them).
> AFAIU this drops the only one user of VCHIQ MMAL. So please explain, why
> we still need this API and how this should be tested?
>
> Best regards

