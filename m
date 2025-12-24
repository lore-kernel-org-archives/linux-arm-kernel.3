Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E417E74906
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 01:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=; b=GtB1rUSmmw/X7Hcs6o/bFVIFsA
	dpi1n+NUxGiyBOPwQ8x4CSuxKFgnLy07tzPD1kF1qiOctUCjX/qx7kiBb4qyaBkkSkNgGoDMq+QB5
	eecMYoi2FrLvhGFRjz5qT6JKX4F6MfkyjufMknadvfhyFYd9LXHok++HLyAP/187UW2veSfmU5Lv9
	XjYf2dYlaCEb/2wExRWSuD4cFD2LEq7vwL+lq/8iY9zobiVMKSSYxD6nwPZs161xVn9FjrgJTWzLA
	4bbSIddplfHSQvHs18IBYrRCvXTFJe2/lhei6RnY5LT9Tl/ehBfL60+dr1daPN6ql+5x5GQBB1TEP
	SWZrmCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDHw-0000000GEuQ-2dxm;
	Wed, 24 Dec 2025 01:03:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDHs-0000000GEpr-2sI9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 01:03:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGO9Rw1018084
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=; b=hWR5OjqmTENGCgZk
	I4zXeoe0FG7+9/6SD3mCvvxs8H3pccL8dmb/4n93hTOrhvZH9t3GbcV7sRBlbwqh
	j3vMtO15GjZ43NDH5xDBw1xydalP3nQJoi/cquWmGbTFSO0HIAKy7YEvhLkXqIlb
	dQJ62hwBdIBtDRmwviqI78iNNVhEH7JVIqEWs3P+GhpXvYZbEb2mskJsWiOFpo+9
	0w9HVSCBA6DhMLa9kwIXPMA7/MAnPT6hxcp69upX2RXhvAhyWGDr02JZGhZE7hrC
	/ZRv6AGGoy+yRGIjDtc/ZYrlLleHwBbYd2TR/74vUAOumKhok4evGO2QVUh5wiVI
	wbOeAw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9ah3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:03:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8888a6cb328so141849726d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538215; x=1767143015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=;
        b=GoPzomr5vDiCBxVOvZlGAyZQhOHf1Qm6T13zbsS0ITDhDnLJ3Y8L2CgIfuqkwwR4YS
         8cz/TfRZNEsxg0W/tlQk+0N5/gUm3lRGX2/AVzs57YBYXf661NvD4p8LHMrIKOBT5Ik6
         tzJrcJKwDAgrHmM8nq2em8opYOvlyJdd7eWAzdj2GQD/D1qea0UQ6O6WCMgN8vQjhpZd
         36FxkcYz25BaipQRPFpD+A6ihhVbewLhAm7yl398ryLzP5iAOfJVc/+O5jE538J+htiU
         XpugSId6QHs/309M46WH/xaIuzjP5JMAni92a6ptRha18LpTyL3c9BC1rlHwvGN+k7/V
         F6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538215; x=1767143015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=;
        b=dNKnmQxFAIowlg3R3CQO/vvhryVcdQSLvnjFIvpplhbpOrz/zwgPRhnD8FONUHDb7z
         m1Bh0pKJ9dae2Cluwl623sjNPiU4eWmIHXGkDLtJ8WgJGgBwY99IFhyygboBuRcLAZkQ
         EjN8Plg8yMBpxZzJYwTfLVOln+NmyuMlTFulI83RYZzT3WQdEIQTks8cWTmK7tcVblg8
         pl7ag7OqOBhcOylipYQSAlTl+vQNYmSH+FEt6pIGDsXzbNSyqvblljOlDvD2KkX0CCJ0
         b27OkYtIn1n/ConM+Wepm7zj7r3JCuVIJC7tWomrxPNvSf9Dv8Nl4YslDSoBcBlW32O+
         wR9g==
X-Forwarded-Encrypted: i=1; AJvYcCUyW971kRLfsvjj193Xf2V/h/7kjEMsgX6jLYXb3vkbTqply/nepgwDpEeoIPEVZ1rcED5hphlLeBRT5aN2szEa@lists.infradead.org
X-Gm-Message-State: AOJu0YxUTa1hjTxXXL76T4G7xVcvkwVcTL07eKGwuzSxs8MiYENeEfba
	OhZlQu7fPGlWmc3s+CVM/EvX9OsqZlfxab+Ua7ASGF1RlJQ3FiW7zwnkPdYiZzlZg0tVJNxedog
	efCPX20V1MiTp/TZAEbmOMaz4W9dd+1ED0GggYdP1gFc9vGLEmpxjCPRSLVCZXcADEG6d8c3wL6
	XjGg==
X-Gm-Gg: AY/fxX4XBVlF87/95O+/tqfawBOlVA7kDsQiZqwbqOVgNQZXIilMIeRn2vYn7GuzfkJ
	DrHpJMR8DYUwiK0eloU3x9LMbr4/bi0PBHTvDldC0GLp/k0FfyaDzlEHV4NLLmyam518FJPcLY+
	qBu3Rfbdod/EzBfbfTNrqlv9SuQWKj/EEs1SHoSxvbsV7VrdaKvMfLa1K9GqB4cOyXyxK9pEf0N
	Ia2+R4ZmnwRK4PN1ryWnUvJjQl9u3WABpjJgCBV0ZK+xDSPqU7589rvu48wUEj3DltJx83RfM6/
	GmkKtt9xBPE1NSi8jLD3fHbfQaOZUNVfdm7mzinfsXuYjXMvI1QHvURnbBOAM320aQq1GR9K53A
	E/YJoQD4WTug0iwrirNGSmJGNhYEQIYk5/2g/KA7kOCBESM928zKfIhdNopOnHXwvKzegGMF1gf
	POBYOJhc3p4EcC3OZZACIH074=
X-Received: by 2002:a05:6214:4e07:b0:888:6ea5:a8f2 with SMTP id 6a1803df08f44-88d82234a02mr251739136d6.29.1766538215203;
        Tue, 23 Dec 2025 17:03:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpKbGgnmym2Mtt5yWxfAHv9iuZOADyKontrek89W07BD34phYJfGyZ7WWcGGMKQLxabxO7ZQ==
X-Received: by 2002:a05:6214:4e07:b0:888:6ea5:a8f2 with SMTP id 6a1803df08f44-88d82234a02mr251738596d6.29.1766538214801;
        Tue, 23 Dec 2025 17:03:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:51 +0200
Subject: [PATCH v3 02/10] drm/vc4: hdmi: implement clear_infoframe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-2-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mr8qXjnvYFOwO7KQ17AFNeqHgYNZnWBLYdH41Q2tDUw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6a39fX0APvL2yu8D9Rc3hNQrCmR/DDaffohjZWMNm3TW
 qUDX0zvZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEyqI4GNYH291ht/25OWpN
 +Vnmr+nWTHOc+k9sTsiarlmVcz3+bZnyG76iwxndrZ6Wj9f3RuYEOJzb6B3/blvX/q0ezEeTEnX
 Dnpb5/F56eOYGp4ml9wQ/ivtYRbm8EOP/EM/JY+69MHef7kne9Z5Zt1QKdvxjyT8+5acQa+C//A
 uiTqvfV1f8C7nQJzN7xfT91yIKVmyPb1rrFqV84Zy75YP+wD/rjPT4rZawrlHT9uq6uOhGaxCje
 WWdfpCJ7w9Z9vbZN8tfzJffEHu3lltStTXUXUTlbfaz0MQpGWsbFNULpWVswpb3nP91WtD11Kq4
 VOMQR0brUk6/yjc2PJFtDgf1l07Zor3rOPuy2bdnid8FAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX3Z3VoKey4X8N
 QstZQEQuYFmLCQQk2i5Yzd494Z464MRXcid/pvhtIzlr1g/O9154T9Bj582B6Jby9Tq+Jfw2ijQ
 z/6R68bcfLwhUdgLhX4TutK5gmUdbovR3m5aUd2prTue1q92lLqxPfkNduTwTXLEJhh4MruExXU
 fSboFkDh4iLHsQzJ3kNmtx1S+W7x84udB4qIZvDJIfXj5f+cyVIH0H/ERfYUPRNV2Ar2HkHz+b3
 2kk93feLQZvpfEuJ/0d8qTOz1RKGwlQgI8yInYzeiyWeuTkvT3XLuWcLEIiP3hBbq7OnPiq3TRq
 Fxd0fDFnZw5OoltOPNC6a3KNhMafWmHEdYJWZtZrCPc/H0V8zrzkBID6g1va0xkhsf1AFFtQ5dW
 4S5eZ6loYndMrXuTRu1h3sKNe+LICEm14udOlBJFuJ8sLGRLoXKU75+/9qZ0EKGeI8wkmkYDbGV
 3BhgarjdLbtIlR+96yw==
X-Proofpoint-ORIG-GUID: Ghm-p96ulJh3_pwZVRstCi3B7SNs5ncP
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b3be7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gsP-wGJUQ9tQerkYUh8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Ghm-p96ulJh3_pwZVRstCi3B7SNs5ncP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_170336_847655_475074F5 
X-CRM114-Status: GOOD (  16.87  )
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

Implement the clear_infoframe callback, disabling corresponding
InfoFrame type.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1798d1156d10..4cfb7ebc0c81 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -624,6 +624,30 @@ static int vc4_hdmi_stop_packet(struct vc4_hdmi *vc4_hdmi,
 	return ret;
 }
 
+static int vc4_hdmi_clear_infoframe(struct drm_connector *connector,
+				    enum hdmi_infoframe_type type)
+{
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	struct drm_device *drm = connector->dev;
+	int ret;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return 0;
+
+	WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
+		    VC4_HDMI_RAM_PACKET_ENABLE),
+		  "Packet RAM has to be on to store the packet.");
+
+	ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
+	if (ret)
+		drm_err(drm, "Failed to wait for infoframe to go idle: %d\n", ret);
+
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
 static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
 				    enum hdmi_infoframe_type type,
 				    const u8 *infoframe, size_t len)
@@ -1660,6 +1684,7 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
+	.clear_infoframe	= vc4_hdmi_clear_infoframe,
 	.write_infoframe	= vc4_hdmi_write_infoframe,
 };
 

-- 
2.47.3


