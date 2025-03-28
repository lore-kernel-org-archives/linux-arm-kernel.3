Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB69C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzHzTCgsYvR0knstWtXnq/fUHYTmf/QEn7nWUuuZZXs=; b=lGBWEzDCAmzkfZPiVLLK55vZjb
	1MGdSsv+mhXwwP5vtVQCUsaro/XnQBeQDZnfHnyPyKFl95OPPECY+t1YTaVGV/nRxm6zmUYH04LWo
	DSoxhxaqlrIHEs10FRn5MavKIyFD+2DE7nh/FcWGj0DyF18agSjhO/WzyuxdbfrXbd5GVpDDIMFXB
	hnMxc2MXkTU28MgndE0w7OaK610lT6/dtu/aLaHVb7D9L3xZikr2llIQoalpIBBhk7ajwhxS/kPgM
	FvH8bid3Ovm+ZBFil8RsA78d3GA28P9PmLjQ51RXJ/N9MxLEfDpigMjhuSuhqG71C/nqsHvpIIxhC
	hqz4xj6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty7Ts-0000000DCBw-0BBP;
	Fri, 28 Mar 2025 11:02:32 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty7Qc-0000000DBct-2VVo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 10:59:12 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S9Grai015797;
	Fri, 28 Mar 2025 11:58:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	EzHzTCgsYvR0knstWtXnq/fUHYTmf/QEn7nWUuuZZXs=; b=FRrfQ/96DFmzUkc/
	KKtAdxsc8kocIb0gx5yVhoZYpVkJaf7e0c1I0vOH0ZhPE5s/5BIGULV5gR+SexNF
	WMHSDAiNOrxxkMeiWYQYr2ZQTtNgfD2nlZYlEZf/Yp/Tqs7lFCmQnaI///rBV/5+
	Educe7Tz5lRRcSVdbUZdBsoaPWv4JKEjVHZCC05yOCF8d6c8DowDVmhKHO9oTGjJ
	QvtTbrUcQN5M5xK1VaYP8JvtKDMiJUPp91ZxEGXXxatPDQ1typFb7POHumxwozAT
	a4UdoplXzABff8pIYfAOgUYAtQ9eqM1rk8jCfZCaGtojOEbBXu0KYP5j7CHICfHm
	+oE/9g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45nq0b1511-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 11:58:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F1EE14004F;
	Fri, 28 Mar 2025 11:57:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B835B87D247;
	Fri, 28 Mar 2025 11:54:56 +0100 (CET)
Received: from [10.252.9.227] (10.252.9.227) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 11:54:55 +0100
Message-ID: <537f2dbd-7b94-4e2c-8a81-fdac10481413@foss.st.com>
Date: Fri, 28 Mar 2025 11:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: media: st,stmipid02: correct
 lane-polarities maxItems
To: Alain Volmat <alain.volmat@foss.st.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <stable@vger.kernel.org>
References: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
 <20250210-6-14-stm32-media-fixes-v1-2-c64ebe9af8bb@foss.st.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250210-6-14-stm32-media-fixes-v1-2-c64ebe9af8bb@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.9.227]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_035910_925484_3882A44F 
X-CRM114-Status: GOOD (  14.54  )
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

Hi Alain,

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

Thank you.

On 2/10/25 11:04, Alain Volmat wrote:
> The MIPID02 can use up to 2 data lanes which leads to having a maximum
> item number of 3 for the lane-polarities since this also contains the
> clock lane.
> 
> CC: stable@vger.kernel.org
> Fixes: c2741cbe7f8a ("dt-bindings: media: st,stmipid02: Convert the text bindings to YAML")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> index b68141264c0e9fe0e530ce3b06fa3434fa712b38..4d40e75b4e1efff673647dff7bf984c89abca4cf 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> @@ -71,7 +71,7 @@ properties:
>                  description:
>                    Any lane can be inverted or not.
>                  minItems: 1
> -                maxItems: 2
> +                maxItems: 3
>  
>              required:
>                - data-lanes
> 

-- 
Regards,
Benjamin

