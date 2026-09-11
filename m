Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B296DC88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 11:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHlqhmhNrq9DNzqgJZi7+ra1nKEyni5di9SdXMxCCtg=; b=VpgmtGi9A9MT3olpS5HiITlxip
	AOAf1y7NYMZQBArxYL8upzG1o9gUZTpWRfsYcTIONfnavCgyn2pyREcfxaxHLW7paqqehKn3k2CAJ
	o9DyIm/KyNVVvRqcwg/Z4jAXNxf9OIyVcR5OQ6avM3DR6eGL3LazcSM1aJYmpS9BtK1W3K5E+9lXL
	vxbO6omS0UC7tKyLktpXtNlU2Qefe6Hsm894Lqn6O13n1Fs4VHYCoOvatmD/3xAXsKnVwdwQqbH2D
	o9S1d/3m4ex/83Qmc3ClhNvw/ts+t3cxxfkmBjTAnU0etdqcsz50cG+eOr6m3MQFlre7VIZpfESz/
	74G1XT0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4z7w-0000000GTAl-0Ttb;
	Fri, 11 Sep 2026 11:09:05 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4z7t-0000000GT9n-1pUl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 11:09:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JamXcjPy3YVQAFjSYQEJMtB9cerb5MiTcnvAKzF6kXC1r32tEx0W4u/0QVQeZpy90MHeSM54eKb9wEPH+u5Y5zOVODtEJIWdaoagOUmIsTdAqlVBLzy+nDB/iR3C8lyNf+pc7cBCCIhwBCg1vPItN2rqlHmmNIPIGhjeGzeEk1ubQeCYAg09BrrCBd2HQH/AU6ahUHp/zRTiCCghBe033NJImLHwz/9m7CVVwfo0kKqhpiOcg9dsuaD6WjbU8tpsgBYkcfZWbS4Nyn7lLWarMwqZETJkxBF9CF2BJnfey/BcgNg6MwBBT3MttvAqUeLYVDlIfJvzen+/N/igYA8VfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHlqhmhNrq9DNzqgJZi7+ra1nKEyni5di9SdXMxCCtg=;
 b=GN9iY+YxAGh6I0ckY/4c0ZgRDyUhYRnbGCiyIGBxDskqN4lKPxUWTiRU125eYsW4tkAmlSn+AMEB1wW0Fmn2CZgeQk5DrIBGuCv3CMVS2eozpaz8lwG+5L7RHab/sBn851rO2rMgkI6P3r4nridO+pfP+rM16ZR51L4CUA3WWAf+qUqtRMQccFRXDbFY8QWJV+4lZBoC6m6SOgdHW5Cu08M0sSjKq62oK/sHC3Pl2dfX2PIshtbRxs2AD7+VhbhIFU5BH3uD33LIIt2d1IZo7dB0AW92982rhGeaRC4hzn0RfnCUo6JAiWXkUlNabIprXDPhgHOj/PcU33pVI5alUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHlqhmhNrq9DNzqgJZi7+ra1nKEyni5di9SdXMxCCtg=;
 b=ZRB6H18rDIIZKGTOnS+2HIHIxBmpD6sCgQrJLlyMetO1Iyg9Wx4nBVVenahqaSmsOPuryw7pO1TZGZ0h1W7JOWYdfIhtGgdXEPBTK3m0ToqUFVFYKAv+VgNYO72rMefLACqvRDg/vtopJiXZWhxWwwCCAK7bPgiKT/DF89/eraM=
Received: from AM7PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:20b:110::18)
 by DU0PR02MB9968.eurprd02.prod.outlook.com (2603:10a6:10:444::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 11:08:50 +0000
Received: from AMS1EPF00000097.eurprd02.prod.outlook.com
 (2603:10a6:20b:110:cafe::65) by AM7PR04CA0008.outlook.office365.com
 (2603:10a6:20b:110::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Fri,
 11 Sep 2026 11:08:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000097.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 11:08:50 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 11 Sep
 2026 13:08:49 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 11 Sep 2026 13:08:49 +0200
Received: from pc55637-2337.se.axis.com (pc55637-2337.se.axis.com [10.88.4.11])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id AAFB51FEF;
	Fri, 11 Sep 2026 13:08:49 +0200 (CEST)
Received: by pc55637-2337.se.axis.com (Postfix, from userid 363)
	id A0C3A6035BE2; Fri, 11 Sep 2026 13:08:49 +0200 (CEST)
Date: Fri, 11 Sep 2026 13:08:49 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson
	<lars.persson@axis.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/10] arm64: dts: exynos: axis: Re-order nodes to match
 coding style
Message-ID: <aqPhQYPpJYjhcZjR@axis.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
 <20260911-b4-dts-samsung-cleanup-strict-continued-v1-1-9aa55051c42b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-1-9aa55051c42b@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000097:EE_|DU0PR02MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: ec223c33-1a4d-4008-de4a-08df0ff50f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|23010399003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: HnEQTaQXdtk5Br8GRSlqcdI0B90tn9643rvrMfI3DNdpHESx+tg+cbiYEuaIa1kKP/sc3UwenJDitA5gQ+BvQiGy8sDQHaj+6y9uQoqUT+Hf7yltE0eAkFmy3zYla2p2x0FSg5oN0ZoeZuf3NQJXJU6589IkuVNokvVoYHbTqxAQtJzaDsQ4WIzH9/N7BMh8euNTV1P58DqlAXUshgI1QdO8mgDV3H0NrjgbVZ/20oroK1lm0ObcTsDlg5wCn76rodMqfnQOPnbeUjvMnzAyV7s62MPgjU3l92sP+Go+oDq1KxhQ2P4rqNmKNMoOk8+cDaF8acdOvyVuJfO1On4FpW8KL/XnyuMkiIHBCgKuoosnHikb8Cb0X9a/lW8+XSqFgKKduUjZpf6fmHE8TFJ4vG9aazuQgisBmwZKqK8Ar3kdQD83Pgb+DHRG9UoF2m0T5wHjSq+jEhiiXx+eJ65JQZQ8VSe0YTAZd5rg5gVddIj5Fk/FlKzN8u2JqPEaDGOEfsPBpmZnFZYSkPgI6frF9hC7x28q+y2E8j/2q6QS+vWF69wWH/x97pudtmgXN4C+U8yYDihNivySCge2RmqU8Zh9BjWvh4jmKOhDVhh1kS/v77pX5r/h9O9dNARtzkATo3c+ti9WvbQp6m0eqMj6n7vz+XHwLpb9jybHlSBuQ4GrZ8KtHji0fm+4K/yUQFkQAhT6IT8I5ZnKiq2Yn7kxXA==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hs11RLlU+B5SKEphD7QLuhqvd+0s5lkuUMIuaoMOtJ5/OVZ8TFgVmClnWOCoHPmT1Q9X1ImurHYJntWI0hozDQYhy8I/15IXkz0Dnk7a7sK99aQ+vOwiGd0+nx4nrNJN8hSCF2YYzjnuwrPH8QsfC7ibivVe79XYoX0uunpwOZnGiQ+TL2/B7ytS7QqKUhiwThT96Ym+PsZ/GE4bxPZfdmJcaA8YYvlX4m1IjLXf7rEwp1OcF7N0EfJlqR19yj8icosCir1F6hRGDAVxqqO1rAUSelOweIPEpF6BSpjBzCen5iRbBhHk5RvPDR0hxwQy9/1/cLGRqWaljKymoeAmGmBg8RbQYDBF3dr231qGXyLYSO6j0TuVDOJug4dkr5TsrR//4BSJV+ZBtaCwS5NL7GM9NSAHxWtk5sddprNoNw1qEVmoY+TdaLjZKdkFg1zz
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 11:08:50.3957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec223c33-1a4d-4008-de4a-08df0ff50f14
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000097.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_040901_490417_FBEE2C56 
X-CRM114-Status: UNSURE (   9.46  )
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

On Fri, Sep 11, 2026 at 12:19:09PM +0200, Krzysztof Kozlowski wrote
> [You don't often get email from krzysztof.kozlowski@oss.qualcomm.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Re-order top-level nodes to match coding style - ordering by the name,
> as pointed out by dt-check-style, e.g.:
> 
>   artpec8.dtsi:77: [child-name-order] child node 'clock-finpll' out of name order
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

