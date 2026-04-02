Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C92BD3940B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCAYnrozxEjVyydqMIlUful1bjJGTiFmh3IjjKa1k6I=; b=QiML/j73NDaWfaH/ZAiVwQrxUZ
	WZBU68MnWwkE7HB6QAgiK3aTWj9SUDj2kRN8ZA0TUAL+nktf2EVInfdvwUnXY+d6mzg4C588MxFFh
	MEScoRlXSDbbwJGkIH+hTYm2lWzX7Qa+eSlVMk0S+QGXjsv3uDLt6lzOJxlasKll3iNT1a2Kl6cgK
	xYAVZVdQFfwTMJZcTRvPePdvix2K+SyLDDgZd+IwORSQewMYufIAht39rxIO0osLbAjqWJMKGLEfu
	/qIGmJ+emxIhOHRgtcsXeLD+9Ach54np7HMjbeC0es61On3MEQ1ssZXXxNrckMqz9pKGCUg4ihhIA
	mQsRlKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ew5-0000000HLL7-0xiu;
	Thu, 02 Apr 2026 10:06:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ew2-0000000HLIo-3fIU;
	Thu, 02 Apr 2026 10:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775124355;
	bh=D4kfl7vQPG5i2TDOvaJ3hANWJtrLLrfKi0I6ESNoUBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRHJM3auCioWf+U0lXNf1DZ9gI4HLqoLnXqJQpjK6TuZsG9eGFNv66ISHZTp2Fsf9
	 4+KQuuqnFfDlcwxSRhSX9dCkDB05hBwx3nPMGi7F0x1EFo1spXfrGcB/J5NQCl/nh3
	 ag9YWUXhz1aubhJ/gq27GHnYIVutjnU6rioAydOUSPF8+8HLcbzc+n9G7OB/a34IHm
	 sWAE+DffuBhhDmc7g1NV38A/CoWRxmoWbg7sdMGLOiGQjDjcmE4sLuevU4vfqgTCNU
	 F8wZT8Mct0gVg9s3Uy8Forr2bfWqRAziqSbeVIDa6a8SdQTVY7t28t7DtfnbqBQ0LN
	 qUi7hMlU4TDhg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:54e2:77ca:8340:99bd])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19DCC17E76A5;
	Thu,  2 Apr 2026 12:05:54 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: jason-jh.lin@mediatek.com
Cc: Guangjie.Song@mediatek.com,
	Nancy.Lin@mediatek.com,
	Paul-pl.Chen@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Singo.Chang@mediatek.com,
	Sirius.Wang@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
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
	sboyd@kernel.org,
	wenst@chromium.org
Subject: Re: [PATCH v5 23/27] clk: mediatek: Add MT8196 disp-ao clock support
Date: Thu,  2 Apr 2026 12:05:38 +0200
Message-Id: <20260402100538.27291-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <2d418383ff2d6ff40ffb3b4f8e2b0c0e665c3b58.camel@mediatek.com>
References: <2d418383ff2d6ff40ffb3b4f8e2b0c0e665c3b58.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_030559_068527_396530EC 
X-CRM114-Status: GOOD (  23.58  )
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

Hi Jason-JH,

On 4/2/26 08:30, Jason-JH Lin (林睿祥) wrote:
> On Fri, 2025-08-29 at 11:19 +0200, Laura Nao wrote:
>> Add support for the MT8196 disp-ao clock controller, which provides
>> clock gate control for the display system. It is integrated with the
>> mtk-mmsys driver, which registers the disp-ao clock driver via
>> platform_device_register_data().
>>
>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> Reviewed-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>  drivers/clk/mediatek/Makefile              |  2 +-
>>  drivers/clk/mediatek/clk-mt8196-vdisp_ao.c | 80
>> ++++++++++++++++++++++
>>  2 files changed, 81 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
>>
>> diff --git a/drivers/clk/mediatek/Makefile
>> b/drivers/clk/mediatek/Makefile
>> index fe5699411d8b..5b8969ff1985 100644
>> --- a/drivers/clk/mediatek/Makefile
>> +++ b/drivers/clk/mediatek/Makefile
>> @@ -157,7 +157,7 @@ obj-$(CONFIG_COMMON_CLK_MT8196_IMP_IIC_WRAP) +=
>> clk-mt8196-imp_iic_wrap.o
>>  obj-$(CONFIG_COMMON_CLK_MT8196_MCUSYS) += clk-mt8196-mcu.o
>>  obj-$(CONFIG_COMMON_CLK_MT8196_MDPSYS) += clk-mt8196-mdpsys.o
>>  obj-$(CONFIG_COMMON_CLK_MT8196_MFGCFG) += clk-mt8196-mfg.o
>> -obj-$(CONFIG_COMMON_CLK_MT8196_MMSYS) += clk-mt8196-disp0.o clk-
>> mt8196-disp1.o
>> +obj-$(CONFIG_COMMON_CLK_MT8196_MMSYS) += clk-mt8196-disp0.o clk-
>> mt8196-disp1.o clk-mt8196-vdisp_ao.o
>>  obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) += clk-mt8196-pextp.o
>>  obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) += clk-mt8196-ufs_ao.o
>>  obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-
>> mt8365.o
>> diff --git a/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
>> b/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
>> new file mode 100644
>> index 000000000000..fddb69d1c3eb
>> --- /dev/null
>> +++ b/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
>> @@ -0,0 +1,80 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2025 MediaTek Inc.
>> + *                    Guangjie Song <guangjie.song@mediatek.com>
>> + * Copyright (c) 2025 Collabora Ltd.
>> + *                    Laura Nao <laura.nao@collabora.com>
>> + */
>> +#include <dt-bindings/clock/mediatek,mt8196-clock.h>
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "clk-gate.h"
>> +#include "clk-mtk.h"
>> +
>> +static const struct mtk_gate_regs mm_v_cg_regs = {
>> +	.set_ofs = 0x104,
>> +	.clr_ofs = 0x108,
>> +	.sta_ofs = 0x100,
>> +};
>> +
>> +static const struct mtk_gate_regs mm_v_hwv_regs = {
>> +	.set_ofs = 0x0030,
>> +	.clr_ofs = 0x0034,
>> +	.sta_ofs = 0x2c18,
>> +};
>> +
>> +#define GATE_MM_AO_V(_id, _name, _parent, _shift) {	\
>> +		.id = _id,				\
>> +		.name = _name,				\
>> +		.parent_name = _parent,			\
>> +		.regs = &mm_v_cg_regs,			\
>> +		.shift = _shift,			\
>> +		.ops = &mtk_clk_gate_ops_setclr,	\
>> +		.flags = CLK_OPS_PARENT_ENABLE |	\
>> +			 CLK_IS_CRITICAL,		\
>> +	}
>> +
>> +#define GATE_HWV_MM_V(_id, _name, _parent, _shift) {	\
>> +		.id = _id,				\
>> +		.name = _name,				\
>> +		.parent_name = _parent,			\
>> +		.regs = &mm_v_cg_regs,			\
>> +		.hwv_regs = &mm_v_hwv_regs,		\
>> +		.shift = _shift,			\
>> +		.ops = &mtk_clk_gate_hwv_ops_setclr,	\
>> +		.flags = CLK_OPS_PARENT_ENABLE,		\
>> +	}
>> +
>> +static const struct mtk_gate mm_v_clks[] = {
>> +	GATE_HWV_MM_V(CLK_MM_V_DISP_VDISP_AO_CONFIG,
>> "mm_v_disp_vdisp_ao_config", "disp", 0),
>> +	GATE_HWV_MM_V(CLK_MM_V_DISP_DPC, "mm_v_disp_dpc", "disp",
>> 16),
>> +	GATE_MM_AO_V(CLK_MM_V_SMI_SUB_SOMM0, "mm_v_smi_sub_somm0",
>> "disp", 2),
>> +};
>> +
>> +static const struct mtk_clk_desc mm_v_mcd = {
>> +	.clks = mm_v_clks,
>> +	.num_clks = ARRAY_SIZE(mm_v_clks),
>> +};
>> +
>> +static const struct of_device_id of_match_clk_mt8196_vdisp_ao[] = {
>> +	{ .compatible = "mediatek,mt8196-vdisp-ao", .data =
>> &mm_v_mcd },
>
> Hi Laura,
>
> We are going to send mtk-mmsys driver for MT8196 recently, but we found
> the compatible name is used here.
>
> As your commit message, vdisp-ao is integrated with the mtk-mmsys
> driver, which registers the vdisp-ao clock driver via 
> platform_device_register_data().
>
> Shouldn't this compatible name belong to mmsys driver for MT8196?
>

That's right, my fault for missing that! Thanks for the heads up.

I'm aware Angelo is currently restructuring mediatek-drm (including 
mmsys and mutex), and that might affect the way vdisp-ao is loaded too. 
So I'm not sure whether it makes sense to send a patch to fix this 
right away.

Best,

Laura


