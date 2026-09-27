Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B900C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 16:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDbZyGGFBP9eRmkAQH9I9cvotS6ESn1jbu9Gooo903A=; b=wokno4sFOcMxpov59OxaPhUeXk
	342ibJm5q9sBwFRlJKtymd5F7YTqotRWIX+vXjYTQoYa6xO1SqWlKk72mFE5mMxZSP2NyBM0FTiNO
	2/zIVAjgE4f1eimfN8OS6Iruj3GP2crruuNbToA9IWm12kdcLY/7mojl91QPBKlhXwjAnZVrjfBOU
	PpXvoNNzIHV3N7dIiBJj5uddO6pWaGGU73U+y813hrjdapSUkHgM7lev5X1VCrnoZDB/E0azzwMW+
	Eif9oPFJyQYQfn2UwPKGD6qbckGSUBYPBRiFu1WI5lD9F1/iyDYxrGJ78vSmQX4yOvbIbgzmizanM
	y1wde2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArqd-0000000GbIT-2rBV;
	Sun, 27 Sep 2026 16:35:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArqP-0000000GbFr-1ElQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 16:35:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C11004450A;
	Sun, 27 Sep 2026 16:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C6D1F000FF;
	Sun, 27 Sep 2026 16:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790526916;
	bh=TDbZyGGFBP9eRmkAQH9I9cvotS6ESn1jbu9Gooo903A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IN8Fdi0MoUEdZdXcpinsQhC6TT/NgBySUO13qZw0oRL0GY6+/GP6qeVDZcXpntnSL
	 bZJMRt97jWseNirMzkftBQkp3QP6vha/ScbyKsN1dZdtIJvCrO+VRHgsb7YSaJjs/h
	 aNOKKS0i5AIw6YyfXI5eSE2xCuJ0dXoFHLvusgXlm6T1SMofedlrzIdsWfeKZZbcbn
	 i9VPBkPOqsO1iWQZh3gklHeHqZnRpE7yRqnZ+gRWthMKpyck+NBXSAPVhnHP8PnYh4
	 jpA2K0b4/71XOlHfYqkNwC68OApiZ6NH0RaUZyf4PjwtvWRdCVF70NZoP8TXM11+y6
	 nxrwAdQBbYhkA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xArqM-0000000E2St-3Rlt;
	Sun, 27 Sep 2026 16:35:14 +0000
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
	fuad.tabba@linux.dev
Subject: Re: [PATCH v2] KVM: arm64: Disable stage-2 ptdump of pKVM
Date: Sun, 27 Sep 2026 17:35:09 +0100
Message-ID: <179052685158.3528802.17360317443596680597.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924100459.831013-1-vdonnefort@google.com>
References: <20260924100459.831013-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, vdonnefort@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, fuad.tabba@linux.dev
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

On Thu, 24 Sep 2026 11:04:59 +0100, Vincent Donnefort wrote:
> With pKVM enabled, guest stage-2 page tables are owned and managed by
> the hypervisor. The host's pgt is uninitialised.
> 
> Skip registering stage-2 ptdump debugfs files when protected KVM is
> enabled.
> 
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Disable stage-2 ptdump of pKVM
      commit: 0dea17ffe6757a6249d143e607e786144aceee9c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



