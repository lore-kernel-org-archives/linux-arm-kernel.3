Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDDCC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ve43d7pTFVOMTSVWgJo3u0Un/jBoaP9onTkW8Y5KW4w=; b=zdjmBNBPdvFsokRsqKy7A7NY2a
	Wpqz+kOnTi0fEA/gjK2bvet6efk1W9AeUJu0apv92/zn63qHqVTP5Du90zabH3bkMGPI6nLLmFu1M
	JKF7lE9ctdmZ49l7LvOKqtvHS/0vID7ixgMXeFutfd8CXEqD3FsWdSB9zXUc5liyag5YCsUUJvia0
	qSJczVxp8yliME/k6ah528MKMZz5BHVi+OWo5B3n5sxVH+mYnNK79cZMyI9eCJ21A75eRJzN3gsHS
	Mj23eVD0EeBbQfdFWTA8CeBm6Eg6kUBK4LHlqkKR/dwqa0BPMXz4M/H7Fx3/CtEm8FbIpuNUnpt/n
	abi07QmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SUH-00000006aDW-35Hf;
	Tue, 15 Sep 2026 12:42:13 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SUD-00000006aC1-0l1r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:42:11 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so1439514f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789476127; x=1790080927; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ve43d7pTFVOMTSVWgJo3u0Un/jBoaP9onTkW8Y5KW4w=;
        b=SIuv+2AqbxC8DX9AFFchYsmZRnLgfE37ttxC+3RHMTE+1Dd1ZviWbDTi3I8gdmgAGm
         Fip2/uU4tzNzxJiFAODOvC89V4QTMeUk8Jza5SMtksXwyivfx1MYn/R0rSB7z+45CF22
         FNXdUZyJmFeNp7wpE8Qy5oMUGPxwGJ7pbULjeur1y4LZbGOJaCu2rOL8nVmGlA3YdeoM
         yN3IBjBmckH3EaRuh+/MdzvDUoEdYQs9Gd/CclZ/iXp13LvKg1N/dNEaKlmrkRmDqbXW
         HTk0br635uGZEBvb6HhGqw1ad8BUS+xlzgTVq26jN+QhVh5JIupfuaJrLkcgtKGns1Ml
         Fjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476127; x=1790080927;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ve43d7pTFVOMTSVWgJo3u0Un/jBoaP9onTkW8Y5KW4w=;
        b=mPeAz9Vj6fhwMabAjjyx3hvZcqaNZYC48IQKf4KWOc/RdikEiMR3N/jIfjAOOZf+wa
         rRpD2U53zacyOfnEGg4MjYakH43zkVefOmjdX5+V0UkpdsE5rPU1i44UIPFgaWC152cA
         8wZF2C6L8EmpwOLhWZ9H5QvD6/X/MKMMjRDcRkjErrqrl3r0yDnvgbBYP9XkZZ47a4gb
         g3z4gnf/UgV2dUBM9Mk4yqZv2FYiu7YIAAInMDRccx0ye5el7J7/7ovfLAmW5Xt6Gkum
         8RpPulRIBmsoGKCrJHGsXuVeb1SovdtABREpraJdcvWfvAPZQzO6Vz5mbdNeZsArlLKr
         kMkw==
X-Forwarded-Encrypted: i=1; AKwUvBwizSXolGkCe6vG9CZp0bs4926c6OYVIKVMGwqcfSm6U+hMEHrgNZYMCwCl9x6q2Xih0hUPgJ2jlPrVcOI94MXQ@lists.infradead.org
X-Gm-Message-State: AFuF++kktLwsXrF5Sxi87QIAeUeJIzvrlDewCsfMzPhRQZidrJT49vi5
	0CNTvhlyLuU2hqQkeO4cZlstNFAsf//Ojg3sb0R9R0rj5mx9HM8pBgGIVrtAfWV/vNE=
X-Gm-Gg: AYBFou3f//Sn4FIkutL9ikk5yB+/Xk62JroQYTX35aZyB0F2GICdxu1i0tg03m/BRj1
	gK/ay2CX9kkpcpQMmPEC3GCWUcaifUaCyV4UxDngDoDQRs4h6SYcaM8/Ecl4hEvOM1DfGe59owO
	+MaWUHGIcF1DO4AeBxUWZksKUb92ZrRtDlT7LkUR/J4YGe7U0vjPAVT9hH4fq+aHrr6U45RXy7z
	Cjoe1Rwn7F2vY07h+dn+tIooYyGNJW/ThWa7vZTNwgJGdHfx0LkmAi47BYpUNYyFh6rJkjMy7Z2
	6Xp6UvgveJvviNdU5Y27hux1uZVQXPR5w/Gt+Xp08lDevuRGBdn2PzDnFBnNLEdIGmGrWHXMQq0
	0GKyQ3xpE066I+GnfuE6I2rYmOXf8SS0NtfURPXV/JElplRV1LATYyC1lefpaN/oyigftIiLdll
	nmR/1cjEc9EKM9cZCH8f2jjJFvP1uk+Tt0Jpw1M1vr6j5T84aN/eq95rr66P4mKmg/0fqjvHowD
	IWJeKf5sX1iC7llCHM=
X-Received: by 2002:a05:6000:470c:b0:486:f4cf:59b2 with SMTP id ffacd0b85a97d-48702aae4e6mr8151011f8f.4.1789476127347;
        Tue, 15 Sep 2026 05:42:07 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm33532218f8f.35.2026.09.15.05.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:42:06 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 06/11] clk: realtek: Add support for gate clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, cylee12@realtek.com, afaerber@suse.com, 
 jyanchou@realtek.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
 cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20260901072446.2563145-7-eleanor.lin@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-7-eleanor.lin@realtek.com>
Date: Tue, 15 Sep 2026 14:42:04 +0200
Message-Id: <178947612411.448573.8319851834736456413.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6855; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=582/7s3JxsfQWjUN6EMHISrALdyatqiIyfqpimTuSgs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqqT0c9mkExB03yY3YHr0fhg3XGhRRzOgE7qYbx
 W7L0HKibU6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqk9HAAKCRDm/A8cN/La
 hUCHD/wLct30ewH+5Y3QuClGJamgZYobFou8PoCe8ZNwegUjci+LL8dHd3LcPTENTfOHXYFlgkQ
 PVDdSqnMGkiIKdJ+TaI92nbPkyt10u920xrR5yGCGE+qZ/wPHxlqjBu6zRUo47KLDJUEGbL7D48
 +anKtOEZ3A08V2uIO6RiH/2UsE8JJvAZHVeY0u2K84trqjeBp1DiQe/JSTEAGiSHTjA8ZttkIe3
 25FEOUjZ+pbm8G4MeN7gvS2VjLogBvQtHlc90hdCcViOgPqP5SrOcodAOFVeaFuZKTLjbOH6aXO
 QhBHsQqscoL9OJiDBDe+l22fRIMiCPvDS0pwoeZC48RrFRuGikqcqk4GWCRqHEltrxgh/d31Gly
 g7BVtv5s+ZSnyHL4p95rVQUNzzc3uAiQ8Llp3hOVayemE/TWZP4BRMLdrSPVgYAvs/yuJyFTK3l
 FBAYULGRs2mxJmlEhjcOtyjTJDBw+6qsx8YOpgJIeawB3NBo3sM/Pw9/1D4LIfm2e69modjwPRb
 l7WAxge1vw+kHz8c/yeIII68hVKqg0fBgEKVxUi8oIysPoL8BVtFt+NefV0TSDcNnt/CEMy3BtM
 Ykad0qE9ldVDgxCCcebuqZMX1e/zfwRqnnJWIciP7QPGLBsUl+CVPgyvX8Aam+s6F5neGVnQO/r
 SjATklyYSJCn07g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_054210_259466_10EA8008 
X-CRM114-Status: GOOD (  23.76  )
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

On 2026-09-01 15:24 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
> for standard regmap gate clocks.
> 
> Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v14:
> - Move Reviewed-by tag to the correct position.
> ---
>  drivers/clk/realtek/Makefile          |  1 +
>  drivers/clk/realtek/clk-regmap-gate.c | 70 +++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 71edc18121c6..840aff067b61 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -3,4 +3,5 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += clk-rtk-common.o
>  clk-rtk-y += clk-pll.o
> +clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
> new file mode 100644
> index 000000000000..1c32a87d97df
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-gate.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/export.h>
> +#include <linux/regmap.h>
> +#include "clk-regmap-gate.h"
> +
> +static int rtk_clk_regmap_gate_enable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
> +	unsigned int mask;
> +	unsigned int val;
> +
> +	mask = BIT(clkg->bit_idx);
> +	val = BIT(clkg->bit_idx);
> +
> +	if (clkg->write_en) {
> +		mask |= BIT(clkg->bit_idx + 1);
> +		val |= BIT(clkg->bit_idx + 1);
> +	}
> +
> +	return regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);
> +}
> +
> +static void rtk_clk_regmap_gate_disable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
> +	unsigned int mask;
> +	unsigned int val;
> +
> +	mask = BIT(clkg->bit_idx);
> +	val = 0;
> +
> +	if (clkg->write_en) {
> +		mask |= BIT(clkg->bit_idx + 1);
> +		val |= BIT(clkg->bit_idx + 1);
> +	}

Could add a comment explaining this write_en thing ? Some kind of volatile bit to commit the change ?

> +
> +	regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);

Nitpick: the 2 functions above more less copy/paste. 

> +}
> +
> +static int rtk_clk_regmap_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
> +	int ret;
> +	u32 val;
> +
> +	ret = regmap_read(clkg->clkr.regmap, clkg->gate_ofs, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return !!(val & BIT(clkg->bit_idx));
> +}
> +
> +const struct clk_ops rtk_clk_regmap_gate_ops = {
> +	.enable     = rtk_clk_regmap_gate_enable,
> +	.disable    = rtk_clk_regmap_gate_disable,
> +	.is_enabled = rtk_clk_regmap_gate_is_enabled,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ops, "CLK_REALTEK");
> +
> +const struct clk_ops rtk_clk_regmap_gate_ro_ops = {
> +	.is_enabled = rtk_clk_regmap_gate_is_enabled,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ro_ops, "CLK_REALTEK");
> diff --git a/drivers/clk/realtek/clk-regmap-gate.h b/drivers/clk/realtek/clk-regmap-gate.h
> new file mode 100644
> index 000000000000..9303adda3166
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-gate.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_CLK_REGMAP_GATE_H
> +#define __CLK_REALTEK_CLK_REGMAP_GATE_H
> +
> +#include "clk-rtk-common.h"
> +
> +struct rtk_clk_regmap_gate {
> +	struct rtk_clk_regmap clkr;
> +	unsigned int gate_ofs;
> +	u8 bit_idx;
> +	u32 write_en : 1;
> +};
> +
> +#define __rtk_clk_regmap_gate_hw(_p) __rtk_clk_regmap_hw(&(_p)->clkr)
> +
> +#define __RTK_CLK_REGMAP_GATE(_name, _parent, _ops, _flags, _ofs, _bit_idx, \
> +			      _write_en)                                    \
> +	struct rtk_clk_regmap_gate _name = {                                \
> +		.clkr.hw.init = CLK_HW_INIT(#_name, _parent, _ops, _flags), \
> +		.gate_ofs = _ofs,                                           \
> +		.bit_idx = _bit_idx,                                        \
> +		.write_en = _write_en,                                      \
> +	}
> +
> +#define RTK_CLK_REGMAP_GATE(_name, _parent, _flags, _ofs, _bit_idx, _write_en)        \
> +	__RTK_CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
> +			      _bit_idx, _write_en)
> +
> +#define RTK_CLK_REGMAP_GATE_RO(_name, _parent, _flags, _ofs, _bit_idx, _write_en)  \
> +	__RTK_CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ro_ops, _flags, \
> +			  _ofs, _bit_idx, _write_en)
> +
> +#define __RTK_CLK_REGMAP_GATE_NO_PARENT(_name, _ops, _flags, _ofs, _bit_idx,  \
> +				    _write_en)                                \
> +	struct rtk_clk_regmap_gate _name = {                                  \
> +		.clkr.hw.init = CLK_HW_INIT_NO_PARENT(#_name, _ops, _flags),  \
> +		.gate_ofs = _ofs,                                             \
> +		.bit_idx = _bit_idx,                                          \
> +		.write_en = _write_en,                                        \
> +	}
> +
> +#define RTK_CLK_REGMAP_GATE_NO_PARENT(_name, _flags, _ofs, _bit_idx, _write_en)        \
> +	__RTK_CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
> +				    _bit_idx, _write_en)
> +
> +#define RTK_CLK_REGMAP_GATE_NO_PARENT_RO(_name, _flags, _ofs, _bit_idx, _write_en)  \
> +	__RTK_CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ro_ops, _flags, \
> +				    _ofs, _bit_idx, _write_en)
> +
> +static inline struct rtk_clk_regmap_gate *to_rtk_clk_regmap_gate(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
> +
> +	return container_of(clkr, struct rtk_clk_regmap_gate, clkr);
> +}
> +
> +extern const struct clk_ops rtk_clk_regmap_gate_ops;
> +extern const struct clk_ops rtk_clk_regmap_gate_ro_ops;
> +
> +#endif /* __CLK_REALTEK_CLK_REGMAP_GATE_H */
> -- 
> 2.43.0
> 
> 



