Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A886CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 11:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUfojMQDPzmAt1rWIlxXmoX+yM30rHIm3OhZbGuSpZ0=; b=DXHOBt+4XtU3DHYEG2R18OL+nv
	uav6flTozwRfmIQaWXijQVzhJwr10UImRjyr8AFCu2Im3La1LNktekUnOWNnXkRoa9M4sNLqprxVu
	HpzgZgEM5Agef6+P+hvq0XjQhpxm6DVJbGmWwQrAhYpYPcOU4R8sjQrRUrrwzTHO2BVqI0SrddAK6
	D29JJBefgK+57hlEOloWAZnBB2itGtKwdIMfqV/l1ht/ofbxNCn87/UMpZJJWMUSjjMXtTBTLCGhi
	E1Y27VDkkiu9RZiHTmdv5/6z8ny1gR2lAcAvhffRh5fldf9AXAcdiF44BRE61vVLx9Qb3mZ+xkIPY
	f4NneysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZonf-0000000HH4S-0QwA;
	Wed, 17 Jun 2026 11:51:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZonW-0000000HH1T-2isB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 11:51:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E6EF43D2E;
	Wed, 17 Jun 2026 11:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45961F00A3A;
	Wed, 17 Jun 2026 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781697069;
	bh=KUfojMQDPzmAt1rWIlxXmoX+yM30rHIm3OhZbGuSpZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YeVNNSG5AMeK2eJFTF7hfhnSt0+7AyNdcyPkovOAamU8CxKwxQCaxlfi6Kd+q16oD
	 yToJD8TJOGoyMwJBRy49lQ4ABDTEL+BfJ9uXpCheW+8bzIHgvBtAptlcByIBm5BBHq
	 74lmwDkGVTdyE0qnPZh8XF7HKMNIQ4gXwDLxKb3izqdKhZwSlWtI3HuXeei3/BSKVL
	 ahWl6/DT3IUgntQuHIPW5C/1wqEpTlBXlpoLyAVrjn+BTtz7LFxZke36wr2odlj807
	 9RbsN1wUUAi/eTxM59kBZrZJajLk4mgXz/oZLqY1RYgRfROnmWuaVgu/mX9KDM5V1M
	 C/b0PmNnumBSw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wZonU-0000000DfJJ-0Krr;
	Wed, 17 Jun 2026 11:51:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: Re: [PATCH] KVM: arm64: Handle race between interrupt affinity change and LPI disabling
Date: Wed, 17 Jun 2026 12:51:05 +0100
Message-ID: <178169701870.3049015.7729065316776992526.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615181625.3029352-1-maz@kernel.org>
References: <20260615181625.3029352-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, maz@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, imv4bel@gmail.com
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

On Mon, 15 Jun 2026 19:16:25 +0100, Marc Zyngier wrote:
> Hyunwoo Kim reports some really bad races should the following
> situation occur:
> 
> - LPI-I is pending in vcpu-B's AP list
> - vcpu-A writes to vcpu-B's RD to disable its LPIs
> - vcpu-C moves I from B to C
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Handle race between interrupt affinity change and LPI disabling
      commit: 7258770e5814f15e8308ebda82ac9acf6964ba8e

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



