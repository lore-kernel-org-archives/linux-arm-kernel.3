Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02324CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKPdzEZBD9QZXB2s1p9qSuBi/92rUnMqY86HToXptQI=; b=aUHPZYVcGEMZJzt1PAiV02gqVL
	sgyT+g2Le9iFDiZwpu9o0VkULUsO8BHSFUXy5tA1EOAKki+Nvd0/Dh89e91zpjbAa/+cnyHzaE3Wc
	+XslZol20fU6N0gfgkEpEPTC9omyNY6qjySAA0O45LlvnVJuxiRcOoydiw9ZbPP1PDPWz/kpf4ZQ4
	Z0uZyRErAzYUrHlARZ+cn8rEKo7LEmiZUNdtCCnYIT9l+zooJ6IY2vzLe6kPGadazJnS2icDbubJM
	NsNmCfOpvW6QqX+pm9JaI0ZtxDTdvGntzw9aSlghcEQbVpRCy/gaIRRpb1sl1cncW4xgKHPm7L/Tq
	fXMqcWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmyM-0000000CpxP-3DRV;
	Mon, 20 Oct 2025 10:18:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmyJ-0000000Cpvo-1Gsy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 10:18:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JL3hoK025465
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 10:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKPdzEZBD9QZXB2s1p9qSuBi/92rUnMqY86HToXptQI=; b=pV5CSYP+uzFp1Zi9
	5u/T6O6qsNm4Ccr6Qlq9YWvi83O3re54PZcgni1wqoNDqTOTz5mflncHE2xmA6d1
	UcQ8+wmxF3THLY1ABL9vTvg4kFnKeja2tjEbsIkt1I+Wu5hb0Pp1b6v8mTTVOQLu
	vLChCG1QOfq9imXdzdouD0lkcDBXynkJDqysl34r9BhwKsVW0YHOL5hOw5tTx7PG
	7hmratWjUkguKkbagd7DkOWUOodzueujtdC36/Zg/jtnFTFXXL13oBZ1cbVKj41H
	4gbBhUE/VALmRapKMvPGmdEwbcZDIDOK7QU2hxd4A3tY1BHr3MLFAnUJDLDl3LDC
	x2GP6Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2yv4c3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 10:18:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33bcb779733so3471610a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 03:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760955510; x=1761560310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKPdzEZBD9QZXB2s1p9qSuBi/92rUnMqY86HToXptQI=;
        b=YFzXsvt38mKzwaIF6Z3/PmPWkKDlO9x+4E3ecQnBY5gHodBbRGqcqXMlxbyZea9810
         C2mkSn2dbUYgSu8f8mQmO7OCI/veNuxgnxQWns0XPPDawV2DYlDp5hUjvfGsDMpajUd6
         FhPe9YZKfN0vfN8Bm1zTWs49qMK2axr/VoCb/BHjHQV2tC+y7dK+NljRyUmcwhK5nF9l
         /AvFBVOfJVHSbJGVRw+Ow80Rp96fHD8tvDTjQJzr+B7CbWiyPUUgI81dzmBimCDkfqU0
         iBjBiXIUX8GcBysxJTmh8P2+nZhU8EDn+L859LJV6ixCFhD0EHoKYHze9DIq9tqFoZDf
         m08A==
X-Forwarded-Encrypted: i=1; AJvYcCVzKik/hF/hjHXhqtqti7DVSkShfj/TspKw97rWeKCWUSiLB7EhSJaU9XfppvAhvRnSxGJEMyYDtp+NrGzzrMDF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4qkRr7M90WhFm5vhDOxCbEw59CKzOmKmSGMb8TCFKKYeEuELE
	QjPfP+fuX6rL9vZ8rTTZteyT9gHF9FUFhOP9VjwTblSVQ5RGW5FVYOMmfHeVfW9okYl1Ds3guJA
	vZVhsaQkLl/usiDvSq2y/bYR86e4dR9EHqTi39hhSyuNME21G8dAtt/nS5kifvV43NtAAxnJZD/
	jJnJeYMdVpAnNX
X-Gm-Gg: ASbGnct/NCDpLEuYjBLOyFnTZ4w3BP8ffFaXX47iheir3J0vJZ4kL/KGHEejsRbHyBl
	ht4iD81gLaGi5YxRr8lvmw0Tc9e8zHA+g9CBOTuhAsN40z5SRzIpRr7VyxphUwXI8AF0NwlGQLL
	YGdqmYfE5D0F5kY/bh9+0rTCNJ5ExXJo7ZhWvcl1KCd4QtDx63Xle640S6enJ69ArcnrK5DpSBd
	kVkLdejFH2KHYC78qgoNsAO0PF9mKQVWoGmDsGyQ9ZfHIMvRGe0u4PzKpoB25UkzPWa+Yid+lq+
	+v0R0eHm0vi5aAc83jC6CzHp8JpzLJmUfqjaf1Qw8W4+LNyKHM0W4++tLveE9llxw5FNYrFLSzI
	PBtJ5arDpp7ZAKmcJrAhbB6N7CWdn01iMs25KFGl1Ox6ONkxG07xtfTZIV+DjyrdI
X-Received: by 2002:a17:90b:3fcc:b0:33b:cb9c:6f71 with SMTP id 98e67ed59e1d1-33bcf85a9f4mr15151451a91.1.1760955510389;
        Mon, 20 Oct 2025 03:18:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFILSIB5MLwkoW7cfHXg7NftIz20LOIacIG5ScdX4N/6wkENYhBKa3PrdVR/37Iv/EgLjInQQ==
X-Received: by 2002:a17:90b:3fcc:b0:33b:cb9c:6f71 with SMTP id 98e67ed59e1d1-33bcf85a9f4mr15151431a91.1.1760955509968;
        Mon, 20 Oct 2025 03:18:29 -0700 (PDT)
Received: from [10.133.33.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76673a86sm7181125a12.10.2025.10.20.03.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 03:18:29 -0700 (PDT)
Message-ID: <5a95ad38-0b32-4889-a8fb-af7e79c2e862@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 18:18:23 +0800
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
X-Proofpoint-ORIG-GUID: wjR_IOdnbTRT40rgvUXnFg_RuO20iJQf
X-Proofpoint-GUID: wjR_IOdnbTRT40rgvUXnFg_RuO20iJQf
X-Authority-Analysis: v=2.4 cv=f+5FxeyM c=1 sm=1 tr=0 ts=68f60c77 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yZ5FxKY4llv7UqssUvUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfXz2Y2Ad1QPxJW
 lPWbMXdYP6pUaa07WZfe4wofRVNhFYwM9shGmIjQpaIKJgPXrW6dHRkAiKH/qjdFEY8A9R4WOZX
 OmlYFH4OnctH5sGoYBVp8LB88+lccCyntzZ01FioK2TNRvAShyVe+4wxPR2zwDCLV++f90Q53LH
 JdC/kfmbuvFI+JgllgsQKBc58pkDJH7pmXXoSLt9kdvx4agyhClKfeua4Jzsg9c/R1CDHxG7iBA
 g1E2xctnMwaAAAnXYjCYhR2AZ+FifZWOhS2Y+2r9pOiDVaJ9aupGgc070Ig9AePm7UXSXcc3z39
 p4eBSABeazB5bxTLhzq272gmRXU6jCTWkTZzLcQ4YVduOmiI/fGH3M+3ajCIDhnpL/rkEA1SWCR
 eNeQewXS0uKSSuc3y1rseeH5PepEKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_031835_467319_219EEA3F 
X-CRM114-Status: GOOD (  25.84  )
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

I think we need a fix tag for the fix patch:
Fixes: de5461970b3e ("coresight: tmc: allocating memory when needed")

minor comment:
Since ETR is enabled, we can't switch the sysfs buffer, can we exit 
earlier by checking the CS_MODE to avoid allocating memory unnecessarily?

Besides,
Looks good to me.

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


