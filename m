Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C049CEACCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 22:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztuYyaE22UQpg1VtA7huflvbOJvFMCvZ8dxISGtSh34=; b=gbNGbRwLoGqDGLqtQvA2l3UV4Y
	4L97azm39gh8rTxU07NqTwqfjcRWVtSa3PCEfIYXJTakOpioJDm1Oy90TFoBJDtJXTwSyEBeEEndQ
	G7Y0+aQEilKToJ1cLTEhxNmoz5QF+GeTPeuuYnA5FdtjT0uOiKj4Oo4RivHKyQVdJHzQgFriGgk9g
	mjLTUPjizdssGWbqt3It+kenKc60wgctMCht0D0bs47nTt0+M9BB+irkW/nS2P9gNnxXmr125cs8a
	buzZGFHaE6IcylwlE1dNIwh8Qj1DMLz2n4nygYe2mRrPmAH6hkfEbCVIW4178PwyQaGAfvb64lCLh
	NLP5HTKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK26E-0000000DAMH-3RCV;
	Fri, 14 Nov 2025 22:16:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK26C-0000000DALw-0Zkn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 22:16:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEIPwJt090867
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 22:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztuYyaE22UQpg1VtA7huflvbOJvFMCvZ8dxISGtSh34=; b=miU/a84C32DqdD0z
	21baSOB3AveoQhq+vbZ6Az6dl9OJb+X8KQneUyh2ZOvFuIuiHUmeltvI+DUV8/ke
	rIKgEctqhccb/sV/CbW1zYMTYBnZaQsD7rC5OJ5hIqdZXrBnJanVoveR8pSN+D1e
	N/okcizq4i4lmYM+AZ9DgS9fOKNp5XeK14jI7XhR8QbHRIA0KRyKkQ+R31ueaSF8
	FDZlHuN0qJzoxNNueytjycl6T3gK5qjLUTtZp9GaILFNs2MYNxP2ng48dOaLAQAt
	bbmSK4jQhHTmcN96AnxBgyvmyryI/s/NOSY9K12oZ0gg2VV0EMVYhnzlwvo9nc1B
	0hZuPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae6xm96pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 22:16:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b25f8d38efso88018985a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 14:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763158614; x=1763763414; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztuYyaE22UQpg1VtA7huflvbOJvFMCvZ8dxISGtSh34=;
        b=YNxMijsrKW70NSuv108GpKRcDphhcJug6vJdCWMPdNyDe08moNRt5pSNM/+KqJ6Bzk
         I5JRqSPz1m4Zsfq2ijO0lHl8haAPndq/HyoHheDTqOZlEzvysnOKxfl95iXXsa6eVN5I
         AS3YtzkSf5Q0hxjYu9s0TTa+XnXXpe8iK6BxxJJqn9X+ZeahwtIjZzT2Dzbb8XST7sVi
         DvgFJXzeuB82/FyNSRDjYFroth2SD2lwSLVkJavUuq40AJyfP/bVzgB/LQ2LYYmM8c4D
         66VPr9ydHOIkcmGoUX1yBHd3u650gefyUOkM1gLtdLDb6dzMaRxxXbS+I50Tq2A5X7nF
         kWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763158614; x=1763763414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztuYyaE22UQpg1VtA7huflvbOJvFMCvZ8dxISGtSh34=;
        b=scszQHIxi0MxBM/hvUZvLqAC18OTY42MguCuw+xUODaNyYNSkhkZRAkH/+aQDQv+Jz
         0sXV6HBPqqcSla90869KfD0Sf1iGWXOVifKVa9HPSm7Z9/5hsGCpyO0hIYn0/3oDI1w9
         vB/cP6hjuKSa8cO9aQlRnpVmG7JL7MgRf/wc/zh3zQZkwCR+c32rskWvu5pe3kb10prV
         nWy/Q/lZxH9TG3FL3CRHA7BoKvtdkxJJhYiaYVzzsRkmfBj6JlhlCQ/My0R44s5mCDsY
         BF+Mn4/z29JiWGKWcIppU8QVKV7hMD7+FUbgV80tsS1dLeUUlqaqka/S8OQSIHJ3Idfd
         AFag==
X-Gm-Message-State: AOJu0YxkamHRgwhAOZaz+OCDzX/DCAl01ak6MI1gLN+9vZFpRy34O6EA
	Q9q80cV+EAkhSsSJ3OOVnH4mu/YJeZOLeA6fmopnX9ryPQPtBV787NYgDSXmNzddnS5FJQFWFPU
	2c+rdR64ay3SQRa2B464Hs3B1BHw0jDQzvQVEvf4ga3B8fNrtHBhDmVrM0L+lGKSYdxfG857rjb
	t5mA==
X-Gm-Gg: ASbGnctjgR5KSGeYDiYn2Rk1fqoZF87kI8GnKallHgNe+zIrJBM1KQOytSkKSIcHZee
	VGA5pLK2ATZOwXMep1n3kklLyjtksWmofBJIBdRp+Zz77wWxUyHW31XjtBEzrx+m4vXwGCc5X0+
	o6jaJY11jb6SOF2SFXe+cgWFicl51Fwv+a3+LKznFKv39qP7F4IZRElElh0HkJD3iBrYgpm+5Ho
	3IFnx4LYDMT280aZQHcVnHjLf+n4lnkr5Hwm7m5USTx78sMyPmDkhR6wt+othBfZtugIWupS6V6
	q4yzG4C4phrOMlYy98q0N1+vGjDKDZjCTnWLaBMeWmzAFm7eTJ+Wm5JQKzyWl+D+atW3kD9qEXQ
	68Thq7H1fmIu9Lk0NRBtoXSGrAQlsmFU50kt/wpfb3JJMbFtSkQFN9E8F
X-Received: by 2002:a05:622a:1820:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4edf36e5099mr44152511cf.8.1763158614260;
        Fri, 14 Nov 2025 14:16:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0nd6c/kzzPXZC2X5wHVvvmNWn5NWPaIyzTQSgkf9L94Ds3FA9xJLXbYLBIFCtp2rkNjJ6Mw==
X-Received: by 2002:a05:622a:1820:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4edf36e5099mr44152181cf.8.1763158613803;
        Fri, 14 Nov 2025 14:16:53 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb12c87sm471442266b.31.2025.11.14.14.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 14:16:53 -0800 (PST)
Message-ID: <5fbb0239-7f8d-4e47-b035-4de270b6a348@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 23:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_nihalkum@quicinc.com, Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
 <20251114064541.446276-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114064541.446276-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE4MiBTYWx0ZWRfX+fpKNXA8PNz2
 6TBym5MtZWo14LaeLeRitNodmTF9h5/K9YNFQlR0IKfVLOXSQs+7rohehtxrTdwQ7jqqad0Xv9f
 bwIqMKyUlpaFEtqHHyfqyr8ZGx/0/y/r5K62e/3Xq1lpQ/aqGOq6oZTpfvodIyBSFakG1QiVrJb
 2ApvHcptvNX3IK7DUSugmZXi5vIFqQJfYJ0tXDWrLEVJCjBVI0A+ePN+sn/x8hmpys5L94IIN+J
 BVf5n/OBbUBqcaCfpSbiWn5bqEdtpvXKEOrwehNOFVjZ0ypz1LKv5fhhfGRbq2bFdqrnkPKmwoR
 O1ogBaIUj5/0NETjFm5D5GTj/iLnFFdLY9+aWeo1rOn7wrhZv5TEoLS+UUdLYfqUbEgMaSHgox0
 qq2ho4wYjd9wSdXHvr9abpxu63OZRA==
X-Proofpoint-ORIG-GUID: i5Cg3lKGa80d7ST02gGiK0ZgkDLPrPQJ
X-Authority-Analysis: v=2.4 cv=NZHrFmD4 c=1 sm=1 tr=0 ts=6917aa57 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=MC0u2OBjPC9q_JU67CwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: i5Cg3lKGa80d7ST02gGiK0ZgkDLPrPQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_141656_191582_C6B42F23 
X-CRM114-Status: GOOD (  10.05  )
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

On 11/14/25 7:45 AM, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Qualcomm QCS8300 SoC contains three Camera Control Interface (CCI).
> Compared to Lemans, the key difference is in SDA/SCL GPIO assignments
> and number of CCIs.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

