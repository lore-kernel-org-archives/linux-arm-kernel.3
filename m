Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A1BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 17:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3aJycHRGyL1a+2uBavRRBDprR05fm5AmwSm2JSYILI=; b=uLvNpB3AoDDSLHZkAGMJlq3kNc
	Y1rHG7pkRCsByC5R/BNVL6YYjtLlER0Kuwxpq9LgOXYvOCbABdWoG+4Ly11BVxia9p7ynE9FPi74O
	wK8kDA2TXNXPnQG7uakNchqusXPfpiu5s2ydOrethTlAfFYAU9aEiB25vznph93YZ1t8LtC5rqVBr
	dslY/o4f79TC1ZCO3NaBwPwcoUHZF57EYPj7YaHFqBA0zhu13VNAIyOgb1BnT4hQr6V9zQDCZgQvb
	vT0xqav5oFv5AXh4PswckN+YIpoqtl/tBQ84zuhrH6fmYflFJPfTJ2aO7Edcv3QJYyIWwLTHzvJsK
	i3N28HSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukRNZ-00000003RZQ-2GU5;
	Fri, 08 Aug 2025 17:59:45 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukRG1-00000003Qtl-2KXf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 17:52:00 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754675515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3aJycHRGyL1a+2uBavRRBDprR05fm5AmwSm2JSYILI=;
	b=QUPj2JWM7vjVN5vuRP59WuDjApuBKY+rlVf6six6X8M6RVR0evhG503jgPq21MN9LaAnzu
	ZqqesYURlyVxbjOwNmsVxQ7IdDS6XLqt4Eq8vtbzOf/QOWFdxeZs0z4cWb5/HFSMMez/9/
	EMi+hsTaYMpq+bx+IT+1qbhpTib9xOk=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	ajones@ventanamicro.com,
	Sebastian Ott <sebott@redhat.com>
Subject: Re: [PATCH v2] KVM: arm64: selftest: Add standalone test checking for KVM's own UUID
Date: Fri,  8 Aug 2025 10:51:34 -0700
Message-Id: <175467548067.670500.2669324809464970988.b4-ty@linux.dev>
In-Reply-To: <20250806171341.1521210-1-maz@kernel.org>
References: <20250806171341.1521210-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_105157_743324_6C4EEA8D 
X-CRM114-Status: UNSURE (   5.91  )
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

On Wed, 06 Aug 2025 18:13:41 +0100, Marc Zyngier wrote:
> Tinkering with UUIDs is a perilious task, and the KVM UUID gets
> broken at times. In order to spot this early enough, add a selftest
> that will shout if the expected value isn't found.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: selftest: Add standalone test checking for KVM's own UUID
      https://git.kernel.org/kvmarm/kvmarm/c/85acc29f90e0

--
Best,
Oliver

