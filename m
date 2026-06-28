Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBE3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 18:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/Adwkoxov+upvWUoqX+Dqc020CT53dbeXdpXRu0FmQ=; b=v2zqr4NxxE1kZixuU3RyWz/iyp
	bJzvOMgxEmIpHKBAsEZ932LY7hBlmwlvaZGK/ddMQcHTazKUnChWaGiQRNKz8j5uEF3yYj4Hk5hbI
	mmg/0JAtUvc034LP14+aNO60Lci1NHl23+RlRPvfeba3c0Cgb2Hchk8y6eBDw9nmHvC2skztjU7B+
	dE9TAYwqsFctL+d37WWTRqLbT+wH4P1x2gvKCfmEvuzcFr6rqwDC6ZCIMM+A47pc2f9RL/qejtfmA
	TfpB9ww/SgcChOfLVIm2L3FnV424nzk5ErGr64P2ksCAHZLRnmJ9sbXnUT/8VUXsa+FNKqDkYOIMv
	ltoVgsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduC7-0000000DHCZ-2865;
	Sun, 28 Jun 2026 18:25:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduC5-0000000DHAD-0IPO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 18:25:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHiqfD425323
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/Adwkoxov+upvWUoqX+Dqc020CT53dbeXdpXRu0FmQ=; b=Orqf+F0pLb/58jZI
	FhZ8Ls+LPFICJ+Jq1rTtdumHPi52Mvy70o2Yugkd0K6l1w8x+aW69fkBewkOuFVf
	tMgiGcjUqbj9ho/thCLppGa+4rStJetrNuoYz/Enkx8/VUv0yW3GRYti3Yn/UaF5
	i5Cm6xAvzQjoNl6Y177spR5jSt8J+D1wfTjYP8poRNGLyhfEY7/2DfNBfn9/EEXK
	56daBXJURjprC3Mv4Nehe/YB0ZzxGIGH9cecGNdMnix3An1TiL42O15OmyA7fVGW
	2QyNNahUgG2+CO8rjmJ0aFtS6yFv3xKzgJGNIQdLz1LOdvNm4oPMzZaAxFXcENXO
	ugjaJQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27333eaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:25:23 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139ca26403fso289102c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671123; x=1783275923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/Adwkoxov+upvWUoqX+Dqc020CT53dbeXdpXRu0FmQ=;
        b=TUDSd8dpLprSHvjCitLRvtdqLj3eXSQ1B+RI1dda8xFTJ88KbFR8xv8UjcHMHmwBgr
         jbMUnqNKZibUp440xbOHGdwjxi6krkOiWSRupi0aMj5jgcUj0IARnxyBwJkGFh7pFEyo
         p3fh4wFFftH0dCGsat3Wzb1Cyws+oGLNWkMc7zijMoA7YK65oz812SW/Iwex3r2SdloA
         wsJco4/Mm1XwrDRxttTGyi6p17QWUXSBVrlKmYX2cRXisKVzKiFhToxxLKrZKTDDOsOr
         s9W2OIQ1QwfO4cxaX5TBpjLOyZyDKd3+iDKQ9hKt1+rZa6NTjd09CYfiltJBghdcvubU
         Vzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671123; x=1783275923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E/Adwkoxov+upvWUoqX+Dqc020CT53dbeXdpXRu0FmQ=;
        b=HEPELU6nd6YA6GunKX8awR1VGKVHF5/bujZutAsIJTb5ZP6LtgGO3LZQOy8Vepok21
         V2zRGRkMssbfHNv70AkQHjSawQaS2j70Oj78AOxPwrbwIkiB4CAjgxIzb5P4W7JcYxPd
         qDkFYR1hIx2R3xhktnofkOgp+6mUNrRZDCVlS7VB+e0nDSMkTI/U1Nhi0ErFx2WbVtAJ
         HDLe4JlG8fpbcny4g0q0lKZNLSa/EIcbGDpgyoIIjUZP34m8WNUC+ZBdJ+/ykjV7/tUQ
         jCX4dTXWTL/+f7CWkNF7FWy0D4B9zn3rUJdEXYCpRcgx4pt3sDWbjLWJ1yUawJ6aTEVF
         16Cg==
X-Forwarded-Encrypted: i=1; AHgh+RoGpWX5+lG8gM8GY1Es/Y5eFkAu8FttvuAbw93y/OoRCHX6tABfYMzJiQF43KzQ8/mwbJph4UKI4fgFftfR7wO+@lists.infradead.org
X-Gm-Message-State: AOJu0YyWRIEpVguXtF5veaLbhBIQSrLMKMfmhn8IcypyQnwxWWghUAT/
	5IuTTaBW+OHUwhFbMEvbsWsJe5/NV1JRhaSt6qo+3jp+k0K3tWCyyNpsSz35SH6Do6bj0eMrL3W
	CunAHBaxOTX3TcNWbJX0xVyg7oFrI+lABkddRUoTgOgCXJc5egWGtBMKO+JJHsmpSCc0hUYjSfS
	SxgQ==
X-Gm-Gg: AfdE7cnCPvdHLxPTshlDSeRZQzjENgoeywMOhgG+HtvXMIm+A726DRkIFK/xu4mAdGn
	f+pshzSeRN3Y6kg+9kbZ45wDvgwj4v88ImFIjsnZ8A7ouAybDBEI07RqOg9ebaDBQSqBUbcmsOJ
	KjIoM/V119gLigXcWlfMz4q1n5D2sW74UBIVvR4vVGlVUU2bDgq6DZQqgMFT3rRIFasDExB1xlr
	xr/kQ7vthmPZAkSMigiAsQ9PeKgKldQUv4GOxZTeQI4UFTrnzvQyGJltx9/nkzxo0SWd2IJoOrG
	kJtQxlA5cwxNDxNDgA0j4xc3U18CrlmablNV1oDCOlzMkYPSd2aip6G3iG6JM7T+fYLajYzoIyr
	VBSVRS31iPLi4qgVVnoGqVhHu+Rw8y8QnUqs=
X-Received: by 2002:a05:7300:6d23:b0:30e:c38f:eaa8 with SMTP id 5a478bee46e88-30ec38ffbc9mr2680837eec.4.1782671122848;
        Sun, 28 Jun 2026 11:25:22 -0700 (PDT)
X-Received: by 2002:a05:7300:6d23:b0:30e:c38f:eaa8 with SMTP id 5a478bee46e88-30ec38ffbc9mr2680808eec.4.1782671122355;
        Sun, 28 Jun 2026 11:25:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:25:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:54:00 +0530
Subject: [PATCH v3 7/8] arm64: dts: qcom: shikra-cqs-evk: Enable A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-7-9b28a3b167e1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=803;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tpJR8ANAaLpNkDfQVcPg2PDtoJzHDFbD5ZJyKcQDLI8=;
 b=UrwtznvEchsCPw2f5j1Z1h0DtgwgaYYoTKCdTBRg8y+Ki3D0VxImpc45UOndP3zz37q3BG6yE
 WXiLutKmQAqAzUYa1pzJN0Hib1HgeJhRpwgbC9jZgny/fpmO9bmcx20
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a416713 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: yANEVMNZtpXlha4fd2834DBcSDWFtFzu
X-Proofpoint-ORIG-GUID: yANEVMNZtpXlha4fd2834DBcSDWFtFzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX9KFiVCZJJa7D
 46Z6g/c+JahUX6PAigngyibaRVrSHx6dNq/psZN4yDKxWzBHL9Fjte3ihmXSg3YWJENKtXdeJmo
 p/eWGwfMyTdevTEmh63HakejtusRXZaLzbi4WKh1fbhpmB8GHGgyUIaNAobDbfYSgmLT9kVcaip
 0gHF0RnImoE7ZLzgPyTxQoXk7I198AvqrtVQVUTsb82m9pkmSaCVoJEwvvWQbVZe+Z29E1sfz5s
 NwRJyh8H0lWf99zvSWKTmnflNekyBl0g9y+qUlkA3JXH0FAKHC9X0DK5DAWcmfWL442v6xJW+wu
 SGwGqt9LtMNp9a14tH4WQr7m0injyX2F0wkocvWZNm7sknV43qTTECo7xRtqhqaBM26Lc4L55n/
 5qV6jIWu0Eoo9pFi8d0H1bNLVyOJ4TyIfCqB6WMXhASdF59GKa5/XoB0nPp8It65LBQYjmrImG9
 41NccGUe1hNtextCihw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX0vTiwRkQRYAV
 puhxQOgSvq5QpcwM/qYhkTqPujTKBEWCsHbtJKLSsqOw1i/lvo18sWbtDneC37DEzDRbdfxzOLH
 59uSYVPdNOTNlZB6y3Db5zvgD9K4Wzw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_112525_287278_9B14DCF1 
X-CRM114-Status: GOOD (  12.48  )
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
Shikra CQS EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..94ef498a2467 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
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
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;

-- 
2.51.0


