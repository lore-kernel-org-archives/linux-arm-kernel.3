Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64405C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WmSJVa8+LyzMZ7AuALMmZArLhe9+Oxn8lyjPgHFxns=; b=Vs/TP7rNmjJbjxz1nd3iwVyQbu
	7TahOVEbJxgWoKPBY6UvvdCf0ygoTGaTR3F1B3K4JQc1vsRNW3I9h9Ls4PQ9tPli/j3p4ZWxM8FEC
	tx7lUWxNgfsEtr9AMfUlfT+gCENkQ+FylssroL8lNp6t4IPjnwXsHDGN5kDsrVn4u+irQ0IUyvLU/
	d8BBDoQYBS3/1/8zAytT6GQEAqHLpVSVmEsixGb9oFT3pM7loT4ek4hZ7xhbl6BkgEXKtP1c5egxi
	Ta8MB5gbLwrkmTHp3A7uyOT9tWqs3co2PcV4YsZg2s6jSuLfUv0mCj9mrZCubV9/2sBrJK/3XtQte
	5B/u10qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCh6-0000000Eine-49yf;
	Fri, 11 Jul 2025 12:17:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCel-0000000EiQr-26dC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:15:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAiGSX008125
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 12:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WmSJVa8+LyzMZ7AuALMmZArLhe9+Oxn8lyjPgHFxns=; b=g6k/UOfch29P5CwI
	pqtIbwhQNYh5wJ/FG+d5qTLMv3uOF9J4rZS8PlXlw4ARvQYZ96QHgm3DQFKi2uAz
	v8rd+pwUwbnPMKXl/IyIel8uZh8YOw2CcTn9SZQMGQyQleDmkft5vZE2lYuss0/N
	0HZWFHax5VC52ZJguWDzh5L/tBw9jOjjEMpR5Lieo0mOqKVvvdSTNqTuckwroswg
	MvPwRtZeg1AAEOXG92f9aU+B5xtiRvfVbzo2fVY5JIr+qidvo+E3IboRLrDrEVtX
	3H8NO0Ot3lxVFcNUvMbC+TThfLfawJliw6yrbBHTNGmVZCRiUyfBfZX1oqLCpCda
	FmRWPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg8gj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 12:15:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3eeb07a05so31665085a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 05:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236109; x=1752840909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WmSJVa8+LyzMZ7AuALMmZArLhe9+Oxn8lyjPgHFxns=;
        b=ZTbC/wPup5nmEPm6i9GMfGXoKLVQIcngKzwKEb6swM2FA3oe/fyOYBsqeemg83RYpF
         m1GXkwzPjELqZ9FcyyiyrIXEjxkvXlhVX3TOl5binuQsN/XEtemsO7IgmMS5fm6I8+Tv
         NJ/CtwJtqLPxeKCEDzWIk/LhBkDNV7hS4LuGmVWerTguQwkDSismtASkjDT6tFQ/JpAV
         JXroP6LHFEn8FlKC8dRRyZL2LM5CtwMu77pFmFmAX9WiP0y/jtbuFF4YC1y3oRVRyc4W
         OI0R/K/q6TzTRfwldNdAn+cqFO85qqmtA9U1zcGKD7q4Ib+K+mf3g55AqUlmRBGGCgYw
         yNRg==
X-Forwarded-Encrypted: i=1; AJvYcCVsxe8Rurrn++xwupLa8H3pYresexVy5QTwoeM2pMrBP68J5w3WKXlnrLfeXTzOqj79fso02y5kqn2Q56GUAgLp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvjj1VI3J1p3B9GB+w3sNhFU5VUrynYHEuy3qb8gg29GalQYA/
	gLx/aIwCa36lH0NgJYry+RGC5Cjoye+OzPshLebOLfZKkX//2brfctHbNPihrGds0E+ryuO2oZc
	f317JH9Z8rK1+UJ/ifQaC+JidTQNPe9eXmRvBflLRs+vWsbfvhb26nDQifzxO65lH9buDLe5olU
	xN2g==
X-Gm-Gg: ASbGncvDOttWTdGCY3cB+AyrPN5Lx9sd8VRBH5CYIezez77ORD7Qkj7UOt2Ejx8Poq/
	GxuaAUjNfOL2ftz8U1U3Zc0P+nHQKudq4WlL7F0t7SZwA7Ygk11w1UQfEnJ930kKkWsrqYJ9YJt
	epu1lLRniJIwzEcEEBShaf0rlhRjKfQOHAoYl2sSw6evghVf35xeaFkONp/GUMaeeQVn07BGBul
	kS8V9C5C+2k/7H8TX+7d/oNbZQ4m6eF1kfwe02fSlwRi4ptvHCzUPe9uS6ztswnnGc+4ExxFE9v
	4DGBAIEZavsQ3jd0PTy6bA2B1sA7S9ERYsL50rpiDLTZtolm8HUetuWgEriZSHi9ccI1SuWMHOa
	ubj905coDqYsbAHTwv8/U
X-Received: by 2002:a05:620a:438c:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7de989b3079mr130007885a.4.1752236109092;
        Fri, 11 Jul 2025 05:15:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9IlpHxAb7R4TrzGfVeGwtAC/FU5V/+FMIw/QGwRVWYeM3sTSRsEHYiAI4QhJLyZVlXQj3Zg==
X-Received: by 2002:a05:620a:438c:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7de989b3079mr130003685a.4.1752236108508;
        Fri, 11 Jul 2025 05:15:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82964f5sm293248466b.143.2025.07.11.05.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:15:07 -0700 (PDT)
Message-ID: <93082ccd-40d2-4a6b-a526-c118c1730a45@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] dt-bindings: clock: ipq9574: Rename NSS CC
 source clocks to drop rate
To: Rob Herring <robh@kernel.org>, Luo Jie <quic_luoj@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-5-f149dc461212@quicinc.com>
 <20250710225412.GA25762-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710225412.GA25762-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=6871004e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=icw32r7lKnDoEl_Wh00A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: lmnxjEkdK7iFHB1ssfZyMbfADp7tMSJn
X-Proofpoint-GUID: lmnxjEkdK7iFHB1ssfZyMbfADp7tMSJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NiBTYWx0ZWRfX8PMqdN0OG29B
 z/olOqfMoUH+6YXyCgV9F1NVZi57bvLVBwb5z7oy3WwMNhxhd8a0m0+Nt6B6m3YqR4olTPlvuyg
 mHgPdvUEBwWiG2skPBptWizgA8Lo1rTk4sB2yDlKcB4wreByb6Tg84QPPwOD7T3FOFPmTU61Z5S
 ZU/zSRzZNW1m5E55nrJSzV7+91LWzbxwOlgHzBtcAgkEGvYnkO+Hc9jnM0c9MK5feKXzwUf46XH
 32Gu59kR8aMp37upbIh06kycj1fzgr5Y+e5pYqCayMJdhWPl8WKDwyX2liCZkXoGTR3H+V80lFy
 aSOsatY2bHeQ9E8ooAy8PdIglkhSeFQjAaeyvL1XmcR+bUyszRDTJYyLx39NouoZhChSxNGLijS
 o+Bu0pWSm4fgXDYGoBMXHZvb/Ks+WdvwFm4GlqZpZlLixRLI/blO61bq9nNcsGNQg8KtiTt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_051511_544879_1033646D 
X-CRM114-Status: GOOD (  13.23  )
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

On 7/11/25 12:54 AM, Rob Herring wrote:
> On Thu, Jul 10, 2025 at 08:28:13PM +0800, Luo Jie wrote:
>> Drop the clock rate suffix from the NSS Clock Controller clock names for
>> PPE and NSS clocks. A generic name allows for easier extension of support
>> to additional SoCs that utilize same hardware design.
> 
> This is an ABI change. You must state that here and provide a reason the 
> change is okay (assuming it is). Otherwise, you are stuck with the name 
> even if not optimal.

The reason here seems to be simplifying the YAML.. which is not a good
reason really..

I would instead suggest keeping the clocks list as-is for ipq9574 (this
existing case), whereas improving it for any new additions

Konrad

