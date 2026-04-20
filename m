Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58D9F5A8A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 23:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=cdT4EhKd0RG7oYMUfIMPVS6c+W
	sJWtTQ1SMdN2G/7LK6E67Q8qi+bAymIKcRBRQHn4juhKwk0lwCYEvlK9pxQi/5Ca0OWC0M6egxyYW
	ERoURVsZscOLcM20zjV3AySBkcPeVP8NHLPM+63SPEYrMcAVq+ywzjD2cu11qB2z18WrpKIti84y/
	VEcS4Vb43rImUTILLZTg5tGTazgmtp7q5b+MIyjbQ59zXsOrMvFRR+PzmgI8AvEcMkSpF5jYGMvug
	NEaSMJHup4qxmTl/pVJE833Cex94S6NRH6xo5iJbfBKmNh2PUC1NaOaTrl3DROYPZeYgvoOMQp3jK
	T7aOuvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7w-00000007pCX-3vG8;
	Mon, 20 Apr 2026 23:34:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEy7r-00000007p6z-0Evg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 23:34:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFRT8L1601031
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 23:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=Y69pm4Srn2LCPBjb
	025nTlDFvxjYJhnQGKyOlfHgAiNYtlC/gI/4rGoJzuqRCqMfXlyKM9aTTIFzQ8W5
	sL93/7AMjo4ui/4+2xuW4VoPUYnyo5PjDQyNBUicPT4OoDdgwwgSVWz6xz68Dqe+
	uj9bmjCXEoOI0ldAscc6TGdPSPkjCAnQwmVMtrX5cCyhwXLTEWi5HR24+pZbj5Ez
	OBpAy1+412XNQ/NyPfZek05H29kw+9ojgzeaMvAIfJdzVJjXIoPbpYfiBSxpzbwH
	jqvKl2JGQvPpqMaANSus+/ll75z1TRGYCDHJggWZFK1K8wHFsE29pfVx2PSWDwII
	8S7TcQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh89aw26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 23:33:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a8ea3f1becso10436816d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 16:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728037; x=1777332837; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=OAs2u3qMvhnJHPrVbhlq80Oy5JoQKom6A9qn2TAMkfA24SJbdMfQpJ8YRIs+F8R2ko
         RqjAiNwbLccDxAdlcRV1iOuTgwpnbG7T7a106HcoL5g5h9DuHXGS1mvdu8wO4q6RZ/Mp
         FFD01MzHsdvasX6Jic/aJcH43qyeEmh/zx1dw2Poqp1WRVUGI+QBc5tK75lxsCditq6g
         NXANL4yh11LPb5w6ZKRKmL5U60OoitK2Wlv+35bGpElHseNQRXzIKbU6VzO1ENBvPT8d
         sD4EHmrIuw9xwUl3hP1b2OBRVtYFcP0TGottIXyApts3cES7Wiqah5Y2DcBkjzw2jvYL
         9nfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728037; x=1777332837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=aQLyG2J8+tyzp6ckdSKbHIiiU+ekbCXJ0BqweaIovpK5d7UkdLtLLjo+lDLAqoCD/e
         DTKgP8fyDj3rYCPXKuW49tEbZxwDmUljoC/b74CfBtyQ3mj2T3Bd9cCGFiIKLM3RU6nB
         n6EqTGL8kzalNeR7gVlWWfLz5V7cHzDO0iCugqBEEGfZa3bTtcJj6vFl/s64VrOO5o4T
         A69vlXMETzz/05fIT/491R7wW60iGg121kKB6FBQqZde7BE2wwz4rfWncKpoeD+kKCpp
         X3nzdKbWNCm5CJ0bdDkLi9bWnDImruaojtgq93PTIqPBtDA6drE4BGdK0FhZmHqIRiTM
         EhhA==
X-Forwarded-Encrypted: i=1; AFNElJ+RlCZSV//4lOissrJxDi7kjCZUzC7eR3WqWkiNkNoPFQdzYCnPQy9GOyElKp/eGMnuu37KfiBXAi9YlXs8yR67@lists.infradead.org
X-Gm-Message-State: AOJu0YxIAbXkCKKnb2XNDAETjsr1vBTH4/byoNFhkadY9c0ZWWQFy+6A
	HBCfzv13AOpmyrUI1Ozk6uBsb4m15HPBHKS+c5+SDhAdVi1b+DVOmah6aFp2NNR5YIRSy8CKajP
	Q5JJ8JUNXEpVLn2BLjuQD5xJZkvntCrrG70J9QkWufoM7Cc78cWWW7j6ngajiKyvYmSp3QoAxzo
	m4NQ==
X-Gm-Gg: AeBDievZPBbql7celU7p3JtVKJ14y1M8FKd0iin1CGhQw9Hpzq8oXxhka4po3JtS47O
	W6lnuGmK0exB0fQMIv3St/mDRyZL3cB+utmD11/hOZDzIGIdusgQcRPJMqbRaEJHfHY4Cz1lgjL
	2W0QexaOyk81FaMj9QAXKhsamXJQfZpxRu1E2C/Nj2IwVs4dh8dSFRDHQ8DLcbViseunkqDatBd
	Yo6fRlSGW5awte+yk/NH/TljDaVNPwo+lDZz5jMuF1uObpPiUiD0vFNWQYGoBNo6NuJyd1dyMwP
	e7LkrC/gYT6+gaeYrNWkuWyOAE+TFCLhgx0Mpio54xpnFvMI/9D1KTwds3rtOd0Ma0/OYK68SZE
	tY8kAN6ntsLESGfaqGccTYZe/w/2ukuU8NWsQewtjY6Q8aZ5AzLpnVg8Vsd1t44UZunCNraitBn
	Fe9mzYDL3qGqqMKB0W6zH24ka14Xf8EFyHBKXn3GXZjEXwiw==
X-Received: by 2002:ac8:7f0f:0:b0:50d:6557:5c83 with SMTP id d75a77b69052e-50e36c1165emr201698681cf.25.1776728037474;
        Mon, 20 Apr 2026 16:33:57 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:50d:6557:5c83 with SMTP id d75a77b69052e-50e36c1165emr201698051cf.25.1776728036949;
        Mon, 20 Apr 2026 16:33:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 02:33:35 +0300
Subject: [PATCH v3 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-hpd-irq-events-v3-5-44d2bf40dfc2@oss.qualcomm.com>
References: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
In-Reply-To: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfNYm08F+v71xJY6cvWWJprHmt/2yaesAWq3
 fglBTG+jpeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zQAKCRCLPIo+Aiko
 1XkBB/0WgdqQ1mhHWgsx/7ld0lJj3i66+rbrFpJxidzADlKQPAxm48ED3/gjv79sb4e5wUwCCXA
 /gz6xF/8U0cGItse/+TQFlWdhxMszRjOOrDo8nOwrVTlmspph9v61iJ9K0Xf8OeIOcC7VsdrVVO
 OEJloUwiJIFWdfUu2QyAunkDTkyXzO3iDTVXVcHGiezrOQ5QhoBxoVdYWSRommd9qAfZifIZNfP
 zGytUeE3Nn3tPlgtHIYsjG51CCx1FtdhO4CDkFl6XbOCBym2qudhC9uSPOYMJRJ9fC9dH7pkgyB
 ex0y3TB3oJTq5/Kwh0Q3aj02bHOTscIcHIECopeUpmsZOzeS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfXywcGXq1NAn3h
 yKkZQvX20IAGvmdbfm4DDsuXsbA/Jh83Zm09hY/C7bG2TtGpVHN800+cRKHMmQcJ+tpiPzhYufR
 DdjUWqPLoHKgN5viynqDuJHXtqPAY4H9TohegQYeqv/HkxbXJDtMcX31qZlWrgzTthZkHkfYOpV
 wxRz5AueGwIBKfL+0S3P/KCYC5St8ktyOcloN4KeIxB2bMGj6gfTGh5ZOnKYTwcpAkILOtrxOGP
 Feia2YFB1kKR+XOVupSHqiE3zX3Jt+Hxx4ZyLKsFOYL0yfMZkIZREGTozhrmJ/+TYn6rNBdKsIs
 8BS0fHcwXBC3ijFnKyOE1eNxFxs4vq7D/5ZLh1/hUaxm8cdUDGce4rMJfSo3fFmol8SYZFMiLpD
 5qahGz1E4CcITjg+TxE2PRzHs153AMc6uAlWjrHrPcfM1HBeNVmx7UZJoxOQH+rMJmfgSWPGQEf
 h5LqlXL/HpIe6ezrBbg==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e6b7e6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Y1xKdLCvg7DCydXhnNHVXyXq7RAF6SKc
X-Proofpoint-GUID: Y1xKdLCvg7DCydXhnNHVXyXq7RAF6SKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_163359_221985_C46170ED 
X-CRM114-Status: GOOD (  13.78  )
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

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..946eb20b8f83 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3


