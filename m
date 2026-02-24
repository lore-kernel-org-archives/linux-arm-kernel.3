Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC08EEFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 07:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Nkk8MNVa9p4aBb4Bn0e8YFqa4T1gMfbm9SGZ2SOdBg=; b=U3H4j0EKid8+HANEa3vJQRCx7E
	sFMtPhCQbMxPXQH/HXWHbgbtUlDTYITvOWamVcRDB/+m4AzC2hICuDEmitQYVnGLUSh6jx/EQdOYT
	rWGhjjTD6ptWnKd0QhdpnfKvGPPfSq5PI3jmzwUh2p7vh1jKN9VmSLYc2+DUwj3oYfT+u2RNaJD/X
	Oz6M3kgWk0nlT+ZMjO54m1g45fe41y5R4XoIM4Frm25oF5lltiP5CLS2RhWBY3t4pcHYBvSJhbC2D
	KmjqCaLf6XMivrXPCkIJtaDNUZUIiIaH35aV3btV+mwyUie7xgvCBw+Ae5EHvQLEE15qne0IF4BSM
	W6VLf0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vun8z-00000001b6w-05Qq;
	Tue, 24 Feb 2026 07:47:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vun8x-00000001b5y-0PTN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 07:47:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LxxU2809079
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 07:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Nkk8MNVa9p4aBb4Bn0e8YFq
	a4T1gMfbm9SGZ2SOdBg=; b=NceJLbXFFswAoCLY4fsBziPCIjA94G8N/Mu483ej
	SSFCBFmhpx2FrmRUAku2eBUDNEZtsfcJEuCjmRp0OZjkHS4vMUD9dckAx/73YAHJ
	rpkYZDYDP6a1tkQsiA2u06/JBS0ynPfBInxGZoXyG1CopIMQ1KGLhpi9TXJuWpcq
	Hlkz5hB0Fttc1NKR72qbVx6yi7Dep0yDKB4R84KawSzV1ipPZyQpV9aIsESSPasj
	oRX9c7mlAJ/It2DadH8W43NCPCkgBkorwMndOJROz1JaIOzrzvE9CZYokzW70WSE
	q8WZkrht8EHu5Ic9nsap8TL0KnZi8Q6DCRGbNBFcT91Lng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8rbc75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 07:47:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso732295085a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 23:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771919261; x=1772524061; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nkk8MNVa9p4aBb4Bn0e8YFqa4T1gMfbm9SGZ2SOdBg=;
        b=Brd7aTV+66DfOCtbQLwo9lLXZa9TK9iiJFCBu9p18BhIuASMbDdI7a6uIvotv6S3MN
         HkW2XX5kZ1fCzBOYnuruLo1H3e56+Zis5Q6HGPA/QWAbYyf90J266O9Mb29CM1DxZGMG
         8YW2aNbKNow26GicRe9KrnKVwlYMPtNSHgYDJHoUA+4nOklPZgaHeehCv1F8ykMJDpFb
         1VqXIFI+0wFUdV7aIobup+Y8XIC1ezySbk+QeXQDOvSLgu61+0EBt8bEsIFVaXR8m/kb
         SJa5T8q0TtuxO5/Vo53SmX6nD8aFlwDu+wY20Cg2UEt6QgJU6njJzSNZjmAYWJwhyTNn
         yAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771919261; x=1772524061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Nkk8MNVa9p4aBb4Bn0e8YFqa4T1gMfbm9SGZ2SOdBg=;
        b=k6ccvNxdh7cVs2Z5Bfa3GTwDa0QZzfhoQHBdFM0pPfT3J3wa01cYFsYt6AdJ0Hv6Lz
         diD2WayNMEK5scO923KDpVVQYppFza3Dx1IKL0IBAqiIDFcM1dIsiu1ATEJKbMK40NC0
         IZ16TdyaK+arjCOp0FlIDdc8yXZbDiHLjjhb1mwiT1H2eaeFHSv8d9SFTYs452EZqgV8
         ABhFJBL582hPu3L7vMaPdauRy0ePM747d6PCLcOPD4WJkVCS+ZS59IKnKceBILnnrW0z
         +VWa4tz3Lf0ll/VKRHVqzyXWKoRZAKGvjo7Ex/ZkdLpd28kKbOGUB8IKi0o9ruIBRH1A
         ui9A==
X-Forwarded-Encrypted: i=1; AJvYcCWm9ydw92omn5GEPlH18jhKKcRmjUIsOXJWpvwk/jLAo5FTXuQAUfogdL0suw/gZ6Y63T93vuTN6pCm4YsxX/aE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5xWemIqeveGR3Tx9Fk807eMnRYVDovcyHFb3hdeTZgOq5WMba
	m0HiB5mYsV3vGP8WiDfWbnBdtrHM/pLhJxBrPvMzTIXyNcPbZxrpfJ8wzFyVEoG/nURyOowIsov
	7M51OHGam1Xd7apXCZH2vEG7Gh5Fj6D4cUP7pC6m065P3LZXr84oMH+U1VxXZtvoSw5IlQf8h+0
	gufQ==
X-Gm-Gg: AZuq6aInnblligD0m8PKzowBBE+kR5m2g95132MsC4Rkpk7k7sC+ILSAz7HCUMywiP8
	pj76PG6ZDVuw6/7q+lQf/v4nRHbR9EzcyaPlkS+r3roDNpBvMkWONew3rftG/oJviSgkNzOBu+5
	fVnvDhpbNfwSEaBTdCkboa/49rBV1s28/ZBqx7Npv5mxRlOjM467vhn0Q+WmRC77pwzpFG6dQHY
	ZuASPWkZEHgnnvBT9ubo5zuGYdkwGKKE+b6/xYFl+NlK8nusJbZ+kcL/7iCZtq9KrhYB+j50S9r
	l8CNcyJXztTQIlypqVZgL82YgmmCzAW0/6r1tlZd2FifABvdzNpSHeEuYyOEmNpxqHhjJ3EdWuO
	+w/CsXrM1ihu7RJsOkj97X3UBtnFe7R6oJW6iGb6lTJCuNaIOGbgY/VA3XwCzjJNxPBEwzht2Dw
	Qb30Nq2fv+I+qzAZgFhiCcCCeus01BkNYtgzE=
X-Received: by 2002:a05:620a:29c6:b0:8ca:55:ac60 with SMTP id af79cd13be357-8cb8ca98dd9mr1369021185a.78.1771919261006;
        Mon, 23 Feb 2026 23:47:41 -0800 (PST)
X-Received: by 2002:a05:620a:29c6:b0:8ca:55:ac60 with SMTP id af79cd13be357-8cb8ca98dd9mr1369019885a.78.1771919260500;
        Mon, 23 Feb 2026 23:47:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb44fb3sm2024777e87.61.2026.02.23.23.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:47:39 -0800 (PST)
Date: Tue, 24 Feb 2026 09:47:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL
 pointer
Message-ID: <itioeaycenubrafp6qy7qknshokosgicgzfzndwrtpj6bfcsxf@penpm5zdqk2e>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: e8P8xwX5s5v3wT6B9ogaSmRe0jhG3Q_B
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699d579e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=rQXAbXeZuVbgsyajZegA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2NiBTYWx0ZWRfX6CPJSvlxlO4a
 ly+aKf9ZfSQMzXXcLLHekbBs+mkAjcIwgX728HOXgJD46C61E1l8O/oFrPgPnLL98hoeM9AhMbX
 wePlvCfRlSNDO43CS7Txa2FVQig6JYdGMMuIqX9mLMGxsv7o1u9WRYeC7Zh+n9uVsFfsVbguO49
 X46IuKkJVf+q4d4LiW3p14lM4UV7rCWrVbnuCTRKTkYun9PCPsFD3JToaDj2p46ey5e1qi8KEHJ
 mvkMzGn1AxNjPEKPSTN47apezd41r0d8RLO2Zr3WcA/LTPTkV4Bj+Vo1JQwO9N6QtUm9P0DwVPc
 EMBBmqLbFrfgC6gStUbCM3lg2dw3LnSOB3NwcXgdyHgeJbnxMKgac4SjpwDE9CMeDkD+glgwH/y
 GEtvh/iHmvd6ELIqrZfyULW03FxD4n0wk74aqs5CBU2Tikz7J/3bkT1vujWjN4UhypvWlqQIzdI
 Ax2MTMNIxKSnWq58FoA==
X-Proofpoint-GUID: e8P8xwX5s5v3wT6B9ogaSmRe0jhG3Q_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_234743_152199_1EA9CE22 
X-CRM114-Status: GOOD (  14.74  )
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

On Mon, Feb 16, 2026 at 12:04:16PM +0100, Krzysztof Kozlowski wrote:
> Pointers should not use explicit '0' comparison, so just use standard
> evaluation as non-NULL:
> 
>   phy-qcom-qmp-usbc.c:1682:31: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

