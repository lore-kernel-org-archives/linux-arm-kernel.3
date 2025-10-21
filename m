Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC97CCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVfeUMgTBM3CAu9I82wxAPql1NahbWchYps+Z870ydE=; b=bgLwO+ZOcpWjh4CfZVYGCy0dIi
	RG0mmjg+j/E7JDfNgD7knUsmnJMiw2ccmKdGUyYZK0xKvvMuULV52Mz++qs3jaiOtEDnB3S5R2VRx
	JfqIR50X+aXXgprGA+5PTQ34IQPxaG1zp09efYbA37Hj7ekDKjxRwQabke7ldHVHe6Nukyjqw43c0
	8PmZMWg2hylYuYhXWEn+1TZ3TDsJUM6MBgb0WevybshOCffJt2q/nQtM2jRKacgI7hXRwggcycsb9
	3FBQph8Cs4x8s1Ij2PRZbrDDQuNZu0KqgceQaLnXQgXb/rZt6T3+b4kh5nwp2xCkLPTrk5XuHudn1
	wMz5LH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB722-0000000G7PP-2U4m;
	Tue, 21 Oct 2025 07:43:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71n-0000000G6vu-3P8c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 07:43:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL1new018880
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 07:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVfeUMgTBM3CAu9I82wxAPql1NahbWchYps+Z870ydE=; b=ltFx4HXK32YtKoIG
	dPPJ9j7qTS0KRq3oSn2CdYQKPnBKxUBOSpJ7njjqExchM/8QdicODlI792/0LJ+u
	VmpAcfhLl9ImsFVWfasGE+J0gzc27btfvV9KwHaYCElLDnrKAk6pgtKX/jcuHbDq
	3RSSYFCxQdbNyXx1ebQagbNg9M9AK3sAz2l3PETm+EeKdT6usvzNvS8rzkx70ci6
	FwKKYrlnbs6t7UNMJFUFs2p1NG7qox8DosubMukxiGieecsVI13SY06/GRs84KP7
	q+O30KYg/Yn+Rxxe/EGmmPOy+tI1XcTjGrm9VOnq4w8xFO5vTs0s6Os5BVlWhBUs
	f725Jw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469ffwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 07:43:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5533921eb2so3363714a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 00:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032610; x=1761637410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVfeUMgTBM3CAu9I82wxAPql1NahbWchYps+Z870ydE=;
        b=HYOfsfRL/qwAkNxR4NHPnSssmzHbMh48p92JQCT4+3TbkrmilI1cVMIgHJ7gh5ta7C
         agznnegh3btxmp+KeHCfZYnpSZucZ2jiVhKRJuJ6O+wGXiMIIttTcYKbSKzJdnyyxPSJ
         fScPRr6v+ZKUvmbTDolhPAwRH43rIsDoj+cS4+ypnZ/e1lIEucaRvbiwrr9NT1bEcYCP
         GRiyXXIMVEgSu2r5U+XEtKR3jORfFQ1qGhH7Vb0LS/9Tls0uRZEM9G1qp0Zrtgt4WfUP
         Q6820cZ1YZM/TEEJcbH9m7LQAlb4dNKFlZeyzjbjjyfhpujUVRge92vSHYkmB2aVpvUF
         wxJw==
X-Forwarded-Encrypted: i=1; AJvYcCVrSR0KpgHtrYEqpafzbg2TsM+pQhnkneBd0muFvP5Uuk5pePqvNW3JG2EPL9bracQQGWlgxgXP9cEBmkQwJndw@lists.infradead.org
X-Gm-Message-State: AOJu0YyAMPWVvFqLBiok3VmJD+XqUN4bHvE5UKllgMap7efidFj+pb/V
	IzzDNotjo/5kzVXtYzpP2dqP/49aXbnHm2R3l8Hn03zJHDuV7sJk3UFMCUL7BUTwp8V8nQ+fahi
	jEkW8jAIZVPN18t5hRml8Be4hWuFbDOuT7BkJnQJl9MAU3ITH0bJ9aVHxmswVLEPqTdJ8gHOcUt
	DUMA==
X-Gm-Gg: ASbGncvDJUXXMId00NVG/j2p2Yd1DBnhc2OVXl80PaK1wH+Uds394wwhnJR44JBT39k
	f50y8POLsWJQQqBHkRjqEzs0jxJNYfI4JJEU2fAQBZa+c/RfOSH6oImoGdyrvh9cZPIQ2raNzS7
	1+VA7fIObMbOUWgbZJi7ORBNU/Kwb5qaW4bBhaJ28cLShGuPujOAjJ5QIHEImT27noHvIGa2mhH
	yv2sJMAMUToBH+v7zjZRqfm0JmOfjQiMdqgydPrFXBzmYnTk0/arL+H2jLXIZSxfzq8XmVeaf2W
	uyPezqpsBLTs95z88RTVRDzs+ctmd4IAjbpo92bqfz57US8Zjc+4zVXL/QtibG2UR6KsEJbFju4
	EBba1OIFTq/DraX4ikUB7oPLhmNJJZFyEzFxm4ID6a/NjtzJ8LQUfMuGY1MmAhNjv
X-Received: by 2002:a17:903:3d0b:b0:24d:1f99:713a with SMTP id d9443c01a7336-290ca30def8mr218012445ad.31.1761032610245;
        Tue, 21 Oct 2025 00:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr8+0hmXEglm2VrONIYQuNr3/IelIpMrr9RaoeoOUTL0/N8ALs8rMkTd/VGSWryNSxw636ig==
X-Received: by 2002:a17:903:3d0b:b0:24d:1f99:713a with SMTP id d9443c01a7336-290ca30def8mr218012235ad.31.1761032609750;
        Tue, 21 Oct 2025 00:43:29 -0700 (PDT)
Received: from [10.133.33.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebccf3sm101559935ad.1.2025.10.21.00.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:43:29 -0700 (PDT)
Message-ID: <7d81d7be-0752-4a95-995f-3477fa274466@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 15:43:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
To: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xgOUXz10CPD36JhZnwk6Yw7scC-m-g36
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX4qMoPLaLzXzK
 BitZvBT7kKhzlGebYHNgGUKKoScQS25PVnTP8Fct+P2u3uFSZBgXqbPoCVgIpxtHaO489zOPDaf
 oKarQYE/hYpRaK3XaL7wDWn0EHq9Zbt1esjO7aSHl+TY+fQobKJOjnZBJvd/gGkBBR5KAjfe+TT
 jEbdv1lc/hKeNMXPjR+cGC8fHaoWJCCDLZwLYxlEv/HE2kBYmSdbHKOHSRRQINuKjQifmNzxmjx
 7Ko7zS59b1WES9XhO7RZc6A4rMyXErjfeUok6O+1MdYX09WgmJ/MsjMCdIgB3YCTr5ieoe6aWCk
 hgwYw//cNJYDXJtwj04CvnIAd/mweJ6b3F2RPwb2XDPFm9jcPFOzY8Z/A4mJqqHbARcA++Bh5N+
 ijXVeXL3jLb7vKaIetogQIaWnzBCYg==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f739a3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yZ5FxKY4llv7UqssUvUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: xgOUXz10CPD36JhZnwk6Yw7scC-m-g36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_004331_872685_6D2C34B2 
X-CRM114-Status: GOOD (  24.84  )
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



On 10/20/2025 5:06 PM, Xiaoqi Zhuang wrote:
> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> and enabled again, currently sysfs_buf will point to the newly
> allocated memory(buf_new) and free the old memory(buf_old). But the
> etr_buf that is being used by the ETR remains pointed to buf_old, not
> updated to buf_new. In this case, it will result in a memory
> use-after-free issue.
> 
> Fix this by checking ETR's mode before updating and releasing buf_old,
> if the mode is CS_MODE_SYSFS, then skip updating and releasing it.
> 

missed fix tag:
Fixes: de5461970b3e ("coresight: tmc: allocating memory when needed")

Thanks,
Jie

> Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..3e73cf2c38a3 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1268,6 +1268,13 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   		goto out;
>   	}
>   
> +	/*
> +	 * Since this sink is already enabled, the existing buffer should not
> +	 * be released even if the buffer size has changed.
> +	 */
> +	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
> +		goto out;
> +
>   	/*
>   	 * If we don't have a buffer or it doesn't match the requested size,
>   	 * use the buffer allocated above. Otherwise reuse the existing buffer.
> 
> ---
> base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
> change-id: 20251020-fix_etr_issue-02c706dbc899
> 
> Best regards,


