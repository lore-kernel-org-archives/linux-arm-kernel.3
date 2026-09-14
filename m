Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701DDC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=; b=kgYFZBvy429e6c4V+slHtoP5NZ
	zZaGVBA87KjNIhbtQoe116UJnHmYGDmDeCoB9vp+7RNOG9D8StFZQ+akX68FQ8brx++63V5A60U3g
	mZRcWGCo9GcdXBUpN7xqcobLiuMILBhTyCT5z2sSmdpLIt53SnFoJBt9QA5KSGQPg1ZouinVX+6jq
	ekKDFb9GbuIRnFymg9YtQKQCQwbcUy1Z6A0HUyv1X9FbiHx8hTAiSQ6Djoy+8uPrXGWMobeGOErwS
	Zmu3vuclozRwjU8XVV28ijO35wLT/uhPfxePpE9iRbNuh7uBeMcRr3bc7rXL7HKlCn39pUrhdd3u+
	32AL/fEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63B9-00000002zfe-0wxd;
	Mon, 14 Sep 2026 09:40:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63B5-00000002zcN-1y5O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:40:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7SE7w3351944
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=; b=IOzJuVlXZwQi7EQx
	u3HlG79Z5W8Y2MZkriR6SxnBX7PotKni36qWMwYPLal62jZguM+M+gzPLGI8D+hU
	eg6QnTaGq3P6ntTOMcki41FXQ719ph54t7T2/C2UMxxQx0shE5TASJv2ImSZrkLG
	ko2BjoJNR89p6lZTfFKfmBVP4Jd1oZA8b82SM0nH1A5+Lo9+mVMXqqUaFWDRWkKx
	A7qJVJa3tmXjq+7YDHBo21Rc1mZD7aVsfTC7ATleaOuer+PH57sHetaMDfeE1H08
	SZLKvQSLjZhrcy5X1F0Vx9NmVrxdjlGApvuBHeo0J4ITDSr75aCCLk/B8sjL/L+4
	dOz+vg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0erh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:40:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso75670825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378842; x=1789983642; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=;
        b=ImwbxdAfT3adH/Y3Lnnk3OaO6MidRnTCnhh1SgSv1//zd66uc1oZhqpylOc16tJk9X
         6C0zfMXBpn+BCZIin3BowFXWSHjertRQs4/SCZy6TE5B+J6lAk6Ga7pPXZTl/zreZJoi
         p/p0x1/rSdQyNW51ZwFJ9Y4iRZ65eJ6I9PoyXiG+JzBj0fMOytc0GXnToa4A6v8qmIb/
         JVA6IhKtHywZoFU4xItSLjGn9VX1xBITNpJ9lMQiNJjFlIZBE+H884yi43Ne/Kr4tNdN
         OEwYy0sMMskhrLXwEvwovJeXfMX6atVDUeqjdmRmCbawge2KZJmTeEko1MduZaLoJoan
         ifmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378842; x=1789983642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=;
        b=lJGkZ1KCgXqGG2EoU1vdNdMX92dADFwvO4+EN/WfDdlP51VVaZk2iitJhnn9+TtAoc
         4F4fD9gMnjSGo7sEJpsOqGbR4Qhu88xzaJp7T+bxO1MV38Frfji6ZcUm77y0Lab6dxhb
         8T4CANllrezYKG/d2Uj8zewrmkGXm/4q5WEDIXFvVQCZZ3NTIJttECLv0zjPj+LD7AN7
         PGuR/htMQTNddGDMQH2caFpZFJS5pdLs7RG+5gOoHbqWmn14ktzI/z0pHL3klYkrBGut
         J6YopATn/CASrfFDa9nJ7Czm7vuAs8j0MJcQT/d0KoskVnKJ6OFpJY2QAiD4xW8t87Ap
         WWfg==
X-Forwarded-Encrypted: i=1; AKwUvBy+k775IKZMpvBpf0Nk7yvTx/iyDimlp74dz8KAci7li3e0aKwLnsPDdFcCBM76cfAOlnJnR3LfI9aNRyzXU6t8@lists.infradead.org
X-Gm-Message-State: AFuF++l51NGxM6qGb9OZ8pCbqsZWMEI+YJrTVdPpXxNkYNQ3VvDDSSue
	5sblgx265hBAExrWHIxzr229SA+yJlhRjzDy6r3QDTj9oEJxgaadMk0ms8hB4x/RuExSUGF7quX
	fATu+q5tgUp17pR1gwuzhrXwkSoOM8I0vlbz0MPVGAS0wHEM59u+9eWkDnS2B7aAJSKvPo8nH5v
	mxW8PBh4KbcQ==
X-Gm-Gg: AYBFou0lgaMd9umKM7JkLSmJWNBfyPFvb2AxTEI4s+DSZNAEsKXPg6hN4o1PmoTNr+a
	DD2XDDgc3tXkBhd38xN6mjnoW6ROQwG5iFMOFeT6Bn88/iG3/9FAYn21ANfTVkrZBiTyxhHAO4I
	4/Cnq7WhxC7aymNlyQlewisz8uzKuVZX5v0j54ha8PmPTW58tZ7cn7UkWurG15fP7RV6wud5NYt
	CZLRG2y2Dl9GZnkmR8IMRnrY887yFDjOMMzW+HwZLAVThrbrg4o7nv/KjRvUZJs2pwY6OJlTOeb
	rADtAjsD2HIHjljNa2cJk/vkFOAiCIVgi3SW0uD35GbYwO/XTIeXDeEByK7JYiREy3KKOMlNFsU
	G0rOUxQvBVUhoNHmjx4Yfw2WeumxEiI3X64+ZPen9iR7W8anKmfMLqhQu
X-Received: by 2002:a17:90b:4984:b0:39d:f61d:7ca6 with SMTP id 98e67ed59e1d1-39df61d7d1bmr799669a91.15.1789378842258;
        Mon, 14 Sep 2026 02:40:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4984:b0:39d:f61d:7ca6 with SMTP id 98e67ed59e1d1-39df61d7d1bmr799596a91.15.1789378841750;
        Mon, 14 Sep 2026 02:40:41 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:41 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:56 +0800
Subject: [PATCH RFC v2 08/10] dt-bindings: arm: Fix MPAM MSC binding schema
 and examples
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-8-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378766; l=5185;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=/QMjM8kIgdElOSlo+HE58P/0O+m2y0r6yoGjhktem2E=;
 b=8GP+/eE1ihxpjc1D5+JwaI40o3SddpMHij/oEBZPzRJi9AlEFwTF+xGKazd6CtDo2ECYdzsxk
 ayDwgtPlrNbByU4vyLNxTZ4wfQRSS3cI/irRbXp9iHYlbYInj/lLwdR
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7c11a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=d9rEuZw9YcPYe4YaNdcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: RGBdqQAYvSGITEvC6SeWgV6DDgCniS_m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX73GQKke7Iswe
 r/8qHjBhZg7nzJcCMEbhIApzY71fSW8CExdk52di76n4oNWOnQ+7xQD88OwsDrALOimOWVd72YN
 +vmxrMGlijKVv2lAYL6dlBsFrzME7Dk=
X-Proofpoint-GUID: RGBdqQAYvSGITEvC6SeWgV6DDgCniS_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX8EByTgNkW7hF
 /Ut9e0avKqxe7pJDDBJxZWdmRukX0fCaP7ssNZcES8CL/sP7a+j8R8A3qcRbMJEgi2Ah1W+2prA
 0CL1CgcswWr/1/6wZBckq3jUWNVxc2gInwJfQr+7xsA5kesOwL57jiUnrWHT4KP+dlrWBktAQgc
 Btx9Gfc+L6B1uRxsiD40HHSA3qnDYK9s6tquI4oWg6hk5VLhErDscSzyjD+CQJuKlx2IGKlFhps
 247UG2u1qqH5ZOmtlu9dEQYECwU3a3zSTy3Hr7azB3VpilUGXjC91MlXi3a0qEA+rAx1NqKzoNh
 PW0qKmWWNR3TC9TeAZGJbew+NUV4n0T6Bugv4YTwXIGD8fc0xthdqFzlSdBOY4UXwSxJk+dt9a7
 UMT+jETQilTfswrgx97yMAe2V27Rdp35p6Eoc++5v6iOlWqBYkd7s/l3EQ+zAeecVz+YAf9ex+H
 n0jy7Wiq15/5PvnJF3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_024043_525283_25245517 
X-CRM114-Status: GOOD (  19.90  )
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

Fix multiple issues in the MPAM MSC device tree binding:

Schema fixes:
- Move maintainers field before description to follow standard field order
- Change compatible from fixed items list to oneOf to allow both standalone
  arm,mpam-msc and the two-item arm,mpam-memory-controller-msc +
  arm,mpam-msc combination
- Constrain numa-node-id as uint32 with description instead of
  unconstrained
- Add phandle-array type constraint to cpus property
- Fix bracket spacing to pass yamllint

Example fixes:
- Replace arm,dsu-l3-cache with foo,a-l3-cache (no upstream schema exists)
- Fix msc@41000 reg address from 0x0 to 0x41000 to match unit-address
- Fix ris@2 reg value from 0 to 2 to match unit-address
- Add arm,mpam-device phandle reference and remove TODO comment
- Remove unnecessary blank lines for consistency

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 39 ++++++++++++----------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
index 53a6fdbbf05f..3c7b13a23ff2 100644
--- a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -6,19 +6,21 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
 
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
 description: |
   The Arm MPAM specification can be found here:
 
   https://developer.arm.com/documentation/ddi0598/latest
 
-maintainers:
-  - Rob Herring <robh@kernel.org>
-
 properties:
   compatible:
-    items:
+    oneOf:
       - const: arm,mpam-msc                   # Further details are discoverable
-      - const: arm,mpam-memory-controller-msc
+      - items:
+          - const: arm,mpam-memory-controller-msc
+          - const: arm,mpam-msc
 
   reg:
     maxItems: 1
@@ -34,7 +36,7 @@ properties:
   interrupt-names:
     oneOf:
       - items:
-          - enum: [ error, overflow ]
+          - enum: [error, overflow]
       - items:
           - const: error
           - const: overflow
@@ -44,7 +46,9 @@ properties:
       accurate after a settings change. For more information, see the
       Not-Ready (NRDY) bit description in the MPAM specification.
 
-  numa-node-id: true # see NUMA binding
+  numa-node-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: NUMA node identifier for the memory resource this MSC controls.
 
   '#address-cells':
     const: 1
@@ -72,16 +76,17 @@ patternProperties:
         maximum: 0xf
 
       cpus:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
         description:
-          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
-          device's affinity is used.
+          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the
+          parent device's affinity is used.
 
       arm,mpam-device:
         $ref: /schemas/types.yaml#/definitions/phandle
         description:
           By default, the MPAM enabled device associated with a RIS is the MSC's
-          parent node. It is possible for each RIS to be associated with different
-          devices in which case 'arm,mpam-device' should be used.
+          parent node. It is possible for each RIS to be associated with
+          different devices in which case 'arm,mpam-device' should be used.
 
     required:
       - compatible
@@ -92,14 +97,14 @@ required:
   - reg
 
 dependencies:
-  interrupts: [ interrupt-names ]
+  interrupts: [interrupt-names]
 
 additionalProperties: false
 
 examples:
   - |
     L3: cache-controller@30000000 {
-        compatible = "arm,dsu-l3-cache", "cache";
+        compatible = "foo,a-l3-cache", "cache";
         cache-level = <3>;
         cache-unified;
 
@@ -109,7 +114,6 @@ examples:
 
         msc@10000 {
             compatible = "arm,mpam-msc";
-
             reg = <0x10000 0x2000>;
             interrupts = <1>, <2>;
             interrupt-names = "error", "overflow";
@@ -145,7 +149,7 @@ examples:
 
         msc@41000 {
             compatible = "arm,mpam-msc";
-            reg = <0 0x1000>;
+            reg = <0x41000 0x1000>;
             interrupts = <5>, <6>;
             interrupt-names = "error", "overflow";
             arm,not-ready-us = <1>;
@@ -155,8 +159,8 @@ examples:
 
             ris@2 {
                 compatible = "arm,mpam-cache";
-                reg = <0>;
-                // TODO: How to map to device(s)?
+                reg = <2>;
+                arm,mpam-device = <&L3>;
             };
         };
     };
@@ -173,7 +177,6 @@ examples:
 
         msc@10000 {
             compatible = "arm,mpam-msc";
-
             reg = <0x10000 0x2000>;
             interrupts = <7>;
             interrupt-names = "overflow";

-- 
2.34.1


