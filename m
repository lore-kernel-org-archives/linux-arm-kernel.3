Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AF3CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 00:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jElfUXW8wCp0wFBdm2MwcKv7Fj5XfZurPdvK1+KQDTc=; b=dxD1mSoT6uSvgS10UhaPBoSLlh
	Eutucm4MahGET4txmTEJBqO6ekseX4haAmGgs4rX8/0XT9/PdqcrR5hYhfxdEWGF6ehHRktEY/TJM
	auwdPSONjrEGWcuChco1SfOAGTk2SpbbybDYHnFMtcDpsJiQR40dSk5dC+W/YlZ5TdQSTHcuZiv2V
	TwsuzaC/LdPUK1qlRtwGgg1FWPQ1G8j/DqMRDuMelOyWzmrilV4PuXnnntM+v4KbMwByR2CX0KluD
	6KXu5/yXWVYbTMDLpGsLoaiuh5fWN6DfYTwZlKwhNS/wmDTWdX/gXcSAevQHqEjbceiXyOn8c5R7V
	NP2bS9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB0Zj-0000000FOOv-2pnR;
	Tue, 21 Oct 2025 00:50:07 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB0Zh-0000000FOOW-26BF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 00:50:06 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so4505963a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 17:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761007804; x=1761612604; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jElfUXW8wCp0wFBdm2MwcKv7Fj5XfZurPdvK1+KQDTc=;
        b=p3WpHjVeobGks+Pku+In2aohFI3NiB4/04CLBBuwv0XbjsrdbADW22qOjLL1izX926
         /C7yD08XcG/zOtTsdV5AFaItsvI2wo1lx77NNGxgFM6ymd87bY7wGl1DE+oahmULLK8o
         VLemkp1H9eC04bfA1BLk9UYjjLJDSds68Z+pPTgKsFNkaRLIb+E7oUT8/xV68feLaGV7
         xTn4FDvIJF90ay40yfsUN2CPl+NU2BHfBGNDc+eKxK7abByY6y2btCiCWJwzwf6S8iFq
         INw714HoxY2mW0Qwcl0znV/rCZP0mocMT6w8/+x8gH3ziWc/RlEw25pAXl7UoDnNbtY8
         u8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761007804; x=1761612604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jElfUXW8wCp0wFBdm2MwcKv7Fj5XfZurPdvK1+KQDTc=;
        b=j+0pXLfGTso36A72LSvBsZN+IHQh8r/arX7fo4OTkvGBLYQxBX71PerAxWFOq+S2vG
         8VlI6byUGq7ER5Kk0VGseyDfiKbGAEqRGl7p/ssRQF1gMt0KZ9qR+2xu5aQuPupmebEF
         AgI+a6iami3ByOGGrfh4JLX7U3Hoc3df7jIeShwcJUJwqQzD5wrKSCFBqb8fVOSted32
         InQmD2wOsWjRiaqUsy87yMTKaFeZZcENfo1dbtMbCTS0RmecvEYPW/oRlCpSOPrMQdFE
         ctogsAM1mID0tvNJkMKVIkK8ib6b1H8lJRciPpI1arsP0It8mZZghwM3U8THArGZ+yet
         aMaA==
X-Forwarded-Encrypted: i=1; AJvYcCUibHFkL9K4lPeJkTtq6KlLFsrpZKJA/EOLQfy+QEbZHZ9ovQAxx24jMwOuPLd2Gq3lqk8+b5hbE7HcIdL4CkIQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8WmqwPg2EHHTVzA7jJVvMIJUsunE2aOWMxv1IumWniG3sMf/G
	qCVUNfmORWLS3BxI7ZPA8OKLR7wed3lP9D2IeSdkurAqJXhKJVbR7qocFH3VZ7JKzInp7rQ/11T
	PVGsYsQ==
X-Google-Smtp-Source: AGHT+IHdLNrdOSrC/dgKGwuDlIyF6hKyTRHuSK/jL8AhomiAuV/wuXp+VqpnA+jc5SjQ69PU54+FpTq2Rlc=
X-Received: from pjbnc11.prod.google.com ([2002:a17:90b:37cb:b0:33b:caf7:2442])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28c4:b0:32e:5646:d43f
 with SMTP id 98e67ed59e1d1-33bcf8e96d3mr20061024a91.19.1761007804269; Mon, 20
 Oct 2025 17:50:04 -0700 (PDT)
Date: Mon, 20 Oct 2025 17:50:02 -0700
In-Reply-To: <23072856-6b8c-41e2-93d1-ea8a240a7079@sirena.org.uk>
Mime-Version: 1.0
References: <20251007160704.1673584-1-sascha.bischoff@arm.com> <23072856-6b8c-41e2-93d1-ea8a240a7079@sirena.org.uk>
Message-ID: <aPbYuvlLzLENTCcP@google.com>
Subject: Re: [PATCH] KVM: arm64: gic-v3: Only set ICH_HCR traps for v2-on-v3
 or v3 guests
From: Sean Christopherson <seanjc@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, 
	Suzuki Poulose <Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Aishwarya.TCV@arm.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_175005_587577_E38160D8 
X-CRM114-Status: GOOD (  24.85  )
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

On Tue, Oct 21, 2025, Mark Brown wrote:
> On Tue, Oct 07, 2025 at 04:07:13PM +0000, Sascha Bischoff wrote:
> > The ICH_HCR_EL2 traps are used when running on GICv3 hardware, or when
> > running a GICv3-based guest using FEAT_GCIE_LEGACY on GICv5
> > hardware. When running a GICv2 guest on GICv3 hardware the traps are
> > used to ensure that the guest never sees any part of GICv3 (only GICv2
> > is visible to the guest), and when running a GICv3 guest they are used
> > to trap in specific scenarios. They are not applicable for a
> > GICv2-native guest, and won't be applicable for a(n upcoming) GICv5
> > guest.
> 
> v6.18-rc2 introduces a failure in the KVM no-vgic-v3 selftest on what
> appears to be all arm64 platforms with a GICv3 in all of VHE, nVHE and
> pKVM modes:
> 
> # selftests: kvm: no-vgic-v3
> # Random seed: 0x6b8b4567
> # ==== Test Assertion Failure ====
> #   arm64/no-vgic-v3.c:66: handled
> #   pid=3469 tid=3469 errno=4 - Interrupted system call
> #      1	0x0000000000402ff7: test_run_vcpu at no-vgic-v3.c:128
> #      2	0x0000000000402213: test_guest_no_gicv3 at no-vgic-v3.c:155
> #      3	 (inlined by) main at no-vgic-v3.c:174
> #      4	0x0000ffff7fca7543: ?? ??:0
> #      5	0x0000ffff7fca7617: ?? ??:0
> #      6	0x00000000004023af: _start at ??:?
> #   ICC_PMR_EL1 no read trap
> not ok 25 selftests: kvm: no-vgic-v3 # exit=254
> 
> introduced by this patch, which is commit 3193287ddffb and which never
> appeared in -next prior to being merged into mainline.
> 
> It didn't appear in -next since the arm64 KVM fixes tree is not directly
> in -next and it was only pulled into Paolo's tree on Saturday, a few
> hours before Paolo sent his pull request to Linus, so there was no
> opportunity for it to be picked up.  As I've previously suggested it
> does seem like it would be a good idea to include the fixes branches for
> the KVM arch trees in -next (s390 is there, but I don't see the others),

FWIW, "kvm-x86 fixes" is in -next (unless I've screwed up recently), it just gets
routed in via "kvm-x86 next" via an octopus merge.

> and/or to have more cooking time between things being pulled into the
> main KVM fixes branch and being sent to Linus.

