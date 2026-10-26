Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F7860A3808
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RVgvxKN7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbOeMxVz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=00z8Y8GW8ca1Wv3c+CFIBQZrxnGa28sKK7la2T75TrI=; b=RVgvxKN7PlvnBI
	/JDAYmKoToCSNF8A1WFlr02Gc9Frnbwk1KLL8ccywxBO8/qbX7lMKuti9Mdse+iX7vTOmgEOOIdRK
	C/tDlD95J0Qj+a7t/YAzFVNluEsrbmiMLM1qBAz8WAjbQ2IsAIY84aJ6oklrOWEx+aR8zomcbs0hC
	6yccZv7eNYm3qjO7sZwDHvSYTL/PdroLtpLtHFf2qQoZ+AOpFc6O29U1qXVh0oYTbE5ZazlZvOc/U
	CAz8LR1wY8CK0MDpPUAOjCEEyVTderZIpXXBn07/OaGNrvb8WqtyixSVHcNM9i+plLf0W8W03o9EL
	sGBiK+ufoUuE/zW5VHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOf-00000002Rbd-1k9G;
	Mon, 26 Oct 2026 12:01:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOC-00000002RJj-1xAW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D68A56053E;
	Mon, 26 Oct 2026 12:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D79F1F031E1;
	Mon, 26 Oct 2026 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016079;
	bh=00z8Y8GW8ca1Wv3c+CFIBQZrxnGa28sKK7la2T75TrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fbOeMxVzZ2wwyoueUYpOU4eoNV33v/2vwwS64f+6CntR9IYN15e8WRqPxMIQVCO6C
	 xt3u2xemlqPYoFa3/MSnMFB4XGIWwoyJ8MkaB06zBLgpUeLN/e2ISwrsmLfM/OF1Rb
	 x0JNVnwP/NiaEM19QM4eSB8FVG3lpdAipT6ixfTmDE8b87pxFOwR/5qbdNPJBlDVI4
	 id/CAFWkSslNMNI5z9jmK12XlLFdlW4j3gXfmO/wHxWOThV7CeDxoFJu5D5OdGUYBm
	 QDn9SUBkGYUmjTziAj6mFkWvyEb29xfrJx13q+64lfJb32w3cGXIt9VQyAZKycV16H
	 IhHYLJ3mcXtUg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJO9-00000007Fr6-3Xwv;
	Mon, 26 Oct 2026 12:01:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>
Cc: oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v3 0/2] KVM: arm64: Reject mismatched VGIC/ITS models
Date: Mon, 26 Oct 2026 12:01:06 +0000
Message-ID: <179301587210.2527370.18024850620938589623.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020163923.1407856-1-sascha.bischoff@arm.com>
References: <20261020163923.1407856-1-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, sascha.bischoff@arm.com, oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 17:39:21 +0100, Sascha Bischoff wrote:
> On a GICv5 host with legacy GICv3 support, KVM exposes both VGIC
> models to userspace. A VM can create a GICv3 ITS alongside a GICv5
> VGIC, because neither creation path checks the model of the other
> device. The ITS sets has_its, but a GICv5 VM cannot use a GICv3 ITS
> for MSI translation. Creating the ITS before the VGIC also lets
> userspace select an incompatible VGIC model later.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: vgic: Require matching VGIC and ITS models
      commit: 05620a31421935f737d16a060d2dfe731f7b2f74
[2/2] KVM: selftests: Reject GICv3 ITS with a GICv5 VGIC
      commit: b17eea28dc815f63aa3279a66fd1e4de47a8a446

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



