Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1634C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 02:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaGRFcpApNYGi+tek4FQOaCPyr/rBEdvzpe+mtDnBQw=; b=ywF9xi/pCMnkBGzD2Xv8rBrj52
	c738CVYKgN9RPRAgW8VpRLowYWNKlWoKfHtc9qWWRtMmpGMHzVHcgA2QKd4QqjVp+Qg0og6oRtZtg
	9xsF8dZpgAjEKdGOI1vH4wLIzywtDrVfR9qa9C5siKC9eRQ2/455ipS1utUGraau6vlY1PKL6VjPe
	MoQefNLKgvt8IMoGQgPbtXYKwn9P/BhZqPan9Ox1WLq5NV/vnpIwPeDdnnjg8/3sxg63Xz6eYB+hQ
	g0Pdx7ncI9I8GJzXs8k+AkcGU4XzXn7crg49bVrTmT9heoEo78AdpDV9mWrtPy/l/wWQgK3ucsaCm
	exNc4T7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzRRh-00000001nXZ-06nS;
	Tue, 01 Apr 2025 02:33:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzROj-00000001nLQ-3ryk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 02:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B1D7A43F96;
	Tue,  1 Apr 2025 02:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955F4C4CEE3;
	Tue,  1 Apr 2025 02:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743474640;
	bh=p2TwAjP6YBio/E8zuVpxFk/YSNRC4E66gdnvXPCCDzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNOCYLgrWJtrFjh0l0sjaRLQF0bz+xVAsFdavEWssL3k24wvvjNVDh4ZcaXQrAb8X
	 VacPD/WnOGL+aqmuBJvac7trV4860Hqw+IXKlronVwHkIG9xmScTpAQ2zu2BcTKjr9
	 qj3W0d7zDu+/P4faJ9tJ2HA/qB/mipRDiuBUVK/e5vdHKp7MEIweE8qr4AnvtnTFOz
	 UfnbsTm5HzeQZwf1cnwkmfwVcRxwU+kA9jDJFDSw9MaLVOhuDVzoTC370LW7Jlnupw
	 bVDPkMRPA43wa1RNWKC0S2crqZvYAwwfVlDum5le5FfVz8Kfuij8vSXvEk4Bv41m42
	 VuR2VhpRxqkwA==
Date: Mon, 31 Mar 2025 21:30:39 -0500
From: Rob Herring <robh@kernel.org>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/6] of/irq: Export of_irq_count for modules
Message-ID: <20250401023039.GB3186122-robh@kernel.org>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-2-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331230034.806124-2-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_193042_023698_9CDD94A4 
X-CRM114-Status: GOOD (  10.43  )
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

On Mon, Mar 31, 2025 at 04:00:23PM -0700, Will McVicker wrote:
> Need to export `of_irq_count` in preparation for modularizing the Exynos
> MCT driver which uses this API for setting up the timer IRQs.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/of/irq.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

