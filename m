Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4CDC982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ln57oQHyBkL7V+ZLstDX/rR8u1lfqU3aYXYeyOqWe4E=; b=P5cYw1WVvb8ywPWVPqWgS+tsWa
	/YXTwbyLOapbEjadAWkKb0tezOhAeIAwPsFS4ZheRHn3pneaI2EoP86CZ5Lb+yvYEet5r5VTS4ksi
	oFGLpEdyWYNCLs9jiFNgt7N5mWY0+DgtRI+taNrRlfFcKS1xnZ9xbex/QT6gkGhzKhBdRQY+pa2h/
	gjpp7klG4FpTPV+fGbvo1n8rE8ywQGh3/aTjDyDjFWP0r0oQtbJZeOuUju2OJ/qfG6IjAKqTevh+o
	oCq/UOAz93TF4v+xD7bMzLjhzTgZwH7tKGTFQQpHyXJAxLlzjPdxiOoS9bF9oFluiEIIY1VgsO5H2
	8Y8P9MOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E0A-0000000BfhU-13IG;
	Thu, 17 Sep 2026 15:26:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E08-0000000BfhD-0ZiE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Sep 2026 15:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ln57oQHyBkL7V+ZLstDX/rR8u1lfqU3aYXYeyOqWe4E=; b=ialcH4YQvkV8aHQifIzeOC/OSz
	cLXoHkNc2dofw1bDu/nSOWP5qTRQVqZjnTrvwzrO/5kivDNZLjP3+5x+LDsuNwr96Ut5syh/vUUvQ
	6pJCGHP3rUiZZwqyewV0n63+apFZ+/rYbln0e7tqEhD7Lq7AnmkvGpG1X1YAAc4xOh4k82EkysxF5
	m468X5pmUHH+su3M5iLnvKst0UHT1VSYThAEZnXsKQhsnI2oFLZ32sOZKANiwP/0I7j3I7iK0I/3o
	LLokRpAK3MobHaxO/Lf6hNXz0pHTSPYYv3qO/GeEmgjLTn7+S0fE97ZJNdn109EHN3SPgRuJ960lX
	tCgsBMYQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7E04-00000008zTZ-1HNp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:26:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HFOiAA782667
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ln57oQHyBkL7V+ZLstDX/rR8
	u1lfqU3aYXYeyOqWe4E=; b=U/r+rU3nLB+dvF0TXAM7NKyQDeLKUjbIyQ8IyH8q
	zHYKb7kGN7xu4WIAEOq4K9kOAyIvvKrJ3us66pLC62z5kP/9cEDYX7xB1ohEIOA5
	CcJTkZL8NVU8CFt8i9qCv73hftU1mjLTZUcXG8tftC1nrPH8qsMPuMowLxI4OKd9
	Bo1VMNr4MCVaX3OCEqqHHZ9Ygln1anRO/2vULSoIgjpp/5mHU+H7D2RwLYK7FlhP
	4vGTGMXKRXE0/az1woszeD7DVx1bvtnoq5gLTuxthBZxOpU+oqwhTYgG13Urn0B3
	lbJS+5dTNrKq5DB5mVH2xqhGre5Go7S74NzJPqWtTyeXjw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttr08h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:26:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e7de22fddso18486556d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658766; x=1790263566; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ln57oQHyBkL7V+ZLstDX/rR8u1lfqU3aYXYeyOqWe4E=;
        b=bWubAUEGaSNiLuEZWnez8z36xV057sd5DXY82uilZfEZNZlP0j5/tOAQiCMSNWv/mx
         b7t4nJaPjfO8hd9ucLsufxEGLZDd34AeA3YnFIF+BFiR3yqlp81YaBY9998YpqguRVw7
         +CALgaCLxJIeJBKv59PEBeAFpqXdquhiIATICHkI5GFYQFXprVcYkf93HusB0UcgnkbG
         PsIuw6KLsPGJX8fESmceMIf3xbhKJoW/xmMz0j3x0fPLd98gpluMKvL1IHZnj0RyKFdl
         HLJUutx4cIz3IKCuTKykBy2/gVOPg2idRbHdJ4EApLKFndR7rOrJl/LmxYNilf73BOHY
         k6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658766; x=1790263566;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ln57oQHyBkL7V+ZLstDX/rR8u1lfqU3aYXYeyOqWe4E=;
        b=jKtP1JG6WL9xCaFN0gpY9gbVRzpdSjH//E++wuQi9rnWS2XUApmaAFDrWOiAMD0pL/
         X7Cg4A8eVX10WaVB/Zj3lrMl2i/0J0WpYFjdLJZl9NPmWWzQTb7Z/p7z/ApwoE6ucjH7
         E0TqdqofheYwVfe7bxJ1ZSrbOtlvc3wk1bV+FwR4UR82HlNtjPmxBBiN+3V/igU2HC3/
         UpzBGK9G+T4YqnLbW5WJ00iCFVvh08Al5JJR/hhB2MLSi1Qe7hFWa4kxRPPaWylpmtex
         sjOXhgP6KWI+t5GhGGOExUT8SQ5QICxjXW9/7PPEe7tMVbtoGZZ8Iw4xlWO90i+QNcEe
         O83A==
X-Forwarded-Encrypted: i=1; AKwUvBwLAMBAnUb4EgJvE+He6qz8aIvvgdnZRSWXGwyp5Kj5AXIlSAbKhHe/ykgmE1FPu4SXLFszgFPMskcxJ0Wsxvzf@lists.infradead.org
X-Gm-Message-State: AFuF++nSrmG1kMqSCn/vhGwCyLZQdDoxDc12usC0cWMg9V8j3wrXuEs4
	myrgiJ+BJA/thjrcpT6Pf5iOjv7Lbb7PZcr9nFQa/EHOXaV7N//957YsivoPJNZYD6ZdfCyifP3
	IhumbsocIhl0JLvcmcrHF2hMCxlE9Ffz3GEYFrQMCzGWxK4TnkXrRD3NnXqwos9F6/cJFNUjLaa
	2/lg==
X-Gm-Gg: AYBFou2ogD2w5j/c/g9QKgAmJN9hYIXI7CYgxnwfG/iotBNyosQvwhFbeJAdaY3F/MO
	+l/uw4s0FaZDz3+z/UNZsnqKyneYbt5jYKBJ2CxP7Yn0dLvVex9JbVAyc/0qqnpc8vFpO9Isu/e
	I/4RRosvQSS33MnPSIMhR0Rth5is6+9V1Go8Rm75lHcg8YYx0bB5YzD78VQrVw4NilZLXFuXb+T
	zZBayw3riSPzUmPk5TPFKoJ/hfyRxrU76OpOiN+CvouQoBEUW3wgILHF7GeXzHxIkizaDdlwwgj
	m1kXk9J3oF/tUse0/gLKBcXiJmFln1l9UeM1da8m76xSOvObRyQTUaz3MeJSNevzoav0gQ8b/F5
	5aPgi9I1aGV7RI1E=
X-Received: by 2002:a05:6214:5b86:b0:912:264a:874b with SMTP id 6a1803df08f44-9123d70d4a8mr129825876d6.8.1789658766435;
        Thu, 17 Sep 2026 08:26:06 -0700 (PDT)
X-Received: by 2002:a05:6214:5b86:b0:912:264a:874b with SMTP id 6a1803df08f44-9123d70d4a8mr129825146d6.8.1789658765936;
        Thu, 17 Sep 2026 08:26:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232d5bsm82102005e9.12.2026.09.17.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:26:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:26:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/5] arm64: dts: qcom: shikra: Add CAMSS node for
 Shikra
Message-ID: <2zraylrv7h25qgkxbqpq7rg7nodw7hsajshsdxxf5gsgtrigxy@3keepqqao3eb>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX+KUzRcd4HAj2
 cC8r4MqdI/3DVcrWJr4+4dPA5HVIwZoR2MIBPhXnWYqczTzYP+SRX5fzUZogljczV2Kpfn7y5cc
 OFlGM9DQKha86NAVK/hICvhJQ0/He7pfR23kcYKWrnkWJ/dpxUJOkm8w0VXZRfspiv1C6UJrkW3
 TbtKh3ek9OcQzTLTXPzZwDcYiyqWt+DP4fFfZnNyllHeBll3FXXsVc7h+Zm4XJb4bYoJR/lA5Sl
 MTXmkSarUL6x8Z+2cuybLYI5ICLAzMH6o8kF7SaUoC8li/Fl0xJMjWg8vMed0LLUoBRMvFM85qY
 tsNEJe2J4AQO2sdwuVLvMPB7yXkC+Sn8EC3IFIgfBVrgmRCycbYPWsw+89SFrEF6pBPG35nDYHU
 Eo58xWHHJdsZ46CdpXRNwP8Z/vxo4Uk6PWthQdkqbVHA6qPlrAKrJrj1W8GBv/+A6LTVaVmSMUz
 q0HN7y1Ed/7XioaLBUQ==
X-Proofpoint-ORIG-GUID: TRh5u8tABXPykIJfgOHz-3SD4U5ZsoJc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX4mKdL77dMfDL
 YaT63j/2d4eci201yGLp7sjwCnOPM+Zmme2C2x600ovL2tVKn5hXOYv9ccl2+/bRW2/eZ6ttBQO
 S62QMXB0rCPeO6kKcuRUq0Y3mdxfQ+M=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aac068f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TRh5u8tABXPykIJfgOHz-3SD4U5ZsoJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_162613_523638_09121687 
X-CRM114-Status: GOOD (  11.19  )
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

On 26-09-17 17:11:00, Nihal Kumar Gupta wrote:
> Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
> with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
> and OPE blocks, so only a single IOMMU context bank is needed.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

