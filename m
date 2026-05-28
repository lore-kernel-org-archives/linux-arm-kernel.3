Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C86CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 17:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Naf3wXJ2EyrFvHMdJcyKV7tDwmuIz0pC4n157xSFJ8g=; b=gNEpFf21r30pxwXppopDM1z/+R
	ATyvFmzLdjtTOI+yCa2it6UcFa/aOi6yhXeCfRoRDZnKH2Ue2T+wa7hfQR1F+iVJ7bQ2kgaKtLtzm
	4rhPqApseDNTDZq0evqUfvgBiE1cs9bKwSiusExy/WuAL2P6sE54DhY0+aJy8a2K7Cf98u9mnBpXM
	WTN5HIhbUEJTEXkEpBdiLlX2kWTN3YHNtlrgmQP/7KrvA5P73KA17HVUg2p6Fh+FowBxECTjHuy4h
	tQIxPyVQGpOCjBmC9lGeDti+7j/Z9XmFQJu7Y+kbqK9w2i2q7Fji/w2IBuAj4/VLDo8Rf0EiFGjN3
	++0UYqig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeyM-000000069CA-23Z8;
	Thu, 28 May 2026 17:56:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeyJ-000000069Bh-3TSR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 17:56:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD0CE407C2;
	Thu, 28 May 2026 17:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE021F000E9;
	Thu, 28 May 2026 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779991001;
	bh=Naf3wXJ2EyrFvHMdJcyKV7tDwmuIz0pC4n157xSFJ8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P5G+Eix9YABB7wMgZVO5Q+vMS6tFX7oY1PkD91PWXzwGDKrxzk8yq/hGqjlWft94I
	 Rmvue2+hRRsCFPGEMjvOb3HNA1nNoYN08zMxhBXUVZ1GIiUVXZzXIq5Aa0p7FCNyjK
	 PkcRwfotYhLN5g3i/K7wPhLU9WR61Z8kqlE+w479jk/FM62TEutBgN98GmVzH4s/jm
	 aPZhid8JeLGhb5WKwaum52RyaaWbxDpJG0+dfgzfTtuvPpCUWFbkUQ/chFdnzYNW+K
	 e/17gq/5sBjf7Z8lwMfwxqWoPDBPR5UVyFnaPuakGWFwjhzays9hs4LR+cwf8pG6d7
	 dyd6mx1j0DuUQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wSeyF-000000078lE-1sfq;
	Thu, 28 May 2026 17:56:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Cc: oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH] KVM: arm64: Remove @arch from __load_stage2()
Date: Thu, 28 May 2026 18:56:36 +0100
Message-ID: <177999096482.1739911.18058733022037753764.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318144305.56831-1-zenghui.yu@linux.dev>
References: <20260318144305.56831-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, zenghui.yu@linux.dev, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_105643_884799_9BF94A74 
X-CRM114-Status: UNSURE (   7.89  )
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

On Wed, 18 Mar 2026 22:43:05 +0800, Zenghui Yu wrote:
> Since commit fe49fd940e22 ("KVM: arm64: Move VTCR_EL2 into struct s2_mmu"),
> @arch is no longer required to obtain the per-kvm_s2_mmu vtcr and can be
> removed from __load_stage2().
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: Remove @arch from __load_stage2()
      commit: e72b425f617edebf6f374fa39f2c763c9b3696ec

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



