Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C3EFD8763
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xFsfPLdNFjVzgQTaCQpOdWom/o9G4/TZWdtG0dTVDoQ=; b=y0XHJTwn9KeEMHBbFnhbZbDTje
	TxWst9iFuqJzfpc3c8tQ9Uh+TkhQ2N1leOqYcO6xCg8ue2BZA8rEjTG7QtHLUbtPFW21c1YppCfTp
	njSqVUiz6SsNujt8RufaszLyvJAFA6VUYdjMdSiCr0vXvEE+qACm8NCSyGfTUHBYMRSO1tXiEtlq7
	IhrqXW52i28dg84PK60S2f022W177ROGwMLMvFYN5qFnv1elBIEriw4BK7QFuae/b3xcKQ5FMDIkm
	qve7wpADAxn/43T/Hz0BeTxzqdZGKEousNBRtB15PAtjdL6lN1z1VN/JY4YZcGxqNayPmzHROEop9
	pcDOAbvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYF-00000006R1B-2Snj;
	Tue, 17 Mar 2026 13:33:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYD-00000006R0Y-1C9z
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 13:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=xFsfPLdNFjVzgQTaCQpOdWom/o9G4/TZWdtG0dTVDoQ=; b=QmUusOpUyGSxnBQBMnsFZqLmLA
	sGkM2MLkO/KW3rilIrQMmGLJxy0feFE4h6vio/jKpNOOvlggrUIT5+3nU/P73VvlofT9iDz+yCGrR
	qCQB9UBsijU/N4+fioxP8DZa9QzhPN72g4ZO/0z+P5G2sx8BdcIw5A6YGgIeYdxCpaRjfrpuN85l3
	oCzCfcoy9+R3gCRqtIPOp3hjhmeigQxyzktsHnb5R0QdxTSCShN8/Ut39U+qT1LWZAIm7QoMtsHaW
	6ahEYiw0ckkweaDparcdCsCctt/5iN+vfO3wGKf3fGgHtoYZxsVT45XiSMdsYyT78LO4x0HaYO4pP
	cxQV6Mhw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UY9-000000095tT-3Eke
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:33:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H9SC5A4022265
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 13:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xFsfPLdNFjVzgQTaCQpOdWom/o9G4/TZWdt
	G0dTVDoQ=; b=UoLU4hwrC5dC6619mdj2VnbVuT7Aekrcbig4KOnX60dCk5TZGoQ
	ML/pSlTBEj6WjZtUqe3RQQcM8nXBfu60SE5I6aZkNxpMQ+cda0SQBu/hW95PSfaI
	7EEaAkBUB/5KDpZpg+OshLNtLJblnjg7CAlfckG16eTH5tLxcOFdt2KE2OPE8lCh
	Ep6DOa8Z2wWqcaOQiiIt9EmYvUWjHxKF8UEm21fzjiBouEMbN+QsuYo4eWpzOyO6
	UlXQlcjA6l7zQ3DZSvCWVCodKT3a1IyeLXH6IbHSOj5l5bJJROzTJkvpUrVtxVnC
	raCXSEH3TJOHlhQArtY7SvI7CNdh6kpd80Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fkw2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 13:33:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5092135f2e9so328172671cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 06:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773754411; x=1774359211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFsfPLdNFjVzgQTaCQpOdWom/o9G4/TZWdtG0dTVDoQ=;
        b=bhyPENQOhomCYhWx3DTqBD2U/MpVQAalhMV9nbBp4Ol2M+gXUCNtWOH23kg1acqogk
         I0R92GChxhXAapyur6mI4gh8ZG2Vto14B+cnNdqXHHJBypGxkqYXAFeuVZv6KGqHuwt8
         SLN16DqyUx7CDXPwEQZ104AvW8XQU1u4JTWX260pqh4ohjEt9yPYA0KgTfsiGEU15C93
         udu+0DQGL5kV+PTv/trsX+RwxDvlkaAXqgz5vk5tN4lDpcWenS20KayR4VC2eB3TjPzN
         8Vesveccv+JWnRwSHN/r/KAoA0vTvN/U7DHBOpF9o+mrv55JxkfnOrAtXull8x+DW9P6
         Sysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773754411; x=1774359211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFsfPLdNFjVzgQTaCQpOdWom/o9G4/TZWdtG0dTVDoQ=;
        b=HN9HsoiwBhFTpSNCZntbjF/zzpxUtYy6VvCaZKxOVEhkB6Wu7wLi/eYR6MRUo3HEHo
         qXMgWig5CH7q7v4zcgZ72IAdQo8gZAft6FyzAcIDBGLmAYza47/R6Ves1poHCvBLe9Mw
         TQRgUwnwh5cU3bo+CrRSVjzP2kSuQJDvZzQkiy9bBGs45VsQ6/09Hc6/txsTf5815xg8
         IXUBTP3XTPpdFWvqbWHhsgYTGxdUkQHMuFnQInXG+54+GiMrCj4mNBTyCf9yJ6436pK/
         FhIj/nn37hbpt9sboo29D8ao7VtMPtQMHYroRFZ0m30Ji4NGm6clUoEA2nNdYqg9WcJN
         6ntA==
X-Forwarded-Encrypted: i=1; AJvYcCWhoAzXRrWA6mo/1a63K0xkCcHf84Ih0aaq5yLeHqsjjU93poacxp7iQ6HGY5dPG6PyEs1zD4JVi6pgE4ByC9Q0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw25TOAWxoRAsOz6jwh5NhybHSR4ZEvpC8HFqOqgFnULsRlMjy0
	WDf34ts3J/bq5pNHZ/mTKWyq9KzDE3e0+mvgz9hZ1W/YmK6w7dRSS+V+5dBgoiTUGxnNmsIYxct
	fwunXMhpeFCzaSs9eyIshvmo/ATy3FMLYOkbGjg8XAgecZOe4Fn2Ca8Ckwr4/U4IXlLKPz94EoU
	/SuA==
X-Gm-Gg: ATEYQzxiQHnMJdDaYft2MYjuExgMYHGArjBctqDE0Y4GoV2zMmPrg4lkwxB6Dv1bpU/
	iyOyhczWOOKrm6HyKfQjyOiEC0/6/xP8+8yTX896BWyIgVpS8oquwvE746XSXzJSNc4TZtbu9GJ
	TlE0QXXO0OOyXOP2jhaH/PPUjvHq9RM0QEPg5JB2OP+kTZsrlnyIWu9zVb84d50XkopgF0e591+
	b21vyMYXDkYnwad/Lv9i9ELxl6hcLdZBu5XAUId3ATNwmLSZvUAmEp/9qwo0oqKG5mdrytgsmEB
	hL+BaKXhksM4i2z7LTGkAS+EpzdKlxfzmtJ9Cm1o/Zl+oLftmSb3VfF/UC/sXNNwuGuqrCW6Faa
	AGU2D8ZUEpTjyQ6blP17qWC2o7k8sWVkg+ksk
X-Received: by 2002:ac8:7fcd:0:b0:4ee:1c81:b1d5 with SMTP id d75a77b69052e-50957de91c4mr213716791cf.46.1773754410635;
        Tue, 17 Mar 2026 06:33:30 -0700 (PDT)
X-Received: by 2002:ac8:7fcd:0:b0:4ee:1c81:b1d5 with SMTP id d75a77b69052e-50957de91c4mr213716261cf.46.1773754410160;
        Tue, 17 Mar 2026 06:33:30 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm51358613f8f.4.2026.03.17.06.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:33:29 -0700 (PDT)
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
Subject: [PATCH v2 1/4] PCI: mvebu: Simplify with scoped for each OF child loop
Date: Tue, 17 Mar 2026 14:33:23 +0100
Message-ID: <20260317133322.266102-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=OrdLwue7fdAbDzltDnJtmbESjqt0Rj2YqfvXS7hTKOU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuVgiNnmMkn77MrcChhNDnE9rF/K8JQJoK2dTl
 77t/s4gkB2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablYIgAKCRDBN2bmhouD
 1ze4D/9krAOOYWKjH9emdjBtbBAWnahk2EslM5mgi96nhIwDz8xp6zxHv92avzFmuxUITKJG2Ue
 qDQC5EHqKRvpnbsuGY4fBpC5GPhprYTau0XfSKvNFX8xuobGppZ7HolxLls9lynLQ8mY5OIgHpu
 xLEclQTekGqPrstc54kCypI+K/xi3qJ8UVJMzjKE+UpQtLKX8WG0ZIa3c1rJOnPhKegExoZTjQ0
 QtHdt7PChdWXO2442uI3j0QqptigKqDF9bajSMKKTl10vALKZ5jSMT9UTAMJmTCGbC7nPSbnzpA
 xUxWfprrx839uBEtRkNnl4jUaLq6xj6EUqBOE0CCzyz1t3kcy+lVeWVqlZQ7E+KmZZSb2+5yvNd
 6niyQTB5GzbOdROK+aI8D9lwWAmdwRFrpd0uJGb7Fc6xPm+6U/e20FCrpCUS1iS7znNo4dsJaVb
 tx4/E0fV5zc+Cy8ecJbJyGN1Go01OQneL4EUvYPeYbGUWTstF17YeOnsr2VesN125X5KQJIz06J
 JGjMAMUPlf38PF1Ib/uVplTpzUNXUipw34KU07qZNDuBZsQtmvbYaZm7D0KprE17aPlj+1jvsuG
 EfI1zmzfrUQ7/YVVpu32BPtfviMLHZIwplLc6AMHVt8S+EguiBN/qVcU7wSOd5adXkLlqLHkp0p ynjQdNzofm2jI+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b9582b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=r4sBWMy-QYfdzbUQJWcA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: YFUZAc2DcIes_Q_JQlOkO2nxD9InYzgG
X-Proofpoint-ORIG-GUID: YFUZAc2DcIes_Q_JQlOkO2nxD9InYzgG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExOSBTYWx0ZWRfX5Hf7m/qbiIdH
 rF2A8PpiCRCHHa8Xn8yjqzrQvnk+S4cmxDbfbmA0tWbh4ax4jE7G0edXPGE3x3JlyXbcuWlBsgi
 pSW+Go+8i/daL7EvM9swu2AwS2yFucOEtI+sRBZ/J7c6A9WFRGvW1YSnKFFqZKXHRZNXPHw/hCr
 nkrRsfN8T8V0sLby5DRR/DBG/wiX7SD8GTz81Dr9slvoF3nBp4jA95TJ8V+jPOf51FUYOujZJi+
 nSDizHisO+yKAv5G9sHaROqezKRcKKtq8GgoKXS3zO9WMG18xMnSewzHs1qUQUWElCAJhOIUkp6
 1+M5ZLtHj+ERp30/3gw2oOIFFTbA1xcfo7ocA8ssMcjWcictWAkAd14HVeRuUO2pDrFTzy5+eOX
 N8IDL5l+WTE0/okA7MOLFgsnv92hLN5FQSe0V/165bo3vF/YG2C9+tM6JP+wfw7WzF46SAcL9OL
 976r8v7PJ6fMYxIixAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_133334_118127_4F6706E2 
X-CRM114-Status: GOOD (  17.29  )
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


