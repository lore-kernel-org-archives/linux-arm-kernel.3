Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6CAC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 01:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFvIoliiIB3FN+LXXGsPPnv6Jg23ngEEgJ2J1dCKryc=; b=cPsL8CyS8fcDFsKFcTACZh7j83
	pGWpAQvPaCcY7ZvZ/KIabJKo4y54nJfVEXnWm+OSxFYSTizurbwWgfbvtR6QNiGN5RpHpBVDjkDv2
	c4G8TvDCZ8yuR54AUGeHMoN0zzR3P/MjJih4USakYmR6OKzdz0x3PnmrebDhTn5gQAzPPnpPWVPiW
	O3jWpDcI+jgosikj7uzUV0hb3C5WCJS+mBVoueAmqQ9PRJ9ztnwG85B77SMsrKReModJXnmMM72mm
	iilzlYq7ljad6+0R3crVGLgldpTFZnzzK0koWa3d0QXDcPM6tJbkSRWoekhU/Kv6oaWRNPU/HFZ68
	IvKHmZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYF9l-0000000DaZF-1TSM;
	Thu, 16 Jan 2025 01:58:49 +0000
Received: from mail-am6eur05on20614.outbound.protection.outlook.com ([2a01:111:f403:2612::614] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYF7m-0000000DaHT-2Vaw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 01:56:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5Q9EbOvZMpsV7lHZZ+W9NeZ+yDJJasAB4U0bpaK+cllTPut762F7naMEPrTQsZQ9kWdM4p4azbIR5uV6ZARJfVtW5PNJYFKsPq41IK3PQ2MGPeKpq1UtusaTmZ3BRiyv1bEqSmdU1lH1m7cgdhPh3hnumKMccr8HRO7+/puTIlqlEJUpnw3qbuzY1U/79fE+oexTDOQubeKdO0vynbzr1w9feDU8QOwcIgOBc7W1Sa74L/RIxc0T94RacR/D/1FPQeT/Kle1E2qRrOlEx3SoFbjm4cg2iNEjIFjWHz8AxuJ0ufZUzc3ViFDnuvyFHbuuh/fzzHVciNNGCnmvsg7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFvIoliiIB3FN+LXXGsPPnv6Jg23ngEEgJ2J1dCKryc=;
 b=g2HSYGG+c0ANHUOVDmjsGIcQxbCrNJfRFxUCWPGMJLuXrUIm/dYy1AWWqjc7Xzw+ORm6B+b/t/eyKlNSgW9u8RXCQlZJ3CVcZVJclLF9+UP1VqXQpC0cIUuWo/HsqESK9LhFLJX1xTCOiyGvxOKYEsMGa6T34wwvCPbQoZt7tSGSParsUzDn7APPR3MzNBwFsuYngjfgQYZD1npHoKCI+EJscvpsGMZ75Ie80jQb1kCSgsbl20Wqza2XVnY561C9rg4SDd6Ypci/4J4rVaTZznyWAoOX2DyvQVKPxfxuKZRUam5pyVgsN62MbaNYMfh4TJwOJc93XPGn2pogtDuBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFvIoliiIB3FN+LXXGsPPnv6Jg23ngEEgJ2J1dCKryc=;
 b=Jue1O70IFanykdR0AQg6nE1pu2UwdHKOfW7FRdvZaMacyRfAyt6ZcfNUXr6TWbjBUPQQ6oqcSBsHHFxO01fb0NRMgrE24xVBSpdfP3APt2KV333eOBi17p+R8Syl4L1+hrafEZIbHRM3ydVWv1ZfMA9L0uWN00v+DJNlGRdOGmI+nbiDOtbZ66uaGHz6C+wYvK3iclD0B5qsyrFTvx0YJ5F4k+hPjUSlA1d7+lVfOkUNcCuS0vMDQbLwe/064cju+r2EAJuUovaJfctdr2BXhF/qSpWQxgIcmnZ7g75Z3XKWdmRBqbgWq8bYUD92jNeD7qk2tkfhRuwrKKv/AYVDyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9557.eurprd04.prod.outlook.com (2603:10a6:20b:481::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 01:56:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Thu, 16 Jan 2025
 01:56:39 +0000
Date: Wed, 15 Jan 2025 20:56:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v8 2/7] PCI: dwc: Use devicetree 'ranges' property to get
 rid of cpu_addr_fixup() callback
Message-ID: <Z4hnTPyrnwXqDbDD@lizhi-Precision-Tower-5810>
References: <20241119-pci_fixup_addr-v8-0-c4bfa5193288@nxp.com>
 <20241119-pci_fixup_addr-v8-2-c4bfa5193288@nxp.com>
 <20241124143327.6cuxrw76pr6olfor@thinkpad>
 <20250116014747.GB2111792@rocinante>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116014747.GB2111792@rocinante>
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9557:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a46302-14e3-436a-5351-08dd35d10445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVVCNytPWUxNbVJQbTJuZ08yVEpqdEhMbGg4aVpzMHNEN09Lb2hqWktRSWNQ?=
 =?utf-8?B?dzRJY2tQZ1Fybm5sV0Q5N0FmU1FRNlQxWExjRUcyWUFmMnNRZTdqc3FRU050?=
 =?utf-8?B?TmtBc0RJanR3MGxISG5GT0hBS3pvUytpVDZHK0s5NXFMSXJPcUFRdlR1Vmp2?=
 =?utf-8?B?VU8wV0REeEdtY0ZsdHg4MjNyYmxya3NDQllPc2dJclB0QkFjaW5FbGdWOTRh?=
 =?utf-8?B?cG5GU043RktScURjUTRkS2lpbzFmVFVrbExxNy9iZFJTZ3BVSUo0ajJRYjlD?=
 =?utf-8?B?dkcxc1EvdXRNNjhPNk5MTUdZNkZXRUpUNlhVMGUwak1GZU5OdEVYVjlrM2lz?=
 =?utf-8?B?Z2I4TE1nK1E1QzBiaktVeGR1TzEreHd4QnV3OWUySWJaUldGVkp0WUFLdW5J?=
 =?utf-8?B?VWFkYzcwUGk4TjRlcHhCZDloYW51L2lOOWUxeWxYOHhGVjh6cGNIV2wyQ1Y3?=
 =?utf-8?B?TUZMSC9rMmt4anRKR2Q3RlBrdGpsYjdrbFFPYkxSYmE3TmZabEFTRmE3YlM5?=
 =?utf-8?B?NzNqd1FLaW5uN0UxcjFId3h1ZE9Yb3dyTHhaU0E3R3pQdzZTbGR4U3NYOHRt?=
 =?utf-8?B?RHZwZG5PakNaQ0l0TVVveE5jYkRiL2tjUU1iT29RQ25mVTMzU2JhWnFVN2o5?=
 =?utf-8?B?WUNtUWU1aUJHajMzUFJER291d1dKbU13ekZlZTFkdlVGTEtIUVN6VTZIdzJl?=
 =?utf-8?B?T21uTkhXai9MdHlyelR6bC9HMk9BWXJ2UEZwSG9ZZFZJQUdmdDM4SkxaOXVC?=
 =?utf-8?B?RFBzRWRnU0pEOGZFZWJLeTFWWWFVcjQraDh5K2MrMU94Sk5ObHo3Q1V4ZXpN?=
 =?utf-8?B?T0NHamxYbGFwRWIyMUVPZGYyaXZtdVN0Qy9odEliWUt1WkhhUVl3bFk4RDNk?=
 =?utf-8?B?NmNZVDYvOXFaTXJtZU5KaGtFa1pObVZmTGgvS1MzM3hzSU9KUk5IMzNiNnYx?=
 =?utf-8?B?WVhqSDkycml0R1FDMWNjR2ZOOWt6NDNMSGlSbFlxU1luZ1gyVTZCMXZkTEUr?=
 =?utf-8?B?YWJJZlMzeU16dzRWL2VxaG1JdzUzZWxaeGIwc3B3WEZBVEp4TUpRZWVvZVZ1?=
 =?utf-8?B?M0JMNlF1SkhsS2E5bXoxYTluOXJtbXQrN2lZVWxVby85V0g4a0oxSDJCY2xH?=
 =?utf-8?B?TkZVd2l1dnlzQkx6QU9Ia2NWenFKRU5hK3hGcUs5clJXcDJvamhiUUhYYytI?=
 =?utf-8?B?bThQRTVRQ3dnSzNxY1hGUFVqQ2pUMTBFbHRCdHdzaWtpVVlheURSYWFiczlP?=
 =?utf-8?B?YlNDTlBmWEJyNDJFNENNZ3diR2xFcDB3YUViMVh0ekJYVWNlR2ZoUW4vMkdy?=
 =?utf-8?B?YmhPRWladDdlZ3huZi95bFpueVJhYnBrY1dDeFc0MEhrSkxNYU53R2pWOXRI?=
 =?utf-8?B?d21yUkZubld6S3F0Ulc2OXJPdmU5d21HQlZLTGRpWW5yRzZLN2JwZ0haSHIr?=
 =?utf-8?B?RmpKK3MrKzFFMEdzakIwN2c5QWNHM2wrQk1XU1JsSzFrbGJ6TXJyZFJVcWJ2?=
 =?utf-8?B?TDVJd3FWNFpJdzRWcEF2QVlpV0tZZnVQTldhQTNrWC8vdzBGTDhUM1NWUXFT?=
 =?utf-8?B?NUtWbkdOTERQSGtLek9ET0JVdHFrK05ZbzZMUk14Nk0wT3B6cTFQR3M1ejBB?=
 =?utf-8?B?anlEOHpCbEF2VEZSRGJKRjhhNDRjUTZRVHd6RlM3ZjRMNkp3VDlCMnhpWUFx?=
 =?utf-8?B?RDFtZ2lKSTcyUFNReVMyUzBEMUhxa1FIVlErc24yNVhNeHlmVWNJVU5NNEVp?=
 =?utf-8?B?ZStWY3ZJY1l6UzE4UW10TUNVbEd2RzdXWDJETFJiWWJoK2srZllPUTRPRHlr?=
 =?utf-8?B?QVVORXdlU0ppY2JDRnA3bjZBeHlOVHNQM29rQ2Q1aDJqdmRJeE9LWWl3Vno4?=
 =?utf-8?B?VU90UDFDYWo5OGJpRmhtTGZ3RUFJaU1zckhjNTc5M2cyakRyVGt4SE5mblFi?=
 =?utf-8?Q?nAFy9EvHkzvJbiOOd3rczsKl8u06Q85A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGFZZlZDdlVDTnNDWHBsSys4TGh1SXB4aXBvc1RBRVNkcmRqTURDM3NnQ2do?=
 =?utf-8?B?RFRpNUxxRm9rNHhkOGpkekM0ck94ZXMxZVExUk43Y0c5bkdDZHAwU1pwdk1G?=
 =?utf-8?B?ekVUdWFieHFwbUwzeG5HNFo4bnNKRURIdXAwSUxpWE5naW9jUU9BQ2NwMlBH?=
 =?utf-8?B?Umh3R3FVazErYUxFYnFMSGdQeURXTXppRnhRUEpRdzN2eFVrYkRZOFkxdDhB?=
 =?utf-8?B?eVFrTndKZnh5YXE2TTFWK2F0Ni9MaDlwdU5ad1dXeGFuNHV0blo4N1NVSFJn?=
 =?utf-8?B?c2NzUGMzSko2S2ltTTA3czY2RWJ3aDcvckpyQ2EzanpwWE9iSStCUmdYbCtN?=
 =?utf-8?B?NE1sS09oUWNjSTJ5S2pyRmxyblJoV3dCbFVaUFRSZ1dicTlnbzV3dEliZHk0?=
 =?utf-8?B?cDFKVzFUSWJoWEx1TytVQzlaS0o3UVRRNk1JQWZBd1IvZ3dqNys3SGNOdHFY?=
 =?utf-8?B?N1hsU0dTU2d4bmJNOFlwL2JqN1RnMVBWcXdqR0w0Ni9VQVZSRlBFN1B5UmZv?=
 =?utf-8?B?emlnQzNzZS9UdmZaanBtRGRHdjRVWEx2OWVVdjF6UHc3OXhrNUhNam5seHhE?=
 =?utf-8?B?YnNNbGtnajA2S3NFdjJVazNmVW1HdGpia1J3QWNmeC9ES2IyUFVDNXFCQTN2?=
 =?utf-8?B?OVN5d1F2MjFxdWdwNTNzU0dscms4Y0poR1gvQmxiZUlxVVlxTUZXaEZNcDlO?=
 =?utf-8?B?MTJqOVFsSFRRTDJxNzBOUFp4eDdYbzFBbEFjZkdqYWkrYU9VdmtPbUF0MDJz?=
 =?utf-8?B?aXU4VTI2bjhnbEhhOXh6RERWbTV0cWVZWlN5RTF5VGVIeUxLQ2srV3laSXhs?=
 =?utf-8?B?alZXRjB1WnYyZ3lmY3lzOFVBNUsxREFVamFLdExFZXdiN2EyZUZTQVRBUDZY?=
 =?utf-8?B?Mm51Y0FRbGIwV2k5aS9wNkZhL3VmNDl0M1lUVXhuTTB4TkZSL0JSdi80Qk4y?=
 =?utf-8?B?TEZna2RTVy9YZjB3QVZBSHRTSml2SklSYXZXQ2NlNlltcVFocEhncUZoVVBk?=
 =?utf-8?B?WUVtQTJJTUVzcXFPZWtpRlM5L2QxZzFNb3liaWdSQmFqcmlYRXZpVk53RkpS?=
 =?utf-8?B?YkpLdFZLRTZZTC9vbGRVdml0Z1o0UldvOUJVdW9ZSGFpUVJBWG11Ynduc2V3?=
 =?utf-8?B?KytITkVXR3Q1WFcwZFppU3ZvWXdQbDNHTGh0MjhVbzBtNnJkQ3ZiTk5TNFoy?=
 =?utf-8?B?bkdiRE9zd1NibU1GbzlhTFFETUVLYyswZEtYcEpjQU5qczJ1Nm5VZzhQVlpa?=
 =?utf-8?B?YmRwSFdPRjBBNzRFN0ZhSmxNSC9YUHJubVRTd1dkMXpCRlYveDFjLzB3T1Z0?=
 =?utf-8?B?Y2p1SUF1ZEZxb0hncVpRRDdjekl5eTlLRnpQMERxSFZrMTB4ZjhqY2hjb3lt?=
 =?utf-8?B?eE53bk0rSlhicWFDVnhVVXJlSTdQWHFVUTJRYkJ0dDJCSm1TVWVoVFMxN09Y?=
 =?utf-8?B?Q1FWcVVGSENkVWdTMnBXMDZvTVBKRUJvc04zaGYxU3dsZ0FiNmNuMnpKTkRR?=
 =?utf-8?B?RHlMVmFjMXFoWXVTMDlUeXd5eGpwQXRBVkUvVnVWVHNyMUh2MVdybjVvTjZw?=
 =?utf-8?B?MWQyWjgzQXplZ2ZMS0JVa0NmTXdUbWZ4bS9QWUpOb0dnZE5KQlJkbTBwUVQ2?=
 =?utf-8?B?elZYQmhrS1VnSFd4Q2I0RFFtTmYyTm0zbi82c3BFaDFlVkgwcDAySmh6SmJB?=
 =?utf-8?B?a3ROelpVRS9KWGxkc0dZc0FqaU56TStMTUlNTERQUzgzS0xjUHpQL0kzbXBl?=
 =?utf-8?B?TFo0VS9SeE9EeEJqbllLUmxncktYOXNJQUpVVDFzdldkYnJucUlOL1RrdEpJ?=
 =?utf-8?B?cHQzY0ZUVnRlYWNhVkp4bCs0MkxsRnZpaW1QU2xSSjBKSEU0aUZHR2hLZDNy?=
 =?utf-8?B?MysrM2pVY1hiNnZzVHAvWTFMSTl6cjJoME1wSnpqZmxpUmVmQ0pXemZWTjQw?=
 =?utf-8?B?STZjeFl4dnUwc0QraElhcU5lTDdWWVNBMUhDR2lBQTBOdy9aOWxPZ21CWEs3?=
 =?utf-8?B?SGJHam0wckE1N0Nmbm1JSmNQMXpQZUFiMk9kQWQweDVWb0VDTTF0T3FKYjF2?=
 =?utf-8?B?dlhTVksyQUg5eTVRcVRGcjFkTE1pb0NLNHNXWmJxMitvZlkzejk3ZzdyNGVq?=
 =?utf-8?Q?FBMw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a46302-14e3-436a-5351-08dd35d10445
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 01:56:39.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzEL+ayzAV31zXOC/oDooNPzTpAFXQJBoL0uKjcepciUaOFWayjpYCOPGbJwiZq7vlQo5J1clEz4DaZhWhMlXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_175646_635332_A58CF221 
X-CRM114-Status: GOOD (  13.19  )
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

On Thu, Jan 16, 2025 at 10:47:47AM +0900, Krzysztof Wilczyński wrote:
> Hello,
>
> > The newly added warning should be mentioned in the commit message. But no need
> > to respin just for this. I hope Krzysztof can add it while applying.
>
> The commit message will include the following:
>
>   To expedite deprecation of the cpu_addr_fixup() callback, warn its users
>   if the 'ranges' property is missing from the Devicetree or the address
>   translation information is somewhat incorrect.

Good, thanks

Frank

>
> Let me know if anything needs to be changed.
>
> 	Krzysztof

