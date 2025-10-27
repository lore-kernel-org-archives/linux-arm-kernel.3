Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0460DCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6bjhQSOqx9D1Tl5pyAATW/nu6ENMdIgZuft4+Kzf6g=; b=uPx4bJKVI56zTwbo/Jp8sLoG6X
	RPY0spcN0q+0A/CZGjMHGfzZJlDxR16CpEV7zLvvFvVO4ihYds9jETyaBlcCHV+EG+Ny4sBQRtjn5
	brJ7aJ99PVusWv6xZSRMBiG6xA3aHtUWJ1SANPKEM1mwJIBpdoaJbUZcZZJ1M/MtdwSDEdIqEULSv
	RBFq+NHBzooCZVj8DlOcVJtJiTWPvwNTwhmOxq5l9eshM7UuhfJUJBUJy4wlUo+69iuaRnZRpSUyt
	TPVBZfF4fsR2Ar7mW/Y0+jV3KCzavX8BhGHKIbIsfG3QrX4p2B7lgEy8MdFIMsl34nVr/Th2iGAZ3
	bvaJq3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBod-0000000Cw3s-375F;
	Mon, 27 Oct 2025 01:14:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBob-0000000Cw2l-0NfZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:14:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QJtD6x721608
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 01:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6bjhQSOqx9D1Tl5pyAATW/nu6ENMdIgZuft4+Kzf6g=; b=DNGRK1ckf+y+TIL5
	vsUrDh8XWa45d+I4LKXOE8NcC4Y4t9tbHiRXX24RlWBdqva7/bvvLkSnUSECVmJx
	lOR2rCLeZi3WxxX2DcKOTfdRRTQWS30NYNpCq58Ud2E5hU4238je2e0FmK1hpW1Y
	bIKiYWJnWFphbh7NxgAtH/4sWpEZgf+5yC392KGi237aFcY3pl2Hb9X/rmjHBS+j
	6zt6RD586fFrX4qWqb3uA6yKNXWib6S/UndXImA330Pgcc42izLC7p4kZRXHmQQZ
	Jx9mpXsLWR4TFF2HwW3mKeXTgredgX84Fg+WLZxfGFecaA2o3P5zDdQnS02LQU33
	3LVtmw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nkajv3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 01:14:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7900f597d08so2970412b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 18:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761527667; x=1762132467;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6bjhQSOqx9D1Tl5pyAATW/nu6ENMdIgZuft4+Kzf6g=;
        b=rj3lXx3NcoLj70j3tx8CdV9ll8vkQNtZw/R7DEYHptJJJuipsP3/8OcGIgiCbYmb90
         6ScVhLUEEDEb5lqIYMrAO6zaWbkTlxMEhFg9iyT/U8wulgN6f6FDDutgDppkm1oxQkLz
         M64Rdtvgcb8DHLOUKRFrGbThgx1tb8gwh18DuUKNAApu3tWgi/DmuxQhbH+khPHBRGUk
         IAFFpmOZpsrvuz3hrAhwlMTgEP8O/KKJwqqCoL9LH2/T1Q5ZgCwflFXS6QGUKHKX0Brc
         YJfB2dF4uz+IttvqQzwOrJS6XJwUxT+9ZQD5ABqGGwHBEs5G/lfAjr/Zs4fjYGJIeZFZ
         xsfw==
X-Forwarded-Encrypted: i=1; AJvYcCVGydBm6utYBDcc1BVfy05oDoCABJLM9rrIkxJDDZ3Yzlg4aCiU9JEC+E+M3rdHNTB1gAWiR33iQrt22ZgPD4x9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7O1mvCX2WJ7V2LsEDSHcSE2vWQKZcOIlM0VSGe0rZN8Bwct1h
	Wgs3o5I640LBU8CfQv7rUb4piJjPPApsY+Cq82iSqhyIbRBxQaNX++XfKcI5Vhd5gScaNznGGp6
	qALF051o+0QvaD8a6sg9MNoNlIw7smygLeoTugacXpNkcVqNLzVDs+X6PNvbCDtB73uEXuh2wz0
	3uyA==
X-Gm-Gg: ASbGncvxXEkLChje1xvrahlfg61hZe5USWkQ7mNAcNmWlVJNiCvkMjR3mcf56cFDO+e
	5OgBUnVvFjnqfaPSFQp8jSEPZIWEiSubKhO7bnH1cuO19VMNqQpI5QawNITE97rtj1yJFII35Q9
	1vHniGfrW5snEXB5M7VZAqUkudYKyi4QodkWpLe6ZISv0ZyMZUNHOxEyxqnA6FKKAbJxzg3+q7h
	hNEmDZvz+k9AVohK3SSdfimaKJnxLNXxvjUVNySSWNB+Y3GCNJIgfXAH1rsIVjeNurecnzoVQvM
	GL+PquV9i3AzPJGdNfBB+QApCAFF6x1DQBtm1a8NY58h/BHM/k2Z5mNMBYY38Iov11DJ8IVFXwj
	3WenkhfpxfjBtHRaILurePIXXHSKoxie2Pstm+NQLYOIYRht6W0GOKyXQZK/TDANb
X-Received: by 2002:a05:6a00:4fce:b0:7a2:7da6:bc02 with SMTP id d2e1a72fcca58-7a27da6beaamr13311900b3a.21.1761527667143;
        Sun, 26 Oct 2025 18:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF32JqcgNw2EBOJY022swQQnuYAkI1zM/sffyqHmGk+kPX4EtGMw7pwfLHomvFqdSoHf7H4Kg==
X-Received: by 2002:a05:6a00:4fce:b0:7a2:7da6:bc02 with SMTP id d2e1a72fcca58-7a27da6beaamr13311872b3a.21.1761527666633;
        Sun, 26 Oct 2025 18:14:26 -0700 (PDT)
Received: from [10.133.33.212] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414072492sm6066360b3a.53.2025.10.26.18.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 18:14:26 -0700 (PDT)
Message-ID: <b5762a05-8b63-4354-925e-fa3c8296e19f@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:14:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=68fec774 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wn2eFai33wK1SlCS9xkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: l0qlGnJ9EuqY6jiyi2-XCBJPXTI96SqF
X-Proofpoint-GUID: l0qlGnJ9EuqY6jiyi2-XCBJPXTI96SqF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDAwOSBTYWx0ZWRfX+BVl5aOFLLO0
 O4rXnIxV4bJVor6YF2nPK2MpN6fAZujuAr8/KTS/IM4l9IUh4IB7N11WWsQgHk3lF6GDTDZ2sdI
 SnZ8p/4vYlffudx7IxUMYUuLuKc9++xjl6khAfadcFJRMqCj+vsHLr1dkDlcEUDhuQ55FNxBReA
 sPhn8Y1WhwKlE1SajuVaBu8glO8XCG2KJb7J9RordR4IcY8iHwg7RVEcl0DSc2xbJbemqqbGHhV
 AfaDz16FnAcMsGfFdcDhe6q/zjpbbKlcYd20nNYpMT7GFHf3valtHSffsbXBm3pOzMx7FPxN7g6
 6GMtRfvbLLgp8BHlq4gra8JGNa1ID71XCSB/FXXFbRfhL3iddVjaIx9Pz2LWebUy/HjLXdlOFXT
 cJepOvvl+mWEzdRePU95k/0A4sgYPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_181429_250129_8A03A1D6 
X-CRM114-Status: GOOD (  16.17  )
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



On 8/27/2025 6:55 PM, Jie Gan wrote:
> Patchset 1 introduces configuration of the cross-trigger registers with
> appropriate values to enable proper generation of cross-trigger packets.
> 
> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
> which determines the frequency of ASYNC packet generation. These packets
> assist userspace tools in accurately identifying each valid packet.
> 
> Patchset 3 introduces a sysfs node to initiate a flush request for the
> specific port, forcing the data to synchronize and be transmitted to the
> sink device.
> 

Gentle reminder.

Thanks,
Jie

> Changes in V3:
> 1. Optimizing codes according to James's comment.
> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Refactoring the code based on James's comment for optimization.
> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/
> 
> Tao Zhang (3):
>    coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>    coresight: tpda: add logic to configure TPDA_SYNCR register
>    coresight: tpda: add sysfs node to flush specific port
> 
>   .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
>   3 files changed, 360 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> 


