Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2C6C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ePQoTS5gkevuRaKo+KRLDpjF6AsQgD8+/kWiIcz9YM=; b=zGVCQjwdCiF2cClPbh3H6F1aGC
	IRnImtrjk7u0ppekYURyQUeGl2Ch0WbF4uGqEw1sTw1aE5eTiCg7y5joAjZSGO971muINohmLeFzE
	iVgPNsQjPmUYZc2FzEPvYQsgoQHukTp7pPlc698YfsXyDf0iusGvp4DdHHWVZlQWcauZbOtpHFH3c
	dFZyGtrglOE8cDFCPNGKpKCUk1mWhWC2A+D1ejoxPqiVLrNZUFrbG+mNQNi5QEFER6wp9Wqq9CiYV
	8DVlFBkvBqgi5SPjFre+EI0is2X8olBQpC2umqhcSPdNwDpxIzfhtlL+Dl86VlKsu39yEPsBb5aud
	LxgNCV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKw7P-000000008vG-41j6;
	Fri, 30 May 2025 09:33:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKw1d-000000007Dv-1vYH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:27:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EC644A51B;
	Fri, 30 May 2025 09:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EB2C4CEEB;
	Fri, 30 May 2025 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748597261;
	bh=O7HuuN8Org6gDfEfq/4OR9K7pQjFejpZLqAvhjIpqtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zk31K/aUVlp5izQOtwtyGuQ4UdU+JymFJuHoAj1/EJkk+5o9p2P/sOph/QWhMy/8A
	 +l8qcLP5GioyOk6pWFjxEgY6JLhamlGC2FfM3EX7MOJV3KwTPeowxpmaQieNil44Pp
	 2O7BXuNerlJkeUQsAemULPxK2aByxojYsg/g9cB1MQB8aoXT4p7w756uBW2AgUqJLu
	 3N4xbZJlrdbQzd5lBR94EavjmWTIg1lrGg2KypmgRAtnMDwraH1iNPcWo9mqhvzeXl
	 fv0uu8khfyX3wx7i/fPgMHa2eLWiZcargp7P00b2hv1M1oG8k/IXckBjIOJIatCwtc
	 LI9+W6njeIk9Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uKw1a-001oIO-LR;
	Fri, 30 May 2025 10:27:38 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: sysreg: Drag linux/kconfig.h to work around vdso build issue
Date: Fri, 30 May 2025 10:27:34 +0100
Message-Id: <174859721248.1152851.3335877797680496583.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250523170208.530818-1-maz@kernel.org>
References: <20250523170208.530818-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, maz@kernel.org, broonie@kernel.org, scott@os.amperecomputing.com, catalin.marinas@arm.com, oliver.upton@linux.dev, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_022741_519525_0CA99DB3 
X-CRM114-Status: GOOD (  11.84  )
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

On Fri, 23 May 2025 18:02:08 +0100, Marc Zyngier wrote:
> Broonie reports that fed55f49fad18 ("arm64: errata: Work around
> AmpereOne's erratum AC04_CPU_23") breaks one of the vdso selftests
> (vdso_test_chacha) as it indirectly drags asm/sysreg.h.
> 
> It is rather unfortunate (and worrying) that userspace gets built
> with non-UAPI headers. In any case, paper over the issue by dragging
> linux/kconfig.h in asm/sysreg.h. It is the right thing to do, at
> least from the kernel perspective.
> 
> [...]

Applied to next, thanks!

[1/1] arm64: sysreg: Drag linux/kconfig.h to work around vdso build issue
      commit: 94d889713d8b8e3bb78e19a1bbe76e36e34e8113

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



