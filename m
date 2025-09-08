Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB5ECAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 02:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVGGqRZBAm24OtLHJX+wyXUcc8yBv/hwqlqTCh+kbiI=; b=rsKbXuCMXQtyJUg368Fw0JWw8X
	p1HQBncQIYbXNoDC7pFP7huezfPUQcxZpjix2BkGJkFa0JAgPpj3EhgHpGZ71t+Mm59fmCX7HIqWi
	usm0SgcDkzuGIsehHUG7gJanqP1TsGmCpqXojVfNBLTl6ZH4LzTOkUv0U12fp/O07+p9NVxVNZZTt
	SSR0bKSPCyqSAhw52OwLhANh7h9bxzluX7KNt4z8aZiF2KeXLXeVD8YZSI+wn/qychpU/5ZN95tnQ
	2qRUCVvHi1e5RS54pxW65C4jbC+I85t4+DoxtRaA4h7TqK0exwhsJ48QBPwKUhOnzrZLQc5qW7psN
	xJdz1CqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo5o-00000003gwf-1Nur;
	Tue, 09 Sep 2025 02:28:24 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgX3-00000001X5f-26SB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:24:04 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757355815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVGGqRZBAm24OtLHJX+wyXUcc8yBv/hwqlqTCh+kbiI=;
	b=D6rKnMvef2XGDvo9OwgPQQ3inWRixjXsipxt2M7RJVwLnY4Iq3qWvesP8y5QqgvP2qLdBv
	YV5oobdQrWxYjDbX5YoiWAK6bqsImHyddB2e5uM4mCL9Jec3RemC7Laia3BbXDNKVkypfo
	imMM7/YOWf85hVWpiUgeRt0p6Pm9uj8=
From: Oliver Upton <oliver.upton@linux.dev>
To: jintack@cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Julien Thierry <julien.thierry.kdev@gmail.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: vgic: fix incorrect spinlock API usage
Date: Mon,  8 Sep 2025 11:23:23 -0700
Message-Id: <175735577932.2363175.14048203051041035424.b4-ty@linux.dev>
In-Reply-To: <20250908180413.3655546-1-alok.a.tiwari@oracle.com>
References: <20250908180413.3655546-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_112401_676027_DA903963 
X-CRM114-Status: UNSURE (   7.27  )
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

On Mon, 08 Sep 2025 11:04:11 -0700, Alok Tiwari wrote:
> The function vgic_flush_lr_state() is calling _raw_spin_unlock()
> instead of the proper raw_spin_unlock().
> 
> _raw_spin_unlock() is an internal low-level API and should not
> be used directly; using raw_spin_unlock() ensures proper locking
> semantics in the vgic code.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: vgic: fix incorrect spinlock API usage
      https://git.kernel.org/kvmarm/kvmarm/c/2d0478279fc7

--
Best,
Oliver

