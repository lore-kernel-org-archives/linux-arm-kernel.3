Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36CAC88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R0/zG07kT3QtxUbuc9FfqQPsCy5wzyWfyugpD7RCpLo=; b=oUbR2aRmcoDen+
	VRHwXT/nvvq4YNLd93PGqdq9oOBHhsqnBSSuL3C9AVAHL9mwyTKHhOHqC0iwmZBg8q/Vc1vZD8ceX
	87TzaKiOi2pWn4NLtwm7MzosgSVTeulCJCcnI11jI0P3/HovllrypsTtgq4ohae8ZhpxHbv3YgU+d
	O4/rMtn9bQyizTKx5PFpt+e8OmmZosSXzk1NfBcHWnnATgqfcoE2hWtSjJ7iBRrwdJSh4dPkA9ozK
	lnslV8mIuwYWHnDRoY7Ckb1Db77zcbo6MJbE0nJK442xXDsuhn+u0/O5zWc39ngXJvmCyxitLHWNM
	hgRF08haHF3yFS816A+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yM3-0000000GM2d-3gKA;
	Fri, 11 Sep 2026 10:19:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yM0-0000000GM1R-3z4u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:19:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7l1St144088
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R0/zG07kT3QtxUbuc9FfqQ
	PsCy5wzyWfyugpD7RCpLo=; b=YcbZadmXsXRNqDu07utYr1TZ1lA2cW93AA0GNn
	iMI9d1WITg8+hYOpP7aeubNQVn0GQylKYppz4tBlla924JWC4+7hLDI/1jaZTKiO
	Pl6VOHPAXhY2ZVXBm/X+1So08jjYO2NL1CUMT45OHCvA9RxAnq4HMBbdCrNWc+7k
	xbFeW2HFpiVQhpE2EZ+0AGmJKnTnHRtMICCEnsU5FC3feIBzJbIzp2vHDqZq9Dt4
	khRJUmOpl3QcShy3maqhOmyD9GZ0jJsDXrZ9UE7MUyb+thrTMmZmSrZKVRATR44N
	ApFfbK9S7KraWIO90F3cMLhYa01s6lQR0RJ1SxFbK5eDXtIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd395r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d8cdso140628785a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121971; x=1789726771; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R0/zG07kT3QtxUbuc9FfqQPsCy5wzyWfyugpD7RCpLo=;
        b=ZLODXh7+uP0BR1BT1dA42pjCov/TcLOIQyPg1ZwaoqI0rPXbdYCx4XGQ2JFxtdl3wL
         C2ex9yffRzn9VIoO5t/OMsUYTE5BiPo3UfEZMSs5MfsNm3xM/dR43SLwy2nwceK7IOTq
         LOhuHp3WarDgsqlWUpKsxLjD0UkjJBWX7nZHbcorpoDMPJkcrVsonIaoVOQZgFX699wd
         xXow9/5ReLu0x1Fxr+FQmpqYqE02fKWr7b613dlzX5Vn8rlPtV0l/86DLvXZolaJ6TjP
         HPqczT3I+fisXxUSsAf3mm2lRUdH3fUJPFKorMB7OF0GpyDK7/1zxuLbttGQmauc2Oge
         TYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121971; x=1789726771;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R0/zG07kT3QtxUbuc9FfqQPsCy5wzyWfyugpD7RCpLo=;
        b=joGiFhg9QM1AWiswGcqfo/trk6EvAoYwa4Bfb6pc+tWuxsZWDI4wVqHiSjr8BFcb1N
         8d0twTe7Gyb83uj3lQpm8t2NhLJi/vSQyOoMPHM26TgHsRE8/Kj/L0yiB8FSi7DPJ8Hp
         NNt2gntId0cPZiZheVf+DK1102lpSjGeTFbj8EEOW/kFuq6DvVu/jm1A5QkF7lec/7gJ
         IfbEaSA3JTZAb3FJKHtI6BAsYdpLPm1RiYRzMfcJfZuEpjUwDC9rmAfYf4rqVVGT/2ZU
         8Jt4cLXHWC4S5SQRPrm5pjOCU6UMSkUAPSfDgA2oFhHeSOYL3jWMGupHiN2fH5S5yCWp
         Tt0g==
X-Gm-Message-State: AFuF++n+P3XpQF4Aolr8eJHhlo2l8zDezp6NvesmfGyUX18C7u4r3wFd
	Fqe0QthhIDWrsL+C41oO4WvHfAFD8N6JtU7UgyggkFJpZEiOItayV+T2ocPz1NnbRfimNEgdX/h
	xBM5lPSwudZ5hPrCsYwJ/tB3L+RsQBcQ/9rbSaQWoqPFVHLej1KFcPI3Gwqsn6bJOBlTqMT6fqD
	pS2PNxAR4akw==
X-Gm-Gg: AYBFou0pK4fYgjaODhxvKcFHhxAUNI/nQyee6mG4pG/UUPpBMUpM8Q3omfmdgBOevMe
	wYppPpspXWjvMzs6uT/+yKs296rVXzFXIQI8tlOTOh1eDKCxdQqBO+KdQqQNHEFQwFJdAes6aid
	jkNn56jomJ9ldPQDeUYKh0w4GePVRwqa1xCr43TBhCrS87MKQ3yNKNrlbv2R+WLe8gecFt52LGD
	y3nNY/OG8YHTOmYgDYtERMecsmOtQfhDYnR1qAUZvdw3SqizQZLb261wmeOapGVLyNin1tFO2To
	u8o2T7ukTYWuQsI4b/cIfNAhVZpHfKkLz7H9bFkUQyGKMrP3N59GF34NnZ2/rw+ELBpXjsMpKfB
	TFimL0jOAqNyD646Cdtbzb1M=
X-Received: by 2002:a05:620a:43a3:b0:939:aabd:bcb7 with SMTP id af79cd13be357-939e9efcb3amr428010385a.26.1789121970671;
        Fri, 11 Sep 2026 03:19:30 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:aabd:bcb7 with SMTP id af79cd13be357-939e9efcb3amr428006385a.26.1789121970317;
        Fri, 11 Sep 2026 03:19:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 00/10] arm64: dts: exynos: Few strict dt-style-check
 cleanups
Date: Fri, 11 Sep 2026 12:19:08 +0200
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORtYp4j6KuKhTeKMaDaaVoSxd
 7fq8bv8/wIuWcXh1C2Q5aWukzWETQd0izYKKjfD0A/7/hgCph1ycfT49Goj0kOi1Rm9ZKWCNFl
 Rq8IofIjMiThuA7TanOWq79/pfPnba7oLlW8e1vUDf+FcxYsAAAA=
X-Change-ID: 20260911-b4-dts-samsung-cleanup-strict-continued-ed8addbcda31
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3l/uI9OLyqRLWrTfCZNHNfE6QewbrNbl0gZSzNJVuUU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WkbigijgzSCRuQNSOIRr1rGuWGDT76rKNzT
 krVAAxPWjKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVpAAKCRDBN2bmhouD
 14KDD/9OZ56pJjMJxchjiHVJke89vPGIavObIaxQ+1RR7VDLzc79myeI6P4ZU0dHYhe5NSf9fLw
 gGTtFdVLbeD/nR24yar7reNktZz66JugLdx41t4Xt+3/xtfEG6KwTLAyqvXS13C1hxa+skschFK
 dH3tkdjOotbAOQv0eCBo0UBBjzHTELSs+EaUVo2dqGVXmmDTspnwlw+/Qf0NgH83W0W2E6i5rGP
 ycnHVkfwA3oktEEBcSVUAd/apH8FJsDpAuFn8/+Emix6T12POgq1XSraI6q89LOGWxxQajFputb
 IZUbdp9EV9NIdGvxrNkFrv0Vl7ZV77TxgqR1xr0O+t42oPPSoVbz41JN2PMC71SPsMJAq/3YAno
 j2mYrYNhaUuqONzgnd7AXKsGdKgd3MlVyOmi5O4F3fSk6I6XvT+fgasgnbnsgVsmfUHUT/8nRFw
 zpzQHl8s7bg03V7WhjF8n4jSZYhzMUZX0nz9ZzjTWwrf+dCYZbkz9iUNnOnD0BZvN07YnKKvsyy
 l+4y1hL7qmLG2mX48KmHS4eMyN2y/M+VC8lrfi92P3NdbJt0m0GeSQUDgXWKhMjqpKgLN5asTkQ
 xpPLfFA1ua0Lfl1ERZhKImrpqoii704bWvr643YQ7WAHHqx6YkdYHpy3hueJW6GcHgPPsFFzuYO
 NXw0hNehurw6m4A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa3d5b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qxZVzdGA1PWmyomorPcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hsLP_EZdO2hWBi16bmHTYLRUHPgvG9IX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX3pMFrOCb5jAZ
 E+p8juyLDFKKLM/+7jFL1OptGA85Vdi4TD/Bhw5zXEOHKrXIkcnsbnt5VwpGZXnIocmyuISmXO1
 cNQEDD6NYtLrhHX++XIW6LhqwryM1uM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX8EceI5uNc+Rd
 iNdv6M0SumcbLY+OVjmcRZnuH4N0kZS62kK1Kx0leuyBH9ZAdprdfSUo+IYc2IWMwozYzfgEuqo
 EXimvT/tDAIJaGvbXDtlEGsLJKksQlBsht3gDN7hvqNGhJMk6nxhq+lK751k3kro85feCI/vD9p
 Bvcfkkl09REZYhEro++Tse1Fqu5YpOYStX6nADaxUDmvOCIb4w1QbVHJem//+MUK0pUKSzIDlxe
 BcVAbD9reoKNTylFg8y5nmwubUw2FrqDQ1YNdzPziyJ/2yWK4JIiPil2l7ix/VqxuRK4LD6M9cy
 sTHlGgU5BiOB8EhjO/vo5TcdTR1TrV4pC6wGeKc9npV7AroNfZhNlgz9qk27ggmrUl5TAzhWrbw
 PSZq6K/eoNKrix/fAoqwTCsXp8dtkiiICWVd+d5L2Bi0qVh1yZDIus9rjBg9cy7f6ATKoRZkHH8
 j+Ke9a2XcPfPzRt3/pA==
X-Proofpoint-ORIG-GUID: hsLP_EZdO2hWBi16bmHTYLRUHPgvG9IX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031932_998560_0AF17FC2 
X-CRM114-Status: GOOD (  11.67  )
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

Not yet complete, more files will follow. I probably won't re-order all
Exynos5433 soc nodes by unit address because it is way too disruptive.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (10):
      arm64: dts: exynos: axis: Re-order nodes to match coding style
      arm64: dts: exynos: axis: Re-order properties to match coding style
      arm64: dts: exynos: gs101: Re-order properties to match coding style
      arm64: dts: exynos: gs101: Re-order nodes to match coding style
      [RFT] arm64: dts: exynos2200-g0s: Drop chosen address/size cells
      arm64: dts: exynos2200-g0s: Re-order properties to match coding style
      arm64: dts: exynos2200: Drop redundant blank lines
      arm64: dts: exynos5433: Re-order nodes to match coding style
      arm64: dts: exynos5433: Re-order properties to match coding style
      arm64: dts: exynos7870: Re-order properties to match coding style

 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi       |  36 ++--
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       |  36 ++--
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   8 +-
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi |   2 -
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |   1 -
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  93 +++++----
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 232 ++++++++++-----------
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  39 ++--
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |  34 +--
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  34 +--
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |  35 ++--
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  39 ++--
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 108 +++++-----
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  40 ++--
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  96 ++++-----
 15 files changed, 421 insertions(+), 412 deletions(-)
---
base-commit: e224ecb509d7a636a89bebab8d47239f83294448
change-id: 20260911-b4-dts-samsung-cleanup-strict-continued-ed8addbcda31

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


