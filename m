Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C54D37E2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 13:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iV2zIwFS7NHR+Qp/+VWDRZd4JeaS2I3vbQOZ53pHX20=; b=XqwjPbjvCi/t19ywV/dABNn315
	xJWIAZ6CpnmqBs3O08HdK5qbqKXFU8DZ6djWLvrkFOJAZlmJbIZixtoUXwOC/OhrmLCqxQwsaBWPf
	gr7lE0xD//HWY8S+G7UzmH3gPcaoX6IgcaprmnjVEz06St2LvD2ann6gk3sSKNFSiwlnuDjDXhMeB
	eYRBMx9NeP2t8/5jVx4mBH0QptuIxi/CMldbTBxmZKozR2FEbiNkowyMvxI18lnrqhYHXiqO/mYU2
	r7ysj0DI2MR1L7xnuy8BfXHWTSf1AfS1IEXmn+NyCo6JumI9srO3Z/og/FFOVx+YnlphZfEu4fr4D
	D6As1FQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg13S-00000009LpJ-2ZgH;
	Wed, 14 Jan 2026 13:36:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg13R-00000009LoL-11jt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 13:36:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CB72600AA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 13:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E13C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768397816;
	bh=iV2zIwFS7NHR+Qp/+VWDRZd4JeaS2I3vbQOZ53pHX20=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ae/SLp+z8fcLXH7RjdXP5OAlh7q/HTebZf2fJPxbwc15QolLGGVph0dLQBokF4x/Y
	 xvDxihJvfZC0zAng2G6VQSKu2JeoFzWDcpO9YokI6i1QQeh5s4Eb4dzzJOtwGW9s2k
	 /dpDYtxCK2yJ5OPgbY23PqJe5iv+oNC9WIQXT1TxJzrF+q6fo5bGq6HG6A3VmBEuuF
	 tSdo5EXyexBqO5oiRGBarXJyHxVSCarKFySdMwlhkxU+PH5d10tzEnIZTBPtF8vYyJ
	 Q/aOQAakcB3L3QEMDUHSrY2cO+MNcBUDPPqpzSxhlgIIFZj5DOc6UYfEhv/fgQCVT3
	 Dwmt13t+b2lAQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59b76c092acso5902591e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 05:36:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvCsgfP3Dj452u56R6GLy6sqNoTOyq6PRPQx/LCUlAQY9qxnF44f27CBkluaQx8jAzfBI5+t8I+UoC/3kTNmfM@lists.infradead.org
X-Gm-Message-State: AOJu0YzPm4Q8Uj1usIToi7XYEKTGRimFQSuBzj8ED1piix35dGHZMora
	V8HfTbEtXWdX62F7/ms2Xl7R0SCoI30zmVfXu6B+hF0NA42iEF/JTGsR9c2R6+8EkUlfVAWYx2s
	M8BP04qB7GBjW4DKRk7oggrk3PCfgz+ihDbzicHw3Fw==
X-Received: by 2002:a05:6512:3e10:b0:59b:70e7:4121 with SMTP id
 2adb3069b0e04-59ba174d90emr764517e87.36.1768397814581; Wed, 14 Jan 2026
 05:36:54 -0800 (PST)
MIME-Version: 1.0
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <aWYiJbtueA8g3srn@ninjato>
In-Reply-To: <aWYiJbtueA8g3srn@ninjato>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 14 Jan 2026 14:36:42 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeDZf=J4L8M9QTAP+JXGNUFfs1_HyD3fbMOQ18AR29GYw@mail.gmail.com>
X-Gm-Features: AZwV_QiYLMexanAhF-BM1IfGaqguSnDiL1N1XOc2vJYCEMxqR8GZei0usNH3TDU
Message-ID: <CAMRc=MeDZf=J4L8M9QTAP+JXGNUFfs1_HyD3fbMOQ18AR29GYw@mail.gmail.com>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org
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

On Tue, Jan 13, 2026 at 11:45=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Bart,
>
> > can be *revoked*. To that end we need to hide all dereferences of
> > adap->dev in drivers.
>
> I haven't actually tested the code yet (but will do so this week). But I
> already want to feed back that I approve of the general concept of
> abstracting away drivers access to the struct device by something we can
> then convert to SRCU in a central place.
>
> This mail is to discuss the timeline of these series. My preferred
> solution is to aim for inclusion right after 7.0-rc1 is released. That
> gives me enough time to test and you some more time to address review
> comments. Bold wish, but maybe we can even get dependencies into 6.19
> before (like the i2c_dbg rename for the saa7134 driver. Is there a patch
> for it already?).
>

FYI: I think the road-map will look something like this: v7.1 will get
new interfaces and most controllers under drivers/i2c/ converted as
this can be done within your tree exclusively. For v7.2 (with the new
interfaces upstream) we can think about converting all i2c controller
drivers treewide to the new helpers. Once v7.2-rc1 is tagged, I would
try to remove struct device from struct i2c_adapter locally and send
it to autobuilders for testing. If that goes well, we could create
struct i2c_adapter_private or something like this and store its
address in struct i2c_adapter. This new struct would be controlled by
i2c core and contain struct device. With that out of the way, for v7.4
we could think about adding SRCU into the mix (possibly using the
then-available revocable).

If all goes well, we should be done in early 2027. :)

Bartosz

