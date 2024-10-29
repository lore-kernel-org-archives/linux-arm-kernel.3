Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB820D3E2D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zozTutyuATPVlnn2mVl+cLTQqcmm7Uw6Y5NRauI58y0=; b=PbFTM+JymQ9AvW9VzCaKlVLRr5
	oRebEGMlMp+nutR0iVRsvLga58vqdl+jHojqcM4jN4xS5dvtvRETSuVWBKFyoHEDfzDPkjiEnAN+l
	6Z0zIfeoADYXm84ThDJuxImkdmLH+Jduz9jBxkCxJSwhvX9nRXE5B7ngbtCuJHXtn3xFTK1Bb4JMw
	vGuWGs824ffZYJXlu4EjslAy6IaKOcnZSIX9IrHyZExszibJ2/LmOyc2bZe0WUQMLawzJN+2Q8daz
	qWvYoMeinU6Iw5e0tibloNb1E79sDGomgKxutGBoFr0W4fNPR+6vRBJQ4vakkXan1lxGQIAK3Is+t
	VOPJx6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gyr-0000000DZYU-45so;
	Tue, 29 Oct 2024 07:49:33 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5guW-0000000DYgt-10Qf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 07:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730187904; x=1761723904;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AyYXRjcaab2AYpkQJdXKLDBCpSTee9FOue+yXz+/SQk=;
  b=AxYoCW7YSlQGcwth4dNqJzrh1+PeuqakKsLd7bFuhEnqmb3gHKl4iNm3
   e9wyc5EbpJ77hS8TqlFYZeJowvorgQ6HIt1Ed0gEA0Znzc+E+jUqKtSVB
   4H/a0Mkf6BVabFRRI2IAAb7joVhs9vMzEd0i6Eqdjh2bKUwiUBp8BUplc
   v2ptkk520rVliput7EtGtuYg12MAsIBZ9Cs4dKl6lRDy1r5SVnRS6JWBz
   NZOTMZaYgWPb5EEEjjd0xBthli/NskUDsywV5M8YcAtD/Ofai+bgld24n
   3U8ab+Nj+ot+SNcxuHWFUFWA3rOHJdKnTudy0qx/PpukJpOvJozNMd564
   A==;
X-CSE-ConnectionGUID: Zhv693TiScqm250AsS9plQ==
X-CSE-MsgGUID: T+qGycUgTVmPDPo2P7zYCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="41174844"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="41174844"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 00:45:03 -0700
X-CSE-ConnectionGUID: 4Tv1pQnzSBes7YUI20mSNA==
X-CSE-MsgGUID: duCkrkU5SJGRjpDSP6NUKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="119333087"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.0.178])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 00:44:58 -0700
Message-ID: <6c63e1ce-dd54-427f-baa6-4ff86cec3d16@intel.com>
Date: Tue, 29 Oct 2024 09:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: host: sdhci-esdhc-imx: implement emmc hardware reset
To: Bough Chen <haibo.chen@nxp.com>, Josua Mayer <josua@solid-run.com>,
 Peng Fan <peng.fan@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "yazan.shhady" <yazan.shhady@solid-run.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, dl-S32
 <S32@nxp.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241027-imx-emmc-reset-v1-1-d5d0c672864a@solid-run.com>
 <PAXPR04MB84591664B7A4455E6F0BD19E884A2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <DU0PR04MB9496769805197714F198EC0F904A2@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <913d8706-ec58-4197-889a-0d2d94c67ccc@solid-run.com>
 <DU0PR04MB949630B1EE9A0F19DACE3414904B2@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <DU0PR04MB949630B1EE9A0F19DACE3414904B2@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_004504_471248_AE82D513 
X-CRM114-Status: GOOD (  23.86  )
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

On 29/10/24 04:33, Bough Chen wrote:
>> -----Original Message-----
>> From: Josua Mayer <josua@solid-run.com>
>> Sent: 2024年10月28日 18:46
>> To: Bough Chen <haibo.chen@nxp.com>; Peng Fan <peng.fan@nxp.com>;
>> Adrian Hunter <adrian.hunter@intel.com>; Ulf Hansson
>> <ulf.hansson@linaro.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
>> <s.hauer@pengutronix.de>; Pengutronix Kernel Team
>> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>
>> Cc: yazan.shhady <yazan.shhady@solid-run.com>; Rabeeh Khoury
>> <rabeeh@solid-run.com>; imx@lists.linux.dev; linux-mmc@vger.kernel.org;
>> dl-S32 <S32@nxp.com>; linux-arm-kernel@lists.infradead.org;
>> linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH] mmc: host: sdhci-esdhc-imx: implement emmc hardware
>> reset
>>
>> Am 28.10.24 um 04:15 schrieb Bough Chen:
>>>> -----Original Message-----
>>>> From: Peng Fan <peng.fan@nxp.com>
>>>> Sent: 2024年10月28日 10:10
>>>> To: Josua Mayer <josua@solid-run.com>; Adrian Hunter
>>>> <adrian.hunter@intel.com>; Bough Chen <haibo.chen@nxp.com>; Ulf
>>>> Hansson <ulf.hansson@linaro.org>; Shawn Guo <shawnguo@kernel.org>;
>>>> Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
>>>> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>
>>>> Cc: yazan.shhady <yazan.shhady@solid-run.com>; Rabeeh Khoury
>>>> <rabeeh@solid-run.com>; imx@lists.linux.dev;
>>>> linux-mmc@vger.kernel.org;
>>>> dl-S32 <S32@nxp.com>; linux-arm-kernel@lists.infradead.org;
>>>> linux-kernel@vger.kernel.org
>>>> Subject: RE: [PATCH] mmc: host: sdhci-esdhc-imx: implement emmc
>>>> hardware reset
>>>>
>>>>> Subject: [PATCH] mmc: host: sdhci-esdhc-imx: implement emmc hardware
>>>>> reset
>>>>>
>>>>> NXP ESDHC supports control of native emmc reset signal when pinmux
>>>>> is set accordingly, using uSDHCx_SYS_CTRL register IPP_RST_N bit.
>>>>> Documentation is available in NXP i.MX6Q Reference Manual.
>>>> But this relies on the PAD been configured as RESET, should this flow
>>>> being default enabled whether the PAD is configured as RESET or not?
>>> No, from my understanding, even the PAD is configured as RESET, still need SW
>> to config IPP_RST_N to control the output of this pad.
>>> Josua, you can double confirm this on your board.
>> Correct, only when a pad is configured for emmc reset function does the reset
>> signal affect any board circuit.
>>
>> We tested this when we had wrong pinmux and reset did not toggle.
>>
>>> By the way, I check the code, when you do the test to support this reset
>> operation on eMMC, did you add  "cap-mmc-hw-reset" in dts?
>>
>> Correct:
>>
>>> From current code logic, the callback you add here seems only can be called by
>> eMMC device, so will be safe for sd and sdio device. And if your answer for my
>> question is "yes", then your change will also be safe for eMMC device which do
>> not use this reset function before.
>> I believe so. Only when dts declares the capability will sdhci_hw_reset
>>
>> get called, and then it will call esdhc-imx driver hw_reset.
>>
>> See also drivers/mmc/core.c: _mmc_hw_reset
>>
>>>
>>>
>>>>> Implement the hw_reset function in sdhci_ops asserting reset for at
>>>>> least 10us and waiting an extra 300us after deassertion.
>>>>> These particular delays were inspired by sunxi-mmc hw_reset function.
>>>>>
>>>>> Tested on SolidRun i.MX8DXL SoM with a scope, and confirmed that
>>>>> eMMC is still accessible after boot. eMMC extcsd has
>>>>> RST_N_FUNCTION=0x01, i.e.
>>>>> reset input enabled, Linux v5.15.
>>>>>
>>>>> Signed-off-by: Josua Mayer <josua@solid-run.com>
>>>>> ---
>>>>>  drivers/mmc/host/sdhci-esdhc-imx.c | 12 ++++++++++++
>>>>>  1 file changed, 12 insertions(+)
>>>>>
>>>>> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c
>>>>> b/drivers/mmc/host/sdhci-esdhc-imx.c
>>>>> index
>>>>> 8f0bc6dca2b0402fd2a0695903cf261a5b4e19dc..ebcfa427cca6cc2791
>>>>> a1701a3515ef6515779aa4 100644
>>>>> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
>>>>> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
>>>>> @@ -33,6 +33,8 @@
>>>>>  #define ESDHC_SYS_CTRL_DTOCV_MASK	0x0f
>>>>>  #define	ESDHC_CTRL_D3CD			0x08
>>>>>  #define ESDHC_BURST_LEN_EN_INCR		(1 << 27)
>>>>> +#define ESDHC_SYS_CTRL			0x2c
>>>>> +#define ESDHC_SYS_CTRL_IPP_RST_N	BIT(23)
>>>>>  /* VENDOR SPEC register */
>>>>>  #define ESDHC_VENDOR_SPEC		0xc0
>>>>>  #define  ESDHC_VENDOR_SPEC_SDIO_QUIRK	(1 << 1)
>>>>> @@ -1402,6 +1404,15 @@ static u32 esdhc_cqhci_irq(struct sdhci_host
>>>>> *host, u32 intmask)
>>>>>  	return 0;
>>>>>  }
>>>>>
>>>>> +static void esdhc_hw_reset(struct sdhci_host *host) {
>>>>> +	esdhc_clrset_le(host, ESDHC_SYS_CTRL_IPP_RST_N, 0,
>>>>> ESDHC_SYS_CTRL);
>>>>> +	udelay(10);
>>>>> +	esdhc_clrset_le(host, ESDHC_SYS_CTRL_IPP_RST_N,
>>>>> +			ESDHC_SYS_CTRL_IPP_RST_N,
>>>>> ESDHC_SYS_CTRL);
>>>>> +	udelay(300);
>>>> Please add a comment on why 10us or 300us? This is board related or
>>>> soc related or card related?
>>> Agree, please add comment and explain.
>>
>> They were copied from drivers/mmc/host/sunxi-mmc.c.
>>
>> I was hoping somebody knows or recognises these magic numbers.
>> They are intended to be generic across all eMMC (not SoC).
> 
> I check the eMMC spec, refer to JEDEC Standard No. 84-B51,  6.15.10 H/W Reset Operation, on page 159
> The min time for reset signal keep low is 1us, and then the min time for reset keep high is 200us. So your config should be okay, but please add commend for each delay.
> 
> Here is the example:
> /* the eMMC spec require mix 1us, here delay 10us */
> udelay(10);
> ...
> /* the eMMC spec require mix 200us, here delay 300us */
> udelay(300)

At least that one should use usleep_range() rather than udelay().

> 
> Best Regards
> Haibo Chen
> 
>>
>>
>> sincerely
>> Josua Mayer
>>
>>>
>>> Regards
>>> Haibo Chen
>>>> Thanks,
>>>> Peng.
>>>>
>>>>> +}
>>>>> +
>>>>>  static struct sdhci_ops sdhci_esdhc_ops = {
>>>>>  	.read_l = esdhc_readl_le,
>>>>>  	.read_w = esdhc_readw_le,
>>>>> @@ -1420,6 +1431,7 @@ static struct sdhci_ops sdhci_esdhc_ops = {
>>>>>  	.reset = esdhc_reset,
>>>>>  	.irq = esdhc_cqhci_irq,
>>>>>  	.dump_vendor_regs = esdhc_dump_debug_regs,
>>>>> +	.hw_reset = esdhc_hw_reset,
>>>>>  };
>>>>>
>>>>>  static const struct sdhci_pltfm_data sdhci_esdhc_imx_pdata = {
>>>>>
>>>>> ---
>>>>> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
>>>>> change-id: 20241027-imx-emmc-reset-7127d311174c
>>>>>
>>>>> Best regards,
>>>>> --
>>>>> Josua Mayer <josua@solid-run.com>
>>>>>


