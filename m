Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4579EC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOBwJphAd4cD2oSNE9q8Kd3iMs48r1qUtnTODQfgbqg=; b=vWWBmQTNb5pkzEN56CpzRUszzz
	MwAG02Xn3E3Rw1Xu6gnT0uwD/WeM69xupb8yCCpjPytPnoa7uruku4NszMKzEJsB4O+uS5DnsElLA
	vdIdJ9BZTNThVrWtOjnyTcHQqc3/Efzb/AdgJmu/nQxVIhaZ74XoCiU2mSdhGT7Px8QYQGXyIHAM1
	/YiebxRxQ7DuIdS3k6wmRtP+F8raWGizBcy1fZqVwgP2f/uATa1yl7pZV65CZ4gvdwxrIBzCiJ205
	DhsxUk1sw5BwcWKeUccxMFkFsNX5rWIb/Vd58bGL+6uZExTTX871Q9GlRVmXCUgrBgtu/NTV0tXuP
	2PgMeaYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0y3D-00000008zJ5-3ImA;
	Mon, 31 Aug 2026 09:11:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0y3B-00000008zIE-2Lsj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 09:11:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V8vmNp3302881
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 09:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nOBwJphAd4cD2oSNE9q8Kd3iMs48r1qUtnTODQfgbqg=; b=j3AV5lWMlFbf9yBb
	kfH8H9fSkW5REqUOSF4Ve2qmLG0N4cSJSm1cGni1wylf/yAJo6ZO8g+qAiHMTvMV
	uHO7avN4YkLHUr6/y4hjGhpUiqpxG3dsgCx35fkSqCDgvEu/kk2I9FCvAluiHqIU
	639QDhdnXce+NTq+bpUoiVTbgq/Py1k/jft2dXt5U+CW/5QG1sDuXxEJvstLYdkV
	Jic6At52RCVj1R6lqoiwF33ZpWNNc7Pj3iVQ0bax8Z0RHjXsaMaD8XNlLn2F3XIb
	ccNBrgxdBWfWGNv2imTKFygKzrjgqCHdvzqjP2sN+J5h9OaYAdyfWFLLUBDYAtu8
	aRQWBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jgg1ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 09:11:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc640dfde3so38504725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788167491; x=1788772291; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOBwJphAd4cD2oSNE9q8Kd3iMs48r1qUtnTODQfgbqg=;
        b=OBdrdNpRz69VNqUJpwoV6u6QzG4K0FHuCXmRLWQOJo7lQNRWM8imZ0jhILzW3t6eC6
         hRQTJc9RL6dHZxjbdC9ACCuXKWPtU+dfau/7AQvzxJlV/0UD1o/6/mf3Qp/OZcA/uxuR
         XRq08+ELgGPD/GQNP7aVKDvLhTUymIO47OMGgq7H6xm17vgsvJVB/kHdg9/ZHY15PhoX
         OtilyFYTJ48PiEH9TcSgXsqeTews1YkPkY+OY5fRIy9mlSAuKvmS6sEQFuwDbwFJxcJC
         fBbxLFHizLGZgOmIiGknPbNeLGk3CSQb7OXFrmlzzWIK77dGIg8UO+YiRULtUr41mPxV
         ZZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167491; x=1788772291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOBwJphAd4cD2oSNE9q8Kd3iMs48r1qUtnTODQfgbqg=;
        b=cx90YBpL6W7V36gN5YFaXLrBEtptYgHG+1eE9jEJYk+9bJbQWqwwgbt/Zy0bGls+Gk
         nAWM2JQ1KNN3ZxJui18xBS0+/ElSrflU00eVyJN8RKHF8drjrxwmI8IaBKgVYhRuCZuN
         5F00vxEijQA4nVCPxOwN74BiOYaJRFBuSUWV0IvF4kQml65+pHOHZnHbEVJe3PvpXIgd
         kFAkR/lA9Mo3GSHadtRSitRmzE3CMX0ROKxUm64FL36Y0An7kOl2+z8Wy2y9AQfnc/LD
         scPIBrUoEdV5pexQvLSYwsJ4F0qOdJK4yNJ95qeE4xHrSKomkzFQGEOzZtcvcp22q66u
         HGbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ/eLZMgmW7AMUtDKp5RMj6+IRYEuDZxl+/sz6yJLf+yqlRNLga2OTpVpmAHhyRd2JOWbALkfS0+uTT3JUFEi5@lists.infradead.org
X-Gm-Message-State: AFuF++n4qPn7538u9JD61KO2kV26rTKiM5TFA25/+XkAjyaP08Iwv4+M
	86/OkcPMktrLwu/vhxFQ3F1fCfUDmNhvZxNiHBs/MDrso6gznntAczI2HhkbRs9pDB0ghSIzoh8
	n78EByshW1KGSjEQGdERBhc/7XQZE67zzy07EITdSjDg28hWpbZuoM9kdCHrcLAb+W6xtW0yVj9
	bs8Q==
X-Gm-Gg: AR+sD10N4TXeashSYObuFWlGaY7ZqodfEgW18fwS3Ds/0Abxs429/Ve6SULcv5sUM5D
	WEbJ4oQu0SCfv6IGzdAxZn4VmTdBpaQ5OsbbJyTaYjGO5V/GcTMp/0sn37cbTwgI8b4qSG6Y9IW
	P/XNpZ+JmWFgL9cJPClECBbdkah71RPI/Lo6bcY5I9KXFfY2/mgOo2cBbJp0l3EIesbAt4atEZU
	sep0bUeyd8fkABV6psC9uwpZjfp/u3QK39RndeU79VWcpf+6rqo4p4Awp+t26Zq2DMxtk640Rlj
	BHdCLKlzu4GCj9YRxVVJv4DK9wsxsm6hYEnQzL+3cHnUshGC38SQgKpkQY8bXp/EPwsIxRfTGYu
	8Hk/3jjHr/edliWjp1yebJIh1QAMHN62kVg==
X-Received: by 2002:a17:902:ef4e:b0:2d8:d4cd:dc93 with SMTP id d9443c01a7336-2d8d4cddf80mr261831785ad.22.1788167491449;
        Mon, 31 Aug 2026 02:11:31 -0700 (PDT)
X-Received: by 2002:a17:902:ef4e:b0:2d8:d4cd:dc93 with SMTP id d9443c01a7336-2d8d4cddf80mr261831065ad.22.1788167491015;
        Mon, 31 Aug 2026 02:11:31 -0700 (PDT)
Received: from [10.217.218.20] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm32564294eec.7.2026.08.31.02.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:11:30 -0700 (PDT)
Message-ID: <06f17ae1-6d42-4a56-88b3-9f5568f6c9e6@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:41:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] i2c: at91: release DMA channels on remove and probe
 error
To: Shengzhuo Wei <me@cherr.cc>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Wolfram Sang <wsa@kernel.org>,
        Ludovic Desroches <ludovic.desroches@atmel.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Yao Yuan <yao.yuan@freescale.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
 <20260827-i2c-dma-channel-leak-v1-1-271d4adc03a0@cherr.cc>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-1-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1CDaY6XMzJNjMqWrm55PROXW2upO5esd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3OCBTYWx0ZWRfX/ALoOCmoEufu
 0lOhXvR9C08Bat+PWTQtJwNqLuChEwrD7MMpi4zsE4HXXpPl9+if+Nmc33hlWgzylwaojpSpwJZ
 zes5dSFqkFHG3bv1o9xc9V7/sXr7HY8=
X-Proofpoint-ORIG-GUID: 1CDaY6XMzJNjMqWrm55PROXW2upO5esd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3OCBTYWx0ZWRfXyCBeqtuusPBt
 v/2GTcZQUOA5yfWbzQaq3blcPRTVE4wBgI14gqvd2v6+Ht2bmphNYEZ0VPARKe+wRU1Yxl8k6fy
 q5rl6XIj8IUIqC098Sc71Dd2OPiSlv03IB5m3VHuRCvuiaXapkUIrnLXXaXgeZISoSFbWG/171L
 y4OC9RKyXjwUCcXMdzUczLdioqeSlgAM1pHSX74VXXMPaSoR9BgEPUuEw9mEDdWCAk1fqG2lvr4
 tzt2CppH0G//3c5XHw+oNvVleRE2QpP+81EQ8wqFq9LuACDBvOgWGOCVtb+tHrEopedSfCROwPO
 rzF3UwMXSXgnUY6KMEooHBLJpjrPtIPHJzsEiDht8wjx3GcuOBZQq9y80MQXGKOJzVZOBRZU1dh
 AneYPiED9Rj4OeU9esOfcRF1FQdYKiuM/JBcpyzBPa1J7dGLL50O1Yprm4/XON7t3dhJGfm0Ddo
 C4yXvks5hHoisMWkhPA==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a954544 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AkmRZ_q-vRwkFVX3bY4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_021133_724482_581E93AC 
X-CRM114-Status: GOOD (  12.81  )
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



On 8/27/2026 9:13 PM, Shengzhuo Wei wrote:
> at91_twi_configure_dma() requests exclusive tx/rx DMA channels, but
> nothing ever releases them on driver detach, and the probe error path
> after the channels are acquired (i2c_add_numbered_adapter() failure)
> returns without releasing them either, because the remove callback is
> not invoked after a failed probe.
> 
> Move the release into a helper, call it from the existing
> configure-failure path, the adapter-registration failure path, and
> at91_twi_remove().
> 
> Fixes: 60937b2cdbf9 ("i2c: at91: add dma support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> Assisted-by: GLM:5.3
> ---
Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

