Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209B21125856
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+ve22NUc/82DrGKVPMAAR5+gY8/ChLtz+87jud+TMA=; b=IxyOr3YoIRZYdOi0ZvdZ/U1Fiv
	pStIVtHFX+wgsFVmp2EWWyBHLMSBP+noLxVeYk3zXj/SwTDw7KXMGl8p500A0T+QHIAT9eBxDiBQz
	D83R2IPmUTwiBSO6XDXeO+ODtpKLb8X5aOS7Bv8Qd3Ii0I8Nbu7WCxexmortAs6yJDVNTExxpl0/Q
	rYC+Kdd8bwT5A0vwimQYxhAofIeK0b0r9uuUVjKrZY5OHFFTpFhdxFlLj9BBVhAjpf3/WN2DHbwfr
	ELXaacprMPvGAHrVr5Xy8WLVHlutzhHcP7GMh2Y9atmVjfb5TBswnMq5kfZwpgC0L1Vl9ga0WxBvf
	5IaYtGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MtB-0000000BxN6-1dk6;
	Wed, 11 Mar 2026 16:58:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mt9-0000000BxMZ-0oKd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773248304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+ve22NUc/82DrGKVPMAAR5+gY8/ChLtz+87jud+TMA=;
	b=RyuiNT2frQYrJE+av9MsxOoDEqpQzOkXEO8juWRcKNrC4r9xHLUTZH+uFOdeiB5Vc9pFe6
	3QOrvOfQjhh2TGl33um/nLRpcpwA3hlrgq0jSOkzLjkO4g1gfYbesPN9Zl3x8Yb7SEhDkQ
	kECtmQGDlKTcSSIuBmZmwPsR861AFbQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-EHvfQraINnizHc6hKfQPBA-1; Wed, 11 Mar 2026 12:58:22 -0400
X-MC-Unique: EHvfQraINnizHc6hKfQPBA-1
X-Mimecast-MFC-AGG-ID: EHvfQraINnizHc6hKfQPBA_1773248301
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48534941525so536535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248301; x=1773853101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H+ve22NUc/82DrGKVPMAAR5+gY8/ChLtz+87jud+TMA=;
        b=BhRpTP4ts9nTFYZnQFlzFK6alHobJKgI6suvh27jLsqyBV1FGgrra7Zieov4kepadA
         LPHHfj//jVJ/AA2IhWPqlgxvT/+PtxJfbt/Kq84I6rqFxOYL15VlNutpRMLnK0Bq3qRd
         eLNxViylbNJX/gfIpFXum5CiWH8Mk96K8PS9l20xIOMEvzib07hxCwH7Db9mT8HJVI6k
         tBiHLHoefQP99EDcd3qtRiw8/MN0sV5gFUwU+JC1RXZ3HglXRMXLKgkRDbT7wgVbG9oF
         8Sf29dbKkYmYk1MUdtd8+vrpusXVALZxwXGbR/ONe1G7SEYXMZYbfCtXBkRn4pCLboUV
         tubQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4OH5jbjC8UEhPJ7gspiuR8ZkN+2S10q9OtZO4QVmO/GDs5F4WADegYPk+exKsTIS90eCdA3xTRtBkOhS7H3Qk@lists.infradead.org
X-Gm-Message-State: AOJu0YwMILMNaJc4ahaeUYwHrzb9ggIlmkZ6PXlNl4qX5wnMdYC8opbw
	B8cOYsj9rTAzMwfskqytD4xOc1EJYKQD3iuxS0dg5ZK5u1dgttefaRAOqc1fTi4TWqI69kEImJH
	s4IY4Nhyuc1Cc+Ts2m/ZFhhP3+1u6PsQOwndRgVZbLO4R9JyFm7UTIgUOG3IwaHzOkNwGE7haN5
	XpO9LcVIrvGhjK/c8c7XLlLoBLS4dl1M8LCP1MrIC2spQo46dLZ1U=
X-Gm-Gg: ATEYQzyNi9iL7iVa/3xrG8MRLan041OFoOVBt98nhz9gKMc4WS5M5yzqkUToIGnlACv
	FVrOP0yqSmLMTTCK7ZFedx0NS/1NoqddGKpWVFs9MjfOTzOk4Nl3ibzMT3ZcXsn3QuJmeYAwmvV
	yytn0yVXnLmXIyNYaSI05/5+XAP/gdpNKghAAU5JLuhhPcIAC0ipI9AUEXZYm+ztMsATmPjeK1f
	7af10YtHo76s3es2lnMcl/PywBt9A/PHX+ZNXMg/7FvJPw+n+n//kK+SpsU4THjvmhkk21XgW2v
	KfUW1C0=
X-Received: by 2002:a05:600c:6090:b0:485:4278:24fb with SMTP id 5b1f17b1804b1-4854b13c02emr57398025e9.32.1773248301282;
        Wed, 11 Mar 2026 09:58:21 -0700 (PDT)
X-Received: by 2002:a05:600c:6090:b0:485:4278:24fb with SMTP id
 5b1f17b1804b1-4854b13c02emr57397665e9.32.1773248300826; Wed, 11 Mar 2026
 09:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260306112231.3201502-1-maz@kernel.org>
In-Reply-To: <20260306112231.3201502-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 11 Mar 2026 17:58:08 +0100
X-Gm-Features: AaiRm51PO38kqfZhsYIxd7YNAH5su9wzPy7usJFrA0GOUWAfWq8bIhgO0jdmos0
Message-ID: <CABgObfYJqhj3xiM4_+7gCE1x5v5JQhyS0ox4+obrsZwA2W4GYg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.0, take #2
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Quentin Perret <qperret@google.com>, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, Zenghui Yu <zenghui.yu@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u73GLPf9epnOEdrnNlKSwJdPUUnot1U3vAsqzFc7hVQ_1773248301
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095827_300466_6CB8DCFF 
X-CRM114-Status: GOOD (  20.12  )
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

On Fri, Mar 6, 2026 at 12:23=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> Here's the second set of fixes for 7.0. The only interesting fix is
> one affecting pKVM and preventing the host from making forward
> progress when a memblock is not page-aligned.
>
> The rest is a bunch of low-severity fixes affecting the page-table
> code, some of which Fuad has promised to start cleaning up!
>
> Please pull,

Pulled, thanks.

Paolo

>
>         M.
>
> The following changes since commit 11439c4635edd669ae435eec308f4ab8a08048=
08:
>
>   Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-7.0-2
>
> for you to fetch changes up to 3599c714c08c324f0fcfa392bfb857c92c575400:
>
>   KVM: arm64: Remove the redundant ISB in __kvm_at_s1e2() (2026-03-06 10:=
42:21 +0000)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 7.0, take #2
>
> - Fix a couple of low-severity bugs in our S2 fault handling path,
>   affecting the recently introduced LS64 handling and the even more
>   esoteric handling of hwpoison in a nested context
>
> - Address yet another syzkaller finding in the vgic initialisation,
>   were we would end-up destroying an uninitialised vgic, with nasty
>   consequences
>
> - Address an annoying case of pKVM failing to boot when some of the
>   memblock regions that the host is faulting in are not page-aligned
>
> - Inject some sanity in the NV stage-2 walker by checking the limits
>   against the advertised PA size, and correctly report the resulting
>   faults
>
> - Drop an unnecessary ISB when emulating an EL2 S1 address translation
>
> ----------------------------------------------------------------
> Fuad Tabba (2):
>       KVM: arm64: Fix page leak in user_mem_abort() on atomic fault
>       KVM: arm64: Fix vma_shift staleness on nested hwpoison path
>
> Marc Zyngier (2):
>       KVM: arm64: Eagerly init vgic dist/redist on vgic creation
>       KVM: arm64: pkvm: Fallback to level-3 mapping on host stage-2 fault
>
> Zenghui Yu (Huawei) (4):
>       KVM: arm64: nv: Check S2 limits based on implemented PA size
>       KVM: arm64: nv: Report addrsz fault at level 0 with a bad VTTBR.BAD=
DR
>       KVM: arm64: nv: Inject a SEA if failed to read the descriptor
>       KVM: arm64: Remove the redundant ISB in __kvm_at_s1e2()
>
>  arch/arm64/kvm/at.c                   |  2 --
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c |  2 +-
>  arch/arm64/kvm/mmu.c                  | 14 +++++++++-----
>  arch/arm64/kvm/nested.c               | 27 ++++++++++++++++-----------
>  arch/arm64/kvm/vgic/vgic-init.c       | 32 ++++++++++++++++-------------=
---
>  5 files changed, 42 insertions(+), 35 deletions(-)
>


