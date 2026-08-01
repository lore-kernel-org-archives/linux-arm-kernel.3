Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C59C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 15:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZleIZseaEMrn9Tec7tNkxF2u593mBiXUepyhIAGnP4=; b=cqBLYIS6rQGHDChEVmVpyZG68/
	gskmi6Yjh5BdtCfIf0F031Z9YSuG0su4osZ60gr6Bj9A0ESbXvEdMNAmypuH2w2eMo5CJE+8sDReX
	oaesaP+BMfY2mvhz8JJUn7hVBKRoIkDsAfDRmbkXrGxBD1ZSoSU5tObo42F/UMUydGn8JC8MfJMom
	Bo8Qa4M8iliGAb2UVnxetOxWHWmsDuS6F1Mp2axITwSx8WbOQjaQOE4StWb4MBhIRCAQ+OAimvaDn
	3p265JGwM3xy0L4aWY1+TP06zq11TT/XJeU2zEXhmMLJEh4C34rvw7xHoKQ4Y0O5dvAmyrHk1Ai2u
	T1z9RTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBJG-0000000EmLM-3CML;
	Sat, 01 Aug 2026 15:07:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBJD-0000000EmGw-2yEv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 15:07:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CabuE2738123
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 15:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZleIZseaEMrn9Tec7tNkxF2u593mBiXUepyhIAGnP4=; b=IRIvkMxQ3OM5r1xQ
	yVEUK8lADaHv+v1O/sr8QI2JNyzmQTCFDPd2X/ZA3jVbgfDJnpEYwwinR5++wXE1
	rIUsSLhJffHI6Z7BVHnwEoDNTtejNhwOkpvjhW82WN72TYtf+F1c7/5PsL9Thf10
	bNtBsWG1RD0bBSiqwo3IAKtSB1Tg4vc4OIjjACSLWh8XUllaJ7E/NH9JfYBY1lwI
	PLx0tZ8Z7Kj1HHBLcJTLyaaAAokR3OI5S/5pxbzGk8caQwvRexvF7Jpkc57AJp2I
	4Imk/1/xZoPhFQuo5lCDJJcqFIgyqW0qmGFym/7wile+ue1UIrmJF3gQWAZPIU51
	HU+6Gg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa380ycd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 15:07:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so15109281cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596850; x=1786201650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZleIZseaEMrn9Tec7tNkxF2u593mBiXUepyhIAGnP4=;
        b=WpIP85apQEIcNDDa3May9OuEHbGRK74NUTYQ2PWRGncxZWZrn2F4AdHYvx5PjlE2C8
         xgGtFyQysOfOEYIZGYAdg/BzfPwJ27ouO8kgdKfVNZiGGUCFw1D6m4FOOldVHBfSy8mG
         QLiqygpGAYeGqpqvbUFXtg1/sUYuiGDDl81JAcVe/JyWUV9pGO1oCSj7Vpl2krNn/ADt
         QqntQd2xS4aG0LvN8oTv9GpAYOdS2zrRLkGm4rWGMqWP+EABBpNp66yS0h2iIy++u2VF
         ckdna+6FXdjttlnX+o6Wp8swJiiBYFrdLGCnN81LQl6zMyL0Bnu0Az2MAq4sSR7TJ6Fs
         FZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596850; x=1786201650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZleIZseaEMrn9Tec7tNkxF2u593mBiXUepyhIAGnP4=;
        b=mBx1/URbT9o8Q+2HCOjdwCtDqt1WD57KAYtFD0C8Gdbs3LDDe0TNFQm2ywyDWjmYVa
         GGl4PB9IDzV61D1L0Vt5N+ihkHFuA1yHCPTS5911zR0pPwEE0iPas2adUPvyBk9DB1we
         deXrl3WVbdEDp2oRZWba6U/Dr7uHFzsgwPSd7BBUXS8BMU5ga6lOm6SrmJdISKA3FKPy
         cgzoqGYOO3vWw3n2Hk7lgFf7ziRzbGjpbafFSfgE8hsmYKxZrUtvdjPd/NTGD/BgAZGu
         YI2WALsBF8cWfeSSWvg9ddOr4Jl6HW5kUp38mgnFccaOfkFyhrn3je6TaSFk5asnBJ2T
         e9bw==
X-Gm-Message-State: AOJu0YzLxVS1nguN8nhI315xPObkzYY/60wtPRJtQg0kspkDNOmCozX0
	aDNxbqnjYtL5NxIGOzyldn4fVOlqvbyF5/yBhltBPNoPjDE+29Y6dSQ/F8sogrOpuYNL1ZdPTij
	1VhUSWXq4jF63CzaXyHxsFTWH5yilA90RxeTOFodDgOB9Dtoo9G39pMESVc1MrKcCm0KqbuxAKa
	DiJg==
X-Gm-Gg: AR+sD10RsIebbhJ3VHvwQ+1M/AGsaaQiBolk352RdgJZwvpCpc6FaadYK+uEIoHU4S6
	0c2QWr72iQA0yi/KUD7sBEXE/t68PpyLMwuzoC0t7lK4ZQEKsPpJxtpyj127y9NL42E8Zaeg6pC
	sbYO2oXomgPks38weXLfxmaQoeKd3tVRbLIaqsgwF/uV0b9QG6bLcCfKulhL3tTQ6jLrkGa0SJT
	esMX40t/nbfTCdrDBhAnIgs44PmrLYS3WXUn/alXdXBsBEWrg6GFyfC/7qiqfNzk3jljkeDlC2Z
	gI9+ZipXMAV35bLjUaC2UPcGBlb3VRrb0H5NGVHRzYsOaJilXYeaHRa6IppRbTKOycoOfhSN4JP
	t0/6/ZX0aAXJMTr36wT5nadSc
X-Received: by 2002:a05:622a:4a88:b0:517:92a6:fcd5 with SMTP id d75a77b69052e-52b566b0331mr83949921cf.18.1785596850150;
        Sat, 01 Aug 2026 08:07:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4a88:b0:517:92a6:fcd5 with SMTP id d75a77b69052e-52b566b0331mr83949291cf.18.1785596849754;
        Sat, 01 Aug 2026 08:07:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 17:07:03 +0200
Subject: [PATCH v2 8/8] arm64: dts: fsd: Align continued properties and add
 missing blank lines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-b4-dts-coding-style-strict-v2-8-f09a659ab80d@oss.qualcomm.com>
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7745;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nA+TsS76rvMFwxdslTBosaCPkOYHLf2P5c+EcUT68bI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbgucuPd9C+yrm+mGAyJSMxqZ7Wc1WBYAhBACF
 iJlNMoQk2mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LnAAKCRDBN2bmhouD
 1xulD/4sWCuG3VoFrsz2D+fV8x7gNLRWF5q/97dn8RdAqAdf7n2/7sF/j9TDSP1HAhf6Ok7vK/L
 BaXBAcjoysHqK39uN+p5YjUpU6BZE8Kuk4+8c2/IswQQHnu6k1U3wtePwuwLdbpkD1M2l0GB8SM
 ARgVWHN0fVF8/qgGTDLvXaj3tsPtIMmmPORb0ybd6ff8yy5SKPNBffmNJ+fQvkaVf4p6H9juUV4
 92+5POojLasZVn+91//aLXWtlWNVCJosutVqwJtpVPpAvS2gJc1RjYb0kzFyQP7ug6RX6PYVygI
 iNiHTzVhpTNHnjjg5UDkZPtYqtIfwoU/9V93OsI3I9Br6xfsbhQCfkqzyR0XLRPhSHbWm3NKpHq
 Hob7gK/ZN98A/PlPUOw2k+mMKcGoXVBpJ10b7imTyLnEqsQFDsUjMRsF/SCyMfMYlpMFCkWxGLK
 7LnyipEDERbKYLJGLWkQC1ehHcCHv/uS7ahLNryTJJWF1gBye9On51pjdab08v06RWRvMx6XbPE
 tBaHP7eHyizTcdGiU5+4/nvXWeBSHfcLDj5qjbGrlgj6qHO6oDdj/DAX9gd7Dty9tyXVzX9V0oW
 ez46uWH7LrQRG0wvFFQFZE98/9xk7JwHFFq9TlRyQaaGXWpcBrw78VM0RRCiMId4STkFOmh2dnF
 uPQKT8w3W5AiAUQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6e0bb3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=dn6OTeshHBKSxJNNhkUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX3q0vOW/hXUbe
 LdcGXsPveiy9OtIehqSRGRTZdrxIDHj6OTwyaWx5bws+/ZP0ZPH1CzaMJmH1jzllhRg9qPRmOOw
 j3pU++sobh/BGHndlecz138DK2ll9O8=
X-Proofpoint-ORIG-GUID: SDru2QzAWY2Xnh5NJy9P-MKm4MIKo7Qw
X-Proofpoint-GUID: SDru2QzAWY2Xnh5NJy9P-MKm4MIKo7Qw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX3sRMe0agqMtr
 4jmYibKxm7pMu4pjeG4RIWykxvBfCYUH10PBLUEF9r8yCk2KM5OgGGwg1Oo3RK2KeEEt5urUy+e
 3rcDLx11Dpn4B43VBXsD1E2ddimK3rbgktAGhgeomErkNcFKlm25EO02KkoYTBm49AGwpIDYk7u
 WiyPx/Rs/rfkoxuRhSS3+dkyi9Gbza/jLQf3GtKlVzLXzzV4suYKAc/NRgnUaG9/4dbYosbpToy
 RBEwd3WLa284i0RykZ8mEU095O2Dq+ir77K2hjpNUPXjl3JtjFjdOQuAzaWltxRIrOie0nsyVd5
 ljpxr1fnfpVMTb6dA29qTg8Zg/YNhPQ01aVr9fRgtVpU5Vesm9donl6iA8NUomZ15AaQ+vnmF5J
 3r5hzQcILikPMmOcG2npsZrS62MEl5VuNSsARxx13jGRpyYrqLIDDAxLOg88Z1MiB1TJCd1jjIr
 JiZ4+7LI7l/jMMlT5AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_080731_758861_DF5BF341 
X-CRM114-Status: GOOD (  13.67  )
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

Trivial white-space only changes to adjust to DTS coding style and fix
dt-check-style strict warnings like:

  [required-blank-lines] child node must be preceded by a blank line
  [continuation-alignment] continuation should align to column 39 (under < or ")

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts |  2 +
 arch/arm64/boot/dts/tesla/fsd.dtsi    | 97 +++++++++++++++++++----------------
 2 files changed, 55 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 73b6a25e0e4d..503abe52a81c 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -53,9 +53,11 @@ simple-audio-card,dai-link@0 {
 			cpu-0 {
 				sound-dai = <&i2s_0 0>;
 			};
+
 			cpu-1 {
 				sound-dai = <&i2s_0 1>;
 			};
+
 			codec {
 				sound-dai = <&tlv320aic3x>;
 				system-clock-frequency = <33000000>;
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 214d33ca7177..6766c78243a3 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -43,12 +43,15 @@ cluster0 {
 				core0 {
 					cpu = <&cpucl0_0>;
 				};
+
 				core1 {
 					cpu = <&cpucl0_1>;
 				};
+
 				core2 {
 					cpu = <&cpucl0_2>;
 				};
+
 				core3 {
 					cpu = <&cpucl0_3>;
 				};
@@ -58,12 +61,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpucl1_0>;
 				};
+
 				core1 {
 					cpu = <&cpucl1_1>;
 				};
+
 				core2 {
 					cpu = <&cpucl1_2>;
 				};
+
 				core3 {
 					cpu = <&cpucl1_3>;
 				};
@@ -73,12 +79,15 @@ cluster2 {
 				core0 {
 					cpu = <&cpucl2_0>;
 				};
+
 				core1 {
 					cpu = <&cpucl2_1>;
 				};
+
 				core2 {
 					cpu = <&cpucl2_2>;
 				};
+
 				core3 {
 					cpu = <&cpucl2_3>;
 				};
@@ -456,13 +465,13 @@ clock_imem: clock-controller@10010000 {
 			reg = <0x0 0x10010000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
-				<&clock_cmu DOUT_CMU_IMEM_ACLK>,
-				<&clock_cmu DOUT_CMU_IMEM_DMACLK>;
+				 <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
+				 <&clock_cmu DOUT_CMU_IMEM_ACLK>,
+				 <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
 			clock-names = "fin_pll",
-				"dout_cmu_imem_tcuclk",
-				"dout_cmu_imem_aclk",
-				"dout_cmu_imem_dmaclk";
+				      "dout_cmu_imem_tcuclk",
+				      "dout_cmu_imem_aclk",
+				      "dout_cmu_imem_dmaclk";
 		};
 
 		clock_cmu: clock-controller@11c10000 {
@@ -499,17 +508,17 @@ clock_peric: clock-controller@14010000 {
 			reg = <0x0 0x14010000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_TBUCLK>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_DMACLK>;
+				 <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_TBUCLK>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_DMACLK>;
 			clock-names = "fin_pll",
-				"dout_cmu_pll_shared0_div4",
-				"dout_cmu_peric_shared1div36",
-				"dout_cmu_peric_shared0div3_tbuclk",
-				"dout_cmu_peric_shared0div20",
-				"dout_cmu_peric_shared1div4_dmaclk";
+				      "dout_cmu_pll_shared0_div4",
+				      "dout_cmu_peric_shared1div36",
+				      "dout_cmu_peric_shared0div3_tbuclk",
+				      "dout_cmu_peric_shared0div20",
+				      "dout_cmu_peric_shared1div4_dmaclk";
 		};
 
 		sysreg_peric: system-controller@14030000 {
@@ -522,13 +531,13 @@ clock_fsys0: clock-controller@15010000 {
 			reg = <0x0 0x15010000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
-				<&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
-				<&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
+				 <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
+				 <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
+				 <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
 			clock-names = "fin_pll",
-				"dout_cmu_pll_shared0_div6",
-				"dout_cmu_fsys0_shared1div4",
-				"dout_cmu_fsys0_shared0div4";
+				      "dout_cmu_pll_shared0_div6",
+				      "dout_cmu_fsys0_shared1div4",
+				      "dout_cmu_fsys0_shared0div4";
 		};
 
 		sysreg_fsys0: system-controller@15030000 {
@@ -541,11 +550,11 @@ clock_fsys1: clock-controller@16810000 {
 			reg = <0x0 0x16810000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
-				<&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
+				 <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
+				 <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
 			clock-names = "fin_pll",
-				"dout_cmu_fsys1_shared0div8",
-				"dout_cmu_fsys1_shared0div4";
+				      "dout_cmu_fsys1_shared0div8",
+				      "dout_cmu_fsys1_shared0div4";
 		};
 
 		sysreg_fsys1: system-controller@16830000 {
@@ -921,7 +930,7 @@ spi_0: spi@14140000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_peric PERIC_PCLK_SPI0>,
-				<&clock_peric PERIC_SCLK_SPI0>;
+				 <&clock_peric PERIC_SCLK_SPI0>;
 			clock-names = "spi", "spi_busclk0";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -940,7 +949,7 @@ spi_1: spi@14150000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_peric PERIC_PCLK_SPI1>,
-				<&clock_peric PERIC_SCLK_SPI1>;
+				 <&clock_peric PERIC_SCLK_SPI1>;
 			clock-names = "spi", "spi_busclk0";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -959,7 +968,7 @@ spi_2: spi@14160000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_peric PERIC_PCLK_SPI2>,
-				<&clock_peric PERIC_SCLK_SPI2>;
+				 <&clock_peric PERIC_SCLK_SPI2>;
 			clock-names = "spi", "spi_busclk0";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -973,21 +982,21 @@ timer@10040000 {
 			compatible = "tesla,fsd-mct", "samsung,exynos4210-mct";
 			reg = <0x0 0x10040000 0x0 0x800>;
 			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&fin_pll>, <&clock_imem IMEM_MCT_PCLK>;
 			clock-names = "fin_pll", "mct";
 		};

-- 
2.53.0


