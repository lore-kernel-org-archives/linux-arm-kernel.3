Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8599DC44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=; b=u3BM1KpT9wQv6OaGu+mvAKPPZ9
	6417+JEuFo3imC8JJnKAAHxMoKXeUDqwG62xAniCBtnFTZ5RGi8bY03mdYOtwq2GrhaOMNjovNDPj
	6BHcq562A6pUXqNakkVYGex6hfgALGvmm23Xq1EWBvronl151arOjjrpUXyLS6Z2UfCQwmfWtoFTk
	dYPPcLv8T2yWcnYhO64momnRbz01sRLv2dlsmwf7qQptw3QrUSG/719o5RNp9VLUEf8ocvL2X9x2o
	67Japc+a/BYQT08rlYAny0eCa7mTH5OytcEkuLO5l96Q3c6H7zkTw/ahGNkoQwilj37/ieOGqCk9p
	XW9D8Z8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlIg-0000000DQ9i-2lrF;
	Thu, 23 Jul 2026 04:44:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlIW-0000000DQ5h-1ooL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:44:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WrdM2364563
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=; b=TBNC1nROiCH80PBP
	dKH1XXCDWeEj5ck3aIfOAEDUXyQW4A3eLzei8UeMNORT36rgJTyig4ioAuOJIasp
	wUlY4byea5Sg/Q0mh8BvnEYua5a+8JGGKHJLqZ0Ne039qluXAElKRUMe+5CCxdsj
	r2TbShV9m5cIKFAH0nGV+w0K3AErPxkGuaSRfOrTmBe88y2aqZc/Do2s+RIn4rec
	shEyg+RSij5KQoafvQPYAxQd3zqRrafEuc4IJe7+N6ZDRWBEHXIKKU3y9LF0VJEg
	d4l6EQuMCpzIXyqlxXcRFgKLgYcDkkiSkl7gY09gBcqiPQsa/6bjdEbsdkmJx5Jm
	y46DpQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28vj9rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:44:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso448510b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 21:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781878; x=1785386678; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=;
        b=OZ6TxBNoLcmIYQueGeCshXS4DRP5sdvFNhyMPXypMJdTzz27ywhkyZ58ZOfdUDqlqy
         +DqrcDeHA7artZDZ4qrPbQjGzFdD+0n/8BlNV3ksAOiNwyQbE+MYSW1foU2z4svJU1mf
         48guygbBQ7bk4hC8EozJZYj42IZJT93S7L0WNq/AiFdC5Al7PRJTdRMi4hsxtsOzdM9y
         4b97Dv+BRSbl1BqGQf93zuhvDOgg6WIEFOkfdCUGr3r255EH5jZR237TxXvHaP2rOKpl
         bbcmfKXXmUbUwHr3X/wI2mOKgtwpcwr/wfEk3vdhU8AkMNoqmW4Qc8S23MHyuqV3tZLp
         WS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781878; x=1785386678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=;
        b=RI/LRPSyX+JQ1n01RcZ2Xzd9PLRQ/VDeS61thtQu6OVthPpd3MvLxseOuXrQFoWbe8
         WM+Tu43HPIwYv135t97veVKHHQFSwjCwDromoOHS7P1ClnScB1sNqsxcST2v/i9Mc7uO
         2z7KDjGFgTDBWz2HLXHhsLkZ7hFpUw1RTM1NsgOGDAkGb4H1uKX57a5Xrwppmq5lM8xH
         vSVKX9B6w58vIRoxx2CwwCv3RzS6ZolM6U5M9DMgqV1fuk51jKYzXelb/5+FT2z1xEI9
         hBuHVXsFVsUi/gmgiXXUIARQKkD1gpQpp4zEeovrdweGF1aD54e2GSw04PG5fLbRceAZ
         yHSw==
X-Forwarded-Encrypted: i=1; AHgh+Rq33nG1KYexSH9uw9KQCxK0r/PW1DBTOg26nmLnKc39g5SWrzTkI87gfztCSZgnf6ZoMdfiykiqFCYXlrJ8QsUm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy25p+WIn5sqsrYdzG6fluB/C9yPZhc23kpquIDrQyQoc6kl0y/
	SHKIeauVXkQwmR5EIPENHfioPlHwiH5FKbgblKT1uR6+eQTSHsB9GyOKvgcYNuIFzS6x1hDtJG5
	grikwzwN1D3H3IZvK4FxlLwaQZb6jkpXTy6ZOE6zD6STS/fqwQeghK12oWgK24Smy1LjeFAWSDr
	256+JyIeYxfA==
X-Gm-Gg: AR+sD10ne8Ul+f2Z4gQc2fkBuMt3JqAfHxBAisbfRXY1TPAwfm+25RP3EF1dDbc0Oje
	oDKi9zBmBKyoc65EZ6RnpRMOHTBBq1W+n/bBRENGRGS7J9V/ufv/ZunqXutcIQEuF1KNIFekAka
	vT0efw8B5Pgck48njBGGSrkvOLB7vVZEjUbOu05e4Jgj7WtIhuz5HPRVldZzoySljRrYRD4wNMS
	uBlqBqfEzcs1wvXRwUEknK4QnqJJq5/sT30juuMxdgwdVdYJoQUJVAGDoYmlR56SRnTW9jEY96x
	bjGHGQruF0JiObIC3LkSBzw2eid5swcBJe8aR2Pw8EZ5rwnfBe32QIF5SiHM0HtnU00dqYkE7Pa
	vGYjqSrzVVPoYqaqBuIy+8Vaqv+a0rl4=
X-Received: by 2002:a05:6a00:2918:b0:847:7f38:27ad with SMTP id d2e1a72fcca58-84e2c1e978cmr1885743b3a.53.1784781878433;
        Wed, 22 Jul 2026 21:44:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2918:b0:847:7f38:27ad with SMTP id d2e1a72fcca58-84e2c1e978cmr1885703b3a.53.1784781878031;
        Wed, 22 Jul 2026 21:44:38 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:37 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:58 +0530
Subject: [PATCH v6 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-4-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=zp1GXufqizR+5VEnn6BfS8arlJZLATjlbuLg+yCNhPE=;
 b=xoCCReuM9sWmw9kwbpJND8v84xB2buMxPsVSRf7mjtzpq3bfp9trleSKgaTamcnh56dc3gAFZ
 ogFomEK2UvCAtlL8vCc9kDfL9gV/aOlRgg+U5cxJSTwqio8CseL/pBR
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXwFqGwKo5MGtb
 Kl4L4ocQ4xWfPGyEUPwNTHsU3IgTALiXBtASiFJ/xywZjvQBC9N0dh8gmUWsZGedVeD3qriYaW+
 AnSzVWXIulWCX0nwp9O/U+Iq+WBBsdw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXyLo7y3gZOhoZ
 OZS9/dFtZGqColbhtquHUVMKf0iMdPnu68nUY7RAHq0zAAh4+/nE5kbJ8Q6191MobIP73C1ca8M
 reoTecXgiL60kx/vienrOESNMtDj01qC/2dCZYWn9dMyCBlDHuTdwhi9/biQVRaupfTC1cemazw
 gWGyI/CqH5EOt0ahxezRNMPwSn36RFxFYh0fnuSrnjDqS/JcDB/A2vxWTB3tovgpfgwH7eXy8pR
 DGabAtMlw8edM8gVM4VChVo1KAxsOL+/miyBncTx/TWfslyEGj6IsWtL3+YVOjxSOIPrLb1264j
 qnFbMtfq5PaXO4U8p/WXyfwPUDHBIrEmoLQvdzCtbu+6wLMwRrwIF1sZYeHMLhXONDU3t5z2v0I
 HJ2ag1M3QLFvfyGtMjNYVaPr9CQeZaebP0MmAioKIO/ZmoAE1qH/+mNamBBX4KCXCUv3qNjVHDD
 xBtClcYnyHJlxUZYvKw==
X-Proofpoint-ORIG-GUID: UK1oVAeZMrVzA33b1Zf-3u68GcUEFF0s
X-Proofpoint-GUID: UK1oVAeZMrVzA33b1Zf-3u68GcUEFF0s
X-Authority-Analysis: v=2.4 cv=D4V37PRj c=1 sm=1 tr=0 ts=6a619c37 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214440_673559_2FCC749F 
X-CRM114-Status: GOOD (  13.10  )
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

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 215ca0743d943dde71045c331f7cef6ee4d9e9d2..446141e4f45fbafc750f5b90e4bb67cace5c3031 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -387,6 +387,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1


