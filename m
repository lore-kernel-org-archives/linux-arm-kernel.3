Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23457EF36E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 07:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PCTrkm/Uaxqp8htbsT4MVXydewMRCi6NzW73ePH1Iw=; b=2zbwZmKb5fuPPYuYJyglBTHVFG
	N6q/skSiyosV3CqKrFp3D2G/k8IALdxyzIDHONUsvkjvhNaKj6PJEq2NPaybWrjkz5eLcomFcDJ+E
	zpy3f2dyQFK//FFmsE/Q1JCo/tblibeFJAGWqAai4GYV567DVXL0S9LZk0yHd0gJmgkWZ9zBwcTvi
	DeQbGDZKwIcuY1gpSZdR1Vjtb2ArA/QLi8I2V2DKezMwijzdR6/H0YaR77MwUpSHPPCL6GEKw40a1
	7LRXJD1lBkdVm6YwOxqW0fNMcwEFHlnp8IyXuiirJbIG4uvrt/4Yq8EGlpPSHAE7l040SDeh0VMg+
	UD6VQSvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUbJ-00000006mKH-0Bcf;
	Mon, 09 Mar 2026 07:00:25 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUbG-00000006mJi-1Wev;
	Mon, 09 Mar 2026 07:00:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/V2npyzhpIkXfSzg5Xz3fiMVz/uTP01HwuH9hvmxaJkL2xI4Hq3zVWSBmMZVfMXldhaITj2auyH7PUEMW4EFuSxCxBrQf8igTnwxTzShKhmG0Fsb83SKda56l9jcmzeoFmozDjRRjRxER4rw0X0lGgkn8iMwdbXKGUGZ/nyYvpXMP0P7iSs6dRDcFGoKU03MlgR8PHgPpkbvierTzRPmHtSmv/QPhUb4Wjrcqs/rGP16KRBD1L+ulLZVqEIi7vBCDIPje+GV7GS/kBUoUxpkedBzAhIVJB00/ItadGehDgiqJsMePAS64cFDxgs0glLuGizRFLmAjNjKYZ7bwCjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PCTrkm/Uaxqp8htbsT4MVXydewMRCi6NzW73ePH1Iw=;
 b=wdot4Om6qdtgy4dQ+c6XvNjLnspGvh4suH8u7sKgrzrWcLU+55XHfJKZMjPXacJ3AFlglH7GZ01M3CRVYjCbpUXZx3xVrXw9BilGzk3XTLPfAIYTTlBpQP58R/bviBpnNpj10OOPsc1cI/XKAMJekUgvh6weGdsxl5tZFJnpOT+nai9trHHFmt1Fg4CK9WeHqcuBVQRy6msQQHYCr+zB28vp1xL/fJpAPlaMSTFejR6KweWGQm4EuTlPoyS15OzDEJCcwGWcxV5j2J4i0/dEF/2gb36te3XQBrm/eF51AbUbuejvtyFe5Os6DM+XISYpzDokR3y5ydvFQ5jqEIphTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PCTrkm/Uaxqp8htbsT4MVXydewMRCi6NzW73ePH1Iw=;
 b=BxHBanEAa0CA4W1DHLTC1oTny41nHUd8KfdECQ/fp+UyFHXeHOOPcLA4YKXNCEKVOoM5XbP21Z1pq3RJL/+NgLwDRNpd8NPgPLO2RmFh3udKD7uRNZ7qIaTLqGB4F+dvC5rr90S5Sw0j7AFhL+v/1Mhu5pdY+ZpKPYlr5U/yhUTvDOL90qa+/uHTjaY6OMyhIA4023lAzsZFAt/QGA6Aq6MO75qcBl4R/1WevUPFPyNd4Zo17L/IbrxBS7pwkgWVOTV0FoPI0HB6M+hkVdV7SjeTW2q2hCpTyx0XjMTdy4Rkh/mMQt7hqfydNV4y8CIfnT9CuzqWhr7BDVKzLEMpXA==
Received: from DU7P250CA0014.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::8) by
 GV1PR10MB6396.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:3d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.20; Mon, 9 Mar 2026 07:00:16 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::29) by DU7P250CA0014.outlook.office365.com
 (2603:10a6:10:54f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 07:00:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 9 Mar 2026 07:00:15 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Mar
 2026 08:02:28 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Mar
 2026 08:00:00 +0100
Message-ID: <bd4c6cab-bc1f-4275-87aa-2e0daf0e5620@foss.st.com>
Date: Mon, 9 Mar 2026 08:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 2/2] phy: miphy28lp: kzalloc + kcalloc to single kzalloc
To: Rosen Penev <rosenp@gmail.com>, <linux-phy@lists.infradead.org>
CC: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/STI
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:KERNEL
 HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b"
	<linux-hardening@vger.kernel.org>
References: <20260306222457.8400-1-rosenp@gmail.com>
 <20260306222457.8400-3-rosenp@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260306222457.8400-3-rosenp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|GV1PR10MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 841da89d-00c6-4bad-e6d6-08de7da9844a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 05B95VJZRvxOTUDrwu+0/7VoD1hjcCMkc2oeKr8itiH7Wjk7oPtcab00/B9AvxZWOI/jAGsSdEPlnlJcyc41op1J4XzkMcgz3Pi1OEtdH69owqX39MLnRKLl3t4mCW1AFk+/PEDOMHfqns094Cy9W4fYMy0vLBxs1EoHwP25XOxS/pJlvYKkVQGSscL3Lpzy2Dk2nS7IHuD/JdGskl4IHNkuZcqf3XI4UerIiCoCDjnwJnDu3lhF8ib4OwYqfrIXuCY1xRDI1Ug/IxAf5KHYVtBLjvmicBiM8uiuo5BUy5+9vdg/yQGQAxADNccKxc4WEIEK9/MbzVD253lOXNNea8S7cJizMgyDn87skr+WSrgroJGlui080Y6R5I92dbVUO48pFpUq1Oy6K2stQ4NvzoNA+O2/rFxRn9uuqi1S+w7bbW0mMEHRWWk1TdWhRmdOzH8LW97Ciifj0FdiqregMooQ0mZaefJFpzh4pPmWmMyG/hwZw30V0oCDNSNPmSc1Wxlzrxt/a68mkpmWFyaefhqXFQzFJwR5lqLclZ7QTkBAsr2jrZxl/bI6GQmrYQYIelwvAZIQlIBkPjnfx10EmeNLo9GSaHM2DDI03zy88iQsVXls0xV6jmKWvH/x6uw0o2+8vlw6ByrCiw25fgyMnlg5/VpzM72Ti5yqCAzvYWnaUo9rplT5CEgmkHT+pXpfYmgCkSObNubMAJqR6e1rotSc2YqKMCD3vxrfCVfIPmJa8jiHWFM9SdPLORcD6l+yk6EwnzS2i1lIklvhWyDh8Q==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: haps6col/zvm9rcNUT5wy4WF8lYfMav0PmISyFXG2rPFPYQSlbFagBv9bjJgA5JPmFB9l6QAr2kDTKCUJpa4A7p/rGucc6OMhajfUx7Vi8rdRC0D39m4cn5+TRtGHyAgAk5qvoPAy8hMtH4E+43jpy+j3+1SBVSbh8wkKKNr/B/l0Crk3XCYNAsrUvA0FS2m5bEc7M5VLU+hUreoh+/jr2vgMEOSUVKWDcSgiOc7NBR4icNGSkGkVnk67En7i5muGTttXzD3iW0kOEreft9TUke5YhFR9012oieD+wrgUWJ30kDiDSZ1u0jT68s4CDru/bcAhYV28S8Cs6FZRZ28cLaKh3FXAG6KiNYCo+AWaGmzVoA2DRUoecH+2gjN0fbl9Z14bzyB6Mi4v1Dm0e90y2GLq6nNhQhEB2cx8e3H3k2LcvFYIYbX1EbIVWSyzFk2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 07:00:15.4458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 841da89d-00c6-4bad-e6d6-08de7da9844a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6396
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_000022_412703_078A988C 
X-CRM114-Status: GOOD (  14.25  )
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



On 3/6/26 23:24, Rosen Penev wrote:
> Use flex array to simplify allocation.
> 
> Allows using __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/phy/st/phy-miphy28lp.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/st/phy-miphy28lp.c b/drivers/phy/st/phy-miphy28lp.c
> index 43cef89af55e..c576fc5569fe 100644
> --- a/drivers/phy/st/phy-miphy28lp.c
> +++ b/drivers/phy/st/phy-miphy28lp.c
> @@ -224,8 +224,8 @@ struct miphy28lp_dev {
>  	struct device *dev;
>  	struct regmap *regmap;
>  	struct mutex miphy_mutex;
> -	struct miphy28lp_phy **phys;
>  	int nphys;
> +	struct miphy28lp_phy *phys[] __counted_by(nphys);
>  };
> 
>  enum miphy_sata_gen { SATA_GEN1, SATA_GEN2, SATA_GEN3 };
> @@ -1168,16 +1168,14 @@ static int miphy28lp_probe(struct platform_device *pdev)
>  	struct phy_provider *provider;
>  	struct phy *phy;
>  	int ret, port = 0;
> +	size_t nphys;
> 
> -	miphy_dev = devm_kzalloc(&pdev->dev, sizeof(*miphy_dev), GFP_KERNEL);
> +	nphys = of_get_child_count(np);
> +	miphy_dev = devm_kzalloc(&pdev->dev, struct_size(miphy_dev, phys, nphys), GFP_KERNEL);
>  	if (!miphy_dev)
>  		return -ENOMEM;
> 
> -	miphy_dev->nphys = of_get_child_count(np);
> -	miphy_dev->phys = devm_kcalloc(&pdev->dev, miphy_dev->nphys,
> -				       sizeof(*miphy_dev->phys), GFP_KERNEL);
> -	if (!miphy_dev->phys)
> -		return -ENOMEM;
> +	miphy_dev->nphys = nphys;
> 
>  	miphy_dev->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
>  	if (IS_ERR(miphy_dev->regmap)) {
> --
> 2.53.0
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

