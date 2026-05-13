Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843FCCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=He0idV90wiRuKOqRz+4eyVeruI
	FFZY3K17XQij+TdNqruDGVw/dyZBsN61ZVYCu962pKTOWEz8XXJi3tc3DUjuqaPNfho4whIj/Rd77
	cuKyQbFIzhTkfBnhCa25iqOkkv7xW/45Vwsc2NtT6t1Y6O1Ft2e6ZuB3WWoNU4gHFXuG5ZJoXqZgC
	zABBryQTpTTVlIJBSnMidUwCLU+Lg3WDaEBSWsPDcsfltmNSNZdrTf3m5mEWtyz4K3w31hh/f8miq
	+G7kPVZM3qAD9vPL/rAIFvg1e4IbEIHE/d81ikJPYh649eN9q86EOhqOikAACOvavrnUGNq9sVSx3
	9uFb1log==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFh-00000003SY3-3tZj;
	Wed, 13 May 2026 18:24:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFY-00000003SNg-16si
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:24:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAsDU2524326
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 18:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=adOOFUnqD/cK+eQt
	lzJ7pMMU0fq91KwakaSBkYOagBIE6/8cH83nWlAgh3JSK+ZkPY4lAYueqom0Oa9f
	wc0pEl0e0UaS0c+Kynn1xjQhLjmV7cdGToDW1gWuSiqaiuWP4AmvLFddcO31vAPI
	WxptBTOrewx+2AHw1RuIc5ZHyq9RjarZWhCQo7wYpRN/X2Jy3TUYWOAnur1+AhRP
	8/4VE+NdttnJicMKGweDNaMHGF0o0bkdvpC0g0eExp34w0X2Tt7qclAjhSXjw2ih
	g1GEQyi5cDWpRFm3VROExFq1gsIisJCw1lhQn4ZCAxW+/hJapsL2ANbARxN8JZyS
	XyYgDA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjghh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 18:24:03 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-956732444ffso11880109241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696643; x=1779301443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=BMkcAdd6aTHoiWRFrQhmT8DPVsCykISGzicifRivpaPraLS2r519r0HXBFeW3JzJiJ
         fYfj5lKEoHtPOE8uIEFzq9sWrPMPTf0GtL+m/bLYqCfUKFMUeQocIgGPMnwoa/a6CFU4
         5o35EuPeFD0pvYS1i6kfuhXlU0YhxXLRLFc/evL5dLXixIobbgLOeGsEJyMS8saFqLrD
         dxuPk20tBoRO807D5D9BJLji/cbKr9zDbg+cZELPDVSVXxWatv5Kgnvyc5pwZ7WaiD7T
         vPVbaVSXPeyGQn0n7skDrEpj4HqUjKF4YpCJtu3QQKkT/4tRBBDrtX86vlP2l70GHJRI
         Q0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696643; x=1779301443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=Fj3vKT2QMSHiWsT9fsYpGnZLYZYABJohZBDsNqcTSHMxiwta1ysaEH2a0pa3j8P4T1
         vw4T6oy3zKHJdKF+ye0W/+u1GRETAXJrzMZrdcG/ICORppIKcThT7PKCFJsm94e1Ctm8
         yco7/Ovs+axLZL3x/XBRIRM1LqeZJvkAVg6Z3aTN1u4HeYfAgMJCie12E2gCuc+3t6gV
         UXD93/4QfrU3JTyrYsUjMDCyizU7KvsQwomMi7uT5nubkqHVEhSMj+Stuyb/KuUUrvlK
         j451iYdsrMUDBQGOtkUyGQ6dSUf36I5rC0WWfBc+uDQz3cvtFJZTi0nrbu9h4tBLVdYX
         keig==
X-Forwarded-Encrypted: i=1; AFNElJ/fo/Sym3KdKspuz8b3wbSJbdttbIh8nYAfkNyNDw4PES0iUq0vd1cjwFnlbXV0loo5WasZuyWPFJFUhoNGFqQF@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ7J5r6yrPn0d/QuwWWSL9bzOhfP5ZwnFC9DqKUsxQbERPwNEN
	kJhAXYf53MRu/RP8+b/m+w/2BRXdmgVxqkhC7Dfj8w4uy1E7CTkJ0dnYLMg058JBdez7GSecNpd
	U2q1RooBjZ8jR6RYnLFrhiKKvzDqEvldug9kVsSfQMbZLSTRhfhofxvplIkyjtK5M0cH29bW9dw
	vRLQ==
X-Gm-Gg: Acq92OGJ4641Khjb+E9INbB49n7+LF2oT+2b11y5V7sKOETqc0WEHHnP80vHyz7i/YR
	ZfpUGGBZ26ZYn5kwSOhhFOJQ1JPBXs7gsTmjETNnTnhW/SDVsth9/H4LhbrrhMMhOSantfivXDz
	ZdxZsam+lJTfLqdUNN9NfrV94umvet2z1wpAE7pTeFX2tbjp1/dlqHdzTnrjGql0luf79tpEqJg
	wWN2axKSupF2wu91Rh9nqQPcpAEHCplpcrBY2MjwdbGxVhnqp5HOSz4SDhMfcnD6n2f/7TbqitF
	tLJ65icxouFP/egwWm6FJbT1czdDEwhFo3N0utRUf+qQSAJPQ0rANchaVJj7scgHcVWfDAQ2H4Q
	/kEKZRPihO5WWbpBj7vCaAgt7y1XbCQaDqyotYnkfxJzcGOOpQGKdO5eQ/Hus0uB+LB4J5EMsC8
	VoUTrsiE2DutIz3c0BUZnTvKJ1kzk1c6S02iY=
X-Received: by 2002:a05:6102:2927:b0:62f:31d9:7bf with SMTP id ada2fe7eead31-637754eace2mr2861789137.17.1778696642550;
        Wed, 13 May 2026 11:24:02 -0700 (PDT)
X-Received: by 2002:a05:6102:2927:b0:62f:31d9:7bf with SMTP id ada2fe7eead31-637754eace2mr2861750137.17.1778696642033;
        Wed, 13 May 2026 11:24:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:24:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:25 +0300
Subject: [PATCH RESEND v3 5/6] soc: qcom: pmic-glink-altmode: pass down
 HPD_IRQ events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-hpd-irq-events-v3-5-086857017f16@oss.qualcomm.com>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
In-Reply-To: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0drlwCbTuEWcWCuHk7pQDuuarVA3oztNqH
 T7Bd2hVw3KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1RL7B/4jgrhGIEZynL+WT5KesqjMHxOK4WlzF0fcjJVPHChMLdUytHaxmufdMqTgSy0mcUbDBn9
 6q+vvyQ6qYt0ElA3eZFhzZswAyCgcR8e4VTK8o8hpdhNHHqN0OnWTYPFN2SHs8+2VNdnQpl3rl6
 nMO0qA5XZZ0N0MW59OPPIDbL7bNNmFqUKmIe2WCRfvquF0In8ReMbRiQJj7LkMVsU4X/WUHvw1c
 D8V8E3vb27NV4op4UtcX7LQjtY/tpC3kuvEBz1k0eDC+LlEa/A9pzrNHGsDflhVd9anRh7OF2dP
 6y+RL8SzW1ovqNGn+6AgKDUbs46tJjRUUkfsmEfNEOEnsmEN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: FgkAC4E8HsvJ58kbIdZqpKSJm8oN5q_q
X-Proofpoint-ORIG-GUID: FgkAC4E8HsvJ58kbIdZqpKSJm8oN5q_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX+NpFzT7SAnHK
 QTcEA/FC63uvsurJ4VdGtltdPChoEkkoc+gfiFOztFDvDgh6mPML6R5bnUrWNF8Mq+wc50qMDZv
 /JP0TBzXpgAfTI5VYvp2L9+ZDFWgEoMPeiz8AMS+rG0mtXEw1YcVxVr1LH2Dv5eiYHmGj+nG0QP
 mOktnuJjYLd/ZJfxeq8fP4QuNkMFZUvO9qJAOlcjflyRYUQUJ9zA+3EcPEFrcgJSASVrpSfY8Wm
 RgFfakLWs7GWPcEORKZrH39Ia2C+Lfs4z7uupjuZHBzKssaF2yOTFmL3qZA9Byb5RYj6tp+dcb3
 FKlZ0WJ53BUvQBUKKpnx5NPQN//C0e12Cn4+p5AMMXkE3IxWSwgQ6HXKOufpw9/jhYpkEv20XmU
 JqPIbLky5ugiQH2qQ6EdsD9dGdL8T8O6cUAEDXN0ip6QXLGLQgkBt9cvPBuhracSD3yCg3ae+9R
 qrcFHCVSWKcervJXMfA==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04c1c3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_112404_469526_9BE6B388 
X-CRM114-Status: GOOD (  13.75  )
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


