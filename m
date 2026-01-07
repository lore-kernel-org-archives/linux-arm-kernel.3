Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C56D0D161
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=; b=dvMoJu+y1yYmbDvxKS2j6jR/4C
	0n1BtshBetElA4uWlr79hBnQszXPiDPRkOJ3wnM0QuktvtaJZ7jexM9hlKZ5fe55kvBnWrCH6WDtD
	lHbl6KYANU+i0MQ8pCrM+Tg+LH9QOsMIG3mFIjGe+3tN2ADx1Ou73i8XhcYUAkwuqhnui4qoWMR1z
	v8/lpnZM5+ocw0eEeMPtUsGnBCugasa0K0zbRmZE7tEFAuPVHXI066dahLMOKvkBrighQJZz2AEci
	fCz4w3DZ9zICFWwV2aBXAssTu2m5Mo1vwml2BNjKK1EF3PKZ5SzUhzJWsZT45ZSIBTEBOz9kxKGu0
	xpkC6EhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY4X-0000000FRf6-1DGM;
	Wed, 07 Jan 2026 18:15:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY3p-0000000FRKb-2X8U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:15:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607FkuAK1979616
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 18:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=; b=VTI+JdNAvshkdlek
	Yfh5hok2VL+Ruv93fw7t3nX3JTZAOcnt9yVVeRWzxIrMrpZlkehYKArntaZh4Dhs
	py6Lp/1rh389bEb6TO0Y+qlxVSCg2M/0T8nIrcc9kP8/orpoqquwDZOkto1AWxb/
	cEICWw743ZtkcFMhW8qvlQ9DH1/Cd1MfDCaYRGvFcInihEn1//0v7/KskZESWGo3
	Y69JP2reux4mxVQZ3r0Lqk9ULcvavssUs4wagaNQHwAX5YaN1Dx+U04imhGQi0iP
	4UE/I2Koa/YNC1rzxkWL1UO7K1dW95kL0fNUN/pRltO3ShXQHw2WkytmT//QMryO
	taMxNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavk62j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 18:15:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b1d8f56e24so619561485a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 10:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809708; x=1768414508; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
        b=ZTppStHkJqVXJjIi3BHjli3tv7oe9l1su9KFXAITrj24vCN/5/4MHaP/CQx/0w6xxT
         DcfB8HM7maR+VSnJJdUnvK2WE1G6P4ejMSyQ230e/mtC/ntI2nKx/Q+jk9aUZK7Jbqya
         0QO2JJGZrcvLx3pjC67gfCTDdNYpVJc6yzGdli6wosGCCp1NXEw61nKsNmzAoc7m+myt
         faczKF/B0CW6R9wPgEVWO/CnDsEYJ16GIRBN4zrOsXyktAMNDuhH0GPC1189RE9e7JFC
         zYsHQgkwRo8F6l0PZ1u/u7FW/MOZXJfk7B+OVhJKL1fg2S1oIUZuC1p+Qa7uAhhp1lD3
         0jNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809708; x=1768414508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
        b=tGgxi0svtffyQmQZLDgYH6zHmDGYdKAxNX09UD5dke9u/HfrwnHxbjsVX5PNYBfjfn
         XvqyboCow6j0DpNCXR+eSPC0sLqLjSLdQ9Eb2jV3JK4OsQSAMvOIWOSHmMUnJgGOXckU
         qsfpcTANySvleulX6/24ph7wPQD/PpwvYPbQddG96NfgSbJJWjooL+C98QROraBFi6l/
         700px7eTZFiHOJUZTjRXEoK6O9KV1AX9oMAs2iHWkVi00DdlgjexZ6QGJdF64FNjAT8I
         A2g9gehu4Pc9SZL5HSU4hD0bjVifGWLXx8hgcMPOg4IeXE9oQuZWT2jtlf8Qpwxn8GoQ
         UFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4TlOEzKpMcG2/NmPOoZbpIM9Iq9VP7dyN0900wExcc18DCYZhVuirQB1yCiXB3DHkA3YTRuWrr17wW8WfQs/B@lists.infradead.org
X-Gm-Message-State: AOJu0Ywahx2KQNtkCEA5zxdghYh2vsolUiOsgK65CEgHXwk3YMEvsYZs
	eG/aNaoQZfRA43QD8INZwNC2h0Kqmiaz4ISjBVpdiadEQondv1Zm+osx7gJczEiJw7YhdU6522v
	eB0mpERkuAzzmLOMpXYh4YFGpm9pKm/7YgNmEz1mtDF1exNbi0/ZXSLFPffH/Eqp04liBIEj3xY
	gyyQ==
X-Gm-Gg: AY/fxX7ZGjpbkG4f9/qVO3/lqHo3gOZmtiI8ox4wmI6Ds5DyXAVLCcARwhSqX7JEfKD
	1qvXtrWo6NbEBAW2JwCaAUfgoxipusn2tiypaSIx6gxInmPV0h0atvhAy4jTb+g3bg0Sy639oAD
	qTDo4P085BwYYxm5nVfxpeYxQLgwJwC1vOHYhIajfp3t6bY8crkZdVSsgeNBSNu9u0jWA5AtN5+
	8Ovs6DVPPlrU1to1twjmJ6R1N1UwtdBQdMkvYGK6q1Kg5uFB965T3mg5u9qEeapNl7le03I+OYY
	3Fdc+r1BVOX2b6mSqpyMgcCBIL3WjVz61+8C7EeKFbmHHpjIB/GxeHze3m9QjzyEa06uib32EtG
	3t9O10P0vQRAZ9mWKy7Oz+sxF+ODeKfN4/XG/5XGvRLhOK4NnHw5RxMl3CQ0tQdQPU7X2dltkeq
	UT3sxiOvZKEizqp4XU4jvUYf8=
X-Received: by 2002:a05:620a:bcd:b0:8a9:be12:75cf with SMTP id af79cd13be357-8c3893f7d8cmr453747585a.61.1767809707659;
        Wed, 07 Jan 2026 10:15:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQiBI0nmEwHGDiwmCMtLl/jayFaEU1m0Axo7cKoiE+2HfeOqOTLbx0TrveKVWGZFW8ipORjw==
X-Received: by 2002:a05:620a:bcd:b0:8a9:be12:75cf with SMTP id af79cd13be357-8c3893f7d8cmr453739285a.61.1767809707118;
        Wed, 07 Jan 2026 10:15:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:00 +0200
Subject: [PATCH v4 03/10] drm/sun4i: hdmi_enc: implement clear_infoframe
 stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-3-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i9/GyfQ7oCfW1uA2EJ42B3bpRaDaBcnVtDJI1DBQZYU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bcoiW5J9/tWb3J4tHugrKAs3JeyiZt4rWpsWICpksuC
 jCtyXnbyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJiH5k/1/oclnK/Zz/ja8L
 v6t7HOL18cg1yeBbaeqq8pOvrnf+XBOj/s8szY+lzvBERUkLGakuejhjjs20u3oewa9eNacmbZf
 ZErVva/T+iCPe/yKqIoU+z/jzp+2KV28zo9cVjnoraUd13pIVM4oiTrkH6U3OTdOSsJwVt8L5h/
 /T3zkX1/bOvsVXv8vj+1+jxyrXD8c0ec7+2mYVenlOTuTBvsSSQqvGuY38Xj3Tv9TeX6BzUVOlc
 4rNlrpcI3a1MhGFq3s68l8oMFjf+RBpdHu3yN9MrYxg6YlHexbMklnWv1mXiTVGP2Lax/1P8qs4
 j9ptzHJSW9Jgcn/7ST4zM4W/whffsC+fsnRj8rbPKZ+zAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX6YXrtk9I6v2T
 cKuCnT2IWp9nn9edZvV6dTXq2dhbY1pDVAGK8yZHYA6JTiYh7R9JUCr0orv/CijzQFhY9ZN09oL
 CUDzuGMJuFpZqUDiqQSBUPhVt3h6+bgYh7uS235kb5i/ExY9KpNhp3inCoBzqw9nvICOxQ3UIX8
 hUsYup8F9oDPC5VIXcHF03LyQOgDb23PIHIcB4TAbEOOkqLO4Rkd/h6Q4VU/f9SUuQhHsb63R/o
 Z+DzQcQNcOJVWIkiHdD4BYuQUiA2TNh+y1Cvhi5/V++hasBAEa+XcIZETK4kic0WVwKZyev/xkA
 ngC0G22cSG7OB3WJ+90ujVGYByD+ypY1L6B+OS56S9L2SJqob1gUDvd5s3ShaIJkEVY5p7IYxPx
 Ul8H/afxS5L8g7FCLsna0TImonefmXdH2sxRIvx+Di9P3pHS7HwoVMg2HiiR19sHtDd9YfweRnX
 Dqx9oZCQcTgkOHhU9ug==
X-Proofpoint-ORIG-GUID: UD5CS4xmryMRdxFhThD-E2rOfO3N0EvU
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695ea2ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=J8re_t9gDAGCMx8MSDUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: UD5CS4xmryMRdxFhThD-E2rOfO3N0EvU
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
X-CRM114-CacheID: sfid-20260107_101511_621372_E91D23BB 
X-CRM114-Status: GOOD (  14.45  )
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

In preparation to making clear_infoframes callbacks required, add a stub
to the sun4i driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ab0938ba61f7..6263ee15880a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -40,6 +40,14 @@
 #define drm_connector_to_sun4i_hdmi(c)		\
 	container_of_const(c, struct sun4i_hdmi, connector)
 
+static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
+				      enum hdmi_infoframe_type type)
+{
+	drm_warn_once(connector->dev, "clearing of AVI infoframe is not implemented\n");
+
+	return 0;
+}
+
 static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 				      enum hdmi_infoframe_type type,
 				      const u8 *buffer, size_t len)
@@ -236,6 +244,7 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
+	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
 	.write_infoframe	= sun4i_hdmi_write_infoframe,
 };
 

-- 
2.47.3


