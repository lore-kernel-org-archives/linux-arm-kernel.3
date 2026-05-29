Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA69CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f05sF6HcNfeY9NaPK45KVgik8aSR3ZDOtTZVDoaoPk4=; b=i5WAuDJyONqHj0+b2TzxfDQnVy
	IuAR/KKZvWzT92a2AM8t3uWvenbPuV+rzlCnLmbTZEnB0/lilKlvgfw3iAGb8HN5/VJBeQ7OOLtOk
	t3GXa/0/jeMLtf3X33pJJnrMj57mviJnBsB9C0bg9mIkn14UG1FOWAZPPHmF10fXfER/Sig0M7dkd
	dxYW6XtnAOG6t++Aknn7lcpFnNyzeVAZOGmRlX/A/FdG4fAT+0dy+y14RPFxLbCX4lVfsBrIOvv+N
	F12ccy3k9HGr7qTgn5NwETOB4s5zCRty3SeSNmT84WagziuTTGhlIxZhwXVwqIFD1Um5fT3APDB3M
	4O7tbwQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsET-00000006vi0-0w2B;
	Fri, 29 May 2026 08:06:17 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsEQ-00000006vhO-1pIp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:06:15 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-516d78ba1adso1391cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 01:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780041972; cv=none;
        d=google.com; s=arc-20240605;
        b=PzgWb5BR8f8f0gmBH6/knZLBDikvL1T5Ra39jGx33MuGaCmDvmeITZlipbqv/z88c4
         TEF7p+thxyu2xdHmBFQ1aLqW2b7oJJJJ4w1K3dZkMVvbMlu6jsr04ERQA8SpfIpVqwXy
         5OJL2YDiDmrpXhqzZg6DKfIAi4cLR5gs9VXAydQ9UmcfI3PVBg9xhyqDyz7R02WboMMb
         NrOLN2ztAuHureAb/AZViJzzRmMNExGHrcZsMUXlRrYJro2FudB6as+/JwL5flX8u2g4
         lYrut0eDjWBMyrx+RYaFnD9eUm724aAGwE3HFd5ovOtRsbL5e7Y5nSvQNro1FjM+suan
         gg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f05sF6HcNfeY9NaPK45KVgik8aSR3ZDOtTZVDoaoPk4=;
        fh=8Nzesn9HO1AlhkL22Wg2/538k33jhvNwDfl2csKCMjo=;
        b=fxTqjQk0FcHkgW1C+bxqY10uE6JKGlHyoSf8sl4l68BJMbz7y97l+yYPWdv5OBHz8i
         6rxY5gs8XKW8mSrDngoggfBuuXhhyhMMjbcWBo/JLdWTFMU/vW9j0WQ33Imq7GxcWiNr
         2+ZNXraOlSkC7vrQzM9zTTUOL/RNxJ5T//9ToaHc9bzKWbtZ1ObRtgXoWkRnXPLaH7od
         2j/quuvIEOBjQgBcChRaz6zqgDM/RimSD9SeSbLXR1axNPUj3MZenHq5PHSk3ncjC46y
         YeoepGyDbj3BSGhc9bU2jEK7WaKzeOkBtcEesKPZ2buFzk0nxhNha2/UVB0hMHn4LopI
         sVoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780041972; x=1780646772; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f05sF6HcNfeY9NaPK45KVgik8aSR3ZDOtTZVDoaoPk4=;
        b=U53q5QPxhki2jvHl6Gew05YDgNflUA7fhTyu98K/xYuscZJm1SLduHFs/uFO4wREwi
         JrnUGPNf5v+4kS4jbAiuXCzcsVAAiP53LujneqEfLjMggKgo8X/7wGOtE7LD2NE5eezM
         Cdwy5uTzcICpCbTOfmiCenkMIckiOwC0fjlm6FKlU06GOjisGCJ8OkcnnhqHbMANaL34
         DOMKE4bIgdAnpluvbgFTJbazcyOLxUOlVNg16EhbFkSzt2agDYGwd6IymOzPkj7jxHL6
         GKDrDAk2svb67fUKLjHZoy3WannWZPui8VXQwL8hgfUqIsusWpi+fUsezF1qxUkt7vHj
         OY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041972; x=1780646772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f05sF6HcNfeY9NaPK45KVgik8aSR3ZDOtTZVDoaoPk4=;
        b=qrGiN/LhLRnxURB44Y2je9r9PWf4Rkq8W4UpHti+R/HnWg9197+uT3iAwtiq/d1Ms3
         6gcKdwaH+Oa94s3jZTn25Hu8Nj0lLbGBBUfyoQcbHITYzoPUid7yd9sIFaH1m9eB7APC
         vUCw90HsvJ9K7CCGy6PJ9PMBZtGnOy9DS32Qp/f6BBXKU8nVmwjDO+S93jFxwvfy7uQW
         kVtCxzzFOm1NDDabn0MXbyhYn4dShviZkfPpqjJZh6j41Dg2vSjFq80CKk+C8MfvuZvb
         YknLfLvObmh5sXqJVAZOSCTj7pzj2lxVPau8tx4Z7UP0j9I62vmAztSJZuUhx3xNSz6k
         +1dw==
X-Forwarded-Encrypted: i=1; AFNElJ/cigRV7HDujxDgNdW4DAr1mdxlJJEM45CwFzuwlnn+TKoVmEuo25ortaNC0FzTp7mxQPYdr1uPmz8ztqKq2ZrP@lists.infradead.org
X-Gm-Message-State: AOJu0YzYLTpxrRqdRXKEOv/moZROczc18ZQ2XtFjb4j5MGr4tPjieWAI
	/SCbHDJK4Mu1+ENdxghAgVst2ESBFApcswOvsKWBG3l3QQpgzdCWOsuFM/lD1oc1AxxeSDZpvWH
	JYvMzKAM78L7qicphXHElSwpkmAwIff52T2B/g5WA
X-Gm-Gg: Acq92OFWvgalz7YqJCuzzV/dq0gQBv6S3N2HfkKneop0gF+EF4MwKNFDfEnJ4y8ve5W
	1M9HT+N3Z2lz80eglmCLQhbRX7nB6yJkfo7vZPBjiPulRIF0eGxbEMJ5EHHLIgJU8Gb1toCquBj
	alz3j1VV96eenuNMskhL5LfZGFajJBmYOINLKZ2+AB2h+G7V7pTqwUPQlVvl4Nm0h5xQlQIh7si
	NfkSXW9muZeUs7Bb36nBUC6pl3h4Xq+ZVTlYJmhp7CfOBrK4TYNkJlpKShPfYKS3iX7OTtT4Ukb
	62y6tg7sBQ+BVc3dFzQ=
X-Received: by 2002:ac8:58d1:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-5172f749fe4mr4695851cf.1.1780041971660; Fri, 29 May 2026
 01:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260529074341.2271950-1-tabba@google.com> <ahlIJQU-1b0mayPP@google.com>
In-Reply-To: <ahlIJQU-1b0mayPP@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 29 May 2026 09:05:35 +0100
X-Gm-Features: AVHnY4IsnAKmofdq6nk2K3297Z-C7ow2zDSgBYFAHw1ynri3vQ-SBvvvAsaLYy4
Message-ID: <CA+EHjTxktk4-B6qcAOf4O26++M5s6CKkkP539s4dRBRWxZN83Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: arm64: Fix host/hyp tracking on share/unshare
 hypercall failure
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_010614_501480_4584E169 
X-CRM114-Status: GOOD (  23.15  )
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

On Fri, 29 May 2026 at 09:02, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Fri, May 29, 2026 at 08:43:39AM +0100, tabba@google.com wrote:
> > Hi folks,
> >
> > Yet another bug I found while testing Sashiko locally with fixes to
> > review-prompts.
> >
> > share_pfn_hyp() and unshare_pfn_hyp() in arch/arm64/kvm/mmu.c
> > maintain a host-side RB-tree mirroring the set of pages shared with
> > EL2. Both invoke a hypercall that can fail (page-state mismatch,
> > EL2 refcount still held), but neither cleans up on failure:
> >
> > - share_pfn_hyp() inserts the tracking node before the hypercall
> >   and leaves it in the tree on failure, leaking the allocation and
> >   presenting a phantom share to a later unshare.
> >
> > - unshare_pfn_hyp() erases the tracking node before the hypercall;
> >   on failure the host loses its record while EL2 still owns the
> >   share, breaking later operations on the same pfn.
> >
> > Severity is low (no isolation impact) and the failure paths are rare
> > in practice, but the desync is real. Both patches are independent and
> > apply cleanly to current mainline. In other words, this can wait for
> > 7.2.
>
>
> I believe I fixed that here lore.kernel.org/all/acyKhZL2di_QQ9xm@google.com but
> as Quentin pointed-out, there's absolutely no reason for the hypercall to fail.
> So I haven't sent a v2.

At the very least we need to add a comment, otherwise, people like me
and LLMs like Sashiko would stumble upon it.

That said, this fix adds no real overhead, makes the code clearer, and
guards us against a future where that call might fail.
Self-documenting in essense.

WDYT?

/fuad

>
> >
> > Cheers,
> > /fuad
> >
> > Fuad Tabba (2):
> >   KVM: arm64: Free hyp-share tracking node when share hypercall fails
> >   KVM: arm64: Avoid host/hyp share desync on unshare hypercall failure
> >
> >  arch/arm64/kvm/mmu.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > --
> > 2.54.0.929.g9b7fa37559-goog
> >

