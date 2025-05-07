Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD559C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QiXqTbAoYX6MJxj8ydzesyt/NrBTkMXp+GMNrceJNk=; b=e80GLMfEFhP3Pzff53gZBcBS4d
	ZoKOFwOq877uxXrVqFQDVlBsj78sUj3RH4rBv8tKwAn9imbzGtKm4sUedTXRNPEim8PLHCbYWgpkX
	SBHtRNagl8axzYIsQpJoMvXLrcrcg/O5QfRWfvRHYRcpMmu4isCo4bYusIMVqL7fASVTt5xpJtZHA
	7/jhkCKdFym8E/KhsWnpKrJSIkpJjzxptQyqj1tCiAcGdqLq68NDbI4o6oPqNS3x/G/+w0ToNDT0w
	OkxNAfLoPRpKdp6MF23F5vcwuT4JGzsf29o2LyfTjzkz2Bb99zB3dUvrNoRpAnpAmvKCdRLg5EBSh
	YIdOJQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCacD-0000000EpqX-0byB;
	Wed, 07 May 2025 08:58:57 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZeW-0000000EcuP-1gcK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:57:17 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746604634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+QiXqTbAoYX6MJxj8ydzesyt/NrBTkMXp+GMNrceJNk=;
	b=aVeinuwbHEBHXbuLoh36jZR1Xo9ESpnFyEiFtKztAdfY7WavM2ibe1qhYP5DtiJb88u+Zo
	cTR1FtdKRlDJimKA+RfjsEcd1/wFo87FoG12T6cvCkCGIVxikA4OAPj+JBFuK9HMrpqXcM
	n5VMgBAFiuV0NKLvJxkM4WIjw5isUeU=
From: Oliver Upton <oliver.upton@linux.dev>
To: linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	maz@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	qperret@google.com
Subject: Re: [PATCH] KVM: arm64: Fix memory check in host_stage2_set_owner_locked()
Date: Wed,  7 May 2025 00:56:52 -0700
Message-Id: <174660459091.2542293.13219475806929521401.b4-ty@linux.dev>
In-Reply-To: <20250501162450.2784043-1-smostafa@google.com>
References: <20250501162450.2784043-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_005716_574651_7D60197F 
X-CRM114-Status: UNSURE (   6.86  )
X-CRM114-Notice: Please train this message.
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

On Thu, 01 May 2025 16:24:50 +0000, Mostafa Saleh wrote:
> I found this simple bug while preparing some patches for pKVM.
> AFAICT, it should be harmless (besides crashing the kernel if it
> was misbehaving)
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix memory check in host_stage2_set_owner_locked()
      https://git.kernel.org/kvmarm/kvmarm/c/3949e28786cd

--
Best,
Oliver

