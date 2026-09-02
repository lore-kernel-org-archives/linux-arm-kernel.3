Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F16C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OK2sFiDhiyRA3ApBDHP+/4IoRs1xWNu0WL+tMPWx2xw=; b=ZxAtROmy6ElPqqVHYdOUFVUDLJ
	uYKoVT9NOHv9R/ALB9JAovBGiuMjGz7v0fVqk0EwVaIu46dIf4dhC3/7WwYXaeKn2C5woLwz2R5cS
	rycE0v9BBq12uQN5gNeWekpLK43oojr8I5+F+Ol2ZMn4TetjKTxl/Ahjg4TLwV8sKxcDVcT/4Qn2Q
	aPMSjRDED2pGCJdCR4KT9sbKHfS3PoAaUhUYgH29B2JSoR7JeCmg5dafFCuMxPof+H37+3vXDz8uA
	wNMp/8YhAfBcHUU7K/C2iewZt5sTSoPGhVDOtre8kPm49gXasGXoPO2224b2sLPoq4tjnO9TVI45/
	bNzx6tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rP1-0000000Fql6-3Eec;
	Wed, 02 Sep 2026 20:17:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOz-0000000Fqi0-0Qmz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:17:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHiLD2686622
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OK2sFiDhiyR
	A3ApBDHP+/4IoRs1xWNu0WL+tMPWx2xw=; b=Ow90BtABdKWP8vEEbn7t954tODk
	ed5Gq2vRHg44uxceRgHe+MUJEVNrD99ap0s+2bZYF6XW4NoSCd8zgBNC5nAGSu4p
	BEjjuyFQtErp+hmYy3jBNHnfMce3vvAkcX+esB7Sb/tXiw2X9y4cjF6SKw3DLHZD
	LjpyC1/OTGudejH2Z3Clr5w1WRSCPAn61zsEKZHauIL3buq1FRd2S88QjK27Cv27
	QKMF5hjaKuQhKS+hftXVD8l5aYHH2MT/ANXSyoK6bRvttvI/SpMvtlbBDv7W1Df+
	7juJZTuSyv1yUuJ1cMkdiFnI+aJnGWEGzf5C9bKdKtLgWIthSu091fT0WCg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a857-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:17:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af92138f9so432089a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380263; x=1788985063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OK2sFiDhiyRA3ApBDHP+/4IoRs1xWNu0WL+tMPWx2xw=;
        b=icO8S43BGRMSjH65LLM0yXwsS74u+tTk++6BmSSDhXYzgbzsdKVH+WBuIE8Z+sSTyb
         KfMq6pSPM874vDl8LAesSqlTKTll9vcl552BqNbqjD6lGLnw1iZN7RlzGoBF9z+KdbMX
         0UGNoaCq2yR6CUe8jHF4mzKVieXXpuRIXtHah7r6piqNyzViYo2VoiBwp0uQd03N9rC3
         KtHKiRhuzj2tiSa5odLyG/vKnFUXNmFWVyUhEthlALgknx28lMTdhkj+ujn6y8UzKotH
         ljCWmG/o4+LXNH+mBMO4WnotMImb5gUMNcZRnh85syOA0g77CM7cwQg9R9SALxAn9W7m
         4bTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380263; x=1788985063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OK2sFiDhiyRA3ApBDHP+/4IoRs1xWNu0WL+tMPWx2xw=;
        b=Whumy6kHAMMC/1ITAQlCJvkHbcl+wHvUriFr635Uzk+QiqiTFY5TUMbHD1NjYtG6uU
         JlkSfFBYuLpye+a7LUfHXhGa2TXQBwhKLfqX/uxFdLeGrxvE/vvlsgzLBTu2iEjiS4pb
         xvWIGnAVgrmXAJqUC82Pi7AhHAIE6zbLmHadfUcw8mz+6hSOxL08QMAtaJqPWsCleiXm
         NOOHN9bMizPZKzH/1ersxFkhV+TTS7/Z5e7M7aH6/ZwWFH1PGzi03CATYnQL8yLquxIx
         nBCZ4ZamCMikqoYv+Jw6gxSSO289id5JkFaPT5FVpdlnauzjQ92A5WXv+x0lXiPNIe7K
         J3tA==
X-Forwarded-Encrypted: i=1; AKwUvBx5xDFxCPvOhNyXsp1TBNkt6QSDNY2+uWoOeYDcU3P+7IrsSgmyU6V/UfLKyJ691r9NLtzpmhjaf4/3h40XKbq5@lists.infradead.org
X-Gm-Message-State: AFuF++nNdTSqRd3qhH+SDrSvLfJYMa7h460G1D5oOoJT+fez5qWAiGA+
	qzDhRTKGcjhLgKi6GrOrdc8ZnPZyS1sMBA7k7QPIy14HLFhZeboOmYFS/G/4VDh5+3iiMMPMUj4
	AiT8w3g7V0e9pJOk7f8Oj8lO7FFQfFEfforW5mgAcOQ552wsO8OoJqKFEYjyKzFJRXczXG72aXx
	Vz/Q==
X-Gm-Gg: AYBFou0Qm7MTAmDTuQf8QtMltIc9Emd2socaTH/GTIpxebYoSChOAealt2/oJz8XbOb
	TDVpMNEJ5gZzFrxDllY7rKtdakW7lNP24+khpEMyH3NZmVOTEyNybgYUywUF3i0Pu8ry1jI/5rE
	r1B8pPtM85JbT+3ZPqDYfX3/QYBB5Ty2nI4o03UhY2jU2woZ0oTLyp6/mx2LciA+8iuXhO/L/KB
	e0hPRHuEPkMXozVdQyiBbvp2OggZqM6pgwPnNHAOX6Y31kT66LfnXILQIUy1ptNMNaZ3V2n3mUA
	2Ep5+WfDPHg/U7Phw8KU1z4xX+uyoRX7O5KRElwa3TCjmZZ/HlhkV7i/s+K49cLn4ifQlbkNwFd
	Lca0UMr5OkkOsRGu2srIBfGh5f6Q=
X-Received: by 2002:a17:90b:5804:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39b087e4c2fmr1678986a91.24.1788380263036;
        Wed, 02 Sep 2026 13:17:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5804:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39b087e4c2fmr1678920a91.24.1788380262507;
        Wed, 02 Sep 2026 13:17:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 6/11] drm: ingenic: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:35 +0530
Message-ID: <20260902201640.2024648-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KsJ0U5c05weNihbuyMkf6zocM4ziCeVZ
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a988468 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=ER_8r6IbAAAA:8
 a=EUspDBNiAAAA:8 a=iWCwWg-Lr60CcT_aNAIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=9LHmKk7ezEChjTCyhBa9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX1D08GOF20ZA3
 2GqU7Mb42nX8dJdWJ7b2TWaYuELbEqOiEL2Yzs//jtEG7u+BPWVZabxhbiKLzJG4ducBYSx25tr
 qaj7WtNa+YaWJwZ9obkyjqEgo8jI863pxkKh6g+aes5MChgrYFmC9lYtyMcRrdzEB6JaHhrJ6X/
 TJ9DVMQ0SNKHy+/24GeoVNGg2gJW4lhj7OXRmIRyOO7kYhcFY9/zomGWb0yuXEeg2cHh4hNXldI
 4n5ywexRvFtw94elcIap9JtIxpU2G6H2uT/2xhgF5X7ZBkZF2t1z5tQPIOXxPp+faHLZ2BYIUYV
 VjxNV4NCsStDfvhvGmvhLoj6dIz6ManaeRc9JVqIW36beacCY/iu5H8IhtuOgR+oBLszkz/m4ui
 6ZP95tpEqutnMfeAboEMbnUfnfEu9d1tcieJ0r7DcZXS6gnfs40Z/vv86QT5zPq/yXKaRvREQM1
 21bDC2DXsNF0Ozw4aVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX3/qls1bEQbbY
 o9jjXc8C02C6ZYLiLqRsnJqK5ROy7xUhF6/eYXMy0r5/GVpvGigeB/UAB6dfsQdeUNTM9SBY+KY
 2b3kCpjY8c1L/8NHsfpVXzx/hoSebsc=
X-Proofpoint-ORIG-GUID: KsJ0U5c05weNihbuyMkf6zocM4ziCeVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131745_261467_C3C778E4 
X-CRM114-Status: GOOD (  15.37  )
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

Replace the hand-rolled devm wrapper (ingenic_drm_release_rmem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource
manager handle cleanup automatically.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 738a80b2550f..2c4dd6ed2d41 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1060,11 +1060,6 @@ static void ingenic_drm_unbind_all(void *d)
 	component_unbind_all(priv->dev, &priv->drm);
 }
 
-static void __maybe_unused ingenic_drm_release_rmem(void *d)
-{
-	of_reserved_mem_device_release(d);
-}
-
 static void ingenic_drm_configure_hwdesc(struct ingenic_drm *priv,
 					 unsigned int hwdesc,
 					 unsigned int next_hwdesc, u32 id)
@@ -1127,16 +1122,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	}
 
 	if (IS_ENABLED(CONFIG_OF_RESERVED_MEM)) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 
 		if (ret && ret != -ENODEV)
 			dev_warn(dev, "Failed to get reserved memory: %d\n", ret);
-
-		if (!ret) {
-			ret = devm_add_action_or_reset(dev, ingenic_drm_release_rmem, dev);
-			if (ret)
-				return ret;
-		}
 	}
 
 	priv = devm_drm_dev_alloc(dev, &ingenic_drm_driver_data,
-- 
2.55.0


