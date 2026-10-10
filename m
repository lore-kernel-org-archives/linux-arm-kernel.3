Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D49ECA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyYO4S8ARmzSdCuZ2VSg1OgVPsWiGyr9h3oQcinEopw=; b=f1ena/lro5+UpU6AJdYYbLmdj0
	mzxBVgEE8yQlr3XN7Wl+SKfBkqFf3gJdysAID8z7sJGLDV1ZbCfYL6ovDjoFxVuEUeq4YkXfDdqz+
	cdehA1TnXQTRzcfxegJJtnOhzHJUTVxmSEKNIzAFXsh/WfED4x5nLx5Fgnp0AbSZWudWrc8B8HOp6
	7eePpotU9E4Ky41gq4nMIPM2Jlwa5zW01K7RQizekTQrhA1GbE3LKKYfqfLKoRcxpc8okVtWgn6V7
	dRHG5aeHbhsolic8utIyNZUkoiXOt8pIXVoxNG1jSIm6kVIQtGQ413lCESYVYqLoF8CfUOTgJIGW2
	lIDbxKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTgw-00000007nsM-3ljx;
	Sat, 10 Oct 2026 09:48:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTgv-00000007nsD-0grX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 09:48:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 78C2B43EE8;
	Sat, 10 Oct 2026 09:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF351F000FF;
	Sat, 10 Oct 2026 09:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791625712;
	bh=vyYO4S8ARmzSdCuZ2VSg1OgVPsWiGyr9h3oQcinEopw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aklk+sjoCwd+IaoDl//Y6w5YbjwYwKjvCWj3vTOhcOKS4XKX3RqfWc30ZeLOfkL6K
	 dJ0kOmpLgnaj5z3G+2kf7Uglg1K+fjgTe7bbx87jWc8UGoaqkC7P4LItBpwxLyb2oW
	 0acFJ5n/e8n9YALfwvX4m0STUvG4IjMNmynjTtG5k3cg1FP9oF4lEZWRGcJiKNztN4
	 vOGviLgqnPOvoSh+RkoAGeKzInLL1fHgwndw+BppvkrRKo7DlNs8eigXSV7IauLgKC
	 KiMFJS9LX3hGZOZIAZ9Vmdxig7sfhfFnxF+cuHF0SLK76dZSIs7NJrDf8M4ZruK+MM
	 D4SFYWqzmEvGg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xFTgs-00000001JvU-072w;
	Sat, 10 Oct 2026 09:48:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Vincent Donnefort <vdonnefort@google.com>
Cc: joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	fuad.tabba@linux.dev,
	qperret@google.com
Subject: Re: [PATCH v1 0/2] KVM: arm64: Fixes for hyp_trace
Date: Sat, 10 Oct 2026 10:48:27 +0100
Message-ID: <179162570115.845708.14917673397009490198.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008104212.3134550-1-vdonnefort@google.com>
References: <20261008104212.3134550-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, vdonnefort@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Thu, 08 Oct 2026 11:42:10 +0100, Vincent Donnefort wrote:
> Here's a couple of fixes for hyp_trace:
> 
> The first one fixes a potential 64 bits overflow in the hypervisor trace
> clock.
> 
> The second may prevent tracing loading for certain buffer_size_kb
> configuration. This one depends on the allocator, so I have based the
> series on kvmarm/next.
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: Prevent 64-bit overflow when computing hyp clock rate
      commit: 6164ce3491bcc3a27a2e2e9260a286eb2df2301e
[2/2] KVM: arm64: Fix bpages backing allocation size in hyp_trace
      commit: aac4560e1287c36196fd2d78bf04d0c1c2559e3e

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



