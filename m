Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74044CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMhkGFekCaaDNI8Y6IA3kIgQFx/LhDxMuNSn8eII840=; b=TULVNalUN6ShA4IZ31e9ktbbjI
	Sv1YxYhVhGj6bOCdN/fsOxcXGENY2s7E3Y6C0oDaB/WszrvV/hkLcLPEzZ1NBKxrIrxS8Qps7yFd/
	IcUfcyJVykqsKuDUb/YSBrB/lfx/UCKU9SIjqXroT49qg0yJ6WGvONHOdKaPRb0VU31vTxOK00btz
	nH9UxAVTuzqB7r6If9QZPJo0zTF1TKetDEhVB2t/rjht7cd2b/lVF4OhUTHtlPvkj9yhn87M0od2T
	w0R5I5WiS6Ox7a9GqWpq/xvJtQauoGNkdKB/gRfZxtjY78NGGGBhTuurTQkPAFjKO+XZSZhDNFmIU
	MdyThWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwqE-0000000AXNk-0LNA;
	Fri, 12 Jun 2026 08:02:14 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwqB-0000000AXN0-0Pbh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:02:13 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3967701fc3cso343431fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251329; x=1781856129; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMhkGFekCaaDNI8Y6IA3kIgQFx/LhDxMuNSn8eII840=;
        b=GSnDaciLpkMyYpb30563IkKVheKSunxjv6r+UnMl8crT5wlomFq7RtSv3FU8loxpRM
         o3nRsEWiNCWCSmHoqszcxkhoz9f0IlIg/qDO+MDPN9W01RSivea+XDbXoc8euKrwQCbQ
         xTimGkRzescJDdFWgzMQ3HiAYPqrQ8fqPfUIQKElNjBtD6/zISNE6N3T/zqk6CR/6enr
         QmYIR7TZUC2m8qIkeDsuOI8otdptPL7PduRwz2qw+pNZCn58oI+B3c6vcIW8B8cl9V0g
         bSfgGcOJNbgTsY8QrOvENtx7h7ty5qMNzBgqhiM1F5SmZb/pR9FwP5hFTI0zQYiw51Mt
         VLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251329; x=1781856129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMhkGFekCaaDNI8Y6IA3kIgQFx/LhDxMuNSn8eII840=;
        b=VtRXUmMTVpCcj4QYRXj9Qyck/om04sq0iD5nq3VrltPSbkFGjDiP8D5z1wt7w0qrVc
         OzMRx/kutM2FTqWKWYY+KzkDRVF5WxT1mGis4XQR9PbCDisbToKxWh3Mv8lrQtTbrIPw
         IThmdZiJUsENbfziMVgIwX7K97ysFy/mHCkMLji/7Az0aBfVwsHBeXf1pWp3UU3U46vt
         /z/JwC5eZZ2YDarjzudKjRo9+Yf4X10KA2RxGTcFBfP06z2ALyrYkuTyuyjlcRyzfcOE
         gTxZ5mYW5I+y/r8xMeSQtv3Or4RX+JhYFftp4oXyWqhlZKiPTTYkOiSM26pvYmL0Xhna
         XfHA==
X-Forwarded-Encrypted: i=1; AFNElJ+N69k8JntduR1uHQBLU2FHVtPKQMQ2f5DTqAS2fWBbR/Cws7ABw5fu1LwjESFamAMO9xUw2QL4MI0inX9/3Cfc@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp1gGFBjMdEVF7iIvQRr5MuS3EvaQCtpX9Nj6XWl5cqPDVLHQa
	VkSKAo3NS3PFW2xncJiM37RGsJOoyUp49gC5e3CqbQXdISuJ3XxsJStmfekOsMbiQVg=
X-Gm-Gg: Acq92OEA7zG3A114MmbDFJGoKm1n+WWFHVBSh8wXabXnTj1Rxr87OiQnCh3nrAcEg7T
	pU+8CWdYkrz27K0xdgLXQo/BcjZYGYJfDR61FsXd+Abq6qkMpIdvW17iQ2IkWkZ2X/E2ouYW44V
	2k5QOY26pAQ6iE7tI03ytHAWMXItVebX2H7BXtZLzwrHbSICqfFHOOJ30n3hJqr14HjNcEiOnY/
	SqjUF/VFBS4w+DuQ8xzWk+cQaSgcxYtM63MVKvNka0xelOlZhkZsl1ODT2QNL0K+EggNRUdyW1+
	pnnt3jS+NyIoZjtvxzD5ouijrrsrBAFnRn/AA/naxXpHabA/Zb5Pgch2T1N6eHvUgthGG37BB5d
	3N4Pjmo34DjQn8v3pWvBgDYC5akgcZedLPg97S1qB+Vl1aGVhQML8AxGSsxR5pd5Qb544Ap40e3
	jVBgfsOliFpCmEqG5m2PrM02qInSbXzIsZWmsspCloRAHv0AjhunoSfojViGjSBc/NeSxQzfI3k
	0+myILhth8jebm0
X-Received: by 2002:a05:6512:3e0a:b0:5a8:bd9c:a2e1 with SMTP id 2adb3069b0e04-5ad2db2fa46mr249662e87.2.1781251328767;
        Fri, 12 Jun 2026 01:02:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e17014fsm324975e87.28.2026.06.12.01.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:02:07 -0700 (PDT)
Message-ID: <b3a6798f-a7ea-40c9-a9b6-3aaba57c8ce2@linaro.org>
Date: Fri, 12 Jun 2026 11:02:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: shikra: Add pin configuration
 for mclks
Content-Language: ru-RU
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-5-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-5-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_010211_379603_1F181AB2 
X-CRM114-Status: GOOD (  12.85  )
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

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index fed71131491ebf6e261bfcd14b5d4a2624837878..2f0f7710c2897e140495afd8d4e8bde50f356096 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
>   				bias-pull-down;
>   			};
>   
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio34";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio35";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio96";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk3_default: cam-mclk3-default-state {
> +				pins = "gpio98";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			qup_uart0_default: qup-uart0-default-state {
>   				pins = "gpio0", "gpio1";
>   				function = "qup0_se0";
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

