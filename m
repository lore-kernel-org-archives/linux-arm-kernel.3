Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD9BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNH2HpXL2x6J5cPK7LmFSbV/xVw/MJ5pTy2RIbZqqcI=; b=2ouN47UI5nzjxZ0EGKDcn28P/0
	T8VEoJODtspQpi/o0yBqXYD+xhLxqhKBROE3hSCjr2bd9sX2KlpV64o5/LuakblzjqsDu7fOpxwMF
	eRbNb/px4nxVCtCRPbWKTmVOYp6eCybP6ql0AOwf+XfnhAKuSs2r8PNEI3FLgmG2L1J8eNqtoNyEj
	js0+IWehp5CbjUbDiAQF5wOnSDR+F2md8pEFidT8k/3S53UAm5DeHl4HHFqcgVWv5tuBye4yuNgwg
	cJWu6A1coQlFBz4DDkQP/VMf67oESZgHeVwxUejfpxZ1F/VExs0GSj1PzUwqrLdjGQ7QgOtW6606L
	sa4JTIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYew-00000008L9c-3lco;
	Mon, 25 Aug 2025 14:58:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWYF-00000007x4T-0Czk;
	Mon, 25 Aug 2025 12:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756125833;
	bh=fDXKom27srg/8aJ0SCn6OiziFHzcEwfEmga+IxfFQk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V98QTO3t8wlCyO8mk/hTyx8etU7lVRihXemrytjvGekSs9yuAwddJKGcb2amVUnVX
	 66/0uIloZfn/tBo/oiCSPnVDd9xZkMy1no2gOBLC7rk0MboFl5/Tm9qs+pT5yJmxYl
	 Eac1/Sc6GZoqYczxqFCMh0r5jcFQO3dBS6eMyLMoQVMjxp/6kOXpZV7Mp+dVZhLBUL
	 JHEDIifcW+0tJd6SBJiDk9yZF2GVI6DcLf7HG0AGtEMjE47O+6sPkvlU1IILJSARiz
	 cxjd8sFVoEMGh0zbxFIJUEWfSy0cMBkT9pZ+goGYRITV/uMUbUE8145H5ZQD6uAhDl
	 209nUWWVVSlug==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:b1df:895a:e67b:5cd4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3849917E0523;
	Mon, 25 Aug 2025 14:43:52 +0200 (CEST)
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
Subject: Re: [PATCH v4 03/27] clk: mediatek: clk-mux: Add ops for mux gates with set/clr/upd and FENC
Date: Mon, 25 Aug 2025 14:42:49 +0200
Message-Id: <20250825124249.208838-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAGXv+5Fhsm=JrBP9y-kScw-zK_XFc4Dqfd3VUXx+rA6oBxptJg@mail.gmail.com>
References: <CAGXv+5Fhsm=JrBP9y-kScw-zK_XFc4Dqfd3VUXx+rA6oBxptJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_054355_237450_4ABFB4D7 
X-CRM114-Status: GOOD (  22.34  )
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

On 8/15/25 05:23, Chen-Yu Tsai wrote:
> On Tue, Aug 5, 2025 at 10:55 PM Laura Nao <laura.nao@collabora.com> wrote:
>>
>> MT8196 uses set/clr/upd registers for mux gate enable/disable control,
>> along with a FENC bit to check the status. Add new set of mux gate
>> clock operations with support for set/clr/upd and FENC status logic.
>>
>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>>  drivers/clk/mediatek/clk-mux.c | 48 ++++++++++++++++++++++++++++++++++
>>  drivers/clk/mediatek/clk-mux.h | 45 +++++++++++++++++++++++++++++++
>>  3 files changed, 95 insertions(+)
>>
>> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
>> index c17fe1c2d732..136a4bc6dbe6 100644
>> --- a/drivers/clk/mediatek/clk-mtk.h
>> +++ b/drivers/clk/mediatek/clk-mtk.h
>> @@ -20,6 +20,8 @@
>>
>>  #define MHZ (1000 * 1000)
>>
>> +#define MTK_WAIT_FENC_DONE_US  30
>> +
>
> Nit: I think it would be nicer if you define this locally in the mux type
> clk code, just to keep the two completely separate.
>

Ack, will move this to clk-mux.c.

>>  struct platform_device;
>>
>>  /*
>> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
>> index 60990296450b..b1b8eeb0b501 100644
>> --- a/drivers/clk/mediatek/clk-mux.c
>> +++ b/drivers/clk/mediatek/clk-mux.c
>> @@ -15,6 +15,7 @@
>>  #include <linux/spinlock.h>
>>  #include <linux/slab.h>
>>
>> +#include "clk-mtk.h"
>>  #include "clk-mux.h"
>>
>>  struct mtk_clk_mux {
>> @@ -30,6 +31,33 @@ static inline struct mtk_clk_mux *to_mtk_clk_mux(struct clk_hw *hw)
>>         return container_of(hw, struct mtk_clk_mux, hw);
>>  }
>>
>> +static int mtk_clk_mux_fenc_enable_setclr(struct clk_hw *hw)
>> +{
>> +       struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
>> +       unsigned long flags;
>> +       u32 val;
>> +       int ret;
>> +
>> +       if (mux->lock)
>> +               spin_lock_irqsave(mux->lock, flags);
>> +       else
>> +               __acquire(mux->lock);
>> +
>> +       regmap_write(mux->regmap, mux->data->clr_ofs,
>> +                    BIT(mux->data->gate_shift));
>> +
>> +       ret = regmap_read_poll_timeout_atomic(mux->regmap, mux->data->fenc_sta_mon_ofs,
>> +                                             val, val & BIT(mux->data->fenc_shift), 1,
>> +                                             MTK_WAIT_FENC_DONE_US);
>> +
>> +       if (mux->lock)
>> +               spin_unlock_irqrestore(mux->lock, flags);
>> +       else
>> +               __release(mux->lock);
>> +
>> +       return ret;
>> +}
>> +
>>  static int mtk_clk_mux_enable_setclr(struct clk_hw *hw)
>>  {
>>         struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
>> @@ -70,6 +98,16 @@ static void mtk_clk_mux_disable_setclr(struct clk_hw *hw)
>>                         BIT(mux->data->gate_shift));
>>  }
>>
>> +static int mtk_clk_mux_fenc_is_enabled(struct clk_hw *hw)
>> +{
>> +       struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
>> +       u32 val;
>> +
>> +       regmap_read(mux->regmap, mux->data->fenc_sta_mon_ofs, &val);
>> +
>> +       return val & BIT(mux->data->fenc_shift);
>
> Nit: Do a double negate.
>

Ack.

>> +}
>> +
>>  static int mtk_clk_mux_is_enabled(struct clk_hw *hw)
>>  {
>>         struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
>> @@ -168,6 +206,16 @@ const struct clk_ops mtk_mux_gate_clr_set_upd_ops  = {
>>  };
>>  EXPORT_SYMBOL_GPL(mtk_mux_gate_clr_set_upd_ops);
>>
>> +const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_ops = {
>> +       .enable = mtk_clk_mux_fenc_enable_setclr,
>> +       .disable = mtk_clk_mux_disable_setclr,
>> +       .is_enabled = mtk_clk_mux_fenc_is_enabled,
>> +       .get_parent = mtk_clk_mux_get_parent,
>> +       .set_parent = mtk_clk_mux_set_parent_setclr_lock,
>> +       .determine_rate = mtk_clk_mux_determine_rate,
>> +};
>> +EXPORT_SYMBOL_GPL(mtk_mux_gate_fenc_clr_set_upd_ops);
>> +
>>  static struct clk_hw *mtk_clk_register_mux(struct device *dev,
>>                                            const struct mtk_mux *mux,
>>                                            struct regmap *regmap,
>> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
>> index 943ad1d7ce4b..c65cfb7f8fc3 100644
>> --- a/drivers/clk/mediatek/clk-mux.h
>> +++ b/drivers/clk/mediatek/clk-mux.h
>> @@ -28,11 +28,13 @@ struct mtk_mux {
>>         u32 set_ofs;
>>         u32 clr_ofs;
>>         u32 upd_ofs;
>> +       u32 fenc_sta_mon_ofs;
>>
>>         u8 mux_shift;
>>         u8 mux_width;
>>         u8 gate_shift;
>>         s8 upd_shift;
>> +       u8 fenc_shift;
>>
>>         const struct clk_ops *ops;
>>         signed char num_parents;
>> @@ -77,6 +79,7 @@ struct mtk_mux {
>>
>>  extern const struct clk_ops mtk_mux_clr_set_upd_ops;
>>  extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
>> +extern const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_ops;
>>
>>  #define MUX_GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,     \
>>                         _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
>> @@ -118,6 +121,48 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
>>                         0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,         \
>>                         mtk_mux_clr_set_upd_ops)
>>
>> +#define MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,         \
>> +                       _num_parents, _mux_ofs, _mux_set_ofs, _mux_clr_ofs,     \
>> +                       _shift, _width, _gate, _upd_ofs, _upd,                  \
>> +                       _fenc_sta_mon_ofs, _fenc, _flags) {                     \
>> +               .id = _id,                                                      \
>> +               .name = _name,                                                  \
>> +               .mux_ofs = _mux_ofs,                                            \
>> +               .set_ofs = _mux_set_ofs,                                        \
>> +               .clr_ofs = _mux_clr_ofs,                                        \
>> +               .upd_ofs = _upd_ofs,                                            \
>> +               .fenc_sta_mon_ofs = _fenc_sta_mon_ofs,                          \
>> +               .mux_shift = _shift,                                            \
>> +               .mux_width = _width,                                            \
>> +               .gate_shift = _gate,                                            \
>> +               .upd_shift = _upd,                                              \
>> +               .fenc_shift = _fenc,                                            \
>> +               .parent_names = _parents,                                       \
>> +               .parent_index = _paridx,                                        \
>> +               .num_parents = _num_parents,                                    \
>> +               .flags = _flags,                                                \
>> +               .ops = &mtk_mux_gate_fenc_clr_set_upd_ops,                      \
>> +       }
>> +
>> +#define MUX_GATE_FENC_CLR_SET_UPD(_id, _name, _parents,                        \
>> +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs,           \
>> +                       _shift, _width, _gate, _upd_ofs, _upd,          \
>> +                       _fenc_sta_mon_ofs, _fenc)                       \
>> +               MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents,   \
>> +                       NULL, ARRAY_SIZE(_parents), _mux_ofs,           \
>> +                       _mux_set_ofs, _mux_clr_ofs, _shift,             \
>> +                       _width, _gate, _upd_ofs, _upd,                  \
>> +                       _fenc_sta_mon_ofs, _fenc, 0)
>> +
>> +#define MUX_GATE_FENC_CLR_SET_UPD_INDEXED(_id, _name, _parents,        _paridx,        \
>
>                                                                    ^^^^^^
> This looks like a tab when it should have been a space?
>

Definitely - thanks for the heads up, I'll fix it.

Best,

Laura

> ChenYu
>
>> +                       _mux_ofs, _mux_set_ofs, _mux_clr_ofs,                   \
>> +                       _shift, _width, _gate, _upd_ofs, _upd,                  \
>> +                       _fenc_sta_mon_ofs, _fenc)                               \
>> +               MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,  \
>> +                       ARRAY_SIZE(_paridx), _mux_ofs, _mux_set_ofs,            \
>> +                       _mux_clr_ofs, _shift, _width, _gate, _upd_ofs, _upd,    \
>> +                       _fenc_sta_mon_ofs, _fenc, 0)
>> +
>>  int mtk_clk_register_muxes(struct device *dev,
>>                            const struct mtk_mux *muxes,
>>                            int num, struct device_node *node,
>> --
>> 2.39.5
>>

