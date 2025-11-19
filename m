Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47EACF3185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 10:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajPJXKSb6EvakAv/OuhuRvH8YRFIbHznazB/0gEJ+2M=; b=tktU3Ti0mhWSZvWnNFd+3X7n2P
	Z5UNlyJMOYBF+HrT4Jt8gq0EwweHXek3tsEzDRSnj71Rvl63zEugu5i/bpvdU3KwPVzG/PI8OUxi9
	LRX+FL9EjorY1d34wT1B9ZYztIMQy+9mRfoURNrqtcgwcA0o/TO4cjSAICRAUtU0VEJehOVV9Xmha
	liArxrcM/NP/QwXO19/qNj+aHWB4T1tF+pOv9ALoa0BfArNsaXJ7AGIZyt6WjCUAMSTxAbh2gL3U5
	D/O2+Wqltm9jpzjxi/g14ilpJjLPQeh6KWdh2j6pVx7nHA3+82gx2II5Q9vXk3Q5KUb4+QBJGQ9nP
	4+94CCbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfZs-00000002ydd-3Cj0;
	Wed, 19 Nov 2025 10:38:20 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfZq-00000002yct-0Ngn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 10:38:19 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4edb8d6e98aso318761cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 02:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763548697; x=1764153497; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ajPJXKSb6EvakAv/OuhuRvH8YRFIbHznazB/0gEJ+2M=;
        b=yr7SqFYWZ1X4dVXA/tpjGKr4DdqDoPDljihb6BeYwK2hY4dKyqo5bmy82OA8m2zcGS
         hinzwABRHPHxkk1+xZje/tRZ7bFoxpSV0pjEprpVEaLwHJtwzPIHatn77ZZH8kIlFbFb
         TsBSWIHW2PF5d8pU6q7znuEh5sa5ii/gCd6POOhfQv3m5DbhwuIbgm88bnqD37KxxT3Y
         P6oGKKe1MvXZa/x+US1HiOdz5p+n7uTjXMQCFGL3xaJKo2dn9NEWOcxHbfRCMqE3dAr1
         BMxoJoOfqcsgn3+qk45CQom+ovdI+m3jdi8ojrnPEvBcMYoNK9kJRLiB05d53goZNcop
         ZvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763548697; x=1764153497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajPJXKSb6EvakAv/OuhuRvH8YRFIbHznazB/0gEJ+2M=;
        b=LYPTf7I4Kwu1SadFrG9yDg8L34uoc5ui8m/pbNM0cpGkPF8SWRjPgzFsGmsFwVbMAl
         JnE2VlQp3qZfTYk/I54BPdDYUJovzfYIIRhExxf8RIBpjM+EtezNyLvOLRTRTivrzjSM
         o7NwqvArYXZBZ1nf4kV/WG5Ht+MASfVOLUl1uhbfbO/OHpE06aEEmfVoFQhkFIUV4vcx
         qGkTrH/aqIYv78i7q9EZF0fGJ/qToAU9Rcw0iqj9yn23skRW4k3DZneaauBu/qbHBuzL
         t7D2BbPFAFWR5FEmj/ptyy4OVPMeWV/0AOT/aDc9/MYeZXfl838r+YtGmB2/SSwMTGW6
         3vQg==
X-Forwarded-Encrypted: i=1; AJvYcCUBvH8eRdP015icYI1tc9Qx6Whd7isY5F5bS9imX9RSIh3XgO2KHPdrF8rdDnS6gnSIqF/Q9XicxkoeCRlYlBCx@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl4kQ5FIDQHBDXXpgYFB76/MJEquUadjSeaJLtVPtLG1edCgDS
	3M3LAvRM7zoEKUF8rGT3dWwLY5UKDcOVW6uGx41aK5ma2dKiQgP4k+AzV89AqvzgKZsxQQpUDlE
	k6laOCE7m+op7HWwOMNzM5j5b9Su6lHkJGF0O40Gi
X-Gm-Gg: ASbGnctmW5YGYWybiMEgwGyPODzuBt62vXSN0ZXuKmVXDvsrAq6OFoSoK5DO8E4r6xy
	x+mYXQCeU8+6VTKDn142qLDDj1hD9GVPC0DprjJsBcXyo9Grn6RCbnHtPoEHrX51kCxWYBxXbov
	vfcLOhsq1yz/AFkW0KHDfjcsXogJLOcVos9hBkSvr1tBgoalvstVESYlCL35pMZNuBk32b/MFPR
	Kx7ymT+ZaIvqixaOLk8rk9YCGsK7lxlfpWi8ktx9manjM4bGpk7luI2Nrj69aSLE9/5hV6GlZD0
	k4XOSyC8O3eoiezETAHb+w9JqvsZqAVIuF8=
X-Google-Smtp-Source: AGHT+IHyZj1mHlRoqcMVEK+Ke9v+QKN/GTCdvCboTV8ytrHFav/L7x1i8RWg43NziKnKMj+gWGYsCAB6fcyxt7vblr4=
X-Received: by 2002:a05:622a:1b88:b0:4ed:18ef:4060 with SMTP id
 d75a77b69052e-4ee3ec3080cmr5005131cf.8.1763548696534; Wed, 19 Nov 2025
 02:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org> <aRweUM4O71ecPvVr@kernel.org>
 <CA+EHjTzJQOTTSUoXVKpGdWO8vz9Vc-2AL3zRyzG4DkUPz+wBBQ@mail.gmail.com> <86ms4jrwhr.wl-maz@kernel.org>
In-Reply-To: <86ms4jrwhr.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 19 Nov 2025 10:37:39 +0000
X-Gm-Features: AWmQ_bnZDu_VkCPXAw-nz27IkT05jj1DSam5-p8uzswdO8xX2NqMq69pMVBt_H4
Message-ID: <CA+EHjTyiM+BNP+iRTYP7968np=y0+Vn38GtAfiTtg=JcUzjPpQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] KVM: arm64: Add LR overflow infrastructure (the
 dregs, the bad and the ugly)
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_023818_179297_77C402BB 
X-CRM114-Status: GOOD (  42.66  )
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

On Tue, 18 Nov 2025 at 19:06, Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Fuad,
>
> On Tue, 18 Nov 2025 13:59:14 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > On Tue, 18 Nov 2025 at 07:20, Oliver Upton <oupton@kernel.org> wrote:
> > >
> > > On Mon, Nov 17, 2025 at 09:15:22AM +0000, Marc Zyngier wrote:
> > > > This is a follow-up to the original series [1] (and fixes [2][3])
> > > > with a bunch of bug-fixes and improvements. At least one patch has
> > > > already been posted, but I thought I might repost it as part of a
> > > > series, since I accumulated more stuff:
> > > >
> > > > - The first patch addresses Mark's observation that the no-vgic-v3
> > > >   test has been broken once more. At some point, we'll have to retire
> > > >   that functionality, because even if we keep fixing the SR handling,
> > > >   nobody tests the actual interrupt state exposure to userspace, which
> > > >   I'm pretty sure has badly been broken for at least 5 years.
> > > >
> > > > - The second one addresses a report from Fuad that on QEMU,
> > > >   ICH_HCR_EL2.TDIR traps ICC_DIR_EL1 on top of ICV_DIR_EL1, leading to
> > > >   the host exploding on deactivating an interrupt. This behaviour is
> > > >   allowed by the spec, so make sure we clear all trap bits
> > > >
> > > > - Running vgic_irq in an L1 guest (the test being an L2) results in a
> > > >   MI storm on the host, as the state synchronisation is done at the
> > > >   wrong place, much like it was on the non-NV path before it was
> > > >   reworked. Apply the same methods to the NV code, and enjoy much
> > > >   better MI emulation, now tested all the way into an L3.
> > > >
> > > > - Nuke a small leftover from previous rework.
> > > >
> > > > - Force a read-back of ICH_MISR_EL2 when disabling the vgic, so that
> > > >   the trap prevents too many spurious MIs in an L1 guest, as the write
> > > >   to ICH_HCR_EL2 does exactly nothing on its own when running under
> > > >   FEAT_NV2.
> > > >
> > > > Oliver: this is starting to be a large series of fixes on top of the
> > > > existing series, plus the two patches you have already added. I'd be
> > > > happy to respin a full v4 with the fixes squashed into their original
> > > > patches. On the other hand, if you want to see the history in its full
> > > > glory, that also works for me.
> > >
> > > I'll pick up these patches in a moment but at this point I'd prefer a
> > > clean history. Plan is to send out the 6.19 pull sometime next week so
> > > any time before then would be great for v4.
> >
> > I'm happy to take that for another spin Marc before you send it, if
> > it's different from the ToT I tested. In that case, just send me a
> > pointer to the branch.
>
> I've just pushed out a full branch at [1]. Please make sure to merge
> kvmarm-fixes-6.18-3 in, as it fixes a couple of nasties (small
> conflict expected, but the resolution should be obvious).

For this branch [1]:
Tested-by: Fuad Tabba <tabba@google.com>

On QEMU, nVHE, hVHE protected mode (non-protected VMs with and without
the Android pKVM patches), and protected VMs (with the Android pKVM
patches).

Cheers,
/fuad



> For my own testing, I added -rc6 on top.
>
> Note that I didn't take your Tested-by: tags, as you are about to
> retest the whole thing anyway. If all goes well (fingers crossed),
> Oliver will be able to apply any further tag once I post these
> patches.
>
> Thanks,
>
>         M.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/vgic-lr-overflow
>
> --
> Without deviation from the norm, progress is not possible.

