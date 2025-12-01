Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355CFD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 19:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NAUitM+MSWweUnE61BNoObWF/ar0jw0l8Av+72afE4=; b=IYPwhLUMuO3+VMB+oXHCT/KBna
	0w7R40beiCVV8TLwJ1UVcqSVkOLOYzC4gnSNp3+zo0qN5CWH8LUKWps8JhlbIccp3FK6dAUncLfKL
	xKdqGUfeHUruGm8nB0Hx/2BkZTH4g/3cFDljWjVvlSlm/m41n76+1mvX1oJn/g9F4Vn8VLcwFr247
	jfBP+xM+s5qonjZ8NkDLxncOI5MkURFwjKaWPpEeCNUeRN8hJx9cxL5wU2dPAEi1V9GUyQa9t6I6e
	6W52vlzaWd87h9IjifWWyHc0QOE6K1wICDy6P4Wz/zVHHeiiVMl9bwpHtOzHh148cejPt6a3EiVii
	q+O5zS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQA2S-00000004TnQ-19dt;
	Mon, 01 Dec 2025 19:58:24 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQA2N-00000004Tmu-35vL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 19:58:23 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so590293766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 11:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764619097; x=1765223897; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9NAUitM+MSWweUnE61BNoObWF/ar0jw0l8Av+72afE4=;
        b=C0nwh7tW+7nEnGoA9mIJBkStNlfpx3zAQ/6p0ZUXB2OC2DJGBTB+MG+X5rvZ15z0sl
         lwEQ0XB5v3r2RwPlGpLd45ADkaHBVzp3039GZwAbC/QwmY6Nr4hjdB7Npnh0ui3w8Lnk
         lVQttAlGQcG6DPci37tInEqaYD/lOiQmHIfl/jpLV4qJnmG+EDup2w20gQIH86UGLhIz
         zI2iHNvp5cabxiPw55YAvXjJ8pqREc8V/OOXpPeB8Mfx/Yh5JzhV/zR2MktCtJzPF1pY
         /mDezIfCDmMWKrbzLZ3qIkrVdgKa0LJj8FK5RLrDRwKrtnsIjzvDLhgYIwFsaJCLoXXg
         QVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764619097; x=1765223897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NAUitM+MSWweUnE61BNoObWF/ar0jw0l8Av+72afE4=;
        b=MmWQmbnwnO3/h+7FMQctPV0mgEy+EUQ2K4xYywSdq55vPhM+l10a3TKQYRFaaU9pT7
         4e4+wgT2QtzfHJxOIsfAL6nQaDEcAVQXyK1oJcOyvxVkYaN/2NO2dOUCUGhyb+02N3Zg
         ZmxkC6NMb+StCkbt6nLQTjf2Nhl+iOEb+A3JV/5wUrFtXQH7obNDoGOnifZYAlT9ejrd
         hIjuOUpA39ibKLG1dK5r3X0ov9dIm76ctHBXG9g3uwQO4Agjc/H2zBXIb5OcTPkvj5P0
         fvheA0qF2sQYCuIX67493DGzfiTIRzp/ytTRUMGGVHUz0aZt/FY4FteNWbVUD5MIAp4X
         gYKw==
X-Forwarded-Encrypted: i=1; AJvYcCX+N2XzZJLTg+cAMIo/elcBHbpeuL3b1KHsGMbwopbK5jZ+GVYfEQq9oIgtf3WMSIq58ECAjFVusoy7G8NViJAN@lists.infradead.org
X-Gm-Message-State: AOJu0YxR9f8kFwWLnbuCY0wn8BwbUTdvwhgYRtdqpnsie2TCaex2fPuI
	hFXvUHuaHggVkDBHREPrI4iwL+KjBU0d5jB/lmZdEXu2Vh7KenvqnBECLaczXrACbw==
X-Gm-Gg: ASbGncvJsZwnb5YCirGwQ0s3S5andLbDBfmdvmL/Sn/jfj4fCPbzSiAXkAMU4NyfIpe
	g91OnQiQGlbQanrUWzjlk4gviz4Efsd0otGN5QhnczIJ4a/Xzz13kvWjlJVFczYb4+lBFADjgOt
	p6xx+OXgbNttnW8UvAg3AJCQ0c0/GaG+cRQuIIKB4DCFIOHjo90QxOgcIVWNvZvRlXgE+Z/ucya
	4LuUU9I5v1yusOzkMZGr0U656N9HADiWKG7SmbapmS/NmS0YNj9LyZdnEvCOsj5CcTt3JxP9iAj
	QlW1qVb2iAwCRgWqMMM/Gn2XHNNv4pKgS0KUmBSoFTLfNW6S3Mwl5H5HNLI4fN9kAiuALdf2FIM
	9lX3RViYF8Cs1jUpHXqZhf3dBCOrwNxPMJ3BXL55RHEPf8P8asor69VmDIRit/EVRpCu4Gkf3D1
	hTzKBNsFJQHOo+MkD8hR2ByrCrH7jDPcLkDCxSJ7dSfQysTnzizwkCZQ==
X-Google-Smtp-Source: AGHT+IH2zdDJmxuV1Kx70hy1xujwpWhYPpBA15ctZSpVUkxE7sUPJ7uI1HDSh04+fVoYPr2+q+18ZA==
X-Received: by 2002:a17:907:6d13:b0:b77:18a0:3c8b with SMTP id a640c23a62f3a-b7718a03cd2mr1349980566b.1.1764619096714;
        Mon, 01 Dec 2025 11:58:16 -0800 (PST)
Received: from google.com (214.44.34.34.bc.googleusercontent.com. [34.34.44.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519d883sm1298814466b.17.2025.12.01.11.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 11:58:16 -0800 (PST)
Date: Mon, 1 Dec 2025 19:58:13 +0000
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Prevent FWD_TO_USER of SMCCC to pKVM
Message-ID: <oim4q3obyy7jh2juw2qngl4xti6hjg6pavfnm3u3fppa4ao6dq@x7sanj32ttsi>
References: <20251201-smccc-filter-v1-1-b4831416f8a3@google.com>
 <86ms42ox67.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ms42ox67.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_115821_861954_38FCED74 
X-CRM114-Status: GOOD (  31.57  )
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

Thanks for your quick review!

On Mon, Dec 01, 2025 at 06:48:48PM +0000, Marc Zyngier wrote:
> On Mon, 01 Dec 2025 18:19:52 +0000,
> "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com> wrote:
> > 
> > With protected VMs, forwarding guest HVC/SMCs happens at two interfaces:
> > 
> >      pKVM [EL2] <--> KVM [EL1] <--> VMM [EL0]
> > 
> > so it might be possible for EL0 to successfully register with EL1 to
> > handle guest SMCCC calls but never see the KVM_EXIT_HYPERCALL, even if
> > the calls are properly issued by the guest, due to EL2 handling them so
> > that (host) EL1 never gets a chance to exit to EL0.
> > 
> > Instead, avoid that confusing situation and make userspace fail early by
> > disallowing KVM_ARM_VM_SMCCC_FILTER-ing calls from protected guests in
> > the KVM FID range (which pKVM re-uses).
> > 
> > DEN0028 defines 65536 "Vendor Specific Hypervisor Service Calls":
> > 
> > - the first ARM_SMCCC_KVM_NUM_FUNCS (128) can be custom-defined
> > - the following 3 are currently standardized
> > - the rest is "reserved for future expansion"
> > 
> > so reserve them all, like commit 821d935c87bc ("KVM: arm64: Introduce
> > support for userspace SMCCC filtering") with the Arm Architecture Calls.
> 
> I don't think preventing all hypercalls from reaching userspace is
> acceptable from an API perspective. For example, it is highly expected
> that the hypercall that exposes the various MIDR/REVIDR/AIDR that the
> guest can be expected to run on is handled in userspace.
> 
> Given that this hypercall is critical to the correct behaviour of a
> guest in an asymmetric system, you can't really forbid it. If you
> don't want it, that's fine -- don't implement it in your VMM.
> 
> But I fully expect pKVM to inherit the existing APIs by virtue of
> being a KVM backend.
> 
> > Alternatively, we could have only reserved the ARM_SMCCC_KVM_NUM_FUNCS
> > (or even a subset of it) and the "Call UID Query" but that would have
> > risked future conflicts between that uAPI and an extension of the SMCCC
> > or of the pKVM ABI.
> 
> I disagree. The only ones you can legitimately block are the ones that
> are earmarked for pKVM itself (2-63), and only these. Everything else
> should make it to userspace if the guest and the VMM agree to do so.

Sounds good, I'll limit v2 to these FIDs and the "Call UID Query" (unavoidable).

> 
> This is part of the KVM ABI, and pKVM should be fixed.

I agree. In particular on not restricting {S,G}ET_ONE_REG to a point where the
KVM uAPI for SMCCC filtering can't be supported, as some experimental Linux
forks might [1] have done! I couldn't find the corresponding patches on LKML to
contribute this feedback to, so something to keep in mind when they come in :)

[1]: https://r.android.com/q/I1c7bc93ebe0bfb597cca5c4284ceb7fd53e4713c

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Thanks!

-- 
Pierre

