Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB854CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QgCS+Zzq0tBWCiiIyvOTQz+/a04NKO88dqx42B8uFQ=; b=XRCM27Ov567uZgYhUhlGTXq9uf
	xOiX//LxOGqf7YWU9ZiomMAFLBCkOC4SjmE28zZ/+9F3q3BFZf5a6My1AQriYTskfnt2EJ4ZIIDa9
	pWSmoLFqZNPY0kflKTTTclRDIzjXrc0rMTbbivS3qzJiwz4fjSznvutgYV97xeNyyZtrHYhQcuU2S
	tKjUfoAcbgo1JBpxP2daVEaJpcsxPKQDOkIrBxXgcpCMHqvEiC+Ile48OlYZ1El4mmmr5erjhZ3sH
	fU6x70BXuVjfgu1uQXC7NfXCHUiBJHXMVWtSbl6hLRy5Rq90nHpoeARKa+PbVsnFu/P0GhpBolU3S
	FhoAOJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LqY-0000000DwjV-2zeh;
	Mon, 13 Oct 2025 16:56:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LqU-0000000Dwfw-2Ovg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 16:56:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED57D6050B;
	Mon, 13 Oct 2025 16:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995B1C4CEE7;
	Mon, 13 Oct 2025 16:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760374585;
	bh=gNLN7Pti1bOZ2Xsv9KZwfsHwKMV9bJGIivKaX2POC3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QjzC/Zy+zFYIxPAsq56KctQ6QB3BQoZTzyFtOmwY1N3nb9q5TIvOL9WxlluSviLLN
	 9iO6+upmD4YKw7pfixqAzYLyJAyiczWpsSgbo+9AykOulkhGB9QKn/khR5MWefAucE
	 eE90jGcKPtW2Gwu/ca+7pHkcdzx3GKwIl+wSFenh0HAX+lxJIgZezIoHwxupFFYdkn
	 6Fpr1W5eKvTz6w+5tagL/d6VKR00tggzH4FKwJTGCztkXKyHELGW3QFG0WfBiLaw4S
	 HRiSVt0HnSCKlMRDrHSGz5zxt/ijwZhLTL6sBD074QG+2kvNyZg+5vR0ShGLj5KIdL
	 WUj6JtZ0cpa1w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v8LqR-0000000DaW3-3TLg;
	Mon, 13 Oct 2025 16:56:23 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Cc: oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH] KVM: arm64: selftests: Sync ID_AA64PFR1, MPIDR, CLIDR in guest
Date: Mon, 13 Oct 2025 17:56:21 +0100
Message-ID: <176037441174.969330.14159948575043752138.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012154352.61133-1-zenghui.yu@linux.dev>
References: <20251012154352.61133-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, zenghui.yu@linux.dev, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com
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

On Sun, 12 Oct 2025 23:43:52 +0800, Zenghui Yu wrote:
> We forgot to sync several registers (ID_AA64PFR1, MPIDR, CLIDR) in guest to
> make sure that the guest had seen the written value.
> 
> Add them to the list.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: selftests: Sync ID_AA64PFR1, MPIDR, CLIDR in guest
      commit: 9a7f87eb587da49993f47f44c4c5535d8de76750

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



