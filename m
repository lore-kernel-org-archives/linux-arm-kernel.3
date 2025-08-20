Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A74CA0EFE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=11RILgASqebrtw2UrosgID+qYHkhszgpHlOkkTGkunQ=; b=fjaNO1zjgsDTPj0igYiIioHdDX
	JB/0gDxIJSYTQaV8zxJga81TcqCrF1DZ1KVDYgrKbIRef88RjWjm7iKY9PLAyZMO+USVbjBUkTCmh
	CpyT24/L96thS9BApDnQ6Mqspc1LZkaFOBth8FLxEOp+4LrvCfNxIWi0wYfiEHYfVBFxk1CQ7z1wn
	nN7iuQpQ+d7UO5RfaH0JFb0H7hQrKlEz+MhZAGOMJ9pL091oitYtJboPO+CJH6WqBTmGiH8KwqnoH
	G72/4rO5s83qZXcrDRJsyYkewEkx3oSAH//oTDkkf+rxSoayZJ2md00RzgCNNcKLAq6dz0joOTIe0
	AoJKrsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogbh-0000000DHHZ-0cj3;
	Wed, 20 Aug 2025 11:03:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeaT-0000000CoJ1-1Nx6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:54:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oisW028174
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 08:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=11RILgASqebrtw2UrosgID
	+qYHkhszgpHlOkkTGkunQ=; b=npN1oFyQ+DdVNktnIkKKbNGGVcbQnhgbe7oYnD
	cf27wT4yQOKBqJ7ArC/LaDw1y5AC5SmCT7NtV0xMi8FRsjpW1W18/QogC72rr+CK
	gqe+pE76ceLaRU+D/d1keQ0dkazOePK/N7D2eWBZvY/5tXsemLEZHjSHH5kWgtcy
	Cplp2WpbtqJ+LxxjpaTQ4cmsuqQUMDyjE5/H/Q3Pu9W/key9BzpYATo+BmIQ8v8i
	+E4+AqXznUZs3jnQtJ55qD0L5OBuEIGZw+GVrIy0dhHceYcGTGdzyY197DYiXkng
	EExaQ/TePxRUhewVQK8DYAzjrFYdoK3EM/haj0RAhcr4OXZA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52as1j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 08:54:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b471757d82fso5028347a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 01:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755680067; x=1756284867;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11RILgASqebrtw2UrosgID+qYHkhszgpHlOkkTGkunQ=;
        b=HC6/Z+5QeiQtY6v3OJStQKuHBXSCWJOX4q36t3OVI+89YMNUqa9BWtoGMQsOMpsJnn
         wXv26FkshGdc4RwRhChz40/cMbPA/xDVO4pcDL0NRCD2Ls10Er57IrjFnPzopdspouVc
         3Kn6v/in/FAhI1jOeXxNS4jmvDBZ1ovS0eXnBrQlky5tijQPwuW9hYydr6wIhNnFuOqy
         zSpac3jOpk8tGIB4mspSYDn9nXH4t9nZhzKh1RA19cMQ7/k840VlPFHTtiNm6xZlazrE
         QWY+UA1Krgq8klg25btFj9lHvCbyjFvfyhIUiZFQCt5/prKInryJbedIelHfYdjj512u
         hrsg==
X-Gm-Message-State: AOJu0YzYSvda+iJgqYof0dTHQICYsCr8a71BDzmbinXBdmL1IsKeI7xH
	LFMa9MflrAAYGTQkKMFDiiv4W2SGukmRGX57NbkphRIpgRnD09EINrKaeqxoEXmeiomHrYddneE
	lrdXaG0kM7KhrZ1hs1pNGHgiIqueAvdAHomRD5btCou+Vv12NE3nNjKmyn1uXmNXRaS0zMKZhOm
	2PGA==
X-Gm-Gg: ASbGncudSP9fxmGGvKUlNjldQZkBIZy6q9eK+Mxjk4Pc4yvp+tQsWN/Po5QFJgywZK+
	SdnVO0zT2557fNxSBZHzyQuRRc0jjfv3Gpye26mFoEXQseSftR4cu89BLUiIiF7ANASWwijS1pB
	/FwwPG+qUr8OMBHFvbzRzbwDIjnAmXDEUyeUtUDAqSXLeDMvT6ZfO2AXHBLOmUl5CAhhxHj5bkf
	s3+VgWjijnWnErjzUVgXPcJSzcyS3xc54D3w+3UBaQsTmAnzBf6h/cRE6IBNQqXZSSCcjO+PGd8
	YkEia04xOrs+ie+mgbnbaWNpbv3D/G65s/fDMzCSWPEi2SaOANYzYQ1PLYzeYpk8HrsQhh+TtEu
	v2aCAYslut/ggASwWguL1ISiTLFy2L1IK2/I8djHMFTqappCJatUXKTen
X-Received: by 2002:a05:6a20:9389:b0:243:755:58b5 with SMTP id adf61e73a8af0-2431ba73584mr3553128637.54.1755680067087;
        Wed, 20 Aug 2025 01:54:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqdr4ixEHQumfORfUTOCWmF6r5RptPIsSTTUcwk/Feiql/w4YOg/rHr802Ne8ttx0t2841MA==
X-Received: by 2002:a05:6a20:9389:b0:243:755:58b5 with SMTP id adf61e73a8af0-2431ba73584mr3553105637.54.1755680066647;
        Wed, 20 Aug 2025 01:54:26 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e25532b1sm1658263a91.13.2025.08.20.01.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:54:26 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:53:30 +0800
Subject: [PATCH v2] arm64: defconfig: Modularize SX150X GPIO expander
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-modularize-sx150x-gpio-expander-v2-1-e6eba22f0a0f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAqNpWgC/4WNQQ6CMBBFr2K6dsh0YgVdeQ/DorQDNAGKrRCUc
 Hcrce/mJ+8v3ltF5OA4iuthFYFnF50fEtDxIEyrh4bB2cSCkBQWhNB7O3U6uDdDXKTCBZrReeB
 l1IPlAHii3JwrUyl1EckyBq7dshfuZeLWxacPrz04y+/7c8vir3uWgGBII+WEWLO9+Rizx6Q74
 /s+SyPKbds+EKDnStUAAAA=
X-Change-ID: 20250820-modularize-sx150x-gpio-expander-0427c6bcb559
To: Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Fange Zhang <fange.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680063; l=1437;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=xbVBMpbJC84OL2H7l69MUgBetsy+dP2jsa2Y/+6cwCc=;
 b=jn3BkxMQtWkJzSfSvhNQIDRyXaz1dXEFNHqSp4o9g2oveGTDNGTAnsvbh8pOWyaT6tGCLk426
 jcL55gsOAZbAN3mRbybNMHW3XWHP6P8fS9JdMi5Ygx+Hee+gGkDGmYo
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzHShHSB8P6jY
 tAxgtKWbZChFpRk4foz+sTiN99wcHYxdcr57YGCf6UlzX2DiHpLoXepSTELDJ+NJPCopHl8u7SL
 U7Buhmh5qG9ine9zsdDs9kCVvU2JY2+EUUPfROQhfHskwrwQLgpMMdpYAa5BAYUvITmwOLl1pvz
 0CtoC7tWEUC/NUmvqd0jJtHlBxOSedXObzbZmE1qMBjfABQtvQwTeIdP+NyAI+bPdz7/smS7dsv
 7//VEDnPvzf/A1UhQLmLL/RD/2Qve+JBhzXVLzxszcfG7mUOVZP5ms/2b5bf4w8OKYApEgBW+D+
 vzEo45FDJDIXOxID5iVMeRD2rnWfA5Hw9TLpLNk0XP/7mU86F/bYiIypEpQBcKtvwRmocrEW/oe
 5MXBxUL7AxpQG8qar/0Eq8MIFGafAA==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a58d44 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wWMmKHWDNrKRBeep4CkA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: fUEzwPDfiiahHs2B3OGNfiIAWiK5JGVJ
X-Proofpoint-GUID: fUEzwPDfiiahHs2B3OGNfiIAWiK5JGVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_015429_493293_9ECC4DD7 
X-CRM114-Status: GOOD (  13.34  )
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

Modularize the SX150X GPIO expander which is equipped on the Qualcomm
QCS615 Ride board to allow the ANX7625 external bridge to function
correctly.

Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
The ANX7625 relies on SX150X-controlled GPIOs for reset and HPD for
the Qualcomm QCS615 Ride board

Please note that this driver has recently been updated from bool to tristate:
https://lore.kernel.org/all/20250818-modularize-sx150x-gpio-expander-v1-1-c2a027200fed@oss.qualcomm.com/
---
Changes in v2:
- Drop patch 1/2, which have already been merged upstream
- Link to v1: https://lore.kernel.org/r/20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 667c4859ecc3cda9b0a3dae7abdd8587fc4f8dbe..dce4450fa9fa58fab0556a6e84b899a3306b4db3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -598,6 +598,7 @@ CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_RK805=m
 CONFIG_PINCTRL_SINGLE=y
+CONFIG_PINCTRL_SX150X=m
 CONFIG_PINCTRL_OWL=y
 CONFIG_PINCTRL_S700=y
 CONFIG_PINCTRL_S900=y

---
base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
change-id: 20250820-modularize-sx150x-gpio-expander-0427c6bcb559

Best regards,
-- 
Fange Zhang <fange.zhang@oss.qualcomm.com>


