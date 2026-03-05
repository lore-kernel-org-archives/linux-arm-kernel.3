Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C35FF33A8D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v21MsUKG3qveBMMsiq6HUlFhlxkEgA0R/nzk0Xhw55M=; b=z5jcMUfhY1TaCBLqoKdqnrXV65
	oU0e9B1FQ3gGiqp/AZKgGcGtQWp0SYEzD2j9LIdBU26lbVffNLfiwci7uyNldLD3/JlOguz36pHvf
	r3LeVmzFixNYmmSrxUqB4eY4FvawTsZ1FSgcK3u5XdRHIiuTISfkjC6ZFGHFRzbVucfa2KwmvclAi
	OJMvL1ErUztOk8GHqQGdsJOsbI5S0BbQrYH+vpZ6nw2NAu94hy3iE71xRb79eLyL0eRKdBsio5RjN
	gg6pBO0RraHNGf9OUoC629ARtGE0fMDcpUNqalVDfe1Xuu6Hwuq8NwyUjGdvVak6Pudro196we+Ds
	gkKtUJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAUZ-000000026WG-2nQa;
	Thu, 05 Mar 2026 15:19:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAUW-000000026Vf-2xqJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 15:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C38943A08;
	Thu,  5 Mar 2026 15:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5787EC116C6;
	Thu,  5 Mar 2026 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723995;
	bh=VN7n9yn5PJFyec0HMW+P/5sg7qAXWN+gohsAAiVTLkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q30LB88PX/dK9INys+BOUhU+sSAaWnlIweL0ztSoM2OJBHBelFFfLEKM0fQl629lp
	 AdGva/AfxcxQ6eD/oH0QwgL4YyvtF5xYKClqTFr8/fKB40nCnF/w4c5cd+sw3y4EYY
	 AY9ZXrYUP3kc66MzEsTh59ZEQrEo3Y5VIEuqdKF/tSaW/5vzEoC0s1cQ6ctzI6cna9
	 vOLZnPxoqLPyP2+gp1Da8eQeM2hpL8AyeWCtrnXbw8bhnkFDsIUfJtEZ3fDGghI9LR
	 lMmTpXPR8GWzRXbTHsprsE56MKtaqzu0nwBn1ThwtPxluZ6AbyQeK3DZtFi8Ft0bn9
	 6vFmD24tD7IOg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vyAUS-0000000GVHz-3q2s;
	Thu, 05 Mar 2026 15:19:53 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Eagerly init vgic dist/redist on vgic creation
Date: Thu,  5 Mar 2026 15:19:49 +0000
Message-ID: <177272398041.2929264.7575517803288015477.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260228164559.936268-1-maz@kernel.org>
References: <20260228164559.936268-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_071956_763033_BA706FF1 
X-CRM114-Status: GOOD (  11.51  )
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

On Sat, 28 Feb 2026 16:45:59 +0000, Marc Zyngier wrote:
> If vgic_allocate_private_irqs_locked() fails for any odd reason,
> we exit kvm_vgic_create() early, leaving dist->rd_regions uninitialised.
> 
> kvm_vgic_dist_destroy() then comes along and walks into the weeds
> trying to free the RDs. Got to love this stuff.
> 
> Solve it by moving all the static initialisation early, and make
> sure that if we fail halfway, we're in a reasonable shape to
> perform the rest of the teardown. While at it, reset the vgic model
> on failure, just in case...
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Eagerly init vgic dist/redist on vgic creation
      commit: ac6769c8f948dff33265c50e524aebf9aa6f1be0

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



