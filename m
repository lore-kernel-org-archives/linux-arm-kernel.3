Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83030CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 02:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8U+/es2auF/UpL8wkEHJ/UTOBmDkqedpQR+r1cxVz0Q=; b=r/ShS0HXwIUzK2PcnKoxoZLX3v
	qW3+jJqhTLKJWP0hZh9m0NLBSQd2gaiLqADkOh0INdoLXiw+G+CFfS2bg/w679O6hboN/FW0RUyyg
	2/vFCphZ/qpLHDDu0QLte6IPWTKW3WsTp9IwE++s4vdw4aFaOar5WllZvo865h/eaCU5BxDeMN8vZ
	SUn/IZgYm9kWCKduowb9PdAFQ7YDML3GmIkr4z+Qo1CVKlZEd5HFwXazNiM1mhC39wHevVz+gmB+Z
	eWVK86kn2+lqjF/YUEC2IYBzh/Zez41SzFA1scLgO3TNAVR9qxCTEjz7i4fsqZ1szzceB+xCrbUjM
	9DRe2nYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyiO-00000002XpE-1ipl;
	Mon, 15 Sep 2025 02:13:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyiM-00000002Xos-1i4i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 02:13:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMaXdO016601
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 02:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8U+/es2auF/UpL8wkEHJ/UTOBmDkqedpQR+r1cxVz0Q=; b=c6NeE9NZym9u3/Y1
	5GGelEyagUcFuSUPXxt0viCk06INZ5fs9W1IwIkbbpl7gEuI7Z0rQ4BROpupGSXj
	nRizF2zIY8vfBZOrUDrfoNHw2aXlHodU6m/UFN6hBpOMuY/NAuePKC74EUwEU5BF
	9IbVmUln3q/jJ0jJ2czalrzp/kyJ2CPQLLHUQIDgNePGKlzZ5bVFCpUElcB7Re99
	UD0G2BVJHQ1lXUed0yvgTRcWpt9nVl9HEBbHnv1QG3Mf7VVh2/ilrShdY/JFnfqq
	2DewBZKI8Wq1XlGKrt4zkqwXYSHbJrZLlFVhQahNUaaLuJFGOJd4NAu4txbrLsqd
	itqLxg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yjv383m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 02:13:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b52047b3f1dso5189587a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 19:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757902388; x=1758507188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8U+/es2auF/UpL8wkEHJ/UTOBmDkqedpQR+r1cxVz0Q=;
        b=vElsPb9p8fzbDf5beVPrbSt47SZ7+pAxUJGT4UbHRQy4rGmkWNRqGhTWWheA1p/q6H
         nJFyO+RdBLNU+sAMfRbMF0UclfY5Rwu9r0EfY1u6VfnxsH4DaFDR+q5B0sR6KR6seCB6
         NbasMnnt+CWJfjOgXwKtBltV4/qrop6vQcHNu2xFR+tx+ltcAVd3fUo1LxbbN+hguUrN
         w0ZKBVd8GJgNjPbp39arYTP/y+at/kC1FMaGpkEbRkVcYDxxy3cQ/9ChKWPcD7AL7jc5
         V3fiO0XYQ2U81xNJyiM6Gaqe7I5RrwQ0uJxpNWKU3U8Gy7bG+IoaqvAbHSoYtHFLKNHD
         Xkcg==
X-Forwarded-Encrypted: i=1; AJvYcCX7jG2fRRhfl9muGU6qR32C9rh2LdFZyxtVC98Kymyxgn64s5ILZzAipFkpTdeXutgTPFV6SUNZO3GYxcgtQMH+@lists.infradead.org
X-Gm-Message-State: AOJu0YwspNwQ4y8YZCW25qZbvrhNHK8nzdK86zpEecaG4l7B54yWT/f3
	rSr5L4Xgzs5fA+x/GRkE12Hl4i2jFnwoyo1u5wINXdMJK1RdAOGsN1LIyBiWhmg32FwoQMwo2tI
	6YVrwa28y8jCX8cTh5KgtBLYx4KsrdmbUGQlDkFO/Er2APYWWuxYR10CgPJ6bM/ZSGvJEw2vOho
	3FTA==
X-Gm-Gg: ASbGncvT/gxNU9ZmDF8N2M5lnyBGDBsYgiLzoFet2Q/NAAVkxuMlEdz8Q6pyHVt3r6A
	O4y5PhR4UdBrexmadC+YC0K99PGoaczEvu5ttSMBPANOrFJIr3ZkDw8JkOH9gq/uK64oSJEnGXq
	/qNMPFZ9E/H6zBgZis6Hp8ehjAzpvp6VV7SJ/Yxi6t1azRDa/ll92utOl6dk/KEkNVWA+E6XHdf
	n9S6k9VDqhchFoQd5rRVQjtmfFE9y8rI65acibqiD+6dq4GtItcy5IGbwKWTDMUJ3eyarbi1X9l
	LAqCN+tlMXVE92zhFR0rsAjThIrD3yEp9+FPMzpwqeyijrdA83KOpeEpxai0lEWBNTHOSD+nD8A
	eW0snt2PE2shA9tlWG/T4IzE9yMDpsQ==
X-Received: by 2002:a05:6a20:c40a:b0:262:23dd:2e8c with SMTP id adf61e73a8af0-26223dd314fmr5121181637.44.1757902388560;
        Sun, 14 Sep 2025 19:13:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNdmgeYdPGgEBBnW9LZnrDbOV/8e3BmXeugleNAIQXSUHtKSZ13d9gG/jmrPwhW3MoO6DJ+g==
X-Received: by 2002:a05:6a20:c40a:b0:262:23dd:2e8c with SMTP id adf61e73a8af0-26223dd314fmr5121157637.44.1757902388124;
        Sun, 14 Sep 2025 19:13:08 -0700 (PDT)
Received: from [10.133.33.184] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a3aa1a22sm10159814a12.52.2025.09.14.19.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 19:13:07 -0700 (PDT)
Message-ID: <77342c70-3b75-4ccb-ae3a-c0418511a33e@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 10:12:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
To: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mike Leach <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
 <49bf23dc-705e-45ab-a2e3-fbb798cd8e34@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <49bf23dc-705e-45ab-a2e3-fbb798cd8e34@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HcoUTjE8 c=1 sm=1 tr=0 ts=68c77635 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=iF4Rue9Sqs3gHakc6bMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qQTkq5I_5CAJdsHEWak4IwoTd10Udy4m
X-Proofpoint-GUID: qQTkq5I_5CAJdsHEWak4IwoTd10Udy4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNyBTYWx0ZWRfX93Koo0UbIE6F
 1Xo+H6/VrQ5wZEQOykXh0Eiwb6+CJsS+BBOBhCLePv8ucuw7XH5ifWEmIpW6RH869PeFMeUODgj
 CiV9A9SyWeujX/+iUDtnTB2/057i8SFLSFHeyIrkQ4lxx4issSZZLpMdIVFLyl+MdsLQgs7xZPa
 dJIrbZA8VDJH1TPUNyZBjKPzlj/97iWby+vloqfoFgXuWoU+97/FF1S7rSzm/Ztvpy0N1We8VGo
 ksO+gn7zkDSbHqomXfwvBefj+T2R5GRnULeOQ5l0WZ7ZvUBJYVkWVvQi374Gjes9MNPbpaKgUTQ
 ycCxrxGUiShhJbLcJO0RzzNNAtKTkzNkiVVGJLvQvj+guGkYcwzbvSIteDa3pUuceJUuxGyxZKy
 H1rzCMnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_191310_452940_9718B99E 
X-CRM114-Status: GOOD (  16.39  )
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



On 8/27/2025 7:59 PM, James Clark wrote:
> 
> 
> On 27/08/2025 11:55 am, Jie Gan wrote:
>> Patchset 1 introduces configuration of the cross-trigger registers with
>> appropriate values to enable proper generation of cross-trigger packets.
>>
>> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
>> which determines the frequency of ASYNC packet generation. These packets
>> assist userspace tools in accurately identifying each valid packet.
>>
>> Patchset 3 introduces a sysfs node to initiate a flush request for the
>> specific port, forcing the data to synchronize and be transmitted to the
>> sink device.
>>
>> Changes in V3:
>> 1. Optimizing codes according to James's comment.
>> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1- 
>> jie.gan@oss.qualcomm.com/
>>
>> Changes in V2:
>> 1. Refactoring the code based on James's comment for optimization.
>> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1- 
>> jie.gan@oss.qualcomm.com/
>>
>> Tao Zhang (3):
>>    coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>>    coresight: tpda: add logic to configure TPDA_SYNCR register
>>    coresight: tpda: add sysfs node to flush specific port
>>
>>   .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
>>   3 files changed, 360 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>> devices-tpda
>>
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> 

Gentle ping.

Thanks,
Jie


