Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFC5EFCE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=; b=Ss2UyZLB6x01k2Bow/Ors/03dG
	o37af1qK0KLetJAK/6fMqFbIqKx6DXZdfktO5lDTBZxcQ4FgNKfuhDADuq2dhIDmr3ysQwfCsWupu
	1SzM3rbofntwaqwYegUcxiXGVxD9fQjQ8t+Uam5BPBH0QLjWvU5L5RT01IPAryzEDKxTHUHojFxuZ
	q4ezyPYOM6g/Qfn3L4yaco10VNJC3r0V3bajdLPYATeEzVyoUC5IoRu2vR+y6QbgNmTCWoQKRARW0
	BI+2ylmUC+kGwmt6fDaBY43VuVfAu2Ti9VKHsNsoyMME0BQhIDjGw9/binRAWHtZTSPmxyMVP/u+E
	z+LETFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqa1-00000000I6n-1UHp;
	Wed, 04 Mar 2026 18:04:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqZz-00000000I5Y-3UbS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 18:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=; b=HFHSxJZT4aqqL7O4pSq5imYa7k
	wqcqPYHnDQxtqHKKjBVVwvCTrq8F8/6eCRuEdhFWAnwIpoPuU7jarA9Dp0OfejrEmCg+2DewNmbEh
	uSbLrkHRvYvPDQx/FCX7TRDayyIqRZZXFL9fgtOLpI5pgb25259mCyF2hkRrtSTs0UIf+B6xUh+bN
	LYjiPoqYRjUsBatwEWukUIMYLIJlnyJChH6C58SIRMvSYfKf2DdHWkI22oxjI7wHMEvtZBBu0w9Hx
	8tYI7zqpvT6oKdxpCACr3i7QCUEg2RzCGTB3hxWcd/EQ+XN2RBCufaa8fl+ZCzvENwgSURBDX0cCc
	pGt/WtNg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqZw-00000005I6D-0AIb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:04:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624E0bNu029448
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 18:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=; b=Da9I29IVMwGbl9Ea
	c72WmDPOX5rt5CF0pF7Ff1EjoIZ/RQpe64bonHHhQxHdNQx4ThPTmq/Xx8Wi5DjI
	KOQXKwbU/zqDIn/38cd1q8wOH8y4BXd4xTrdBbUrnpb55XHTrYfdFZcfaN+K7LLO
	L6ShCmfOASQeQh3/Kn2fZRVsnSq11UOOuGhOZXOP9+D9E7nHZ7ApV1dagKXA010a
	Vv4j+MV9m9sTQRbP4aU2HzO2wqO0TICpddRZ5oDruTm60HgT2fdgnko9uROAaSIF
	U/dgSDQU4ZKesjhP43MSM+lKVyO+us1TWWRzxy5xENAQn+x5qp5NOrqO9cMrVCDc
	Wyvqmg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpp4fgv2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 18:04:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so34364089a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772647450; x=1773252250; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=htn4nnUwGqj7FI5s/JrFRMZ6y/zynGdVNmsPvMbwwjeMh9YQ5y7TsXVu1SCbmRWWZB
         vk8pJiEjDmCqaxFeo5WRbuLCtrVoLDleniKJRdk9PZZzhkH/88J0B9Df9tPRhyZEw7rr
         WspjOQ/vX6OkOXYDb6lc+ThioCUUr2TfW/TpyRS2Zl+JPf6+Aqyics50bB/et881wt4e
         Apu5zbxcj7cvd0Kx3n54KuOcZ3y7P1i7t5LgiY7gi8haXPyD11Zs5n5AQEy8ImhuUgSz
         Dmp1TtDaCzPThfyuXvF9O/U1+8u0GDhZO4ONGZkrX1gwE4dOFAw984pwBD028cxVnWTJ
         9UuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647450; x=1773252250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=Xj6sfq6UR8/kvIVdkam2jOT/uFqv3nZIl49EUso4utyWPdvGvECkEYMSlhrq7m8XXg
         zLhDbTKyPiVxCBWTDXm3p7LMBw14oja+1EdnYDRi6yXtNrpNXkURw6aUpwF0X9m79cou
         JTrA2OUQFpSRPYjvdNnovwf8Tl8sWbqFYTHW1yrnAD6x8BRAVFhXOCWOf5sca7nejm6R
         8fj8xBYBSXnUcbJjF+xD3lHlsqBenAtEwFkv60DKvNKnmKiUVFMM8lig0pa+iss72GXD
         F5cTD0hcHxzie0L7mRHA7p0Y4A3OPtzzdFJbdxBX36GHig1clAUgJl9HPw53jSK7d8GL
         K8oQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7sdtkGeAeStrrLXxefT0xJT4FYhdOPUxRtLUyZpL1NyD1oqh3A3Iu/TrWRaV7ks4t3li/Lv4apLVq44htnkPJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy66Hkpk73y9LJQq9AEOZbd/DeIc/sZ23cWjOlnk8MNl3clKj2b
	+ajehoJbwVPQmhQL59Q1PyCuThm6g8W4INuKCNApYp0Z9laNXtXnPpUQslxKRAXnjJFtix+vUH6
	2CBPqgyZhc83mb3UbyK0HgsCCjUC3zwAQPp/IzHKEbnu6Iun8sumlVLcsaYXHs1JFe5rDB84qZT
	wR6A==
X-Gm-Gg: ATEYQzyHindtMcEPEhCC7Wit4C134KcaVEdxOIMP9RnoURpgNT8AnVWSfZBf1Fhtp8g
	qeKljNcFb26uqyRt64OfjjxdW+AWZLqZfSR1L5wpefPxHVvwo8g1cWK+GjurkbdU1IvdJynZEs7
	fwPt7hmZf8gE/O47vAdj0wRn2ejk9BFN3EX6n45JJf5Xk9aWVoE2kUndmG3l0+imWHmRuu+cqWb
	rIoksrCLzf6LTHjKlySBN+MNGx7kZy7p1pDF+65UcuZe3YVoN+7wLWScfw5pUIKV0/jphvu6aYj
	+qG97i+E7eZt8VlDabkKdfbyGqmJFRNoTBI+dKkSr5iLvR+B7aqj307NjsoLxMEyfPxPiwAL3zh
	ew9rWXRbRSDlQ5QPudPkJdZd1+SGAnF98ZL3/q+QMfrbaarAGxrzl8T1brg==
X-Received: by 2002:a17:90a:d604:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-359a6a661c2mr2569413a91.23.1772647449525;
        Wed, 04 Mar 2026 10:04:09 -0800 (PST)
X-Received: by 2002:a17:90a:d604:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-359a6a661c2mr2569368a91.23.1772647449023;
        Wed, 04 Mar 2026 10:04:09 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8f22062sm1080606a91.1.2026.03.04.10.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:04:08 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:33:05 +0530
Subject: [PATCH v20 05/10] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-arm-psci-system_reset2-vendor-reboots-v20-5-cf7d346b8372@oss.qualcomm.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772647398; l=2477;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=yBVN4FEHADdTSQ++LEmhmTEyByZ3pz1DEJtf2+BqO1w=;
 b=OZx6ByiWkGv3E+6If5hWQp0cKX8PXq1wNtaOeIuzjnr5JeFhAImHn/a0+xFkU8UG/ps5TFj2n
 9Jc3aA3+ZH0BjMvyvVjj4Darm9xBnR8dtDsVx+MXkx4rc34mEfbRabt
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: UK0_y4kAcFjtJOuslIF3fXkBP7_SxbJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NyBTYWx0ZWRfX8OJ2lOyvhAf+
 zPISVIe8+60De1Wdsxmgrb6wAXYuiW6IjkrQigBlF4riShz+TOsJTVQSMMQutLrLsuzgRKe6BNs
 uftuXdpU/1rqykzTkmHHPJz2vJX2xN0RQCqWjHC9B1dtn1QtMChXZVJ4LZApnzPXJJR85Y1lMoB
 3QhLP8NSSlY0OwsSv2Td+0N0OpSH20MQPjKv/t0UlObMIFX/Di1cgEhQdoaQ4wf0Qa7Ox6DR8WD
 r4yzGC7YxVzMFjBk1GGjP1c7lwKdPFxI17mVIhvovbxwRZfCyrLPKz10n6Ji5EOT0/CaFhcnsv5
 2cekILq82o1XO2ggW48BLnsILekKHWcCqoB3OF/+qEskO+wsLHbYQYxSV+E503jM1S24lbw0DMx
 nNb9z409s+/nQaouWcDrJ1n6AcPnm7Z9VVXzjtL98NeLfxbvDhEjUC89knwFk0k4tZQgNZAjrFF
 xI4V3vRJxnSVIvsMUNg==
X-Authority-Analysis: v=2.4 cv=CdMFJbrl c=1 sm=1 tr=0 ts=69a8741a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z1E3qa2j_4PWJv3PNLYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: UK0_y4kAcFjtJOuslIF3fXkBP7_SxbJW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_180412_499284_B3D1C84A 
X-CRM114-Status: GOOD (  16.97  )
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

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 6e2e0c551841111fbb0aa8c0951dca411b94035c..5fdcbf331ea5620363638feb6f8105427a87c00f 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,26 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        minItems: 1
+        maxItems: 2
+        description: |
+          Describes a vendor-specific reset type. The string after "mode-"
+          maps a reboot mode to the parameters in the PSCI SYSTEM_RESET2 call.
+
+          Parameters are named mode-xxx = <type[, cookie]>, where xxx is the
+          name of the magic reboot mode, type corresponds to the reset_type
+          and the values should be provided as per the PSCI SYSTEM_RESET2
+          specs. The cookie value is optional and defaulted to zero.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +157,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +289,17 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 1>;
+        mode-bootloader = <0x80010001 2>;
+      };
+    };
 ...

-- 
2.34.1


