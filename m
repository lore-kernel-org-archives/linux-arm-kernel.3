Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9707FEDF170
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 15:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onrgWi2oAZINKhV8f9/UljhcXnrDQmGruMBl74/kDHc=; b=EkkW8DUsuwaJ2/3mha4JntCI4x
	nUpI5G3/4mZF5t+fo231PoB+X2h8hge59h4IiQGuMeeEeTlsOGdqmhQSsQiZmEO29EroIFoKmvWk2
	Nqcu6fDO9kiFaZLkss3ZwJBIp6kDElg0QgXJlMQaR/+hb0IKmnizQzvyvE8sTdC4fGxcu+NTBXK6H
	thg7PKH4vfZlCbBdNRZbBhxxtRPKHrXm0pTdnZufPmEUmJmzPpciM/eUOLCbVzg2xkJZlbJ/R3bn5
	tXk4nUJnRTUW6YcqCN6QG49G7U5pHIOw9RmEpwZPidO4kfDNLp76WWAi8fm51E7zVDjIJeFkcUctd
	TP8Bmx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquhh-00000003aek-1aZx;
	Fri, 13 Feb 2026 15:03:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquhf-00000003aec-1qvl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 15:03:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 732926132B;
	Fri, 13 Feb 2026 15:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B5FC116C6;
	Fri, 13 Feb 2026 15:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770995010;
	bh=bwBJBP1hyUViZ0rrcDmZcdmQyIs7K+antF4a/1Hue/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RoZu0Dg2b9XDeXZS54xi7WeNHlr3klAe5otMih7vU5ffwiMrxFvTzBilOtZQWVymj
	 6re4vKIGISqc/+irVYOCPDegqJNuFx3zC5N5iYoE8WtYg4A5JQP0P4vQzwB2Q6kD1f
	 Vh8jMUrjl8cmXpOCtpXDOEy81aMjtK2uVZ/7y0GpswQ2sIzqsJGjkehaZjRoRFIskS
	 vRmb4la70yQFyyYvTvfNT3az92LAqGJ2S46XcdaJmSOMDDF2vmMiCd4Kn3+RR32k0O
	 P/ave6ETbUhw+bfjhH/UHOQfiNetcAs575UBBmaumAQcQlynIsDnG9ENz1aY5QBoiu
	 QvQgQY2IfCQng==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vquhb-0000000AuPm-3u3k;
	Fri, 13 Feb 2026 15:03:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Timothy Hayes <timothy.hayes@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Keir Fraser <keirf@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: vgic: Handle const qualifier from gic_kvm_info allocation type
Date: Fri, 13 Feb 2026 15:03:24 +0000
Message-ID: <177099499992.1792318.9934885934778681296.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206223022.it.052-kees@kernel.org>
References: <20260206223022.it.052-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kees@kernel.org, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, glider@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, timothy.hayes@arm.com, Sascha.Bischoff@arm.com, keirf@google.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
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

On Fri, 06 Feb 2026 14:30:23 -0800, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "struct gic_kvm_info", but the returned type,
> while matching, is const qualified. To get them exactly matching, just
> use the dereferenced pointer for the sizeof().
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: vgic: Handle const qualifier from gic_kvm_info allocation type
      commit: ee5c38a8d31e5dea52299c43c2ec3213351ab6e1

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



