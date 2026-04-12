Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BC1F3ED7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntDR8NBqpIqaw9Ou8YQiyz9oJYsTv5hhvLULdDquyzs=; b=Jzr6gzZPqzCY12ark5dtA7xVNM
	De87aWFTnTtpu0wTCHlGvNROk86A8O2nhkxLsWb680V1rgnl8U6qoP8VJEXdDCuDmH4gL6IdZCF/h
	5XfJhjFlefBlv7vTR0GSwhIGjGbPk0QP82klr3yCndA1TmsMgtybV1MECJijHRiKlFrigCbkAdkJ1
	VfnzSnhrq/+yTmkTIQ3cD7AizS2AlNJP62ea8/K8bn7X6+UaiuF38o9J1veI6ay1YSBwxlGycs55P
	thPRQmZYJWBc8QtA8kvZF97kWPjz/ru6ImbmDdn/MQPm/tlZqiM5qCZNS49VaRhgi/HqBbx37EKgw
	0HYR6Dcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBrEE-0000000ED2w-2nDa;
	Sun, 12 Apr 2026 09:35:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBrEB-0000000ED2Y-3jRQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 09:35:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63C8pWEG4001313
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 09:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntDR8NBqpIqaw9Ou8YQiyz9oJYsTv5hhvLULdDquyzs=; b=gHaRacsIHQ3rhQBO
	10CmLBKSZaS9YhpTdxeU5anrIQfP2dDbLH2GcpvxkZX9hu6rZyO71XFHtuu0NrxT
	kvHXNgKtvAugWtIrMedoZDS1dPzMkbsH2l2r8XZImLI/vcLYVGZ1FKcpFNbfo/p4
	nXqatTDvmi0e0EvDrGTYFECibheFChe7KLcrBd6ONdpa48ulBHy9K8NSJRHCzXSx
	dKQYNDeYpP3qPSuVQk251hlI0jGasdWGzqyHPkhsxkpwhctQCeNcsdNu7fs93apF
	lW0oHuW/ALgEg9JXQ/3I52LKAGCi0uvWQWq9Z/OpBQItx0Da38ph37eGtXRzQpuI
	FxbPiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtj4rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 09:35:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso85725071cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 02:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775986537; x=1776591337; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ntDR8NBqpIqaw9Ou8YQiyz9oJYsTv5hhvLULdDquyzs=;
        b=W+6KDgIVBIVGSZK7zxlZ2mLrz6lPOR7BgTUto/m05RsmLMcmkSKxEnvyZckc+39q9H
         xnDaMr8Izca8oVei5qJ2Y4pC/jnB+w9zQO2hB4XyVmVFW5NsVI7RmbZznV9fyzfU5Hm9
         yRpvg3MVSZrKknQlgr6QeUK9zluDYbCT4g9m72OmJ6PeSO5Z1heskWpqTsJjbB7oAplj
         FGV7B2UDBKu116U5lGRwP0hpAUIh5o3sqUqxfxjGy/4btyHnbrBJTN6nhzDVrXqnkUXy
         nz5xugsRLNEvEDQsPZGT5uNoBEzlJg9oaFcbfrkrFLNUdFMfHy39ZKL7jTxuXki7LZ4F
         UBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775986537; x=1776591337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntDR8NBqpIqaw9Ou8YQiyz9oJYsTv5hhvLULdDquyzs=;
        b=BVXPJQUzjz7Ryd3k4kiUh9zY6Kr8lQ3mdE94wsljMvl7iAM1f0Uv5ZQxauICD8HZJJ
         yvINc4n/J7f6doZ0drI2/pvJBEV47VUTVfXtoQSiMILdYZ8SislJBHxYzEQb7Gsm0A7r
         k58+GWNc9z2FwhbUSe6Y6ECAXa8NWVL7j3seskkALmqLfnea+uSUUHVxXbkG1Vr0bTkp
         d4xrXqQEwPatSlR6OS2SomW8mBO+6ULD4rGjciqp6Mb8uRD3Hkpg5F+XYoSSN+D9U+74
         wqTjnY5l0bkrDaZl/Z4PqFjD8g/5h9Dfkh0khAlY2Y4qhzYD3ySLyuLzHUf5TLmTNzMw
         CY0g==
X-Forwarded-Encrypted: i=1; AJvYcCUO066ZqkldRD/e+6VJViuKaeAoaehJdyz4/JaFy+Iimh+Z+W0MxRiDT5xd9Np9MrvYdh/VQbuUErCUe/b6KXdL@lists.infradead.org
X-Gm-Message-State: AOJu0YyY+RKuD7DPCW1EvTq/TebfHOA0g9QpD5TERRbE4qWeiS4SiOyP
	V+RR4K1pAOyf83zK3/Gc2ckV0g2YQNXmTRmjZhODybPEhWr5qHlFH2SqT9/C4zEqhupB158Y3E3
	4CfO+ZKUWXk5VOinW6BIrbkfuGoPC0AlcEKcVkrDbZLwpdH+aCXRbUrocfj6+lwerMswF7B0FSX
	zQIA==
X-Gm-Gg: AeBDievu/ykPHINckcWtfIeJ9b3GwVEajDRzMpQSTG60aacTV0FuRJgs/On1kxRFapQ
	Gw7raFJ+/K6PkRoETuY6kTF/6vphPCSgTwpiwu2SIA206//Sm/KMJ5faP00U3ibzYy3XXjneF8a
	7Vwotgn9phTiRpYdYZHQxjlwZZWJ17ODfMejyQ0GHO01qvSWyvrXvIw/LW9e+QjsvKMSOE5dkMB
	eq8ye+41G/cJkEp2S0nEsTxz93rQ2387DPXfqHlbomY2BAtBWG96WLPrilLHGKOM7QcboImY/3I
	SevTbg+zakNMUfnJdTMHbZeHhbBRk/XQjuOr8JLNZEutib+hEpw2pUoSqRFcezzMhgIpoYwV75Q
	79XBX85O1RKFc6XDtThBlGRto+GdiUPaTaymUyw/N5LiaFN9mSFXS+yTtfAz/ob29zT2HX/woRD
	fRoDbVBCOb
X-Received: by 2002:a05:622a:8a04:b0:50d:855a:8909 with SMTP id d75a77b69052e-50dd5b7cca7mr107850961cf.32.1775986537187;
        Sun, 12 Apr 2026 02:35:37 -0700 (PDT)
X-Received: by 2002:a05:622a:8a04:b0:50d:855a:8909 with SMTP id d75a77b69052e-50dd5b7cca7mr107850761cf.32.1775986536700;
        Sun, 12 Apr 2026 02:35:36 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ccc9:82ca:cc1b:b64c? ([2a05:6e02:1041:c10:ccc9:82ca:cc1b:b64c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5df2062sm69408705e9.12.2026.04.12.02.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 02:35:36 -0700 (PDT)
Message-ID: <e13badf0-def6-4fa0-8009-f9fecf6a5c88@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 11:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal/drivers/imx: Fix thermal zone leak on probe
 error path
To: Frank Li <Frank.li@nxp.com>, Felix Gu <ustc.gu@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel
 <o.rempel@pengutronix.de>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260412-imx-v1-0-cc3b45d63811@gmail.com>
 <20260412-imx-v1-1-cc3b45d63811@gmail.com>
 <adruT5fgNSZ_VOLr@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <adruT5fgNSZ_VOLr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69db6769 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EhLqWX2mNhMJiQ7EdO4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: jsghHpAjnu6C00YbhXPD99ekpdoKm2MD
X-Proofpoint-ORIG-GUID: jsghHpAjnu6C00YbhXPD99ekpdoKm2MD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDA5MSBTYWx0ZWRfX7lSA2DIIrmeU
 y1yZuJS11n5YUPNCH/5ERgcc9hTydLYNhb+0wtWqBSYkcVueupR1vzkxxVYgvVVlYnPtCz8EGik
 5DhzkO+XOFDKkw8xHVO/NOzaTT7B7TNqFyDWktcHx3G6+3zl2ErhGQGFfCCSpfapMT+BzZcu4Yg
 mnHBAC0bT2Fdtl06MOKTPSOjG7TqAJViXAK+JvV2wVVrPVTB6Wo+llZPFAXSGHbcLj9cyP0A4/V
 2pfhwtOS81QDnGkR5gxZqN0Db0VHeAIE55taOxaqG+b/5DO57SqRrm8He2cDd56hjobx8PF+sXT
 tXcsXtLplYnXEH8xlc3gcqbl3BoVe+Woh1UMF/eqy9zjbtYn0n7ZHnToLxlHidTFrb8ZhC3FrB9
 yIIuHVa5XqaSMpCncybN2zP8v5lrN8Kpmp3FNGG8somBySds6hz47CPtO5+ZjqQkOA1EcSaR3cM
 DUm+/oN0f9+8kgMBYWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_023540_086078_43E32721 
X-CRM114-Status: GOOD (  11.03  )
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

On 4/12/26 02:58, Frank Li wrote:
> On Sun, Apr 12, 2026 at 03:03:03AM +0800, Felix Gu wrote:
>> If pm_runtime_resume_and_get() fails after the thermal zone has been
>> registered, the probe error path cleans up runtime PM but skips
>> thermal_zone_device_unregister(), leaking the thermal zone device.
>>
>> Move thermal_zone_device_unregister() into disable_runtime_pm so all
> 
> Use devm_thermal_of_zone_register() to fix this problem

+1

