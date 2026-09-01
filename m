Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525D5C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 02:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4ecXQO9vqNzXOeLVTWPt4EelG5cYusY7/xAh/+zYqA=; b=Q8EV0jwLaUUkxWCpOEZalkjfx9
	G7qfoDCoaivf4n8gAefpYaya2uns8QAkFIjSe/UdqQFEgeRFz0kGrixbBPhD/8SXSmWGy2NITTyCS
	x0/dJZvBruMCEoeKcuYtU8plBKaZ6gYHhQ0enIWrRGg/s3eE+EF7OX+hQlkjxISieatBU9Q1eiVuU
	1CtE2UtwUpKqcAvMteDQn/SEls+khnzWwn4swbBwO76U50DbyVREDd1AVDO9MwIDq66hq7gYF7otJ
	OZKkgKiyOmkmULIot0KIlxVHIC6ne3gfrYRyOOHk2jWHfkUCD1/u7rYNrME8VZEci31agxUGr9Tuo
	Q2rwlUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Dwo-0000000AqSF-35jr;
	Tue, 01 Sep 2026 02:10:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Dwg-0000000AqPc-1z8r;
	Tue, 01 Sep 2026 02:09:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC032602C4;
	Tue,  1 Sep 2026 02:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A476B1F0155B;
	Tue,  1 Sep 2026 02:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228593;
	bh=R4ecXQO9vqNzXOeLVTWPt4EelG5cYusY7/xAh/+zYqA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TmxFSkD2YCDQouxFmPH971PgYOqSEV2vSyQpxt8rtsUCLoj8DDSnAsxeLNFc1Y/WP
	 fWaNooKbLzCqmNqcJMgo/9tsuldIwoBJVX8hfq+P+D1rh51Jvg0AIqfUSPkSwnFXBk
	 TkAW7TzUwFPA4Ih1R07fWPX4Ohm150DERZSF1R0UX6XrvLxqfaBQlV2HO6H24yeJ56
	 nJwT1nlZhfXANy6prsIETo4v0wkXz8pLMAn1tErzAXp2sPrFP450iifYvMLTYCmnOM
	 QNfFJw9VL6GaeCTK2MV9EOptRZFEy62ni/3zRtxaEFV+Ud2yDG8HUZaVW79Bc+xRXG
	 5l2vcvhSTLZqQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Roy Pledge <Roy.Pledge@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Gary Guo <gary@garyguo.net>,
	Sumit Gupta <sumitg@nvidia.com>,
	Rahul Bukte <rahul.bukte@sony.com>,
	=?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Subject: Re: (subset) [PATCH 0/7] soc: Remove redundant error messages on IRQ request failure
Date: Mon, 31 Aug 2026 21:09:28 -0500
Message-ID: <178822856264.1835959.6354603328430924135.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720095920.542801-1-panchuang@vivo.com>
References: <20260720095920.542801-1-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 20 Jul 2026 17:59:06 +0800, Pan Chuang wrote:
> Commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()") added automatic error logging to
> devm_request_threaded_irq() and devm_request_any_context_irq()
> via the new devm_request_result() helper, which prints device
> name, IRQ number, handler functions, and error code on failure.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this
> automatic logging.
> 
> [...]

Applied, thanks!

[4/7] soc: qcom: Remove redundant dev_err()
      commit: 29b96e2769def61531c19aa537f5a3cf3ef38e41

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

