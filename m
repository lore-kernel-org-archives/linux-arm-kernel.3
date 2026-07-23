Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12721C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/e6OIrJ2NxawXYZpy8WiNSmx5lsziddODGJqeu5vuM=; b=CILYJEtjp7DVLEq0919aqlQHkA
	i+r2kz4vmGa0xuofkWVV91Hb+9plIloXJY1IRYsGUa58w11miGNgpjIVeW6DXUyC8Nleoaon5iByY
	M9lLbTkeCIgdzQHqvhbDPRESUkZIzMaCIUIztukTwB1YbQXKdSlMKMT+ghvi4NdtfmkXzBusLwqk+
	vaNdH0nZIJ9rcAH1Ak77ckkCf6Zsx3H07AWAutd2TzdrkNBcF99oSu3Xukc0c3GJ+pSPOUTjxUB19
	iMYubV/JOrLXweum6UuUL5jR8mvigqyCQ04yHXfzzhZ2mEginy6Dgpz48cw6Pk2QEMv5CE5Q1cZpB
	PscP3pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw0c-0000000EgAa-3zZE;
	Thu, 23 Jul 2026 16:10:54 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw0a-0000000EgAD-2j6R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:10:53 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-51c01c79467so323901cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 09:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784823051; cv=none;
        d=google.com; s=arc-20260327;
        b=N4NzNY3LUx7nyzlHnLWFmGDEESZvyrW5fuFydMpWEC8WWMMvmIvuh82+L2IdsIqLoc
         4gHXULLUUbUgxVI0Oa7EBHzNOw1HKMDWiD0sVeQSJI/kTPxRyadonKlW05FRmzLWpsBP
         MB9IIM2H6zMPimcN3y8A+5X8Vc4kBLCBDYofSjZEkx07FQgluvl+cdaUo2tVqNRPjPuR
         2gobPucVLS+GJRHkISLdRVi9f8ZD096CrK19pysQUZFhxwrDdtgGWl8KvvB6mtpId5Oe
         VJBTuGGafBH6eKznmkze/Qh2Fu2F4bI48frc+ebMJlfU0OV6gaDVotCMa0EzmLEOpG8Q
         +sGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U/e6OIrJ2NxawXYZpy8WiNSmx5lsziddODGJqeu5vuM=;
        fh=UYdWmtJJhjdS+qpkToMVO4hdS3doT89NIDD6ikb6k74=;
        b=U3IulKR9jgTLqJjpIPKof8D2txxdVDLTWc7n/qx/6+H+AW5J7NA5zFcRL1qqF5s8gi
         vg/y+Z8Qzit3oo2TZfi33tZGzG930/Atmb8tTaM0j3Co0ZRk0QAZUUsjr37H4StqKf3f
         Qtg20nyDWL++ahYGJeUHVgpw1Fuzg4/OXap7SlcsrtBh0/IFDH0YKW4/cbhn0Xhf9yQ9
         ZftGy5dPIgptsIZMEKkFaepQ867IAQZ4dRFfvRVTt3mSWyXsDBYB8ccf1eff81Wm/plI
         qwyHQCWCOTjJAgHzpatgS5jk4P6FV4EO4+AhiHmS1eIyfxD80kEGEdkiwIpkqnic5eUo
         2mIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784823051; x=1785427851; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/e6OIrJ2NxawXYZpy8WiNSmx5lsziddODGJqeu5vuM=;
        b=IxwEnXgIcItvvmN7Dc9cZg6d3h24FXXJgflUFe+mnM7EESdEwIGn3i1QblwpjhVoup
         NQdcnbEYeHhXqmIG0JPXu023hfNFhOm6u/X3bjaZMoWe+P8rz4EWRcMQZ79oQ1uB1B9i
         nlnlPLBsbui7pu7BNVeRDPG529UwvkXOswk9RmwX05RNj2/fVLVLj85pKilaUqn8xcf9
         04VQQTSwT4ZRor/hU6WBpe28sY/UBM7w5VsaPZDIZPCFLIl4mqmbwvsbSdGZ3Mne2Uq9
         ljI/Tp2j0mroaVLqWPeF+no9PZsOVfMBdexQmOSianKJRFBpj5ylx455b2urd2oIGQVl
         37dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823051; x=1785427851;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U/e6OIrJ2NxawXYZpy8WiNSmx5lsziddODGJqeu5vuM=;
        b=fSG1EqW5iGF/9myjAKhN7qhirswjNmZ0meDYuBxvXVv8TfaZJySFrtLsBHUUSl8zNs
         Az+T0HMBBAhrZ8Cjs3HDCcC7hLnlpQOF/qtH4biMQGHRW5p+olt34xDZLSzPhP8veI06
         SzUUpjUJ/bHyfRbYv1RwmOJVPqxfoKCaTVMDXF5MwRnIt1T9WNLXmDh1csDaigdoUUE4
         V4N21And7YIIiOoizBPmr2kolWxJFriEJjP7YlMDkqXSSKNpNbGv13ZF1trWT9LUqr3M
         aotM04GBKs7Nva6zUhinZZPQm34gzYPrF5UEruMA9ldw+SgHyAZFMxXB3deSocG9Sn3D
         cC5A==
X-Forwarded-Encrypted: i=1; AHgh+RpaPRnj3NPtG7pmjRqJbRKi02ruw3ZFU72rGTkEl4Vfngm23k8dSWyI9x9NUw4gdE7oOoaqhpDwLEq3viTR8Ub5@lists.infradead.org
X-Gm-Message-State: AOJu0YyJXLwMpaK/Qp61l4QmiKxmO1P/hSzLBBT7dtiBYfyLFte5PIpE
	Ei2lWV18FEeFdUEuRz9KSMS+Qvwv96JZjZigu/tvTYrx34Pn40rckZSvYyjop7YCmgrg8iQU2QK
	wJirYxrCU76X9z+U9Dc/OPYfM71AieKA6Or10Z8Ou
X-Gm-Gg: AR+sD13p9XJDa/bPRQFMXi3Z5jt0TVJMip6i7sFaQE03sTGFdIZyS8Yh+CIUtkKkcfp
	HCV11ayAJ508PuH37uqbEwVVQ8gnEsGi2KaxPt2OUoC4AtxN51K2SEiTCb50K1RCB/Gu7jgZJeF
	gSglqAeEU8mDGSs520/elH0F7LcnpZF5fb4/OwZ+Zi/giFAElcuUDsOeiAJCWrHXkBVpOI6YrpJ
	VO7DoRmxiudUi6ZfedM2K6dmZ7nvU+SDF5hgvVfpWL8fCACzryc8yb/86sVqg==
X-Received: by 2002:a05:622a:2506:b0:51c:ca9:3d15 with SMTP id
 d75a77b69052e-5283bb03cfdmr10935421cf.12.1784823050317; Thu, 23 Jul 2026
 09:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
 <20260720171513.1415357-14-vdonnefort@google.com> <CA+EHjTw7t6KHuQwktNN5_dJgZCxeWejcoQMz3pe6wUuS=R+QtQ@mail.gmail.com>
 <amIuh8OZk_xuk6_k@google.com>
In-Reply-To: <amIuh8OZk_xuk6_k@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 23 Jul 2026 17:10:13 +0100
X-Gm-Features: AUfX_myES7cc5zyhy84P3Ly98pOsyZv9KojYBrf3Vl-7ne9L08p9f-hLsZOxvLs
Message-ID: <CA+EHjTyc+qUHYkP8V4gquDn9uDJRxVnbZgr5ooj++68sEPkyFQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/17] KVM: arm64: Alloc pkvm_hyp_vm using pKVM heap allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_091052_735574_9635E707 
X-CRM114-Status: GOOD (  21.69  )
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

On Thu, 23 Jul 2026 at 16:09, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Thu, Jul 23, 2026 at 01:14:10PM +0100, Fuad Tabba wrote:
> > Hi Vincent,
> >
> > On Mon, 20 Jul 2026 at 18:15, Vincent Donnefort <vdonnefort@google.com> wrote:
> > ...
> >
> > > +static void errno_to_smccc(int ret, struct kvm_cpu_context *host_ctxt)
> > > +{
> > > +       struct pkvm_hyp_req req = { .type = PKVM_HYP_NO_REQ };
> > > +
> > > +       switch (ret) {
> > > +       case -ENOMEM:
> > > +               req.type = PKVM_HYP_REQ_HYP_ALLOC;
> > > +               req.mem.nr_pages = hyp_alloc_topup_needed();
> > > +               break;
> > > +       }
> >
> > Sashiko raised this in a different patch. This turns any -ENOMEM into
> > a top-up request, but hyp_allocator_map() also returns -ENOMEM from
> > the pkvm_map_private_va_range() failure path without setting
> > topup_needed, so nr_pages can be 0. The host then handles a 0-page
> > top-up and the while (!__ret) loop in pkvm_call_hyp_req() just
> > re-issues the same failing hypercall.
> >
> > This might not be reachable today, but could you make it so that
> > errno_to_smccc() raises the request only when nr_pages is non-zero,
> > and let -ENOMEM propagate otherwise?
>
> I could also introduce a HYP_ALLOC specific ENOMEM?
>
> Otherwise, yes checking on hyp_alloc_topup_needed() sounds alright.

No strong opinion, but it seems to me that checking on
hyp_alloc_topup_needed() is simpler and safer. That said, if you have
reason to do it differently I don't mind.

/fuad

>
> >
> > Cheers,
> > /fuad

