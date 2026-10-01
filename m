Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC85CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ds5ik7E8aFeLG9+eGz+NlTxnIFC20DsaI0MfbH9KF6k=; b=3LJInsn+GysyWkCdh7YGcKO7KR
	Pnht/Ks2vdG0eAWZENUb9hfduA13qbgWCcT4zrCtvl5G0RqVG+7YYWWG0u9CgnDctHJVwANnAl8Fh
	TvG27O1rEhg41BszjtXJK/82yoh3Esql5Y5zZzlNQ/C4BhufBTyllxsJxqr2EdsxL3MeC2zA8pPUR
	0DyK/jXQ7ZI97ndmfhwcIbilhxcMWtS0XvY8IqX4YTqFlvXiFbSMtgPmS2324oMwkB9JLfdOcTfDQ
	mcJ9+BzoEDjtN3yjzMy/4ucLl0wy85Y1btRTGO2efQaVr9i3isfnRkWWPMhimJXgg4qdYKGZIqVJ2
	5HKjvJGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCExZ-00000008dUu-143E;
	Thu, 01 Oct 2026 11:28:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCExY-00000008dUc-2pbC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:28:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C88DA601E4;
	Thu,  1 Oct 2026 11:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344A51F000FF;
	Thu,  1 Oct 2026 11:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790854099;
	bh=ds5ik7E8aFeLG9+eGz+NlTxnIFC20DsaI0MfbH9KF6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tv79kSWilx5o3Mgjnv6DJsulMK1FxPD1gS7DssuJbuIB6XLXKDDufYKPtTkUgG+1c
	 /GZZ/EqB3dXenONMYETxi+vZA1vJPnF3avtbUEqXo3PoU8+p7tqVAs1uPLVG334ry2
	 4UuZk7zTvGoXN1nEDe7nL0MUkhudPFMxNllKQOiey7dMnF1/OlUTxL9ZzQHcLIe3Wd
	 Ntct4FD7P/KhiRrAUxYYnfzjt/5SKCzPQF66AAe+NgkWQJsOl4YmWjrATckyU92tLU
	 gKj3M8oIOr4ZJV52WDQEu+jEDngRReB2YxkeviHwajemKI/fVnOSCha7vmP9rckloa
	 zZqZzJXDWUIOg==
Date: Thu, 1 Oct 2026 12:28:12 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 03/15] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <ar5DIENoWVSOTQsY@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-3-3556644cd927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-arm64-gcs-v21-3-3556644cd927@kernel.org>
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

On Wed, Sep 30, 2026 at 10:48:13PM +0100, Mark Brown wrote:

> Reviewed-by: Leonardo Bras <leo.bras@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

With the preceding patch and the additional change below to extend the
invariant to GCS as well, the issue with incorrect save/restore is resolved
and this LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 3ae293798b27..823460106de8 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c

> @@ -5875,6 +5917,9 @@ static bool kvm_validate_id_regs(struct kvm *kvm)
>  	if (kvm_has_s1poe(kvm) && !kvm_has_tcr2(kvm))
>  		return false;
>
> +	if (kvm_has_gcs(kvm) && !kvm_has_s1pie(kvm))
> +		return false;

OK nice this extends the invariant to cover GCS as well!

--
Cheers, Lorenzo

