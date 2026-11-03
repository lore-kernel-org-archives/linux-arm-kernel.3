Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEA66085097
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nYI7jmGm;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G1IFRfsM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tWxPJzZwEoBsVUWyHIoViN5NlrycE+BNkSoICL6D6cY=; b=nYI7jmGmMuqpKC
	mf46tv1+4NJjHbVR08ENTCiNTT+aYt7GoyrEQKylrtlYJDRYBfSgjuO/zz0pr2pRpvCs9si4oN0Js
	yH5VkL4GYVLPFUMA6SBiuJUbvD9PehJs+zjBvA1vAB5TfR5FJyWfAtHwIoEH9A/ykLgdRUk5tPKeG
	grik/pvaYeoqF52RobOy6l7iRqlgCCf035X+tNVtXN5zA1jrnFzFnOpDR2JtSL/UfnI5F0MHGiZHT
	ky6n9HcyIU2U9ahXEjUGzPjZoh5RQjzH7/kOdDc8N5mGJiHtT/i5u565AXNSyf2XMYJw0g7ySCwB6
	eJ3PeR3LkRG3TNl9hQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDX-00000002Sy0-1cP3;
	Tue, 03 Nov 2026 13:06:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDT-00000002SvT-3fGD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4996042A58;
	Tue,  3 Nov 2026 13:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298B21F00A02;
	Tue,  3 Nov 2026 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711179;
	bh=tWxPJzZwEoBsVUWyHIoViN5NlrycE+BNkSoICL6D6cY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G1IFRfsMsfNhwvUPIp3LCRqhl4kH/da+XzUX45vDSJ0J0prTPqYKv2B2oSD9Tc5aN
	 o9B0atx6oVZLwSdoEl65Ec6NdGRB3Vg1j5Q8MvieJR2BIY3NQ0KSlwizrEX5ClSVdz
	 bjZJqTLNIVAJuhKlVW+70aQZBXK8cmeVnj6FG9H8KsOIyYX+k33fSbyG5asVexm+K+
	 WFE+gjZmXeMHygR2ULEOapK3S3ZT/eDFG0hgKhE7Y0tuSANS5/1WJOC75eebzHBUbY
	 bbRyfpW0PAQ6mJ59O5iMKwGYeQ8TI2eliUM9OCayKHUiiyk9elWlUVZ9CcpBvK+3IN
	 pzjtyoPZOlKjQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDQ-0000000ATWs-3vOV;
	Tue, 03 Nov 2026 13:06:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Colton Lewis <coltonlewis@google.com>
Cc: Radu Rendec <radu@rendec.net>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Raghavendra Rao Ananta <rananta@google.com>
Subject: Re: [PATCH v2] irqchip/gic-v4: Use a separate lockdep class for vPE doorbell IRQs
Date: Tue,  3 Nov 2026 13:05:28 +0000
Message-ID: <179371111254.2844725.1319552424303810824.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027180610.2840837-1-coltonlewis@google.com>
References: <20261027180610.2840837-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: tglx@kernel.org, coltonlewis@google.com, radu@rendec.net, oupton@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, rananta@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 18:06:09 +0000, Colton Lewis wrote:
> By default, init_desc() assigns the shared irq_desc_lock_class lockdep
> key to desc->lock for every struct irq_desc. Device drivers that
> register an IRQ affinity notifier establish a lock dependency chain of
> &irq_desc_lock_class --> &pool->lock --> &p->pi_lock --> &rq->__lock
> when irq_set_affinity_locked() calls schedule_work() while holding
> desc->lock.
> 
> [...]

Applied to fixes, thanks!

[1/1] irqchip/gic-v4: Use a separate lockdep class for vPE doorbell IRQs
      commit: 7100185bdc1162eb2eca1dd20a036314e27f1561

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



