Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B82CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZFU6ADpAuPrjkYSKIgfTgNybramYLhR9Rl5HgqqtBg=; b=tK7/v9mmxpkngIviMT4Ngctwkv
	JCk9YEAZZtlL2lcA14+9zycFsRvMQu3huX9JQVk4FqzvKyYd4eJP/VZWs3ttOR+OBp7CaSZlFqI3+
	+wXBnyVB31vxl6f5ZVAzWWHd18Ve4hGadkNvb+bPTVFDV41IUdW2FVT9Lzbk2gkPV9T+WGutAPVA8
	nICCOJuf3UbMSVOZ/77rcM2FaYvx+4KagKhOoQ50cgC6EpPjVdUiSgqdxDUSToaNQ9OZF+iQtB47k
	DSGN9ZyfEUT/qBEoFOCdL87xmEtYzfUk9wVFiJa01VA29mGZeRxpnCG9TxgutTQkNqLoEQuaLFAv0
	ZBvQDCuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3ot-00000005bAp-3FZ3;
	Fri, 09 Oct 2026 06:11:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3os-00000005b9M-0Vvc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:11:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8D2144845;
	Fri,  9 Oct 2026 06:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF241F00893;
	Fri,  9 Oct 2026 06:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526261;
	bh=RZFU6ADpAuPrjkYSKIgfTgNybramYLhR9Rl5HgqqtBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OjV5sNeU6DRr08pwzNxoDYiJZtN4nTi0ZROnCHVF0mzUS+ONf/4tSevCTYmnWHjal
	 PEi6ONyvQibxPZqe0jNx9qe8IJGakmCle2vhNJj0Hho/bMi6FXYVHTlq08ao5ZJlyB
	 0XZMvnFOn+3bCobhHT7yjaw3mdhEoPCa7jnKNsh4ihQGFqfaCdjgEYE5ItYQID5wEK
	 bayNKbap6Dc5CnwF33XcxVe+cuaUCqUzZvkqdolTczlaXp+vVOv6WG+Fhx6Mvyou8P
	 JBIOxgjIE/hgXB2e+XAHjYOO1p2zrJ2S/ljStcAQ23rLJECYA36ECYm5PCz7j/+3MB
	 TxoEc4hxDreJg==
Date: Fri, 9 Oct 2026 08:10:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] irqchip/mchp-eic: fix clk reference leak on probe error
 paths
Message-ID: <20261009-just-pink-coyote-a55f80@quoll>
References: <20261008174412.2740045-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008174412.2740045-1-vulab@iscas.ac.cn>
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


On Fri, 09 Oct 2026 01:44:12 +0800, Haotian Zhang wrote:
> mchp_eic_probe() acquires the peripheral clock with
> of_clk_get_by_name(), which takes a reference on the underlying struct
> clk, but the error paths only call clk_disable_unprepare() and never
> clk_put(). When clk_prepare_enable() fails, or when of_irq_parse_one(),
> the IRQ argument validation or irq_domain_create_hierarchy() fails, the
> probe function jumps to the cleanup labels, frees the private data and
> returns with the clock reference still held.
> 
> Release the clock reference with clk_put() on all error paths that occur
> after the clock has been successfully looked up.
> 
> Fixes: 00fa3461c86d ("irqchip/mchp-eic: Add support for the Microchip EIC")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/irqchip/irq-mchp-eic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof





