Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A694E74902
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 05:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYJuqgstKIh0GJjfHL+Z+Y8jqbQuzP2SNZTadlMrpwc=; b=z+e7CAMFvXVhruFuOiPKp6yMCT
	WVz34siMWwuLeXOr1foVgBTIfvofMMJ2BOa1cngYV+TcprufQH/dCVTOO62aB24OPD0DE+cnzY2lx
	V7OPLcGB+42cbKeaF/RHytPxR4j1+/666Xc0fvUel69xouffy0VHeFxVszfVjBqFEORandqPle253
	WQfs1KC6bURYVReUtcNRWp9oMaBnaBxiq47H2uw9mkmJPbT+DCl6g9v1DfUD+djIH1GpBHzXxXOT6
	FJ355hFyc48EQ+eL/T1Ak9i6pM+Vp8e5mIg1uptXuqzIEjCLquOkrRqCJ+Rd5gWhy+9c9Y3tdO1ad
	nl1v6PSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHaL-0000000GS44-33hX;
	Wed, 24 Dec 2025 05:38:57 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHaI-0000000GS3A-3WfC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 05:38:56 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-37b97e59520so47556771fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 21:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766554732; x=1767159532; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYJuqgstKIh0GJjfHL+Z+Y8jqbQuzP2SNZTadlMrpwc=;
        b=P5bHe/jgNQHMYi4q0+k9FPrYkhmoyG+XL5QG1MSl6IrG9G1B7IF96ZEhsCfl6xxlwj
         PWtP0HzkHl6FA+/1CJJKkk/+nl3wvoIGSRHpxsaWMQyP8mpCN75qlk6dXikNEHTx2qoW
         oUnvUJmlLUeiMWpbUhSJ6MPAkbnpM4U3jCSOmNIxU87UoeHYRstNo7YcAPwuauyRb9CF
         LQGiKkC2zf5uw8qaWroYiQrzNZ7vxoIfitXE4y9iNCnGV0z9pVxSgbFcEB6t6d5dsTii
         2jyzF8Of8XRKobcbPLP/PiTAA1OD3tmRpiWlVJJduPymyNpZIJh2abqVJvMdLxDAHF0v
         yjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766554732; x=1767159532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gYJuqgstKIh0GJjfHL+Z+Y8jqbQuzP2SNZTadlMrpwc=;
        b=OxL8F36ia3d+/bOGSMnc4dif8qy318pR1b1nVqR91vMxMlgama5+G5v+wgu3pQRJWj
         /gG5Nscmal7TavNURM+jFQXevfx36uvYBFHk4+CqLFcyg/07iynWI8SYhuLlBNuSTrw9
         epzGsuGz0FgCKiLvOuMEhdP3jjhPmDjXUohtO9XlZIfqdmGxoAwAPoi/OF0IUo9Lem5v
         7ibXxQIlkamUIeAOx3yJ4iBtnHvHlU2WSUP+NBCikks+IVI9zGEgVWz5Eg3TtTLD/hEr
         t2LqsL181GkuLTk4IfF5tE+DudR8BtPrt6Q4axRZfpJude4s7bfi/ZmweOILzAHOxhn7
         5tMw==
X-Forwarded-Encrypted: i=1; AJvYcCVw0MwW926H9y9x6zYT1/GuX4SfVyiiRU2lHg9s8d2iCP3HPekhloAfxqv/nEY1anZyCc+Xa9C/ox87xQsYKLBG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd4+NKLSEOAd64L8ZUCmd2BkudbMfQw7PDtWayH4KK5C2of850
	ZH0NthEfcaw+tPjs41sWeKFXFxl5aFdHnDHaY33pcZdcYa/GiY5nw6wK3SZEnJu0Hiq1I571RLa
	yzlyZCQY3bFsrnTB1gdO/v+v6JRfBtgg=
X-Gm-Gg: AY/fxX4UweIRaMXsWhXiEI2pXg8RMKm/Kud4KYcJLluMCGJ3eVC/I9/QQ1ZrZgQth3c
	hDaABHFPMwyecdWVqYQKktNyFc68Z4hrMdUvhq7rjEJ+kmm5GweYa5H6QXlOrKhP5OvVu5bvWTt
	1Yn6jLe/eEphUGZjULuYscvKmH5MWTLYYwWm6s8HcqDRI77peh9HnrbkGEYEQRw3WTCkQAX7j3B
	7jBVlikBPLIFXxzoO9ys/07qrZwdGgHhKyJCq6qpICiEPJH2Td39bDpNnWUUI7vQ4lqLP/3PVpr
	ZP9+0BI=
X-Google-Smtp-Source: AGHT+IEhBbHKWWQqJ0bLZ90EcsrdJcWpLU40nsZoqwzQPtLYH3hGZjtotZ2t+Nq21znTqVIk5zZUzbsS4uHKvlFDmMM=
X-Received: by 2002:a2e:be20:0:b0:36d:4e3b:f1e3 with SMTP id
 38308e7fff4ca-381215967a0mr50931101fa.13.1766554732253; Tue, 23 Dec 2025
 21:38:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763415705.git.geraldogabriel@gmail.com>
 <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com>
 <CANAwSgQ726J_vnDKEKd94Kq62kx8ToZzUGysz4r3tNAXvfAbGA@mail.gmail.com>
In-Reply-To: <CANAwSgQ726J_vnDKEKd94Kq62kx8ToZzUGysz4r3tNAXvfAbGA@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Wed, 24 Dec 2025 02:38:40 -0300
X-Gm-Features: AQt7F2qOfdS6yP1-vW3vU0Wj_YVm_E2b3cZOlrdQ3B5k7vwUx3LT0aqmG2BtcdU
Message-ID: <CAEsQvctSY7-RQEQF2TmJU2qKPZOe9TC5g-7Jat0LQKRHYz_6dQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PCI: rockchip: limit RK3399 to 2.5 GT/s to prevent damage
To: Anand Moon <linux.amoon@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Jonker <jbx6244@gmail.com>, Dragan Simic <dsimic@manjaro.org>, 
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_213854_892104_2BA321D1 
X-CRM114-Status: GOOD (  15.92  )
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

On Wed, Dec 24, 2025 at 2:18=E2=80=AFAM Anand Moon <linux.amoon@gmail.com> =
wrote:
>
> Hi Geraldo,
>
> On Tue, 18 Nov 2025 at 03:17, Geraldo Nascimento
> <geraldogabriel@gmail.com> wrote:
> >
> > Shawn Lin from Rockchip has reiterated that there may be danger in usin=
g
> > their PCIe with 5.0 GT/s speeds. Warn the user if they make a DT change
> > from the default and drive at 2.5 GT/s only, even if the DT
> > max-link-speed property is invalid or inexistent.
> >
> > This change is corroborated by RK3399 official datasheet [1], which
> > says maximum link speed for this platform is 2.5 GT/s.
> >
> > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datas=
heet_V2.1-20200323.pdf
> >
> To accurately determine the operating speed, we can leverage the
> PCIE_CLIENT_BASIC_STATUS0/1 fields.
> This provides a dynamic mechanism to resolve the issue.
>
> [1] https://github.com/torvalds/linux/blob/master/drivers/pci/controller/=
pcie-rockchip-ep.c#L533-L595
>
> Thanks
> -Anand

Hi Anand,

not to put you down but I think your approach adds unnecessary complexity.

All I care really is that the Kernel Project isn't blamed in the
future if someone happens to lose their data.

Thanks,
Geraldo Nascimento

