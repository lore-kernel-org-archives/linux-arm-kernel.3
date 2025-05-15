Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D397C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+K0vt/UsfM3vUNh3n2feDqNw5L/kOjFVTMJKG3X0A0=; b=ncgTKVx/X60rc+LKPgpXQmEPx5
	OU0sIPTuhX3aV201nSrSljOIiKB3HCHlbu2WsXuNxKoCRPRl/IYgUqx02GAPYvnW3/LnEXUPbQ9Yt
	w6rMBUCW/UnKBHx/yH5bp7qdLqE7pasItgJGmdZ7s5N4KDbczbETNKFrcgP0y+2ppJNDkYRdhNbGB
	f/DMNMGrpZz+SA0xNiJGglKXL5JmNfdmIWfNOr8PRlQT2Z2fhV1ElIkgBADKWtWJMX1/+qYAEX06E
	VdJCig6xS130n1X0enB/gEgKBDFlMbanqPHMiopeZS9eQg/FkZ3rI6bvEU5iSmwljTL899bS4yfeQ
	pawY8lUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFayl-00000001AMG-0YCL;
	Thu, 15 May 2025 15:58:39 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFawD-000000019Uj-1kMG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:56:02 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-48b7747f881so341421cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747324559; x=1747929359; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+K0vt/UsfM3vUNh3n2feDqNw5L/kOjFVTMJKG3X0A0=;
        b=qWdXoOOAwSH+B3FKDRoyhrnAhlbTwL16H66Et9glEcHMmG0OmnltBg4UETmHG8lHDS
         XWPOWS0tKZt28KIRe+jEO44NnvVRJqkZr2G7G+rCPZXYD9v3smjJI/vkPt0fAp33Xdhf
         itwZASvsFHDTYDfbiL9M/A6DVwsFqnaJk/cVbdJOq9akr5RTJUXw5UtUcZyt3IE4Cywx
         5RpgqtRyoi8A+u6RrgnIYJPFwSpSkb6rGTIqKSToOpk9twl2lJ/AbOVC+aRyQqBokScO
         hBdHKRaZaIF/T/EU8r5tXII0/eo8WFFO8fJPMnMo2RtR26/MLIq6NDHji5UQt7/dERYp
         z9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324559; x=1747929359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+K0vt/UsfM3vUNh3n2feDqNw5L/kOjFVTMJKG3X0A0=;
        b=gRDUZ+1nnvGk9nlkRAi2W+hW1iaM1dup9Zoelkz/FqSPwTk3S/Iwr2X+iCzbg3sv/M
         XBYBeRRqVyou7ckOI4/iH4BkpQ/YhETj4yOUA9d+xL5KOnvZIr1HWfMNUtiwIZkZXUvg
         0mR7wWeAE7lRIeyldSL9PMsxJRTvagxMDz+S//2pncHO9BgQd60BNWCaeqxkR4QCdD6T
         epotLagap0au/o3XAaOXZn05qSqnJjCh6WqqVY/v3YBf6y2b3w5WlQHEtUdBNemPMYaH
         +GMii6Lq+P0xmFPcOQrshbe/DWTEyZFqDxOB6+ferAbe+cblHjyauWdYVj0ZuoPAgk+a
         J6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVACtnMM9KXHVKpx55KQc38z/OpzvDvtyoXRxYfHM9Gttg/eTLyngQyLzSifdSu7dBx1v2JuGG6WLRIfHydQ7tr@lists.infradead.org
X-Gm-Message-State: AOJu0YxxK+NOHHT5L+gRp8oSpxdWFIZTX1R8mzocoPCEDfOMG/lt1HsG
	0DAj7ChiOJlblxM6x0Z1aQH/EmolY0XCGqPu196+UnHzJpl7fkqJ4HUS4QgeFX4AC9UEKbvP69H
	iVuppC8IDkkQEIiRghAYAbYnHVuf/NT3kLmAujPGY
X-Gm-Gg: ASbGncuQU9c15F72O2EeqeffagC/Mpgf+ADuf/dfiHp3LwRAFEJYtGaw3pqmdUfZK2U
	Fv/PN2RB5/BuoYn3kRBcdO5R2Ypt0m6/gasD2PetR583i8wNOkdfPyMP6KL+7ioumJ3lajoji14
	xitVy6EIklFVqr43eb1m10tdO1UQkkrzHtziWOMty7ei9L4wBpfnYKl6A5h1/1lho=
X-Google-Smtp-Source: AGHT+IGE8aOMfceY42fJdDmnr6JiZyRmyYUbEN4lifv+BrH+R9XF5r2WJo81r1w3ZWlb4E8sxeUCVV5r7958jw/lsCE=
X-Received: by 2002:ac8:7f55:0:b0:47d:9e7:91a4 with SMTP id
 d75a77b69052e-494a339e50cmr3395421cf.27.1747324559128; Thu, 15 May 2025
 08:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250514192159.1751538-1-rananta@google.com> <5d204cf7-c6a0-455c-8706-753e1fce3777@arm.com>
In-Reply-To: <5d204cf7-c6a0-455c-8706-753e1fce3777@arm.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Thu, 15 May 2025 08:55:47 -0700
X-Gm-Features: AX0GCFtGa6LDhgwrs8UTR4zlPfPiOcKTMSK-2-OfwRKhnoGtsBeWQpI8tPkyL4U
Message-ID: <CAJHc60w1rYc9guoideuKpKaukuCyvxu3S7Fidoy3Lh94+_xDiw@mail.gmail.com>
Subject: Re: [PATCH 0/3] KVM: arm64: Allow vGICv4 configuration per VM
To: Ben Horgan <ben.horgan@arm.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Mingwei Zhang <mizhang@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_085601_471757_9AC7FA78 
X-CRM114-Status: GOOD (  21.36  )
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

On Thu, May 15, 2025 at 3:30=E2=80=AFAM Ben Horgan <ben.horgan@arm.com> wro=
te:
>
> Hi,
>
> On 5/14/25 20:21, Raghavendra Rao Ananta wrote:
> > Hello,
> >
> > When kvm-arm.vgic_v4_enable=3D1, KVM adds support for direct interrupt
> > injection by default to all the VMs in the system, aka GICv4. A
> > shortcoming of the GIC architecture is that there's an absolute limit o=
n
> > the number of vPEs that can be tracked by the ITS. It is possible that
> > an operator is running a mix of VMs on a system, only wanting to provid=
e
> > a specific class of VMs with hardware interrupt injection support.
> >
> > To support this, introduce a GIC attribute, KVM_DEV_ARM_VGIC_CONFIG_GIC=
V4,
> > for the userspace to enable or disable vGICv4 for a given VM.
> >
> > The attribute allows the configuration only when vGICv4 is enabled in K=
VM,
> > else it acts a read-only attribute returning
> > KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE as the value.
> What's the reason for the cmdline enable continuing to be absolute in
> the disable case? I wonder if this is unnecessarily restrictive.
>
> Couldn't KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE be reserved for
> hardware that doesn't support vgic_v4 and if kvm-arm.vgic_v4_enable=3D0,
> or omitted, on supporting hardware then default to
> KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE but allow it to be overridden? I
> don't think this changes the behaviour when your new attribute is not use=
d.

KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE is reserved for the exact
situation that you mentioned (no GICv4 h/w support  or if cmdline is
disabled/omitted).
Regarding defaulting to KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE,
wouldn't it change the existing expectations, i.e., vGICv4 is enabled
if available and set by cmdline?

Thank you.
Raghavendra

