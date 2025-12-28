Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEFCE784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yj3uTrVzY91o9UvaViQBsZAb2B7yFqWeP8MulTCY84=; b=1wtvMJ2XmTSslTqodeX2i78utl
	r073iD8fQ/55wcu5T8mijMQTkF7ys45ZXA1XB8TCqLmkIWjDYvf+jfNq+ZR9uWusR2Iqd/9xAV92k
	CpllrZBtGNjapNJoeuf0Yl/K6KxfnnEKio+RMqlXAYM0vKLmD6J/7kqw/pEF4n+hHfSicB+m20YIO
	PG5m2HnfOelXtYAaBr/ZihKR3NZ9sA2gpCz8ZSuHaZHzs5dXjD7vKGZRnUjyWvVebfDa2HwONN7/E
	CfMpzrSQ59nFvsTlq1106pwdM8KRx61ORb7SFfOLjeP5VHpg2g1A32rK+fG7CEQr9EeH0P9O9juiB
	LkXww9/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuSY-00000002ueJ-3xQJ;
	Sun, 28 Dec 2025 17:21:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuSV-00000002ubL-3CXD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 17:21:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSCYYNN2523333
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yj3uTrVzY91o9UvaViQBsZAb2B7yFqWeP8MulTCY84=; b=a8l/yiIxD8wSmWmu
	OG2ObJKVgF+UgroKX4v02Y7ncEDaM0tiGEjV9Lqq46Hrxf8aPT1Z4ksUiEFafeJX
	LePcCHBJtpJvIqx/67DfgGgNrJm3ZQpWwlA/eJ27Jh86rm1WxjzYoU98KNA+8gDD
	aBSXrpwuHvJXSLGefbDdNBuSKZ3cia09k4c854UresA+i15YywcGq9bX+zlWmk26
	muenRQfYILP4TPuYrnmfUarBaky5bX07BeRnUlwNoaOx9nZVvdDkudT2Zu83unb0
	d5twYrv50ojqazQ1rhnXp5wvr/YqdMUBTj0SH+RakleFuFzph9eXoki3oNieAbRG
	z3QiQA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7p1th0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1450189eso78457395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 09:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942495; x=1767547295; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yj3uTrVzY91o9UvaViQBsZAb2B7yFqWeP8MulTCY84=;
        b=YzJLZnpdCbujqlJeFGJXyeENjdLHpWn8zrkAJwn1WR5e5+GMhUf4AmHVZluj/x3EMA
         1IYnbeHWMKIomUt8RrxwPaYklYbSL+qAGMLW6+0bvFbSvNG6pTZmHI4X8iBzNSQ7+tuN
         QByx7btr6iNR/fL31jL7SIp7qAGGoqTRmBN+Gl9NkPhXgAvJVCAHfSHzx7a3F0wxXGJz
         DxfH/iBzznaXd1bfLI3S+ZqfcwA//JVVPZxr/000BTuMeKHuyRb29BAsdc6zbTNxtOoD
         778cwTveXguS5rQ5/oZxBT93+rKPLySoKwaXLr6RLRphLuyOENENPNb4nJBQQyx8I4hx
         LD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942495; x=1767547295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4yj3uTrVzY91o9UvaViQBsZAb2B7yFqWeP8MulTCY84=;
        b=MtVz6c8W0B9T3VZSOxDIxhTJdYF+P0HAsCcOKLGEeHC0zGWGCQTYZ2sGKL84MONxZr
         VLlk+RycQOjiCucQibd2YClXkp9lZxM3FoRVssJTtMx8NHVxZadhFR1Er2jS9yywAE+i
         ZFiVwBj1URZs0GIftF37iYqct1Jf6ZO88rkTLkymudz61oTJelkQP5sqFlJ43NRrhxOf
         a0oy2PhtSZOp2EagjemzhRO/RlQWUIe2MBZo+ltt6MStpSG/H1bGK5qF2mt4xmWK8LYR
         d2ijZObhWEd61/zh8ODODipgfAdUUCLvmP8iIfU7l9yX/RMOxooKMZGTNYH1BNb9IJ3j
         FDKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC9Eaa09275RuIhmaKvjw+nkaABogQDoe0KhRcv1iwE46rEB9u2iV6GT5EEwe1Kc2O7aDU7o+f17vHyvz0wQWj@lists.infradead.org
X-Gm-Message-State: AOJu0YyEhJNx9jaUbmeJ4FEooqfAxCj9QTU/wf5YwhjkRaZSkPXaxHq0
	ytimBDebLxN81hxKYTOrxgfITrKjRl+vns5RDiLe2RI9r2V1aVaL5ZHYQvmUbszdWWz4KyFq72B
	QJb6sjx6lhVdhlQpJdPZO1gL4QLnXcOK9mPzESbtbYL7Psm/CqZkHZzUQYblh15lHRXmK/WvdZ0
	Q+ew==
X-Gm-Gg: AY/fxX4Ska7//hIsp4jaiRPdRUOKVU7b0Fj5anL3rVLY88MlWePen/26n4a9miuhjCb
	zLWiozd6G6N97RmEafi4lLAhzmZnwc7WCQeCA76VQNuE91OfyRh5rqrBDVSi7hZvBE5rqqXaVdH
	RhJhBzk83VzuO0KLOnPaUiNsSsyD3x66WOhfgesO7aIavlWR7aVb+omDRZEsS5PGlwN5b0KdGJm
	8UO2BsYmCvmxf+fDGDwgNQkVUxcUpGM7JLlzLFYx8Lq5datCYySNDCj8sZojR9r/LRsSe+H2UP7
	u3tu9nPd++ZNudUvK5tfG6hDneyhOEQqjweVKPYpKVpNpSvQDAzeAM+Z2WqQWSs/XIepMAkp/Yl
	MgZuvSQ+7U0r7QMt51WYJglk04a7b0OyQ4fGgJmf4+AgVnA==
X-Received: by 2002:a17:902:ecc5:b0:2a0:e7e0:1d31 with SMTP id d9443c01a7336-2a2caab9181mr358936325ad.11.1766942494544;
        Sun, 28 Dec 2025 09:21:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpgjZdeVDWYi2V8zEaEHh90HQVYpauaoen8x3Yi6OZShAbdcqaPn93tv2b6wfoDATyJ4jqkw==
X-Received: by 2002:a17:902:ecc5:b0:2a0:e7e0:1d31 with SMTP id d9443c01a7336-2a2caab9181mr358935935ad.11.1766942494024;
        Sun, 28 Dec 2025 09:21:34 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:33 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:26 +0530
Subject: [PATCH v19 08/10] arm64: dts: qcom: lemans: Add psci reboot-modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-8-ebb956053098@oss.qualcomm.com>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=1079;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=zyaMjYOjFDa2SPj03vZF0IuCzZxO/R2dcgFXOkM351U=;
 b=yzs7Mhx6aYbM6q9K4ZYfwCoQEqZcJxWZ1m5CokIMXSJTBj2ibqqg35xHkGkMOC1/CuEYRrvcA
 tq8KDctY5glDWUQW7rz5jhDmSgelqv/OfNehQTNYu3qfKLzm/ad7A03
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: U8edzQW8jk0gZtJp54RHApWLZMpr3m57
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfX/CjXPv3U3sxf
 lD180CvFLHig6LW46g6o90fYl9D+0mRfp/g6mglZoGKdlG0aUdOHBzIa64KVjsdRWo5ehVvnbzQ
 r5rZp6vsRkrHIZXpMOLaNkLH0wjWBK82ldJ6KghZO70qrFwpPXZdMQpIivQyUACxDL/p0y75Yel
 SCpbpGjKHofO5J2HJzQ88v1nOLZD2G7AstY3cMz0POrTjq3jfncIbI+2BcZHHJs50rpIbN8FHG4
 WEw9fwTDP44fjz9Oldydkh5VQIJNjyP+iY1y8V82lMqBUA5YCsSbkQsqhbdhT0kKIupoY0naGOY
 ciE9Xg4RP/WATjEQvibXwQZ7qe6Tk4xalP1cJ0C8FW37uOevz+nTN7R8zbLMM+EVy5Ut1LF9Ac/
 KzIqix88kAFXBw0Is808Djx3mZ8LURyc1lj8H90z8+Xjj08J4b4IJri/DbImFIHEmcLEEHifBtr
 6AVh2Q2ljpzrR8id9Fg==
X-Proofpoint-GUID: U8edzQW8jk0gZtJp54RHApWLZMpr3m57
X-Authority-Analysis: v=2.4 cv=PKMCOPqC c=1 sm=1 tr=0 ts=6951671f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ld_RF3OM1xByVwKNVVYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_092135_804346_D5DB5135 
X-CRM114-Status: GOOD (  13.38  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for lemans based boards, for use by
the psci_reboot_mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24e69a9d900f06bbb22baa2781cc3f..cc70316d6949c8a36280b85931c4adec9cd60f62 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -698,6 +698,11 @@ system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cluster_sleep_apss_rsc_pc>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x80010001 0x2>;
+			mode-edl = <0x80000000 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


