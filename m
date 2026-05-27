Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6A3CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlDTUSZSL9yEYzzXWBCrB8EeTzg12q8rDn+nYTVfQ90=; b=n1cRcnqObs0KN/kyIKJYWHzM84
	4BP3kOdAIfNzgnpLT73fpCJbZucP8PBhOxPO0DiNckdfkbm2mve1kycDiysV30P5V8hfoZHiQglCR
	bIeT9DDK2mwYZWqOXzDVHMaf1rJGOSfYoSD4lwFFCMpmFhY/v4HyGzS/Ef940gfRRj54dDpLGAd19
	zxMnMjDzAAiX9d9dEEtUwVcugYBLuv5Wszmm3BRR2ty8GSTPX+aNmVkteCEEywaMZPK9wZCM+QJIi
	sRsTHkoxfWhGc7Fy6TB+80D+b+pdyW+vwZraYsLYShepqPGXRzrqWoSaIIoUV8lmcGFkndA/VaARm
	2AsOpMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9SZ-00000003WxY-2Ot1;
	Wed, 27 May 2026 08:17:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9SW-00000003Wwh-1EJa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:17:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2X6UF505006
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlDTUSZSL9yEYzzXWBCrB8EeTzg12q8rDn+nYTVfQ90=; b=Aex/DVH7ew19a7yk
	wurAUeH3Z/oh4Bo4Yyb45HQqBXrRxanPWx6IuePC3tMxxxmjX0/uTsjhl51TYbih
	O9XHAL6G6uqKQwmrTtAOk1KRVwGfBUMhQPVuOEJ8MAVU8bhoMZmVN8xzgCZ73n4a
	Ywc5N3YkmJoWZUUlHAkJUYEjGqP+fANeQNQ1kS39Rvx+zps6BrviafLvpFPrwSmw
	TWvNQCeeFjs2+9NgCfTvcPBQFHzQbsVQuWWZqfC1A7SY5Bw2pA9nm7mtYwVfZxXk
	aU+xrOC4fpXWFl9jfpG9eeUuTBMV2lrfcF3RB3j3b6v5f3RLRPyIBvVz3q4VeCQp
	z3twjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentk2jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:17:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf01172bso155360791cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779869866; x=1780474666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlDTUSZSL9yEYzzXWBCrB8EeTzg12q8rDn+nYTVfQ90=;
        b=LIGrNNzRld34NXnL6jU+laSVo8vC7ClzUfxL53oEI6hx28seJdjmURdUgVpvSs9XGz
         p5X9DLtRDgK3jqyhICuhLQMuGgTfWAX921or4/1ZlJXqpL7n4zFlnn3n4ziD3sN4Ke9d
         Ms84jdSbizxQJ3hbAamu0+F8s/FgeLiovw53s9X59WhfLokPhc6GHWN1b0WvOpDPXUcn
         LinCUS84slLlq/JfEb3tiGbw/RD1sdsfQoIzNNXI9aILlOHF9RsRTa6LYUeC2YowYLrr
         vv42/vgqRM/tKCDBvQNRE104b3bttL2z1a5UoZkTMWamk+JG0052Irmx7bOvPYZuifLu
         +Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779869866; x=1780474666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VlDTUSZSL9yEYzzXWBCrB8EeTzg12q8rDn+nYTVfQ90=;
        b=RXrtrr6YPdA0X/8LdC64INfy/YD2Yz4QMf5ISo8Wf+atHfFYh9FwuVSVH6bAunm5Um
         h/emBtwQ/8QYiSjK8OL7Tc45HxhuubVnIS13N9ALEZcTgeJua6Yg+9eOy1Toy4ZEteal
         B9cerzEl++v7D/vKXfpGURv0XDmHicpCdAsrS4PKO0T3DxiGHf1Od17idwoQ+/Tjxgaq
         kcOMFRaTkt6gYU8+sb4qBJ2J34eT9WhOq+fOrEDe3VMGf3+983BHT04/RQQb5q3QyR5V
         vorNg2nFamjKe78nj4V5tJFSGeb2LXGz6uaKd78yNu0zO97yNCudK8wDI48oSO0kQOn/
         zInA==
X-Forwarded-Encrypted: i=1; AFNElJ89YCxqNvSiRwiF9j3ckbVBC6brCR8SnYw51YXEPlGC/LBafHhPELnxB7n6onCOR3R2eDCMb65Hlr+J5exlijzT@lists.infradead.org
X-Gm-Message-State: AOJu0YzUWy5Cz404gzVg5AWjcYDnVRqY0PuKFFgoZ+WBgFgpuvWUjBFv
	rwofTzFj1GInqr/LcAobDsYdt8l89mLmXoidPCpKDIvQLRc3TC9vyG5Gh0TUmCJoy7ICoFNBogt
	tg2DXuqL1vQOPVLsS3FUu/iqidJ3gKa+LShdkbhmvkJq7B1svHJrvKVGWKqOmmFdWEedt24SJm3
	dOrg==
X-Gm-Gg: Acq92OE1dBoz9OCMiUysx6mjMnCzvz9CWJ6N7eNT8P/Hfw4RVbWiTaZKMKGZ8wiVqEF
	c33GRf/QMIBGr8UzOdCxVZpT370MLBs8pXdgAJ9LqkSeoeF/j3AfbcK90InnZJER8ZQK+LZLCJd
	A1dXXWl05TNQ3gf5FSMUSN0Aj1juSIAeXF1vtPUw0dPrmGwBgIzTTmWx+YZYRLhiFTaPfKq//oA
	grzKeDMEzecwzvqkmAKhWUi/0FjmVrhZqGiHDvqot5x3/ONS3+w+67C+o9lqYx8Cj14hYnR9CE+
	DjfqDK7Vh4RhGHNl5/H5cBp4QicDCH+conZJBnjTJCwpvqcX4JouMg9u5SVBeD7EXKr3aoW1j8Z
	DEBUEG+hW1zL2HJjHdzHfUYHwTV5/Vwsz3UU7G7RxqE+JYgWEn3kj0/Ynioxve0q0G4ye8Jiuoc
	c0Gtmg+63QilMjczaT96PKWU3FtCRfkw1Z0kx75X4=
X-Received: by 2002:a05:622a:8588:b0:50f:de06:45e2 with SMTP id d75a77b69052e-516d436f402mr240966601cf.31.1779869866327;
        Wed, 27 May 2026 01:17:46 -0700 (PDT)
X-Received: by 2002:a05:622a:8588:b0:50f:de06:45e2 with SMTP id d75a77b69052e-516d436f402mr240966461cf.31.1779869865924;
        Wed, 27 May 2026 01:17:45 -0700 (PDT)
Received: from brgl-qcom.local (2a02-8440-e500-3194-8c70-1be9-4d87-8bf7.rev.sfr.net. [2a02:8440:e500:3194:8c70:1be9:4d87:8bf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561f682sm403458845e9.13.2026.05.27.01.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:17:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Marco Scardovi <scardracs@disroot.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        heiko@sntech.de, linusw@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 0/2] gpio: rockchip: fix resource leaks and teardown bugs
Date: Wed, 27 May 2026 10:17:42 +0200
Message-ID: <177986985872.16795.8547602828633072606.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526171050.12785-1-scardracs@disroot.org>
References: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com> <20260526171050.12785-1-scardracs@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a16a8ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-TlZYsTrXPYVLYuQEvMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 1-nd9z5i1s02PvXfZNEh0QLaDLRNP_Op
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA3OSBTYWx0ZWRfX/U0v3rPG7K2U
 300B9q/ExyLO7Jj5nXYoh0kZQt3svqs4e51ZU9GKaGL2HEWpyS6GYUbp4LfBg5oXrMFoKsQSAzW
 mTfqJzSjprKcO2x0T/PolVrPfSHQJiLyiDJoj47j0K8Jaux0LaTvILC2P3NU4LKYrsMXi64Elsj
 AAjP1cKfmCMJoPEHdyh+rIGnJaSs20OiChj+e5re16Ef7q/RjPvQG/hsd/zHvlw3lxZ5WTSld5x
 HwEd1hWWoEP9/M3sBDGm5nPHH+mGtjnQVgcI5z5n26t+yq8MOMsaL9rDoLbCZ30pkWLS3nCMTld
 3llIeCvpTCDLy99o0dXf6CktQMSKAOcrgYmSr6+E1Q3NS5Xgw3wGsiOhi9kSLCSd60fhFWyQIvP
 6qt/oPm8HugfKcyXLuHTIL4LnRWaXjdxhCYDhccupF9vE18BlfJfKvb6w89h1vlkharA/WuF+W0
 asS+ZTyEBEJ6wtGm1VQ==
X-Proofpoint-GUID: 1-nd9z5i1s02PvXfZNEh0QLaDLRNP_Op
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_011748_439203_954888E9 
X-CRM114-Status: GOOD (  13.38  )
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


On Tue, 26 May 2026 19:02:44 +0200, Marco Scardovi wrote:
> thank you for the review on the first version of this series.
> 
> TL;DR: There's no clock-names property in the DTBs for the GPIO banks,
>        and they don't expose a separate debounce clock in hardware.
> 
> Regarding your question: existing DTBs currently do not provide clock-names
> for these GPIO nodes and instead rely on positional clock ordering.
> 
> [...]

Applied, thanks!

[1/2] gpio: rockchip: convert bank->clk to devm_clk_get_enabled()
      https://git.kernel.org/brgl/c/d4573b270d934c35eb77fc348866384fcb4e8eeb
[2/2] gpio: rockchip: teardown bugs and resource leaks
      https://git.kernel.org/brgl/c/9c95f4b920e15c183ebbb15b0a011ba32fcb6d59

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

