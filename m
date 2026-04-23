Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591BFF9934F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 07:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLtMIdnvwI34yRG6JisxagisC5laaw/phEalkWjoZnY=; b=UnjU0IY1tjNIuK1hgctGZNEEbr
	bE1N4JdOzCp4+5CQHlkO1GTrseJPFk1prNy1el4TAh10+sigSYIN8exLwXgYBUqN6gH6LO8qlaTfj
	opNA4zDg4ju3gr+cjVUdqTEYEiVh9XwSdklreskSZtcB6JBCK9r2sxOpECgmq3qC0ZxZgkDYBBanc
	29vkXLbErZCAQ7rymRA0fEphVF2LFW8KPzDFM/j6njISt3zSX1rkl7oLamgg/tYILemYMX3J4nT+i
	D72j828PJbU6LKQOZ7H4IJc/g/KVA0gZv4Sitbwqy65ixz7JL+SNMZTCA2oATV0YSUVCcvw5+E8TG
	B1yj7+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFowy-0000000BCBd-3wrP;
	Thu, 23 Apr 2026 07:58:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFowv-0000000BCAw-3NmY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 07:58:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3Vf5w1587786
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 07:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tLtMIdnvwI34yRG6JisxagisC5laaw/phEalkWjoZnY=; b=lrCDQDOneBhwK8bQ
	kx9jR/UQBzsvXxgd8r0xbnTrccNPkVdILOhr3uH2Dd0LkoryurNcKElib+nBNcuH
	G3Os4N0yIlT52pqtdR/1JP8cjJmujO1UvkYBtVBQcWXv1SZPLE9Yd0Ghz6LUBiNm
	o42+xECvi3+Cn7qHBfK+XHxLm756gPe8VfQRUED9pvwsJRzLix1v9cO8wqdInGaY
	Qf3wtiCz3EP/SkN3zSJEHl527xwXuzwaQIw+sZtC0NquCjwKdZkbxzOKN6244/FJ
	fSwZkFMZbdasNlgYPBu4CgJPbjfkBhXyHA7V0ohNlaIxtQLxpf9iDhmLA9HAwpYK
	CprvQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq2sn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 07:58:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d84b5f73bso212087541cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 00:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776931091; x=1777535891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLtMIdnvwI34yRG6JisxagisC5laaw/phEalkWjoZnY=;
        b=QRtgbDiXc/VBWbXMrZBaOWksJgF5HIZcCGJ5EEcu+DkVrHXsKsTA1C+SXW9NMsM2Zy
         QVvodyDifgCk08D/TlMHvTP/73r1SgLi0AlXws5EF/+nOLY/y2Ej8By0SlnCst+swRVm
         2OQU+fvGhSV7XyAyokXlbbt33g71iuIdqPS/VxBdV2kFCXYyyJRYOorSYDgofAy0Sngu
         g6P4xJAwob0Twr3HFwKiEXg2qicbbXdwFleeSb1cjCzI0OVeOC+mKsohmXPig3mK2Xdp
         3QWn/STzs3LqT3MXMexFj6MumVjv+X5Dg5Mh8Vr4jfkMmboC0znoeAmeX4TjfMm6mjM/
         /bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776931091; x=1777535891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tLtMIdnvwI34yRG6JisxagisC5laaw/phEalkWjoZnY=;
        b=a9b3ZTHLqmbvBMH4GV+ob3mwbhvJPGxxpbUI2s8gbJyPt7pmFMz4c9gn+76Q7CF66F
         +O/YcrFwvPI9NWIH3vnzNG9MAqvDTeq/FqHHSwqD1gZ8wwdE9OoFgPJS0iD3+2iKC4bw
         ImhkdDX7IkilDpNroGZFmyzLQIt+nT7Q9NiX4x99XNAXpbDZBkvYASquijjqF8se0pRS
         DjVMXWWhPc4nqXf+HGlTIq7SmyPDM13OMK9T/grPy5tUTDLU0HNojfw4DbV5sz2cVme6
         ISx1JNrIlGCt/5Sn10rgtrITKFKWcUvXut/fpl2qgWDO5IHfrKT46hy2FIA/TsuhfZ+F
         JLyw==
X-Forwarded-Encrypted: i=1; AFNElJ+XM0JMKrMO6S3TUS1dJW2QZTLucjOnVeNiMrw90D8tq26PgpXmKkVCmHulYetfE1TI4JukDHtTagSlNJJ6LgEG@lists.infradead.org
X-Gm-Message-State: AOJu0YzEO3EAfvlRSXLDVx9Fm6xkk0O+D2FvBpUpiFQHJ3SbSh33neWw
	gtMiEkH2NFpvFpaZQPSBBuXeTEY2gLW1kiqhmlCO6fnaXGVKTlTxQCj49FcchBj7bAvaOV1tfBt
	boYOt5hGZatkvvE/9oZQ8r57uRq4BWNFFYk79jc681Q993MgtTfSIJfcNemUh9WbCLmaHFlSrgp
	WvtQ==
X-Gm-Gg: AeBDietFQbs4lPg+L2lUOpVHNAAl55ssuZk29Qv2lYF8ofzQvVDfUwfHXExzaFRGTgc
	eMDIWiJt6EikK7FczcnsNiHSIxC26T8EZR4t/kT2K1Z5hraBkUuU1MrjqDWA/aZxP/VaEsp0KY1
	cDcIVAbAdTcHS1oUHUYoNP3bnDJ/fM2jJfsUWhxPBNyOtV/iwhPgZuT1SEx9eC0b6WGIxQQJOb0
	OSp4LlWmFj/4lXKESAESW7UV2gmPo/1/0dvZl3Y90gLb9+5vwfRhJ/R359LymNbohdvtO0HfPo1
	mNi+zmzjvvDILT0HnczeicRUsK0D2BAJuKlQPHO8ykKgNWhMZW+wuUSAk9Sai01Shsgl03mG0r6
	PBi6UHesES/dcR4ZKMOssMZDMV+Byb6C06uh7TB3gx7klPseneluIGGDCxsN/
X-Received: by 2002:ac8:5e4f:0:b0:50f:340f:ff2a with SMTP id d75a77b69052e-50f3410044fmr202194961cf.45.1776931091465;
        Thu, 23 Apr 2026 00:58:11 -0700 (PDT)
X-Received: by 2002:ac8:5e4f:0:b0:50f:340f:ff2a with SMTP id d75a77b69052e-50f3410044fmr202194681cf.45.1776931091109;
        Thu, 23 Apr 2026 00:58:11 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:68de:a8a9:cd47:7f0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm79521295e9.6.2026.04.23.00.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:58:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Yury Norov <yury.norov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Yury Norov <ynorov@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] gpio: drop bitmap_complement() where feasible
Date: Thu, 23 Apr 2026 09:58:03 +0200
Message-ID: <177693091906.5151.14291808877390373145.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260417175955.375275-1-ynorov@nvidia.com>
References: <20260417175955.375275-1-ynorov@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA3NiBTYWx0ZWRfXysksVp2HSK/I
 4C2RqOFrTl6ZP1chYT/FL8PUryZwheAW8QiXMDHRHj9mMgWrnKtiOeremOE0e4pQVODZOZve3fj
 g0WgYIgiuhnk5bbSWc8q2CUzACpagXlpByeobtNIBkMo7zEAB+sT5Gbt0on5sHIsIHkNRN30XeD
 mtfCuGghw22RHhUSzBOwlVGqcpoC01MShXltwflqDmJppIPh/RrqWCq9xiKRAPy63iDqj+ttBgp
 vtK71pTME6i/5BNaHbVqFgtfPd17WHIJJTuVVn/7MORhSPGgdSx1rpZfbzGGcFZedtVcqExVs2m
 OG7WDBh9ywSq5DujRp/IoTuOb0v4YLLoQCDj2R1q2dP1cA74vfxns/HO9tB6Kfz3uZL49ZZ8OGx
 vBwDfitLOpmuYwtK4kfKT/ExHe+Ey2IU8Y6RPM1cy++AR+AQqdjjgu8DmOiREAK5ErTwJac97Vv
 k0SwLrlyBhQnYcHd4BA==
X-Proofpoint-ORIG-GUID: k3m_jGGzekw0yMsEM-Q3nI1crV4d2VyE
X-Proofpoint-GUID: k3m_jGGzekw0yMsEM-Q3nI1crV4d2VyE
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69e9d114 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Foio68cvfF0NLYD1gc0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_005813_962947_AE3BB9BB 
X-CRM114-Status: GOOD (  11.99  )
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


On Fri, 17 Apr 2026 13:59:52 -0400, Yury Norov wrote:
> The gpio drivers reproduce the following pattern:
> 
> 	bitmap_complement(tmp, data1, nbits);
> 	bitmap_and(dst, data2, tmp, nbits);
> 
> This can be done in a single pass:
> 
> [...]

Tweaked the grammar in commit messages and applied, thanks!

[1/2] gpio: pca953x: drop bitmap_complement() where feasible
      https://git.kernel.org/brgl/c/a56604e397575647bfc425a8df176948577a364e
[2/2] gpio: xilinx: drop bitmap_complement() where feasible
      https://git.kernel.org/brgl/c/2757a5b1bca76a1b6378496b669a2baf1faddec5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

