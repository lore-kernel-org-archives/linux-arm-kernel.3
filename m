Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF23E77169
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 00:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHzpDF1jzcP3VpWgxBFchha4CS21XuWcdfL49+iiQ0E=; b=ZBKma2fvS1pxTlCEzHLsekVC92
	nUhx7dxDlJ/BHlLc4wcHrUXWoFAYLpt8SET686LxQBHL6ZkLaQPjW5r9gdsrYQsZp2GTBGtMHgKYG
	FCPLr4asnTJuGIXUVqpjOx1uugV6RSNVH/O1oYHCZZNykKc95v3rrlH9Qx0k1WTlZE8uTx2n/xNwx
	sN2HiGC/MdyhV9lv3Mvo3tac9yyyHJleSZy3aHvO92wBIGhQUO3PwD8SjCTFpRSuwGwNGpIRF5OCb
	V2wk23WOsTQt8IvsFQDzwSq1nU+a0a9LO0HcuUtDnk1Ob0XZnrBofySdbQzA+oPblkchrbZnSchnW
	2aJtl12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIdR8-0000000B8Iq-3ilb;
	Wed, 04 Dec 2024 00:40:14 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIdQ7-0000000B8CZ-3ZYa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 00:39:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733272748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PHzpDF1jzcP3VpWgxBFchha4CS21XuWcdfL49+iiQ0E=;
	b=r0zCO0D6Jv73i58Y6pPl/v5stz8NpgYMGRbZWzvRoOW90VM1d1p8ZMqaPUIodz+5RUqpxQ
	d8KnHX055C2Apgk2tZGJbFxLH9ieGp3v2A7jXIJu0YlzbeJ6UXIMKLkCNahBHfw7lKKilK
	5zbV6CAG4FvVcqhfSifgskfTV5orjcg=
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v2] KVM: arm/arm64: vgic-its: Add error handling in vgic_its_cache_translation
Date: Tue,  3 Dec 2024 16:38:54 -0800
Message-Id: <173327270647.1289915.12344203563872763499.b4-ty@linux.dev>
In-Reply-To: <20241130144952.23729-1-keisuke.nishimura@inria.fr>
References: <20241130144952.23729-1-keisuke.nishimura@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_163912_163551_7A972D6D 
X-CRM114-Status: UNSURE (   7.66  )
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

On Sat, 30 Nov 2024 15:49:53 +0100, Keisuke Nishimura wrote:
> The return value of xa_store() needs to be checked. This fix adds an
> error handling path that resolves the kref inconsistency on failure. As
> suggested by Oliver Upton, this function does not return the error code
> intentionally because the translation cache is best effort.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm/arm64: vgic-its: Add error handling in vgic_its_cache_translation
      https://git.kernel.org/kvmarm/kvmarm/c/be7e61127422

--
Best,
Oliver

