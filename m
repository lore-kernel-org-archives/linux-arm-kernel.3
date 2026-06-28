Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A6EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 18:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yFPVvQy+nbJ2ioSTODUoUgdioi73DC3iCTsISkzqNU=; b=n3Y8zpva4zakjT35OjVBoESFFs
	esLrI3cqtnzD9FwKO08Wy4Z9745e27h3Thw1Axt5Fd/iwz67b8Yi4gD93Z27rHacmPGRdK05N31tu
	qOAEY4gKXE/7PqNJslgc1WJ2O833eLhmOmK3NnjmkgbybTv8MIGQadgqopdeWYm2bx/kbJNxhhPjZ
	6QDvCMMVBdVnmwELlYq4WBSk4n7N0P0dhQ4I5Z2PE/cn1+onYZOun9zY2paiKH0CvTYYLM5B60mGz
	Qx1JuClvdHzonqV8Yxu0/Jp/SYhEyUMAmOkc75APR6q7P5lv+UOo3sMzQc0bnDcgvJGZrXNyypUaG
	F96UZJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduCE-0000000DHGw-322Q;
	Sun, 28 Jun 2026 18:25:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduCC-0000000DHFi-1lgU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 18:25:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHiqVP449003
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1yFPVvQy+nbJ2ioSTODUoUgdioi73DC3iCTsISkzqNU=; b=hWe7bG0Blx3TxZKG
	/3NGF7L60JZiZv7jEdJ4S58RdujNMuqzXO1DdXy/pWSeSzUweKBPn4ZUio5YnVS4
	c+gukrkN97b1o29twJ/aoJtuGuNqJpaItu3bW8H/ne72D2Fn8AGFFbTRwwVQOBEI
	flY2RxtqnY0iBxGkENK9F2qPN/9E+NZ48uVSV0FYR2Kt/TfriENoviYYZsmZUMaC
	R0LgTzqy4vuFf5DjQl6zodJXTj4+CcBMMZQRgQvYEDEZaYIMihVAhcT0rboBvBv/
	M/qIf3FxptGh4XX6A6otiuFuXjxclgugTP/FZtrxKJyHkazbtJ+5F6UBWVQ0jK/5
	tS0olg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tukchg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:25:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c011c7cb9so6033718eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 11:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671131; x=1783275931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yFPVvQy+nbJ2ioSTODUoUgdioi73DC3iCTsISkzqNU=;
        b=T7s9+QmYIxq3anWVubWKK2Bn1iyB0ctRzZQTnUNIX6ZFXD4VfXVjv+QROC9K9MP+u1
         0qv02RRp1aAAmzmDbb18lv6Z3w2fN4v60KxaaL2uSARxmbqN5fsZWYpqZHsP7TMioyZN
         2mlejG/kqHSQoBwT3BET97oWZW1e0ckRzbMLL8Iutf1AmvTYDv8FYUY/IMFVKHKG2uG2
         9gRSmL/4cVzU1ExHk1qpJZXm+ZzB2/S11hQTCkf+0WvqzssnecbUPBmYnjGdoPWua8Xb
         bxMnIRcWwm8hK7O2XetSKv/JCZeH6w+Pi7wMcX7Dc3s+v05lNj8J1Y8Y8/ECyDWlUL9D
         30BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671131; x=1783275931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1yFPVvQy+nbJ2ioSTODUoUgdioi73DC3iCTsISkzqNU=;
        b=gaOz0beY6V9IQj1p2vO9JuGdfoH2CQyyd4Azzu0WLCDmHqJKNAP3MHT7g6uKLNZp9R
         oqms+ffht5iVN+N9nWPdXaCMrHkhTQ/8p1kw8Aul8gC5sEr7WYKx0bEdHTmQFQ+Ns6JN
         2jL6YBQuAulza2yPVbiOcHsbHPOwYOHtVTk84Q3uBMvASt/90lq+imJG9IyKFnMfFgGg
         GsxZFZnn9VbB5h3+Ixe/9j0HeLvHsxWFDxn+T6MkLNoSlo5Dx/Mw8i3q66j5YZB8v2IO
         hSHAJBX4/hbCwBlcyxAK9G0wxH4fQQ0GICkOnMCL+dLdGZreXiWu7cvV2xBZzGxGc/DZ
         le/g==
X-Forwarded-Encrypted: i=1; AHgh+Rp0bWg+8OY131rO9qBWYacRUc6/Lb9b+hqJhy+cZ9aJvSI5SEoenaMcQkhc20A3jU3+UVhhBtAZWryWTLGa9f/z@lists.infradead.org
X-Gm-Message-State: AOJu0YzyhXwM22DrB9P9BfrzsIVQ5hDPKVGTeNwzBIjRk87dVW5tomAZ
	ly0cjUUUykaaBgQk0S4W9OIWde+2kZ9ln+1S2sCgS8w0NctN8JlE9qsGrDisljKbwgpmkseQyNY
	hQvlDEFqhTv0ran4+D4TI3W8ZOTjCC+iy0YT1lK+l6h2rI3UBHJhe0nszNfPhAGpnaqy5x3VRNz
	3dag==
X-Gm-Gg: AfdE7cnbodJyZMXueo0SIHWdW5OF3lGy21E0QIV+HghlepbYVa5dpRiEKYDTQzQDj5s
	8es/iraDu64NKHWVa2J2xjqXOVs90FWdAuWIE2PaKgPw47fxLlM6BcT6Iz8IUFl0zyuxdM8j7Nq
	FduPcB2JGNlJoY/Tw2gIuua33IWeIpQwl50h29cEDriyukPyWd6QHtC0gbHTDIawF2qWxXnXdg4
	llg2SVytvYyiN8NQsze5hAtufw0N55nuVH/ydOhNK81pyGgm2GRji/79zDQRZ6eZ0NVqU4CdzGD
	WAWusuEvq+fzWxGYskQgL0Ty0IjQ0y6TqnpUbUZ8WLZhn31X0LVHK/Wr93ygh9Zo78QPXNad9/i
	ckGkCvPEBr+JX+cq5IUx39nrYM7i/kj0Im00=
X-Received: by 2002:a05:7300:7308:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c84e2074cmr14238223eec.11.1782671131353;
        Sun, 28 Jun 2026 11:25:31 -0700 (PDT)
X-Received: by 2002:a05:7300:7308:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c84e2074cmr14238195eec.11.1782671130794;
        Sun, 28 Jun 2026 11:25:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:25:30 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:54:01 +0530
Subject: [PATCH v3 8/8] arm64: dts: qcom: shikra-iqs-evk: Enable A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-8-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=802;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tzXgoMGOkByneCJ+ZG1Kzo6D2yqiTmTiTrurOKuJQ0A=;
 b=vOMsC+RkFWKODgCcMX87UqVP576wC8O1KhQFPbBpZ2NKXQ8EKjv/Q1fMsAlmqzi1jvMj/Q46a
 9dFJbo/MADYBvWrmlNIu1gp4R7A4AWiByduT+jS6FwKt2dNf5omb2ZF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: ysbN9JnVUVFXC_pi4iAadNc6AYHjv9jl
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a41671c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=e7-BAW4puXiLW4xK5oIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ysbN9JnVUVFXC_pi4iAadNc6AYHjv9jl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfXwj2aFO8gnliI
 pel74aN69j6uOYBuKBFfNlm+XVdSyz6gpvCupJJCRNBSlgSg5usscsG/JPK4J5SE0oqcs42vuqY
 zyd/NInzkE+JgZBZDn0N+bCirpr7gU3Av4D/x7vZuUQbeamhAu/MueZUQcdzp2nutIUsoQt0IL4
 A4StGiPhuQ41LLfG+W/t/zQzOSffcnQ7gBaPLu1Rx/FpjdRa2F8L8pcCBftdRRQkI5UJegKAt36
 ksLnsekWvi6BQijrHwvakCgTuOJHIRaYckJl22vAZ05efZbJ0qYkT78cnQCtYcqkDq/5GSdYSsu
 DYz+5yqy0pz1aCUgOclfQuoXhcr6UgtiuCZMXDsgXFscGKpVjMhrHmD3HSxYgVjvsTkyT8EF9Qa
 A9uHcH8evlpyQmNqO5QL62Wbu8u/swTWZG5PHlUCGTAtkvQP9as2m7nXjgoaPZYSITZ/kD9BNjG
 ORSjzhA4yC9ja/Xo4YQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX56vI2IfxOsbZ
 HNnYP/PcA1B9/YfsB0mmt4TKzfqozamlOclyNC4whx2CilaSfxhRMQjtRJ04Jg76gTbgsRD9XPC
 ISP5STp4b5cwevhC9fOskRSLnrmvL+A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_112532_471166_A1E60DB7 
X-CRM114-Status: GOOD (  12.40  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra IQS EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..0918bcb4b1ea 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.51.0


