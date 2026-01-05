Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1A8C79F9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+99F91Qj0TX3qTYWzoTO67a6JxAHBWElgL+XwJORR4=; b=e3h5FjwiCwspPdI5QzfFcTYl/5
	uteTyZ3HGyHqXbOuPqG3a3PA5g/UTQCo44CoBwENKpHhqZ08y3ZJ1CeC25i1mkRH6lGfZ56CnVG7u
	St6IZGga2WcO/rkpbc9SsBKqsxFHN/K0OtmqpLohgmaPwUyTuJ6AzSuY9ipaQ7AVUexcG1coRh479
	Z2pxTg6FUvYPADf+1B9Me6tblBCZuF06fcO3ujA645JZkqmyQpXQNAmPFOychn1UaBNmc8RJR7ObL
	K9kTNTdNVWcMee2T4R1scsvuGPmbYLp3tIAfVFDv+vwgHuVC4Jd/2AuCksVWmIkJuqw9ZhlwfGY9m
	UYqu8o4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclam-0000000BXCl-1fVu;
	Mon, 05 Jan 2026 14:29:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclak-0000000BXBt-1Xha
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:29:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058w85E593923
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 14:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B+99F91Qj0T
	X3qTYWzoTO67a6JxAHBWElgL+XwJORR4=; b=m8yY+WpycxOtEjAzLXeUicoLl+5
	sc2sKlS3xbw7WQvi3RM4b5pw5+cXtq6GqVLAZ/qI9ua38zFcjMt7778pQUiTUu6A
	rn7vd2/KwCFxk2pqQth8C081jbdRd/u8N8Koopr25HTWbliddxHPiVCX1AqDH9aw
	dSuE/1sImszUAXSmsZ8PuBcwcYl6CZVcgL9RFp29xQoA+1r5vL0mJOrMD+t8CCc6
	7jHTKreGIYW4+xn8LU02HDdby41E4UOEy1y3REvVxfROLNyfSz9nZRmPsFIChhYI
	VqFtNw0Nm/bemDIgYOjpS7+kic8HGce8GxDCq+sCzEZl3cpnSjq50cwskQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pgu7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 14:29:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ceab125so391558351cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 06:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623393; x=1768228193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+99F91Qj0TX3qTYWzoTO67a6JxAHBWElgL+XwJORR4=;
        b=IYCvTYiVxSJSnSU2tvx1ueTKllB/wqnB2PLle9iFLuu3zgMOa/lniUwAorKXry6YYs
         3VfnMZ0smAr2DOlqrwu7rsnO8dy9xYnG++Jp8s4CQb1XfmnFaYHyYx5ECnQ93IKuB59c
         AC4CHTdKo5uyLXvdV9hkEszMP72naheSBMZCbgCldyswUu4QHFYUhZDtjamT6KzVKDjx
         KryhZDHSHCOmpodeB3C+2gQlk4LAiKjo7cJgqd8R2skGEIQMbG1U4ifDcAArhaK/ODcR
         fLUn6GOKyyMGIp6ExmU2is1vqFjTRxWSMiMC/VxCAz2xLGNx3n1+hMlkTIrB2HsjQcDi
         HVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623393; x=1768228193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B+99F91Qj0TX3qTYWzoTO67a6JxAHBWElgL+XwJORR4=;
        b=Q3fEv2KkFNXFePgDPlclFLUOsTtr5AU09dixMgd+IvHG5wBJ3C4QcNGj/2N7RAB87W
         zvwT+uSLAxSJow0BfemUNh0UyRk+wOeNbFV6Ipy57riPanockb6QvfF0IL8cAYUNhW6I
         gX974KPhu7wZSaJNinmoTtKncUSf+/CmPehNGnqtu0W2gdULVRiEoJkTvtZddlgXknhG
         syFaSAqW5x9AqjosO1cX14TTpfEGdc6GkyHdhG+qU6aP+oxwrqYhb642iT9smhkvJles
         5KpSH7kV9yNmyPp6HrQMF8/bxOjm0/dKLRqPpdmUwmEKsvMaULNNlOfaCkMyB4rtbDLI
         Mm1A==
X-Forwarded-Encrypted: i=1; AJvYcCVOjDFJAMYFTpaI1n5TO3BBM/ZOfB20QNV89Rr2Ysutsjqxt6vbEbTPPP6NNcHiE+321hn1gB6EcuJx8en2eMjI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0g1B5hAPUJNFUo53nqX1QTqSjICxiQDwbEtQNH8rLghvXX5mn
	Y2BVoWRc5SLhmO2IL5NBHO+/DzjIA25D1C1NPGy0qfNuUsEoUUjAoU+gZemaJD25jsgD//dyz1K
	jtuaQf8yJKNsoDc1kutYWPWvxfGsoFHdefHr+JuqADyJqVCfccnJ1H/Sa1PPSYIDbb4gk29n/qN
	eizQ==
X-Gm-Gg: AY/fxX61IQEmd6uvKfaGZIToR17Vd9Nfcxh4+yaq6k1m3s6AOovY+P48WKWLxbtjNN8
	ohNEqbJuxRrCjF4Bedn+0pXUozohza7mc75U8FNLByLN9VfO+2YAAxg26JOLxeodPEClVz8btnx
	W0AsA/0pbp3s0oSFKnHW0x4CcSS0Bc5sLehy2lUmZIIoB/lpNaf0p258q6GfoPvriKJ2Fc68XKG
	6LoxM+5lYc6l9gy8YozCo9jBCs48XYRGjK4jAjAVM7UIWoyaAQ4mpxx3JK+4T4cfal1P8NPgUOb
	eV7Qe3Xj4q+E/lMtfZTP74DWAja4ZWw12RaejSjVKw9o24K04wUEWC+jZlRzCheXmG97zM/XP5h
	z8XkrqJuLK3WoxyIqZQBGAYw1jQ==
X-Received: by 2002:a05:622a:244a:b0:4f1:dfc8:50b with SMTP id d75a77b69052e-4f4abdb50afmr667718921cf.76.1767623393004;
        Mon, 05 Jan 2026 06:29:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEORDjsF0OtFq4UzheK0/5nT/1wsbM+CjFxawrMfjytQ6gQ76FQSUL3wyIGAbS4VwKg1VqJjg==
X-Received: by 2002:a05:622a:244a:b0:4f1:dfc8:50b with SMTP id d75a77b69052e-4f4abdb50afmr667718361cf.76.1767623392402;
        Mon, 05 Jan 2026 06:29:52 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842673b560sm2074066b.33.2026.01.05.06.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:29:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/3] ata: ahci-imx: Fix Wvoid-pointer-to-enum-cast warning
Date: Mon,  5 Jan 2026 15:29:46 +0100
Message-ID: <20260105142944.372959-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105142944.372959-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105142944.372959-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=igGwUDv1bS4lVKcInMKEA1lV50w6SfWm+opQfVdJj6Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8rZVXDPJgsYrTfHciVsBIMXX2UdTXHPtsLNN
 MmkwkCUArqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvK2QAKCRDBN2bmhouD
 1wD8D/9NmxkL4Xop/DcQWS+5stEAs8WFB656Cro4p04q4X8LYO9O8nlEWN3Q9Snf8b58CCb2yUG
 Iz+rH3+cAduDNZM41e/E2POIy+JRQcX2O53Sdj8iKEUkoH7t1ARwpA07J/nn2bmJI/01BifNJ4j
 inwbtVzap2lLz0NQ5uf6QNOKbqv3m+bQZzG/TX0VVU8SSydwn2740zNfIBjPS05mVQ1v6x6l5wy
 4xhjqGC06/S+JAmKyEjNenqOqqrSVwhEkhhJ7XgAQkEkvdE7C/o73ebFMDYkGbzMM7olZCeMuKA
 klVgoTgOzWOFlPkKvNoaBWIGVcTGBq1ThK2yd0mABs5nu8z0JQ7hj6b5BJRelq+c4+mT1Mu7Yjn
 zkhsVpxh0fBvtUdbBmmV+xbtflXn++B2GOJXov4fWxloYIwLWVOCOwaekrOLPBrwf50F3092L7J
 iD9Am90/5NbN7/ls2wUj6SbxLpXqoJkNcSO77bET2gH/fI6MevyoFZQmz/NrpdwFYjGy/mEqqGD
 /qkpdr1pkAG9G38copu1IIcX5cnPLpyxB14sI4XMNWica01BRrw02W4slTu5deabnZwej9Yoiti
 Iz7x1QZyJTlJRvSrk3jXdwAzI6MqG8f/voVfvLDLLzsUPwNB6gMhoLp2Uucz1uyMVu88bR4178G mDohUcKyY0GpBBw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyNiBTYWx0ZWRfXxleD+979g/6D
 v0f50uqUQlsFoJPPSzKO9OpS/YGb0O56YLw/Kh/pMtD1bSYa1//C0xe47ULNDR0sEH5k77Y0ba1
 vhgSjGLVELzchpjFiJXpRHMkaG4Z5cPyYYmSFK1xqAZhJ9VSnUrFXAGmnoNqL0NBRH6ezX9LOCs
 HASeMb/t1IqWMcgMawfoy1WUlq7sAXEYJj3EngEYjJ1gwsXs76zivjV7mBtvyKQGUn/iyQnb5nl
 TH1zGjUEjcl01Y0im5hROgyZ38VXwr9pg5AY298ORQaVpA98MRL+cJ0YnTHBKAChJSmotlO+F/5
 Dwd+Q4mNWWS7VNtow0rPMl/mArTZsTk3HnARqdTWu8u5Tiq2xjIYhgL+l1Z8TGiBGO0Jl+AMHOE
 3j6T5NlIeanFxHb+mJbr+M4d5GljO1J4cPzqz/hxPuKvmvpbvPaiB7N1A/0hgfnf1GeBVtFn2sf
 EyDj+BW4mHfxILE7Y5Q==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695bcae2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7zQf0MV6msiRB6oW4MAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: G6vvZXWUgnbqM4R8Nf6nVgCWqD1Q7Nqe
X-Proofpoint-GUID: G6vvZXWUgnbqM4R8Nf6nVgCWqD1Q7Nqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_062954_406584_E1CB3071 
X-CRM114-Status: GOOD (  15.06  )
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

"imxpriv->type" is an enum, thus cast of pointer on 64-bit compile test
with clang W=1 causes:

  ahci_imx.c:872:18: error: cast to smaller integer type 'enum ahci_imx_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 drivers/ata/ahci_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index 86aedd5923ac..3d26595524d3 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -869,7 +869,7 @@ static int imx_ahci_probe(struct platform_device *pdev)
 	imxpriv->ahci_pdev = pdev;
 	imxpriv->no_device = false;
 	imxpriv->first_time = true;
-	imxpriv->type = (enum ahci_imx_type)device_get_match_data(dev);
+	imxpriv->type = (unsigned long)device_get_match_data(dev);
 
 	imxpriv->sata_clk = devm_clk_get(dev, "sata");
 	if (IS_ERR(imxpriv->sata_clk)) {
-- 
2.51.0


