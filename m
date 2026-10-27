Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369D4606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fuIEDN/v;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NtHg7Z2J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CxsgGjcrOJING+VboYxz/UP6+uNmJqV4esD6EZmV10Q=; b=fuIEDN/veM/ZLV
	vS3upFCa+ch+rOIvktF56jjq4CqwCTocabJ6PO3KfJYY+zmSy5kPy+9hfhDQUJjEyGhy9zg3evN/r
	GlyDnFMRsTnyAHrZ3cce/9y92tTDs9gwnV12nZvKo7XCwCp9BWYEWE0GbThVwRiHAjM95DOvz1ji2
	NvNtTVCMWH1vE+puDqN2nnZR1VL8ASoWI+zM3s3/DUoRsuVvVckfdJVumq3+EIpkUBwP567qVeV5G
	JjTVxthf9v8M31woMboNmZ/Q26QYWOfxUrsgwufQTOiHMhCUr7IKczb/wdSPy+vDkDws7X5FzWkCh
	vbYaLjjVuhz7Ig6f7H5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe9u-00000004GvN-2urQ;
	Tue, 27 Oct 2026 10:11:58 +0000
Received: from mail-m11885.qiye.163.com ([115.236.118.85])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe9q-00000004Gub-3nuZ;
	Tue, 27 Oct 2026 10:11:57 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52830be90;
	Tue, 27 Oct 2026 18:11:47 +0800 (GMT+08:00)
Message-ID: <f9068153-0d6c-471f-a08b-41cff51ff748@rock-chips.com>
Date: Tue, 27 Oct 2026 18:11:45 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v4 2/4] clk: rockchip: Add internal support for 24-bit
 fractional dividers
To: 1579567540@qq.com, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Richard Cochran <richardcochran@gmail.com>
References: <20261027-add-board-ok3572-c-clk-v4-0-d4152b4fedaa@qq.com>
 <20261027-add-board-ok3572-c-clk-v4-2-d4152b4fedaa@qq.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261027-add-board-ok3572-c-clk-v4-2-d4152b4fedaa@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17cd8387e03a4kunm9044f8144d03f1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQhoeVkIeHxhMGU0ZHx9PQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NtHg7Z2JEyFqKWS/PIIS7ybGEl9gLaVhjg5mSiFPdWpDK2cMLXbATodhmSFjgUA7WwiHiahhC1PMUbYghCo3nRy2oDq13TXn0Y7lgmDaKU8objlGLXsMj7ERiXryHSGFFNOkTrQQH3Z8NMB4sXnSXxRYBJsIt/2MFOfhJlP0KOI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=CxsgGjcrOJING+VboYxz/UP6+uNmJqV4esD6EZmV10Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_031155_611614_678A6821 
X-CRM114-Status: GOOD (  41.13  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

在 2026/10/27 星期二 18:04, Cunhao Lu via B4 Relay 写道:
> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> Some Rockchip clocks split each 24-bit numerator and denominator between
> a low register containing 16 bits of each value and a high register
> containing the remaining 8 bits.
> 
> Add an internal Rockchip fractional-divider helper and clock branch type
> for this register layout. This provides the support needed by the RK3572
> audio fractional clocks.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> 
> - Adapted the rate callback to determine_rate().
> - Made the registration interface internal to the Rockchip clock driver.
> - Rejected compensated ratios exceeding the field widths before
>    multiplication or register writes.
> 

All your patches look strange regarding to this kind of commit msg and
SOB chains. I guess you are describing what you changed against the
original patch from Elaine. But this is not how it works. You don't
need to mention it.

> Co-developed-by: Cunhao Lu <1579567540@qq.com>
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> ---
> Changes in v3:
> - Reject compensated ratios that exceed the actual field widths before
>    multiplication or register writes.
> ---
>   drivers/clk/rockchip/Makefile                    |   1 +
>   drivers/clk/rockchip/clk-fractional-divider-v2.c | 354 +++++++++++++++++++++++
>   drivers/clk/rockchip/clk.c                       |  10 +
>   drivers/clk/rockchip/clk.h                       |  25 ++
>   4 files changed, 390 insertions(+)
> 
> diff --git a/drivers/clk/rockchip/Makefile b/drivers/clk/rockchip/Makefile
> index 554b7eb83dc91..91d4ea4837e3e 100644
> --- a/drivers/clk/rockchip/Makefile
> +++ b/drivers/clk/rockchip/Makefile
> @@ -10,6 +10,7 @@ clk-rockchip-y += clk-pll.o
>   clk-rockchip-y += clk-cpu.o
>   clk-rockchip-y += clk-gate-grf.o
>   clk-rockchip-y += clk-half-divider.o
> +clk-rockchip-y += clk-fractional-divider-v2.o
>   clk-rockchip-y += clk-inverter.o
>   clk-rockchip-y += clk-mmc-phase.o
>   clk-rockchip-y += clk-muxgrf.o
> diff --git a/drivers/clk/rockchip/clk-fractional-divider-v2.c b/drivers/clk/rockchip/clk-fractional-divider-v2.c
> new file mode 100644
> index 0000000000000..102e03f9d6e60
> --- /dev/null
> +++ b/drivers/clk/rockchip/clk-fractional-divider-v2.c
> @@ -0,0 +1,354 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
> + *
> + * Adjustable fractional divider clock implementation.
> + * Uses rational best approximation algorithm.
> + *
> + * Output is calculated as
> + *
> + *	rate = (m / n) * parent_rate				(1)
> + *
> + * This is useful when we have a prescaler block which asks for
> + * m (numerator) and n (denominator) values to be provided to satisfy
> + * the (1) as much as possible.
> + *
> + * Since m and n have the limitation by a range, e.g.
> + *
> + *	n >= 1, n < N_width, where N_width = 2^nwidth		(2)
> + *
> + * for some cases the output may be saturated. Hence, from (1) and (2),
> + * assuming the worst case when m = 1, the inequality
> + *
> + *	floor(log2(parent_rate / rate)) <= nwidth		(3)
> + *
> + * may be derived. Thus, in cases when
> + *
> + *	(parent_rate / rate) >> N_width				(4)
> + *
> + * we might scale up the rate by 2^scale (see the description of
> + * CLK_FRAC_DIVIDER_POWER_OF_TWO_PS for additional information), where
> + *
> + *	scale = floor(log2(parent_rate / rate)) - nwidth	(5)
> + *
> + * and assume that the IP, that needs m and n, has also its own
> + * prescaler, which is capable to divide by 2^scale. In this way
> + * we get the denominator to satisfy the desired range (2) and
> + * at the same time a much better result of m and n than simple
> + * saturated values.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/device.h>
> +#include <linux/slab.h>
> +#include <linux/rational.h>
> +#include "clk.h"
> +
> +struct clk_fractional_divider_v2 {
> +	struct clk_hw	hw;
> +	void __iomem	*reg;
> +	void __iomem	*high_reg;
> +	u8		mshift;
> +	u8		mwidth;
> +	u32		mmask;
> +	u8		nshift;
> +	u8		nwidth;
> +	u32		nmask;
> +	u8		high_mshift;
> +	u8		high_mwidth;
> +	u32		high_mmask;
> +	u8		high_nshift;
> +	u8		high_nwidth;
> +	u32		high_nmask;
> +	u8		flags;
> +	void		(*approximation)(struct clk_hw *hw,
> +					 unsigned long rate,
> +					 unsigned long *parent_rate,
> +					 unsigned long *m, unsigned long *n);
> +	spinlock_t	*lock; /* Protects the low and high register pair. */
> +};
> +
> +#define to_clk_fd_v2(_hw) container_of(_hw, struct clk_fractional_divider_v2, hw)
> +
> +static inline u32 clk_fd_v2_readl(struct clk_fractional_divider_v2 *fd,
> +				  void __iomem *reg)
> +{
> +	return readl(reg);
> +}
> +
> +static inline void clk_fd_v2_writel(struct clk_fractional_divider_v2 *fd,
> +				    void __iomem *reg, u32 val)
> +{
> +	writel(val, reg);
> +}
> +
> +static unsigned long clk_fd_v2_recalc_rate(struct clk_hw *hw,
> +					   unsigned long parent_rate)
> +{
> +	struct clk_fractional_divider_v2 *fd = to_clk_fd_v2(hw);
> +	unsigned long flags = 0;
> +	unsigned long m_low, n_low, m_high, n_high, m, n;
> +	u32 val_low, val_high;
> +	u64 ret;
> +
> +	if (fd->lock)
> +		spin_lock_irqsave(fd->lock, flags);
> +	else
> +		__acquire(fd->lock);
> +
> +	val_low = clk_fd_v2_readl(fd, fd->reg);
> +	val_high = clk_fd_v2_readl(fd, fd->high_reg);
> +
> +	if (fd->lock)
> +		spin_unlock_irqrestore(fd->lock, flags);
> +	else
> +		__release(fd->lock);
> +
> +	m_low = (val_low & fd->mmask) >> fd->mshift;
> +	n_low = (val_low & fd->nmask) >> fd->nshift;
> +	m_high = (val_high & fd->high_mmask) >> fd->high_mshift;
> +	n_high = (val_high & fd->high_nmask) >> fd->high_nshift;
> +	m = (m_high << 16) | m_low;
> +	n = (n_high << 16) | n_low;
> +
> +	if (fd->flags & CLK_FRAC_DIVIDER_ZERO_BASED) {
> +		m++;
> +		n++;
> +	}
> +
> +	if (!n || !m)
> +		return parent_rate;
> +
> +	ret = (u64)parent_rate * m;
> +	do_div(ret, n);
> +
> +	return ret;
> +}
> +
> +static void clk_fractional_divider_general_approximation_v2(struct clk_hw *hw,
> +							    unsigned long rate,
> +							    unsigned long *parent_rate,
> +							    unsigned long *m, unsigned long *n)
> +{
> +	struct clk_fractional_divider_v2 *fd = to_clk_fd_v2(hw);
> +	unsigned long scale;
> +
> +	/*
> +	 * Get rate closer to *parent_rate to guarantee there is no overflow
> +	 * for m and n. In the result it will be the nearest rate left shifted
> +	 * by (scale - fd->nwidth) bits.
> +	 *
> +	 * For the detailed explanation see the top comment in this file.
> +	 */
> +	scale = fls_long(*parent_rate / rate - 1);
> +	if (scale > fd->nwidth)
> +		rate <<= scale - fd->nwidth;
> +
> +	rational_best_approximation(rate, *parent_rate,
> +				    GENMASK(fd->mwidth - 1, 0),
> +				    GENMASK(fd->nwidth - 1, 0),
> +				    m, n);
> +}
> +
> +static int clk_fd_v2_get_divider(struct clk_hw *hw, unsigned long rate,
> +				 unsigned long parent_rate,
> +				 unsigned long *m, unsigned long *n)
> +{
> +	struct clk_fractional_divider_v2 *fd = to_clk_fd_v2(hw);
> +	u32 factor;
> +
> +	rational_best_approximation(rate, parent_rate,
> +				    GENMASK(fd->mwidth - 1, 0),
> +				    GENMASK(fd->nwidth - 1, 0),
> +				    m, n);
> +
> +	if (fd->flags & CLK_FRAC_DIVIDER_ZERO_BASED) {
> +		(*m)--;
> +		(*n)--;
> +	}
> +	/*
> +	 * When compensation the fractional divider,
> +	 * the [1:0] bits of the numerator register are omitted,
> +	 * which will lead to a large deviation in the result.
> +	 * Therefore, it is required that the numerator must
> +	 * be at least 4.
> +	 *
> +	 * Note that there are some exceptions here:
> +	 * If there is an even frac div, we need to keep the original
> +	 * numerator(<4) and denominator. Otherwise, it may cause the
> +	 * issue that the duty ratio is not 50%.
> +	 */
> +	if (*m < 4 && *m != 0) {
> +		if (*n % 2 == 0)
> +			factor = 1;
> +		else
> +			factor = DIV_ROUND_UP(4, *m);
> +
> +		if (*m > GENMASK(fd->mwidth - 1, 0) / factor ||
> +		    *n > GENMASK(fd->nwidth - 1, 0) / factor)
> +			return -EINVAL;
> +
> +		*n *= factor;
> +		*m *= factor;
> +	}
> +
> +	return 0;
> +}
> +
> +static int clk_fd_v2_determine_rate(struct clk_hw *hw,
> +				    struct clk_rate_request *req)
> +{
> +	struct clk_fractional_divider_v2 *fd = to_clk_fd_v2(hw);
> +	unsigned long m, n;
> +	u64 ret;
> +
> +	if (!req->rate || req->rate >= req->best_parent_rate) {
> +		req->rate = req->best_parent_rate;
> +		return 0;
> +	}
> +
> +	if (fd->approximation)
> +		fd->approximation(hw, req->rate, &req->best_parent_rate, &m, &n);
> +	else
> +		clk_fractional_divider_general_approximation_v2(hw, req->rate,
> +								&req->best_parent_rate,
> +								&m, &n);
> +
> +	ret = (u64)req->best_parent_rate * m;
> +	do_div(ret, n);
> +	req->rate = ret;
> +
> +	/* Validate the rounded rate that set_rate() will receive. */
> +	return clk_fd_v2_get_divider(hw, req->rate, req->best_parent_rate, &m, &n);
> +}
> +
> +static int clk_fd_v2_set_rate(struct clk_hw *hw, unsigned long rate,
> +			      unsigned long parent_rate)
> +{
> +	struct clk_fractional_divider_v2 *fd = to_clk_fd_v2(hw);
> +	unsigned long flags = 0;
> +	unsigned long m, n, m_low, n_low, m_high, n_high;
> +	u32 val, val_high;
> +	int ret;
> +
> +	ret = clk_fd_v2_get_divider(hw, rate, parent_rate, &m, &n);
> +	if (ret)
> +		return ret;
> +
> +	if (fd->lock)
> +		spin_lock_irqsave(fd->lock, flags);
> +	else
> +		__acquire(fd->lock);
> +
> +	m_low = m & fd->nmask;
> +	n_low = n & fd->nmask;
> +	m_high = (m & GENMASK(fd->mwidth - 1, (fd->mwidth - fd->high_mwidth))) >>
> +		 (fd->mwidth - fd->high_mwidth);
> +	n_high = (n & GENMASK(fd->nwidth - 1, (fd->nwidth - fd->high_nwidth))) >>
> +		 (fd->nwidth - fd->high_nwidth);
> +
> +	val_high = clk_fd_v2_readl(fd, fd->high_reg);
> +	val_high &= ~(fd->high_mmask | fd->high_nmask);
> +	val_high |= (m_high << fd->high_mshift) | (n_high << fd->high_nshift);
> +
> +	clk_fd_v2_writel(fd, fd->high_reg, val_high);
> +
> +	val = clk_fd_v2_readl(fd, fd->reg);
> +	val &= ~(fd->mmask | fd->nmask);
> +	val |= (m_low << fd->mshift) | (n_low << fd->nshift);
> +	clk_fd_v2_writel(fd, fd->reg, val);
> +
> +	if (fd->lock)
> +		spin_unlock_irqrestore(fd->lock, flags);
> +	else
> +		__release(fd->lock);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops clk_fractional_divider_ops_v2 = {
> +	.recalc_rate = clk_fd_v2_recalc_rate,
> +	.determine_rate = clk_fd_v2_determine_rate,
> +	.set_rate = clk_fd_v2_set_rate,
> +};
> +
> +static struct clk_hw *clk_hw_register_fractional_divider_v2(struct device *dev,
> +							    const char *name,
> +							    const char *parent_name,
> +							    unsigned long flags,
> +							    void __iomem *reg,
> +							    u8 mshift, u8 mwidth,
> +							    u8 nshift, u8 nwidth,
> +							    void __iomem *high_reg,
> +							    u8 high_mshift, u8 high_mwidth,
> +							    u8 high_nshift, u8 high_nwidth,
> +							    u8 clk_divider_flags,
> +							    spinlock_t *lock)
> +{
> +	struct clk_fractional_divider_v2 *fd;
> +	struct clk_init_data init;
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	fd = kzalloc_obj(*fd);
> +	if (!fd)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name = name;
> +	init.ops = &clk_fractional_divider_ops_v2;
> +	init.flags = flags;
> +	init.parent_names = parent_name ? &parent_name : NULL;
> +	init.num_parents = parent_name ? 1 : 0;
> +
> +	fd->reg = reg;
> +	fd->mshift = mshift;
> +	fd->mwidth = mwidth + high_mwidth;
> +	fd->mmask = GENMASK(mwidth - 1, 0) << mshift;
> +	fd->nshift = nshift;
> +	fd->nwidth = nwidth + high_nwidth;
> +	fd->nmask = GENMASK(nwidth - 1, 0) << nshift;
> +	fd->high_reg = high_reg;
> +	fd->high_mshift = high_mshift;
> +	fd->high_mwidth = high_mwidth;
> +	fd->high_mmask = GENMASK(high_mwidth - 1, 0) << high_mshift;
> +	fd->high_nshift = high_nshift;
> +	fd->high_nwidth = high_nwidth;
> +	fd->high_nmask = GENMASK(high_nwidth - 1, 0) << high_nshift;
> +	fd->flags = clk_divider_flags;
> +	fd->lock = lock;
> +	fd->hw.init = &init;
> +
> +	hw = &fd->hw;
> +	ret = clk_hw_register(dev, hw);
> +	if (ret) {
> +		kfree(fd);
> +		hw = ERR_PTR(ret);
> +	}
> +
> +	return hw;
> +}
> +
> +struct clk *rockchip_clk_register_frac_v2(struct device *dev,
> +					  const char *name,
> +					  const char *parent_name,
> +					  unsigned long flags,
> +					  void __iomem *reg,
> +					  u8 mshift, u8 width,
> +					  void __iomem *high_reg,
> +					  u8 high_mshift, u8 high_width,
> +					  u8 clk_divider_flags,
> +					  spinlock_t *lock)
> +{
> +	struct clk_hw *hw;
> +
> +	hw = clk_hw_register_fractional_divider_v2(dev, name, parent_name, flags,
> +						   reg, mshift, width, 0, width,
> +						   high_reg, high_mshift, high_width,
> +						   0, high_width,
> +						   clk_divider_flags,
> +						   lock);
> +	if (IS_ERR(hw))
> +		return ERR_CAST(hw);
> +	return hw->clk;
> +}
> diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> index ee8c79b938d3c..0646a2e6af0a8 100644
> --- a/drivers/clk/rockchip/clk.c
> +++ b/drivers/clk/rockchip/clk.c
> @@ -589,6 +589,16 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
>   				list->gate_flags, flags, list->child,
>   				&ctx->lock);
>   			break;
> +		case branch_fraction_divider_v2:
> +			clk = rockchip_clk_register_frac_v2(NULL, list->name,
> +							    list->parent_names[0], flags,
> +							    ctx->reg_base + list->muxdiv_offset,
> +							    list->mux_shift, list->mux_width,
> +							    ctx->reg_base + list->div_offset,
> +							    list->div_shift, list->div_width,
> +							    list->div_flags,
> +							    &ctx->lock);
> +			break;
>   		case branch_half_divider:
>   			clk = rockchip_clk_register_halfdiv(list->name,
>   				list->parent_names, list->num_parents,
> diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
> index 72b36bba31523..dce4db3f67b04 100644
> --- a/drivers/clk/rockchip/clk.h
> +++ b/drivers/clk/rockchip/clk.h
> @@ -781,6 +781,13 @@ struct clk *rockchip_clk_register_ddrclk(const char *name, int flags,
>   					 int ddr_flags, void __iomem *reg_base,
>   					 spinlock_t *lock);
>   
> +struct clk *rockchip_clk_register_frac_v2(struct device *dev,
> +					  const char *name, const char *parent_name,
> +					  unsigned long flags, void __iomem *reg,
> +					  u8 mshift, u8 width,
> +					  void __iomem *high_reg, u8 high_mshift, u8 high_width,
> +					  u8 clk_divider_flags, spinlock_t *lock);
> +
>   #define ROCKCHIP_INVERTER_HIWORD_MASK	BIT(0)
>   
>   struct clk *rockchip_clk_register_inverter(const char *name,
> @@ -806,6 +813,7 @@ enum rockchip_clk_branch_type {
>   	branch_grf_mux,
>   	branch_divider,
>   	branch_fraction_divider,
> +	branch_fraction_divider_v2,
>   	branch_gate,
>   	branch_grf_gate,
>   	branch_linked_gate,
> @@ -1014,6 +1022,23 @@ struct rockchip_clk_branch {
>   		.child		= ch,				\
>   	}
>   
> +#define COMPOSITE_FRAC_V2(_id, cname, pname, f, mo, ms, mw, do, ds, dw, df)\
> +	{							\
> +		.id		= _id,				\
> +		.branch_type	= branch_fraction_divider_v2,	\
> +		.name		= cname,			\
> +		.parent_names	= (const char *[]){ pname },	\
> +		.num_parents	= 1,				\
> +		.flags		= f,				\
> +		.muxdiv_offset	= mo,				\
> +		.mux_shift	= ms,				\
> +		.mux_width	= mw,				\
> +		.div_offset	= do,				\
> +		.div_shift	= ds,				\
> +		.div_width	= dw,				\
> +		.div_flags	= df,				\
> +	}
> +
>   #define COMPOSITE_FRACMUX_NOGATE(_id, cname, pname, f, mo, df, ch) \
>   	{							\
>   		.id		= _id,				\
> 


