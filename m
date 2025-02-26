Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E27C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8H4VHW6UFL77KSWyX2k+qjleFYDpmIc6P92vODmfqL0=; b=3byDuebaKSZFkQN0gSXO2DO340
	qFpX/+GEigrRuLgAHVfzfQBBW8vZTRv21h+lpWOzz4JEpUZjj5OVcNXR4/iHRXncyYP58Spg6FnCz
	HA5DCWjbtqsX5U7kaAzfpiXi7TWxzqAtIVQaZZV3uu+8BaSZJf0fw/cG1UqCo0idllGsjWJwVxBe7
	mg6289/B2ILwK+sOH/+0h2JhUI5N52fTaVAPOMbAdtOwwNw6R5sHOS/2rWMUs/hNZNLnccAx2VlQg
	omMjNE5epnRY2jMEA2NO4rYdQmzEOzmAw6XIEssRuHyfU6wR/q8oU7wFg+2M9g3//uI2pQ9bJWE07
	AJUY4rDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnE53-00000003A5Y-3ngC;
	Wed, 26 Feb 2025 09:51:53 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDzX-0000000392q-3ToL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 09:46:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zir0+jJwzmJt51zjprs18BrenP+dlpd1BjErH6y9hpBZy0RwJ/HwoEnHibxP9yDyyoX2MiMDy7mZblsTiHzhagRCIFILJuSOeeC2+hrUOrfgdQFSHVY72XIu4ddRcjgBsyeveHKPRYAd3zG5sCf5Z7biHgSAP8y2hF7GF4Jt0PZaQVdDi0kpaNyhEZe6erarKE88uyyyyq18AIFfhd1WTHqXTnn6Fq5VI8siId5w0/hmS/xSR3ucVC0kk1jjBed0lZ4KVIylFK/WVl7w1vwDswpz3t7cHJKzxnMebuGTzDBrBQURRCYKftyW7O+OM/+vmo8nzLQRY4DKUNmjWKFyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8H4VHW6UFL77KSWyX2k+qjleFYDpmIc6P92vODmfqL0=;
 b=R9rDtpUBogtqHBqKtfEZZ5R/KpubehAixD15diMyaot+fqLQcmaJR5y6UOKtxNM56O++cCZz0cmL8XpUb8SBsItE4E8yCi0Om76GHtEncmatvbDmgGZ36evSoGkuO8QztxJOwYPRYq21G8UOmRm3dW2kVTpjurUyuDFtLoAp36pbZUqDlUNxQgZrY45q5ZKN7dMLAy7LINaN8/a8b70qIC09OHCI2hLh0PEU5rFCH8RzCMLaYKraHSGKVjfrbUHOIYKhF6ZsOrygkxOYEYfTtuG1nKhucFXvUAkfGT26vnX4G8MDQz81hpvyJrkGmrQX9qUkttp6YzaBnMDyAotRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8H4VHW6UFL77KSWyX2k+qjleFYDpmIc6P92vODmfqL0=;
 b=u8yZyF2CRNUhB59tPWocbHCvxIOvd9O8M8EUumQiq1l+W2hWzzJ1ppFE7avaAxkkx1Wrbtw4UgGOG2EkmTXICV47xovlg2aJPWb5eMLPf9kaN2C/mZxTxFl1DuxE9MVK/yOBzg1fwT8unnFefJQZo1CytKJQxjpubNYtIunETFnW6c+gn+74lYey87393hQbsnozvupMZ1SAcvshlcW0exVfeHjfWPM9Af1sdDyBnq4Ua7/Vc2hnpgXu8u2q1JfS5/arxE+sptFABZnkYBu59aFBf6AIGfF/ZXnGF327HzhAsCJPPz5EkhWdOK7QiYBsESVlkL6KhE5RVhb3M6NXoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10192.eurprd04.prod.outlook.com (2603:10a6:800:229::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 09:46:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8466.013; Wed, 26 Feb 2025
 09:46:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	saravanak@google.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [RFC] dt-bindings: firmware: scmi: Introduce compatible string
Date: Wed, 26 Feb 2025 17:44:56 +0800
Message-Id: <20250226094456.2351571-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10192:EE_
X-MS-Office365-Filtering-Correlation-Id: 14990d85-5240-4d13-cb29-08dd564a6353
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uSggz+9HOs6mMmLhPBQwcNUE4DGEbep/P9Uh8ReXhp/aaSZhVs8njLUWDYKs?=
 =?us-ascii?Q?Ls8oc0mwXwEFw8CAAHgDyXM/Yhzft5aPzURueAfv++Efzcka6FrsBzNOeK5D?=
 =?us-ascii?Q?gpBtu1G8TloKxEq3tK3UVBZx/kiUvT1q9Lw6f3vEeyj/wGAakSJ6yCA5uQWp?=
 =?us-ascii?Q?8tlLHMA5Je1uBCrxrFJ6XpKUQf6mr4s1U5RpVOcIMhkopCdmPATFUqR0lZA1?=
 =?us-ascii?Q?5ilMU9giLiY2tBpGxcK7jzZhsgeWYykbR0bXBVpSdxUcnxygUjcxRQLZ5izB?=
 =?us-ascii?Q?2bwJHvTIdjYSOAGvbaJyDn5dvIeuAY51X4VUmd1XAKyuJpW85EfGpubkC0/x?=
 =?us-ascii?Q?tm0hYORNQEPXWJ20IQ8pp5FJfoYtRsjkDDjzJwPXLa66CRJ9Jh0oU7penrTJ?=
 =?us-ascii?Q?mo+5fzl182uQdQ30WWJiMtZwTycmkiB96s6/Iz6BTDTffXvTXJPmKEIHOpfl?=
 =?us-ascii?Q?cH+YQTxuOBWyA4jvkIyc5dUsJW+Sb9Cdqdg3bB6KZwaEyLhHR5t8uVuH7jkp?=
 =?us-ascii?Q?9dqTbxgdRwtbHbvAi35HpA0dhlmHZ7m0qlgkWHkb2dvGyi01vzpwojGYQOV8?=
 =?us-ascii?Q?pGschVbufeIUpV0kc+/3ItzNhKI9Gx+RhP2JNpeDWV7CjJJmKNrrUdR0MV2Z?=
 =?us-ascii?Q?6MQYCzxMjndrZGpQV0CE37EB+Dwqt5cy9+11FhqljT0+Uc9pDzaj162ux5HL?=
 =?us-ascii?Q?x4nj6pnHo9yBxzQrvoQoyB7xYNJSdym3Kt7P92rLyQDyFQNB5nE4g1DOMD8R?=
 =?us-ascii?Q?fcatYVAIK19mKbrQ/L5xYmvz4Ej5t8jmTYXjxrgdcPwkRif8qyagoKylSxBO?=
 =?us-ascii?Q?aGOI0+JL5ii/WN3i+PWn4n/rpOCUNSUocpE2G3Upbg2xanWyUPTZbGwaiSfh?=
 =?us-ascii?Q?ea8sj6hf6gSuEWBUtHu9Ue1k+qOZStSc4/Axdn0yv5JoknjHkAYNzewM2WtD?=
 =?us-ascii?Q?mz86FQ66dmwXHA7GYXxbMAncWUQhMkDW+QsueM0qEnErznqA9MhxC+8J1KhB?=
 =?us-ascii?Q?O2pqWo8Yiws0cxo/2FXYFA2YgGDxG5UNCXcfAo3m57sBBCD+9klJ8a0EO+Zy?=
 =?us-ascii?Q?1pGQ61mcFzJnQibtUhIneq8A6vXmD4zYB5sXIs0U94c/VMxefDEbaBZLbD/H?=
 =?us-ascii?Q?XRwh5nxmnUdjfNyVp4Huhlm6EC6pUROfJcNPG0mzT5y3p75Y7fqhHL7tHtao?=
 =?us-ascii?Q?f0Dh7CXscjDePOja5onzls3sZfJz2O9K3tsixEOHP+4Bk5BInLDx6kuOpp+i?=
 =?us-ascii?Q?cLsZ22JJ4i2b310v6P1ZgOGOOC5OtRblz+A1xBeS44LHS3qbTxm50vnyGEdU?=
 =?us-ascii?Q?eASnHbN0xpp7vXQqgguBGZDxRelPVy0wHahXau2pspJZrW4/iWZRm9x4j70u?=
 =?us-ascii?Q?r/yND5gPRuXH3dU0M8pkMlqNei3Kypnip7W+Gi0H3OVN6UHhGA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?anepy5lRf7iKf9HRMGpv2+Zm1wtuktMHFesz1bDwkYNyPB7rpWOCF/N1AZdx?=
 =?us-ascii?Q?hWlRMgepLRtwoBviV5SlLJei7/DlmbnhElnBwoDlZF38fpjuPWcfLvTe6UXn?=
 =?us-ascii?Q?gX95+s8NX4eSnjG5P6C86If3TjD7BYzdS2zEvKyDszALv8Csi2lc8KjRyUC7?=
 =?us-ascii?Q?92Wbeh3Gczl+ArFnTvJqeiqr79jlCqlALEC8kXCsczuzz2uNlWw1GibAshKp?=
 =?us-ascii?Q?E4xCULyhfViYjeH6klllgYd/83M/U/P/akmCoFDKqnczwLFH/7uPMKHjzLNF?=
 =?us-ascii?Q?IL1BnSmQYnCXyj2kWaao0o4PgPHeWA8sjl3itj7M53jRumBqWtszWUisj383?=
 =?us-ascii?Q?JRSL07yzDvJi7Aj0Pwlxsq/xT1hshi099X993oASrbHVlCCg/YiiFoBaWOXX?=
 =?us-ascii?Q?TL+d59L8NulHYADx27pnkIeGSTAVXVRG5wvnKc6DFL/T63Aa3kq6u94Aw6jq?=
 =?us-ascii?Q?TGmbiJWxacNGux0xkwxJXQP6jKX3dgiCbJAS6/PkHnJBSuItldwUiM1WEOD+?=
 =?us-ascii?Q?RMDps5UL+dr5MFPKpg7YpZyvOLwyE179lEGqjEEH5CdEJ0t1ePYMmOrab9tl?=
 =?us-ascii?Q?p1p3TDtPUae4TiQWF1iILpiyaRDZzMznaE+qCDc8CbVlCyR9bSZ17oMWR65O?=
 =?us-ascii?Q?41KfoHeB7T6Pi1wiGfnNsjGFCKChWx9gTjwhnuCtMDlwpBeM/2EymBZNFkze?=
 =?us-ascii?Q?vk+kldieXMj4NPMPUE0WiUZxxXRqjgmK7CgNaDqVK42HQ1xo7VGaU2ndSORI?=
 =?us-ascii?Q?r6KMIgoCaVBnvWOe/UVVFarRf7RfNwTsPyAGoyOFRyOseOtbUQGcPstR6EPD?=
 =?us-ascii?Q?rxLB/My/dKRWm6du6OLVTmL6UWEscY2nIqeD1zn5x5V2XWfNZJZDzpIUYbwB?=
 =?us-ascii?Q?E42hl84pvZ6K7kg1SFx8sJ41eXyotAcJQPRn7y//rxjx2otvKiHiXsIbZW9V?=
 =?us-ascii?Q?ge2q3s6plTH84Xh121FT1vBxeQOLMlQluYf+BdncxdHEnUk71MGskcKpO7Yl?=
 =?us-ascii?Q?mSt5P0vrrCm1NTTruFIAV1I1W2fP8dQ16GNDLWiPkWskU7ohADRpGs66QWA5?=
 =?us-ascii?Q?E7NX45CRkLlQAq9QudgQ9Bx/zwhGwo7VjSHR1cCQzgKjf4GuSTcr5orYMiKN?=
 =?us-ascii?Q?cXs+cIr3gJPIm79AHYpLB+yhlruH+hU200BGezseTsiUXflQQ8YgINPVi8ka?=
 =?us-ascii?Q?A4ECSSwAAFr5vfOTSEm2iiW1cRWsUJdOnErYpyFyoiHbFgZKGj7YUY+jGvAP?=
 =?us-ascii?Q?tn4oKSS1yksKYPsR/gCX0k2sRmTvKOU4tsnUQvDNqp4xsTNhzu5B2g9hH+VF?=
 =?us-ascii?Q?oR7CtzD9Qvsk1YiKvkXaj3cRu25ul4g5Th/m3vs/Bey3WW/fZ9HYmZp4iUMT?=
 =?us-ascii?Q?ppUah+Yf3PqU2sRDLnaBBQ/7VcRyfkNHr9zfzjuSoEohCA8iBoaprzHm/Icg?=
 =?us-ascii?Q?0644Y9fyQNELNyloszdHNPCM5aaxEhc1Z1tDJvfW6Gwk5hr2U/9FjkVA1bwJ?=
 =?us-ascii?Q?VG4XLqu7X0+3Rfmc22DAQZfsQiWxn+RwmICaptk20/JrQiNN7Hz505Hk3uDO?=
 =?us-ascii?Q?yM/nad/ltUywKBe3FDzDn9yElZXpg6eIjHabJsOL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14990d85-5240-4d13-cb29-08dd564a6353
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 09:46:05.6664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQyiPDNlO6GDtMmvqSiWaOnK2qiE8rA4ydDxeSE8S/C3EdTz4DnR/GsfFWea/NWP6eWVVL9d8gl/+XhlYWX1BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_014612_036428_49CBA200 
X-CRM114-Status: GOOD (  17.03  )
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

From: Peng Fan <peng.fan@nxp.com>

Add compatible string for the protocols by adding new nodes
The current nodename pattern is "protocol@[0-9a-f]+$", the new node
name will be "scmi-[a-z\-]+$".
With compatible string and new nodename, cpufreq and devfreq could be
separated into two nodes. And fwdevlink could correctly link suppliers
and consumers.
With compatible string, and driver updated.
- Differnet vendor drivers with same SCMI protocol ID could be built in
  without concerning vendor A's driver got probed when using vendor B's
  SoC
- NXP scmi pinctrl and ARM scmi pinctrl could be both built in, without
  concerning arm scmi platform takes nxp scmi pinctrl node as supplier.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

RFC:
 This may sounds like that adding compatible to resovle linux driver issue.
 Yes indeed. current scmi framework limitation makes it not work well with
 fwdevlink, wrong suppliers maybe linked to consumers.
 I have tried various's method to not introduce compatible, but rejected by
 fwdevlink maintainer or scmi maintainer
 There was a long discussion in [1][2][3].
 [1] https://lore.kernel.org/arm-scmi/20240729070325.2065286-1-peng.fan@oss.nxp.com/
 [2] https://lore.kernel.org/arm-scmi/20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com/T/#mdd17c4b9b11af9fae0d5b6ec2e13756c2c6f977d
 [3] https://lore.kernel.org/arm-scmi/20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com/

 The binding changes are posted out to see whether DT maintainer's view on
 whether introduce compatible string is welcomed or not.
 I not include driver changes, because this is just to see whether people
 are happy with this or not.

Quote Sudeep's reply"
I am not blocking you. What I mentioned is I don't agree that DT can be used
to resolve this issue, but I don't have time or alternate solution ATM. So
if you propose DT based solution and the maintainers agree for the proposed
bindings I will take a look and help you to make that work. But I will raise
any objections I may have if the proposal has issues mainly around the
compatibility and ease of maintenance.
"

 So If compatible string is agreed, I could continue
 update driver part in next version or SCMI maintainer could help.

 .../bindings/firmware/arm,scmi.yaml           | 300 ++++++++++++++++--
 .../firmware/nxp,imx95-scmi-pinctrl.yaml      |   4 +
 .../bindings/firmware/nxp,imx95-scmi.yaml     |   6 +
 3 files changed, 275 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index abbd62f1fed0..3c6ac8ab762d 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -156,6 +156,207 @@ properties:
     description:
       Channel specifier required when using OP-TEE transport.
 
+  scmi-clock:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: arm,scmi-clock
+
+      '#clock-cells':
+        const: 1
+
+    required:
+      - '#clock-cells'
+      - compatible
+
+  scmi-cpufreq:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: arm,scmi-cpufreq
+
+      '#clock-cells':
+        const: 1
+
+      '#power-domain-cells':
+        const: 1
+
+    oneOf:
+      - required:
+          - '#clock-cells'
+          - compatible
+
+      - required:
+          - '#power-domain-cells'
+          - compatible
+
+  scmi-hwmon:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: arm,scmi-hwmon
+
+      '#thermal-sensor-cells':
+        const: 1
+
+    required:
+      - '#thermal-sensor-cells'
+      - compatible
+
+  scmi-iiodev:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: arm,scmi-iiodev
+
+    required:
+      - compatible
+
+  scmi-pinctrl:
+    type: object
+    allOf:
+      - $ref: '#/$defs/protocol-node'
+      - anyOf:
+          - $ref: /schemas/pinctrl/pinctrl.yaml
+          - $ref: /schemas/firmware/nxp,imx95-scmi-pinctrl.yaml
+
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: arm,scmi-pinctrl
+
+    patternProperties:
+      '-pins$':
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml#
+          - $ref: /schemas/pinctrl/pinmux-node.yaml#
+        unevaluatedProperties: false
+
+        description:
+          A pin multiplexing sub-node describes how to configure a
+          set of pins in some desired function.
+          A single sub-node may define several pin configurations.
+          This sub-node is using the default pinctrl bindings to configure
+          pin multiplexing and using SCMI protocol to apply a specified
+          configuration.
+
+    required:
+      - reg
+
+  scmi-power-domain:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: arm,scmi-power-domain
+
+      '#power-domain-cells':
+        const: 1
+
+    required:
+      - compatible
+      - '#power-domain-cells'
+
+  scmi-perf:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: arm,scmi-perf
+
+      '#power-domain-cells':
+        const: 1
+
+    required:
+      - '#power-domain-cells'
+      - compatible
+
+  scmi-powercap:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: arm,scmi-powercap
+
+    required:
+      - compatible
+
+  scmi-regulator:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: arm,scmi-regulator
+
+      regulators:
+        type: object
+        additionalProperties: false
+        description:
+          The list of all regulators provided by this SCMI controller.
+
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          '^regulator@[0-9a-f]+$':
+            type: object
+            $ref: /schemas/regulator/regulator.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              reg:
+                maxItems: 1
+                description: Identifier for the voltage regulator.
+
+            required:
+              - reg
+    required:
+      - compatible
+
+  scmi-reset:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: arm,scmi-reset
+
+      '#reset-cells':
+        const: 1
+
+    required:
+      - '#reset-cells'
+      - compatible
+
+  scmi-syspower:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: arm,scmi-syspower
+
+    required:
+      - compatible
+
   protocol@11:
     $ref: '#/$defs/protocol-node'
     unevaluatedProperties: false
@@ -169,6 +370,7 @@ properties:
 
     required:
       - '#power-domain-cells'
+      - reg
 
   protocol@12:
     $ref: '#/$defs/protocol-node'
@@ -178,6 +380,9 @@ properties:
       reg:
         const: 0x12
 
+    required:
+      - reg
+
   protocol@13:
     $ref: '#/$defs/protocol-node'
     unevaluatedProperties: false
@@ -195,9 +400,11 @@ properties:
     oneOf:
       - required:
           - '#clock-cells'
+          - reg
 
       - required:
           - '#power-domain-cells'
+          - reg
 
   protocol@14:
     $ref: '#/$defs/protocol-node'
@@ -212,6 +419,7 @@ properties:
 
     required:
       - '#clock-cells'
+      - reg
 
   protocol@15:
     $ref: '#/$defs/protocol-node'
@@ -226,6 +434,7 @@ properties:
 
     required:
       - '#thermal-sensor-cells'
+      - reg
 
   protocol@16:
     $ref: '#/$defs/protocol-node'
@@ -240,6 +449,7 @@ properties:
 
     required:
       - '#reset-cells'
+      - reg
 
   protocol@17:
     $ref: '#/$defs/protocol-node'
@@ -275,6 +485,8 @@ properties:
 
             required:
               - reg
+    required:
+      - reg
 
   protocol@18:
     $ref: '#/$defs/protocol-node'
@@ -284,6 +496,9 @@ properties:
       reg:
         const: 0x18
 
+    required:
+      - reg
+
   protocol@19:
     type: object
     allOf:
@@ -358,49 +573,64 @@ $defs:
           Channel specifier required when using OP-TEE transport and
           protocol has a dedicated communication channel.
 
-    required:
-      - reg
-
 required:
   - compatible
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: arm,scmi
-then:
-  properties:
-    interrupts: false
-    interrupt-names: false
-
-  required:
-    - mboxes
-    - shmem
-
-else:
-  if:
-    properties:
-      compatible:
-        contains:
-          enum:
-            - arm,scmi-smc
-            - arm,scmi-smc-param
-            - qcom,scmi-smc
-  then:
-    required:
-      - arm,smc-id
-      - shmem
-
-  else:
-    if:
+allOf:
+  - if:
       properties:
         compatible:
           contains:
-            const: linaro,scmi-optee
+            const: arm,scmi
     then:
+      properties:
+        interrupts: false
+        interrupt-names: false
+
       required:
-        - linaro,optee-channel-id
+        - mboxes
+        - shmem
+
+    else:
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - arm,scmi-smc
+                - arm,scmi-smc-param
+                - qcom,scmi-smc
+      then:
+        required:
+          - arm,smc-id
+          - shmem
+
+      else:
+        if:
+          properties:
+            compatible:
+              contains:
+                const: linaro,scmi-optee
+        then:
+          required:
+            - linaro,optee-channel-id
+
+  - if:
+      anyOf:
+        - required: [ scmi-clock ]
+        - required: [ scmi-cpufreq ]
+        - required: [ scmi-hwmon ]
+        - required: [ scmi-iiodev ]
+        - required: [ scmi-regulator ]
+        - required: [ scmi-perf ]
+        - required: [ scmi-powercap ]
+        - required: [ scmi-power-domain ]
+        - required: [ scmi-pinctrl ]
+        - required: [ scmi-reset ]
+        - required: [ scmi-syspower]
+    then:
+      patternProperties:
+        protocol@[0-9a-f]+$: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
index a96fc6cce502..e9c08f1577da 100644
--- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml
@@ -13,6 +13,10 @@ maintainers:
 allOf:
   - $ref: /schemas/pinctrl/pinctrl.yaml
 
+properties:
+  compatible:
+    const: nxp,imx95-scmi-pinctrl
+
 patternProperties:
   'grp$':
     type: object
diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
index 1a95010a546b..048db78c9887 100644
--- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
@@ -19,6 +19,9 @@ properties:
       reg:
         const: 0x81
 
+    required:
+      - reg
+
   protocol@84:
     $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
     unevaluatedProperties: false
@@ -40,4 +43,7 @@ properties:
         maxItems: 16
         $ref: /schemas/types.yaml#/definitions/uint32-matrix
 
+    required:
+      - reg
+
 additionalProperties: true
-- 
2.37.1


