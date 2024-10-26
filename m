Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AD8D10BF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmnLmB7Z58PVjAcP88scYZXyrOOFTxtAMnjFZSQFAfc=; b=q63FEskMsHZWySuNWSliN0wMUI
	MJTwvbGGJw/nOWlGNpuhhCQEYB9NQTjKWN8DrY9RWAvbP+M3OVt+QDD/CuvFXByAhPUUxG9Jcwl/5
	D+OcYhqtTuiACxTL4Eeza3TTuo1moX47Ai5nsXmtMpInkx1iTCuKNbtHuZmRQQt64i9CW9DpATLsu
	zaSYO4geldbfWk8Tjded/5565UJg665Alq0cbYmpCLAImlfzbzRe5Cjqt1jpJFkfQyOVNftvZL1H8
	WAwnkDxKtaYqqka4v8Hi76z6HjbJFyBe3+j2XmtEbxOhpqolc00QRo63NDWIF8/KNKXfySftqLCZ1
	Yw+3hGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4dhJ-00000006LT4-1hQR;
	Sat, 26 Oct 2024 10:07:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4dfi-00000006LKc-3h4Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 10:05:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q9a7HQ003551
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 10:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HmnLmB7Z58PVjAcP88scYZXyrOOFTxtAMnjFZSQFAfc=; b=iRvFE9Syyhxp53Jb
	uovXq/qGC49O65tQ43cSVpkm/EfgNtQ0tfzcLevyK9sngwYGzi6oh8x1R+ze27eD
	ADUSEq893IjDyMM3u5q6zd340pDoBU6pYzTvvC9wesEj/DYVpe/0QITVDf/6tt84
	aqFU95EQiTPdYem566SoGf/YZyqY7MvTZ0GeOZl0eBOazQKemKcOO6OYYL68io6S
	z3x5ZcwqE2nVHglNlMCssFQ8TOqaOh/Uszl4qrtDZlzv4MxwX2VheSVBEtAT8m3f
	Zs2uc1B6/+NqNBTF8P1uyFfLA9L6+XHYhuFUSBGsirAbuDaE/gCuVEKFw62gja8L
	96h+4A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gnsmgw63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 10:05:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbe149b1cfso8504226d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 03:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729937124; x=1730541924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HmnLmB7Z58PVjAcP88scYZXyrOOFTxtAMnjFZSQFAfc=;
        b=hjrmrs8P0s7OezKXBSSqcaOevnRxU4zTeG1Hk8eqsIkODmfVcplaH/qFNab2akgkSM
         LpDA/HGSmNkqE+1fPaXCA7UBAaZGKsc8Ic7qrkOOmlNa5yw+nwkTa25SnWVSPSg6QzcF
         1HT0++7aRkkPhhVXFe7c70dj/LXgLNDNOLseWdpNKzu83/gus5bmcJ56pZ7LVbUln8J3
         y8nack9U1ysMqTXkrDKhuXjD9qWXUsqJa9wa0YhMCpvLxlpRMGS6xD2Q9/TzVd6FtkUL
         +6Wr/z/HzFCIj+2rG8wA4J3oaY5Fc1Lr0w8XL8fDtzN1S4mlHvVzVVOa7vdSlnDmxTgc
         O5PA==
X-Forwarded-Encrypted: i=1; AJvYcCXQYIDkAB52b9TaNnJGxMFdPpTqDfsrNpq4o/1uaomP9xQehUO3F95RJJTcWi8dz5CM0M26MuU2V1c7zQfKMIa5@lists.infradead.org
X-Gm-Message-State: AOJu0YxYe7yNvvzz3CYuTqK+qAHwXk6Zj5T6pnIeG7Cbc9s3KD3aG1wL
	4yT3WsmwIfBIgd3iqxteoLYTwLOD/z584k6/rw2gz8+99SRqbwh1olg0L+bDNC1BsH9S8coCMPc
	pE7viXrzliJG3wRQEXJD3RFgnhHZraJk9dkmwh9X9Aucov2cJksuG8cLn3GFcDLdGG1uUFUse2Q
	==
X-Received: by 2002:a05:6214:19c1:b0:6cb:e7e8:9e88 with SMTP id 6a1803df08f44-6d185885e9fmr16414456d6.10.1729937124661;
        Sat, 26 Oct 2024 03:05:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEapbGj3Sfdlc6h7mBBc6DRy9QbRrJtdmLohS8bgyDq5d6FfQeVz9TdD9OYLquQ7Ttuo89WlA==
X-Received: by 2002:a05:6214:19c1:b0:6cb:e7e8:9e88 with SMTP id 6a1803df08f44-6d185885e9fmr16414176d6.10.1729937124194;
        Sat, 26 Oct 2024 03:05:24 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b307b5375sm158967966b.155.2024.10.26.03.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 03:05:23 -0700 (PDT)
Message-ID: <ca0137a6-3ffa-46ad-a970-7420520f09ae@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 12:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/7] arm64: dts: qcom: ipq9574: Add nsscc node
To: kernel test robot <lkp@intel.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, angelogioacchino.delregno@collabora.com,
        neil.armstrong@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20241025035520.1841792-7-quic_mmanikan@quicinc.com>
 <202410260742.a9vvkaEz-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <202410260742.a9vvkaEz-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AbIkz2H5wAzY1R2b343dS8uhp-sZ5-Z4
X-Proofpoint-GUID: AbIkz2H5wAzY1R2b343dS8uhp-sZ5-Z4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_030527_087874_B46D0E07 
X-CRM114-Status: GOOD (  16.40  )
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

On 26.10.2024 1:31 AM, kernel test robot wrote:
> Hi Manikanta,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on robh/for-next arm64/for-next/core linus/master v6.12-rc4 next-20241025]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Mylavarapu/clk-qcom-clk-alpha-pll-Add-NSS-HUAYRA-ALPHA-PLL-support-for-ipq9574/20241025-121244
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> patch link:    https://lore.kernel.org/r/20241025035520.1841792-7-quic_mmanikan%40quicinc.com
> patch subject: [PATCH v8 6/7] arm64: dts: qcom: ipq9574: Add nsscc node
> config: arm64-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260742.a9vvkaEz-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260742.a9vvkaEz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410260742.a9vvkaEz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> Error: arch/arm64/boot/dts/qcom/ipq9574.dtsi:766.16-17 syntax error
>    FATAL ERROR: Unable to parse input tree

I believe you also need to include <dt-bindings/clock/qcom,ipq-cmn-pll.h>

Konrad

