Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F01D3C932
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 23:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/o/3XF4alkAwZCUKfNDjJzZpS8RokO6HLTLhEtus8Q=; b=Cb/q1DpyJUQvP3+5oO9wBt7Z/M
	aAzY8UO4ERQY6ibSedTqSBXljBr8ekS087nputAaFpDs5gdzWjdXo4arBiVWgUboBjeRwsprEqfSa
	XH/ZNWy5UkVZIIbo09ijx2tHkTwAekhsFcbjZw8YAbWgq0T1c1vUU+GLbCrnZY961WbXMwm640Z3+
	bVxIEib8Ftd/Wc6pYlM4bibi7mdEC3fU8mHoNZHRjlnCP3425PPegPaHj3NTqYd6GPtUfFHtv8Zgq
	TY9Waf9yTbs6pY4/s079MKFm3mqRtw7v9eoaf4829OGlP1TjMb0DePyrx7ke9n1/WWqMpyTOgKElv
	PCxLE/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTTbx-0000000Fyds-0aZy;
	Wed, 10 Dec 2025 23:28:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTTbt-0000000FydQ-3M2X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 23:28:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPRXU4126900
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 23:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z/o/3XF4alkAwZCUKfNDjJzZpS8RokO6HLTLhEtus8Q=; b=NQu/+IXvcd3z+JO/
	Ph4SLwzoTzMhSUypqAAfnQzD326Yn4vGA8+iEGUnET8Z3XprLkm1s0bFc51kF4nL
	qQeUB01sqH2DCQ+33yelh6BRDN7Pwuka9Fz2/yFntXcFUscVMWEuKR2FSg/LFPfR
	h7J38G65jTJYL9TkgYoJcpoaY+kZEi0CikcpGWG2UPif4XmrsU09qo4E1rfbO15R
	4J/mEq3egErm1rUzLsPqm6KqBNABfy6NsMYu5cfTdZvJWDsPtIF4AlJ3iVfuIkIJ
	1k7AxHobRVz5rHtRIW50IodmNuQ5oSd+1irBChlyUjyt712n3EXlH9jqe6COlj93
	ZHGHYA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhp9fy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 23:28:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34a1bca4c23so754913a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 15:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765409319; x=1766014119; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/o/3XF4alkAwZCUKfNDjJzZpS8RokO6HLTLhEtus8Q=;
        b=LBpoLMAxv1JwW2vhXVHnougISFntfkqKcutircn639VoSpxQqU4YzjTH1BJ/84KIXM
         ZTlcZnXKcz3p+tiBaFidhbG1WG1GVfiXcrpf7y17aIxhzx8Har/QNv0aQu4fB5WyKHsV
         yjfEb3KOfd46yIOWmpM+aA51R93W/eKGJesn9TRmv8gSdn/u3Uud+gzXfmH4ZKXiZ3fU
         J548FNCpd6Xd3tChPnP9JLj59omm/hOp/Y9ozx/iKV7TzoizQ9jyZSjkA0AY5Z4YNVHB
         zFImHziOtouRmcd/eMjj2C+Z4QKwYkvMY9GgmOMbbh1BaF+5xznXa2y9RLikiUUVL7Mr
         EzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765409319; x=1766014119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/o/3XF4alkAwZCUKfNDjJzZpS8RokO6HLTLhEtus8Q=;
        b=S6JYByaIkK9ggHxy/giEWi2JWJEmDRcr/CiCGmX/54cA+UiYOZZmQF9P6DRd+9HTx5
         sKiE60CXYKudM5xzP1N1JtbsophhOySoGaqPbK4ePqwbCY7TXOmcCsuERUnfw3/A74oS
         /in6+Kg+IO4vqsLNG3jA0Fyd3aY8Qj887l+reVeHuSkKc1xyOCMk45zoPNiaXoNWGYKD
         ujgvopAeHdTcs3mIF4Dl+YMVYZn/3NZPyyC5M2mDURq1JEujoJAVTXwKDfyTL8m2yeeH
         T/4aKa5ETVGreSpvzamiFHh1jwmWo1p+iIXJZQcQL8bmA1Xq9vZ/V8SpYsQCognpuiLS
         Wepg==
X-Forwarded-Encrypted: i=1; AJvYcCWMCJcADFpzO/cO87yCGdCi3/N73qCE1vOHxjfE0XM82rPT2MP7BJANdLibR8On1ORFj/Gs5dAu5rngwD2E9hLf@lists.infradead.org
X-Gm-Message-State: AOJu0YwGLdqr96j/Z6OCJ4LQKr9l4nb0YvL+JPx6H/51KuWd6AGBzdcN
	gsBgPsjbCuP+VfYYi0ka/q4rIzVxhGvzSswJ2T0KY6o9xqxfRMmCHbUQZJTHQnjAD6W6ubBKse1
	/17mLqA/s0KvsjiDt5k02Xyk+4VAPFzvlBp4jrJ7YDKAQfZ+xxEbcsojAZXCXKs+PRpDyH+XqXi
	PgLg==
X-Gm-Gg: ASbGncvXJ1Qe++Ol690nK+KzH6K16A/U9p/AXtWlrqAM0l/J5hR5QtfpnMWeIK8puB8
	/cCtlOejYmySZLg04/Te9yJ2n3SpiUl+q0vf93C5LxmZidYdSbmvbJ4KSJKauIc+RIwe+5KM3W1
	KVldEnSlSUUGEoGi57jRKQHkJ+mISfPICxO2m9EDh0I8A5+HqlaiOMTbxF43jDFq7s3vKEmeY9P
	ss0s8AXGZ1SrlX2wfGuzc7JgFvlsEzezMkR87kh5c09H48uiXj1zXltcbZuWYxcWbmbWpknO7eS
	55haXQMx7mSWLZvO+PBgvLxDU+oeGLNGL+070ndkolfPAQaSKBiHR5fuvdsDQHmbJy5+SU0Qbpw
	fXkoYOsnyeszOGoV9pIyhTis662NRXq9C1in/ou0LN77gQfBDjNCtoEHHRgPnSznfSsN8Zw==
X-Received: by 2002:a05:7022:3897:b0:11d:fb4c:db13 with SMTP id a92af1059eb24-11f2967ed3bmr3206858c88.14.1765409318741;
        Wed, 10 Dec 2025 15:28:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJjUKbWsLNQG4Z+pS28oopEuiIA9c2gp/Kvg1Kb03NiNxnxDwCQgbs+FhWg5OtZG1MZiQtUA==
X-Received: by 2002:a05:7022:3897:b0:11d:fb4c:db13 with SMTP id a92af1059eb24-11f2967ed3bmr3206828c88.14.1765409318039;
        Wed, 10 Dec 2025 15:28:38 -0800 (PST)
Received: from [10.46.163.175] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb28dsm2427513c88.2.2025.12.10.15.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 15:28:37 -0800 (PST)
Message-ID: <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 15:28:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
To: sudeep.holla@arm.com, cristian.marussi@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mike.tipton@oss.qualcomm.com
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
Content-Language: en-US
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
In-Reply-To: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE5MyBTYWx0ZWRfX4Kcy844CUnY4
 c92o5arZW0c8WnbPCEoN5z3TswKI4h0aVpJl0O6+/pxswfzfNhn9ED/SnUiLAFpJ6yeOSSnsrXr
 Y3+UEqTX82Vn5ze03iwNQgcaT9E0b8MEKsreHFgizjcrUma2YEYXqKspMfIrbTso8PnZ06y9ac8
 FNVyHlXaxmm9fTK240hOV9zOS1VQm+9hHAIbMzHoovjDouMQ48zeHMuyy/dQRizFj/IYPFddtGP
 qACKz1zlvQD3T+LAlB+weKxTZMsXdkVK/X4OykqqOB8MJjyf/bONqqVw5+jEtevuv8LSu4fPE3n
 4MgtJfEpwiENzEU1yqRWBjblJg9r6qblzfZbaETzTGZyvXM66JKpLqSvLHrTyuwb7YO+MSn1lyX
 xlanr1ycQR7LXaV9gaPTMiJfo9xd2g==
X-Proofpoint-ORIG-GUID: FtSTTY_Ynb4B_SDCg2HoxMzWoNQyRaZk
X-Proofpoint-GUID: FtSTTY_Ynb4B_SDCg2HoxMzWoNQyRaZk
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693a0227 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ySjACDpaaGWjUKYOdFYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_152842_013513_D9708ECB 
X-CRM114-Status: GOOD (  17.51  )
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

Hello Sudeep/Cristian,

Just following up on this patch. If there’s anything missing or
needs adjustment, please let me know.

Thanks,
Vivek
On 10/14/2025 12:34 AM, Vivek Aknurwar wrote:
> Some upcoming SoCs define more than 32 operating performance points (OPPs),
> exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
> (next power of 2) to support these configurations.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/firmware/arm_scmi/perf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> index 683fd9b85c5c..2249ef7fe790 100644
> --- a/drivers/firmware/arm_scmi/perf.c
> +++ b/drivers/firmware/arm_scmi/perf.c
> @@ -27,7 +27,7 @@
>  /* Updated only after ALL the mandatory features for that version are merged */
>  #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x40000
>  
> -#define MAX_OPPS		32
> +#define MAX_OPPS		64
>  
>  enum scmi_performance_protocol_cmd {
>  	PERF_DOMAIN_ATTRIBUTES = 0x3,


