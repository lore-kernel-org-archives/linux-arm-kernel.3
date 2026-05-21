Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56A5CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+BTPzwFHZ948TPCCS1PkFHsl/ijHllcNoizkXkiAko=; b=GeI+EbNKzwG4qzXFX1MrWpLKhE
	nu/iF9eyVmCcfWpQWzmvNar+S9C9/IYQnm+gu6rvej3yECKB0tWwHZ5mQt920fIELaleOx0saOjE0
	RtRkQ3R99570HoFKyFfFwUgtp4rEllkj8YHBhklKrHLZzzI4nly8hnlvMPEonbexYIlh9ZP8Gq2hD
	4D22mIZM7K5eubPjoHRazQQ8k07e6XBJG7W1x7GKwAIBblezchvTXdvwlvRSclGw0Q3U5jGFeiiWd
	HuBywQdMhokIjXr+pbiraURymDnwiOcS9MaYNs5aBJ5BDvnCRX8/oJvBGOj+J7+Ciy1xRlJ+YhuV3
	7A2SbRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxlF-00000006wO0-34QA;
	Thu, 21 May 2026 07:24:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxlD-00000006wMy-3YHj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:24:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21F8260172;
	Thu, 21 May 2026 07:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB94B1F000E9;
	Thu, 21 May 2026 07:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779348242;
	bh=c+BTPzwFHZ948TPCCS1PkFHsl/ijHllcNoizkXkiAko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gjqA0ycIY0OPkblMWXDLTZoRMh9jRc21EsGC6/SPZ9vxmrdT6skIxTFPE3nq3GUq3
	 awRxuw0YNXqx6f/zVvpsnAirWc3EMi7KFiP3GVSblNcoRRzM0eqoPp1uj8sr0jCPJQ
	 gbZGryXlXAdd54pKv+XBHJNV/VA8OXQ+3l9XUlh2bHryK9mIEW5RpanmG2xoCzeFTK
	 GuYX9dS4C0Oa7zRY7u3WP3qauSu9GjaJei7ikUi8U+Mxcg12b5QqmSPBjjcaOyzzMz
	 N1lomy02lSb0O6Y4fb3LcqMvu6HnpgLLYtBiHYzhhLh3u8CB7Cne7/i5k1EN6J1wKj
	 C3Z3Xtnk9keyw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPxlB-00000004hNd-03D7;
	Thu, 21 May 2026 07:24:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v3 0/6] KVM: arm64: Don't perform vgic-v2 lazy init on timer injection
Date: Thu, 21 May 2026 08:23:42 +0100
Message-ID: <177934819510.554756.1987942775987270934.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520100200.543845-1-maz@kernel.org>
References: <20260520100200.543845-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, kartikey406@gmail.com, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

On Wed, 20 May 2026 11:01:54 +0100, Marc Zyngier wrote:
> This is the third version of this series aiming at fixing issues with
> vgic-v2 being initialised from non-preemptible context.
> 
> * From v2 [2]:
> 
>   - Remove the PMU's irq level cache which was hidding in plain sight
> 
> [...]

Applied to next, thanks!

[1/6] KVM: arm64: timer: Repaint kvm_timer_{should,irq_can}_fire() to kvm_timer_{pending,enabled}()
      commit: 68a612d4dbc7f2b9dac731c79676a21fce573d29
[2/6] KVM: arm64: Simplify userspace notification of interrupt state
      commit: 0d27b4b351493cb2fe1f87cd152856704d4e141d
[3/6] KVM: arm64: timer: Kill the per-timer irq level cache
      commit: ac7002031852ab8f75b3debb1a4c4b2d1ff5a26c
[4/6] KVM: arm64: pmu: Kill the PMU interrupt level cache
      commit: 2772383afc5c65d6242f62947b5c184ffb049359
[5/6] KVM: arm64: vgic-v2: Force vgic init on injection outside the run loop
      commit: 1a8685ed8cd1ded20d0c81070a49b1cddf70481d
[6/6] KVM: arm64: vgic-v2: Don't init the vgic on in-kernel interrupt injection
      commit: 958023d269e0312d10da85a6a49438d2e107dead

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



