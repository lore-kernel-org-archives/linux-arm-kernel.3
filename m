Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8FACAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zriVHHzMQQ8ELUT932V4l8RDRcEXWAm2X8YnUX13NY=; b=ST+U7dtX21CV1JzhVJ7AM6QtRl
	uSFXdZX8CInYZQHm3d1uUUukjYuz7+w6l1wpVk6/qLaMjTuBCJrfooeE3ylZlZPDMoDNL2TovKavk
	4TFMBd3gkLO1ljApbbQqi4sizzp4QuUgaFaG6ELkqoUcN24HulvSWDuaOxE7LJgvce2g9HSP/aY4Q
	HNXg+thVvF9L4ur7qro5u/ZAPKs/ilSWzIyufNPM8EHB7zlYBfWnvNZC9pYJVs0SZTWOtp/W4clre
	w3hqfgU3/ARj9F6/Lcsl91ho4epxbCMWdUpyiZRe8dM3MqQt56oDWsSyt8kO8EcISMKml4srjcglQ
	DwumGKdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gn4-0000000AXPW-0A3d;
	Mon, 22 Sep 2025 13:41:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gmz-0000000AXM9-3see
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:41:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7oYVS005183
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zriVHHzMQQ8ELUT932V4l8RDRcEXWAm2X8YnUX13NY=; b=lbq14I6wezBqTHbX
	C3tBbifWxovD4vQWscjBArY3cpwx8tjFzHQCeVfSnfmi04z1gwgzQmE5UoCuSI3q
	zP8OzWx8dAJjcMnPpQrM5pDpFKD68xu1/EGI/N6IYUGiyObySRVM++qJHZv/au/2
	7eTn2PKlh1DxOI5Sjrg9ciHaDM5JnZqepahHsH4a+BctuJOjhZpDAOB8eJlmI5+F
	VEtTrDvcHV0uFVivcQejILSDBkH4l93C5aonapUB8rItarW320SvBHdTHGwfVeOY
	IGoHyb+/p1wAnMu/EChVBnaFxlolZ2EntobmHbm00ur5KSp9bXg7yY+Ql6fiKWIs
	Fkt/WQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b2e112qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:41:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-268149e1c28so51275925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548468; x=1759153268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zriVHHzMQQ8ELUT932V4l8RDRcEXWAm2X8YnUX13NY=;
        b=XVzmqeemrrW/p1Kjzcnj2D5o07E6zBPNCVM+IOIJf14Q+b3N0LbGarZZkzcry6kRt2
         2FD0K4jx4XfofS/G9Q0exTy4x+NuuTj5+PsAkhY4um+uFtDSrihsXFNZAtO/BaqI0BHo
         VzCu/HYFIqeEtIMZ21NIyQqU+yDHxlUchioGldqq8GNzMPR8jkqD7CPJ4ysrWZ3QfLpK
         Zgi+RTlmAjbiI0M57DvEefc+IGhmJhWYIxnVZaZn/L8eKlMuR/KO5wFstLeFH0/o5g8G
         3QcloZhpEzF5GMUO2MdBn24ubcGjGlB3a4wWQbeOQKjAhIL2Og4plNIhMmHy/z4D2vja
         nsKg==
X-Forwarded-Encrypted: i=1; AJvYcCUEbSuZErx+FCIGt0SO8h7MLznxn/gSXBrzeP8C5ZBd2sRlxSbWi/8uDDDyGMx0QsjwUaE+Pf7kPkR1KhkSKdwR@lists.infradead.org
X-Gm-Message-State: AOJu0YwnLC9QgZFoRwZisCmi19l+1VwsK0gprQtoGAONePfTF1wHJ+NX
	43wNAtPcoL46ggMqkGqeU7Tne5zI8DJClaUk2GA5Pu2wQ39sio3g+TA4DMwVkL1OUn2UVdV/daa
	jPOZ2ijXR5W845VZCQBxK5zCE38QKZqvksvTfUtF9c+4gdxeIIZpITN2+/ucMnjHrOV0SGiNI+Q
	Ubtg==
X-Gm-Gg: ASbGncu7ghhmlIyCzWZsKa8cq/XKf+LGY5+n81mj/DUaGi16MKCEtYU6X6smv04KtUI
	LJkOUVa9kD3E0Ko/bH0M+vAJRUdNpstze4pldbjEVGuExb0pjj+13Hgp8i/0u+BF2MdT/LK4GkO
	x6bOX4DfuRORQ9MJFU/vDke5CxTjHBjZfCu/+CChJuxAXYDgNxjdDnz5btlV5F/SNkjT02FGWsg
	hEZirM5quEiU4QjQR/aQIhSEC9PCfOOPO5wG3z4WQh9Q9d0nIbVWlg63AEoy0vEmMzGJjM6KwC6
	B1nSu3zjX4G22kiEFwzTbymxs6HNYxZNYCY0ngCdJlCqTheVzy4qFTGN5KzC7SprVx1x2FwKxHC
	H
X-Received: by 2002:a17:902:f645:b0:258:c13d:9b1a with SMTP id d9443c01a7336-269ba534dc8mr157813845ad.41.1758548468269;
        Mon, 22 Sep 2025 06:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHduNm914Aec/xKw82GcSDYLVCzvWXbdPEGvEZBtKD9TBFGvd/XuvNECs8ldINaTjU69ejDGg==
X-Received: by 2002:a17:902:f645:b0:258:c13d:9b1a with SMTP id d9443c01a7336-269ba534dc8mr157813555ad.41.1758548467797;
        Mon, 22 Sep 2025 06:41:07 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:41:07 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:14 +0530
Subject: [PATCH v15 04/14] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-4-7ce3a08878f1@oss.qualcomm.com>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=2381;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=KkC4QSxclwx5Tk4AVwolzQwcYruXvNFOfpqU998deKY=;
 b=uN/mNSJciqwPL2c846Ag2zmHUDTAwr0+DmX3GeKjBJun6SviBcqN2hIimRUdXBy5VUvYhksA1
 lXOvd8ZvtgZApCFxM4p+PgWnnQaGrV1OVcuhR4WyI0oc7VoQWD4VOt4
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA3NiBTYWx0ZWRfXxulaeebwJLuU
 EM3hsTXVe/MmIUPXtNLcAHePtFJVI8CX/ewFX/Piys+G6PXNmEYt/egSl4s6nbhsNzMXlTd8iCm
 oNbRUY4HDHrMqCjZokmJyBDP92RXNXf4nBSC5cl3JNSNeGP3gpbXQFhhVq81T89QgOHTtsQ3oD0
 d2SNJG1DtgwW2I0mMWHhPslnspGeRKpCtWnQbruwRIO99TwTjOOnzwkqlUc0Whjf3d1nx/mASpi
 Z3IjLGy3HX25F1WAl7G2b9nMgu1PkcRkGhDKIZ5t6TVOZpwEEPQf2P+Ycn5XjbcYfSJp/pBdA2n
 pFENKXWAqZuwtJDQL7/a5C1ePKeUBTd4mubJGrvU36ppJj6K1XUO7ImFnT4Y3o6HdZi6Y5rEVt4
 hKS26EPX
X-Proofpoint-ORIG-GUID: S221KoL0fheWkq6sbb9INJ68hI1rsB3b
X-Authority-Analysis: v=2.4 cv=HM7DFptv c=1 sm=1 tr=0 ts=68d151f5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=5CgfHzhl2afHKY-Ush4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: S221KoL0fheWkq6sbb9INJ68hI1rsB3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_064109_984942_ABF4A3BA 
X-CRM114-Status: GOOD (  20.39  )
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


