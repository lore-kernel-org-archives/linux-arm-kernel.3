Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12CCCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 12:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZCDNxT84H8d3+/4n1AbLc028ffeXusnvwh4O3/fxcY=; b=friL2r5JRo/UfsLrsZDCTIEaI5
	ZX2p/4M3GXNliXCsktiFRGJGag1IZvgzDAmu+JK7eyC69Au4XDwOsJp83AtKeXGU5lMTqqa058xKL
	kg7gkiWCTy9p3L1xr/nhuHoh8+j2ogcKB19WKA/t2kkfOoF37t7uMxEYfxHMSATlpNn+NQwo5y8+c
	5Geh9dbwY8TXz880wAWq5+wSeluqpQZ/cXR2JNLNPNlgyfP7V5Iv5WycsP3HVXYgxmk0iDC8bJ5ol
	EBUHDc8y4farbzwLtjzt4+XJlULqG/RRmjkIHJgGbFZQfKvl8seJYt3Heg97dcxoTcvrX90lXQxt9
	V+3zrHQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGRS-00000004dyt-3F7s;
	Sat, 16 Aug 2025 12:55:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGDk-00000004cip-11pm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 12:41:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G4CRr5020810
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 12:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZCDNxT84H8d3+/4n1AbLc028ffeXusnvwh4O3/fxcY=; b=VLW2ErZdpDCW/AKF
	Eb4TUwL8MjplBqe2x3FPHhRyH48tvPOKFwg6snGM0nNz6M7+j5WEc41zOXhU/0Sl
	uyBkKXDVw3BdQoyz0PEzfSjgKJsxV/Zurr0DlFa9070Z8QAnIK+KCxAPuvEt0UlY
	CGp/AnaoxY2nujCPlmjkp6WdqZY39FJa3mY2LCoS3ZeESvZYGPsrdUEdwHVhVlot
	SIPNQ2rScWi73XuMo2bGnNJVaYPcaicVStR8wKdsWTaDwmWErwJN8JNR0mU5YUDi
	9B8PIxKed0FJzbugqGtjwSa9Paw+pM5ln15awOAH+/QDuZ96galVAtxhYmkaYdzq
	G1jgng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfrk0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 12:41:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109ac42c4so28541161cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 05:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755348074; x=1755952874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZCDNxT84H8d3+/4n1AbLc028ffeXusnvwh4O3/fxcY=;
        b=WpZ6d1YbSvP2Gcjl40Hs2vInRMwO7Xk3WONAbWhTSls+uV2ZWmsrY9gAazdMbTJ72m
         UTIi2Euqo0wy1kXSKZ3XBEb4XsobCRABzHfOwUNMexkvb57txfQJn/i4TJ5MTd4x7L46
         3wZYcSY/OuuoKw3Kdow4ywmW81dUhne//1KhkagFh3Gse3U6w5iqcS+RuHMn67NUzuwP
         AdDWT99/OcP+sTnmEr6NdfTGQiUGpSSmtWuonaiW6TB0y1bVAwYc/kfgXRelWzXBcrn2
         PB+c3Sy4noTSI/zFw6jR+oLt1rykvQVspHX8bdp3b4+3ITk2kEGQ56fayckToub0sfyr
         6brw==
X-Forwarded-Encrypted: i=1; AJvYcCUR1VFW97K24JWL+qw9b4vGBZ8uR6Uk5L6cVcaEI7YiIbE9faj8gADyvz+LCK+FwDGaZJlIEYIg6t8QVy9ECLsi@lists.infradead.org
X-Gm-Message-State: AOJu0YywYqBNILNtzlQNXThaHei73eR9juN6+KURn7kehdZ0CJLd4AIJ
	lFakKYyHIpCd7V5NyqGii8NdwhVqepbNpcO/jfp927kKH0ylCz/0ZUr1Gl5frk/UO+VI8fGJVwQ
	MBZH5TqkICsYRcKG6XcPSjPbTLzIHIXjtMJ+b82x6C6+tGMOi2TcdzgzONxDafbPA5xUjIH4Ox0
	wgdA==
X-Gm-Gg: ASbGnctCJEMNLX+0Q3zIYFVdiaaTMsBJFT9LDj3yPJTS9loY++timI6sFa5gFAfLeFz
	gMgvZHvBMe0GKcI32foM1Qttb2wf2I1Q5+E0pBGqrgdkl5pkX5/8dLWS7/CjvwcZ94ZlhgIsIZY
	2PptxQmMPMv67Q8Ai4PMzlNhcAuBkvvg7YBLyqQzQqGkZIjmux/dCwNPD/l7fSbIJVSSCVmr9+o
	7+XUA72fYbnESjs1FCGlgytWBd5gRvu3m9QfR0QZ9Xv7ETclgOELh/iASg9KLnKeWac/TlB1MjT
	7oe4+a+Aczn5DQIWyO/RQ4n58HdTS+aaUQPdXUfBzrxM/BTk/X7cQCa0Vp87un86xnV6rImpaBg
	IoOXKpBsmAFp+8gA+gt3mt0eppIKQu50QFQux2SI5+Jmv6qGbjNC9
X-Received: by 2002:ac8:5984:0:b0:4ab:5277:a5ab with SMTP id d75a77b69052e-4b11e0c2db9mr68298261cf.6.1755348074331;
        Sat, 16 Aug 2025 05:41:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq+2D8bA6Exv7xwHUunlo4e1X/zZ2ZI/TlCYJHV66Jzf0On30yfS3pYH+kbbOYRboEDBH3bA==
X-Received: by 2002:ac8:5984:0:b0:4ab:5277:a5ab with SMTP id d75a77b69052e-4b11e0c2db9mr68298071cf.6.1755348073839;
        Sat, 16 Aug 2025 05:41:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:41:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:04 +0300
Subject: [PATCH 4/7] drm/bridge: lontium-lt9611: declare supported
 infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-4-6dc17d5f07e9@oss.qualcomm.com>
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
In-Reply-To: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6MDUGd2gCI/EsaEXrxZU0j17Xf9/Klm/EGghvRMYY3A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxfeZjvuIKMDxc3NNDqA14HuD3rogLXgG1/x
 40vIEmKjtmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1Vr7B/9KbGoKGY0G6Zbc0PFJqwOln6oTx3g2EnrCz9bTxS7nuNcHvo4V4hVcxg3JHEn9XLW0aBq
 rcL64poAiL+A/Tk7OSFz76/ZS28ruSlHbEBfJykODqDlllZ89HEWOPZeQbxzH/SHmsO3bwa6Vzs
 gl9U1/yEFKmMWqDrHZKk7wJ/k8s+PAu66cGZrI2IJVQWiV6Or4n6hKa9wvloaFF7hKJdMqEUi9B
 QDjr0YsT5PqjevpATnBWoALz9MsgAIXYPDNDAsg+k9oWjqPJj9FAQq5ZHbLj4bCTPqetj50s9NP
 5ynpi+G/iWc0A4DOc71d38M10F3TXnligAlbQthOBFCoGKJJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: T61EKHsF4l3ZZEKPbiVAGdc1vkRTvhhm
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a07c6b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=AMvF8s34Jxw15HKoVo4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX6fpWHrvMJ61F
 7RyUtcNJV0zNvN6auf0u3s6ngdKbixx8ZduSJ59TOnjCuxIcnZTKMm2nfm7hsWCtVqx5zyuJF26
 XZF9SAL2IP3J97mBv5mDlIngULflxK1UCcNBTobZLDHMfVeiZvOAy98Bnd9ftity7690UtW05Kn
 tpw3Z/SHSYiwSou/xnNnCV56QPGA1haFvzU5mebIONfauOelsR+C9Mrqs1ZIEHtz77GQTGLb/ZH
 JMDW7K7tbdKjQTYdyArw331feD1+Rlkrt810BVdypAwNQLCn1tjfZCcnTubQCm8A4mE1DP9cSkm
 7WDArzo684BPW5avhCiln7rjNjMeRmtbak/Jp5MTzgpn3L+DwCapmN8kN57XMkOdpGLLjau2LDI
 53F+BMuE
X-Proofpoint-ORIG-GUID: T61EKHsF4l3ZZEKPbiVAGdc1vkRTvhhm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_054116_285174_4D3C1185 
X-CRM114-Status: GOOD (  12.60  )
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

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..08cb6958b9154dbc516aeb0623a8fb5e4af1df92 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1136,6 +1136,10 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR,
 	lt9611->bridge.hdmi_audio_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;

-- 
2.47.2


