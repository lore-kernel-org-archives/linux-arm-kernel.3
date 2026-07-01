Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF118C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jXHclo5dQ540crOYbfBiFzJOGlNRFUHjEdGh+kXSkiI=; b=FQs5Tzg8Sy/Hj/3WDK5zkUgZbe
	3SRRvSfsgRFMdLclrXDIDgoIz+v3+ys+dTOFzYklUuYlAOUUfduSqRRbOs51rYNZp3FkZCJ57xBHW
	YsCH2NlU3rAIFAVHFYYLojHZk8Jt/zV19fUkaP/0uCr0JbAc/D8xAiZgkvkJ5sgnFActjwcPD2swT
	JMucUpAsjiDYIslLVaVkWzv6mi2Gg6in5Iln+dV/sYCRsSpgCQ6nZOcblF59RRlDaYV794bkpQ1oJ
	2Lk0h5j/wJoU37WKEK4OnV540mWpCkyCUjimhnF+B85REzLkcyZZY61rlrKo/oLCKjKQDUWOqgEKf
	nXd6hzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesdV-00000001Nzd-2FAB;
	Wed, 01 Jul 2026 10:57:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesdT-00000001Nyj-1Al5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:57:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8RoC761248
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 10:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jXHclo5dQ540crOYbfBiFzJOGlNRFUHjEdG
	h+kXSkiI=; b=nR7DbFs4d6K9ViBI8donvO0Pl/D18a9VYh3S+5SlmOYRyLqf0Bt
	Zob/IRQzxPKHg/08xOZGt4oLY8goikgHavGn+7mCfTurL9WBRyeSDOQyoQGLOW6p
	Ezr6VXBeboWcBGb9ZZM/tuulOfBMcEUJuv6biGTi+Q4nafh1d2rAsxI/ma0nL24B
	vLWbfaCa3Wbmt52RyPIrdb8i7KghLdlk551npxurn1gpdtsYtIB6nxdcwvQZEYZp
	G0NZDnvkO/3bPrDIX5S7rDNcuEf9KOtrt88E1gFHX9xK2t45EdY6at7HZvtTHPm+
	wMgE3V1iGaoCrhbmxzEuYEoQ93kZ5wA+82A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw3nr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 10:57:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso67394785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903461; x=1783508261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXHclo5dQ540crOYbfBiFzJOGlNRFUHjEdGh+kXSkiI=;
        b=BCf0PLc5eAUHbwmJ2IrKdYN+Spv547MICDfSh0adnu0CPoDz/ae25mBStf5Tee/13P
         eIYGZfFiRcR3UdTLcTM/n0ihu8BcMKa5is33+mee7/PIacLRGVeRQcSO17yaUME3oZ8E
         UOSpmXjFM7vm8fIEMiXLmOvZUDkBnJqwjMMB5N8JY6I/Mqfjx5mYFOnLm65dKNdDtIto
         +LCNo3EJuL14aONMKv+Bt7cIOmVyU+M+CriQovIl9ueJ9yNEOLIsOtC1peqPuCq6+ZE6
         tAV/AqtETK/kxgGISKxdFkHcJKzL+cOVnutlc57W89UR9uM7+NbfS5Nr02jdRZr765Qq
         VpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903461; x=1783508261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXHclo5dQ540crOYbfBiFzJOGlNRFUHjEdGh+kXSkiI=;
        b=Gc7Hvyu/a7nlBEopsvxERFj1jZI3EO6erhfiw9XRLF3d7R/JRlDgk8oRjn0fqYI9yM
         B1vrO1Ect8VBAySKt9vo3PMTw6lEGdTkbl+Bp3H5On2NSCI6XRf3R9gg63lfkXCGDbAf
         7UrPgfqYXR0LBb4UROjjgPs4ZN0mjKVXTN38Sn1j6jLcWa3K/+Hj2V+dnT77F6Ri5pw2
         PPMm7+G8WW82uAnuQbdb7IKZKW7QAbKVIIS36M6DfPqURthozsKV+Z3bATaJCVnKef0d
         p92W8ARJ9GTBwRHzwOjr5w2FLdOvGhQX5/3DXFYSoCdgJTEB83hAAzUtcDNLv2G3EuOp
         irBA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZMT5QNH/P4Wpq5QsLRH8pboJMb6AP054Mln2gaG4uIWWoz6zWIO8Xa+RSWyNY5Ov+lPIL1aGMSLtJSbZYZtsK@lists.infradead.org
X-Gm-Message-State: AOJu0YxcKgIbbcxWZNA3dIUkVK5t0c5z8xoTYTjIxC8lqPE/txJB9GB/
	SUvSFMgywTSmR+VTt4vjC1S6Jjd/md6aa1FW137D+TKM04WarSeiAcZtMz3CiZtYD+1CSXqzkIq
	pah9l1ymb63QoBL9VXP2p+vT1aNJnW9yrxolbIErH/ouV1alK2Acgh5ANiX8jS0rySPm+VjwhiE
	qUBw==
X-Gm-Gg: AfdE7cnLwadnzMnPqDTjDDWVTCM1ZY+jW7OgNIgRuu4l6LM9dAJb12rrxNGVnMjoa2v
	EZtCrA7DVAo23qM5T9oT7ap1SuGpIIX4aCOxzZRh4yGtK06m3GIEdBMhlJ0pCI5OZ3ujQQaeW46
	rmfz4Q6HUlZXAVQ9lw5ebNg8Lp6T9bNMdRi9Mpx84+dtsWNmiBiCYerpxMrVx/9MCjT98Sxs51i
	sED9fKMggfaV/pstJLkOpkaoW0sk1I8FDINRHSUQ8frnyov0SxLjW7ipYuyLkRWYB7L1okEh8sP
	DkkTBG4Sbv1esoJoPVptK2fUJadUEVXQ727iqbdcx2o5Ixe/pShKJe37iKRZc5/0x2jgqJVY7fm
	Esf8I/SNsfPnPLpROwxQs5bmWTHs=
X-Received: by 2002:a05:620a:4587:b0:915:9a39:1d68 with SMTP id af79cd13be357-92e781f1acfmr143338485a.5.1782903461592;
        Wed, 01 Jul 2026 03:57:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4587:b0:915:9a39:1d68 with SMTP id af79cd13be357-92e781f1acfmr143335585a.5.1782903461099;
        Wed, 01 Jul 2026 03:57:41 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf1asm17497188f8f.18.2026.07.01.03.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:57:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: samsung: exynos-pmu: Restrict children with unevaluatedProperties
Date: Wed,  1 Jul 2026 12:57:32 +0200
Message-ID: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nvB5KtefDLzhGr4nr8PZc5L3d0KZFe1ZJDlxsS3K7x0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRPKbRUdQOwIDyfyaqWgK6R82z+GIgTQdCcFMg
 WauwIeUnlGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakTymwAKCRDBN2bmhouD
 12X0D/wNn40TkXCRuOnNGT6ZJw2wZckXeRfoRB1t+2ktYzZFh+lVfWUKVuX48KkrCPPgOiG8aSp
 aeH6EKKJbHZZJhDiT8air+5RnLqBztu2MQzYXSe/kHtH/gOtRp6WsDCcxR5P7ox751ykBzIb2Gq
 T7HvXzINZtJAOn6qkX14xii9yPvH+S8ArFdvai+mqdMn2DIbJhKEaJtbmVcgeKBl4SDJdKxxiUT
 n7td248voGqiCaCHIqKvRZHfV9z7ONa2C8ySUfbohzTZri8pTm1A2tCmi1sSrqeiaogcXqJIpgC
 17nJGcRU2zs9eTOUWc6xP260h4L3YCnqXu9658nqr3Tp2Mr31YZbFhDZmYN+9akb2mplGbYxsCg
 0NwexnFrvnI+OtKP+85A/exJ3pwkDacXejpZtU7IN5JR5OiB/nkuB3PreP0mw55fczYKN+2L6MT
 m3ypiUIzsOs310hhZD1V1WNtdKaNQwCcxsB94DarD+Pzv7OVanv++zeQeHWdv34tCHf+ZBZwNUS
 xapkIaf6uuaeULsw//raOs5DlunQHM6Snn7gURxxUwGFHVznuzklIfkzPsTsHANDoLD/FmyNE2j
 z7lnksiXxbjcgSNSi1TTRr6iawIV8pMZcJ0t61rrd9+YcF7yKJjRRntqDV4L4jvlpb5VfA2fse5 vG015S/FlpPI8Wg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44f2a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Hh4MFFtu-RRkeg1_9cEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ujbXQKxiicny-vMsg_SP6DFlvz7WME6i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNCBTYWx0ZWRfX8wqoWO+EuYj1
 u8mIxKvc03QmWQGLtSkURknhOgeFYwOK7kME8wdAOrPHxcnzTut6qyrSqhu3O6G1/AOlzUE/j0y
 ksQEkF39T+5ijr2CV/Vg204LCzPcM9M=
X-Proofpoint-GUID: ujbXQKxiicny-vMsg_SP6DFlvz7WME6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNCBTYWx0ZWRfX9BgRWXBUKPZ7
 A+V/zMRhCf6GkwBv3xT1tP/h7e3fDJT3fPAMTYJ0w8vG5ORUDHrcU89NwHX63r1JyCVqFG0y0vy
 LvO4ChviBRZjHcs1pFkxZkARWcn7S96zvhYEIExyti4dGQBXxJ3eYlS5T98O1xHjqB08LFAd0aK
 Uncv94372/bv+9C0PJ72SKGMFEb0WGACvn5yAKH9D9DtPZW3maEYl1buw4fYmiJ048GZ2Ihref8
 mkixU7KUsS8xToAiufv+FoRZaXOAQdfj08H3TbwIT/nzDQUMD8EHkBAzbyAuCyKS/RHX7Q/ykw7
 tkn2dEHO/Q5+OjKubSi3+zZSIBHk8cAPsont8QnNVpvp7WYX08mD1JT5Hq9pBYuIatUh+gDu008
 5dBxSDUcxJk5Ski4yZoNMV3FqSa26FWQUGNBB1cQnxU5k6yj8W7E8Eu63H+fpW8D+/1QPlaoC2s
 LaieHtqJQQC/a2j7wXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_035743_322748_CA8E79F2 
X-CRM114-Status: GOOD (  14.16  )
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

Each schema for a child node should end with either additionalProperties
or unevaluatedProperties, so add missing one making the schema tighter.
Defining 'type: object' is on the other hand not necessary when other
schema is referenced.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..d124f3ae9fbd 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -94,19 +94,19 @@ properties:
 
   reboot-mode:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml
-    type: object
+    unevaluatedProperties: false
     description:
       Reboot mode to alter bootloader behavior for the next boot
 
   syscon-poweroff:
     $ref: /schemas/power/reset/syscon-poweroff.yaml#
-    type: object
+    unevaluatedProperties: false
     description:
       Node for power off method
 
   syscon-reboot:
     $ref: /schemas/power/reset/syscon-reboot.yaml#
-    type: object
+    unevaluatedProperties: false
     description:
       Node for reboot method
 
-- 
2.53.0


