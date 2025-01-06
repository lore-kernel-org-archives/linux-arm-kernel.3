Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD2CE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y33tiExBlwDEn8mFRQKrikauQkd7GqHJ6b8DdCrX10c=; b=N9xIRRsQfcGoagxI7PczPI+A9X
	/Xj9jfmx5JanuDCjSGfIaritTJCbuQ6ZV+8+FQxILpwsM+72/LhF3ngy3o6jmcDRAaeeDZ9lgiE+G
	srT6r/u6YlFeu5CYPoNTDSupBV70EMkuvLv/4rM/aqg8QRUiMaunW9hwRcxMaDbSJys0rLMEDSQOR
	JiWFi4ySVGPsX9yliStvBN+6X0fNm+zl2PX4SEpcg2Ekf88v4ZAVJcwvgYoFnNbVKJNYQgx54DIv1
	vmVm26WYQbdHzaOMTlknGxSytdfldbj4PKkfqf0Y7XLtrJXSmJqVqGNmQ5bIXXq52HUJ3n+tNt4b9
	BVhLV/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkhv-00000000vXZ-17cm;
	Mon, 06 Jan 2025 10:51:39 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkgj-00000000vKH-3m6C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 10:50:27 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5063qXc9004692;
	Mon, 6 Jan 2025 11:50:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Y33tiExBlwDEn8mFRQKrikauQkd7GqHJ6b8DdCrX10c=; b=3AaR3hKqYSQuzj/l
	w3mE0WivaZBjUvTH/hzSnqda0W03W/82+RdH66suEIjYOhiPwZq67u6MwHP7tMgu
	Kz6huLA1i+htrTcTQc/yOrg4yXfA45zJ3Tqc+xn9i/Eoy0Ryi5kFNB+71lEmBL+6
	85WDWATAGOar0UmFGPswKtzti0l+g2xZZHBYBc1rL93YHLDDH8snF2d5dZN8LvUm
	LX9st5YZcr0tSKf8XwdiaHLhyiAplKNvyt+IbwhRTOGApiLdy11+Izk+hVQOofiV
	xW4g6iD9H8kakSGEXzH3Nmj3Va6tqTkkaYLBXm80/n7uGqVNWFXEDNKRhuouVjXF
	HLjRfQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4407n9hbgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 11:50:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F39F34005A;
	Mon,  6 Jan 2025 11:48:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B948D26E53D;
	Mon,  6 Jan 2025 11:47:09 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 11:47:08 +0100
Message-ID: <d844f8f2-b5fd-460f-b31b-644bab871238@foss.st.com>
Date: Mon, 6 Jan 2025 11:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: mali-utgard: Add st,stih410-mali
 compatible
To: Alain Volmat <avolmat@me.com>, David Airlie <airlied@gmail.com>,
        Daniel
 Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241006-sti-gpu-v2-0-c6bb408d6903@me.com>
 <20241006-sti-gpu-v2-1-c6bb408d6903@me.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20241006-sti-gpu-v2-1-c6bb408d6903@me.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_025026_236798_13204A6C 
X-CRM114-Status: GOOD (  12.50  )
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



On 10/6/24 22:42, Alain Volmat wrote:
> ST STiH410 SoC has a Mali400. Add a compatible for it.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> index abd4aa335fbcebafc9164bd4963f9db60f0450c4..9318817ea1357d4d66db951513d9bc033b222190 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> @@ -33,6 +33,7 @@ properties:
>                - rockchip,rk3188-mali
>                - rockchip,rk3228-mali
>                - samsung,exynos4210-mali
> +              - st,stih410-mali
>                - stericsson,db8500-mali
>                - xlnx,zynqmp-mali
>            - const: arm,mali-400
> 

Hi Alain

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks

