Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02588F4643F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=; b=t3k8yBI0mbqGHwu2EeNoi8zVra
	QdRJePU21FASp5CbOVrKxgNYBzd5PjE3kvdh25eworXvZUF6nKUmf46ugAtOXmRfiquB64+vNGx0m
	orY90vkam2cvgQxldP6lj/4lYgtR/7DkxE57scMOJheTEr/mjvNZQnTSHRSHpLxu37dHS6eMLdC4t
	W2sqYd1GZerir2/Tjp5e6dOCMDbKGTzVyE0aRQgo2OVGbw5/LbTFDIyR9S1WRrLGaA0X1RCT9CIqu
	xW1PUSRROGdIaPBWwr5m+bxKp4mUi+a1hw4XIpJ1g4A6H3M/0zd9nX50VLDCGx3L1MfBiKE5bKAno
	FofRPuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24WL-00000003gpk-1Mrl;
	Mon, 16 Mar 2026 09:45:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24WG-00000003gnN-2F7Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:45:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64dRR3777661
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=; b=jNm9uV8wa7esxl23
	r9DP5HoqaYHcDUIqlxJHYWwY1Fp3Jy6Wi0qaxhB/TZ1RCg/NH1fXtASxjZs8D0rG
	NvE6y938E9UPgqduAJ7tocNKi3+OTDm/wE+wYT6ywH5m9dgZ3srcq3I8+d64pzvU
	svwgMKlCJKEEiOJ7MxFht8CYa2STD7z2OmO1EW/RXaLq6hyxZp62tTeX8xWs1A/H
	95qD7oyG1nHjMJv+CVZmUVNW9yrEC2WGIQdE5WcX7Qze5CIaHqokyJernc4tNBmo
	w7DEh0EurOSrrjn7+E4qw8gA2PAUb1rO5HM5GEfcgqjbsTgVxYLdyeYjTXVn0VAu
	IiL0yw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7vyy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:45:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cdb995a1bfso2796769785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654351; x=1774259151; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=Jdmt2EqHIIApl1wJssH7VuIKhJtePGTGZJBQ/2zdVFkJsc/W/xX1Oz7+6xY9Qo1wRk
         vLjKKsI0YTjlhTg7J0ih/9vMCMmSEoPuBn96d8lpnqJ6Qq8UWn4LejypFtM70KwU8LLs
         sL40Up03/QppJ/5wM28HFNyzDy4epJcy9RYKBhPB+zVTQpLhcUj2ajEQ65vCA3WpcXKb
         VcB7kpehyX64zIJ2qGeOnqh2n+tDrtQqedvJcYyEt6HPKXLmE034WOPXMaVHsLizUTbT
         fWqyeUPXttg8Rv1Lk2vXrBl7yvG2dGxu1rKLxbiPK5xoG2GI7wPzxuP/KqUmvfzxtIXk
         67Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654351; x=1774259151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=V+K+WV6poP4T5C6BYm937fDB6pKiY4r2hs1BY+3RekF4g64ulf4kx3SElF5EYgDxc+
         VSA7GV8vqkoEjxLmf/qJFffLp2AHxZixy0WnRf8jNnyDB2zf6EILOMc96Y6XL/ZcleHE
         PsR/ukw4dEE6q6ceCCZKS0AavK/RtR5vjIjSJFgF5RTi0v2Bkhg8sObL3udmwnW1I5r5
         61bvDtYIEhgWGXoDd+aMKiiVgn84NEuqGGfeHcNe7ITJebIy/5xdh34J9hPGd9UlzERb
         U7Hk0uyhxYSL7fDVXJrbTjVzKr1Fd+VmNxBiPrDSeaJ0b5wynoo8VN31ZbwLKM2+SXPw
         6Q3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJcuXZYXQu3/Lcg7pVtkuYCK4pXyHVX4Ie0gCewEgDPAGNrN7ByFLA9t/lJreyq5hVxq3vrJZPuuF3zNUAz5Pl@lists.infradead.org
X-Gm-Message-State: AOJu0YyppnZCom8/3XddPzexWKWQJWOHi9C7KTy59X6n/b6H1GywlOrI
	RWSPw5JO7eBoyb9CVKC8BABcpd6YZFJpm0ERTB5+JU1lEoh8Jdba8mWn/cPaigBc5t/ZGauLJIe
	KhlacI6t+qxVtgP9a1Vr/vBbkGZnZ60anBJkjgW6J+fZ9f+Q+6kR4N82pjYJ8qpIDYU415zGlVp
	zVkg==
X-Gm-Gg: ATEYQzxPjCDym8H8La8EW3uWvTCphwp9aPu6lRYA0Zl+Mw6EX5JJsG8trUwj9uH97lO
	rKdbxB7he+7cpVgrZCL6F5u3ROt1FMhoXsFoq15AmcawD1YUSDH2wlVmzKKAeEXy1QSFv+IUY8s
	froL11+k6DlUQA8Nxsz0LeeYPjud41O25lrnGRgY8EfLCeHptbwbVI5mNtY54Sk3WDhwCftDYoS
	NSMYFtEQ6O0kpgnwoJNY5vKoHNunjVNv7ia6lFL6tsXr3uv0NZDG9iVWwlCe9Fr5m+21M9cCV3X
	9zEbrUgEl/p32ZLpPjo8BuXpSskSuH7RCMAygP/lEsZ14Rrnqnu4QwonAOm8H8bgI1TXJ0ngAzH
	XSoJWRxI8fni56HOO08cflFBVv10I4SFtMuXDwUZPaohR1KAAzqI0
X-Received: by 2002:a05:620a:4153:b0:8cd:91f5:7a29 with SMTP id af79cd13be357-8cdb5b2598emr1635909685a.53.1773654351004;
        Mon, 16 Mar 2026 02:45:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:8cd:91f5:7a29 with SMTP id af79cd13be357-8cdb5b2598emr1635907985a.53.1773654350529;
        Mon, 16 Mar 2026 02:45:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:24 +0100
Subject: [PATCH v2 4/9] leds: Kconfig: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-4-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=808;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E8i6aEL4piTNPBuxvNyhkggWe1e3NVYraN7
 Ks7jiQgHs+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRPAAKCRAFnS7L/zaE
 w/ZAD/9owgYgilZp+MsY55UDQRktGsR/H7gu25ynf1yhU4AxMzntmbgKtI8ceNacGdL80sij1rd
 BC1afcEdcSeocPHYhV8XrTHz09iBj+gnuOx806Aztjp7T2dAIN+2iEIjUM3kaBCEgSnqgV4zQr6
 KP800070rOt+5F9egqM0Lv6yiQUDNMAn8zKj1lHgWzcRAX+/m+tJCaOTvMQ+lfYmN8RwfNOnafG
 cDonwS9X74nEm1gLh3vwBangOT0m6NA/CaV9RZH8/DXyYqAIvvCpV8Jz3U2D1pRdGxSrHe9eRup
 cbjzFzq/LgbVkxDXxoTu4i4o1iNuhn4k1/feicc2rZzuUySztakWwWWSm5acHzKR6Ptz1WMQI89
 Hai2+hXihj3LpxTO/VnuyrqwkfChDWqcIYxw3Vsn9nZdRi4NraVQGY/AjuFi4NDRw8E0I0oIZ0V
 bqrdOjurKqeApM8B3x+pdjk3MGTlDbhn/AQrLzGeiWpOHr5yNZeuN+E8BiBQFvka6LJRALRFKtN
 lpy5tTKnZuANqh+kbu8XfvN1aim+wXkG0r+mrAX66Sm6PuUCfDKrXHz5NKSMBkBfTvAtGmGzu0s
 L0qw3k6k3RvIxBjnOdCxgcNf83bKNrudGRNJ53TXD5F7++vEy53ZASRmatk5lcOn2fdcam0C7NF
 v/S76FvWP49WAfg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: eqR3TvzbETK-eZdTjW9tVWnWeNBr6Dab
X-Proofpoint-ORIG-GUID: eqR3TvzbETK-eZdTjW9tVWnWeNBr6Dab
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7d14f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ULgK7OEL32dECu8VbM0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX9R/2zHih63+m
 nJMXDF0zcGzLfZUgM4JM5BFkPM8uGO5hmJoGPRBXgMpemsMzDe5VlRcHvDt3vtcMsF/sEPBB/vA
 Q2ALcdACuGMw7+27ywjgfIPQz+s42nLwwN2rUGabT8+mfjzhRtNrUtJOmKbLJzrc2rRZYRDMoyv
 ZeWFB4cGG+NAaayIm00MzMysT5973U6n9jZQ6ZS6fClBGJBzgtjt59TafSKinqRrLBfho97+rqW
 1KpupSY9hcmHZyucXR4Bw/VFLey1RybF/Z38iGuvLUcdRC99lKG9VT1zKyPsuI+tAwhKJTkilSg
 Npa2wq2KOcIsz/OPOYrAUfTc4eMUsXKktAPul0hJqAXMownT5i5OgtAo1Km4IWmU9lSuAPrQ0an
 ArdmMJLCltb6pFL4JDYFhOvzdJQeX1ti3lVlbYuRpHoG1VI/2RiG4dfgVUoYTFuIbQIN/+3qe1a
 JskeL5C/wl71TiMPIYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_024552_627920_3FE48D47 
X-CRM114-Status: GOOD (  14.72  )
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

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/leds/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988b35f304e953e873af3afe2ae04b8..f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -765,7 +765,6 @@ config LEDS_NETXBIG
 	tristate "LED support for Big Network series LEDs"
 	depends on LEDS_CLASS
 	depends on MACH_KIRKWOOD || COMPILE_TEST
-	depends on OF_GPIO
 	default MACH_KIRKWOOD
 	help
 	  This option enables support for LEDs found on the LaCie 2Big

-- 
2.47.3


