Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6031C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 19:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Plh3OngN9TixK2+nQUI9d1cKcpcLRw3mqZVf/pnjUPE=; b=G1wtZKDZFZBK9b1yojd7WvOHZz
	0yAOKywncHppJmpgluTZr5sv+63qvqjia0NgGur0vNQem4LMESxVrivOc4VFI+qFuLxGHgcN6SKwV
	Rg1J+B8bJ0wzj6Ho1+zh+cydNZIgysgviveM11epSITslHByA404K3KYMQLQ8Mh5fC2WuNFGUjR3y
	Sy+KivdtVnpBl1ip4r2PQSVY7RaVSVzHs2M13FOm6n9opn+bHzeh/SOxNqZA82b2agIiCr8E80rEs
	K7Jb8XleYnvVAteT98AtjoGhXY4lesxpG/glgViKHC7EH5KzYisAUC27QzZXqmEiEJKbIrcI/5Pw1
	7ugJ47+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twnkL-000000046uQ-0DvV;
	Mon, 24 Mar 2025 19:46:05 +0000
Received: from mail-db8eur05on2062c.outbound.protection.outlook.com ([2a01:111:f403:2614::62c] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twn4f-000000041AR-2vFP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 19:03:03 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cT/tPKaAQRha4zbGTiEya+e728NrGULKtNbmN6zuU4XWnLnkctOCTwfeXVVFpkVSZrH8H8DWpWMCKU1o2gXKRpicHx6dz/nFzHpM0c5tQ9NidCZwEMWHNzg5LnxqVWPOmyI8zGRwwAJoq2Cf75pPwXUGrw/8OVe74B1Hcap2I7w/MXrQeS3G3olsDL9HdpJIKVmLdg25Sqo0rI7fx146KdyCPwu76oh563Hvnaj+5UPuh7adxCy8Yx+OqPiu/Lrc2JKCrj3BBaHjCiwggVTT19ll90sVvyC2/P9jTKPXD9v9c2XZz4yotflXxcUASAW6vu9K7tjwAiTHRhudKMkqHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Plh3OngN9TixK2+nQUI9d1cKcpcLRw3mqZVf/pnjUPE=;
 b=sOt5QjetLDnzFOwyeWg3HwOLYDaFeriGrMev3OvcNAFhfa8T0OEl8EufgqHMz3CGmsBFZLj6ZqfFaAkJQO1udqNgHhc5CioP4ESbZDaPsuClN0T87dRt9SNId3ooQFRGXI6RMoMFBAmSWMOrhY6QSkF/IwCpsDem+O+NemBP3o8yCMKU19wQPhlnd2Nzu3+FheruTq1XGshxaabqocx5VztCSvSUApWzKyTL/MYsZcMYQd+jvw95hD0qY1IWivre+ftZGZOiXvwEbxxr4uUFJuvw/1CT+tYp7KPKLNjuVi7fPxDIbTjlT3iRJLKa5tTBhRGtUAQEfoZyXk97QC4lsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Plh3OngN9TixK2+nQUI9d1cKcpcLRw3mqZVf/pnjUPE=;
 b=jZOdBGuRxJ6AXQRpObqVGrj1SXV0rKbz29ttOGggdqnpGX2pOU0IRrSy1VrJtE6Gr4/w5KwTINroY1MMjHuPtBryBJByE26icyAcfAcVVAgXhbWAWb7xqMIqMxGiB7fkxw9oabh9nWTRWN1yOhu0ezdZMAxPB3yQUu7hZ6D5nWU=
Received: from PA7P264CA0505.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3da::14)
 by DU0PR08MB9105.eurprd08.prod.outlook.com (2603:10a6:10:47a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 19:02:56 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:102:3da:cafe::c6) by PA7P264CA0505.outlook.office365.com
 (2603:10a6:102:3da::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.37 via Frontend Transport; Mon,
 24 Mar 2025 19:02:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 24 Mar 2025 19:02:55 +0000
Received: ("Tessian outbound c43b5f5e5ae0:v601"); Mon, 24 Mar 2025 19:02:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d04d07ac7a9b0a6
X-TessianGatewayMetadata: qAeUkTHhOoCXGWGTcA7i/XfT1eX2ylx252KiLicV0JEshJK2obj4mh4Ienv2NnwpdtYVdJ6Rt5DdCB4TcbcoLyGE3xnUf3dkOpomUJgrqynAoKlMvRPT3+JqW867CeKeXfM6pjMcO2atm0oPEepl0Q==
X-CR-MTA-TID: 64aa7808
Received: from Leb1d72267412.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F8C2AB0B-D168-4585-87C6-06145D6C7924.1;
	Mon, 24 Mar 2025 19:02:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Leb1d72267412.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 24 Mar 2025 19:02:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uX45vN2ByiIg31rcmxb8Aj0ixOpAvZqjpQETKhuexa07cmLhKP2WlmF2Hxl5gp4QU+U8rVUe0O9jUDsw7Oi8A4NJJ3yhdas7WEzC1mNPZPhw5rQgAarfqEOYU8dEfIBipgvMR4WfaGUrIJiQrge2o/PjqaVOKUEYkFay9o79mhr/6v/iJmaxdzojRnWsjNFVVUuMyZgU7bSElKbqPIk6Rq61u9YwRyAN8ShZ4asv7QAdYnFnDuV7zGcYr6dmhQ3vnNbqN8VaMee7I+28yKEKH9Heh49MOAzldgUeztkQ+UjWBcMRImealdNs9HesHMKSVTLDPM85qjS/E597lelrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Plh3OngN9TixK2+nQUI9d1cKcpcLRw3mqZVf/pnjUPE=;
 b=kJX9yHo08fl90WU7q9NsekVF0iI2n5KbUttRTNycXQAVXi0+q6xMmjOYX4arVOdAg3gPJvQBgIsS8wM2falwLbpO0i17Xl9VY5+6VyZ25gPCE/7D9ozx7JdADtv5dhwcK7iXrnwvwBLm2hBYRy6DD1iprlhtExm/woyEoqdROxgscjZpfj2T+gJazoXwQSMOGyc14MOnGNZSgY4hyyfbKpR5GytZ2oGqUy3Fm2ULqo1SrTGClyilp7OZHWpyp8pz18vmPnHLgw8T0Hy4BRstm7WcahbpBIvzqeAPtXdGGNfABCv/Ho/8YR+/VpQegMOiLJGnjgYyAgen0EAwesDMuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Plh3OngN9TixK2+nQUI9d1cKcpcLRw3mqZVf/pnjUPE=;
 b=jZOdBGuRxJ6AXQRpObqVGrj1SXV0rKbz29ttOGggdqnpGX2pOU0IRrSy1VrJtE6Gr4/w5KwTINroY1MMjHuPtBryBJByE26icyAcfAcVVAgXhbWAWb7xqMIqMxGiB7fkxw9oabh9nWTRWN1yOhu0ezdZMAxPB3yQUu7hZ6D5nWU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM8PR08MB6611.eurprd08.prod.outlook.com
 (2603:10a6:20b:36b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 19:02:46 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 19:02:46 +0000
Date: Mon, 24 Mar 2025 19:02:43 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"james.clark@linaro.org" <james.clark@linaro.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <Z+GsU2Elmq14UU81@e129823.arm.com>
References: <20250109171956.3535294-1-yeoreum.yun@arm.com>
 <CAJ9a7ViuVntYL62q=WYPkFR3++cyufPdKUHm0FUAPyGy76pB_A@mail.gmail.com>
 <GV1PR08MB10521BB7C93822F5124F2D66EFBD22@GV1PR08MB10521.eurprd08.prod.outlook.com>
 <CAJ9a7Vgz+L+UYf8Yqyu9J5hp3AB3WPSKutA4AvR-OFdu8b-dPA@mail.gmail.com>
 <Z+FlLDLV9WkGNbj+@e129823.arm.com>
 <CAJ9a7VgsBZ6MkgwVjDiOm7rvcy9KVPfPc_PbaRNX7ra8NWGb9Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VgsBZ6MkgwVjDiOm7rvcy9KVPfPc_PbaRNX7ra8NWGb9Q@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0289.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::6) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AM8PR08MB6611:EE_|AMS1EPF0000004E:EE_|DU0PR08MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: aee3b45a-3c07-467f-b07b-08dd6b067c7f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Et9hfRvJFudaszFz0gxPu6vylYCuaRlkSTdsD4amLcbzLSoKL0EGluqJIziZ?=
 =?us-ascii?Q?lu5ViXx5R+JzR4DsbYO7OZxKs6BweYtK9cLUbDRI84FDhxG9jeef1JdYSEWX?=
 =?us-ascii?Q?/ZNOgrHMenLmlWb47r4M8IJDVtp4C4KZP2AhHIcspD7yIQJvEgZnf5k617N/?=
 =?us-ascii?Q?t356Tf/HV32ewM2V0GDEpilYmwjzMx9/JsvAKPaStBPvo0RpQaSHRu4A2Lkx?=
 =?us-ascii?Q?bgm46ivxun8qXueOgTj9rXqZA86lR4pDP1irkT1CERTQWvE8gb836acLlLPu?=
 =?us-ascii?Q?kl8m4HIli9AOxWd3HrThClZnIXf/AnrsyMqOPPpJ+alyCrEqbI3t3QTf94No?=
 =?us-ascii?Q?OUEPxpskdoQ5WhOR0VhLPpYrgN6irl2PBR+dr5irPlby4h4sFdiNCfnz4WSB?=
 =?us-ascii?Q?CRMP4sDYut6KUNdZ7FYcuXS1gk/XXkKC6/BV0ciWdpMxPV5H5YQqxM+eBdNI?=
 =?us-ascii?Q?GUx127KpnlOc0zEErWtWeCqWufIpFleGvsFb/1UNCxvDVML9P0dpWTULNHj0?=
 =?us-ascii?Q?Cl1ynnbs8oI2fM9Ay8xsUh6P17SZfee8aVo/nmAIJK8/2NFiumAOqce48VFG?=
 =?us-ascii?Q?nTBe22Q/CVUVV59SDbd81TXl019SB+qxSOf5SWPKjkAOfhJk3gHDJXUqX16I?=
 =?us-ascii?Q?WNyVuhiGrENpOPxbViWnOqyZZK8r7JvaK2w/O9obIP6zXXMy5dGEsHfDNNjO?=
 =?us-ascii?Q?18+jKTCf9S4LEq9O3RTmGf1K+M1IAz8UL29NPsY2kEMuN00GYR7Jfoj+FPsL?=
 =?us-ascii?Q?JBRkvGxOCtO9EUb/ciQuGzM8MWUTmQ685HysgCq0ML40e/Tk95uAmZFliIRR?=
 =?us-ascii?Q?LOzgewl5YTDhFxPGJvH+0YkI/KMvFg4HcjsR6X73qyqZx370Sz6ZJiwH7dA4?=
 =?us-ascii?Q?zoOEbSD47Hc2VdP2TKCnLm3ji7lAxoH6+h7JxdycQDoPD/OiX2KFmM2VLHQ6?=
 =?us-ascii?Q?zM2gJaHnICIZfJz0j+BvHOI42ayHpq7X04Ts4/Eqle17n4lDIdfD40EMmmnS?=
 =?us-ascii?Q?BWkuka6hnZxF8kRe0E056OUh0BzE91UD1tSKjGq3TOv9d/CogGfgF3Y+aLGD?=
 =?us-ascii?Q?lq0XqPegIbfHOtXFQxxhJlhlOyCSKWE2s6vhSFw6vkmlftTHFTzo42wSKk9m?=
 =?us-ascii?Q?IvJneErk8OoxGtMDQUgIo5M7PB8j3pjlPzLOdL671LrrAr5gNC+8HDwegjSY?=
 =?us-ascii?Q?1387kAA2AM3C6A0hB8k7n+nvPcxvMD0csmO/djHVIAe9uTGfvxjsjCM870+s?=
 =?us-ascii?Q?1wdtLIXhC7XYffi09fl2A6U9wE4VP2lEca+PvZRyMma547maYBA2OVnSS2eO?=
 =?us-ascii?Q?vU+badpJiiii4QCJX3z6m1+dXHvaYu7ellzwIhkoH4PdUpOJRhh2cgIjr5X1?=
 =?us-ascii?Q?JamVfKL6Cfnc0Xact8ReWwZkMUrP?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6611
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b19cacb3-68a3-40e5-ba61-08dd6b067673
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|14060799003|82310400026|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+jZHbuLqiA73zWBR76UBe+kieysLgsAkckCbQUXe985qHCzWhwQoCrKbAZT3?=
 =?us-ascii?Q?v0TQQtAHU8i2b2MlFNOF03lIEv5wmc2wR1DlbtAoTP7//yPJvq+l2ze28mJ+?=
 =?us-ascii?Q?sTxouTrOnDLs//56jlV/vqw2ikW8zHkg6rpUmfsoLJ2U6HKLDNwOWyjRkJ1K?=
 =?us-ascii?Q?RoN9syT863hn4aQBOg4X59gDkNTNvmvtcUlYqAl9ZywiIR8wAu+6aAXc7tyV?=
 =?us-ascii?Q?O8pgAGzU6Iz9f4dV39gEzxATEXEBCHmwexk4aaOZ/5W5+AapWS0MKvvTSVYH?=
 =?us-ascii?Q?MDPunMPC/Wech/JecMumQr7Tgwqouuq5Mx6JjyRiVkPknEDBbW3lX3GvetxT?=
 =?us-ascii?Q?FFFUUe7Rw4zgWl1waC8U7xx0CrbgOr7DkgKvdD/AWoynAR/KzToMEEtVeMXM?=
 =?us-ascii?Q?9vTFjrxzHYlNAJ6zZv2BC0NTzpFugAlHAENqrU5QDe4FZMSvFHr/rjJe+2o5?=
 =?us-ascii?Q?x7GtRYe+4yPvmKccgvRROu3ktNFPPcQpaYtTn2g+XbLlPtxLPsz3FqQ1yh5Q?=
 =?us-ascii?Q?1s17zHwA3xqtXVvZynUrRY69e5DM15EfXjoMctCJsgC1KImsMNPvxYYfY/h0?=
 =?us-ascii?Q?8tbukhJBSyBcm72U40EgaPjBYGuKnrLur5pASG6ly6fVOCiliniLaFT3App0?=
 =?us-ascii?Q?Li1B8wHyNAKcp4l3Zp8pHtV7Ys1Pqo1/3mmVVf06OQa4bqeFM/Hghqu0FnZt?=
 =?us-ascii?Q?9Ada3yxRQlyfHLmh9WoTFX8z3MGVcOOKYKhGxPUBmEG/afjaNQeve4KhR+8F?=
 =?us-ascii?Q?OFBqlv7B6vbnmznqJmWfiRDlp/TKcbx5SyjqucSK5CLQ8wpcdM3quF8J6XE2?=
 =?us-ascii?Q?bR+2vcnUV+Fg1wniBVtF7MaWbiPc+pbRQEhUB0QUfR6UfGsFObkdLsZjRHr2?=
 =?us-ascii?Q?/hFagtUdevCrEAjaz/An5pe+iFj/VZ2vsYtZ0UgVsWV70OKwYZsuPfEk085m?=
 =?us-ascii?Q?toofQoSZ2jpyEQfDB+/lYW1dC71vH2sM9leWa4pjY22OGMC9sDGeNlvXynh+?=
 =?us-ascii?Q?HmlvdosW1CHpaDVkD1GXSoACylth+YQKV/AdMjSLNcPnX0Gens9mJktQ+ib1?=
 =?us-ascii?Q?mKjoqhqECfx72SAwLnqIDMEp/eCmyzomq04Lqv37MF+Qffm9gOs6c3VQ9Dmg?=
 =?us-ascii?Q?AD5HP2f7oi/42E3SrL2aOgxq04+E9T7uJWbgTqSFdjczBQBksK3hQHT438Br?=
 =?us-ascii?Q?GBFTRbZ1j9AkceDACGnl0ZS85LsaE7qCt1nfzeJoDaD3HjkVNdt5tCc+vrA4?=
 =?us-ascii?Q?y5xsWwgK9/X3ic6jt++mfosJT8lfNLJY15iUccMFY1abukcCB7jOjG/qLNDT?=
 =?us-ascii?Q?D1Jr8PhMQ0X5BGp2HLg9qhtE9RuYr8DYARPN0xfnFiIIUmE/LtEIKaEk4wMK?=
 =?us-ascii?Q?23jBZbY/FNe7Vt+dRCqTF0q5+e+28wiLzPJDh7McGwHPIWjKr7nVFIzcOjtn?=
 =?us-ascii?Q?vvvvW7Krx06qlRV4qVmfFcz6hAQ7+SIPe+PFtMJCKdVkMMXcQRLidYo56Q1t?=
 =?us-ascii?Q?YP7s1mF9Z5u34RI=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(82310400026)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 19:02:55.8416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aee3b45a-3c07-467f-b07b-08dd6b067c7f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_120302_068369_9A283689 
X-CRM114-Status: GOOD (  19.41  )
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

Hi Mike,

> Hi,
>
> On Mon, 24 Mar 2025 at 13:59, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> >
> > Hi Mike,
> >
> > Please ignore my foremer mail.. and please see my comments for your
> > suggestion.
> >
> > > Hi
> > >
> > > On Fri, 14 Mar 2025 at 15:25, Yeo Reum Yun <YeoReum.Yun@arm.com> wrote:
> > > >
> > > > Hi, Mike.
> > > >
> > > > > >  static void cscfg_remove_owned_csdev_features(struct coresight_device *csdev, void *load_owner)
> > > > > > @@ -867,6 +870,28 @@ void cscfg_csdev_reset_feats(struct coresight_device *csdev)
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
> > > > > >
> > > > > > +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc, bool enable)
> > > > > > +{
> > > > > > +       if (enable)
> > > > > > +               return atomic_inc_not_zero(&config_desc->active_cnt);
> > > > > > +
> > > > >
> > > > > Not sure why we have an "enable" parameter here - it completely
> > > > > changes the meaning of the function - with no comment at the start.
> > > >
> > > > Sorry. But what I intended is to distinguish
> > > >     - activation of config
> > > >     - enable of activated config.
> > > > Because, current coresight doesn't grab the module reference on enable of activate config,
> > > > But It grabs that reference only in activation.
> > > > That's why I used to "enable" parameter to distinguish this
> > > > while I integrate with module_owner count.
> > > >
> > > > > >         list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
> > > > > >                 if ((unsigned long)config_desc->event_ea->var == cfg_hash) {
> > > > > > -                       atomic_dec(&config_desc->active_cnt);
> > > > > >                         atomic_dec(&cscfg_mgr->sys_active_cnt);
> > > > > > -                       cscfg_owner_put(config_desc->load_owner);
> > > > > > +                       cscfg_config_desc_put(config_desc);
> > > > > >                         dev_dbg(cscfg_device(), "Deactivate config %s.\n", config_desc->name);
> > > > > >                         break;
> > > > > >                 }
> > > > > > @@ -1047,7 +1066,7 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> > > > > >                                      unsigned long cfg_hash, int preset)
> > > > > >  {
> > > > > >         struct cscfg_config_csdev *config_csdev_active = NULL, *config_csdev_item;
> > > > > > -       const struct cscfg_config_desc *config_desc;
> > > > > > +       struct cscfg_config_desc *config_desc;
> > > > > >         unsigned long flags;
> > > > > >         int err = 0;
> > > > > >
> > > > > > @@ -1062,8 +1081,8 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> > > > > >         raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> > > > > >         list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
> > > > > >                 config_desc = config_csdev_item->config_desc;
> > > > > > -               if ((atomic_read(&config_desc->active_cnt)) &&
> > > > > > -                   ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
> > > > > > +               if (((unsigned long)config_desc->event_ea->var == cfg_hash) &&
> > > > > > +                               cscfg_config_desc_get(config_desc, true)) {
> > > > > >
> > > > > This obfuscates the logic of the comparisons without good reason. With
> > > > > the true parameter, the function does no "get" operation but just
> > > > > replicates the logic being replaced - checking the active_cnt is
> > > > > non-zero.
> > > > >
> > > > > Restore this to the original logic to make it readable again
> > > >
> > > > It's not a replicates of comparsion logic, but if true,
> > >
> > > sorry - missed that point .
> > >
> > > > It get the reference of active_cnt but not get module reference.
> > > > The fundemental fault in the UAF becase of just "atomic_read()"
> > > > so, it should hold reference in here.
> > > >
> > > > So, If you think the cscfg_config_desc_get()'s parameter makes obfuscation,
> > > > I think there're two way to modfiy.
> > > >
> > > >     1. cscfg_config_desc_get()/put() always grab/drop the module count.
> > > >     2. remove cscfg_config_desc_get()/put() but just use atomic_XXX(&active_cnt) only
> > > >         with cscfg_owner_get()/put()
> > > >
> > > > Any thougt?
> > > >
> > > > Thanks!
> > > >
> > > >
> > >
> > > The get and put functions are asymmetrical w.r.t. owner.
> > >
> > > The put will put owner if active count decrements to 0,
> > > The get if not on enable path will put owner unconditionally.
> > >
> > > This means that the caller has to work out the correct input conditions.
> > >
> > > Might be better if:-
> > >
> > > get_desc()
> > > {
> > >     if (! desc->refcnt) {
> > >        if (!get_owner())
> > >            return false;
> > >    }
> > >    desc->refcnt++;
> > >     return true;
> > > }
> >
> > I think This makes another problem when
> > it races with _cscfg_deactivate_config().
> >
> > CPU0                                          CPU1
> > (sysfs enable)                                load module
> >                                               cscfg_load_config_sets()
> >                                               activate config. // sysfs
> >                                               (sys_active_cnt == 1)
> >
> >                                               // sysfs
> >                                               _cscfg_deactivate_config()
> >                                               (sys_active_cnt == 0)
> >                                               (config->active_cnt = 0)
> > ...
> > cscfg_csdev_enable_active_config()
> >   lock(csdev->cscfg_csdev_lock)
> >   // here get module reference??
> >   // even sys_active_cnt == 0 and
> >   // config->active_cnt == 1.
> >   get_desc()
> >   unlock(csdev->cscfg_csdev_lock)
> >
> >
> >   // access to config_desc which freed
> >   // while unloading module.
> >   cfs_csdev_enable_config
> >
> >
> > Because, the desc->refcnt meaning of zero is different from the context.
> >    - while activate . it should get module reference if zero.
> >    - while enable active configuration, if zero, it should be failed.
> >
> > that means to prevent this race, the core key point is:
> >    when config->active_cnt == 0, it should be failed in cscfg_csdev_enable_active_config()
> >
>
> This is not a failure case, it simple means that this config should
> not be activated for this device.
> It is possible for a configuration to be active on the system, without
> it being active for a particular coresight device.
>
> Having a get/put interface for the config descriptor - which prevents
> the config from being unloaded is fine, the key logic here is that we
> are searching a list of possible enabled configurations for this
> device and taking the necessary action to enable it if we find one -
> and there can only ever be a single configuration enabled for a trace
> session.
>
> Therefore when the list of loaded configs for a device is > 1, then
> all but one is allowed to be active - so the search code will validly
> find instances where config->active_cnt == 0.
>
> My objection to the original interface was not the get/put operations
> to protect the module from unload, but the fact that the logic
> deciding if a config needed to be enabled on the device was hidden
> inside the get() operation.
> My suggestion is to restore the logic that decides if there is a
> config to enable on the device be clear in the enable function itself,
> then use get/put as appropriate to prevent module unload.
>

Make sense. Then I'll respin with the suggestion :)
Thanks for clarification!


