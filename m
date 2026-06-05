Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C191CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5YZKQX2ZQaazK+ofLFvgf66g1BJkSfhht9kOwrmms0=; b=1ULwDMX6ZboZOrkEcHmvhXDMg1
	LXDNdYqnbmY7XJkWvGouef0MUtpUQCL1OSu/fJvla3nxZYDDmXEsamhQeMnVOFMUUsu8ZiXWBgBG3
	y90AD6D2kCsAUBzZ0eToNIi+YWYWwUuMDplCsmjMZO7irsN7jkIFvOWIB+JQh9u7+vh29GhsbKnwp
	LpfWFnw5WVlOdUdVRnzdIflmSeogNVZphk/uZK0Cx2KlxjcVnvCGQ5TAN9BYuzGGnAxQpniCI0I8m
	oA6vL+jvj2vDhbUcmQZROEsfhul11NeF7yjGPzLJ1jVc19aZVeYJiwE4BCLVJJCuknyv3rj3m6ZwG
	LnUBTAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVReK-00000000TTK-2K3q;
	Fri, 05 Jun 2026 10:19:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVReI-00000000TSN-0Z8b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 10:19:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6554jhwU2668002
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Jun 2026 10:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5YZKQX2ZQaazK+ofLFvgf66g1BJkSfhht9kOwrmms0=; b=ICYn+N7myKnXgswH
	bQo/8lg0kxpiIsoldDGC/gCBvv93FgpFUDsZiqWxEW5IyZI9xSmOtpZ4LIwn+UzD
	YD86S2Oh7R5qvswSwd9/vySzJkbatdiifBNHWj+VyWU+lFp5rh3jyoNMKl6+k92b
	Bo0uVS2dDPj1s7IrkaKU8MNvuhBDlbW8mzjGJtXvhtS7RM4WeWUVey8f8JKF0BNo
	HVP4MSj79zvTpbS2ZAmCVQM5pBT35uE1OmPx17Fs6KQgzvNvzJjpyo6GBLIgAC1o
	jSy5twHm6Kq3/QkqqSVuBPtfaRUZdTns0JQnGWdoTxyagp5KZ3XwGtO+63ujvoM5
	gF/90w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekemyuf1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 10:19:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c36f4b76so18575435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 03:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780654772; x=1781259572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5YZKQX2ZQaazK+ofLFvgf66g1BJkSfhht9kOwrmms0=;
        b=YgkO/MXPGTkcE7w9rWD6aYo6XuFQMVRLJ9/oETwiJQMp+M5llniv0gd0x/Fne4ZxcN
         65Ja9gvaUb80HAKpNYUSkf6/LExi8oCgKJuTl95YBSIkn7yWYL8atQ5OLRHU0+Cas/e8
         MwN3szZnxtXBnVbkWNZMwt0zWwZk2Nqr4E4oYIt+Hclqr0lmAg8KL1voP0ZSqTGL0p6V
         hX1qVmCuOvBS//+VAyXDplYBF+mGHoAVoIxiQ12kOIpM6jzWGwbygdF9jNqSc697m0r3
         x9P/loOzpiEupwr9jWMzw+QubJq/WJAj4LWbgQg9vInAoZDU8UbVLFGozvsFAIwSLvar
         Yjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654772; x=1781259572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V5YZKQX2ZQaazK+ofLFvgf66g1BJkSfhht9kOwrmms0=;
        b=UOFcnza7Ym9aM2QHL+H8kfOuktUe7qwTnv08ukbyvxc8KWcGTXbUHbBgp6LBIMKPeE
         Tfgn+SJqwTY0PWRBgfvTWpk3JP2nr/sATi6juvwGMkiaArzH8q8ZOrSKqT2EOl7miGD5
         PYJeUsRieChnAQ9H7hHJAAx++CPB35Pk1NUZQyWPxduPn+UII7fMSa6/1+HVy2gliZmr
         xgpx0ZuNcq07J3WROY864o8O5DO1L3e+MHGsu8xeMzLPi988iFtVQvBHL2ZxnDj3W8KW
         nGsjdNEzFEj598uWjemZojstwCsk/eR2HXqajWBMxApLdgLTipUVXXCXilB6Nk0cFfNr
         eTjA==
X-Forwarded-Encrypted: i=1; AFNElJ9P+ewVzHypfh3xOiJw1sJqGk3mMolQh4opk/i8JQZ8pvu21eNQceJFA8+eKJtKIO+fyizlD3YmNUA1txrwIiCw@lists.infradead.org
X-Gm-Message-State: AOJu0YwbqfldAGXzcOSi+jf7k6gmsy4Y5fC6nj7yReK0ayocmXta7yYg
	3XQ2TNBX9U23MXiLlAgHoJNATUGOGxoJwwzHfpqUMvTicSAmOUMxIgfzMuts0m5V7TXePhZL24Z
	rDYyKVf3WkVqc1vKF1DZi6OUxm39ZYAr163zi5GT2Fhc8zdbhXzb48HWeKBCjIlQD9LkPG0wr6k
	Au4A==
X-Gm-Gg: Acq92OHKLqKg/ZynQpDmGHuXM4j2cekRHtf3P3f6ShUCloT0QXtdZ22aPFAr4x34qlf
	qDJjpLTsEu2JdcKwt5ojSCZrcuG+bt8ho4vGA1FLVKbhePPnUo1nB+oEhTkCybmlev3MWqYn1IX
	By7b3eRP/XYKgyRwYfeXN+QNP8LdRyaUG9clp72/8Kicqcv5slWs1YtYvHXCjJedUgags/05S33
	s6Tk9zTeL/uzLohh7bb10Lp28a77zMoJydaURbe9dgVHEwfNviAZ1ibKjWQxtu/MuxB/JSGhyrw
	TjyDjKxHdasXOW67uc0v00mHlYwxdEWn4C+HSvMc1TYuiQsSVkJdHvbMe165WUhUGLuWnW79HUY
	l94B3kjKnkRFNbQQphqDeubMoL3KNplOFT5xCmn3hxPTZfhZGnkAPGmuEXGc=
X-Received: by 2002:a17:903:1b47:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2c1e8344ef4mr31586245ad.16.1780654771924;
        Fri, 05 Jun 2026 03:19:31 -0700 (PDT)
X-Received: by 2002:a17:903:1b47:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2c1e8344ef4mr31585795ad.16.1780654771441;
        Fri, 05 Jun 2026 03:19:31 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm89741445ad.33.2026.06.05.03.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:19:31 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 15:48:52 +0530
Subject: [PATCH v3 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-display-v3-2-9846ba5fe635@oss.qualcomm.com>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780654747; l=775;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=b3y/Ri3dF5pPUhVma/VEkqg6XXHRERmZ3NYb/UDlu8k=;
 b=HHM3jKlqb5X26mBRFsD9fw5P1MjZUiGWDaoGxngkOUjuZ5dFNTpjD798rKw8GJ45ZtvnSvf0d
 90SFK/4Eb5ICuvRht1mtLZquyu5ms+kCPxWy6f9+XSOw5aD7GeN5o8L
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: MZqpBOpO5VOBwsj0drTMUTTOlQg7prLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5OSBTYWx0ZWRfX4V6NPRxJckxV
 djsm3gcGxq9vY07X/9giPLIMyUcG0tazBJL172I7/1/APP0765F4gXXf2SbhPreg3jQNco8ZktX
 3mSR+7vZTjRBUP/1fVNEhI6MUgDDsQz8cfPDPAqQrp9CnRzLQLvUMwcN3pGcUgCLEIw5ti+vbMk
 GAbdLvl+G3zbNVd92g8GJbm17WvZYrW7Q57UoLtdrE2doeA4yu8Ut2fH1rPvdDeJZrqaiEc12Yg
 xh1fbirygR7nmgLyrbljLhaOMiPuXb16eDLt967tr7ILoNBqi6JWcywCAgqIi/jSO8fBavMMGdq
 M6gIknJwvTsPYWiS1MjW3zAugtdS9ybLq0ghuYwe5cCCiLZvvn9SWIV4SOAeISdhinMM8OPD1UE
 v1TNjMyI2pdHwBvgiMtd+Vorbr8G10/Ayg5E1Lt+SUXiEyhUD4TmCO7tj4hqiAdGFRAW6kWZLjl
 cfOzhIqa6irUJRGJb+w==
X-Authority-Analysis: v=2.4 cv=K/wS2SWI c=1 sm=1 tr=0 ts=6a22a2b5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: MZqpBOpO5VOBwsj0drTMUTTOlQg7prLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_031934_302080_450F60F7 
X-CRM114-Status: GOOD (  12.36  )
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

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra CQM EVK board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 909f3c188e75..a6d72ff63e57 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1005,6 +1005,7 @@ CONFIG_DRM_MXSFB=m
 CONFIG_DRM_IMX_LCDIF=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m

-- 
2.34.1


