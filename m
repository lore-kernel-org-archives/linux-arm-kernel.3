Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007CAC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruipU1u5W9byyxX9qPeGPH+nhoQRgzgXh/OFxRteDPg=; b=Yzx8b+0KgpZuKZJdZSFu6E9M7L
	VMIPRXkNkRdS/99PiRZVEBlqppeFOlJ82F9rd65Yo1ZAP342m5ZrYa4bU194vZt6uob7064kwFqdQ
	mY0QgT5yMGEu4BMCNwm/XNf3N91msZPtc66p3FnWy1pq7W1ggWe72yTAoMdBEFshijxc9pRRXssJH
	Ts4HK5Tr0TCft0KNQIM+/V5mld10/haR2Ia0isCUoVcxMKYECVUjsoeB4jE2l2HyjjmJJ13tVE1PE
	S2Tynb+5pBEMt042EjL2NjfEMsSMKmYDMu6wL5vc+BDoYju9t6dCdsLEsaO84kf5qDZUzyFrEXGeg
	QoDz+UFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Sfl-00000006cDq-3I7p;
	Tue, 15 Sep 2026 12:54:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Sfj-00000006cDG-3aDl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ruipU1u5W9byyxX9qPeGPH+nhoQRgzgXh/OFxRteDPg=; b=Ph3qm9FIHqYFxgDnMvfIXqIZII
	hsyBjWoZ2ihmYzpEdC3zIe8niikGoMcuNSToGIahmdbFhCwBDcyEEpTxGuKsvtqZ50N8RCcyPRdEd
	6WjATR1tNqWiSgbvuvebJ28NYdwj3J5yaYqJJ/Mazkv57Nu+Nc/J32CpmMfQFesxfi6995BGWn3BY
	zbCajAejGkr7bhDgXbH7SMEGzoiep3XWxCEUtU6jq5+I7mQXUyhLd2y6Dccjxw3KwtGO+mNDzg+1Z
	VEAtAxtwHlAfTVSr0tT0qy0wxYYNtFh9jGqIJLC7yfjkeICDyzzK/gxckXxSgLjpNEhFBSQMW1KET
	zSt68ZAA==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Sfh-00000006lgf-0Lhq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:54:02 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so2055275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789476839; x=1790081639; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ruipU1u5W9byyxX9qPeGPH+nhoQRgzgXh/OFxRteDPg=;
        b=cQyixW0J3/XVxt2PuIg2G1NcikIWrwiu2e9MN7ARpie1w4uoSs2EoQGiEEaRaZRj7T
         YLpm+2fsVvPCGRa5Atzm3tBoOVgKOQCJxA9O71Ss/JdqXIlbU2SrbVMda/ZS9mZcIX/+
         Ltam8iNjPQ/+NuPrqZOcL4GNC8OlcCF6OBpGU5zm50f3f9Eb+kVt+kVtOWiw8DL7Y0zO
         LXT+hOLvZP/7dwCTgptC9YI6Ox5Xecs635nQPQBoUt0zFfXKzgGgAlwgEgR8MrkSBIlc
         OEahj8G8Ql5gGsL84r0J8+BR3YjbGst8uf5SP5xnVJ2z2RgdlLEb/8Igfs/bhRQJvgG1
         OhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476839; x=1790081639;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruipU1u5W9byyxX9qPeGPH+nhoQRgzgXh/OFxRteDPg=;
        b=f2Ct+Cbqu4facZ51ksDf/+SSh6c53z9pGhuxfyf23VREqTe9bqrc7vUrYO9/UfLnmW
         xUpUDqVYVWZc/Ixokp3AYUXlhG0LEp5lehvw1kjQqrxWAOBoCOvh9FPW9CJdAk0ZqlUz
         nSLzwJmXQ8M2AHZzUz5FKmKatf0EX4T0NSKGSOaEx/j5LYzvYX3A9nAB9j8jgYnUeGAs
         Mdb041IaqxZ4MOct8Sj/xgSmvpvW+nsYT+YwKQHqm9vRLCVZyTdJpQ3GuoA6JOF+vtEw
         X9tVbvTasqQr5z9Lc12oJ1vL3ZcshuQEBOEZ9H7cphvm1XpAmFdYdWngJsujtJ+i89u3
         Vyeg==
X-Forwarded-Encrypted: i=1; AKwUvByAZEwUSrluPkMfJwOXyT/kjSurK5XooexIa6VQgbCoJboCC7ZzZfv4MYbA5KcGM4jjVIrwoWmictxNIArXX4/8@lists.infradead.org
X-Gm-Message-State: AFuF++lxQZsoi2uOisE5UUVE8WXGarvPFyUtKBK4lIXa52uOKDyGlxR2
	5Y5V4YdNfrBKPPxvuQfzuqShbsvDnRXGIa4W330RFFj2ocVwaDMFV1eTbLKenfDfrv0=
X-Gm-Gg: AYBFou1142JWxAC96+OdSRMS9I/0Ouoh2l0e09Yo3IapWHOszBFsjyq5u9VWBnBFfea
	tZKqg8m6C2Ct1ja4n7OBG0EGm8c01n/XF1JgDJElPkATY0CBzT7svYUcnJz1swAzNElMJiSQhml
	rYL1Wl68cSm60Rlvm0sWikbwCsiT8ZQFgLb5+Sne1ZcEAZe21ZSBYuL+65xsI38wrpMTF5sjGos
	+gZ4goVHivaYXf5XiKyvGLEUdWaOF+rdW34vRnxIE2u0bCQ8fqyRueZqr2oN83IrE54r8ikhXhc
	vuf3jnhmqQfb97g+rxMj0lY3hWjTdx6KcM7eu1Pwsh/9x1xSh1ULkQSna1zSeYrpKX8VvVEZQ0d
	9aiGVzE89rYlVdVj8lapzkXRy9ouUVR06zmRs12D3XgpwJSPwTB359p0Mvqf2LLWxmt+bZWfKMn
	sklIMykx952EilHD1680y5tsYH1yq/T+1hWYvF00QQmlHi5UaiSL0martAefrCVoZ0tAn9JCON9
	aSQMEgU5aBN1AHOfA==
X-Received: by 2002:a05:600c:1c26:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49e82213842mr16348805e9.5.1789476839476;
        Tue, 15 Sep 2026 05:53:59 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a9d1dsm73406825e9.10.2026.09.15.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:53:59 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 07/11] clk: realtek: Add support for mux clock
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
In-Reply-To: <20260901072446.2563145-8-eleanor.lin@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-8-eleanor.lin@realtek.com>
Date: Tue, 15 Sep 2026 14:53:56 +0200
Message-Id: <178947683646.448573.8652586338644531668.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4922; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=M0IzIsWiPP1002jx1x32ohvsScyH0p5PmYjJWCPWxCs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqqT/kIj2H05/TQ42wyCS3cLOfpVaD8wrOMQ3y+
 Ny8dTCQUReJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqk/5AAKCRDm/A8cN/La
 he81D/45r9CNZwZIVBcLR0EH1/ZBwuxMLr2LG9h4TeHpWHTcEMtRCnWHjpnlVR9r/MRkZM/5dxv
 J3ITQ2RCLm0YArSa+h6lzIQPyon1HsMu4WhNvHt3IxjliQ3r9VWrn5hSP8YARJZBP7EddBboad5
 LHVi0mWjIh8j8DsGUMs8ShpLE5W8AOmaR62C9AViwhEznxzyz3w9MCDnq5hgmSzpYVHS3aDat5Q
 d5c/L+INQNYBIEY3DmSfV2CiY50Xg3NZYhEnv0ZjYtOEQ4v/A1VVR7+yZxxA0hRDhEYYLJfqpyL
 2JGmOm9ST3nEPTB2QVJHrRXFcVWJzrz1S1lkaaczkzQa7w9x/72P0AaFv2JdQ5PDnTgZBelgylG
 DzH1uZXCIkxIsvUwHJMv/iDRwA52DphXgdiXzUZzmNc0FdL0txxPPNJ0eBixDbuMn7T8VMhemIt
 OA3NDET+hDgzz+xCJ7F2sOyLhqpXVl0SB4DL4aaz/MQjDPsr0/XOh0J/9C7tJcCFzn0YmvWdEtp
 /CZi/IbgYuw04Ql+j+Izsr2UmSk005u7rzwGXa2c25RYrUD2FoedEUTwbx6aSzO81pW9e97gooZ
 EriyMjYVl2D+cYSRN1YGN77gxpz/aOvAXq0F6zBCgedZ0Tt4YLY200PqACAI4be+lZE/9S8maXx
 4xTnCvcV44d+iVA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_135401_267500_1F41D339 
X-CRM114-Status: GOOD (  22.90  )
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
> Add a simple regmap-based clk_ops implementation for Realtek mux clocks.
> 
> The implementation supports parent selection and rate determination through
> regmap-backed register access.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v14:
> - Move Reviewed-by tag to the correct position.
> ---
>  drivers/clk/realtek/Makefile         |  1 +
>  drivers/clk/realtek/clk-regmap-mux.c | 41 ++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-mux.h | 43 ++++++++++++++++++++++++++++
>  3 files changed, 85 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-mux.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 840aff067b61..217ccaf5644a 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -4,4 +4,5 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  clk-rtk-y += clk-rtk-common.o
>  clk-rtk-y += clk-pll.o
>  clk-rtk-y += clk-regmap-gate.o
> +clk-rtk-y += clk-regmap-mux.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
> new file mode 100644
> index 000000000000..1069c95595aa
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-mux.c
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/export.h>
> +#include <linux/regmap.h>
> +#include "clk-regmap-mux.h"
> +
> +static u8 rtk_clk_regmap_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_mux *clkm = to_rtk_clk_regmap_mux(hw);
> +	unsigned int num_parents = clk_hw_get_num_parents(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
> +	if (ret)
> +		return 0xff;
> +
> +	val = (val >> clkm->shift) & clkm->mask;
> +
> +	return val >= num_parents ? 0xff : val;

This is not really useful, the core already rejects val >= num_parent.
So returning a higher number changes nothing as it stands

> +}
> +
> +static int rtk_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct rtk_clk_regmap_mux *clkm = to_rtk_clk_regmap_mux(hw);
> +
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->mux_ofs,
> +				  clkm->mask << clkm->shift, (u32)index << clkm->shift);
> +}
> +
> +const struct clk_ops rtk_clk_regmap_mux_ops = {
> +	.set_parent = rtk_clk_regmap_mux_set_parent,
> +	.get_parent = rtk_clk_regmap_mux_get_parent,
> +	.determine_rate = __clk_mux_determine_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ops, "CLK_REALTEK");
> diff --git a/drivers/clk/realtek/clk-regmap-mux.h b/drivers/clk/realtek/clk-regmap-mux.h
> new file mode 100644
> index 000000000000..ad524bb86a19
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-mux.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_CLK_REGMAP_MUX_H
> +#define __CLK_REALTEK_CLK_REGMAP_MUX_H
> +
> +#include "clk-rtk-common.h"
> +
> +struct rtk_clk_regmap_mux {
> +	struct rtk_clk_regmap clkr;
> +	unsigned int mux_ofs;
> +	unsigned int mask;
> +	unsigned int shift;
> +};
> +
> +#define __rtk_clk_regmap_mux_hw(_p) __rtk_clk_regmap_hw(&(_p)->clkr)
> +
> +#define __RTK_CLK_REGMAP_MUX(_name, _parents, _ops, _flags, _ofs, _sft, _mask) \
> +	struct rtk_clk_regmap_mux _name = {                                    \
> +		.clkr.hw.init =                                                \
> +			CLK_HW_INIT_PARENTS(#_name, _parents, _ops, _flags),   \
> +		.mux_ofs = _ofs,                                               \
> +		.shift = _sft,                                                 \
> +		.mask = _mask,                                                 \
> +	}
> +
> +#define RTK_CLK_REGMAP_MUX(_name, _parents, _flags, _ofs, _sft, _mask)               \
> +	__RTK_CLK_REGMAP_MUX(_name, _parents, &rtk_clk_regmap_mux_ops, _flags, _ofs, \
> +			     _sft, _mask)
> +
> +static inline struct rtk_clk_regmap_mux *to_rtk_clk_regmap_mux(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
> +
> +	return container_of(clkr, struct rtk_clk_regmap_mux, clkr);
> +}
> +
> +extern const struct clk_ops rtk_clk_regmap_mux_ops;
> +
> +#endif /* __CLK_REALTEK_CLK_REGMAP_MUX_H */
> -- 
> 2.43.0
> 
> 



