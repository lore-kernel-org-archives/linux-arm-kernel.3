Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED512CEDD8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2GwSQ++DitICmTZEwHDVEkQZZItGNz+IuoJwTCHLm0=; b=mXFeV2IqKxbpzidSphjxvdAjTy
	/PwMAAKkiZfuVFmA2vHFofjtJdy7T+YRZNdB6Rr5xDzG+PskJbXVnOCpOh+8imVkX8New7v7dmP3j
	JUXh9GOyBfs4f2CRGll2bsAaVdzbIs3fAzLj61DvPXvCF+d8/f+pSjBfYW6C0ltithCvafN9SxVsM
	QPyBLVUJjXZ3N0f7R5UmwGADsgLwWhcLlCtfe3jUKXTqFagAoDVu1mzQSaxT4L2l5UswkV3a5ARgm
	Z2C5tLBRbnKk1SQwcBB1siOboum3+NeX0P8ecxX8FLNGw25aOsS9qPeEJclKvKtcEqIGzMQfkQtDf
	8wEktjzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMFR-00000000WPM-2CTa;
	Tue, 18 Nov 2025 13:59:57 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMFN-00000000WOM-0lDe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:59:55 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4ee147baf7bso291561cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763474392; x=1764079192; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R2GwSQ++DitICmTZEwHDVEkQZZItGNz+IuoJwTCHLm0=;
        b=DJqHd3FYbSLHKtrdRHLFO82eM92LBbEvL+rjDw/vcO/sNJuhZkqb5SfshRJu/UIaT+
         5mG19EbQU86G3oBJOZ+YNT6beuikBmE0B48BXELHgo/QTF3lh+rxt9fTs8fseTFbXttf
         +Em+jDuPCDCELqmytlw/E3sRSJI6BrLD2DHrmEI3hlu82nxxo1+ds7WlhLUqMKCBaRXG
         fcULA9lFv3FlKKzNLpg9J15trQV7AmrNu3ts6ECkgp1IilTmVX6pgotdubcHvBQ2/Pie
         B/3JwoWeK0fjKSbFmBHFi0Y+J6zIFRhJADYtrWdmvkqHlbj6F70u//NEZGZ3AIhD6usT
         uC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474392; x=1764079192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2GwSQ++DitICmTZEwHDVEkQZZItGNz+IuoJwTCHLm0=;
        b=TYsLaHPCOsgU/h4Qrf3zg71yybB+qxoby9pN2RuxqyJXNkAjMWN51wWsENzE+sYpOr
         DKG9yvo/ZfeHLf6fRo6tvJyiTrfrW7t/AzGfC1gzNyE0UFkcX2BqfqHWpPhOhnfG6kKu
         isgcpm2Dbr2FpGLXnT005CjtjVBXayaSw31ZdpbP/f+sg74zt8EZ9pb46sLwr7eByzaR
         dDGA/ViBx+lT4hf8nX/jwCE94dobuGyZIVuxRQnRmPgxN8zHcM2PadIL5w95mHFL6/Xu
         8EIG/DXXEgvo7e7o9fwi9agwjllccbpYTXFBmrm8EJtZTJCu3pVXfmHSBBdoMMfpgLdY
         0Uhg==
X-Forwarded-Encrypted: i=1; AJvYcCURPQW7jYDa/SLvAqJtythRLqRCnIkOZHC5oWbdUmuMTrPjdJHc42STAXHhINXULiGsif6rWgEW/RirJJW3ZHJY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzujjb8iYKy791tcbQKt4TWx46hWWN8/ztOrP6gskkeLm0+b8LG
	D/NYjF4mPOBGSNPxN3/MV4XKNPIcOwkcmv9UUj4Awh1wSddP45nG/bBR7jtJzbEisFkfeUxT2s7
	J3d6sD9LJ0cvks+/tWlCr3ftANr+sleST46s2NaYd
X-Gm-Gg: ASbGnctssChnxfRWaajUwbwu3rP1P9XHRDoBWJWb7DqPKF90GmYECVx3427vIlc+ace
	gdK9IjjR8sH1qFytBKKUV3waf9Km2EwibKchaYDyfc9QczImfA9tZHkgkg0TkOgmD/gH3syLNtt
	TgihBSVAa67J9cEHzD2LeJ+lewICyN4nTL2Zc4rRz4xa9auqXCOFdPLmdkN02bViWaiPPjUZvzb
	TLv7KWn2auNptPPCt8Txy5yG543zZBzjcmWeaQBl1XqMM1Nw2c+WQlwRXuZhnsu2aTvJVWbLo9C
	D7gUoT+Pg1787G033RMQrjb4
X-Google-Smtp-Source: AGHT+IHCyANdQgsaiOtaga2HnBxQXXGPzcCZ4Ohf00BEMrBIOJ7VpUX3rg5vryaN2JUlMoGY94TIkE6SWzKp36uqz+s=
X-Received: by 2002:a05:622a:1455:b0:4b2:ecb6:e6dd with SMTP id
 d75a77b69052e-4ee37321ee7mr2670321cf.1.1763474391448; Tue, 18 Nov 2025
 05:59:51 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org> <aRweUM4O71ecPvVr@kernel.org>
In-Reply-To: <aRweUM4O71ecPvVr@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 18 Nov 2025 13:59:14 +0000
X-Gm-Features: AWmQ_bkF-6pn3IYOEpn92xj1HYWHcPhO6SZ_J8WYU-pS4TiyeHoHMyN4vCkYXBs
Message-ID: <CA+EHjTzJQOTTSUoXVKpGdWO8vz9Vc-2AL3zRyzG4DkUPz+wBBQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] KVM: arm64: Add LR overflow infrastructure (the
 dregs, the bad and the ugly)
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055953_247886_3D9CC4A8 
X-CRM114-Status: GOOD (  33.91  )
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

On Tue, 18 Nov 2025 at 07:20, Oliver Upton <oupton@kernel.org> wrote:
>
> On Mon, Nov 17, 2025 at 09:15:22AM +0000, Marc Zyngier wrote:
> > This is a follow-up to the original series [1] (and fixes [2][3])
> > with a bunch of bug-fixes and improvements. At least one patch has
> > already been posted, but I thought I might repost it as part of a
> > series, since I accumulated more stuff:
> >
> > - The first patch addresses Mark's observation that the no-vgic-v3
> >   test has been broken once more. At some point, we'll have to retire
> >   that functionality, because even if we keep fixing the SR handling,
> >   nobody tests the actual interrupt state exposure to userspace, which
> >   I'm pretty sure has badly been broken for at least 5 years.
> >
> > - The second one addresses a report from Fuad that on QEMU,
> >   ICH_HCR_EL2.TDIR traps ICC_DIR_EL1 on top of ICV_DIR_EL1, leading to
> >   the host exploding on deactivating an interrupt. This behaviour is
> >   allowed by the spec, so make sure we clear all trap bits
> >
> > - Running vgic_irq in an L1 guest (the test being an L2) results in a
> >   MI storm on the host, as the state synchronisation is done at the
> >   wrong place, much like it was on the non-NV path before it was
> >   reworked. Apply the same methods to the NV code, and enjoy much
> >   better MI emulation, now tested all the way into an L3.
> >
> > - Nuke a small leftover from previous rework.
> >
> > - Force a read-back of ICH_MISR_EL2 when disabling the vgic, so that
> >   the trap prevents too many spurious MIs in an L1 guest, as the write
> >   to ICH_HCR_EL2 does exactly nothing on its own when running under
> >   FEAT_NV2.
> >
> > Oliver: this is starting to be a large series of fixes on top of the
> > existing series, plus the two patches you have already added. I'd be
> > happy to respin a full v4 with the fixes squashed into their original
> > patches. On the other hand, if you want to see the history in its full
> > glory, that also works for me.
>
> I'll pick up these patches in a moment but at this point I'd prefer a
> clean history. Plan is to send out the 6.19 pull sometime next week so
> any time before then would be great for v4.

I'm happy to take that for another spin Marc before you send it, if
it's different from the ToT I tested. In that case, just send me a
pointer to the branch.

Cheers,
/fuad

> Thanks for ironing out all the quirks :)
>
> Best,
> Oliver

