Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61DED0C858
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Kf3Ro/8NFkbGB+tKehpxW0awatgAh1Ax7t4rv6CRBg=; b=fyE7LrYXfoNQcrGWQalKr2KnqT
	Pg0Lb1CQq1apOwoMkxw2uUaX0/GcGaVauht/8qhQbbo+LpUsMWr0b4EQ8QEBY0twZhyh2ywEpIUVc
	VyLSxDGarfocZvUunox+7ii4yXKn6ojkcL57hIJ2iutLEzZtSmMFcfgKkmHk/sUHFqUF7MkUMp9XV
	Q32/IKwH7lyQWjH5Ds15qUAm4xUBXgiobIEUJqQbL/AVczMQln4ZlZIc423p+KXUBio7TMouWF1fG
	5qoNaATIPDbaY6pIZ7M+xt/bBagqgeTWDPOG5hCFhN48aRy4bsEHfSEMWDUVJzWMCBZSvzMgjQ2nl
	z5HKTQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcWf-000000071GZ-3HQH;
	Tue, 13 Jan 2026 11:25:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcWX-000000071G1-0r7R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:25:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D8Z19U3727191
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Kf3Ro/8NFkbGB+tKehpxW0a
	watgAh1Ax7t4rv6CRBg=; b=Zu9OWRU5PSQtmzMrQzVrVzXDJFWSuu8l10zRlg3C
	CEyq3kdbKqTp6IKHeuOj6mbRAIT8eKS0NP7zAmj7xOd63hlph9rYPPZibk8RyB8W
	UzLdwrNXDK/56Xu9NwT4jAMc2mMtdFSO82Y+ZVeEW52H60pNUxiwvqWXPEkHyziD
	sj8JK97zr7L2cz+aieywmN6EGKBdkmpv1UTarjzzWKX7Px2hwJ8cVme/owKjp5LZ
	FC1Yt91bWerAmEMdzc3glLPYOCK7NYzw4l8BgGJBCDqyKLUbxQfoLdS2IUM3gJzq
	JBk5QPlQPm/+C246gl1+QAdOdMMqtN31l3W8sFi9jx88vA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnjnu0kjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:25:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2de6600c0so2079999185a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 03:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768303519; x=1768908319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Kf3Ro/8NFkbGB+tKehpxW0awatgAh1Ax7t4rv6CRBg=;
        b=b7RFkKjpb5J+wV6AYtiuiWadFzda5K2VeyXP9rfr5ZjP3DLArn4g7Qp3wPTxrDKORX
         KTj6oacyg6GdPUnFEHYI7zRBAJNzAkCPukwzDtcGnnsj2TVD+p3GTYmTTiG+CpXU/3m+
         StX8rhSbT4VMfyz34B4QyYbvLmW7gHH9IUBYu0rGYfSyVKMRpg9EvuSiUoR50s1d5KY1
         yYHdxEgSeLAhymqOZXnkU9mL04/z03PuaIzK/0+U07yWRluDpRJoEqsN8eTaIOv1v8AI
         CkK7tQcUXFCMQIGUsgFSAb9ABQGJkR9VFoo9ScIgAMTa7qjkrWJDEp05B4BNuNWNFY8v
         2K5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303519; x=1768908319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Kf3Ro/8NFkbGB+tKehpxW0awatgAh1Ax7t4rv6CRBg=;
        b=jSsKI8gy1cc5xa2u5KVQHfmsrS61YSwo8t0bhDE6pq9BtxwVmorRoigCnU6Fwovb0A
         1ETZzAkb/n6XY7vyEGIBv8bCwjpDDovhoyVcEqHqf2JDbapxXwSNYdssnKftIluoDP0H
         r4A0o/KC9jo9Ub6lF4Qghbe8cKUmCKeQ0+eRakWDrGYDtfUDf2K7BxMGZwig0tOs7FsO
         5U/BiSpN1KDggBRI9IJt6G7Nr0MT4Bf4dRu7XTN+JwgNySrMlN7HwHSezL0EQ/efhKUf
         iU63NSoGVOTYU++rcvQ+v8BKRVDJx/8OngeyIrZDjmL+FUrp5f2gFHmdQxYr7In+ied3
         EjsA==
X-Forwarded-Encrypted: i=1; AJvYcCXy7JRLIJDCXTvfZPr93L4rVTLwJnCpxhGLPjNVYebA4tQSjU8chxly5bQlRHV/ZmhNzN81jtCzjN2kQJQBoiKC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfyi/0jx9sUdSojtTlyViUOKhUadDD1Lkvrlg4ugPPGN1kl+sT
	7exuyO1+GfLmUb+UwBBLiV0SCg6VgelfQ7sY4Tu4FeDXLpcOS2HEUlRNPz+K6IJCY7J/+lglVCj
	hWFAKHfGW4/WT6fIZ0N9eh/88AhUp8LUH350o5IirMkjHZQR4YBXiWEvoWjIUHgCIi5z4mykU66
	9l8g==
X-Gm-Gg: AY/fxX4iNMmby+2lmoMy5YPnOEmtH4lnBb+Gl0P5OWT/ZNQGxeuQrF9osTGO/FLGRi7
	vEawJS0yCGv5p26yxDwB82BnT3y/yIBSNgQtPVuVxV5pAJdhDrOM/WedE9naPpmC4TLh925au5i
	gjq2sGNC9/GU2cNcSYODod6ZhP51l1iUY7B5sv0aD8IH+Dqc8RZhl0LbzMRNANgMlUZbe/ByaiL
	audaPtfukX+P5wMzm0kI+UKTspgkQ3Rye3mCtMz4H4Hy1Fx9k7OXCqfMpHVRQ+FdYMIOOfPBVf+
	Mzh/h0QInGWfnQQmEUc6pzu3xkCwsGbmEQtbFHE+Fr/wr2YH+KmkDMLYRN6/3Pzp8Tesk39vMGc
	D8ceVXod9QGkQvIwIREkGZ/oQi7IgdLOkisw2QexeNO1QgiMWPIci4ABA8TcLaTo1sO6HSmOEKj
	7rhdpPyBGHEhc/54cnZm4jTqg=
X-Received: by 2002:a05:620a:d83:b0:8b2:1dfd:f6a2 with SMTP id af79cd13be357-8c3893a5939mr2915866185a.40.1768303519364;
        Tue, 13 Jan 2026 03:25:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1hsn2ilnwEbd6t9Ep084bkY6hAk+Z97Tp/O+7NvrOBFZdHTyDztXEXIZbBkcRuTwh5lAbNg==
X-Received: by 2002:a05:620a:d83:b0:8b2:1dfd:f6a2 with SMTP id af79cd13be357-8c3893a5939mr2915862385a.40.1768303518852;
        Tue, 13 Jan 2026 03:25:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d5db54sm5670677e87.64.2026.01.13.03.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:25:18 -0800 (PST)
Date: Tue, 13 Jan 2026 13:25:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <7ruiccdm7q5fg2pixmszr3fqvclvymdlkv4x4xbavkaeczrxgc@5l6usxqfi5fe>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9xD5gzqcntIFhCkCiF6jzWxyO_iw_GaR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NyBTYWx0ZWRfX4Tl4PJ4HlyW+
 WmxZZmmo3J/6i2vCC2QTDOMuoP/sguuthXpwT+aOfw4OERz/rKj8noO1qYEzlUiiutjZry1Rb7L
 dPcBD5RlxveHwCNOt2VpqzT2YgtIPsA+JkuCcy7nVGo42uPP09YT/2FrqRrDBcICQdHx8z3kASe
 4ySSPO9pGJiPdmLlOdr/lluCwipjA3yf0GHlII6EsjwaZHvBoBAd9914vbWuhevkNY5o42X9zv/
 ShnXe3JkWa3RhGZRnCi9xEmtK/WEZyq7nPFksb4eCQ2GVFRLaPy/rQleI5iCIfx3XWgodC+I6D9
 ypQ5zKo/Rk2PW4z0dYHB+WA/22bFumWQ0azBhKATBIe0NMtNkwJwnKlMm6OLQ+hEUcnpnK3LG0b
 Dl6UWEsRuw2zJ/EIlNysZ00eQrIT3y9evzzSV6QZmVnbqIS1SB5VuwarR0IqkTWDf5gm/CFS1HB
 TW3O08vn74AZYSfl1Ng==
X-Authority-Analysis: v=2.4 cv=RMu+3oi+ c=1 sm=1 tr=0 ts=69662ba0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c_hA60C45wluNUwf66sA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 9xD5gzqcntIFhCkCiF6jzWxyO_iw_GaR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_032523_408590_8BE063A6 
X-CRM114-Status: GOOD (  19.96  )
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

On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> 
> On platforms where a vendor SoC driver already exposes widely-consumed
> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> of a vendor logical ID like "519") and breaks existing userspace consumers.
> 
> Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> prefer SMCCC over a vendor driver can explicitly enable it.

NAK, the userspace should not depend on the exact kernel configuration.
Consider working with distribution kernels, which would enable this
driver anyway.

> 
> This avoids unexpected format changes and keeps the generic SoC sysfs
> stable on systems that rely on vendor-specific identification.
> 
> [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
> 
> Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
> ---
>  drivers/firmware/smccc/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

