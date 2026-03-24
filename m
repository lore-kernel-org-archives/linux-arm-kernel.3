Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449A4E9A75D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcSV8e1W1HNWACYqmw/da2TJSfYVaJSU4Du+QYFCsMI=; b=PxgNnESyTsLxLEtJfysl5fd/E0
	mgFaqzabLeijlinigIIJyXp0jGM5XbRTd9Et7czPYk4Zdj+a1WK743CYyWucHFH96Q/0PPRG14pgX
	BCtF1jvBow4rIhk9KP7nHRAhmR9nAEPF4FAH060NBeMbFhTRwyLi3/Q/JTVpAaxw0PSuAOONc4VYc
	DdmRo0wpXG8YOoQxwkKD/BPvSlOTJo0zFozlT6t3ZBSU2LBdoyVgmD/ySTTmf7uq6/i4eB1TK05bK
	x0Rm8eVIqMLyyTOFdytvnQL4Wgcs68gx0RmLLoUo1TXkBTcPlMczHL6ynq5QrIHfqnWc4mjZzw2S5
	1YTJvGgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yp8-00000001CK1-2Z7i;
	Tue, 24 Mar 2026 10:17:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yp7-00000001CJc-2BGS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:17:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0B5060103;
	Tue, 24 Mar 2026 10:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E1EC2BCB1;
	Tue, 24 Mar 2026 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774347440;
	bh=FgwY3Ilx024m3dxmjnW0YuUkB48q182fe75ELNHakoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j/MEmNMXFlWqTubX7nYMdWouXUB2tPSb8GrSVuoXQbaNj1Di4CuRZdTer2CmWRVxY
	 u2kohqOAe6ct71CpttzWuMA3OmN4XRckIwPhTGYBhBy+uy238w1IBL6lChIZPWwL+B
	 QbM+fRMv/EOxvyMdd/xUXctfaTC9DCSv2n3HOCqfyhEOJiicez6ul7P0oOdvrIuS95
	 sBZ3BIAlgwILYcyzpMHs+0WNUqTwBz+ZnxCj10+fpE7lyFfIyuedZoPAi9vMXn95RB
	 v+lDNq8FLO8KhQ0dXLLybY+/p/Zc7lkfGFz9MeHbEP0Y1BvcgRABSa6uWXh7mXpjLT
	 RnMh1+KzFZA0Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w4yp4-0000000573T-2FfK;
	Tue, 24 Mar 2026 10:17:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] KVM: arm64: set_id_regs: Allow GICv3 support to be set at runtime
Date: Tue, 24 Mar 2026 10:17:15 +0000
Message-ID: <177434741588.3191556.11695580866498467770.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323174642.3183075-1-maz@kernel.org>
References: <20260323174642.3183075-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, broonie@kernel.org
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

On Mon, 23 Mar 2026 17:46:42 +0000, Marc Zyngier wrote:
> set_id_regs creates a GIC3 guest when possible, and then proceeds
> to write the ID registers as if they were not affected by the presence
> of a GIC. As it turns out, ID_AA64PFR1_EL1 is the proof of the
> contrary.
> 
> KVM now makes a point in exposing the GIC support to the guest,
> no matter what userspace says (userspace such as QEMU is known to
> write silly things at times).
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: set_id_regs: Allow GICv3 support to be set at runtime
      commit: 2b821a6205b8b7fa7f0486507a63a46a06562a2d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



