Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC882C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuVoFejhxM95nM1HRdpviYFNS/8m6g5/ZQZd1+0nLDc=; b=c22Zlva/zCv+7LU9u/sqtjRdol
	iTeQd64VbXcLZUtiNfDWd/aO5ILfOM241i2cAz0qFVBtcV8Sg5twI8tPalP4fOA9LB0r/YLBFeB6O
	0dQMg2sHkfcM4s+93R5o7MsDJ9ohjk+hCkFmz/7xgJWH3AqcNkMmmF7+QH2qcStp3qvKKwAJWrC71
	gj9QQdtqBoD4w8Q/cvOPwMN0tt5+2jmInM9rIYvecOLCmpDLW5Rf2vpuOu0dL1PxtwENx7/nR7+ZV
	jWzIvG89j+9QbbN0853sS7xPlVYw65ApSLQ/TQgL4oBI0vcoJlrfpeyHLhQf79ZJgjdIPKpq4jTe6
	KyHrG3BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAmE-00000002DyJ-1aLm;
	Tue, 22 Jul 2025 11:03:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAc6-00000002CRS-2ixd;
	Tue, 22 Jul 2025 10:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753181568;
	bh=dGCgiF63wh9ujAd3rXkaVlG91f8mb9WyF1hcxbsejLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OfW2ttUl+lir7OfWoJSI1AKVyrcbkofseiyAupBPX6BLa9Kgb2EjIERn7FcRu8ylc
	 w7Mie5adgmV5Xb9WMRElfoP2cN9zvqc9K1OUiHI/GbhN6zf/4LqlNklCkXyAov+gqq
	 5rcgqo1detU+150S+X4gq5mCTuLPEfvnhDyEGZE5L8+YvLOfHC23v+ZcAckpGy9HvJ
	 S9eePqrTHegUaLOa6XhI6hHmciCTAA6UmGDHo0j8PMmLyv9SYSLeFczJEnUyriPMyM
	 uyu//SzbUwIjulxRVFOCevgq0x3qrVUlOGaCD4bXOsS+tmDx+uwFIsUb2pgzR2P2wN
	 S8opaZ2AXsI2Q==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:bd9c:eae9:88b0:783c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C1DFB17E0D15;
	Tue, 22 Jul 2025 12:52:47 +0200 (CEST)
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
	p.zabel@pengutronix.de,
	richardcochran@gmail.com,
	robh@kernel.org,
	sboyd@kernel.org
Subject: Re: [PATCH v2 14/29] clk: mediatek: Add MT8196 vlpckgen clock support 
Date: Tue, 22 Jul 2025 12:52:03 +0200
Message-Id: <20250722105203.33151-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAGXv+5ErtDLNf3u5OdHrEBdrA-2bPA5wy32S+Bqd1c_1Z9u1pA@mail.gmail.com>
References: <CAGXv+5ErtDLNf3u5OdHrEBdrA-2bPA5wy32S+Bqd1c_1Z9u1pA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_035250_841006_FDD6C4CC 
X-CRM114-Status: GOOD (  26.42  )
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

On 7/18/25 10:31, Chen-Yu Tsai wrote:
> On Tue, Jul 15, 2025 at 3:28 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> Hi,
>>
>>
>> On Tue, Jun 24, 2025 at 10:33 PM Laura Nao <laura.nao@collabora.com> wrote:
>>>
>>> Add support for the MT8196 vlpckgen clock controller, which provides
>>> muxes and dividers for clock selection in other IP blocks.
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>>> ---
>>>  drivers/clk/mediatek/Makefile              |   2 +-
>>>  drivers/clk/mediatek/clk-mt8196-vlpckgen.c | 769 +++++++++++++++++++++
>>>  2 files changed, 770 insertions(+), 1 deletion(-)
>>>  create mode 100644 drivers/clk/mediatek/clk-mt8196-vlpckgen.c
>>>
>>> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
>>> index 0688d7bf4979..24683dd51783 100644
>>> --- a/drivers/clk/mediatek/Makefile
>>> +++ b/drivers/clk/mediatek/Makefile
>>> @@ -161,7 +161,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
>>>  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) += clk-mt8195-vpp0.o clk-mt8195-vpp1.o
>>>  obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
>>>  obj-$(CONFIG_COMMON_CLK_MT8196) += clk-mt8196-apmixedsys.o clk-mt8196-topckgen.o \
>>> -                                  clk-mt8196-topckgen2.o
>>> +                                  clk-mt8196-topckgen2.o clk-mt8196-vlpckgen.o
>>>  obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
>>>  obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
>>>  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
>>> diff --git a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
>>> new file mode 100644
>>> index 000000000000..23a673dd4c5c
>>> --- /dev/null
>>> +++ b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
>>> @@ -0,0 +1,769 @@
>>
>> [...]
>>
>>> +static const char * const vlp_camtg0_parents[] = {
>>> +       "clk26m",
>>> +       "univpll_192m_d32",
>>> +       "univpll_192m_d16",
>>> +       "clk13m",
>>> +       "osc_d40",
>>> +       "osc_d32",
>>> +       "univpll_192m_d10",
>>> +       "univpll_192m_d8",
>>> +       "univpll_d6_d16",
>>> +       "ulposc3",
>>> +       "osc_d20",
>>> +       "ck2_tvdpll1_d16",
>>> +       "univpll_d6_d8"
>>> +};
>>
>> It seems all the vlp_camtg* parents are the same. Please merge them
>> and just have one list.
>>
>>> +static const char * const vlp_sspm_26m_parents[] = {
>>> +       "clk26m",
>>> +       "osc_d20"
>>> +};
>>> +
>>> +static const char * const vlp_ulposc_sspm_parents[] = {
>>> +       "clk26m",
>>> +       "osc_d2",
>>> +       "mainpll_d4_d2"
>>> +};
>>> +
>>> +static const char * const vlp_vlp_pbus_26m_parents[] = {
>>> +       "clk26m",
>>> +       "osc_d20"
>>> +};
>>> +
>>> +static const char * const vlp_debug_err_flag_parents[] = {
>>> +       "clk26m",
>>> +       "osc_d20"
>>> +};
>>> +
>>> +static const char * const vlp_dpmsrdma_parents[] = {
>>> +       "clk26m",
>>> +       "mainpll_d7_d2"
>>> +};
>>> +
>>> +static const char * const vlp_vlp_pbus_156m_parents[] = {
>>> +       "clk26m",
>>> +       "osc_d2",
>>> +       "mainpll_d7_d2",
>>> +       "mainpll_d7"
>>> +};
>>> +
>>> +static const char * const vlp_spm_parents[] = {
>>> +       "clk26m",
>>> +       "mainpll_d7_d4"
>>> +};
>>> +
>>> +static const char * const vlp_mminfra_parents[] = {
>>> +       "clk26m",
>>> +       "osc_d4",
>>> +       "mainpll_d3"
>>> +};
>>> +
>>> +static const char * const vlp_usb_parents[] = {
>>> +       "clk26m",
>>> +       "mainpll_d9"
>>> +};
>>
>> The previous and the next one are the same.
>>
>>> +static const char * const vlp_usb_xhci_parents[] = {
>>> +       "clk26m",
>>> +       "mainpll_d9"
>>> +};
>>> +
>>> +static const char * const vlp_noc_vlp_parents[] = {
>>> +       "clk26m",
>>> +       "osc_d20",
>>> +       "mainpll_d9"
>>> +};
>>> +
>>> +static const char * const vlp_audio_h_parents[] = {
>>> +       "clk26m",
>>> +       "vlp_apll1",
>>> +       "vlp_apll2"
>>> +};
>>> +
>>> +static const char * const vlp_aud_engen1_parents[] = {
>>> +       "clk26m",
>>> +       "apll1_d8",
>>> +       "apll1_d4"
>>> +};
>>
>> The previous and the next one are the same.
>>
>>> +static const char * const vlp_aud_engen2_parents[] = {
>>> +       "clk26m",
>>> +       "apll2_d8",
>>> +       "apll2_d4"
>>> +};
>>> +
>>> +static const char * const vlp_aud_intbus_parents[] = {
>>> +       "clk26m",
>>> +       "mainpll_d7_d4",
>>> +       "mainpll_d4_d4"
>>> +};
>
> Also, all these audio related clocks (audio_h, aud_engen1, aud_engen2
> aud_intbus) have a "vlp_clk26m" clock as their parent. It should be:
>
>   - clk26m (clk26m from the top ckgen domain)
>   - vlp_clk26m (clk26m from the VLP domain)
>   - (from PLLs)
>   - (from PLLs)
>
> Moreover, an offline discussion with the audio owner suggests that
> of the two 26 MHz clock parents, we really just want the one from
> the VLP domain, as that one is usable even under suspend. This
> could be done by providing an index table.
>

Hi ChenYu,

Thanks for the feedback - I’ll make these changes along with the 
previous suggestions and submit a v3.

Best,

Laura

> ChenYu
>
>>> +
>>> +static const char * const vlp_spvlp_26m
>>
>> [...]
>>
>>> +static int clk_mt8196_vlp_probe(struct platform_device *pdev)
>>> +{
>>> +       struct clk_hw_onecell_data *clk_data;
>>> +       int r;
>>> +       struct device_node *node = pdev->dev.of_node;
>>> +
>>> +       clk_data = mtk_alloc_clk_data(ARRAY_SIZE(vlp_muxes) +
>>> +                                     ARRAY_SIZE(vlp_plls));
>>> +       if (!clk_data)
>>> +               return -ENOMEM;
>>> +
>>> +       r = mtk_clk_register_muxes(&pdev->dev, vlp_muxes, ARRAY_SIZE(vlp_muxes),
>>> +                                  node, &mt8196_clk_vlp_lock, clk_data);
>>> +       if (r)
>>> +               goto free_clk_data;
>>> +
>>> +       r = mtk_clk_register_plls(node, vlp_plls, ARRAY_SIZE(vlp_plls),
>>> +                                 clk_data);
>>> +       if (r)
>>> +               goto unregister_muxes;
>>> +
>>> +       r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>>> +       if (r)
>>> +               goto unregister_plls;
>>> +
>>> +       platform_set_drvdata(pdev, clk_data);
>>> +
>>> +       return r;
>>> +
>>> +unregister_plls:
>>> +       mtk_clk_unregister_plls(vlp_plls, ARRAY_SIZE(vlp_plls), clk_data);
>>> +unregister_muxes:
>>> +       mtk_clk_unregister_muxes(vlp_muxes, ARRAY_SIZE(vlp_muxes), clk_data);
>>> +free_clk_data:
>>> +       mtk_free_clk_data(clk_data);
>>
>> The AFE driver sets some tuner parameters in the VLPCKGEN block at probe
>> time. Maybe we could do that here instead?
>>
>> /* vlp_cksys_clk: 0x1c016000 */
>> #define VLP_APLL1_TUNER_CON0 0x02a4
>> #define VLP_APLL2_TUNER_CON0 0x02a8
>>
>> /* vlp apll1 tuner default value*/
>> #define VLP_APLL1_TUNER_CON0_VALUE 0x6f28bd4d
>> /* vlp apll2 tuner default value + 1*/
>> #define VLP_APLL2_TUNER_CON0_VALUE 0x78fd5265
>>
>>        regmap_write(afe_priv->vlp_ck, VLP_APLL1_TUNER_CON0,
>> VLP_APLL1_TUNER_CON0_VALUE);
>>        regmap_write(afe_priv->vlp_ck, VLP_APLL2_TUNER_CON0,
>> VLP_APLL2_TUNER_CON0_VALUE);
>>
>> ChenYu
>>
>>> +
>>> +       return r;
>>> +}
>>> +
>>> +static void clk_mt8196_vlp_remove(struct platform_device *pdev)
>>> +{
>>> +       struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
>>> +       struct device_node *node = pdev->dev.of_node;
>>> +
>>> +       of_clk_del_provider(node);
>>> +       mtk_clk_unregister_plls(vlp_plls, ARRAY_SIZE(vlp_plls), clk_data);
>>> +       mtk_clk_unregister_muxes(vlp_muxes, ARRAY_SIZE(vlp_muxes), clk_data);
>>> +       mtk_free_clk_data(clk_data);
>>> +}
>>> +
>>> +static const struct of_device_id of_match_clk_mt8196_vlp_ck[] = {
>>> +       { .compatible = "mediatek,mt8196-vlpckgen" },
>>> +       { /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_vlp_ck);
>>> +
>>> +static struct platform_driver clk_mt8196_vlp_drv = {
>>> +       .probe = clk_mt8196_vlp_probe,
>>> +       .remove = clk_mt8196_vlp_remove,
>>> +       .driver = {
>>> +               .name = "clk-mt8196-vlpck",
>>> +               .of_match_table = of_match_clk_mt8196_vlp_ck,
>>> +       },
>>> +};
>>> +
>>> +MODULE_DESCRIPTION("MediaTek MT8196 VLP clock generator driver");
>>> +module_platform_driver(clk_mt8196_vlp_drv);
>>> +MODULE_LICENSE("GPL");
>>> --
>>> 2.39.5
>>>


