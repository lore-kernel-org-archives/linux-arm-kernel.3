Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6829DC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44rzlthw92Pyb3IiSzSQiDvHWraFwPuyNqv1IZJTnr0=; b=BpK4f2ZA9EGtLCgAf4nAft2NnV
	Ydv3M241zIVjWWXqIFLRpumDxMWcSiVJvwANZ5/ubLhUPTe0v+FlwjgXWUszTf+xzdAep58++Hl5R
	lfo5vwbwVG0LRQG/gOrTMutUg+EpYtU9Wr/wG6skJ6inEM+kO+odx98uR9eibhOpXV7zfFFPnDIw3
	vyS2JL2ejYjf9Ei5AcuRL7HWXUp87pTFGvUbc9dXyaygfHXlOnyOdHuhPrks0BUaaRgUQd5Zew/Dv
	IPfQ0jHPPmQAuL82rJVbJTxzt5j2VUAr5h8tkjK91tWgYTSV75W+dEbXPprHEMdruXc9je0sZOjnG
	X/wtSBUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKYm-00000002ilP-1Rig;
	Mon, 27 Jul 2026 12:35:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKYi-00000002ijH-3w6S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:35:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMOs73571613
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 12:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=44rzlthw92Pyb3IiSzSQiDvH
	WraFwPuyNqv1IZJTnr0=; b=OvlEfZJa2Gb68W5vnOidmz+1rY7r3EwR1TsK6esL
	APGXdea8+9tVyHs8yQGHF79EJ9vB1o7oM5tkOQbg2VmmnAl4g2L4Hogu+o1Jq0pQ
	Hl5xDaNCJtnQAqTl9BQpU1p+JlYoPGBbeNABgvpqZErCs29WsCvuUmeor/oc774y
	pQl8Kr02kzLsQKIdnv/2FpP9MtpyWiVwdzAE+LE9Xsy2J2FngW47uTv/junf8/M3
	KWWbLvr9ssvqfhwGLZK9wtPcEb279z0UiEgMeBg3sj48POOil+FL6h1l8RtmuE2i
	8ePEY9kzaAlWC3Aaj0oDbw8IpORtKdSOidkjSr+wAaktKw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g16up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 12:35:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso2015854a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785155751; x=1785760551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=44rzlthw92Pyb3IiSzSQiDvHWraFwPuyNqv1IZJTnr0=;
        b=fW+m7tCmF3oRdlDVqnbBBbyLF/FWLkaslVU0IQrvTk0d1SMfTwRDyJFHOu5YbYOIQe
         pFk5Zyz/y6PZVWiNLYAu1EZ6rdYtuCEDu1Sgy+FotDwGRHKbI4REL8QRqLoEP9ZZgRO/
         IPJe6JNX7oA7E4cHfh0p9bqEjzggGAB7RBzM9mnFJx+kZwAcMIZvw62y1GFE/sYzLQ0I
         C16pXQNI2KK6w0WbrPeXEz/bCe43d1LHsrvNIkkfd6TsFTCYpC6MSjgNpk/X3pPq4FsK
         pIYTnwslLK7DtWTgqdxZHa3hsrSeI7l9ZYdcWIVDILVNckBGuXed5I9+25Gum3bjhNQg
         cAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155751; x=1785760551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44rzlthw92Pyb3IiSzSQiDvHWraFwPuyNqv1IZJTnr0=;
        b=Jq3L7bKoAcxutBzDs/XXWf9gKl6UvSuN3q1j8fG30b+Qs+TB9nyzWreq4rwBFR5RQX
         2KznKhd38zG2HbslAW65Ng8iglhWVwEfRVVaa3n4WNEHEgjp9278aEvorPweyklHFlSP
         NoWb6tuEIPO2Dg8srsJX/y+OIsM1mW00STndxCxY7xFZUyxJf5XXEX6hoR0FxMGglLcx
         J6p7m7b5+R97YIT0WlFkyqd2X65i7cYQ7VeUtoy9d7bMybec07QAm+nh8vtUcd8onO3h
         FtdULbIbIXIAHDI/U9n+FlThY5HLethAT+Lw7agYW4lXn0tYMy/1MPkDSlD0JPD9k/UP
         60jg==
X-Forwarded-Encrypted: i=1; AHgh+Roff2MExRGrmLAegfhCt3BEKvKqeAu2zSLRwgpC4DcM/AugXBvNDlpn27j2biQ6nyGxkfX2ijNc1tt5exbZJdOm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzt+3r2vNKPadFHFMrRGE0SWKUzQd+W4YQz0XXDvSoviIvcwKD
	0GJzyI3KQ+VPDUvDo0aUnlFqWtrSq/pFasHL/hh2uo+4JDRvrOeLZ2lYX1KnzM2b73Yp5QXGY8B
	cuGYHnNTn6p4QIYvGCPCA/Fvqckf8BXZpcr8HaeDlwFzYwvztJaQwgPkppn6t7dlIMG9zht+EBu
	EfOw==
X-Gm-Gg: AR+sD11Um1DMA2CIoLHb7zKo3Hgu74Vg8ij6a+tPCzGMklbsybYNa1AXCNDD8OmF84W
	0RW//GSTK1GkVHDqEu8fwYkXfTve+0cNRUe2X28Cx3L6MmhvFw6U9mlgul52L0m+8FIpHEy/YWa
	LDe80hifVQDzdUW5SLN92t18edsAv4WH8PRLdqkw5uBBl19MJMj/bB1r38OEZujaMJMBU+Q9e6d
	boZT/foKY1EkdwKAm6QNDrhy7Rz3dJPhitgTn0a6+4RBMkHdh7D5U19cdSwvNYroIsRd64S3rCY
	M9zNejsQwa1H+bA/MnCDomQYdwxCqsQsElOb/aBBI1/HxfiryYLqsrnzwRSeFSKYkDTNpc73h6J
	O5H88K4XnB57IbFPIzTy4yOHBlyk=
X-Received: by 2002:a05:6a21:3990:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c67d9b4670mr7490830637.2.1785155750482;
        Mon, 27 Jul 2026 05:35:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c67d9b4670mr7490750637.2.1785155749813;
        Mon, 27 Jul 2026 05:35:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm29439425eec.28.2026.07.27.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:35:49 -0700 (PDT)
Date: Mon, 27 Jul 2026 18:05:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] soc: qcom: smem: Use 'unsigned int' instead of
 'unsigned'
Message-ID: <20260727123533.hz53oknuy3xwzw5z@hu-mojha-hyd.qualcomm.com>
References: <20260727-topic-smem_dramc-v5-0-66188b3e338d@oss.qualcomm.com>
 <20260727-topic-smem_dramc-v5-1-66188b3e338d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-topic-smem_dramc-v5-1-66188b3e338d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a6750a7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EZmpetop0t0RzpqVzL8A:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyMiBTYWx0ZWRfX5Paou8ErX5hv
 4zpNfVp6Gi1HQGo7lD7nkEIc8ga+3vHl2w5IIamExAHv+IUkbizBLXYI/jLxSfp7Repg8OXhF0y
 mxKL/koqQOrP6/BfASLHZEZt8Z1fQmU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyMiBTYWx0ZWRfX5WDetfp8WMwt
 7/wEL/acwYXRWNyeKhQDmvTHXSbpqq5ksc4X21rnM6LbcftlY2wkZmUWqciEwOTc+OZz0BeaOaN
 NIRZBiUmBbM8ZOGFPtAkXQwdG8dCrH+Y/Rz4yqFLYp/NMv64I3/WH7/LBxU2g8hq6t+dwCrbtlt
 Wg+3nXmIYRwnctqvcjMj+XIImD+/+v9CsGkbU5GCfdO10fYJRMZvjDZyrpi0D5xEWvr0FsgNvuG
 jM2s+SdT3u5BTGnOsMXUUpQ3UF1fR6aERpfQ4tagbc5bJAuT1anwJvdZK8QMmUNnVe3utzm01ue
 xeoNJgcXThe3UW6CpgM/4Ra+gc3iGkLuhqfeIc+Y8YHaVazqsHtvxYq+gRhMDnns59USRPoe8Ws
 068jSxsy9kgYzWNgRRzVSJUU08oQv9g6rkwnGhQsfkiaUGeL7cdFs0eJ7VHQPK0rxfKeSJgsSyr
 jI5hXygBW5xtTYnYlbQ==
X-Proofpoint-GUID: dg0JWdFUnXoIHfFHaebY7asXnrbkWD7M
X-Proofpoint-ORIG-GUID: dg0JWdFUnXoIHfFHaebY7asXnrbkWD7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_053553_091586_CCD0260E 
X-CRM114-Status: GOOD (  13.41  )
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

On Mon, Jul 27, 2026 at 11:59:27AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> checkpatch.pl reports:
> 
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> 
> Convert the SMEM driver to use the less ambiguous type instead.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

