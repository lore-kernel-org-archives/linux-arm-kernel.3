Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422D5CC6B36
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 23:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=; b=C1JUbljd+FjhBFFQWLkmuq9Piv
	adncwDu0j49++uNBV0hra8E+ybDFtsSO3NvAxi9fXvBzAU27uosyLhZro80S8YrDpoQPMFSFCRBIQ
	ygY+ICIInrPPDtbabw+AL7vD9w00B0n487gJEvH6aeY99spEdHmq7Z511dQ+S5PnYZEfqwlG3cHqb
	cIEWXbky+llITJ3pY75H+BnhlObn6QpjwLdcXYBsgf+N2fOfi8tXVFsbB6FCLVtXxiaDSLIlKscfT
	nZD/TvgKmhFYiY2+M3jiKl81CPzsJDFtgebD8gNsDYqsRa/8atkYf63rzYpiNXFCi2sD3jaW8lOZv
	NZM5YT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8gY-0000000GT17-453b;
	Wed, 14 Oct 2026 23:47:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8gW-0000000GSyj-3Ppv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 23:47:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMXaj7644589
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 23:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MVSX185AgSrbI09fOTWvij79
	MrTIRjbwy7Bb3zRoM0M=; b=aythbRuDEL9m8f+kyN/1bOuBhBunx6ptFyZh24so
	rRCqeRzuKYYbiLbOs6kD72uXjQwEW3Dqd8DxtEhsF9/XIHWGDqmEN6cm5TznYK2g
	sARAAaLbJKes6c8FwRfRsDtIuTiXypv+LGPMtcI+pVyt3WJIjua3auH2ULzxC/34
	INJiqzMF2kIwQqDCsc94H5C5ndTcm56ptcdxs2lJEs8DioRFpRvva4nThqIKojEp
	j5ay9f4VU6s7nvhnTm55iXzMJq9fJNjfUsmcImMLpMVP0jWQulTTFJW8JwAs9va5
	wFNVnKRjQd2f0zx+ByYY7iEH3VyZsZ3njjPSO0xESp+INg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy86fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 23:46:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93be1861d2dso145655885a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 16:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021618; x=1792626418; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=;
        b=W8wF9Fh0ErQACYRneedpmgu/CGnGaiSLIukHsSrZW1VaZtX7BFxqrkZ8izdMeWdnQj
         YZ9Svi38ue2WD05YXEar6apepkeXTRYenUy4M2jwSjbEfR+8/rkgmnlcfiHhbQdZk1Xf
         uGZJ/0hNh/XzHd3iOluddxA4kbWDFL80SYf1vJW/dq5RwYWk7pUB/Y7Rjml4EymlrB0I
         lRi36GchlbHvDodzMsWRoH+aTQPUjf+jwaPuCYnCFFAxw0hCAXK5WKWLl83cvQrEnxY5
         xVzV+KggtFqp4WbfCZKczOuhWfMO8Xr+FoTyDYNKhAfw4etGi5H1dPHLCFTM6Dq0eRE/
         w51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021618; x=1792626418;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=;
        b=PRLENylRRCnCNxMGGeeWjzv59qtPiZuS38eZkDZqWKVM9881VxfMe/loyde2jH9wE3
         ZMdayBfhvn16rYpi4QUnYG510tdnHyj8bgcHng6dHs1V89BTH0aUJHLazCbkrLpGwzkO
         n3yAbbF5UFTVydkZwjE6v7RB0nkxaAI0bFmDkhsJfnG0oYaGpPAuu/8UhwWTb9Qtg8et
         lMuQxr3+NbSsn/ECNFEya2Isb4tHDdhqYD2s6carqTjFqm/KySWT2tSSDQq3XFhGa43q
         K/9dVBtHG741zytn+g7S5Vwa0zmFprvT8Ern2RXyywnIKiSRLFRRWoWVWuv5dxrZBCje
         qIzg==
X-Forwarded-Encrypted: i=1; AKwUvBxtahwCQLW/Ela4dYY0a+PldsXpSh9nq1EDsnpNyg6M4oORiegts0VtUL3PRuiq4nTuh9e06kXAOn7yvwp3vHQS@lists.infradead.org
X-Gm-Message-State: AFq9FYJyQ7twrKfwKHDGabR0jY08Vo8PBa2FpG3myfDYWHHV0tUa6nMy
	j4vWywWa1nDBxgc4kEAoMHKmmxbF/ZhDxH9bcfqP10LkbD+IeqGyEaxJH9ij9M+0+xFcmT0iG95
	5+DcERoLqLf/Ewn0gEv8fqKEHjTf7EtzdECMrgi48OJG+42KglV8HxgMZCPjFADUvjRDkWbhnkF
	3yuA==
X-Gm-Gg: AYBFou0RJkA/fdzH9apC34t5q6MCrbhCnk+w417lgiFEmT0ZVbwQicLn2d/qvaJwJ3E
	Ryg3A168zVvQyDji583IjogIJmC08SjAK1IGTO/X8ldIfaOM4p7BtLfouXS5mjoEDN3hrK7Fugk
	e6mrn9w9GgSCeBUC5geyYGLe22dE+UBmlBpgeBhgk3NK9dSYquaM19s7SYkV6BLkVYkD9qbaodg
	YW72QmwLshsOmUTGD7petCSoaL9EPbGpw81EqXLWPC4cgSOeFm3QtEDL4hB7LvDQa9bO+8jPkNB
	8qcrNRcpy8MCgmB4EWtY4dDRt6b6pH8PZtWRQ9MTsqzP8/5ThwhEpN6u1/gtj0tG1TLwrS0wCXR
	YnpK7MGvhUWEVGm5wx1llI5G2Nboe8WSuzxlxoelgOV80IeYGe9lqdGf3zBmHWbSGB0d35t7OF/
	bpFjRL8fch+NUh
X-Received: by 2002:a05:620a:2701:b0:93e:d364:c9fc with SMTP id af79cd13be357-93ed364eb53mr2144274785a.5.1792021617547;
        Wed, 14 Oct 2026 16:46:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2701:b0:93e:d364:c9fc with SMTP id af79cd13be357-93ed364eb53mr2144271485a.5.1792021616901;
        Wed, 14 Oct 2026 16:46:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d973f7sm934666e87.70.2026.10.14.16.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:55 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Message-ID: <woavboapzszyqhm5qrlca3iqrlq33j3ehy4u4mxsib7emre7yx@4mvuaqk72nj3>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
X-Proofpoint-GUID: i9_vy3gWZ98BXurOdSv5wOQNq5ns5gjS
X-Proofpoint-ORIG-GUID: i9_vy3gWZ98BXurOdSv5wOQNq5ns5gjS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX89nUgcV43i3x
 y757H8shawXZBHYjJW4/sIlYKV4NTVIwgFjlxU3ht2FY1lEJUN5AGSnTsD3epDCcbUJNsIU9UOu
 LqFynvqkVSNVzRbmhOa+VZ0rtJybNJI=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad01472 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=M1rqeeilqGQJneHCTBQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX9GoquQZ62ps6
 zZYPVZt69FC3no1DHwDLlSUhoZdLW1mdhVqyWg0Is15lo+VEe1Bv9lsgBycn289JhIw36a5Xfb/
 UrV5Eez8DVZVZUf/bapUlD4WqIdxrlpappCoU1nTUxjtZeQ8DLHH8CrJXQbXgO9l+9gjYMHPvKQ
 GyROQSSdb7BZJxzMH/ZryLJwIIInHudRt0C4OrR0j2PnqDM0QhBh3Ka8J+vOPpvkNJHUfftPuSN
 l06SQrOditK8oEXb4dwNq6dgbKf84o+QbIQBkSMgPmtyO30oPL7pGnybypPj70dKezd8hWvlPKl
 XTqsV8AuPbL1DvUbnuPrT5T7bSwgnjhNlTqNfZ4n/vwXNR5Nj7cjpIho1NqAMG9PuEqXtLWvVvu
 15hu2Cr16H+f9XuccQw9K37VAHA5ZSZUxnoAauTS1FzA/A8ptSSDGaT5lLmCV1YSRtHcENwXugt
 El3yQNmgT0/b2V9UuyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_164700_850582_1D49E6F8 
X-CRM114-Status: GOOD (  17.95  )
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

On Wed, Oct 14, 2026 at 11:31:51PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up mt8390 Genio
> platform incorrectly announcing UFP_D (upwards facing) support. This
> feature is unfortunately not supported by the SoC.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi |  8 ++++++--
>  arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 10 ++++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

