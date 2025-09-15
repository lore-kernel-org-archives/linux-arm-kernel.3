Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE0ACAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LuFJVSHeAQHDn0+XSdf5A7eQdiJjAJ7onpQpF2BurQ=; b=1tz92OSE8OgkDz/WaUyP6NNPMW
	nX4E6/fEbsAZSz+YCjRSY+ZDEqpzllDko+HPCCiVrim1u2OUDU5Ceg53R82rW8KMvmSCRGvhkUPZy
	E5wmIA+hTKmR4BFAxOq+Apc9SnarcYn35wT1LFlwUe7K62Aw6p1Aw8DQc4ETV2JrtVxy9R+tcckuH
	u7ZFwdA6RqX8U40EmOh9lLxRePNYivdyeAh9cQByUUJc+q7O2IyNALA3h92sIgHtzIBi58/OQCrRs
	ttqgdz0wonwjzNXuexexQNE+o0jxw0LlVBdpr0x6KA1WgofXbUgUSJZH2yf4G9S5sIFIyo0GPBlgL
	vfMnGTXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy53x-00000003LFe-1O2z;
	Mon, 15 Sep 2025 08:59:53 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy53v-00000003LFJ-1Izq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:59:52 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3e8ef75b146so965873f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757926789; x=1758531589; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6LuFJVSHeAQHDn0+XSdf5A7eQdiJjAJ7onpQpF2BurQ=;
        b=Lc+s3r5IDhV4tlUOiYCLvjyBenNs2eEaVPPb7yvw4i0SJXdHnRbwCUx9ssM/0HxPGK
         uPf8v5tSl9u5LPZ/+uJpu/KrAktHXvQtQ0eXCQlt3dEhFipSZ3Y7grwdOpQMnH6oPTiF
         NprWE6+vsEgANQEEyE+p1X05akfZe9FNcGjsy5yoNGnqrWIdkiKghkGn1fccdn2CE//9
         9LWFqQqRi7fow+AgPYgX/UQwvloF2Lv+nFDcEDS7rNWfqD+GbNJor4mCjKzyVnQbxcNp
         KjGGZplhFAzdRdxoajWBjjNgk42eLmfit+opl/ixMHsrE63KCAzIXyDIOLoZW+Ox1yhW
         FSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757926789; x=1758531589;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6LuFJVSHeAQHDn0+XSdf5A7eQdiJjAJ7onpQpF2BurQ=;
        b=KjQrp7K7AJbkrbOyZRVlzPYmRzUb6wriNpO5gcGxBULZ3Pd3yvNWz41u3Jg7rpGw5h
         IldoJGtXrqF7NfFnCv+yJRD1aylF3078JwqMF2khjey7w/z6DzMr5nhvj4PCY78ePKGV
         okHdvsJ2eC+N9x1P9E18lr6uD/qIqJRnsMuoH0pNfn11TxgdZCdKm3EUWbW/N2hFk35B
         ikpse6Y5yhscsTt5FmlC9MN8X3S12rV3y4v1fAs1/RYhQfizckUsFvVTJc5jrY5CoJDL
         UOo7YrbMrFC9QiX4E4djLPj5jtsa9tNN3K+lR2zjVexZgcz7VdnsoYHZAbwV0Crol0ZT
         m1gA==
X-Forwarded-Encrypted: i=1; AJvYcCUXik7Z91DJwQ2Q9SnSvZm9xmoSA+WoBxd4VyfVytVA35zsSQCMTx5DPyTbrKiISn5iwYTimvep9u3qtpl1NYfT@lists.infradead.org
X-Gm-Message-State: AOJu0YyDYUeeDH9tcL9/0XkmqxEXBIM1xSjlBLt8Snhbgbc0EkSOi71C
	JR6PrjGe9pv45WTU6xCJq9VHgHSIgZcQGeRoHwThY/fJedxdSjXliWMr
X-Gm-Gg: ASbGncv/kidpwj/94Khb2pWYW6pdnFxr0IYHOUoEKxJ1DVsYETzvIJcNppW7PoQFFWy
	To/Y1dtnn9WFNQ4xziFmtBQZBsFz/G2m68mIARZpux11GweCnkwWEywfcNK1Xb/L2UWZOpEOAWN
	G2cqQBjATs+SO67V4A1pZZ9ggC5pII708+YB/dyBXxMwVbSw+IWYMBOMedpG2jda/o7QO6lT7uC
	OE05FRElGNLL55qbBTM8LgJBzZGfBNYKN06dfMGSTG2mUIyNRxFmXACore6k8HkaD5ww0TdZF+7
	S3KXcTaC2FG+Fxvil/IdZsoUUtXWZp7PuFk3ekuvjXvSkZUSgZrwuCVLUu85ncTR1BpF7JHdxI2
	uj5WXYnK65jkIyEKc1aICjN9+l/iGwIhHLV86W43MpYOGVPAw03U6EIWfoIfIgnZLJPIevPDJkm
	1zDKPKZITtik8=
X-Google-Smtp-Source: AGHT+IHPNlJyMCNv0p6hi8FUDXyC4LeGZ9hyO1d/g54G8GsV8O86kurfDHc3Bpeny255lVmyLx7p/w==
X-Received: by 2002:a05:6000:4021:b0:3b9:148b:e78 with SMTP id ffacd0b85a97d-3e7659f46f8mr9388551f8f.53.1757926789143;
        Mon, 15 Sep 2025 01:59:49 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e86602a7d5sm9370472f8f.62.2025.09.15.01.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 01:59:48 -0700 (PDT)
Message-ID: <d23885a5-6d42-443a-bf19-eb6747e8ec47@gmail.com>
Date: Mon, 15 Sep 2025 11:59:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] clk: samsung: introduce exynos8890 clock driver
Content-Language: en-US
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914122116.2616801-6-ivo.ivanov.ivanov1@gmail.com>
 <20250915074931.GD8224@nxa18884-linux.ap.freescale.net>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250915074931.GD8224@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_015951_407524_BC3AA70E 
X-CRM114-Status: GOOD (  33.16  )
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

On 9/15/25 10:49, Peng Fan wrote:
> On Sun, Sep 14, 2025 at 03:21:16PM +0300, Ivaylo Ivanov wrote:
>> Introduce a clocks management driver for exynos8890, providing clocks
>> for the peripherals of that SoC.
>>
>> As exynos8890 is the first SoC to have HWACG, it differs a bit from the
> Hardware Auto Clock Gating(HWACG), if I understand correctly.
>
>> newer SoCs. Q-channel and Q-state bits are separate registers, unlike
>> the CLK_CON_GAT_* ones that feature HWACG bits in the same register
>> that controls manual gating. Hence, don't use the clk-exynos-arm64
>> helper, but implement logic that enforces manual gating according to
>> how HWACG is implemented here.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>> drivers/clk/samsung/Makefile         |    1 +
>> drivers/clk/samsung/clk-exynos8890.c | 8695 ++++++++++++++++++++++++++
>> 2 files changed, 8696 insertions(+)
>> create mode 100644 drivers/clk/samsung/clk-exynos8890.c
>>
>> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
>> index b77fe288e..982dc7c64 100644
>> --- a/drivers/clk/samsung/Makefile
>> +++ b/drivers/clk/samsung/Makefile
>> @@ -22,6 +22,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7870.o
>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7885.o
>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
>> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos8890.o
>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos8895.o
>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos990.o
>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
>> diff --git a/drivers/clk/samsung/clk-exynos8890.c b/drivers/clk/samsung/clk-exynos8890.c
>> new file mode 100644
>> index 000000000..670587bae
>> --- /dev/null
>> +++ b/drivers/clk/samsung/clk-exynos8890.c
>> @@ -0,0 +1,8695 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> + * Author: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> + *
>> + * Common Clock Framework support for Exynos8890 SoC.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include <dt-bindings/clock/samsung,exynos8890-cmu.h>
>> +
>> +#include "clk.h"
>> +
>> +/* NOTE: Must be equal to the last clock ID increased by one */
>> +#define TOP_NR_CLK	(CLK_GOUT_TOP_SCLK_PROMISE_DISP + 1)
>> +#define PERIS_NR_CLK	(CLK_GOUT_PERIS_SCLK_PROMISE_PERIS + 1)
>> +#define APOLLO_NR_CLK	(CLK_GOUT_APOLLO_SCLK_PROMISE_APOLLO + 1)
>> +#define AUD_NR_CLK	(CLK_GOUT_AUD_SCLK_I2S_BCLK + 1)
>> +#define BUS0_NR_CLK	(CLK_GOUT_BUS0_ACLK_TREX_P_BUS0 + 1)
>> +#define BUS1_NR_CLK	(CLK_GOUT_BUS1_ACLK_TREX_P_BUS1 + 1)
>> +#define CCORE_NR_CLK	(CLK_GOUT_CCORE_SCLK_PROMISE + 1)
>> +#define DISP0_NR_CLK	(CLK_GOUT_DISP0_OSCCLK_DP_I_CLK_24M + 1)
>> +#define DISP1_NR_CLK	(CLK_GOUT_DISP1_SCLK_PROMISE_DISP1 + 1)
>> +#define FSYS0_NR_CLK	(CLK_GOUT_FSYS0_SCLK_USBHOST20_REF_CLK + 1)
>> +#define FSYS1_NR_CLK	(CLK_GOUT_FSYS1_SCLK_PROMISE_FSYS1 + 1)
>> +#define G3D_NR_CLK	(CLK_GOUT_G3D_SCLK_ASYNCAXI_G3D + 1)
>> +#define MIF0_NR_CLK	(CLK_GOUT_MIF0_RCLK_DREX + 1)
>> +#define MIF1_NR_CLK	(CLK_GOUT_MIF1_RCLK_DREX + 1)
>> +#define MIF2_NR_CLK	(CLK_GOUT_MIF2_RCLK_DREX + 1)
>> +#define MIF3_NR_CLK	(CLK_GOUT_MIF3_RCLK_DREX + 1)
>> +#define MNGS_NR_CLK	(CLK_GOUT_MNGS_SCLK_PROMISE0_MNGS + 1)
>> +#define PERIC0_NR_CLK	(CLK_GOUT_PERIC0_SCLK_PWM + 1)
>> +#define PERIC1_NR_CLK	(CLK_GOUT_PERIC1_SCLK_UART5 + 1)
>> +
>> +/*
>> + * As exynos8890 first introduced hwacg, cmu registers are mapped similarly
>> + * to exynos7, with the exception of the new q-state and q-ch registers that
>> + * can set the behavior of automatic gates.
>> + */
>> +
>> +/* decoded magic number from downstream */
>> +#define QCH_EN_MASK		BIT(0)
>> +#define QCH_MASK		(GENMASK(19, 16) | BIT(12))
>> +#define QCH_DIS			(QCH_MASK | FIELD_PREP(QCH_EN_MASK, 0))
> Nit: align code.

Aligned in my editor, patch files offset each line with a single symbol
so formatting gets broken...

>
>> +
>> +/* q-channel registers offsets range */
>> +#define QCH_OFF_START		0x2000
>> +#define QCH_OFF_END		0x23ff
>> +
>> +/* q-state registers offsets range */
>> +#define QSTATE_OFF_START	0x2400
>> +#define QSTATE_OFF_END		0x2fff
> Nit: Align.

What?

>
>> +
>> +/* check if the register offset is a QCH register */
>> +static bool is_qch_reg(unsigned long off)
>> +{
>> +	return off >= QCH_OFF_START && off <= QCH_OFF_END;
>> +}
>> +
>> +/* check if the register offset is a QSTATE register */
>> +static bool is_qstate_reg(unsigned long off)
>> +{
>> +	return off >= QSTATE_OFF_START && off <= QSTATE_OFF_END;
>> +}
>> +
>> +static void __init exynos8890_init_clocks(struct device_node *np,
>> +					  const struct samsung_cmu_info *cmu)
>> +{
>> +	const unsigned long *reg_offs = cmu->clk_regs;
>> +	size_t reg_offs_len = cmu->nr_clk_regs;
>> +	void __iomem *reg_base;
>> +	size_t i;
>> +
>> +	reg_base = of_iomap(np, 0);
>> +	if (!reg_base)
>> +		panic("%s: failed to map registers\n", __func__);
>> +
>> +	for (i = 0; i < reg_offs_len; ++i) {
>> +		void __iomem *reg = reg_base + reg_offs[i];
>> +		u32 val;
>> +
>> +		if (is_qch_reg(reg_offs[i])) {
>> +			val = QCH_DIS;
>> +			writel(val, reg);
>> +		} else if (is_qstate_reg(reg_offs[i])) {
>> +			val = 0;
>> +			writel(val, reg);
>> +		}
> This seems to disable qchannel and set qstate to 0 for disable HWACG.
> If this is true, a comment is preferred.

I believe the "DIS" part is pretty self explanatory, no?

>
>> +	}
>> +
>> +	iounmap(reg_base);
>> +}
>> +
>> +/* ---- CMU_TOP ------------------------------------------------------------- */
>> +
>> +#define MIF_CLK_CTRL1						0x1084
>> +#define MIF_CLK_CTRL2						0x1088
>> +#define MIF_CLK_CTRL3						0x108C
>> +#define MIF_CLK_CTRL4						0x1090
>> +#define ACD_PSCDC_CTRL_0					0x1094
>> +#define ACD_PSCDC_CTRL_1					0x1098
>> +#define ACD_PSCDC_STAT						0x109C
>> +#define CMU_TOP_SPARE0						0x1100
>> +#define CMU_TOP_SPARE1						0x1104
>> +#define CMU_TOP_SPARE2						0x1108
>> +#define CMU_TOP_SPARE3						0x110C
> Some of the registers not aligned.

How are they not, they're aligned both in editors and the patch. Please elaborate.

>
>> +
> [...]
>> +static void __init exynos8890_cmu_top_init(struct device_node *np)
>> +{
>> +	exynos8890_init_clocks(np, &top_cmu_info);
>> +	samsung_cmu_register_one(np, &top_cmu_info);
>> +}
>> +
>> +/* Register CMU_TOP early, as it's a dependency for other early domains */
>> +CLK_OF_DECLARE(exynos8890_cmu_top, "samsung,exynos8890-cmu-top",
>> +	       exynos8890_cmu_top_init);
> Not sure you need to run Android GKI, without module built, this platform
> will not able to support GKI.
>
> It would be better to update to use platform drivers.

Same as what Krzysztof said, design choice accross all samsung clock drivers.

>
>> +
>> +/* ---- CMU_PERIS ---------------------------------------------------------- */
>> +
>> +#define QSTATE_CTRL_TMU				0x2474
>> +#define QSTATE_CTRL_CHIPID			0x2484
>> +#define QSTATE_CTRL_PROMISE_PERIS		0x2488
> Not aligned.
>
>> +
>> +
>> +/* Register CMU_PERIS early, as it's needed for MCT timer */
>> +CLK_OF_DECLARE(exynos8890_cmu_peris, "samsung,exynos8890-cmu-peris",
>> +	       exynos8890_cmu_peris_init);
> Same as above.
>
>> +
>> +/* ---- CMU_APOLLO --------------------------------------------------------- */
>> +
>> +/* Register Offset definitions for CMU_APOLLO (0x11900000) */
>> +#define APOLLO_PLL_LOCK				0x0000
>> +#define APOLLO_PLL_CON0				0x0100
>> +#define APOLLO_PLL_CON1				0x0104
>> +#define APOLLO_PLL_FREQ_DET			0x010C
> Not align.

Same as the other comments about alignment.

Best regards,
Ivaylo

>
> Regards
> Peng
>


