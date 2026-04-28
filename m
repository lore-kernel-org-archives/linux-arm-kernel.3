Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6412AFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xFsfPLdNFjVzgQTaCQpOdWom/o9G4/TZWdtG0dTVDoQ=; b=u45VVjvyr4KgusnoMwHOOLlZo0
	JvxV7iKxulbTnYqft9L9Yg5ojgJxlaoFixDN1xR3jFOHQGWyT99rbHCRk5XT2Pnb4rR05i95w46ox
	GSX0pZjMIKz239GkWYDQAsXuHsDw/RMg/zCoxicfLnf47FcFcfehJqDHdoP6gHAqAibQV7UvDhtNA
	j00TFv/DvCkKnwa7yFxqba1qIhWWU/fqPm5/gFAYKz+935Lnd62DAqKVi3OvGfZrVyEPYXs/h8ps0
	E1cf92u4HSJvHqcFOK+CJkbYZTqMKk/5b0IBRIWd84QDFBf78/2xv3S2MH8qfc4lmfDrOhlNI7He6
	5VpffTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiTI-00000001XRQ-2fQG;
	Tue, 28 Apr 2026 13:27:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiTE-00000001XQ5-0fZF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:27:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAHnZT2112539
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xFsfPLdNFjVzgQTaCQpOdWom/o9G4/TZWdt
	G0dTVDoQ=; b=UUDoZkf7dkIKv5QtAyw6m3D0a3PfhX6iQdd0EyETB9cOLgS5yiF
	dZ3QgJZxFuCVU1ayF3845veEbnhEeoqeiw76GTmS/Irl4Q5jkJzfxm4U+2QxNzE0
	OCHvsfzt+iLA4WLqSX4pbq4wpPO5NtDiAIISCGRYC40RevxG0/IHdb2+yCPH7IBr
	313g37l5FjFFnC+dbHHRPQEDF2NcNu4AjQPYR0SAjI1CyWcu5MyaXDrAPJh3BF7s
	cRF7cw9IfXTqAcMudHARUMmnofMUNRVaLwJPk+TwQRltZt+zYbVXEdbEc+EHi9xY
	HlTRiakwMnxtYT5iaN+qEwGaxmlNACkAJcg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbkqch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:27:23 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-61010bc9c12so5022379137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777382842; x=1777987642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFsfPLdNFjVzgQTaCQpOdWom/o9G4/TZWdtG0dTVDoQ=;
        b=RiFUObfZir3aZjI/He5CO1pICMtoa/P5/hENjLkQFGnhdMkLdhCvUfGZBRPCnX72bR
         7KjlfmwOMBZiR6LhBezQhee4ttMbJ7N95nIhGC1j24KndpfnFF54viX9921GztJgJuDn
         WYvHTPSmsu/4SZ7FOyhAyo4pZyxazBovkRfG/oLgrfF8xQK2JTKD1TadtkKXESY/f6Dh
         zlw0fWyBqmFhw1Co/oFvVM5gQOyCvaB6MR8Dck6EdIfH4s5qJGgWcVICI7DrduoHTp95
         bxKC+AP+bGdjduygthgB8RxZaF8lqvgJ6zRU4peAkAG0delg6pzyqV6bp+geRYQ2obPb
         +FIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382842; x=1777987642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFsfPLdNFjVzgQTaCQpOdWom/o9G4/TZWdtG0dTVDoQ=;
        b=GSKv4S4ulQ4qrbn3pJUVCA9xz947WlSOE7V1kowRk+9Bm5IyqZVVewZ+aslKjFXiRb
         /4UY4CQgiQdDIgyz2LHYux+8LHcBlTFIeYxDlmYyh/zBs2ZwLVNcNAlnKetmf5owVGgu
         tIqN7xr8eSyhFO2sJSXsdXuxBN+r291M6NZXy+7L09PvycjSrjT2TQ1akhrFSO6TAdj7
         5tJxG1lsvJNUef4mCWnNURCWxU2q2ejnGswZzxYCqWqPSBMsoHOuDTrHKXlFSYhEXml6
         RSx5yHAZY/RXoiz8jTv3eFN8KqWDg0Kg1CxbADETdH51rTNgVssNTfrRz8MWc7wYPQSL
         OdRA==
X-Forwarded-Encrypted: i=1; AFNElJ9gxvD0S724gSllw7K+GxqjeUjDByxGJHZf3qtbWvPrzcQ5xm3ZC+9/NnHstiXvVEe/eEw09LRMqxf69K/sO4Xu@lists.infradead.org
X-Gm-Message-State: AOJu0YziqZ5SY1d8baXQKR/tGPrAhwpjEqdEul0JdVuZri0m6+7AZrFj
	nc9yb+6LDJh/MAIIto7VCKM7p89jzbXjBx/B40djMCtKBaqC6wSTfP3j6WM9HAVxPVFvHXpFEj4
	Hje/RHgM9Fi+Al/ux8Y79px4T5fhvE+nT6Oshitrk/G8r0qlKEh1r23XQzTYKO3ropX/iTBjAfj
	AgIQ==
X-Gm-Gg: AeBDietIx7RHz0lSUYDaK3XfEs7nS9nnjGiFWpGr8+esqAajGl2wJw3nPfCvaR8aRml
	KlgDVs871suI68H9R9zyUjHiO2ombT9qI+GsC5pdvKXPJKKZbZLwl24pu9Z8GQ6k7CRTl6KArR9
	XXqWIWuWTuIu84jf6yYh14jT/lIP3QA8yovUwr4FgygYQZx3mu5BxhDS6bbscNe1uedQSXSRwNy
	fhdK2AILJarwnSk8roKPnNqEkwGap0qNPiomLo8SQ3kLFNCok2Go0xqD1K07Nt6QX5jbFEwzD5X
	S0kqsVsWSfrYVG6hXTd7cxoT4pm/FnDjm2a+70/QgwCwhDWN7d9OYhfWZmM33wW2+bwSr2w+l6H
	5QCHVA0KSivO8iU76Oj6yRnCgMgFzfHQpqADird3qeC1Bv8U=
X-Received: by 2002:a05:6102:5106:b0:605:62eb:46f5 with SMTP id ada2fe7eead31-6280aab5382mr1036764137.14.1777382840382;
        Tue, 28 Apr 2026 06:27:20 -0700 (PDT)
X-Received: by 2002:a05:6102:5106:b0:605:62eb:46f5 with SMTP id ada2fe7eead31-6280aab5382mr1036708137.14.1777382838203;
        Tue, 28 Apr 2026 06:27:18 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d5ee9ecsm7232213f8f.16.2026.04.28.06.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:27:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [RESEND PATCH v2 1/2] PCI: mvebu: Simplify with scoped for each OF child loop
Date: Tue, 28 Apr 2026 15:27:09 +0200
Message-ID: <20260428132708.95998-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=OrdLwue7fdAbDzltDnJtmbESjqt0Rj2YqfvXS7hTKOU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8LWsNnmMkn77MrcChhNDnE9rF/K8JQJoK2dTl
 77t/s4gkB2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafC1rAAKCRDBN2bmhouD
 121uEACaGSATosAYoW0XcVvUvvJRkqbgDwo8ccDSqB75WflJzGX+m2egSgB+n+NHXJOa3kVxaZt
 xW94i/43SUOooIvW6WdvtMa+vgbimnKN50cL357luzAn41NSH2+hsr4Su1fl8LsMFlk0um9918N
 fDlJV9F83mCdhXYQ/X5FLnMDA3pFSjeU7+0lgGWqTrkvnwLD6eBd1YJY60n2Y01GFtgg29wp5TG
 szmuXhqW25Aro0W7AQXPrmvXl2kICF5JchzZcr6+3NX0fSefvj0gOxJwcUFe6G45kO1GMy6Xf9b
 q/w/CMOVUmM1FYwXB1SGSwutHM9k1+XFCmQmBbuHMsRKwDS/oJlQvK/VjpEBvLgezCgpDWEvoA6
 v9sa9q+eW3zHojZK58MfFFFjQKThehwo0ZycAg7bjXaWOiLdLlFEoRnfCBCYTS+6H0+lGZ31IzX
 30+kGmlcKOFaDgG/vwrNb4MfaLzUd0MhSYlCmueUX1Y6INZtL9CBq9GAbX8hW0BE3OdH9kk/T/k
 VJ3J8zIlM3XaY/TxapA44rVOWl7CK0Y0pwFe36ElDrs8sSX4cDKun85nP+gfbAfwiz82BrVPDyt
 7SFTYgrKqIsZZw1dzVQo21MmDR4YpnPwicDxuN9JcLeRqHpnCDl8oZg/dTdt/WHmvZ88F/9bEN7 1HszEbX06i2mtrw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YpLTKWeL89LDv_Rg4Dv_1AWw9grOuB7n
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0b5bb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=r4sBWMy-QYfdzbUQJWcA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: YpLTKWeL89LDv_Rg4Dv_1AWw9grOuB7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyNiBTYWx0ZWRfXzDLZYhYgzLl7
 1hyrMNYqG/46gegQdjCi4SWaaaVgvFS0D6M/0mUZiJTKHIyQn4EMPE5XS5gOzWviwb76L80Bwcr
 FHe3L0hGbHoCviBXlQD4H1KOFtwCkHBmVnYNJLotiCAzGBMBhb7l/D1LHdGTprvYzxFQx+A5QYj
 VRGbVYWwcMT9/pTWKW9PKNhHEXf4R+i0P5EXmWdz+MpaM5dznqSpp0Mk87W1byX3xnjWNNGaeQ6
 0GDSX1zDmlDKinVJY1DpjUw2iFLVG+qZXCxiANcui6cTyuV3Yt3Jc7nSa15w/G/smVGbaRe+A23
 /VHBImy+hjyvhSTM47wHQXkQu4CEnaF4ZOZmVHqOVxOMef/ROaEW3w3DEXr7pYh1wxE+YWzIhw1
 ipE/nC1U4sgMSLz1YsIocFWLMSp30NNMEU2OXONzgwSSzZWbkMKdRF2yIML4guzJpERElqX+m4N
 DCc5FMvvwVuPyJY55ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_062724_232883_183238CD 
X-CRM114-Status: GOOD (  17.20  )
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

Changes in v2:
None

v1:
https://lore.kernel.org/all/20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com/
---
 drivers/pci/controller/pci-mvebu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index a72aa57591c0..4d3c97b62fe0 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1452,7 +1452,6 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 	struct mvebu_pcie *pcie;
 	struct pci_host_bridge *bridge;
 	struct device_node *np = dev->of_node;
-	struct device_node *child;
 	int num, i, ret;
 
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(struct mvebu_pcie));
@@ -1474,16 +1473,14 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	i = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		struct mvebu_pcie_port *port = &pcie->ports[i];
 
 		ret = mvebu_pcie_parse_port(pcie, port, child);
-		if (ret < 0) {
-			of_node_put(child);
+		if (ret < 0)
 			return ret;
-		} else if (ret == 0) {
+		else if (ret == 0)
 			continue;
-		}
 
 		port->dn = child;
 		i++;
@@ -1493,6 +1490,7 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 	for (i = 0; i < pcie->nports; i++) {
 		struct mvebu_pcie_port *port = &pcie->ports[i];
 		int irq = port->intx_irq;
+		struct device_node *child;
 
 		child = port->dn;
 		if (!child)
-- 
2.51.0


