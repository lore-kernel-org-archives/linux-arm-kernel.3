Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096A2CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 01:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qc5ocY3tSciWpBAvhCZm/2AVYNgu26K/bDoBWBIx65s=; b=dYoEvEQw3lMUan
	vF/SHfeHK/TtVuoowXl8A/DsBbv9nlw/f9I0CxLFXCdSA1jl0u/gAX4dRyNvK6md3Xd7pFmVoJXm0
	SasSzhuyJl7SJntLd1ZeotsxMFgrDeQ8QZ8qWdDFD9o6r1aoEqIA+lRfN1oquJKCcRzV2c7FNE6cH
	/s99CVDEFSk266v1Hqnhd0C58Sr0h9fx2YfBA+cdtExSBkY73oqMrBvCV3j33wn3rjsUqLrTsY1uB
	TvU3p3PoOOobUH29diWcchnLWrNgAu8yB85EihiJlkeGAC+rf5cpea0627Klk4K1GlR9+donxUIBC
	2cjbpRSEd1ARc1B0/TJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JMh-00000005sQ2-181V;
	Sat, 27 Sep 2025 01:04:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JMd-00000005sNP-3Sbk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 01:04:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWrRY012042
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qc5ocY3tSciWpBAvhCZm/2
	AVYNgu26K/bDoBWBIx65s=; b=XXxXeZpQoQZGfQAi2J3GHrxvHFMaIqSGA8mLTB
	rnF2pRGvy4DfAWzwdfPwq1G1VkzwbRpa+DNA/e4Mod/7Hg5r4jyvIHCBDIYiVxjJ
	pnYpMjy6S9CKxRLa2Og1MkeO64/smHZWkYXXCODCFETfDud3kKM3TPx0WD0OBwx1
	NrFXorE+zOCSYPwPageBqGT23TBYlS4T4FXqsup/uf0BepZ1JVUjM0G3PFXYZyAf
	0yhiJZ3JSKwjWYtM02HVQDEVOTT9FMznbznv042MZBgS0UH23Ek/vnQs9A+7P7pr
	aaZWbwxX+5336Ur9HGVIokMuoMj+yfa3ZP+n8mBet6CxwVJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q4gp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:04:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dec9293c62so11999771cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 18:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935078; x=1759539878;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qc5ocY3tSciWpBAvhCZm/2AVYNgu26K/bDoBWBIx65s=;
        b=ozmXIgFogfUZQnCpXtzejjI/eJFyp7sha0ydTru88zaPaETVRJnWEHb2vPgpnm51r1
         e2alvaefTzBI8u85TrXkraqK4Eo3r+vDI9uddX8KgDHTkbfuWT60a13zA5jeHSPPVDbi
         I6e9qKy/t4kHgDrU0aX0RNM1eNTSMZ9YofT6tLvLWkcDdWB94xebo3EjPgSjoW9gGtey
         Tkn6gBCOtXGeqE2unVmjz5i09a5gOeeFmkbMcg5mlifkGlGgk+dm7HgW6vlXWyarGHwb
         HKGaR2gjluCoIZcC2y+nnJD7kwden5tkYY3cDIhTqSavv35BattcwQXX4+DfqU4HmvOk
         tZow==
X-Forwarded-Encrypted: i=1; AJvYcCX8uLLZ0pT58Nf2zmIhdyWGKIFXfalrn+xK9z844AwzwcQrkcS8WmipLbbKn7udbzs8wN4fNwWtt8H+1lUR5q09@lists.infradead.org
X-Gm-Message-State: AOJu0YxaOBrovmuOayJ3homRpCuJpxh0ejaeSYePA7pvcv3We2Jdg4g+
	KvEdAoWYkyMYfzH7V8wszApGdsv4W8hJd8BB1a4DTMiq5cncwb3/80DypnWyJwZwnH8gINsSMEO
	tEWLOcq+UalO+rdjoC4Y+hPCW+4zixyjW8CBnALjKVm29NA7gPrLobf4cBWJJEhfb+c6VWTsnal
	vPIA==
X-Gm-Gg: ASbGncvbI7t4Kpg2X2gukGMh7lpYYkdRrHHZlCQ5GsAf8Xm74/AnggWmJAk7MFcHKQq
	OSS0UoAvEYQX9W5H7vIUxy8CypYrFZmBx4WHBL+6F/psnl1hkiASfVAQm9Ocq11AUhMEqa09z/W
	QQN9deW8MHcoa/I23W/Un/EFxIpbtRuxpCU6gniaXvhjSRda3JLoeGzy+uXF/bHMiC6GSLujMRp
	FUznUocwVIojnefgSt3MbnA0dpgCmu6sQzgaHCrcfTxT58yqOAc42tH9MduxooFJLCgfanF9duo
	QwW9yNtYui3v5Xiq4GEDEi2YxOhIzhJLa8x39r4UxP/vhRr9AecYh7sAfI/5R73WC6Hz5SlXVeD
	xeP28Fe+2etj/UHLMJXW4m37U1hUMnJd98Q0rPfJ0QxoLY4s/waF2
X-Received: by 2002:a05:622a:4087:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4da481d940dmr135262781cf.17.1758935077837;
        Fri, 26 Sep 2025 18:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfLcwV5gyaQhWH6cMHnOYm2QjhypSrV9zAMf4Mjq0wafZNaibNe24/I99cJs5+682pxDxsRQ==
X-Received: by 2002:a05:622a:4087:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4da481d940dmr135262141cf.17.1758935077228;
        Fri, 26 Sep 2025 18:04:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/9] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Sat, 27 Sep 2025 04:04:29 +0300
Message-Id: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB0412gC/x3MQQqAIBBA0avErBsww2S6SrSwGmugLDQiiO6et
 HyL/x9IHIUTtMUDkS9JsoeMqixgXFyYGWXKBq20UaQtrrLJiRL87qPbOKHGZqCaDRFbcpDDI7K
 X+592/ft+cVBFNmQAAAA=
X-Change-ID: 20250927-limit-infoframes-2-6b93e599e79a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q78XSS/y8JtPNnJI6s3J7ArXOP9v75Iaz+LCtP6FojY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zgfvqV9tNwSDjjNu1bYmTuEZAt+bf4bJeYD4
 z1GvExeq5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4HwAKCRCLPIo+Aiko
 1YkbB/9JgqkHjaGTaOuUPOXbyqKe3xWoHX6CP+gZcmjWeLTPttNPll9tRPecwLTPJJzjqwb0Tpd
 eqnyT/OKyrEuPOjBZfBfYDV81Oe7BwMvlG9l+8UZrv7ek4sTJTW213DoX/sXyAsI9Pv4Xl9cAD/
 YZdFvqbUbR/PCDvU8iqBDjexW24uxIMybn+ywBSLeIRCCWkLYAkFXuvFTxTv+zAD/rqZXMfU/1J
 uxHBoTMU2CSIFXyngR6Ai9qcFLfRK8BZqqdUtMEVYvWvtKnlcfrNLyu0/IuFaKyobHtojURMCfr
 0qoCsi5cPINJIPi0VMgx0EIAwXBhbcnQKrtLOHJq5CDQ8gDA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX3018s46b/xUk
 3JVL/uncUaaMlM7gOLMGQjFCXXPQCOlvC9qSro7RJOaC/LejiirPBIP37qEdwVwuL+HG29UfqbI
 JctUZ4xtDa/MX+XX1lWhnpBP6zTWbLuhWahozfIt3TOqd9AEDrxFRHa8QodJN8m8OOWpZXzLU47
 apE2ahg07qQsm0INeetQSIGUxsUOoffEoxx+FyZP2lxLxd5xyfEWHobb/sxfooBcnkDe+17I6Sp
 0DD32IWka6jmVnA4aBc5xNzHl7T7AYwvKwzqrjQdVZix6/uxI1Nkn53n+CK24FG4Z6R+l7Kk0CP
 VjqCyYNu7ul69Thj4mxA0yTlkF2GRNKoCbZbqeGF5GyzapI/tn4ZnXAENnpOUw5W/hXfJc/KthC
 /1HBlgVIzb9fDHv2bTrOEu1aZYFeGw==
X-Proofpoint-GUID: Rm86eObKPkol4or_AmVcKZVnwOORmR6k
X-Proofpoint-ORIG-GUID: Rm86eObKPkol4or_AmVcKZVnwOORmR6k
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d73827 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BiG78YgtQv3mHEaFN1cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_180439_878739_F10F3DD2 
X-CRM114-Status: GOOD (  13.08  )
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

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. Currently it's mostly ignored by the framework: it
calls write_infoframe() / clear_infoframe() callbacks for all frames and
expects them to return success even if the InfoFrame is not supported.

Sort that out, making sure that all interfaces are consistent:
- In atomic_check() callback verify and disable unsupported InfoFrames.
- In write_infoframe() / clear_infoframe() callbacks return -EOPNOTSUPP
  for unsupported InfoFrames.
- In write_device_infoframe() / clear_infoframe() functions warn if the
  callback returns -EOPNOTSUPP for the frame which is set (or was set
  beforehand).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (9):
      drm/display: hdmi-state-helpers: warn on unsupported InfoFrame types
      drm/bridge: adv7511: handle unsupported InfoFrames
      drm/bridge: ite-it6263: handle unsupported InfoFrames
      drm/bridge: lontium-lt9611: handle unsupported InfoFrames
      drm/bridge: synopsys/dw-hdmi-qp: handle unsupported InfoFrames
      drm/msm: hdmi: handle unsupported InfoFrames
      drm/rockchip: rk3066_hdmi: handle unsupported InfoFrames
      drm/rockchip: inno-hdmi: handle unsupported InfoFrames
      drm/sun4i: hdmi: handle unsupported InfoFrames

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c    | 20 ++++++++--
 drivers/gpu/drm/bridge/ite-it6263.c             | 27 +++++++++++++-
 drivers/gpu/drm/bridge/lontium-lt9611.c         | 22 ++++++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c    | 20 ++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c          | 19 ++++++++--
 drivers/gpu/drm/rockchip/inno_hdmi.c            | 46 +++++++++++++++++------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c          | 38 +++++++++++++++----
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          | 49 ++++++++++++++++++++++---
 9 files changed, 202 insertions(+), 43 deletions(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry


