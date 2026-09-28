Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51ECC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=; b=xhJjZHAdaJcAiZPRkC8PdA18DH
	AfognAnV70eXzzaW5F0DWuWdL3F6VqCrikBBLqLwDWtYmekFzc+jBRnzOOYXt4/Jp5nY8yvYBl03J
	6E8JZFB2UDQTeskqpHIVf82Ikt79v9bMVLPC35KO7YJQEGdzhHCmeJwLMUMzSSL3Z6XjVw+zLKzux
	dA9H5ZJ28PXsAYmIsp+ZjHmx9QCnuHPxeA21gw2/RAZ8F2YL25+HIUYn0DiLnC9w4ZQPTbL/iKp5/
	Y2Rq5fTGiMNEuN/seVRvPGCKB4fzHvcSeyutNC7zgquUPc7yZosQ8prsGRgKnZFcP/z1P4hBNvdha
	cM2CQFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4aB-0000000HQd6-2n8I;
	Mon, 28 Sep 2026 06:11:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4a8-0000000HQar-2WId
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:11:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1JA9h1793950
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=; b=EOZ9ZjuIE0dduKpo
	B6a2rcfZiNXle3ufVs7znH6/cZ6JJDFXCZP9DkslJe/QkLc+ymFVpZP+s4xD/ZbN
	h33Nt5onGkNeBDusGwEU1GVQw2mNpcow1gLibzZ3YeL+O+9zhV4CyZxUdsk1Me/T
	1RPhMa6CeK77aQoheDLOTGloArl/61SZHFTihiBbAdRQQySW/QhcvPUDJVNmK0ge
	uld8V+OzApogWvsR8NgT5ueCX5oyt/R/lncIq10YlIO5ByzuE2HfMDcyBmlRUPC7
	w4avWK2ZUl1REN+0KGSHOqdfHM6KziTUxsCvrolM+sZS+5005rpQeOZYe1PhyYA7
	cJWrFg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526mujr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:11:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso2252767a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 23:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575879; x=1791180679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=;
        b=PHv+FoHqOtTdup/UmaAkIsDUqrj93NdMcf6QGSy+ugpJbAkIok0MyuKsMOfSVR0v5V
         ojn0YlVPZDJlQNEwF2vX5kr2shgvoc5vDfhPRVOjXMhI7/iJGOhzU+eAG8m4IMd9JdSR
         luhIh7B8tonEpLzTqs4jsnzwFw6/lWfv8/Ndxe18lfgHwRt+0iOa7tqeM4vB4AA+f48T
         XTVz8OpHsDCDjV8f2Sv32VttNJh7XJFvMC8xMWurUCnRd7pLuxg2y1LS8q/zm15IGrjS
         0DppPGWRycXJeT8/3OOB0NDr1N8mibSo7eMCw5TAAYJZiCmJjNtlvjDUs7C1Z2qctTXF
         3Qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575879; x=1791180679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=;
        b=iu1GThZF9HkGZjAN8Xedf8ASKxaSPGql4c3nVX3qLImsobqridz0dgHGbK4hPz3zp3
         1gK6clglu4+LvHi1uTrcfg7fDDvgUyidR0uiSdwyM7lScfknAhHBurgrvGYJ8rqrKpY3
         iqO7H+B6C3OyixLiVx28Y53x0fLqV8IItTu1cCMNGToDLfEcIbcBi0j/Cx2taMwV7aiy
         zKzdS4VHUP6p2JeBCW2XbEliJZJI1kg2deLToK/8diAJCz1JsCPPeoZpm0SwGWXAKxa4
         9uQAlznmOIcdZL+cZOjv+LH1rHTkj4Aj7kW60oxFY2tQNSGbVPJ2HLoPth2TSNmeSdzF
         Nrkw==
X-Forwarded-Encrypted: i=1; AKwUvBwxTxQQwV4PdXMzCgNWQKDVJ9rBsB5WT73Jd966Jd0TCBIJH84wU7FWLOSk9qiD5Y8MGBUfw5ut13ioVOZipPfN@lists.infradead.org
X-Gm-Message-State: AFq9FYK1ct8kEEeJ55M7lSra8BuLUuuLSh/OA/+l9moHIyoLnZQ5+jMD
	Pp/7gaX87WSY/UjKu2LwT6hWMs7i9lmcrCFpQCvjuBv3GUH9Lu4Yg8b+2YkK9em7YyKP2VkSRJM
	jrF2f7g1eSJrdSeC1iI9cwug4O3qNApqrnuaW7nyBXUJBpI89M1n9nTOo+9x4Qj66MeEOmAvRQI
	KuNCeTUtp1Rw==
X-Gm-Gg: AYBFou3qypzKYskOooGDSdzy4ON3NjaUzNL+9TZv/JkvyV9nGQHxaPjVjJPH72bggR3
	rM3hAnuj+t9+Te0TjXLtuST+XZiMD50RybdGfoogf9H5R4TaGiwDFzJ/bclkRlafV6nPRhXPard
	AE/vZrl0XVhKBckmd1pT10tTz+9VQU7ClpC5Traa4/43OFVo3/whUgzXdQrHmaGLGMN/qW5e8Fn
	P952jRVxER5DBzxGTVWLhAcl52RhcsUuONwWoA/o7dijGWRHAONISlynrqWxztFuUs072GDd16p
	bAhkoZrvAuAYMsu9gHpqvdBd2BK7VlLIEffuOkgtTRoiOBY9ld3fuI6XjT6gA7tWAwIVkJuDQuO
	D3+fCnPGP2e0GES33Sv7c9/yfBY08fMuSxA+Y
X-Received: by 2002:a17:90a:e184:b0:3a0:dec0:c0cd with SMTP id 98e67ed59e1d1-3a0dec0d419mr3306182a91.28.1790575878524;
        Sun, 27 Sep 2026 23:11:18 -0700 (PDT)
X-Received: by 2002:a17:90a:e184:b0:3a0:dec0:c0cd with SMTP id 98e67ed59e1d1-3a0dec0d419mr3306155a91.28.1790575878091;
        Sun, 27 Sep 2026 23:11:18 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:11:17 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:22 +0530
Subject: [PATCH v26 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-10-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=4fTpCSkuJ6PFbWarr8sThQ/LuS8y6G1v4667LcR6KHQ=;
 b=AMvkpSWzxwQY0CuENEaT8ITCw/S6jnAL+oA3VU3+sR8bNDE0XnmTyr0/xXJtY9qk0oE8mfl7T
 unyxriQsCX6DQU4c60nqAj+Rn637XuMoZInvm/6h76J6yvlr0MHSgoE
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6aba0507 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _nm0CE3l7_6gttlC0gAOdIOu8M1BagKV
X-Proofpoint-ORIG-GUID: _nm0CE3l7_6gttlC0gAOdIOu8M1BagKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX2HiHdoNFmlvL
 nUe6eN/2ul4KFuE0evAiSlnTc+gp9CvENfNvNZxO0DhzKJettN4l6HGIa8Daqg8ZsA02CkDfAGT
 j7vWYCF4kv4EVks46awxSvKZjqVjCzbW3GsBH6zgXN0QSmCjwYDe4g4qtrZy7KMLBsbfv3SUepa
 tGSjaMjSZ5NvBZwsdPUbVIuS/waAra5/8GEoAmyZRlviutRBA/gWdLh89UZuR60VZgLWJIupEfP
 0gxI0JQX6Rh0y2JU6/xFa2aeA69170cuBtctDgRNbnR6Beo4nbIir6NB2eaufCyMTH2cNzl59Uu
 j9ACG/99VVBPEsnKaz8flcxxFNL1/h6XlLiBf/fsdj5Bw/w5d4yhGxi8ubYzlH7M4IPIjXcIU59
 pZ+BQS2doJLyjZLC1ZmzM8f6srAsQhCBzEFjSmAVZrkHZ+pbnvlTj0GCS63Q3p4jCi8GPmWUxSr
 3VKBjTAX0flTMB851BQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX54bx3F5DprPx
 iXb3qtuzuF4V+7itiYDayCi2tyOEplauzMfNOWMa48LcDi5YabASsJH2UHn1oujz/BQ54MHSeR3
 AbGKs6odxyAqCwXU0bAAAEKz7NbJWmA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_231120_763738_34FA0569 
X-CRM114-Status: GOOD (  18.14  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

  Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 047b4efb04b9..48d3519f50ff 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -498,6 +498,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qspi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 531cf41b94dc..a2197dec430a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -581,7 +581,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


