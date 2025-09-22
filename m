Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A3ACAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIWnFWN9JswVjgeJAZVSk7CUtGSis2EJBGP3G7aJZqM=; b=n2m+Vw6svuvU0ScTK7BdGtkZdg
	3fFq1TrtauBoZu5A2bDcx+PiYVDyb/vZERm7H43/q8nFYgqhhXVIg0wHgNb1BLGNfzq2mRSRvBbYN
	5jey6Pv36LqOOkODfH8p7971M0dFgzQyccQmBDvYQ9rtV858J3ekCz+tSxlepKFfEHEtemrTEYHSw
	T2A8NqVPAUqoqKFh11lSyEs9nx8s3WJ66Ti6HsuGjxScQJkdohIHrgwWdG9v1bzUsELTManD0DdSE
	glP99nGPJHspCkCFx8BktOL7K5vCFcWFCaHv8bGZ7j/UoURvIVSDxOyM4/dOChm10K01bWSh5mf0w
	g2Huc/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gnK-0000000AXbA-1Zli;
	Mon, 22 Sep 2025 13:41:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gnH-0000000AXYd-39MT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:41:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7TQtU009739
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PIWnFWN9JswVjgeJAZVSk7CUtGSis2EJBGP3G7aJZqM=; b=dDd//0gJ0/kkvliw
	mQcChpU452MYo9eFEYDB4MkQikrDUyije6EDRTXHpDzBryE6UemVVLWWHC6Zk/Ik
	aoFcDATml5Tnkf8OaRMkOLnvowbPSNqnxSmvIpPRJxX1yrew29jXlRmTK2hUy3r8
	A6wslEqZmER6TqBxsw/5U3eccEWNotIyqkEE0SFUAUcqqVuPkaBqiL346YnTF1z8
	zUwPIbQkFkK+KkemjwD9NX935aYLW77H5j7PDyZfw3WFDTLIVtsNkxmt9aUc0Ydb
	EHtM1m6xiraiXtM5uHUqQVj+hi3sQniKfPfIJdcNCIkEM4smVUikYu/jJZoltGwr
	OofuhQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyen619-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:41:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24456ebed7bso54335625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548486; x=1759153286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIWnFWN9JswVjgeJAZVSk7CUtGSis2EJBGP3G7aJZqM=;
        b=mrmaaqz+ZRl/jNevv2sLjlwVUNvLiZ0+VcitbjwQxhzng+UViIAZG5xwVxsY7FJ4WL
         5oBINst+t3ylMQYSDui0wJPiwAkQU5pD7HihRmfT1z8tN8xi1SZvtdqQ+Y8ZsGO1DagG
         xf86hZUIrcGLt3GzDDTZR1Xas4s8Bzf+NBmcyNIHvGe9c6T7KDAW1VAXc8p0TkrjbVyz
         G0SeQEW8UDy/CpUctykHm1s73/ULxpmVCfbCW1QbkVnjOOkKTIifT2zaNYEVGzHNEIzR
         BHvo2HPvGuPon6bz8OJqO8XQaCAlnJ8wJl0v8HwK2NhUHBJJ4/dzN6bZ0eOAZT+LfzgG
         jSnw==
X-Forwarded-Encrypted: i=1; AJvYcCVhyHjKhGvP7OWNwQ2l1OP7NRygwffMkdgD+nEe3JYuKJiwldo+P1u0YN7Rw1rYrGnZbuOhjB259e0z2yshMw/Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwDQ9F1kCzxKZbEnManeYW/BMafId+xaa5Rp1nPYo7MTz1bsbsk
	tez1XNqGHTTnd8yCWtuXrzSCcwGHnSGwVHZVBMbGAd98iEaNaJhGsoIKSohxTI/5rbyN4TxfHMy
	iGZoBArSs7LZ3nLJPnzCEVqD7Lm/4Ihay13b0dLxv9068fed6E64ROAmoG2+HBSlbQZOhD1HkXT
	mzPg==
X-Gm-Gg: ASbGncuENfmV9ZKIsuPy3482JPu437I1MhHOvZC9S/vpQWf8hAUGwmCXzqs16qaMF6r
	h3439xDYK6HFgGoONIbhLQjKUS3QGc0Ic7szB8Apr0lrZRHmBopkDIDTiBjdSDbbh84YjZeBVIy
	xCoGNau3qyF5OH/XPZtobhH2ZEpDCQOsomQrutJLK2iDwFChLQyqRyhA4H3vPS4/yh8m56l+q1Z
	gStN6FmrXtZgnyNW/GOS3Clvm30YOCa9t9XXNXBLgDMPKS+aB8FN4CGkdPYBBldCmp/XqyqhvoZ
	G8ucca+UfjAxbrmpTHULY1sCEPgFvkCkl0WtsPkO6cwsdjAXnOA/bkj4HxMKrYB2YwnB6ph7hab
	u
X-Received: by 2002:a17:903:18e:b0:26e:7ac9:9d3 with SMTP id d9443c01a7336-26e7ac90c41mr134693625ad.18.1758548486363;
        Mon, 22 Sep 2025 06:41:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECJWJDojyXBjsBbEa7hEjwrxc9WYv0/zCgrWii3r2CuVqCDvWfZmFkwNzUJptObbkGXcARkQ==
X-Received: by 2002:a17:903:18e:b0:26e:7ac9:9d3 with SMTP id d9443c01a7336-26e7ac90c41mr134693005ad.18.1758548485876;
        Mon, 22 Sep 2025 06:41:25 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:41:25 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:16 +0530
Subject: [PATCH v15 06/14] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-6-7ce3a08878f1@oss.qualcomm.com>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=2577;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=SmkKRQQh3S8Gtdgd1oOIc80Ljvpw2jelYZ428aYXpJY=;
 b=vLj0922EjIbkbMbR+tqY47qh1UHzIiJOZnJu5uAsC3pDrEZ1BMq1hZ/Sen1hgB2OFsr79Qcsn
 2BVNWRyGH7vC6AoW944ox7b2Qjq1qN+eQL7hQ/x1SwnmHchfyFmBDQD
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: 92b18hfcrOJ6uE8atERhFX768q2YyTmg
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d15207 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UInjrUrXc7y1C1sAkbYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXy0BHRcJYougj
 2wn6EBAhTsoRQnPaNAvpwiVNw+k6oU54r0Ckj2UcrYt2NSJS5+QZcY6lnoGSLrdLyxf2OYXfbj+
 8oxS0w26614WxeMR+1xxxyjAaMSwKA/mR7AjVSGPGT1QGUok//XHsNqF4s1ZtM3vVgapDsQSPr+
 6arQixsf8IX1ef4NhYBdNzRJ+YN97XYrctsboL9Cwqg5mj0sA355pkdZfkTGtPGrL6buYfv6prG
 VHCZ8Nk58DdGRUAmWZTuv8xicugfl5LaAakZUIbupJkzH1Wd39MQvwO7VBk2Mwg727Ed+Uk23VZ
 21Ypq9PqI1hDvHZ72+fVZ8Jnncd2Tw/xl0c1YheDgioglW3rKbk8ZwLcdhZ7BA5rcK5keEG4tx5
 58YQpc04
X-Proofpoint-ORIG-GUID: 92b18hfcrOJ6uE8atERhFX768q2YyTmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_064127_837952_AE2810F2 
X-CRM114-Status: GOOD (  16.54  )
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

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 43 +++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 7360a2849b5bd1e4cbadac533c1a7228573288d4..eca38f8747d320e8371c1dc37cee2287d71821c4 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,27 @@ properties:
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
+          Parameters are named mode-xxx = <type[, cookie]>, where xxx
+          is the name of the magic reboot mode, type is the lower 31 bits
+          of the reset_type, and, optionally, the cookie value. If the cookie
+          is not provided, it is defaulted to zero.
+          The 31st bit (vendor-resets) will be implicitly set by the driver.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +158,15 @@ allOf:
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
 
@@ -261,4 +291,17 @@ examples:
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
+        mode-edl = <0>;
+        mode-bootloader = <1 2>;
+      };
+    };
 ...

-- 
2.34.1


