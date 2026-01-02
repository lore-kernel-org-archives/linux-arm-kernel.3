Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6157CFA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjTE26x03AwqvTslfagsJJeuVhEuY8F5fXF0GXew3f0=; b=QQ3zVX7HsrG6veb92d+WjrDo31
	/hhuqWTPmg/iUIsnouXvkaCq9GyzUwHsZRGg75NQU8GocP1pvGUlxUJH50lvvzIDBuaeDIzGwcF6A
	RiNNaN9CB26LqJIuKeRSIRXLxXrQ6V2ssqMg686gUiC8KI/x/vEDxAiF3/1hrA8+4E1eKMRUjIKC0
	4F1hrTByAq1hCYxMW0eRSc1HNdiJAuTTBY8tyBwjOKQHiLsEUPufs5/AMzpDIMTCOeBx0yOkDUOOK
	q/WRm7Z3dudtr2xl/FS6HJ0LzKHiQ2HV5w6obnpY0QqWDG9P0HoVzX7KqzEipjs5jUkkZhQcJP6Fg
	NaMs/5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeaf-00000008Dzc-21jM;
	Fri, 02 Jan 2026 12:49:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeab-00000008DwJ-3lqj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:49:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VwBW2310152
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vjTE26x03Aw
	qvTslfagsJJeuVhEuY8F5fXF0GXew3f0=; b=XV+wnMwoxr/Ib/ravOGomuSzEFp
	WmXMh99S6r4ygpXH7eTK24e/S6jbNbndZhPEoh4PLriJbBdFLNhX1tLpg3/FYTcy
	2f1MjjOxorxsh+sMYSm1BE9bdnpdOYp3vgftxs7xXkCF82u2/i6YqTiCyCd/DEWO
	QxWpt9jtlDMELcorRpPCWH4cAvqcyht5fb5MYWehixPFBmh3bgOZcAieG9nnHwx7
	Iden0TAe8ly+/vhtDlIqkLc6MXmpEpRwPFVawmwgIfXtaoZbaN0EXT0fYMwzezuA
	wl/hVRE2QFRNCfCr+fSPiRjMMzpsRRU2hHS4i/b7mSKZg+rshLtr/zdj6IQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bdsc9t1q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:49:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f35f31000cso165006721cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358148; x=1767962948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjTE26x03AwqvTslfagsJJeuVhEuY8F5fXF0GXew3f0=;
        b=Tw1uLNTW1TF/hPBb1UBNCyzez5phsus5+MzA3DsIlByQPF2up5a5A2HnTBpogxpkwh
         yKkgK+kPkVHR+7DkIYxarOzuXHgwj6EuPv6BAgpzg5qKu2Y4VgT4KNM93flaMs7L59w0
         YLVMwZ92okkM9a4LPHwgCwNqzQpfofN5NrYyVHB0yIGP8uOIb2ViiVnHr8Y7qbfaGcFF
         NHjdr303VMN8d6DJxbwbXFKE+l5xAuSy9aFKaZoF+q0jGwZY4wXlCLxo2zSMaO2aSGNi
         aKYQslYNo2Auu6uqfaHzBb8A15qelNHFy4WOejxmoDTMQFsqLr/w0BjDQxwSEbcaMPAW
         ROqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358148; x=1767962948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vjTE26x03AwqvTslfagsJJeuVhEuY8F5fXF0GXew3f0=;
        b=Z1n9mxh79YSyQMkEEBcGSenpRo+ZIQVP2iLO0W/T5f6ZuFynewv8BLMn6eRrEKe8a7
         Fksf6b749szAUImkNgPJmg8+R13CVFMPMbcETGLVzEKf/jmBvdBx1MA+4xWgvNJd6cLz
         h1W+8PgAtaDekZfY7UXhXNb3ugvA/VjHE9xIsvOhvWwhAWyi1rL0Eb33dcj0FQMBwIOW
         cqZT4r8X8eT04OghgO5rR0RwRVgRUOtgYuCzCTzOrhzmVs+CmluVUCdF2DP+4eKRM8Zm
         BWFnXPjfSirFOJHNb2cDqVdigJu/0srDYveHSye6yh3mS27PIheQ9otyZG4qhmXNzxpb
         vNPg==
X-Forwarded-Encrypted: i=1; AJvYcCWQtc60MN387ahqbW1u0H64O6u5V+8Cp2aMZ5w93VFUv9L6xXr5+7idh7XUBQiiDYSCLvwlIVaWZtd59osvDPvS@lists.infradead.org
X-Gm-Message-State: AOJu0YyKwS0uiSLU7fWmWato1xoR2AGBRUfzXqr9AWmT1pszwBEXsl2n
	x6qOdGs9Yt756Ra0x4eSItwhyHl7FT4rfgx3dKETh6vxkqH0FKFJNP8SWyMgaFmTUaDZdavws7g
	WS0noJp7GK3uEs6R6RgyP0H+KJ2gMMRiB3p5J9vhD9b/i32lSHXwDUylsulBO5e1uNJNBRo2FUb
	F3/jIk6R0GgA==
X-Gm-Gg: AY/fxX7SaMnlW/hzUvhUoqh35kG4Lh8XgoeA+zxGCypx9iI5m5lq9tZ5Sk+2pgRSE/O
	ocIJKUooGdLr/W31B83zcJRGw+C89M2RCicmUKPKH3OvG8jASBTfOKQ4zaDZnjqBde5TpJlVctr
	mROs1+2C1p6+zzH3IMa/B0RXaqIS/cJo0xs61Et6k2wOw7gAio5lP40TOkgv+2EbpOa1pIWa0Hn
	l+e/eU4qfAnVimzrJc8X2Gp7+ashhP63PWUkhRjAGF8+dghTWYEE6QgF3i3+L6J+/jG2EEcKGwV
	sUXqcplIqqUSlIJuxsYmaeotfTh6sh9uD+Ya1o1BYJKQG7aCQxAcpV7KmfE+13esP44G+fI6scB
	057dks2MrA3WSk8Hx+Ng/cn+Elw==
X-Received: by 2002:ac8:6044:0:b0:4f4:c150:7d1c with SMTP id d75a77b69052e-4f4c3ebfe26mr430878081cf.53.1767358148090;
        Fri, 02 Jan 2026 04:49:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKBazsH5X4TVMYBORJZLb3en+SDf+yLtdGDzkSzGie0Q2NHJUzyJIxfJhQBa1t41nJeqUE+g==
X-Received: by 2002:ac8:6044:0:b0:4f4:c150:7d1c with SMTP id d75a77b69052e-4f4c3ebfe26mr430877881cf.53.1767358147674;
        Fri, 02 Jan 2026 04:49:07 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa46c0sm84804526f8f.34.2026.01.02.04.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:07 -0800 (PST)
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
Subject: [PATCH 2/3] PCI: pnv_php: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:02 +0100
Message-ID: <20260102124900.64528-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EP/MtQj5p6JL4xc2pd12GnTgEgj4Ywj3gHAk3b10BJ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV769WyVeXeUs9nZiznyQRex29feWr3vh6I2J+
 GAlypK/zzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+vQAKCRDBN2bmhouD
 1+ASD/9Bilw5E8KjrZdsekRLJEtn10r+Dy1sg1lurcuQ2ExEnV00xVAoiFkxiEPWLrh7WFhTzH6
 WIjL6h2BMk+/H4YjLx6Nwxdrv9TwjVjEeQdQ9GYU/3r2o2cwzEqxckEFVsXSXdga+h52imdboSI
 oCslonQk+20MxS7q8+1HYoG2zQIWR1EEzJ/7yyVwrLgxfzTssevfdMvicfwKjORPE/4wPdj79Er
 LR6EdBX5uyOla66gb/LjgLG6KyWSwIyQcNUlBCE20Ocdc2kAOrhYDlc8gWW/HGmg8o64xU8IFdP
 er8fJE+g6z7ylyIle9/xo3P6IrtdFQaEItU38JUfy8hqAGmzlSOD5ZHD0d7lQpRC+4cjJa0rnQa
 0t1LLkd+CLxXGI5dXQLNsFlsm7i80KjH8B65D75/JOyhulAiIAFKyNejTeVNBdjL3pplCfbguVb
 iTHZXyhdwuMBeVPwSk5FEZu8mxf6qiwy7CioBM553EJxRYvctbzyCy3bAJciImHywpGIGS64BH1
 M3gAtEr5vTRlywvdHCOeduhmY4vkev6aSpX8nm3bpjoyp6iSQCSaxxqPM1xkeG6hRIt6MG+Grz/
 Hil8lnwGcMH2xCN4qaRzjqwA5xjoMWcNV5PKd3d94YVcG97D7/jz7zEtYYOkiWLFK+QGn1vyURc K89KC2DkQR4aVcQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DD7sA3KG--bT_emf5lKJpHtDCBmu6ebB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX7dh6NG6FQTQs
 4dO2YkrBtd9qc0/vjVTmcVJTRYgmrBewEh2bZLnT50CspLe+k4ve/fsdCTOUStbJwVOEksIxGja
 KMZoDS6GkW/ARrtIg7obaKz3qQOurVVeKLiLyJaIvynh+npgHxxfUqYEp0rXTZ0aAMM2cbogTXk
 uwT5Qw3Bp4dWVqJQweEcXT9Y99bS+6BJCoMIMPFKdcHI5jIoLjJBVY17QV65v4tu5HEr/NBvClY
 Ksj9o77M2oy7IGSZEr3tb88CWBQs09ehBtGb97nUv+rmZQ+sBuZGX6xIZNcZaaIgNnpkUIonLsn
 3dOH9S6LVOkr5En+QxVlbqYkV93YQMlzVKutGIQ2d/kTZLFsF6Tzb8X2vQuZltRW2BzZ+Dsp/rT
 3o7ZiruaRmuBTfmGoHkJd2eL22KnrrmRQzqXckYE3S/KoTiQQU7bH3B4ExVP3rv24ix5d6pvRAU
 uC2qFg00FdZ1pNglR/A==
X-Proofpoint-GUID: DD7sA3KG--bT_emf5lKJpHtDCBmu6ebB
X-Authority-Analysis: v=2.4 cv=Hq972kTS c=1 sm=1 tr=0 ts=6957bec5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WsY6cfW8n5MRYgmDw1UA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044909_955472_727EAC9F 
X-CRM114-Status: GOOD (  15.68  )
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
 drivers/pci/hotplug/pnv_php.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index c5345bff9a55..0d80bee284e0 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -215,24 +215,19 @@ static void pnv_php_reverse_nodes(struct device_node *parent)
 static int pnv_php_populate_changeset(struct of_changeset *ocs,
 				      struct device_node *dn)
 {
-	struct device_node *child;
-	int ret = 0;
+	int ret;
 
-	for_each_child_of_node(dn, child) {
+	for_each_child_of_node_scoped(dn, child) {
 		ret = of_changeset_attach_node(ocs, child);
-		if (ret) {
-			of_node_put(child);
-			break;
-		}
+		if (ret)
+			return ret;
 
 		ret = pnv_php_populate_changeset(ocs, child);
-		if (ret) {
-			of_node_put(child);
-			break;
-		}
+		if (ret)
+			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static void *pnv_php_add_one_pdn(struct device_node *dn, void *data)
-- 
2.51.0


