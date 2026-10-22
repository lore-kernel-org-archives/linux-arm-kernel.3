Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92EF606B7AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uyUp8mFJ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lebqlN/r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UhyAbw4qoriwhozaXu+XfZddUYSkASyU0+JOd2C+mS0=; b=uyUp8mFJU1+Yyq
	dEYiw/HIUs/7GMjfggs8aVAcfa75AwQ40ILF3WVDxKaV6XeT5O53tF7Lsy+odNLzqEJTFKGMM7ulJ
	tgeCMEGF2jv+KrRUbwjdTErq4eZjxXrub+tBe26DxHFgfcy9kgA5/DN8DOux8kD2Ac35dWg9o3R/L
	dYtjjS+A3GWJFFEuBHl9OsfpTQ51DiOD0lgXqBWSADSANRuDfQmIc6kpYyoL+RGvpNvUClaKmpswB
	NgDIIRGQ6JaPwmV5uojyj55kXoJubq9yU5nMUUkgCInPd4pVJ6QMEX/n1/vIr6Gxwjn+dAA0kFwqd
	boGWixrHZEvDXZm7EdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwh4-0000000EabV-1qM1;
	Thu, 22 Oct 2026 17:35:10 +0000
Received: from out-11.mta1.migadu.com ([2001:41d0:203:375::b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwh1-0000000Eaat-0RuW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:35:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=UhyAbw4qoriwhozaXu+XfZddUYSkASyU0+JOd2C+mS0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792690504; v=1; x=1793295304;
 b=lebqlN/rZSsxlA9jgeH5wG+Q4iXisCDTIskkPc699DogTycxxjFuIW4eB1IprKxqe1mzVFaw
 4vuY4gCnQkLD1W7tCzdujt8PVzEe9sArx+9qTa2PAOtNO0KFgcDN1oRaya6pHqRb4hxCzpmE+uF
 YQUyy4ForQ57xq9RUe0MO/P8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3b6a465357a79fe8;
	Thu, 22 Oct 2026 17:35:03 +0000
X-Mizu-Trace-ID: 3b6a465357a79fe8
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	tabba@google.com
Subject: Re: [PATCH v2 1/4] KVM: arm64: Make __vgic_v3_init_lrs HVC always available
Date: Thu, 22 Oct 2026 18:34:59 +0100
Message-ID: <20261022173459.3692613-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022140048.2522787-2-vdonnefort@google.com>
References: <20261022140048.2522787-1-vdonnefort@google.com> <20261022140048.2522787-2-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_103507_820265_9733E255 
X-CRM114-Status: UNSURE (   7.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

On Thu, 22 Oct 2026 15:00:45 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> The __vgic_v3_init_lrs hypercall only resets the vGIC LRs. Those
> registers are expected to be 0 when the host is running. As a
> consequence, it is completely safe to make it available at all times,
> even when pKVM is enabled and the host was deprivileged.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

