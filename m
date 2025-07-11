Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05CEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4v7wK0a8KCs9YIFamsyHyxhM2hljsn9apUJLUJvPZVI=; b=z3pdLQ//Vk86dZ4hLCE7yh/pce
	yS9GcP3Wy21kHUCQGEnZwIhceUY3EPThqyyUO1zNUlcf2eYLBaD60QMAyfdy/UMT4BauakR1OfUy0
	4He4gA3ZEOwCsbOmOQd7/K6zQZkhBjLCKzF0PXS/5XG2+ndr3UP5OO6ASXLQX328sWbdHAsDeiLQ3
	bk+9H3bmnvrC7Dk78y3KHJPTTdxn4E3uItv2jbfXlA/Yraf+/71oksyDbV74Ktz+/lmA2XPGxuZn9
	A2un0/MRJuW19JLsjVmArZjiOmaWAm6hhUQptWMSvnzs+/aim6jPVcNu1MUc2aCUVN3zWih7l73V1
	TCmtQapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9V6-0000000EDcJ-3c8b;
	Fri, 11 Jul 2025 08:53:00 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8kK-0000000E4VV-0Z7J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:04:41 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B7EBfT009407;
	Fri, 11 Jul 2025 10:04:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	4v7wK0a8KCs9YIFamsyHyxhM2hljsn9apUJLUJvPZVI=; b=iQ+vXmg7CV396l61
	8hIaqCMHY1kEgypyaVFQ5YMMytIz3W3vC/1rbedpMuzWZ8ELRyowYK10aBW08NwM
	1vDYPAiHf+f7p6IxRCkSX/CyTlRm1d5bzS9EEvsIMccCrdSwSI233pU/0IQ+O0fX
	ZjlcGmgZj76hr4Yl074Bx/gAQjCUvHFpIe9LCLWgRCfsarDE/2LT3JPeXVhEQvla
	QrBidMnrKFcKXf8qTywabaG5LX5jpW78R4AQWmVMVMjmG/StvX6I1GwKAf5dT3V5
	aNctU9sylw4tgEMkilIyS1wbwxhDM/QfOKQ33BFpziMox2cj/TP4PzSHF8cLmeol
	Xjcgaw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47psfmwvjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 10:04:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0A21840049;
	Fri, 11 Jul 2025 10:03:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B4F7B16DD7;
	Fri, 11 Jul 2025 10:02:10 +0200 (CEST)
Received: from [10.252.16.187] (10.252.16.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 10:02:09 +0200
Message-ID: <11a49801-d187-479b-865b-810ca5adbf00@foss.st.com>
Date: Fri, 11 Jul 2025 10:02:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] dt-bindings: pinctrl: stm32: Introduce HDP
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
 <20250711-hdp-upstream-v7-1-faeecf7aaee1@foss.st.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250711-hdp-upstream-v7-1-faeecf7aaee1@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_02,2025-07-09_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_010440_462180_01551D21 
X-CRM114-Status: GOOD (  15.53  )
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

On 7/11/25 09:41, Clément Le Goffic wrote:
> 'HDP' stands for Hardware Debug Port, it is an hardware block in
> STMicrolectronics' MPUs that let the user decide which internal SoC's
> signal to observe.
> It provides 8 ports and for each port there is up to 16 different
> signals that can be output.
> Signals are different for each MPU.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>   .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  | 187 +++++++++++++++++++++
>   1 file changed, 187 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
> new file mode 100644
> index 000000000000..d0eaee7f52c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
> @@ -0,0 +1,187 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) STMicroelectronics 2025.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/st,stm32-hdp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Hardware Debug Port Mux/Config
> +
> +maintainers:
> +  - Clément LE GOFFIC <clement.legoffic@foss.st.com>

Oops, need to change the mail address here too.

> +
> +description:
> +  STMicroelectronics's STM32 MPUs integrate a Hardware Debug Port (HDP).
> +  It allows to output internal signals on SoC's GPIO.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp131-hdp
> +      - st,stm32mp151-hdp
> +      - st,stm32mp251-hdp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^hdp[0-7]-pins$":
> +    type: object
> +    $ref: pinmux-node.yaml#
> +    additionalProperties: false
> +
> +    properties:
> +      pins:
> +        pattern: '^HDP[0-7]$'
> +
> +      function: true
> +
> +    required:
> +      - function
> +      - pins
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp131-hdp
> +    then:
> +      patternProperties:
> +        "^hdp[0-7]-pins$":
> +          properties:
> +            function:
> +              enum: [ pwr_pwrwake_sys, pwr_stop_forbidden, pwr_stdby_wakeup, pwr_encomp_vddcore,
> +                      bsec_out_sec_niden, aiec_sys_wakeup, none, ddrctrl_lp_req,
> +                      pwr_ddr_ret_enable_n, dts_clk_ptat, sram3ctrl_tamp_erase_act, gpoval0,
> +                      pwr_sel_vth_vddcpu, pwr_mpu_ram_lowspeed, ca7_naxierrirq, pwr_okin_mr,
> +                      bsec_out_sec_dbgen, aiec_c1_wakeup, rcc_pwrds_mpu, ddrctrl_dfi_ctrlupd_req,
> +                      ddrctrl_cactive_ddrc_asr, sram3ctrl_hw_erase_act, nic400_s0_bready, gpoval1,
> +                      pwr_pwrwake_mpu, pwr_mpu_clock_disable_ack, ca7_ndbgreset_i,
> +                      bsec_in_rstcore_n, bsec_out_sec_bsc_dis, ddrctrl_dfi_init_complete,
> +                      ddrctrl_perf_op_is_refresh, ddrctrl_gskp_dfi_lp_req, sram3ctrl_sw_erase_act,
> +                      nic400_s0_bvalid, gpoval2, pwr_sel_vth_vddcore, pwr_mpu_clock_disable_req,
> +                      ca7_npmuirq0, ca7_nfiqout0, bsec_out_sec_dftlock, bsec_out_sec_jtag_dis,
> +                      rcc_pwrds_sys, sram3ctrl_tamp_erase_req, ddrctrl_stat_ddrc_reg_selfref_type0,
> +                      dts_valobus1_0, dts_valobus2_0, tamp_potential_tamp_erfcfg, nic400_s0_wready,
> +                      nic400_s0_rready, gpoval3, pwr_stop2_active, ca7_nl2reset_i,
> +                      ca7_npreset_varm_i, bsec_out_sec_dften, bsec_out_sec_dbgswenable,
> +                      eth1_out_pmt_intr_o, eth2_out_pmt_intr_o, ddrctrl_stat_ddrc_reg_selfref_type1,
> +                      ddrctrl_cactive_0, dts_valobus1_1, dts_valobus2_1, tamp_nreset_sram_ercfg,
> +                      nic400_s0_wlast, nic400_s0_rlast, gpoval4, ca7_standbywfil2,
> +                      pwr_vth_vddcore_ack, ca7_ncorereset_i, ca7_nirqout0, bsec_in_pwrok,
> +                      bsec_out_sec_deviceen, eth1_out_lpi_intr_o, eth2_out_lpi_intr_o,
> +                      ddrctrl_cactive_ddrc, ddrctrl_wr_credit_cnt, dts_valobus1_2, dts_valobus2_2,
> +                      pka_pka_itamp_out, nic400_s0_wvalid, nic400_s0_rvalid, gpoval5,
> +                      ca7_standbywfe0, pwr_vth_vddcpu_ack, ca7_evento, bsec_in_tamper_det,
> +                      bsec_out_sec_spniden, eth1_out_mac_speed_o1, eth2_out_mac_speed_o1,
> +                      ddrctrl_csysack_ddrc, ddrctrl_lpr_credit_cnt, dts_valobus1_3, dts_valobus2_3,
> +                      saes_tamper_out, nic400_s0_awready, nic400_s0_arready, gpoval6,
> +                      ca7_standbywfi0, pwr_rcc_vcpu_rdy, ca7_eventi, ca7_dbgack0, bsec_out_fuse_ok,
> +                      bsec_out_sec_spiden, eth1_out_mac_speed_o0, eth2_out_mac_speed_o0,
> +                      ddrctrl_csysreq_ddrc, ddrctrl_hpr_credit_cnt, dts_valobus1_4, dts_valobus2_4,
> +                      rng_tamper_out, nic400_s0_awavalid, nic400_s0_aravalid, gpoval7 ]
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp151-hdp
> +    then:
> +      patternProperties:
> +        "^hdp[0-7]-pins$":
> +          properties:
> +            function:
> +              enum: [ pwr_pwrwake_sys, cm4_sleepdeep, pwr_stdby_wkup, pwr_encomp_vddcore,
> +                      bsec_out_sec_niden, none, rcc_cm4_sleepdeep, gpu_dbg7, ddrctrl_lp_req,
> +                      pwr_ddr_ret_enable_n, dts_clk_ptat, gpoval0, pwr_pwrwake_mcu, cm4_halted,
> +                      ca7_naxierrirq, pwr_okin_mr, bsec_out_sec_dbgen, exti_sys_wakeup,
> +                      rcc_pwrds_mpu, gpu_dbg6, ddrctrl_dfi_ctrlupd_req, ddrctrl_cactive_ddrc_asr,
> +                      gpoval1, pwr_pwrwake_mpu, cm4_rxev, ca7_npmuirq1, ca7_nfiqout1,
> +                      bsec_in_rstcore_n, exti_c2_wakeup, rcc_pwrds_mcu, gpu_dbg5,
> +                      ddrctrl_dfi_init_complete, ddrctrl_perf_op_is_refresh,
> +                      ddrctrl_gskp_dfi_lp_req, gpoval2, pwr_sel_vth_vddcore, cm4_txev, ca7_npmuirq0,
> +                      ca7_nfiqout0, bsec_out_sec_dftlock, exti_c1_wakeup, rcc_pwrds_sys, gpu_dbg4,
> +                      ddrctrl_stat_ddrc_reg_selfref_type0, ddrctrl_cactive_1, dts_valobus1_0,
> +                      dts_valobus2_0, gpoval3, pwr_mpu_pdds_not_cstbydis, cm4_sleeping, ca7_nreset1,
> +                      ca7_nirqout1, bsec_out_sec_dften, bsec_out_sec_dbgswenable,
> +                      eth_out_pmt_intr_o, gpu_dbg3, ddrctrl_stat_ddrc_reg_selfref_type1,
> +                      ddrctrl_cactive_0, dts_valobus1_1, dts_valobus2_1, gpoval4, ca7_standbywfil2,
> +                      pwr_vth_vddcore_ack, ca7_nreset0, ca7_nirqout0, bsec_in_pwrok,
> +                      bsec_out_sec_deviceen, eth_out_lpi_intr_o, gpu_dbg2, ddrctrl_cactive_ddrc,
> +                      ddrctrl_wr_credit_cnt, dts_valobus1_2, dts_valobus2_2, gpoval5,
> +                      ca7_standbywfi1, ca7_standbywfe1, ca7_evento, ca7_dbgack1,
> +                      bsec_out_sec_spniden, eth_out_mac_speed_o1, gpu_dbg1, ddrctrl_csysack_ddrc,
> +                      ddrctrl_lpr_credit_cnt, dts_valobus1_3, dts_valobus2_3, gpoval6,
> +                      ca7_standbywfi0, ca7_standbywfe0, ca7_dbgack0, bsec_out_fuse_ok,
> +                      bsec_out_sec_spiden, eth_out_mac_speed_o0, gpu_dbg0, ddrctrl_csysreq_ddrc,
> +                      ddrctrl_hpr_credit_cnt, dts_valobus1_4, dts_valobus2_4, gpoval7 ]
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp251-hdp
> +    then:
> +      patternProperties:
> +        "^hdp[0-7]-pins$":
> +          properties:
> +            function:
> +              enum: [ pwr_pwrwake_sys, cpu2_sleep_deep, bsec_out_tst_sdr_unlock_or_disable_scan,
> +                      bsec_out_nidenm, bsec_out_nidena, cpu2_state_0, rcc_pwrds_sys, gpu_dbg7,
> +                      ddrss_csysreq_ddrc, ddrss_dfi_phyupd_req, cpu3_sleep_deep,
> +                      d2_gbl_per_clk_bus_req, pcie_usb_cxpl_debug_info_ei_0,
> +                      pcie_usb_cxpl_debug_info_ei_8, d3_state_0, gpoval0, pwr_pwrwake_cpu2,
> +                      cpu2_halted, cpu2_state_1, bsec_out_dbgenm, bsec_out_dbgena, exti1_sys_wakeup,
> +                      rcc_pwrds_cpu2, gpu_dbg6, ddrss_csysack_ddrc, ddrss_dfi_phymstr_req,
> +                      cpu3_halted, d2_gbl_per_dma_req, pcie_usb_cxpl_debug_info_ei_1,
> +                      pcie_usb_cxpl_debug_info_ei_9, d3_state_1, gpoval1, pwr_pwrwake_cpu1,
> +                      cpu2_rxev, cpu1_npumirq1, cpu1_nfiqout1, bsec_out_shdbgen, exti1_cpu2_wakeup,
> +                      rcc_pwrds_cpu1, gpu_dbg5, ddrss_cactive_ddrc, ddrss_dfi_lp_req, cpu3_rxev,
> +                      hpdma1_clk_bus_req, pcie_usb_cxpl_debug_info_ei_2,
> +                      pcie_usb_cxpl_debug_info_ei_10, d3_state_2, gpoval2, pwr_sel_vth_vddcpu,
> +                      cpu2_txev, cpu1_npumirq0, cpu1_nfiqout0, bsec_out_ddbgen, exti1_cpu1_wakeup,
> +                      cpu3_state_0, gpu_dbg4, ddrss_mcdcg_en, ddrss_dfi_freq_0, cpu3_txev,
> +                      hpdma2_clk_bus_req, pcie_usb_cxpl_debug_info_ei_3,
> +                      pcie_usb_cxpl_debug_info_ei_11, d1_state_0, gpoval3, pwr_sel_vth_vddcore,
> +                      cpu2_sleeping, cpu1_evento, cpu1_nirqout1, bsec_out_spnidena, exti2_d3_wakeup,
> +                      eth1_out_pmt_intr_o, gpu_dbg3, ddrss_dphycg_en, ddrss_obsp0, cpu3_sleeping,
> +                      hpdma3_clk_bus_req, pcie_usb_cxpl_debug_info_ei_4,
> +                      pcie_usb_cxpl_debug_info_ei_12, d1_state_1, gpoval4, cpu1_standby_wfil2,
> +                      none, cpu1_nirqout0, bsec_out_spidena, exti2_cpu3_wakeup, eth1_out_lpi_intr_o,
> +                      gpu_dbg2, ddrctrl_dfi_init_start, ddrss_obsp1, cpu3_state_1,
> +                      d3_gbl_per_clk_bus_req, pcie_usb_cxpl_debug_info_ei_5,
> +                      pcie_usb_cxpl_debug_info_ei_13, d1_state_2, gpoval5, cpu1_standby_wfi1,
> +                      cpu1_standby_wfe1, cpu1_halted1, cpu1_naxierrirq, bsec_out_spnidenm,
> +                      exti2_cpu2_wakeup, eth2_out_pmt_intr_o, gpu_dbg1, ddrss_dfi_init_complete,
> +                      ddrss_obsp2, d2_state_0, d3_gbl_per_dma_req, pcie_usb_cxpl_debug_info_ei_6,
> +                      pcie_usb_cxpl_debug_info_ei_14, cpu1_state_0, gpoval6, cpu1_standby_wfi0,
> +                      cpu1_standby_wfe0, cpu1_halted0, bsec_out_spidenm, exti2_cpu1__wakeup,
> +                      eth2_out_lpi_intr_o, gpu_dbg0, ddrss_dfi_ctrlupd_req, ddrss_obsp3, d2_state_1,
> +                      lpdma1_clk_bus_req, pcie_usb_cxpl_debug_info_ei_7,
> +                      pcie_usb_cxpl_debug_info_ei_15, cpu1_state_1, gpoval7 ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +
> +    pinctrl@54090000 {
> +      compatible = "st,stm32mp151-hdp";
> +      reg = <0x54090000 0x400>;
> +      clocks = <&rcc HDP>;
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&hdp2_gpo>;
> +      hdp2_gpo: hdp2-pins {
> +        function = "gpoval2";
> +        pins = "HDP2";
> +      };
> +    };
> 


