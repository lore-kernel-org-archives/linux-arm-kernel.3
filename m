Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95B6CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 06:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=didCccuAAYPEtxBbxReNM4BP5K1f+cECvIgX7ofcO0Y=; b=tLYuv73MuGUUkkpashQutI72T0
	E+CTh0jFXV1+F74fNpl3+XDM77jEchKiE2I67ScMW63eKUE4s5IfIE3o8D3gkj6VQET2B4OphO1ex
	1jBvp6Au1LriszpRcvn7qohEb3rLcYF9VIykdjZiuqGyiLzCp1yczWbjOiyuwRc59ZyVRdonfIZ8m
	dUfj4FAsewWeqxd3vjDFCGrqBXLHXUO2mWFxMbngyGTwlghlDU4p3BeIruPcx6sBOIJJlDIAXcsN5
	fxVyS184SqSwGmdt9SLbP7TQnBoTXMPP+zWiwmnU3xo87TEISpPv4F0z+RuHtoIvXZ/eWA62IfMPl
	JuQlO5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6be-00000000idA-3DSE;
	Thu, 18 Jun 2026 06:52:06 +0000
Received: from mail-northeuropeazon11012051.outbound.protection.outlook.com ([52.101.66.51] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6bc-00000000ico-1WJJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 06:52:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQ9jUOkeyA5fWJ3apYgGkle0viTtzNewUA7t2uF/iskzx2OyrWinlOY/DgjCmSIDicn+Ws/5nTlU+nndjn9/u3JDeaPv4zLL5G1r+4n813FwPtwf0mdrKpCd2xpeVqkR3H91Gx8VEVT2BRoERFwB6EnjWu0wZAxKS03qT1NhgVCPR0uWwpRnHgKbXLCKomQVd7KNR2+ECWrINPP2A5jZVLG1lsFu9zcbDUbt2ac/6JIr3muW4gbl7QTXNO8CMORMYdX6SKNY7wfNwAHCke1+jW09fPHx1HmndrLqfmw0fe+qH0bRQ06pN0YemL3d9FJLOgVy+iTJJQcyO2cYY0xlkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=didCccuAAYPEtxBbxReNM4BP5K1f+cECvIgX7ofcO0Y=;
 b=tHnnvr9xVrfgyYKCUGkwx2HWLUdU+7GFUa5/0ecw14+tevLj5Bterpsh3TsN+4ZwvQs5Aun4M7h4DDgjmr2nuMldTRIZfNazUxVB7t1J7H73WpsoRoPuUP5iK4rTfzyp42ZE8mFFTExiFq/ISaq6lrhBWKELBs+6iaNS5lJTH05k+sHidkA6RqJJ2oLtnHHUTYkYsaC0/zLGpzt5Rv/BO9RJC9032ay30Sc4gD0PWCVS9tG/vrk1Rb4QDPfkkwW+RboNsmMznuEXzBWuX5BGmTsrl9nVUd/V0/dRdFiNKz4Byw/D6Ue3BJ1MfexTfpCM5sDjl7PgdvDp8TcrwImgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=didCccuAAYPEtxBbxReNM4BP5K1f+cECvIgX7ofcO0Y=;
 b=KFI/WbBi0IbPuXIau5DQNE+p7NYtWME8JMXcbgMi3tTTQ/ktTED6TQf+POQz0dpp2OW19+mkNGwNhESa7PdtUGivH3XLPNSKMxuLXQYGVu1sofSEm2mFBgneNKqISoitvrM+z6R+G5Bvd7byMujxSC306DKPMLfxTunNO5Q+1ZjiwzYJyQluly/bsD2VK0tvbacJEkNq4xrqRa3m5o11LlVDvZIaH3OgPRW6JfrKknwpP3olmv4flXDKcg5JQv+3CYJ4p9JJy/BKxTuZeLslEfip0KJKyJuQvqV9tLBeogb91HpxLMSdsNv5O9S7c5MNzSmhwG8RhseP6rwQUtOZ0Q==
Received: from DU2PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:10:234::34)
 by DB5PR10MB9690.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:654::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 06:51:57 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::4e) by DU2PR04CA0059.outlook.office365.com
 (2603:10a6:10:234::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Thu,
 18 Jun 2026 06:51:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 06:51:57 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 18 Jun
 2026 08:56:15 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 18 Jun
 2026 08:51:56 +0200
Message-ID: <5d965c04-04ac-4591-9b0d-c8324213cdc0@foss.st.com>
Date: Thu, 18 Jun 2026 08:51:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: stm32_omm: initialize ret in stm32_omm_set_amcr
To: Ruoyu Wang <ruoyuw560@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260617182202.961843-1-ruoyuw560@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260617182202.961843-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039231:EE_|DB5PR10MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: a998188c-b8e5-4ccd-fefb-08decd06174c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bsyiydGPqUaM16yj9hoDGLFgeRfamYlqpBEaCYsqymMwvxAszUxkeomIGTNcfYTi8KOz+TbywvZVq/jDPybyAJDSspi4ywU4JK5rmdDk6TctNpN5Clxmvj/5Iynahfu6Msq11vSDxD1Oran33TNXgj3HdAg70DNzw8G1HN+s7LviRhw6D+Fqau/64zr6yGZ4Zc6sJP/Aus0I3LxA5OjArWuBlRr9ezvItkRMdlsDQ4+798l6rikGB6OZYCNSBJ9cmPBI1dAF8B9t9lxf7h21h1VICux6CRS2b3ADyoTsZwxbSsKp2JRYjCzU/V7jtGJT+O3+RiIx+lK9wbNzYG3YeushYLCmzEBssnmXinhacivea02OXPlnH8ee56/5G4dIqeoQFZE4xSQFLNLhIKMWAZowpvY3wEjR45xaJvzeS1OzSgMvgR21MXaCiUlytD3f/eUco2sp1MSxaQ8GTpgv4ywQ9RQ5FCtB4NvQoqxtkFHFjCPl8fRTghaWC8Q6YYGOABm/E+bCp5r7B8W1SvsBJfVcfUVlzA9Q90n7+Gvw5uOtpBaFNCwZ8le/TtANyL6w7AkqEvx38qfXKkfEPg62PYbpW8Dvv5Q4/OH2fev4mxXtMwR+gMqmzh04VRlfZhNaELNHZuhdIIrEXIq/wRX33mxNqP3KrbifZZw80IBA328gde2QxJ0cQxJp0eXElKlVQThzVTHqSd5kGsjjnLCyPOQs3wZctTHFVP8DZbHbtWY=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8VnP6wqv/i/ZaSUkvk4/pcOxVfS1AaicjDf8n59CJDpXsMtF2KMG/6IuHMiFjTcH0wkaIRMUfmmE3kKwvYShXmb7psyPX//1B9iNopIFkiPZZcqbIGuz3Ht9Lslc2dncIKIoYehl6Zgfb5Flc6xrOtxQkF+ywOZKJDDfE1BghPfSIGLNQHdtZ06wKJ8FwfRTwD+m289SV3tUSxb4AeuhnJpgAlZj3IuNnEoflOnCET39Wcz7rfubJ8QbNb3SufdPuld6BQe5wSM/8y+2m9HNTV0dOY5ec8Gre0a2UZsirpZoDoPA/ZzXj4E0yBHfEhLCGAuXbD7r1UOEmeGV24zcrlfp3FRXDUwtixXbByWivCUWSNmIpXYXYkZCwgkKIHiq/QcNNU1rRb/sH/0F3C5myMCN1kdEmeR0c1bL2kwyfibLQmbYXjMk5pd3SmAZrmw7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 06:51:57.6358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a998188c-b8e5-4ccd-fefb-08decd06174c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB9690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_235204_410522_DAC038F4 
X-CRM114-Status: GOOD (  13.23  )
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



On 6/17/26 20:22, Ruoyu Wang wrote:
> stm32_omm_set_amcr() returns ret after checking whether the AMCR value
> matches the device tree description. On the normal matching path ret is
> not otherwise assigned, so initialize it to 0 before the checks.
> 
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/memory/stm32_omm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
> index 5d06623f3f689..2a1af229d2444 100644
> --- a/drivers/memory/stm32_omm.c
> +++ b/drivers/memory/stm32_omm.c
> @@ -47,7 +47,7 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
>  	struct device_node *node;
>  	struct resource res, res1;
>  	unsigned int syscon_args[2];
> -	int ret, idx;
> +	int ret = 0, idx;
>  	unsigned int i, amcr, read_amcr;
>  
>  	for (i = 0; i < omm->nb_child; i++) {


Hi Ruoyu

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

