Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2255F89256
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=; b=0HBSyrkH+LBjU+qURaW4iR/qAd
	BFRVTSWDdBDx8dJa28KsktW+LSY4WjkOheXpV1+g2ToKHPe0wujSdtQaGS4Q8Es3iCs8+8y6o0t7Y
	N4AXXJra/Z2uLFfV+rHNIdcRWlF1nLXtoICXLruMvQXO4YDTtQN/XxiyD4tM5cmD5z/tSvOM7KVLz
	hYI6jDyO9bVkAUU52aH9WmKhCzW7Tcj7gIQJcy5sMX0EdSZ8qytkBSBJkM2upKHg85JrGte21wfUd
	40p6EBGIL5OKsi5CjwQF+z3Hg+2cu7m1OYKR2x31AFTPQ5IlBQjIMpylW+XAXkfgqswXx813DOe8s
	TldcabqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mv-00000008Tws-2WPE;
	Tue, 21 Apr 2026 10:57:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mt-00000008TvD-1Mlc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:57:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L6eTYo3574225
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=; b=PG7nuSL1kmQwOD3q
	l2t7x3v/kpsHd8JZrLBF9oHReORPxEYr+xDImSgm7uEfBTSJrsrAOYP05J1Jctl0
	OwGDbGx6A6OcQY4W589D5xoYb2Ae4w4w7JMPlO4XKjVzUaND72XAwO+MobQNtal6
	S8+Ot+S4vNIkN2b8z2THsrEj5fO9Vhg77flBiCDvJXZTVtbkN0ojccCfNGjphMSM
	i+LKT1nB7mSrSjd+JjxRB/Q3K6+WeYKYGcIha6/Qu9zoTQZY92Dj+sE5MdpAhA+n
	/FcI11YneAkz1/gvaX5NgoJrYpqg9wW2+/wPkpa43MWWcwpo6L6mBnL5iRHBPloN
	PeOFsg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465gxsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:57:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82d40278103so2804606b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 03:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776769020; x=1777373820; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=;
        b=fzPlrcMSFzDqCdDKgVIF5Ajmq+j5ynlSbT22CgRn0jR+rlxrjaTxUN73hjuGtjFW84
         Qlsx3h7pOjbHunBy+NXvnd71Vry1uT7rWTD454W/YYe7S/zsZllThoELiphmgC+pSSZk
         OrZhUbfkTLbeFKRGmvm5UkbM3oGGRfg5RloeMwL4QFqCr/srFKfKKGFCVWHzLZIM4EoY
         dxUylrx7KXntKoM9+hst5BiqnPZWLunVU8yu/Hjw+/FTEfFAg9fCQRnDJAx+ECGjjgzh
         1WtVGQhHemkuBSlDVlk6QmG4t7r+AsTxTCh/wothuxKqB6+NZ8KuhfISCB+5IZg/dBjc
         H1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776769020; x=1777373820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=;
        b=P+mh0ab9kJbJRG+7wUVYIT9yK5QaCcV3SZChPy4EkZccaW9Afpud8Kv0HobMHH3VGA
         T/fAApd4Bfa6NSrQKWcayjjrWTwm+zva78s9Fbx2X6X6YHX4F2TNMwTSU3jmBafW/1sc
         fCp2Qbzy1KlHwuAxicCDwrWpT//w06aiIMxQAv/0sUE0f/NbRTAn6jFewDC+C/tdcc95
         WFFCBwMAdrxuIV4ioImPrHm6eJjTzXJZg1znJXo7WiQdAS0Cl9gv2lusrmuHpVYCWFzY
         zqrCcpWoRMtNW1RhOqoQmV6+UaT2TjF6DKjQZr9MvCnZkIudPuN6lUGAuhEo0XKM7VC3
         BNjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xmk7WGcYLouEoqvixQyUsxVen5e6EfnXtUlwazASDZtiTAjSFdEud0f/A9zcYyotYg9ZBkuvMPOqcoc/bi9Hj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw715mLK9K8xMXSDDsGwCyXgxBRjqe4pArNKTh//Y7UkZQ/J6EV
	yfvTyiXfM7jbqzCEbS2vbveKK4950TXY+LyPosodkSMHethwridR5M5cBNqTd+smHzE7tZ1xDgd
	8q+aPccqoJ7bjnpCsXcVpOaaaOJzFOHf798Va8gbjB2hce1G3iKOCCqfDxvCyv3yn+uh7htdGv2
	VlNujwZPOGvg==
X-Gm-Gg: AeBDiesYkdO9hgyjOUcif1VcdbzmCDX13xQ9cxf92jbAf9v0VRBrqSugoydPqk7J9Xq
	eBHw7MJXu69W8+Llffoy67KnI8/d53OFkbwvnFLuVYISU7dBCYHvfkR0DxevyTblfAopAss1q0G
	txNRwnvrqEgNn4G7zf8ZLr9nsFAmgRkklRicGmigLcfXshPfN/0uHX6wJpkYLlTq2WFsc+WE9lZ
	NKtsrOH8Euk3yBit4nD+oJ5ZcXf179nopWKwx1SNRGmWJMtnizYhFcUuMta6KNwlTfqc/IiHEnM
	h7p69eV7JfPQVHQ6646ZBI0GOluyXHemb1tGUE8cys7mqB97MH6Vfw8M82i+qIDf5wtimsxI8cv
	470ytZ9edFJq2PKqPcc8LWV/ylk4IdTZ4demIEwVZZrpmVkik2MOA+jY/dPTPJSZwuS1+AbSJ1a
	KeE9eqCb59QtoEimBf+gc=
X-Received: by 2002:a05:6a00:3397:b0:82f:24e:6a50 with SMTP id d2e1a72fcca58-82f8c830359mr18924267b3a.10.1776769019640;
        Tue, 21 Apr 2026 03:56:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:3397:b0:82f:24e:6a50 with SMTP id d2e1a72fcca58-82f8c830359mr18924227b3a.10.1776769019138;
        Tue, 21 Apr 2026 03:56:59 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:58 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:56 +0800
Subject: [PATCH v17 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-7-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768976; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=T3K0UqY6Cu5YfSXiRIl7BiaaPevFsxba0x8aWptwzq8=;
 b=b2T5tvM7Z5dlcLvy0cV59xPMvqbTJFaBuQUUugkQICA9axzELwlpam1IcT7YKgFOLanJbdpiB
 BXYSo6uOlOHD07DlzveYRvN9Vd65yQfFfTQ0/1FxkUKmazkoBNJ0/oc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX4nEqqEM2FcSo
 9AXLsUF/dubzwdLbstvIYQQj7FJ2Y8YHrETF+aEJ+NvN/1zM+cnMZkPRBGb5VIy7Kqpfa8vjIsl
 z8LpTiN/czqh5IltqhzvwVI2eUvvKjL3hqsEqVMjISvP94Y8svnTyUwAURBETDWbLTERJ/stul6
 Q2Lst52rppVfK5yPcilxRPzet8EecUnu35ARuYCxOCRBqBaDlH53JVUZDzk5yEC/xTaadZeqc90
 Ovq9aT0l+W21ysoS3ATt1WLi31tW7KHx/d4lWoCJrYfu5DL79h0vsnrPYM2pZ2l4kwY8jDft2Eo
 F4cT51fESjy345g+eCCIhWfUVOp+YXktoouyR+Lfl4rfoprh9yA7tM6o91x38EA6qvcR13WXooA
 fhiKnZCOb64jYR6MxAm+zZmw5/VYTLo9KIyI0e9oV2pNxeGabCnG8OwIFKpTML7/9UipXVao4DL
 501mV4Tuje1Gr4lurJA==
X-Proofpoint-ORIG-GUID: y2fZyxE00y97qP1bRM900wwrmzteoSKz
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e757fe cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: y2fZyxE00y97qP1bRM900wwrmzteoSKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_035703_385345_1CE6C19B 
X-CRM114-Status: GOOD (  12.71  )
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
index fe6e76351823..2cc855ec9759 100644
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


