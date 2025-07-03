Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBE4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fjt/1eZikCwv1UPiNoX1zgh3B6qz+Rnie1MNJ7+tED8=; b=CI/SSULLiNwP/58I82Wi/2Vt3S
	WAuV8CRrfvMv/ClR8iww7ymKduKCXdWsRmZe7+V+A1bEcY4Qqoi9mukrLzxyCTjEOb0g+0ObAaKlo
	RJCddYfqayKPinGQYDuGgBDaaML9G0Me4gdBcPp7tw8Flg75kgx9oo3JdBJcwAvUkUa4d4+KJGtM4
	zGUxSOQxiJFCUjgM6Gw1XRKQGe+li1Tyf4bzYXi+ZoelM30c8ck2+IGMbGt4VU83CD1fz0fyyN4DC
	Nouos4jHS7SgnfykGMqocRQv8InIvBMJOaBlN8761mS51l14KLzUeu3KRjGxYky0NpK12M3QzYpAF
	f/4tx69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGVT-0000000AsBN-2oK0;
	Thu, 03 Jul 2025 09:45:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGRr-0000000ArSp-0638
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 09:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20B5A613AD;
	Thu,  3 Jul 2025 09:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32A2C4CEEB;
	Thu,  3 Jul 2025 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751535701;
	bh=JRq4m39oWeiIfgUhjZzJpp2KxxVmCuR34R6ncKYxyrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AltaEVShCSAPXyqd2hSKGhKdsFmhptkQM4UbA+IeyQuKsGk/vwRVqwWVFELB4VWTR
	 adRfFhzp0TFcNbCg67sA1+K8ISfj58+TIg5OjozvdOaBiKDFH4qBNcAHvHvO7Uwu3s
	 1swOz2n6SkwQrO7c4YBek7KTjY8jEIJ8wgXA+lpBcUh5ZjFosUlcTyQew5bpSKiH2q
	 3yli9ndSHFVyhq51Yu+vsSL9VIx/y/9n1vLzL6cb18TZCARv0iOHAuDVfrc/QgbeFq
	 Q6A2bw1tzKiEETB+ywtqNh4Fn33SUCjm3m2TwKM3olh1delA+lClPiItBPyMprxKzE
	 oKzD9KBttn/TA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uXGRn-00CFX8-Kp;
	Thu, 03 Jul 2025 10:41:39 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Fix handling of FEAT_GTG for unimplemented granule sizes
Date: Thu,  3 Jul 2025 10:41:36 +0100
Message-Id: <175153569168.947020.1733550411428596443.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250701142225.753984-1-maz@kernel.org>
References: <20250701142225.753984-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

On Tue, 01 Jul 2025 15:22:25 +0100, Marc Zyngier wrote:
> Booting an EL2 guest on a system only supporting a subset of the
> possible page sizes leads to interesting situations.
> 
> For example, on a system that only supports 4kB and 64kB, and is
> booted with a 4kB kernel, we end-up advertising 16kB support at
> stage-2, which is pretty weird.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix handling of FEAT_GTG for unimplemented granule sizes
      commit: 105485a182dc6ba32e55db46839af756c105afae

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



