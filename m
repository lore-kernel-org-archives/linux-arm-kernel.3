Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD494E73158
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ocKzRWbJHYLGmGqfUoEo90OzMlxUdojZy/If2yp2Mmo=; b=W8NMRjKZsBsn62
	vRjFZc7jBFkGFft5jMdHBLAv2avYx5FGLXo//yRC9jVRgK7px2TrlJJWOPe6MT6d+2z1kLWeYFCjE
	Pz4bB1kEOb+mE8SkowTUQMKwcKiYLStcsiWm8qfIqNSkI3rk1bPDD/psbIy0GFwj02Xle3cnY7Kbs
	VEGtxxa8CGyy0oyyec4N131WirTxAmojDj01IVZCxaVjlSAyWcp+4bNydJ6L37KEuBt+h5jpTTyQO
	kEvaWEDFi51KDxLTHtZ5QEKNhE2j34Xw3Lu1CGvNFcp7TKwnJDwHM4QGKJviiiyXWgrMQBsRAHDAc
	L59K1o+AnzZdVIfREo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtnY-00000004zkE-1heA;
	Mon, 02 Feb 2026 13:17:00 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtnV-00000004zjs-2sGb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:16:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjvrM/amwR6hy1OTrxN1KnQGARqJvmDrdTdH3GkN3JK5Jo+uHU5wfCtbmOfOEC1OrSe21hYbR6iH7cYnXx6o1OxzztpK+KzoHkN+ryesfFF4xHBIuvEw5HhVKPBoJGD2Rk2iZX7XYV6C4i/clJ+KHrikvZLynNO5VcBhP3ZXE/Z5ZPoKFzeObZmgle3lzhkKGLTtidml+4xKoFVTwnmVY9Yma4VtrfYdOvH6t2lrfHx2Gn17NC9tSy+WM0BcXAb88JnVcFMTYmZvM/OKIJsMds0Yjri2YHb34pAzgjljXchGOcMmHjg4wuQvnpiMtBeM8FDHCUxH5FyxUW0d3G2gsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocKzRWbJHYLGmGqfUoEo90OzMlxUdojZy/If2yp2Mmo=;
 b=TRFHuhfViODN+L55gluKfUE2XyWkHZnvhGTEtRAzIN8L4+cEFN44czE/1hDj79+vwDZt1+yzdAZGJNnUuWI4lHznrH5MMiw6z/vbgWuzvm7HVqH1g+hpPduu5xdLCMx8Njt7bi4c/yws0YSJcZmki3jOE6V6Pb9TuPNKqrJdNg+uH320Hz+xxkfSr5odTdzu/13tWXV28E377xCEP4dLKe0wdtXiAYmOMOw+E98ttN1/7q/nI/c17RnAp4abjrA/3jBrSgkYw7pZPlg6wqVvZJ8AR5Z62ffk28Sbe2XcmV34NFCeQHgRPDL2N5PTVALLkVTgHY5W8wJbhNsz6mqWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocKzRWbJHYLGmGqfUoEo90OzMlxUdojZy/If2yp2Mmo=;
 b=RQIyxmxQ5Cy3wEs+CleE6kaZOxrRhY0EH2e9uAxmmTPKhj+7PlRTVUHZbnbbWwFXhXNpabwFyMsrf1WJZPE+aK8iNJOD2AkQvfhy2nyuPLXeJj/Z3WwqWxPim+nmySbDxhVkaX8TgzvdCcTUhameysZeXIZnjRFDaOCrkMdNKMwmDzDkHvCf646kNqc8LCNgW9oB28JMn+X3T6CtfFyXlIwBIluSLsWgvfnypWQmoM23Ewq5TsebKx1RRGIndLxDKInFTwrCUQlCNaO0QsPaaBzFRX9sbSDRqGykJeBaehvBGLArc6Y+GfviYXA3TTRNqggQhAEfYm9wnMS935ilFg==
Received: from SJ0PR13CA0235.namprd13.prod.outlook.com (2603:10b6:a03:2c1::30)
 by MN0PR18MB5845.namprd18.prod.outlook.com (2603:10b6:208:4c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 2 Feb
 2026 13:16:51 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::3) by SJ0PR13CA0235.outlook.office365.com
 (2603:10b6:a03:2c1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Mon,
 2 Feb 2026 13:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 2 Feb 2026 13:16:50 +0000
From: Vladimir Moravcevic <vmoravcevic@axiado.com>
Subject: [PATCH 0/3] Axiado AX3000 USB Device Controller
Date: Mon, 02 Feb 2026 05:16:27 -0800
Message-Id: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKujgGkC/x2NQQqDMBBFryKz7sAkVtFepbhIk1EHJCmTVgTx7
 h26erzF+/+Eyipc4dGcoLxLlZJN3K2BuIa8MEoyB0++J+cHDIeEVAwtEeG3vjBZFhljyR8t28a
 KrutTO7vhTnEEW3orz3L8X57Tdf0A4O4BmHUAAAA=
X-Change-ID: 20260128-axiado-ax3000-usb-device-controller-156d3f1840c9
To: Krutik Shah <krutikshah@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Vladimir Moravcevic <vmoravcevic@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770038210; l=1314;
 i=vmoravcevic@axiado.com; s=20250904; h=from:subject:message-id;
 bh=ZpNrgQPhDGPeUOXOdbl3H8J7CArc0HO+2VLx5StoVLA=;
 b=d1I2KWs/buw6Jrfc2RNkJ+10vyC1lO62/lso2kCpDnTf7tWfP4fmtfi79KNDWM4N2SNs1sCfe
 eXnYwlRLbciDka+zzl9NoHJhEDm+W3mTLVeD25LE363fTWqx6UP1Vhq
X-Developer-Key: i=vmoravcevic@axiado.com; a=ed25519;
 pk=iiyhWhM1F4HlCbbW3I3qKZhPCE8JsCrDQMgCBRg4YMA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|MN0PR18MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 674ff603-e1dc-4551-32f0-08de625d540d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0lvTE11SVNDb0YvclJ3Z2FFZkc4NSs4ck94YVVtUGJ1L3p5Sy9DWEE2Tkd2?=
 =?utf-8?B?L0ttc3ZXd1JMZHJPWUFNRXAxWERpM01rMW5US0RFdzY4TGYxeW1UY1BkUktV?=
 =?utf-8?B?Rmd4UURzdGkrN0hVLzJzbEVkQzBzU1lnTURudEJWL0hHZFdrZ0xaZ3F0eWNO?=
 =?utf-8?B?Szd3M25jdFlYOWVlOU9UZW9ZUUlYY1B1MVpnbHhBVi96ZkFkRFljS3VTakwr?=
 =?utf-8?B?aFk0VE1kOFhDSUF0NkhucUhlSVM2YkM5ZUJQWXh4djRlNlZuNGRPQjM5NGdX?=
 =?utf-8?B?dFNvSWNqR21WR2JJbTdmbkVJWUsxSENOeFhEamxob3BJMU1kZFpyMURLYmhE?=
 =?utf-8?B?WUFYMXZwNTIvL2JFbllTOWdwaVlBU05sZm9OSklKbFRNZDVrazlERi9LZjhn?=
 =?utf-8?B?bHhsUXd1eE8yMlNCQkdvTFgrV0FDUzVWc0Nwb1lEQk5mYVRjVndUL1VVTHc1?=
 =?utf-8?B?TXgrWlZjZ1l5WW56TGdoQlowbVNXdFdyNHpzM2dOS3IxVTl0R1BMenVWaVdz?=
 =?utf-8?B?UlNXei83U0YyODZPZitoZTZBVzV1dG9wS0FNK3hzZDdwN0p0djYyazNlcTkr?=
 =?utf-8?B?NGJKNXdnc0FCNFBFeDJmTk5QeE9Dc3hVem1XdUdOYllnbFljRDlKc2MzUERs?=
 =?utf-8?B?NzZ0cDlLL0NFZWl4UXlpQ1lVdnRCY1RudlppYzAwZ2h3U09Xb3RSR2dITFJq?=
 =?utf-8?B?aTU2RXkrRU5EalZkZThhdkxpbzFabjRraXR0WEplWkZiMm9DTUc2NlhmWXdO?=
 =?utf-8?B?bGFrMFJBRXlLQmpZeXlpbU5GUFhGcXJXYkNFeHBOd2I2MUoyZjB1WDVBbU1N?=
 =?utf-8?B?d2pqc0dLSGgzZVJxTGhXVi94cmFEckhlUGswbVlmcTBNdzlPZVFsRmNCYUZu?=
 =?utf-8?B?ZG9XZERXS0FZdDdoM1poOTY4N3kza3Nwenc0MHZMbGdQME1kZG0yT05DdnZ5?=
 =?utf-8?B?dVhrZVZzRWJVVWE4MFRWRVdzTEs2NmVyc3lydThrUmtxc3RqWkhMRFE2K0xS?=
 =?utf-8?B?b3hVNGFKVkJMZXdSWVRqWjdha2Z0MXdkQ2dPZ2JkcGI2MGtWQVdXTnpDdlp4?=
 =?utf-8?B?a1RuY2txMWJjdHBlNFdCZUc1QmhBdkR1VkhPWXdIY3hIL2pOYnhEV0xMcFF6?=
 =?utf-8?B?TExQTk1jMU1UV1RSVHprVThGWnltZ2NsZkdQby9USHhwQUlTa3JrcXJ4QU9h?=
 =?utf-8?B?TzgwYjJISklWclFKNGxlOGxaWUVmODdOOWJ1Z29hdHhsSnZHZmpndFczTjBP?=
 =?utf-8?B?UmlKdUkwL1dZWUxNTmpYMFpVc0pZeWNudWF1MU9IYjZsZDJwUDNJU2o1RHNJ?=
 =?utf-8?B?eWgzQS9tN283TXoyNmVQdlh1V2c5M3ZUYXkwRkFjNEEySUk3b3ZEcGRmRi9R?=
 =?utf-8?B?ZTN1b2pUSVhaTUJRbGluNXFYN3dscE1NZU4zZzV6OXUvT21kaER3ZFNUQmRK?=
 =?utf-8?B?SDJENU5ndXJ6VFVBUVpycFFSaUY5a0lDT0pFb1hsNUsyZFByTWYwNW9JMlNX?=
 =?utf-8?B?MTlLM1JTRHZuWldwTk43T1IwQ3RRTjRDSGJ6cnpYcVpGS1VQZGpnSzV2QnJz?=
 =?utf-8?B?V0Q5S3hQdDExYUtQZDhQS1ByZGF6SFBIS0Zzcm50UmZVSE4zUlVoRFZkdStK?=
 =?utf-8?B?aWJBSXNBWnBZeU16bTZxWlRHK2tiV1pMRThFakRnb21kOUF5VnVRcElBV3dC?=
 =?utf-8?B?NGJ5VHI1NHA3S3FYZHI4Z24zNWZaL3F3djd2dGZCSmYwTGF4amhlbXRXT1o3?=
 =?utf-8?B?NC9yTjFYK1RQZlFKRDRiVEdKakxhTUhhUHJzbllDRTNNLzFjbEk0Tnpxblhl?=
 =?utf-8?B?NyttYyt0aWNENHBQaHFWWDRQWEU5UDQ1a21TVWZPRE8zRVh0SWovWWFncTF1?=
 =?utf-8?B?WFJyTTdmbmhOMmlXK21WWkk0TEtCVkNoYzRHZFFLai9iYmhkTVVHUytzc0ky?=
 =?utf-8?B?RnZmSytwSXp6USsyWUhDd1RzSjAyRG94c083YUNqMGhVTU9pS1FYcVdzUlFD?=
 =?utf-8?B?NC9FMmxSczNQNk1BcExrbnhhOE5ZOURWM0ZUVEk0dDlFcWFJQlFXM1RZRnEr?=
 =?utf-8?B?TndBaW9jRzd2YVQ1cFJkRE1wV0t2dkJQNHQxZWp1YUhlY3ZTS2dLaXVEbzF0?=
 =?utf-8?B?RThmNy8vOGpwY280ZHE2a2swUmdrTzhQd0gxRklKMFV2TTZxV0MyQ2pleUMz?=
 =?utf-8?Q?hx5MxASFgp9G95xkYcPt+1gkogElAlRwR3ld9gwTE0o+?=
X-Forefront-Antispam-Report: CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yXiKTuipYI1SsDqPFHiADwy2wpL6H7vZnQv2GsuhfpHZnNW6IC3BShg1iRSyHZ9M4B93v6XoZAttuXrkKXrSF9DMR+WMQmZPGdz1PhoaKiUURTw8wJMG2bjbEqiQI5J0mYauT6nGOybgGrgBXx3kfAEkW2OG2c6o/JjnFhEAfnHWc06bab9Dgz9f5QonY+693YrjeiBJBswH5lo1SlMx+n1uWUJXQfCuXdW6EXNrs2yBHxAJtXdmmgwWR7IaATiu6GJpck65lCI5SHtF5GFcotSfDnmHGsMNEAF8+oOvy/V8VOebKCueVeKpoPKmQ8l1CvCzOYK6661td5fvyV8BjKokqm/VSW31EPGXthEsBSD2ABr29CYIuC9y47WqqXVifJ+eVGGGcnACqjHM0c73EbVIjG83l4+esA739wvNybSN64W3yxjpin2lB657z97I
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:16:50.9641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 674ff603-e1dc-4551-32f0-08de625d540d
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR18MB5845
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_051657_768082_E422599E 
X-CRM114-Status: UNSURE (   6.89  )
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

Dear maintainers,

This patch series introduces new USB Device Controller driver for Axiado AX3000 SoC and its evaluation board.

The driver integrates with the Linux USB subsystem and follows kernel coding standards.

This initial submission includes:
- Driver implementation under drivers/usb/gadget/udc
- Device tree bindings for supported boards
- Kconfig and Makefile integration

Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
---
Vladimir Moravcevic (3):
      dt-bindings: usb: axiado,ax3000-udc: Add Axiado UDC
      usb: gadget: udc: Add UDC driver for Axiado Device controller IP Corigine
      MAINTAINERS: Add entries for the Axiado USB UDC

 .../devicetree/bindings/usb/axiado,ax3000-udc.yaml |   59 +
 MAINTAINERS                                        |   10 +
 drivers/usb/gadget/udc/Kconfig                     |   15 +
 drivers/usb/gadget/udc/Makefile                    |    1 +
 drivers/usb/gadget/udc/crg_udc.c                   | 4522 ++++++++++++++++++++
 drivers/usb/gadget/udc/crg_udc.h                   |  364 ++
 6 files changed, 4971 insertions(+)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260128-axiado-ax3000-usb-device-controller-156d3f1840c9

Best regards,
-- 
Vladimir Moravcevic <vmoravcevic@axiado.com>


