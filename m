Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7819C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJmIPP1vTuI8fvgcGFFjNDDInGpX/ShqWb1hq75wB7I=; b=G/Zrdh42WMy7Dfw9NHjklzL82n
	MyVLb7WEUKFtD076HtwlLtJlQC9Vzej3r6RpwYUDbCJwV8J5DzyBCiSkx17iH1KO9az8rsmyYX9hM
	9+VTF7Z68+ujQHlmJZ6T2OxZFgRMBm5NXkLS4oPkoznT/GfuLI54xKbjRBHCTstC7DGg5VaotBnfZ
	Vp2lvWOV3Q/BTz92LGzPD05gtqnVwqzyGw43vVNZe8+Eybi3R5YWWO1KxGYe8XMkyhZ9K1isKZktu
	fJg/A8ZmniPcpObSCYIXW6CLcLwHaCCN6aOrZJwO0/Lm5fWLi+aoYw9rKywubTsnkGe/7DOxmj3GI
	iPK//Tcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesdX-00000001O18-42fj;
	Wed, 01 Jul 2026 10:57:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesdW-00000001O02-1877
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:57:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8t75762327
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 10:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DJmIPP1vTuI
	8fvgcGFFjNDDInGpX/ShqWb1hq75wB7I=; b=dgaDmDfsiB+APBUFZKMqC+BSdKt
	iSI8Kc2Cp+J/5mWOSuP1b9WYeOsJJ4rZNT6jsmidXfoeh6EpflpC8ADvyYWRGrnf
	woq2AdCyNb9a0tgABJakaecWcB3QZLTneJVScYKeuPLhy52FkBn4Nzz8T4RTzbkX
	jAFsGWTdsIFsamWy0qlQDDfB5QbbfnNf61GMRt2IiihZcZnG40Dxn/cWXCqDpeSM
	T2PLqkh/eUo7wOt9h/x8o2JcZKMLv1f7noek0KyWqs1rJeiTaZAVajEyoa/7/6hL
	xxFuiw9wPahUQYY6osrbHy5MTzUzeiVhYD8mlQJVOoc/E5V3bzJIM6wMzaQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd07km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 10:57:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92b4b575561so65538385a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 03:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903465; x=1783508265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJmIPP1vTuI8fvgcGFFjNDDInGpX/ShqWb1hq75wB7I=;
        b=jy/9iag8wAD/t6D2rY/mg+Q/P5u8g9M9mooYIZlh/SK7d80XbeSChu/5uzUQFOY5Wo
         ddwTX3WoPwrBawOISOmOpq8Tq736BG6LXmj4Y2Qh55A+fMyTNRAqBOu3NVV3yIXqmw2F
         /NGZLToue7aHXnQqdQcNBx/B9VeecAQjJi/Bg8I6Z2R/Q2dzAr+/REAHeXbvj2MbfmBr
         PxnmeB2MSQGrguUrZQMc4xTW7r3qItnG2eNkQ6wvPQog8UaXzCiYoF4ooh0AkgQrjxk8
         icalGYxH9J1qkW0yLWgkux8le/Q2nyPDDOChqv/R5pqt8jOt1nNZMxV7ceD1pjCrnau6
         Xq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903465; x=1783508265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DJmIPP1vTuI8fvgcGFFjNDDInGpX/ShqWb1hq75wB7I=;
        b=U3yREY/iwmLq4pSOHPZ3DC49XjXMMlYk43FnRhERxORHupbs4AUeDc1NyeJEmN6fjz
         sk3fb5rXnvoTHDRK4BMTrnkIzY99WE2qhBfUZFg1gGO2uG8rd9qerNeCh9+Q6U+QPIae
         iGHZ1bacJyOq/oVYmUyECq+g1OQYhF5dPKqqsRYhECUTjfZl3Td1bIxJSvHt5bV7Orfm
         fcA5CP8I+lcMnuxgDV8X7EP+qJwlrr4zwxNnzg5zZdc1FneITnU1HYBnJwwW2hRBPCHy
         FOOUtAQnxD+tWXOq7oMPGOMrdPYb71cLl/MwGNopU02/CbwstiT5NkxrOYHwVOzI1K9i
         tagg==
X-Forwarded-Encrypted: i=1; AFNElJ+p9Tr5HzCCN9styRKtOHXnB2yjpL9zCAomLQn22Qs722Z/JvDJ8sU4Pr/qlTVxskJh/GgVdEWEddtVwYCHHqk1@lists.infradead.org
X-Gm-Message-State: AOJu0YxlP4J8ObZf3dsv+LxNuS8OpNyYPvs2gcahHyg17VYaBVGfVHJY
	jVdEKcy9rcQfECQQyQutsjJAwD+S3KT08CrTjxxPCI4iWgoG9Uk0YVX/t1yjuiCRPtNTsJkjW9d
	LG76yzI5JmLKClEILJdnsW96iAbM1j+MeGmunBwNsqvwdY7hEPwKEBQm/k3baBRM9NElKxwqrlV
	hR6w==
X-Gm-Gg: AfdE7ckyl+YE66Mdi7MrsccUiDkg+D/5JsKpxDdPBhfYxyyMhSeyrt+IH9YQrbKLXae
	SoG5kr2wIcqHH9R9q0ZSjzhyemKzXwLFoV5WMdA1kX7JdPLwvOgTWqdc+rExbP6g0RcJFmsUr41
	AKTwu+PhCSoCtWf73YfgUNfOcqiDCLfUg6TS79lrpkSSpJfEv7acB4XJ28NlTTFJaeeMKcr0VK0
	TUGD5xBAJEVOQe7soaxNaynalOxykzvmlsAdqrP0WtpMR4JncLrzpJDfvkCvQW2qkt2zcpnel8S
	o/CH3EoLABvFFd1CNja3LuMNhPwKKB5p6ozXgcky8gpfO3H6OpRt95YsNJZphfTvZJsY3ksxdJ7
	Z//L3mCZAQ/zFfleTIRbVr4gl8X4=
X-Received: by 2002:a05:620a:444f:b0:90f:786c:4a82 with SMTP id af79cd13be357-92e69836085mr753963985a.39.1782903464794;
        Wed, 01 Jul 2026 03:57:44 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:90f:786c:4a82 with SMTP id af79cd13be357-92e69836085mr753960785a.39.1782903464354;
        Wed, 01 Jul 2026 03:57:44 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf1asm17497188f8f.18.2026.07.01.03.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:57:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: samsung: exynos-pmu: Narrow allowed reboot modes
Date: Wed,  1 Jul 2026 12:57:33 +0200
Message-ID: <20260701105731.196618-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=RticuU5Azj8Z5luN94Cczq0lVA7vnzbs3xs2/i6ZSI4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRPKe8ZayEXQHA8G8GMsFxkFrIpacL9L+9DMKt
 RVMhK8DXSSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakTyngAKCRDBN2bmhouD
 1ysuEACbMslME4hji5yXC1rheVCIjq1PJwxs3qr2BJloiuc9OFBri2utTcrNFwOfJlCVwRj2S/y
 bDLlIWOENvFyszEvlucXEI1Y0InTywLqzXcwvjU0Lw0RuyLIXjkOp/GMTd++caBLeNuYqH0t6o6
 GiMsi+HmM5DNWm8NVNJ3nvmiyNute6CHRztR82c8rQ8RWzDcXuzwTSah+o+ZNCKt/eYS8hRIIDJ
 5BaNVBTv8ZiXq0GV37636Uh5MKLy+/XFsruxf4m07tWSMZCzv8jeWXqNiAut8oRlYG3JNxhrCyk
 H//4gYxgw2diP/vA+98mZPwUMTOpwaTN7KPWHKVCpWOW2VxyCrktENfMG/pWZikoahtTHgFKZ4I
 FkLoex8WkbiubqcVDmMJMBMyIuqnPOhZbgCODIaai60SjzEy8b9XpmIo48oZ8ndKE7uo2bLRNV9
 lsbX1SgYPfFevdS25FnGeRsigMSUw4gNU2vVYIv0FCbnjgl+IQdMp6fOOUn1nnFsHC9uh7SGbUB
 f76cz9lerJF2GcgEGi6rmEhi/jtbs8Lj6IEgnkW1MWjhRmOwGly5d28Ns3NgSbnwDA0sz4ASCro
 QslPKFFsJX+MVUoc2LNTjr3K0t4Pfcyx5yhmbzUHJOZqzKg+ECZkZfFN89xr5s7dhntsP+02FB5 YDA4m5fZF3RfUsg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a44f2a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=h5T15lCM5MDmF03UvrYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: cGQZUBxntWGrx8InjhCbpTtDmtAh6oGQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX4j2kzevNXh+M
 awA2ePSzAg9l9ucCkM9vGBKLuFBXSyHPMTX9QJ81ENUNfPE5JYJTmh2sOdCPDx9QFyw5oayGDLj
 3NZdTfT0+xWr3wcOviuGIgcuuIKkoeQ=
X-Proofpoint-GUID: cGQZUBxntWGrx8InjhCbpTtDmtAh6oGQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX3yR7dxHX0JFw
 IVaUu7HhQB5DTPfeKIJ3gYGn+nf2r+JAqrgNDWC5EOX8Zg2pb0luzFOcJ2ZadaFyI4S2dQvIWMo
 xyDAebrc9ZCYeNrHvaNpF+mPoLRncvkUtYtQBvPEEGYvuX1K5k1HG/pUezRp+5shyM7FOTWV0n1
 WjZB6RMaZ68GEFw1LZopQInjBCnEAoUgKN6jY+QCw5ZEi4LtB+zbeYPSkiNPuDadtAW4hM+eKQg
 z2b0mS0ZdSsYIVDgMJne1SdQdvd+auAi+tMPADXYMscY8xvz8v+q9zESZIn0pF1iH3s/mtt4g0C
 AyzEU95SdaQ/L5N2Inyh2MIzGJ/6A2Nf723Of/m1PdvEqKc6KiFUjJsy8yMyE5pRjycfhxsVKqP
 Irsr4id8i8TUTw87iRV1l0oWxpPYHnlAClE4tXHIlyjML9YLEekDci6LQlFp/tGyHK3L1ds0i3i
 HhOwONQzg1ka6yrq5RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_035746_310430_F7AC794A 
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

syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
a subset actually makes sense and is valid.  Provide negative look-ahead
pattern to disallow any modes not supported by the device, which
tightens the binding.

Most of Android-based Exynos devices share the bootloader or its parts,
thus reboot modes are most likely the same, however only a few upstream
DTS define them, so add restrictions only for these.

Google GS101 has on the other hand quite different bootloader with many
known reboot modes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/soc/samsung/exynos-pmu.yaml      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index d124f3ae9fbd..5bd39876e3b3 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -176,6 +176,20 @@ allOf:
       properties:
         dp-phy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos7-pmu
+    then:
+      properties:
+        reboot-mode:
+          patternProperties:
+            # Negative look-ahead to disallow unsupported modes. The '$' has to be
+            # part of lookahead group to work, instead of trailing outside of ().
+            "^mode-(?!(bootloader$|download$|fastboot$|recovery$))": false
+
   - if:
       properties:
         compatible:
@@ -183,6 +197,13 @@ allOf:
             enum:
               - google,gs101-pmu
     then:
+      properties:
+        reboot-mode:
+          patternProperties:
+            # Negative look-ahead to disallow unsupported modes. The '$' has to be
+            # part of lookahead group to work, instead of trailing outside of ().
+            "^mode-(?!(bootloader$|charge$|dm-verity-device-corrupted$|fastboot$|reboot-ab-update$|recovery$)|rescue$|shutdown-thermal$|shutdown-thermal-battery$)": false
+
       required:
         - google,pmu-intr-gen-syscon
     else:
-- 
2.53.0


