Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49804CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 01:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktoBffJvAqQmamplPsRs766qlBYkLoF9wV2DLyb/IDI=; b=fffDnSErdaLGEWCIASQR/mJlOc
	dOgGA4ZEBtUjtIVJjxeFDloLxnMtkI5ulgSkt57tNjqaTwmgD5r0995RrMjObsOl44A9M+/WF0jsg
	4iDY4PcDU8ND2jHgSot6Ccdo8BmTUtDJl0AwtAU9RCcLwdrlW32lXDHrKe0y96giXDs+ALRUCDjKp
	sfKQ7zdDkIHUO/tUTwA1ToEf/7VoL7z/wvQL6mg2dqKS1zrsfhWw/H4gStl1Ckmavufj9DSgzGC71
	VEnqSIkt8crCDu0GKNsGLrraINMiO5q07oVpJyk7e0mrkoOkkxCZotSQG6I41z88OCPPwEKXcGGgL
	XBjFEnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSVD-0000000CrGW-0lzk;
	Wed, 05 Nov 2025 01:39:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSV9-0000000CrFk-1M8N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 01:39:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KgM0C3165836
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Nov 2025 01:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktoBffJvAqQmamplPsRs766qlBYkLoF9wV2DLyb/IDI=; b=SuYEqOJJ5diYh3Lb
	d0CSpvQB3wJwaSgNgvych01BjwUkmQphLohqYe3KgCpL4FHweRVCneC0XcBOL09g
	/UexbcQjn8NCjkf5tvSQ+He59Ieov4+Pw2Q4oCjuJQCjZSqsAf5cIG6X07QoPv6Y
	Ang2qHhcJWxASjLJO+t35nySCKuGSy0y4UOFxoZMxS7KHSnru/RQc20pRLX6Bs4L
	83+RWWHEl/J9CuJOlA1Er9hT2bM23SGKwmx4FZCHf74SgU/ld3bh8S1v+tpJSa5b
	VkjCWrBH5KHkoMcMQmqTOsgpCzNCRmlmppapdrsf7ChM21R31EW1dqC4xkiJKlM1
	nec26A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7kethwqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:39:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b969f3f5c13so3192114a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 17:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762306793; x=1762911593; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ktoBffJvAqQmamplPsRs766qlBYkLoF9wV2DLyb/IDI=;
        b=XxLYn4i7yYWYVUD5xYeHNAOwJF9MGPr66t0ZV688sa4ZKvLIYN2B3EZYmwWuI1tRZ/
         vzszFWW12TgEm+RyAh+TpPvRpTu1cInu2ry0a+5HSvRB6b5T9BwOJMsGiB4qBMiUXBir
         +4qlYU9087vtFUlb3IcpcPgYLrs4lMJrEn0G96gbhoOVUt/e0oGYU8hLCgf632XWqA6v
         trMUucEGN8Jm/PzlvKtFv4gbqOxH3WbyEXjfJrUakpYEFSWMkHAuqaiYa1Dk1VQwdq3g
         itN8F2OqjIy/h/Jq2lJmjnQUBu8abVoOeAdk1U6OtMaMua1cpyLCTCgXpEaKBr3l1UZq
         yxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762306793; x=1762911593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktoBffJvAqQmamplPsRs766qlBYkLoF9wV2DLyb/IDI=;
        b=Kn3Opf+yHKY4Bv38pHlT7TIqtTuQ00Vldjzsbw0fVXgSe/mWtsNPOwhU0mI8Jx4b7i
         m0NPDE8H4skFkqQjR+FTOVr3mmmS04gmLgDZ2JKjD8I2CLAlA1hysqcKH/4H6+oLTD54
         7eILks13UvrhPmwTp1j2vM/nmZ48YtNeCY5LqBffGNhEatypK+0vzL094fNeJd93tsum
         LPoZAqPqNXlgNUuBCwzUQalikvZ6uxuOLxluvvGOOoYaBEAWPXU4QL8uBjXo7yUwwgaJ
         ZyC8Tcj+KaSuGbUVZMrgG5uQ5MwWbXa6/oFDzz+QuDUsZ6FDlQh0OJX1vmSguDWIjOZS
         /K6g==
X-Forwarded-Encrypted: i=1; AJvYcCXMsfEGPqoC5uXiPBN7OlrbaMukmJwfcWifUwukhEaDrTlZ69bZIhS9QJSpTqZG0sI0dq+MJitgX0H81an2IfNt@lists.infradead.org
X-Gm-Message-State: AOJu0YwlpJoRPr8SnrshGk/L4/TFnNl3aWDsvEJmKogeygfCgmM4TUvG
	NBAS4m4ICDs5ACOJm47duod08qch7+o3uiA8vboSK18RAkt9j88C6vHyGALr+ZYNAUXJxsVBrrn
	9idebib5f78DmZGjq+ca02VapAjfX1qqihDMGa/JB3PwbRGOf/LYXF7nM/PU2Wru/G0l0AznsdG
	5zvw==
X-Gm-Gg: ASbGnct4mmHFf6em6Sj5VEv0+6fiqZznSOPjBvvfZIUhgweQWFq0u91rT27H9YYijc7
	zeb54ZBGC6+xKXcx/zU13axfi/romcPHRCybh3y4oq2TnDYsNnf+WaPdUVaZA75HMaJ5ywJWs56
	fpxrqMq22FYEEsWnDJj467vt5kU5k7hoRCsw+zDjQrP9phcByYev0XO8y4Xcy61zptCc12pOrN1
	RucstHL1RBTPknbr2EvNPW2O0Zd5nGjwuVpMx17A69FbtNHTXdpoxxc+n+M7h6Pet6gAwlFEnl8
	bMe4TsacdabJIjiBKgr7nBK1n3JmRnCXYeeQODaHuxIfayUz+9GSonlBw0RmPfYPLNzt95b996I
	HHgsemSels8FTy6AqdHoXvejIxL9y7AXztJWEE37CzzdYGY6oOjGCtNsuXWwlzwgpYbAX/ZvB
X-Received: by 2002:a05:6a21:329b:b0:311:99:7524 with SMTP id adf61e73a8af0-34f84113993mr1311056637.18.1762306792933;
        Tue, 04 Nov 2025 17:39:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg/w5f+xI91DD+yJ2Uww0vfui90Y1y4ztWbeZWicsgdKRZr9byOes3eQMm4E//Je/JJ3igSw==
X-Received: by 2002:a05:6a21:329b:b0:311:99:7524 with SMTP id adf61e73a8af0-34f84113993mr1311023637.18.1762306792201;
        Tue, 04 Nov 2025 17:39:52 -0800 (PST)
Received: from [10.133.33.131] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f2893b60sm3793791a12.9.2025.11.04.17.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 17:39:51 -0800 (PST)
Message-ID: <db7484fe-df7a-4430-82c8-186bc91d8e95@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 09:39:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Linu Cherian <lcherian@marvell.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
Content-Language: en-US
From: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
In-Reply-To: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwOSBTYWx0ZWRfX4l08Zp4bgbtB
 S02NLvQthzsxu0SPoPOeDeFvMKY9ZOhuHHJAdKF5SGT45/ErSt8MfoQuE7bQ/MH8uITgyquczVe
 XDwClGRuAFaxkNlYKc1S4BBUZQTi3VrKeSi7W91057+Ec1mycyL2Eat6d+1fN0BAXXX6vOkOxzV
 ViiPZJ3C46inaDKIidhKlkVt+DvUjkWU3O8j9YiggXyS+OKX/RmF6Vvht35Qf2mTNE/DjbnbHzj
 pjgucnFl3fwcipqdIHBRtiWlt3WspHSMU9zFc/H2AKdvo9gC4P+/lk7KgDaGIw00OFR0nzSIxvd
 Yr3qGN/eUQ43vrLI9Y9MlnKVT4PsD9eyCQlelCklz/085owe6bldFMruo4S8kzIwVEBvzL2AyAZ
 zYAxDt5LrxCUcYXD4cOx7xB2uJmjbQ==
X-Proofpoint-GUID: fXz4c1zlPzmRDQ8mcJmganvx4Xgedf-N
X-Authority-Analysis: v=2.4 cv=IdSKmGqa c=1 sm=1 tr=0 ts=690aaaea cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CQwrqSfbpNu9xGj0-OsA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: fXz4c1zlPzmRDQ8mcJmganvx4Xgedf-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_173955_483242_03A9C388 
X-CRM114-Status: GOOD (  26.00  )
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



On 10/21/2025 16:45, Xiaoqi Zhuang wrote:
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
> Fixes: bd2767ec3df2 ("coresight: Fix run time warnings while reusing ETR buffer")
> Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
> ---
> Changes in v3:
> - Add a fix tag for the fix patch.
> - Link to v2: https://lore.kernel.org/r/20251021-fix_etr_issue-v2-1-80c40c9cac8c@oss.qualcomm.com
> 
> Changes in v2:
> - Exit earlier to avoid allocating memory unnecessarily.
> - Link to v1: https://lore.kernel.org/r/20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com
> ---
>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..800be06598c1 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1250,6 +1250,13 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   	 * with the lock released.
>   	 */
>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +
> +	/*
> +	 * If the ETR is already enabled, continue with the existing buffer.
> +	 */
> +	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
> +		goto out;
> +
>   	sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
>   	if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
>   		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
> ---
> base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
> change-id: 20251020-fix_etr_issue-02c706dbc899
> 
> Best regards,


Gentle reminder.

-- 
Thanks and Regards,
Xiaoqi


