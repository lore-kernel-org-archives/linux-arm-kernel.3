Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988F8F513E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpMBKCSvSSCJ6d7tlxcLy1pZDHIoGSHsADWWql9ZdpU=; b=ZcM6P0DKHB24zIET+llsFPJaxg
	26ut4TOavTpaOCYUV4eSnivi7/8Hx2pdXJPVPmWQOxnSyF08PDKNsgnHwr+xYwxWwqDAsA83KGDnb
	67Vg7mTz1+4Gdyzwlnkf5uSQt5wT1XZeuhPh3YwCF33A8oe2QNo6JA4HuunLaD6R/DZusRCMXhYXU
	Zyja76i0k94TF7M8APJ4GTpMU4kovC+NhD1u3ApSqaOfQrWfmKUkrNBI7NY97kVm4Flqa+4nEMFca
	Vu5zP0+hJ1emW3tyZcE574QaLi8oBWQbNsk6iQbKV3XCOifDW69UHuD/WeX9KqQxBiG4N6v9JXTpf
	Tz80bGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWl-00000002bQC-2WKS;
	Thu, 05 Mar 2026 21:46:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWf-00000002bFi-0hfl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmXDH1809237
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 21:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpMBKCSvSSCJ6d7tlxcLy1pZDHIoGSHsADWWql9ZdpU=; b=GeBv2aHNVvKJuPtt
	eqOaebwXuSQyRXKB14SiCirL5sWi0kFlG7GjQG2PGoGLP5iNIdRwlb2APnrLD29V
	AcWpBx+LDgm4Ns9G5c5nNRz/Bm1VOy/z2inACLoaXG84LKgsYo/AwHUh3izX/eab
	u5T9A6Ww+RUQ76gVcYzTGMEqQifcJorocpBhrICD+UHOdQkIS+q13LQEWyQh+HKa
	2Lo1uTq+1Q5MFjbfzsZVmjzeCaHNdhWGCW1InUj+W5iwk4Z8Far4fEmkpAz5ZZlm
	Ay7u7UY/xudN8LiOczLN9xi8YOXCgWCPKbEPaLfJMl3wusZurk7q9rmRR6J+XD8q
	v2yp0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp407pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 21:46:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70fadd9a3so913689485a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747192; x=1773351992; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpMBKCSvSSCJ6d7tlxcLy1pZDHIoGSHsADWWql9ZdpU=;
        b=NBo2P3dRYo+Lyb+aEuOtg59qC2JaPBcKPVyHiwlQ4scCWCfqQO51nv71B/Vh/2l2ca
         ZNFILRoNeuspnAFPCyBLCCWG0+zMdk4uCa16LyLdfVvx9FmKONMcLitXR0lmctZ5pEgN
         CeEN6eFsmCKr2Y235PUY/VJ3jJVnsn6q2pYgjLz+QAt5EkeAgQ/EXV1UlUAXgs2b/MuJ
         d4U8VT2eyyCYDoprk9On1/BugfsAw6DMbb++rWwGS7lQnPXyaeX2BFj5ga4hiCAeQaMf
         aJl5l2+ggzdhSRQT2TFpBtTWlkKlWmqALdWluvjk143X1Bv2jbDU4v4KKfIBc60nlp80
         HB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747192; x=1773351992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xpMBKCSvSSCJ6d7tlxcLy1pZDHIoGSHsADWWql9ZdpU=;
        b=eBJiS6JckROGWPdflLorsXK3uIwy1vSnQQJVHPrTkNvVxyGvtm+XEEmCOxl51zWQin
         WtBYihAUjzS8Od+aw1zQIfyhuGsmtlflh1TZ74e7YqHu1d9z0Fy+vMrsz+rANKM5sxLO
         d8Ee13lBQ3HAKPPew2U9OuJTO7d4vaDzMJFK0aVMk2JCA6mQS48Ls3DeMxp5VMo4u0nA
         ViO10Pjoz+/Ak5hZ2hx4mYaCxSsyXTYuM3F36ZE+NgIu4uWG983Z2e5OdqO0EDG52TsM
         AI9/wlhBedatPX/K3fxqC79mXLNkZXYoFQnnuuBXWxQL7WBVK4fS5jW6XZECdXqNhHcy
         /zfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVERkBTZWfcWRmHauM2PsmduKx/CgjDyJhAB6JR2dB35weAnvcTrRjxL71nF5pfXZAHbrr3D4/AXzWNRz24HHuK@lists.infradead.org
X-Gm-Message-State: AOJu0YyCm/M+phdOvoNt+eHHJQnS6TxSoIV0p1Yqn2oqNVCwQ5DJl3tq
	/qb9mq8pT9THDofjeLDUpJUNeN69rQ41ZRrP7S879FYo52m7mdR8VbzyMv+6e2WdNNcJxP1wxmI
	oat9KiBhK1J2x+r+1dBNzNsE8+DJHMAQ7R0GUiACT56No+Leq+thbdAWmFpG85KUdgbdAfFXidi
	MDYQ==
X-Gm-Gg: ATEYQzzvYLZxajHAlkYvkaKuWjcl0rDwOa1khJ5RAHcmDRK2zIw20OA234/saJueBkP
	AZ7VZlYibYZD692rsQ7ncCffonmp8UFo3x5qmUxkXGu8T8wHY/8saeLdFFuFkUTlK/26ZCnKieX
	uJrO40X5xGke6c431dM4xKPy7Y22AyItAixIhIJhWsqAaUoH4Ys9sNkTGOBLb2CtZxcqFguaKfH
	tOSApT8/rGjYI0GfbStFzmklV/iV79elVLkXBWKc4h4UidJLthz940VM4Esdh0pJyygO3W2x7Vf
	m35ktCoDsz1Uneu5kdQSLCSdJWfpBX0BHYwT9zwDq+sbVO45FdIWMMyeePQdbTserZYVqpxxrd/
	bMiQYPJeK+CO70SJ+nanzwTfSAWWBXWLQcQaiAUl3HT+x
X-Received: by 2002:a05:620a:470d:b0:8ca:3ed2:175c with SMTP id af79cd13be357-8cd6d4cc1camr1442385a.43.1772747191629;
        Thu, 05 Mar 2026 13:46:31 -0800 (PST)
X-Received: by 2002:a05:620a:470d:b0:8ca:3ed2:175c with SMTP id af79cd13be357-8cd6d4cc1camr1436485a.43.1772747191067;
        Thu, 05 Mar 2026 13:46:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:46 +0100
Subject: [PATCH v2 07/10] mfd: ezx-pcap: Drop memory allocation error
 message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-7-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GLZGLUI6y8mTC1CoUCYnqXy51nlJ9FI78lkz9mC/UlM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmeJzlU8gtQ+4HiL7LX4Fy8K19t5RszehHhz
 SdtprdfKQWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5ngAKCRDBN2bmhouD
 1+uJD/9YHgJPFhEWQZRYuFGzeWe8z/r5Tj5iDNybutQ6RysEUkerwdr2pHTgfsRQ//1RBXmWi4/
 cGOD0AGUW3fLq4SM0ozdgKVp4SGjHe5iS324Xf1SGuW4PJtLu0+DMjDrfZ9Kh1ya+NqtjLYuctz
 EwrBWEFLt253pIx8JCBgt1U9C6IW+kSFzgE0q/6wqJA4aWn75PrcCxhf2XrRd6gNe80PoXhkOmd
 iPj9TycFnCTENdm1LWjcEsZRyEROU5nbnitPogh3z/3ryvudV27PKHPdqL/LKiQpefeIln5miV5
 ykVaKnRr187X1a0M6VOJWFeleyCQwr4MXqY4dHZnwAwm2mzUoSfV/+72TagqkdYkAtYsXcGEnp4
 qwXZqkweTKfvInlQcX+MyS6503tvm1UMD6Q2kjN2gSX82uO9lbiHdSpFRU093QPrKuJupoShmdh
 c+IRyPPixT8vJaH4ptL0qsHeVwM+TK/12/SQ7fPsshy9snxcABFZ0LKXOo30Nt2gevOrIolUsGX
 PNGgDwpP5Mj32fue94/BZgfPd3GFsPgp+6L/76kAS7UKVXl62a9ZGQ/jZEwxiu0d7y3zwBnCiYL
 sOSc37AP/ai745h4xjt63Iu8AQz/MLguOCoJxLgCfbcrRpy1BlqgAR349lUqdkuRtqt7TOnBopB
 uVBAFJuWvfRWAFw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 2QTIj3b5eBZtRuhCVFOCJ9n1NYxOP4Cu
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69a9f9b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3HoxRS3-ReI3PdwluWoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX/7HQ/lFtEyhx
 VmriHH1MBqgKsRKSOFfgZ1Crgn4/jcPUZxmugjZQ30Vx4hPupvHITmztV2Un28fKOKHeNNmTc1D
 WdV1VS4N2QeTdOjl33s8rnAdBT/g0n9UhI5QL9RTLKatsRmaBGtAMCAiaFxiK4OmVGUnS2OOC+J
 yHjrwRiyphZWXoRxAhZ07xqiyCzh1n+QLVd+z16rEoHIoa3EzHoA4ym8UYjfZt8jvK6TKxp2AVv
 WlRJgX4TSzZFAMe99Tq1UF2guvSWZqpxUiGYK/LTqpHW2dLnZG0xiW8hBEKJRwLNAc1iI8TFqEq
 98QW9Qb4qGXPf1wZNNCecZycjsds1Sn10/Z5Qpa+ml9o1+3C0EbAb2rLXD/CIoTqlv+daUeCM/o
 +I1FQFUgMu4dtzfPfPO84Mn8U5bjnYf0/jFqH6WPsJdrrL/zvZwd4szKwZaFFHoAAKm9sVAoBhl
 iru0Twa24z/+nx9M8bw==
X-Proofpoint-GUID: 2QTIj3b5eBZtRuhCVFOCJ9n1NYxOP4Cu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134633_902057_493A5F62 
X-CRM114-Status: GOOD (  15.32  )
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

Drivers should not print error messages on memory allocation failures,
because core already does it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Further patch depends on this one, thus it should not be picked
separately.
---
 drivers/mfd/ezx-pcap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 24ca140d6a48..cd0520a08224 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -416,7 +416,6 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	pcap->workqueue = create_singlethread_workqueue("pcapd");
 	if (!pcap->workqueue) {
 		ret = -ENOMEM;
-		dev_err(&spi->dev, "can't create pcap thread\n");
 		goto ret;
 	}
 

-- 
2.51.0


