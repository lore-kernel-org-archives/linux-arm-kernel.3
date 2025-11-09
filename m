Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E32CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 14:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zriVHHzMQQ8ELUT932V4l8RDRcEXWAm2X8YnUX13NY=; b=jBeF6fWOT8ylE+XWkeoKJcGdnY
	HvYtpzJmgIXRjl3uBlqzV3pSS4tXl6QS0oMKWZ/BS8jQxMS2jtZzVQCNA0oqHZ8u2YuEkcUWalHcP
	MLQTDKNPf4RubuoPEUHkNIz/F3UYr9P2Ql+YXKjr20jHIxCBhDm0KQFVwVP559AcNR8UmBUnrcF7X
	jzlYyQr+U16UoXL6LBUZmIZYYGJjamrNMdkhj9Wfv9SQcwYXC1XgtJSK9Yspt4ggSoqvvIwYaXYvg
	a4LQFjVm568JwCk6OKsCDilbXsGcnEb5A58usf6dsazfZuZ0uiGJVJxbeguwWYakUMuG16qiKYrqB
	NwTRWoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Z5-0000000450o-0e9W;
	Sun, 09 Nov 2025 14:38:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Yz-000000044xm-2Pdd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 14:38:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9Cvdbi630781
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 14:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zriVHHzMQQ8ELUT932V4l8RDRcEXWAm2X8YnUX13NY=; b=fQH7vgGixjiezK07
	fHna/+OSPKGwQ+ItQcFWBf75PqMmDj7mK0/1WjMPhxYBYZXlr28l40xHB9zumemM
	Gf/N5j2b+WjKVUTWYYITipRoXxviQIGEzlClo/y+wJN1aNLSn370ihi1GDKmJCnL
	C6lxzlJmDcvSiKQS9eZueFxfb8xHXuWwjGvQlJkLjiPboPrtuiTs5NBczHedbfPM
	76XMxwKiH+Wit8LYvT3xoZ4qQdxM8uNVE0kVakSpwaaLGlGIHlS/qIISX1FS/aae
	3X0Jk1nk94TUTFLPx0+QYNO4LRv/o7gd88r5RfUdaCHQl9JalTjuXTbQZg/pqPvW
	0Vr8dg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aaue0g3dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:38:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-343725e6243so981206a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 06:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699119; x=1763303919; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zriVHHzMQQ8ELUT932V4l8RDRcEXWAm2X8YnUX13NY=;
        b=aKnEZt3qR7UqswUyC1cckrHUDhbmR2+1kBUaSShBSPzRDhDfbkz1YDSjxvZoh3iWyS
         JWFp1K8a8EOJRSNA87o6wW2hPoirFB2mwf6HpQcgU9dUDqOiPTrSQww/WhwAujjbFRNy
         QfVOJUvM/filjjrwlHXfRxorFZ9oRkFp613KB7wPRuz7kzdWyXfE5jnM4une5dYwTL0Q
         kAcfj8sb0l99NNj4jFpQKlZTEquE34+qxNJNVog9KQrB8V7k6RN0P8elRpWh63oCzmC+
         v4wa7fN5Q1yrrx6mN6Bk2PFc9fBCSi4dJzRBLpaFw5nBz8gxGCriMopv/K3IiPvQ5VUU
         73sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699119; x=1763303919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4zriVHHzMQQ8ELUT932V4l8RDRcEXWAm2X8YnUX13NY=;
        b=wl/JIWwbRiDV/EsxPcY1MojQHetFP0KlWpzLugrk6DKH/zA+7vKdQBIXUnJBS8QxAX
         1SMDksCWr4mElIJiM7LnHhUKvtLTZJfUJPpUbLKnuE6Q4Ns64twc1Qql291jdJgF/F+y
         ywdTTDztYYKXYauRGbcueXAZhpmRLkY+dMuT4p71zS3kGJx2xFFh9EFYjK75DmMpPNr7
         TnTcpZBpH2TRu2sONhtNpF+YWEMpYmRWLLGn5vIMwezpMSvH50DE7BbMow/hY6TxY+Mi
         gM/OYJK4FDRHIREJER3sxSS/eEwlZSkfHLkWXOokb0oxKivU/mNYUz590CPGLxeilt6H
         javQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk/mjqU1Gu5ZWTW9zqyH+9Z7k8hY2TOR+G4SKowybYLjCZZrAtmLfO2pr9eDB991ILdlgcg03fDlNF3wv61qA5@lists.infradead.org
X-Gm-Message-State: AOJu0YzNBhBaxGogHbPialaDxNJPpyI2OMCxjSQ22Rx6CPejSy5fYffE
	/0TLSXVMoiPgDq2lYEUY7gV4kkErleZSxsdxI6+uRzWgg5eRNkP6wVtLFVSHDkVbQGAdhbag+N7
	osiTikGHHMPa/8R3FMyMskDhaxofJy/M65BFKIFzAEKSBqXqbPNj02V10WmM9nO2Q94MBwWgjs9
	vCCg==
X-Gm-Gg: ASbGnctBNzNSzpXaxeGVkLXATTlxFH7d9PZAre2jwL2uB1EuM7KPAMcEn/AX50bfJjf
	oNNmyFHz2FbKWuJI1sovivJ86jwUFEuTW5lDjpD2AaOLQsB9s/VPKS2lk16Hd0hLANZjmW0V1A+
	7LhTg2DOyCP65fmiXEZVAB6tv7t2SM3M2Qs7zTdcRIBbZDaSX5QF8DLrHd92OtZfy8NDAby/mXK
	pwcdkicx9ThJDmnKpFs2YCoQ84Yle/tGFjtX85dzJF+jNNLsmfQxQzWiDmZYL9YfYdwfZGIFedr
	iQt7iuXOI7/ieUxi9Reb//Kq2GxUASESM+J82F/jwIyzJkA6vfsNa892HaC+ENdAuI16QRZB5II
	fOaAQpWd0ppplJm8nLta2LHLEkA/bUKtQLtg=
X-Received: by 2002:a17:90b:2fcb:b0:341:88c5:d58 with SMTP id 98e67ed59e1d1-34353778f97mr10161802a91.13.1762699119023;
        Sun, 09 Nov 2025 06:38:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ8oa2bDV/JZ9g1CCPavF/hAUNJNmqCBo60PmRDygnciNNIeyHDQbrbNCCVrsDLl+kVYkWyw==
X-Received: by 2002:a17:90b:2fcb:b0:341:88c5:d58 with SMTP id 98e67ed59e1d1-34353778f97mr10161766a91.13.1762699118507;
        Sun, 09 Nov 2025 06:38:38 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:38:38 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:17 +0530
Subject: [PATCH v17 04/12] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-4-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=2381;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=KkC4QSxclwx5Tk4AVwolzQwcYruXvNFOfpqU998deKY=;
 b=SqWaS1L4R9/PRetPDl5ezV2V1ONox0X/KxMUmUzwxKvHFi1GczgvDsL8xutCsbzcMU539brQM
 euC4liUMVlvBRKiwx/WOO31aamwBf3jSBXBW4Fc21qvaSDRKVnvttJf
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: NoPhdy16WRAVDy9JBK7to38J78v9QRx2
X-Authority-Analysis: v=2.4 cv=BfDVE7t2 c=1 sm=1 tr=0 ts=6910a770 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=5CgfHzhl2afHKY-Ush4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: NoPhdy16WRAVDy9JBK7to38J78v9QRx2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX82NjaxVVZv0B
 pYKzUypyovKGgTAz1AhvQxckcsB9/E51SZ2IHSc93S4RmbkPpCu5E56Oi13U8tAKJoO/RurwHu9
 wlz1ksWs++DgHErQ2gR1UxmeFNMOza1Zq2H+3QRjfuvC4OIi02qvPj1Fjm7wKl0BtBpvKEb05Zq
 x23p7eOCvTADENooM/Gj12mhhcTdWmodwMRWsI5c2LBP67wVUT2nNF7GuZHQnwz8XSVpoXCeLOJ
 bCNDdaLziEMqrr0XP+rTIZQDY7FVUR2ebEctMPKoaIvcwwEprgvIk6Wjk0IZHxB98/VVvXjj0au
 NrArf///eUgRC787DBVCjQC/9fyzq5kLaw3o3tg/Fu21tyIBGpxxWv1XTeDlci2yqT3csZnLuj3
 QTO+7ywd2vlLJ9He49oXroIcdwooCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_063841_869710_9978390F 
X-CRM114-Status: GOOD (  19.52  )
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

Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes,
a read-only sysfs attribute exposing the list of supported
reboot-mode arguments. This file is created by reboot-mode
framework and provides a user-readable interface to query
available reboot-mode arguments.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 .../testing/sysfs-class-reboot-mode-reboot_modes   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
new file mode 100644
index 0000000000000000000000000000000000000000..6a3fc379afae3a6caf56ad0b73b1c06c43a9fee7
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
@@ -0,0 +1,39 @@
+What:		/sys/class/reboot-mode/<driver>/reboot_modes
+Date:		August 2025
+KernelVersion:	6.17.0-rc1
+Contact:	linux-pm@vger.kernel.org
+		Description:
+		This interface exposes the reboot-mode arguments
+		registered with the reboot-mode framework. It is
+		a read-only interface and provides a space
+		separated list of reboot-mode arguments supported
+		on the current platform.
+		Example:
+		 recovery fastboot bootloader
+
+		The exact sysfs path may vary depending on the
+		name of the driver that registers the arguments.
+		Example:
+		 /sys/class/reboot-mode/nvmem-reboot-mode/reboot_modes
+		 /sys/class/reboot-mode/syscon-reboot-mode/reboot_modes
+		 /sys/class/reboot-mode/qcom-pon/reboot_modes
+
+		The supported arguments can be used by userspace
+		to invoke device reset using the reboot() system
+		call, with the "argument" as string to "*arg"
+		parameter along with LINUX_REBOOT_CMD_RESTART2.
+		Example:
+		 reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
+		        LINUX_REBOOT_CMD_RESTART2, "bootloader");
+
+		A driver can expose the supported arguments by
+		registering them with the reboot-mode framework
+		using the property names that follow the
+		mode-<argument> format.
+		Example:
+		 mode-bootloader, mode-recovery.
+
+		This attribute is useful for scripts or initramfs
+		logic that need to programmatically determine
+		which reboot-mode arguments are valid before
+		triggering a reboot.

-- 
2.34.1


