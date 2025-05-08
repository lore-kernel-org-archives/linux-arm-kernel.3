Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E656C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqFrO+71U8ibQ3gpsHV7HYk+y8vT7OVM8bBAwyHrapg=; b=htwvzHabO8F7kLHMgozl5QRpNX
	6heup/1KiyCCNH/zYbDM3XZmgUlgxCr3LrlV6P+7dK0n/r+Be2FibJaw/ob7eO/25N5M68SN8k2Mp
	++lsKtLgv/l8Bk8qnntLi36uIyzkyfRK3+wIu7S6Xe+G89jVaoeXejdSY6/v2HB11ry+Ov1SuZQIS
	qm7zYmKsG6h+xYxbDYWX4u7L0AX53g1rJZMgcxpxr2MZV3D1RhjPayAHP8LwzxubTdAXsrlB/HSru
	edPzGs4/eSed1z+PH1b4T1EBvoMD4yNtBpF+wwBaOmnA4l9uXds5Tx1invvm8lcID6rtES0HXT0CX
	JOyAfN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3cK-00000001D1s-42FG;
	Thu, 08 May 2025 15:57:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2Gn-00000000vb7-1lB3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:30:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DSeCF013361
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 May 2025 14:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqFrO+71U8ibQ3gpsHV7HYk+y8vT7OVM8bBAwyHrapg=; b=TuXlWv9tZ50cNzlA
	VxNCh8Dw7PETMDZTd1RX4sprzGJ8jxg0iKvbCRrW9a/YGqHM3kfs5il4hh5o04D8
	MNNn5AGiIgiX0a035xPOZLeMgdvR43Hq1RoFrm9KXdNrhq+1VnZ9xbQViUO+UFHm
	tEO7O8zznYIaib8nskpb1HcVoHuqeiowG+GImxBIikz69S6ShSAq/TcT4XWGlOvd
	FH6oZgtd3mf09TjvPxAuQJXx7YF8wRZ78/cp3uYPep1B25zQWEqMP/byaWvGgMcS
	qorxqNwrT6vwM0vu+TdHKpEs8QH+fNiARxSziGbiuW2esQe/0cc3R8AZRoO1EfnL
	AaA4QA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmhk6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 14:30:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c76062c513so25581985a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 07:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714639; x=1747319439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqFrO+71U8ibQ3gpsHV7HYk+y8vT7OVM8bBAwyHrapg=;
        b=Qqka1cw4RU1FzS8R2X7AKNeTtn1cXjz6j5leZ5hlVNiClWRleIBU7NC4v090mMAeYT
         +5YNfj+nKcVYIiKHD4RBaXNOaX8zB2Xebo1JQyXyDWv1+w/E1oSgsfWQDTJHc/kzOYfj
         DW83be8zP3L9Jj8OwYiHdvyqBvF+mQ+dNEYQ2hHGzdevxSEROogYgi8bHMJqKM1Sbg9t
         +moyjC/OmaYNvyGKF0jkFJ/6SlbZyQf6w9G0Ksm+x9ZzAA1AEJRcy9Q9kQg0Ux2lRdcF
         Yi2Xcig5tpJ9NRfTqm5osndF7hUgjvRnOKEfOku8e9ZMfBAvU7T0ZhM6uvIfcTJDSPqy
         9HSA==
X-Forwarded-Encrypted: i=1; AJvYcCVqOtE6QHl2t+l+yyRREscfJIxB1dL/E0mCZj4hETVkI5m7RgD+P0IgrEpTPq3EtVMKTr+XDtAmLRaPqXzpbiXt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5fG2sHsi4sQLcbAZYpbHDK8cPQISRmoNSiOr5HUMtNPtgV2I0
	vTag+HyQEwj/6oVBOzc7oc4Dwd0AQDkU7oDfyYXS25j23TWDWqTNx/Hio6s2vXhp5wP1XIpuofR
	KqG0qxzb+3wxQuCFuTZjmBFpZr8dUB5w3dwbnYnM9q3b8YE2iB9l+JoZVckeKpYYHPp7TAGOcAg
	==
X-Gm-Gg: ASbGncvszTqJ97GFM/kaopooztZOCpN5InHssZ8mbGXLY0NiEkFgZaV/3+AtWL9QKmf
	0IQb0VAZmdNkRbEH9s4k/NuVjD6w0DLjWWX2cOFJWpbrf42qNJSig07ElWV5pLC2ydHVUf3TUK8
	pEHobIggUa3eYB89sHLLPCZ+ek5ZLlwF7/ETgNmTaaEZ8+9qljBl5LBVAZ9Ej/uhC/s0KqBaXki
	W62d/J1P5gMaPzg21fI3KJMPpMDGXC63VPFEazq0sAYBTbVQoVE33+otPA3JNCRa+FFzyWTkJN9
	OREMPb4kagn3yXBhwZIKH8E/p5A/3TqPCPIvUBrHKhxlUn6v+SsW4upuJERrVhi6RL8=
X-Received: by 2002:a05:620a:f13:b0:7c5:79e8:412a with SMTP id af79cd13be357-7caf737f08dmr455458485a.2.1746714638999;
        Thu, 08 May 2025 07:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFERWPG6KvKc50ZOv48iurNgCUBU1wb1dtfWuaQD0GVFc2xadC8U2UgV9n2hIN+6mOuzpaQbA==
X-Received: by 2002:a05:620a:f13:b0:7c5:79e8:412a with SMTP id af79cd13be357-7caf737f08dmr455455085a.2.1746714638460;
        Thu, 08 May 2025 07:30:38 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147403sm1100399366b.13.2025.05.08.07.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:30:38 -0700 (PDT)
Message-ID: <314117c9-1865-4e33-b7bf-5022869412ae@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:30:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8226-motorola-falcon: limit
 TPS65132 to 5.4V
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <b67ed6c7813fa52cf00b473dded9b5042102f593.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b67ed6c7813fa52cf00b473dded9b5042102f593.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681cc010 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=p4YvtlIvSzqog-DnsKAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: taWtXzb-UgUt7WM3kU_VzGgQfYTTKTEg
X-Proofpoint-GUID: taWtXzb-UgUt7WM3kU_VzGgQfYTTKTEg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNCBTYWx0ZWRfX2XbKcNZaS0dQ
 4nUis0JXroseYtzw75a+F0sfRUt9EonLWNA6fttumR2/NRrryMmWQcQ/CH0tTOjWKUDRd7Rjy8E
 PeOSgsIFK6vp8RUk5bgaFnBnwx6P+3AxlfHTH6OzzoBRUJ7+hpylhpEOtgMaE0jlqvB0ybOtW4H
 olDUCOI2t0cDsqv+Dq31pSoPnzV6Q5OsNLmd6zWpjxVVkHll24XzNT43D8y/JswfPybAE6CixSU
 DBgZtEE+jfUQLmac2T7hrX8yDjtOhaiTuIovD9Fcl0qSLR1uQpMUFp3/RqlPcGH4eC/38C7SDld
 BulYKZyrTt2jtnSNQGefFs9FWiuRJHlFt1SZ/3EzUdK0J4P+bh0eTJMAMifU8qRitZch1t0+qI5
 xCpRzmxB2O/qWOuTBixi54zzCjG8TpJUKA0PX60mF1OLNU49CToYo5tbtrq4rYtRj8XqXVz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=804 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_073041_466401_001D6DB3 
X-CRM114-Status: GOOD (  11.68  )
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

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> After some digging in downstream sources, it was found that the TPS65132
> outputs are fixed to +5.4V and -5.4V respectively. This is further confirmed
> on runtime through debugfs, the troubleshooting guide confirms this as well.
> Specify these limits as such.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

