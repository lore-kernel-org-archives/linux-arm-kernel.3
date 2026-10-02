Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC4CCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbCLfoi1IU+B9jK2etdyK3yCrIooqwV7pxuwkfym9W4=; b=bHcdoC7i5joVbQ0FCTxX+AsoQl
	nCXtwbi0xpM7m8PKbsTnyMRma+LAeEn4YEWiORBhIKKj5WiYCuNxHSOTt6VJiAXiYkGMCUGCesAue
	c9xJGqfZwyb7o8+H4AYCViUAUbA7GkT5XbHPBfpQU4zk0b/pSFAWbg3XzdbJJMQ94BaP7XPsShy8h
	AqiELGji8WVDONXlOrG6rO7tsFSTflFGfW+y9dtMsreGWwK/99ZhdZtt2lAbutwhD4EdCt6bf0BQs
	jWIFrY89bodO+W7V3n00ZSpcD/2Y9xHO6LKXMew1bNVX36DpoEjuvHcdjq5HIZpTPT3X14HBMKb7D
	cHwxeI5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCa9h-0000000BFnc-23zv;
	Fri, 02 Oct 2026 10:06:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCa9f-0000000BFmY-0T2f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:06:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929ngaB1178062
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Oct 2026 10:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbCLfoi1IU+B9jK2etdyK3yCrIooqwV7pxuwkfym9W4=; b=SAPLoJKgQzgwyoXC
	CcnWnTHuyurW1TX4hAti+w/mY3EsmZ4hHK+aLa/X3BbZKbD6LF2O9+zAd8elRQND
	eGoxK8TZnDEJBcfXVtNYksFEYGIc2e/n7tVli9bpqEYAWzb7QowpUoSPdn+J3w2s
	xl20HIl5x/iuNR2pBC/d1lHUSVH2I/qtpRsyUCUoFGyUx4SOG8GWkPVuAWORhB6p
	MAXpSB7C98JmXLs3bwRtuAOGchwLQSYkJG9eFKj6PI9Bb2IXKIa7M94BlDQJBtpi
	PKgWo8vX3R0/NmISqh47++GycjZznQxjjSyr45D3IariHDTsjrq+WC/81vqah4Xo
	tw2OMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfstwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 10:06:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso1353391885a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 03:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790935573; x=1791540373; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbCLfoi1IU+B9jK2etdyK3yCrIooqwV7pxuwkfym9W4=;
        b=eAMjlg+0/D3KnJCba8CVTmEwGpstvuhcQFighq2lbNaURrOdvd23iHThes63FdxR8W
         BsS16C3Wox7M8is46jce0Yuzd/TajN6UPlANJe/RWkxbAPkB+BX0yTyBofz1zFjop42/
         E6WAdyCfqnGsTZbnCesXkaKdD44HsQ4eA+xx4bim/yrLWPi1OK8Bqe4K9gB/hBmUzS6y
         pSbCR3duFOxavncXFZFq9KNx19/BN2dNrJedbYGJDPTXdV5/J3ogeGNkQ9ZDmI/DxQPw
         S8eDt0f6i42K72jNLgSWw7aSHol9/hKEHlW0HoI4IN2p4xyD6mEQN8eA4bz7neA5DHEG
         z90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935573; x=1791540373;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbCLfoi1IU+B9jK2etdyK3yCrIooqwV7pxuwkfym9W4=;
        b=eNF2gSraOviOwvMsPHDGvdRtvEjRw5gBt0eonWsjjrCS4GVbbFqBEAA012W5Ryp/aF
         LZtEeISzxF/YuiDFjRa0/+5gHu8IzOdAmd6FNLMQ0P3xXbNdNK41j8PtT4TvvmUMdHuw
         /tO5ghOiFTCk55yugr6OUBOHChHb3k2Qan4JNbaJrUywreUC0ZeB/6DdDGz3dlwt3i6l
         I9MDsbnwqY5dP8W+dYbZjrj5k4ZXCIwHEJlWWAh8dB7KWqRa6+D9e0B9wbwZ8i2XwYoa
         Gs1nXi1D9KMGJarwpEKnsVaiYyjCl8gxK/EFDPZ12GQeDwqeMuxbEOObkCHquGnGIEUr
         7IEg==
X-Gm-Message-State: AFuF++kkcIHDHaRHBj5piQLfNI36h71XunLC0YhY/ClNpwv94RV74LrT
	TDAYMAO6sIislz5zwh6m8nCSFPOCBpW7VAkAxiOq/d5RFPQu1eVpDdU0XtoWMY6zeyFMqWPlh+9
	tznC5Eaii7n0y6wCvRvfs4x4pRCgjrXe9oNP0oF7LQBUDn2d9KmYyP1q5geFxjMogh/5AYdbowa
	NQkw==
X-Gm-Gg: AYBFou3JHBkL2R8Hhj4MNHu2L1IQbTmJrXYnRmeXTV4S2hxDQsaraaceV+OOVSbkZf2
	rnxG4Na8Ozfe0hL6p0bNy471uyFBzplGuD4G3Kpfgf7i92AYBWl0qyJX7AghDIOLOtbXn2odB6l
	9CbWhQp2lKYfWTUPkFH7+GzyfD/RWkFR7qPzpV6n9C4H1RRdFL6JhgsGEN5OR2ODSBdzFlSJODw
	+GTdwOnEKA83nNSBonZKKV+jBIi2C93vdBKTAWAfMp8maIjuOgs5epHSA5RgTQ9mo+Cyc67elfg
	pLD9IOh6idYv0ZGaIlY9I0FXSj4yj2wTlYu9vLO2ZFPpYm0aCD64y8Ze9mnqlpelRNwI/1rcdKu
	ZGeWxkQvXe3I4XwD7MEMXUhx9aoLeCStpfIeIRWf9yLMX6VpCyklTQ5431x9XOw==
X-Received: by 2002:a05:620a:1a1b:b0:93c:746d:7c6a with SMTP id af79cd13be357-93ce920fd9emr344410785a.10.1790935573416;
        Fri, 02 Oct 2026 03:06:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1b:b0:93c:746d:7c6a with SMTP id af79cd13be357-93ce920fd9emr344404885a.10.1790935572757;
        Fri, 02 Oct 2026 03:06:12 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027727cecsm70346435e9.9.2026.10.02.03.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:06:12 -0700 (PDT)
Message-ID: <d6c23b55-2c0d-437f-ba1b-624356446ee3@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 12:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] clocksource: dbx500-prcmu: check timer register
 mapping
To: Slavin Liu <bolin.liu@seu.edu.cn>, linusw@kernel.org,
        daniel.lezcano@kernel.org, tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260911060917.94310-1-bolin.liu@seu.edu.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260911060917.94310-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mS1bOLBTjP8CUk7vrWM-I2x1YS3H2ei2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfXzfpQIdw17+Hb
 waFvWYODMNp08XCWxEJy7yQ0m0nBH2S3fjwHHfr0r61JdMsGjiXnc/AKW4SI01f3q3/wt181jgC
 G4QpvvMwjCyVJNd74vM/9DPiWLd0FG8=
X-Proofpoint-ORIG-GUID: mS1bOLBTjP8CUk7vrWM-I2x1YS3H2ei2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfXzfyGQvbelsnG
 33Rgf+PQmb6ipJJY7KT6bdVOUTKkgDj95Q9j4fYSozXzc9SL0oa8zupJ6+ECHCwPSdFv+vOzAtN
 phS1J8iLidJjkDv/mtnpfw64de1fHr6GI1QSr6iV5/Y4sUr56Rmioar+QqPKIGyhsSGmXjXQ4ns
 IjXbSmCjeiBsFTww+DFOniBnLKtuVhvjC4zJc23ulXmMbrys/aLVu/uKPCIT8C5HHnlCLvfHYHX
 POe887+vmMDSfhTLhpw5OkN0D6mej5EMbq29Iik+BJkP26rWIdCHUv/Be/iRcsxOj+HYLw1J6Jz
 Vno/R7FusmXlLfM6lxerHnTx5lgswt0NNeiTyIeof5M6COM1tzUkGVbg94fwOCxWRczdokxup/G
 DbZTugEXyCJdpOqdSEVuSLmXBTiCbr1LTDdx5+ga0fJvzy0q1PoTEfzfFqKf44Lb9gmkqR6/0fj
 9IogfdWrdO9euhSqp2w==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6abf8216 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=3w5cUUB0E246M0ZwReIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_030615_272945_DDA24B24 
X-CRM114-Status: GOOD (  10.84  )
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

On 9/11/26 08:09, Slavin Liu wrote:
> Return -ENOMEM if of_iomap() fails, before reading or configuring
> the timer register block.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 9d2aa8c7961a ("ARM/clocksource: use automatic DT probing for ux500 PRCMU")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
Applied, thanks

