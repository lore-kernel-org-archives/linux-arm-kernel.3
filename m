Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C478ACA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 15:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vrt0A6ANjc79IaqhSJY8cPh7b4X0YAYPY/tdBRrzog=; b=2+CBBNEMxy9zbREX0V3BboNEEH
	xbneSMi9k3KT4tW4rSv1/n2HybhKZV/t12rZovG1RFVVsWqXGLCQzflFpcqMB6T58fy0jAAfi8iOs
	lsmjCG9ETESfaIesWshGBq3aF9+LAr9cC7rifTeiUHaHaTDPHeyShA960ZdxlmbXuki4vtXsCV8Yk
	nwGxDtycZrzKpMLEg3/ByZympYW2AixKWCYWV/lQLoWcRLpyYSYlVii0jQ9yg61V8az6yzkBDb062
	9D3Y7XHeDLqVWGXXtpMRoWMHJgKCrDirFpEaRSRIEnID2BITMsHt9x8HOcSj8RcnelkmZEFsrCss8
	geWlqfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTPJ-00000000pFN-16zI;
	Tue, 02 Sep 2025 15:58:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPr1-0000000H8gJ-3HM8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:11:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582ACS0T030589
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Sep 2025 12:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vrt0A6ANjc79IaqhSJY8cPh7b4X0YAYPY/tdBRrzog=; b=Wzt2ivygiUPCUSwo
	BJAREK+B3YS73ADn7xyrkA3+Yid4oH+u/ktvtdOE2h2Aqx7mOQvkPPDlD6icrrBG
	8S9OW/8/QvXUjbtHgz39CKUw0RxZSjXRqA5DAMW9zUkdmOR4kMSEu4CQVKMcDxQL
	YNw2ENT48z1OpYcLawqx/abCCZksctaQ/99bSs7lkAqi+RDh7ajNPQ4E/st5RjgD
	RcKslF1kElgGzipF2lbQaJ5EUcMdEehlpngPrqnctql7iLR2r0oVhQF+QbHBQowl
	cD12I5MpBTvQbz0xvmgi8fcKmPSvYaqak+HBgFOtdKQwOhENbIiWtavOo1N/T5UT
	ett0MA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8qp67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 12:11:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b2967fd196so16299821cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 05:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815074; x=1757419874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vrt0A6ANjc79IaqhSJY8cPh7b4X0YAYPY/tdBRrzog=;
        b=pE3gVrE8H2P2L1hQdJYiYElto9hGk9Kd4/aqMgvDT8upw55/yOLchxzlk2G/UXfbh+
         QfJwrrs4I6wSHEj1+e1ErsYqbeXQHWply+EZFH4X6Pd3AGilX+kqBpOUWt9VQlgFLD7o
         ZwUqCTQTRIgW+/+DKmV3cfZwgS1AgZm/+vz7J1OZSOzFftD8+km0wGBhuU0rNnyiolZ6
         l146zoXXSlPIb+6Px8aOqTlYwZbrtjocZe6ABhsMjDDNUUBKrqYtTT7pkIfiF2tBbIDl
         dU1nZ4OU/IPayTtv5EOfKgGIiM8NBt+2STfHWqUPUSsT0LqA21AVpTE5S/QH+icaPqSo
         C80g==
X-Forwarded-Encrypted: i=1; AJvYcCW93b8SFTy7+/SLtAIbCf7Pkrp1F03ncoo7H0zz6oYmKFAgM/bV9EvIvlQCKbELv/Dc0ubHXTxIuxzpr28ZrCyJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwsmrQKOym6cXqkXW5YmI2by7LUVuqg3zinbBzn3dbybfv//2sj
	QWpDzAx3Jf6vUAUyezPv7yLzr0wnq4ZIGgTI8AytrBACjczCCQ0K2Bo+cipCH7en5LxAxuInFJb
	EbB4Tonf4WL2cALBE61w5dnhvQXtfxTPAwiTxon/cfUvtDqABAHEZAoJEvUkNpe9+J/z8egyDfq
	MZrg==
X-Gm-Gg: ASbGncs4uaHywzQgUyMvDPK9kpvuJCBjQn6D88eSay5fH+ZPi+ADLx+FOrmm6WpCGdo
	PgnnYph2kUQIz/+3heI7O0Hm5ezp62itMLP5EoW4JGwVDLdOl3anZoUy5c8CRX+bOcLNEdyNci+
	kI7YGnAxstu5pBdUocoLhH7itQfnAA2VeHOf3tgDArz/cEU1el1vRovAN9ZCAKPiKh9tY7pBeYF
	JUWfhlRxhed8R4WfqAsymywgugRl567oUdh5UipRTsXsULYyntz6dppqkwpLt7UrssI7hnE5LmU
	PVO/NI0vUq3BWpXZM1our//gUdixXy1a8AxcbPcnSl71GHGXjPeRsvAQC4ROYVEyssXfqeIpkaF
	J9idvwPtOELIPf/1KtyKNKQ==
X-Received: by 2002:a05:622a:241:b0:4b2:fb6b:38c2 with SMTP id d75a77b69052e-4b313e63155mr114514291cf.5.1756815073716;
        Tue, 02 Sep 2025 05:11:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3KfpCYj++Nh+x6sT1ov8IcNZd1mz0M6lJHlQz2dAizYJPZViCf3FEA46K+1XVLTY1Q97W+A==
X-Received: by 2002:a05:622a:241:b0:4b2:fb6b:38c2 with SMTP id d75a77b69052e-4b313e63155mr114513821cf.5.1756815073082;
        Tue, 02 Sep 2025 05:11:13 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040f1cf4b9sm698003666b.29.2025.09.02.05.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:11:12 -0700 (PDT)
Message-ID: <b2838f7b-8da9-434b-83aa-fa117bdb715a@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] clk: qcom: gcc-ipq5424: Enable NSS NoC clocks to
 use icc-clk
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
 <20250828-qcom_ipq5424_nsscc-v4-3-cb913b205bcb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-3-cb913b205bcb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ChxkN-G3ehARosG4fgHEZJ5YC8slB3UT
X-Proofpoint-GUID: ChxkN-G3ehARosG4fgHEZJ5YC8slB3UT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXyTNlCA83eKHV
 e+gMT6oH5C7ST4BVNXzK3At4SuFcubY9aZeRhwkLNAgh64IVVtO3Pjotxpwci3GpS5wtHTm+eOE
 QYyE6I1KDXHr66ZQ35BQhLx7VidN1teOEJ5V2uBXh80e85Bi4ueU6xmyhCKpu1jlB8ZYaFu04KD
 DKceqxoSRrGagnfhF92eqOvyHr+mvPSlcf0oE6CYRj8suXzwuhTnXalFX0f9hcdHolwQ0KU+Cg3
 +vUW1y37Z0sJUZdimSebNtgA/6pDOhKG/rVBLxbnWWj5l/jmyQY3S3rr0LGSHqoDltMi9WaVL4O
 6JOoGpos/hZTbdJbcZAYmND3oOHW/DbIHzxLztJ6Lq8hGjF8nUPBfe9wjeNP2WmrZIi9lPsoTf7
 hES6SI96
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b6dee2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DdE-_dUAR9VioeaCo_UA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_051115_939975_745FB78F 
X-CRM114-Status: GOOD (  12.54  )
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

On 8/28/25 12:32 PM, Luo Jie wrote:
> Add NSS NoC clocks using the icc-clk framework to create interconnect
> paths. The network subsystem (NSS) can be connected to these NoCs.
> 
> Additionally, add the LPASS CNOC and SNOC nodes to establish the complete
> interconnect path.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

