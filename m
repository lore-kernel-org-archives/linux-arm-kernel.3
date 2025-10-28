Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6A9CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e58+fNddGzKAOXNx1q0z8A5H8OAdJV64gGeZoQGGH1A=; b=iJUPrAq0WuNVByRm0cap6Ok0PC
	7Hr8O6RdY/xGrHAGRwZ/nx09q9rgyt/J6XzpyLEeD1zRMyJKulkZrBVYCMIyPNWp5ISsHH8EHwSwL
	nbGhBK8N26vsWCdkeY8KFswANCMtJetfuR5AGgMnYQsHDD88aFen2CZttvdKH3XioxBx3oYuRGd+T
	zSVQvU3+Gvx9x2sMysMpx1P0h9BmSJhFQ1T0OKfH0iRztYMv2SgJSP1Pu9UVKs33iI6TbFlrTWKhf
	dRETC7ow9maACSFJn7bwbdXlmvG2QoYQtR5ZG0wrZ7q2xAkfV67gHVdKjmO/SK3yDh47FeI77WHJz
	8szpfQpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDg0j-0000000FdgG-0n9I;
	Tue, 28 Oct 2025 09:29:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDg0g-0000000Fdfj-09dE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:28:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S7daru1033044
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 09:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e58+fNddGzKAOXNx1q0z8A5H8OAdJV64gGeZoQGGH1A=; b=OuRNaO/ZXOk9q3hp
	t5iigTW7+TOM94JNxgV3pm3jVgA98LE6rTno2SuetfrUkraWTzsiDFu/KrnI7exB
	Fu4AyuWD90KGYZqKuVkGHfKiS8vd9uKMVUbssUIpUgIFz7GvNGGj5SPmyAbdkmjI
	A21YYDQbmLeHWgNBW/1p6heoODB9TWKp23+mNKo8WxKofNQBHjfOA7r13Oumi6BM
	TpITRsJMNAcvw2lqzAyBmp3MIEGLKhL8LJzVWQBA/3gERZAl0QnzEp04Cok9Buy9
	LylIGaf9aq5cGVUAglp7Fh6ASTR5mHNX/dtQ/fLXFVkoY5xQEb84yjOR4qvZQjlf
	1jvNpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2smurbd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 09:28:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8a35e1923so13829711cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643735; x=1762248535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e58+fNddGzKAOXNx1q0z8A5H8OAdJV64gGeZoQGGH1A=;
        b=mwfZz21HX3cqcU3exV4Cu9ctOqEYfJNgw4q4kzEZ1rDN03wPZf1a7UScihNpbfRc1R
         ZGwivZxj/WkIYMj9rlmTSaEdWCJGf8GJJLMZ0O/IPvZHRteBF49s7o2UODEDkOylrfXr
         ZWpOYJHn/EpsizRMVFmJYrwTtU5JcfuGwFr/rRHO8dBFY5KFB6n0eeWgF1Qb7JYX2VvF
         qBLhhz4m5Bnb27/02D7H2LLaF52pechBQ4pd1xjdjCUis9+0/9swPectWuY/KDfiFOea
         qFo6zix7SaPgEGWh71iYXXRZSrSr+aR61E1j/5qFie9I/jPJkmvkTQrU4TIagmYi3P42
         Kq9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkZuVxNR40oAwpnRShwNffVuYGVi0oEIR6LvidXxC5UJ+mD8tGphCejcnpwt7XQ49yofjiXMdwDIbzeKsK49a1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw08mxmkKjgP1/BdEpg6cYqO8kyY49tfRmPbm5r2Wr2Buel20JU
	A3xfpIUoEKl9bAAa7pf9ExK/Vz4H0XoCxsgLzGLHfUxB+NK2MDS1Lg0ehbr6e4Nlj48rZqUSZXH
	hAJOddIsvQQVMyQiR2R/SYoqLh0hQIMRCxC95DIVEw/pdRcrNyEp5wjkjYiK9xcwQf6R4ZtC4SE
	MyKhdQDe7g1A==
X-Gm-Gg: ASbGncuHUBJO2lYLLnVPVRl2lZW3scB+HN2XzOxON9jP8B8IDNQ25nS8mDHB9FNHzfj
	JhmgWp3zpOr/oibao2B5iHqzPN3QK4/oTEbhCjuLyTddz8CxHkEt7HZo1XOWwcp8GCIbhE60q/7
	q+CcTAcfT7JnXfHm1wNvUf9HAPo/GfWUUiEEXixdsO+c3vw8PDoAJQxWFMUMSm5FhmCGWcr2Yiu
	Sw+vaOaHccbQtbtaV07f7WoP/CS+xMzULI+R75/mt0shMrzcRTR/KLvcIovIJMPYQb6LRurhjO2
	ILM6FPcD7I/GKTkhsJLG6wO65/A9bYT4aEfOV0wlPkpfzLWUVm/uVRj6EeQD6p6qw0+MfNQ5xw6
	IvwUAM57y31u2BxK1U4RJe8JdMDLtXni/g1GDnYVoAfGIKp9OPXeqROOG
X-Received: by 2002:ac8:7fc4:0:b0:4b7:94f1:7722 with SMTP id d75a77b69052e-4ed07300584mr24794441cf.0.1761643734628;
        Tue, 28 Oct 2025 02:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1y09EzKeIgKo6FSlPS4BPv76TL/fj50gN3CY3VRT9ZqcFngZTXBYoyq9XTVLAJGTrU+4UEg==
X-Received: by 2002:ac8:7fc4:0:b0:4b7:94f1:7722 with SMTP id d75a77b69052e-4ed07300584mr24794321cf.0.1761643734082;
        Tue, 28 Oct 2025 02:28:54 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853386casm1023836866b.15.2025.10.28.02.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:28:53 -0700 (PDT)
Message-ID: <38628ff7-8080-4ab2-a9a7-78b51f3f699b@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: dts: qcom: x1e80100: add Coresight nodes for
 APSS debug block
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>, Johan Hovold <johan@kernel.org>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
 <20251027-cpu_cluster_component_pm-v1-12-31355ac588c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-12-31355ac588c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d6yWQFYaPFNOQ57GLkHnDG73KeQcIzn3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4MCBTYWx0ZWRfXz/fzoPiM4J0X
 ovoVl3heU6WqhH9wOlsc/eJEw2rH9q4crcgTTZPdZiyI7EfLHX04Px8RRK00wXXKZTegD0YtZWN
 RRrLCRsQh1uftWRHJfk7ZHx+a1q6nfRGbQ3X9n9KLP+G4SFJL+VOUkqaZJ2qrAQxIhKH/gqq/Du
 bEEHFhXnGT28kjeYgQMuVmNHHbhMdCadTUSFy+nUVs38D/PcNZyxg1Bec1IXuGhZlO2lCBiF528
 bl0owaQVa9k8ZxctT6E6cA9BexS/T0K0K3cSdodilpXtiL6sqjHy74dzr9hLsOD+fIhslkmTBbY
 B11/Bqz8AsPgKG/nx8pr8qUp7JknmXk0/aSXJ7RjfKutA3O+rj5oi3CAojGzlFW12YKb8kOmGV3
 HcAw41LQ9r05SQ9LcrHqMJqp2a3LQA==
X-Authority-Analysis: v=2.4 cv=IcCKmGqa c=1 sm=1 tr=0 ts=69008cd7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=H2ti3IRskaQp3tPIb7kA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-GUID: d6yWQFYaPFNOQ57GLkHnDG73KeQcIzn3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_022858_205592_ADB999A8 
X-CRM114-Status: GOOD (  12.92  )
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

On 10/28/25 7:28 AM, Yuanfang Zhang wrote:
> Add below Coresight devices for APSS debug block:
> -ETM
> -TMC ETF
> -Funnel
> -Replicator

This is a really crude commit message.. please take the opportunity
to describe the topology, any updates/quirks/exciting new features

[...]

> +			out-ports {
> +				port {
> +					apss_funnel_out: endpoint {
> +						remote-endpoint =
> +						<&funnel1_in4>;
> +					};

Unbreak this line

The X1P part doesn't apply on on next-20251027.. I see that your base
is some coresight branch - is it part of linux-next? If so, you can
just base your series on that.

I can confirm an unfused X1E80100 still boots up with this change

Although the problem that was originally brought up here:

https://lore.kernel.org/linux-arm-msm/Z6t45aOGDkotqM4Z@hovoldconsulting.com/

still exists..

$ dmesg | grep replicator | wc -l
128

otherwise lgtm

Konrad

