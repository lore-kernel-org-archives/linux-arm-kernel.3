Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ED9D4921F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50swHImWKQXwqEsla20Z8gC3MyM8KMWAHeZ2xPCj99g=; b=xlpxEuSIixXfZ4TXq4w6g+t9c+
	7eLm7LwB0X9ftZyXUKtqVqr5AIdP0Lft64P1dcEIgFYMD78PMs48NscKaLV1D+FO94bvZ8EyFjA/D
	BVIbqwTNHixXHUxjA/DXaJ+2yTJuGPXLRH/Mu/IkyX+tROv3Xj2eblYMVAEO+jMj5kmGlL9jqHZvg
	9kcI1MjVadhGqQb8GyddYl459CJavA8/Ckk/LcZoIzmBcuL4cJt53Xa3O5462oaH4XQ3g7P3PPzm8
	BOcvrzRUtpXp7yKYZxtYSK1mML59hYCJiOs7goj2tUxz3iYdK98G1btxRJNvRL2IA2lUzcuCGsLAK
	rN4G5CEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1bH-00000009Wyj-0VLD;
	Mon, 18 Nov 2024 13:15:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1PB-00000009TpH-3bnS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Nov 2024 13:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=50swHImWKQXwqEsla20Z8gC3MyM8KMWAHeZ2xPCj99g=; b=XigeqkzJ6f4m51cFR2G1QIou52
	YjcOK7e+9U1zMUCK1UgIMr+0wNz3w8daQwVf6uzFzpMt7r5j5+lR3DimulWn2BoEu3F29oYXh+N4g
	XygKTbgRWS8qfpkcjAWNW2gpjyB7yNQ/9u9ErUGKsKYGgjx1TUojWi3pY0jh6cPSSBD0DwKSceirJ
	UL4VHoHDToChTg6ss6RtqYSVfZndwqE3xQN+n6qPKKZSa01dZPpcUL9IR9G0N4qJJOuZKwmi2D+Oc
	VoM/rXjhqkMMreSJs+saRi5BzhhN1BOxNcnl2rCf3nWGHXn7MtBzZ/FmnpacySUt8jLyjTc3DzMVU
	2Ke1lijg==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1P6-00000000Dq1-3zlq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:03:00 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICKePi029230;
	Mon, 18 Nov 2024 13:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=5
	0swHImWKQXwqEsla20Z8gC3MyM8KMWAHeZ2xPCj99g=; b=k4Kx49DFB3K9B9IKT
	Y3Id0XVTXwj6ei/xXWXVwyf7cIu9PBDtlIjsAQJylZcNEN9TNzm9jAByu/gslqb2
	J4N4i+0QPxbnsMp8jkoITnCyt9hcr89VanU82gIcSrJnK5rPk/UGRdXHmvq9VGn/
	YODx1kIwQWyfv84mvGK232r+BPCNhH80qRWuHiAq1XeD7JatGZ5MrDXYDeQWGztI
	muq/1sBbV6ZVhy+oZQMcRlqrm684YoCiQLYYsdwfABQ/niqTNO0rK94gD7NtmuMy
	obQsz/3Q8nZfG5X6/x9NqoftBeCWzbhS8R4R3YA0/uXTVh2X99iBdSNgDiU+5Vuo
	N2f0A==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmhy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Nov 2024 13:02:35 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:33 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:01:56 +0000
Subject: [PATCH v2 04/21] dt-bindings: gpu: img: Allow dma-coherent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-4-3fd45d9fb0cf@imgtec.com>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=QR/jy18Q3nJy2xtQXtFeNujl4LHlr+a2FMAmw0I4okU=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz35f/qD9UfNSU2rNlUs+15Vd27SKYcWhhnvZQvcv
 D5caV8zr6OUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAm8nQLI8P0+FPzPqjsEll8
 1rXKWMcm0cuqYIVu4u6qPlHfhVmpXusYGSaZ5U0K3CXBuFlglffNg1Hv15gdrGb5vOV8+3UH04u
 cF5kA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: wi5PtOw-yDY1dNKmIzvA_YE45Ce4Qsb9
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3aeb cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=0bZM3z7tgssSke037HYA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: wi5PtOw-yDY1dNKmIzvA_YE45Ce4Qsb9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_130257_103049_54F04104 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

This attribute will be required for the BXS-4-64 MC1 and will be enabled in
the DTS for the TI k3-j721s2 in a subsequent patch; add it now so
dtbs_check doesn't complain later.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- Simplified power-domains constraints
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-4-4ed30e865892@imgtec.com
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index c629f54c86c441b4cc9e57925f1d65129cbe285b..9dc55a6d0d4023983a3fc480340351f3fa974ce5 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -53,6 +53,8 @@ properties:
           - const: a
           - const: b
 
+  dma-coherent: true
+
 required:
   - compatible
   - reg

-- 
2.47.0


