Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F872CD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 18:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/SPZpX2kxTAUi5Y+kkH45w7LW+kUEovdQcoR2rE+ic=; b=db0iMAhUjvBruyUpF/i1N4VHnP
	jV37ZEwoDdCYQpgd8Jhyftdk62g53zG5+eQLzZtkE0ZqGQJ3mFCs/q3lGijp/W8jVkcyLDT1vQ2gr
	PYZ9p+x+m7dBXwi4cdKqAsCEVrXOqkKSeij5MCvilAoDXzplu3hVLW4U9Nl5HBY3wmcyS8mzELMHf
	wgE8VvW2B//YS+VavRz+29J9za+0cCEByWjqi1hyZJxxdwslUcQ58FiD8rxXaN1QeKe6PW2Om1Op6
	FdoFs9vEdLyhW10Q+I1BG0Fmn2g+p9NUcOqcFPSFWakyY2vdfCwGFaQKdk/lr+XQXcIL8wi+XsODk
	vgVS32WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP33C-0000000Gbvl-1kEu;
	Mon, 18 May 2026 18:50:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP33A-0000000Gbv6-1HEb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 18:50:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IDUaQ82891887
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 18:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h/SPZpX2kxTAUi5Y+kkH45w7LW+kUEovdQcoR2rE+ic=; b=hfCil12sybDGxC87
	Syyx6rLB01+b/k1NXqfOSmvWaHhsdDZfmecjGMedMBvZblK7WyRjn85e1JDCcN+T
	2Ua1Tf2RuzKrAuFmVW368w+/On6JyDjA9frsPfDekBQ2dN9KooeOW+BOS7e7nthT
	18z/zx/DC9+knWTFwuUDC+LBJ0VZEDjnKfRjeq4m2b6Gd1oaCrowTKTbkqWsI82k
	wUfA9YH/o7Az3rJOc68pkcZ1HntebXUZ0OqCdrA0ANyCvBcAQOsBP09FAuP7nv2R
	nlaHMCqzjXrUTSTmmQsowz0wxmtH2rgUm7e39VUCccYYGoheHvCvezrvP/b2RaIh
	uPu/5w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1ap62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 18:50:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f13da9684so33083371cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 11:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779130247; x=1779735047; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h/SPZpX2kxTAUi5Y+kkH45w7LW+kUEovdQcoR2rE+ic=;
        b=Mgk1IU9M5OYb+t+/vVlD3P69TRHnWEMc3jSJLLS+SQT1h1VY8SHTEOJ6CE/I+J2lZq
         jObrWISYn/gjCR7d/ua7L2CEw8EcMxqExof//wc/xaGE9Xkb0ow2tCAcpLuVIuFzWL/C
         QmttKHghiqCuIJT/gY3G+dN3BcjBZqsXGvdB3WPkIr7Kp2Zaa5bFAZciGEUcLn1kGsBp
         Ku83rjCPM2onj+c4wtq5FLnqDStZhmBJ3QMwUJNTtJMkBIoJdrVx5rit6anzhM5GBWsT
         QUixSHN3e8s8O7eZhclFX5sxb5bmaTScBtNm2Pgt8ran0uypDAGPTtViIiU+y9Ol4I/Y
         n5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130247; x=1779735047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/SPZpX2kxTAUi5Y+kkH45w7LW+kUEovdQcoR2rE+ic=;
        b=sH9rPrYeJctEQcueb9LFDYDlu9tAw/wo2GUTcRvd9egCHNh6Sw4WOnsToXAqOOy/we
         2KWg8rJ0oKC82H8yT325E0AurjCfluxrwJpCrfDcQUUNG6zWkfcCK0swpTnNPfdGVerE
         4FjJnR1VoR/vjQwry2Cb4YPbpBfb1I8e0G0klpZ8KsGVnkgXq38+Xc4Xd0zDWHt4KdrS
         Hvswj8BLkcY/aMbChBZ2xrhW8VaWkEDha7hdlbGqSWwm62FOsXajsCcGl3X7iQjph6wT
         KwjA+3raWe+qG/pk79gIyH0l+wJ5eh6BuUt4FPjT6J+mr5Z5F9QAgAvBDwthZsxry68O
         +YFA==
X-Forwarded-Encrypted: i=1; AFNElJ/wD0dNcFHOB+uGxOFlpoLtmaSuF0u0oWafV4mYwbXmQEjCLQ4h8HAmUZpdpJExnT1PXFFaTyyq/e4jsW0n4NEx@lists.infradead.org
X-Gm-Message-State: AOJu0YwF0Z7XpK02skZpE3lCqehmzoGNKOFTX7K9UZUTmj8uGrAy8kV4
	B66vT4kFS1jvN9XWYx5izJpdl+zBCvf0YX54LL/1u1cLppFX1nNyUeHqjH7e+zhRnicypI+TVaK
	NUzQg7nGhyieHkllzuhJ6umql9f9L4lnYxZm/awvYxkdlaFnGEbHxXiwrVj6uMrgaMk56wiXlKt
	+klw==
X-Gm-Gg: Acq92OH2ZyiONyauLJvX+Svtpxo5F0AdmOu247QOwlqPbRJimHTtUlCj1E1QfTv9Odf
	F2V4Tv0jdCR381wjf9H6ew983CjkYd3j2yL5J6/FsEMrlWEot++E5+ovpUuyew5s+If32VKc+cj
	JCmkHZH3zYSB/dufNlibkWuq4FzxcOAE3gunY3Cz1656UkYbZoLBfni0vs4L51DoccEFmd7d2y1
	YM3GPy5RCdcX7SwKSWVhCs5q0LU/8aBPHIrjI1p1f478YuBaezU8qAyg8momHnWUe8zoQuFaMFH
	Xoy63jilYOwgB6FlrXJl/Jzt2t/3aoQG6fBbn1+Hl6F/aNeGEmc0JXSv03zEx4IKt+QjRYBbmZO
	o9X14/DX8l8r/rQxw24NLkLYzcv5NyqZ5uRS1udMszlCl9JKfYWqbGVPnSzeYB9r8St5lJRhFS4
	Trnpd3AtrO
X-Received: by 2002:ac8:5c92:0:b0:50b:4755:94b9 with SMTP id d75a77b69052e-5165a2963e5mr226585431cf.56.1779130246591;
        Mon, 18 May 2026 11:50:46 -0700 (PDT)
X-Received: by 2002:ac8:5c92:0:b0:50b:4755:94b9 with SMTP id d75a77b69052e-5165a2963e5mr226584941cf.56.1779130246116;
        Mon, 18 May 2026 11:50:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e390:12f5:ed3c:ffd9? ([2a05:6e02:1041:c10:e390:12f5:ed3c:ffd9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm36447611f8f.11.2026.05.18.11.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 11:50:45 -0700 (PDT)
Message-ID: <e748de00-f2d8-4daa-8716-629e7c683911@oss.qualcomm.com>
Date: Mon, 18 May 2026 20:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Update the thermal support for imx93
To: Jacky Bai <ping.bai@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Frank Li <Frank.Li@nxp.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Alice Guo <alice.guo@nxp.com>
References: <20260430-imx93_tmu-v6-0-485459d7b54f@nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260430-imx93_tmu-v6-0-485459d7b54f@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _gbr7ZuWUPO0YBwxbyvuMO6ILWjybnxr
X-Proofpoint-ORIG-GUID: _gbr7ZuWUPO0YBwxbyvuMO6ILWjybnxr
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0b5f87 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=8AirrxEcAAAA:8 a=IGtpPHPLznOUk2rqc38A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4NSBTYWx0ZWRfX/Ddt2HSz2gIl
 3IyGtoQqvRhBMEcCklX0JV9Ggoa74tCAbb6cunMjOVNR7DuqV0q8x5ZL6/+Feb8yXMChOyOZcmP
 L7WH1cXcK35X/ciD0EH9oqQZz0ssfpZgadSZeu5hK9/l6DyqFkape17q1EoTbxofZhpDYRJiNT1
 llNHRv7hWSSajusUNgUWPM/JUwuPAa65Rc2wHzEOIg9ogGfa9Gep4YW28R0qsJPFrljm7Auw/UN
 thfr+IIKuhuH8x4rrXQAksQKO1Jb6mm/rgq0xbEXFj0YMv7n6yHtO3XlI9kr3/xavujToIvF1rK
 zSy+do2cipn6GFYw/dIfl5F8HmdYBhS4ibvO2VOspN9xuntKJwW5gkfpcgLvDpAAM+Pd7R5Qdyz
 MQAN7lXa32z96Ebo2jE2Z0trxCh3LIlMW8f8lk/r8uvRKwtsicG6fhKf/rd68/zgQH/5HtO0LGM
 4tRUPq38YRURFa9KH8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_115048_355035_DFC259D7 
X-CRM114-Status: GOOD (  15.26  )
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

On 4/30/26 04:53, Jacky Bai wrote:
> The TMU (Thermal Monitoring Unit) on the i.MX93 requires specific
> configurations and workarounds that differ from previous implementations.
> So, using the 'fsl,qoriq-tmu' compatible string is not appropriate.
> To address this, a dedicated compatible string and corresponding driver
> changes need to be introduced to properly support the i.MX93 TMU.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
> Changes in v6:
> - Drop the unnecessary local variable
> - Drop the first errata check in get_temp function
> - Link to v5: https://lore.kernel.org/r/20260421-imx93_tmu-v5-0-05ea1969bb9f@nxp.com
> 
> Changes in v5:
> - Drop the unnecessary macro defines in patch 2/3
> - Add the drvdata info for each of the platform as suggested by Daniel
> - Link to v4: https://lore.kernel.org/r/20250821-imx93_tmu-v4-0-6cf5688bf016@nxp.com
> 
> Changes in v4:
> - Include bitfield.h to fix the build error for RISC-V
> - Use macro to define temp rate threshold related settings
> - Link to v3: https://lore.kernel.org/r/20250818-imx93_tmu-v3-0-35f79a86c072@nxp.com
> 
> ---

Applied patches 1,2 & 3

Thanks


