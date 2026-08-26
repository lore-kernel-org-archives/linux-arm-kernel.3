Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F98EC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 20:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqltKglBedGMune1iOvieoStWiRDAaU03/Ap5YDSFbs=; b=dDKMM75LufFS9ELO9SbyceBLU3
	v3EATMk+rgUoP10Lcvd42nwZonNYPBLkP2vDio8iasQgkwzxL+TQPhASEbyApne6YPZ0bGVkYJUaH
	3a5Yi0+EoOhk34xbnS9Sv8DBhTmVOarxmJQ6QCj4YMt5qb4TI85xKSG3UU4wCaDzGD0kq8z4XNcxG
	cq/IuNFoELSolX4CvueQPhxHLfrhxgO3KuYk19sWlVOCeB2R2UNtz6OCX2OejN8Etzsgx1xCCirf1
	2DM4qHSDES3ec8FhN0JMqj1kwYUbPegF69bLsyTf1qGyi3siQVhwbDkWxurXVgA6hSFh56tXdroRN
	I8sAduCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzJri-00000002xkY-3pfC;
	Wed, 26 Aug 2026 20:04:54 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzJre-00000002xje-1KcM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 20:04:53 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso5458975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 13:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787774688; x=1788379488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqltKglBedGMune1iOvieoStWiRDAaU03/Ap5YDSFbs=;
        b=ZWmJ5IJGhpDSKjUn5FZMD8gI3N0jrazBYU+M+NeN9HUEu+H+eac9VLEnAEeI7yIPzt
         utFMihbZHVyeT05VXBhwWqUsjPcvZZjrb79J7Tqcree1GPo6BfIrKCIB4m8iD5u1du4T
         vBGOi0htmKufHxxwmwW8bZOhNWAJiyeswg0DWYNWFg9lC4W5knKM080rJPBBDMWkIJph
         PsC9Qz0uEPzYAsUAdGOAmsMgkbKVWwiX7Smp/CRfXSD1LIJUSosCrWKeKv1xXdBWCVmY
         BkJKlweabZwH3NLl4h3pykx6/DaO1VbjtDn8NcA+TLXfTDf2hVEAMwWVBKiJZAUZE+IA
         FT6w==
X-Forwarded-Encrypted: i=1; AHgh+RqJO6vrAjtWTx46aZlu7+fd/dSdoh0R5okwwBEbu79LdFhcXhlLL6Be5fX9D1URM4xpCUltl2kEllwGb/kCfO7H@lists.infradead.org
X-Gm-Message-State: AFuF++nkRz/sMV5pb4+jPJPXNfuVkzXwiODK/6OxnwS2JAIo55oXPOCs
	cdt+bf+KiY6TEk/hfp4BBnn4QPyBARVM+XE5GSd50EyxEdEjbgp0UOFrP6qszudN
X-Gm-Gg: AR+sD13Err95RcdU4D6jjnMN9Bh4BiWk5uFagbrNSF6juEm/IqdVY+hfftPdahQN4UH
	SqNwYZzl6jjZ6erdCjw36clBkOE2+4Xvz6/rSCHwCy/vwwSajzksCXaTAdzsdW19DSOAUgXc0IH
	oaxmjxZ1GyoFSAmYnOzof+JPP13wSxuBLK8MRfhDkMbCkCatVFWGFyuWe5+bohhV9Yl5mVxVyq5
	q9rA7F0d+ppkC3Co4bZcYgJa5IqLOclA3bUo4nMt9+NhAs5rr+ZgJgkNLU2T9LT34pyoSEkoY47
	PFLfOgC1G2QwEFHNlCjmzCmt0MaCDCgawlVjBkgk6L8bgdJ+/qFNNY3sDrwmmhfmXPTPeb0Rj+A
	KnIPE7zTsBwPcdUxuM96GB+QiI/Jgq53XW2CTTw4NmEsl87FGOc0CLujLK1IwuCX+TL1jq5kdWg
	wlqpcZO54AO8jreoYeceGEqBeRvXIEDjCg4trBXpcTxdHxTyJ+tL2/vB+GG+YODYXqXgC10B6qv
	iJlTIymuk3NSaqbHuFk0w==
X-Received: by 2002:a05:600c:3112:b0:499:db6e:40a5 with SMTP id 5b1f17b1804b1-499dc6fba17mr83121845e9.4.1787774687928;
        Wed, 26 Aug 2026 13:04:47 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499e7170b72sm22537845e9.0.2026.08.26.13.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 13:04:47 -0700 (PDT)
Message-ID: <5ac071a6-8013-4143-9f59-7d0c6cad5c00@linux.com>
Date: Wed, 26 Aug 2026 21:04:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
To: Brian Masney <bmasney@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
 <aoxjX3HabY0brgXk@redhat.com>
 <57d796bd-7a3c-46b9-bd65-d6860adbd355@linux.com>
 <72db2062-e0ac-4c33-b1d1-d1fa5ae4bec8@linux.com>
 <ao8fqstEs01hd3--@redhat.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <ao8fqstEs01hd3--@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_130451_282216_974C9296 
X-CRM114-Status: GOOD (  25.97  )
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

On 26/08/2026 18:17, Brian Masney wrote:
> Hi Lucas,
> 
> On Wed, Aug 26, 2026 at 05:42:01PM +0100, Lucas Tanure wrote:
>> With Brian's patches, VIM4 does not turn off 4 clocks:
>>
>> t7_sys_sd_emmc_b
>> t7_sys_sd_emmc_c
>> sd_emmc_b
>> sd_emmc_c
>>
>> This is expected since I'm trying to run from an SD card. However, even with
>> these four clocks kept enabled, the board still hangs.
>>
>> Complete list with all clocks being disabled after Brians patches:
>> [    1.002247] clk: Disabled unused clock: t7_sys_pwm_ao_gh
>> [    1.002898] clk: Disabled unused clock: t7_sys_pwm_ao_ef
>> [    1.003560] clk: Disabled unused clock: t7_sys_pwm_ao_cd
>> [    1.004220] clk: Disabled unused clock: t7_sys_pwm_ao_ab
>> [    1.004972] clk: Disabled unused clock: t7_sys_pwm_ef
>> [    1.005509] clk: Disabled unused clock: t7_sys_pwm_cd
>> [    1.006211] clk: Disabled unused clock: t7_sys_pwm_ab
>> [    1.006766] clk: Disabled unused clock: t7_sys_ts_hevc
>> [    1.007434] clk: Disabled unused clock: t7_sys_ts_vpu
>> [    1.008033] clk: Disabled unused clock: t7_sys_ts_nna
>> [    1.008741] clk: Disabled unused clock: t7_sys_ts_gpu
>> [    1.009294] clk: Disabled unused clock: t7_sys_sar_adc
>> [    1.009929] clk: Disabled unused clock: t7_sys_vpu_intr
>> [    1.010609] clk: Disabled unused clock: t7_sys_dspb
>> [    1.011186] clk: Disabled unused clock: t7_sys_dspa
>> [    1.011792] clk: Disabled unused clock: t7_sys_a73pclk_apb
>> [    1.012554] clk: Disabled unused clock: t7_sys_pclk_sys_apb
>> [    1.013213] clk: Disabled unused clock: t7_sys_rsa
>> [    1.013811] clk: Disabled unused clock: t7_sys_mipi_isp_pclk
>> [    1.014529] clk: Disabled unused clock: t7_sys_mmc_apb
>> [    1.015107] clk: Disabled unused clock: t7_sys_hdmirx_pclk
>> [    1.015819] clk: Disabled unused clock: t7_sys_i2c_s_a
>> [    1.016429] clk: Disabled unused clock: t7_sys_hdmitx_apb
>> [    1.017109] clk: Disabled unused clock: t7_sys_i2c_m_f
>> [    1.017740] clk: Disabled unused clock: t7_sys_i2c_m_e
>> [    1.018379] clk: Disabled unused clock: t7_sys_i2c_m_d
>> [    1.019018] clk: Disabled unused clock: t7_sys_i2c_m_c
>> [    1.019657] clk: Disabled unused clock: t7_sys_i2c_m_b
>> [    1.020296] clk: Disabled unused clock: t7_sys_i2c_m_a
>> [    1.020940] clk: Disabled unused clock: t7_sys_i2c_ao_b
>> [    1.021585] clk: Disabled unused clock: t7_sys_i2c_ao_a
>> [    1.022236] clk: Disabled unused clock: t7_sys_pcie_phy
>> [    1.022885] clk: Disabled unused clock: t7_sys_usb
>> [    1.023482] clk: Disabled unused clock: t7_sys_pcie
>> [    1.024088] clk: Disabled unused clock: t7_sys_spicc1
>> [    1.024723] clk: Disabled unused clock: t7_sys_spicc0
>> [    1.025345] clk: Disabled unused clock: t7_sys_g2d
>> [    1.025940] clk: Disabled unused clock: t7_sys_spicc5
>> [    1.026569] clk: Disabled unused clock: t7_sys_ts_a53
>> [    1.027197] clk: Disabled unused clock: t7_sys_ts_a73
>> [    1.027825] clk: Disabled unused clock: t7_sys_spicc4
>> [    1.028454] clk: Disabled unused clock: t7_sys_spicc3
>> [    1.029085] clk: Disabled unused clock: t7_sys_spicc2
>> [    1.029710] clk: Disabled unused clock: t7_sys_aififo
>> [    1.030339] clk: Disabled unused clock: t7_sys_uart_f
>> [    1.030967] clk: Disabled unused clock: t7_sys_uart_e
>> [    1.031595] clk: Disabled unused clock: t7_sys_uart_d
>> [    1.032224] clk: Disabled unused clock: t7_sys_uart_c
>> [    1.032857] clk: Disabled unused clock: t7_sys_uart_b
>> [    1.033482] clk: Disabled unused clock: t7_sys_eth
>> [    1.034077] clk: Disabled unused clock: t7_sys_audio
>> [    1.034694] clk: Disabled unused clock: t7_sys_ir_ctrl
>> [    1.035333] clk: Disabled unused clock: t7_sys_msr_clk
>> [    1.035972] clk: Disabled unused clock: t7_sys_spifc
>> [    1.036596] clk: Disabled unused clock: t7_sys_acodec
>> [    1.037218] clk: Disabled unused clock: t7_sys_smartcard
>> [    1.037880] clk: Disabled unused clock: t7_sys_am2axi2
>> [    1.038518] clk: Disabled unused clock: t7_sys_am2axi1
>> [    1.039157] clk: Disabled unused clock: t7_sys_am2axi0
>> [    1.039796] clk: Disabled unused clock: t7_sys_ampipe_eth
>> [    1.040468] clk: Disabled unused clock: t7_sys_ampipe_nand
>> [    1.041155] clk: Disabled unused clock: t7_sys_deswarp
>> [    1.041790] clk: Disabled unused clock: t7_sys_gdc
>> [    1.042385] clk: Disabled unused clock: t7_sys_cec
>> [    1.042981] clk: Disabled unused clock: t7_sys_aucpu
>> [    1.043600] clk: Disabled unused clock: t7_sys_aocpu
>> [    1.044217] clk: Disabled unused clock: t7_sys_mali
>> [    1.044830] clk: Disabled unused clock: t7_sys_ethphy
>> [    1.045451] clk: Disabled unused clock: t7_sys_mipi_dsi_b
>> [    1.046123] clk: Disabled unused clock: t7_sys_mipi_dsi_a
>> [    1.046795] clk: Disabled unused clock: t7_sys_dos
>> [    1.047390] clk: Disabled unused clock: t7_sys_ddr
>> [    1.047991] clk: Disabled unused clock: pwm_ao_g
>> [    1.048565] clk: Disabled unused clock: pwm_ao_f
>> [    1.049135] clk: Disabled unused clock: pwm_ao_e
>> [    1.049709] clk: Disabled unused clock: pwm_ao_d
>> [    1.050283] clk: Disabled unused clock: pwm_ao_b
>> [    1.050857] clk: Disabled unused clock: pwm_ao_a
>> [    1.051454] clk: Disabled unused clock: rtc_dualdiv
>> [    1.052038] clk: Disabled unused clock: rtc_duandiv_in
>>
>> Also with the patches the disable happens 0.5 second later, from 0.5 seconds
>> after the boot to 1 second after the boot.
>>
>> I am still investigating what is missing a consumer or what should be
>> labeled critical.
> 
> I've seen cases where a clock is modeled in Linux, but isn't actually
> used by Linux, so it gets caught in the disable unused clocks sweep.
> 
> Does the board immediately crash after the disable unused clock sweep?
yes> If so, you could add a log statement, then 1 second sleep in
> clk_disable_unused_subtree() and wait for the board to crash.
good idea , thanks
> 
> If you can't get timely help from the vendor, then you can add
> CLK_IGNORE_UNUSED to all of those clocks, and slowly start taking them
> off in batches and wait for the crash.
That's what I've been doing for the past few weeks, but I'm probably 
hunting down a set of clock issues, as support for this board is still 
in its early stages. It's a combination of clocks, which makes it way 
more time-consuming.

I went with a more localized approach:

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2b6fae54702a..3358f4dc871f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1489,14 +1489,95 @@ static void clk_unprepare_unused_subtree(struct 
clk_core *core,
                 else if (core->ops->unprepare)
                         core->ops->unprepare(core->hw);
                 trace_clk_unprepare_complete(core);
+               pr_info("clk: V Unprepared unused clock: %s\n", core->name);
         }
  }

+static const char * const disable_clocks[] = {
+       "t7_sys_pwm_ao_gh",
+       "t7_sys_pwm_ao_ef",
+       "t7_sys_pwm_ef",
+       "t7_sys_pwm_cd",
+       "t7_sys_pwm_ab",
+       "t7_sys_ts_hevc",
+       "t7_sys_ts_vpu",
+       "t7_sys_ts_nna",
+       "t7_sys_ts_gpu",
+       "t7_sys_sar_adc",
+       "t7_sys_vpu_intr",
+       "t7_sys_dspb",
+       "t7_sys_dspa",
+       "t7_sys_a73pclk_apb",
+       "t7_sys_pclk_sys_apb",
+       "t7_sys_rsa",
+       "t7_sys_mipi_isp_pclk",
+       "t7_sys_mmc_apb",
+       "t7_sys_hdmirx_pclk",
+       "t7_sys_i2c_s_a",
+       "t7_sys_hdmitx_apb",
+       "t7_sys_i2c_m_f",
+       "t7_sys_i2c_m_e",
+       "t7_sys_i2c_m_d",
+       "t7_sys_i2c_m_c",
+       "t7_sys_i2c_m_b",
+       "t7_sys_i2c_m_a",
+       "t7_sys_i2c_ao_b",
+       "t7_sys_i2c_ao_a",
+       "t7_sys_pcie_phy",
+       "t7_sys_usb",
+       "t7_sys_pcie",
+       "t7_sys_spicc1",
+       "t7_sys_spicc0",
+       "t7_sys_g2d",
+       "t7_sys_spicc5",
+       "t7_sys_ts_a53",
+       "t7_sys_ts_a73",
+       "t7_sys_spicc4",
+       "t7_sys_spicc3",
+       "t7_sys_spicc2",
+       "t7_sys_aififo",
+       "t7_sys_uart_f",
+       "t7_sys_uart_e",
+       "t7_sys_uart_d",
+       "t7_sys_uart_c",
+       "t7_sys_uart_b",
+       "t7_sys_eth",
+       "t7_sys_audio",
+       "t7_sys_ir_ctrl",
+       "t7_sys_msr_clk",
+       "t7_sys_spifc",
+       "t7_sys_acodec",
+       "t7_sys_smartcard",
+       "t7_sys_am2axi2",
+       "t7_sys_am2axi1",
+       "t7_sys_am2axi0",
+       "t7_sys_ampipe_eth",
+       "t7_sys_ampipe_nand",
+       "t7_sys_deswarp",
+       "t7_sys_gdc",
+       "t7_sys_cec",
+       "t7_sys_aucpu",
+       "t7_sys_aocpu",
+       "t7_sys_mali",
+       "t7_sys_ethphy",
+       "t7_sys_mipi_dsi_b",
+       "t7_sys_mipi_dsi_a",
+       "t7_sys_dos",
+       "t7_sys_ddr",
+       "pwm_ao_g",
+       "pwm_ao_e",
+       "pwm_ao_a",
+       "rtc_dualdiv",
+       "rtc_duandiv_in",
+};
+
+
  static void clk_disable_unused_subtree(struct clk_core *core,
                                        struct device *dev)
  {
         struct clk_core *child;
         unsigned long flags;
+       int i;

         lockdep_assert_held(&prepare_lock);

@@ -1517,6 +1598,11 @@ static void clk_disable_unused_subtree(struct 
clk_core *core,
         if (core->flags & CLK_IGNORE_UNUSED)
                 goto unlock_out;

+       for (i = 0; i < ARRAY_SIZE(disable_clocks); i++) {
+               if (strcmp(core->name, disable_clocks[i]) == 0)
+                       goto unlock_out;
+       }
+
         /*
          * some gate clocks have special needs during the disable-unused
          * sequence.  call .disable_unused if available, otherwise fall
@@ -1529,6 +1615,7 @@ static void clk_disable_unused_subtree(struct 
clk_core *core,
                 else if (core->ops->disable)
                         core->ops->disable(core->hw);
                 trace_clk_disable_complete(core);
+               pr_info("clk: V Disabled unused clock: %s\n", core->name);
         }

This makes it easier to let the sweep disable clocks for testing.

> 
> Brian
> 
Thanks
Lucas


