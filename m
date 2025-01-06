Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4956E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btkar9lW2qWD6xfk+/i4bskJnPD0JOAOTKhPpwxrwKA=; b=WJmoh1bGSNwnbKN44mGef9itJU
	9lHl/rRs1Sle5vnRySOc0MjLE3lGZvmWmJFUe+dkJVyIkpYizbIPc2bYjtJG/V8GqxBpR7CPjbGyw
	EgJQs+WqNuXRpJWmjOCxTJj8SBj6f1DsOCxysO66tMgnebQ9QmYJcZFTii65cZ/ri7I66423MkNwN
	2xkV84IPdv7TN9qPhcom+VWFqjjXLP6iiOG5QKwkzAgAl84hLTE1+wBVcNSxpTMKpWY16h0/nmBCi
	J2GLpwU3YjlPt6AXDi5bwO9H0zhi7NLc7DzK3Qc271fnpbkWGPDyUXzy6SXSxpkGaXVgV1qNLaqIV
	ulcj1ejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkae-00000000tud-16x1;
	Mon, 06 Jan 2025 10:44:08 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkYf-00000000tgm-1bUH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 10:42:06 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5063qaLB004709;
	Mon, 6 Jan 2025 11:41:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	btkar9lW2qWD6xfk+/i4bskJnPD0JOAOTKhPpwxrwKA=; b=6sTyJMOLsqffMKWj
	v9GGlvavKkwZos3+6Q3ybRgCTg4rB4Ewp3o2BOQ5SRkQAr2iBv9dscAIDfmclvZa
	x0RhjGqFX6Vam8dZYEojWFM0MSsMWYyq2tt9Ipd8sFiFrReDNStuJPLBaRCJPKCy
	O0ZOAI4G5Tg+jPPGBaj8/EugKwPHe0CjwXI6f41wzhlNYY7ehfsgzpfzN7gIz6Qn
	+Jl2NotBapAilT2/d1WYyLZWcaVkRygaavfNrOMy2lCw8BZKDCb+OPkBIYHHf55t
	RxDDZgMFmp2AWmzI4CaPYI3WcFpXRLiC6VmVNYFwVyp0mMDeblwGJANmIODmkZOj
	EZmtEA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4407n9hajf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 11:41:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B36FA40048;
	Mon,  6 Jan 2025 11:40:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C51E126E736;
	Mon,  6 Jan 2025 11:39:34 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 11:39:33 +0100
Message-ID: <9c6a316b-10bd-4ed0-b925-babf84b125e5@foss.st.com>
Date: Mon, 6 Jan 2025 11:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: st: enable the MALI gpu on the
 stih410-b2260
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
 <20241006-sti-gpu-v2-3-c6bb408d6903@me.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20241006-sti-gpu-v2-3-c6bb408d6903@me.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_024205_722707_D2B7C36E 
X-CRM114-Status: GOOD (  13.72  )
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
> Enable the GPU on the stih410-b2260 board.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---
>  arch/arm/boot/dts/st/stih410-b2260.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stih410-b2260.dts b/arch/arm/boot/dts/st/stih410-b2260.dts
> index 240b62040000b8c0357d39504d3475186958bf31..736b1e059b0a8f122d1b824e1f4e5db0a668ec2c 100644
> --- a/arch/arm/boot/dts/st/stih410-b2260.dts
> +++ b/arch/arm/boot/dts/st/stih410-b2260.dts
> @@ -206,5 +206,9 @@ hdmiddc: i2c@9541000 {
>  		sata1: sata@9b28000 {
>  			status = "okay";
>  		};
> +
> +		gpu: gpu@9f00000 {
> +			status = "okay";
> +		};
>  	};
>  };
> 

Hi Alain

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks

