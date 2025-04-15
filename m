Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D86C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4LrIF1gpvcMufIXFCSkAw1pI1SKk6DkG6UHbcupINM=; b=S1B1qpN4oXgpO+hRO7R3o0uWDR
	afvuwidqCoJgCnI9m0ys7K7r6bMN8WK4VH0Wvl/GxH1mnrhGfKikL4OgGfF+7VVysy7kriettypA3
	5P5bZXakSc+idA/A1b6flsM4a9UlpMf/oQShO73M35r1k8HA9pJjljBVWvvJz0sBt3GYB6llc5Tku
	yRYKQBrgT1WI23pXaJNYpIc+I7R8rzX8F31FIR1qv/VRkpS4TIXZ+CJtHfCS8QOGNL+XAgw5HCnWr
	BU8RcqIfL26VKPYV2KMd0A4pO737JQOcl7ZhXtorG5jUcyHvEUHVUnB6Fm1v9HoCAYZvDe3hyX/gN
	hChS44Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4j6c-00000006PHG-0KgV;
	Tue, 15 Apr 2025 16:25:50 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iVM-00000006J0G-3ye4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:47:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXOizZ8VdOXSZat2sg4UsmCuPdfpY6tx0YHYbF+1rIKno45mvSpDwq6W/pH8J/CIS4Wg1PuJdsBVO6mOdBNsxA0Bm1ZdIqG3v2LauEmG1bXDj8p6SvcaSowtJPMrQdnpmJhYZ9t51BxtvaaZiFWkAwzpL9EJ1xsEixRf6Xanm0GDIaigAEJNTFoqikMZ8f/q+5CfM6tXwdNSxRDaXEakyb9riuerKMGuvkmJM1T74Si5MjJKP1fWtv8XpTW8p1zLQl9mloyUGRx8VUuDSGiRz3uqgqqoZV6+CegS0+KtQ1fQIMlgHXpExxhrIR09yMh9FNQQwHt47p3RlS2FW9+Kpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4LrIF1gpvcMufIXFCSkAw1pI1SKk6DkG6UHbcupINM=;
 b=VBRbjB2ZP5vgCxzEtrqzGFIf1jSVSQVYq53ldkDu7+HJF/TX7PP8vGEyNYqdvkPEA0xRYDPxf1S8u43m5lvF1GEs7DCuanyXbEOUSpEm8Ndx+bMz22I86sV5mVpMA5H/nHSB8rQ9OvXrnuxhzv1WnD/Bqg0kOoHt4tLKRxrFFbHIXW90JaxU+XLulxUtlgxk8SOeUMCjR/PhgW3waeeprOygFAXoqskDUmpmm2eaxw3b955Dna0e2KW3QYvgCD1d4tQe56cJSIXy/xZ2DsGgJkatiW9uDf9TDEkcONGtcGnKn44MONYB3LTEhV2jou/0vdSrjI/LKsc0dowqb7u4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4LrIF1gpvcMufIXFCSkAw1pI1SKk6DkG6UHbcupINM=;
 b=DKfezJKlHWbk/iIvDd70NoT88qvG/0Pb+7ISGHZU0LNMrDgpX327UkSf+H9LCTcdjgfPo6FrR4WGaezSxRok7N0078UZraPjt2AN64OOuHM2VCTmZ3uob2kYsxxJbrqNXEdoghmB2c1rV0Og4O6WGQUzdOiEmeu0YeghAXsuZtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from LV2PR01MB7792.prod.exchangelabs.com (2603:10b6:408:14f::10) by
 IA0PR01MB8278.prod.exchangelabs.com (2603:10b6:208:488::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.32; Tue, 15 Apr 2025 15:47:17 +0000
Received: from LV2PR01MB7792.prod.exchangelabs.com
 ([fe80::2349:ebe6:2948:adb9]) by LV2PR01MB7792.prod.exchangelabs.com
 ([fe80::2349:ebe6:2948:adb9%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 15:47:17 +0000
From: D Scott Phillips <scott@os.amperecomputing.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	James Morse <james.morse@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] arm64: errata: Work around AmpereOne's erratum AC04_CPU_23
Date: Tue, 15 Apr 2025 08:47:11 -0700
Message-ID: <20250415154711.1698544-2-scott@os.amperecomputing.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415154711.1698544-1-scott@os.amperecomputing.com>
References: <20250415154711.1698544-1-scott@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:806:27::25) To LV2PR01MB7792.prod.exchangelabs.com
 (2603:10b6:408:14f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR01MB7792:EE_|IA0PR01MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 822c3980-9db3-402c-c244-08dd7c34ccc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aUxk7WKbqfvaP08lxv4YbONeSJ0mUkVqu1sE7lJq3BYjHTcZdrr6j6uYszLK?=
 =?us-ascii?Q?jSsisHJC+/QN35Ts2znqUOqft6sKEDye6jN4OBXrZLuO2f6D1AQ7ES9pwpOi?=
 =?us-ascii?Q?BiugfKltLwALcxGkEbJ14SqVPwGOi8PmAlM+pIoJ/HR6qFyjTBb4G0ertQ2M?=
 =?us-ascii?Q?UFZT7p3tE3CBkFuiMIUhT285U/SmGtiIabmXFIGq8TkdVPO4ebEsJLhVO0lV?=
 =?us-ascii?Q?GZiQR6ogdWrvsKGObfs3Vv/Gni7vvaa0yMnfcyfnHAdrw08oH9HfP8fqWy+z?=
 =?us-ascii?Q?SoBGmXMVFNvfIy1oOZuB8Xy5PoytuyjVjSLjJTay9iVO2F2R/kiH5hotKVsm?=
 =?us-ascii?Q?PoC0g2hWGfMX4rpSi39SLszxOt8+4KDXdmXqnn1HNpq2lwh9CZdru8Q4qFS2?=
 =?us-ascii?Q?sUyOSfxyHrqWYw+t8yDrVx9bE/+ldJyS5f4DX30zmJlm6RfravYaCCDpRJOd?=
 =?us-ascii?Q?UJ3dVwrlvPY4mNSF3dzP6ItCXorRJTOmeK2Clfre5mhN4zvT63vvHA8tM5C4?=
 =?us-ascii?Q?QFcyIn1gw6aCSTtkU+IDTLUsPXxhSwh8hlok2OUhDNfKgK41Xo2fnl1dK57A?=
 =?us-ascii?Q?BEyG5BXAmtYqk9UL4w64szqKVftCBCkuiYEPg3iQIDJ7jEZtU2FJr0DuwrAS?=
 =?us-ascii?Q?a4fCpSxTbo03T8jkoeZCQ2OK+Gk5hOTgjtSH0q5ktW1WjCyNpfDLdjwSbnBS?=
 =?us-ascii?Q?LxCGEoTFVhs3v9ZcBTphz2t7xU9Q4mEJJ5ekCLP1lEAWokbRYAxfkMLcn36w?=
 =?us-ascii?Q?5L6I8Pt18th/s3PLtlvegxWv0oQ9u7aQfFcIiDkhXMuG+hv8nHyaGTjD09jb?=
 =?us-ascii?Q?3GMYfXbr2akkRsJhJU21/AXnbC7YkY6eeTdwVbK7RI9OeuD/k6QSMROmSsAa?=
 =?us-ascii?Q?zIUDZVRmu2IqC3LyuOuXQK+OGn/NQzDKWI6LfGqBIA8Tz1cHF8TJB7iNDNus?=
 =?us-ascii?Q?FgLLF8/d8G+cb2Y5TU7GJuku1zPQ16tWtZJQGobJOUqkwszSPKeODe5EM95i?=
 =?us-ascii?Q?Lwg/HC1uPUlI2iW9+ss9fNwcVk+Gd55zcghcI6jI/6GZxJZG7mAgZj4jqTQD?=
 =?us-ascii?Q?ZylqRdFFMmmFkVg7VFjDhI4pha+jQequ9SkhgnfD5TjtgVbaKywFMEu/GsZ9?=
 =?us-ascii?Q?62pCZgnf2LvRCuwXEoy2MX99jUwUDuC8uxlb8+Vdv8Kqsk6jz1AfNq9VVDFQ?=
 =?us-ascii?Q?LMCzu9NPBgHj2X0xXyLp1+BAdwbc8EDy3ULlxNICt4YNslAiCvy73hSnTqyh?=
 =?us-ascii?Q?LPXFGn/38cnv1QVBMki4q8vj/enuJ/R1vBemVV4IcYYREUINqGtoKj4elsGB?=
 =?us-ascii?Q?dJE6JqeyBGuJ8Wn/k7heBsHq1d1Tre8Ae2FAq0crRt1TQST9COSywnfXyrmP?=
 =?us-ascii?Q?wwtg5kv7AIpYm1m28I2H6rrlLW2PDfFhpOp3491kcmK6GGZyZWLnxle6ubOg?=
 =?us-ascii?Q?y6iYWNolpbClTvCWtXg+XuBkTkLr24ON5uCaD65aSXeV5iT1QLQrSlDWr3YI?=
 =?us-ascii?Q?2YSFo+NlYiEsrYA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR01MB7792.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v7BzdkmKkdAYl0R1oDFsGKHnK3rKhfPSssLPmBboLNs1KYK0cFw8rXT3Yezw?=
 =?us-ascii?Q?t35MPSnZxD7EjsdBE+0WcD2YQG7CJXZJVCV63SORRvKFneps6wRkzA6dwV7f?=
 =?us-ascii?Q?gt0bSaV06w0xEU15PzK5I9FqxJuENc4EblgSUPNPRreAaUXSl8uDc4f9uVZs?=
 =?us-ascii?Q?0Wh+79DLkSziA28+Go9AGHiv2Gb3D39okfD3R2qNYJSg9lM20XXCRzgddjQw?=
 =?us-ascii?Q?EJrWvyJMTAG/gD9uA1mLuXANjrg4yCCFVg9Ed15WDZ/hBjnixd0nakie0tMB?=
 =?us-ascii?Q?50Cwb3tl6ypzF+yZ74U2gUQL85lsllTNDH0kpkyjyysJI0vlefYXe1ylGHl/?=
 =?us-ascii?Q?JnzBBhg0nyOcoD+MULZyqtH0EuSZARiMKZStuFaNqaUJl9PDA6uamdvjRFis?=
 =?us-ascii?Q?TcBRRKNxxngOEXQDFW7PRYw4DpnCP8Pnp3D8DMa1g+krNJVLVTrYfT/xpJM6?=
 =?us-ascii?Q?Wc8aeNWQE37Fm0R34b2aizoBDp3XceFJtmn1nx+mTh9yeWYWQGNOLhRvblPR?=
 =?us-ascii?Q?KTw0wtizEr+Fpp2EnyKXVOBSRF7P/ijHDKfREZrlyBg2JKCRGkesjJ4tewSG?=
 =?us-ascii?Q?VdO/h44i67rzXsxPcN9b9RrxAzru2yJFw0CVkSphjc8Ji3S9L8IcIzXkLrgz?=
 =?us-ascii?Q?po6UFZgAAiVFDtfu7UDmiIP8hPoUH1bZWPgviu9Vc0nXHah96C4jPB9dlHut?=
 =?us-ascii?Q?BjHJWZ97UxOMj3AkRCwUoVFg/cIJguJo1GV64YnrZVCFRVdtWDijb2QRhcn7?=
 =?us-ascii?Q?qKDulwB9BIjE2g21NbCNlcH8DM9ntei2U/68YsJhM1zFdkScuojLUO6GGwnQ?=
 =?us-ascii?Q?PSUfbl3Oh0Gkzjb14ZHNr6b8YrNVB+1u8l5tId2kKD+7NnimvBeG/oeRiMOZ?=
 =?us-ascii?Q?KPn4OGQZ03wnjF7nyF0cdmP4RfZp1q/VKd/IJwE7UfEhDzTiMr2gHrVgAe8R?=
 =?us-ascii?Q?sKM4p+9Xacz8OfWijPTFc88NsV2TOEdksfL8rZY4UniX759f3Gpt/c5WDPJL?=
 =?us-ascii?Q?lHnBnWE1aGNag/doMHafhgeRQVB1EF352DnqqW1d9A0a85HYq5NRx5TGdpms?=
 =?us-ascii?Q?QI/7UCpqgK790b+U6KuAZcvsBUZf4gZRHzXKktF+dx+e0VeemUWWvUd4Z2qQ?=
 =?us-ascii?Q?o0Qg+5FdBZGVBcLwc9LMiHTajZlMXrZB6tCserwmRhhaM21j/xz29bpQy4xA?=
 =?us-ascii?Q?Vyi+SXapQwwIp67FSHl8nFM9wXLHUka7HBjBEPQvzjv6tMwBA2q6a0imcpTx?=
 =?us-ascii?Q?+qUzf+mNbLXebHhh1TP3/0y0z0W0wWMP4Ezeg5L73kaZ1v/c/AfLBi0IKS60?=
 =?us-ascii?Q?FAjYM7koPVfZRx41Wc0aoZwVjGKKUVMj3JolpugYK5B8m0xI3SZfnFotkAje?=
 =?us-ascii?Q?G7WrH+V/9lwPKjj1go7eArGhqRJxmVAY2FirUIbdS0xCLXR851KAg8V4ogMH?=
 =?us-ascii?Q?yU4K/M2C6AFC6Qj0zQHVBOLGoWrPfUGlArmeL63o/vXmgrLMQRz0d5B1Yc1v?=
 =?us-ascii?Q?QjScWqzQ+qnWVM8f0xFPDLDnDW3nsXaJ+QEh+akN/8JsKw/Dnj18cNl2aszZ?=
 =?us-ascii?Q?fmf0mqLnNP2pVAe2wY9CP1YASyNujqHoNmcYdQmMiWEp8ovRZ+ca2DsN5sMq?=
 =?us-ascii?Q?qBYFfsTwdnE0KZLvC1pFRTc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822c3980-9db3-402c-c244-08dd7c34ccc2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR01MB7792.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:47:17.3735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tlj6e9r35S/+WN9fINFipMBPfgcpl2HdM/irNZJe4DwbxkmXdbrpxx7cogFwO+4vwYClaJpy1LNLsRgfknk/SUcFzOMAa7Wu5IrLdNSia7lieviSEy/vG9Z8j/D/YWh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_084720_987687_32925029 
X-CRM114-Status: GOOD (  14.49  )
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

Updates to HCR_EL2 can rarely corrupt simultaneous translations from
either earlier translations (back to the previous dsb) or later
translations (up to the next isb). Put a dsb before and isb after writes
to HCR_EL2.

Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>
---
 arch/arm64/Kconfig              | 13 +++++++++++++
 arch/arm64/include/asm/sysreg.h |  7 +++++++
 arch/arm64/kernel/cpu_errata.c  | 14 ++++++++++++++
 arch/arm64/tools/cpucaps        |  1 +
 4 files changed, 35 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e5fd87446a3b8..2a2e1c8de6a16 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -481,6 +481,19 @@ config AMPERE_ERRATUM_AC03_CPU_38
 
 	  If unsure, say Y.
 
+config AMPERE_ERRATUM_AC04_CPU_23
+        bool "AmpereOne: AC04_CPU_23:  Failure to synchronize writes to HCR_EL2 may corrupt address translations."
+	default y
+	help
+	  This option adds an alternative code sequence to work around Ampere
+	  errata AC04_CPU_23 on AmpereOne.
+
+	  Updates to HCR_EL2 can rarely corrupt simultaneous translations from
+	  either earlier translations (back to the previous dsb) or later
+	  translations (up to the next isb).
+
+	  If unsure, say Y.
+
 config ARM64_WORKAROUND_CLEAN_CACHE
 	bool
 
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index e7781f7e7f7a7..253de5bc68834 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1142,6 +1142,10 @@
 	(IS_ENABLED(CONFIG_AMPERE_ERRATUM_AC03_CPU_36) &&	\
 	 __sysreg_is_hcr_el2(r) &&				\
 	 alternative_has_cap_unlikely(ARM64_WORKAROUND_AMPERE_AC03_CPU_36))
+#define __hcr_el2_ac04_cpu_23(r)				\
+	(IS_ENABLED(CONFIG_AMPERE_ERRATUM_AC04_CPU_23) &&	\
+	 __sysreg_is_hcr_el2(r) &&				\
+	 alternative_has_cap_unlikely(ARM64_WORKAROUND_AMPERE_AC04_CPU_23))
 
 /*
  * The "Z" constraint normally means a zero immediate, but when combined with
@@ -1154,6 +1158,9 @@
 		asm volatile("mrs %0, daif; msr daifset, #0xf;"	\
 			     "msr hcr_el2, %x1; msr daif, %0"	\
 		: "=&r"(__daif) : "rZ" (__val));		\
+	} else if (__hcr_el2_ac04_cpu_23(r)) {			\
+		asm volatile("dsb nsh; msr hcr_el2, %x0; isb"	\
+			     : : "rZ" (__val));			\
 	} else {						\
 		asm volatile("msr " __stringify(r) ", %x0"	\
 			     : : "rZ" (__val));			\
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 89be85bf631fd..bdb92872791f3 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -564,6 +564,13 @@ static const struct midr_range erratum_ac03_cpu_38_list[] = {
 };
 #endif
 
+#ifdef CONFIG_AMPERE_ERRATUM_AC04_CPU_23
+static const struct midr_range erratum_ac04_cpu_23_list[] = {
+	MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
+	{},
+};
+#endif
+
 const struct arm64_cpu_capabilities arm64_errata[] = {
 #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
 	{
@@ -889,6 +896,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.capability = ARM64_WORKAROUND_AMPERE_AC03_CPU_38,
 		ERRATA_MIDR_RANGE_LIST(erratum_ac03_cpu_38_list),
 	},
+#endif
+#ifdef CONFIG_AMPERE_ERRATUM_AC04_CPU_23
+	{
+		.desc = "AmpereOne erratum AC04_CPU_23",
+		.capability = ARM64_WORKAROUND_AMPERE_AC04_CPU_23,
+		ERRATA_MIDR_RANGE_LIST(erratum_ac04_cpu_23_list),
+	},
 #endif
 	{
 		.desc = "Broken CNTVOFF_EL2",
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index f430fd5900d15..2b3afe4421af9 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -95,6 +95,7 @@ WORKAROUND_2645198
 WORKAROUND_2658417
 WORKAROUND_AMPERE_AC03_CPU_36
 WORKAROUND_AMPERE_AC03_CPU_38
+WORKAROUND_AMPERE_AC04_CPU_23
 WORKAROUND_TRBE_OVERWRITE_FILL_MODE
 WORKAROUND_TSB_FLUSH_FAILURE
 WORKAROUND_TRBE_WRITE_OUT_OF_RANGE
-- 
2.48.1


