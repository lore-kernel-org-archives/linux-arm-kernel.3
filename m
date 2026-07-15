Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B17C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FngayvHBAoj+/PxqT9NJfMx9Z+0Va0qsofMSXmId85c=; b=DG5FPlmeaiWKK8lxqVQAWJe89x
	9Du1eMYuZDHY7/Gr826rcFgbIo1+YB+Qzn2spkPmkaisNZeNckk/+sxczEUd1I/MU6RDlCtXsqN9o
	SF9QhF4VJvQZmsGxMCTTIkqtjDwrrqJK++o48YNcXo7M0Xu3wu7+X70ccqMZs3j5wz14vr+78Mkwz
	yAksL/I7ZJLSs9jHHdXMpXuk0r9ofkYJNsBy7z8AbdIeoc4jA8++yoT+d9GO5KHV1JcePF//GHDfa
	MC0jSX7omzDZhmyFp/sUo7ldY3D/siHWxudW9lDCZEWZlho1ARGp3TDRP7DKNnVkW26sMi5fvxCUl
	Sxd2Z/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxqB-0000000EaFk-1rH6;
	Wed, 15 Jul 2026 11:31:51 +0000
Received: from mail-swedencentralazon11013015.outbound.protection.outlook.com ([52.101.83.15] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxq6-0000000EaB7-0e9r;
	Wed, 15 Jul 2026 11:31:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugSrD/xNVu5tSGRDp1rEo10XTEi8KWgDNDN+xLYPhNQzWeR2TEgGOI7NRcXxC5iuwwpftka8O0Idth1FKrl/Vr14JX1iIfn2dp9YMk1kZvnx5z3WKgWnIVy1OIWFKBuHs7yER+cALhRFqmksBqMjbHXOoMJeu2ql8pEKbC0YIKSa93ceNzOMA6fqCUHwU8GvEusRQPBrasi+RkBmCuoHRZLtpWNcwEA6EvsEoTPSp0gcGoQPvB9U2d5D7KhhqfOKxfrPa0uBOY/PYR+cCYP26+ev6hr66Yh5hTCACsS5jQBg7ac73ogiCHqpC5tIT9XHokbjAP2Rarw4bqoGPZTRDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FngayvHBAoj+/PxqT9NJfMx9Z+0Va0qsofMSXmId85c=;
 b=yz8JqMjBrFdEPxmntn3Lwg0hGxHquqWTck0/B8rgQmJxiOH60Oa5+USf9oiAVj/kS299RC8k8u5jywGg5meNVT6R443RSVoUGU7xSspr0OsVtx3Mq0W1zEBah9OaBZ38uf6qUJ+unExP+i4Rk2MP0D3FfYzz6VLbqgKjPPI4JVgdg+W3Uxvxol3zPerNfdyUh6GBFvN+Usc2EQofIncB9JmuxALCphnUw3OFq6mBQTF1qVAoI0Y2VNKADCVTlsjVBISh9vjGp1rj7iYre0ln/mX+MuKswPkEgeBgIzaC7FCZcp/kpzqPya/LQsNZzPhSQ7NWqbuqux5P+wCryVX2GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FngayvHBAoj+/PxqT9NJfMx9Z+0Va0qsofMSXmId85c=;
 b=cpu808bolAiFdwWyhn72Rct1ER1JM2ey5sXUgrVpYcS8K2TWZAAPA7urIvi9N3J1PzpvHWLa0YjKa2jgWy/9vJcFe+tZODK/29daTAPcKQHxHUpl/EsqlhkcBnplEWrHcNcVeNhz+keTpmAvrGZGM4D+Vh6EvQxAEMbUCflIODdsPMIs4zQu8Tu9bWBZajIK+TgnA1GqtpWN8J/rSxjY79n7LSdY7f78+YeXwxGoVDIcD13SQ/7lm3v93r/4E274c+3i954oeIUw4Sed4gEI3hFT4xs50uFBXUTvmDYZ/zgMl6fFQ0dScBm80rC6tpT2ChsvXSm6Bp9zoxR2pM2dQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DU2PR04MB8982.eurprd04.prod.outlook.com (2603:10a6:10:2e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 11:31:05 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 11:31:05 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 15 Jul 2026 19:34:01 +0800
Subject: [PATCH v6 6/6] phy: fsl-imx8mq-usb: keep PHY power domain runtime
 always-on for i.MX8MP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8mp-usb-phy-improvement-v6-6-00d95e270e4c@nxp.com>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
In-Reply-To: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784115243; l=2286;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=kLzuGj/Y+CnGPVZyVB45XjBGff4ec67lzUjxvTNPg74=;
 b=kGmH6XtUmhwPVDP8KH/ZESosztcnyu5RvvTyHY1Wq85t3p4+3bOCiMKW+5bWSn2odMdmeNuWm
 N4LxYnLMe7QAw9/rwQP2zfGnuc2LDzy/Gx/qC+OC64+AnaiIVfBcDA1
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5PR01CA0291.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::18) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DU2PR04MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: 3393dbcf-4f9d-4761-ffb9-08dee2648ef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: G40vm0KjARNVchkKRs818C1rFkbDXGs5aU8Ep9i3TKkOlXGenUa6fHNJs/58F7MSnd8djXZJf040n4G23FkXcU0wu0TGkFItf6QcAErL+rN3mRv6cPiXxziM1Pf+q3tJVJLi8/x/F0h3SO5Tjxpddl7H+/B96LBaV6cq6tVhiM+xFezB3HTshNj/HJ6n8MLjcrIJTZnqPEFCk+ktE5kUSZanYkKlpubSJ8IdyWEOH8NtCNcQpr9DQFLwYhsZepitnFjWqUJEUrTPCo98m5eYZjHEbk4YmtCHoSHU5alvrkhUloA5xGUDMrKbCiwK1ugDODCStC7HatMhsf0jRre+VWHLNfJ/YhcK408U4ptiLh4PehXaUvEz2n0r3t9N19NS/h1bIK7O71BrwBS51o8g2ZJViNd+LscTuB4thm0V5IlPjctsYoByNoo5527M4du5KgiKPq9cD1fu4QgCqXp9GcbwBurFdqEvyS2WX7JVU1FYqfuuYLTPgYQLjdUrtJq/ZfOJ594BKfOEP1FnPnlKzNWYINFQmDbe7lccx+03QLY3P5fq/gU1YYaV55zP+oAiOrQmY8BXyMvU2jnEVvTKma/NwXOAG4cOyCZqfFgpzx6POXeZloD4txfknEuhPpNLlvLaVQbE3YzCoYJlMFSfxb7OxGXgHl+7NZgBitNyDnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0dXYk16aTJrTVIrWjl5dmJxTnQ4SUIvLzRlMDEyOEF0U2dEL0ZtZU5RTHpU?=
 =?utf-8?B?aU5YbXhWLzAzRnJ5Rmdrdzh0bWs1aHJQcVd4V3Z6WXFNSVZ4SXRaSzl4MThE?=
 =?utf-8?B?MDBVZ2dsd0Z5V3BNOFA3a04vUFVqaWdIWEtJM1NtYWJMdkFTc1pCZ0V1TmNZ?=
 =?utf-8?B?TS8wSXB3NkJkamZTbDFjRUVJMEtzbEhGckxMcHFoQW5McVFZTURzNDdBWE8y?=
 =?utf-8?B?UklaYm1EcTRoSmRvVVVEUERYNTZsV21rdS9MRXRGMFBUb0NxY0pPemp6K1dr?=
 =?utf-8?B?MDA2cTc5TjBxTHdSYmxiVGxoZkNGc2tOK3Q5ZG81TGhRcWJRbS9jNVpYVHB2?=
 =?utf-8?B?ejZGbjlMbERsK1NWdW1MOVBZc25nTWRPaFIvS0R6dDIwd1lJUFNiUGF6WnBi?=
 =?utf-8?B?V1Q0L29CZy90VHEzMjhSbS9BOThtcjhJdW5sMGo3YWdNTTlqWVB2VmZVK1lZ?=
 =?utf-8?B?ejNQQTdoTFYyMGVIRnV5aDd3SG5OZVUvQ0xZdVdpSWhRWDRBUGRXMDRrK2dX?=
 =?utf-8?B?ZUxUK0ZWdVB3clRjcjV5RlZaUVdaMCt3d1FoeXllMUdJUTBZNXFRSXV5aDlH?=
 =?utf-8?B?UGVuRzdSL25ZblhpY2ZDclhUeElobm5KUFlGb3JVd3MwQlUzTXROaGhoOGRV?=
 =?utf-8?B?QTRVVXIyWHJTZ21GNnFPN1ovUm1JT1V3bFc1bkQ1bTc5Z05SbXMvMWEzTDkw?=
 =?utf-8?B?Yy9LeHVvdGg2bFpUdTRySjdXYnljamlGU0d2RTRnNytFRW5OVkh4b2lWMXJH?=
 =?utf-8?B?QjdRWWVXVEJQSWtOWHhLYk5yeEJjdkFNMVBOamw0RThEMy9NcTM2NzRvZTJq?=
 =?utf-8?B?SmNudkhIbEFVWkp0S2VRV3huNkFDaEhjdU0rbVNwU1ZnejNDV21jSVlaU1FH?=
 =?utf-8?B?NFhXKzNva09INitHK2J5OXljYTVzWkIzWlNUR2dhc1BHc1NabUN6K2FYdGtQ?=
 =?utf-8?B?bWVBcUdPdVZ2VjFwbVJROUFUTjZoOVMvcHZwUHl2MVlyMTNQcWZqeUtReDI4?=
 =?utf-8?B?a2FMU0NtazVrYU1XdmJhZDZUY1FudXlkRjBPcmdOenNvQjBkQjM0QkVrRkJu?=
 =?utf-8?B?SFVmS1RLODVFV1JXTjMvRVFqcnZGM3pMZnRhQjJDL251NC8wSmV6N0NHQ0Rt?=
 =?utf-8?B?ckNPTG1mdkZXWGJyL0hFblMrY1FQSUcxaVFULzI3NEVqbTdvcngwMWpReDlY?=
 =?utf-8?B?RkU1cEk1a01zSlVmdllxbTh2L3pBM1UvZDJ4Q3ZLUkJMU0hRVjVtWDN6MHlB?=
 =?utf-8?B?L1Bmd3ZiR2lYdlBjdy93RWx2NkVYNFhWQlZiVnZic2tyRHVHMkZhNzNpOVRW?=
 =?utf-8?B?WnBSdFArMzRmR08weHFQZnJ6bWxjUTBRckJRNDBhM1M0OEtXMksyV1RmbHRr?=
 =?utf-8?B?U2xzTlBadmMrOUFhYUZJdHpYdmFkSnFDbmFjWGZUaWZZeDRWaXo1ZDQ5SVZU?=
 =?utf-8?B?VXNLS24wK0p2eGFISUY4UVUxUU5BeC9OS2hrQkg1NVdRL0U1b3RZWlJNbHVO?=
 =?utf-8?B?RXlueG5ZYjRpWTFMZkNtV1EzdVNCOXk4TzlobXZoZWU3ZThPbk9GNERmanVQ?=
 =?utf-8?B?S2g0eDVzWnNlckIzcWNTdlBkdXVQaUtPajN1TDlIMXg0TG1wYXpWekRINlVD?=
 =?utf-8?B?NFVTTUNsbCtjQ1hUMVI5aFZPaGdZMndpS3pKNk0yQVY3Y1hLeHRWc3dDV1dF?=
 =?utf-8?B?Ym8yS28vbkVaMzFEZkc1OS9mTWwvZFQ0OGRaWkI1RE9QTEIxK25OVUsyK2Z4?=
 =?utf-8?B?dGR5aXFOcklmcWV0ZXZubmhYam50V2xHNnlpOStjZHlDNW03RnZqV3JKWWxs?=
 =?utf-8?B?M21NZXdGVXBpSXNmQ1RXUFovdTVyWnVOQUl6bjJ3cDNqdlA1dGgrMWhjR2o4?=
 =?utf-8?B?cy9tMXIzUSt5MWF0aG14WkJDZWM1dXN2ckhRK3ZXZXkrQnAxakFHMXlDVXZH?=
 =?utf-8?B?Tjh5cXR6Q2I4MzVPQmI3bTczM096ckp1TnNYWkZGODl3MDdwVlg1WjZ5QmlT?=
 =?utf-8?B?N2dTUmZleXUycFVUWk5zM3VHSFBXekhjZE90dE1nbU1PTGhMUEd4cnRkeDdG?=
 =?utf-8?B?aFJXQU1GRFdDeC9VWldDbkJMT2sxcW52aFBtRnhYcDZ6Nm1OVDdVOGxKNmJ1?=
 =?utf-8?B?OHNJT08zNVZnSklkSjVIelZsa2lDMVdHd2ZDZmQzVFpBQkw2Y0YzYS9KeTRF?=
 =?utf-8?B?aHZkMjRCanoxSmRRNkNIVlpmRDhST2VoS2MvbFd4SEt4UXBQRmFIQkZPL2ZL?=
 =?utf-8?B?cXZxUFNYekE2SlFuaXVyQXdCNnZmbFNtV2srSW1vK0JyVno1RnI0Q1poRHZH?=
 =?utf-8?B?ZU13YlVUeEdVQWF5VURMMmhDRG9DN25MYW1WcjhEM2hhcXAycTAyN29xa0M4?=
 =?utf-8?Q?r0FVq7kVb5sPbetpckvnA5MT8zTKrVjWgNegd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3393dbcf-4f9d-4761-ffb9-08dee2648ef4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 11:31:05.7667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cq3WE/xZct4dtGC5mPgumIa53+M7hVIB+AZJVLBpmujSYuqW+vIAdza8pMN2TME239Bj33wq42bAG8w2KX+4ouScgGAM64vHY3VeRnr0e3HqcwxTN/lr6D7zaMNbl6/E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_043146_413411_E9685E50 
X-CRM114-Status: GOOD (  14.18  )
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

From: Xu Yang <xu.yang_2@nxp.com>

On i.MX8MP, the USB PHY has a dedicated power domain that was previously
never powered off at runtime. With the introduction of runtime PM support,
the power domain will be powered off if the device is runtime suspended,
which breaks USB wakeup functionality.

To preserve wakeup functionality, mark the PHY power domain as runtime
always-on for i.MX8MP platform. To limit the behavior to i.MX8MP, add a
need_genpd_rpm_on to imx8mq_usb_phy_drvdata and set it as true for i.MX8MP.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v6:
 - set need_genpd_rpm_on flag for i.MX8MP and call dev_pm_genpd_rpm_always_on()
   if the flag is true
Changes in v5:
 - no changes
Changes in v4:
 - no changes
Changes in v3:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index f0bdfa75d586..2398bda50eb8 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
@@ -134,6 +135,7 @@ struct imx8mq_usb_phy {
 
 struct imx8mq_usb_phy_drvdata {
 	const struct phy_ops *ops;
+	bool need_genpd_rpm_on;
 };
 
 static void tca_blk_orientation_set(struct tca_blk *tca,
@@ -669,6 +671,7 @@ static const struct imx8mq_usb_phy_drvdata imx8mq_usb_phy_data = {
 
 static const struct imx8mq_usb_phy_drvdata imx8mp_usb_phy_data = {
 	.ops = &imx8mp_usb_phy_ops,
+	.need_genpd_rpm_on = true,
 };
 
 static const struct imx8mq_usb_phy_drvdata imx95_usb_phy_data = {
@@ -739,6 +742,12 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (!phy_data)
 		return -EINVAL;
 
+	if (phy_data->need_genpd_rpm_on) {
+		ret = dev_pm_genpd_rpm_always_on(dev, true);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to set genpd rpm always on\n");
+	}
+
 	imx_phy->phy = devm_phy_create(dev, NULL, phy_data->ops);
 	if (IS_ERR(imx_phy->phy))
 		return PTR_ERR(imx_phy->phy);

-- 
2.34.1


