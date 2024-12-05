Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AC1E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4bHhpGj4Iq/Q6Yy51YAdnpy2vhl7koPdty55UVbqnk=; b=kGB9Wa+16st8cwDU8gq7F3LO/+
	K4xP9uNu5FabwttPW5jCHpHBxv8gw/BJ5wfo9ldEV9dcZLiDVhsmfzkOmYrqyNbQ1CD8HzZJIaZIb
	LjcusdjHMlQwOjNComnhNXKR+nhdV2ztg049/AYwEkXPOg0FSFtEUZJ2HDIVtRinAri5KiWNKd/Jp
	lxJqiXpn40zCa0lx1TbyIN73GuQ98qfC2cF3+Kn1n8KM0uMI6r05H5qmjBXNty6qseLtMzHzUx9Da
	CpX3zDZmuwaZUjE54cssYthjLIdLlP8QLfRFRrM83dt3gGeSTCbVPg6WZGPCemDAKSJSeyFthrBFW
	Hq3QocvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEVc-0000000Giab-2GQE;
	Thu, 05 Dec 2024 16:15:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEUa-0000000GiR5-0nUE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:14:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Boax8029231
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Dec 2024 16:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q4bHhpGj4Iq/Q6Yy51YAdnpy2vhl7koPdty55UVbqnk=; b=hTrWLkPgl7Q7Kyhn
	nS2PioFKEwr8lscowNnp0SRIo6MpV4D8Oq2YeCTTMYx9AU26ShlXxfUyk+lO9zR3
	TI0TY+3E270sXnlEmJEB5dgBRtYjBQMNba9xSHg5ma3lYambwtmxmY6e1TzLIRcw
	5GzXGeqWrodsvWJCCukd4NnZf0LqhBrWxo7HQhBKewepqQ4MY2hbUPRreRoHqba9
	3Wfz1eyEO2rzaD6nzZbl5RFOxn6PlcN1WUTClH0QWM9CnmUMtdZS70+VYscbPS4H
	M4l2N2tfE6nOw3fcdlUO+9CrV+U+Jld+3gLOiB/XrLCgVSvElqTAupLXrK8+S34N
	UpNmEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj0qxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 16:14:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b66a3c352bso7404285a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 08:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733415254; x=1734020054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4bHhpGj4Iq/Q6Yy51YAdnpy2vhl7koPdty55UVbqnk=;
        b=p6MZUXx7BU44hpRsUktefWFRPF1sQ/O09MsEqFzVCLZgtaET1QzurlR2uHRQmsYWC+
         GZC3r0rP3ZcK3CWYBKGqph/OstMlGAVZRl0dTPFMqbRkJsmoQTyv2zh4thyD6pn2F9bt
         NoDOvWRhyioN6H8eplVPKVx152YRvYBp+PVVI7FZhv9xnSrZN7Cdssvjk65SqoBiz7iJ
         vY4n5eG5P/kcBFJHhsatjDXrJivFChrQ4smc8uJhlJ17htBn28MkovBYyfUIiGWbCzBJ
         xl5HnTl12lg4iXXMzcEZw3jS2EBPubVdkD07Yz2KL5oAgD9RHJT2NeAh3lAQ4ZzVReVj
         fjqg==
X-Forwarded-Encrypted: i=1; AJvYcCUam+SDdhhVdW8l7ZSW01NS21SuXYKjpQQbGOTPNC+eZVwCSc2UKrCubt7QDXkWvcTki3n7HbTg8rq+DJTWwtET@lists.infradead.org
X-Gm-Message-State: AOJu0YwHlhIckQcs2vm+ZuDx2L8ZdYxMwcbUO3OYmtaXWjGtGktRMyuN
	d7gyMC4+JTmmUwHXeAhn0QaU/3lV6M7tBU8vq3drBZc+EXkGKGO/6g6tbtG4KdfsG86+Tm7Sx9M
	IrtBydX+lRBlEFqPH1ZkzHnGWpoc3FhN31QlbxTFQvHYEbjex21cIX2YS1FHRJvFFtGV7Yv28DQ
	==
X-Gm-Gg: ASbGnctdD76D6akmd7TkH1yV8zZEAiVpi/Mh7b2cDZHfGREaZ0QUD2ATD1160ssUuCK
	s+3HRGvGMIEwPcODqwauRI6h6y42gd55Dr0gLfvjATbyKh4zYQYH1vK3UjMETlPWkfgd1h/6plS
	HRvGJOC7zSbvXvaxx+1/JoGqAVTQNytvMvv8umwxr57IW8uvNuNn3/Z5P4E9Ro3IVhIIyaJEeRa
	hP/nEd5WCpfaiHEVOwxdF3IcxKByri6RgogDBqcAxma23JPHCb+0UHWYL4Zma5ZDC6X4rm3GEI8
	kWOWoyA9kM319wW0XwwmkOfuJEazGhk=
X-Received: by 2002:a05:620a:190e:b0:7b6:7133:b8a4 with SMTP id af79cd13be357-7b6a5da87c1mr511873185a.6.1733415253910;
        Thu, 05 Dec 2024 08:14:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeo8EnFlUDSRNwZoxgA8xXU7dReO+EiMtdKYMbSBAGgB52JxGgHU4GzGQnWeFhnhZ4jTPfpg==
X-Received: by 2002:a05:620a:190e:b0:7b6:7133:b8a4 with SMTP id af79cd13be357-7b6a5da87c1mr511870685a.6.1733415253525;
        Thu, 05 Dec 2024 08:14:13 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260a3660sm110733466b.167.2024.12.05.08.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:14:13 -0800 (PST)
Message-ID: <6d7204a5-a007-4637-8d42-0fad6ede6d4d@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: sm8750: Add pmic dtsi
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
 <20241204-sm8750_master_dt-v3-5-4d5a8269950b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204-sm8750_master_dt-v3-5-4d5a8269950b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lt9-pz-5rI1zqKE5opgKsiTB0Wg5AqyX
X-Proofpoint-ORIG-GUID: lt9-pz-5rI1zqKE5opgKsiTB0Wg5AqyX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=832 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_081416_345117_1DF1D2E9 
X-CRM114-Status: GOOD (  10.50  )
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

On 5.12.2024 12:18 AM, Melody Olvera wrote:
> Add pmic dtsi file for SM8750 SoC describing the pmics and
> their thermal zones.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

