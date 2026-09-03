Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B4CC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65LuEJG0JnTb0KkU3vGSt+goS3dod3LN2RMiLWi7F5U=; b=iq56CgPCkasKdGPJHfHoxMflt0
	OPDVoNVgCM5ndkkUsCpYqMPf/2FHZKteD1n/szmAiJn+xzj1LsC0pvr+klZvofTzJd43w8h/eRV/J
	Bpf6q/MXKjbRsRo0XfiWnwWjqhFO7mdJLXFo7A422pORgUiU7YiTmOIMPTouog7h+0NwaTBGIqT5g
	4sUpQQLHArP6aFwjrdOD3LjukJJwM5Bbr3byndSzVfIX0BniUETQVG/SP8Kl1DL1jybTvmNCe8ih0
	benXTG61QdUoG4THTutqXVj3uYeO2AOjJo5JwpvlEAEpuZab73n5Sp6jyTHSqBB6h7Nm5px0q8XjW
	271KECIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25PB-0000000HAzX-2gNV;
	Thu, 03 Sep 2026 11:14:53 +0000
Received: from out-29.mta0.migadu.com ([2001:41d0:1004:224b::1d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25P9-0000000HAyh-2LW1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:14:53 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=JInu9RYj3meTFMOjD56CoUcJTLFeKLu345HSkoY7Z3Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788434089; v=1; x=1789038889;
 b=wt8Z3tRPF1XgmhvpWH9wBlqKsDb4uGn35DYKnz6Ees5nJzref7euicgH0/F72ewXjuAOQqaO
 k+bhZ6nKgL38ta4mH16rZSOtuxnRNiV8Zu+6lTmHp4Eszlol9MHpNYdWPZnnDPFLjuapt39W0Mi
 V7rxJrQkP9/37s7gDb7XQrp4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e6dfe2d1b9a77092;
	Thu, 03 Sep 2026 11:14:49 +0000
X-Mizu-Trace-ID: e6dfe2d1b9a77092
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so5122e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 04:14:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByHMYRuN6i8k6DZ/1s2p8P9qc6uuvNTS+ST8MQAwk9OtXFgqN24zl7wgL6ov126uN7E70IJQXOH+mbeRcNkSlwU@lists.infradead.org
X-Gm-Message-State: AFuF++l11DSVR1PmOtQc7Ehp3uXfeWdegDn9CtP0MoJ9rAkqdzwtbxlb
	qwcbdpSo0fEVIta6FCkg7/GhM/W0Tj1BxfweJFolFQ6yyhLa8O+m79+uAKZcak0gQwr9nYqEvbR
	lXNbZtp43bIdr9/oy34lBJPfjdiDi4rfDx33kcIyp
X-Received: by 2002:a05:6512:2528:b0:5b4:9dba:7401 with SMTP id
 2adb3069b0e04-5b60f9703bemr75474e87.11.1788434086181; Thu, 03 Sep 2026
 04:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260903084809.2027326-1-fuad.tabba@linux.dev> <cf59d824-80dc-446f-9b1b-ac9841a96a9d@arm.com>
In-Reply-To: <cf59d824-80dc-446f-9b1b-ac9841a96a9d@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 3 Sep 2026 12:14:09 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyT=bt01sALTgC7TFFYK8HM8j7aEd0Vg40Jrn1_z-jf1Q@mail.gmail.com>
X-Gm-Features: AcwNN1UwS0XUDiblUkZ9DGKXpH34SnYOyjjK7mojy0pO5pMFvqZv9Yc3DnNoNco
Message-ID: <CA+EHjTyT=bt01sALTgC7TFFYK8HM8j7aEd0Vg40Jrn1_z-jf1Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: mpam: Document when to set arm64.nompam
To: Ben Horgan <ben.horgan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>, 
	Bradley Morgan <brads@mainlining.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_041451_844374_9F028385 
X-CRM114-Status: GOOD (  28.05  )
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

Hi Ben,

On Thu, 3 Sept 2026 at 10:55, Ben Horgan <ben.horgan@arm.com> wrote:
...
> > +arm64.nompam
> > +============
>
> This assumes that the reader already knows or can guess that arm64.nompam is a command line
> parameter. Perhaps the section name can be 'Command line parameters' with a single 'arm64.nompam'
> subsection underneath or all in the section name.

Will do: a "Command line parameters" section with arm64.nompam as its
subsection.

>
> > +Firmware must enable MPAM at the highest implemented exception level and
> > +leave the MPAM system registers accessible to the kernel, or trap the
> > +accesses and emulate MPAM as disabled. Where it does neither, the CPUs
> > +still advertise MPAM in the ID registers, the first kernel access to an
> > +MPAM register traps to EL3, and the boot fails. ``arm64.nompam`` exists
> > +for that firmware: it makes the kernel treat the CPUs as not implementing
> > +MPAM, so no MPAM system register is accessed. Set it only on a machine
> > +that does not boot without it.
> > +
> > +It is not a way to turn MPAM off. On a system whose firmware has enabled
> > +MPAM at EL3, the option leaves the trap controls in MPAM2_EL2 and> +MPAMHCR_EL2 unwritten, and their reset values are UNKNOWN.
>
> Enabling MPAM at EL3 is separate from disabling traps. Setting MPAM3_EL3.MPAMEN to 1 means that the
> values in MPAMn_ELx are used to determine the PARTID and PMG for CPU requests. At this point EL3 can
> configure the PARTID and PMG for the different exception levels and MPAM can be used in the system
> under firmware control. Setting MPAM3_EL3.TRAPLOWER to 0 is what enables EL2 to access the MPAM
> registers without trapping and configure the traps for MPAM register accesses at EL1.

Thanks, I'll separate the two: TRAPLOWER being clear is what leaves
the EL2 trap controls unwritten, and MPAMEN is what makes a guest's
choice of PARTID and PMG take effect.

> > KVM still
> > +hides MPAM from guests but no longer enables the traps that stop a guest
> > +from using it, so a guest may be able to choose its own PARTID and PMG.
> >
> Shouldn't this also mention that the MPAM_*_EL1 are not save restored and so if the traps aren't
> enabled provide a side channel between guests.

Yes, I'll add that KVM does not save or restore MPAM0_EL1 and
MPAM1_EL1, so what one guest writes is still there for the next guest
on that CPU.

I'll send a v2 with these once others have had a chance to comment as well.

Cheers,
/fuad

> Thanks,
>
> Ben
>
> >  Reporting Bugs
> >  ==============
> >  If you are not seeing the counters or controls you expect please share the
>

