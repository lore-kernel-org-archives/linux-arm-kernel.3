Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E36C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2F2tft5UjMrfRl3YRgRsxIlyPACuq0DMYHaQoSibLhs=; b=XEGUwD66CgmNu76ikbASpGa0aU
	noayUruvsXBsDbf7PI9UbMUhmHmV6Yx5eAfX6p0Hsg69yL6bvYYC9IN5mJGKakWVpvq55bu8Gg2N0
	U/Vwwt4lXLGyCsQxt0yVkASqj/au0OloI0BweYmxZJCWIVC1ZpLVynF8bGdnPg+f+JIoai0wkwR6w
	RL0HhVOz+XZimDogVn+mlIkE5fCmlH2kFEeRM01pleVDvnin8MHlEVetrF5uAYvq6QerM4O1UZ22O
	1oieYxrSE2+uAGOuuws4LFCD0cMwaGjTTgteFlVVNaA1SvvYXTzYPM2ZyN0d0JIV16o6CMqQQ2daU
	yWSaRHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJwJ-000000035lz-2Lto;
	Fri, 09 May 2025 09:22:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJXY-000000030QT-31tz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:57:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493CCbj002149
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 May 2025 08:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2F2tft5UjMrfRl3YRgRsxIlyPACuq0DMYHaQoSibLhs=; b=lkTTIOEvjbPa59R4
	Tpe5RhIffXWRGHJCpujGHyUyNJxwTsXk2n3FaqED1sHOdNPhgATzJo0hg9GyG9ws
	unFt0UtJmdZ1BU/YtwcR0i60hyNqtS32pe/WZuVXeglTSyQhKGqDcDuwHHwDYoZ3
	rSiZasPBGzn7bfBLcJqHpsYAJh4po8/B0m30UrfAHEy6EFKViBSpus12dkANSr6T
	zOELjP/CJftk+qVYdZDuD1KiZrTKyi61RnyyQd4rmuL7rKqa4LEk2XfBQKEeZQ8Y
	BM211eI4cqUedvyeTSRibTk4XVe8lmkyDPVwXSjNqctfRVDYFSRXHz04mdIjSvJZ
	1CUpQQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5c03n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 08:57:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476695e930bso4109371cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 01:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781027; x=1747385827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2F2tft5UjMrfRl3YRgRsxIlyPACuq0DMYHaQoSibLhs=;
        b=luIY6UXa4n5MaXwNquDipeqUWp/jqB39cUu/hdw8NvBYC2iultNZZHfa5fLejIr5Be
         zCd+YMbqbSe7Hc/INlBsoXeKtz+Eo36yuK9aBJ4PqBdHGcvzy869rxxovBdHK9ee1FJc
         UH0MK89iYsCWGfOJNZkAbN5jEm592Rdm/CNpzc1EbI5JftglQeJx0CwH2xvLpQ3c/Rgx
         ANL5ZUK4pkmElXluUlo1fidGI0e5D+7ufHs5TsVCNjHKVpowtsTH64v73OBcuAvMgtML
         1RC8C3/IaXsWsU2qSZ3W0i/PF+zIKEkHxB0z/9h0orWz+DHld9plEPxjrr77J0tYtTdY
         Rhxg==
X-Forwarded-Encrypted: i=1; AJvYcCUWzdw/Uo/amfLwMjGxPXTPi6Wq/dSKpZ/5cKlxqXyGB+8pGunbHJZdHJV5EHJIWp7u1AP7bcS5e09TBYF6xp9w@lists.infradead.org
X-Gm-Message-State: AOJu0YzdWfPdtvqv+oPdc2rHrWTu+oi1qyAfRsV20Mdr1zGNcV5apQUC
	55mv8E+OrEahUxs1VUxtO27+k7yfr7DNWmpVy+xZxAELU0brH8llqwlxOTx0Z4fM8Yl3jim7HEb
	pqfxKxdjMxDSjtqQ/uPpeT8Ck+aRK9rNMp3Y9/cSNiVoWA09XEscJMcsx1Ynky9HkaxovASjIVw
	==
X-Gm-Gg: ASbGncuJU9bhybNkswTp0IJEopAc3HL7ae+PlBotM49R8qTzj0ApxMEnZmbs/QCYneB
	jqHo61LSjc08kEkPpOvTH3A33BZsAqLOhIBT7CKQTCH4VJhb2oKsU1jbjnFVJAmVrcIH826Quwr
	xFn6+bzKBNLDXKmAW32JtdY/EzAmFPRjdCsRIrn9KXii9IcxRjNvwopj7Wr4NOytoH7fxxLHQG+
	Wqo9waZatv5rtKiucmYNY5dpwhJJYCRSExvqYIlbQStep4VmjYigtVqqf3/Y/7hLfKi+RrNOJoj
	vBoXRn/D/laq5Q8OVreWGkg7YUclBFDTtpmkqYyp0XAfViQnGiXNT/FQN2+YNomXMks=
X-Received: by 2002:a05:622a:4cf:b0:475:1c59:1748 with SMTP id d75a77b69052e-494527d04femr14440301cf.11.1746781026573;
        Fri, 09 May 2025 01:57:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxeMUsTznzv79+qD/JwrjZfuwI2c0VRgixgGeW6tBc4r4HMOcMF9Pc59SvA9wJVZojTbpvtw==
X-Received: by 2002:a05:622a:4cf:b0:475:1c59:1748 with SMTP id d75a77b69052e-494527d04femr14440181cf.11.1746781026180;
        Fri, 09 May 2025 01:57:06 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm119615366b.8.2025.05.09.01.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 01:57:05 -0700 (PDT)
Message-ID: <691487b5-bcc8-4013-8848-77019e7476e8@oss.qualcomm.com>
Date: Fri, 9 May 2025 10:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_sdei: Add EVENT_SIGNAL for ARM SDEI
To: Huang Yiwei <quic_hyiwei@quicinc.com>, james.morse@arm.com,
        linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, quic_aiquny@quicinc.com, kernel@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250509064552.3330202-1-quic_hyiwei@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250509064552.3330202-1-quic_hyiwei@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681dc363 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=_FxPWtGLIxKa-BK1s2sA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KkOplNaRJw_amq_6NB2NO2-0OBlFym7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4NiBTYWx0ZWRfXx6LWYEOdinSk
 DV/+VcvCemT9GK1+naxyLCZadx5eeNG2ubcH+o5/vQ0efp6NOYjNBO/AF6ZiKG9rf6f3UXhwEE7
 Ylh1qxK+ukmsRITYXbBvz55TxeReW8Sfqn2ZCPgObfYF6YudVpNIyvFaBWs5u6ajJeAi9ntIV6y
 G9bGeA1W/5w+o2n5MithtpJX8CSGYoBSgNsLMNebq6UvXg1vDxrq1a5+eSTAq9ztdqMzTeoegu3
 Zmdhp7ZSp2nW8pnWFJqG6pZWuZNZNKMjRlPCf5Ssg7VzwKymfMzOAsHGgwGITkO9oDPjxB4VBPE
 Gh6H6nc3zgphIG8ANliDC8xQAbxMcf2xgF60eFV6mIOgV3KsGofWLQqWxrKHgcNaKmDTT/RfNhl
 es7POolRqz6L0om5lKs+0NTI25zhK04ds9cQq+o5Dsnw8Gei0bAV7FDvR88IiR26bdVynHYu
X-Proofpoint-ORIG-GUID: KkOplNaRJw_amq_6NB2NO2-0OBlFym7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_015708_880670_C201D852 
X-CRM114-Status: GOOD (  11.19  )
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

On 5/9/25 8:45 AM, Huang Yiwei wrote:
> SDEI_EVENT_SIGNAL is a standard interface for SDEI feature and useful
> for customized firmware calls. Therefore, adding this missing interface
> to SDEI driver.
> 
> Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
> ---

Patches like this are usually expected to come together with a user
of the newly-introduced functions

Konrad

