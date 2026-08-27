Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E65C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=; b=L06+pJfeEbALo6YVk3gk+y9yEN
	yYUzynfARdpdMXUP5tKGyDSqf9lG28p2jXtnIDLHD+0wJEcGLDwo2Fn8TOU5jYu0iIVq9xKTXJ83h
	eHyB+9bi28DkMBA4+NRtq0hegJqVmvRhjXS55svD8cBB8tuyQEfKyiJgtNRE5vn1u09M2YO+8EaHN
	UOlEE2ZCBp9PjemxPvNXhOc7KcxopMT7AEme2Tcq2eRQRLjI+PDjgDONIlImnkNlau5CAQPEu4jsF
	eHLNEYIyiJ+/dnH/Ve5UxLq/ENZ5nKmbprrVLfBQ8xxvHL8asl8lEC47otsO+jVNQZ+j+urX+Aoe5
	7o7/rjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd7X-00000004MSs-1M7G;
	Thu, 27 Aug 2026 16:38:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd7V-00000004MRu-31TJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:38:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbrIC058955
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=; b=l4Q5j3AKKRZ2xjcb
	DdI/bb1qo09wy4ufoGY1y6PsHuZqDmmfvh+rrDEazraVOzLzKatEzaLg5vX6+5Bm
	1L5+wbuOcd/Cx2Cs/Y66hrVLD8E4EipNFo1wnedrIwC6p3gLEN0sDIzfw3sHDsoV
	g+qdMSK53JvglVdmaiAlTMRNVoZOXZURZkYopgtqEuQHET3B1RvpyZOULKEkFQN3
	0ioRtQZ80jy/NIwJ1waivcsfuu/pFLCgkHK4rvmKGomz+AzM7ONKoT27Bp8BI17f
	B+vMGjzjsHOGcNgfVwmITtvXKMcLgNwXosQl3G762Z1ar1/z4mU68VyAw/W6/RTb
	HtrtqQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak561etu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:38:28 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7eb6a8c61deso73952a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848708; x=1788453508; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=;
        b=a19UxgbGGKCMuxlIEe4pkxZrQLcsnZNImPZHKIrpa0G/isy/U70Djh7FuPwmqyPJ0j
         0dXvNZfszY1C0Z/ytSQb2pPOCg8W4k+eykS6f/WEfm6rdkteSyMNI88ygPgsIIxsmjFj
         NaddoutwWtlqd/Z9wwBun8tD9+urIaIWiBnwdgYtaq2xPaA+L+mmcn5U3jZKTyOZ+LTD
         dkC/r4mXmmgqED57P2IHaHyXwAwcpXuUnxuqcft4a0Faa9i/JKGZt51uhzPsBs6Q5BrR
         sBQQD3ZHOdjp2tClEejoz+3PTka7vtjirtTk7IjGRxrQCEhT/bWuVzcEGw2l8PJtesXx
         8u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848708; x=1788453508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=;
        b=qxmF4PY05Zyw8lySgPyzE68xJ/5a0zAB6Mv/A5U7KiQJQRTGRUCNKb6M8YBApEdD6v
         kqm6kZwt826VXme0tNFA3kfjsyZQF7D4hQPSVE5Wc2zGIxTIkK6JLe8Xqf9jted7mlIG
         UG5Zi+W9wVok83qPgdkqLszO6GGUvSFf+aFHw+9lRn3b4JAyeSNO3RqAC5rBTwEVhoNl
         3Z7fC3bkpSx0Nl8rejMY+HAdnqkvo66EAkgb8MLxZq8iT771+c6LFDeXEw1yOglAVLxC
         t7EG2TitsQxrBlP8apcdsFyu74CUN/t36Posvw+wFb0CcTWjAmmDIhsxUdurQ25QvVuo
         suDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6OfbkRWkK3u0JxPrtJossUOo+FoAPdWLSbOhIDoZg0usFbXXLOEhdd6mg5Tg3D07Fj0Z8eOXr8/2awQ2Xb+tV@lists.infradead.org
X-Gm-Message-State: AFuF++ltAC5DaraCKKr9PLxNs899QvWCMGAxl++F9DMgJ42W5NmZeyTW
	at+yZ8a7friWAZs8GEfLkifhRaai0ijTUKzpXReM7sZiLvgeesSNvBqKI5nRsgLSyw+1zx2v+Yu
	RfuPNTFJ1Wyu+R7FB2kZwSU1ahaY682dRxHjaxhX6ED2GxMr2Qa89gYJ1lwBUJVNAfSgQodffJw
	P3xA==
X-Gm-Gg: AR+sD12x4jAxSHD88/uKE04hFR4b7DsTwYPSQ0H+ujeHk9GN05oFeLnlLvmNlWdCG8J
	8/WoVPsun75ZOBsitYZBigZtxzGhHTLJEkHhdtu3Et5pvOGoslyBFbRixKO94NwSbFhLp0yuyc2
	RA+xGqvw2VLAB2jSmCe7HbPsbeTB3hxWesaekEJBLAEHKQJyx/XJM1iXEKbw+YmzGYrJZbYBD15
	0x/jKVFMCS5GIJ5gafzzISbGcukk1k3WBQIdgWWBw7RFb+0lKVMELtTIxEfEsuB+O5xJzyJ3X3V
	lBtKzPMwno6gCZciG7CVeB8fa9d6BLr3pbe5BNtC9BQYluszSwmnJwOZ4X195fZcC0J+RwfHHLV
	bY4HMxCtqtjeywTzpptFmfg+f9AgQOcrKUjgG5ao0G7ZqaEHjrrFvicpAjCvVn7hGmnBXS37w+P
	41VgBiHIx3y5Gss5ftZzKu9zM=
X-Received: by 2002:a05:6820:c3c4:20b0:6b1:4250:6a43 with SMTP id 006d021491bc7-6b1a048bfccmr12513255eaf.17.1787848708197;
        Thu, 27 Aug 2026 09:38:28 -0700 (PDT)
X-Received: by 2002:a05:6820:c3c4:20b0:6b1:4250:6a43 with SMTP id 006d021491bc7-6b1a048bfccmr12513200eaf.17.1787848707822;
        Thu, 27 Aug 2026 09:38:27 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:27 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:02 +0530
Subject: [PATCH v4 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-1-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=1026;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=iY6li1N8aOWymAjX+i7+r5/1IUwgJvmB/19fYvr8jWE=;
 b=PITaWUSVe1ILdfSWnJT7MDHlrRiMajI8441g+W+TvDdCSITcQR5NuAOzL9/YNAEalt5NJrhL7
 ymArXsolShrDh6ElsdGabQEGbJvPnBuA2O1CruX3+oBz/ThJIsJCF8t
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXxg3vXPitYG70
 6RoDxAsXY/SSP8rkfu2cUOS+7dwJWy5eOhtedqq7tMB7d4jA61ViU60FMSUoOSBNbgQrbqCAQuc
 4xtUkfY4+CJXbuoDA8iSYasXB0iVuXY=
X-Proofpoint-ORIG-GUID: COJd0toK21BfCDp73h16M0I5Dz9CbJOX
X-Proofpoint-GUID: COJd0toK21BfCDp73h16M0I5Dz9CbJOX
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a906804 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=I-wlBW6BsxmxmlAWD-0A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX7XCzwulD6RF7
 iRE391cHGAvJ6599moTA3Dsv4md+VIkOIQWeadUPk2Hn601tr5GzZ5znTudrYDndu6JY0cKkFoi
 iCT1P/Wl77nbGlPtWfsQ1pieUem7NYqkDGjCn/rH9GaV7jFiiM3yTHi4+DCUMGtBPDP9QsknqNq
 JgpO8yl8PvCUpNvWCV7UX0uQvDcLqj7b/T2GoQkDNOt37NjbQsDRCL7u/Lyn6p5eTXtyudNX2My
 20x2PbPnGMmO0pTNfNh7ClIzrnhgChrNLh48/AcYZ0owsNs1HjtdZBEmIkfRNLmWm/1NCcvaHeh
 dUhWMnUi2+v6fRIa/VnPZKWndgrkCo6vugzvHsc3SxLCz4qG/YTThGMbh3eiF7F7XicLgSO497Z
 ncaD8vECyw80nVunDNyI9rCGOGLkdvCrwGryCNHip97Rl3zUTQ4DS+8nYi4g1PgtcXmm8RI0tQs
 HDrxZCHh8KQTyDQVUHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_093829_884331_3943B016 
X-CRM114-Status: GOOD (  13.97  )
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

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART. Drop the explicit ARM64 dependency so the
driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
COMPILE_TEST, so no replacement dependency is needed.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2b524154d9fb..9f703261d7ac 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0


