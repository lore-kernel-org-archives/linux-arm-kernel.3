Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6C0E7849C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 22:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0jPL7mGfIp00qPtZgEa30xxEWpNpT/MXZqO5NVIGKE=; b=T44HWJBmFW5WdQTaTd/QOC4zK9
	+fLVtJ+iNmcigh6pdNKfO2bnhNU10Zd1bwGbACoYf36IpM3bxsh6ohCEq6UcSfDKw4n9PS5QNceFD
	HVtaH7RJ8EOJwA1sdsBkdfUIjzYlHkSD4dGjUTg7+jzRtzkkP7YHPjW+OzyARzcR2SY9g9QNNkvIy
	enNkzF3OF2Smu23CjYVOmAUJ4eemgcMm4ouRfUpxvloJoGk9GWJvNei7dTWUXCaLxn4mcj3U0GFZh
	Htruz2RDIWwOPi1uvXqex9U3LdYs5lxRpTsxZpSaw0U71hM0qSSSr2NcX4KBwwuMx2Y1TqodLhaJJ
	VC/Hu9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYXPE-0000000HSWt-0xZH;
	Wed, 24 Dec 2025 22:32:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYXPB-0000000HSW1-1mmO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 22:32:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOIvMKm1456675
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 22:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L0jPL7mGfIp00qPtZgEa30xxEWpNpT/MXZqO5NVIGKE=; b=PAW8iMZhAX/qVe6S
	UZgFEPbjtgKTrQorh+dhGw1pFjpabn/8S4IKfwAtLujfsLqTSAyiUrHtn5j8+VqM
	LtNq0BBIiBQGDej1WXSlw5O8oydvzuIpQnB+xZ6GUT4E1ZvXjMgddjQ5+IEJ7xGr
	us1fhP3HqW1WsME56PdNBM9i4mENErpHJqSLoi4I3JW6FN1pWFsnA5SsynOi9++p
	KnwCNVLn0Isv4Ozv4uEtlJitSTxSzIzW4BqsmE+iNRzvS/t6DLLwDEqGBIXi1CnT
	Ax6TNsiXP2QkVLdVSVWitkF9AEPeZloze+rTXspo9Alb+xymMxTubvBfN4G3WCmg
	Ytt/3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8hwe0tbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 22:32:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d2aa793fso161532521cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 14:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766615548; x=1767220348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0jPL7mGfIp00qPtZgEa30xxEWpNpT/MXZqO5NVIGKE=;
        b=fiSmDdg2ZmEoC2UoVaXS8j7GjMkWH8Fqn7qKvwj8ghFsLnfZj92o3/kdX2OqvvI4Wk
         Q3ADL35Puifv82AXMPcwipUJK/6g/Fw7RlrXJv7dbo1Pg5PowTj/k9z/h1Y+pDVUUkA6
         7/fF/BwbjaMl/8z3j/9s3WJTh4UAe3ACDLIV5++IyoTsGX/KAplFCOtlsrFj3vpmxsAP
         svvX0Osipc8Swqk0tOAD9ZNPkvkhQv5Dm8a6VcSfEikO/FH71OpU+ufP7emHKZICEUD8
         ph+DpRPkgmu/VHMS6muSzy4iKsvyfpX6DyVLNgKCpzAZMChPglst8/Ag7MkmxE13c2/B
         rkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766615548; x=1767220348;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L0jPL7mGfIp00qPtZgEa30xxEWpNpT/MXZqO5NVIGKE=;
        b=sIVPXen4GogGG8MVU1zD/YBOE/2FrWJGYpu0RJwsgIEiU6fXb3xPYGGfp7iHy2ma2V
         df1qzix/L0spBzeLamlVUYh+5D9tyQyPWJtaF0/JtojBx68S7hUapCiyAN74hyzrVc7/
         ftt3mB/Lz1xzbpDScBCmoxRboDpj+EPwJbEbWba1jAnJl2dqiW0ENcHBhmzpuimTXOlj
         BM2uI8W7IaSKZn+vPV56wF/sZlr9rSeGRh1A7a1+9n6Fz2dvBDoaPnbhAftIakhj0yZM
         2spuW/sJqk73ZHqmjMHIwx5Iss1Sh8LdzazcjvGbRarB9YBQLgTudWfSfAr9C25m3DdE
         6DOA==
X-Forwarded-Encrypted: i=1; AJvYcCUiy6WzU5Ad28BDGOnSubUthZjAOS84cVm9G3nlAgIb87renRIOAQ/Xpc/X5aM3SFdewGQx8PY/adqLtam/11QT@lists.infradead.org
X-Gm-Message-State: AOJu0YywBbuUMx/vbKoQh9tLOQOL8LcpNe8N9VLpxXPLrShllCjQT3bB
	ehprEM3kvTJ5UXBbl4XKvZM2K8LctKi65OuDnC2d+jtrLxlJB6fSeAQ7rFftx55fMdOoObBDQpZ
	g0ZZezJ48srUAq3P3LSTOTakNRJvaXZXlgEFshmrh6xLKXtobwRx2IMa1t9OOKqB/oPDwzR3fyW
	r/mA==
X-Gm-Gg: AY/fxX6mssR7SdekPz4insMpdN7p9BetLDaTe8rK+9pPMfqwI8eXOsQeI/jI+2nVglM
	AmWdH8YcrHaglBpQaQLsaAnXH/pJYAbJqbblxF6gKxSgULhqIQNolQ5tV2RPBkg0dbwHX8hx4z9
	EY2KpYqyqpyQUvHAUlMznq4rd4dSWHLuGrpljX44ZfuVf17C3vKMfbhEv5GCxxN5rmuLfwkBd1Z
	S6WQRNO/SW6pQDeP26rrkIOs718L6NbVG6BZ1JdYrZxd4MEijLHrPExkzLx4hNpo6d/lte+w/6t
	dakKmskRdGei0AfRLsdgo7WtKjNyzgJi8K16IuGq7QdauEY7eiHDpAM3u4opsjwH4k1Jk14tcwM
	ULvKCpfUd79guSe7AYEbVJf478a7AUbR/9XNFbLyR8XsQSKcS3KoGMJyjE9M9v5FUCSK2N0mMow
	QR1LB18V1fbFW77fjM4mw+X/8=
X-Received: by 2002:a05:622a:1b92:b0:4ec:eecf:66fc with SMTP id d75a77b69052e-4f4abd799ccmr273103891cf.51.1766615547900;
        Wed, 24 Dec 2025 14:32:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG19rNmv0We3MFkyk6sQSUrSfINXHL2KxbCfoVrSCCgav+j8dPUIqzPwOReGX6y0l9q4HhyGA==
X-Received: by 2002:a05:622a:1b92:b0:4ec:eecf:66fc with SMTP id d75a77b69052e-4f4abd799ccmr273103711cf.51.1766615547520;
        Wed, 24 Dec 2025 14:32:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122693ad3sm42746951fa.49.2025.12.24.14.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 14:32:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: heiko@sntech.de, Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org, andrzej.hajda@intel.com,
        jernej.skrabec@gmail.com, jonas@kwiboo.se,
        Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
        rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
        knaerzche@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20251016083843.76675-1-andyshrk@163.com>
References: <20251016083843.76675-1-andyshrk@163.com>
Subject: Re: [PATCH v8 0/2] Convert inno hdmi to drm bridge
Message-Id: <176661554529.2411515.14933651749352627609.b4-ty@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 00:32:25 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDIwMyBTYWx0ZWRfX1MM+lwLW/WRZ
 BUbrCRDEeYnK8F1vfp2Ym5DG+P4AQsu/vHerZnDlt0U+o+IsJylGgA9uxCKRXC87VUDLVCFaGWq
 BSfuMQ+r8NiVA0q2f6ZaTo2S1zmY0VkA9L3zW+XGUl4KFXHHM1oGtNmXL90IyVckeF9cJABxzXw
 pu7hA2pmeX4FmBI6ZtJenrOzv84Ahjoi4Ugy2YQbGNKV9+kEPEVBjDY0ljKFqjKQ+av0PUBLgR+
 l02wU1lbAU/zGpOUkfBnOc28Kd0yoomsBXmrD3F6zECBxoScn2oYoy1GyAqk0B1uJip+IlGOhKJ
 c/koN1nWVeumdJELaQeB3pUeMWKB5hyseSOADHgq5nzaBh247+YxnBoSoxzeiMeaFX9bZ8zrPSm
 TARPeJfw2vA3wysy1gqwFurebhWS88jbW2SdwWIe4Ktf8aDxUPLIg6nP3A0nhr8eDwxCaqgSo5Q
 HoWAn75+06n5rERdgow==
X-Proofpoint-GUID: v_G574Kgc5nBxzCLWiNjGsFHANxYYXWB
X-Proofpoint-ORIG-GUID: v_G574Kgc5nBxzCLWiNjGsFHANxYYXWB
X-Authority-Analysis: v=2.4 cv=P9c3RyAu c=1 sm=1 tr=0 ts=694c69fc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=nruGSBBzdhYNc4dVb74A:9 a=QEXdDO2ut3YA:10
 a=0lgtpPvCYYIA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240203
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_143229_712254_E8DF5CCA 
X-CRM114-Status: GOOD (  12.88  )
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

On Thu, 16 Oct 2025 16:38:30 +0800, Andy Yan wrote:
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> Patches that have already been merged in drm-misc-next are dropped.
> 
> 
> Changes in v8:
> - Rebase on latest drm-misc-next tag: drm-misc-fixes-2025-10-09
> - Link to v7: https://lore.kernel.org/linux-rockchip/20250903110825.776807-1-andyshrk@163.com/
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
      commit: 969325a2597ebc4cb001a92992f06f698ab2b467
[2/2] MAINTAINERS: Add entry for Innosilicon hdmi bridge library
      commit: 130343ee6bca9895c47d314467db7dd3dcc8bc35

Best regards,
-- 
With best wishes
Dmitry



