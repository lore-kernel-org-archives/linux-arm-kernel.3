Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF10CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 21:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBa5VYXjVh+mQki1BQtkfNYs/iy5UlWU9hRfZC/T0lc=; b=LOFEWvHch3dN6pQha9lyFhrERO
	si6rXpk1CDqOhB/GjYP6S/zpc2jsjhR9kZ4I/VXyk0XFka2zQxsqEoAhve9QJ/jCDPlHx2FelfAVR
	cGZqyw+2AbHeMH+0qVq/TKVyPeRt5L9chKnhfshE9iYGyT1jDyau81sJT+xYzeV4lrg8ik6tug7Nb
	MgMv5ONPbTyQ3XpFXfFLSTudNWT5UFt+H2IlZUPpeTYovzvkoWTdfiu6xOTd/jCf4TYCFbH3YqN9/
	j5pWqyJlhRgcM2pOzVPgA2kJcHusxUJ4RJuMWYSjdjU25vjCczsCkcT90f0Gmtatu3nG18kGF/5t0
	0BHnJfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYsSR-0000000DIoZ-0xAB;
	Sun, 14 Jun 2026 21:33:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYsSO-0000000DInN-2HGE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 21:33:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELGGfX2673767
	for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 21:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BBa5VYXjVh+mQki1BQtkfNYs/iy5UlWU9hRfZC/T0lc=; b=DvRqqshjKbCq8JJR
	uAHv4S0lD8FL1S9l1b7TWhWXv17tLh/8B+qHSh8JZWbu0pyAzRp23j7et3hhdVKL
	DA1UNHk7x4U+HjMNW2a7Gc4KsyD/CzGGstSnFCN2nSeCikLD7SWuZTzGgXP8Lszu
	6vTbc5BAXVITLbnJQ8zmEUSiYiqG/4nrW80H7HmghacLSyY/zJ5ZMViHNE+RpJKR
	TNfnHFFNAlqMbRzJtcI+Rqmo4q9y9qj9i+svytzIfXFqfULH83eRhZlT53Xfxfv9
	nMAF8TbDHAjRKkHik2ywQLMGBMhr/2TX5thbyG0XtQJytOeo8aMZVzUgUneq0Kt8
	p5eFVg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u4jtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 21:33:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf08c2a24bso25722445ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 14:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781472806; x=1782077606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBa5VYXjVh+mQki1BQtkfNYs/iy5UlWU9hRfZC/T0lc=;
        b=Ri8nNy68HYkKOsg5t69JSjnWgLdiTJKEs0mlBcVWYdpc/+iF1vjVihAzM7YluCZJsz
         U7Bq3shvuohT3w+DwVvgVwm/Zyx/gS0aIGy41hd2Ihxly5U+24bQwp49wvJM2bMnlLzH
         T6pvnix5vsgi8Sw0wTG4D/bBDtdKa4lRn+wntti2iZ4VCnInJAfWSZY3xGOK6sNSmdWn
         SZGFV+Mfm1YF5GHaNFU3yVQ46rc77d85H5/Ei56+vVuUvzURUJLjn0cWJTBhFQf+NBQZ
         qluOQQyV2369nFzfotqaaWRWyksbiGoT+AGezU0D5JeSjkibdb2MTdE0R+b13gJI4SeW
         smVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781472806; x=1782077606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BBa5VYXjVh+mQki1BQtkfNYs/iy5UlWU9hRfZC/T0lc=;
        b=sM86NGV+6hmKo7YvgIHpmkB1yuXyiqichf6TrcPYdixLTtoNVJJkgUg77JpQhxKgy+
         9Q8UcahocBVw9QKspQPa9xe+RZYCZWstRXtijBwMtHNDGBeDShKp8T0hQ7GMdQcCD6D4
         kLt8EaIokOSzqr+SZoGpr2wTek4vBPzHTIYXC6Wi+dIkLUFYN6/w74KM9lKxvtmNVwOn
         NUGFHitV9D+051yYyC+QexM4+FrU5hPpiXarB6a8YMm+/JWkUQ0xlxIJf4f5VDRTwWGU
         cdnnzck8MX0ULBCPfK3QSswsdMPdZpMDptEqUznNp2Cd3qiJek07MYFMvAXxae2zaIFX
         pQ6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+KAtZoFsneuBto18opBCM2FfUhEGGnuh8sWUahl1u51on7Oj1fNg+Y/xfgF2MHQ9k90oOx6az5tbGDSObZmct+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh+HDCJuhnNvH7i1F2TAOUK0Y+Je0OCOBEUC8A+zEXukIYGOVK
	eSW4UGRf0CxhR44fLkIikZz8SDu9pZf4z/jP1pL2n1a4xaeO6QexbaLIDpEzvNSEznRx2lnOhl3
	SFP5j82KJV8CQZtOPuvYLqgJzLbudXsuc+polTkAZ8JAsfZQhI0ej5hHJ9cvcj2SxI8MCAsAcFR
	wrmQ==
X-Gm-Gg: Acq92OHp6j6qdhk1Jv/4oz0t6euHceIp6/Q9KoiYkZIepckPbi3FMxxiu0ty0RgnOOu
	iULSEVzqOPXELNeM2K0/PkFcz9mY3lNBtaCaQR26qC8uw3tlnQIH5OKxxHs5xjNdoNmWOwkWveV
	d1aZVwaNkwOfXr5OPez8ftNqvr9JmfSnvB2sWmYO+VWC8wVHAow3OcpBTI4DAD49jUPnESZKref
	DrZwvEeh3Bx0Rd81SSjZBoUV02zm4HtaCvWW1ZtS9LT24u9Pj/zj6HB2yKyuGZiFByZm6egilF2
	TyXR8T45UAIBynm9n1cLUU0XFY84XiXRM1tIgwv8muw3gGNKbZUJMdZfnmJME19HZZtuJLjOY/H
	ipbgmGGDIXT9HKPulSAbFNcEbq8V14k+688n+Nmbq9qlI7w==
X-Received: by 2002:a17:903:944:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2c41216d384mr127694025ad.28.1781472806148;
        Sun, 14 Jun 2026 14:33:26 -0700 (PDT)
X-Received: by 2002:a17:903:944:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2c41216d384mr127693605ad.28.1781472805748;
        Sun, 14 Jun 2026 14:33:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm78385815ad.21.2026.06.14.14.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:33:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 03:02:58 +0530
Subject: [PATCH v2 2/3] drm/msm/adreno: Add support for A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-gpu-v2-2-2f2d1347c3fb@oss.qualcomm.com>
References: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781472781; l=1143;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=R79xKmL+sZwSyzKrrAiP2VZ/Wn0sPCCgxYAlwy7UjP4=;
 b=yglw6Mgw5GWhrR/ZbfN4m9aEdZT4bjZDfQ92ZeoxePei8sXC4tz6Dq7Wn02eKzL+XQBxkhzli
 l0y5fuC/0UiCE8iWe7/3pfwwu104Dj9hZAY684jfSys8jDndsDHCPsx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2f1e27 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: NtdhVqVH3OXTR_KH1KKQ6Zw2SBefXbT6
X-Proofpoint-ORIG-GUID: NtdhVqVH3OXTR_KH1KKQ6Zw2SBefXbT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX8pzfm8LZqB61
 bGCrb1grCUFFgE65NEilHun0sHtm4asz/a/VBSwLH5YLAGXcRhnj4E0lvZcUO3FHUKLE40BDvkQ
 ICLri911UdpYjIdNswk1/lODLYCBeFP2w9rl98V+DHBod7/ix67ceGPvnztN7OW7owoefRnedKL
 H74RStE3evYvvqn49jVaspoXKAJuwBCqI0pTXZ4QPn8/DnEQuPRDLfJcNFCosBRuRncQ1H/VQH6
 O+1ZkynhpMnC6mstWpeOnNFA++K8L0cKRR+K7aRo3sJzB0qZDPUTYfssTJVnNqN8Lff3D7Rka7p
 POTXgpour08N7hKw+L6gU6go8RL+ek5R87svoWmfp3/3Uu0kuY6Vq2yEb8ZFCNYXudAhEC06Yf9
 xfQieeBHFCT5vXbTFB5wXKnaJUxlojbV/b/csfAZcjMcRUnMJjFAa6COieeGUIWo2fU2Q2FRi8g
 A4aY1OVbs2UKywsonFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX7us2uuXTLMQC
 MOVgFWdN5SOBytG8Ttw+1dpuXYYgNyfQXtDZdam0m79L2ru0PGTsQ2be+QjGpZTXyThFGXC4Sh7
 NIZlCm0OI3bMaV0VsUeoDvYG6qfHzqU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_143328_717543_D7151C3F 
X-CRM114-Status: GOOD (  16.70  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..2de3ab010135 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1454,7 +1454,7 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
 			[ADRENO_FW_SQE] = "a702_sqe.fw",

-- 
2.51.0


