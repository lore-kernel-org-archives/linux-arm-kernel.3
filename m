Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C88E6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=; b=S58v1YQAa7cDF9ZrzQoTNVeb1E
	8zysB9jce8lpSMQUUkDt6g8UdZYqAmousGButcB8cNM6vv12v1A6/36kgbh61NDHoWAGedQUbGJrJ
	M/IePXh+sQWMl4Rdxctjuo/DXNJYeNjyPLPNRh7c+yfEwaYk4IKSIUDfKCn03HdeZJgijRlp+weFo
	iRdLLf8JM1u4G9GvmMyMEjovU14+9I8lUCCsajYgMj9FVn5f6pfmZknvYwPElsUKRc1fLczoe84CM
	DQaj5CC3DUtQSEl+oXDYGxFDGDCDTVlQlUiNT0rGnH21s0LZvtmG4ZWTVXJGmj6jwYVh/aa11GKoJ
	3AbPhprQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5sY-0000000Fnpk-1myK;
	Tue, 23 Dec 2025 17:08:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5sV-0000000FnnV-45wn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 17:08:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFvWAm2747756
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=; b=djir0/srkYtHhMZy
	PbTFSV+M1L/GEqN6mMAh6j6dyBY4DcYdLwvhpoyjz2zIm/D0K4l+2FI2NRcMvWHV
	h2miwNwtXuRIvxXly/jgJOaErGWQKvluSOHwapE+Q+DgaOACx26Tx6LVrCpz2IPw
	sxu5eK0GlZ2e4xj6vZSOzsa2kevbimgd4pJTzO+WIYwiR9ScRfTR31Mdpq3vByn6
	iE9bNzg5B8rP/bZbxbu5DqbtqpoTBDiYRr9vetkqyKb2dKIjLoWYUBV8Hp3izTaf
	6kfCsKIl+zdYj6QRC8McdtwE91DJmhLMXr2J/sQwpmrkLWhtTu+6y8aIzXrueGzc
	VWSwDg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5ctvht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f177f4d02so115509515ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509734; x=1767114534; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=;
        b=Sd5/OCe0PtSh7gsDSNJzWH/Yrk3pCaFcMpQiFVoBgo6shbQNSpAidBeU4eN4UruN26
         ryutRDfK5AJUTN98SuZFRClDQLgnvXJuQGwA0c4KrtW2D7x+OzvEQ6495uRGD7/rHhMd
         yhXZZ7DIstInc7gCjsDd/ahGLrsikiWq7JeM3PQCjXbIZr0NDo+/5279oW6jfnkvLcpO
         ohneMdk2e7Fftd3N2Vx1kRBRMKCObLxgOPj2FUiWuxpaTU7vDR9Mi+kLVs0L9vKeS/Gk
         Dj6GTwWyy3xVN5/7iZWyUCIlgEYTWztkQfkGINvTNLfdc7hzBwu+28BAmB/DkY5YJI+O
         EUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509734; x=1767114534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=;
        b=woOyWmB7Cs6jMn8wEwxKUGvfgQO+YRrCuSGsRFPkUB2PzNkCG/FBr+waXNyqOdD0Sh
         oGbn2364lexK6newZfxRsHWuJBVXJ0p8xzIjDE3H6yqPRqzY3qPEWGzyGZdYCgzwAs0Z
         OH6JqcGyocRvE/mhOFz1nV+39j3yDoPDn5XaChDiSfSo0eMz+IoHdIc2o2+/Gq94COv2
         aBAmQZhr55iwrND8Gq5+Uwfk6JpxJcZcWcdPWCaIo0cVTULmcV2BJGPLHUTslJ3egAwN
         /f1xdZzI+Cr8GxCgIDGM3FvLs10T4ksO2MKxZyNpfro959iMxX4VbN0JuVxMkZ2fxE0W
         5Rdg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Q7A4UR/gJF0HVsbhUKNQGRyMQwt/NeqfLdkXAN37c1dfkyYTGounRWhW4H08xpL9DNO0Lf8bdbjTAwgaGSUw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/jkxPUal23h9D0qMincasa7WZA+YAuYxokKRxbFSv//bFqNrJ
	N4TF9fr6xXWcpSjYbr9dNPRwqzrjsdGskFYLGYNlPJU4TiivREDK2NRun+hJKOzcuzLh82ggh6Q
	T89izohcDVoRmk/EHYAyzyK/lo02lvJl3p+vORFczVZSWcgT0wI87tYYabAlAU+T77+xecPu5Oo
	ii0g==
X-Gm-Gg: AY/fxX4YWoJ7u9nPoPzznWLd1jOUgG2+aloUUniYg0IuVP1a02gbrn1E3o1A8F5d6zS
	oRq5U4fRN9iQlunGIIUCs2YbBs5M4s8MfPvknHlS/ToQ9pfSK8mwjnB7piM7OMlUK3rIJhOeGyD
	AKNz5fstjabyI15Bkej2pzDelD6rCFG+hPtAQgRh5Yu6n7aOOz8AM6s/8VK6k33WQm5iBv4BtR1
	Ybwx3+7ScknHP2LvwvL3fu+bJWhn1MWYvDiMYa81OwQwlozjzcvPEwA7/aQ5mJcjNvIuoRYP4R3
	lwkL4Ir50XLlgVQTAeOXWRb8HBhAB04gdy0SxzBChxN/EAIjNLyeFG7f/7irkDLuAN7IH5Sr1lA
	J493dtGf+xsXhyMCc3jXFSV/c4Fh0fuKor+uyWdbwuc8uGQ==
X-Received: by 2002:a17:902:d547:b0:2a2:acc5:7a42 with SMTP id d9443c01a7336-2a2f2833082mr153875705ad.48.1766509734466;
        Tue, 23 Dec 2025 09:08:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3BOO29YtCZeSocm5bw4OEe5WRvx83A2dEk1ULNixXLH3yXehKh2ztNeHGe61KoH5qcRQlmw==
X-Received: by 2002:a17:902:d547:b0:2a2:acc5:7a42 with SMTP id d9443c01a7336-2a2f2833082mr153875355ad.48.1766509734023;
        Tue, 23 Dec 2025 09:08:54 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:53 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:41 +0530
Subject: [PATCH v18 10/10] arm64: dts: qcom: talos: Add psci reboot-modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-10-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=1101;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0rsUdCdVzH+igD6u68w9uIiPh6ggbgRgiwDr1wBAjm4=;
 b=M6t2WQm+DfzWeVcmizN6fQJnXCGH5hGQ4Q/0xf5/jF/Oal8bkHcXh2BlAuR++9oa67NuXqXLn
 M2qwoeEe7ByDSYZkJJ/S7BvqYMDmGpBhjYqKOV+vY7OoleP0iESUs+z
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX2GN4qteFhZJi
 4MyQUr1lsRP3OtgHd5Q90moMvIlcpTWgKorUSjlGhxtYCbhGIIBZTgDs2nqBh3Jot751lIIeqIT
 0L1VMFKm97u73kK249lwr8QYcsAGsfQt8sYkUjHRbP1TmT8toblgzxt1kGkAOG+nJ4m0X4wu6nn
 Ufy0vNBdtuI9v1Q0eT3R+9nBxpwz0U2IkO2Pb4YZSO0vXzeibzzgDJeNqscJDTg0E0en8RZ2Btk
 Xik8O5rl0NTyKTch2vAGsD4wVNB3mZcIwAzqAA+6ScqJQKu0SHv1OSangEwYoSVae3kPrv7luXn
 NDdg02ggfw7+nFu0pyAVS+YXhAD7wE1B7aCy1V7CZbLszXz/lnq5I/Sbee+2yI+KlJtcptYf/Qu
 VZEjIBmwRis2Oet9I7ZSZVnrdRIxxp1jGGXZB6Wshn5HHUVCp+WMV83mg5/5W5Y3ea3FIG6vGHp
 g3hLeCZFlDDoonzKLZw==
X-Proofpoint-ORIG-GUID: fZ1jT2oCH-gnfV0hHzuRKnnCTfYWsaKB
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694acca7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=4cuBwC7xTQKafrdxVH8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fZ1jT2oCH-gnfV0hHzuRKnnCTfYWsaKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_090856_029124_A9529F9B 
X-CRM114-Status: GOOD (  14.03  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for talos based boards, for use by
the psci_reboot_mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 95d26e3136229f9015d49e2be22f6b28f1e842f4..11a2cfa209065776a8ae61c6e661c09bb871c400 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -613,6 +613,11 @@ cluster_pd: power-domain-cluster {
 					      &cluster_sleep_1
 					      &cluster_sleep_2>;
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


