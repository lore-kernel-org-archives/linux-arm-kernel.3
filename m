Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452ABC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=RjAianyPzipL0lBJDMVpS0W6X5
	6IEKdCqMvN8OHgmfIL+ssCsubOSo4r5zdVEbZLtIt96ObO94Vo5EJaW/cKseJSVi9h/xh8e32NYdE
	BRTRvI70le+0NtrK73n5XMvr9yWYPX4xW3qNLORZvsf53Ucw4DV0SdYo+5VgoPl64j5m4a4EtB3xy
	M1eBmVwdED0YGQiRnPqsppn45cpXqdvMlfy/NDc5aHPmWJUT/SGM8YwJIZGinfDoRexDuhD63bQ9r
	kezi51CmlouYWJuuDNmzAWebHPtjT/Uc3sx2ztgduDP+FEDWy9QyKNoQyS4WuGIM12cYck/xT18zy
	Qm05GD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd7z-00000004Mf1-3Qaa;
	Thu, 27 Aug 2026 16:39:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd7x-00000004MdC-0Ukd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:38:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbrII058955
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=CUMOWAQe2SCk5xCB
	T3vNJPB7iJoTQI/mjbPVIYKq/aKPmR3a9CvuS3h8HW+FkKh8VRUp97G3BOIqMU93
	9tOQ+YOLJG94c4N+WstV9Jlxqxrn93HjFBiP320Jw+BZlgqtHogv88YdXGhKJ9n5
	zQ0S9Tjjaf2MtmJm9BCa6v3UGyST5J35aLSifHCq1Wsv7/pRI83FaqUhCzcC7qH8
	MeU2orlQZS811LW5UWPHse/ZatmrEUPPmv0euDeXiefxKFOChCY/6avJpoEod/Qk
	PyeR1AGIdXTPFfEh9NlboojGReWxFU38iKBX8YVU84RO3mUadNXLk64g3E3iNNi4
	So4Nng==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak561ewd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:38:56 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46509ab0149so235608fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848735; x=1788453535; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=LwIVW61r15jY5qt8/xLNSipUG1BlQMTRj5PmHEcUkxo3f/98CgbHMU/LRNobjj4IUj
         TcAouha6Gt1o/JaDY6STH7vPmUD1r6ZjSodBDhwHgToASB0XftoOFfkLia6aAS8FdAr8
         OngU0Zd6l+XW7h/XvAft7Qfj2UsD7FozxWD91dZocz3mc0B5ihTDTX+FAn0cVEmcGAcq
         qJlAplYYol2Ds/LU+gN7M9rtV+3EIDDVNGM7repX2ABl9VeI15kgLEgInNDalpPP+gJn
         nssa07gwoU8kjnpb8XE3CoT1EcnZV2zacF4p/yqyBuueUgFClh8kyud4GFSH+RW/ZlXc
         xhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848735; x=1788453535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=qs3dQv7rF08ar82jXWA9p31rrnL/8N0WdA15AgnIjbcspkN3Ww5yE6AbdDLroy1Ks/
         nzyFYid/XJKkJcOmXbkcjR+MHmzaqg1s5287805X1Yf3u7dSfRgdI1xoaNvfkrgbeiv3
         jB/zH8iFENMyXGoj/yypnoMgAysx5tpJ1+gDXgqVUkelGQresKqcDrrB7cyJ0efTqoqI
         a2tPjLdLrB2a4hqG18n+7WvGyETkFF96A1jsfw/IwDQMMS314ptXo0LFEojwkUUjzasi
         MTYx6H0xIGhByra9HUTsx8wwi8K7aGd6gGU+wTA77zE5Uip8RXRy/dYZF1hu9MyuxLls
         MH7g==
X-Forwarded-Encrypted: i=1; AHgh+RpPKPq+A/J0lIi5H0KUgyFkDcJ8pA6u8RamCAvrMmxCZi9hkeZOQqrfqteJ8PXLG53wY3NmGn9ly+E5Oh31RC5S@lists.infradead.org
X-Gm-Message-State: AFuF++mgwzRcOB2cCXs+j3Z57qXfpn7druADdUOaN5EON2+WgoWlQGjh
	IoEMxOVQo0PuKsrytqe3Lz+oo9PPJUeK+2udo/WgWD6DzD85gIB/TD09lEai4o2XvKWLWRG2Un1
	W0mJ0y41xO52LL9NZ0aTDe1XKg0h0o3N7ONrsTzkhRxcaA1BOzQYsV3+G8ibNaTDMxhv11a/KfY
	X2AQ==
X-Gm-Gg: AR+sD114GS1ldT1VQI/77jRMf8EBnISeGLk51rcHOlUe3wg1AXp+Zi1zl63EVzIwsUV
	X3DgUbMOc9utMOHZlbEFLIE+VAlaYRUL4YPBOmDyNyjRQZwh8ehHh9qhJa1DPV0JPJj+iapg6r1
	imlj3Vi1jSrwYmdiWOWQZBVWKFhuN14ePSs6dltLQG6BzXBMG0+H0s/yCeAQm4tjI1kZF/T21Be
	TR3Le7vL9Fxwe7PnL9NNKTs5PVd6KXTx+IGDKCfoiPM1NZ6Xpqlg+mUhAacQvQ2V9GzDyZ5ZJRq
	Ew68CG478thChceZRj6nzry0Rn+v2cw/nPsQTh2UVWW6f3SVMUa0E8vc8pvw02lQOTdtx772RIz
	BzxdxmgA4EO+iobdQgVECUOxvVw7DIrJipy470msFlU6WpJZmU3fOOfL2oN/BGXpYj7HVD9Ae7O
	59Dj0beCg1ayb6ZzWxtGOB2WU=
X-Received: by 2002:a4a:edc5:0:b0:6b0:1ba4:dcc5 with SMTP id 006d021491bc7-6b1a04aff4cmr15899918eaf.20.1787848735353;
        Thu, 27 Aug 2026 09:38:55 -0700 (PDT)
X-Received: by 2002:a4a:edc5:0:b0:6b0:1ba4:dcc5 with SMTP id 006d021491bc7-6b1a04aff4cmr15899828eaf.20.1787848734913;
        Thu, 27 Aug 2026 09:38:54 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:54 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:05 +0530
Subject: [PATCH v4 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-4-dd34f235fc1a@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=902;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
 b=d7XrupLvy0iND0SZlo+H0OcXt79v+Ztj+iih40zaAtw0/Y0Ue4Jz76iybjEAjucn6S54JTK5L
 TAo00bkepGLCmnXDlkD1RitIb5HJ+Jqh92rB1LduDdsAu2Qwi8YgAoY
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX5s0hYw9QZcCH
 3Nn+bmOSMEt9j/v315FPv4pJYAW+N8EyDFawfSi2PE9Ab3+4GgkaBC3V3Kj+3UQL67sBbNHRWq7
 LkQCxe79rcxXrE1BxSG+w3UHNq1hYcI=
X-Proofpoint-ORIG-GUID: -XJwP0QnnB_PeMcp5s-Z2M1XdjRTT0n1
X-Proofpoint-GUID: -XJwP0QnnB_PeMcp5s-Z2M1XdjRTT0n1
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a906820 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXz/GIv3pbUOfx
 79MpdnfCm383GfITNdn+58YrsY1EVPkA1LPAlGgHEhL8iIthSFn3rYvSyiicWCOO8JTIvxo5Pee
 x9/wNcG4EoCiKF7P9bk5lc5bBGeAL4VAQ1zA44yrZez1Qw5ejOvrqTeZJrQprwWtwjBKl8f9FCD
 bi8VFq8xNro+1ZyzScWxwb2TQIu2xolgxmaSjsBz7BwfThPZmk5LsV5tpooVfEdtyMMV4E/sXbU
 AKYdL40UjX4GGKXbX3CKkbOxlkvw9+X1Z0eYRzR+rZJRceVINvjYJtFO2XV3KXqgRnlMX5259Le
 1SoJ4rP3kp+WQ73k/ZDfGSH+A6DqC4waesKvGTGlrDNwLDw2vJm2SMocy2NKTonuF5iKrnp/03d
 O9kd9hwHIO+NQWTKW31DvA4BqwoYADUQWERitK+Bl6IfKIvwquf4HAYat8YxJgsrcXMGlns4bX1
 VgoumS2jQUTuIRu2CJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_093857_282393_6F83D236 
X-CRM114-Status: GOOD (  11.66  )
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

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0


