Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CEBC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWNogSGoXxmYooMnlaMWgLpI5HziOy0OYIK41DKtJ6o=; b=ojN4pjgMrAEA42JU60hndYOdQt
	kUhHY9bPfqpfqnglSofmJW4zCf3KY1vhmoG5J5rZwtPSbhc20nOripUOYkxgc3lSqw0k8j9AebD+n
	iOLLnsaB1A9NXCLphWRzZQAgz9rk7XoqsG6zmGD4w4JQ0HXRSE/J+JhgZIHv81g+OxA+If0Eo26QJ
	vr1+Iv/ZjfQfuNweYSuGD9ZMOuJCdK+TfeIuGiVci+l1ZqXnqiNSoFsMl5GtgDgTTwkD8Lm2qhaPO
	/gzJQucRTlQt8AEi50scjJv4pOIDnR9subXYX4hjeW4VY1IGbnWBqxajnOOg6b3FzT4zcvU7H4fam
	XvaK6nIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J7v-0000000BwN3-2qOU;
	Wed, 09 Sep 2026 14:18:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J7p-0000000BwJP-19FI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:18:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689DIVol2081085
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 14:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWNogSGoXxmYooMnlaMWgLpI5HziOy0OYIK41DKtJ6o=; b=b/GhkWEDbPpNPr3Y
	CGUAzu5FTmHKpYQzkojlS/Y8cVa89Sa2/T7L2ck5IkuZwvSJhfERj3e87/l8LWQp
	l9WyRh6ZXjyR+C6Fqk4GFA6iF6UZrfkypulG/fVrHZD0nS2RHjsJkAOX+VkRn1Az
	cNRFQaH6DbfrjOlDIhoDQYQ1Aoq1MePILvxkBWBVtt6mHK2H8AmG9DH1Au1IRimx
	4k5fvcqSLSEVXTgcRuH7zr2vWTaQWx3HxSF3QCCkw1q1ZkpqIHXTMDk2n1wypyUZ
	EI2TCx2EMJ+KlhdbKDgNvvYEZIu/iB6Grc0M009rPMReuvRhxeiw9vxKTBHYlKOF
	oWklGQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r09y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 14:18:08 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-785827e6073so814451137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963488; x=1789568288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWNogSGoXxmYooMnlaMWgLpI5HziOy0OYIK41DKtJ6o=;
        b=bE+q62GBpXDqcHIBjVhhdOYPRB6hBbaqjGEb3mv6/i3HJ+ubJ1eQJTOhJQ7Bwe3lvF
         QMYphYhNY15YmIrNGlT005ai8VUXJBuEz2Gc3IJMhFNRHyWTht787m+A2/LtEaTlurwh
         tgP77/3AYjo4Ctgs+PlS47zdz29tH+efhnnMMJnPfusL+jgnpioS8KGoAHWeOeZpteZb
         s5gBmAdfxJy+eJTBmZupGQDSjbuaNuLdaIn31bAsTlXnJ1MPh07o22srwgrtPepKNzW7
         RbzDrU+PgL+EGELdFJX7WIcEOpbQqqZ2yhmHDTrIi/SMPK9dvPFXJVb4sPPyOWLNlep2
         UPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963488; x=1789568288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWNogSGoXxmYooMnlaMWgLpI5HziOy0OYIK41DKtJ6o=;
        b=l6EUP7Bcct4BK5pE9PCU5Ut36v6Avi29gGGL0IhKoZQMm0vRR6JVk1Mh6T/09ocuqP
         N1wIiYG5A9pZhpBCdr/K4EhC0I0nn6ODwHSYz4D3Awggkor70EtKPEgINGweDdzNtbUU
         yhKN6ioEc821PpRHpUWhDWxJM51qbwlb4MCSYkLww73AHxF6BgdGFMCNsZPeyIdjvI2U
         tifbIyK228ogLZGooGUfMOHp9gdclzYsduyLU1CP/d4WN5SynI+duy4xCJut1Wp9KUnN
         GIKpRIHzMBpVubI8RqKaTpze3W1ir8PKdfyV3NbV928zHZHsy4HOkfDPztawd9mh/DJq
         xcwg==
X-Gm-Message-State: AFuF++nnq1HLW4XgSe3ypFukrmFeyL2b8cOV0ZQcuXg1iHjKRTZJW9sJ
	w+xez5ESiU/iCOYq4ldEmAkEN5yh5dJWBnG0OQ7Z5dO6ebAc0OpUFDoLTLK9jCQ6I3uAnGRulon
	PzHTapxT1C1b3F2n84XGvrghJc8XORpkiHqZAvoP7TDIXG1z6kLgEWYbfDndbdCUPN8gByxvUoW
	oqQw==
X-Gm-Gg: AYBFou12MccbYmvG5Iu8GoMcX5vdfrxn7vY1fNvGNw954/fbUilTD9GlFZllO8FKauS
	8PPQiRF5c/gJIBsH0+jGpXgj6vVkuEG+mclzV/1Dih1DevpovHYRwczlJt3zGdSHvpNmR9KXkjY
	mQFldbl+OPBA8YGPlOukU2yM6o3leMr0+xt73STYa0pzRISZsKLGzYTKZHwkEyeD9cFLd8Nv6lS
	yfhC4aCDsiwfAUHivw+QDVH7der4aWl6ZbGUBB9kb+CnABuQbAP/jWHbk4WqCd6z6wpzewH86TW
	qVkRkfTiiyE5Bzpc9Qbzz/AAFdJkU+FNpL4YEux2FrMLCCnYbDeEMBE4C1cURvuivsWmXR4pPDi
	L4yHjHP9jqXLMAw4y4aOguy0=
X-Received: by 2002:a05:6102:801c:b0:785:35cb:e64a with SMTP id ada2fe7eead31-79075874ac1mr927903137.3.1788963487872;
        Wed, 09 Sep 2026 07:18:07 -0700 (PDT)
X-Received: by 2002:a05:6102:801c:b0:785:35cb:e64a with SMTP id ada2fe7eead31-79075874ac1mr927865137.3.1788963487469;
        Wed, 09 Sep 2026 07:18:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:18:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:17:53 +0200
Subject: [PATCH 2/5] arm64: dts: fsd: evb: Correct node order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-2-1b755a446b22@oss.qualcomm.com>
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7UW5GwmU0Z8p/behDTBZPr/HmZL2ZVIKFtCLBQ5P1oo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqTW4C5Wq/U5QqNJNk+i4/mlCYILEsx8WMHK
 J2Arf02cvKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqkwAKCRDBN2bmhouD
 16cnD/4t5mlZm0J6t/3v3P6A6O9xytJLgafTGrGvR+MBKYLd8Ejv7rfoqYIr+1xXo0KHcVaGdhg
 sri77d32eeOEMPPS6O/ksKJ8Dxna/VhQT3U+0Al5pm51f+51mdCZO9dlnFAgPjM8ZTpjdGIuVPs
 zeNsZ29gkuMLfcyauXViiR2FerOEJXsPn3MLcZpLMoXQD7wCzSXkLRnJ5952U/4t5Arnasxd297
 vJsp4p3nAV1FuD7iIYKNAIdhQP1lZamO+e4y+xdln9dqcUpjKbJggh68EZYfL+3+mcdOvBr2j7L
 M2D7X4ltm+Jk6itQZM2chHuvMSGrASFzLXHCqBgIwq/3XcJ5iHOYop+yLQYOBWEmbanUbTpPuLW
 ovgLs55zxGPXtZLXWIxubIhi0UoFjpjlBxvoSWl1MhUqdAFdLBYZ9kvsSy+3EpvwlM9W06cZ8LM
 taPkgzIJNtDGkWFpVpMBCdkCu5n4JopcEzf3R5XS3APhBLdlMf+U+s9aWZjLocnlXtxOADH2Tz1
 vqhhHRWWpp4GFeZoJM4FNhRRITksXOQqcqKu4TPFiJNBetNF7HBeqnkD49QcjR0N0nHDblXj6+X
 /taV1K3ce/WCPu7yPM8gTDS0WWpRrYA1Xf6ijkENCDHNxeg9MfjW+hiS0mcsxlAXjmE6AEmF6j5
 cSCLu41KcofYUKg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa16aa0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CUSRVOmJ_5qU7sUgHrUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX2N0V6OOj1hd0
 V/RSCXApoXV2yS0+fB3sqRIEA6WptCzQzHGQHPkPYbWNlMRPjra3hyF+90orfZVR7rPviy3k5CK
 ARL03HppPTqYB82iGXscp1ak1Ml7uNZwqLJw0hDmmNFjtwF0dCcCtk9zT6CUpnpbXYOhGaBv8F6
 xmLGQMnpIxT8WBi/oyh9Wwpi4WTPShgflByYvs3Mev03Nm+st6zAlQ1NcG6hn64yXhJ/be9th3w
 9rarQrSa17/4DUMh+BQWpvNW+MiF6EQURSqXKAM8OHcskzTTSRjhrIW0F4by6MWbVmNJXQvwpM/
 qi2aYRQsa5YnM+wI5pYvvucMuBBPW+bT0JXKSHKZ+sENw2qEXfuOeo076DozerjEb8IopyKFD3i
 NbY98AE9xB+fA9ZIM/R9vz6O3DAl1Ssh5usl+MTqSZgjxsEwsL2d93TNGKR7he4iveC8fSLxSz6
 JnZQtOsZ0lxmlXzT+pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX+bx5+v5jOMnZ
 ZCcCVLaKejSSKKs2yeazSLOQ9rOmFRBQG09SxMmtJNVWvL+Xbrm7wTHZocOnHMMApBtLxns1jg8
 QihLZVRgegNgjPAElc059jKYhd/Gpe4=
X-Proofpoint-ORIG-GUID: BlQ4taM_pufMYktkSovXGbLKKb7WdSLr
X-Proofpoint-GUID: BlQ4taM_pufMYktkSovXGbLKKb7WdSLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_071809_329890_DDC998CC 
X-CRM114-Status: GOOD (  15.07  )
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

Order nodes by name to fix dt-check-style warning:

  fsd-evb.dts:61: [child-name-order] child node 'codec' out of name order

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 503abe52a81c..a1f3d3fbbf8b 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -50,6 +50,11 @@ simple-audio-card,dai-link@0 {
 			bitclock-master = <&tlv320aic3x>;
 			frame-master = <&tlv320aic3x>;
 
+			codec {
+				sound-dai = <&tlv320aic3x>;
+				system-clock-frequency = <33000000>;
+			};
+
 			cpu-0 {
 				sound-dai = <&i2s_0 0>;
 			};
@@ -57,11 +62,6 @@ cpu-0 {
 			cpu-1 {
 				sound-dai = <&i2s_0 1>;
 			};
-
-			codec {
-				sound-dai = <&tlv320aic3x>;
-				system-clock-frequency = <33000000>;
-			};
 		};
 	};
 };

-- 
2.53.0


