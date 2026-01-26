Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E5FC88E63
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 07:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=; b=fM+ez4G5GiZz0w1D994OhMF/h7
	z08JCLd+8jREJpLoFP4guxw+WhCzda71GJjdrQ4a8EyNeTTlOxwBkAzyexv+pL0TYe+zzm7QrfEbb
	wbva0YNFGzM+nyMDChjO/FtDpjSDrKDTaEJADGp9DF/DNAasu+lrstSuM3XsaK0yPZrN9R34elCFl
	wq/GHuF2p7I8znd5drSClWqmd6CkqMpPThZM2CuBaMaPf5JKrE10sj2Jgor61DUr/QflKdtF8pfoG
	a0Pf1kau54ujb24MeSJkak7gvIA5GWX/MTNipuCjp/4Dnh8m+mYjPAuP7wL/4v0aW4DMtsh8E8R2z
	0glOG7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHLc-0000000C3Q8-0TCk;
	Mon, 26 Jan 2026 07:49:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHLY-0000000C3NV-3CUT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 07:49:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PNiKRA084091
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=; b=AmYeYEYehVtu71H0
	KIhpYPSDb2kinA3gMeSwg8DB95QS6Kw9LHMGlfF/XhKsvlMc85Sg7s5gTkDI77al
	xq2OMmGNboe6LCX9N38mSxuB4o7iBUslZIbHvZzA8o1aKhcyxKGYNDLrB2aTBpEP
	R49pjvjaYI8abpBD4D3xOevnRRo7lUgMW2Z7Xllh89kq2lWaRsJAvff9WM9Raotv
	sou+/1bS9VhAZijQUmWSrkVasYh1/On/baMRUFOMca99suFQFiswiz4AOAsGYTrL
	ozsP1rKt6rqxFN4o7wJ696Forka5PrMpg6je/NGTguf4lgocyZBfWYy3M3HVhZLb
	NrZX5g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24ksjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:49:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso3285885b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 23:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413755; x=1770018555; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=RE9+ZhGV2yILcIay3hHbFYIjXQUGkW6w2ic1ipjrb1kB/dpiRjz4isNHxhh2/GSsXK
         4PIgOInfJC2afj5w6AECvxC2wH10hyYVGV8EOPrxyi4qh36iSSV888nIxa9fFIH/sF2D
         ZH8GE9WScRCxvx3heq3GGZFy1x2VVO9OVkoZ3V/3pKHLzxDPYnMCT6mcUdK+rNdiyX2r
         EaDd0KtNPcowBuFPaEyFv52Ih32DuKn/T0lmJaHIxmIzmv4MrPS+aAnNY8+vWTUA4KSt
         +r6ijA6kIyeqB5N/5bVj03iJ4BIIrq4oQpTvsXvsyncRTkkWaP1VxgEO1I8+LfOavogH
         cglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413755; x=1770018555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=I1B7PVO9i39IXAq2jWhx2LHZ33f1WopVO/7I6TBA+0IDxIjW0PdrXPU5MX8WXFZumN
         oHUQzeutI/gsEsP7NUjDk1H59v8d+RidfFQ1ZBkQo1HK7WYiHA5wgWnisW3RP9LjRSRC
         2CQDgEgyGhh6vLYkEzpXuPb72/fl9j9Rld0Nah5eDDRQI3frfcolSBSsHgFn/KDr66FE
         3yD1sX82UDGpl+5bTTWCvLRfgVVGZlydefU8RjT4ljgooRWYXCGJbRYceRD2SVjL5y/F
         6f0WZ/5/drq7rvIfy9g60cYlu8etpqPjIM8+terxoEHSrUZfuAL0Wy2horR6rp6nyrYp
         yfgw==
X-Forwarded-Encrypted: i=1; AJvYcCVzztoWqfrGk+6v+m0BtVBtsyfQD2t2yL//NUDWjMPvj9ICr2HraOB83Iira0BE/bTinEI+bzOYh+wM8gMvCUqD@lists.infradead.org
X-Gm-Message-State: AOJu0Yytkz0H4Q5mFuBXkJf5L8uMCntSNIvwZlSMDOyh8Y9UBXRGkfOX
	bk2OLmjd80kz0d1fanXjsJcZyDZ8zZ7xy0ATb9plDRZVwZXngOFqJiqx//gBI1D3sSTkOg+9j6D
	oA30/jHz3/5K/CyJQvIbE4sLUdLWIxuji5HVgeOh7wtbfze5oVm4NAXEnDqca/pnKhNA7E4wMT7
	4WrA==
X-Gm-Gg: AZuq6aK2bMpZ2oLF0q0OetO2QHL/eeIzhE282uYmViNuDQvUdLlJKHJFF8XLpZfMC2o
	geuRLbEiLvGeeNZLUsBd0xfR82mQXgWOIsApdhRtkbYc7YMTu+IqDtRybcdmd9w2/DG7I4Kk2sR
	b/PZP0fiOB2L1LcwNp46KSKGDv0wgLDRwR9rLW+xNecojhY5OylbUK7etEhu4OND5v8fjjPWD7Y
	9aWJOruyNBi+0FNh/aQrTIShURQsgurWFj/ANwNuXnaWu6nk/srE8mdRi0ugFpKUOJpdGAwfP5G
	pE0sXXPy0FQJuRxtK9QdlIDHjE7EsYJKMI6d3hsct0O/n4HjoPlg68HNiuajOYQirZ4amLfgoHK
	kvzyLweBHya5NQjcDD+v349LV/iaalnt78tqC/hwf8SE0Q+N+tVGcaF49IhTFp9FLS3gLX6ttQA
	jZ
X-Received: by 2002:a05:6a00:8088:b0:81d:9862:a140 with SMTP id d2e1a72fcca58-8234114ddd6mr3939366b3a.3.1769413754702;
        Sun, 25 Jan 2026 23:49:14 -0800 (PST)
X-Received: by 2002:a05:6a00:8088:b0:81d:9862:a140 with SMTP id d2e1a72fcca58-8234114ddd6mr3939338b3a.3.1769413754236;
        Sun, 25 Jan 2026 23:49:14 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:49:13 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:48:00 +0800
Subject: [PATCH v11 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-8-c0af66ba15cf@oss.qualcomm.com>
References: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
In-Reply-To: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413706; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=U3SBm8Q4F2Lqg46nftP77Qbyf63TqJWnGptxyfW3r6I=;
 b=c3fl1Yn5d+S/JHZtZgPGa7S7m6K3H/GIa1tLJGLcn+2zhh5RXPn5Yb5BBM24+SyvhJ9NHbxLI
 WUStbQLUzctDbGOvcdjUgxHbg9ibXBmtMIbL9fRjVw0A2+itS9OMGgy
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX8Rdwf9goYrGj
 87+vP6W92xftBKrriiaISYmw9j6sd/0XJErULrgISBXyr9hWA28lCyeT8XTeSpMNjvjwRv/69ok
 kB4/ZfXi3hXm9yVG712tJG8KYmRbXTYh9SrWhw8mUw48jndS99WWs4CANPEHdeKLT7WSQ5OSnuV
 Elz1YhCEynfMn1H6LaaLPg6ggp9UDl7jIOUiMFVhDCffXw5iIsfXxGliI4etvSRFVRSTrr0QqJf
 wn/MIBS5dQlOz+cmN6tMVfVXg58VfJvllbc11t2r0lLAHWVHXGsKqBqejLSeag6Hxb4hQ3foWXp
 Ai8POy1vr8VK8N9Owco3FNGkqA9LTO4JAjc4g0fP/cKOxV5SHVt+nLETwHY5mCg5bag1cVtOlil
 Tq6vrU6pqtTg55ErMwiOekKdbpPmIlHkr8GUl2sZCgZKA5fyg6MmhHhBNmwnGc0pcGb9cSSIvjP
 ONp0eKmOvPHmVnsHfdQ==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=69771c7b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: i-cy7a6JkEBe4ECYKc828uADWjBilh3C
X-Proofpoint-ORIG-GUID: i-cy7a6JkEBe4ECYKc828uADWjBilh3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_234916_950977_54416DA3 
X-CRM114-Status: GOOD (  12.69  )
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
index 0b154d57ba24..75a468ddbf53 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2776,6 +2776,9 @@ ctcu@4001000 {
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


