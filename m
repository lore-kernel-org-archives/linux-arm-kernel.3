Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429CBC55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5CSwG55YADucmpwN1DahTYwaTO0UaQN77qVWu7jJdw=; b=YrIAgn9FukFLhuExmyXL7iWT40
	dEjReWxcmk/EQVyc71KfPrq2G646ujHH4oP+Yfn2GdbVsp43IyUlnVSPqiZTSDp5wCec5ynavULnb
	lw3i6rLfIYCCUe4tqlNe8DmOxc58nAx0BbGQUjrpz84my1rtbo1UAU3cboFvJlTZrq2hlZ8O5Y82G
	Fq/57F5KxCrD7P/zbd5Na8srolOcZTUDsXqHsIiDsbtqBSmFxPMzCuaJOYLsNZQBjEK1+piWZC+vH
	vaxhc83P+0F0qcNThbVzdXD3UD3nS2te01POdRmi2BEVWriDqYtEOb0jj9nHBK9VI8EEncsan12Di
	B1BG6ndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLuO-00000009pQz-0efl;
	Thu, 30 Jul 2026 08:14:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLuI-00000009pQB-0lrc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:14:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA3FC41507;
	Thu, 30 Jul 2026 08:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FC51F00A3A;
	Thu, 30 Jul 2026 08:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785399261;
	bh=z5CSwG55YADucmpwN1DahTYwaTO0UaQN77qVWu7jJdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZtfpqxMO3QFI6FhUxbO7MgZno07408HCX2BJ13cnCuh3ST+y4ee4fOVozzS1/seAh
	 QPqyySyPTKLuQTJs27mRwDqh7kMkdTuCFGdyY0VS5igbyXZhp2ggaAIEKJ5VpslOv5
	 tKVz7WuBlUau1LGTw3U5i/HJcOXqYIpKlSOgEv9wPwcjyaJUpZpmPHAFj2r0yIcfYE
	 puphLa9ipeR8KVzGq+JLk7re19uPRuPOQFq6uEj1/kexkaAw6FLNSynRLxMLSPlKzm
	 2DBfZ+TCexWh2rOM3B2+ANpXosCD+gwfVJE37cKKdmIo+J/hJTzfRDt1wDSGF4I9Qw
	 x8fgGgMRdsxbg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kees Cook <kees@kernel.org>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Pan Chuang <panchuang@vivo.com>
Cc: Christophe Leroy <chleroy@kernel.org>
Subject: Re: (subset) [PATCH 0/2] bus: Remove redundant error messages on IRQ request failure
Date: Thu, 30 Jul 2026 10:14:04 +0200
Message-ID: <178539922194.574381.11201940278716774894.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710110930.462109-1-panchuang@vivo.com>
References: <20260710110930.462109-1-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=731; i=chleroy@kernel.org; h=from:subject:message-id; bh=oet0d/75qkhExnrQA65w4zG1pGl8gFrf327e7raz+Go=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRls1/4FTg9MmSmW90GaflLi9Rf2n3MfDlhZ2+RoYrtt XsBV2d86ChlYRDjYpAVU2Q5/p9714yuL6n5U3fpw8xhZQIZwsDFKQATmV/C8D8jZU7FqhQO9cXr JJR7mR8o9JySPL1IN6BDyUb2Ys3cuY8Y/rsFR/dVZyr252o9WX/zJrvmFLcHRwpyJR/eyg5a2a+ 9lhUA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
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


On Fri, 10 Jul 2026 19:09:25 +0800, Pan Chuang wrote:
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

[1/2] bus: fsl-mc: Remove redundant dev_err()
      commit: 1831c3b0fb726221671ace9b10c760b80dcce597

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

