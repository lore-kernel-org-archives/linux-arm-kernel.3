Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F73C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0SAnZAH2PKj7cb/0hXi/Kyprc2Be+WMsrPDKWn/x7A=; b=QisVv4+6OiDsHNLzo+yStUX2PT
	CpPzP6Rlj5lOQtYi+vQDM0vf9MpHh5PmBMjSxthaeuKpw0hT2X4dgacL5Ih2uqSWRGjttV+hCfXnS
	b33MnmdUK9sRz63WftfuDMPfcokrx+JglAGHm9sb45E8KPg4zOz6fxPR2k5+mIp1+fxmXHbjjhPvR
	i7y3jtUOrP1qmMOs/+gQZHNcrkY9mun+iChzb24LW8aYGWTneKqN5pFiABRI1gZCD/88D98/bV6Ha
	DqHZncw4OqPQh79CDBtpJ6JZTvJITH+XrAUrlP2O6+BSuBqj7x77m+3qn0232AqTMAW93dNNjhIXc
	N5OOfSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fce-00000007jqD-3lkQ;
	Tue, 22 Apr 2025 15:33:20 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EPL-00000007SA8-3wwZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:15:33 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEFKDv1228983
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745331320;
	bh=j0SAnZAH2PKj7cb/0hXi/Kyprc2Be+WMsrPDKWn/x7A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TvIJTVsqkrkkNLj7//lyC8+vb40grO6v6HqLC5hvxhqBug8tqgS41uNe3Zdd+NE8l
	 OjZ9OvUwCtFRTlpeJJ4LB/VNpiolKl7tGWNqTxRNbfyD8gcH2TxIcF/8F35XIm7U0R
	 tqUiCVXi8yGLHETUbjFKPgF6+EJ812mB7GxOIfgI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEFJZu085202
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 09:15:19 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 09:15:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 09:15:18 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MEFIx0119691;
	Tue, 22 Apr 2025 09:15:18 -0500
Message-ID: <54b6880a-bf65-4a79-8f3e-9fa66b6c3550@ti.com>
Date: Tue, 22 Apr 2025 09:15:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable hwspinlock and eQEP for K3
To: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <lumag@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250421201055.3889680-1-jm@ti.com>
 <55d306d4-c9cd-4119-8798-b65a6956f4df@app.fastmail.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <55d306d4-c9cd-4119-8798-b65a6956f4df@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_071532_084630_D5B65156 
X-CRM114-Status: GOOD (  17.02  )
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

Hi Arnd,

On 4/22/25 1:37 AM, Arnd Bergmann wrote:
> On Mon, Apr 21, 2025, at 22:10, Judith Mendez wrote:
>> Enable CONFIG_HWSPINLOCK_OMAP to allow usage of these devices
>> across K3 SoC's. Also enable CONFIG_TI_EQEP which is enabled by
>> default on am64x SK board.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> The patch seems fine to me, but you should address it at the
> TI K3 maintainers, so they know they should apply it and forward
> it to the SoC tree. You have Nishanth and Vignesh in Cc already,
> so I assume they will pick it up from here, just put them in
> 'To' instead next time and move Catalin and Will to 'Cc' or
> leave them off entirely.
> 

Will re-spin and fix the to and cc lists, thanks for reviewing!

~ Judith

>> ---
>>   arch/arm64/configs/defconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 9e16b494ab0e2..1f7b97ff46a7e 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1415,6 +1415,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
>>   CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
>>   CONFIG_CLK_RENESAS_VBATTB=m
>>   CONFIG_HWSPINLOCK=y
>> +CONFIG_HWSPINLOCK_OMAP=m
>>   CONFIG_HWSPINLOCK_QCOM=y
>>   CONFIG_TEGRA186_TIMER=y
>>   CONFIG_RENESAS_OSTM=y
>> @@ -1676,6 +1677,7 @@ CONFIG_INTERCONNECT_QCOM_SM8650=y
>>   CONFIG_INTERCONNECT_QCOM_SM8750=y
>>   CONFIG_INTERCONNECT_QCOM_X1E80100=y
>>   CONFIG_COUNTER=m
>> +CONFIG_TI_EQEP=m
>>   CONFIG_RZ_MTU3_CNT=m
>>   CONFIG_HTE=y
>>   CONFIG_HTE_TEGRA194=y
>> -- 
>> 2.49.0


