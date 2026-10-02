Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A57CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=; b=r86PxroopT0bPecE/kDg+GPw3K
	q1B/AxjUa8GhuCXa8tpG2HDxw9FBqFVdBF166S32weVmrgwyktkWKhpSRehcTtA8BB80qnmCbolNq
	1yITbZdcPdx80OH1gydBu8VWKbJAm2dIzk/zxaZVWTBtSsUkjGEZdu06vVxx6AdDrjVKMMOO/Ob17
	AxK+gH8wvrS0kXXJDCVa6o50PDJs8AwzZ1IopTmTjYOGEjrWlHUxYBN3zBPADmAHjzt0xvuXlA3Gx
	4DAxQDTht/itzzhSvX/R6MJ09w04UdxweZ0Kl2NW1PppLuYw4RNRwath9BQBDyjRXav/i+4qeOWLV
	rhKm3JZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZwT-0000000BDDY-0hJj;
	Fri, 02 Oct 2026 09:52:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZwP-0000000BDBq-3Zdn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:52:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nsfJ208410
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Oct 2026 09:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=; b=TZFAZPXJvSUNssIP
	kbk4Y3PNfs53YClIJ7NeWTLSU8weFgQIhT0GriEVdsvjpKB5nQqVG2mF18cyI+hj
	TxMj+coha0MF9X5GnZRp0uy44Oi4HleRM+fPsU1qSAfPz7fksKJD7FFLF1ZVF13b
	r8OVcf9DdQ3OG6r/TrU7ZtqsuNAjkYFZyizO+z1/l7vRtJ/mSOPNVCPFy7/4amZg
	rB4V986F0pYY7OEry2uircqTrRflMnOt74soam/7mi5DQLYHbFdDNdAlZk81UyuZ
	8mti8T1dPGhaMMSipI4VKklJ25Psf88ohK304inRExITdggAOZpJ6WTjwj/MpE1g
	pjBHZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v032yv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 09:52:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso1442697485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934751; x=1791539551; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=;
        b=LNxvDpF33F2kUTSmuhS/AOmO5sNr1tb04VookCK3cUkK+DAZD9NFiHWZKFYju8M+xq
         Zx03Ak01qAL7HR/TfvKeXCUvDdq5W4u2rRu6OrwxNUsy4jNmJ1vk6vnaHfQIFt7h/AuE
         jeiL9AxCTCs1OXJTfkENTTJvJwQZ+DEZAxx4CRArQDMUM9pGeUcSKX3cr/iDna/lflPf
         LJP9W6Y72t4l5kePGhz1HHTfsWKk4NBwUMk7uD2+44FA/xU65xVktOrIze7lE3VZdsn7
         MpArKWfziOkFiz2inYL5kb6mU1pfI9KT04Gd/glujOSvJtfNVJAgy7U8ZR7YfOjmX+A8
         2jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934751; x=1791539551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=;
        b=p7RHSW9qKHgXDDvVCPosccOZxxi1ZKLurTrj/WUsLvmqHZyhLX+d09dwCw/AOqzOLm
         s9atqBy5VhNE6zEgcV6IQo/QEZPKFI4r17xgN6KaKgmGxoq7NGsTf4Z5i/q+tH0i03rY
         VR6aXKsVQdXgcjFNKoRUQpzTMRUdF2EZkGE3TiI1pXagtaGX1x86DwcxqEU4/7u7hbzG
         f4lTnva2+jWORHAzngW5OD/oy831DQ53qWTuBZkkJvbdpm1mcnTlpUrLj5C4soZwa+sE
         1xzD0YvqxhY3sGRHmmJBJtmAMcY+6l3A89k68F44xT4Uobdc+jNvpKxtKgbQinXB7ogy
         7d/w==
X-Forwarded-Encrypted: i=1; AKwUvBwqcnkDdJ/v2pK+febbUnbXieUCbZGU0DizcjmGYsXUEiPO1vI08m/rk9XsnYbzoJ5lPir6BsP/9ZkyB1Cp8dG1@lists.infradead.org
X-Gm-Message-State: AFuF++mVtvrcT84S8fbI78m+0ZGkdOGrI2iiYSUgNbx5eny24CZ0foiE
	JS7gRyZRJavfrhZ2H2PyT6C/+ju3so7NuNT+JngM+Hniph4rQzD0h9MXbJ24XtC/TYyfz2NylVX
	YTR6gze/PYu2jEwsG14/UFoeUZFmSM8CEM6IGC9nnHlJWPv8LHifHXKHBFAwkOw8+x50m5UuuJI
	3w1Q==
X-Gm-Gg: AYBFou3MSLrC0CCNmz5RZf19Yp4wASKRrmPsZAlCHb9ODZoFgQ5XtZvF06Xqu8xQHsH
	3uKoefdM/0rLijb3151tCRZgDRk2I3TYeLdLfHnNA3NA9wfaLRz/jcEU6/CdYK7GjpzBQ/tD8hF
	2iF5sxmbNsBE3SwViThpN75lOC95yKkyMgved3dLqxh1tCU6D6VDoda6mI1iAHBtWEL6sHvhK1H
	NgsxwrlVbBHHCtNG6v5gn9Mt7vq/3qu849ABUd8RZ7Z4ad6M75wsVRMOUZAF+TvjMO2BX35E83k
	CZd6GSl1cKxVrzIASWJbQJtERjrrwPPb+pvkT+fVFPtmdQQp4fAHRzF0JrbAlnDR9M9gQotZ7IJ
	1CWHkvtvMiOGBLAprya7D564SLFex8DNZQo16WYRTEFzXT0V7iI1srralGKnyyQ==
X-Received: by 2002:a05:620a:a790:20b0:93c:bb75:d8f0 with SMTP id af79cd13be357-93cf170b54cmr237247085a.27.1790934751317;
        Fri, 02 Oct 2026 02:52:31 -0700 (PDT)
X-Received: by 2002:a05:620a:a790:20b0:93c:bb75:d8f0 with SMTP id af79cd13be357-93cf170b54cmr237245885a.27.1790934750933;
        Fri, 02 Oct 2026 02:52:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d1e38sm55681315e9.13.2026.10.02.02.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:52:30 -0700 (PDT)
Message-ID: <94e3f42c-4ffd-417a-9bee-69c504360af9@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] clocksource: clint: Use IPI_MAX for IPI muxing
To: "GUO Ren (XuanTie)" <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Anup Patel <anup@brainfault.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
 <20260911-ipi_max-v2-3-a77826ff189e@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260911-ipi_max-v2-3-a77826ff189e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX8hjzcJfkvRA2
 SofapDgYUC4VV/VbXdq4xw0SR6HP743obWl3fTje7iwR/DLU3GRPunB66eeLru15hmoBCHXQy92
 LCbMsaC0Id7o4rdPoCT8pEkYam7H3T8=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abf7edf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uCLItbk5GdqmTsIkEKsA:9 a=QEXdDO2ut3YA:10 a=Dn0JnjMMefUA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3n0laYtaTvWw4IDzQa2DYVnS1hFc5bQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfXx0BQrvhRCjsJ
 5mhX8iQKDq/7PKVTgRLoBrocqmWmqtUFM2eNqaHvsthAxbl0KfSRbnR85zbDjVURhtLa+EcYKO1
 FgDtm7uVT6niaC2SSZhvFRTRCIts2SnNxyWyqeU5IaiU6nWx1yuqW635yc3ahivF1k9lq2UdWOF
 8ZuQuBtBG1LUnwA13c6AVJ7hLCxzaPP9WZ22g5cR0TS0DZ+WriHVDGXwwagT5hDyj+L270bv2VN
 +sPGpZgHnuANp5diX9vMr31aPfa6f7FbcbdVKx00d6NnzcByj9KrJq3KFj0nqmnMVy0PZ938QTi
 1SGpIH93z8x4TNfCJta5yOourCvNmDiKPxPRVBTFXYeLxOKGgkGV6RxZHfMM8FvmVNAUnm3zOuz
 WIteuCn2t9tRctNtj16AvmYUS2zg5JvqtMkwi4hmEQQX4I8p4xBjsF2RdGFqzuvY/vEVzaUS990
 fCjFfOtGJfaIP+RHBLQ==
X-Proofpoint-ORIG-GUID: 3n0laYtaTvWw4IDzQa2DYVnS1hFc5bQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_025234_005004_50D08C56 
X-CRM114-Status: GOOD (  10.76  )
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

On 9/11/26 05:27, GUO Ren (XuanTie) wrote:
> Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the
> constant is exported from riscv asm/smp.h.
> 
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

