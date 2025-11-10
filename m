Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE51CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 00:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bgtvgusnj8UUTeQJ6anDano2DXvOPmsvcBv42wqV/0U=; b=TV0Sx/kZ62c0Ex/cqqRHoiHPJe
	DWQmjxzlgWcqeZ8GTTJ+vb8XgQeVqCCz2RJYBjK6o7UkCj2F50MSX+QLEyqY6cNUi3kkGFav1oqZn
	qhQGfWbWVrjJ6LQbJEXxUDOssgllo3SAAEaAGmhmhfCKTrEdB8fhYdIQuTv6V2DyrwkBdQ2gIbNHW
	bpXBnBaSFIDUXpEHqU3jJCWiV7VAovs+b3+S9j+MiHN8s/OLghrwjqgdL3w8uWa4E0BhbBNKaqhRT
	6KQGyZ4XjdjB8Lolhn8WV37eZNo5ULUMShKBLmBIOLPvRtsEVjTGhY0dkRSEz5/ifzNVUWOkOAFek
	r0Yzgrpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGF6-00000004Ytc-1gHJ;
	Mon, 10 Nov 2025 00:58:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGF3-00000004YtF-0kVS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 00:58:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9NmSr02076380
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 00:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bgtvgusnj8UUTeQJ6anDano2DXvOPmsvcBv42wqV/0U=; b=lWIZe86XoE9+ttao
	8OL5xlLofNJbOsk89bMtkqYSurqb6gsvnGghMEpOJUqwfG/sCnoTrCLdLEKuK/4j
	SeB8EkMkW5ed55kD+phE/+UtH2OgnUtelmkCZS6C0L5wJFee70paJ9/N5PuKXPg3
	q0L8j6HCkKyu7X+W/sS2UPro0S76y1lr8cmpCyNN00umcyr9MA6hNp11H0jsGStM
	c3nqVzeskoHq3K5PO4MGoSeAjel7Z5doj5/wwMmCtnyKtAIsiVKidsqTx471b/Hj
	G1gIjDDJmRy5G0/jNnUoGNFmdb2c7yuAHVXN9XM8syRDrlgFkrYQoxHnzzXJXVt3
	7JHl4A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xwfjwsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 00:58:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b8f8e1f1044so4212430a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 16:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762736322; x=1763341122; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bgtvgusnj8UUTeQJ6anDano2DXvOPmsvcBv42wqV/0U=;
        b=WfSRm3eLkciY8LV2q1hTi9lBii56FBzK6UCbHjBx4WBNXiMaSm01m3q7u2mIhgf3Kj
         UU9SaABhlW/jf+1qxz12tYvJxcRKNQ4KmW7WG3ywsu1vFp7p6uvXqt/MzkAkud+pavA5
         4PI9PjbADVgMFr3VtGjZa+ILwP0hDhBb+Dnh5Kp1aGrJcACqAlEfuuL5Xd4sa/IP6BKf
         S7zZ4aQR4MY9pujVv2djHOnXwCmPpwRelKIxeDGDpkqj2JzbB1ykLoj/Kmv0HDhYuK31
         LdJ/fxA4oM8mQh3cOT11shAtC9E0IjZ4Gx6srHGwP/C0UcFhpUjbA/LfD1jRnIPLspBp
         X+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762736322; x=1763341122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bgtvgusnj8UUTeQJ6anDano2DXvOPmsvcBv42wqV/0U=;
        b=tuGOeeCwNQUqkpL1OATI8xbhMlIAOTneZPHkTrUcFVl4SjpihozvncOw5IAiBktUPy
         kleIWp/o3yI6KJJmESWfHXQ1jU9bx1C4bSyY1im3oJWM1Rn0GnYoKqa4uyAVca9m13RK
         LUod33CIvvPUg9COhnqjk77hSICjqJdR/Nyt71DIY85k/AsWylq4l9BE7gCmZOXs0LIr
         r1Rys5hrOjttpx0l145grClsI+ywbLfufyJw8KQavRO8l7fG/aYx+DRPZlIGsH/P2jGY
         dbAKWHnXKEYyVr4Y6+rENS+C1EXy7hjszOvyE087/GbpdgJhoA1EN4cmMyMm8gaak+bg
         5O9w==
X-Forwarded-Encrypted: i=1; AJvYcCXVTnZUdvKUCuLThojuh/ZD2cHXk5NfdGYFYe099Nz7qQvKHlKz+SKdYS6O14adIi77+GWUmFl1WsOXNUjQIDQY@lists.infradead.org
X-Gm-Message-State: AOJu0YyUDRZXw0sdG07ObLOBkV+fMVRLQAbH90H5Ue3eOdzXiF47h/sX
	+vl4BEZtnEbXbVx6COu6w7GpN8dNlszX+bxHHIffyTkW8XhY9weaQP5djgTSyBYSVtTqT2j9LJX
	SQ4w6i2x5hX/GgM5S/Ywg2HzHKDqF4EzhJmcAcixAIIhRSWVq8jDVoCPugJXnjxsqCrwbVi3Q1+
	fM8Q==
X-Gm-Gg: ASbGnctzx68UOP5dL4RaWkquABZz3gjpZrZMrTS8ixFLgUt/bczLY9L2MnZg6nmlhTn
	fuJjrIdH4DPCnzCbhkBVCDQNwsKKwXqdQUbzm68uyBRHjH4yG2dDOhPksZrKwPGhzrrKibtPJZK
	FCUxv17DlP8kz83ujHKMsSIb646tmVg1SwdtSMBdCXR5lhPFztGgbHSCfzKd1BbG4UtcNSvHW0f
	OZt5Nn9rASv0/rhRNgaiE1dSMAw0GzoYoqVghYzsoNs6YRUZ5Bpx4vlRGLXOd1OxCOoy2Ouda/m
	QcH+LlEdStqY5qin92qNkgrLMwau/3cGbqv/dy4N74scz3MxIyRNCz02tDAsWBb71xiukOkVFbD
	CZVJJQr0o7XOxrvZS8+FyALETwwLPIezesgK2rJsUEuE3gcCZvB5uNrnAc8mDSY64
X-Received: by 2002:a05:6a20:94ca:b0:350:ee00:3c9f with SMTP id adf61e73a8af0-353a24f7cbcmr8603881637.48.1762736321966;
        Sun, 09 Nov 2025 16:58:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7AydeZT0JrhGShBhEOyz5MmnUHTKAZe9+iQAWVuH/FVpxNFi/omwHJ7lFM405ObY1Y85Fiw==
X-Received: by 2002:a05:6a20:94ca:b0:350:ee00:3c9f with SMTP id adf61e73a8af0-353a24f7cbcmr8603858637.48.1762736321467;
        Sun, 09 Nov 2025 16:58:41 -0800 (PST)
Received: from [10.133.33.229] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba902207232sm10576120a12.32.2025.11.09.16.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 16:58:40 -0800 (PST)
Message-ID: <22de0bad-4947-4446-b610-b4d8d0320858@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 08:58:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] coresight: replace the void pointer with
 coresight_path pointer
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Carl Worth <carl@os.amperecomputing.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
References: <20250925-fix_helper_data-v2-0-edd8a07c1646@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250925-fix_helper_data-v2-0-edd8a07c1646@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JOSRTDc1EoCa6uAfQyPUEFHvheMkMHyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAwNSBTYWx0ZWRfX8q5qaS39TdTW
 AmYI74yPmNkDg0rbc1QyfVP0FDNw0J06SmBputl40N+IywvjUuTI8ncoe41qx7i5KkEl5m1IhFu
 S4AXhdxBYmoi69eX4g0kJGExy4HjPExFJBt16zXLjbtVgWB0SzGKADpSVaxPW44bLY7GAqIR7bP
 VuMdtZ54IRRMQ+sLiCr0s0GBVYL3BFltbKkpElIBEEkvN8qvKQInmDpM9+4w/wWj+uzvATbecVq
 QOt9/A7OsHvpCns15KOr3se/5upqovZgLKEGW0E4w3LPzdz4ZC0qcxZsiam52dEiOTpITRLVWCm
 iYVLq9RKFPWUM+xAf09BhpmJS33FfZb4kyG0L8Q6xdRUnMtdLfFdqb+XPCH1XBT7ZvfXZ8Qz2Hw
 MSEJdVworbX9IlcveSw2pjvIkGn2tg==
X-Authority-Analysis: v=2.4 cv=LaoxKzfi c=1 sm=1 tr=0 ts=691138c3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vzhER2c_AAAA:8
 a=rsf6x_vkuY_n4m1xo70A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=0YTRHmU2iG2pZC6F1fw2:22
X-Proofpoint-ORIG-GUID: JOSRTDc1EoCa6uAfQyPUEFHvheMkMHyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_10,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_165845_410629_0CF5EAD3 
X-CRM114-Status: GOOD (  17.89  )
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



On 9/25/2025 6:42 PM, Jie Gan wrote:
> Patch 1:
> Fix the issue that the catu cannot correctly read the handle of the AUX
> event which is caused by the commit[1].
> 
> [1] 080ee83cc361 ("Coresight: Change functions to accept the coresight_path")
> 


Gentle reminder.


> Exeception call trace:
>       tmc_etr_get_buffer+0x30/0x80 [coresight_tmc] (P)
>       catu_enable_hw+0xbc/0x3d0 [coresight_catu]
>       catu_enable+0x70/0xe0 [coresight_catu]
>       coresight_enable_path+0xb0/0x258 [coresight]
> 
> Patch 2 - 3:
> Change the sink_enable and help_enable/disable to accept coresight_path.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix error comment in coresight_path
> - Collect tags
> - Link to RFC: https://lore.kernel.org/r/20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com
> 
> Versions have submitted by Carl Worth:
> V2 - https://lore.kernel.org/all/20250919174932.3490404-1-carl@os.amperecomputing.com/
> V1 - https://lore.kernel.org/all/20250916224441.3008824-1-carl@os.amperecomputing.com/
> 
> ---
> Carl Worth (1):
>        coresight: tmc: add the handle of the event to the path
> 
> Jie Gan (2):
>        coresight: change helper_ops to accept coresight_path
>        coresight: change the sink_ops to accept coresight_path
> 
>   drivers/hwtracing/coresight/coresight-catu.c      | 10 ++++----
>   drivers/hwtracing/coresight/coresight-core.c      | 30 +++++++++++++----------
>   drivers/hwtracing/coresight/coresight-ctcu-core.c |  9 +++----
>   drivers/hwtracing/coresight/coresight-cti-core.c  |  5 ++--
>   drivers/hwtracing/coresight/coresight-cti.h       |  5 ++--
>   drivers/hwtracing/coresight/coresight-dummy.c     |  2 +-
>   drivers/hwtracing/coresight/coresight-etb10.c     |  8 +++---
>   drivers/hwtracing/coresight/coresight-etm-perf.c  |  3 ++-
>   drivers/hwtracing/coresight/coresight-priv.h      |  3 +--
>   drivers/hwtracing/coresight/coresight-sysfs.c     |  2 +-
>   drivers/hwtracing/coresight/coresight-tmc-etf.c   | 10 +++++---
>   drivers/hwtracing/coresight/coresight-tmc-etr.c   | 15 +++++++-----
>   drivers/hwtracing/coresight/coresight-tmc.h       |  3 ++-
>   drivers/hwtracing/coresight/coresight-tpiu.c      |  2 +-
>   drivers/hwtracing/coresight/coresight-trbe.c      |  4 +--
>   drivers/hwtracing/coresight/ultrasoc-smb.c        |  9 ++++---
>   include/linux/coresight.h                         | 17 +++++++------
>   17 files changed, 75 insertions(+), 62 deletions(-)
> ---
> base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
> change-id: 20250922-fix_helper_data-f56018fc966f
> 
> Best regards,


