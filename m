Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87024109C028
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEaWoHk6up2f1s8d/Pf2XfRMzJMLX2C+z8vjCTX06B8=; b=pZnNoUigL6lT2yrx3mfU0Ardry
	iD43jt9V2ALHSuHyZBEtqGorMQPBx3LDcc9d4RJuiasaRvSjZ6is+RfBMARGZeyMFwyYlwlZUufI8
	vsBtJtTXpMXRF9Gb1ACiQUV8LcekIhv3k5dFz+R65Nix1zt5Qhg5gngjYuTrvNxxOkPXcd0jCZJiq
	8JnoAN8len7/dd3zuL8DRi+ZBeIuoDs3O9fJTdYdaVGwA8oCcbA7RlWVa6gcEFtWebPKdaPvcctOB
	F/fLhOiIZviyCa+zSErLWxiiINo7tr3cfnNE4eAGjf6kTbzzR0evXgC7ZtI8oIwJLQp1gRFkzm+cl
	dRfOvDCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PrV-00000003kNA-2Z4M;
	Wed, 25 Mar 2026 15:09:37 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PrT-00000003kMp-2Mf8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 15:09:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBGjFcFDzGysSN8l71/n6XMzPy6jdBw9X7ia6bxK0sYohoW5ldSnzPn+KD5WNVB7SgUZ3SU9r/Pwb5nj4z7yEVf+lGxO/NrXHuUBpJ8oqkuY7u7ThJ05kLsXu3+KeONQF1bVTK5pGvh6GiOF6cGUbmVMtjKYJms10X9JuBPX/D8BmUwYZuBv1zYTTZfnMXunHBCr3c9KId9xNE+b8tfPP0Y1CT7uaAYiXE0jEhVN4sEyGxuUKIFC9oV1rg8y/fH+MQBPbLZA1DRqJiPRzgV0/KgqrJyNrU1MvV6R2v+ePFjmzGKi0cdQeMw0gIZhDgGLrPXpJS0w5PJUrYe9lw2/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEaWoHk6up2f1s8d/Pf2XfRMzJMLX2C+z8vjCTX06B8=;
 b=gqfCL5mWQzT8ftkp2KIkpEFF53pPs2fS0+KV6jrA7DqAOgcQZWBZ78YUAxsMlMvlKEKlHZk+5hVpGSq/jn/ODP+BZ9NwjVMaVbNxQbM2HGRt/HW6Tyv3HTCAsudiD71XE2lNfIRV49zKxJxtmNJOd9gzva8WA2jhSLm7iN6mQpNWhU2BrJkIOXLlDTVf7TY9pRM7dM7K4mW6iKhUAYGOaa+66iQlej55NCh91mEPylJqjPBgREGRHBokzibSjz7r5UdDYw2XZZwY/q4xQIs2uP2sDAhnCKC0zLtHrNqj8meH6p94Nyvn/Wm3N1mQ6ZZRpAe/eeP84vVNuLqN1obcKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEaWoHk6up2f1s8d/Pf2XfRMzJMLX2C+z8vjCTX06B8=;
 b=H2q7H/N+jOwdzyPXZSfUSve4JrOsiAfS8qtzd1ni6SVSoV2nkq5f0mycVs9nYgoGOGl7e1xDFovFTVXVZmscU3dD4zZybjclZX2V3Wx7gCSpac2tlgYInULkew+kOuuejGcrWc/qjaLe1UNmOs6uZpRKwMAVjRgrI1nmb4lizjyufWpUS9TDokS1mAAvZ+jcdXtrVNKN0WDmPFmfFcR1a1YVl5rHpQ8GBkhsz1kVJODEWVk/BRpPIAG0HP7EKqRae+SQ/lsTvdQA9hfzt+r+pAoionXYqk1obEYJjqBdSas24uNvfp1hxIFkos3LTQmp3ZbU1dI16mAHAJ/+L6YTqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB9343.eurprd04.prod.outlook.com (2603:10a6:102:2a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:09:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:09:29 +0000
Date: Wed, 25 Mar 2026 11:09:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3 3/7] pinctrl: pinctrl-generic: add
 __pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <acP6oFsaD8PddWjg@lizhi-Precision-Tower-5810>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
 <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
 <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
 <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
 <ab1Rpf2zS8Bn1-HV@lizhi-Precision-Tower-5810>
 <acLxCnz3qYfAC3iB@lizhi-Precision-Tower-5810>
 <20260325-riding-browbeat-293b47f43d82@spud>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325-riding-browbeat-293b47f43d82@spud>
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: da00eca7-d11c-4815-0eb1-08de8a80832e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ju7Gt63TuOs2Uf8lqOIssfWIKmWKzvuJdJdCqK0ePU/yrzpuy9PvizCHqPClOuaWF4+1jLFOoG8HT52cSaDW1m3nNosYjKk5DvlQUligJEeFUnkniSmwQ6XIVmbixRZt50p744cFXFOJ6zFiPx3vW6jefmKaXrGxUEXScPuwO/2SwLUUWI+2bNd8n39ZPfOgOz/ShUntbdVzl18RYhLRxq+WWSSRc38u25cDsVBeRcHvdEBxDKK/C7d961FdfG0Cpo3uWXclGVOfztIUxbyAzHDCstMlj+TkWGD8iX2SBKkw1ulDc13AiU+gLzaZQN26tS7wBoVYKYCxFLijcI+/oRZYAt3igCEchlCtZJvg75xXmZPRaFtRB2dzLckHhvFlmyLT0RQoXn4GG0bLi23iQrEC+EHsWsWWNGo33kH46+O40LLJBhsODqM+nSbP9ZHLNFUFEwYwbSMTOiorwgFu5HulSFGGEZA0bj3/6E+7IJ6HhdYs4a/sqzLvgIOWfNcq81n8tYRhtgxfSAMu5Vf4ub/iLDj2O4dzWhsOGsh132+Qh13sdZwBBeOOyn7oxkPk6lplDMcNQCcWyykB+5GFMUwbRcPuFJCAuKoMlQPhhBPq7mSt3ZItcjnLedHFbWe9Nkbxmc6bfp4yZ3QVnNFM4Z1WPbmXqd5RLM/VYIzQ8hW77yTDFtrnns3yP82bYXgP1+1OSL8RZnxLTYnSeUcBxai40trS8aRsDkQsCBAPCc1rQykN1epZ+CxiHI3i5VIEE5y7bqc6Ox2OH0RgEJNLdkNY8E6AH1kU/BDwejb5lPM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0ZPcUJoK3ZIT1pqUSsxR2RweDBjaFpQNVhRMXFreE16RjQxdEorbWVMS0tk?=
 =?utf-8?B?MVo4UE9RWFRxMnlMenNkdHhJZUFaYThjQXF5bXVmWjI5NGRhNDNmOVU2Y3hY?=
 =?utf-8?B?ZjRBbHBaT0ExeGhXWU0zclc4WXJGQ2M0ZkFiTlRBNG84YzJPWEVacFpJV2Ny?=
 =?utf-8?B?djhPQ2dYRzR4SEJSMGErUzkycG8rRnRQdXBoSE1pc25Yb0QyTFY2L0FKMlM5?=
 =?utf-8?B?d0FMNEw5dnBNWTFYdC9pNGs1aHJhYVFMMSt6MzFtaEw2TzB2QlBHamptUDJS?=
 =?utf-8?B?WmdrSWFEMTF0QWRIVkpuR3VES0FaWjc5dEErdGZjUHU5aHlSeGxrUHA2U1h5?=
 =?utf-8?B?bjhTUlh6K3EwVVNXNFJOZWxnRzA3MHlwZno2OVZ5dCtyaHRBd3BUNDEwb1dO?=
 =?utf-8?B?Q1JhTXR2bVUzNm5vK3ZEZlBJN3h5eGV2Z0NBcm5ZbFR0U1VSai91WFlHaG5r?=
 =?utf-8?B?UDFzOExMWHAwYysvTFMra1V6VFZRV29pSnZROGVKbkJSRGRmS0duc2dXNU42?=
 =?utf-8?B?T1BNRjZSYUNCSllTYzVBMGxRcjh1dzBWUmFqL2YxUG5oT01pZ1VRd3NrRmxT?=
 =?utf-8?B?UnhBbklxMEh4ZkxENlE4M3piSE5qNHcxT0NuN2tnN3AyeG03YmQ1TlZXclkx?=
 =?utf-8?B?eDJwdTRVZVVyUmw5d1BzKzA5VG1FQVBRaUNpQ08zY0w5SFlMRmNCVXBXaGtU?=
 =?utf-8?B?MGpEVHJ6MXc5bS9ud01oWXBEWFFUaXQ5ZnNjcDczcEhMZ2xaakxyU3h2cDI1?=
 =?utf-8?B?WUZWQjczZk50bG4xRlo2Rm1yRDRhTExDRi9iWWR1MlJoeGFhS3YrYkpHbTV2?=
 =?utf-8?B?bmw4eTRNZHF5SEE1ckhZWVNyK21rNXo2L0VzSHh4cEoza0UwV3c1Mmk3aGJG?=
 =?utf-8?B?TlVsaXVZNVhjelh5UjVYbDlwVDlqWFRtUFk1S0F5Uk5tQy9HVWJXZWVMS0FP?=
 =?utf-8?B?YWdIM2czQURXQzE2K24ra2JSM1greExKTzhEQWlCQmMvYUFHRzFhdzVrd2hW?=
 =?utf-8?B?SGdCSlp5NDEzWU5aQ3p3eHVuOSt0SW5nRG9QTXRJN2pxTWQxVStZYWkzMXpa?=
 =?utf-8?B?ZFBnUjVQVk52djkvR1Qzcno1WCt0Q0dTTFpSbjFxMTgrREEzeWIzVDl3YnBy?=
 =?utf-8?B?VlA2cjIxRzNOWUtmQWFSWnNmNVlaUTVlcWkvUDcvS2pic084WVRJdmthRVFV?=
 =?utf-8?B?NUJuR1VPOTVQSXVKV2d4dm5VUSsrcDJqbWN0RHQwUXJMZndQTjB6YTg3VlJj?=
 =?utf-8?B?WmU4QnFvM1hLNUdEbkJoeXRScUxQOW1wTk9OQlhKTFgxL0xsNnpqczg4RVdB?=
 =?utf-8?B?YW54Y3JOcG53UGVGT2Z6SnlOMzhLUFU4QXR3UjBXYVVXNjlPS1lDY20zMVZX?=
 =?utf-8?B?S2Y5NjBSUUpKTVBVN01FblpBTlptVmVEdXIwQTJsbWs1UW55R3A4eWNpaHZW?=
 =?utf-8?B?WkhkOXkzKzhFeDUvNEJySEQ5TGswVjlvVExSb1ZwYkRWRXhPN0Y3TG44ZStx?=
 =?utf-8?B?NFNhYkpvbjRaQS9QR2lXNGV2Z2ozY1pmTWI2RWMwOW9qdVY3MU5pRWdWQnJt?=
 =?utf-8?B?ejdaUGxlWVpJTXZCUkNBRkVlSTBiR1RORGJ3SmRQemhnc1ZBeGxlMVkyNUU1?=
 =?utf-8?B?YVJjYVczUE95NWt5aEVvUEtOWi9KYWdaZExmenozOFd5dTB1aHdZMElWYlJ0?=
 =?utf-8?B?N21qdXlzeUwzTHBaTjh5dUdqM0ZSNmVpQ2tnK2NPWHU2bUY3VDk2SWJRUXdt?=
 =?utf-8?B?Mk5wVlJURDE3NDhUYjY0ZEVTVlBHbFhkRDhrZ1pGMWZoTDFBaTZjM0I3SXlM?=
 =?utf-8?B?c3QyLzFxbzRFUUN3c1pkeCtMaWhMRUx1RUhSRHo4STMrMXFqUEtNOWwzUjda?=
 =?utf-8?B?UEd4aDFsb1AzT2JqZk4yUGxzV09laVZRWVBQRXUzdmQvNkRqblR2TldsUldq?=
 =?utf-8?B?ajJucW1XVk1rN3VrUFdjSEtKUGs3YUdEVElwRUlsRDlBOGNLbmRWdG5WTkN5?=
 =?utf-8?B?YVlYdTN3VWNhOEFOUFA5eTRxQkVtUzZ3NCtWSXNhbWpJdDJvb0ZpaUgvZ0Vs?=
 =?utf-8?B?ekI0QVhvcmZlcEYyWHJJU0dweDkrUlRYR2tNVlpJOHdBKysyV3ZtR1ZBKzJX?=
 =?utf-8?B?clRaSGdDREhEVjdhVlBCVzFWSU5Dc1R6R3lyTlErM3lRdHpmbVNZbk9yd1d5?=
 =?utf-8?B?YnlkZEgwUHMzZFVySEJkcFRJbVpVdWFKcU1kUjQzZXkxVXNJa1VaVGczYUFw?=
 =?utf-8?B?SGpqVUlNTHRoTjQzQTFXRExNUGErVVJnT0VPN0hvUXVwT09Eb2cwS08vTHRZ?=
 =?utf-8?B?dWVCYUtENGpIRTlhclBGRFBXSVl0cnJ5UERZU2xuODN1RzNwRCtEZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da00eca7-d11c-4815-0eb1-08de8a80832e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:09:29.6100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abqVH0B8jzYzZTXEcxqoWuurOlpLI2zc4voWqUJBPGxlWrtzLjXsrpTUCiwYo2wsbk0At9V8S5EtC/Hkrrk4Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9343
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_080935_609890_1FD6FE5C 
X-CRM114-Status: GOOD (  38.70  )
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

On Wed, Mar 25, 2026 at 10:33:05AM +0000, Conor Dooley wrote:
> On Tue, Mar 24, 2026 at 04:16:10PM -0400, Frank Li wrote:
> > On Fri, Mar 20, 2026 at 09:54:45AM -0400, Frank Li wrote:
> > > On Fri, Mar 20, 2026 at 02:27:21PM +0100, Linus Walleij wrote:
> > > > On Thu, Mar 19, 2026 at 12:04 AM Frank Li <Frank.li@nxp.com> wrote:
> > > > > On Mon, Mar 16, 2026 at 10:37:28AM +0100, Linus Walleij wrote:
> > > >
> > > > > > That said: in this case you're just adding a parameter, just add
> > > > > > the parameter and change all of the in-tree users to pass false
> > > > > > or whatever you need, these is just one (1) in-tree user anyway.
> > > > >
> > > > > pinctrl_generic_pins_function_dt_node_to_map() directly feed to
> > > > > .dt_node_to_map() callback, add parameter will impact too much.
> > > >
> > > > Why do you say that. It already has many parameters, one more
> > > > or less doesn't matter. It's not like this call is performance-critical.
> > > > Just change the users.
> > >
> > > In only user drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c,
> > > 	.dt_node_to_map = pinctrl_generic_pins_function_dt_node_to_map;
> > >
> > > pinctrl_generic_pins_function_dt_node_to_map() need match .dt_node_to_map()'s
> > > declear.
> > >
> > > So it can't direct add two parameters in pinctrl_generic_pins_function_dt_node_to_map()
> > > Need simple wrap function, which other in pinctrl-mpfs-mssio.c or in
> > > pinconf.h.
> > >
> > > If add two parameter in .dt_node_to_map(), need change all functions, which
> > > .dt_node_to_map = xxx_to_map(). and OF core part.
> >
> > Linus Walleij:
> > 	Is my explain clear enough? I am preparing respin it?
> >
> > 	is okay use wrap function
> > 	pinctrl_generic_pins_function_dt_node_to_map_ext()?
>
> I don't understand this patch. The function is called
> pinctrl_generic_pins_function_dt_node_to_map(). You have no pins.
> You're adding a parameter to make a function with *pins* in its name not
> use pins. The new function doesn't use pins but has pins in the name.
> At the very least function names should not be misleading.
>
> I was going to suggest pulling out the relevant portions and creating
> some helpers that could be used by multiple different-but-similar
> functions, but I don't actually even think that there's much in common.
> Most damningly I think, you don't actually read either the functions or
> pins properties at all and neither are permitted by your binding.
> So turns out you use neither pins or functions...
>
> You don't actually have any of these properties which runs counter to the
> goal of the function, which is parsing. With this in mind, it feels to me
> like you're trying way too hard to make use of a generic function when the
> right thing to do is probably just have an entirely custom function.
> Maybe that's a custom implementation in your driver, or a new function
> here, but I think writing that will highlight just how little of the
> code would be shared between the existing function and what your
> use-case needs: no pin configuration stuff, no reading of the devicetree
> other than the node names and no dealing with the label pointing to the
> "wrong" place.
>
> I recently bought a spacemit k1 board to go and write a sister function
> to pinctrl_generic_pins_function_dt_node_to_map() that deals with pins
> and groups (because that's a pretty common pattern).
> I would be calling that pinctrl_generic_pinmux_dt_node_to_map(),
> because it that's the property it deals with. I have honestly got no
> idea what to call one for this situation since you don't have any of the
> properties in pinmux-node.yaml. Maybe that's a sign.

At v2, I implemented customize dt_node_to_map(), Linus Walleij think it is
too similar with pinctrl_generic_pins_function_dt_node_to_map(), so ask me
to enhanance and reuse pinctrl_generic_pins_function_dt_node_to_map().

Frank
>
> Cheers,
> Conor.



