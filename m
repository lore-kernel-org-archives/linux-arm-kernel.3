Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCD4CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV6rjtUZylJXwa6ZmlS9vj62Pg7wQym17Q8x6SDp1So=; b=I8LDbKVj8FAJEurEcQ24GVKPGT
	Q0zpZcBOvvOqDCtX/g+4JEuUMwJ9KfUxcJbj1Bq7b+6P1wbBvMFFggA9OH2lh1KdZDSUVqcThthgO
	BDz4yZBT3DfjJKLFvzjmQeyEpWIfdedGeUGYufSaUl+w9d9CVI7LUfbfhmm2uMo03cgfhbpsHNv7n
	YXUJZj7z1ytNyJgZlzQ6d8hY+Mqzv8m8p3zTLefXji8A+/Lz6ex0uJloxh83x46IfS+5Envsmi8Oy
	IalNO2ETuisV1nv7892juo+mcQeklpJ/t5adbewe2Z6S+qq7NHkDPgiDed3JfHl8mwUefIhJie4eU
	G4WqvIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKete-00000001T9n-0xag;
	Wed, 06 May 2026 16:14:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeta-00000001T6b-3ZmI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 16:14:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 930EE44259;
	Wed,  6 May 2026 16:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FE9C2BCF4;
	Wed,  6 May 2026 16:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778084086;
	bh=7EoFpIqU2CY22TlcKHX1E+bFT6rvufgU5nKroWLs2cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kIxHMonyq1fOO8k8K595ytjPY6L/xMoNUXFblzwYg9ZXf8fL5h5ikvvZX/Idh75Hf
	 3xP71VnX9wjjd0DxpTinrY2E3ofkxR89hX6OKJtVaivwfEVXXNQDknZlNZ4Hy3UTDd
	 h5YoWID5TNljH6LbVY4azh+utumI7Tfa+XmWyAO0uDBWlOVttzjQYEoAkT/mfHQxca
	 UInn+oRUNEuEFKTNIFFdyCkUqnBYm/zd9OXQ5sw5sIi0S3YP7YP9Lc9PLMt45QwxHI
	 tPnvY4KAS5hrrP68b63LJkiQSPnwaiHQJbAiEC9J0S3A5v0UiIq2irkn/AgN74jjK8
	 +MI81HQtOVmNQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wKetY-00000000MId-2aiV;
	Wed, 06 May 2026 16:14:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wei-Lin Chang <weilin.chang@arm.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] KVM: arm64: nv: Consider the DS bit when translating TCR_EL2
Date: Wed,  6 May 2026 17:14:42 +0100
Message-ID: <177808404890.2712489.4128021964001358070.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505144735.1496530-1-weilin.chang@arm.com>
References: <20260505144735.1496530-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, weilin.chang@arm.com, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_091446_911113_47644029 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

On Tue, 05 May 2026 15:47:35 +0100, Wei-Lin Chang wrote:
> When running an nVHE L1, TCR_EL2 is mapped to TCR_EL1. Writes to the
> register are trapped and written to TCR_EL1 after a translation.
> Booting an nVHE L1 with 52-bit VA isn't working because the translation
> was ignoring the DS bit set by the guest, hence causing repeating level
> 0 faults. Add it in the translation function.
> 
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: nv: Consider the DS bit when translating TCR_EL2
      commit: 8d9b9d985ad3a81c751a6b97edaf1d3c0780af7c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



