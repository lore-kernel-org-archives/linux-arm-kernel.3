Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C56D6552A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=; b=sgE7e4obAukeacsUNlmgEaFu5P
	e7soQTLDI3mlpj+k5tDuvnWSfwA2wMtMkjKUj1op1Hlsw4BhtuprwwJjLllX3ZG6/frE7UfTCpE8f
	X7ELjU28BxHR7hdeq4cn9WzQH7sZfPmIKuZQrcdtTS5+B4dNz5EmzFMd23JLNg8MpjNa3Af2p3Bnc
	Aks5oBlCPGotcwtrUoOg0xOwTAD3Z8WUTaEtd03IjGvYpqL+Ec/CT6LIMkmRQact+lPcyza4YH0DZ
	/4c/51aGYrXbscRpg3TtSPUaY9dCOCx+AfcAe0UZl7uJjVA0wtvw+baWU9mw/NT8AhDKco5rhbV6l
	8P4nzkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoCX-00000006TEK-0iRo;
	Wed, 17 Dec 2025 09:52:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoCS-00000006TCb-3n34
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:52:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH9pNsc009013
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=; b=MQHdIe9Se7dZvplx
	MjH9W40zW1fX6er/eKkIGhtY89dyda0YX+1xufWLqGIMTJpZVfIgw25mVOlq9/Hk
	uT9WDyIRfO6qd9/+zFvWq7x1zrPdFY9PUFUkT7thUu5XCCsbFHraDDYJBUHchIWP
	stzzKQtIzYkjEDtwS+qlSjFOhVuc40NU4bA2KCapDEqVyucr3D35km/lZYx0RG1k
	KFOFshuQriqyoTL30rUcQ3k2/pkwwJrPzwKJgShQS3y3bmYhoKbaAKQ1vA3/g2MK
	z8qi8mh0wqohHpmh676f6YzIXpgHcr4fYlq+rwaTZFX1x7+Tbbn7D02S6kvM6MZB
	/pnMeQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e003d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:52:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed74e6c468so77392371cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 01:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965123; x=1766569923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=;
        b=Qgp8ZV/pDtXLQvBBhTRCgXmaaOgD6f8P2mr6v+UsGBj8WspSUo+Bvit5uPeeVeESaZ
         Q+WYTX4nXz5ap+EP597xcQNNRTAfxMIUJoDVraOMxgjiPDpEyl2QHiC941nbAfHGbrq1
         UCffhji4ZP/HBNH6nyOyrUc2CIgoH82cuQ0reooGQwm1UIpKHGmsPrcGG1yFkF9Hp2/r
         zDt9RhgMO+TE2prpFzKHtFnxU9ke/5z1M4A0siPS8xF04/wnumHmn8+D29KgUJJhSixt
         J6YxdYic7Vx0sMk6qVifuTtmgr9H1UxsT/gj6y+5/fxDuVYieiSpheO9y0yLJVHYbtbW
         pntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965123; x=1766569923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=;
        b=DTnjKRnfdlt9ID2VZNdHhSqwLvfo2iLXLRxbIGhLE0VvnQZgpyis3C/2KVZI5Mpmrq
         xydY6bwyBY+WyCZ9wrG+GEBKojKkAmjto/XxvKMeCIxFHOylFTWzc8wIXbd2kLRhrKDr
         /7eW1wD7t2G2V1Vjkki2Lfa3x9jyDh/XW+jP+g1GnT95brNuvghGL7YdXl5KUqMibdt1
         Egpu+d21W4eR7PoT93JfVxXADhvpvhVUtbHRqRsBUu90lAbwNNj4L/d+JNXKJTsjiKyB
         6qkKeyEvhiaMsTCFFlp4DXRptWfuYI4l3B8TCZziQ58bDX3YplrOsWwIGMUyZ2cea4uZ
         eSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjtxV2jcvhIcvWOcAyjwTgZ8zr3OuZy+JaVRzDUtjA5+HSnKkTBb/V3aYumt975YwiW2HJ2YVG6lZ8fpmwm3z6@lists.infradead.org
X-Gm-Message-State: AOJu0YyhSgi/doXqNmQeuDucMxQkpdHGaAl7pzeRb7Ab3apXOhpfVMJU
	NKM+uOCLMv7bipcbsNa+bwcZ0Y/pZeteLqxtPrc4FGTWqRPjMyMi2ulQg2KJRGxfLYph0gFFd6k
	sx1pFCNOu/+hW2xroEiv0iB+scQgEteuyzzPrNWQ5/vhk2YRTKgjK3caWR47HaC/t9RhQ0EoybV
	nYAQ==
X-Gm-Gg: AY/fxX5X70QAEW9/NIPqbw69IcsrwQh3OoUZGGL4TM8xmxcS26Y3msTQ54rkdWYpnuc
	2AGmjpfyMvKeVcquYa4vcbziFSIYWzlNS3Q99n5FIoNNEzH5Bsm/pDV+yOdKADmofG6zNJSl9rR
	EftjueRz8Y/LUO0+O82avqKCdogLQR5T+Pkaf+toyAWDarIsepnZGYSCScbWtMkThYMy72OM4Bg
	p2tdSZKMK2C0XwjykH9EcPWnLwKt2evwX8qiZNNXqvrQdJwSdFzhebY8d9KQ+GE9oGCVI/BdkS2
	lxk9Tyw0mBQx0PrA3OahTHbY76CEzXGNSv5ExTexgXsIR9vSyMpjL6kDFHKt4lrWz3ke/wjFfxz
	WDWc0hBwW3w3c+bjzdGPRZRyT2HeWl658
X-Received: by 2002:a05:622a:1c17:b0:4ee:4512:4a24 with SMTP id d75a77b69052e-4f1d063632fmr227963161cf.72.1765965123215;
        Wed, 17 Dec 2025 01:52:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXkNSdNnHweEKikyXzlt4EEB+42BULtBSNK+x5JvVI709mhaYmQtx7shg/iQQ5h9VEtm7Axw==
X-Received: by 2002:a05:622a:1c17:b0:4ee:4512:4a24 with SMTP id d75a77b69052e-4f1d063632fmr227963001cf.72.1765965122786;
        Wed, 17 Dec 2025 01:52:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5630easm1981969a12.22.2025.12.17.01.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:52:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:51:54 +0100
Subject: [PATCH v2 1/4] dt-bindings: watchdog: samsung-wdt: Define cluster
 constraints top-level
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-watchdog-s3c-cleanup-v2-1-79d8caf65ec3@oss.qualcomm.com>
References: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
In-Reply-To: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SX21PhGZicijazZ9aMiqBXstGUcTFn/+qwMSgUuCSYs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQn08GwVfAzRVxrZFPlAs3C1xZM/0gJe0MU5Rm
 pLwZ1LKZcKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ9PAAKCRDBN2bmhouD
 1ySMEACKiUoyvl8N31YiC7Iz57fK+ZWem9zh/ehs6hC79j8z2BJMFD1WY6h+VsBUOa1i6StrfZK
 9gcn40aqruCyr2iRSPoZimiiCu558JKaSMdBO/uzpPu5Jd7/1Zlrr5E/onbXQycM8SDKLU5AywG
 jPrxcLzc2sexP1Ccv7Q4ZYnq4k8Q+SVTlCEzqK9t5X1eR2rTcsmZF4kX8e6DFAFU85aAWpF4kX/
 ynSmTHh/1KM+t2RLlOV5W3eAOEWrNltqHkeQPqhCNl5NQNgTUWGPNysXwo22vvjJF4Hx1EwExwh
 82f7KRcmJTfp6qahAl/TZ8pDgZ5eNpHEoaUNl3wdzHrVhsCU8VoA/zCnQQRFW3AHgq8Ef22UJ8K
 GtD0qS0YQklDbnJVN6b+lye2t2A9cis21XBQCwuxTRGyi+SJ86TeATwHCUFkJ96ckwh5sC9WHjH
 E4OuszXo2CIYLDEwHfWM20bgLHr6ZKCq+YqZfnajhxK8GhNkzu51CRqEvZbSko06X4TbCjCFjrm
 clS6nXAxJZOkbj6902q4GTmrnDkiLx6zjX46FomgCdsfkRxskANzHz8xmStMjQiMNxGx5FOlfI8
 7ccWbgzlS+g/QSChJ9WF/36l+Mwvtn8GKTkkDgySthLAZrh5WLBVE0z8u5pUWlpt3uTxugkHRv+
 GyfMQFtOBD5bv6w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3MiBTYWx0ZWRfX7MRHrDk5v3DG
 qSJ9IxH2KpOmzQa5xm/XIDuuyA1x+0p07mdTEdLZUvnaW1UhdHG7N2J1o3j533EZOB70nU+ReDX
 Hy5CqClFfp01WWpTsT07ErC3bNMoOEyBbXvgzUWfa7nnkhI610zJXY/DRkodmrLHfKHPahpJq8J
 60rAlR082XMIUUngFIke8+hh6AulQFLWaWrrTNngFjyl8wc/ehyPs+3lDvSwZq4wtFHF3JsiK2q
 dfKUY1+AixHYBqxif5mhK2hmEh6IWpKUH/LP/AflId3kL3YCaSf9oTea++bjYXQn6Lqhsnh1lTR
 ekLZVoYfD8N9/DUkZqCPXGfC/HA9mcqYiu5Zn1+REdcm+jpa1L0wIMJPw0qYuBToYmFTnApSK2r
 uvJ4emMhybmX+LM0CCtEDj17BBbqxA==
X-Proofpoint-GUID: B2JTSf51cBt2Zmr42ooteA3vfvw7-M1g
X-Proofpoint-ORIG-GUID: B2JTSf51cBt2Zmr42ooteA3vfvw7-M1g
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=69427d44 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RUZyBBiHXQlI0l-aNaAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_015204_952085_A42E3AC5 
X-CRM114-Status: GOOD (  13.00  )
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

Properties should be always constrained in top-level part of the
bindings, so move the samsung,cluster-index constrain from if: block.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 53fc64f5b56d..445c5271879f 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -49,6 +49,7 @@ properties:
 
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
     description:
       Index of CPU cluster on which watchdog is running (in case of Exynos850,
       Exynos990 or Google gs101).
@@ -104,8 +105,6 @@ allOf:
           items:
             - const: watchdog
             - const: watchdog_src
-        samsung,cluster-index:
-          enum: [0, 1, 2]
       required:
         - samsung,cluster-index
     else:

-- 
2.51.0


