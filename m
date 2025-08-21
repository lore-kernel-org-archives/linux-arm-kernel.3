Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E20CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hAZKIl7VFsJA7T3DhrwuzSXASjRuY7aTSJnOGFZNr3c=; b=UAU0suZ7wsiFCLTifQgceKf9P/
	oncartR2xlwrPcjqVvG4T/FiDOOfMA7OLqtxlA7k3SiI99P1V1I+bW/acBM66hz5LKv4x2vAx/6E4
	XDPw6NDkqF8/oKriIsIrOUh6Ix3+nWDEncaa+UYc9/y6HD+w66YN/WZIQ0pGf/ZwcteAHSc59h604
	V7SQPzvGO2i9U1d59GfcaWbpgmXvA8gSK78pQRirC3PEpu3gjZqEkfaTO+jVucZLlDkVTcN7LqLjZ
	mMY/oOYMwFZHGsKMhe7g+Vd+vOUzl42H0rgOhdzWfsfhwGGFUMf2s2irNZpSA8JA8h90PCaKej7zz
	fECY+gEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFpW-000000013id-0WmA;
	Fri, 22 Aug 2025 00:40:30 +0000
Received: from mail-dm6nam11on20715.outbound.protection.outlook.com ([2a01:111:f403:2415::715] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBZy-00000000NqH-0W82
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QO161KxaaUi0E+OFkLF4O2/DXhNcZZLBh3ml/iqspKAgrCG5JC0GhJhLe/e4t40gB6bwV+RsBA6Okgo+pCrm2ZPqpWAMwf4hAwpNlPEBprE1xUcM/Jo1T0eJLgpcvv0jcK+ofAzrEP1QTGw6BklenMoyxTvZXeG8ciijCJFDgW20b150Oe/kfdZEd/7hdTlIf8m22tEmM+GVYgf9tCuqZXb3wJ0R89RmuwAE47wR4fflrGdWGinVeWfg9730ECA88CXAzXEnDJ8Zsu312sNvhJIPNnaBRG5r857QDnDRmLzV5On2GtA3Z9cWdrPweNcqZtTJ/R2QCy/wwmSTMEyk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAZKIl7VFsJA7T3DhrwuzSXASjRuY7aTSJnOGFZNr3c=;
 b=Z4AMCNJoKFkqb9QpBTpiWs5PAw+ufpa0tgzZOpsAw6ufXOHZWjXbbW+ADbhQN6uaWKtnuFcKhk/RehCtiZiddP1EUhVh8q0hFvd26ndQZ0WjkWqxJnEOwPrBI8vKA9eXbH4qzOBSM/Q9O37Xp5HtY3x0ERXjP4PfixUmODg9G4+GCpRc0K6kmBrN7Yi2qyBAPi8bWQ9j/PAI1Yle0zxt49NqWct2qwFpQRIhr/tJIWUUYBpux6LV/GojqnKGb9THI+Hu526WTCIIZ1GJpYcGxS7ZFFpOLmxtwiCeJxN5barVb4uLnnLdnazmj4zPiu63fSeMZHPiKXTy8tMZJchHLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAZKIl7VFsJA7T3DhrwuzSXASjRuY7aTSJnOGFZNr3c=;
 b=jpXHWhf5c2IotDn2TedD/3O9583mohIEaEHFr7xqwQavgMW7CRg5O69IorjDjhJID/hhFGuk8z2fFRRyjHxABdaMWpGvc+FGLBLlpKqV23dQUKEfrurnLG+vXHQoOQbyjh0yHvQ4Scm4y2fgCepjdvBWCduxMMO79PaWz5LzDz/xeTYqIMLfaDTY+92WDsO9eV8ME+GNGUSABh66BAGtJdINt3HpS/ZXYaINsvg9SbIIXricln8NTI19hfw7LHHSiQhaBz7FPD4tLKRGaLtn3rQ4W/nPNZSjxYIlI2QT/fv7C6MUeNhBFQM4lmbHCHP/nuiclWU75m2ktnuAwpSa5A==
Received: from MW4PR03CA0219.namprd03.prod.outlook.com (2603:10b6:303:b9::14)
 by BL4PR18MB6432.namprd18.prod.outlook.com (2603:10b6:208:5a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:07:54 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:303:b9:cafe::a0) by MW4PR03CA0219.outlook.office365.com
 (2603:10b6:303:b9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.16 via Frontend Transport; Thu,
 21 Aug 2025 20:07:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Thu, 21 Aug 2025 20:07:54 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Thu, 21 Aug 2025 13:07:44 -0700
Subject: [PATCH] arm64: dts: axiado: Add missing UART aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-axiado-ax3000-missing-serial-alias-v1-1-527d979c3ea0@axiado.com>
X-B4-Tracking: v=1; b=H4sIAI98p2gC/y2NQQ6CQAxFr0K6tklhJDJexbCoULEJDjpVQ0K4u
 xVd/by/eG8Bk6xicCwWyPJW0yk5lLsCuiunQVB7Z6ioqqkpA/Ks3E8+gYjwpmaaBvxaeEQelQ1
 D7PZNDAc6cwQX3bNcdN4ip/bHWR4vbz3/57p+AIvTkUiJAAAA
X-Change-ID: 20250813-axiado-ax3000-missing-serial-alias-39c489370ba9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=929; i=hshah@axiado.com;
 h=from:subject:message-id; bh=V6IYRrIJVaz8j/NBH5b4Ydgi+A5f1DjeTUAup4PVBZo=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBop3yW6oNfUZsuN8AzgM4L4eM95icW6V5pxi/GX
 wkIh/xATqiJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaKd8lgAKCRDxWHMRoTLV
 +0xAC/90XyxfM7F6i58VlfHWvJfJ/5FFw1HjNOyhguRd6YIxM7vNm+ERPJG2+u6GAc4ag1bbQtI
 oUXxjEinz07Ro31XKNsvHaqG3vyJQ+PwJlIYzed1zy5PJiWNMJy/x6rOpZCl91dsojWNR1EoSU7
 h8emdqdsmKvxBI3FnA2iyqlkBLwmpvadjwl5FdTDWQJIB+6PLM1MfvnmLyvOy6uoL/hZZhMxYNu
 eZeO3VPGMB3235wi7wQPNkaxz3EexCwrg2dcV5Hl4fHgQbyqIfrAZSdfD9G0aQnR5D4a148BeB4
 sq5LhATwJorWPBabEC17Bi3SRzTs3a3uMxhoUdLWHAxDqMYah/yr75PI1xEwe+a+f9HQUQYCr0x
 FAjiM7TudLmcq3quNoOjYhzSiM7JHSIwEJttQUkhrDfDxjljolj5PyNv2FYIKtluCJ/lpDFYf8S
 l4QY+/WX2IGH25BDVPpnBhbg8l8tmjPf0UCv588izYWF7Asjehw2mFAei2tbWXP7vTqCo=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|BL4PR18MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: d01f2c56-5bd9-449d-6b9c-08dde0ee69fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXpRcFZMcVNGSkUwNGFmSDBGS2tiaDdGcGZ3K2RQeDl4Ly9wU2laenNQK2Fn?=
 =?utf-8?B?NU53QlBWREVmL3VwdytOZ2UwMHdlZ3FOSlBFSDBVNk9YS3FJeldicVJLdy9q?=
 =?utf-8?B?U05lSkpGNFg1Y2lqYzgzUUFMYzBNOTRieTJZVDhFTDhiWU55aFhxa25lWXdh?=
 =?utf-8?B?ZzAzYjQvTndLMlllS1I3Q3JWR0xpdXRQR2JzWjNNM2ZqVWdJaGF3SFVlK016?=
 =?utf-8?B?bzdSTGFHMTdxVUU3NnAzOTE0SFkrWlRRWS9kSnpQRVNpTTJYcDFiMjdsaTVv?=
 =?utf-8?B?amtnc1pFMTlwY1NYOTh5aWYrTURQQTQrNUQ2c3FSSWtLWG9tbDZSWi9qT2Rt?=
 =?utf-8?B?VEhkTWc5QlJxN1I3RTRDZGxWcGZuWnBuNVFSS0g2Qk81OTN5VHdZNUlFL1pT?=
 =?utf-8?B?VER6a2V5c1A3VnNLUjJiVUI0NHh4L3l0d2Y0U2hDdHMzZlppSEhwUjhpMG1X?=
 =?utf-8?B?Q0RodUlYeXBGZVRyUDg4UUZhTTFpVERrdWpESCtvUm51aHJWdnJxM1F0V1Jn?=
 =?utf-8?B?aVN1Ty9MUmo1aUhTYnlCRmMzMTV3c2ErdTNJMlRNNWNrSStwRWcydGVjY2xH?=
 =?utf-8?B?TklXYnh4Wnl3Q3RWS0xKWENEOW9lU2syKzhyQWNaMnlhQUVGOFVJcjVSZTE5?=
 =?utf-8?B?aklYSDNZS0JHSEJmV2VObXNJN2lHVGhlcllCSDZ3YlhERTJxMjNHMmRzRnZk?=
 =?utf-8?B?VDV6SnRKd3pZUnNraDNUYXErWmw2SVNJRDdPNW5LcStvTmVHTzJ0Y3gzeXBl?=
 =?utf-8?B?bmhxT1dmUEswcWtNTjJoUlZjL3NkcmRUNFdBTFUwY2RhdWZ0VUU2WG5nYTZU?=
 =?utf-8?B?Y3ZnbnN1SkVKdkRRbW1EcTJ2MlRFb25wTDhSMFlDdWljcXdlUXhHZGlJMnVL?=
 =?utf-8?B?V0I0T1pTeTRyWStuK3RxWHBDME54MG0yNnJ4TVpib0VSYnVtbmRjNnh5MUVH?=
 =?utf-8?B?eG4wa3FKb1VLYmk1aGMrR201cjEwbnhiRUE1YU91MFl4UnprNWo0SHVKMWNm?=
 =?utf-8?B?Ky9aTkhQSlFEVklTVWFESGNZY1pTRTIzOEVuYjVrRnU3Q2VkSXZJUjIyd3lH?=
 =?utf-8?B?RFJ6RlJHNzFLMk5KeTVhaTAxaXNHSTZLRFRxVDFrUTFJZlFoQ3JBYjdyalVD?=
 =?utf-8?B?WFE5RVc4WXpncG5CVW1PNExVb3JSNjZoNWt0a2Voc2NjRmFITk1CaDByZW96?=
 =?utf-8?B?MDI2dTRIZjM5QXNWSEdTTm5lbUtpdEwvRjk0UGs4S0MzKzJmWGYrS3d1RU1V?=
 =?utf-8?B?WDJocklpdWtoL2x1NTBEOWhOMXpHRWpQUjhucEhJMG9pS2J3NEVqcWxJZ1Mz?=
 =?utf-8?B?SWx6OWt1aW5jcDZqQk1YWUVwazgyYzg4OUVlRXJEWVlpaTR2a1Y4ZWdzYzRV?=
 =?utf-8?B?c21DTFpkN0hvenQ2cFVDNnlwSFRuUTZOUHBkcUdpYXNRdi8rM1FQSWQ1ZU5q?=
 =?utf-8?B?dngvc0w4ekF2RWlQQklPeis0WnhqSlRjUllZVTJ0ZmxUYXltZHVxVWljZThB?=
 =?utf-8?B?TW44TGhBMEFlWDhBTEQzaC9HSXRaZEVRWXUyeW51MFoxcjNieGNJbll2ZmR5?=
 =?utf-8?B?YlZ1OGJibGo1dEJETnFKeUx3RkNhWU52K0tSWlM4bCtxNDBGM2xFMWRqcDFr?=
 =?utf-8?B?eVcra2V1SnFWSXFCL1dOSWtlTy8rREhqUjR3MWlLYXB6ZzN6ckRDZEw3TStI?=
 =?utf-8?B?TGVDYjA5SkRrNFIzWEl1ZCsxUHNtOU9LczlSVHFSMC9OUmxTNWluQlVJVC81?=
 =?utf-8?B?L3o0TFhvTk9icWhUT1lLT2g4UG94K3J3MXAybXBLdlhMVGk2ZDNJMmVNQVVp?=
 =?utf-8?B?QmZCYnp0SG52OXJaY0U2aHVTRWtTaUYxNlVuMDNnUy9DWWxYZ2ZBTk45VDZy?=
 =?utf-8?B?akZMeWFzTHRnY0dCL21hYWg0V2QwckpDWG4zOW5YRDZaYTB5d0pLOVQ0Z3RH?=
 =?utf-8?B?WVlVeU1QZUloZk12cXBPWDFsK2Uwb3B5bXpvdUxYb2JzUW9uNXA2NFFsMXc2?=
 =?utf-8?B?aE44aWQyMW94YlBjNzVMRW1FRGFvdkp2M1V4bzh0RkpFcjBqMlA5N2JvL0pO?=
 =?utf-8?Q?c36eLt?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:07:54.1271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d01f2c56-5bd9-449d-6b9c-08dde0ee69fd
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR18MB6432
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130810_185601_5D672DE3 
X-CRM114-Status: UNSURE (   8.98  )
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

Axiado AX3000 EVK has total of 4 UART ports. Add missing alias for uart0,
uart1, uart2.

This fixes the probe failures on the remaining UARTs.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 arch/arm64/boot/dts/axiado/ax3000-evk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/axiado/ax3000-evk.dts b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
index 92101c5b534bfac8b463adaa1c4f0d4367d01e21..b86e969625573bf92bdd5e4435ea571dd7500de2 100644
--- a/arch/arm64/boot/dts/axiado/ax3000-evk.dts
+++ b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
@@ -14,6 +14,9 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 		serial3 = &uart3;
 	};
 

---
base-commit: 8742b2d8935f476449ef37e263bc4da3295c7b58
change-id: 20250813-axiado-ax3000-missing-serial-alias-39c489370ba9

Best regards,
-- 
Harshit Shah <hshah@axiado.com>


