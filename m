Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C15105F79E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0kdu427wFNw0Z9mtsVA+BkAqm+HDIFpis4xRgnUsdPA=; b=S9nYe+LMi5l8Pv1GQdYzvYOUdy
	QmV+DASrlTWlkjIeQMwVs8o8ANlXuLImwrrNpq6aU1MQkJRii7lhZ8iqsIQq/xw60CbISRkFbzlmZ
	vVhrKJt3RUjw4ErE9mhsqItWsEkJ+fwb8TCrgPMXDXO8CcwjuB++iJmY3SXjQFyaEFOyPCpQx/h5M
	ix8DVyr19zjDynjFq1PdN2VfR6hnE0S4alCLXOoDwQUeEUXrX9qYYCmop8fal5uRvQQhk7y6qakER
	vEp3y5QgBmkapRhKmFPI/ZEGdY0ZBJiC/fawVM3A4INQzQhDRwfw3CWzCcwdUPO7J/WZaG1OomKoy
	oYJTPoaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w111D-000000003fv-2tKt;
	Fri, 13 Mar 2026 11:49:27 +0000
Received: from mail-japaneastazon11022087.outbound.protection.outlook.com ([52.101.126.87] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w111A-000000003et-13E4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:49:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsreD2sZ9AUnazIS3hP7EuDojAPZr6T+NJGUtin7qDr8oCar2KAxpJwheYBAUmkia7RfGotBcUgvkyB/ISdUnYxwvbyoJajHtxLj3MkZ8ZB4F6dWyVuyyqAFug3+WuS1mYZy8GLV/zTVhFCNSQFF+Psu1CO2SzI3wt/suk9SWHa5zwpL3oMqERzHwhXW8eHIMjGgwy8WTkVuU75EQw9yMhGTtxgxnzTgXbWaTVKDKnrBn0lW7HbUDLn+ASWHQJ/F1TxbDmh5Vj6IkOrzy8pZGhSFdhtApKVjM7fv4AB3sBOHBcc5QjzpWVYQEmj2ZrKzZSU2X2sfcvucZT+WWm0FmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kdu427wFNw0Z9mtsVA+BkAqm+HDIFpis4xRgnUsdPA=;
 b=Igo6B99JDWv9yURkqp82Qp2ltY8Z09TVyqYbZlgkFmVF/sVjLi/7Y2X2Q2B1Oxm9xjQfhbP7CXRXdnQU2/arlcse9/SV0RIRKj1bo5WYaw9pRMHq6+leJ5huIJpsIaY8pOP2AtholENFl3K08WSljmv6ni15jwkx1yRo2nWwYJ5ck3uqc6A7yp8WEWM1m6eqRPw6hnwOvPnJF+2Z7FjZmvYmlwHj7ldvlwZ1+VTI2EVChami1Ddx8OpUaaLvdXh/QeAQ88NJpth9k66IQU67huOZ+OcxJ3+zAPRhmp2v+H7BhHg1srkqKmTlmgKI99Uc/9ZseIdrrPV7iL98/S6aGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0007.apcprd02.prod.outlook.com (2603:1096:3:17::19) by
 OSNPR06MB8307.apcprd06.prod.outlook.com (2603:1096:604:471::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 11:49:17 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:3:17:cafe::4f) by SG2PR02CA0007.outlook.office365.com
 (2603:1096:3:17::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.29 via Frontend Transport; Fri,
 13 Mar 2026 11:49:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 11:49:15 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id EF68740A5BD7;
	Fri, 13 Mar 2026 19:49:14 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.chen@cixtech.com
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v4 0/2] Add scmi powerdomain for sky1
Date: Fri, 13 Mar 2026 19:49:12 +0800
Message-ID: <20260313114914.1564115-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|OSNPR06MB8307:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3eb0ed4d-a83a-4420-bcd8-08de80f68dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 77ct1PKCcYTk4i9pL5XBcqUM3LqmPi2+kooO7mCpkXRkN7Ay4CWPqcna3YxIAs847oetmLrO+JtCpun4BOkQIpkXQZt6Ab0Lf9fIgYTG4EoHKbz+8HlAA3uqfRcHfBthq+QlQZEtBc0NhK8N2MJNMIN/VcCx+G3m/KLQxXpOses6zLBSlv1sUVcZjn/VpR3MamdrKAlU24/h6klXFz6ImeoF7gGs/ORW4U3oNs8aiE9/W1Qw5pspkKt3IznK0QV1vgs7jgLXe8FGvaRojMbQ1j0TdmLK+eF/ZwuddXhPVEV+gFcR2Fz+Oj5lRjbNtmZtt2r6qOJGihmetwJ1QExpr7Q7OVC2rEgsuA0Pt09KDngpbc+hRYcN3MsBAXXQoyLVVKgy4xiR80JFVgi/pmcfpiU+5E0jB5jSilDDPElDyQeOu43bpDuDPOFLpG88tIXV6KrMDFqX9fqXDhip6Efm+I4oK+98ULIYCz4kFQL6oii8Dqspsg35E2uGeNigRe9HntWaXd1dO2jZGEJjAAhfeZkzzaBKTQO1nXJgsVJI9oGd4j8vjkICvH2dzF51l3bEpPGIMMSFUzTDa9F905aen0Ka8IbLVRrUlZ7u7BSoz4YncSuhhaBprpHEMrAJAGogWDBHsTeUce5yxscvU3K6/CJPzlF2cTvp2vj/I1EmYsXKXNUF153Kfvs6r96larq1s5W27WGlUM7CZwoNxKKw9k5g89tM3PhK9BnvtGtIX+OO2bjvVKYtAyZ3JQ4tXxW53V2+mjWOllI+1HrM9xqZUw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gKGTU0aTxUQSaGkaQiHkV3TvYJWZz+XwYmhTyTpV+akT6vZrfocYEf4hV9cJNfqH/VWy6Cq5petwQiKM1JU+cMEZPrXiHIzcio16NlCj6S4nMLA4IwiQh4sV9pT9z3rPLWD9HM1/6SkN8h/CCiIgh6yd159xD0V0zgFyAC5Gi0LvR3GQwbRX4QKiOU76SVHDce3nC9fyFk1bc0n/X8hkrayVh3Pm1CFQGYG/VfgeIx1SnTPf3rvRPLG99Z/M4oB8pM7Ue3TPRkWGhZqLverirHUdDkk6fhW6eIgrf7mlPZ6dIL+glRerfGCQKtbkXBkLzA5XM2uQ8ijeW2M0J1dDieqQu+t+gF8PonSd8JIqL4iMSKXaOKBVJAS4ucvUB/4ZEiNL2sxcHl+WJb+WE/RLgN8Ty6TGwi0QkA+rjfSsnz+clnkegxo18zNaq+Igvaq1
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:49:15.9516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb0ed4d-a83a-4420-bcd8-08de80f68dbe
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_044924_314783_FC3F6C94 
X-CRM114-Status: UNSURE (   7.21  )
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

v4 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pcie-host.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- delete power-domain-names property

v3 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pcie-host.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- refine dt-bindings

v2 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pcie-host.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- update dt-bindings

Gary Yang (2):
  dt-bindings: PCI: cix,sky1-pcie-host: Add power-domains
  arm64: dts: cix: Add scmi powerdomain nodes for sky1

 .../bindings/pci/cix,sky1-pcie-host.yaml      |  3 ++
 arch/arm64/boot/dts/cix/sky1-power.h          | 33 +++++++++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 21 ++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-power.h

-- 
2.49.0


