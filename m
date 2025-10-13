Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D334CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfN4NoG02GldAvtbPLm2cJHEJpngNGq8qmN2M8QApJA=; b=HZTmaL9EvJcjoB+cykyVvmM3cy
	Mf71B5wLhNgAIZjel+DOrQhDrfaG3El55c2XtQ+bRnO1ZZLLXRMxzOAKO8VOKjBl1CDQAamxvfSqj
	/6KXqeLixPgiSotvOTNOqBDGTpi3/svqD089EPdIyctpKIqJwQQZQGI6t+YiBhpzrHB62EAFL8HwW
	cG4muqQOJS/NAwMGI0cTK5fR05njgOUbvhTo49zZzJJpAWc9sQWFufcQq4HB7UCLnzuy6URZS9apn
	xruy+nuO3VSMZgegfxTxmR8SgDDWXR+l3lCibw8PaursxKCjSIs36KxbtsgJjthcruKvPOQ1pqGje
	lWiwinOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LqR-0000000DweL-2JPs;
	Mon, 13 Oct 2025 16:56:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LqN-0000000Dwc4-3zjZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 16:56:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A444148A5A;
	Mon, 13 Oct 2025 16:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86924C4CEE7;
	Mon, 13 Oct 2025 16:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760374579;
	bh=oCjPIm76LeAR7DfSG4KlC7i2J3UvMls2jcJsn1nEWxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qpb05tO772ZPfXZUyLLCko/z4F0vClyyZnetI+E2KnCLb9bL9xJFFyFJ7CXh0xgYl
	 AbTeicJzvYTLc+eu6pBpQfMuP2aPiFmJiyfvBnPqFhLBjIYSfiDa63BiBll+fPH5HV
	 OEbAvXtO/KfudobNdFhcfw5WJtjL10KOLOr4fgHlRfrIAeIK7EdMWkXqpZFLAM8mn5
	 rvANRZEP+ytVvcMndjX4fORUEqy+yKyVMJca6Bvs8JrD2PjqK6yXsT/gN2ivg2k5WH
	 dT9P/BpZFv+GY1mXb/rq8Op0ondmigG61hHUVVTKZlLB1XyS8MoSKb/Lb3pwLU4sSP
	 biMkJR/8PWeHw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v8LqL-0000000DaVX-2zDr;
	Mon, 13 Oct 2025 16:56:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: nd <nd@arm.com>,
	oliver.upton@linux.dev,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: gic-v3: Only set ICH_HCR traps for v2-on-v3 or v3 guests
Date: Mon, 13 Oct 2025 17:56:15 +0100
Message-ID: <176037441180.969330.798856280799815530.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251007160704.1673584-1-sascha.bischoff@arm.com>
References: <20251007160704.1673584-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Sascha.Bischoff@arm.com, nd@arm.com, oliver.upton@linux.dev, Joey.Gouly@arm.com, Suzuki.Poulose@arm.com, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_095620_017510_AD31D81A 
X-CRM114-Status: GOOD (  11.39  )
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

On Tue, 07 Oct 2025 16:07:13 +0000, Sascha Bischoff wrote:
> The ICH_HCR_EL2 traps are used when running on GICv3 hardware, or when
> running a GICv3-based guest using FEAT_GCIE_LEGACY on GICv5
> hardware. When running a GICv2 guest on GICv3 hardware the traps are
> used to ensure that the guest never sees any part of GICv3 (only GICv2
> is visible to the guest), and when running a GICv3 guest they are used
> to trap in specific scenarios. They are not applicable for a
> GICv2-native guest, and won't be applicable for a(n upcoming) GICv5
> guest.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: gic-v3: Only set ICH_HCR traps for v2-on-v3 or v3 guests
      commit: 3193287ddffbce29fd1a79d812f543c0fe4861d1

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



