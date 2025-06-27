Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5DCC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K3ulOM8/2gxiv3n1FZOLEDC6VhxDRLLFSUlDuxiVZ0=; b=KvD+c+AJQqEtJjgNMn62bnteq0
	NVt4UpveJX0oVEObK+Yse8TvF53bm80SiCP/90mJHaf5OiQF/hcek5sprFoqtlGYYrc1qa79qG9SM
	mSntFCZrm7d/SqUy89by05IMp5XLCE5vqvfyDfZGiY6pY5URSubBN9T34SmaibHkhlmhhmoYwy9BM
	Bo3wA/Ss9+39YHDCOoqN2j9upGDT6i1BplWoTwvm88oGV4zXvNpzCV9n/ViIH4hGVx5PKjxhWcRBK
	+pb1pAmSeE11TXwQ4egd0HLANOOSH7RgYxR9cRefWkK1obI0YL60ncWzm6wWV23jPqbGCcNgzHogR
	n3Nyjkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCsM-0000000FPYb-22g9;
	Fri, 27 Jun 2025 17:28:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBt4-0000000FFr1-0eZf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:25:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCGDTE017778
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 16:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3K3ulOM8/2gxiv3n1FZOLEDC6VhxDRLLFSUlDuxiVZ0=; b=WSO9h00muASik1PG
	hgjJUhe/Z5R9kzOcFzfY0VkTeXu//fkoP+y+ArJjBq8XqZGBmWanNftm6dETR3WK
	lwsl4p0ShctmgOsBSaRDTYA8yHarihKHhgjcEPLJCnKBirw39trtgV2nq1Kbaf51
	VekktYj86D8jrAcpKE5f+6Nj3sPc87YAR7pzC0Y0t4kQxSbpUXkOILS2WI8ocyQT
	LHWfJC2OxUlSyDUq8kNQHOWPmTMkHlfor2tCPzTO5+OOiT8kk8wFWCiQzwIP/FgX
	4kgAd7OTfUr5gXUH3kUZm2vddnj6PIVdbr/p04B8/LiMWbtl+2hlR6lpfC2Iv64L
	P45v3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx5rrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 16:25:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09a3b806aso43376285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 09:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041512; x=1751646312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3K3ulOM8/2gxiv3n1FZOLEDC6VhxDRLLFSUlDuxiVZ0=;
        b=GwgqhZuAyPEyxLsm0HcTuO0EjPTq6C9cuZPVnRa6mJsZndwEpKcB4iQpuzRQ2SOf1P
         Jxzay1e7CBqTeFHfaNVVezZ42lYthr2Yr+KzKpeERv2w9rMTZwT04o1M8CE8CrrQPEAk
         qLksuGCWQ8YZcF2lRdfXbJK2OlILd2Bj5l18TTbKuaZcBk8bXFAiFlW8VHxlo3SlDRP+
         rbH/LWqswx02inweRlGhh/ml79Ebretk0/vDMI3VtD0LDkBKlwe5pd2o2fbbprfhsX3t
         FL1RkJZ6CSPpqwMlrOq7Fkf0kCLL/Sd9+fJycG9WURIAtkRgZE3myI1ciWxz+JND7dHq
         R/nA==
X-Forwarded-Encrypted: i=1; AJvYcCXCTNPOJuWr13bjpZXxkcnYFmYF1fhVNjVVQLjQ7AEhOkhUdE/4Gs/rmg6qmJJ1uSkNHB4i4RRt5vTvbRMseVz+@lists.infradead.org
X-Gm-Message-State: AOJu0YxjGM8rJm45HHvCl9ZoMOIPRri3e9DuRTJ9aGeYAtEEssoBJmR+
	skmtKDVEna997idKJ+bCZZMvlzPig0GGyK/rOyx9Gf+yXBQ9ZbFgiupH9lWTk5embPXIm/l+LaP
	BYCWT2Z1vJqJgkvYMOGjJYmS5tXvTwTBlXdXdzjm0k2A1wxnGMGjMgUSLVGJ0cDPi1Y+ku9DLfX
	uBrQ==
X-Gm-Gg: ASbGncsNfLzjC8GDeV0dWFKIvDDCXUGQ2aivCgRNKTI4Ogzcm9JSQkBArFIWcA6GJnh
	sdkhniEd5oCzKXgcW3QuVnkNQc/9X0L2UR3HNmV1TKRG05CkrFMigbEdmlvVYA2M3nx9q4dPY+/
	3v+2JeXw1sZ5XXKeRnDhlOOW8RyosGNr+XlUAuArVvaBv7oxVmYU3CJUb85wySdRhDPBJq4avDj
	zvYSXfmIoSLkBRU9ePxLOvg4k+mTWq8DJpy1I7BPfMB+Pxrz8oql809S9RdFmR1yXrLZAwdbCR0
	1QLKq0vGehhRrPPTAL/wHC/K81zd8JtG+fmkjZzdEP2v96TqXYZNe19Spv1Z9HFWqZ8RrTRzDxF
	V0IE=
X-Received: by 2002:a05:620a:24cf:b0:7c0:b106:94ba with SMTP id af79cd13be357-7d44393cb0emr186173885a.7.1751041512192;
        Fri, 27 Jun 2025 09:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF07xy/DeRmmmedPMJULYDxGN/26ma8lCZYySazHvEfgzdLyxgZdrRzYmMNDCeah7SlE5mBqA==
X-Received: by 2002:a05:620a:24cf:b0:7c0:b106:94ba with SMTP id af79cd13be357-7d44393cb0emr186170585a.7.1751041511671;
        Fri, 27 Jun 2025 09:25:11 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bdafsm148417266b.143.2025.06.27.09.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:25:11 -0700 (PDT)
Message-ID: <cee7bd5b-2c7e-4abc-8810-4c650207b4e7@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 18:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] clk: qcom: Add NSS clock controller driver for
 IPQ5424
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
 <20250627-qcom_ipq5424_nsscc-v2-6-8d392f65102a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627-qcom_ipq5424_nsscc-v2-6-8d392f65102a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DXAnn4VTgZ6YztmVZnZVHSOQFk50Lxqk
X-Proofpoint-ORIG-GUID: DXAnn4VTgZ6YztmVZnZVHSOQFk50Lxqk
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685ec5e9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=bcbUkqnWQ8Yi_cfyv-MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfXw+YfVEQvdFuJ
 G+GEdIXGqS2o7qfYLH6q0kT5fFOqk2KzJVoyZNUp8bBydS8RZ3cwUMHWDXEWuN7emDAf22feqYN
 slfkVMlXzXadWkXWxkd7gaaRCERUZAbH609x92RGM3yzxBzYr0vuqSMlyJUEdCeP2+skkDerC2S
 M65Xct9MVKR3criGjmzgXr/kzxHN3XmPrGkX1aeYLIyKMqiaHmn9LNcn8+sVR3NXtc47DJW57fU
 8t/NOwHEf49kdJdOxD0XXOzeYgod0dl7qZzWD9SDRHSEqOGqq92+4AOlNEE93Add6qkPttdgQ7R
 VlrqmtBxc1cY+5mxm4zFmcpIXDN5lqmSF1MbjeCtihS/lv1ryJLP3FOc/riDZWJCS6XDP+5wZi6
 +KzKSXRtttfdAZAqYLRaXB+MpX+gW1GtnkksGDicpdZrshpWeNpgCqzjp3IlXTLWLgGFpDWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=769 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_092514_311745_034E59E8 
X-CRM114-Status: GOOD (  12.25  )
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

On 6/27/25 2:09 PM, Luo Jie wrote:
> NSS (Network Subsystem) clock controller provides the clocks and resets
> to the networking hardware blocks of the IPQ5424 SoC.
> 
> The icc-clk framework is used to enable NoC related clocks to create
> paths so that the networking blocks can connect to these NoCs.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

