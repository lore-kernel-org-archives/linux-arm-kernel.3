Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D6BCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 07:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xahJWVIETX5BgulbVmZ+wNN4Sel4PSrkSaX8qRSlVNo=; b=CUz4aVxsYNuvvbiavQULymUrCu
	yg6cQIIs7qCpPiefoFQdbToAcG6Q5rmuFrAvAe6fOuNBE3VOyavWiaahfdnnrROxqnsUBKyHGW8lq
	ehihjahsa6284QSN5xpwzZPR0gB22U6ipl5R1BbJl6o7H+OY/rds6sS5gVZtI4wT1gYNIdjDHcaPQ
	rkL63ptWGaAbJI1f6nFYBNkc+79S8R3USNcRE5xMLJSCIlJGoNHFpuJy59tRbzeRQgENNqiCO5Zip
	gPtxzPpaGUsw4DFZ0Zg6u5bHb7JdipxvFjJ5SGqg6kJMoTfdhfX6z2f6+hm5lwp7JrRllK+vKVYXR
	Tw4ayDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22os-0000000GkZX-1e4f;
	Fri, 26 Sep 2025 07:24:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22op-0000000GkY2-3mxq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 07:24:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q73c2n007834
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xahJWVIETX5BgulbVmZ+wNN4Sel4PSrkSaX8qRSlVNo=; b=DzaNUATVlO1Gg7R7
	FrvPqSJJIGWbwHp+bb3iIjTSqI28zM5DONHQJWFuNRPeWeAGKgq+Ejof3czeF3Wz
	AShaUdVw4iggr2N7363Ps1yU11M1y+B2UuEkC3YEYn+4xJwkEM6CsIXIjinRGCNC
	qRnkb5zKtMegdDELXBEasVDZWRw5rK0X0SEAsSy9cwejgdkOEota6ULJ80NbK60d
	5oL40vw6MakX0YR5+FBGormVagK3lCUZWGsx6RmgbWuqFgOKfw1gWnlkHeOuZ4ZW
	+GMoUjkkTWaWmIU6OurCgXr8hZ8Js4MzlUP635Ef959hpNHahQTdRYizbwMt+TQf
	oS1KMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0vsvjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:24:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-277f0ea6ee6so23497215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 00:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871477; x=1759476277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xahJWVIETX5BgulbVmZ+wNN4Sel4PSrkSaX8qRSlVNo=;
        b=uO84rqP+yuRbPGLorfTCm4CTIqE4XLAs0EheUKCZcYD0oOfNx3n6WQJWZD+DCprZ+J
         8/3ooBQWuN3g2vzk8/IjlRe0BUS46NxTSIKovw1STVi7KION/pk22ycv8d1mYj1gyP8e
         avGERBFLFiyzVb/5QFSSPsszgQP6a9auw9jmJtayZZS6xq0vGWVA7hDY09QMyXqUYFxH
         xS1SPotmrSiuv/qM0SSbgkLhBdmWVkAIPrsVJ/m9A+xk6Ea/utc/aLBxJgx3zsDI4yUX
         5dmvLSu6KtoQFt3yaXNUw0Kg85ElrOXenQBZCaa+ILB30gt9jvD5wewCzXA8LzO5URmb
         yVsA==
X-Forwarded-Encrypted: i=1; AJvYcCUrVR3ORRIt247pSkaUQMx1KBPE2+d2M4neBoeT6N5SS6ebmRbVfB9atfuNgVVZ2n87Ioeuna8KfePAw/VoToSR@lists.infradead.org
X-Gm-Message-State: AOJu0YyuAQsU4a+hfEXW0ngrPsH/HseRr2ouNtRkzMLJ+MF0W8XOu/rC
	5MHegC8HzspBlw15roQpUuAL3gcD3aUfaMeJBLlHqEGivImwQ5U+vsIxGKT3oDPvADjtSYzeDNX
	twZ5E5q164ZoQhXkCsmB1CR6211CC7/t4u/EEyJ8Z0+qo+k1O71/kPesWKTxK99ydhf8xzxdaz2
	oFkQ==
X-Gm-Gg: ASbGncttOuizk/8RTYL9yam+079uQqQXP5g4h7OZAu2rcstWkFc1uRi8NP9H6R/nAmI
	Bv7jpnHM18MKR7ojx2QXkGL1AdR1rG72QAt2iQHjIZKCrck3CtkwHLLmODGoYqrOQ3B66uio9cB
	vuaLqBk/VK+uewE8HsScQVRATYvRVe8/I0VBLY5ubm/2xIuEe8ryQR4YCsLESLmkCcV7Vp7PVhL
	cidnWkaK95nIG5rrI+Ow2BquH8drpFo7ll4D8thV4nPWfcQamdvajqr8+m5h35WgJxO2RKANKW5
	+Oh5R+km+b3DMP+ebrpVSlbhxkMQFf4Tw0KE0ebvurYaKKOIr6cgGvLXOap83k7J4ggp
X-Received: by 2002:a17:903:2445:b0:27e:ef09:4ab6 with SMTP id d9443c01a7336-27eef094bc5mr16653795ad.0.1758871477456;
        Fri, 26 Sep 2025 00:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9mU7hMFwtT2lvjIBnrzMBSX54y4ICW695ZcgZtsa6DZblU9rRmj4e5eTtaAR5LsZo4bmixg==
X-Received: by 2002:a17:903:2445:b0:27e:ef09:4ab6 with SMTP id d9443c01a7336-27eef094bc5mr16653455ad.0.1758871476971;
        Fri, 26 Sep 2025 00:24:36 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43b8sm45147795ad.9.2025.09.26.00.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 00:24:36 -0700 (PDT)
Message-ID: <b01e5413-c8d2-4e4d-af9f-106bdbab6e07@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:54:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] drivers: clk: qcom: Add support for GPUCC and GFXCLK
 for Kaanapali
To: Bjorn Andersson <andersson@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-9-d7ea96b4784a@oss.qualcomm.com>
 <ba4vkdcbudvyoj3i7eufd27luhmn6ai4mgkefza6sfbjzfwgp7@rvnpins2bruh>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ba4vkdcbudvyoj3i7eufd27luhmn6ai4mgkefza6sfbjzfwgp7@rvnpins2bruh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aMXCp6vEVFfUCFogqJkm4IZQIOwgTIw_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXwvIXkQRV7or2
 0g6pYewbT0B/fOq0asRYBPjSZ0Atw+e0C2zhNYi83dy79BiUSZ3G77J7+u3S8g6jd6KoxHzhPbr
 +ziZD4EbEi8DcK7CnxqMKDOBIh3bVpgpuCy4WLaB0V/paEgeaxf1yiUytx49fX+pJeOcq1uDWs3
 G6zYfzc49SjYU87p4E/JwJy0GbVsiEp813OHUaHyma7E5ob+/HwWQnv3qJqcBPeg7XU1UnpAGOC
 uxEzImXZ+Hc2j69SEAOD8S6eB4HUlxKhqzYy5e622HkEJ0vcRZwgJk7gxG6ykm2BWKDXve4nXQM
 sHPY2horYTXUNKyoQ6lUB2QSp8HuhmybzMaFGYtlvPe6wL8bbDlQU3rQ64RPgCsYB+PwNg1V9NQ
 eOmFlWL+JzLxQQs2f1T80XNEqLLvtw==
X-Authority-Analysis: v=2.4 cv=OstCCi/t c=1 sm=1 tr=0 ts=68d63fb6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=U7xz_n88CXcP0GAGSGYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: aMXCp6vEVFfUCFogqJkm4IZQIOwgTIw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_002440_060651_6BA5007D 
X-CRM114-Status: GOOD (  20.24  )
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



On 9/25/2025 6:47 PM, Bjorn Andersson wrote:
> On Wed, Sep 24, 2025 at 04:56:50PM -0700, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> Support the graphics clock controller for Kaanapali for Graphics SW
>> driver to use the clocks.
> 
> GFXCLKCTL is a new thing, please describe what it is.
> 

Sure Bjorn, will update more details of the GFXCLKCTL.

>>
> [..]
>> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
> [..]
>> +static struct platform_driver gx_clkctl_kaanapali_driver = {
>> +	.probe = gx_clkctl_kaanapali_probe,
>> +	.driver = {
>> +		.name = "gxclkctl-kaanapali",
>> +		.of_match_table = gx_clkctl_kaanapali_match_table,
>> +	},
>> +};
>> +
>> +static int __init gx_clkctl_kaanapali_init(void)
>> +{
>> +	return platform_driver_register(&gx_clkctl_kaanapali_driver);
>> +}
>> +subsys_initcall(gx_clkctl_kaanapali_init);
> 
> We're not starting up the GPU at subsys initlevel. Can't this just be
> module_platform_driver()? If not please document why.
> 

You are right, we could move it to module_platform_driver().

> Regards,
> Bjorn
> 
>> +
>> +static void __exit gx_clkctl_kaanapali_exit(void)
>> +{
>> +	platform_driver_unregister(&gx_clkctl_kaanapali_driver);
>> +}
>> +module_exit(gx_clkctl_kaanapali_exit);
>> +
>> +MODULE_DESCRIPTION("QTI GFXCLKCTL KAANAPALI Driver");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.25.1
>>

-- 
Thanks,
Taniya Das


