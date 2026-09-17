Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A4CC982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk36GFpcKUAtTar/b083caQqYINIKpMqKrsbZbYUlBk=; b=bzq5v3JgdYPwl9PJSrQfuBFuyP
	gXYIajhCo8Kqi6N+tDr9JymHsNdxbSK1ZZZKUZwEYXCtweOsQ2+gze27fhe4XQw4hECH3oSzPgNcz
	wEfF1HIHbHK4Gx58PWrht0feHYLPDbtslmMI8X+0PyGsO5t754NAJ8LIcD+IgSHjsmfSIoJ92kBaa
	he4ElvKYOwdZTauYxuXKvOolU9f/2gRNJJyypkaVqnZHbmyB3URh4jyH6mHCFLwORIa5dmweyqaM+
	NjPY+STXkIqCOACH8Kj3zcUUzRUlOjLbV2fiWwtuO0gDoIDnFhFD6MIbXltzrI6JIJ9M+V1tcbkyf
	XN7OFjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E38-0000000BgIr-3wvf;
	Thu, 17 Sep 2026 15:29:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E36-0000000BgIL-1eua
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:29:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDjd9V1307356
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hk36GFpcKUAtTar/b083caQq
	YINIKpMqKrsbZbYUlBk=; b=okrG+hUEVUELGSxU2Q7Gy0F0NIDgLQdkasDpPTPv
	/5PrsfZv/no8tWk5cA81d56Ckf4IbRnjg+JBwaoOh3O+F6y/mqo5KfTIy/kNx/WN
	nUPfkg/cYuaZCQdbwrEdX/6Rc9/stSWbyrGgRC1ISGIvVgYmNlMLdWLUrkSYDZ3j
	eucRk4qbpco0a4yP9IYtDVMfcV9RpS35k8kDsTsnjdcdUGQHp9LU0Zn0KQifjvbj
	gS1zx9+IKGpbZY4H07Q3qdKaO/nsYdQz7pOIw04TZSv/Y4MM1jBgrXet/aBs14wC
	rgKjZL7TLostWY87EuGbPRj8/AV/9oIlshc3blyAkcE9Vw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra9w2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:29:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so178199485a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658959; x=1790263759; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hk36GFpcKUAtTar/b083caQqYINIKpMqKrsbZbYUlBk=;
        b=kiM1SLCCdj00AiSRJEN83zCN32CoCjJCIFXYX8yDURQ3IOs5OnTzljFmw25A73g9kC
         JWgrGsuWQ1ld2uxz80F/UWyDoYMbuZHuj6v44d0eLzCmlgDG52tJgxFd9vSYquKQ5YOD
         9xryfDqcsb4pe/oRY31JZUHqshQc2yR9SsM8o75z1iIC9QtVXU6oSkvG6KeecpyR446u
         nEC06nSrqxtb70FYtBxx5n3fckCF7crUfMYqfV37jpac/+lzk8kuN1b5auFmnK+Ll+Fe
         8CWHODxboErCJg6WRyAbKQsozWwHslnupBMTmSzfbuWux3n39JnQhcNNLsohjUnwulQb
         RnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658959; x=1790263759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hk36GFpcKUAtTar/b083caQqYINIKpMqKrsbZbYUlBk=;
        b=mr6FGn2faoWvZbzPBUE/a49+OSSaB6l29zKhurUng1gpBz/1mgQIsP5gbeEwB5X+kv
         WdSi5Z+HvHgPBljJy5kCcygwpkPVIw9pLifX33lKd0tBhKfd7Kj2CZz44TwrvqpUNoOG
         YQsend7qa80Cq8fVHL3u4YO6IcEUMQ2ZLObSG36ZYsrlauYIbq85I+bWFXoh9TnSojdw
         8CxSe4dVQcy7W9VI0u1ULIQb98FSyuM7nbd7Rq50qRKzO59td7ifqL/818XFh2LlSpQi
         z3n9S2/vGtS+Gae00d++477ZtkJKbmfIpNsHMgbS/NeemDg32aq22aG99iiGvSdaYBx1
         Tf4A==
X-Forwarded-Encrypted: i=1; AKwUvByV/GWy/i93M4DV4kl6G4x+qZZl5poe3QlaZ/rg4OXtJ0uwfPk1nGegxZtfMXvlYhBBMjFZ1cPhfYc8mFraICPX@lists.infradead.org
X-Gm-Message-State: AFuF++mdJXuH7G5srhNJsHecFmpeMAREOUDRLIlJcHQxgjNxvJCCKvS+
	OAGnee1BT6TCaBIJQvSnBvTt9/77GBabaet4s7T3Feyc5ZMLxlVP/4Aq6xeIs+fxIfOv489NQ/6
	rtplxyoVLPek6TIl+bRE8NoAEhjjshrMrJhAdh7rrDggF3BmFWah0JPHPhZrd6jAjXf1Q4UBWUK
	Z+rw==
X-Gm-Gg: AYBFou1miDSwdAj1Td0m21Rt0T2rJNvyX+n6XSgcod1RvZlVeYRK1V+LAOt6kFDPk5z
	TMxtv7zeRlXXnmVb5ws+7ChBmxTVfNi4fkdnULUtKrqFcwgtocR7tvYU4N/nswz1ZqahTNSgp9w
	4I/f6Qc/cRq8Epi9tmL2R4Gxz6E9aMW7VNFURh7QIxAjDzZiWNkJfGezI7cI3jf/VKi9zSAyD81
	Vz29s2oEUJcTQ8xgaEe9RmBAZeV45rPpLG95YnigBDSEakDaBxQP2KuWVypblslwcyz5QglcFV9
	2Ldk1mQAB/Hx+YYHYIy5wJ+jW+W1HZ1Hwvu8/Q7pnCAshoW5OxQ+C2Cpz1gs3oOLzpdlVMiLWTk
	Ro9TztCdjbitKCg==
X-Received: by 2002:a05:620a:4592:b0:939:31b5:4e08 with SMTP id af79cd13be357-93bb7267e92mr1277598485a.0.1789658958624;
        Thu, 17 Sep 2026 08:29:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:939:31b5:4e08 with SMTP id af79cd13be357-93bb7267e92mr1277595185a.0.1789658958112;
        Thu, 17 Sep 2026 08:29:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbefe1791sm68837795e9.1.2026.09.17.08.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:29:17 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:29:14 +0300
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
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
Message-ID: <z4usj632ovj2cadfgp2zvwue6vuvqhifzgjb2uvfikitxksdvk@4k7xnyojsa7e>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfXz/mu/+gm+HZM
 Tm8Ki82HIxR3nwzuro5tqm+x8h+Luybs07pxVP1U+kOPe/bUeEgln7jrJeOGhBpN4HHeB0GNRgj
 kMcryn5LJqb74979jXBCgFAvi8v4Gfo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX+lMxnjgy9z4n
 j4sJjSQ42VCXnQG6AXfITgwnclNAgyw5hAVY7a3eIUbIH2hmn0db2Qz9M6x142MIdBlZ24CfOok
 ZOWtcRJSyUfC8s1DG5AVhYRQZmHsowXeQQoNleTESgztVZFfA7pAeELdqbm+JbBBEGh/PSRAEc5
 QqsEhJTOf/VVT25s4KMXTp/MbDKqQJx5fKPsFKhh22Dk9bOkDOZlbYzH3yp45ksg3ko6Br6wvnA
 gW8RhHPhFHEH2DOkXyPKvjuDw6cqXbKn4rxu/87QNfjCpj/9rmSlm3Vvv5aF+jmrYoLDJRiBpol
 Kam3ZUEbomgpGihcsLVEKDEqttAeecWshgqBSLw8IMXrizlz8L6nEkyXjIMu6/RBh4qfVkamCc/
 NBeItQY97wuWyjfcgGO7GnMh5DSPgirTgw1pj7rhW2MbBsX3SiuVPrtIAxCWMYeMX5n5OyKQpnh
 ZRT8L83Pvf531si8DDg==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aac074f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Bg5-dtA1UNqsNKQggRWXc7vd2yhu4upQ
X-Proofpoint-ORIG-GUID: Bg5-dtA1UNqsNKQggRWXc7vd2yhu4upQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_082920_436857_F01A3681 
X-CRM114-Status: GOOD (  12.00  )
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

On 26-09-17 17:11:03, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

