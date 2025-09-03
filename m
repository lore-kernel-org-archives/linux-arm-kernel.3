Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A0CCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoondHVb2/f/1ydbXUBDu0DfSCvLLfXEhj4RfdZtE60=; b=k9wC5fC+tOTRwHOOKi11Rudb/B
	XP6UdE2SdqtX+E/MghH9nXvlogdubA0UEv6tLiuH3WJcT3zkcykDGxP6x1JPg9Z6nxVq97zK/oRFe
	qD7QfXWGRIZfvF3HVksfeCbwTdrdKYsetuD0vJIT5jvUMN08AdjChv3/aieUX7j4MjdnWNr4wd81L
	Qg8G8EbAKkZpyDUIuAPLnBCLhh5K6p377NcGQm0SddRNESUQ0YLic3QSTSI4VRiiEXiT5E3UFSInr
	HfH8lclh3B6xVNFP54598L05jWj3Wr1DWz8uMYpe64zhaGdNJKO982S9kA5TezJvSiDaDIseRYw75
	/3GLooPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturg-00000007dQL-2DoI;
	Wed, 03 Sep 2025 21:18:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utptK-00000006zfj-3qrb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 15:59:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwqWT021562
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Sep 2025 15:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JoondHVb2/f/1ydbXUBDu0DfSCvLLfXEhj4RfdZtE60=; b=EqYqChm4V7FtJ0s2
	dC2mDVa3bh3aETlAwgSrvCJEWP+tYhRPU41BC1mYldl00uP5rOf+SM6imdLX3hO8
	iyaotOG2w1gay7YinUkAHkF5KWdBz6H+5f0lia+pSXibg9mWzmT8vdxl/3ikvOd2
	cmdvk95hb7ZVN28riyyspWzqBBZZGoeisRq6Ih3aTn3eNzUbcHDnb6+yyI46kenF
	nDEOb7lVGLvSOHqODRLf0j6O7aANS/bY3iS1X0O26/6eGctx1KyI7Dt8S4s1WKgJ
	EutSRf6QQMTHQe1meKGGSFiqVevhdMQGZThqwxlwam/ne+ynW9kndmI1uhuYaIBK
	YFAg0Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0emedn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 15:59:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b10991e9c3so162951cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 08:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915161; x=1757519961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JoondHVb2/f/1ydbXUBDu0DfSCvLLfXEhj4RfdZtE60=;
        b=ZPRx2LidyMXf5wBXzZXQoXomhUPJtbCclMvHhMtUNovGbxlb8QprrDBwlzS3zum1Wb
         czI8/8UBAogHB0are3zfAw9Zlv/m6cwgefShCGiIRNJkXMCY/aXWut4QWDGSFi644r8J
         ySy0h7GFgqMStc7fY29FM0PCp9JO7Oge7f6dXuy8KmywJ0W2jhzjun6qTeNSaeY3gpp3
         kZigRbJGWxaYw3TRi+7fKEsjJP+zvRap2WHy7YUIm4xQVkYeeLcMbnTLf8B5xiDHsGkD
         modftRAf6FwldBJKr9oQLPk29jNZP37pbLKHI4x7bpw13BBbi7LTu7RDHZl93w3IW8An
         TLmg==
X-Forwarded-Encrypted: i=1; AJvYcCVC9BL4nGbK3ahBongNHJzz4JMVumX9tElriP3hE9oZQ/Cz+yvx/kuf12Gu+pQ2NzZ9xaIGi7zWDT8i1cJhZyRU@lists.infradead.org
X-Gm-Message-State: AOJu0YyXp5ik5VjE8UgcFUUyagmGpoYpfB+Y5xYT/HHhihRnLQRHufnS
	aiGf6/qR7ER45RFDLG5H+owUW1LJVltqegtdHOCpnN9zqgLpJ7ahejajuZpaoLyZ9AEt0LvC4ag
	Gfkr//IH0cYb5stm9tTK4Qpep95UTO/56Yqsbg+MvyMszojYQvwn49Xtv42pwiCx7wRsuaPRD2k
	Iu5g==
X-Gm-Gg: ASbGncs2YcHmgGVYFnZi10g1SHmOZi/AmqDUBuFE+R/poUeSBYQYWHxU5H5GOkujVoo
	5C1PsEK+SMnG4il5AhriM8YxZyxAf/fgt2WM8R2FBgMafmIiWa4ois98mbzc7hQvr5JmTRylUV2
	t5PnfnQMU/wmHGGdkukKOhwhrbRgl5RhXw9xhxY+4mGee4VMart7LBZR4HD2+vET/oDLrN7Vu2u
	nSVHdvD1clZnV1Onj3UJ+V5UHUrAiqMmPTfeN1PEFh6V/+RCQHk0W4jbsNaFyBcKiTGX2aup6zq
	KqD35Fv653IcjB5ky8YhPc2/yCEkdYDpCS/FtUO41/iTREoGw2nDZa1EzT/WMWBfrBHnQmIxN/J
	gee6Wf3z6CSs2pK71axFe3A==
X-Received: by 2002:ac8:7d0c:0:b0:4ab:6b8c:1a41 with SMTP id d75a77b69052e-4b313e8321amr143129741cf.7.1756915161026;
        Wed, 03 Sep 2025 08:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExgTsN6zBLbfiQxn8VdgOLVcjIE+dE8RIguKNUapAfNMSnt7dg9W7Uh4W7sqhgWh6QlyYMZw==
X-Received: by 2002:ac8:7d0c:0:b0:4ab:6b8c:1a41 with SMTP id d75a77b69052e-4b313e8321amr143129451cf.7.1756915160366;
        Wed, 03 Sep 2025 08:59:20 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046c296c90sm180845666b.83.2025.09.03.08.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 08:59:19 -0700 (PDT)
Message-ID: <a53c6bae-710e-4939-990f-5974346f6c75@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 17:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: lemans: enable static TPDM
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
 <20250822103008.1029-4-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822103008.1029-4-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XGa5aEyuGjHQNrDBETHwcdkVgmylt814
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX72JKxwGvkOuQ
 xFy/cTNJDnyyTE0/Gtj1twm37+qBFYrl9ZcA0mP6QiQogkA5wSAaJU6OBLJLwJVyQMNm2+7exMQ
 OHr5cQ9bNZB9NzwSdXX5aZOzSZjnW7zXvy11COIK6+lGnjpfbn2+HrNfQlWQsFWcHOrDgJ4Ssie
 +Xkr5obd4Y3A2BjRgsqFOp2VAyxOomKPnX/ZCk04XCwNLiIqX/7s3ruImtt1N6YqGQtL61cELa+
 Ael99d64CjxWNAtUIzGK6f6qaTMq0rd5Aw5z/E3dyZ/m2rwP3UMjV0u5AV+yeaIWHFgpwzrYs1P
 Fgsbl2JA00EmWhcg8oRfT0GH9D5qxCmLzklnzZCuyiD+7ytKp7sw+rJ2QyvEOvybgTMQq40TGV0
 iTprmhG+
X-Proofpoint-ORIG-GUID: XGa5aEyuGjHQNrDBETHwcdkVgmylt814
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b865da cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_EvAq3oGWgLp-oLdTm4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_085922_965002_5BAE364B 
X-CRM114-Status: GOOD (  11.17  )
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

On 8/22/25 12:30 PM, Jie Gan wrote:
> Enable static TPDM device for lemans.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

perhaps renaming 'turing' to 'cdsp' would make things easier to
comprehend

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

