Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68776E74906
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 01:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+SBTDTtGkE8RnKwaj4dcEp5VbeaO6x7ZVfHg3H5ESs=; b=y/srptblladcXIg0czigCJtp9e
	MT/D5qa/GVXqoT70GWXAwBKGKXAGdW6G99dIMtLOoPKMIv6/+1HeS8dBghTcR9RXQdGqtDmNjlr3V
	X4TcENQHxsNb5AOMtcGwV1zO41EYTFYzZFlWEo+doIsEmLhetaXpvbFESaAfg6ouPFHsC8cZjTJWB
	/ZkvYt0r02qekruWwz6oSrG6zue34XdTB5CU4MVv6/sNuZ7Xvf3EPN5rpF3PAdgcql+alBpig6zWY
	ouDrFQWzzglQOf/msyQgaM6E080PDw1To1NT4SBC3XV3eNZRT6YNC3BQEjj1BlqXD38A0VBjjCTuq
	xNcg8i1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDI5-0000000GF4n-2RsW;
	Wed, 24 Dec 2025 01:03:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDI1-0000000GEzh-2AxM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 01:03:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNKXcMW1206421
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+SBTDTtGkE8RnKwaj4dcEp5VbeaO6x7ZVfHg3H5ESs=; b=Esi0DjvAzJhxorsi
	g/+0CqqpWMMGETBCdKGbWAK6+wNpcpUgTsjDU9DlpBhFnx5A2q/r6vi44H6iJUXd
	rPPoPBKv2ob/TY6coqKmULhrTq2Ws6j+f1M5oSTqqnWsgVyacZy7WUZUBsb+QMhe
	sVf7WTTTDaZPKrSeFvRIcvrsmY9LL6x5U1DHtvybghVoCFvFFqxVCZzkgRnOiIYx
	H35A0mjZyRosZPZTj7L+ZI3MajMOghue3ZY7KIoamPv5jAAt1K1TE602mnIix5mB
	USOF+TIqUZJyVRx1gM9WdnGaDLRzkPzwjk6ea6N96EV/KiLzbxuB8eejkGQj0J+I
	X+d4Eg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r0gqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:03:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d2aa793fso140168241cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538224; x=1767143024; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+SBTDTtGkE8RnKwaj4dcEp5VbeaO6x7ZVfHg3H5ESs=;
        b=aNqgeQ6pugY7J6mLakpvShWt4Dz0lwFVf0am/lN1o3+yRik3b9BMOJ/JX1ZeWDBXVf
         EXtttsM/HjnI+LJK4YoQC/1YGntXtF7rPOXo4h6NvuQvUNFmYLXkmdDOZy6IvULI1vKr
         9MvjXyDOR7tkSqLemRXT5f4y5JId8yuLR9VDZezLFuLt+cEAia3zycMk0yQFzzx80TOa
         5u9BvTLKQfTyU3I0FKthMVilyOurEWoxKzP1z0tBi+FHQ6Zc+FcEogb5QOwbczbrgeeM
         tYpahz13AGTovspM6yUELwwNl/cWLFwNYZvDouO9qP6zAX9fMrXGirVlmhtVLbwafCWB
         X0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538224; x=1767143024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+SBTDTtGkE8RnKwaj4dcEp5VbeaO6x7ZVfHg3H5ESs=;
        b=UwGKFYx+NPsRbElK+rBIHVTx6c8g90c0Sfh9/5a7R2A/L8odQyTQPd4h+cr9Ifm6r6
         j/jmDvrTyFiQhFG1UI0RKMqej1Wriq9iSEmRo7DYA/a8+k0mkgNLJ+XqEwhHtB18cQwK
         vKezHDYmLhS6sqdUNKy/vo6Amqnm/+gurm8duja0P8p6UTj3oeO8bAkHwW0IhIhj+ihA
         6Mfg8JGLJLMZUN3hkyaZ21cc0D5bBk5o/aQm0zM6IIP12kecn+lRZ1BiSYK6YdetShDr
         f917ufF0SmLM1SH8TjMohEa2h/cS+ke+4ELAyIaQFxa+4ri3STnhREia+5Y64hBtCesX
         DQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMJDo62eZJKJwzbwySuefffqx21LmZjzykI87GW/rufrzSuxbpFCRn3C6+Xxl1f6U3pGkoaWqQIEAawX4SZGHA@lists.infradead.org
X-Gm-Message-State: AOJu0YzrqZSeubjGvd5TR9kYqDvmtc9SheMWXn19ct6DGGNBnR3ps5An
	Xy417A4hyzS+/bfNpp3hZ5oIV+kukuyaBlSya6YHEr+0lQ4zKoYmg9yFWeVwo/Y7pby4za9JSaJ
	6Yd/Sb+kdDC6a3yQpSRkgTLgaVnNh49G4EUPzBLotw4Do8FACnY41r0IR3l8V5cBlT8PSAvyiok
	b7pQ==
X-Gm-Gg: AY/fxX5osuFPhjF+62OZuMGDl1jNzHU1XtnYqcw9DXmUX0NBlnu+vtpuE/0XYTvkzLA
	gtn30h/4J9CwN1OX7JIsTaJ3FMoEuOQJeATdDSLKh35Jsjl8YmjBbZHwia5AnRu72TbKdx0r3Fa
	ZKJYo4SOePl0+luME9kW6zfnYp5Bluc8Us0Y51+RU5fk/cmDekHE7KrmneuxWyrulkjWABpu6WI
	6OZQNgpUwe/SGgT7PTCWM2T0MypA7ckY1JDXgHIvW2S1UaSWDme1suJdvjWHPdTC7tQUJIg9SVB
	11ntUetqBK523y+qOPHhM0qiqbV7qXLb/nZdp8Vwsz7GBmrKGLjux+1a7F1xNKCp+TcqJXqkvwe
	6J5pTzB4v//a4juqF94WSKVfa4X8c5QYqTDMX8RK7QKgzTHN1JjzgwdXngDq+2wf52V5muJUl+9
	KWkrHznxh8nhC+P72UOCp3C1Y=
X-Received: by 2002:ac8:5714:0:b0:4ed:b06b:d67d with SMTP id d75a77b69052e-4f4abd79a65mr200344201cf.45.1766538223816;
        Tue, 23 Dec 2025 17:03:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3FPxruJlcg4sByZJPHlC6i+AJRJP3LWX/PRkxW+hSkPSJ4R06usLW/tOcstjoguUC6XxUXg==
X-Received: by 2002:ac8:5714:0:b0:4ed:b06b:d67d with SMTP id d75a77b69052e-4f4abd79a65mr200343621cf.45.1766538223198;
        Tue, 23 Dec 2025 17:03:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:53 +0200
Subject: [PATCH v3 04/10] drm/connector: make clear_infoframe callback
 mandatory for HDMI connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-4-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5379;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nzElO3qrN1ngMVHhZahBd7pKCsEHzR84mn0cPkFgNGc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvY4okwjZ995SvLTt2suiGbzvPytcBxbUZoJ
 IPFjD2XFqiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72AAKCRCLPIo+Aiko
 1VbaB/9msli7nDTqX+64qChKWsJQHzLJSmqJubE1UJ2Nf5Hi/AwpsU7hfYtfCl3WwKKmKfuuu8Q
 Lnl1Ig4EyHgBKD8apvy+9QiFbhlYaqL42IMOn+b4fFQG+1HPmsw4bhcy1pYeNPK2nWrNf4Iot+s
 sd3Qh5XwmI66qB1NAgelgo+ogMATAG/krn39azAVbzRMw8HrEzuws07zAM9ceLRCB1ggf6IEBFQ
 TFqvoA7DhLiuf8z1XlDYFdpss+zjWGa6X0rgks+Jb7dLupcHZqGP6X4NiZ6MxeJ8PeusTd6aEyy
 LwfXlcUtR0hby0mDACU1DWxjeEkPR22us8arufoAaAdFAFeo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 9Nc-7_2jqQUKzwcGreLrFgGUkRAtYNQr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfXxGNXBqklR80q
 BSDYX2xTGjal0WXCDRUBqOUd9s8SnUHmUItlAn/JqwO1doybq4q0xbcokiEsmOzS3RhtUGVBM97
 9qqg+hrySXsBmz3KVd5/pd+W9q3D5DEP1shNyrigokGfS2KiZLVsNN2GiVGcG2yfEUsxyB2LBIT
 6PdC/U8PdXdQxGJc9RvYsTE2mBxR8Jcl30THKO2GUt0EnpFjZXlTdCcICD2WVAu1mKOmFXwmzjS
 53f4ykKCpFKGxZ52A+JkdGhMAEglPbV/L/uhx+XQymf7KvtaaoUNwyy6cJHIB2eRc+ybEQXQ/G9
 1MDlg6th+t5mo0bEQGmsj5SxUJ8ppARX2txhsgb11MgOadQ0NKScs5byYqF2EbkTs9IsJff2WOi
 e3EWdLx0FA12rqLdqd5hZn2ojpU5lsPkagLFYJvkhJGUw700PZW749PzORs0vEu9g2bikzunv+G
 GFRvTCvM2tbDxXU+9uw==
X-Proofpoint-GUID: 9Nc-7_2jqQUKzwcGreLrFgGUkRAtYNQr
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694b3bf0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9fyoTQa5ixSHU3Y6h0oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_170345_749680_A69CA44A 
X-CRM114-Status: GOOD (  18.90  )
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

We already require both hdmi_write_infoframe and hdmi_clear_infoframe
for bridges implementing DRM_BRIDGE_OP_HDMI. It makes sense to require
the clear_infoframes callback for HDMI connectors utilizing
drmm_connector_hdmi_init().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c                    |  4 ++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 15 +++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 22 ++++++++++++++++++++++
 include/drm/drm_connector.h                        |  2 +-
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d6dc9ebfdb5..40e025712c9b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -600,6 +600,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	if (!hdmi_funcs->clear_infoframe ||
+	    !hdmi_funcs->write_infoframe)
+		return -EINVAL;
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 22e2d959eb31..f356ea695ae7 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -25,7 +25,22 @@ struct drm_connector_init_priv {
 	struct i2c_adapter ddc;
 };
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static const struct drm_connector_funcs dummy_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index bdf14a0623b2..915dcd106703 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -76,7 +76,22 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	return ret;
 }
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -89,6 +104,8 @@ reject_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -101,6 +118,8 @@ reject_100mhz_connector_tmds_char_rate_valid(const struct drm_connector *connect
 
 static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_100mhz_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static int dummy_connector_get_modes(struct drm_connector *connector)
@@ -2419,6 +2438,7 @@ static int reject_avi_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_avi_infoframe_write_infoframe,
 };
 
@@ -2500,6 +2520,7 @@ static int reject_hdr_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_hdr_infoframe_write_infoframe,
 };
 
@@ -2685,6 +2706,7 @@ static int reject_audio_infoframe_write_infoframe(struct drm_connector *connecto
 }
 
 static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_audio_infoframe_write_infoframe,
 };
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..4543833acdec 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1253,7 +1253,7 @@ struct drm_connector_hdmi_funcs {
 	 * called multiple times, once for every disabled infoframe
 	 * type.
 	 *
-	 * The @clear_infoframe callback is optional.
+	 * The @clear_infoframe callback is mandatory.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise

-- 
2.47.3


