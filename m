Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB5ED262A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 22:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12m2xvgJzDqiJreuY7EetpiVScySOxRmwMPypQhBiRc=; b=v7jZode1ZDz0DES60foC/jEWUS
	TUXffUfuW7WN//g+563nYxaXEor8mOivsu+DZ6yS9d/4jt8L9AorVlpbod+BpGJPUzUItijjRdmR6
	KQmj4A3uysMlWilVQyCZXnf3/oSOhA2S/BcFdiERSwpImLgup5AT2oKLyp2r0NQUcwIZ2kMsc2CUA
	eYXiORJgX9uXuW3UlmlZEDa/VzrKXbQUb4UY9a6U3MlevKi3qu5zR6ZfKMebEZuy+oxKO+9u6Ab5l
	OvuwEDSt8BPVvLIemKkVwlQu75AdPR8FDNGdmmOCi02Bb3lCvUcBpoLj41Mcjql67dAYFosr7h3kc
	/aGPji6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKB8-00000004ZaT-40Ni;
	Tue, 20 Jan 2026 22:26:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKB6-00000004ZZj-0fsD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 22:26:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KGmcTE3257527
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 22:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=12m2xvgJzDqiJreuY7EetpiV
	ScySOxRmwMPypQhBiRc=; b=Uq1aKteu47PUQzhdxfFj7EO6snCXAim50cVpMhE4
	lw2IzTFCoAZcdYOJQQ7+u2shTUiCSxqeBRvsxCO7RZLFDh8eYm9mxgiCiuglsdNB
	q/yvkrlBCzTvLuO5lTbYPQZ2EyNcyKzR76+GLFRsNWOVISDHS1wGppYKy2FCD/B0
	ksdH+i7yWwMV4Cujf1h58voGin2EU2PNMMTR5CURy3/hSqtsF6X3ZJ93qfFjUGCN
	1IF9uxVj6JJprDlEVPjPoFeIehkdDHphW7UeoRsX9gsQ3K9idKZFkqsVEPle/0w+
	wuYCYnKKZVjSq5gRdxaFT12r0u0HYlewIgBOfZqBoooj1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt6u7theg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 22:26:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1cffa1f2dso132667885a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 14:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768947982; x=1769552782; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=12m2xvgJzDqiJreuY7EetpiVScySOxRmwMPypQhBiRc=;
        b=gnduZp95ic77Lucrb4AtX8jRrcOhaDdKO6U1XsW1o5bqfPhthc3CmFjpgLN6n3stfq
         GA1HdRLHife3vt2YQPuaz91dZSBurHja5ZHmj/Xe+tcduKw8y+h65JCetQCKtg6OqkJt
         G573oAlf2lrAgsdsBSJ2MUccqCkKb5pF3MCffuKqUhDfEOCepjV7MMs5D6A19sDGSy+E
         A3+GOe/1U/xwlA7MQ9cUsLc+c+glb/gP1w2cyDR7mMgPs3iJdebKY+AFYkjMjYGCIVpg
         vPL1A5s1fiZ5UZM9oGUTDYJYQccoGPU1f2wRCk29abqvwTO2PZCBTl9EA6J+dBQqO1E2
         rGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768947982; x=1769552782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12m2xvgJzDqiJreuY7EetpiVScySOxRmwMPypQhBiRc=;
        b=MpsY8GNc4aiax/VlF2K/eow2ZRU5UW9z98NC8hfarolZdstR/Mq0+nO6V1mgRotc/J
         J/xhxZ8Vev6E73hNSJZgaG6S9F1KNNpH/84hzsRVXBu9nfRUgv/q8OBOrKTUH8MpYQm3
         msdF605zMXu3Wr9k0H/ZSL93szQydlaYt93mfxfOBVE4bOZT4raE8icAMIWd9lTIhQVx
         E0+i28tCYh/0VENV02N0Ph+cu4csMgAza50WfLIh/KYqqEXRlKygsNjN9JaqNxdyTIIu
         m3eb3VOb3C2oW9vD5N8Fqbowupv6IRmbhf6dYjBDMbmJyx//vqaZ08zRfG62NGGtvWpg
         08WA==
X-Forwarded-Encrypted: i=1; AJvYcCVSpmIvKH8S4IfkgcPzFl8Ublbi8HJOBESywjYJwyogfvPrqSXUkquKJPRzdkkghyKTBZzkP5UpxhKcUSsr48HW@lists.infradead.org
X-Gm-Message-State: AOJu0YxUG5xj53tMz8ftQ0q594U1oi6muGfk/c3y/FBWr4QOt6zB0ch2
	BhqkeFvmLx+8D+7acAUIRt70enOIIxb0iE9ahILpSI88qZfZ6ZGj8W42VLEoHoiIL8mgnbFWS3K
	ncSkc4HUgJdWpzk7PnyLHaj9cndWnaasnXSrrbXa6JIkjoA54cMB/FkBodrZQQfR4pkOcMRwQsl
	3/3Q==
X-Gm-Gg: AY/fxX7CZxYmEr3CkaiuNbI7In6dZlHWuvVasrZooVrhqm14llNDvbjwVdcZ2oGa1n6
	DiWNSYx4XfRglEvjMnzjK+kWjilZFXbGbMIaVRFj+wWbxBkPsr7vWYw3OP4Xl+SMMZ0UC2DIGVx
	i7VqCfww7FOemau3qDrFUKgvlZdJZEKG7djx7od7AuNorXEph3Lh1WjUipRSkuHXe2ZSEBAL0Vi
	CxlBFBlNMAmpRlFS2zkMOuoXBAd8vkAXAyAiSZHwODjxKZ2ZfdInpGdbdLfkO0iN/+42rrV70J6
	sIbOSktFK5e5WS6oqGHvA9xgUSLPUJeYH0KdMwAVzkjs2S4g/oSoZwF3oTq/DSSjWutC1H6AHUf
	fzgdf/2H2b43eS0dnz0X5r6EbLd1tspKc6EcWZmXX0942fHGkpTMTw297L12YT/YJfZ2LJXnfTQ
	lkm2lkaSihG6AnFeAC+amPAVs=
X-Received: by 2002:a05:620a:4114:b0:8c6:a64e:f66a with SMTP id af79cd13be357-8c6a64f04camr2155762885a.21.1768947981596;
        Tue, 20 Jan 2026 14:26:21 -0800 (PST)
X-Received: by 2002:a05:620a:4114:b0:8c6:a64e:f66a with SMTP id af79cd13be357-8c6a64f04camr2155759285a.21.1768947981130;
        Tue, 20 Jan 2026 14:26:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34d572sm4303193e87.24.2026.01.20.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:26:20 -0800 (PST)
Date: Wed, 21 Jan 2026 00:26:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: bibek.patro@oss.qualcomm.com
Cc: will@kernel.org, catalin.marinas@arm.com, charan.kalla@oss.qualcomm.com,
        iommu@lists.linux.dev, joro@8bytes.org, kernel-team@android.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robin.clark@oss.qualcomm.com, robin.murphy@arm.com
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on
 sa8775p
Message-ID: <ctdfmzictrjcwugv66hmk5pouj56qviy5umdo3yrmhvfexqoni@kmtozbt53sdv>
References: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P/w3RyAu c=1 sm=1 tr=0 ts=6970010e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kvr8ZGpsiUTQIvHu6H8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4NiBTYWx0ZWRfX+gjJS3Src8Bt
 XDXMRDDhoT5vXKyBXB76ncURObayhJ4ed4FWu16BdPDt1Gvo+gLz/HS6AnEncJR7g87BgaMd1CO
 XxDTB4kHyKF0CCW9oZhWsV+5Q90jHfp87te8R2hxcqRQ/BB9AkycbduqAJxhOzlgnnd1p+IC85l
 RJy7yWH+REYpih9ym0zvpwvaF8GPH3t9WVrvMs2k1gwDDD3rqfvwuGZMpQGX1iXuYFo8Qs2r9M9
 c0sjT5dUJLf1QANUH/ozDqvXQEAzy794tssRlZ/oB0XeCnspP3FznVMHuOwPoKZNrLXwUTqhV6w
 oKWsN7rdsp6mAbuW+GpInZKyyD7UUAdluMWTq3fqFPXDzps8NEAe7zQ1ebxPsDLryS4ulj8dzZ8
 djezEtWWanwo7O9xbSBytNSe/4ZQaDsqV4y724GmzuS4D5CrmF2PeaSHPySkpowH/4/mb9EIBhD
 ib3u1W8z7RkOf3XzE3w==
X-Proofpoint-ORIG-GUID: QWTQoaenF5jftB3drj4TXqZNXhYXc2Vs
X-Proofpoint-GUID: QWTQoaenF5jftB3drj4TXqZNXhYXc2Vs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_142624_318243_68A2382F 
X-CRM114-Status: GOOD (  13.50  )
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

On Tue, Jan 20, 2026 at 08:41:05PM +0530, bibek.patro@oss.qualcomm.com wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> The ACTLR configuration for the sa8775p MDSS client was inadvertently
> dropped while reworking the commit f91879fdf70b ("iommu/arm-smmu-qcom:
> Add actlr settings for mdss on Qualcomm platforms"). Without this
> entry, the sa8775p MDSS block does not receive the intended default
> ACTLR configuration.
> 
> Restore the missing compatible entry so that the platform receives the
> expected behavior.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Missing Fixes tag. Otherwise LGTM

-- 
With best wishes
Dmitry

