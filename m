Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42FFD0D15A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=; b=fTXS3vDpnhuEkAG1nBN2+uj9br
	NoroAfbwirpKAO1Pk4Ac6e9c+qF2T702IQm1tBlWSejJRUvZWEGBaqcZHMwTLLJ+MBKSzrDieKsh7
	Y3B6NqrTcmpKUG9/xhzNhd42+wSLnND9bQaSVVoLHVUgzJOcsdHxHzI6DUUKzOmDF8Ayx1jpCNPAL
	KWL9bCRyGlPpl48+XAeNI6bwFNIO5FyraruOlwNTr0AOnimFfuLZPpM++XEtHqXLwcFUyFLO675zf
	2p9i/U9EUqNItDtQV5+yTe5RUoXVFx13M6S5J3mFJfFhHoyGRARFibN+Pd+mTFdlQ3T4Jq1N/FKjT
	fdn2iLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY4w-0000000FSAU-03NO;
	Wed, 07 Jan 2026 18:16:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY48-0000000FRY4-3zfZ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 Jan 2026 18:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=; b=eHxVm3DotDyEJLTo992eRS21l8
	JN2UptPTNqiME5xQHbG8i7MTc/A0q5YimnZm+sBLhIXlsY2cnOnZvbH9Ka5Y0H5JGJZbcB1JUrspG
	K99fSaIKOMJihQ3Q4V2Hnf5HmifvgE2cVa+mtsXQX1DMB0EE9Z7OQU8V+oSsIGahfNij6avWavleL
	2U5qHY1PIzuBo2LOWi42uqOFbfaW6CllX9WpOYtMGLEW8Am9X4lAr0uR82XYkFS9eT06dTxRzEnRs
	/ejHRDsV/Xw0av6SZ4/EMJDEt2OHvKiEy9gWFfpBnXHfC12yxzFtwZcE/0uPA21ac0hZjiPKDgb17
	BjtxzJ6Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY44-0000000BtKW-43op
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:15:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607G8Wr21981768
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 18:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=; b=KbCTIULR+UQD/OAh
	U1rI7/tfl1/ayoTyuMELUcglhFt/QcCGv9YR7isr79DbYNFS++Nm24Mu8T+F/ns5
	Nb46watlWR+VJAYBlUKos9mkuWeL6NeBUNVZUj98sMVDYn2GjcOiUdMMpXb5ieYU
	GiBSz7AdGoLuCVNMugOoQB39e48Zo0tN0w05xOS1T9zXpjBM7thGm9bfybGIuNeB
	xcjjgL2nWqLLasPKHDHVkvqInzjqR3T9K6aYC3POkBBlzly+8qYDAHlsSxywEQ+O
	taP/Fnm6reneRix/8aOooj18dqvaHgLUcSXdljAPsXO95mEpzCjvaJPHJ2mTKXoA
	UVL9rQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavk651-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 18:15:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb3388703dso917291685a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 10:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809722; x=1768414522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=;
        b=kNj3zcbV9MRS2Oi3FPokki9OrKBHyeSKKjqg6ahysLMBYPxZzgYsWjJhIF4TA94+kB
         9/DoJYmVwIvcfK1PH8qJQcQmv4WYu5k4Ol+wh+Zsikmrhb4xdEEXrZQ/PeqjDyJOEQX8
         1mI1gV3kk3tTJyUPrmJERfb5FnFHUrnpaM+v1WDIsghFLfVU6/xpf92rGcKi3yJnaMHd
         cJMBz++e/RUABNE05HEhMoUGHS6nT41Ub6kKhVqX7qL36t5pFygaIItioGYD35t6Rnm7
         xRqFSGpHe1NtztIYNmvvQXBN5qlZuiptVpfr5X95bnYasgoTOGQr5FBcj05t3sNmvENu
         dAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809722; x=1768414522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=;
        b=XbApfkyzxcsEFf8bwfBH2wM/2CDEEQZgKQiLOw+JufDwS1DXe8WUF+jSuKJb/vAxbz
         PB6lAsWuABpQtS1nHVKCYeaoAJkKLbz0DDH6KM6tGJACiyh8pEyvXki6KOvNKiQmI7TO
         NnYu/FhEw9gH/UR7/9wXiYQhQySdG55kEx/E4+3p0K2F5SkmuFWb8gT1hvVXF4npjw1j
         28Jy84kTrDkJoTQXyCosFeOIa91ol1QDdQcCvtUa6xzb5SbTx2mIvZK0FJ9titGyKAXQ
         htfKN+Wk7ymAL0+dLwSAmOh9QX8dcvrODlUQNPcMGKAbcmtG82oDaou1RPZQei0sLqI2
         67Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVuitS8Qfyfx2fGx95Klcunqab6HYLgdXkpuvlKS2T3GdP7F3uiJNt3wCyedQtE8tLO+BfCMjMFzpYxE/B7c8oP@lists.infradead.org
X-Gm-Message-State: AOJu0YyBmeJSCcy9MPgn2/8+A9G2DtnPuUnQ2K9R6g0jI8o2bafzuN9O
	47TwZYxT9gCIJSbUguuEvfHV5HlELdGfzc5TRooHNz0YAugtAqgGCOwXTU+dcFmyikj0YQ8VaPJ
	QfuV0PAeHLtGTMvlw/mp+6GW2splIQo5GGpwR/WjI2/ru3sk+i2NC50ZpDoWWxhOAxkezU8o+Zp
	bNdQ==
X-Gm-Gg: AY/fxX44WgMKvCdiJy8q9NiVhOMQD0MMmtCjSV/Nll7DN4ue/t5PB/Fpi2rTUNzhFTi
	+LovZ3f9fMKksWFmaIug5ym1WYTbGMYjrsCzvHmJ8tQvvC+7OD9+b2qHg9mMZTjIua4guhCmMEL
	UOkJitTRrdQLArpgzAYkLj7fh5XZOCPlB3MyEkMfki/71FvcDx7K2mXXV2zW506soAwjVTh95TA
	4/YbEE+ytHjStxs3kP/Z6gsiLmCNJXYVVkYEBrhTXlxR7nuOoOLLLr2pT5r6mUdjjVqGw+box2V
	wcawcIzXpTUPZMG13l+yaUeOlM0/jmp2h0gfSa90ofooEi0zNiVZNk7UltmE35gvGjY8ofpN0ik
	gW38dQEPQwepeJEGay3aY+QTEuqGdIQyBFS1Y7fECYRUSS4EwDEUqDkzMvgkuKny3djfd1N8IMP
	i77g9/rkkIQmL3knnl/Wyspnk=
X-Received: by 2002:a05:620a:19a5:b0:892:10cb:b427 with SMTP id af79cd13be357-8c38940bc70mr456798385a.67.1767809721975;
        Wed, 07 Jan 2026 10:15:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDhZprVBsv7NrDl4r7/stHLp9ske0/9w25bokRbHgFqXeEm1zUot0CQkb+02Aes2IA+aZv+g==
X-Received: by 2002:a05:620a:19a5:b0:892:10cb:b427 with SMTP id af79cd13be357-8c38940bc70mr456790785a.67.1767809721391;
        Wed, 07 Jan 2026 10:15:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:07 +0200
Subject: [PATCH v4 10/10] drm/debug: don't register files for unsupported
 HDMI InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-10-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fqja7nqMdmSMtGtKfnnZaHovKcc+8jCwgpdYFW7dJBE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKldBKXXeIUEl9VKknThFajiJ4bv/Z+Y6zlU
 AwqJpH32O6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1SajB/4k5q4SEw24CrrWC3HEsLlY/uKXgpKUIWzeXnMMyXHDWo7v5tevjX/ai/KZzmbo1NC5fGU
 jhVIocLd7kwuiCUjpW/yVaQGBTAKyovOJsTbYp+V9wBPDqh8cp3VXyONhN+s/zhRGG9gAF2YEzG
 cgchTc/+0JVBdAMG16Sxc4mMOkZGU+Lxks7qJlyhN6XsUcj8iRQG+d9hUkNlBAgdTcMJpMEn0kd
 dkJOKbe+FFOrO2OOH4BNawMbMIU0982lxSIPgb5Q/RKX8LhTdWcg7s3XNn8GfdQLMft8fGlKdXt
 B1XWOTyoPib7k0/IiAyVFTJ9DpbDTMyzhznF9TrmGgOPszSr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX0f5/sB0UFP9z
 LVS23e/BDTPXU4F+c+Zqx5TIN2p2Tr5P7rh4OZruk2LLd5eeeug2nZVvYvLialiSwpUN0nlb+/q
 o+ABrCDxv3xTdrMragVVR2jzXSrd6EPXr3aLgrssncQfdz/MX+es3YQ/5V5b7xsgLDcxpTTcDOL
 z8ojfYoMfdBp2Y8MeHqTtaV4spz+uGFRYY5+ktn8b0sPczslm0jUlbHqJrz5WNhUeuPK8/FCOxX
 4+4Fk/NsBNpk34BKZG0/pdI+9pbK+HQaBCk/IVQqWIxOoDZKwkHC1kbHG5wppgeoVIY/F+mk+an
 xzNhfjtIeM0jM1qtodUPrZebCT9NBCK8ZPC7b6SgEilic8T+tPPzqhEENo/0PDMqGiLrTqdvjTu
 uJe/+GZjptZc1wRLvYJEFw263u2tyT5TZSIg7q7yaMSLk2lpu7//PNyjx6UtlPxdYYNngrMIJCd
 meqFxKa5Nyg+wwX3+hg==
X-Proofpoint-ORIG-GUID: BAWRiLS0fhNOEjLLBaBOd2hlKdkRoeBy
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695ea2ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tIAOKlZC_mo2NaXw_9IA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: BAWRiLS0fhNOEjLLBaBOd2hlKdkRoeBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_181526_067863_E456C566 
X-CRM114-Status: GOOD (  15.31  )
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

Having debugfs files for the InfoFrames that are not supported by the
driver is confusing, stop registering those in the debugfs.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_debugfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 365cf337529f..ae1c6126c2c5 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -672,6 +672,10 @@ static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
 {
 	struct dentry *file;
 
+	if (!connector->hdmi.funcs ||
+	    !connector->hdmi.funcs->audio.write_infoframe)
+		return 0;
+
 	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
 	if (IS_ERR(file))
 		return PTR_ERR(file);
@@ -726,6 +730,9 @@ static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector,
 { \
 	struct dentry *file; \
 	\
+	if (!connector->hdmi.funcs || \
+	    !connector->hdmi.funcs->_f.write_infoframe) \
+		return 0; \
 	file = debugfs_create_file(#_f, 0400, parent, connector, &_f ## _infoframe_fops); \
 	if (IS_ERR(file)) \
 		return PTR_ERR(file); \

-- 
2.47.3


