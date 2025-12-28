Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927ADD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=; b=xp7z7pTDZX2hpTplWLIrJzwrxo
	dMezSy2ZAcM4PcUGej5/5qZQeTAQWGcCsD0mbJ/IikRgrUDrZPpKnErnUYJpZ7HnQvrfZedVEFdea
	n39ZVwnVykHKMQ6b8+HkgQF8wgR4PUhkl3GQ9c9saqjPlEyM888gMfTTp2A1ipmFgKC6o2Ut0HTjo
	3IlN8HpH38vSz/qimlo2IuQTEYPQ51ai0+M4tLq0Z+xZYDt5W6l+ZkXddFRWc9i52Pg/BeX973MCz
	wUDCbSNZvl73I3FBm35+aivCf0/lru8Kf6pRweZWUF0o8nSw6VPBCVguYDoZnUS4jMkkdbENSjvhT
	BdO22QTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuSr-00000002urp-1Ke0;
	Sun, 28 Dec 2025 17:21:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuSl-00000002umv-0PUV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 17:21:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSHBqcF2571261
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=; b=nB0WcuIFz485+40d
	dE+ut6bdLLqNe3CQeSbbZjux4HSYxUTifHQuvKnngpSO7N+6O22NhZI6AsJnL7ts
	uDAPujtbFUZ3ePh3UsK4fV7P7yV49Nr+JiH2T0z+cOT+NH1Pw8uhTbKhPXMSPxLm
	Ing5gNZCWM2S+mIPOYlRJX36WtL7nhgnmWH//lwk8m0iorqPcfVoPYSTZzItMUAZ
	zlp4/C2M1etLPepflviO+u7z7KRGjCgmXoVmluodYwti/lzuxQa+U6c52zauCNHI
	iBzK7g6jnmKW3op30hArEZups2AxxGTlZMjCwFtGbKHSkEnakdfqjI5rc/kDs4Y+
	/WON6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6adme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a377e15716so43110455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 09:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942510; x=1767547310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=;
        b=W7FLu8GzZxvDl5K5iHdRC60FQcjKUrqnlbsr5wYbafb0BjxpsQ5gKnvUXXbfyMdDPk
         5Yx0R7zissiLigKmnwpJ1Dc84yqHATTdxRzWGsZpXcZzFXdWoGTQ2LYLzAhscIFnWX7u
         fQQTm2oLhEB6q+xpdAwt3UQizJOawb/voP1hqJT8ajLyT8Mli8E3QuP6HKbrUtpISdlj
         ZvHVxrX95rT6PCh4o1eokGcLo8jUUZ9xhguNGaUEuxukD9TzYwfICYIeA+n8j1EM+l00
         c1UwaPHMkDmtadsK3bqxsyOjXlTzV5+NlJiPX0IRISzwFeTf/UUZ11Sw8sJHRnFw+ieR
         yD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942510; x=1767547310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=;
        b=DLfuGYcuQCENRjBYqJytWB2NysJtAcudPNTl1ZEIqbmeVxkwq63Y4BSI/QZUO5rWq4
         Aa8LcK2kdW2c8me9EgVT6bdr7pGUI0JGcrLc/wWruILvJJKb2aWyew3IF3yzxzrOZIqB
         Jf1BvWW+vYynQFm4pWJtnivO62UBAEukk4beqPMDUmFO7Zb4GhzltNUY0IMGe++GWuF8
         HpXgW4Y8/gmguHu0NQxam1XOqVIvFtSymztI3BfCMcTFv+6Ov5oWfPshWdmPAaD0/21b
         amnJ7Tx/lVrjnGWLHvty60YphQFRshqk+m40oIL0dehay1Z+fMKZvI7ZdXVw+5nMgfZN
         JIWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCucImDsJaQbmepQjrPCZjVKBoTSOJZWaMjpznR9+HUlb81BTCxz1pYpPJkLldyQlo7q8U6T5ON0i64oqRh5Qr@lists.infradead.org
X-Gm-Message-State: AOJu0YyrLIcNaM0pW1VH5hmFiUOul/tGL76F92o6d613pmPRJz/2t6K2
	X5BI2QK1dHAhkRr90fReB3oCwe9tFC353bFY7PQgN3eu8nKx9XAyPzlBQeDDZack6Ll4FnbPnn2
	g47T8+qkSoPtJW2EjutAQiPB2N5po4gztXV+MfYep9b4GQKQUJ1g62PDt0I9SEZJ3PVftQp3R+8
	a3vw==
X-Gm-Gg: AY/fxX7REZOFfV0oAJNCvvAFkXHD/SSCr+ly0SdCdiVHYayUewlhcHeTdz+DWsCe3qE
	5xKTTZaqw4NBhPri7dKzJW6Zn3IgX22pIIi4JUiMbpjFKtXel3nHfsYqqGKbMwaonQtzJn09jEq
	PL0PiaC8OURhc1bsP9//emki68vFedwLFWHxtcVMPOKghDkFO4dEOkeQLIYpOtX7ujnmCLG2ZAV
	ssG7ssDR85IDHJFIIGOIaxsAHKSoCvIysTmo7GEIsWyk4GZPHiXq0v/U79X5rtmPIV76EKTrLbB
	20GvIgSuOBqJByJ58826diZu7F4j9JS1pyABjMrbaximvjEOl3XmE5QU4e8Ca3Wz30GTF0ezk33
	LwHMBeEwKscAdbqiChUl0Xhbkf4Swt0e5ZIl1ahLhlxwvPw==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2a2f222b5d3mr297818085ad.19.1766942509923;
        Sun, 28 Dec 2025 09:21:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmBJ+0QhDD76t2QO5vv0elZpbdJjQleOtnh1ZWFEZMsqZX25brOC642q/L2SSYN5VG2XWLTA==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2a2f222b5d3mr297817775ad.19.1766942509415;
        Sun, 28 Dec 2025 09:21:49 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:49 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:28 +0530
Subject: [PATCH v19 10/10] arm64: dts: qcom: talos: Add psci reboot-modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-10-ebb956053098@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=1101;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0rsUdCdVzH+igD6u68w9uIiPh6ggbgRgiwDr1wBAjm4=;
 b=9blsmilZ46hLAnaGdTYSnuMNJ45gLWc0rN3wPvJFD9fSMGaWSE1FfJ7iGFzgLHy9rOIioHi1x
 yjslxJDIaGvDyPWOUvESfbSZkSJJaGvjZuAQsxDcSEPdEI1CNqvTSYX
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=6951672e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=4cuBwC7xTQKafrdxVH8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Z9hzR_pm3XFMFuDDXh647RS_STwAkK-4
X-Proofpoint-GUID: Z9hzR_pm3XFMFuDDXh647RS_STwAkK-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX19XY+mN41gTk
 lElJ082R3AH0yMFs37O2Mwy2TJoWMVDvuYml12jRHVsBjSWuKSd8Pg6FewifUGa0C92UKUP3Moi
 hc5Kxhd10tEIYbRdI1CJ1fnbX3+oSUnnh3/wJfFUTV+dnFngdX2g83fC16VhufwbCWzQQJrS2IF
 MZbLF8NHIS+7juegcv4nmfvp9DVGQ5kAUWqHIsJI4w3IVc7UZXLYDlz0D6OklZvP4b8jzNbRZFq
 o780K5IH0jxe9TrDYzV7O2QtfS9wy4pJaiNtCo8cC3olFgdtQ6vaaaNvA5ks9PAXSoiVNxKvULY
 OfxAjdgLbySaTQapWeB2I+vYLE8t2o13NXqDa8o1BbEuTiAzYo7vgZncfNpDal7ByKxJnOKDQKs
 tCNjyEeki/rXCgXQQ34gqDv6IbCAD7ztlFOKho8tx8+BBH/WKS2f+AGDjheEUSNrwGUBU/FO9JO
 2aUidg+xecpKykzBf2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_092151_177544_6EC55BA8 
X-CRM114-Status: GOOD (  13.59  )
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


