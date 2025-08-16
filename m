Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6ACCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 13:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=; b=PPPIk+0MFlxJqGJEiW5qzN1AqH
	ZHgIy6NMbrJWPgY/dWaYBSIWmB6xPnivlob/Gy5Wf8XY1VW0QoxN4s/DsSiFWY5bAxXzQE4oPKOoj
	TQ1SJw1dOd/39FkCFAYnaZjH6nkv6qYqvm8QwrJcIMGK1uxtOUTELf2ODklkq9JAEC6Os1n14tWEZ
	69TpKC5bTeL87ueeWPsBGY3rYHeWgWgdaUWsx8Yf0nlo8zDlM3lZnF1RIHIvMQKO08l1ulr9xXSxG
	t00gHVQ3A7YMKr3tuf8voks0uOcDqCAAT/Cimy7d2hDtm5nCuIhzYhBtAPfJfezq3++6BxPi+5BCJ
	1T8MjH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGWv-00000004fGn-1tBc;
	Sat, 16 Aug 2025 13:01:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGDn-00000004clm-1oIr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 12:41:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G7QqWS018234
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 12:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=; b=jqLHGpE0SrHzaNJq
	HvY2s9Lj//kd9ayUo5T8OPj3AhPzFYl9txS7IMbRPU6RzZqt7+fOMKaxzl4F0JL3
	Md4gtCfPBc9J/5TRiTPEEM+9mGTQrg/qRYFui3MXwYXZxi3zPK8yoYlCfZb1HEbg
	XtlcCpSqyIK9ffm6ojJhBnZ5mo5CX+YsJNiTP83oDfa0EJQ+gkujL1jHhB/KvTFB
	0+vgn93l7RW6eJDlAObxdXaXQcIRrCfblub6BEsh4qUsvOUhlSJl702OXvDC8O4z
	15EzQytH+vqquTtxAYCXYM/iv1pXpBhw7joL77Ui1p9iv2lFToHf+0EgAxEhtHNA
	+ErGiw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjy8p1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 12:41:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88ddec70so26697706d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 05:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755348078; x=1755952878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=;
        b=a1OqDQM/fo6USrnHTohdQyyOg4XC0/xyZqRRIMuwhmITX25nvCPbNtPEVDDa3/fdZC
         zhjg+PDM6eD1jaoDZw/dRhQYkPUljM1j3M9bVr4xgfiUJaHhI6YJEYOPTZ/zcFBm9DXv
         f9XHBQ7SRjhre20fd9d7tS0VKJdKuNRFSVl3vO1sKwHHkDhZ6W2cRySqykUk4mWyYxkg
         EV6BJom4igImyTvCfTVjMHDYGYsHN+pmh6ZEH2ZMkiJdlGShS38f/xe5Z5W2+VMF1BiR
         EBESEU1tkqMszPAwkkv+FazfapD8/zHtkuNoXUaaFF5WMWQQ2lAqB9VwuIFscKR2gvKm
         BPZw==
X-Forwarded-Encrypted: i=1; AJvYcCWNMJmjAaQYZZcXnpeHGF7oitPhfPjeZHDOBCrtlKHnrlKmIEu3snHwDm2Rdv1Gk4mM7XrZKJ0Z6uRxWYq2SshE@lists.infradead.org
X-Gm-Message-State: AOJu0YwXQ+d37rKNKAhe3IMZuoLgwZxgqPQUlqnucVGvbQKY4wop+n+v
	z/tDN4V/pa3yMQUXSF8dHfddLhD9JVUZtjvg4GqrB8O3Lejkiv3xzg/A7Ruy3w8BUlQmTJ5uPQY
	/YZifaWnxPIQ27R0dg432oIe6J/teTkDflOEDw/Dzl+g/AT3NRg3w3iIW8UGhboaMv6dF+3Ufds
	rSXw==
X-Gm-Gg: ASbGncu8TQ3JaaZgKyTte5W2uDNeqLfs1kcKog3IwJXtBaWhiVQfF3BG7wCMR/nl1qA
	ohNXBdSQn7JYMPS7Lu4vbofFTVfUGIOhZeus7iV/gmXGgfOlA/hSBT4G4uuQ++ezWOVub0SA6x0
	DBcAuflMGjG1lytOhJQtnP5cZ9du1nSd2njsGpEdkFqZ86ZcZ2o7i6zB7m6d6dF0SgOxFtweYwA
	dpPiI0bYcI9tFVa6Lu1mHWP+eL2xt9QH+sxT4kBJz5xlBW2C/xyNS0fFzTQTCW8kYghgSfCsup7
	sRf8+M1vnB7H2KXYWlXoKtDg1ZJdcVmHzhra+491tIk6QR9+5XDR0EDPAN0wIjGRogkRFPtbrLk
	RheXoawNAj4g6hHZH+sHNIi0C2vChQGf7irmL4n7XNv+0CIkfxwnW
X-Received: by 2002:a05:6214:c43:b0:70b:a22f:cbe5 with SMTP id 6a1803df08f44-70ba7ae7e3bmr68367066d6.11.1755348077588;
        Sat, 16 Aug 2025 05:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKYA0jwLaGI60dgIdc5xLLC6MrgAPeHvs5XeZskw9tq2JN3MW49DplYWInTes5Xz+UumyLaw==
X-Received: by 2002:a05:6214:c43:b0:70b:a22f:cbe5 with SMTP id 6a1803df08f44-70ba7ae7e3bmr68366726d6.11.1755348077082;
        Sat, 16 Aug 2025 05:41:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:41:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:06 +0300
Subject: [PATCH 6/7] drm/msm: hdmi: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-6-6dc17d5f07e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=980;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7pF6L0JAujP/P/iu+e8rZjaaHJekyZiCiogkcTbsoPg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxffZfdznR46omAz//o0FIm9ItgOJjoSW5dR
 tFCoAWaxwaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1SJzB/9MbWkK1MsjNZOw3lcgrUqwdBEMotBk7PI88jIMb49m3q6pi1Ic+1OcZvMxbYHJ5ytFdOB
 99dkv7TMYuHpQwf5giIywYfwW0VuZrDAcFtTbCfvYKHASIQirPoDKIEhTcdtUUOtb2/ESl2OGr3
 yx1San5Qryx+TcnSV2oMfEjDBWqbisypv5F1qp6+85hJmN+eLfDeUNpy9whi3ZoY68pGFz7lzsi
 oCs8KusSv648XcZU8I8UwAZJVJBCPgNenSw72lah8u8Xd/o+1ZjHr39EmwY5SvvgFZNkRmzZSBy
 H/EjRxLrBHRVWid9aiI3/8ORFSsfpCh8JNlsgRLNo2FEBcrx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Lu2S9h6eizC2ViyeQPRZ6uIo_HugnddH
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a07c6e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=gXnERKRtccFGBIMzwWQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Lu2S9h6eizC2ViyeQPRZ6uIo_HugnddH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfXxLs9phRYoWoE
 qvMVQYtmDNK2Ds23oInEy2nup7zcgeiYT0H4MqEF/a2JlAlIV1OZ/CNGof9b7wAgu2veXPfnCBZ
 FXUIrzA4gx9LD4N5w1kmsJTGWX+InClKG2BxDXbgzpi4dd7D2qdFwxPDGt/hY9lmBAhCE5J99Oa
 MhxBSJHsVwdNTqODm5mdyQhQG8hQ7Iw9qm5PypoHLs1RmiN0arhbiwBjKyp+WQkQEv0RX9BpMf4
 oRyiscN73tlp8WGFSITDfrjy8JjjH7BWLEJlnBsfMRh0xVgh+hcG5NKzckiZk5OCmn5egaMxlaO
 PtQ2l0tB1rAaKvc/YMB5qrbjy2c3+CzkX6/EQJQRxSorIE5rwAt5RQkR7+pZkIHluuMzG5WQ/ty
 zQaMaSv0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_054119_635882_4596FB43 
X-CRM114-Status: GOOD (  12.21  )
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
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..aa36d203f38f0f5a197afa8493fafb20cdc43476 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -498,6 +498,10 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 	bridge->vendor = "Qualcomm";
 	bridge->product = "Snapdragon";
+	bridge->supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |

-- 
2.47.2


