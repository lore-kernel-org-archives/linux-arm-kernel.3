Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CD4D0D154
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=; b=amz878Vjzr5FTT0BVja6o1SR1Y
	pazX7itOT4x5rflx9T6JAVZnS1lGPf3Of9RnvQbKTEskvtXE2o4jqfv3yYPUbIvrMAs8gy69aC3JW
	BrvssSHizen6fjGzR5VgT7vJFXzTBg8guZqXMPOwq0gb6zDKrY4R68vk2bUBFmhYf9eICWjjh3lHs
	NIlK4DJRMjCd8YclSk3tkCQTQAod7PT4bFq2hH1lm8EmqSQ5SBniKgbDdzqerwB3deRPPdowP2P1Q
	AOJg9m5p+FqMFRsIn3DvePUykl6NEdIT/GLvfBamFasMKTrPThI9cFAJ017qf1hpoV04AjSPgw/+h
	1R7RW7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY3u-0000000FROi-1yG5;
	Wed, 07 Jan 2026 18:15:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY3o-0000000FRJV-0RvE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:15:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H3vcf3049898
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 18:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=; b=LcvKs90co5qyoc2Z
	d/DIjr6T4wp6peOapih1HLy3dVAbvLTC7P2Kndnry/iEomJs8OzmIVngr3ixTOg4
	tVc0xZ0DdmPlAIFS82JO8PKad+Hq37EPFHDDYa0GXy6zgBOnPD7vJ+6HgBeCQiT+
	G8XV72EZ8iahnPwLPnscVkw1z9E1UZMXnq1dgZHv7GYsWAjoLBiC4TN5mTDh6g/J
	6uEGqMsEJNdB6obsu3FYwEUHg8rQ/O4SdEcPEIwhJuQIkWpFmUB31BYP1mcGpKNr
	8ZksV4agCherUaArKSC/9gV6QqRKNRz+GmwyFyV4PyNrFAU9PP6VNmmcPKTYAFYo
	Lf4E3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhujeg8h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 18:15:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b259f0da04so605097985a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 10:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809707; x=1768414507; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=;
        b=PTrkUbv+e5Je7oMJZgUJGFRq+AjyzzaPV20IwWOUui8v88H5My+6T5/cLPZSPWt7Bi
         nV2zSGlfYhnRWzz6GWL1yCX1isucLl991nQx+3/1a/5vXDH3oBhj3/fMyw0Dx6qvjqHo
         rI9rKcyUYcdvamyxQlUIW79Y+4AeKtdlfRD9biY6ZiXnoIV4LpX12/DeetJm+S9yXbDa
         5IxRkAQ4n0QKpt4NwQ2Tv2/MHXgXvtPmVQQxo9d3TGBpTdRH8aBPKEe1DQkoXZ8q6G9W
         IvoJ9HpYQXaDPAntUSu/G/nZaq5tSNAoQo7JDgojQxRm35UJNGvKx8BEZ2jaKVdo5nsq
         fTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809707; x=1768414507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=;
        b=a4pn+O/ab6Cce+V/C/VZi3rB2/8vrAiBIPpE0Zw56gFsYXa9AlKIDVwh7yxrfjQdah
         ZzX3nLfSU7jcJBAkkbiwKnIADD9cdfBJumaQ5vJRp+ygLHojXfXrHzVxQUKAiVdYdfgf
         Fq2vkf5bKrvWoeCqyPxGE2OcSa5mtuZ/H4Edn3obPCOvTIEOYDLJHfTOiM6iXXi+u0YT
         w/gLg9O7GA+hNSKWR9H4A7YUE9H/8dXk50CWtSxrT0kkqEEM2I98nmi9w6BFv9w8jxzJ
         7BRal5kGq9we0OlZfu8d9OahECI44RI6x7reAbs2yHGgOKQ4CZGAmAEvtComQ2Ni8N1N
         E5CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtoKN4xhqSQd4Ie5Rv6ibI6ALDGwCTTovHRIazGgwQaD+k08EPOmHw7+uu9Gb0lsUMa/dotDMqBLchxhcu0Xmt@lists.infradead.org
X-Gm-Message-State: AOJu0YxeiU+q+TZonX9TMiT2cozjxp1e08IHArrq/eAt+2aBQHwPHpIK
	Z0Zhi7I3zxyEnlw3JlSP6J4U7lhbaIGvw84hv5PUUS+pGoAw2WeBWzhe85s7lo0M0duaIeeiB27
	ZyFp2geZK9pmPJAiHGssaqzqnbOEfrHLlUFymsbZt0uyO3tRLugAxQr/ICma2TRaiH3hyDs9Tur
	ESJA==
X-Gm-Gg: AY/fxX57ecbBVNnWKfyTpspGV0mwOb1jp7reNd1q9oLCoHfZWjvZ7l8xfdVPXkcDBQK
	TUOheYDaLR7fgFbYGYUcdQbQuJRPIGHfhA9p/8dy6gUWvQO9o++0ER8ruIKKt8vS47gu7LtXqvo
	KrcxWk+KnlyV6Toi/rbuxlgheyZn7z2gbAbB8QGbQZBrs3/XEFBcs4uJiZ+2jMl05pbUSQ0bccu
	+FF86nGN14qy0BAbucdkrfJLkPtVrpG19ofhQcWbcMvcmxmujFUWeASjl5V7PkvN7zQEtbB6Qxh
	13w2uw1HuyKqHpIqdUvFYQoneAY0E8uSLMq+69SxLFuQdj4MoJrctDHE+t3ps7QzVH9+B7E+IxE
	XZGj8hpCAp3Ga2pHIMQppAyBTJFSaiXCD4TCZnozV2Dq2td2VCnxu8+U0Hz3SSRPYIYH+RIbnAv
	8/agrobysfKk6wFBvMGCsLIJw=
X-Received: by 2002:a05:620a:298c:b0:89f:5541:b5f5 with SMTP id af79cd13be357-8c3893751a1mr451572285a.17.1767809706387;
        Wed, 07 Jan 2026 10:15:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErco6iIlONdm8FoPmBoVGT4sMle7p6Daei/gbTGJZ8AsHe90PS3UuyAzSsRgYRNtmFv/UWZQ==
X-Received: by 2002:a05:620a:298c:b0:89f:5541:b5f5 with SMTP id af79cd13be357-8c3893751a1mr451564685a.17.1767809705824;
        Wed, 07 Jan 2026 10:15:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:14:59 +0200
Subject: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YjRxdH2GhgCXavyWIwCH6N3bsC345EISvDP2gtesFFg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKkcDiQpwhgi0U0jf8JGOrxJBwtl/l5GypPK
 coPxI4tELuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipAAKCRCLPIo+Aiko
 1fRWB/92FTnBMUcYj37wwL0tkj2+9WhnXCNr6YaqOXhJHzBvMN3Ric79sLxWIk6V2x3r2jYCRTc
 BkdlD9X0pnL+Hq2degXIglnJH2gA1p7PGCVq8s0gm0v1ELu41JL4luLf8f6sJieWu1QXoaJk5qP
 79zPwaA5N2vB9hfx5p+R6t4e8pTVe1kMeFaRCUvqmAe1Kovi1sIZ1KaVq04n6rv6Vhjro5yFiFn
 LyRakv9HjVWBfthh1kbm1YCWTU0Rh+rmb3pMmr07+I6SSf6xRRJ0Yq6B0EcopvIhZhVA3ayoLhz
 savBzIEyxFTHux8IDyABCGHnOtOfh5srllF0nQkfQKf8sNtQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WKNyn3sR c=1 sm=1 tr=0 ts=695ea2ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gsP-wGJUQ9tQerkYUh8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: E7TsA98MT8RCQXZDawDyr1DtSwvBllHx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX7Fbj8Ml+kciA
 cLLUkaKI/aVNvqbwVy3CE2SyTAD+vvcLkCc7RjObkUJwknDft/NvxLPflHO1cgAIcsd5r8zG3Db
 sllNFAUvHFt57TGMpat7GszgTBG5s3KhDVeZZ/Kc+2/9JtVDeOZoweSWC2tLlRGb98A1iRtUzR9
 4AeWGIA0ARzPAS+MaNG8ukJXWuVxKvlRU+xB6TQurWIMFPbHtFLnKBFloMUJi7fmFmgRmjvY54k
 IAIxexghBGAq7W5OSIeer2zQJQ0H+UghM26wJfxOT4ksVlYn1gpucJOwgxNi/mZx7xkWmgcn/jd
 SgxeLOm0bZQUSwF7BLa1jyMWVNZTm638uAJhz1GofEIUoqve3sllKp8ijLPLcGPRGzyHNd31S8X
 71VqV071L+U91SPQY1jVcjDIvPrjTNjXmpMDcYGFaCjGqep/xPPpcY835SIBfz6HtARPe8bwQBI
 q/z2EwODOhcXXeHSDyg==
X-Proofpoint-ORIG-GUID: E7TsA98MT8RCQXZDawDyr1DtSwvBllHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_101508_150381_198AC97C 
X-CRM114-Status: GOOD (  16.24  )
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

Acked-by: Maxime Ripard <mripard@kernel.org>
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


