Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DB8C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PLJ+zO8fHCwqHnlO5zRh4HAUmHBZQtEJHNPOmGYhT5U=; b=rd9rjYk7twzxVE
	UsFETONAl9FND5MehNOZX36r0ioqXn4+Agb9erjtURyYaT5Z2fTTI4xP92HNMOvd0tu25YNEmCgu6
	IMLrZHSyk6ue1dO6h5Z3ehjhK6whHWQwuk92LQj11LA6kF9SSc+JM5JgSxdd1HWehGhRfJR7hmc2e
	5qd4ZJ7GVVx7d23XqwHet0RAVrA3XyDz4QUcJdMKxAJkUNaKIPJ0OVlSnCl8RvmC0f003mUvmWP4n
	iY9CIO01fPuHpAL/WDV2/jdygW5LodKkeAZYNN1pEIG6kOmp6ecKUIitVy4MEQUPrkGzVwGLpWClV
	WEW2OpeKS+os2OlPZ69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwVm-00000005fdC-1vNY;
	Thu, 06 Aug 2026 11:43:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwVj-00000005fcp-44f6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:43:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhaR1871339
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 11:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PLJ+zO8fHCwqHnlO5zRh4H
	AUmHBZQtEJHNPOmGYhT5U=; b=SO/+OpCcSdK54xgZgq0Wk3CutUMIkz3EFP9GWm
	WBscpylzt7kRthiPAN8ECFEV4QaVGXADgpJ25hHzwfHnw7x3vP+wI5Ty5J/ke7i4
	gIA1wQLCNisNh53As6UVFss1Igli1d3aUsUs+cuwFLp4GqxcD1RnsDrjvXebCHLs
	2QMD/sBHwj951W9i/mgGsSU7M4J2mIiCK20DyMKegsq3sa+ZYUIWYqaoR8NwxMgK
	oWLmqQ7zyflM46q28OWI2Q8vQrwFlEXK4Dtg6tfv918rp2bXd97RmWQ/vQ0ylxaP
	vzEtlRhUu9FXgyzkc72bTz0bWdAF7+37ArzG+SKaTkIFLrDQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud1w3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 11:43:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1655473a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 04:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016622; x=1786621422; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PLJ+zO8fHCwqHnlO5zRh4HAUmHBZQtEJHNPOmGYhT5U=;
        b=WgXatd4DGlP4GHooOzon1p7/BfaTFibiODOqq1lmCu5T+0JPU9HUZx4hYMfgdngyqJ
         +8zU9Q4933ChhP//Vw54yrR0z+1AgqaMjmFZ07pK8MUx8+L8hLPPdYo9okafawGeDVrr
         aKBjMBjRcemIpcxo6Vm2PIEfFH36iMlaPEgUvfFB/HOoUOKxOn7cv1DbXk/rqhFoAyRB
         jrUdB5Gy1feDnd+3/2WdZkjFSU+kF12gpM3BVOKVDFDV2q/awL3Vle5bZflIKaEDpfru
         GNnjM/gpA21tZYiubLsc9fUtl4oNePVrsJLKmt3EPRfdIaLZPTvtip7sje9lTThBy4L0
         Yu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016622; x=1786621422;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PLJ+zO8fHCwqHnlO5zRh4HAUmHBZQtEJHNPOmGYhT5U=;
        b=l9e3mpuvMgI5pSCe8XvJxjBO3PhzrJKHBm3N1CBHP1Wk5iTpuVW4FP0E9Ewvk2r/V8
         k/DNWY1KJPHLA/+KopF8WZwHotOMlihlMNcKEfrgNLlSqtB8ZX2eMVjYLTyqUD2BtfR8
         htk4VFcQDh0PHlyqaWZNpc5fn68FNvn1a9H/0+hKldTlMRGZCD21mWascbyChh2AhI/l
         h+zWnjUvd9t7CPOfbz9oR6O/RE1rlc1c8cf4uAUvQS6a4lieQvr7pKPnXoaSmH5osy7r
         Y7TJ0mz8UocWlAFiPSGSFUlL8+GknBPZB3zk7rn5fl+b1uP60qIeBLnh7hhtfV9VZHNZ
         UUyg==
X-Forwarded-Encrypted: i=1; AHgh+RqhsCzxf+EzO7vQuITJADxTp5YZKNLY895UDnOOhwv4Wk5dVpBpnFlDKpUbOd8tJDI4CrbIxBemYaxbEzHMs/DD@lists.infradead.org
X-Gm-Message-State: AOJu0YygjLQw01gnV3cuh4dLyAvus5AgjiZvi8Zbv0C/ckA51DGfrCXQ
	8Tp4h3iApBZgXSJVcf60asHoamEFrEVfIX/7h0EEnRlYwLsJ1e6dWPiRi7CErgWGwR9J7sQYc6f
	aNo7uZZy01dwagJHsOv6fflqwvCLPrNhvQ/akNvXXwanQTKBcpDvDwNGFHw1FHwEKDqKBdubPSu
	pAag==
X-Gm-Gg: AR+sD12Sv9q4ivWP3v7lSXx4GhpQwTB5Qdzy/7lUUhqk5E0t/q7FSJBEp9Z/whMehLz
	ToAJxRbhu7FOnuZe5PW4hd4uN4olitXe7WMZzy6UQ1IXZI2UobO5mX7GwVKHC34p2j2cW1DIuQg
	E9a6a6yiivy0k17n2ddMH/ovdCwEEPGwsODDL8T+CcMufw0EfeIitsnuLjmp07DdCkUs+uMRfWG
	3zc8/ea6+kC7ZQzWQpBrGkXaddriln9dEdsZ4Voj58KOznRWhbkO0SZWFhCT3BwOl15ObAeIepk
	XttpaKrvpBIMNUBbuNdkcQQaIuhs4dVXyLPtkU6PqgiBNLHDQIw3JD5ExU7Yz6iRPu4gwVOOLPG
	FazXGqwQU5GsO6BIXkQsBw20vAdlL6IE=
X-Received: by 2002:a05:6a00:12d6:b0:84c:1cd2:142b with SMTP id d2e1a72fcca58-84f2e031769mr14671836b3a.9.1786016621588;
        Thu, 06 Aug 2026 04:43:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d6:b0:84c:1cd2:142b with SMTP id d2e1a72fcca58-84f2e031769mr14671783b3a.9.1786016621100;
        Thu, 06 Aug 2026 04:43:41 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:43:40 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v7 0/5] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Thu, 06 Aug 2026 17:13:25 +0530
Message-Id: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1zdGoC/43STW7DIBAF4KtEXpeI4WfAWeUeVRcwQIPaxI1x3
 FZR7l7iVEoWdtUN0kOab95izk2JfY6l2azOTR/HXHJ3qME8rRraucNrZDnU3AgukGuBrOzyW+8
 YuX0p7DoRPxklTIiONKJv6uRHH1P+mtTnl1vu4/FU8eH22XhXIqNuv8/DZgWGQwpOJG2jVJq45
 klJ3rYGfCBuKCAo9K65Wrtchq7/ngqPMGF/dhuBcYZKB0GWjHZmexzy+nhy79f16/pM7CjuFHI
 7T4lKkYNWok8goN12pcxQ8oECPU/JSlmwUllIyga+QKl/UKpSnrwGbsFI7RcofacMyHlKVyp4L
 X0EHUilBQofKLFAYaUMKUyt916FmVZPv1dluV4mnA2eEBMP1sy0uVwuPwkyZOPDAgAA
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=5187;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=Vh3lESIeL6qTm46nCHD7WoUqzT6Ku3AruMEQsvI8yTw=;
 b=o/36NYy1clh5A+c1LDaAFLnChOxBkD35/yG9f3IIy9r1utY+KY54c25j80XLIJn6NfqSceMos
 8+eVRPP2VIMAe5LJ7Uy5oMRAEkXBlw0EKcNuq90OQ5/MWUiIClsf8pY
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX/ejp8tdsKzsB
 ppo+UBT6JFwlfX2yChCSTRwjHbfQqPcm50PePVnMxH7RYsh4XxyuOS7VCDprUivKpZQLAe84+TL
 YyTUruChx1MWI1dYyuXlpwEj5uj4ZgcW62q3lmEeRWpFxq0eWiEMkya+0nViENT6H7V1IdeZcuB
 Wd4fy5ErwIHLGPGi4hUKEKbdaovoIalS6zMhHN76SYWGVLqYEEPWc3mAZeu3u4hWFagYchpTNAH
 J6TP1q/yEvIU4WgGcKIk/IQy6ugF5EYzJ8HLg6uK4tmRvnd1ak7CgqIrJOO1TR2NJ1xD9I+Owia
 aY2aRYPL6W9lKqt338a4+QtqtWXePyLSzRBMnIFy7gRO7m1QnxqnnjKUqFAgA46vbvYae8cOaoB
 lKCumIaqoMxfzhg7BHtfNHXdLA2HWEdOMHPzKgai7Kny6PtUZ+bDVz0m2rtJBovbGFvRwRjSUI2
 axA5v6ZXMtwX2FxDcUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX1gs0RUJo9K5c
 v7RqgUQfM1g8/eG0U7l2oeuxpf30Rpgp0s8sWQstKqj7d/HnaW4llMuLYrkERznO7ZO+GqI2UDx
 6jLG3lsgXiNVPMGhOUptHs51iNo6Ozo=
X-Proofpoint-GUID: B85t3b-9vsRdt3ojd1IYp1NbxM8CAAh-
X-Proofpoint-ORIG-GUID: B85t3b-9vsRdt3ojd1IYp1NbxM8CAAh-
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a74736e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_044344_153169_3D67B1DB 
X-CRM114-Status: GOOD (  15.55  )
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

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v7:
- No changes in patches
- Rebase on top of linux-next (20260805), fixing the conflicts.
- Link to v6: https://lore.kernel.org/r/20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com

Changes since last v6 RESEND:
- No changes in patches
- Drop dt-bindings: media: qcom: Add Shikra CAMSS compatible; already
  picked by Bryan into media tree (now in linux-next as 32179a552b8e)
- Rebase on top of linux-next (20260804)
- Link to v6: https://lore.kernel.org/r/20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com

Changes in v6:
- Rebase on top of linux-next (20260721)
- Sort CAMSS by unit-address numerically - sashiko
- Collected Reviewed-by tag (Loic)
- Link to v5: https://lore.kernel.org/r/20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com

Changes in v5:
- Rebase on top of linux-next (20260710)
- Drop dependency on shikra-dt series; now in linux-next
- Drop dependency on shikra-gcc-rpmcc-clks series; now in linux-next
- TLMM pin entries roughly sorted by the pin index (Konrad)
- Link to v4: https://lore.kernel.org/r/20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com

Changes in v4:
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
  Missed in last rev.
- Link to v3: https://lore.kernel.org/r/20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com

Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Move cam1_reset_default pinctrl state from board .dts files into the
  mezzanine .dtso overlay files (Vladimir)
- Collect Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Changes in v2:
- Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
  as fallback compatible string since Shikra CAMSS is register-compatible
  with QCM2290 (Loic, Bryan)
- Use oneOf in iommus to describe all valid SID combinations: VFE-only
  (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
  per-entry descriptions naming each SID (Krzysztof, Bryan)
- Rename shikra-cqm-evk-imx577-camera overlay to
  shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
  boards which use the same PM4125 PMIC and camera supply rails (Bryan)
- Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
- Add comment in overlay DTS explaining absent regulators are powered
  by the daughter board (Bryan)
- Collect Reviewed-by tags
- Add reset-gpios pinctrl state for IMX577 sensor.
- Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com

---
Nihal Kumar Gupta (5):
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  79 +++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  79 +++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
 4 files changed, 363 insertions(+)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


