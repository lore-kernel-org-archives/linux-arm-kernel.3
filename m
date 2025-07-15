Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC8CC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 08:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29osqCa8Dk0skNiIogmNa+iuqm6tKwJ5AW+ZWWEuekQ=; b=e3/QRIMxlXAnGe43JEA+UQ2VSA
	+5KgF2p0I8vcRf0FJ6XK7UtZl1M9Vej15/Lviilj0mMJ8cxy60T7Ato4FXJl0gIAg2KS8e9M7GH8k
	B7yYIB+Npfnw72Y19RatNbKk5fE9XOlxPK+Qrnxu/qOhjFTYrU74zhWmODGG0U/6SlZ3OGBWqPtuh
	pBR4HjLFfJ9tNeYF6yBHEvgPM/vTtmfzqye9RVCD07ZhV0+CdHV5P+dzBRYB/GZ7NaIaZFhDEgmGa
	+St1jekQUYFpQ72+HJSR8EQxvM3TuEvGS5O6mrbRBhDg+V17fbWw16ePlM+No16oB6bjwgB51EpDS
	Qd2oc5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubajR-00000004SkC-2dMe;
	Tue, 15 Jul 2025 08:09:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaaJ-00000004Qn3-3eNE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:00:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F6QuSp018413
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 08:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29osqCa8Dk0skNiIogmNa+iuqm6tKwJ5AW+ZWWEuekQ=; b=bWmZGFIFA6nB798K
	UoTaUZCPWOYAAIUoBB1pOdT8mI/IKXyCaq13eStFS/YSvJTfa6a4s9FuSMlxdlqc
	xSh/iFWmIzOLfk0kApSSy7BXPIjzOe2/Un3Si/McSi7l08zDwq6P1+6NvaSwKImo
	aFe1kFMwk4OiFN4EctFIxeXi9pSMMIxyXv/qt98xSeR+xZTuP9TNdhHmG9fQbazw
	tT8C96bPmUdB7HHnfXbFtS48AIwiKjmIPj03yMRwrWQHmXcpsi4iT0bhDBvyMvwK
	hp1xoYtQghsLpKqWsTtDYN8MNcotEuopEztMWKs8lflqBco1J0KQUvGiEeXqquc+
	DBSItw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37yfe6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 08:00:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab69fff4deso31384471cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 01:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566418; x=1753171218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29osqCa8Dk0skNiIogmNa+iuqm6tKwJ5AW+ZWWEuekQ=;
        b=mDHVEB6llzKEBKjrbIJknNvwgj1RCTm7LND3vPKYt+wYWF+hdUy0v13BKc2BDNGir1
         AAZ9fGCJ0YmnhxbkHML5F6iGkKlUJ6rOz+0Rjqr2eBK7sZMlM4DO7IhmRA8WwipNSI87
         V7EEr3ud64WJMlTBY/EWUlAaSftCxim1eh13QB8Jqlob2WQ98M0AbQSi9TM/gJv7gJ6q
         Vf4EYjb4xWiTJoSykQETMPg+XHcu6t8+vjn1onUlmlFSqcErNSyYKVNa0s8m6tSZfX/E
         QZW6fbDmncGV4S+mS8ouL+fIFlIL+7sRdfH+CWxYEF4fYvUZMDOez8Xb6ySuQGrrx9c6
         hQKw==
X-Forwarded-Encrypted: i=1; AJvYcCXwo361o64wcgjV57OjH+SPgugMHwtdV/lNEdZUKck1YGU1hhwPM9lQj2uvE0+hYJktBsJsWh86z5De9tbg66L/@lists.infradead.org
X-Gm-Message-State: AOJu0YxoBL87O1FdNs9HFYMAWjpp/7lLSElypnuhYZXqhS8GS+G8zm9M
	0NSHUmMPekLlYAC3E+rzPSj12yvLvfkSUrEkeRQFEhpp0kz/oJ92dgYqSs8CS1NlEc4d5XUhgbi
	SuFHTo0tGaMXgTm5iBoJgZnGZIbIUnp4BM6CzkGuPJjmidzL8fGcc27SSRjY1o7H8VJ/LazaLZ2
	pyRA==
X-Gm-Gg: ASbGncu/iCwJggBpazqtkUaHHiDY43/geHASfmTrCf9j3wZ3ql0emHwlQJ57Cj/G3y1
	lvHpGtgdwvZZJ2ofVV/4/z2sRiBBqOr6GJpwkPNJ13H+EfZCPJgSpp45bcxBCSEMGt9F/7qecIS
	7roZ/ZjbUuTS9Z4qWb/XSmNPDyTK2LG8sha3XAk9t3cdlbWqFSVgEUaINp6QARJz6fY69d2Beeg
	9f2M1eUBGktgJn+Rz2W6+wqNC4vy/PuJLQVSzc8xyo9PaL1OJEuZIQqKPBcdZs8riIbJnbLs8XZ
	6RJjlFRzV9xhtGdobeM5g9d4DxQQcs3TR0AHfiTjT65B31UTl6nc2GUT3f1mAMxKIhD0Fw==
X-Received: by 2002:a05:622a:18a4:b0:4ab:5f47:da5b with SMTP id d75a77b69052e-4ab5f47de9cmr131465981cf.8.1752566417956;
        Tue, 15 Jul 2025 01:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzxAuZjlIsaIQYm8rUmtgg6lfPzyFqgOdBUY48IJRWVOd/+6pHo+ureD7f0u+Ea8Kb36AIOg==
X-Received: by 2002:a05:622a:18a4:b0:4ab:5f47:da5b with SMTP id d75a77b69052e-4ab5f47de9cmr131465031cf.8.1752566417355;
        Tue, 15 Jul 2025 01:00:17 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.140.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab3f1c9a2csm37792461cf.67.2025.07.15.01.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:00:16 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 13:29:18 +0530
Subject: [PATCH v5 1/4] PCI/ERR: Add support for resetting the Root Ports
 in a platform specific way
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-pci-port-reset-v5-1-26a5d278db40@oss.qualcomm.com>
References: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
In-Reply-To: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Niklas Cassel <cassel@kernel.org>,
        Wilfred Mallawa <wilfred.mallawa@wdc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2880;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=r0nAnKYpMV4ShS/A4tyT1tuVoZHwLxeeuNZjL60OQmQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBodgqBv1NxanE9ktG92zwVOS86zmTwrgRknu0BG
 EdgynZglOeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHYKgQAKCRBVnxHm/pHO
 9eGbB/9qWuKdG71Bkc05mHOvA3YhLiqRtMkImAXOhrGbspJBs2gazpPTUmbvvZugat5RiXiSKLl
 VnsanmUx9+DFNfHa/SpLum7wxWPkU3VMkcPHjLFBjRAMmGNrmfozcQBaQdfaI3zRwFG8YE1knma
 SoN8FMSVwaUXywfXWqQl8BC1zp1KjE1L/4Qcw1WdgOjylOYbCwYA863NFMBmoD72Spc8MCNVcQT
 H4c0QyA2IHkKCDLAB4Jgow/7A63z10vHSeCM4EwUwpGUU7gMHTJSjSZPLsBrP83G/8sA3qxt3m7
 wGzCBJF/tOljFQFAZpwnRRToBRyLWeULjVeiU54/GsfAvg+T
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3MiBTYWx0ZWRfXykqzwFHc2l5C
 Q7ZZu6VP6V8Nd/q/M67YPwSgyo6twSfFf67IxKH3QBNrL7dB8UqJH10k6CIqSWEMGl22wFujvy6
 SCPuU4wPDuC+mU62tJJj36E2XgCSqoDyveyVyOJNYAZy+eu+3PD9syeJDblyyA18mwduqGk6QQo
 x4RPCpOUeghbpK0p4ucSzA+rEf7hstbqq4cTYI5y7/m92j2xdZBL6gjcnQDB85OnffPB5FIngqD
 RkHBVvVVRe35f2/OuoERutv/SfdEaXePIiNkvtPKCE6p0kX0hl4wtlBWFDNNM7A8zqGi153HDOm
 WykJY4glAK5NSE9/MzbWld66/ADunuoxLWS0vp6KlEXOKDiQdSwttZLKwSCZxiC8Dsv2KDZDcxW
 QV4DYmutDU1iHKrWLcof0ahpitGJWFcprVbjrWYDAoqeNQLBbtq4a6LXHPcKrCyW9vrpI+qg
X-Proofpoint-GUID: nAhP01XuW8TyeOdzzmk6FWwQgEaaZlsA
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68760a92 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=HOswsyiB/7FCIMMjk980kA==:17
 a=lJ8DZ0MjVbnDIa4D:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OSb3l-ukYRaLxMRXSjIA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: nAhP01XuW8TyeOdzzmk6FWwQgEaaZlsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_010020_035280_8CE13D8D 
X-CRM114-Status: GOOD (  19.18  )
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

From: Manivannan Sadhasivam <mani@kernel.org>

Some host bridge devices require resetting the Root Ports in a platform
specific way to recover them from error conditions such as Fatal AER
errors, Link Down etc... So introduce pci_host_bridge::reset_root_port
callback and call it from pcibios_reset_secondary_bus() if available.

The 'reset_root_port' callback is responsible for resetting the given Root
Port referenced by the 'pci_dev' pointer in a platform specific way and
bring it back to the working state if possible. If any error occurs during
the reset operation, relevant errno should be returned.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pci.c      | 12 ++++++++++++
 drivers/pci/pcie/err.c |  5 -----
 include/linux/pci.h    |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e9448d55113bdfd2263d8e2f6b3ec802f56b712e..82c56fbd58ca4aaafac4f1638e7e0225c07958cb 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4964,7 +4964,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
 
 void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	int ret;
+
+	if (host->reset_root_port) {
+		ret = host->reset_root_port(host, dev);
+		if (ret)
+			pci_err(dev, "Failed to reset Root Port: %d\n", ret);
+
+		return;
+	}
+
 	pci_reset_secondary_bus(dev);
+
 }
 
 /**
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	}
 
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
-		/*
-		 * TODO: Should call platform-specific
-		 * functions to reset slot before calling
-		 * drivers' slot_reset callbacks?
-		 */
 		status = PCI_ERS_RESULT_RECOVERED;
 		pci_dbg(bridge, "broadcast slot_reset message\n");
 		pci_walk_bridge(bridge, report_slot_reset, &status);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 05e68f35f39238f8b9ce08df97b384d1c1e89bbe..e7c118a961910a307ec365f17b8fe4f2585267e8 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -599,6 +599,7 @@ struct pci_host_bridge {
 	void (*release_fn)(struct pci_host_bridge *);
 	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	int (*reset_root_port)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.45.2


