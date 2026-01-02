Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A362FA3741
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QksCvkxz701havt6PNPEIVEdb5fJwkj5u5XA8V1I200=; b=uZZwCAq4X9nuE5JzOCU8+19xJ2
	VzssCKJELP/+bgjxig76SeTvQbik4an4ThSpDv0sPrnaz163aPzpHVXyFgyGY1b5kFVuXMQrRGCCl
	scY8+irImehchWQ6w1dGKGR5hhUsaSYkD+e96kDiRydweOcXjeqxdv+Xi28H9Cc92pxFBm1W66szk
	0i1FhdSwub9Y8S911+W4cWKzYryo+PJ6pW7RBrD4rSwESdxq1cd33WOxO39t3seuPEIH+e9vTOM3s
	uJSYGemARF5jusf2EhmG0P/VV+zwIxHJ9yY/P3Dy7OvbfYB3GcGhbp4NHdbtxyS6FEol+azayqVuY
	ft4KaSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeaf-00000008E06-3JFH;
	Fri, 02 Jan 2026 12:49:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbead-00000008DxX-0F6J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:49:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WFdj824652
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QksCvkxz701
	havt6PNPEIVEdb5fJwkj5u5XA8V1I200=; b=dU4hS1fcLRhHmIWtZNnbtgTX7pk
	ZzXVmsO1vjJPhVlHxpLuxYjo3VDgjAMJRobKj2x9eFm7HHsLNyQ6n99rnCUiK2jv
	rql1VmU3DjTqIjckCeQ7tNxZSWpVv5O+NFTkZ+/6Y+M4QnRsq1CAdVPumH7DDk+E
	JznvP8htggNi5Ouu8uFhDMpEHccd99+opAHU2cfKzfjzOZMj/SR5bwSQn8QlB0Z5
	z+v1yoQGh8GZx9JZm+D3guUcD3Ckpww9Us265+5ShxOTD0+vJc6ur6NLnmshOq19
	s9P7HZn9JwRBcA1LiKJQWfjIn9Orb58jcAhnd5fDQLrGlxOc76xQl8ypHKw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533bwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:49:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d2aa793fso323017841cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358150; x=1767962950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QksCvkxz701havt6PNPEIVEdb5fJwkj5u5XA8V1I200=;
        b=Un09AHM7UfudpgS2AS16Wj/JJyduQH20ucLkQ9tycnvltPKDsilKkmTfKubvnDXgiP
         dJD9ViwOliTtC5PXopc9ad7thvdQ03YJASME3d8wbeNVz+j1NmgJ1S9QtOE9Him8u9Av
         7jpGjn5nGye/iUlFvT9fS5MKcJ04D8cxvEPR+FYcl8W8lx7yl0NG4QYC5IecsrXgQNoM
         x26qQOcgNRJ1yXv/9NduepF20Fhn1zbFXwStPvMJ0FAtaXjbXP4JpXcoVCyAQ0x+ff6u
         GCejfGskI4AtYHZyvCN5nOpnbLhitXAzzdNy8bt73cbLA3seLxPZurI4OgCVSx8JUQ/K
         3Png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358150; x=1767962950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QksCvkxz701havt6PNPEIVEdb5fJwkj5u5XA8V1I200=;
        b=ieUB2eC0X9d0YYRgEVELYKGPgCXa10ohARLf/EbtzhnP/fKCmCbwHBnW2PPt/9w/cV
         hPoN0dB6cYspx4tjIeq1JGngRf6PZBYs8tkuropUO0lGlVVOqQ/qhfHtkr/B4lN1i17C
         BRp3yB7GJGX1mAUs+xBduN9uuX9o6fR1xh5fOVm+pdAw11PpN9QE028V8ezYbR/2wbcY
         o3Qsfd48cnIJ/CgtRjFIbDM0pOFrYdt7ueJIFPwuC7tO5jcD+63Xiq/9Cs85ugsareaa
         Wvp59Mcz1GU2A6X5UXVX6+tXfDkTQn9MjF9JnGzh/HQIaMmWq5yaFTV6l5AqVF81HM/k
         xizA==
X-Forwarded-Encrypted: i=1; AJvYcCV0tSkhdOa98cTkRvwRajpr3813qOStmmXDvDRQfeXK5fajvdpkKlDnRd9UdUOe40PPeu+gSYWdw1dnma/YIVUF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh/QdD39EBlH1x/i902Qr568Mg7OOhNBuLfuEoG6qUr+03HrZn
	ZZVQsOUUADVvfV/OmUcnbzFEhpqTM+qOYcvEZcaWZt4d2/cjR1NywH6Uwv170WESzEQx00RBZKZ
	tXBdYlh5lOf+95Uzn/e0ZcnX1/nGDUelWsyAUrr/SabdskJJE4BkC8ToEoZIU+xfHpkEVrL5eUv
	RXuA==
X-Gm-Gg: AY/fxX7a/BK2l89SwzyMPLfYWf9Jj8y7kZqLdqIFGoTcpAwrVv/kKFavtBg/38HZnMt
	A9qQtZqHp3bA6h0XjD/4LiuEliFFRYeGeGdcsVIb7vShJQahGMyHHE7B6Yc019ZiGyZTbljvdya
	eEsynIulXqDVcDrRAdk0ywrhw57tE6r6aCS9ZbOw7xxeGqp+rHRjNL4ap2soqNUS8HZ7C9ESYLB
	76uPsdJJpgZ/RRapB2xZMB3/bcyzy0feHhVrmXtseq7oh2Vc2h31jDrTsxIZjJVtvVV/mC9DMA0
	zMoO9ExX5/zuGCilA2pRUHxrOZi9RN2dirY1KjT6HY4YwXRPMP7OPMDE5ixli96OrS9nST87Vkc
	Wv8yrhoUt/jvQsWktJaLHdjO6Ww==
X-Received: by 2002:ac8:5a15:0:b0:4ee:1f09:4c35 with SMTP id d75a77b69052e-4f4abd79a40mr632135211cf.52.1767358149769;
        Fri, 02 Jan 2026 04:49:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL7+iaxfkh7ST1sRsRYoBVUtv2vCaZZf3cjrB67s/8mxAufKjDkRo2M13zTJGUPOHwVYM98A==
X-Received: by 2002:ac8:5a15:0:b0:4ee:1f09:4c35 with SMTP id d75a77b69052e-4f4abd79a40mr632134871cf.52.1767358149357;
        Fri, 02 Jan 2026 04:49:09 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa46c0sm84804526f8f.34.2026.01.02.04.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] PCI: rpaphp: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:03 +0100
Message-ID: <20260102124900.64528-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=2vSFBEundxLqzUF0iaxUlKJbfat6WpicJdQSaJWZB+I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV76+e1GWQ1mozRhfq+ap3krAimH8FTe2HB1j1
 lznowHd+NqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+vgAKCRDBN2bmhouD
 18j3D/49kYD6fP1TIJI0EqfcpxR44LRXjhjTjuIrdSKl2LOrzXCofrUqhS4sdhdgOT/Ur6opd9j
 BBH+FXCYkqMZI1ZFRbFjugQZRuJKrg8zyiONGWHryQ7lgSxqT2zDHwIiQ+L8CaDCcVDYs/DP5Zd
 0UlXdn6Lql5eVRemHSBxbvGNAzvclucJe1M4aTF6C/N4e9PhyL+GtgmfoUyBP/wBMegUnDLvrhw
 WdikoYBxWa+cBxtXw5QyX5pfQnndDbVKvTm1Ik63bSfk+o7DnXjWxdMCw3fPaDbr51iM9LwErtN
 nC+E18JUmHnLUq/CneetFJ93QmAqM9jW+OlAMaoTYeAg2to4ONPudWZsmp9Fr4D67FSwOLwSOTg
 jVEI6KZiDfF/VsgGtNrwwgP9p1WVHrOcGA4pNmf9JV+zgYMXpy0Uk0pBtCX9TabbUxSD1rr77xg
 SnJ5ZtD/BlQSgUE3ai9133y84tbVEzmXrK+o+YCM0fw59SQ2XDFDXB7QsMwk3t4qRD8ib3AlL2V
 7vbwcRM+SUwpO1ccJwLBXF88a33pdkxgSeyCnZU/uehlMTZKbLt1nSd66+7TqgAy220ryPGxum1
 2notKTa+Vgl2yTPDLOkA9Xbj5d2m3FDvuF+Ga89FlaPD3FQ5Dh5cx/4CrWZdva4lyo3+k6oo4rR TbU6COInLGlpNzQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Mw8Dkp_OE6vfNmAp9iQD-IPDYK19b40a
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957bec6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=d5zWgTKZ4CwGW_Y1MEAA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Mw8Dkp_OE6vfNmAp9iQD-IPDYK19b40a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX4OKpDFfUD5Cy
 Hy3+Fi60M+aoKNTxVoXLJqiOi4LZdZ9o0uLfsKNdeX26ddcG8Lg88Kj77+nZPTqV0Z13xvzmZ9G
 OmKETFweQnU7vEjE9rNSCq2lJi6qW9EUkyyuj1LYZ2PLu722fuIbWQ7UBcRm1culyEbCedPedBK
 nObvtuKVWbdweKotffAXRiQnp9aIEeGY6LMwOe1rUc/tqKUma9fxapU2hmtLPJsyInvewX1ZwFS
 s5rkNyeVqWZCePhBC/FrsEdx/UBYmt3WfxvB0hiuIssW2LH+3yINRIhs0WpTTsEue21e9qu0uTq
 oWxztr0dCcQzDg5zw0s0KPCSoa+Y1sL6z5SNULpXajVhLB/vmoeG2nhQt2aInGBw32y/orOJQ9P
 MN1o6seFVlHYTAL6FfetY19L70XzRKSrwQtCMa678HrOb0yKeC9k9xuyCryF8XOBzXvzmuGN3/Y
 YFdIs4JGbA2xWcQcj/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044911_196776_F865ADA1 
X-CRM114-Status: GOOD (  15.37  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pci/hotplug/rpaphp_slot.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_slot.c b/drivers/pci/hotplug/rpaphp_slot.c
index 779eab12e981..dc0e29c4fad3 100644
--- a/drivers/pci/hotplug/rpaphp_slot.c
+++ b/drivers/pci/hotplug/rpaphp_slot.c
@@ -82,7 +82,6 @@ EXPORT_SYMBOL_GPL(rpaphp_deregister_slot);
 int rpaphp_register_slot(struct slot *slot)
 {
 	struct hotplug_slot *php_slot = &slot->hotplug_slot;
-	struct device_node *child;
 	u32 my_index;
 	int retval;
 	int slotno = -1;
@@ -97,11 +96,10 @@ int rpaphp_register_slot(struct slot *slot)
 		return -EAGAIN;
 	}
 
-	for_each_child_of_node(slot->dn, child) {
+	for_each_child_of_node_scoped(slot->dn, child) {
 		retval = of_property_read_u32(child, "ibm,my-drc-index", &my_index);
 		if (my_index == slot->index) {
 			slotno = PCI_SLOT(PCI_DN(child)->devfn);
-			of_node_put(child);
 			break;
 		}
 	}
-- 
2.51.0


