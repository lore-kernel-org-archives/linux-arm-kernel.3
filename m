Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85307D78783
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xV7Sj1lP+ipO/vMdQQDAnXh1FyZ9JEzti6vulzMdahc=; b=lY9vmy4Rw+nuvHy7xdSxHwJJeq
	OJLIluV0ia8Ezm/2TDXeJSHUiRTW7VHUHdXdI2VILt/4gfBpILzzmxGrULYQDzh2a5VmAD100qNO5
	6nVJSZvLesEMfyWT6wkTS2qIa9sVllg2iulYSZRUaOzk0i/YbZhFscttAM0QZc84mmTkfP7toETBL
	FQAQAN9d7vwn5Tgm53CJxx97Y6E+QtG6rO2U98KWvduOtGJhnlJ0egcrAk+iP2H1YA4VpjfY+VS3L
	yn3tyiRsCW+fu6aye01XbAkeCXlTsXLkvQStzTddASiNCtcYcsXXFiNmk8mGVh/qsCsaNbmkrGTcH
	BSbPm5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbaQ-0000000APtk-3JWa;
	Fri, 19 Dec 2025 14:36:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbaI-0000000APnI-2hJk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:36:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBla013700746
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xV7Sj1lP+ipO/vMdQQDAnXh1FyZ9JEzti6vulzMdahc=; b=aAO6xiK7B2Ahpu0Q
	tStX64yB/Oyj6iYNxsdek7WORUjXVMmB1EL6+Wo81vsth5sEsUNHmvEBxPaakkiT
	3WXMe9musPUKGR66HMiUIVPfcEIYimPkz8v+nn5K5fZ/ot581KTdLa2XOFf9SC3G
	yKvrcxcYJxj5Zm2LKOXeDZS61VYFmeBQk4w+V48PN/LZSjl4Hvuyy9Rak2s+wL9V
	GRCZXgEVJ5hMXictveqt3ggt1808OhVYh55oeeXcA4/BqHqX8Qj8pBVlO07OmyJI
	tUd5Qv3CNWYPQZF0FaRzPBUdlbC7lgYYqyx6sA3bQ0YIuCRo22y6rQg+MYvAEJOf
	t2aX0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ejw0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:35:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0193a239so18270891cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766154957; x=1766759757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xV7Sj1lP+ipO/vMdQQDAnXh1FyZ9JEzti6vulzMdahc=;
        b=O9nzCb6aRP6LXv3DeCPW2Kh4r9QS3JzaDlqMMx4D9UGngp4hWLOJY19lASZ2wVASCJ
         Ul2Fn9lsKE7F7HZ+npL+OtcUggJjPPQ9xU6a98Dz8Wyh6VtgrenCM4xNLvQAj+BVMIvM
         YILNvBKUxEG0VyPAt9Tm+2q8WlXTpoRXjzGdO8XwTjr1cRJe9H6Vx7wdfX94MHTxITmH
         IsfIMV0IEu6wFffdC1mJi8zA9007Upx8iSXP7zIKR9e0SJ2emf80kZJVd2RjWnCacWjZ
         GcztAVbpjGsqx9yJVgjfJcD4Xb2RIEZR/t8o1HmPiYFxQDOBToSqw3sj88io/ECbdql1
         dbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154957; x=1766759757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xV7Sj1lP+ipO/vMdQQDAnXh1FyZ9JEzti6vulzMdahc=;
        b=cZpnrOuRGRxtrAjAeT6XURS9npKNmIYSQOkcdKH+ErjfRMo0Ux8t1j8ZWoFbtP4C64
         DAvLI6J/Xh4acVbBTE6FzXLNH+6vAuS3LrAuFeRRrYeGfl6iXCoLSIplStNj8q+yVzUb
         BC9/hz/261D9r1vx06bzjUblG8wqimTuZVuPDcyujSFBAXu5FS5Ael1MxFhJe+2Zg24r
         pa7sNItKyV1S1/SI1TYe+Mj5OykhCcNfZCGELgD21qWf40s6qDdmLGLylxQGsFoiMcRD
         vMT88bF9FrPPncDjxBvjgc+SYBP+jOSagLsfWPxTvJE2ukv5bB+XS9+8giar7UtS+C/x
         1SEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhE2y6ifGimf1ZBTFc51HDDI6rTH/S2HTFoVm3EDXO7TSo9KUzERAQJfR0iaDV1b+t6vBUfP1z/KTzAFtyqHRU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywagh6lBJIW/ixoG3vhwCsX8rHLtOqEr0DklIST3Upcpw8I2HAE
	UMopQ2gxglXT+YKnKh2trhTItmKAy0MgTq2CfmnJw+bnFwyJwCnzyqqsHlIdZIFE0RpWysq79XF
	gMWkdFcMLsNJr0yKiyYzrgXrG8GxpA3GdN5wTljqv4o3Qwqtq0kWmLd521aEBUARY+QaLlBEwVz
	XJ/g==
X-Gm-Gg: AY/fxX6vEgOf5Jpf8ZqfM/g7RJu53yTxa2Day3C09rwM43iIM+xWw4V4y1UXaJhMMxo
	oJXnDB5RTD/vwvsj30mCjmYVg2NgD7RIfGpAY+sZRFK9KfIK4Wpvxly1oLJ7POEANKmBUj8D1eM
	CrY0HytbTgGIDzFccnre8I7D5qEwtgHUwRE8YZ9G8wZ8vTgkQbY8u6VCk2qhGiF1ehXYlEI0s8Q
	E5jeyGyDVVimFw6GV6dAJhLbC2N5PquXNHxSOCU+Sw3iqQ8biNEvzpUESBhTaHfMUlrHCAK+oMd
	QuJ2Aw6TZeio3eQqXqcqcrvcbo1IQzlN0HOH5Wf8ixnAh8gVJHNXfM1RpP3ebxaCNDFbVgNIJYG
	1yjcvSvocDVia5G4F9EEQDhRjYa4x89JKIldtctoiPk7dzuSHol+swWHHHHisdqiiPOtr
X-Received: by 2002:a05:622a:4c15:b0:4ec:fdaa:b31e with SMTP id d75a77b69052e-4f4abce094cmr43174071cf.32.1766154957156;
        Fri, 19 Dec 2025 06:35:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpXU5pTYf8IAIDbE0Sqzc6Vk3SDvjFDfm4RPQu+aDyXRPlzu/xbQTB4M/gboaQR6K2hZYIIA==
X-Received: by 2002:a05:622a:4c15:b0:4ec:fdaa:b31e with SMTP id d75a77b69052e-4f4abce094cmr43173611cf.32.1766154956699;
        Fri, 19 Dec 2025 06:35:56 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f86sm245145966b.17.2025.12.19.06.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:35:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:31:50 +0100
Subject: [PATCH 1/5] iio: adc: aspeed: Simplify with dev_err_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-iio-dev-err-probe-v1-1-bd0fbc83c8a0@oss.qualcomm.com>
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
In-Reply-To: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=z3gIGj1oIvvmH82pocqz/4k2PQOnpGa3jr5JHcWhyj8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRWLEcsg/U41BoWF/u0CzNiG+xeoGWVjGVoXoT
 NfSmwwYEgaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVixAAKCRDBN2bmhouD
 17LSD/9ruRFSUuxVXUPfzteRn2rDyimSpK7gTLu+xZB/8ccc5jh3NFxaTc82kprKc9KeXopFpk7
 sxqJAClDY/CkpObXefij8urEBNLvrMDnI2eShXdGAumF4Re2rxTN2eN4fpTrEsHeVCeRn/GUiTm
 aqd8AWv2WVpUQocZdUlWsHte9x4AyuaQiclWlO2P/+ESmUygqA526P77fL+zqusY8dl1Qx/mLZl
 0Fj9c5zLge/Pdq6xHeypu8XYSNPOeFtFIu4bjKsusMTEzUmFcfEs4PcejG89bsqU21BGciXyuCj
 VDozY6YnIFEx8SvMmhcSZeXZ1hH9yn6PHBevAuaxu4jdUVVhe7WFjiKht6Q/J1KECutkpfaQ7Ut
 /CZjinA1SFtrdElPEAfnk5RXoXjxH8VdVzcEFz/hbgzOR0pDj81MJnNJYyX0wBCFZ6uqWFfQfxw
 foCaRbwDfrobfvdERQQb8brmubRaYWsJPduVobsoGGGm9GCqzCFf8QoqtaWV0vG55G6vnuLCktx
 jK8PiB2fsLJ6Tf8T938FxIEAkBGN799ClXQq6w07f+8xN1d6kqIGHE3RDvu8eVdfqEvu9PEeyKm
 oUutIFIRV+Ua5vv9o5gi4gWG3SfHKRQq+UEMXE1nm7Z8KS7cy4Kymsd/ds1yZD71QXN8clXwwKl
 b/wRwDEQRYvMMdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: qBCiF4o91a8nVP-RH_0MipkepvJVvsuH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMiBTYWx0ZWRfX0fUZ4ZI5fpht
 cjhlgtBJ0q9hUNAZraY3sjIlWOoXFTyMYy7kDvUP8PzpTWZiUnnizViEtJCewwC4z1ZfaEN98pJ
 8Dq9tT/C8FjvFqHhFrGtS8OpTlFQS4OqTnvOaDfLIm66dujeggYPpjNA6FlkxvdvjgA8/uHy1Ry
 SYon/QY/OExCz7hdDachDnFlBodT1gi1g4OruOOto94lH5ktbr7UV4EjcCs3vWxyPX79RBKlBU1
 CR6Jn2vr3QDQjdPDH8llixY7jvEG6x869ICuy/mmaSGsr0nPFQNZHHBu9mYgb7X3wq1Jy0/VHWB
 p1/H+ssOGW4wstxGXeql+foc03ILBiCTl1XpRt5ic4/iMk4eXA7fu6POPe7tPNYsFsXPfDKju1m
 ZBBHQTu2UOPxq5prkyXFIehBBEB/nHGpEgV2+z6UqLXhUBi2BFLtaR8YNS3cp1DaerqqRG6QOJb
 hCBnSAOIEaUs1bhiVZw==
X-Proofpoint-ORIG-GUID: qBCiF4o91a8nVP-RH_0MipkepvJVvsuH
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=694562cd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dK7io7gEiNwTpUlzFjcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_063558_831365_F478F480 
X-CRM114-Status: GOOD (  15.13  )
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

Use dev_err_probe() to make error code handling simpler and handle
deferred probe nicely (avoid spamming logs).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/aspeed_adc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index bf2bfd6bdc41..1ae45fe90e6c 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -535,11 +535,10 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 		return PTR_ERR(data->clk_scaler);
 
 	data->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
-	if (IS_ERR(data->rst)) {
-		dev_err(&pdev->dev,
-			"invalid or missing reset controller device tree entry");
-		return PTR_ERR(data->rst);
-	}
+	if (IS_ERR(data->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->rst),
+				     "invalid or missing reset controller device tree entry");
+
 	reset_control_deassert(data->rst);
 
 	ret = devm_add_action_or_reset(data->dev, aspeed_adc_reset_assert,

-- 
2.51.0


