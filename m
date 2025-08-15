Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42351CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQnrvh8fmmyw5mye4l3ThIw5bAHTdjRGTFjcTvSf2X4=; b=aYWSeAHRlt8z5ZHmZ7qtzUSBGi
	F0j+Jsh1IuSQ8d0q5q8uTBF+l1pdzBCiUwe2OpkRQ9W7Y9aiN7OXfxPzZ6zrfURizgp/wkN0KnZ1b
	sKCFUm/BsMYq0qKbHTZam+eqK9dzG+qVHkChjA3C+DrTBOygxKmsj8W+hl6upapvXByipX6b14TJ7
	Wltb5yZRmHXvGMdS7qYGOgqSMsKuZ0LTgDaUGEldSrpP8OCTW3iljGel0CPAdE+qEDjDHGmcUU0Ma
	QxvmAFZv88dwY1cnKj0UuFBKuNHG9gyu7EFEHxAkr+lCKC88KnSgUGmB3qoVrqm/r84HC+gTarLoz
	4fQQUuHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0uJ-00000003Qxk-193X;
	Fri, 15 Aug 2025 20:20:11 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umzXm-00000003Hy3-2DD4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 18:52:51 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755283967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQnrvh8fmmyw5mye4l3ThIw5bAHTdjRGTFjcTvSf2X4=;
	b=baJlH9tOVl/5B3c1jvUHXPDwLuEj7u1V4YReehcCH9W7Lyv4ukNVCxHgPfx5lLC5AgfOqo
	vLCSPJK8wMju85aVdnjOnsvbRw/kDnCh2Q7yLkE5fyaGS4Kn7QTtha5jeJE/OHjBgvknA4
	w5B58ztz22/Qg9zSajyFJl/yekRpOGc=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Correctly populate FAR_EL2 on nested SEA injection
Date: Fri, 15 Aug 2025 11:52:33 -0700
Message-Id: <175528391095.1010493.11054501106078213907.b4-ty@linux.dev>
In-Reply-To: <20250813163747.2591317-1-maz@kernel.org>
References: <20250813163747.2591317-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_115250_714638_4C768F2A 
X-CRM114-Status: UNSURE (   6.72  )
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

On Wed, 13 Aug 2025 17:37:47 +0100, Marc Zyngier wrote:
> vcoy_write_sys_reg()'s signature is not totally obvious, and it
> is rather easy to write something that looks correct, except that...
> Oh wait...
> 
> Swap addr and FAR_EL2 to restore some sanity in the nested SEA
> department.
> 
> [...]

Sorry I didn't pick this up immediately, had to find my brown bag...

With the typo addressed: applied to fixes, thanks!

[1/1] KVM: arm64: Correctly populate FAR_EL2 on nested SEA injection
      https://git.kernel.org/kvmarm/kvmarm/c/d19c541d269e

--
Best,
Oliver

