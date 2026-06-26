Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E1DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 19:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lVeHLVb8pPiGcn30PFmmXYNt3mrErvy8ituM8h0eYQ=; b=z3mQldpCuoG+JAwokj/qhga1Jn
	Y5UNUKAGhXXqBLg99gtXIZKbBL3xXJd7taw02V8YJkgLq6yO4HATAPOTaAAuflhNfobDz89EMfVmI
	KefVjXimhMRLVqohNJGSWKeXL22J0mJFc4vpXMzXVggJZMY1SBelHxYinMhMfbYxbaDI2s6vgOFY9
	0G4fo3EP7ZruwAPooBdj6lEKnC1HcJebzKG1qKzSiPpNMr32TL0U+6NEUXreB4xWhFvXnnfsiKaPG
	W9ipawaOtsIEFgF5o4G546hUzRIq0eZzFOBpx3pcyHgkNXEWlCJccrm0bEhh5/ch2+vzmI33bNq0Y
	jeSbCuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdCPq-0000000BnE1-2kEA;
	Fri, 26 Jun 2026 19:40:42 +0000
Received: from mail-norwayeastazon11013018.outbound.protection.outlook.com ([40.107.159.18] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdCPo-0000000BnDe-2NbA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 19:40:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pql7mb5D3hVshP82PlTw47cpR7V7Toq03ELPJiizOVgCa/ev2r4xdnfejdZUuDBdY3O3SpJAeL4y20PukQv1Lq0tE0rjyqDiUaw4418o+b5IeYFdwUcb49ViODW+VJzSNXvUSNV0C+a7qFSl1kMrlUEEbqDSnNeQd+Ms9b9x6TLwz27SLU4p/VaDd4hrFVcRHCRn3/efm6aTqhSjI5sz5+KCGw/jfDKGA9750XHkheKJZ6SPtoA1mvz7/AcCK5oCMRLqa/H+nUsjMKk8c4K28ylDhw5Ni9AxiHLD6fu59GIyi5aJVGlWeDVQvIGQmAPXQsvMWRk/5Bo71aZyFihbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lVeHLVb8pPiGcn30PFmmXYNt3mrErvy8ituM8h0eYQ=;
 b=qFTbGApgU8tIiKih3spGRbUeoPRYl/rb30cVHDGetRD3e8kgza5Ortnxe0OwYz+xBXMD3IoLu1Axz+b5EDLRIhoZ6BeWz+xPvEjHfL559awCqgEntfKAWWW8rhiKGViTYDIFZSlJ5+IYZi5WAH+0J5+bLCi9IV7ykMdDz72ky/v3Tj4mfZJ/0Fq2b79TNKGqbMRCD/ik8FhNH7TASqDYujhz4BRhiF/tv15gHx+tlJ8K/gG6BDc34etjV32mJK/6I7M58ZT1ZATP/7m1qTl2UReLT/ZOLzrRqmNWmBDEtjPu3lJF5n6RzIYfiD4dDVYqhG1Qnj+n/x7h0z2iD1l0BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lVeHLVb8pPiGcn30PFmmXYNt3mrErvy8ituM8h0eYQ=;
 b=h2q+fz9YycSBH9uIiAp6jKaIi7EGBaC5r099bKYQK3lLuymMkvsLPYfZGd3xeBC885JuizI5AuM8qFW/WCX2Zhii9esSK8XmuOcIU5Hehwyv4duQa0iuaORqCSOX54yvKNSnOzdvDw7vFtqPHZJ9M9B5O+qaHsyZ0tk4v1HLrfgrZ2kUqlSOUJ0Nvg58vd7cnY03AokcqeFqHP+BtbSvaNaWOBS7UTyxfrnO2nQ/nYrKGRb7vkhZJ4eeUgUky48dAfKOZXKujsGz+TFQ4nTJRdgEC7ajFIc1tkyRF1s+d5JqgFbI62XH8MKF5OIVTJ2vDbV1RDSm/1tokgcEgR1joA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8819.eurprd04.prod.outlook.com (2603:10a6:20b:42e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 19:40:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Fri, 26 Jun 2026
 19:40:33 +0000
Date: Fri, 26 Jun 2026 14:40:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, amitkumar.karwar@nxp.com,
	neeraj.sanjaykale@nxp.com, marcel@holtmann.org,
	luiz.dentz@gmail.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, brgl@kernel.org, imx@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
	sherry.sun@nxp.com
Subject: Re: [PATCH V3 1/8] PCI: imx6: Add skip_pwrctrl_off flag support
Message-ID: <aj7VpvRQxhCyPVPg@SMW015318>
References: <20260626023126.2189931-1-sherry.sun@oss.nxp.com>
 <20260626023126.2189931-2-sherry.sun@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626023126.2189931-2-sherry.sun@oss.nxp.com>
X-ClientProxiedBy: SN7PR04CA0168.namprd04.prod.outlook.com
 (2603:10b6:806:125::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 2491e50b-082d-4370-2f75-08ded3bac956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|1800799024|366016|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rJdFVqRh7eEU2sFX8hSrZDUqPalrtOoM/7Ke+ykodmCb1j+kIGEgtkDhkABmCJUzzNrHZra3yjiJ/6J16rdIF28+DS1NMLSSXL/K6wsoB46B8qrV/Y17o2j/PMxEy1Sdr9id6DtqHgWepMvP3YKKMeDgRMZ9Ua2UrSKHUjx2GdGsVSwr7+cX1D4RQ3166xbmiWxlpkMjnsqk53oUNRhxaCqMOIOk3vo9QHgIK3cSULcRJYXeyOZxKEhUKdasM0lPPyzBQHrbOF8sTVNCDB1j9Mk0b2m/3wwkyw9rHNZzLHvVKQW054eDqzlJg/f2my+MFLlrpbVxB59iWS06y1TvbOvZvn2B676y+iJb0lHxd33PUYcYCupQpVImGoERZtu2QXf+uvPNMApJeO19UoVOefpw/mlelE9w1139i+g48xBjNolfwPP6HPxR/QOvhhg8x+qtUec7HJ+RaLQuxFhWUbjbQRy/tvM2uVvLG3ajNxpg4qaRj6BmF1Y3TcWDRX6hrYrRxHdxXqLX7EkK5SPC6La6FQxQrRxK4nwGSv/QJW5hQ53JKOYCSajWY3k3FIKTtRuzbqgP2SwRDUFofwfbYj1QCK3hJ1DyYsDviN10XFljO/BKxh2hKJnfscfieTs9uqLNEGEE9cIdSsNaGjHDZ0v73rY1dKkKrW5M/hSgswc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ArjEU5ry2rhovJpVXNL8VunYpWkgQkSKLVBRCleFplMrdK4PAPp70qk/bQOu?=
 =?us-ascii?Q?X6ldntxD4qdMCgduGlRdSg/x1VOEoGRHBj9w/0r3nx7p+H8LA+iSF0+00kfd?=
 =?us-ascii?Q?NPwNjCKWACz0rnjv7EkdNtkrt2PmIosbifr0Ownu72LKMxKga5VwyYSlvUmW?=
 =?us-ascii?Q?yxaD34eKCCEkgYPsfURjKNTR9j7vBFnxob5xGNBeHgYhUPEV8prLjL6OdN8N?=
 =?us-ascii?Q?hyTgDxPNcGxnZmu9HpL/opjE4LFFkvtodcev/QOL191UvbfwXZhdmK3ecfDQ?=
 =?us-ascii?Q?aXZBWJfWSpaakN9yjTVnSOAkfFQFIkcGuU5PlnH3/GWIXQx4ydxcCRZ/GCTh?=
 =?us-ascii?Q?+8sYMPjiQMSJSXZzQJRKozsJW2Rw9VEIsuDTe8bNO4FM5uuEven3dj9iIDxs?=
 =?us-ascii?Q?ySfpsIQo8eepCXD2A5F3cJXrRfmRd3aL3F5FOXkpIlfqmZCWo+aWa8rmN4tu?=
 =?us-ascii?Q?nBS9OXgb3XuPy4zEC6u1ukmImh+B/I1W3pHwHfA4Cy9hMPdO+DKXGDa8Ne7Y?=
 =?us-ascii?Q?K5w1b+VTeOIivIGboGNWKrbKhN8td44/AWFBQFtz8fhS0iqjtMiYn1hlXiO7?=
 =?us-ascii?Q?lTfPz6YO16OZhFZLWyLJEZdI28IWRqHED5ifKJGcV6gEsUuVMq6kW9/GQS/I?=
 =?us-ascii?Q?H5cY3nhzPxvR5x6ro45VG97IY10YQOSsrE163heiZ5kqJDwBbwcb9KbtSeqZ?=
 =?us-ascii?Q?TNgWSpBIXXefMMWo70o+L826JXt9KdzJiFawSwhr4YA974k3zTgu+d/LBk7j?=
 =?us-ascii?Q?ZdGo08Dz4x4mat2fMHkbs7sQrQz5ckk9fJFX+c8ueT9aeHobKzBziN/726wz?=
 =?us-ascii?Q?slIQQ0F/hOHp3BAPM8lenSFab7976bKMooJLwE/GBI0nNqWAZThEYG0605hj?=
 =?us-ascii?Q?SakXqj0VARXKukGKMYN7QS5Tn6pR/7oFAHXOoTR3AXj21MMGeEBCfNPciakW?=
 =?us-ascii?Q?UX22/TXC6XzErng3AMmbauxpj2JwO8XTbWxH0xuTsXCPuZN54BhC/PBCOLPB?=
 =?us-ascii?Q?ELdqBapQYyUj65Ewi3E5HW7KANcBut5A6zasUVv1Ng6LIWp0Jqp701hkaZWN?=
 =?us-ascii?Q?9npJ7YZUoaLD1g22lc3RoW+mRPFEEb9kj6wf6FdkyRb1l9u9f3tRi0qu7F61?=
 =?us-ascii?Q?+vOvLqHED0SwSLto38NQhaH7vYPhOMkCJQEI2LQjM7vHylEbcknpXbuZGJHu?=
 =?us-ascii?Q?ObEfOLzaleRVJeGq/GPQlOGb1F7FHKor3+alJyLCCrbpGewKHBoeYR+BnZF9?=
 =?us-ascii?Q?HnlBVdkqLyAuLZM0tJmxRwKTLtlS8bVcC11MZZRp705u7dkAkQzUbTijNZcM?=
 =?us-ascii?Q?Eb7rZNytAI7TTeb2dzZ7ryI7E9XKb6wCOVYYLZPyYCosC64NE2Q57M72e4zw?=
 =?us-ascii?Q?aocfQ3kxngy+hSUXoDr9vNIoHSR7+t9TwMvRWDllrgyxdpYy5Ye1JfZIOFpb?=
 =?us-ascii?Q?8zbSC52hW0+cLVdhl9sdN6H69zEPPWPlv3c9W29K4lVLUDDF1VYrjdV5iwaE?=
 =?us-ascii?Q?6lj1wXdtdWi3l7hVUe+yal7QCEPXc6M5UpG48RPW8OQ6X5oO6tbPHIisWRVP?=
 =?us-ascii?Q?mP5dAr9K0CJv4sHZU8D7uEjj+s//XMYiHMbjRjyKsYf3T92AJXAUjP6gjVEr?=
 =?us-ascii?Q?uC9KWNhCa8EFpSeLI5oM7nDNH1YIY6I7zuzuzu02nLPER9L9qTZ2Gkpw9V/Z?=
 =?us-ascii?Q?7kQAMcNWTZTkN/hM87qqGyLmVKfYzmXo05LAQfpyW1GW0pylvINAsikg3NFN?=
 =?us-ascii?Q?OkoujPP7DrCWev5jrUZfPweAhQhtvfUGJb9mEfHXZ3mPLqtTLTn3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2491e50b-082d-4370-2f75-08ded3bac956
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 19:40:33.2315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKy36P76TYo/mhN2Jrkir9M1flR/MeujEZifdeJkuGaS0Fh/OlNspdMjFB1xQSzo7KZbCmY3e39M+xGsjtiAzXv57+bFP79PuqyoQPu+5i99XduI2uzRVyfShxkGFVmp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8819
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_124040_622503_48622212 
X-CRM114-Status: GOOD (  23.20  )
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

On Fri, Jun 26, 2026 at 10:31:19AM +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
>
> Use dw_pcie_rp::skip_pwrctrl_off to avoid powering off devices during
> suspend to preserve wakeup capability of the devices and also not to power
> on the devices in the init path.

Need empty line here.

> This allows controller power-off to be skipped when some devices(e.g. M.2
> cards key E without auxiliary power) required to support PCIe L2 link state
> and wake-up mechanisms.
>
> Move pci_pwrctrl_create_devices() to imx_pcie_probe() so that it is only
> called once during probe, similar to other regulator_get calls.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 43 ++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 0fa716d1ed75..0685573fee71 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1382,16 +1382,12 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  		}
>  	}
>
> -	ret = pci_pwrctrl_create_devices(dev);
> -	if (ret) {
> -		dev_err(dev, "failed to create pwrctrl devices\n");
> -		goto err_reg_disable;
> -	}
> -

Please two patch do that. one patch move pci_pwrctrl_create_devices() to
probe

one patch check skip_power_off.

> -	ret = pci_pwrctrl_power_on_devices(dev);
> -	if (ret) {
> -		dev_err(dev, "failed to power on pwrctrl devices\n");
> -		goto err_pwrctrl_destroy;
> +	if (!pp->skip_pwrctrl_off) {
> +		ret = pci_pwrctrl_power_on_devices(dev);
> +		if (ret) {
> +			dev_err(dev, "failed to power on pwrctrl devices\n");
> +			goto err_reg_disable;
> +		}
>  	}
>
>  	ret = imx_pcie_clk_enable(imx_pcie);
> @@ -1460,10 +1456,8 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  err_clk_disable:
>  	imx_pcie_clk_disable(imx_pcie);
>  err_pwrctrl_power_off:
> -	pci_pwrctrl_power_off_devices(dev);
> -err_pwrctrl_destroy:
> -	if (ret != -EPROBE_DEFER)
> -		pci_pwrctrl_destroy_devices(dev);
> +	if (!pp->skip_pwrctrl_off)
> +		pci_pwrctrl_power_off_devices(dev);
>  err_reg_disable:
>  	if (imx_pcie->vpcie)
>  		regulator_disable(imx_pcie->vpcie);
> @@ -1482,7 +1476,8 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
>  	}
>  	imx_pcie_clk_disable(imx_pcie);
>
> -	pci_pwrctrl_power_off_devices(pci->dev);
> +	if (!pci->pp.skip_pwrctrl_off)
> +		pci_pwrctrl_power_off_devices(pci->dev);
>  	if (imx_pcie->vpcie)
>  		regulator_disable(imx_pcie->vpcie);
>  }
> @@ -1954,11 +1949,15 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> +	ret = pci_pwrctrl_create_devices(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to create pwrctrl devices\n");
> +
>  	pci->use_parent_dt_ranges = true;
>  	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE) {
>  		ret = imx_add_pcie_ep(imx_pcie, pdev);
>  		if (ret < 0)
> -			return ret;
> +			goto err_pwrctrl_destroy;
>
>  		/*
>  		 * FIXME: Only single Device (EPF) is supported due to the
> @@ -1973,7 +1972,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  		pci->pp.use_atu_msg = true;
>  		ret = dw_pcie_host_init(&pci->pp);
>  		if (ret < 0)
> -			return ret;
> +			goto err_pwrctrl_destroy;
>
>  		if (pci_msi_enabled()) {
>  			u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_MSI);
> @@ -1985,16 +1984,24 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	}
>
>  	return 0;
> +
> +err_pwrctrl_destroy:
> +	if (ret != -EPROBE_DEFER)
> +		pci_pwrctrl_destroy_devices(dev);
> +	return ret;

Mani said he will fix DEFER problem soon.

Frank

>  }
>
>  static void imx_pcie_shutdown(struct platform_device *pdev)
>  {
>  	struct imx_pcie *imx_pcie = platform_get_drvdata(pdev);
> +	struct dw_pcie *pci = imx_pcie->pci;
> +	struct dw_pcie_rp *pp = &pci->pp;
>
>  	/* bring down link, so bootloader gets clean state in case of reboot */
>  	imx_pcie_assert_core_reset(imx_pcie);
>  	imx_pcie_assert_perst(imx_pcie, true);
> -	pci_pwrctrl_power_off_devices(&pdev->dev);
> +	if (!pp->skip_pwrctrl_off)
> +		pci_pwrctrl_power_off_devices(&pdev->dev);
>  	pci_pwrctrl_destroy_devices(&pdev->dev);
>  }
>
> --
> 2.50.1
>
>

