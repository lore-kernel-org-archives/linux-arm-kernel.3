Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1C1CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzP5QfQoOdOy0iLjAEoGKBb41erJPo8UxyCpX8lnfeA=; b=1vEBoROgXy+vmvpS6ivf74UK/b
	XM8KUGUu+6L9NgctjMprEEaFAd+ah/WIQ4t3JYzpkSCZnisFOLyvIFqV2k9DOX/PdRcG1jw11qmEb
	RaGWgTLDE+FReNDJAmjp1p6CJI56DMVBNidD0H8FCykctaDqv865FmXJEdx+1oL1QX0aSPgDm9LZH
	120QIuqVVpMJdXVmHqXQVd8ls1LfUDYBRIoC9utX/eqAVE3waD/EZhl+I/c8EvHklMjUL7fd11xUn
	Q17pV1qi9Y5cfX180qecvbPxMBI/LnMkVS3P2jE0IdagkC1W5EsmWZa6DiEpcOdF+AHVPcGDl9NxL
	EE42CITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBbn-00000003vtJ-0jBK;
	Wed, 27 May 2026 10:35:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBbj-00000003vsY-2uho
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:35:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D679435C9;
	Wed, 27 May 2026 10:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5041F000E9;
	Wed, 27 May 2026 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779878127;
	bh=wzP5QfQoOdOy0iLjAEoGKBb41erJPo8UxyCpX8lnfeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hd2/OuW9FWHDNLb0kiG5rFfN+zTD3JwtnJ5VVQbUAy5qSRQVVhxigTPlKav8yDIhw
	 EhbsPjaJYdlTsbJsNQ3/qQiA+rrgabX65cWH8iTmaw5LD7KDylA73X2oSlHHiwIAnt
	 1o4ica+elLzFJkhKIqelgpeSXsbnCK99wZeJGSZ26rKeuEHwRwArWDK/JZ2KIOCeUG
	 dK1801LzPEUDSljDf5CjZyMrUBChI7Lxgsrx6cNG95eNM7sz6s2s0Ft5OvJH1tDDPG
	 Lj80EAy3x57b6RFkIg2k4JnE1Q038obkAMLFol3lRKqZZb4yRU7Sas8w+R+uZ2sGsZ
	 WSdsvH0pKsQmA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wSBbh-00000006diM-16bo;
	Wed, 27 May 2026 10:35:25 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Qiang Ma <maqianga@uniontech.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: PMU: Preserve AArch32 counter low bits
Date: Wed, 27 May 2026 11:35:22 +0100
Message-ID: <177987810338.1512096.8015208676423389883.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526074640.791991-1-maqianga@uniontech.com>
References: <20260526074640.791991-1-maqianga@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, maqianga@uniontech.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_033527_755007_BDD38B24 
X-CRM114-Status: GOOD (  11.94  )
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

On Tue, 26 May 2026 15:46:40 +0800, Qiang Ma wrote:
> AArch32 writes to PMU event counters cannot update the top 32 bits,
> even when PMUv3p5 makes the counters 64-bit. KVM therefore needs to
> preserve the existing high half and only update the low half written by
> the guest, unless the caller explicitly forces a full reset through
> PMCR.P.
> 
> The current code masks @val down to the old high half before taking
> lower_32_bits(val), which means the low half is always zero. As a
> result, AArch32 writes to event counters discard the guest-provided low
> 32 bits instead of storing them.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: PMU: Preserve AArch32 counter low bits
      commit: 1750ad1388e03fb27068cd1f22c9c8b4590fe936

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



