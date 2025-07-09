Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4BBC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqHxKttRDWDtCb0lzJZ0Bs3JPrgNBpKM2ebg+fxszKg=; b=hCSXbV7O6FGFDD/m92RXt7rZLi
	M6mzJ57IGE0nKFfi9kCzUokNfnh7qLPcmfo9YGYWX1vZeMoVFl96jAXR96JOjoYoAkKDI7SmpQzP0
	902WlrcQG/JzEQmgdALVGWmoxD7iw6+5jBqiHz858LJrmuutd1r8xfJi10u9WaK4rYBVMVCVT0ha9
	ZA+bhStmn0AcxnNO6KWJiXQPYAe4EdJ84FhMCSmTO2KMHepnmnhQO3LaxlsgYlpjPlGfOKTwVr4Yb
	JD2ivjYwWAYOH+4iCOteUVmi2AFkcrlgaYC4QLC/afQVKy7B3ywbBEP7Zm2oOK7U72TGZq38szdx0
	ZI9bfpsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWV4-000000097pT-3TZl;
	Wed, 09 Jul 2025 15:14:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTov-00000008cDp-1dxi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 12:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BCC445EE5;
	Wed,  9 Jul 2025 12:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C15C4CEF4;
	Wed,  9 Jul 2025 12:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752063759;
	bh=ExusPl54+Z+6wa6Xfyog2ejojzWjQojh+qnvn+buZQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aOK/pXVq98TtbtsMyifPo27ZSiq4dlguYgxXqQfIH75/DZ+tloIWyr/e6Ee80jY8a
	 BLFyS4i/7yHe7v1kjo5SV97w13jRqyxNxxqiiNfIiRxuWF+G7McEq5C4jYKVk2wNvt
	 cvf5cvn+NzO7NHKmTm+58biAMXmJxCFcLiGANsBj/1tp5jMTOSH6q264W38oLqWP5C
	 +pylrmwv6HzcTeYfa1ZGESqAh1hjAo5CFaeUUxE9Uv2l4xeXW65ilJkp5HfPhzrsXL
	 y9pikMjVy0SGwOyy16hfn5x5p6L4nzQZqiV5wvQfzmJIxQvx9mS4JkkyO+4gCU6PVn
	 MUsPKVz+LMJCQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZToq-00E8wS-Kz;
	Wed, 09 Jul 2025 13:22:36 +0100
From: Marc Zyngier <maz@kernel.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	linux-kernel@vger.kernel.org,
	Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/2] KVM: arm64: Fix enforcement of upper bound on MDCR_EL2.HPMN
Date: Wed,  9 Jul 2025 13:22:26 +0100
Message-Id: <175206358921.2018765.12923963855524409894.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250709093808.920284-2-ben.horgan@arm.com>
References: <20250709093808.920284-1-ben.horgan@arm.com> <20250709093808.920284-2-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, yury.norov@gmail.com, linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org, ben.horgan@arm.com, james.morse@arm.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_052241_453640_42B4E817 
X-CRM114-Status: GOOD (  10.62  )
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

On Wed, 09 Jul 2025 10:38:07 +0100, Ben Horgan wrote:
> Previously, u64_replace_bits() was used to no effect as the return value
> was ignored. Convert to u64p_replace_bits() so the value is updated in
> place.
> 
> 

Applied to fixes, thanks!

I have dropped the Cc: stable, as ths bug only exists in 6.16, and we
are not backporting anything related to NV to previous kernel versions.

[1/2] KVM: arm64: Fix enforcement of upper bound on MDCR_EL2.HPMN
      commit: 2265c08ec393ef1f5ef5019add0ab1e3a7ee0b79

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



