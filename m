Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17348C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSv/7PkAKpQ8nAIRs6GPpYKojD4RMpnIBxaHmaeb+lg=; b=iaNR2AfEHe6c9/u8mha/ianQxO
	LqYZg3DLwxSJinCRwAxK/YOopgkHVoq0tKBR3A9x0HbPdhcit1v3cACvlW5r/AFsYRNm3FpQFL4j1
	6OF8hMhGMRs9f4b1uQBm8+0WtvX2Y2UwIXAII02WiaLOaMoeNWul1WMH+iKuCX4P3dh/FyAbJWmoT
	ReZI3WVakJF04TqwehhBO6olsmOuKCWIK63d+cfkbtIDFFy44e3Jwi81qbwnVWO25RggMFEUu+7e+
	uzCYFg4uiXfSYvLrgsEe4jdO2cpqHTbK3c4mbOpRnvnsLWWUtqCDezcduVGHyKqAWizjfJlZZ0mI+
	qMwenXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tewvx-0000000FaFN-3SL4;
	Mon, 03 Feb 2025 13:56:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tewtR-0000000FZge-0nr3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 13:53:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51366w4j009260
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Feb 2025 13:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSv/7PkAKpQ8nAIRs6GPpYKojD4RMpnIBxaHmaeb+lg=; b=d7Apou27U4Va++ZH
	vrttHaIEfvF9zN9RDwikHgCCxar3VbEhvM02YOb4XiaELo1kKmWETCWkT/6TnC9V
	B6Xfyf2tvYCqlDhEh2sMM4q8rCKE0+qKCNqFwzLfl2M2HGAUGTUl6NIrPlFS72ex
	DHoakw0/abIMeE8n8eX6y/a3w0zt3NnooFA1gLSW+lpbGyG0r081MH8hY6JmWQfz
	v2L18DKJsYvqzlSI0mp3qMTNyLDzbS2fmxFqRk+ngW4aEdgjhCFXFqdXnSUc1NG6
	fQ8Q8FaSj0mD0Sh2eSDt7r7AB30W6256n620f0PtKsDE3trp0n8qDKSptbizyzMD
	M8VBxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jr8896cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 13:53:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467922cf961so4149491cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 05:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590819; x=1739195619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSv/7PkAKpQ8nAIRs6GPpYKojD4RMpnIBxaHmaeb+lg=;
        b=D0DkVrd2aWm50kDFiLtqtSRYH45hOfiZfAoGx9ilpBS9RdWsBW9w+X4fEjO5kUoSV6
         c3JD/uiGgRnTRHilfgcZ0kilfsgOg+sraPa9p16BMnE6Ji814vD3b3MHQoJFTzcvzHWG
         Hq1t2uVv3jI1uLd7r+aMiQT9ZmovJ+4mrvA6rNTxtvLieiHT2XmqdbVWsSKzVVY5N9/h
         ZdPZVXKdaKohsLlD8ZBWRFf20TNa59KDUKrXKYg6L3L3PLT52yCglvipoKVfn1yBYfwU
         ct93R+PgoyjneTZVhzD7YaR7Cj9iHer5LpKba/6ZRWSfGlcVij5yTryAhZYSCSiQG84+
         FA0A==
X-Forwarded-Encrypted: i=1; AJvYcCUtKdW45NHVCNBAzrWi3BoR53NM0T9E0Ny9JEt2x8UY9kdO06RbGRQFZY5zP/nRGgzwlOJ24erB8+yo2W91kKKR@lists.infradead.org
X-Gm-Message-State: AOJu0YxiFyasOTvX6q4ma8VXlXpwJFIyYkrvgEWwTRnWkTv5i0mlNFxP
	vzQWj9vWJrLb+bBtzPnMMQwfXVe94Z65hieYuOcpRXhb3O6Y+K9XVEXJO69VxP5SDNRbs5GpLt5
	BgEhdVDJPa4F8qDz7ZMrRIPcjF3x2MfduZqE8/SdL7PF/H4/l2tWEday0TzncRIsXweFw3/xE0Q
	==
X-Gm-Gg: ASbGncvmwYFSZ3W4CxssJrxQyWbGMMPSZ4cHEJvJlBnBOqb6l3hGMQNAQ0dAcNuvAkp
	6dcv8US8xymVNk/OS3PNa0APV0E70hXH8mLFRYtMJdgHpgPxkTtpgL4Z0fA3Z/R5u4e65xLKav5
	z6pNEZoL6nqajkdMBFeZr1tPktQAs7eLECtMMjKw4nGsdcvps98rAejoFVIvnYxQ+khfGRiuYuX
	hegTjDh5BoyXQIu5s7xYWXGAVRN1Fqac+82cVmUolxPkQbn4Fyb0FP7THVP9vCa8gerd4+6tpCj
	r/O3d/XzfOcarsrYRqFy4E8t5eUNm1GrukWM41Q2JOlfQfCtfzDLvQ1b1mc=
X-Received: by 2002:a05:620a:40cc:b0:7ac:b32a:3997 with SMTP id af79cd13be357-7c009b38647mr822905885a.7.1738590819270;
        Mon, 03 Feb 2025 05:53:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgceImfzV8y+oE8r85Xh7QN5KXyc4CPa69uZAzMjW/nziNSKht9JytBTvf5hqpOMhFNtVZTA==
X-Received: by 2002:a05:620a:40cc:b0:7ac:b32a:3997 with SMTP id af79cd13be357-7c009b38647mr822902885a.7.1738590818864;
        Mon, 03 Feb 2025 05:53:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c94b1sm7708809a12.66.2025.02.03.05.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:53:38 -0800 (PST)
Message-ID: <2128f6c1-9750-405c-9595-125995ea76da@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: qcs615: add ethernet node
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-3-fa4496950d8a@quicinc.com>
 <30a82d74-a199-4ccf-997b-b8a6971cf973@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <30a82d74-a199-4ccf-997b-b8a6971cf973@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ocar9kWj4GBV9Jw5RuvKvI9aYADh9s5j
X-Proofpoint-GUID: Ocar9kWj4GBV9Jw5RuvKvI9aYADh9s5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=758 lowpriorityscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_055341_242963_8C62A3FC 
X-CRM114-Status: GOOD (  11.86  )
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

On 1.02.2025 4:48 PM, Konrad Dybcio wrote:
> On 21.01.2025 8:54 AM, Yijie Yang wrote:
>> Add an ethernet controller node for QCS615 SoC to enable ethernet
>> functionality.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Wrong copypasta, please use this one instead:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

