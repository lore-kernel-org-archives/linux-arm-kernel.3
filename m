Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263FDC3600E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 10:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgcK61C1ClW+Bsv+nkLDe43OxgHSNo7fk3rpTcQgFK8=; b=fnDkjU7z1MjG61dO0o+oRYv0Pa
	ZhmofH8myCetYtV5+28mkDXR9d3FTkmtOerdQ+iAbrjqLM0mkJTKTRF6W61wBszHtALR7FgG5dI3l
	9rHE3gxz9u65TGTrOnAO2wTs993wlhlicR9bdvPwISP5Pw6fmlzhV6XfVD25Qc/cn76dAfhg8sGnn
	LVuc0eBbJ6Gp/MmMGNT+9LCi//UeKns++km5RHCbxY+ZmeC1hQqULSAcQyp+dcF1N+DZhuBaFBIbN
	5i4cF6H4k2WataTqLLnyH6SP6C95mCOPZT0EwGBxFdUdyWseayn2ZxnDOwqHBMrt2tzIV8XMywueX
	8CSNYBeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tweys-00000002oMF-1KcV;
	Mon, 24 Mar 2025 10:24:30 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twevm-00000002nrF-42iZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 10:21:20 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O7ilKu011526;
	Mon, 24 Mar 2025 11:21:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	VgcK61C1ClW+Bsv+nkLDe43OxgHSNo7fk3rpTcQgFK8=; b=XdTQiGyNpFJcJ7Yz
	4ms/Nfk+xdVzp//FaxZbXEnnZlCWPLaMUALtg+cNzN1CFTwz5Aad33+EEUWSjJfT
	i0Bc5Qdo9DQmkk1Y2Z7Xh2CQ2Hj8ePd7NFad5mlw4wc/u6NCeWpOuyicdiPrA/Li
	6LjfyNBHNrMcpX38nb33bNf0Hs97xU9PbqmfHaSN0iNiGM3zMiJKITo37bGKytwl
	0sW4leqlqZQF0R57dPQTBPzFAvyn4UDKTczlBiW7HAJ86cf9NJ30AvueWDApCTR/
	z4tY9Nku9xrIBUiJ3gjyx1t/A3ZA30OkLvCUUyN61k3+wybe8uYsUnPgVVj4NkYc
	svyLpQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45hkgr78c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 11:21:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4E7114004A;
	Mon, 24 Mar 2025 11:20:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 359C580B78C;
	Mon, 24 Mar 2025 11:19:07 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Mar
 2025 11:19:06 +0100
Message-ID: <b99576c5-cc9f-455a-aa58-ce5a0489a5a9@foss.st.com>
Date: Mon, 24 Mar 2025 11:19:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] spi: dt-bindings: st,stm32mp25-ospi: Make "resets" a
 required property
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <christophe.kerello@foss.st.com>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250321-upstream_ospi_required_resets-v1-0-9aa4702e3ae2@foss.st.com>
 <20250321-upstream_ospi_required_resets-v1-1-9aa4702e3ae2@foss.st.com>
 <688c619d-0e20-496a-ae24-d62ab34f93ab@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <688c619d-0e20-496a-ae24-d62ab34f93ab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_032119_299666_8379805D 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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



On 3/21/25 11:13, Krzysztof Kozlowski wrote:
> On 21/03/2025 10:44, Patrice Chotard wrote:
>> Make "resets" a required property.
> 
> Please explain why. This is technically an ABI break, so you please
> provide explanation what sort of issue is being fixed.

Hi

Right, i will add more details

Thanks
Patrice

> 
>>
>> Fixes: bed97e35786a ("dt-bindings: spi: Add STM32 OSPI controller")
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml | 1 +
>>  1 file changed, 1 insertion(+)
> 
> 
> Best regards,
> Krzysztof

