Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC79D6ACDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZnUSUtwe2m6/hm5+PNmIW5JMIFSGKcxs4eESP2A6y4=; b=uLeOKbne1xdQ1wG8IGeog/fNZo
	X/cuXyTcfxjJUtqvX0CdScS40w7x1j7GYK7D1eRt1+x1ZCjWcTu/exolj69B4cX1fs5uCt6oajrJG
	y1HjKKOm1n4EUwCIUBXaN522JmfSUtdIL9c6nS0Gkjuvibk5pDDDP7PRlQQr7mVhjXMSvIkML14ej
	Zh+fNbpofcB9cBTOswjmIkHiIGGsuCwNqI/Qbk5uFUYNuTRjvdRwn988KPXKAUjtYXJ74fvTwX6fB
	i+2ydUm8fqlmuHTOeZiX1HNghdhmhTD/n0EyKO9whwUQjjDqmgHQrlfnR0OKQM6L+CSBDS2mnI4WX
	iAxF709w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCmR-00000008Oxt-2jxV;
	Thu, 18 Dec 2025 12:06:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCmP-00000008OxY-39FZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 12:06:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI99jkZ4147962
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 12:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZnUSUtwe2m6/hm5+PNmIW5JMIFSGKcxs4eESP2A6y4=; b=EKl86Ush7TKUOEgq
	831rDXftpYGxQKfCpMm5QhAzeTCqmdCiC+gzBoiWWOz+w3UMx7RIJj/OsqkgzuVd
	grc2v5dnLO0fRYd9Vgjd6I82fTp1p7B4zRpf7bFOvWwdNtCyKntSGYTwoaet5Og7
	Cf1u69vGNdHkzQs5FTe5fPkHykHVxyu5hlQonZNQMshGLoVn+TxuTyOuEfz6XmmA
	z2X6Qf5ggTNd02v1pt+NeP0bRWP3NcOf4y7UtWM8U0m5+G6X0pstqERy1MhP/zyd
	YcpZoj4lecOQgFJ9hzSwntDc2P9eh10Ode7zmYn2u94bee3i8oUnk74Sij5qONVe
	4INH8Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u7b2d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 12:06:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee07f794fcso1518891cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 04:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766059608; x=1766664408; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZnUSUtwe2m6/hm5+PNmIW5JMIFSGKcxs4eESP2A6y4=;
        b=a4BjKnMOEt7XIWxTUqtuDrFFvn3d5BvnUPBzO+aMyVS1bZ8hVPL53BcBVNqIXzT6gu
         3Xe4exKKRqjmyliC1+w5FQmc/of++jfRscK1RnjMMQllz8U0CI528T2Sn3K88eXxWhek
         zmY1NtfxKXpMmTQ4NpTpmQsWmaYCS3OV8renW69bIed9UnZbGYt0HxYD/GUXSfGpaHhs
         90XkmMIUlhZWNexEvUkKjBhTeOdf/LXl5LXD/In6d27dZ4IS7iCzbhWgbzFT1bOUWK/Q
         bQIZwnOZyx4FXcNiexQEboacN0bmWJ1yKZxclytl5hdxrs7QQf37j5ttx5qJmGZ/ToS1
         ohkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766059608; x=1766664408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZnUSUtwe2m6/hm5+PNmIW5JMIFSGKcxs4eESP2A6y4=;
        b=EnTZRiPNwKsJbK6G+J8z+9GbntTBwtfyO4/7ljywbJzDdoF1/9nUrmKqqVBvnuQA+7
         mv75UwMn70nY+HkrWdgLbmDQ5e2zfsXWLo2aZ1hMNPOA2U9FQZbDCwvj8IJ1nHU6/DX7
         uKhitjW+xowxfl6Vvq7veyfV93FAb2zRrvw7MVVkRrsSlUaIW1rJc9T/Fulq4HU7D+AB
         oNA7Z7aEL4SDIIJwixyfDn80L6gbdjMqVI7Kw6VZK5E14XbNfCwyrgnGIIxfBetdqcAy
         VkkPvuzWzv5zP8A76KFvht4q/26CJKPvrcTworzZQBSInWjQnpzlL5aQcahBE+6qqcDt
         wq4g==
X-Forwarded-Encrypted: i=1; AJvYcCWeDVYOzbrMeBsf4Q6pLb6eWx7qGP+0Q77lkS7J/adS+8UQFRTyvi+B8Z+VoNUFhGzGsmvDk+hgdNxdB3WrdTbZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx/xmzNSqBskEr9+FiruALf2nK08glJL2hj99om5umI+rHlBIP
	dXEnf0K5u3yGkYMkqbMpx02YNmI4hPVq8TmIhqzkoTltoFZBaUt1f/JVxN3u8ZvFSYktBI6ArqW
	rVSIYB2o8URonokwBfc49gsMy4xToiWAD4F3PPTVAgw+om4QaepXXowvQ9sYV5JrmzbZsg8wTrW
	oJHw==
X-Gm-Gg: AY/fxX43O8+QkU+RYWkWl7pfEUPdsbf3uP/WS021ssN+l2iyRxGqTlfw9Gi5FkoQ6qh
	Z5A1geBRMqZxse1hfvj7UsluPVSQPA7LF1e+2j3GnzhAj2l847yKIKVEDZzHgqTsB85xxFrx+d0
	oCcx9rErmDw+Uc6ujAwp6vF9lWBriME1V3GHmYPW3vLYXk91PScNFcZgZmHJwUbayqYD1fFi36d
	XSCOqoFh1n9gQdeFKzvQhWtXo0ICGAmahwm3vpg5AVI+wCd7XxZrjvh3KRGKdhCs8bNCZJX9P+0
	GCQC5oC5KDvrNILPu4dbuDEhmxbLf8nLqYj0tqY62cgOA0B3TS8kucO1QGM049wUUDMQVvyXKIo
	29mnzia8ZcjUqVmbKWRGGEpho5VWP/PHl6JQ6ledPOWRLvo8gbblFF4xwf4DB5M6FKg==
X-Received: by 2002:ac8:5d07:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f3610c2804mr17836091cf.4.1766059607871;
        Thu, 18 Dec 2025 04:06:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEF+09EZkGiN7a1LxeerZG2n1/FnP21wZ/oFt4W9TqyZh08+f+1E8eRBAr3bsry0SLvh5dWfA==
X-Received: by 2002:ac8:5d07:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f3610c2804mr17835451cf.4.1766059607252;
        Thu, 18 Dec 2025 04:06:47 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80234a2ee4sm208657266b.57.2025.12.18.04.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:06:46 -0800 (PST)
Message-ID: <ba257b17-b026-4a12-aa3e-dab66a7aeaba@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:06:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
        dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Eric Chanudet <echanude@redhat.com>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <CALE0LRupg93WsBVc62Lqt-T9qmK5MdEYoScxyP7=ttKJYXAsUA@mail.gmail.com>
 <33826089-54b5-47bc-8a5b-6004c7a276b8@oss.qualcomm.com>
 <5a1aaf4a-c5d5-42e1-9044-d12a6c231904@oss.qualcomm.com>
 <1db3d7f5-0cdf-449c-bbc3-dc40c89ab27f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1db3d7f5-0cdf-449c-bbc3-dc40c89ab27f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qhtXmAXU-2guyCDTu4rN9Z3QwcJekARq
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=6943ee59 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GtmQsnjonZUfJvkuU48A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: qhtXmAXU-2guyCDTu4rN9Z3QwcJekARq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwMCBTYWx0ZWRfX+IPaGHCfpMyR
 YlMT5DBLeTtO+nlKCA7x8Gjw4qV/4Gk9lkGOZCUCftbS86d6LpZL+XPnonl4GNyDd34+86OpmDL
 Tj7dr9lWTswfstsDzitICZ9Dnjim4ZEHlHY5XpGr7D+k5tEtXoWliEaGFaS9ALOVPybMYm+aK3x
 5cB0150HG3mbR5AcnHYaS4swplMBdEPf4cjmu8/pRfqg47WLHBiAc3bNkx6Hp8i5fm0JHcQlCA1
 MgtAA18asNnMx2gJK52tTkmTkLG2CjVobcYY9Tik6GIRVrfpHUvK2/at1vHyNAeoH47TgGyRmC8
 vb7p9kcVzjlVlgEWAFdvtvnRsUUDKbby3Cm5kUJ9D++s5JCht4WVZbIQ+VGpKX4LxieyiQb34JZ
 Mr27ItSw+gJSEaujFmhBPbHHlwcTUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_040649_795459_455B7638 
X-CRM114-Status: GOOD (  19.55  )
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

On 11/13/25 2:55 PM, Charan Teja Kalla wrote:
> 
> 
> On 11/12/2025 7:04 PM, Konrad Dybcio wrote:
>>> Hi Eric,
>>>
>>> If a device has multiple SIDs, all serving the same functionality and grouped under the same "iommus" field, for example:
>>>
>>> iommus = <&apps_smmu, 0x2141, 0x0>,
>>>           <&apps_smmu, 0x25c1, 0x0>,
>>>           <&apps_smmu, 0x2161, 0x0>;
>>>
>>> In this case, all the SIDs will be associated with the same context bank. Even if the three SIDs have different ACTLR settings, since SMMU_CB_ACTLR is per CB setting, all SIDs attached to that bank will share the same ACTLR configuration. This is why we designed it to be "per device / per compatible".
>> Does that suggest the settings may be slightly suboptimal?

I don't understand your question

> Or it is limitation to use the ACTLR?
> 
>> There's some work being done to allow more granular association of
>> the passed SIDs:
>>
>> https://lore.kernel.org/linux-arm-msm/20250928171718.436440-1-
>> charan.kalla@oss.qualcomm.com/
> Sorry, I am unable to link this limitation for actlr setting with the
> work. Can you elaborate please?

Because your email client is misconfigured and it broke the line.. If
it's thunderbird, pretty sure we have a "change these configs" type
section on go/upstream, please take a look

> IIUC, unless the SIDs are totally separated per actlr settings and
> attached to CB(which are limited), this can't be achieved...but may be a
> question here to check is it really a __valid__ to associate a different
> actlr settings SID to use the same CB?

The last question you asked is certainly a valid one

But I was wondering if iommu-map could be useful to resolve this, where
we choose an abstract set of function IDs and then handle the IOMMU
configuration manually, based on the func_id-delimited sets:

iommu-map = <FUNC_ID0 &iommu_phandle CELL0 ... CELLN-1>,
	    <FUNC_ID0 &iommu_phandle CELL0 ... CELLN-1>,
	    <FUNC_ID1 &iommu_phandle CELL0 ... CELLN-1>,
	    <FUNC_ID2 &iommu_phandle CELL0 ... CELLN-1>;

But perhaps that's more useful from the driver-that-handles-the-device
perspective

Konrad

