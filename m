Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9EACA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocLM34GOeUaGdAHS29toK+EluWRUE1MXFa3Amqck7do=; b=cuvFgAG7irY43PruZuKgbuAWiC
	HeVlCV/opQ2YLCZWDFebd+lMytAJBJsj8/XENXvs0O+vBIm9bQ5H+IZwk2ZHsfWtxhi0kec4IP0ue
	kecp+9gPExveALDGg+zTn2NKyHlgxWzDhnbXjXwyvgEZU1Q/RvL3sjz9QMGLwX48UpRGZHNQ0dhwV
	1mXHBrntvOxZ185zOnyU+oURCe9tCCkEpEsAM74cKsBmDlk+hcowRvSaz+oZhy0ZNun8OsVUKmNk8
	zwBUTEso1Ruk34unNz/SoujJ9vSYpJ7uRgfTOX3w24lT7YPXpG2Z7O4E2+G3kxCgN+1tPZ6fIOl6r
	mUwU7aWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbxb-00000001Z9h-2ew3;
	Thu, 11 Sep 2025 07:43:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbxX-00000001Z6j-3sTy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:43:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45de56a042dso2308185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757576590; x=1758181390; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ocLM34GOeUaGdAHS29toK+EluWRUE1MXFa3Amqck7do=;
        b=Qk/Dkgi2idpbFHbWZZD1CAVosCVywj61I7zlZIXjnb8dWbIthlKIlik/Ie/0zHhD/u
         cjDGn+fRyWgJMITiCbZL161cU7h1BBhuG3ujZOfIsZ9xFnYn1WAGJW2hu9gloua5Z61J
         WER1+kPxHxvVXGR5AB6/fFjpeRs7PFqjzvsXbDhr9U4IOXmdv8OFxX8i2Q7xarP1TDVM
         ySQRxlUtgBu9L7qgAdk1CMR1A0oiAEN5dMkBdugE/cOKRHU1wE5TK3pIwm5BVarco/om
         cVXnX33UFJ9PAMhny1ck3HFVTACncL4y5k2HMFFeWBrWnhFCEjhTBrerwMk8/I3ynqcu
         x0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757576590; x=1758181390;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocLM34GOeUaGdAHS29toK+EluWRUE1MXFa3Amqck7do=;
        b=WWVCSv5zpQN+orCrn6UmagSXv7kTEZ/WWTK/SI6mEMCmRXkkDzBa5VCXfhusLJ5yXG
         hIhVa6jR1FE07diRUp3zL9mtKS0TdN/tqlHJvdzIzIPg3+62ksrcJGB66iVjmg+87f5h
         BEqi1sED+tH3pxulrb/QR1u1apjfpIaNGAicJPqNGPKhqLCV1a/exBnyWN9Eu/e0+1IV
         XWckzCN9uq9QJP4n5aw+ZHVGWP5/lWq1XEi7YlHnksAvnJ/9l1ameS/dqC29ei0TlHAt
         clvE7gy0mgLBcjywjWAJewI/Tlds7haErqNT8Uf9oLCVVVI4Y8A0Pmfp+ba/1+JFTCDb
         gzmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV0zY7Fma2zy4ZB5fblBMosuSBRolv+wAnJFepV8ktA7kvU8FCDtnTOZam9hzPf1rltQ2/CLsfCjYW0SjNW4Im@lists.infradead.org
X-Gm-Message-State: AOJu0YwNZQwy9H4QC8ixjk2T/BhTdFVWhZZkwpWMrKdfL8QlTlnsh8RG
	osfVAQTCMX0xetWv15EOEynxAH5TfO4M+PVfMKSr81SqSJOMODNBNkBs3OaX3MxjaNk=
X-Gm-Gg: ASbGnctz2tHtDZ6mD7D4TsSHuE657Feh0opVTUq6miHkpIksQnF4NY4iHq/CtQndgbI
	h78Z17mTLLJQrBCI7rODS5UCvX+77JbnCOZ5tqnetjzrZJ8gEUSqzRKNnv975TSqqpoAyN5YB1j
	xXLpKXy+r7Prm9gb3lZBuebRKMuTcDf4wFj5A4DN97GED0HZbJHf8IDkPTlswEmOnmg1JdadDgu
	anNEucyCGz+1z79BTZoaveAsZbLsybI0ufyNUgVhqA/9TaR7kMQxInM1dhmNxLiY1OtNwpN4g7d
	jK3GGBnuoFO+V+2C/3n8C9/1KYQYIORv8OSx2eBP+JV5Car+VEUIDKoUmzYc+LP7HsuBLqPVJ8K
	tddoiQ7BlfEIwDI8ONt9sLB9/nDNpWJ5/rlFbzbc2zeY=
X-Google-Smtp-Source: AGHT+IFziZg7v6LlC8m6JnaXV3d4ooVHtsdQLQH89zmhgGaJ+ZtkJo/Vd2456C3nvJ69B6Gcl/m45w==
X-Received: by 2002:a05:600c:1e21:b0:45c:a955:4578 with SMTP id 5b1f17b1804b1-45dde02878emr152916345e9.21.1757576589973;
        Thu, 11 Sep 2025 00:43:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:205f:d6d3:fd4a:adb5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e0156d206sm16554135e9.5.2025.09.11.00.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 00:43:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: add video-related clocks for S4 SoC
In-Reply-To: <28399ab7-2560-482a-be7b-c83d631ac351@amlogic.com> (Chuan Liu's
	message of "Thu, 11 Sep 2025 10:01:03 +0800")
References: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
	<20250909-add_video_clk-v4-2-5e0c01d47aa8@amlogic.com>
	<1jv7lqiqzg.fsf@starbuckisacylon.baylibre.com>
	<28399ab7-2560-482a-be7b-c83d631ac351@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 11 Sep 2025 09:43:08 +0200
Message-ID: <1jplbxigdv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_004312_091624_8D6392D0 
X-CRM114-Status: GOOD (  20.97  )
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

On Thu 11 Sep 2025 at 10:01, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome:
>
>
> On 9/10/2025 5:41 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue 09 Sep 2025 at 15:29, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>
>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>
>>> Add video encoder, demodulator and CVBS clocks.
>>>
>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>> ---
>>>   drivers/clk/meson/s4-peripherals.c | 203 +++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 203 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
>>> index 6d69b132d1e1..b855e8f1fc04 100644
>>> --- a/drivers/clk/meson/s4-peripherals.c
>>> +++ b/drivers/clk/meson/s4-peripherals.c
>>> @@ -44,6 +44,7 @@
>>>   #define CLKCTRL_VDIN_MEAS_CLK_CTRL                 0x0f8
>>>   #define CLKCTRL_VAPBCLK_CTRL                       0x0fc
>>>   #define CLKCTRL_HDCP22_CTRL                        0x100
>>> +#define CLKCTRL_CDAC_CLK_CTRL                      0x108
>>>   #define CLKCTRL_VDEC_CLK_CTRL                      0x140
>>>   #define CLKCTRL_VDEC2_CLK_CTRL                     0x144
>>>   #define CLKCTRL_VDEC3_CLK_CTRL                     0x148
>>> @@ -1126,6 +1127,22 @@ static struct clk_regmap s4_cts_encp_sel = {
>>>        },
>>>   };
>>>
>>> +static struct clk_regmap s4_cts_encl_sel = {
>>> +     .data = &(struct clk_regmap_mux_data){
>>> +             .offset = CLKCTRL_VIID_CLK_DIV,
>>> +             .mask = 0xf,
>>> +             .shift = 12,
>>> +             .table = s4_cts_parents_val_table,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "cts_encl_sel",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_hws = s4_cts_parents,
>>> +             .num_parents = ARRAY_SIZE(s4_cts_parents),
>>> +             .flags = CLK_SET_RATE_PARENT,
>> Do you really expect the rate of the parents to be adjusted when calling
>> set_rate() on this clock ?
>>
>> It all trickle down to vclks which are shared with enci encp and vdac
>> clocks, so maybe not such a good idea, don't you think ?
>
>
> Thanks for pointing this out. You're right, this flag doesn't belong
> here.

Ok, let's be consistent then. Please add another change to drop the flag
from the other video clocks, such as enci, encp, etc . Thx.

>
> I'll drop it in the next revision. If there are no further objections
> on other aspects, I'll prepare a v5 series that also includes Conor's
> Acked-by that I missed...
>
>
>>> +     },
>>> +};
>>> +
>>>   static struct clk_regmap s4_cts_vdac_sel = {
>>>        .data = &(struct clk_regmap_mux_data){
>>>                .offset = CLKCTRL_VIID_CLK_DIV,
>>> @@ -1205,6 +1222,22 @@ static struct clk_regmap s4_cts_encp = {
>>>        },
>>>   };
>>>
>>> +static struct clk_regmap s4_cts_encl = {
>>> +     .data = &(struct clk_regmap_gate_data){
>>> +             .offset = CLKCTRL_VID_CLK_CTRL2,
>>> +             .bit_idx = 3,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data) {
>>> +             .name = "cts_encl",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_cts_encl_sel.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>>   static struct clk_regmap s4_cts_vdac = {
>>>        .data = &(struct clk_regmap_gate_data){
>>>                .offset = CLKCTRL_VID_CLK_CTRL2,
>>> @@ -2735,6 +2768,165 @@ static struct clk_regmap s4_gen_clk = {
>>>        },
>>>   };
>>>
>>> +/* CVBS DAC */
>>> +static struct clk_regmap s4_cdac_sel = {
>>> +     .data = &(struct clk_regmap_mux_data) {
>>> +             .offset = CLKCTRL_CDAC_CLK_CTRL,
>>> +             .mask = 0x3,
>>> +             .shift = 16,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "cdac_sel",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_data = (const struct clk_parent_data []) {
>>> +                     { .fw_name = "xtal", },
>>> +                     { .fw_name = "fclk_div5" },
>>> +             },
>>> +             .num_parents = 2,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_cdac_div = {
>>> +     .data = &(struct clk_regmap_div_data) {
>>> +             .offset = CLKCTRL_CDAC_CLK_CTRL,
>>> +             .shift = 0,
>>> +             .width = 16,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "cdac_div",
>>> +             .ops = &clk_regmap_divider_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_cdac_sel.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_cdac = {
>>> +     .data = &(struct clk_regmap_gate_data) {
>>> +             .offset = CLKCTRL_CDAC_CLK_CTRL,
>>> +             .bit_idx = 20,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "cdac",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_cdac_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_demod_core_sel = {
>>> +     .data = &(struct clk_regmap_mux_data) {
>>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>>> +             .mask = 0x3,
>>> +             .shift = 9,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "demod_core_sel",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_data = (const struct clk_parent_data []) {
>>> +                     { .fw_name = "xtal" },
>>> +                     { .fw_name = "fclk_div7" },
>>> +                     { .fw_name = "fclk_div4" }
>>> +             },
>>> +             .num_parents = 3,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_demod_core_div = {
>>> +     .data = &(struct clk_regmap_div_data) {
>>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>>> +             .shift = 0,
>>> +             .width = 7,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "demod_core_div",
>>> +             .ops = &clk_regmap_divider_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_demod_core_sel.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_demod_core = {
>>> +     .data = &(struct clk_regmap_gate_data) {
>>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>>> +             .bit_idx = 8
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "demod_core",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_demod_core_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +/* CVBS ADC */
>>> +static struct clk_regmap s4_adc_extclk_in_sel = {
>>> +     .data = &(struct clk_regmap_mux_data) {
>>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>>> +             .mask = 0x7,
>>> +             .shift = 25,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "adc_extclk_in_sel",
>>> +             .ops = &clk_regmap_mux_ops,
>>> +             .parent_data = (const struct clk_parent_data []) {
>>> +                     { .fw_name = "xtal" },
>>> +                     { .fw_name = "fclk_div4" },
>>> +                     { .fw_name = "fclk_div3" },
>>> +                     { .fw_name = "fclk_div5" },
>>> +                     { .fw_name = "fclk_div7" },
>>> +                     { .fw_name = "mpll2" },
>>> +                     { .fw_name = "gp0_pll" },
>>> +                     { .fw_name = "hifi_pll" }
>>> +             },
>>> +             .num_parents = 8,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_adc_extclk_in_div = {
>>> +     .data = &(struct clk_regmap_div_data) {
>>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>>> +             .shift = 16,
>>> +             .width = 7,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "adc_extclk_in_div",
>>> +             .ops = &clk_regmap_divider_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_adc_extclk_in_sel.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> +static struct clk_regmap s4_adc_extclk_in = {
>>> +     .data = &(struct clk_regmap_gate_data) {
>>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>>> +             .bit_idx = 24
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "adc_extclk_in",
>>> +             .ops = &clk_regmap_gate_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_adc_extclk_in_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +             .flags = CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>>   static const struct clk_parent_data s4_pclk_parents = { .hw = &s4_sys_clk.hw };
>>>
>>>   #define S4_PCLK(_name, _reg, _bit, _flags) \
>>> @@ -3028,6 +3220,17 @@ static struct clk_hw *s4_peripherals_hw_clks[] = {
>>>        [CLKID_HDCP22_SKPCLK_SEL]       = &s4_hdcp22_skpclk_sel.hw,
>>>        [CLKID_HDCP22_SKPCLK_DIV]       = &s4_hdcp22_skpclk_div.hw,
>>>        [CLKID_HDCP22_SKPCLK]           = &s4_hdcp22_skpclk.hw,
>>> +     [CLKID_CTS_ENCL_SEL]            = &s4_cts_encl_sel.hw,
>>> +     [CLKID_CTS_ENCL]                = &s4_cts_encl.hw,
>>> +     [CLKID_CDAC_SEL]                = &s4_cdac_sel.hw,
>>> +     [CLKID_CDAC_DIV]                = &s4_cdac_div.hw,
>>> +     [CLKID_CDAC]                    = &s4_cdac.hw,
>>> +     [CLKID_DEMOD_CORE_SEL]          = &s4_demod_core_sel.hw,
>>> +     [CLKID_DEMOD_CORE_DIV]          = &s4_demod_core_div.hw,
>>> +     [CLKID_DEMOD_CORE]              = &s4_demod_core.hw,
>>> +     [CLKID_ADC_EXTCLK_IN_SEL]       = &s4_adc_extclk_in_sel.hw,
>>> +     [CLKID_ADC_EXTCLK_IN_DIV]       = &s4_adc_extclk_in_div.hw,
>>> +     [CLKID_ADC_EXTCLK_IN]           = &s4_adc_extclk_in.hw,
>>>   };
>>>
>>>   static const struct meson_clkc_data s4_peripherals_clkc_data = {
>> --
>> Jerome

-- 
Jerome

