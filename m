Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5683ACAC587
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IedR9gLTqIst+0+I6/rCBWY1cT0eeORo9UueU/viVUs=; b=YDR1pb34H+hQAmZfmXcbrSyzMc
	DOQgmLpQkXsnXk9vJP2kfiefwD3MqdGAButI2d4MWVzz23CTDOqjspeLa2WM3T292zTcHJDGJIveq
	/iWiEH9xtT6lDxJg/WtIa1JyTflqtfC3TdhFppcnseMIW6PUup3D7EnlFAKJzk19SP7izN/Ngxyh6
	PI/Nzgy7l0cIeACDsf2M9Xc4VMqII9us0Jid5Ip+1JJQ224pgoV0vm9PKP68HFJbsgVVqL8EdtI02
	iaqjMJnBxI+lxdvZNtc8kpXa00DGHvivAS1Buhf6MGD8v2mIdCcjndgJXP5TAq+ztQ6YAVgZQi9t9
	wmExawCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomJ-00000006lBg-0YtE;
	Wed, 03 Sep 2025 14:48:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmHN-00000006L0F-15Hq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:07:58 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756901272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IedR9gLTqIst+0+I6/rCBWY1cT0eeORo9UueU/viVUs=;
	b=xw/ZxplnLljYchtWLlcn8/J04+jjSWmOTBlUk/gySEikZE1mr57Wbp1d7/9uobUQVXr1Re
	PC9yMoasYgYWcYxeqatqpDgKLJmb40+9epAxAishKhajLizLCIN9729JQvO7m/3rmiu/NV
	c1bV6U/02I5tY7qN/w7XgBt89Kxh8LGPRpfwRKpL97zHuWBXP37P1ZxEGB0m1Mk3lizpPw
	ElIIjQbOpvCqDh65s6WA1OPxwtBnkcofkLE4U9Ke3iJyyxI25x0bc/0CMoV/l8QFoo7phX
	SKcImogCcFIxEKkB14R83VYNQa+wb47PrXeePbZm74VoH2n9SMxVYLYSwg4NKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756901272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IedR9gLTqIst+0+I6/rCBWY1cT0eeORo9UueU/viVUs=;
	b=jPYvEOdCiB5SxSTGT9FwgczyLLPEoJxm5A6QgwYbgaVy+O/K2p/7OfoPcRKZ0HSfnwhFHD
	iXWyk916Zaz6ZXCA==
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
 <kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>
Cc: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
 <Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "will@kernel.org"
 <will@kernel.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH 5/5] irqchip/gic-v5: Drop has_gcie_v3_compat from
 gic_kvm_info
In-Reply-To: <20250828105925.3865158-6-sascha.bischoff@arm.com>
References: <20250828105925.3865158-1-sascha.bischoff@arm.com>
 <20250828105925.3865158-6-sascha.bischoff@arm.com>
Date: Wed, 03 Sep 2025 14:07:51 +0200
Message-ID: <874itjzqlk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_050757_435509_6C660250 
X-CRM114-Status: UNSURE (   7.57  )
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

On Thu, Aug 28 2025 at 10:59, Sascha Bischoff wrote:
> The presence of FEAT_GCIE_LEGACY is now handled as a CPU
> feature. Therefore, drop the check and flag from the GIC driver and
> gic_kvm_info as it is no longer required or used by KVM.
>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Assuming this goes through the arm/kvm tree:

Acked-by: Thomas Gleixner <tglx@linutronix.de>


