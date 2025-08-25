Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DDECA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfmgXxgD0qt+5wz0o9XoN8d8sCZxVxXNPtnswF+FPKE=; b=fveibC+T6rcGLQVlvq5N51yQoP
	A38B4jYYzL/xwGMMPS2oGRiCIP4gOx7AiH1bNioXCjtENkFq8lXjK9bGiZaYWiED8USAMgPvcp3Ky
	RfEToNuXE0YRY2T68A62R7Bd6f1GwfQAvojrclYpG2aHi7EDoQwlnVHXEpYRcjafiEQnpv+TGfLeo
	tvUc8B9YBjBaPtQLTN0OL/G+/V8GXsU1mtap74jpAgOVZy6xwjSqIkt9N2Dsu7BpLp6yufO5mx1xx
	R8A8tIjLxc2DyU+3icrzYbc9xaA06LShLYtJUNfS9xm/cXGKCO9ShUXLycRb6GJG6fXu3Y9WBT2Kq
	S7CRkBQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYf5-00000008LNw-37Ec;
	Mon, 25 Aug 2025 14:59:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWeR-00000007y1Y-2n0m;
	Mon, 25 Aug 2025 12:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756126218;
	bh=UVJPdiqJAwlNJSMs+WTVCoHBLtI29kqg/HsLe9G8lgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fb/dQwQEQErrvatkebCZRMmRsZ9gWRIfTk/rSJvIMBEyKLGM/iLeiV9CMeQnf7VGS
	 quo5slxDPnXNxaIIhkYrs9GGWjuSuPKJ2BJfqj8VsEzNZkW+DQalvdvJSE6/yySxfb
	 clXVceBVCD07LsjoUfLY3S+0hRyn1s9ixkuTYdj42px8KxDReqPtw/E3L1eWFOs+ll
	 WTmcAi9YeiEvzSjZXSeXGBJBPQiujdxzNKYolhLIRNs3/AuTtnHL+KTTq3Vz5GIeY4
	 WoMuz3uZZXtIvqa+ndgImrQVhf1E5WN6SmFnrJR3cRv+vgT5fvvgsg+4AOT0N2hU8X
	 r8mWiW9xneSLw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:b1df:895a:e67b:5cd4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FB9317E0478;
	Mon, 25 Aug 2025 14:50:17 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: wenst@chromium.org
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	guangjie.song@mediatek.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	netdev@vger.kernel.org,
	nfraprado@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com,
	robh@kernel.org,
	sboyd@kernel.org
Subject: Re: [PATCH v4 06/27] clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use mtk_gate struct
Date: Mon, 25 Aug 2025 14:49:00 +0200
Message-Id: <20250825124900.209515-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAGXv+5GxJs03EcMt0jm-x_fDuy_RtCrnOmyJvVVgAP9O9R6E2Q@mail.gmail.com>
References: <CAGXv+5GxJs03EcMt0jm-x_fDuy_RtCrnOmyJvVVgAP9O9R6E2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_055019_850397_749EE634 
X-CRM114-Status: GOOD (  16.36  )
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

On 8/15/25 05:42, Chen-Yu Tsai wrote:
> On Tue, Aug 5, 2025 at 10:55 PM Laura Nao <laura.nao@collabora.com> wrote:
>>
>> MT8196 uses a HW voter for gate enable/disable control, with
>> set/clr/sta registers located in a separate regmap. Refactor
>> mtk_clk_register_gate() to take a struct mtk_gate instead of individual
>> parameters, avoiding the need to add three extra arguments to support
>> HW voter register offsets.
>>
>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>  drivers/clk/mediatek/clk-gate.c | 35 ++++++++++++---------------------
>>  1 file changed, 13 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
>> index 67d9e741c5e7..0375ccad4be3 100644
>> --- a/drivers/clk/mediatek/clk-gate.c
>> +++ b/drivers/clk/mediatek/clk-gate.c
>> @@ -152,12 +152,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv = {
>>  };
>>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
>>
>> -static struct clk_hw *mtk_clk_register_gate(struct device *dev, const char *name,
>> -                                        const char *parent_name,
>> -                                        struct regmap *regmap, int set_ofs,
>> -                                        int clr_ofs, int sta_ofs, u8 bit,
>> -                                        const struct clk_ops *ops,
>> -                                        unsigned long flags)
>> +static struct clk_hw *mtk_clk_register_gate(struct device *dev,
>> +                                               const struct mtk_gate *gate,
>> +                                               struct regmap *regmap)
>>  {
>>         struct mtk_clk_gate *cg;
>>         int ret;
>> @@ -167,17 +164,17 @@ static struct clk_hw *mtk_clk_register_gate(struct device *dev, const char *name
>>         if (!cg)
>>                 return ERR_PTR(-ENOMEM);
>>
>> -       init.name = name;
>> -       init.flags = flags | CLK_SET_RATE_PARENT;
>> -       init.parent_names = parent_name ? &parent_name : NULL;
>> -       init.num_parents = parent_name ? 1 : 0;
>> -       init.ops = ops;
>> +       init.name = gate->name;
>> +       init.flags = gate->flags | CLK_SET_RATE_PARENT;
>> +       init.parent_names = gate->parent_name ? &gate->parent_name : NULL;
>> +       init.num_parents = gate->parent_name ? 1 : 0;
>> +       init.ops = gate->ops;
>>
>>         cg->regmap = regmap;
>> -       cg->set_ofs = set_ofs;
>> -       cg->clr_ofs = clr_ofs;
>> -       cg->sta_ofs = sta_ofs;
>> -       cg->bit = bit;
>> +       cg->set_ofs = gate->regs->set_ofs;
>> +       cg->clr_ofs = gate->regs->clr_ofs;
>> +       cg->sta_ofs = gate->regs->sta_ofs;
>> +       cg->bit = gate->shift;
>
> I'd rather see |struct mtk_clk_gate| (the runtime data) gain a pointer
> to the static data |struct mtk_gate| instead of doing all the copying.
> This is just needless duplication.
>

Ack - I'll refactor this in the next revision.

Thanks,

Laura

> ChenYu
>
>>         cg->hw.init = &init;
>>
>> @@ -228,13 +225,7 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
>>                         continue;
>>                 }
>>
>> -               hw = mtk_clk_register_gate(dev, gate->name, gate->parent_name,
>> -                                           regmap,
>> -                                           gate->regs->set_ofs,
>> -                                           gate->regs->clr_ofs,
>> -                                           gate->regs->sta_ofs,
>> -                                           gate->shift, gate->ops,
>> -                                           gate->flags);
>> +               hw = mtk_clk_register_gate(dev, gate, regmap);
>>
>>                 if (IS_ERR(hw)) {
>>                         pr_err("Failed to register clk %s: %pe\n", gate->name,
>> --
>> 2.39.5
>>

