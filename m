Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C82106F303
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ux0ZdmbwgiEHE0xsx6C23MKBXGqsEpTSkBrlwD/qJVg=; b=U9wxrk2oLaX1B4prJoZ28aNXUj
	ijx5xB+kLxFmlBFtBHCfcSM/2ob2qTOogwYwALy+Ms9n+XMS3Zo1G7IZaUxrjG2HYMcRMCalLjrqP
	azl9WkwUAnsXYukFjfWAaOXTDeWuUsOTSgotXtDCmekGscUKyR7L1sJINNw+GSsvPscFa2GG6m3j5
	OZ71gU5OglxMVNLmO9vBxaLnhHEiXoIrVlWGdJEy72Fy10QZP6zKU8wXSUqtyzRXX0t3rg+R9Xm9u
	yXKB+QYhgELh1kjYEqfvUhyZhU9xhhtHZlA7Gkc0tNzABgKDRqNbs0U18uPG/0KMq21T1xkqJkItB
	U/jGCJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gI5-00000005394-3DOL;
	Thu, 26 Mar 2026 08:42:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gI4-0000000538g-2I6v
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Mar 2026 08:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ux0ZdmbwgiEHE0xsx6C23MKBXGqsEpTSkBrlwD/qJVg=; b=L7rCSyOSsQiO8wcdb+x4zoSsHI
	DLOa7o0vulXG8NTTn8F/TVLsVIh5vel50vP2EvJEmC84nlJGSmgLL54rtdWOPupD0n4p7lLn1k0Yq
	J08HLIOI6v3RLKVrNd0nFJdt+2vAzNm6iAsduI2sWeqle24W20Ssclk4Vt6p82MFM6lsyxSB2/oQ5
	w6z3c0PWfdQ2aDzdNt7thvkRkIANKObapy+vSM5XzUSVm7h0NbrN6KyB67uoPcKejkrW9K/Ob3fDx
	/sVs+6eb7IZqxhTcHwrGW3quvrJ8id6imVLR7jC+hxt1byPTvMY5LYdTIm50ppjJglscd15gV2o8i
	gkWIlUIA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gI1-00000007m8c-01lu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:42:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6WWx71965142
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 08:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ux0ZdmbwgiEHE0xsx6C23MKBXGqsEpTSkBrlwD/qJVg=; b=D0oQCCC5qOunMwot
	bzaBpAr1XNfPzBxU+TvkusaL2beTw07OGIwGhQCyMTMZNOZ6EDKXZ5EkluB4DKiQ
	xiN9EMfW8LScTgUsEJFUmEgtnIra4oG/phons6curyp9I32MY2x2lAa9dBWKZ1/I
	GEfHoHt2eivXUGrDr8/YiMeC4DE3fiVjLFdrs9HkaINQrU3/aLZNhzObAsOgDxMS
	7LhM/o1idsSW56FcGOJjPuwUhHLqRCteccatVMNXtT89HzWWnh6zerCdKa5U9gYn
	4I235rGk7ludDEQZn17RahvQEij2cVSyA4XpuIKmKLGRd2aFD0sWLMlkrwGmCyv4
	BY2w7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4pymj0d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 08:42:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b220c72bbso30123631cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774514522; x=1775119322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ux0ZdmbwgiEHE0xsx6C23MKBXGqsEpTSkBrlwD/qJVg=;
        b=O5Yyikh6qX9o6UpxKb+Lx8d1RlZfnKvinir0tkvXVYyeJV1/GjEkDOgFfxohNarTdj
         csr1GRlLnieGvJB+GKPGh7KJGsf/heTZ5YEmxjpqO7YdvZxH+XJskQxDj278L7HEzYO6
         C07/0cDtp1Q0QsbeHgpCgNQGWSSsaY3dTBKMjsgETPqLnL6WqA0oftf5n9vgNgb0+ZGk
         4icNIziV7Z5rejV91nTz3Ye2Gj7GvNs0DbfFo39xwDIeOSH+P0JWClX2bxs1ulJOtFSA
         qchiKKipe7Hr+QuR50dnOav/ceBjjsAtaWCKP2LbLhrmCwNuINWhIMolzjys40Vzta6z
         XCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514522; x=1775119322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ux0ZdmbwgiEHE0xsx6C23MKBXGqsEpTSkBrlwD/qJVg=;
        b=lWEiMnrHZ29JA9MuT91IaX5dlFLNDSmpKH76r7v+H49zkcKMZFkuLhctTo1Uys/au1
         jEBussa0X//2888LM9kTRX8YPmVzLZ9Qzs2uP6v9wSW3hB33AduzKybAizBuLuG1Ejk3
         AxX9ucJ/vJfLWeon6LobpgYOWkK5YNqAfK6mXyhTrU9ta9KwWphbX3ljDzAUC6n0TCmn
         wHAuNe3L+hXylucMP1mevVFqxBz4K9w745BgN6NmKu1SGDKU2ZpvibkUVJqSoz3vtS38
         3bTN5Pbyrq6P+R3dL1JoK2jyWxxqC5d3Vz0ra6EDzJxE+FftUgC8H+qnVSjuqFCW+1J2
         h8XA==
X-Forwarded-Encrypted: i=1; AJvYcCX/ojhfG+m7E8oxJx5zBo4fFaTQyydL3//r0M+1sAYOSRWtd7uzBqlY4y0eKkUabhTYZsmH85n81apjgc7fUgRB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5XDeok6NGSGQdQwCWsoJa09NPu4z+L4YtZV9VoDpiav5YDsOG
	4RTh2tTKboGNnvFHomNXT/1LsFeFMNy1pA6L/E6K22hnMUniSFrYB2RzJFgXCbRMdtQ6zavY3BD
	9jxDsrR2ontbv6GdnSQq7ZqpfMJz352De7YMK7ri5qOb7HMumoafCfh/g359vjv39VMuVzxB0Ve
	lCAw==
X-Gm-Gg: ATEYQzy6YX2WTWV+CRC19wYntCd6KHdCUkNOyUF3IqIJkXpMQDYUSx8XrSiKINq117n
	jP69aJ67ldvo2C8Dzkm41vJpHjWut0EjafiahzCilIp9A5DvS2yTvxQnCuK795sR8blkCeYf3pw
	08j3IcxE/0u2qXgOFEHJNjv5v9cOrt6mqCuhgobg23jW/1fS8JpUI1CBVjrunI8VF+ShRxLsc8f
	I0w8NLJl2WYTWb4I0AkwDybM5ypqjWcUJmlzHDOgKzP/zn76qrr5xDXlVdGbRA2sWnv/hzMwHoE
	z/4NDSG3LSWbdpcNf8Z39p0KtVSnYzenDWlhZ8mrZOalgnzCLCnLqCs6tNuFn9HZkChoeHBjvz0
	zoXoHkVWWQhXX8kUape8S9qIDrWfZVvuy7Q0lU3R3/fxN6FRbQr8=
X-Received: by 2002:a05:622a:1981:b0:509:4198:546a with SMTP id d75a77b69052e-50b80c9bdd2mr93965311cf.1.1774514521986;
        Thu, 26 Mar 2026 01:42:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1981:b0:509:4198:546a with SMTP id d75a77b69052e-50b80c9bdd2mr93965131cf.1.1774514521573;
        Thu, 26 Mar 2026 01:42:01 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:92a5:ac13:cd81:9625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487208b206dsm26138865e9.1.2026.03.26.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:42:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Date: Thu, 26 Mar 2026 09:41:59 +0100
Message-ID: <177451451521.5307.13788251151955242661.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324192129.2797237-1-shenwei.wang@nxp.com>
References: <20260324192129.2797237-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -MVhthHDy-F030izMC1Ph2uyefTzNwcz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2MiBTYWx0ZWRfX36ECxowzx18w
 UbO74GD7lHfIr0AwVGZ442ldAxjI7RcNgNDLT0yX0pHOBYH0WRG265m0P+63laocGHvYcBU9IqP
 btc5R4uY1bL3tjlpYctpe0bF+wkxNk3Viv8Ph4SvCfioHV9Kl4N73oNB+Pr65OVq6bW1Osx8s6Y
 2Z28nEkvQ8PrP0OFekErLi2nAIVXB84jIqHHM/cX3hLYtjdEkR5PH93/s+tahc5V1ekd42OsDxA
 6I9Eb2Lo5shYLaYxWNQmWXM93nldzV+CfyIYlvC3MItT5cN00wQBDdJ3IfOlpjl6gj5YZGHobMZ
 Pb7NinaLPssEcDCWSCY9dsy+lZpVG/RduAWf8fa6lyW/DIr81IEVfYnjQnTD8/c6RmgJHwGBTke
 uh8SkmxQi753oFMSAZ3++K98w3OpTCzttCp2dOw2iVM+wQMr+Boe6ntxrJ8CwXGxMyUDQkbhA/u
 cZ3a9UqrtRs3A7qWhYA==
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69c4f15a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lldR5Mej2F9az_PsPLoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: -MVhthHDy-F030izMC1Ph2uyefTzNwcz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_084205_457809_CCA8637E 
X-CRM114-Status: GOOD (  13.72  )
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


On Tue, 24 Mar 2026 14:21:29 -0500, Shenwei Wang wrote:
> Suspend may fail on i.MX8QM when Falling Edge is used as a pad wakeup
> trigger due to a hardware bug in the detection logic. Since the hardware
> does not support Both Edge wakeup, remap requests for Both Edge to Rising
> Edge by default to avoid hitting this issue.
> 
> A warning is emitted when Falling Edge is selected on i.MX8QM.
> 
> [...]

Applied, thanks!

[1/1] gpio: mxc: map Both Edge pad wakeup to Rising Edge
      https://git.kernel.org/brgl/c/c720fb57d56274213d027b3c5ab99080cf62a306

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

