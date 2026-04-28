Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3792FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRxyUyWR/bvwIckxaxOIFLoCtm5E8wIRuhM7yIvbG+w=; b=EiTK0MPxGMqp5FJNqgxv4b5eQP
	Ixdc5nxnuWu0PyrxKTaKhfo5NtifTaBChD2al+WVemDeuct3Al+qw1JZMbjpTjc7/78qMjSKJ4ZE4
	S0Of4aukZBIm+h2YotxDaRFv3GguMfqf3euWP6+/ezNnLZSfCxAS4yxVa5qlt5fPyKdjUd9nsnIlc
	jmQxHtcG6wyYatIRMFacIqgU/D6eiW6BTLgxmh8peEn2YAH9vhKw7jpdm9rKpFqjtomzjhH3jIU1g
	HFchTW1YB7zCCFsZZYpzhHwTMK7/X8sIoXzPrS0sZBDF990M5XmyiXwOpsxr5JwscbxXXEiFdu1A4
	ViwLlY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlqk-00000001zkC-1cUr;
	Tue, 28 Apr 2026 17:03:54 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlqh-00000001zjo-3MJR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 17:03:53 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-50d864c23bdso840081cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777395830; cv=none;
        d=google.com; s=arc-20240605;
        b=NcOYZHpuhXBDS87UbEbV/XD7SWHgllyRVavtFoPs33cCysQgVTo2PPKHGh72ud308g
         z/T3LFUSumJxS+RydALe/Tk0Rhj5NVKftrFzRHB66/OsVX3+0Qo5cMsLXbJTrIVI/+Kx
         1d//g4gNj1FcmEeBBwwW9wM5FnhjxryYyPC7ijrx90PSob5H/AAjS0DJJzoPTwnQM0AP
         pyAg/C5w7u7XjWIl/mAP7JztZ2Ka8FgcsmtuVcZkfwMzWW1JkIsMyBEuvK2NS8BGo9xM
         FF7e4fgTfoV7vWRod4jssqBTpMf8/4tCJdl4w/kqYIxYqKFpvvEIYYPwI1vxzdoqg3r3
         6I5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vRxyUyWR/bvwIckxaxOIFLoCtm5E8wIRuhM7yIvbG+w=;
        fh=WrydDHd+7pw+a4CSB4cgEtj0rtZXfA8M9aPSBToa0zM=;
        b=kuZi1s9OyzmCHjgWeT4KfQjANh3Fxpst8oYESA83/LsfPuFZw7LRiLuf6h40Sojuad
         3pPrbGR+Tk9soNnl7Lurb2jf91myVxKEpD2NpQ8zQe182o3GUc1nilmuNvcJLp8xwQba
         SHRCNA4lZvGL5t3M5q79ZRT5SCNK90jmhRjKLnaLNHyFcLkU4caZjHPHKnCSTB9GH0Ra
         fFt66wkHcW472KxDtiP2ToiAIVQdL4rjQnz59nIjdUAWFP0oP8R2GTUc1OJbrfDQdaUA
         CM1LsB4OCqCPn4JURA862ytvOwnk3LQ0EBUFVN2jY8tjadTGnEldVcFtZ2llwbGl/q3+
         F32A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777395830; x=1778000630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRxyUyWR/bvwIckxaxOIFLoCtm5E8wIRuhM7yIvbG+w=;
        b=g96Vagjk90mCJFNdID9X413xRcTDS8EdYp+ca7W7jsAzilKlRd4K1WYyWJMzjO0IBk
         TGXQQX4yU7K7oHWQSYuAevleXmQmbCznigccpbRAIXhn0Q48SrjcHPYIubfRb0y0ZVcz
         LkLt3F06jtoqZYACM/zPcflJbOk26GyMcAOH+OIaxLQxuKp1nctzyUGxQHC8z4OPCwGg
         WFk9Aw36bSR0ye3lqkoecnwDrEfu+Awc8T1bSm90CzQnnDVrliDDx9J4yZwSpbo3iPCI
         rIma6v63YfmXsFRQcUE8bCVsMBHp+L3QzJiiQw7+7XL1WoWl5/jJkG2EBxVfIVj0OXlD
         RExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395830; x=1778000630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vRxyUyWR/bvwIckxaxOIFLoCtm5E8wIRuhM7yIvbG+w=;
        b=S9caGC+Ju4jA6z7Jdcq2pZ9Cb6eZMyEVS/mow9UBfkQx8OoRiRwdqVAsbmEGVvdNSc
         LsmnJaNY1AAKYoCfi905wJtBq5CnTQZeK/Uaw3Pd69DUnbl7mkApInKHydZiQxh4i2Bh
         phyd1fAl1zOnzqEFtrprmttgCoJezSf55tkFFF65wocCEjxuwoiHk+bVvw46rx3/49Jv
         aR0SoZD7MZRLkzM94hQcwTEzmXjU4KB/GHXXoEE2UgJ5ve65BN2tAou/a5u0fUFmJFl9
         oVLJlABTe+sXQQLBPq6FTVlsDxqDmg+e8KagQVwcSs3z85s1iFkk/oXQUDCeO5ZhiXZJ
         UndA==
X-Forwarded-Encrypted: i=1; AFNElJ+5/1j4f1OwloVjBLpRnSx48aMU4GeZu4Aoq0EC9GGCl+Izo5lWQm4jjM+KD8b6izY994Wxr9VuQAE3VNoER95s@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5ANmkUOpTr4sAhVZLpTnfZSoRp/nTRLcm5X3LgFwWkxD0oIjx
	g4+Xv3GYSx8Lz6aodZrMRSEfsgtf+jRAhCZFkx3HYsaqtNs4g84EFJBTHa+rgNuHygidoFGBmjN
	ETLeZP4RMymNpB8AOCwZw85wYLjBXTuGox5NfwwgQ
X-Gm-Gg: AeBDiesSMrpGWSxlBMlVKrGDKjgC+UVs1xxGw2qBn9dhjM00HZMdpgzau6+QMda4nyM
	98YfgC4/rHmwZVE0ONFGiRXt4ahITxXOpSwyZsJEP0y4f35Gw5PIBU/Yo47WNKau3rIBGe5HQQT
	dwXpbws9Byx7xQtXTqmS9ZuCVc1BFAv1Pvs1/kfD1F+sGenxhpW0kVe6bcl8vZOa3P/zgddkC+L
	PTTd3q0cFQJabnWlluZ1K9jWrdNChpjtNsJiJVF7MAr6XAcGpFFi8Md9GTmZ8k6h7oL0Sz7RVlR
	OljkK4200CQ2JEnf0Fja0InftXiPQfTOnOYLUdtCi7jk4yLe2HMH3wo7jgzkrvs=
X-Received: by 2002:ac8:5dce:0:b0:508:fd42:fd05 with SMTP id
 d75a77b69052e-5100ddca71dmr16116641cf.15.1777395829071; Tue, 28 Apr 2026
 10:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260428103008.696141-1-tabba@google.com> <20260428103008.696141-7-tabba@google.com>
 <afC5_jrTEVRfJ77x@willie-the-truck> <CA+EHjTyTy2qLm=CbOOYR6rmjg5tH38PifAV+qAhbZxidY5szxQ@mail.gmail.com>
 <afDnCiQNJrP7UI2m@willie-the-truck>
In-Reply-To: <afDnCiQNJrP7UI2m@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 28 Apr 2026 18:03:11 +0100
X-Gm-Features: AVHnY4Iz1X_G7zdc-Gxn4ezijbkjPSVmpE0EY2ldntjmUXB-MEgat-SQsLz5Onc
Message-ID: <CA+EHjTzO1=LvBF0UFXu=ubO_-TezykxLap9c8CxxvuCT-=3SUQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] KVM: arm64: Propagate stage-2 map failure on
 host->guest donation
To: Will Deacon <will@kernel.org>
Cc: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, 
	vdonnefort@google.com, catalin.marinas@arm.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_100351_876079_2DA72571 
X-CRM114-Status: GOOD (  17.48  )
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

On Tue, 28 Apr 2026 at 17:57, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Apr 28, 2026 at 03:36:43PM +0100, Fuad Tabba wrote:
> > On Tue, 28 Apr 2026 at 14:45, Will Deacon <will@kernel.org> wrote:
> > V2 will drop two patches (in addition to the HCR_EL2 one), and will be
> > as follows:
> >
> > 1. host->guest share and host->guest donate (kept, rewritten): add a
> >    memcache-sufficiency check during the existing pre-check pass
> >    (option 1) and return -ENOMEM cleanly without touching any state.
> >    Restore the WARN_ON() on the subsequent kvm_pgtable_stage2_map() =E2=
=80=94
> >    with the topup precheck it asserts an established invariant rather
> >    than ignoring a reachable error.
> >
> >    For the single-page donate, "topped up" is
> >    KVM_PGTABLE_LAST_LEVEL - vm->pgt.start_level (mirroring host EL1's
> >    kvm_mmu_cache_min_pages). For multi-page share I plan to use the
> >    conservative nr_pages * (LAST_LEVEL - start_level) bound and flag it
> >    as conservative in the commit message; happy to compute a tighter
> >    alignment-aware bound if you'd prefer.
>
> For now, I think we should just check against kvm_mmu_cache_min_pages()
> because that's what the host is using.

Ack,
/fuad
>
> Cheers,
>
> Will

