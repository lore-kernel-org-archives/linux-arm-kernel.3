Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FFCCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 06:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YWM5S4dm7vSz3gmoQTVjUJYFT5kv0kabSHfWarxYxM=; b=r2CLWP588jfoM0AzDN7vDQqemM
	GAFMDDDYsvAlm6ULNwiZlYQ7KWtm5JrNDFYywizGkpl5JKsdDq4l1Wvl7MHgQE2JATFMZzZiMg2DQ
	1mjb7wSMQM/V/6RW7QFv9KqmOwQi5adh98MKPpQH3JZWHF05zN+oM2RVG5NIr2pVHJc/afRNbG2az
	TipJFtxByQM8nqSsbRlDEPqmVi9gBZL+uLbk/2xJvsoMUVg55RgINN5BxaNUBpVCK/D+hj9MkP/nr
	PfnQgJLsI0u4RjmsPNO/D3MGl2ykYq6arwHVpF+BwIksJGTKyjdGXc3MGQ7atd2WsWPQAhqsTaokL
	CVXcZEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uocL1-0000000CVT9-1WFO;
	Wed, 20 Aug 2025 06:30:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uocIK-0000000CV8K-2FPc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 06:27:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p8t4004207
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 06:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YWM5S4dm7vSz3gmoQTVjUJYFT5kv0kabSHfWarxYxM=; b=XCFGBTN23/Vp6ulk
	cA1/eLv7ZLhSywt+Wb89npC+Wr4qQopzFDxh3SWtGIyBXbX9mE780j3emx34FDD2
	7An1K03U+tRmtCtL/shMlVDdgzWHaomLSwsYBMXpgulk5MFSVcFl9KMss+eU0bHF
	y52Zda7qOO0Jjzft7aMR/2FXw93epdhrl4b7jxH8b9OV2PrNXFD6mFRfq17snyx4
	7kErxl79pwoE89eiIHhbdCqqUtYtWwbSVzpPTqWLRZi5wfDhm0FbvcrLoX9QiZrl
	tKOn2mpsoA6ScYJ92Xqe6L02NcziB8WicwJvfWAD5bzylnLikpQvhgpY5jfNrB3U
	wcuzKA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52agmsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 06:27:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2e614c60so5420677b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 23:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755671254; x=1756276054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0YWM5S4dm7vSz3gmoQTVjUJYFT5kv0kabSHfWarxYxM=;
        b=AAROTxXYUU9HGxmo6nr03wxXsgmLa7Z0+YoIAgVEKOy9h+MHh3BTBN9xQKkAJei9Qv
         UaKOKQB0GYtOXmjno/Agl0XkNb5EjbGWXX8hzmkthq2zL/zysUE0l0VDBtZecdmheUmO
         ffznvjEvpeuFbD26ulpu8UQDBZlO2ZvQlPGIprXyUQC/06sKLiRMLvD3PEpvchlJuepq
         GQZd58DiIvxZNhB7HmQ6X0gYJEA4JVoVoGvI+Npi+ME9jidG8MpIfU1FJ7g8UbYH6QIr
         ozHTpL5381EpF9MC9n3O21GhhyglorrJ4NRILJh6c5+zHf8pu/eT6ZPi/T+lPm3OjNc2
         FFXg==
X-Forwarded-Encrypted: i=1; AJvYcCVpk5PKzLoUSZJCABBcdT26s+pUCXXRxOixPVXWDCh8wWM3XoyC/d92z3PCLFisciNNbgoUUc0FC8wCneLokk+i@lists.infradead.org
X-Gm-Message-State: AOJu0YxjM36vGzJEV7g0BJvfqwezYT/TWiHBcN7w9H8ruEIYYb4jWHTf
	ST0a8SUk9jkcAhOZWjMrua4Jgwo/nO0AdaEJi6hSmMJXq8HJ48joOU3NkwsOUs3RA3qhyxZA+Nn
	+xr059ig6vNcR7YaDP1GI+3CLLGjYbYQawl6Sn0PGlD09B+SrWttz1EMXod4ghX17xkXyaHdeju
	C+Rg==
X-Gm-Gg: ASbGncuyY4en4nl3xsyN/JvMbB/3DaLNb0abY+gn37tjdb7E32VCaLLtZCKxWj6WKsl
	A568ZzvOvCH2TAh9ooh4ZV2CVfLTgLk90KX3qJjOeTolLiFLgJ33njdW+63S54cUOWx4rsInKgT
	4OlcYfnQmJZuKv9Od+L9DarKPpGrVY7effFNx1/vQYQ/A/nS+o6TMuNYvepMPKtibrkk3uqGek0
	F/kBLCQCp0H3OzURmV9XvuQppBZouLdh5SRzsn7HuQvp/YaLmzsXVxjZQjACseo1kpMQmK+t9sy
	zYkD0Yl1X817CwXMOJ2EyFGPhRWs2NIl50BfYmjzyJDxL/XTN4KnK/5uNRm4x5UrMg4Z9vOwFkF
	OlpAINhmrEJDNT2dtIaIyEdt4uwvYTR7i
X-Received: by 2002:a05:6a00:17a5:b0:76e:885a:c344 with SMTP id d2e1a72fcca58-76e8dd4cb80mr2579629b3a.26.1755671254277;
        Tue, 19 Aug 2025 23:27:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmS791N0ixCzI5dRAxbIiWf0iE1fLD86Phx2bw91vneJ+muUr6Yon5CmZn6QVf8jfjkBKoJg==
X-Received: by 2002:a05:6a00:17a5:b0:76e:885a:c344 with SMTP id d2e1a72fcca58-76e8dd4cb80mr2579594b3a.26.1755671253812;
        Tue, 19 Aug 2025 23:27:33 -0700 (PDT)
Received: from [10.133.33.73] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4fa868sm4294504b3a.64.2025.08.19.23.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 23:27:33 -0700 (PDT)
Message-ID: <baa85e52-f275-4d29-b3a9-2880664434f9@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 14:27:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] coresight-tnoc: Add support for Interconnect TNOC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
 <aba6bf1d-5974-4003-9ae2-62033ddf87c5@kernel.org>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <aba6bf1d-5974-4003-9ae2-62033ddf87c5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YqI-y7QyeSBFD_fbs5CgF7kr3RHag2ny
X-Proofpoint-ORIG-GUID: YqI-y7QyeSBFD_fbs5CgF7kr3RHag2ny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyvUt4AZ7JZUz
 cOAS+LCdoN19TGQTgbKn+RAakbJIVMUibyeJZvfx5i3IuvcskJdq0a+5SyiDWB8V543xOdozdhU
 osoxvZguVLKpoaOyVf/H67UAODFbjqM96dkEE/Tl9WSvUDPUw8K8zjc2SKJe0WTq3KLctHvsyyx
 52qBtZ8JDVN5Ci6ghCUdcuBHqBd2pVjvc/Csj2X2oQdcwfOdOSqdJ3OWP2ueKQMtC6jWqnodNmp
 lZPlW4Vz/bDoPtNrKyYmOL/qqC/u1H+zaulMZov4G26qMJC8y9my1KRsNiVijI90zfRhga3hW0q
 /QWgXNBXvXpCb2vd8emeZbudYmZyStQY0zzt01DdCUadVCndHqw+xBgsOL+8i1PG1AniTp5Tc45
 ySkbXsTo/pzVkR38RvXct6QUreyvlA==
X-Authority-Analysis: v=2.4 cv=XfbQDI55 c=1 sm=1 tr=0 ts=68a56ad7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=T5-8DVSjhCRqEL8X1fcA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_232736_704631_9EF7EA14 
X-CRM114-Status: GOOD (  18.02  )
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



On 8/19/2025 7:30 PM, Krzysztof Kozlowski wrote:
> On 19/08/2025 12:27, Yuanfang Zhang wrote:
>> This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
>> (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
>> trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
>> this block does not support aggregation or ATID assignment.
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Refactor the dt-binding file.
> 
> Everything is rafactor. What changed specifically?
> 
> Or you just ignored prevous feedback and did other changes?
> 
The feedback has not been ignored, i will update the detail in next patch.
> 
> 
> Best regards,
> Krzysztof


