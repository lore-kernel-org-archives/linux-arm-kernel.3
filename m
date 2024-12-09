Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AADE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gt6BiM0QgyBm6Yq6Z5iu8g08qp3vEHqvhnzyciWVbM=; b=dIJIKzBf3n45jNTHkF84mzYIiv
	/YJC0Yyb/FwXlq0MPh5qHCW1fSxUoiIR9VhVrMbGbQwx1frXqxzzjkcWGg3bXEWZc56UXl67P0bEe
	StJcI80RN0YVJiecpXMGoxe/1Lxg8wKyupbDw9E/WVYHNg24NHyvufsHhN09+Mbb89z3Jy/kx1kKy
	dV4IyJ5hJ86CvaYiezekedLrRkuwqJotCotW5yvKOA1W8kkmfyZG6t2yDHOAsd+24acwaRLNcCfk2
	7h1fdkcU3Xbtqvq9Kt0Ix53208zaJhPvL5MNo9aYl9/Z+D5MNguyFSi1BFpX9hiFVhk9dHx167h0Y
	plJ0BMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgRz-00000008WIa-0zn0;
	Mon, 09 Dec 2024 16:17:35 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgQv-00000008W7G-0kt0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:16:30 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9G4lW9012527;
	Mon, 9 Dec 2024 17:16:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	6gt6BiM0QgyBm6Yq6Z5iu8g08qp3vEHqvhnzyciWVbM=; b=wgaEos52tZiBCPeN
	i0JXCrahbIonwvPX8eIV4gJfwtv08sIWTHofWdwonth4MPkaBiXmNtnXi0JUg1ZN
	TY5//m6DHe3WEBYjkdKEh+749ssbGk5f0r6yDFw2IteVhuy1GloB3Qmeog33dVVM
	uk/zXnEv11L03lxZI/tAcPs52nSxt6ajCJ3U7FLMr3wi8X4XnDsqAqnZvNRfns3K
	iX7ofWljFic26qc/AduI1+e2IRdnbnJWNxEt+5emRnyehSZt+iHkvjthrSfP1Lst
	21ubya6dSX9gaTjYw56ZFLkGRGdjPKl8HS+nIqhVh01EBdYoH1yi4fcuOZGlT3Yn
	TuVebw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccc8rrd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 17:16:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B6BB340061;
	Mon,  9 Dec 2024 17:15:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E016A26D755;
	Mon,  9 Dec 2024 17:14:30 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Dec
 2024 17:14:30 +0100
Message-ID: <d38f2ea1-17c3-466c-9537-0a5e31a5225e@foss.st.com>
Date: Mon, 9 Dec 2024 17:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: add i2s support to stm32mp251
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241113082510.2354924-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241113082510.2354924-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_081629_513717_B38125F7 
X-CRM114-Status: GOOD (  11.41  )
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

Hi Olivier

On 11/13/24 09:25, Olivier Moysan wrote:
> Add I2S support to STM32MP25 SoCs.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 45 ++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 6fe12e3bd7dd..8cc0b64e6a16 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -237,6 +237,21 @@ rifsc: bus@42080000 {
>   			#access-controller-cells = <1>;

Applied on stm32-next.

Thanks!
Alex

