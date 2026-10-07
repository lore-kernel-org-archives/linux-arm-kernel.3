Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4A3CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/01lQesds7Qu15IlWJStcj8pAkrlNp3+XW9pTMK80Mw=; b=3clhcNYyZbwO3fQy8cG89xbUJa
	QiuWqkMfxJ10m20feyVwHNizmjdKdKyI5+njFi2HEosslwqSKRTAn/AbqdYi+oLwOPkLSxWug57hc
	k2cRTUL9Rp1Ukua1nSLhTB1Mi5WEmRzWzh9maR+ldu0yAZgV2QnWSJSu1uU69d/hlDe0xbAhpLw78
	4ecDLCS6ep0VNHnafK8LF5GF6TRsLRlrdFmsd+5I65lKmWYXIDFFRimTD1QB8wOwzYTboe0WmvWSG
	hOWKRfybw18IL6TnfYAhIOw6Bwe70C4/T0DJWxcq38qvxEKahWwCRQFvPg7F54Jg0dvY+WNpidcJK
	u6zcuSYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEP8U-00000002D65-0CGy;
	Wed, 07 Oct 2026 10:44:34 +0000
Received: from out-30.mta0.migadu.com ([2001:41d0:1004:224b::1e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEP8P-00000002D55-3RUu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:44:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=/01lQesds7Qu15IlWJStcj8pAkrlNp3+XW9pTMK80Mw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791369866; v=1; x=1791974666;
 b=ORWhDxxZkI0U4JGf7NsOpwDiVb+2aZ5xrz8z0GNale1mwHcKxKIk2K9GNw6d2dJRo96bo6U4
 HKDxTW0XNk9PdzlKTYKH1hPOUaNyikCFOfhgZz8Jh1bagYzed6B7gf6V6PDj2SwDA9s+xFppMAx
 97lemgnHFT3B8iDNGP+8eoMY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c0a41cdcbea61c67;
	Wed, 07 Oct 2026 10:44:25 +0000
X-Mizu-Trace-ID: c0a41cdcbea61c67
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5459e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 03:44:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwv8rEFpYgb6vcjO0rI+1p9esTUutD9bDFPHKnQ4o8jiAMduCoJJoRfvpSjVyU6JYV7wBH/zwamfuKQ3EO3LZp3@lists.infradead.org
X-Gm-Message-State: AFq9FYKtGE8OlQ0vpCIiGMsjeIuPeKryhZCfCu55i98eiHMTI2uu7j/Q
	8lXkjYgM2yW95uBpxwoja+eV4bwkYOcnFX0y5zwFoweUKbtwImuf4eTwLeZslbs241BdlmsWY8W
	7fhG9MwRvIVb059EWvUEfm+vwiYShU2M/SSJuYI/M
X-Received: by 2002:a05:6512:2c9b:b0:5bb:27df:415f with SMTP id
 2adb3069b0e04-5bcca969b08mr280500e87.15.1791369860573; Wed, 07 Oct 2026
 03:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-2-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-2-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 12:43:44 +0200
X-Gmail-Original-Message-ID: <CA+EHjTy44W8srPO2y2MJT7nijeWcek-BLsiwYfSPXVOA8DpRCQ@mail.gmail.com>
X-Gm-Features: AclHuK9bYO3-lIjbLvu1WEmia2gdqzHBdvJpWxSZu00WMWjDLerDBVC4C9fwiYI
Message-ID: <CA+EHjTy44W8srPO2y2MJT7nijeWcek-BLsiwYfSPXVOA8DpRCQ@mail.gmail.com>
Subject: Re: [PATCH v23 01/14] KVM: arm64: protected VM: Handle user writes to CNTVCT_EL0/CNTPCT_EL0
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_034430_677639_0711B13D 
X-CRM114-Status: GOOD (  14.59  )
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

On Wed, 7 Oct 2026 at 09:35, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Protected VMs doesn't allow setting offsets for virtual and physical
> counters, as the offset is always fixed to 0. The VM ioctl is filtered
> out based on the cap. However we don't prevent the userspace from trying
> to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
> a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.
>
> Fix this by always "fixing" the timer offsets to 0 and marking that the
> timer offset is set in the kvm->arch.flags at KVM init time for protected
> VMs. This prevents the access to the VM specific vm_offset at low cost.
> A userspace writing to the CNT*CT_EL0 would observe success, without
> any real effect. This is cleaner over spilling "*_is_protected()"
> checks and "matches" what we really do in practise. i.e., always run
> with "fixed counter offset of 0".
>
> Reported by Sashiko
>
> Link: https://lore.kernel.org/all/20260908164641.416911F00A3A@smtp.kernel.org
> Fixes: f7d05ee84a6a ("KVM: arm64: Prevent host from managing timer offsets for protected VMs")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

