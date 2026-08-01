Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B142AC55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 19:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hi7qwC9Ys33lceH7czkrRMTjgxXHEZVRfXrRqrzJ6fM=; b=ekBGD2HH9ilg1B6zesn8EOXGPJ
	3QEFibHGNqdGc0o0/rZbfQcTc1spg7dQzgHtFxYp8OODGKv4Uby6PUzdfiwQrp5rXKIO6ioaBSKDJ
	3EaYKQIrfrvnu9qRxzS9FYOvEWjGmFoBRVMW16i5UG6VL23sjvNizLXYoxzCxcTdPNCZNtrAedYQP
	R1p18Z5ym953AZx074OAOI82YJZWNVp622QgKqsJK3L+x9E2Xv5bSLGrCnrysxBxFBdxNGpzokF/6
	zYTPmNGB89wCQIPJf67IoF5vsXVFmlWCDbTU1ZJmJeAWyoR7jZbqznu3tFXmTldzYk371XSoDLSaM
	I5XT3xpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqFnt-0000000F0in-0bwE;
	Sat, 01 Aug 2026 19:55:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqFnq-0000000F0hm-0KF1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 19:55:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J03c73181859
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 19:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hi7qwC9Ys33lceH7czkrRMTjgxXHEZVRfXr
	RqrzJ6fM=; b=fS8+P9BRkVoF4CeszARZydRmMHsGFpCDRysHyyvhuEqtNEaNgKk
	Pk4MIK75koHduD6b0/9SWn5zXBY6rMEBE2tlh2+M9hCmMgY/jpFO9BXke0wpWMAz
	D4mpk5LXuKNd1lk3BAClAjBTOFYYhZgmsLfAV6kcbCrXGAzzx/I/aezFi2t/xtSI
	1T330uvbYvyL5N0sEgXjIuMCy/W7AA1SuSEuliO6uJ1IxCciX+RG/G+mlxTBD5dk
	rOVzkJ6KKhZMYQlfZfeafTRA1btS1RJ0jbyTNqx9bXollh9GaNeq4ctHxSVfJjgw
	d95zyvN6ynxZtx0pMFP5c/K9r+7lqH7tGzg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9yghcyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 19:55:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f000e221d7so22273176d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 12:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785614124; x=1786218924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hi7qwC9Ys33lceH7czkrRMTjgxXHEZVRfXrRqrzJ6fM=;
        b=jvCXWVg4Lo1Yj4OPPTYVkiBtjAV6JzKOTB1CyRr9M9YqRFTn46pKXPHGdkHTnvWBaq
         eGjXKhYYwJiyHl5fWmH1cB2ZLfJVnTBwt5Lg6Oe82UlK7clti/HrGR5mBw6T1x7eq8bo
         RUHAr1sSR6uOFbLSKLHla1RkRIra2eI2RpcicltT1A8oQqPbXk9xb7uIb+0eeJjTaYdR
         BfaGQVliSWPJzJ0/pSRbkUhRPekksfgkMJJE6Efv4kyV6qSvK4aa2LTf0d1E7wbf7cx/
         ukPKhLE/ZB278YQtUbTyTDgTNw85s6f/qYKfcG/jvlBWjGV1R4ABZuYIdk4xJJX1EYu9
         GDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614124; x=1786218924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hi7qwC9Ys33lceH7czkrRMTjgxXHEZVRfXrRqrzJ6fM=;
        b=E5aDvNtnBb4MiR/rrIXVS1WbJHHHm3e3TiDmsuXyOSh0eGBOWOQDdp5EvT+UyPiUUk
         qai6dli3zixctuayNwBE3v6V0PKVHOSdGfpXCj9C0YjT5ndc+g9vPS58kgItrzRF8KQy
         VOOlwln4MZ1XdAQw0U6CjxN5SW4IDWJ1AJ4roqoT/u2sFenkMhf2ihHmTXQmJyjgUK8j
         +1QflPhyO3kjYGMxEKZsquKkUAgC2FSy2bk0igMGSb7I5NQIjqm7It3iz6k/3vxwQ7xe
         FAfipsFl9YaPHnXTLyjzKvNKl0QDXFayj6zUjDnKCk7pe5+4EZl898dHVuXcmq928W6x
         qoBg==
X-Forwarded-Encrypted: i=1; AHgh+RomWCXxahuYUMTl4blTsXNA4JyaPFH2oQAzJYcnI+v293fy/fE6eXDwef75VqGxal6s4Bn/mFOpjMW25sBU1vZr@lists.infradead.org
X-Gm-Message-State: AOJu0YzJppgQDbft6FjX37i4vLQ4lAqSgLfvFx8FeDJXFQY5M8Ob1/h1
	D6G1clUSeTjuFjGsFalAzrHP+vsP3peiebeapq3z45n8JQ7DKeDZGmUY/0wJ4Zjheo5omi0DEjB
	VAigRNs6xuQq9pfB3LWHY8XH4PbFyJbg/mHnd87vyIo/lILuXJlc4RHhcasjMVFpYiqWvms4O07
	py7g==
X-Gm-Gg: AR+sD12BWdJ5VpcnotemWr83Tp8jveE5vkN8CpgGuWQOGb8ddbZ+L8jqv/TShw0Us4z
	dOL46NhgNd/2qf1IF52umEMOW4WbU3LYxlDEhyLDUwN88BCDT36FsMbRT798bEyCw6mcfOWCDQB
	+mxBztI3Tr4VtxviyIz4AEVLSCf9Tvmp1NOufsS1Om2r3Vy4f7pu/EvsV1SLUkASwcGYuLYo4t3
	UCZyhYrKLwkgyq9rjLU93Mjfe/yp/jAggY2gk7r5M/DxCOtWGMjUS2CPEuqPZXR109SPZa3dJxs
	vERDiQrJq7VzqwytrzIrLKnijAexsGmQF7uu7sjLZ9/BVy4LUmGJkYTSZ/RBNRB9nJDygpcqyU/
	B5MTOh2elQgoJrLDt
X-Received: by 2002:a05:622a:4d0f:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52b567522acmr111615661cf.20.1785614124571;
        Sat, 01 Aug 2026 12:55:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4d0f:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52b567522acmr111615461cf.20.1785614124198;
        Sat, 01 Aug 2026 12:55:24 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5f0c3sm74694415e9.5.2026.08.01.12.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 12:55:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jim Quinlan <jim2101024@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>, linux-pci@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: PCI: Correct white-space style
Date: Sat,  1 Aug 2026 21:55:18 +0200
Message-ID: <20260801195517.235161-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3897; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=mZHWAuSeKaFREk3s3TsCeBqYcHg010+ZFZVBB6WI64A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbk8lI71bPd+afSLiOOSgUBFK9QNKQ/CfX7jgg
 +ZIgESpx62JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5PJQAKCRDBN2bmhouD
 1+giD/9UrL5r6rohmURssJaLdBSj35eMCF6Q1TlSBx0A/k8Xyn/QQd0NRXPEJ7nd3yWpo4KvjGW
 hew4ADAPDXJ7xADCHaR9enIQy3jUBzrdlwZgSoH55vZ3C26JJjza3AiWAGJ2zF5AY1X2WHa6dcN
 aUCyT70cH3Ya1EmjSmu8Hx1KZssBfRyfBpQ9NvlxyJsv/dAk8pyxnfb9f3UCHT1PHEoTMKFLnKZ
 4JR8wYnwuRHuokyEo1bJ/FdYdAbmm4URgjmuY1UuYSC8kYGHeBYj3dp2x6NuhGC9dKnqsL/Tuh3
 Y49QLumAhjBrIyvL7WtOSlEJ2IKpSBzC05MI3z1lZbfAvnSnmhOydMmjgaDpgRsbK/TIIMAOb8v
 LyI2/L1UH2zJ5b2OX1FgwH9TKiBuwJIGSmKIuYrre+HJKweoXXTP20LyikioNFwIFJRp0NTO6XC
 X7BG584MJOvN8rov/tkkeDv1hZmyjC0cSsaRCp1yEyYMdej5t/bPax/8CdWmOAhFt/zI47adrJQ
 htQE+Ybt4eRgpGACK2goN0+SKq/OvExKomF1z9P5yi8v4ckE/h8T8A6JSuUcBlssJXtnrd8Ktmz
 esoHVN33bXl0oLQw9Hpxz08GxnqVbyibDfRUF3tB9nVdSGreDv2hN/mkN+VPM+BxKpmETANXXOo k+2AaWGFfaR+dpg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX3oTS5/rBnGgE
 fhIdDe8xn4PP/C8KbUZQ/RGCmGX5LoVjlkAYAmW2LUQ/hH98rovorCnZGlov58TNJHP/hDiDl/a
 MPsqgwyWl6a+288dXD4wcMjju95j3iY=
X-Proofpoint-GUID: d_5iYQO7ASnizdDikh_S2dTnNu0jmZrz
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6e4f2d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mxJljgaHxS3Sv8GYpwQA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: d_5iYQO7ASnizdDikh_S2dTnNu0jmZrz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfXzi9TGEKKTfF7
 oSsnCgJOBZA/XZEprZJGZt+kaNDJ11v5MkIlJEcUt0gBadX600+/WWypEtqX7GD4S02A6ZzMMK3
 5oAN5lulhHDVfU9hrRC9uaTdVWawiguSCtOvyR9xLG4beEXNuKujg8MXeaQsWzOoJrDsCfciELD
 aNJRag1laWHCyB2FwjJsVmGZ6M0zAz/MJhb4Jg4tolTgJxOw5yCCYSL7RdFGQKzEiP/tf4yrlGM
 uPDMFzwW9CY0GeA0SVY9zNYrqvPYSqb6fpT5Gkl5zj5baxZy9ntYVyGukWzKXKOJl1+j9nGp6A+
 Zk6rm4PbHTP1J6PFpxllsPTVwqIFS0Uas6EEP4UPihRNBXsNClysXDRj2ByjpYgQv4/jiO4DbqV
 Q77RNXxWhGoy2+QMQfEFn+tgg9qNc47eW59t04DuMx3B2YtD5NAJwojwd4Vd3PcAldbw04G2kNZ
 BFjdPPH1ddl8EP9d+Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_125526_127014_5F919E96 
X-CRM114-Status: GOOD (  14.17  )
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

Correct a few white-space issues, like double space after '=' or before
bracket '{' characters, which will be flagged by dt-check-style.  No
functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/brcm,stb-pcie.yaml       |  2 +-
 .../bindings/pci/renesas,pci-rcar-gen2.yaml          |  2 +-
 .../devicetree/bindings/pci/ti,am65-pci-ep.yaml      |  8 ++++----
 .../devicetree/bindings/pci/ti,am65-pci-host.yaml    | 12 ++++++------
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index 812ef5957cfc..328b8156cd94 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -214,7 +214,7 @@ examples:
             dma-ranges = <0x42000000 0x1 0x00000000 0x0 0x40000000 0x0 0x80000000>,
                          <0x42000000 0x1 0x80000000 0x3 0x00000000 0x0 0x80000000>;
             brcm,enable-ssc;
-            brcm,scb-sizes =  <0x0000000080000000 0x0000000080000000>;
+            brcm,scb-sizes = <0x0000000080000000 0x0000000080000000>;
 
             /* PCIe bridge, Root Port */
             pci@0,0 {
diff --git a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
index 065b7508d288..1f0ab9ccd1dd 100644
--- a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
@@ -155,7 +155,7 @@ examples:
     #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
     #include <dt-bindings/power/r8a7790-sysc.h>
 
-    pci@ee090000  {
+    pci@ee090000 {
         compatible = "renesas,pci-r8a7790", "renesas,pci-rcar-gen2";
         device_type = "pci";
         reg = <0xee090000 0xc00>,
diff --git a/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml b/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml
index 74195c1f5292..afde18c5a4fa 100644
--- a/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml
@@ -63,10 +63,10 @@ examples:
 
     pcie0_ep: pcie-ep@5500000 {
         compatible = "ti,am654-pcie-ep";
-        reg =  <0x5500000 0x1000>,
-               <0x5501000 0x1000>,
-               <0x10000000 0x8000000>,
-               <0x5506000 0x1000>;
+        reg = <0x5500000 0x1000>,
+              <0x5501000 0x1000>,
+              <0x10000000 0x8000000>,
+              <0x5506000 0x1000>;
         reg-names = "app", "dbics", "addr_space", "atu";
         power-domains = <&k3_pds 120 TI_SCI_PD_EXCLUSIVE>;
         ti,syscon-pcie-mode = <&scm_conf 0x4060>;
diff --git a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
index 98f6c7f1b1a6..db92125a2f2d 100644
--- a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
@@ -121,12 +121,12 @@ examples:
 
     pcie0_rc: pcie@5500000 {
         compatible = "ti,am654-pcie-rc";
-        reg =  <0x5500000 0x1000>,
-               <0x5501000 0x1000>,
-               <0x10000000 0x2000>,
-               <0x5506000 0x1000>,
-               <0x2900000 0x1000>,
-               <0x2908000 0x1000>;
+        reg = <0x5500000 0x1000>,
+              <0x5501000 0x1000>,
+              <0x10000000 0x2000>,
+              <0x5506000 0x1000>,
+              <0x2900000 0x1000>,
+              <0x2908000 0x1000>;
         reg-names = "app", "dbics", "config", "atu", "vmap_lp", "vmap_hp";
         power-domains = <&k3_pds 120 TI_SCI_PD_EXCLUSIVE>;
         #address-cells = <3>;
-- 
2.53.0


