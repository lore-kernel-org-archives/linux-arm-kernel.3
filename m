Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC206C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTqFwWAy8gxz1MmUqc7zci3CtGF3y+5TmAl/jfQIgWc=; b=IB5elq7EFgpDzgrxb+h0zerKPm
	ebaur4rlU5FxlBjxsOs8t2vhX0sPohlR6of31wCNJb5yap/BTXKzdlOKLrbabXPBUs8vPbpOpdZKL
	m9GwOUJjbJA6u1qVloV6zS/ARuqgInrcqNQA3mTWmuUQZqZzHlQg7RUT5/hLK3ctdfkBo+kKSna80
	hhshPMBlvaPEyjb64zzbUMQN2UDpyadioAV4n2DKzzsqbAjqeFEO1VvF6oU6+iXrKBH0CFOquyIgk
	JhOGF48WJcGnmwcHCR2gy4piAfJjVXBBnFPO+jetOIHk6Cc8VISVBIBGDtbHTOrx8MeRr00HKTP42
	reTu4OIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRMD-0000000C6Nz-1nKm;
	Mon, 10 Aug 2026 14:52:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRM8-0000000C6KY-09X3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:52:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjVeq1596820
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kTqFwWAy8gxz1MmUqc7zci3CtGF3y+5TmAl/jfQIgWc=; b=ImZqAgwNjTbYRndF
	Lb892AhJfvCwZs3t0nPq9Lnk6u1N/mrzwPU1guaeZL3Fpgu5Avs6XoQvzJ8/Xknz
	2eYfQB/asrZAoA1VF2GDa2CZvdPU7gTXRI17ExTK6+0rd4VtT+f3wRgCaGDbNyyR
	wcWhSfdml8kZJS88B2fAFxP+576pw8W4kJR3p77wNhf1rzv3uFDqTSuNW3xfUPKz
	Z+s/LARBMQEjcjfhoBX6n5cChK8yGCzyR45n9tO3CYXNwpl9xVrH4OAFLS17Bczx
	PRIo6om31kyIMEPOBcd+iEVrb9fnbJA79h+yGAfFjBHgNljf17Ys4WyLAbGzcNUG
	HFhsSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6t4e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:51:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930edb4362dso145341185a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373518; x=1786978318; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTqFwWAy8gxz1MmUqc7zci3CtGF3y+5TmAl/jfQIgWc=;
        b=SF030Cg2smre63dclmiMvGTevLC7t2/kpz1QUgkL9B7aoxNtEbCRwQF0VrtARcw6zf
         WY8PEq39rjVH6UhdE9xSZd7DKGst4JnYvcYv//DM4vokDI9DxW+FjZWMU2QIUzun3yP2
         dpSmbL4V1VKGczP+JQfbNaYUfvHLn8jkrTe8QXpXweV+rTbXZpPcB17B3MVz2IzLKQay
         mmfR4hqnWvq0A9vsmpajH0Ocn33M2236nl2EdVcGU80IU67Pl8ujflSD5vV8fnKnAcUa
         FaHhd9ciiGyN8VjepfDBDqQlwWvIVxNvLgi0H6L8ePOnIyZhTFTm7zacYP/OXjIynQ3h
         KS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373518; x=1786978318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTqFwWAy8gxz1MmUqc7zci3CtGF3y+5TmAl/jfQIgWc=;
        b=k4iiJfcchSwPREYPhw8e0SEDWJQ750FT9GKr5GmK+nVsaUEU7v/wyoMtJ5IYJeuCeS
         i2ucp7tDXsBOXOb3jLobmj3SE83KfU8ij9UDU+kI+iHUzZCLfpAM88Og6D9Hl1vODLQc
         BQ66Ffh4ekvexmvpWWO5EB8c2K04HRc0T8th0iO1M488CESbnFPi3TA1Lu2OGQ0h5s1X
         Vfd93qA4i0djNByHPb2Ncx7TYIQQWn2SmQFdt1ERJN15yzAun54q4RX2npPdmoRuW/k/
         kqAcE9RH7ssFiJTyuu0HNGhZvtOjHvUSTjUUyTqzyKhdYgBW+2aF6cCLcRdngoIWAr7v
         R8eg==
X-Forwarded-Encrypted: i=1; AHgh+RqDhbgTXC37RCmigcTz6OA/KXUvswih0piQ6SoYeWYwMuNRxqxft0HYVx7PWRoh+J8FAQKKX52IBgiW19I4Tv83@lists.infradead.org
X-Gm-Message-State: AOJu0YxNuzBcfINfGyeqGFZF/wQ32TgYqFt9sLGKFpsNah6INNyF1lzO
	GkXZ8AFSMqu3fI4xGq3ce0l2xA8g/JUEcqq6EjZrxWlwHKvLfK7h4b59QoLEzxOSgJuA7IJfxj1
	508zXpcdBPLHucaCvLPZJe1lfyrHghooDFl3kVGWfaM/ubvBGeVdHTavmaRdNvdx2e09vyiRFh2
	3j3A==
X-Gm-Gg: AR+sD11a21tb22TrESmCkYWx4pdeew4j2FyRd5qRFfl6vHGcfly6RRh1xCflFNEEBmc
	0yLA985ajFV5bpdd9OE8FJGd8VdGBETQ5XMpoNvJP8Zy7GimzBrsl7xM3EAvz4CcjKO3LZtRmK7
	7dWIoxDrTX3z/376KZUwLHUqtLhcW6aGPFekEpfuw34KOIjYT/8dzyvaGR8KI3q3rLnfgHQp0K/
	dso8UEIcDVRsb4hssNmKFWEioWW45CuqVSSQxkALOSXDGvR3FjuY5a7Fanzpz6/kIvv4Ax7vKaZ
	oxJrGztQrtTB1xgucyT3MiPanzpnx5DCiGi2e88d1PB3PCwcFwizgFLugQTHLrSytzClJvzQc/k
	X/N5i+Zai9aVrGyU87MhRfgJqqEKjcXPuVjFwkFKmqNJsAhwpGUc3jAdB4V1zaNpdTVu+QbfNP5
	vajvDsPxTsGgltjg==
X-Received: by 2002:a05:622a:5806:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52d4be1ab03mr27753891cf.9.1786373518204;
        Mon, 10 Aug 2026 07:51:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5806:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52d4be1ab03mr27753211cf.9.1786373517789;
        Mon, 10 Aug 2026 07:51:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd6a796sm22489661fa.36.2026.08.10.07.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:51:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:51:49 +0300
Subject: [PATCH 4/4] gpu: ipu-v3: di: report an unattainable pixel clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-imx53-fix-hdmi-v1-4-fff9b1b17f25@oss.qualcomm.com>
References: <20260810-imx53-fix-hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com>
In-Reply-To: <20260810-imx53-fix-hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AJVGyN6ABsrumW1cS+QhP8uMJiKdvZ4L17DP94TV7oo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeeWDuniPTM7aG8qyd3SuSyxN4T3e+ikAJWC8I
 5rfNOm136aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannlgwAKCRCLPIo+Aiko
 1QRbCACEWOb6JNOqxsn82iOBHRW8q/uQaofmrqxQRemzL4NXdIOQdzJ1B+QcB6YfmOh0AiJElgX
 vQ3NGPnp880zSiX3vPetajSr8oI1v7lRGW3EPKl/xn5vkxvVKLCJt4La2VKHhy31UV7rTBrdDPO
 BIJ8J8ZvVSlq/oWe4b63AMCfm4j1u0Yr6fCCpQ+FS5QTux+jqVasFHOX36lLE4X7y1BegpsKpvH
 s4OIzyMHPrptSM28z5ClQ7ARSXTIzGoF5ZJJrFqpKEMDxYnQ2rExs2TYM5hDThkZFiGcnp08Lot
 Q+i/4s/xBGVsPHWKyPQ8RBh8BUUlEhcbv2CtQafRVRFbOazG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfXx4ma3/61XViB
 DQTzoatTrX325HsHgk5Ow3tPFUV7TUBIhv1kWNgsWeNm/7anaqdAcc+dycj38YYwGFS5RF6A4fj
 H1QL0WuSArSot082MZggMWj+NYzDj7Q=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79e58e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=_XsFwZo-ejPuOgsMvnoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX7FoXXCMlkRBv
 R8ZXwcnkD6dqL4FGpJExhoboGecnG0qn5zfnjxHK1wIq6Q2+1qnpKaQPqW1Q4e+JFQhcJIBlm6H
 JoVGd+9GTM4SJ1DXL19ltoqnCshNDl8FMSZw9UxV6uXOb16gO1b1y+2LVYNLH364Jtcs3m/IEAr
 s/lWgEaFP311kSU/7tk6dPnBjeaKCgIvkGPMQ+TwhvNuGUus22Xcg0pYOWZQVoLGEcqq7IBuhlE
 3RsrDpzuYnq2r5LwBs0ijWCXucU0HKoQvNujdrtTwYbJsKLyTn6xaZk8xNLDGrr5++93f3LaZc7
 0h/zDp56IXOTKLOFfgQLvoWY08R0UQUm+hOWVQo8FRl5QjxS5lPRo5RR+WqDrGJMCW9DMeeOLlx
 c3FHXtkJNKKI8IKHCmAXQNqViqrg6Ak4AKb2tBeaHeJjo0iN96p4c90RImJs64nlnBI5DQ4DGk4
 +FA7iLIfB5WJhIHlgMw==
X-Proofpoint-GUID: fN6o_Po-DyphNH37Hwlqhprp2kmjamCw
X-Proofpoint-ORIG-GUID: fN6o_Po-DyphNH37Hwlqhprp2kmjamCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_075201_202097_F17468D7 
X-CRM114-Status: GOOD (  16.90  )
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

When the DI cannot be programmed to the requested pixel clock the only
symptom is a "flip_done timed out" ten seconds later, because the display
never starts and the IDMAC EOF interrupt that ipuv3-crtc uses as its
vblank source never arrives. Working out that the clock is at fault
currently requires rebuilding with dynamic debug enabled.

Print an error when the rate the DI ends up with differs from the
requested one by more than 1%. The CLKMODE_SYNC case is skipped, as
there the encoder programs the pixel clock after this runs.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/ipu-v3/ipu-di.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/ipu-v3/ipu-di.c b/drivers/gpu/ipu-v3/ipu-di.c
index 0a34e0ab4fe6..c971c37356f4 100644
--- a/drivers/gpu/ipu-v3/ipu-di.c
+++ b/drivers/gpu/ipu-v3/ipu-di.c
@@ -497,6 +497,22 @@ static void ipu_di_config_clock(struct ipu_di *di,
 		clk_get_rate(di->clk_di),
 		clk == di->clk_di ? "DI" : "IPU",
 		clk_get_rate(di->clk_di_pixel) / (clkgen0 >> 4));
+
+	/*
+	 * With CLKMODE_SYNC the encoder programs the pixel clock after us, so
+	 * there is nothing to check yet. Otherwise the rate is final, and a
+	 * wrong one only shows up later as a "flip_done timed out".
+	 */
+	if (!(sig->clkflags & IPU_DI_CLKMODE_SYNC)) {
+		unsigned long rate = clk_get_rate(di->clk_di_pixel) /
+				     (clkgen0 >> 4);
+
+		if (abs((long)(rate - sig->mode.pixelclock)) >
+		    sig->mode.pixelclock / 100)
+			dev_err(di->ipu->dev,
+				"DI%d: cannot generate %luHz pixel clock, got %luHz\n",
+				di->id, sig->mode.pixelclock, rate);
+	}
 }
 
 /*

-- 
2.47.3


