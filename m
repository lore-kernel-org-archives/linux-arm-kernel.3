Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3076CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 13:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOLf8afyt5b6SOANC3rqCkf69jr4nV59FAjYhwNBzS4=; b=qLtZNe+asoD8pGZ6iDrdwwgNHA
	6FIFfzNmODCJ76Syjt/S+U87J8b25eK9ZoxBKy6c4QQtXQacVQnnMUn93Oi0f6JfD4dKDYUrk1ALt
	hliEqRLcpRs+X/Ns2Hdj89jlSyORbHC7FN56SRXJ2tj6MNSBUVKVtpo4gKhCvEpg8+EYHMUZc6WIj
	RFeyOdrAoU1oZbRVZed8ZQE+saZTZ/AatgzhKCZ8R+CYSvw6772X6WYKZI0tqJ+1TI1UNFUou2aXv
	Nn3mcyB6mo1pf65zcEqcuq8bwPnJQkGjiZ1TbCSBe2HIfO47L/z5c/oUxOC1RpR1VmoroFQVOF/++
	Zxo4gkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERyS-00000002YP0-0LJw;
	Wed, 07 Oct 2026 13:46:24 +0000
Received: from out-198.mta0.migadu.com ([2001:41d0:1004:224b::c6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERyO-00000002YOD-3QVc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 13:46:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=EOLf8afyt5b6SOANC3rqCkf69jr4nV59FAjYhwNBzS4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791380777; v=1; x=1791985577;
 b=pMaIfFjLufpE3dLK3ghIVpudyLQIxDW6wRaz/lwJASUL87maSvpBCgLzbRNhDDhRyGD/T6bL
 QcEkuEFjf2BtXqEfLoeiO8qt2RQZfSoc8aPzT6xDgVPPv5Dglb4bLU/9WqsAgpzATyhF4t+2U6e
 uwwQo9K8v0baKZ9xmsmVL8Gs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6f1eda9f8b5f66e8;
	Wed, 07 Oct 2026 13:46:17 +0000
X-Mizu-Trace-ID: 6f1eda9f8b5f66e8
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so9220e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 06:46:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzEJwemyJ0XuJCv3Ax1IboS2eGS4YG+XXKIVIep602giYaCrEYVF9UTCkKZ6jYUTvM03GxF3yhVvfu1nV8AxX+k@lists.infradead.org
X-Gm-Message-State: AFq9FYK/I/C1xcOPmnXTsKU1E/QMut6oSDTGb+5QTZdGmCwhKbjiM0bE
	6ibj7a6NZd4KbOhj4ABFLc8PmtLtd4/sA/iIa4x9QYgUbaHuw1MeINhIZIETODUicg8yrxeluT7
	/0TOx3A1v9Nr8qycnMdTWjMM/EUoHR9b8r97O6M7I
X-Received: by 2002:a05:6512:a83:b0:5bc:b531:51ea with SMTP id
 2adb3069b0e04-5bcca86c249mr304368e87.13.1791380772866; Wed, 07 Oct 2026
 06:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-14-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-14-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 15:45:36 +0200
X-Gmail-Original-Message-ID: <CA+EHjTy_1EekD472UH=CDSpC7oksdy3eS8AP0rPxKkhQ_PyXdg@mail.gmail.com>
X-Gm-Features: AclHuK_J8GmFTVM33wX7R0VP_JP-fZesKaU03j7TLtkYQU0t9fz-B9AOXRmoM04
Message-ID: <CA+EHjTy_1EekD472UH=CDSpC7oksdy3eS8AP0rPxKkhQ_PyXdg@mail.gmail.com>
Subject: Re: [PATCH v23 13/14] KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
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
X-CRM114-CacheID: sfid-20261007_064621_285376_42986952 
X-CRM114-Status: GOOD (  10.04  )
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

Hi Suzuki,

On Wed, 07 Oct 2026 08:35:36 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
> pKVM does not trust the host. Realm VMs follow a similar trust model, with
> the Realm Management Monitor owning the protected state instead of the
> host. Add a helper to identify VMs that run under a host-distrusting
> hypervisor.

When I reviewed this in v21, the Realm patches that use this came
later in the same series. Without them, kvm_vm_hyp_is_distrusting() is
true exactly when is_protected_kvm_enabled() is, and protected mode
already doesn't register a GICv2, so this patch doesn't change
anything on its own. Should it move to the series that adds Realms?

Cheers,
/fuad

