Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73DAC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=palpmFZZO8X/xAXI6fll/8vpW1RA6tZdCLOM/AIPfzE=; b=SkDCqv2ZzsQkgeSsSooDaIFFzH
	SVtsh4s65CgLP1IJ9EWuk0ZxeBmumiKVR3TSDo6Mf2YTUS8bEyMD5lsarojveSR9islnQP4MorHR6
	789VVnZc4mjdjU93Ba+wQVS08eLi2SLmmwuFlJF/Ru8n8cZjfNc2guhoiUO7hjykg9ZU+8sXuV5nw
	RfwW6ebb7AR8VkvNHROK2v3PpeWhKAX1ygSdqcgiTa/S/F3XmCjhRYEDRbMWIjYO0b+xbuB1XRXEb
	c1iaPvvRnJoZX4rpSpuxwapynMBL2Q0ZsqyCyhFtnBX/vNTk6CubEuVgP5a0rCBsuA0dg5e72PF5G
	xIW1nrTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xkR-00000008wth-1KDx;
	Mon, 31 Aug 2026 08:52:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xkO-00000008wsW-41TU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:52:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xsCZ3167393
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 08:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	palpmFZZO8X/xAXI6fll/8vpW1RA6tZdCLOM/AIPfzE=; b=Cb9qiPO1ic/fp51i
	A9Y2ZhtgOkhSln+gHhILBIxKRU9q+EFTQfIhJ4xKf3wSbJzN0zhWjc1wjKvCjW/J
	20tRmMpCyW+/6NVKa9ju+y4z34Z1xhpfyAlboEeTtuW95Rucj6k1F4i1tL719VRR
	H7wYpvc/yeIs2lWB1lSE8pg+CBO0IWoWkT6ey/hVX/H+KRECt+7Fqi+odS+2dl0A
	qFhZoqADFb0HvLuYkRm1kwuOOxblBsRmGTx5jITenBO5AvipKEk6e0kwpMD4rdQU
	pwUrlCvklDqEPsTAtZqr77iOoDzCBPICWFBDq/2a/PhbXYlmLsDkqzi2JheDwFRQ
	RC/M7Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgynk03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 08:52:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso5503264a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 01:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788166326; x=1788771126; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=palpmFZZO8X/xAXI6fll/8vpW1RA6tZdCLOM/AIPfzE=;
        b=X4yx1cPe1vxIITkwsm7XZIkD7JHWn5aEWoxrs/vpqZiCj59nE0bqgcbSCHWuljxQZj
         +dF8jfYE1xicc6rbYbZP4PGhgww7sAAzZZ+Og+ppgBHdO7SvxEn60pbyHZYmPwdW18Tg
         KDIRRrIkKo7/PBhOqvNR2gDCpTM8lwFtWzi99iTUzdSx26xfphmCvuGsBxwAQKmWuwKf
         f7dVPjHCDK/rrg3hFnNItS68ZOXYSpHfidiGnFvf4kg2ate1KDYyJpRZXB3gCPxGjWEU
         OLYJuI6YnR+aE9d1W1eNuChLxiEX7MThaEHOlXzS39Bs8skVr7MrU4TfVVGnzNTIW1t/
         JmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166326; x=1788771126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=palpmFZZO8X/xAXI6fll/8vpW1RA6tZdCLOM/AIPfzE=;
        b=CCL941AnQ2NoiPJuNgwuy/7bsKNDO72ajfYAUspOVfBrbXlmFYsoFD9Yznt9aO+bS9
         63H4c0DfQ0PWnQsy/EImbQkJft0I2lWhA4STUomWyCbX2ENbSTaAhcFL5nUaF8p6RCPo
         Np+1v+w0V1PlIAzZ774oear0SjElDJ57WBB/xpGXSFnDb6BbvnlG1dqhCIP02vK9xXvS
         q7u2d7Kea76u2/5w10KSjf40aq3RmMwLfPNm9EWR1saMoWdP7KD6GN3F3inoKYsfOkgF
         F1gkuhj6T2y9SJQ/M2PwQkUuH4Vcex+uff+KkjXtMDU+Psr6moutTIXwsrzpgIBIM6nm
         c51g==
X-Forwarded-Encrypted: i=1; AKwUvBzySeEMfeVtfkYjDIggsax94dQGip9Oir085EffGBphZ4pAPrjLRVj7/BPff0u0JC4CVMJ1Z+69x6ngS9z8+eas@lists.infradead.org
X-Gm-Message-State: AFuF++ncqf1XcJJsQmIXmhj23JFjpiCD9GuF60z0aubra+nQC1tK+1pd
	sIBg6XCWgBuXedRgIG9Bub6RyPY8vYMI1zuuf6i4mgdUG35RnnN2OTl5w84y2EU2/ZpadIgcpPF
	N68VWsGLvhXzLaffWaeJhxZncPQM/BhGYn+91RpZzQ0iW04d8I7s2WmEc7Qx+RhAMVK+w/0gUwc
	SDtA==
X-Gm-Gg: AYBFou2VPryogwlhfdYfZCKHRBzu+LBjFgnomYSer2TCp/qNo8XS+Punl8zlNUJXXjM
	Uk1YnVDzPq9iN+uncP8GLnpdRRHxxfItNT6cZKurE3eC/Ustbyo+HMUTtJcbCKpHLMeQzNsljPY
	QD33YgahkNpiTioKzQLgt8T0owSB2slTG3/JEkmU2gHOTwqoa+I8RjLwGHts4gkCjUHKyB8yvn3
	FdWaxtYiyO6eYLISLsky6yHbVnsqpWN9It87QRX5fZh4jvFf26MhSuFLLB9in9lTHY7GE0nB3Gd
	PpxyigOn+viEgPkkyl+MKRXlDjq+b9rzM9VKAU8MnKp5/VBA5brh/kEvzfmGPmJi3vaFUJdxxMG
	I84jRKDI0omVfVXEAhAZnbSSyy/4G+S7ZTQ==
X-Received: by 2002:a17:90b:4c45:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-398ceed6d9dmr12393518a91.25.1788166326222;
        Mon, 31 Aug 2026 01:52:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4c45:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-398ceed6d9dmr12393440a91.25.1788166325630;
        Mon, 31 Aug 2026 01:52:05 -0700 (PDT)
Received: from [10.217.218.20] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm46282736c88.14.2026.08.31.01.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:52:05 -0700 (PDT)
Message-ID: <8ec899c7-61a9-45cc-b332-a98d2c0ac344@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:21:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: qcom-geni: release DMA channels on probe error
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
 <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3NSBTYWx0ZWRfX7s+0bURiMwkg
 X8yqeKPwzo613+IhBHIiO4b49kIMXMQPCGaM7H1uZOpYqM9r4uVKBOyqInRTanYIY/rSlO+EjyR
 Wt5d4kr4f6FAbS9FXjYCiTbYrZ/qCgM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3NSBTYWx0ZWRfX1cDQA77sa7hh
 CHdOX8TokUoopo2dAZm6uIs8XE46d9+kkbgSYfihiNjxVpLgAaqaLj04upyn65qCxjlYiw7dApH
 9lW8rAa/UANzbQGmSIJCmXdhOms4ed+8foKpgfCiWz7jaDx8215TL6bW9HnROvnWtyGywzLRs6K
 qevXsmTfFbrkARXm/tKNzR3PENVwpuK2ZquhWHE4uJP42TkxJ3bu6MDfEEqQzbdmS4a8Qb6OAIY
 v9vTf/vbhtD+vtoWHVeJgNV/bfRT5osMYb8cMhcRBxWpeqeU06M5l4waYTxZzJijywFqsRAsoHm
 XU3cnJ6Hm4RsClEEbyE7Ky7+Ekw0AjIl+S8wSaulmW2ZcAvHhMJweSf6dWaN9ecNrl3vDEweRYJ
 O5Qn+D45zJScO6QP3N2DPs7r6D1Chr+xm4b1UtrIiEsdoHp+HZPh5+U7+uFnYjNdklVHoXclpQN
 BpE83NxTry+Cpo9f0Fg==
X-Proofpoint-ORIG-GUID: fnub8zekR51aa0SL32oXQLdPw5Ef9sDQ
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a9540b7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FqpsaMCCsM1CaQCKzz8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: fnub8zekR51aa0SL32oXQLdPw5Ef9sDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_015209_127563_728CAB5C 
X-CRM114-Status: GOOD (  13.26  )
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
> geni_i2c_init() grabs exclusive GPI tx/rx DMA channels when the serial
> engine runs in GPI mode. If i2c_add_adapter() subsequently fails, probe
> returns without releasing the channels, because the remove callback is
> not invoked after a failed probe.
> 
> The adapter-registration failure path used to release the channels via
> its err_dma label; that release was dropped when the probe tail was
> restructured into geni_i2c_init().
> 
> Release the channels on the adapter-registration failure path, mirroring
> geni_i2c_remove().
> 
> Fixes: d8d3bb127ad1 ("i2c: qcom-geni: Isolate serial engine setup")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> Assisted-by: GLM:5.3
> ---

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

