Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AC1FA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0wfWJirMhWJX42Yu/+htNC9US6ZKbNc21fiMHrEP+Vs=; b=dBoFr78QVGBpRDCzyIMxo0CObu
	4jradhUfi8WSe54MhGX8kMwLmnlaQu2+7sWb7mhgk/qYIj+vTmWYJVHVJ+Ld3OHnAEOVv9A9K6JpD
	r6JbL2Uyv3HcY3+tDl7SvZ3GHG55O125GH1IrfpWSATiv3veuluWQg6qeyvz28HAmQw2ySpcdSlGw
	BeolXGWyTVVmaJ3PTm0kz2Ev+Gh1LBT2GbInnzKmuS0s8zPittll1tR0SbR5C9GpAL8dOP4W7K29y
	o+AjUIYJWLg1jmESBZt3unbM3M84r/8u1e6RX8MThduLmkcZDMfy58Y5oFvoMsWcDoWJ0THIE4Xlp
	9rZ5rpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeab-00000008Dvy-2iHW;
	Fri, 02 Jan 2026 12:49:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeaZ-00000008Dul-3o6T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:49:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W3sV426888
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0wfWJirMhWJX42Yu/+htNC9US6ZKbNc21fi
	MHrEP+Vs=; b=aKjlJvH3CvMqWTQEol6Gf8rcqFc67Z9yisxLucZeHO/fmxOu4eS
	63FjNh07bHkvdi5aQniiUVELe1iQALOjRGztqLBITBzYHLrIoSbo44nF5s02vImq
	mof0LkyILVTROHF1NQgZG4ezsYOYQYdqkrb/NkW7fM5mZAA3OChgUxXwJD+WoRMF
	u25K94F/ITjGyE6LV9wHxwXH/foZabaqSy0Dtwm+CvJWAn1RI3KlUMtzWRYpfgwE
	1dJ77+VdnTBq+dq+vv48bBHB6gDnq+NYiX1oUaUNGgOEvaZdCO9a7GNG18drc8xe
	AhNkcJ+XkyQbJn1MFZ9ZnYNCIwFF/VRilGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjrxp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:49:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4fc0d0646f9so77931871cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358146; x=1767962946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0wfWJirMhWJX42Yu/+htNC9US6ZKbNc21fiMHrEP+Vs=;
        b=FeBSku96BH/pmjGYpwjVbkJ45VizsTSzGprUP0rLp7+GPCREhSbNkRcVp+DLzoebHc
         DFTosHkSOME5k6/WkY4q9phgSqOycP1EMLnUGD3o/ZQRDnB2plRIdzlV6keXcHiBx8vJ
         tjTeuIEqU62mK2+F6T1l8u8z+C8NNHs97QyEc/dulL/j9a15LJhC31mX1CnbbkrdbUsM
         jOLi8edH0z1+vp2churH44/+NHCRfCzIsIM29W4dtdRXx3Lw3dEzVja062L+EXocCchR
         Ve34hMZlEZDhq297Dw0eAk1nZ87BiySTSSL9Uo1sVAqN1M9vP3viz1EbmbgGyr7Ay3sY
         4WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358146; x=1767962946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wfWJirMhWJX42Yu/+htNC9US6ZKbNc21fiMHrEP+Vs=;
        b=OujtjCkvO1FQAh+8L6OL5DTOLFrI1YIWggJuIraO2Tp6+S0wHdTVmFnzkRqqGtAu1n
         nYqMnBcisWk0GlxXtDajd2PKwTZgklTfB9kl4XSNeAF/vq7zoPn6t4oYD4YaNd+mOtHa
         N1ctmn+Jxd6oRFuKi04uOhFu2K9Jpimf83aIq66H6awZwWq3H/XSlZbwl5+iGhwXCfj3
         hONSt3y+9kUJghV4D1BIGBGBnK6ZyHAFLVcNvkrVQlRQUaNVarGDBvb7aL/iG4ta/dE0
         QBrDzHNUd+9AV8h7tJRHec+ZOs0oIczNuBiSavB2gV2tWgihgj/O9o6H1FK5ojDEXiDI
         Ze/g==
X-Forwarded-Encrypted: i=1; AJvYcCV1hrQbI7NLqgy3/+aB0Fn6k0SU3B/TxqHeybU0haD9jk4B6xSYOb+CzBCNphm4TimDLernELx4LgK1cjjtWPHy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/d5pKafy+I4M2C1jCUgkV6JXK1HfzksMzdoYrwvxMCZTej1WG
	vt41gI3v08uO+UYnnKbFIg6DT6M7lnTo2AP0AvZkCgOZEfZXIlArLxFgGBhyOQkwBIz0QjJQtMS
	mwDRQnjotofv0YGAb+aTFqutMNqIZ/rI8IO3Ap+Fl42izQRP0SOhbKhoga5l/WE8U9ASovfGPW4
	naBw==
X-Gm-Gg: AY/fxX7TEgphpX5axu1fxPFcLLNKhYJNgmiWKej9dwVq41jys3DM0rBOAMqqljwj2X+
	VBlUC8jTBOJn3foVBAzoHE6V4AAJxVHCtMLO6LapHGiX7ZEg/UwXRji7iQxbM2rEYNbh+IArxo9
	Jj0zY1yIhvrAZpvz97ExpZvRp0dPEp10wDGigK1F0UKH2n2akakvysZni6HPFicD3yhZccHY3Rb
	lOsj78AMtKsBllH0bwO5KNTe8CzVmtWmqGn4+LOgPydZ8eOCxVEUejXOKiAHGNlYsqEB7j9Q1aa
	1W7RJA3aT9z9OG4Q8B7bc8qAtSo2teWct/x3IkFFninaCdCcsDeZT0tsLXy/lpj1T1NuOLiR7TE
	0Vs38VuL+3jL2y0N35QOi0GMtvA==
X-Received: by 2002:ac8:5781:0:b0:4f1:b7a8:679c with SMTP id d75a77b69052e-4f4abd9e68cmr649277251cf.63.1767358146577;
        Fri, 02 Jan 2026 04:49:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEbV5vWoAdJFjT40fh9m7OPDlEL8i6bYC8PZP+0GOYhR/fbRhbEkDnsbVfPIfQHknfCM/BZA==
X-Received: by 2002:ac8:5781:0:b0:4f1:b7a8:679c with SMTP id d75a77b69052e-4f4abd9e68cmr649277031cf.63.1767358146192;
        Fri, 02 Jan 2026 04:49:06 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa46c0sm84804526f8f.34.2026.01.02.04.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:05 -0800 (PST)
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
Subject: [PATCH 1/3] PCI: mvebu: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:01 +0100
Message-ID: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=mJwqXFaTtAuCHQy2FvWbBjeBAAII8gsU4tM0L71n+OA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV768w+9m0LylLR2oOecaNnHLaCLt8MzrFPJiF
 g4VrzeYvquJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+vAAKCRDBN2bmhouD
 1zafEACBlmhts5g2H8mb5E53KIC6QygvGQ04AnFOSCxB87xQPYgIrS/LwAV546fMLYetfx3a24m
 WpW3wy2tC2rkhs534KHv28oHdQBjgsO1goiYibvwbVojEHKnh7JDO+iGGM0HvmJNBhu0+2bHK8a
 1gKHZDRe8wDzDEPRaHuqE60BZVzDx73LP9Qhc8bHCF5bHsJBi8b2i2TmMVvOnThOAni+qbOj880
 +AtHOgRJsRIbbNtJve/h4YpQDf3PFfEoq3X/jMRK+2h/56jrdegcT7lOxWGogvoUZNgYWabwDM7
 d5WNJ3F11NfgAiSTfcoyBWXD8CiOBCLazxnk4aaeDN9JSd/6lEF8DsCaWPsjZTm+mwHKmsBA6Kx
 5vCrwYvNscWaeAwP58XoYDgVHBJbraCb352GxNvUGd7QeiYlmQKCkcbLRYSVhFox8sKM5adN04m
 vH2Chfn7oGEW1+CSnjuCSq20LbvEPZ3mBf+kjUUhhYkH+tlMvZ/xZyubNVShVgZERmNy/WkLwhX
 JP6UmdBsauAIg41Kl0Ul2DkShHP4q3P/03t6fwkzS3NOaux+diVe8MAoZWh+cw8T3kvhRBnduyh
 OhZFLmHp5V0m+BU/DrceWt3/eEhz7/Hs2y5CB/85mKAU7ThX/MgEhFwTi8zB97667nMLA4jTtqm Otj8IS7CICNtzGA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=6957bec3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r4sBWMy-QYfdzbUQJWcA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: EVR4dtoNw51SLtoq1Pm00oSc9XyBXRmy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfXzB24cOP71T8X
 L5Zzgxvyw8zc/VZTpJapHMhA3YX3qo7Z7l0BLct2pMJJm8T1h/MysQQmcWI+QDihBWjeHs2vpG6
 TC9w5cPtLBSW7HietU75ZJMt9AG4W6FA1LN27oTg6mnhdnJew+8jfWaZPmSEj7Qnj9PJ4P+RCAj
 aHb1wgzSilxR7BbjDOa05cBrNp+BYt7Ra0BlpmTAM3YxsAoArGYfpePDWy0/I7+ahOJBIbKRGo9
 ZlZcWdi4Wjc29KhW4mPCbjxjOaA87cgA+Zj+2irG/9VZM2qWgn9vqjukO58CM1lOW/a4+zyetIy
 QAoqVL8+phvQyYKcV/un4v79a5rOeqSPWgZU3zxStBHEhEdF3o3I6vD7F7AJDGQQOlzDHWVK3ax
 qKxkGFCGMiwgwIZn7WEuB9pd9o3keEAAYLO15YzVWmTr6MUytzP8y21zVcbeUOFdilgbRi0JkIS
 1nSsmQFGdNrE1Rtfm7w==
X-Proofpoint-GUID: EVR4dtoNw51SLtoq1Pm00oSc9XyBXRmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044907_954571_959CF526 
X-CRM114-Status: GOOD (  18.57  )
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


