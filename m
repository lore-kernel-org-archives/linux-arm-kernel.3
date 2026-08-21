Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C92C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=swDUK0d+vd7c1Ycv7MVSrUJG1xsWbpKDMvK+c645i94=; b=jYXieR8AxnAxeMwf0vVzzlRCuQ
	FmazOt9scNRmACHrCbA2eKLKhbJ6MWBUFHQ0mJCDWjKPxon/XSPwkjjhAZz0ASu4RZmcfcitheJbW
	gvS9C3LQJdNRF7c7fI60fIT5b9LxdQd2myIUZ5rVoMf4Y1TZX504/+miCWSMia0uoAtWt8hHDwZ8X
	/bnwNE+tM18WReo305VatOrDCkE1kNsN7aH9vt2Re3w1OKieWAjPkXP0JYL6s+DuRYI34opjKe6kO
	S4ovyo0hPeg4qGCU3rUBlgVMTqYfvpTZcXK7XAiMXi+i5T5ILz5eMNiu8yhCuYWNTaYHgfUamM4sY
	E98VtowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxR4a-0000000Df9T-1HOJ;
	Fri, 21 Aug 2026 15:22:24 +0000
Received: from mail-northeuropeazon11010031.outbound.protection.outlook.com ([52.101.84.31] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxR4X-0000000Df8U-336V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 15:22:22 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yKsT27hDOIzC+ByWhdzVYo0ZRfBjki5c5sxlogexhn4c1a3bjDAvUih8fmZ30XxMUafFyLLfVG4DW4toY4lHF/+LGNeSRJ/yWTvk5lBn0l94igIhV3TzYszMKtgLzF2vLFoxBiCPX+K0NSpZVn5Ok0Ze4Bu420YZsyGzWcTqY1B3YQg9Y58y80RjMPR3lw27SDbZotmUOmBWV7UZnkdOkkhLXbSFDSU6e7vMugWPO0tOYlpg9MNlJqPrvDt8LbAeDTgL7RNKPXL5ghi5jbhPpW9TGCI+BBvoCjv0PLHUMC75uq2WnUGxBh79WT67LI5KA8pUWarKA2qau9skO4AJSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swDUK0d+vd7c1Ycv7MVSrUJG1xsWbpKDMvK+c645i94=;
 b=RDa72QBB4EdY3XUBxDHr5RL/BwsaPbAPBtGp/GuQ7jLE0N8zmSL4Eu/fSmfdTustYiD++KebVdtQjHVZLP2DvCg20ZW4SEli1Dj6N9b2vYnBgTx0AO9jsurtR4puymgJt+sWbEfwUNyhu41NdC4sTocCgJINhmt7G4zwK0whs6U1ZWAKpaQjyfMLkTndaeEszdA4HrBny8t1waIBa9hlPiasfmF+2HBjPNLRVHdkAcES2VmI2KjHhKp00dA32SoH7rSk5fJH9RNImKiwrGq/2NfIQQL18HI63gRsQzZv5QkNpj/qVcCRnWhr3cEXllcdCqZxRdjMk1Ae2/4JEpW3PA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swDUK0d+vd7c1Ycv7MVSrUJG1xsWbpKDMvK+c645i94=;
 b=dFkfmpQ1DhG+6F38J6ofjRRUwgJL6SYA5qAx7djJLJO0kkdma9gD6X8lc76odjUwH84kJAYDbUqNgmo4xuvKG0Z3QTzy/2rfMvU4orVjFbl+7Noc/o/gPvL+3wKvJy8X+GsN9I+PXR8Z2EQ6lbNODd6btJm2fJE3M6mBk2cc3Io=
Received: from AM0PR10CA0040.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::20)
 by DB5PR08MB10139.eurprd08.prod.outlook.com (2603:10a6:10:4a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 15:22:13 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::79) by AM0PR10CA0040.outlook.office365.com
 (2603:10a6:20b:150::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 15:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 15:22:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEi7E3qAlFFpGYDVyCbOMaZJ+AlsqqQU71aw0+3Gb4XWM+T4fdIWfxI87CYmoq2GSwso5CaLf8lnJFDg9hnGQj3A2mgrXZTu6SrDKLtPTb2TEnuscUwk+7X+1fte6n391jPtunYvhAa/+0cWBnhR6W7FgZD5BQi1XBPKXHByg+LABoZTisyUst1vbVysPMsvbnB2W2YOX4Y6xUAReWu5vq2cICgBQ6u0gEhmlX9XwVccjUEza5zwjcXl9LpxLAQdiKI3AUXeapit5rrdyqJQnc+4Vj9j5XE7aaiNx0MmUBHIpNic+gqws+iPc/DJpOF8dzWYtYSaMMK8kSHhA77Tdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swDUK0d+vd7c1Ycv7MVSrUJG1xsWbpKDMvK+c645i94=;
 b=QV31iPlPKgWyFxiIB39EfTwYXDYt314pvnsGZ3/g7PTZtc4PjDWxoZcApyijho7cZKiZ9MyQ0FLPF/w5FsA8OmVdJnvWRg+wLZK4u1lil2MZjRrf97QTBaZVVG/LcXsDQ687pLPp3abA9Dzr9FVfyDls0NacqM9d4M6bhllT2zmck9NT7YGBmS4LklSQqoZ+2BELOwPzp+efIVNnpZNodAkM1/I3blK0ynRe61iGdAQ4t5MTnNArn1yRBrQ20ViO7RYZltDo1prQGH+2BGnV3Wc2cfpOREp3N96gyxCneshhlcCvXbzMR1OKsekh494eQvHNxHi5dNTmW97oQ8as8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swDUK0d+vd7c1Ycv7MVSrUJG1xsWbpKDMvK+c645i94=;
 b=dFkfmpQ1DhG+6F38J6ofjRRUwgJL6SYA5qAx7djJLJO0kkdma9gD6X8lc76odjUwH84kJAYDbUqNgmo4xuvKG0Z3QTzy/2rfMvU4orVjFbl+7Noc/o/gPvL+3wKvJy8X+GsN9I+PXR8Z2EQ6lbNODd6btJm2fJE3M6mBk2cc3Io=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by DB9PR08MB6553.eurprd08.prod.outlook.com (2603:10a6:10:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:21:39 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:21:39 +0000
From: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
To: Cristian Marussi <Cristian.Marussi@arm.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, "d-gole@ti.com"
	<d-gole@ti.com>, "david@kernel.org" <david@kernel.org>, Elif Topuz
	<Elif.Topuz@arm.com>, "etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "james.quinlan@broadcom.com"
	<james.quinlan@broadcom.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>, "kernel-team@meta.com"
	<kernel-team@meta.com>, "leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>, "peng.fan@oss.nxp.com"
	<peng.fan@oss.nxp.com>, Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>, Souvik Chakravarty
	<Souvik.Chakravarty@arm.com>, "sudeep.holla@kernel.org"
	<sudeep.holla@kernel.org>, "usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v10 14/24] firmware: arm_scmi: Add Telemetry generation
 counter event
Thread-Topic: [PATCH v10 14/24] firmware: arm_scmi: Add Telemetry generation
 counter event
Thread-Index: AQHdMYDD8/de1pmsi0CrmY0BhWmy4A==
Date: Fri, 21 Aug 2026 15:21:39 +0000
Message-ID: <0E73D833-2E0D-44F0-9A94-A7D295865B74@contoso.com>
In-Reply-To: <<20260815232604.3730754-15-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DB9PR08MB8651:EE_|DB9PR08MB6553:EE_|AMS1EPF00000042:EE_|DB5PR08MB10139:EE_
X-MS-Office365-Filtering-Correlation-Id: e4607334-d40f-41d6-228c-08deff97f9d1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|38070700021|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original: oEm3l9L+QYyFmU2tFyt3Ub5AByPp6QPnTUtYHPCBIJiuHSN7qfvR9HN7yoJOiVnQ/enVsKOucbOdwFWFWUz9/OqD5yC+iWpFcrR2sXbYByqnOaLDhUpjTFOa4R5CNdZBDliD20PQSysd266LJO20JNi7ISzW9yLTaJR7EjXxEf0i+solk+s6Q/fbjcR2hEja4OYX410XR9UzjrOtqhlTw1PM1f6e0pFGyk4LsZ5jmHFbJc9MM1fsM12W6I+nSe6KEzal73CwqHTaPbrwdPooCuTQAyH++Eg625MHH4svgqvGmfHZ0eauaJf1Ap+/PLll0EgHOpCd863Ziw461NM1/GSnWFq6elVDer/V9UWy59MqBuahC/iV4NfYl4MzU5EyIeN5o2ndaHmcMn1hD3ZZFkcX0kQxCMbVkw7dszXaRCv4l2sziLS6xSbQFxUu4+FQG3EFoMehiL/UiZyKbD1BxMQXb+cRaZKgZPGqMEtO8CN02f8csaGX4ee9mlPi8pfpQYCSGhjaznjAv5wnncU2tTKygWNr4ADF5ian12fBYTxebFH7V0xm/f0/ulZSoQKQ9ko8tBzFsiX/rESF3rgvpMeMqXZGfXXbgOTDJlmIkuXmNxh9ledaizU3l1KUfGUNL++/0ZMtQoM0qw9Qtan9xnUJVG2+VIiv3AkklV2s+B5gn0HmF+VdWbc+AJXS8YNNO3oOLBCIk5Bp80VArox11dYWB9ez9v6nmyM9AuOdhbo=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <91C6E1B13667A34B87F84AFB005721D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: joc6HJ+Uepe3aVja0AlwvTwBcnJXO0XV0bgAdjw0s2C+BzQKlyBVixOOi//tbirlAReg2Wmv0CdWaC43t03U9vn1MhVl08o1HdXn4kDJc66N2+6QZpn1rJ0v5+jv7kXS1oDeh80DgbaeHAVPp9yhfzA6UJnOfRcdG0m0Nq/56R86AUuS3HgvkPdVAJ0xgNHRzavImF5IBt5tHoXJZ1+ZMSYGYMK8mm6LNOS5030Kl8F9O3lj/oyZ+tCPzxcLjPQIiNfZgD5ZB6mVc1RzjPiHtNWtQ3bRTI1gZBCI35OW2o9ekU7BMC7zDiaF2M9PwSmYX25uVf9XyiZVQBPaiBUUbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6553
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8424da99-40dd-42e8-8f5a-08deff97e5f6
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|14060799003|1800799024|35042699022|376014|82310400026|36860700016|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Siri0uUlb0y6GcYtue67sWjK2M2QHBymp8nT20/fS9N5mEHKgpNBvFIm1HLNlYVbIvMhHtoOoxB5x6hYEmTsf7yA7rtMozn0BVdFEm0sPhZ5fNnGInW+wuh1qMTDkm4M5+YpgtlrV0ZPJIZPfuD6XWPhOgpa/QH/Psc2rbpY548QAmrQFuCEC37gy5zvnZ6MiHbu6PofemzbHTTz8LZzTSyIChbSekmyI83bHo+QXf/4ronJcO8VJuWByAUzX8LOVcCtC/yr/OwWC55FTF94Dp2N4SZufclyv32947w7SVAD7I5me9IPPHCNPwHEz9v/xzIjsGts4iZlTeiNe8f0mnYLZvostKUCRMv5WUDl200IA+kRnRT6QIWcQDI1c+7jOfDhJnZBDr0UKYZ0LlbrU9VNlLHCDyhAs3BvOY4ZwOS/OYrw3vF1UgSQdiDhkRIQoIoz6pdVuhsMB/sEZY19lUWYKsekmY/DITPRoQLqabFLoKJeDEoYhl2+bylVyDywsm/8CVLu2n1wbm4HPCw+c4QPlCppF2f+1wAgmCArzzNYpPYkPg/LK0CT+jxzIErdMfCIJdjpizVD2QsTm0hfay9YX/2fO64F4qSoekeUg3XmnoQKUaVpbpJeiR4U4UJH8JbCc3qJWMPJgjAHWY6PffxGoze6rnBqPZft2L1Rqpe+Jo6BUOg4aiarHcxhfCiguKYZ4lhq2a2bsfaV1LHGeQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(14060799003)(1800799024)(35042699022)(376014)(82310400026)(36860700016)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: t/XyuTJS8qHMwby1JXpcjypXYYHevsGxkWx4QVPchXYs+S7092Xl7nOSRolWCHJLp+pMIEgcaqXrGWN06oPmEcXVsg5UbNQgu/UdW6M8M/OI+zRwmjvxpFAbF4SaC2l1bxgSj+w6Uyi2vW6QKODZJL7NpUoaqGGy2c0Zs18Y+7dLz6PkarfhF7mVdvKiF/rCXOBh49RcCnWk7Dfdlc3STrb8ahjeRPV60yB6VfnPNJPQEnxirxdnszbR9hWKSbzrL00kxsSEoTSrgzaK/aNq0jMP7zSXA/OZuwo8ArPHvV41N3z0pAYAcAcrg0qvxmolhYeLUTsgTBfYkLb6gP57bWgL9nfc/SlhLT8E/hYzlLLhRpJHKZz3OC5Fk17v7X3DOJ/LVMAl+az5yTV3tcB7seraM4lkeg+ksMTeM8lEeB8G/+5vaZiYyPvpq0kLUm1Y
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:22:12.8625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4607334-d40f-41d6-228c-08deff97f9d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_082221_787772_9DAA4533 
X-CRM114-Status: UNSURE (   8.11  )
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

SGkgQ3Jpc3RpYW4sDQoNClRoZSBnZW5lcmF0aW9uIHVwZGF0ZSBpc3N1ZSByZXBvcnRlZCBvbiBW
NyBhcHBlYXJzIHVuY2hhbmdlZCBpbiBWMTAuDQoNCnNjbWlfdGVsZW1ldHJ5X2dlbmVyYXRpb25f
dXBkYXRlKCkgc3RpbGwgcGVyZm9ybXM6DQoNCiAgICAgICAgbmV4dCA9IChhdG9taWNfcmVhZCgm
dGktPmluZm8uZ2VuZXJhdGlvbikgKyAxKSA/Og0KICAgICAgICAgICAgICAgIFNDTUlfVExNX0dF
TkVSQVRJT05fT05FOw0KDQpmb2xsb3dlZCBieSBhIHNlcGFyYXRlIGF0b21pY19zZXRfcmVsZWFz
ZSgpLg0KDQpUaGUgcmVhZCBhbmQgdXBkYXRlIGFyZSBub3Qgb25lIGF0b21pYyBvcGVyYXRpb24s
IHNvIGNvbmN1cnJlbnQgY2FsbGVycyBjYW4NCnJlYWQgdGhlIHNhbWUgZ2VuZXJhdGlvbiBhbmQg
Ym90aCBzdG9yZSB0aGUgc2FtZSBuZXh0IHZhbHVlLiBUaGUgYWRkaXRpb24NCmlzIGFsc28gZXZh
bHVhdGVkIHVzaW5nIHRoZSBzaWduZWQgdmFsdWUgcmV0dXJuZWQgYnkgYXRvbWljX3JlYWQoKSwg
bWFraW5nDQp0aGUgSU5UX01BWCB0cmFuc2l0aW9uIHByb2JsZW1hdGljIGV2ZW4gdGhvdWdoIHRo
ZSBpbnRlbmRlZCBjb3VudGVyIGhhcw0KdTMyIHdyYXAgc2VtYW50aWNzLg0KDQpTZXJpYWxpemlu
ZyBzeXN0ZW0tZHJpdmVyIGlvY3RscyByZWR1Y2VzIHNvbWUgY2FsbGVycywgYnV0IHRoaXMgaGVs
cGVyIGlzDQpwYXJ0IG9mIHRoZSBwcm90b2NvbCBpbXBsZW1lbnRhdGlvbiBhbmQgc2hvdWxkIGJl
IGNvcnJlY3QgaW5kZXBlbmRlbnRseSBvZg0KdGhhdCBjb25zdW1lci4NCg0KUGxlYXNlIHVzZSBh
biBhdG9taWMgdXBkYXRlIG9yIGNtcHhjaGcgbG9vcCB3aXRoIGV4cGxpY2l0IHVuc2lnbmVkIHdy
YXAgYW5kDQp6ZXJvLXNraXBwaW5nIHNlbWFudGljcy4NCg0KVGhhbmtzLA0KRmF5w6dhbA0KDQoN
Cg==

