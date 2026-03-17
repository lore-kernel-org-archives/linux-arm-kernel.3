Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA04FD876C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wClwdHi//EKovApGGp/o1/cMKxisBXL2sxG8w7zO7Fo=; b=wPxKbL3JRMLcDQ6bu2UQoH7NrL
	QslrHcNySlygqHCtJ2Ui0LrHm8R5CWfuw2YCySo3wfasLOeX3PWRznutAT4mGE0tj1QpmhDNNzLva
	r3zX91hB/8eDWPveKssNzNDhxZWWDkqYAjc0TmBdsHvokEH2ssiGpFT7WZQMWuUgvUexOA1JLrqYk
	koy1aLSI3O7o/am6dDfu5oGtHFTra5Kvcq7KBlN/WWcUedBew9WVfq9fBm5c3h1Bo48+r2tRkr6mw
	X8v+TIA+SLhsmdy1Q5j0YEikmLwfYRflbfNlszvJLg2rpO24JIWqyBiKmmPAj1uWEPw4dby3ucJiB
	GfQyRTZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYJ-00000006R3k-3mGS;
	Tue, 17 Mar 2026 13:33:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYE-00000006R0m-2OeL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 13:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wClwdHi//EKovApGGp/o1/cMKxisBXL2sxG8w7zO7Fo=; b=GztKER8vJwn/eQm0crOB2QtnRS
	08jbhdhsRuLUPHx5ljxiuCLM34uQm4MIVq6U542gzK4E9L/F0EqmNYymKiHCLV/RqJ/DZTERqEur4
	WAO91q4zrU9UiG6J5tkwads8fV6fBWKQxr0XJqrSwj0yXNcc/746Wc9T+T+bcoWDyQ1YU+VGI5ss5
	Oqo+q8lwNreyDoC2XkU7JA6TBekQTV8aBwCsxj4TMym+sKhUcWCg4PQTzMYfvXSsRKJ6fZ+sdqQtK
	BrzLRg7h72RXkuZE/MEqetdtFiKSI+AKqLXPRtJ4z3j5XM6fpRxe0CvUqv53yyfln7AK9qPRBFtGY
	xz9S7NVg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYA-000000095tW-2vCZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:33:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7PTl33295277
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 13:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wClwdHi//EK
	ovApGGp/o1/cMKxisBXL2sxG8w7zO7Fo=; b=WviHE7c47v4b8vtDxvJ8wLNIoZF
	wDW5J0+PHQkkFtKsjRWL3zkN7SZtLJ6uZGuM1pjHLf3+EQbVbopONeHZHLTeUtsW
	ypqItiR0/MKI4R2RNqxreyLF/+GuAYYXjBxFsHE8kuPCyBJ1tuKJpheINGAwEF4r
	5vKMn40mnMB2FpSfLO3eFPO0H5cBGJbnvf3N72eXOzQshVmWE0VGoCZknvu6D2ON
	eyqUvSl1Gx8wnL186Cueb/cKbzRTcN9GDK5DPo0+9whQFGXfNlmvg7z95qzQdYdW
	VBUM341PVCfGFAf7vc6iOc3Lu7MP7uExqa1xeQxE9VTuok1K3Q7+2fz+hbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy470u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 13:33:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd827a356aso437986785a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 06:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773754413; x=1774359213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wClwdHi//EKovApGGp/o1/cMKxisBXL2sxG8w7zO7Fo=;
        b=AwqIEEH22fev/fPh6XZmSiVSvjA6q2t/H0x8y0EXrp0NvMp3ChLUmSe0BzqwhbmCvK
         7QSxkI+l7J9llhD1haDsqP3W4Q/7EmPIhTZ1JEdFzlye/+eKIrbJYFu+UldCzqdD9VA0
         LEeEjdjEsP9lk18ORFvOa//z70ucFWXL7EtV04qdHyWgCGq7hskn32Up7vNB7l0L9oo/
         y74cn1XdWWEUA678Pm/Ud53pZVjS63c7+2ro5XtVQN/y+KqdrSp6/r2jUhzbOa8d+4Hc
         b0fSe7SLBn6ByrF+XDfPOb3W4Tj1zcZOgLuA4w29LhElM7j2XXKOoTImj5XnOnQsW1ZR
         5FtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773754413; x=1774359213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wClwdHi//EKovApGGp/o1/cMKxisBXL2sxG8w7zO7Fo=;
        b=N3LJWXSl3U0Knp8SRJD3NrhoDdJ7d61ZLuf2XDTt/3uCRWrkDXl/XqtjdnGFSXKtju
         93tEhQd0JrZB7lrX3euUKRRf5ndH4eFvd80r8VoHY8Ya2N/UAovme8pZTY2EL8972KdC
         3Dy5RTDkROgFFg2gbIzKGv+HXfieMNVseXKySf1biNdFuRFEZ06CLq4/SQ9ACD8D8KHG
         Kpob8y+5l6rGPUxUCA85k9FFDWWDgXeVpHZtOIOpC7y74RRk6vfFOpxGgI7/mHG8os2U
         L5XuJgCMrCxrZjrpJDd0vKK9Lhi6XqC0zcgr18L4Xt+YhKtGmdQy9OqTDseEqtr9rZXV
         V2Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUDh2+bvPSnOX+ChqVGCavgFOm0vew0rrSciCTjNqzMKSGi/D+MJo04nrFhLOinLP1k4H2AuQjqqRhDKk2uNcww@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/z1xsStkHxMJi55NEuk9rzivAO9waWVcmQ5qRYHGZpwZTmd/i
	motvUs05rIKZRE7prS2C5ZZn72wRuMlNN4NC7bbJfjYi8UA6zPhqbd4tLAB9bfqsifv7iYqcwmG
	VZQ3aUGnFMO88c/4D+FKEkVlW7OCE4/FoU6sPaO4i2GXZhok/3ZPSZzfne97rsFDEsrNjHv5ZcW
	kuQQ==
X-Gm-Gg: ATEYQzx8UgFBjHtpSCJBElrpc+sAUOFayRlypn+fbPto4L9BD0i711dn6b4fJKhl5Yc
	CoSM0onZyuX6tgB5MH1tigmb012Alm262j7hws+Rf+ar5SCBSN9TpfgRqYeQGHlbGQyMd6h6O71
	ovc9QEzXK2AlCykZus4ewDjulkfAnDUI1RkNi2UVM9OdmbN1KcLE9q2LILbRB9ZWWvkN3SO2XvI
	5fqOLRYA0JV8OEbZoYlC3mxHYCssPhT7ZJc9NVpLOgndOaQH4ZjFF900ain/bW8mfxKxtLoAIA5
	ddjjLAQ7LsEbIqDcPXTVuaJmkbJ6/hiydEMroa5/7f+6LwNCJZZa2bMTHW3pfHE8ZjZOshVTu0Q
	J2KDthVvXpueNC0NSlPIwQTlf0Y5eG5GHfPW5
X-Received: by 2002:a05:620a:4415:b0:8cd:c239:12d6 with SMTP id af79cd13be357-8cdc2391360mr1562498885a.57.1773754412717;
        Tue, 17 Mar 2026 06:33:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4415:b0:8cd:c239:12d6 with SMTP id af79cd13be357-8cdc2391360mr1562493985a.57.1773754412127;
        Tue, 17 Mar 2026 06:33:32 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm51358613f8f.4.2026.03.17.06.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:33:31 -0700 (PDT)
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
Subject: [PATCH v2 2/4] PCI: mvebu: Keep child node refcnt for probe duration
Date: Tue, 17 Mar 2026 14:33:24 +0100
Message-ID: <20260317133322.266102-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260317133322.266102-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260317133322.266102-5-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ov8hIF8M1z6R9wDtFRkRAkC1i3judy0L71MjXuy8SHg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuVgjxjL35h3b9GCXehstfFtvOosrOCx8JxD2V
 bgJIU/Bh3aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablYIwAKCRDBN2bmhouD
 18tgEACBChVuehaRRjXAcrbdPTAAOq8QiLCEu7p6Pr7DdrcGnP96ZGP6kQRDGpNuLliO0VXS+yR
 jNn9sk6o+QZGrTtyvblDWjoNzUVg1prOXD/W8W7Bry9CbI7qYGRRiurn7iXRM/N1+jM9CBgkeuZ
 oyAMsnTFxY4y1mejiT6HJHuhMAGiE2DPMPCiW22FUkHEty5cDdGNg64oVzKdjjgFVIEOl52mVQe
 n+gfhwwGT0ymaijzo+fDLlae47j31+DioYBLirU3ZNoUCRfYShYjCSm7wVqq1G4HTEVJTTNHHzn
 xr8b7d4BK0GKo0W6IqD5DnL/lDkb0XcENij1mjljbeBd0A/E6HD1CpNpWdLyMuZjCCwpACAjTum
 cXCmlQpySC4nsMjGvAOhmfpQzDYR8XAW9R4fGlezSXROFZw33Eifcmd6yL6PWmh6KIqBeAJIh97
 3ydvTovr/VBY4XsM5Jv6WNkJOZ7OyvJTU0YklLgXfuPQHHSnzzseaAer8RfmKF83jNJeu4lVVwI
 hBYIbU7FlkxAX/l5h1h8upvYM3lB77DeBdfScFy2FYWFg3P6J43T0yEoNfikkNGYV0jBXmzsSfU
 3FRhfSjASj95faSgWbmZEahgvCFpZIBzGG+/C6vtU40xTJzA+Ye2HMwtKyBzV3s4sq8YGw0PaTm zYDaS/53uZbqY/w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b9582d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pABr9VbpVV2WwmlfmZwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExOSBTYWx0ZWRfX9f2GyvirQ34S
 kJFr28w4cn1vrRi5ictS7xw1cX6CKntITMesB6F4utEYHwhDxcw2nMzSftpi5qU691oTqqustC6
 U0dLyHddZ1dQzN6sW9/cXfFXkCb4Xw4/xZk7ldDKqcSHuWFMsYOV0LidPqTAClqZr2Kw0f5CEgz
 RmaEJxBhqnfF0zn+XwT4j1I1UpphMg/oFsRIHhC/+tJxeGl6512NDGNK0zy9xlU1S4Hdh2/4NH+
 18waGuMRjGoIe9W+A7zLFVAfiAA38xk+u56sEFnHOf3nqhwJqu9axaLZ/MuP9WefJ7VndWFJcFw
 4vG1w+iYLzoFnagUdRNW1OXnxXmMl9DYrU/sXm2xsbg7mLQHBshg3MZe+Ab4RZOKG/nNff99bHV
 7kCU2bksNDSDfROVtkz+7QKZNDzXgRjGDU/RTHDqMD6cPRLZD4u6jAIk/0k6if1aMhX9TRUZ5mu
 SltYwiM1etLd1OwmQ4g==
X-Proofpoint-ORIG-GUID: Fk3o4qEvhwc4o9Js9vRBE4-qZtaO0y9r
X-Proofpoint-GUID: Fk3o4qEvhwc4o9Js9vRBE4-qZtaO0y9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_133335_011410_BE96DCE5 
X-CRM114-Status: GOOD (  17.76  )
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

Driver in probe() first iterates over child device nodes, storing the OF
node pointer but does not take the reference to it for the remaining
part of the probe where it is used.

The pointer thus could become invalid if children OF nodes are being
removed from the Devicetree, e.g. by removing OF overlay, while the
probe is being executed.  That's is highly theoretical issue, thus it
does not look like bug with any effect.

Nevertheless, make the code logically correct, so acquire the OF node
refcnt for entire lifetime of the device, since the pointer is stored in
each port state container structure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch

Note: Not a fix, because practical impact is absolutely zero since
of_node_get is a noop.
---
 drivers/pci/controller/pci-mvebu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index 4d3c97b62fe0..7fb9c7393588 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1236,6 +1236,11 @@ static void mvebu_pcie_port_clk_put(void *data)
 	clk_put(port->clk);
 }
 
+static void mvebu_pcie_port_of_node_put(void *data)
+{
+	of_node_put(data);
+}
+
 static int mvebu_pcie_parse_port(struct mvebu_pcie *pcie,
 	struct mvebu_pcie_port *port, struct device_node *child)
 {
@@ -1482,7 +1487,11 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 		else if (ret == 0)
 			continue;
 
-		port->dn = child;
+		port->dn = of_node_get(child);
+		ret = devm_add_action_or_reset(dev, mvebu_pcie_port_of_node_put,
+					       child);
+		if (ret)
+			return ret;
 		i++;
 	}
 	pcie->nports = i;
-- 
2.51.0


