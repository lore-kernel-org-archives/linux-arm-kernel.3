Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0C0D65559
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=; b=Uhf3URe6sM+dV0xcgOB/gp6fAc
	1WjMcNVvuuS9b5a71mDNZRnGJQO9Uu6plXUbBsO41ssr1YyVCTex9E26TnBmpo0sf/+XDytWKISxm
	G55a8Dbux8uTRWWdez79DCDgFHNbx9uq/kL//8t1h6YfET5sdzDOp1A2z5z0VlZZ++7Uj6B+BKPiz
	TX30CAlARniDo38r4VaoNAW7g79MhRbt9sk4qMGzyxryI2TF0QuRYJr5OmPQ6Z1mTkrzv9pRPxZ17
	m66AWhKWmQKY4fgVNqTok5V8PlfW7ESIQHdl7fuLsbqip7oqGjiWmNw1ITImGdH0wWzbLnz4s5cS0
	lN7MO5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrUi-00000006qaJ-2NLM;
	Wed, 17 Dec 2025 13:23:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrUg-00000006qZy-0yeA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 13:23:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKvCW2390640
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 13:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=; b=Vh0VhrlRe+qfdspW
	Ke+P6MKuPj3SkYIbkzCss2knZCvJ57jGNEOImc+7DLIZBSqgdy6B+Mc+Y/e7KFZb
	DLhGjmiNDw+C8qqyuLVK2qnURttWKh09KVZ8UYJUnbkPqYpogVFNGzYZbnJMLRDc
	cyaynSEmqSHXVokaJM1+xzD43eYtRdRAlMK4YZwT9nSTCtdCDUrEll+kEUorsTH1
	NhnzXfiPNRGo41vXulp88CmIMK6wd/ASjDkk2huGxpgn/NXXVS8OCfATGfwic4sG
	/7pjJUPg1vm24XLtan8VSK92c/DlxLcYHiqmuRCkgfud/IZoWQxVPILZozhugJZR
	hZ/74Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g3bmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 13:23:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f34b9ab702so3070021cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 05:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765977784; x=1766582584; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=;
        b=UvS4eYPhIdtdLqP20ZVl4YRAmzwHJS4oxzOSPoE8c+K1OONlSttT00vyi7Ff28SBp8
         rMBFfJRcfp+qWKmQ3qnPhrjfpW3ycYFFjmGPMjFq4RITMVaSSOvIqckwr0YtwHeE7OHt
         5nVKS9bs3re4u0YL9wXQRPvCcntNOePJjWlHH/LRvuORNt3xsB0OWzSy1pL9khQ44heh
         JuA1f6lNmrBxq2Ea9/g3O0WhBtKXxYaDfICSbi2QrviVNNMjk7rI0gH0C3qxTYQjdLbP
         omblQqL8tKl39y2O7eB0RD9ju9S3t69W7Ul1D16W6JOGwO6MWsb+KgX+s/NvAkfaeU3i
         i/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765977784; x=1766582584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=;
        b=ZP2CNi5coiZfhVRBAjo30wFp3u0kiV7QaPyb8y31VPrb8ss8Hq2UzWejhSe+Vs6SxO
         hWSHQMtrECq4DE/yy+gaRyu4k7aygdIRuqLzqfEnw/t/UZThjzqd/b3GXE7Y4n3tawHO
         lOaSaiobZ9wJBw3vpkCghMQ2vqTnboALMmHJF/yB7CQm4aHT97eHkyiZ8IINCcMnMLDz
         uzehlB6muq6zEG9En+uXim8HZvjPBaIn8YthKL9M6pD03BG0eYO3wCg5o15XJhjuNy46
         w8RZor+CEeAv6OdCIqKEoqyT6ChlBbPYCL/5VSHS5S5tS2MGsiLgY8NDSl6RkLISFypM
         1EHg==
X-Forwarded-Encrypted: i=1; AJvYcCUWX+eEeBkuqThiHjqXIkBoj0b7nfhiv/PjgZydda/K6qG5NVuqQtMgblkngAmbjdzMwSTvbkC2IF7C+VIg8BVd@lists.infradead.org
X-Gm-Message-State: AOJu0YwxYHuimyGjyJXFba3TXlpR2e6ljPU2sRzKSI3WdukBvrDNAtOI
	pFeKICjfd8XmPmyinQ9fthYNuNPga+0QnrlnJ8z/jpT6+TPEPco6mvQshb5dMxiYz1t9hvyt/X7
	AqiFJLSA4/mrIHwDiRWp1A+V07GLXpTjrrI8GkMCt9mnOFgt4QAbHyUZWrQ8z0B+rwqEbSB4mf3
	XeTQ==
X-Gm-Gg: AY/fxX7/y0Amh7UhPPQtZH3ccsCmca+RVIg2GX+2B4zKizoei+udWhQ8rkvJqXGc5Q2
	SIRCZo9NnbMXCK9lAHt2xgGONWKw6SuBfNHkbUidON90OfoINXtMxCePeLZlpoLH70QizZ2hUBE
	SAKP8mAPxpJAb5qGYXqLxn+BG09z+Czk0faCpIZ8pwAYRpJAxc5JNXkX3LCJMtkB03bp8FklaOT
	91aFV3XEQIWN15ldbUkCqhNqYjT4eofdnfb1IYtbobqOMexYjVtdx0pvzWO75fSDcaa7kE0RBLm
	nAWwAE59il29VZ/xpH4/ltXXYNWyVwLtL8uNqQSiORSY+3aOD1fds5/hr8XBHCrD3wzNydEylxh
	XMzJRhmjqoOrmfxRwAM7Uvm6L8e23FEDYf+XxGShwo4HZ8SXe6/f0HcdBVofCIYk9KQ==
X-Received: by 2002:a05:622a:4b:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f1d05fc5acmr193029201cf.9.1765977783906;
        Wed, 17 Dec 2025 05:23:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpn5aLn1iOCruV7FBHk9VV/Ny6pCd5cdcHqaZz8vOqqKcrW2tjqlTPVxasp9W9wjhhdHf/Rw==
X-Received: by 2002:a05:622a:4b:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f1d05fc5acmr193028721cf.9.1765977783290;
        Wed, 17 Dec 2025 05:23:03 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29eb76sm1969402266b.12.2025.12.17.05.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:23:02 -0800 (PST)
Message-ID: <ed17edd9-fd96-4562-a3dc-45cf7185f66a@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] clk: qcom: Add support for GPUCC and GXCLK for
 Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-11-fb44e78f300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-11-fb44e78f300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uQ4BrYBQcimfql2nyBEYCaPP-Dgjs5tC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMyBTYWx0ZWRfXz4f1JnGVLuqg
 1FHVsLtj1a1mPl1sRBcghgL+PvcnNuY7GqcvthZw3uk7mZl3D4SrKfkD/tECQFLmDxrX4g7uax4
 gOsd0ykjL4USpSwemMzGquIUcS2ubspFA1E2UGX5/AksSf4YA8Rgc7aKsfSUA0IWBzgwk/rYuuf
 NfdPkac+WrCsyEmDBIl36tg1gPvvya1eUwqJvv3fVjJx3rNQe1XpOfiiblDox6O3oAwcI1Gus1f
 YmP/u5q9tqVoHSNkui2Q2Gabe7C+lZXYHfO8tkge56b3DCOprW1vhzEMP3u6i+rHvizHkM8NpW3
 QvSNFxdHEGnduY0gLOXaj+X9SpyUVx/TWyi1yin9+P4Uuo3O4TPeOz9H5tWSrnW6HBOTahh9Yd3
 a88TpIlk6Xo3MJhtfwjMcTU7PW4o+w==
X-Proofpoint-GUID: uQ4BrYBQcimfql2nyBEYCaPP-Dgjs5tC
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=6942aeb8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=91OgtvA7_0Jf-gwRHFQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_052306_400911_3E5F2EBC 
X-CRM114-Status: GOOD (  15.17  )
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

On 11/25/25 6:45 PM, Taniya Das wrote:
> Support the graphics clock controller for Kaanapali for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |   9 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/gpucc-kaanapali.c    | 494 ++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gxclkctl-kaanapali.c |  76 ++++++

I previously proposed bunching the little guy with the other
object file:

https://lore.kernel.org/linux-arm-msm/20250723-topic-8750_gpucc-v2-2-56c93b84c390@oss.qualcomm.com/

And I still think that's a better idea. Alternatively, we could
create a small "gxclkctl.c" and make it common across all such
platforms, but I'm not sure that makes sense, if for each one of
them we're already going to carry a gpucc-xyz.c anyway

Konrad

