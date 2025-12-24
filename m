Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB763E75448
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XZ3FDxXMHarmPLEBVnXVNx8cfejAj3WmwsVhyYVYA0k=; b=qwD6hA5Nz0lpmQnshLiRj785ed
	spLqneTPlI88TylmvxNtKvxfrMi66H21jEDnzx/0eAcdGxqBKqhDBACoMy35WwpiEbcordCDl1ArS
	G10QiltVXYpbxnPBS5tCBRpGPq/F7P1wl8kcwEjwHGJindfcsOjm4bhE5B30ZDKJwwlNUf6/xnkHo
	4Dr1zVN3JGWyQPPtsKHCfzYW9yMZguk46TkyMlHVMJ3oJDqzwbuERts1E+cjBBWGCcCFEFBngC2IG
	oJ5j1Yg3ZnyB+sPAfdFwdDLB6J0679GVBEKzrr2rNfmuaYAQiCfjnk2RcVtzowzbAFpRothU6ei/r
	PCNOKukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYLpU-0000000GgO7-0lEe;
	Wed, 24 Dec 2025 10:10:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYLpS-0000000GgNL-0Cqe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 10:10:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO17Spk1597721
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 10:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XZ3FDxXMHarmPLEBVnXVNx
	8cfejAj3WmwsVhyYVYA0k=; b=d22GcvMTuW6GfT9ArSoF4tG0CzRXGxnSx86DNH
	qpN/YlIXHkr/1u9GD+8EEDrYdjI0BT2nRMBzL+32iQLHqzhF/z53+H6dpzZOq4M2
	7DfNzczJx+fiDZqE1tlgAUb+JaB/te4jY8d69ZGNHyJhS720MxUokVukXm3kXs3t
	zRmZz7YlqEZUR7g2jDlR6LdKmMYL1yufwIKLGV41nXpTq3lrrdAm61XSqSpWJ9+h
	KD/oMvD8QN0L+48UzpgSSMtzXFzVOk4JP+CwR8Bo/CkP61UCAQn/lW+vXwFrm+4C
	NloC+hKk4EdfjT4CNISwCtzOs3Oio+PmyErRsgzxvr2eWM3Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683h9de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 10:10:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34aa1d06456so12866895a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 02:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766571048; x=1767175848; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XZ3FDxXMHarmPLEBVnXVNx8cfejAj3WmwsVhyYVYA0k=;
        b=feCzqIjbGZFLkROTrc5P0avBkX2TyC4oTtkZTjK9C0pnZ35ElQF89A5D6symmXs4pM
         P5ANkzvXC095KxYuLA5Wmfn+4b7DB0lhs1nqmTmdWHe0tdTSika2am9ZPTBS8sw2Q6mc
         h8IA3ULMJ2UJr/yDMyKVedmw5ur2cjjx4S22K435ovRAum5b6ftpIcTh2shc6Zh0m13B
         0E4uzeS4Il3vwC0xVMoRJNhTx+qbMZl0v1bXYexjktCF4CubJZaJnn5nSTMKMayPKZoS
         h2ZYbYOqCjlPQHyzwiKx5kCdKnr+db5TtQLM3/110EXlKRChZu3FkuZ0JczvfaT9Iu9E
         CG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766571048; x=1767175848;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ3FDxXMHarmPLEBVnXVNx8cfejAj3WmwsVhyYVYA0k=;
        b=AdMi/RdflOHbugfymdRjE6DZK6ozUg3BlCCO+2RUHiirhVVcql2N2SEWdMpsXUN1oF
         7nzFbGDfoiQctJFWEmYNupC4ZxjSmTYDQFJwD8I7sWV8fiJWognEL4ES/YwwK1MU2orL
         wo7NCxpqB6B9E1R+bWObOLY/uhITGd3XBd1YDKCeS0WqdK8y3sk4DoKZcWBQB2nj68ZQ
         5Gey3YC05SWuhCS92vZnknm3A0kz3li8Rl3XZd/RYBwHKGZOz0hv0KGaCpIW2t6DtyjT
         sd2BaltTrXwFHwYBB1EsE3mLwzJr96svh7NgjgW0QMQ+Eg3EXbwJCSwdMqcZh9nXV24E
         PhBw==
X-Forwarded-Encrypted: i=1; AJvYcCVN/574BRISKzHiosv+sVf0iJQDyk1TTsG+KVD8mBwCS72d1cy3/KupCuiEu2n42uhdcENfajRGoaBU0HLrewL1@lists.infradead.org
X-Gm-Message-State: AOJu0YzvU8C5/isjlCPrPSOyUN4tOmralfUu/dxIZBQua4YquNlcFkoB
	m2LkEGOaP71bRxtoAOEE/qu6mMbTB479GnqTmijSL0ZeMQwRBGTW+ZlnnkS5rDvtOO59Tw2oQF9
	HIS+exEQru0BQn740cwvym22JHovV4IJT8MEkCirfq6FRxb6cUXpITzZbnvdPVnyfkAAwDvudTS
	SOEQ==
X-Gm-Gg: AY/fxX66UF4Da68/da2mLzSHpPMgfp8i6sIAXgroKzs9NDxrzTNw27h6tC1wT01Tr2B
	9K+76JXbXEgcNT6OQKA7Ro6IjSffCQgawN7ZKN6pR8W5uUSwUZ8SWd0HsiezjynKGy8k5IofheY
	w++WqTwsHSfEnugjwXZaIJko/g9EmlG5pwjjEYjcNGc0TrRYwCURIN5hxSnVXvbRUvRgJkAzPSi
	RPdDub0OKYi/Hl6N73d2A3gYlNgxIcUgKb2o85t/tHQEqI/2ufThljxjn6CRbXbTzmD0kgYHagz
	VLH2iE3vU2u2T8rzr2sKXg9I0pu/oOuXanGVUfHd42jOTKegM/JEN+KiAdO5mtg9R8l+MoAmw1D
	ord16iiKtwEHJZ4JqYConmtQ7GiOU2Bqp0sPVftTUbWjrWgm4Aw3Fu5pz
X-Received: by 2002:a05:7022:f307:b0:11d:ef84:6cff with SMTP id a92af1059eb24-12172308947mr17530627c88.37.1766571048417;
        Wed, 24 Dec 2025 02:10:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqAiL4jHSU7/9+MwgxQ3qP3nId9JEayrA1C8JJppmIis0sasuK6f1Hyw36MlCj9gYMjatsdA==
X-Received: by 2002:a05:7022:f307:b0:11d:ef84:6cff with SMTP id a92af1059eb24-12172308947mr17530605c88.37.1766571047809;
        Wed, 24 Dec 2025 02:10:47 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm64523514c88.1.2025.12.24.02.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:10:47 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 02:10:46 -0800
Subject: [PATCH] PCI: dwc: Remove duplicate
 dw_pcie_ep_hide_ext_capability() function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove_dw_pcie_ep_hide_ext_capability-v1-1-4302c9cdc316@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACW8S2kC/x2NwQqDMBAFf0X23IBJlEJ/pZRlTbb1QashEWsR/
 93Q0zCXmZ2KZmihW7NT1hUF81TFXhoKo0wvNYjVybWut851JutnXpXjl1OAsiYeESu3hYMkGfD
 G8jM+DmL79ireW6qtlPWJ7f+5P47jBBFpZ2p3AAAA
X-Change-ID: 20251224-remove_dw_pcie_ep_hide_ext_capability-3dba1507a331
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, Niklas Cassel <cassel@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766571047; l=4607;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Xnv/sBrBqHQV+BvV3+s0nYNYKZOsfD25aEwqAwM49rc=;
 b=buJx2QJGgffIcLDxa1NPfng5yROlUFJRA1KD//+D3k35OGdkRjY7fl+/aSQpupAMdmodeo8mk
 XUZ/mNu/OGhD5/2s4OrjIWfRFxaLN8TJIX8z3mhsq7r7326qt3Wd3GU
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: YGHMOk5HusHlP9cg3hAGpKl__MBvbVvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4NyBTYWx0ZWRfX46+aD8KJJDtw
 5a0TJrpaNr5uAqf4ZcNJ6npHkiegtI+EisJEAfeNZnEU+4j5vQxCFBRqSmu1zkVXbITJKZpCzON
 o+A6R/TR2Op/HyCFOlzNh7r1V5/UwHAoVWn0tL0taByL7hQPOk8otdZ8eQpErHj0xUV5vIzEgNK
 xkSe+GXWUkVYVQoDVPAoAxXW1GqoeiGqtnGYCVCVEvOxdMFP9BknGVSAt6fYBDWIJGZnemVPKXx
 vCxqEVGm/b9ItFGSviVFZbdlAWpGgUc/T2eMk6hTTd7sOdzgr0TCAZLvoQb0h8429ralqzf95uT
 PssveYh7W/TELj6J4ST8OvMW7AABB6QJqvFdhy22hjZwncsdNhz5oJFUnakopB1Qe81ghYj8evP
 WLzV45remegscLqriGUF3p8ZFs4llqmxyaPu2UxIPFJkPxso/7jVR/8SNp86dazp3EExY0abfRw
 6M75a6/JnNMO93c1/DA==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bbc29 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Svf4W_lptdzYmPpfBLsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: YGHMOk5HusHlP9cg3hAGpKl__MBvbVvK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_021050_120146_CF0025E9 
X-CRM114-Status: GOOD (  15.71  )
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

Remove dw_pcie_ep_hide_ext_capability() and replace its usage with
dw_pcie_remove_ext_capability(). Both functions serve the same purpose
of hiding PCIe extended capabilities, but dw_pcie_remove_ext_capability()
provides a cleaner API that doesn't require the caller to specify the
previous capability ID.

Compile-tested only. Runtime testing on RK3588 hardware would be
appreciated.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 39 -------------------------
 drivers/pci/controller/dwc/pcie-designware.h    |  7 -----
 drivers/pci/controller/dwc/pcie-dw-rockchip.c   |  4 +--
 3 files changed, 1 insertion(+), 49 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 1195d401df19eafbab2fb267f5cda3c24ecdfbd1..cfd59899c7b85fd0dddc9c6ce6b9c9fed84ad7a3 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -75,45 +75,6 @@ static u8 dw_pcie_ep_find_capability(struct dw_pcie_ep *ep, u8 func_no, u8 cap)
 				 cap, NULL, ep, func_no);
 }
 
-/**
- * dw_pcie_ep_hide_ext_capability - Hide a capability from the linked list
- * @pci: DWC PCI device
- * @prev_cap: Capability preceding the capability that should be hidden
- * @cap: Capability that should be hidden
- *
- * Return: 0 if success, errno otherwise.
- */
-int dw_pcie_ep_hide_ext_capability(struct dw_pcie *pci, u8 prev_cap, u8 cap)
-{
-	u16 prev_cap_offset, cap_offset;
-	u32 prev_cap_header, cap_header;
-
-	prev_cap_offset = dw_pcie_find_ext_capability(pci, prev_cap);
-	if (!prev_cap_offset)
-		return -EINVAL;
-
-	prev_cap_header = dw_pcie_readl_dbi(pci, prev_cap_offset);
-	cap_offset = PCI_EXT_CAP_NEXT(prev_cap_header);
-	cap_header = dw_pcie_readl_dbi(pci, cap_offset);
-
-	/* cap must immediately follow prev_cap. */
-	if (PCI_EXT_CAP_ID(cap_header) != cap)
-		return -EINVAL;
-
-	/* Clear next ptr. */
-	prev_cap_header &= ~GENMASK(31, 20);
-
-	/* Set next ptr to next ptr of cap. */
-	prev_cap_header |= cap_header & GENMASK(31, 20);
-
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writel_dbi(pci, prev_cap_offset, prev_cap_header);
-	dw_pcie_dbi_ro_wr_dis(pci);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(dw_pcie_ep_hide_ext_capability);
-
 static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 				   struct pci_epf_header *hdr)
 {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 3a81d46e60b00f7cb92d9634eba6708244bce976..c5fff03073ea3945a5c38b1626838c6a67d21c57 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -909,7 +909,6 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
 				       u16 interrupt_num);
 void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar);
-int dw_pcie_ep_hide_ext_capability(struct dw_pcie *pci, u8 prev_cap, u8 cap);
 struct dw_pcie_ep_func *
 dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no);
 #else
@@ -967,12 +966,6 @@ static inline void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
 {
 }
 
-static inline int dw_pcie_ep_hide_ext_capability(struct dw_pcie *pci,
-						 u8 prev_cap, u8 cap)
-{
-	return 0;
-}
-
 static inline struct dw_pcie_ep_func *
 dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
 {
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 352f513ebf0363ff0ec79fdd8d8b245eeb28474c..77c4e6a4ddead91fe12eb6c727e77350207ef5fa 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -347,9 +347,7 @@ static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
 	if (!of_device_is_compatible(dev->of_node, "rockchip,rk3588-pcie-ep"))
 		return;
 
-	if (dw_pcie_ep_hide_ext_capability(pci, PCI_EXT_CAP_ID_SECPCI,
-					   PCI_EXT_CAP_ID_ATS))
-		dev_err(dev, "failed to hide ATS capability\n");
+	dw_pcie_remove_ext_capability(pci, PCI_EXT_CAP_ID_ATS);
 }
 
 static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)

---
base-commit: 37781eb814e16c75abb78dec2f9412d2e4d88298
change-id: 20251224-remove_dw_pcie_ep_hide_ext_capability-3dba1507a331

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


