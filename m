Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53109C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Weyp/oLhKZLkacjeN1Ftw2HMrf7BTwE3TsZf9PvNHAQ=; b=McceswWdYv8VNFemMVPpkxaHjC
	5fzeM0TtiRB+aQdSdNbe9jojAzNc6V1tnhmARFWEn+M6sh1yRgastTxQegRQF6FZrQ5LY7mPfcDJN
	4OjVqr0uCmidselie6EmYyrnTuLGUGxYXVDgEXGIXXKLfM6Ffva0W6gelv43LjLKmzBpgJOlrpPxx
	Pr0QBa21DEDq6u6A+gKH+n4Uq2QDtOQIA1MNwglWibeoxzUmW/iZSTXnvVZrkPK7AKmezqKGV8Siu
	56MEflBzLyCtZg0YQPaJ+Sl51pVOa3L4FakeaUc0Z4kMb8lE1//UwK+ExZYbGFeAVo1aTUEbmxvXK
	dpjY4J6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw1f-0000000EgZn-2iiM;
	Thu, 23 Jul 2026 16:11:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw19-0000000EgHP-3WCe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:11:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 448EE60A67;
	Thu, 23 Jul 2026 16:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD541F00A3A;
	Thu, 23 Jul 2026 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784823087;
	bh=Weyp/oLhKZLkacjeN1Ftw2HMrf7BTwE3TsZf9PvNHAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oj34C3EP08ZKjzQnPJu842SViTXjFZ4wZwO94E6yE9pq/0b/m7TY7D32jSflXGsph
	 HCn6Sb/Ce3BwLgCJqcUIM71tpjeynpCxkU0k4CUNA6RySAi0REBEmXsLsRR489wLI8
	 Wg/aOjDJ42/1LLM38t4KM4X6iDrFIk+njibI8Uae2dulMFiIWruI5dkWZW+QXcYSo4
	 um35Eczjv1F0FgIh89afKna3ODWziZhG6VbnFqNGTBRWs4GRtuQFPCwt1+AShh8LyL
	 8DWpOADHHXfSqr+/EVAXoUFVj+pqeovjm+1KfwGgWSwHqHEY6tSL/862yKJzoGaLjO
	 MFJAjH+BWTrJA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmw0y-0000000872z-1KXd;
	Thu, 23 Jul 2026 16:11:16 +0000
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
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v2 0/2] KVM: arm64: KVM: arm64: Fix potential leak in hyp_trace_buffer_alloc_bpages_backing
Date: Thu, 23 Jul 2026 17:11:13 +0100
Message-ID: <178482303775.3351010.17818493792689450146.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710114819.2689386-1-vdonnefort@google.com>
References: <20260710114819.2689386-1-vdonnefort@google.com>
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

On Fri, 10 Jul 2026 12:48:17 +0100, Vincent Donnefort wrote:
> This series provides two fixes for the nVHE/pKVM hyp trace remote buffer
> allocation.
> 
> Changelog:
> 
> v2:
>   - Added patch: "KVM: arm64: Fix hyp_trace_desc allocation size in
>     hyp_trace_load()"
>   - Collected Reviewed-by and Tested-by tags from Fuad Tabba for the
>     leak fix
>   - Do not set bpages_backing_* on __map_hyp() failure (Fuad)
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Fix potential leak in hyp_trace_buffer_alloc_bpages_backing
      commit: df7a9d376f7a388ecfacf8dfe0b5819ddfba6972
[2/2] KVM: arm64: Fix hyp_trace_desc allocation size in hyp_trace_load()
      commit: ca28278d10ec234592989ad370d58294b9d43e0f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



