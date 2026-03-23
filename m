Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5B9EC01B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=N0KjtO28xaoMuDHTd+2ZN0Sx6h
	qJ18usonBs1Wo0W/HSEHzeBQ9v12fB7CJdGRvf0FEEWRrlxSE+085MO67boeE/xqFMjDueSIYqIfm
	FMQ8wMGMcsoEPPt23t2liQOs5wlwPYeIxxt6dgjslcKepK0/Z55ivxUxK7hA1wtFENqfmyZi6ZmjI
	rUC6QhCJTm+KtImowwYdci5PuEWA6dLhqOC3rNmxUT+2hjVUzW2NBO8ShPANmWYuvDBEm/lh+aMQd
	u/pliZNlNXx0OWc44qLQi5YCJHaz4FFdfrX0ZPdNvorQ/CwrOUcjkfDua+457UnPyiDPtbNdjo+gX
	uKK+L+Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bvb-0000000GPWb-24c6;
	Mon, 23 Mar 2026 09:50:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bvW-0000000GPT1-3hRx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:50:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7WacD562075
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=bCE01tvSrWvcPg6l
	QuWF1UhU6fkcPrb2rKKR2EyuZkD4TsQAcY9qe2Yha37rHrs5yUofLu8DkCiEvm9D
	dpq/HOeVA3/pGFXTpbZabPu1ne3iJCZaMq88hau2VCY/41xPdzuvvQACaiEyjF0v
	5AP1YjbsHd1KLBaQGtPyVs8dWduEk7k5CbRooViVNu65UXnGj65y1NbGOAr5WjhQ
	Mv1cGL5UWu1zlKcAzMIuAqyakBqTnuaI+s7Qloi0oj0YKazRT8pPjQkTO1SzVKB/
	05t+3ZEjxQmuoj+0J8YrODDp5CVEdmEmz0eLNY0GCfUKxjysUrmxs2pGeNIkzGZw
	w+EYnA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvmtw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:50:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7380305a9aso3315109a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 02:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259424; x=1774864224; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=Tdyyl0Ump/zpeXaM0A7any4wXoSYKYd/Q2QiabEUkd0xOFiNfLBQfJ2IwDtqVkzuOq
         QeOOBHKcwVRhL/xB/PB4i30sXZvKWawRN06/D9nct40Di3t+ljWkjxFvnlQnhnpH9Lac
         pIXH+2J64e8s0z4ntILLmoeXQJyt8svjMwAkKAv7xxK77bB7LPF6kqGk2STUxyR1uJy5
         QuoDSNLc3tpc6u7OM2DJVz+nGLcMpznC7Zel+ALfmy7yTGZ0uYGIqejwlnTcLw7Q46Rw
         j4POdJ2kM3/TgrcbFmy6fOplHNXTrxu8zEOG1kbYusUm0K5NHDvCU3vveLFEjxipSzjF
         YZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259424; x=1774864224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=b35LqEjZHZ4sXCvFEtoMaGGD/U8upYl9F3kxtxHeG3PlGvjy/D34RpNDum1cRA2kW8
         1xnp602wx2t4h7cvKoeAbu7d4mKyTojATLrI5PvYoUEbuZLW+CVjzKjjSGCsp42OGKao
         jqZSKRc/MeTYyJSWFGWiHOXvZsMValcjFVDa5Gxthcb+vZIiC1MLp6DmmdQLfqKxAK+m
         UdY0tTsYRWYqWAnTKfY87GyWSOGxai02cuaZkIVvhDR2ZZUCxRelXfSsBQffECUG7iFs
         Wj46B2ssQu+sbzKv9nmnShwXozEfHzSNQR/MIaDh/piK6pDhSwHY1NsH2yaJG2QETRu+
         uVNA==
X-Forwarded-Encrypted: i=1; AJvYcCU+CwRooM5csldF3gmxpf9dncFnF5ZkgV5TbLSusq5kcfDAGJHJXkHTalF4Gut7RADX8hQzqTyeoudXqzE34iNz@lists.infradead.org
X-Gm-Message-State: AOJu0YzsGyeMGF0CJLKpg8HKiKRDVWIxt3c0y0h4KgAS3qIvoQyKYrbz
	J++BGBolCfk1I7B4521R4txAohsO1aEPXjjd7rZohyIrVQt3T80GPg8/vr38NgzZNDsZHPcOjX4
	S0qeEWzKUKjoCEL6UU8XznoTlh0IU+F7qbvdw3AAx4Cqz5vJVAAdZi2fNBqUbtXEuVaICJp/ewy
	0emg==
X-Gm-Gg: ATEYQzx4CgJJy5WD5mLCHnpu9NyfJ6p91o7Y9xY12/On25Dj/SXQ1PBa7PIK6+alC2/
	uaRs5y3CXfst7kQS5N5iQkOR3lwumbm8XnhpBV5Y+iT7oXwF1q5deCpEjg3zmEd6MS3LO8rtcS6
	vG9+dYUGYRFHwvM4czc2DMHxkghb4+uS1J/yyRiuHvrRSji6UZ7Ubkx+dVfNDkNj72v0IY4eNoM
	MVbrqSda86070kV4O4DAGE44ZUJ/4yxKJI4psp352/8d3/q8fG9tnQgXscTVbSg31yWxeCP5h+B
	xyGyEvT8cmaJrpgqM2krHRAfoVRqrhVrCV9uRr29rf7OMCrFy8O8RAQggi8y0jj0YJSrKtznS7d
	bH/dYQp4VE+lcuJGt+apUvzm08Ezm2ywXOECY22pYiAJNp2DRkhbgxXCEt5wKgfVu8Ezl21yy70
	VnGynN+ni6
X-Received: by 2002:a05:6a21:e082:b0:398:71f2:59dd with SMTP id adf61e73a8af0-39bcf0df18emr9614578637.9.1774259424620;
        Mon, 23 Mar 2026 02:50:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:e082:b0:398:71f2:59dd with SMTP id adf61e73a8af0-39bcf0df18emr9614550637.9.1774259424127;
        Mon, 23 Mar 2026 02:50:24 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:50:23 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:32 +0800
Subject: [PATCH v16 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-7-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259384; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
 b=kKXIWKhLADAUr9KJy3p82eIWtpxUIV/8MOu6/roEzWF1+EwFIeX1+5C+emzLimc1QIZOOYu3/
 wo7Qb6HSAkUDKSzCHF9Nr51Q9mEUiuWPLEJIqUF/83MMsnHZX5bNQgP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfXxl/tryePiEqp
 0QMNpynsyKPp5EyrDAnkFP3lL7mg+X4CAbmj7GkMpufKVSZJPq7v2cFKUcC1Vdj8Igv/deOkK5D
 dEmrmdlF6bgD5HXfk1v+V37U3RuU4ALlt7T7RiCtmIoRnNZhFzocarlw7qAWKn106IiI97vH3B3
 6mTky9If7bmocsr7hisoKobHOpMxKyiuwEJ+u+Eoe2Mvl9lMvFIg5SoAKopMLs2YdwrimBAFWoF
 tYyn9SACzs/WkS9RRie0jAji5l/wrqgR4j5nXoTTXjzY9/nXf0d7vdPd87Yaej7H+cbrzX9Cuyw
 gNSCk8QAdBfIvf9huxBgk214QW9qJzJxsDvzBXtUDuwo0sTQlp7cr4LiYvm8LrrgMJnTIg+RpPn
 GudaLztDY/aMBiVjmn6FS67auBfFTuOXF34yFysOWr5WCz7GwDNyulWbQQWWCsyDIPz7V4uQHQO
 92J/zePuv+fyx7zGD5w==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c10ce1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 4BujhW-fHZbFVgzXKS9ExvRn9hRwFOhm
X-Proofpoint-GUID: 4BujhW-fHZbFVgzXKS9ExvRn9hRwFOhm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025027_059955_6755FAF4 
X-CRM114-Status: GOOD (  12.41  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..e8a20789cd58 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


