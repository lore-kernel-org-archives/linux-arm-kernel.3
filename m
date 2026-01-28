Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3F5D25B47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urO8LEJ+6lWbFda5otpiYQIaXeiVcmn7HEJcXHUHVl8=; b=WcD5rJFLPvJ9i239cUsPE+2Haz
	c/uwwKEbzW5X6hb4+dpfpDE41QDEZd7C3zVI5C4EKbFCUlEsiVvCcMdR5osdblDRoO2uO7PDzjJW3
	/iEHFfx3ARP0aaXivXc12acTJG8yjDYTQWurq7rq25/w6xeSI5hqwU5yHOnhgFc5XdFL0mPj3+bid
	PJf1yA819h+lP68tgC3ch3192n/oLo4A111ft4TX2KRBmfwxbSZilY5LqW0CPjfyOWIoqoLWmQ0LW
	TsA00Fhy1JNLP3VUOuMGzX2sIiELpb7IZ46eDA4G4rS23yyThgyRuvdiOqpRBEQmzIQ1EpV2UxXJE
	LagEzeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3v0-0000000FwcO-1INZ;
	Wed, 28 Jan 2026 11:41:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3uv-0000000FwaD-1HUp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:41:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92eK9042112
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 11:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urO8LEJ+6lWbFda5otpiYQIaXeiVcmn7HEJcXHUHVl8=; b=DOHGwn/QFPjMk8jU
	hF87pbT0p0Ex16Zw2Pj/EjDdjcHyhS88mh6mjz6Hpk/fyp/3MEyrGTSKvoYy6Rdg
	+5ezjOCItb1se5vIBbIunc0oQxPfSVluS3NP7fpofgwciBZHFp6+cRI7cbNUXFSw
	f9lYiqP/s3fbLbM892BaTnfxsE0aS7D17A7QSTM+E0wKS1yogS/xyBBaC9FsiVXp
	k1U0W173Dgrf1WLCPeiN8lmO+aJkzojt6AJnJPprS7hEWfszSDyp5qftkk3rZzu9
	JQ1pePUFBuHKQ7m7pLmkEFyLKnvSKRbvKI1Umo5998eHFo3pz5XLdl8tQ2AFw6lI
	EaxLEQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355tv9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 11:41:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c613929d317so3848256a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 03:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769600460; x=1770205260; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urO8LEJ+6lWbFda5otpiYQIaXeiVcmn7HEJcXHUHVl8=;
        b=bYQ14gtEWt6rZweHN2xhOqSbn0IjHRM+c6h1P+mVS9BJQ4ucvUg7/zbTHiAZ0b01LR
         vI/7fk10kVM9HTzcFx/pxy5JqJBWutZV1quj6VB15fdx42pjlhMC77JxzV1fWJXdSigS
         XF0CaQiozyNNtJqmCdnxk/DRqHS8hpgk6symj3+QII+NctMX/sddyn1HGha/ab9ibWRt
         MvR/Eo+VHbU/WcpNJK1lYt6RaI1ob5+xda6Z5SItJUAK8jMLJ0ISL0bEVI8EWZVQksJd
         VW9IZLhRgiluC5qmFhXhCKdLz7H0Qgy5Boc/s9s3PknW0wCTsgWzEFFJh7J7KjiG6bPN
         +cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600460; x=1770205260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=urO8LEJ+6lWbFda5otpiYQIaXeiVcmn7HEJcXHUHVl8=;
        b=mueSWncf9XdP96Yvmwj6nidnfkmT5xCSOEPK0je9XVWVqRM/y6vk2Q+Rxe8iU9pNg2
         j+oPyKofH5Wdi5/WOL+l2ub4ESGgY3qd80417CYVHFPwgHK0afbTkC9BXXUfURDPkGcy
         kC9JujUb/jDtsRpptVRNlToB8GbCKepSrMNHi4WUULv9o0/ltvJxfwCClr8SP9LkVz4p
         gmzoTPFxRoiezQ4KJg+kpkyjB5qKs3rDknkGDIRxFlqKYcb0eicqSvh0BatJwIP1OrgK
         Zx5kb6O1cRTNJU9HRM8+1LCsXPrr+2PQilsoc1wmvHldvatOLfVg6Vlyfxo4sJOBtx5/
         fP3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXB2U9eRrP9dm0ECMxXPx0jzxhdctTjl38n9WypmX83DMfotxEtCHrfQ5DyylwW9prrPu38Q8skyzfGII/qmbuq@lists.infradead.org
X-Gm-Message-State: AOJu0YygZuU21LmczpfQIe1UjE1TSRRR5Kglw4/rbzTi2F7bsc9Dul6K
	hSXWrr+4/y7szNgw82uZsGYkvx0E8DKKdmI8dTZtK4aho9l8CONx61E+tbyDQxPwLzfaBfpdwCb
	ngRmZa05og2Oi8Dcl4f7gw4s51GJi+6V4k7RctYmyHsJPczCAfrOsX1xSmacOfb+uXGxMVeCcsE
	5XZw==
X-Gm-Gg: AZuq6aKVmpLn/UpWpoCzUMJwetV/op7//EciLQONNk50nZZF/FTy+Xhe8xHbYcEGEoI
	qlWgr1bWRTrUl+brJCt+t8huQKfbhM1nr51RjaHIcYaiBh1RDn7kUPojmeVrhKuadHdE/z4T6xs
	Ux0zz58AHWHvKThwDNIcoAYI83cQEkR24aLlQlBx81lITM/Ab3Udt8yVvPR6fhDw4ze9azw5Ql6
	jx4j51egcdK60y0PXKoIdopZ/LvOR2am9xrZDzEYf9Z0DhM9Fu3l8VwezdMmuxLf9l9CG+JC5Mr
	niuenbHVEYMTvgMOMBNsWKKSJJlNhReO7gUe2Kz9zzYH93vVOENOfDeWcgxVeEs4mNSG+R3yJi1
	72LIhCxP6A+O34jKTiNezwhEO0pU5dXJrF+oT6G+HeYbK
X-Received: by 2002:a05:6a21:3994:b0:366:58cc:b74b with SMTP id adf61e73a8af0-38ec62dddedmr4815189637.21.1769600460178;
        Wed, 28 Jan 2026 03:41:00 -0800 (PST)
X-Received: by 2002:a05:6a21:3994:b0:366:58cc:b74b with SMTP id adf61e73a8af0-38ec62dddedmr4815164637.21.1769600459666;
        Wed, 28 Jan 2026 03:40:59 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f41d0sm2010678a12.27.2026.01.28.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:40:59 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 17:10:42 +0530
Subject: [PATCH 2/3] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-d3cold-v1-2-dd8f3f0ce824@oss.qualcomm.com>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
In-Reply-To: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769600446; l=2261;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=tgb5v2thYMg2oKua2S+Z2ljwfsLGXMrEPMdeemrkAxE=;
 b=vnbzCXVVkARXQGBcFxA9YhFcF0xIISi15hXTOsChmfp1rgaf88nf8kLbtDSsQsqbUBHTo201x
 MAszfW1+cyUDccRfVH8MOg3PN4VstoHYLuv5Esd/MVjjNqy2Eo6ZwoW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=6979f5cc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=S6-w4pPrR9TiqxbCLhkA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Sj2ZEkUoJoRbN3BXWGUYd0mCHlVlGV7G
X-Proofpoint-GUID: Sj2ZEkUoJoRbN3BXWGUYd0mCHlVlGV7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NSBTYWx0ZWRfX3pu3e17hNgEm
 HbBCvh4QpYML2l0B7trnel1PytSe0SZXcKtIyuqffuLbX1wAcT1qgy9ETnb3DkjHxH7jZ9bflpG
 EbmoDBotdeCn4PGo8EPlZIwioIg5rbCORGHAeKEioFZaDgfJci9RKWm6UEbqGmfkpKy9+DAo4nm
 yX/+SS8KLtCUk2o6oHr+8k9C6rI3ea9w2svZaMpwPNsGjQjtPuuSXpGA4ABP6DsQM5zuK/szMUj
 hmaITB8ZBWsAN2MTh3XKXPJFjMAA4vZnJeEOfqj8A8fCoqrtl7OtQgritkTxUJQwRIjmudoY7FI
 CQc4ZnIzqtuEHropmAbRM0W5zh0pR8CVtMmgLDFP87RF++Iq2mFbzRdhU/p0ulsNHnHM8a2J2wb
 FiQ9hmle9in6d5rk9AjKJBdyqPy0yKAMSMRp9oghOdquSIw0iBkwdfDvrqAj6EaSv0MUffY/5M+
 zlbVJh5HFb0vvZogw+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_034101_368853_5F8ACEF1 
X-CRM114-Status: GOOD (  19.29  )
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

Previously, the driver skipped putting the link into L2/device state in
D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
low resume latency and may not tolerate deeper power states. However, such
devices typically remain in D0 and are already covered by the new helper's
requirement that all endpoints be in D3hot before the host bridge may
enter D3cold.

So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
the shared pci_host_common_can_enter_d3cold() helper to decide whether the
DesignWare host bridge can safely transition to D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 7 +------
 drivers/pci/controller/dwc/pcie-designware.h      | 1 +
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 372207c33a857b4c98572bb1e9b61fa0080bc871..2c8056761addf7febc1b0e06ddf8ba4dd4ad1684 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1157,15 +1157,10 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 
 int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 {
-	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
 	int ret;
 
-	/*
-	 * If L1SS is supported, then do not put the link into L2 as some
-	 * devices such as NVMe expect low resume latency.
-	 */
-	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
+	if (!pci_host_common_can_enter_d3cold(pci->pp.bridge))
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 31685951a080456b8834aab2bf79a36c78f46639..18d8f7d5d23088b2fa177e84a21d900c98850fcd 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -26,6 +26,7 @@
 #include <linux/pci-epc.h>
 #include <linux/pci-epf.h>
 
+#include "../pci-host-common.h"
 #include "../../pci.h"
 
 /* DWC PCIe IP-core versions (native support since v4.70a) */

-- 
2.34.1


