Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FED7C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=; b=RLMLWdH29fXofJS+M/xec9Hjhc
	lISqw8L/1TntuWp7+aAIn8cixXQUGADSW7QBN6pFWfPRdHEPc7eNnHraB8OHaPoSlK0xVUynpeAnW
	gu/U8oMkHlv0p3gw1vsK2x0lL7BFnHweIJbN4Six6xju/BQKN1ilf7vX6mkt2cva2TWR/SoHaq1tq
	DWJH3ftbsTidKs0LStxPAYL16AdfuE1obWJmR/hJPl5Yxbjm6C+niAc3sCBno8s17y1aCrMZ3+nqt
	eBctLzxS4xE2sPU6jo6KMrllwWGGnmdjj4DqZ6XZYNBmwZFjufeNHEzCIHXZcHvHs7TPmA3i3G1EJ
	/bf3CEOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68Az-000000044K0-2Mi1;
	Mon, 14 Sep 2026 15:00:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68Au-000000044FU-2JEh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:00:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0hHn135547
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=; b=P/cew2hHZQT7dWMP
	dOgrhAfwUUqvNmkCA61QHC65RV6hkeEWLtXjiK10IczKYcqiVrxE1fQ/eN8P5k5b
	XCuTKUUb+qdOBOjbq5Rq9FckjgM8HQ4fapdpZW5haLnLuhOVFVCHD3pUfwztoax+
	OFSSn0tuK5dnngeoCKoj/oK06I/TdacobsbGxubKDSarCSDv1jGJcSizQWZu84bO
	auQT7FsR9NAhILViOX7aAvsHF1Q30+jUjTASqp3jwQUSTPWrt3Kv3gvkX3ppMS3i
	lqiAUoiHK9p7CPRd3weaNxFQGD1a9ATE+BWezwvVJu7RrU2Mq3NphWA76GXh5ePf
	Amv9aQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq95m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:00:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d959904658so58370075ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398051; x=1790002851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=ftV00+tTvRj086Jqj8K472CKBaDS8685CKfeWlzJnT38yanx//R3x2W8E8/mNBezVQ
         zZBcZyuv7hLV/00HYxqU64ExNLazP082P4hjHvNNUKBhRrU37du+B0MP7MVpuSC/j9mH
         jXBW96P6i/D2wAUvs8Vg5euC6WkM3+CufTHRwe4EI4ipj5fT1UxbyoA3YMl+XlOnlPcT
         OeVePui/PeVu826LYxXQ/ezPF8GGrZl3mIvYtegDIipcqMAngLw2mRGcPbztv2qQyldF
         QeATnnCvD3zKCYyUPvdoewGaXm1Oa0FTOiLZhLaGFdEhINMgqRIsIrKiqwzbFbrB5uop
         P35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398051; x=1790002851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=W8NDeKeIL8N7jdlUJYlVQmyXMXfvhAmFf6ZErdNBm8sGxb3TCnlatb2nMMsCWypUKl
         nySrylG6QO6IiZo+gawOz+EdhoUprpQr8tOJZ13+wRI/TDjhuV6HvZ3TZxqGzM6fJoeE
         Lajgfozb6RS4yIJzkvNLvzsOnMRg4q1w86KV+xtpEiTsVLqonYQrg0gaBwrToeQkSEin
         zl/bj0PgJSsl0T7ncWUFSZScUVLmj9oOr5vxfE9D5MwG+PW6kJnMdhpEQzEWOfDS/reu
         JjQZ2zZf0EvWBXs0mkVkO3destSfDlfB8DVXeVxRfYkHothpF7B0JQdPgnXsOxwHDXHl
         NKbg==
X-Forwarded-Encrypted: i=1; AKwUvByserjT09QfUvmD4TczKjl8uxWfgNSa4PTFPLDaYtEDB0YorIu4PUDXCS8qCJE3y8jt1e7GQ7LpaNKCiduTuzF6@lists.infradead.org
X-Gm-Message-State: AFuF++lHQR+qbPZhqPGPQAuNZkCzqIo4E0CsFlZ+5QcA1J46x3qHyqKW
	QCtyfiAo0ps2/ZD5pcxPgI9bHcmMa7b/2EcxsxmfVe+9YMmQq1jzP2lbr7oTgPwBjkOpTo+wOMm
	tkDhQfyElUg5sX4RY3tmMQ1/qaHEGmdO5AXhcvgIG9rI6KkpqpDL9Sphwt+nxlSXXeRc8sBSvU2
	O8zA==
X-Gm-Gg: AYBFou09816eleTl+JhJEPFDGaicvdoUbqj1uPy93IZtym/q141u9ucKjqJU+vLv1cI
	lR0quNK2VFVeU5i6ZIBW2krB/z4Efsn5yhvZGwGztPJ/Yiwol55W9RykrX7y+cGaPBXRzliLCEF
	HFDvYYu09XJLkW1PpE1lFVPN8zT3tCzvxD8b6hcnk5mdgxrSfn66VET6l4YQ3Hj4kGlbPNH+Kk6
	IXe4dhJtZ10yjrSRVPyBI+d9jChVy/WEp0WOHJYDDJYz+sH/UnKHRgrj4ITAnerbzf/rXVXmktB
	GM/x/rskn7ghPAoz1spH5hllVYIxFIlpNneFlQIQfATx1JEXKQwYRRbOK0LUX888OaN/pfU3HaL
	jIm0Bu40UBr9BmAR5y9zRmaI/Ks+t0FFwDS7X
X-Received: by 2002:a17:902:ecc9:b0:2db:539c:b7c7 with SMTP id d9443c01a7336-2dd6c75a41emr62769715ad.20.1789398051332;
        Mon, 14 Sep 2026 08:00:51 -0700 (PDT)
X-Received: by 2002:a17:902:ecc9:b0:2db:539c:b7c7 with SMTP id d9443c01a7336-2dd6c75a41emr62768505ad.20.1789398050872;
        Mon, 14 Sep 2026 08:00:50 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:49 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:12 +0530
Subject: [PATCH v25 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-8-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=HY9fLa8u8u31BscwdrGeQccVQPGFQUgGa2K581SXsxg=;
 b=fNw+c8n6DonkQZy6Ryg4I7jQGU3AwDIZpv1saXTAQP0uoDA44F09SQVdEZYzRHbUuA5FolYsW
 532efuuiRUfByHxOdaaphUQmNsImBGJ54C2AfORsbVFpdPXiRM8pMD9
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX8aGWdjzQDUQZ
 1v0S0P5vWqDG/p2tXJf2kCzjwEPrEPt3IUC+XwDu6XGbGAIx0iU+rnA3u8nHjKcriIhEnqqIpzC
 JxCc9mvo/Wz2ptSdaVFlaL/AbL/HaVtE3WlpDnB3wxQwzbBHYQeHTF7XvFmtnHB4hIxADzHXk9H
 sboflY2UAOx3DXfhdGb+Ix+35Awq1HC/pIgyARV6cSHXmeCDmFWc22exPFLddGz7jQczPasj/8Q
 pK7itX9DFAChUCAGsPwffMml1Aj3TswjbhOmmeNKj7Pqq+LDSHMY45AnxtooOoRxaSRS2tOww91
 A6IzUmEqmJ56glkvw6IZw9L2hAboWZMZjmubTxeM8SnM6IOEu8CFNtJaP4Tgyck9oSopBMNPdW2
 X2NeMzzH7wRQPqTuVSNLbz5KEsR82Dj81hGbhqCWsxzPLAeWGMXJxxVRqzdAVZ7oWCfecXYdOuS
 V4KhPOi2ImFywKv2h0w==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa80c24 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: zbJiIzB8Vj0wvUWGu51aE45TalcnmzoE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX3PGmhd/u0w3c
 UG7QfJcELyTlXLPG0LFxJOKQtiyKWnbmTu+V6H+l2vVQY8tm1RFtOMMxbW/SaW+LchiuFXGCBw3
 4KyiBL+c9quyzgOkGQWvLggEfLwMj30=
X-Proofpoint-GUID: zbJiIzB8Vj0wvUWGu51aE45TalcnmzoE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080052_622729_4909AE7F 
X-CRM114-Status: GOOD (  18.13  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..87d01acc7b5a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -911,6 +911,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 144f117ba511..0adf9f02c8cf 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..f0633b81a04d 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -550,7 +550,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


