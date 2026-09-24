Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF3EC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTfiqMKgpe/SdIDwUiMICvSbmpu0rp/xu4YDBLENRUQ=; b=pQCCq6xkHoq3S45yx6hMfrRJNE
	cyFMlUXaofwxkILUVRTA4wxt3JO1ja8uVrkoDGlJjwj3Uu+k0o8bkkOVUg9l8LwfP+t6++UJkEq7g
	jFmnVLJeteG1GU1CsklGsJMmxk9kiSI7qh+KgPIn33ldLTwBQms2EqQyXUveoKYZHpmjQqwQEXDN3
	zSpfHRhBo/lskVCjXdJJNCxXxuKKEL5QxJCNIDfN6e/d1EbAvWsRA+5Hynbyf+RpA+wwIT36BBX+M
	F5vLIMBUiqB/FJx1I2Opd+7G+ylXCMGqTMaqpoCE5xN+n5C6qD1m+fQpAZQyhqp880uBv4t7g2qt+
	OdIWYOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jQS-0000000B545-1Cuj;
	Thu, 24 Sep 2026 13:23:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jQQ-0000000B51L-0BDb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:23:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4kv22385712
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iTfiqMKgpe/SdIDwUiMICvSbmpu0rp/xu4YDBLENRUQ=; b=SRK8wSwGlqXbZqtB
	KPcdW2oYhDIhiV5ufq/o9bWhM1eJbYN9uBD7oeHWEBN6nRCHYrjxmwTmuf4CwoPO
	U19jMxUwAiTVw8454KzQU24L8h6gkCRwuv2UcyrawCTSossOCL/UprHO1MuuWSrE
	ceSQVCBYYj4Zoo9/KXKBD1u5iydXCOwW389af3Kr4BvHT+sTmNNUbcTtHtTLR77R
	vPcBemKAmZibb37N21800aPUglLfEPns2YIgiK26robp4H7FtTWmsxKEVVF8aMco
	sE3xrEtrKeHj/y1bQx7LYRjTZO+qPCkxj0re5yWSNkHY2Drq7forz90wCFnQbiLk
	2OZN1Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgtp0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:23:39 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-79129463bb2so653581137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790256219; x=1790861019; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTfiqMKgpe/SdIDwUiMICvSbmpu0rp/xu4YDBLENRUQ=;
        b=B5GZTzZWrPvTJfWVJoY39HuH7zY+IP76KoHGVUzZuAo8677hqOl0ZeLo7EtBdHkArU
         Dp/FJnTMFYwNriAHuZhkLuc8M05nkhvoxv2ITWBE5hPw4rFqli9aL95UilO+55Wn+Tdz
         uNjEoOZtX2mc9LZeqgxzvHFFf2o5IhlsJSkK6rofv7Ecbsy1lvqbCl655LF5aPr/wlbO
         NiQqgHrZ2k9/eAqctZTNDpvnSAZ6rRmlwtL+ah0GhNq3xpRFiTX72ZpyNpRmyBlg+915
         wxqUqnnJauPsmjMa6iy9XNNgYY/DKfHwG/GAPWieiQv4NLbEFBOBgXb5YmI6zXAUQIN3
         TvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256219; x=1790861019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTfiqMKgpe/SdIDwUiMICvSbmpu0rp/xu4YDBLENRUQ=;
        b=BgQ+znoPY3mvI81p3I/I+m6dQJaICbFJs0y+JpXZ1vvAffS6jKic2gnb5tMb+5ijPt
         dikQVy11hDBAPl8uOGu+zRlKWjCujorXqi8W+0+HQna8X7JiwyTJhfLHYW8m5sYCwBfS
         m06MMZ177YlR/Qxx50KXY++UiDqOIMoEbG0y0BCMienmmAE42yIM/f28upAPL1ooU6a6
         6SyaJlWpV1xx6/bGnDNXGSshEwh7Ocg1Ts/amCkfcusXGXk3ZeB09xhAR7sr0433lDlz
         WkbijIVx3NBorkEkgdFGRyHqKGykJuHVSNJq4IgilGcVKGgomJygzv3sVC6CXKZD543U
         xh3Q==
X-Gm-Message-State: AFuF++mbLLEExePo9nrgtYXMdTPxksIjYfyTp9RfLFcQDh/bGJlA9oHF
	16JoLGTO/AF9wOnjycO1ZR4CvqV5sXx2UFfmNqsxiNp+T36pIYgNYmLGTOEiTi5OVsM/dp3vjAR
	FuS92q+R/vTSI229US0ymnuYWhi5bYrPd0HffhAaXiOhCQXU22Cc8euXBT3Zx6Pbrg53dCpFcMz
	X3Sw==
X-Gm-Gg: AYBFou0HljLGH01jnXEFaUJZbUiD8AubYeSklL2Z0C/Evrq6769EWIKsr8gqFyMlAW8
	JXbk6FpvQvp8Up0S5/T7fvBK9W/V/97NYyECRnHdDlcCozydmeDVAiQFHSYuCfhl6qls4hokaDH
	bsSQrneMbkHmoiPnGPHG+xjka3K5fnBDYerteqMob6hluvvahdX6jaiG0/GTAaWGqC0TCPobHjV
	vgyW1d+flGLYFOthXFr4qJ8OeSuH1Bth4wV8C4fsfGoCDAr0+si/VFegoR4o5KVNYqxUc5gtC+a
	u+csOR9gydIrpCxpD3kDN9Q+/LWIvepl2Em6qc3sOKRw44JzhmMjhweVOhw4Fc0v5hcLqDOq9xP
	wO1ytYyfOUV/9WxzuOSpSCMepkUFqSGp+asVzy8PK1ycKQzdW9VK6iJfe
X-Received: by 2002:a05:6102:3913:b0:7a1:f980:e932 with SMTP id ada2fe7eead31-7af1cba300fmr1048822137.14.1790256219149;
        Thu, 24 Sep 2026 06:23:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3913:b0:7a1:f980:e932 with SMTP id ada2fe7eead31-7af1cba300fmr1048810137.14.1790256218594;
        Thu, 24 Sep 2026 06:23:38 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:31:4ba7:4aae:40b2? ([2a05:6e02:1041:c10:31:4ba7:4aae:40b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm88794545e9.3.2026.09.24.06.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:23:37 -0700 (PDT)
Message-ID: <3b4b7e2d-8f0e-49bf-a456-d14d8a0f7b76@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:23:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SPMI PMIC Thermal
 Monitor ADC5 Gen
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924130659.8841-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260924130659.8841-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab5245b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=j3MtvZii-MdXzgGxfbUA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 6UFJ_wJBWoOm_VjfV_p9_bCcsOY-auLK
X-Proofpoint-GUID: 6UFJ_wJBWoOm_VjfV_p9_bCcsOY-auLK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NSBTYWx0ZWRfX2BVG+CTbkm54
 Bdl875ZVC7x3OrgjOW4dWB2i+00AUDPNJeDOeqsbeBML58F4S4/CvM5SyEHssHdS7qGopMr34jn
 Cshu+01HNmA13pOjApG8E6xDxbpTfm8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NSBTYWx0ZWRfX7Tx5/YAXA+uX
 AbILpokM2gLMxmVSXcOTEbairzxSMfMMHh2YcujU6Z6yKhg9Fe23DERABavY5Xyd9TcghQ4Ew5e
 Z0Mtf92BloCMDoHuct8BYsp8crv6cQ9UKcYr+q35RRFnWE1YmPlyP/FKa5rFYICbK3mYxJCCwwy
 jr7u5sSKN7HkjTuGUHAttc92vh4TOu8WTkqR0wwNWFivQ6kNuJJLdimXRTV99NMM2w0YsMQ+UQ/
 Ud5jrFVsHuw1tJmkoOudA3Elbvq9qyEJcJtbSCAkD8luShInDqn1RTjJiL6o45WyKO4wCth0ISQ
 sA+RutSTQFawgsQSVbRkIWLyGXYZyAZ+dvY6XokGxVVQPegiPJaCUdNenST72FxeMhvChmvPVyF
 cBYtw0zXM9qOMNM/r/wJfrwyMm9kMNAvF3K8XkF59nX4S+inxwcz34JCBxWcPawHRm6qi8V3tCS
 S1lmNnkUiIUoTYowEqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_062346_204726_81994EBF 
X-CRM114-Status: GOOD (  11.77  )
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

On 9/24/26 15:06, Hans de Goede wrote:
> Enable Qualcomm SPMI PMIC Thermal Monitor ADC5 Gen driver, this is
> necessary for thermal management on Hamoa laptops.
> 
> Suggested-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
Thanks for sending the change

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

