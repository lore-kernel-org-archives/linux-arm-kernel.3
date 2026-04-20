Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED48F557E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gUC9FdPsZFnW0+2H5wUfCxQXwNXJYMQMdbbi9U6AaQ=; b=F4CJOpGjcAWV50VRSBFKjxO0L9
	DgcT3FwBmJww+JhE+RzzbouLoZmkRT4BTpAEu3B2NXq9WK5eDziLGwlfRg2v3RRIYpHCaBXrFZHYl
	qTRQ0VMay8zs4BVkMOyRgigojl+zdRDyO9ERezuk88yp4ut+FR62oB8hjEyotC4CwXfU4Mlcj4e9f
	RJbcNfQGwEy9VkaoQwH6RXoS93j6tVwsTXD9FOFbOOVoBzv10StiBt2/iSXT+wY/ZFKx0mAQ5lrJY
	reI6uYx8tedJYGmWMbGaEmq0lRY6bEVV4uq6rBN7IUVvqdWlwJ+wPf63z+195CpyLXoVko9ofGxq7
	g20weYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkAN-00000006bao-1ULs;
	Mon, 20 Apr 2026 08:39:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkAK-00000006baR-1tc1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:39:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K8V2ET033548
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 08:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gUC9FdPsZFnW0+2H5wUfCxQXwNXJYMQMdbbi9U6AaQ=; b=DIaQ0fm1s8IkX1SE
	6eKgQRpU+oqwvu9y3Jsht8GTzEW7JUoUBwVtOCaXLJ8ix9nyF99tOvrGUDm7QF8/
	7Fw+LJ8vzfc+S6qMx4M+QUgz0tHR2nrBqHPpzt/bwmNP47eeAFdYcfqKbmNJrcNJ
	yXm21uRKgCLxkoZjgfGhEInWuOgeOuHdAJJc0c6Dv479W2s9GDQ9Iy+7dIMcdEjZ
	LoEx0oCSete5DPuLfgK4Sv/YU1dsC+5N+X7PEVSDjsE3+Bv2u686Tk8PpBUf6nJL
	0VF+jRlfRRTQ3+HGwS4UbfpFkkUUsUTGclnBulk47/8EFW+GWJdPjiGNO3fwz3O1
	5Ui6fg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx52r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 08:39:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82d40278103so1846131b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 01:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776674373; x=1777279173; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3gUC9FdPsZFnW0+2H5wUfCxQXwNXJYMQMdbbi9U6AaQ=;
        b=G6kQcDf6K620Abwi6+Ox1tZ1dGnwihsSQ8ENo4e3MN4qhoiniSMuH9QfB2Wid9SyQs
         kMzkhjRaF5KZ3BIw3edpO1FtMAAUguRhgtqngAbU/rZ7zaoNwJCGH57PWZLofv2UStrt
         A/Mf1FU/x30FtC9KhY64eTx4qrgulWfj3qGVp1ju4YY0VUg2YUU9uEmV8fzsvuIfGykL
         FEjmQJodKFo3eLW789mBvzaVqxQrVvVt0bGLIZKO2lJaevCbmBGNnRLf47KAv8GXYDjc
         ZEEZmOdwnqbWgjpfMkfub6AnbTxYzqD7VZZ2oui2zTaKaJGXVTbIGjl93xt/cXTT7sBr
         nkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674373; x=1777279173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gUC9FdPsZFnW0+2H5wUfCxQXwNXJYMQMdbbi9U6AaQ=;
        b=AHzKYXvhdHxpYMpFNjuLDE9saDlcnaSLSS0dSrPmcrL2vN6I2l0D3iq5H8JA+vO5Qx
         F+qX3I8vmhLPZItA/AhkjBUp/mOx0EjM8k3smuh4sBmClKgxcXko6TOmMUvh8WOYRzzr
         X5KoM3hBj1OTGMwsiRFZIRIemsWkDEQP+D9h79KGiNfCABouc9agNRQnqSVOJu3PvyFg
         /dxKAOcVwTJmuNu28GhHgllqoCopdV5sGQ2jQXJu2heoF6esU+zRWX6VCtP2mcHB3L3r
         eyvl9jYtaBsFTvgx3Hn2zYVUYySE+jZkumhJ0n9+Rm/KiDo25yXOiOQ+rX6IO8X3FA4u
         dtbg==
X-Forwarded-Encrypted: i=1; AFNElJ90qaDn+FlVuzVophSkWyj3x5oqcEC11MTaaP6YlI5+YxsQMsnFMCgWbZlyeDmFbjwP7VD3Kt6WGyqLTmymDfLk@lists.infradead.org
X-Gm-Message-State: AOJu0YyRA4NIS4bnb/IHB1WBEDrx+Bmi16z6bRZKrCgkLvmYh8OYVrk/
	N6vEkaUE4dyJkaSnPWn2eZdIXJKa9Gf/yxelxIx8WVlNXzjRtKPuox94A4+KiCsD6+wKOQXKKo8
	ffQYdMQq6x1U7NbPdimk1ahL76Q0vjwUHvVuQRXtx2XdFEagQIwpXkFYtnJ8H9MMqnL3hDIiY+B
	G1aO0CtcIbmg==
X-Gm-Gg: AeBDiev6/nLKVJtW19ct0sjL+lS+6s7aPs/3/GHR9XL6LReq0G7ANSVz7SjX2n02UFa
	QmNfooXIrCBkLYo5zOLe9AZiMQk8hPuIq0COTdYSUTUlW/NXXb3q0Ogr3CSZ9I9Q+nmYEhOTlSq
	3NHGm8m2g3IUgBzVg5VavXRb043XHlf26iEnUVpXxEUFNmLDTTyUIpEhC9VwVyqbSeyTIukXgKP
	Rc6nDD33m5n/G1X/jQ9BvqDzirAnTwhdtxONWuSq7bR4dVXRJ4pQprTEOtVQPUJM7iS00prSujK
	g1pj4Qu9Z29wS3o7PtJQ6PhtrAPaDTrSKt68fEDrOcmNMZiWS55NmWZTcarIB4CTB9D6s1sjzha
	sibx1y9cKebbC2OB579f3rcdhWQQrbKNcslkG9AKu8WFIqb34PYobup12ayw=
X-Received: by 2002:a05:6a00:4308:b0:82f:3733:2f96 with SMTP id d2e1a72fcca58-82f8c82e853mr12493580b3a.8.1776674373559;
        Mon, 20 Apr 2026 01:39:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4308:b0:82f:3733:2f96 with SMTP id d2e1a72fcca58-82f8c82e853mr12493538b3a.8.1776674373070;
        Mon, 20 Apr 2026 01:39:33 -0700 (PDT)
Received: from [10.219.56.90] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819e5sm10330642b3a.2.2026.04.20.01.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:39:32 -0700 (PDT)
Message-ID: <47f88890-2503-4d90-a31a-f9d065280e6c@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 14:08:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible string in
 ACTLR client match table
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Dmitry Baryshkov <lumag@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
 <aeSly0N7IkXHYExB@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <aeSly0N7IkXHYExB@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZbouC4DMOjVmizcdNJEblVVDWD4s33NC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MiBTYWx0ZWRfX9djOp8m4haeo
 UZbMUF5GMIm4I5zlFSYMmhODBGvyJEWnl9QF4ZXtic2OwZpJX9eHqb3BQQUIo1DVTAWDOoOTSl8
 8Q8HZLycpxdUQTMn4jLt2DjwcFNIeCeNOmQAFskTYLeu4LEKJ9UA09zcehVwjNht/aCYPwA5LUz
 oRu77UnRPsE+lQQqX0NbxSd8eUYZgrdFV1MX7Eo+AqH4NwMhb56g9nZdQtKTmNA9XjooHeumqqu
 6vl24csZosgL9GNJsYUEbLUAaP1rnS9PjuiABcdPf9BAgZ0NZvyFiQ6xPrcit71YAP1LE3vpniO
 OqTXhLQNiXRScdgV4Kex+7ls+phWdrlgdXN7ZMFfUfE9JLCfm001DJbzG7cX01tSLmPf/XF+ZZW
 i7XQ5WVAGUEV1OyicJ2AkokgA3EfZEGxQiXE6sKnXktO4xdp7Z4WBO61VZV8+8XxKE9HeKG/utk
 yhZBnlJXIwB6dAKa1UQ==
X-Proofpoint-GUID: ZbouC4DMOjVmizcdNJEblVVDWD4s33NC
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e5e646 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Oj9lEc5NzW_9s0NItFIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_013936_671241_CAC17E68 
X-CRM114-Status: GOOD (  13.43  )
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



On 4/19/2026 3:22 PM, Shawn Guo wrote:
> On Wed, Apr 08, 2026 at 06:38:25PM +0530, bibek.patro@oss.qualcomm.com wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ...
>> Assisted-by: Anthropic:claude-4-6-sonnet
> 
> Nit - coding-assistants.rst suggests format:
> 
>    Assisted-by: AGENT_NAME:MODEL_VERSION
> 
> So I guess this might be better?
> 
>    Assisted-by: Claude:claude-4-6-sonnet
> 

Agreed. Thanks for pointing this out, Shawn.
I will update the Assisted-by tag to follow the recommendation in 
coding-assistants.rst.

Thanks & regards,
Bibek

> Shawn
> 
>> Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>


