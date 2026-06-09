Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC8ACD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxJjsAICW8MyuaCsBeQPeHdq+n5ERy6rvqR/41B/dY0=; b=HlavJAFuDlr2Bqvi0/txFIGSUo
	7cePbVODOhk7xi4jR5I/QaOHxIjhncjKnn6Kp3iyxAxzVOuK/GVOO4dqKUpyF+BiH4+/LsSBNUriJ
	vOUasoMj578hv/mxcn5PkY0/iZZKWy2QiW9P2DK0W74vuefF8Y3ThMIG7gi2DaT5nEghUSuRHoWLX
	HeoMBOgHGSaZHNfVwcA192hHQhdAg2XDDPmSYhzr2Kze9hE2I6iD6KJuBg7Z6C7kSnaxnUh8WvKBB
	dhs7ji63gomncX2Lgjzy9odvqyorD0VrPbRi+X4NAjX3vDoY8fsknDkpXV0ynCABMvuPTLBr3kK0r
	YVi6nPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyRl-00000005vEB-1HTw;
	Tue, 09 Jun 2026 15:32:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyRh-00000005vBQ-27MU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:32:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnIFP2668382
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 15:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxJjsAICW8MyuaCsBeQPeHdq+n5ERy6rvqR/41B/dY0=; b=InrtumcNAlNEzsq4
	i/jTth7Oreg9fzEbrh478SimQ0wa3xzH0O3TQ+z0qcQ+SY81u8ThnNqJH8pfxdvy
	tSuGdvLIKtvyX79AKEcG7rwxfN3xlo7UAZ1ZWnk2Lgl6sbHnhN9WiPzIf9hO80CM
	qJnpO3XA4A8MF8KmLTPebaaRA2ZaSuLBo5tIklD/XT4QwUqRJ9XWCGo10emzb+8J
	j2XTbI6QZz145F/BHhlQn1oA9rSSfkYzK72IitSvOhaWQtUZ5jVI25Jt58yBi1RB
	3KK7o7XMfNvxHOHvTTjtVt+StECF0khBZ5NLJBMuRK7OLayuvB2NEEMlipMwr8X1
	pD8dVw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25tb47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:32:51 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6e385508bso1840092a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019171; x=1781623971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxJjsAICW8MyuaCsBeQPeHdq+n5ERy6rvqR/41B/dY0=;
        b=bdncj71HEvge3FQJQ83QXFY73inQdJj6EnRpwlrM9kJ7/Jn0VQMk/4PViQBcgwgYiZ
         r6Z2NQ/t+FI0dZzXocITJC7r12DNJTXz/l/J48+ngC6+C64gxEMtNcImD5nEduUYtrKJ
         fl3hW81FCWxqG6kQOEuFcajSSrKEpuFxQaX/lQh3q0unBNMFPmxxQezP6RNbpz2DJzks
         R3NaGAaf4CZoRwwF6GVoRHXdsg+XaMPcpZMpzo/DAM3+WrAGOjWkCq2YvIj1nQPhaK5b
         NqF+D1+KZKz+9pDAkq/K1FM/84wWbYw3wGbN/kgU2G1UsZzCMRWfFS24RBLhf7t8lXwh
         3OYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019171; x=1781623971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RxJjsAICW8MyuaCsBeQPeHdq+n5ERy6rvqR/41B/dY0=;
        b=CcygalNACVzmVC4EJ2gDvfNpB238x6PB+qwQsX5TkWPAojduOJ1wOaPOL8CiaCy4Vu
         GaJMxDNwMUn9P1BED/uaThZQ06NriRcHV5XSD+6kB+B4773HRb8Pbbw9+L27/31r2iWf
         nhJuvYQy6tHQip7gLgizoduOB2DthDhPYLDB3JSGKHit/o8LFY/xb6kIakHKLLS7lshp
         tD3oh2NqxHghNUAteGpgSbNkMB2vvL8LkqGSebfjqGg+/OeAv/4GX8PaDlJGkfJcxh3M
         LxLES59xnmSkMzbPJn4mWvQGKzBiRRDgmEnIlrAxqUeyVNxIEJ3LLODrF8O9OiSNfK9z
         lqaw==
X-Forwarded-Encrypted: i=1; AFNElJ8KagBYyfQFBbtunQQmJZvpguRtNUeqfOjcueVrI0qVh2oTddCD6DwrRIGAQmbinX7TtCICbV/EcwBQ5fpqYq2G@lists.infradead.org
X-Gm-Message-State: AOJu0YyGJAhfy0HlLA8nNHjEJPLxbYOe7CkbHdOfBmTmFQBIE1mNCg/g
	/dPQXdhXM1IvKLkfucM17xmTjRajMZU7WOB2kbZfMShau4QXQTZbRm0nEj4ZxvtWD5NU6B2yqYC
	NYfer2vfkPPI3RvR8rssHvEog+iNr7DpE3KNifpYUzCK3SeTbIUw5pllQkIuzL53evk/kgnCxIg
	GqHw==
X-Gm-Gg: Acq92OH96J2iJtOfNjxP7w6i6NnCB/TQ4z6PfDJx27s/Ie1wMVvo67FFvD1a+Uabpth
	46SN+gfnJXybl8lr5SwzXGGfdq83usSKXi3l0yu1YChiCYCk8TSwxry9KzsUie5CE0a/+Ct8GR+
	xMxDRRpAer8aXmu2WHloKG9XZ8qVwWGffNcWa+w9P4aER4OyAfLihGYtqdcPUMl1sEzSFDlRksr
	jp41RyJ0Xt00fvgsAp1Lk9RGT4rwaZZzgn+UsjenLNAbMMvdBp/pO0fGC133uhFVGIWx0P6G4Yd
	oT0vs5Mq4e6XHN2ab+DSBhD5CNWPSLITMWcn+x2roGwyrfEwcnmzPfOBD8R9i3wBM7lla85tT9F
	K0mLKPIZP9+Zc+UP0OA8rB/eOj5tTemxKzonUiP1DkA55Z16UvyzqEXQm
X-Received: by 2002:a05:6830:34a9:b0:7e6:f362:eadb with SMTP id 46e09a7af769-7e70c686601mr13282220a34.9.1781019170744;
        Tue, 09 Jun 2026 08:32:50 -0700 (PDT)
X-Received: by 2002:a05:6830:34a9:b0:7e6:f362:eadb with SMTP id 46e09a7af769-7e70c686601mr13282184a34.9.1781019170359;
        Tue, 09 Jun 2026 08:32:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:36 +0200
Subject: [PATCH v2 2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-2-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YtkDqGD6pTPYNLs03sWSOZZV3ZbqbTsOJL3wyJ53BuE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIW7zC+FYxgJVwNs9HQTPPnHHlpOlHCcmh6h
 WNNd/OayxWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyFgAKCRDBN2bmhouD
 1+LPD/4qIVn545TDv/HkING9KBTX4lrvRehwV6UWHWi1HzCMZzxx7WKJMwwFYNCt6sszp3/XZHq
 xa6w2ZVHoTs+2YoGIMQnYNhnjvD95dgPoGiYqhP14llzSkg8PabaBiyDQCtbMmipbS33HKHO1bA
 pzciOAqB/YdUAVOCQNRnHdE5B1v3yp+9/k6oc0QflELucB9YgXwx3zvLf4KocSlvjUgd7141g2L
 becStBzYTYnYrcp9s1i2FHVSw6mRSy04X7ZdOcwTvVVga8Hc4G5v1YsHUBrpIAbJM+ufARJuvB0
 VAXKZ0tbTxQgmTQ/lrLyS42DoMbn4wwB1aSf2dQ+e0C2op4JM2Q2Pm83+/QYJWr2b5lo+AZbw4H
 Iszyk8k6eOwaxPwnmOIeyIo4CSdRiT1T+jrlDxDppdj35HslD6k+JnvA49AIABwwzL6SXt6LV7m
 gUr4iV2tIrsblpwfuLYp7Q4yP8VSZXgktGkb5KMUTPT/3zCOP8vwmp5KInAHxMOynFWjoWwuvqn
 kgZjJJSV9vH2oqGvXSi8+IOGCaed65XCSAf4RtgFLUAYM+uJMFDw8dyGc+LuIi+S9fykVyQgktK
 qVnUusVtQbYQ2sh9vaOW4/oemycEz0Eqg4RHiIIUuYrSG1bDKQ2vjFqVV7VypU3C43riXlgy7eX
 gBOnloTVtWRUhtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: jiS6PMmaeffufE1nN9TjK8NEfoDMViap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX/vCg1eWcY3Q6
 snm8HofkBSuDNkM176GFln3RCb+dPHFhFp181l1o6rxgyI0uV+NMk9wM3fneyxZC8fRjJuJJC20
 9zVthZYg+p4UbzxczH9/zqFJYZLSIIMEaX99bbzgvVt6ZWjWNXhksYi6GRBtwFuLBOXkIQGTaQu
 ULqhMUNHcBc8KzMTTsG2C7ehQMIs7f3tGEnyTrGMXeQEjLx0ZBIzJr8Qeqz/Og8RZgDQCNxHQjW
 2zolZwCF6KJ7EWlAUM+mkD8Xl8BjFbtXIDpwjScj3NBaNdVWUdZDrJfeYNgR1d4adFcB6Y7unRw
 ZUKH47BLDrMxuZjRlMM9dtFg6woUFnWlwfIrzEL962Z8J0Q1LZYrBnXZc73cVd2FqSwbRpuaDOG
 Rj+7QMmDw2vL6Yl566Q0NXVqCFHaDPn9Jiy5CjBgXYr4Ue46DFhNtmCitHhQvl1eo6WCjprhTUN
 Y/YqBo2DywDAhpVjP6w==
X-Proofpoint-GUID: jiS6PMmaeffufE1nN9TjK8NEfoDMViap
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a283223 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZSuaVHzWtUHH4nz7hFsA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_083253_689172_40E71357 
X-CRM114-Status: GOOD (  14.91  )
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

IPQ4019 is ARM 32-bit only SoC and QCOM_A7PLL is used only on SDX55 and
SDX65, which are 32-bit as well.

Do not allow building them for ARM64 to make built kernels smaller and
user choices easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/clk/qcom/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 799de35c5ee8..3b8768d80d89 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -228,6 +228,7 @@ config QCOM_A53PLL
 
 config QCOM_A7PLL
 	tristate "A7 PLL driver for SDX55 and SDX65"
+	depends on ARM || COMPILE_TEST
 	help
 	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
 	  frequencies above 1GHz.
@@ -374,6 +375,7 @@ config IPQ_CMN_PLL
 
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
+	depends on ARM || COMPILE_TEST
 	help
 	  Support for the global clock controller on ipq4019 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,

-- 
2.53.0


