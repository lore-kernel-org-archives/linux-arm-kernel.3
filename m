Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323BCC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 17:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6JYyDCnGQI1t7l13SJSEphsLkUJhxRy8R4wnW+KmNo=; b=pH4ga/y664svFqxk1Rhsse3FRv
	LvZOVN4BXXVMPaV4U4Tqj34w4hXyl/Y5YnWOY52jkfIxxxVeONkmEJZ3pWPgudpdPuXRii3jnq3ea
	dNTQn8C+i4GyeId5O6xXXXtr8RCnyx8o/3L7w/ci5a4/xYCdRqJ8TqBTVCmh4vQXyBLTw4zKMk3CD
	Ldf8Erq7QiUOcs0Ar6KrneS2c3/MSzD5TnKZFc7zvp7c5fgMyelLol3WUKtLl2l5T12hdTQRJsqLf
	VJYyxfoSgcAXnG+xEoHuOBU0ZRkTA5bfxjcdU9SUqLHS7zijpfQzAvWdb5QGJ+LnAiq24WpxH3eac
	YWtuZlew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEjO-00000003cJb-1dIt;
	Mon, 17 Mar 2025 17:58:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWV-00000003aTB-0OUM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Mar 2025 17:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=a6JYyDCnGQI1t7l13SJSEphsLkUJhxRy8R4wnW+KmNo=; b=YDJ5SVlzXwHl1ce8nKx/DYGLNo
	AYLZQfNba3tm+NfKEU+ZzYbXGgEtbd8eO8DzLKm7m2MpoYDxCge99R5uC4K7S3DFJDkI0lCRhVm/H
	4DF6fzU7cBnnoJtQD931Ed3Nz+8nXXNy2WK/4qXa1+owzpIyY5UXovk9UN+w4WeFVziRetz6u4ccf
	PgN0nmOYZ//9YD7FXu4aZJEDWITbdAfS6RhUUe33K7EiK2xGN+p+fgyJ5woJGv599iR/NkpBJxYFB
	wxixV7INic+//vlZoi7dKkPW2x6vDKlS2KWoRIPHX+xXXbM40H0DwWfqY57knCs4HzVIFF09OKbWu
	c5w/63iA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWS-00000003X1P-0Qk2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:45:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAniEw000505
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6JYyDCnGQI1t7l13SJSEphsLkUJhxRy8R4wnW+KmNo=; b=JWWirmMQI6Ri1QBh
	jLcs+d3S6OS9nWB1BoK8rqbgK0ZRW+LPNG4SDqcOS4aOFcNTAk1kv09BDaH7EclX
	24SnAkGMwqXhuWLnZd6mdQzfiCj02wnOrM/nksbr2cDm4ZpkyJpOqmd5UNx8Fi41
	yq3yFOeKettgJJrb/DVbHyVEfB/lakwYr6ATXBePYfsJM7NV1SaRMVeQGc27ctgu
	wb410LODnQjuNKMxLOlF6yVKZVClY866982Qi2+9/gB97tc9HqljMkqf2uR8hMDW
	TFotjCBHo5mkrOI1wVDkiRZilx1g2tuIfVXCoqViNQTarWl4Tz+QGYgphnK6qQtW
	Bx5JqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sxwg7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:45:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e917965e3eso72280176d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 10:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233506; x=1742838306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6JYyDCnGQI1t7l13SJSEphsLkUJhxRy8R4wnW+KmNo=;
        b=R9GmYDmaIvPbGirZeOgw66k3ZaWBouSz2J9FIUZWPkAl5DkJ/Xhbq4g2fxzCNmJbk8
         HXHlmD5v4AGbcRx9T8fKjenW7h6v25XnGyfvLutXcFrlTG3tQrl+/iE+JeKfNNgBERFC
         t5rJQR+KlXPjQK6qf0n0RzBWcd2aQarGTHx8LfGmvRQoiK00vdWyth55qMbZ6al4zQdv
         7AUV5tG4v6mvA3eqEcOIW4g+G997BXYx67jX17dXzGM7k8sfPtfnrNDb9LiVCbitg6xh
         44hQyYMMr36Qp5XZasSXfy6Xcd86CYTN8XxQUgEeLqpbl49YwhXekK98Iavr3HNRxWnX
         9eKw==
X-Forwarded-Encrypted: i=1; AJvYcCXm4cdkTYvKu/qugBn3c7RKCvNr/6fRLXkz2mztpNPoknztUqRszMG1EI1KajbG7mPaM5KcY1Z5MLRWzUO2SsXc@lists.infradead.org
X-Gm-Message-State: AOJu0YzjDsLe80Twil20LYF6fn0OjqdukuTGzXBzIjmWfRqVHgtn6vpD
	gRjgvHpWnaUvXIgx9djyQmXD4BhgUY7kSC3gsIIp63EY9I4rf1s5n/B36PN/HhYqG8fuY7yk/zS
	/JxxAmIcLUoO9tRBTaQqZL8xCn2vn145yPOpa+OGCuHGl9mjFOZiYzOrz4fPlVX3pdztBOSZs1Q
	==
X-Gm-Gg: ASbGncuN+H8cDToSf2CQxIz5O8BwpS/NC63HmAHa74b2jLkL7Djg6vvcfylFkh2Cx4e
	dKfySIORGyR/739n4RoPanoTkuF3pZTQtjR8f+BR5OT7XUVb/TiDx24FHnMEdYpW0+w011Scesv
	HWWvmy1vU9/kufWegBGOGeWuuSl3d8ygGpnftRVjgF9UMY8JJsOqHCv2emgtlBT175ds8zcFbuT
	HByX/hGnUDb6Ww0+mZcgrpSpQv7L6EKCd468QPy7wFav/3Kbmh5l3H3UjC3seUxSMDLqNbObdAj
	/EbL9p+pZxSZJtzlvUGwKxBFAYo2uOvXiPkAF93IHUTJ6bpeB/5q5f7qPgmClCXm8tegVTvWd+I
	9a4/u8ZAF4tlp11RDy/yHaRYU/d4i
X-Received: by 2002:a05:6214:2489:b0:6e8:c713:31fa with SMTP id 6a1803df08f44-6eaea9f428bmr220911096d6.9.1742233505899;
        Mon, 17 Mar 2025 10:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXtmxTfI8erWiUZ8NMB+CxvpTl746d9810IAZ+A7Bi9XLrZgZVZ5iDDqjYNP9tLWfpymWykw==
X-Received: by 2002:a05:6214:2489:b0:6e8:c713:31fa with SMTP id 6a1803df08f44-6eaea9f428bmr220910546d6.9.1742233505496;
        Mon, 17 Mar 2025 10:45:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:45:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:42 +0200
Subject: [PATCH 7/9] ARM: dts: qcom: apq8064: use new compatible for SFPB
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-7-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Lp9Zy3ZOg/Qu4LlOPJJAadQkAgPZsy1IGz1a5M9STgs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+HzPjnBcIKNO6yuZWjC9nNYOeDW+D9sPOJc
 W/omJSU92+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhwAKCRCLPIo+Aiko
 1b8KB/42seJcItiEdCaOgz7ToqlTAJ0yDZVlyQWcUNVxK1oD8+KLpW7DaNjz6PTa//2xgfFZbO+
 QSAucKCCdIFPl8+EfArI6rOzlDcM+kt6vgSI6sKWwKtzN4pbIR7bnzrkSEvz25Cvz2XgLQQu1D8
 QhDYcg40wCEzLl+ke19LLMisix38WG35QyJX3/7A2z31WEtg2YXwiTNrtMlfKjz85rt5REHHC8g
 q8Dis9CnRF/xs6v+YI5HAvQdz3ATRRDxNBnzLNTDF8+r/chNwhaKMvCMP4PVaXhCueIoKY80kiW
 91GuXoNHVIlLpd+SsBoH9ykmKI9c9Qta5/NbYKBLRyUFpf5g
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 5U-vcp2oQ7vPx6nt5pg3y5-5-TyxdaDu
X-Proofpoint-ORIG-GUID: 5U-vcp2oQ7vPx6nt5pg3y5-5-TyxdaDu
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d85fa2 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=vGl9qbW8TQSvOBFUlmcA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=732 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_174508_459231_A7711FB1 
X-CRM114-Status: GOOD (  14.97  )
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

Use new SoC-specific compatible for the SFPB device node in addition to
the "syscon" compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 3728875a5506397b36a4c0d6a5ad12c067bbdd8c..522387700fc8ce854c0995636998d2d4237e33df 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -1086,7 +1086,7 @@ opp-27000000 {
 		};
 
 		mmss_sfpb: syscon@5700000 {
-			compatible = "syscon";
+			compatible = "qcom,apq8064-mmss-sfpb", "syscon";
 			reg = <0x5700000 0x70>;
 		};
 

-- 
2.39.5


