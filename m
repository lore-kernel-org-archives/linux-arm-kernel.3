Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EBAFD7F97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 11:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ASgaxrlCn1woRPUaJjF6MU3u9U1SAiFBYiVuRUsIwI=; b=KrLt5sDUHirBhZMm686m1v5rCD
	eyLocHNe8CMPsqIfsM44G53oRVtfW0kDDrqtxeucnAoBsuIsuZ/+CV498NIdOA5F9eofvGK7KocME
	Oj1qhrjZ/cWAZV5jyJ4beATAyW3jsGAWKFuhtGdzY2U6/nQpYDmCAUKdElEcw6OLWeJsnUJ/hXr1d
	CyutGWxmW3NJEe99QyyWOJsBP2H6Hvm7naUxRWOQdViHatPqtZsSNHlB0T6QWKSVJsGx4V8SGo/nX
	lJ0TWf8XGi64XGMlDn1Kuhfwn4TgI2QERg/h2Rsq0JJUk6eo7HS+RWdGh34oh4paiBFIRAH90h555
	gPY9JEjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvw89-00000008INI-2MHk;
	Fri, 27 Feb 2026 11:35:37 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvw86-00000008IMv-17kx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 11:35:35 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=j2LKjNGWeykJTpjvWpoesHx2yIMquV2gN6kzLgm5oyilt+2bv8nvWi0uVutnCHBHSWn/odxSqtfIotQkTkTqhglHy0CClKU5H57y9al4vnUILY8v0esOzvmXXvz2xlfE5NMhNh7NNKMmD4I9lc13WhwB7AtAZ7b3clxWffR/FEocsmYnJf+j8LihFg8uw958O67/jACU8YpQv/9CNHccz9JvE58nMXngaFhBqBTiDnW2CWNQC9tWZbvLdOLy39+w+2Bxh+579CZ92az5wloASYYAFiqFmBhmsry3lCucmQKELdaNgqa1ERWhMjjG6oVJy6gZx4DbsJE0wY4Z9A06jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ASgaxrlCn1woRPUaJjF6MU3u9U1SAiFBYiVuRUsIwI=;
 b=KeOQ7NZG18i4ZBN6TQgiFp5+kTiSRMcZ6Ca3MX9rEdOsrIMza9xjurUUz31qQ6G9GGyVwpAJ19pAigp//FXsBsQIpQNFd/2DqPOd8ZdRNGHpTuPKsdnVbfjVXeD49fxCYtEK5O2QKUdt9B4wt9f8NnfdMQuIDkN54N/zr10Kp+OBCl0472n3tQKE3NxQL8XV3NITyHgT42cjZ9RMFQRqjZr15r58Lo4W4m3Va++Rjlr7Eemq8zme8xGyV2LZoaAg8GruNszsZsAUzHlaBqJTFrkpaR5TfZx4Pj9AEXsFfjleoavHDONLkILWwriwqgDWvo44NPeBKjP4MeF/liFkrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ASgaxrlCn1woRPUaJjF6MU3u9U1SAiFBYiVuRUsIwI=;
 b=Fgo4Vbw9yiII4mflJ9+ft1PX6DappIRFlLHj10+N3I+xOTC9YSCqLrx6v1iky0FKSI7sOnSrHKhYAp/Ijp7NqQr7LZD5LFWklyCDxc6hL+1JrMrmCVKsu3jjpU7qTX+Ub0zcGRgkaU2TNPib5tuQhjwFx0HK0vb0ADOtL/HWTXk=
Received: from AM0PR02CA0161.eurprd02.prod.outlook.com (2603:10a6:20b:28d::28)
 by VI1PR08MB9981.eurprd08.prod.outlook.com (2603:10a6:800:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 11:35:21 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:20b:28d:cafe::79) by AM0PR02CA0161.outlook.office365.com
 (2603:10a6:20b:28d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Fri,
 27 Feb 2026 11:35:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0
 via Frontend Transport; Fri, 27 Feb 2026 11:35:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xpj+oEOFKR6cTtppLokhkwSNjaHTlgHLLayqAr6OZ9SXnIeuu0vNbDoyMGtC3c95Ds+3CKel4XlslPe/zC6yuvObRvcRyzjCjvy+rHH5Kj+7AkpnNG1FOox5ahosievYP1IiKsgxUjtOHQm68Ya5CejewWMCSqWY/VIuvwxOxCNrV7CS6pGIoVmhT1ACjZo0rVIzh4Iy1fN5Q6O5xy4cAIm9GlFVhcIAjMqvbh31nHbcz0/Bjf1cvbYNpnzSR45tXHh2cfl1YbwdUwN3C0MLUUbTbzRZNn4e2+VWV1NVX6B/N2nQyUeY2aKKjNez4hDjWctOrsnABBDWLxOulBCgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ASgaxrlCn1woRPUaJjF6MU3u9U1SAiFBYiVuRUsIwI=;
 b=vgnDHF5TisQkgzkGCjl71NKihhkBYSDq/j6G2eblCxl/Epqkw+cA6riAoBWCtBAI0Ak3Wf1+TvMKEI2laB2H8SSw9ewTKUwxH5IBXNrAKEUVNQ7FM+NBR+m+7YX3PGN5qRKq+aWTBJq6rGygsA17F1KSRfkKUJ3rB623g+yU23nx/D4KLEH0DIFf3gdNliKrI/+ZrpLYDwEw15hlk10y1oEVN/c4SmCiB/RTcsIDDXmFAM6eP9PAxS0JzhJmGlwbjAqg5kNPxJwHus/8e8WddS5B55mBMoPS4moOlztXsC7vI1WKLVozKvsZaXOQxJmisO7t3fBd1f2AYWko0gZIdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ASgaxrlCn1woRPUaJjF6MU3u9U1SAiFBYiVuRUsIwI=;
 b=Fgo4Vbw9yiII4mflJ9+ft1PX6DappIRFlLHj10+N3I+xOTC9YSCqLrx6v1iky0FKSI7sOnSrHKhYAp/Ijp7NqQr7LZD5LFWklyCDxc6hL+1JrMrmCVKsu3jjpU7qTX+Ub0zcGRgkaU2TNPib5tuQhjwFx0HK0vb0ADOtL/HWTXk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by PAWPR08MB9616.eurprd08.prod.outlook.com (2603:10a6:102:2ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Fri, 27 Feb
 2026 11:34:16 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:34:16 +0000
Message-ID: <47fb1406-929f-401e-90d6-0411a591f503@arm.com>
Date: Fri, 27 Feb 2026 11:34:15 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] coresight: cti: Properly handle negative offsets
 in cti_reg32_{show|store}()
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Tingwei Zhang <quic_tingwei@quicinc.com>,
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 Jie Gan <jie.gan@oss.qualcomm.com>, Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, nd@arm.com
References: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
 <20260226-arm_coresight_cti_refactor_v1-v2-8-b30fada3cfec@arm.com>
Content-Language: en-US
From: Mike Leach <mike.leach@arm.com>
In-Reply-To: <20260226-arm_coresight_cti_refactor_v1-v2-8-b30fada3cfec@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0308.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::7) To PAVPR08MB9674.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAVPR08MB9674:EE_|PAWPR08MB9616:EE_|AM4PEPF00025F9B:EE_|VI1PR08MB9981:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b7d6fd-e698-431f-10f4-08de75f44a27
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info-Original: D9Sh19HxNBQJ8KI9gjxb0aAg4kwzCp3OqFYXS9Xzlu42cG7kG1M5TgBK5ZXZq5G9TKyN/v6fxZcFHB/8rwQfv0wAh61QDeL3aPr4hiMuux0fOn9lbnbR1LDDB2QDgC1mzKU25EFKrZwfavao4d6tTUwNyFPXo3UheS9vRHbd8GfXaUnYLc6hEDd7mFY4EPuqPhkmw5WroBlOl5hPwR0tjWrEUliBG74ZqFXJQNym078lP28KQEbye+SBD9Olj4TDE1HAgaZd/2kFPmuFnc5AGazd9SyxAHthB0ef/9D3WK9ZC9aXALGWhW+YTAn1vtbNKFRas97V7PbA1nOdSqV+FBJ9W7U3Xx4lqhtcmTSl0ZlHDhAbz+4qlFL8FCAS2z4aWX2sbY0hoFraJDAuiP8KyiBCI4T89dUqObLWcU33OtrvoTn1jgROTogumG5x0823nNJEclU8Epb3JPeXjO/hq/2sQLPe65NkJFGbta9rkg3rqTfRphSHUKUPOIOOJI3mU7lksook+iXTJ6pMsKMjDlNOm/Tkm90boCHaHGAiRxdGwR8T76m/gF3rWtMN2MgdzftsU8pFYjyzGQ1ylynNl05+eska9qoKUA8MPVNBBlVZBw/RvamXdQsGLe6L925eGdprm+pXMB7Ks1eN9PElpf4jUoJ32F1pR0NXqeAH6i4hTbnjESu3goBGgctkDMHqgPuTRdk7Jz5pCxbCNCgPSPwAmS/EnwdBuSNTVJsvWnORumRKciLqzHGKVmjQtUr+SaBYLAQLZe02OuuoIko9hg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9616
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b003cc92-af90-4be1-fbd8-08de75f42386
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|14060799003|82310400026|1800799024|35042699022|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: /IMhwrAyC9/Qv3Ovnm0rxgKIyMcmpmUy1u5F9LdiEmpwSXff4jkA6DhFS96LBuHBOOblJ/L6ejpInGeFDsTdALol3Fzxm8E7Dj8tyeZXApvEuHjx8MtKvs4Cc+vshuvGy+XyQtTkhpsSB6ufuDYe+25yR1B+BsMkbfxq4oHeUhQoNevp99wz0ilQu96V+I5IiItSe+zKPbVidEi7vcc3guzir6oQcruWZ2bSFptcgYfIQdSS563ZpGJQkPGyZBWTmATSXBtxGTJA+W5yO6us6mpkOlUQqxW36trOF/8LgTLaA8uFl7KzvjtGwBDTcQNn2oNhwoH3UDkVPHONx63ZroViw5CX2eq26eDLMGn95GHbMQQE5XKnwBTVmEmyiYsBiAKjTQUQVvcasX5G4v+EE84slT0cfszP59pMTextudyIWi23Y8FSvkjHa056ZukOsK7iLGacUFO4VkECLAzf8rbp/E+YBOI3gjGcEz0T12EThZuhLaF9abtgHCB3LNuLmJTpAtZGuHDXZfetpLvVWLexGQe8ElkzvJwySFM5zxHNGbSpsZrZap2sLtnyTlw0u5wLTvSaDmkTx5MSSzhY/almAEzNGGickLcUn+MYKchQidkiwTdxgoL1hPUC6q5ruotsQ7iupCa72RAxFxEuYcKH4aAjrB9+y/32F7DKvRTlPm7oo16ZzHMhuO0pfZX83EpFpvqoGvpcy5/ZyidvoAoAZaS9jMKRwr7V3r1blZe9N2bzO9PHq6jI/Hv67yQknrABi4C7MHHp3drwiT7hdgaLM7FEjFUeZS417dihuZXOqQGoO5sOi3dTXGILcIPdd7UKSb8zf+6MdQpg6wSilw==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(1800799024)(35042699022)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MlAVhJCcvCLd5kIhW4jmJ63I1sVj3IlwF0D8DR5ZedM35pUKLoHD+d3P17/L1EZIZN19UWNjc2eE3zRTpqCWDNSUF4mAm6LIZtY4TdaXPHDQ2Z4bpxi+YJ00SenIOWZo3DxEsceOaTUYA+laxkIouE/lKXsMMeLnbupxIQAnHdRuNM1Z1dnn63r0G3FJqQ9DzPOOwyogQ30JKkm2bipiZn3riW6NFo3OCrQR3UGo8pKwH4vcnEWKJIy7bRnmDr/5gvCywtkz9hwmWJq/EqaU9JYbRLUDdkfSlPtpNUemk4qYjlQDjKGVlmTs/GaIbhzH6DaYUMh897/19NoJx3E8PpeKfh/xfpEbJYMq4dqF7sbR4QjXp5Vs0MkHvD9Dw19nGvMR3rLvfRHaWCcJ52oxjzKvxC/JaMeufSp9LvslT3Sr1s7k3TxDyqvB0mElDUBe
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 11:35:20.8756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b7d6fd-e698-431f-10f4-08de75f44a27
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9981
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_033534_407317_56E762B4 
X-CRM114-Status: GOOD (  17.37  )
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

Hi Leo,

On 2/26/26 09:23, Leo Yan wrote:
> Return an error when the offset is negative.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti-sysfs.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 9ef44956ebdc7781717d773fa014165989df2048..4c0a60840efb9ecc47850c1eb5a7abb41b49c5cc 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -252,8 +252,11 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *config = &drvdata->config;
>   
> +	if (reg_offset < 0)
> +		return -EINVAL;
> +
>   	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
> -		if ((reg_offset >= 0) && cti_is_active(config)) {
> +		if (cti_is_active(config)) {
>   			val = cti_read_single_reg(drvdata, reg_offset);
>   			if (pcached_val)
>   				*pcached_val = val;
> @@ -280,13 +283,16 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
>   	if (kstrtoul(buf, 0, &val))
>   		return -EINVAL;
>   
> +	if (reg_offset < 0)
> +		return -EINVAL;
> +
>   	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
>   		/* local store */
>   		if (pcached_val)
>   			*pcached_val = (u32)val;
>   
>   		/* write through if offset and enabled */
> -		if ((reg_offset >= 0) && cti_is_active(config))
> +		if (cti_is_active(config))
>   			cti_write_single_reg(drvdata, reg_offset, val);
>   	}
>   
> 

Given that at this point the code is only called via macro, which 
hardcodes the offsets. don't think the check will ever return the error.

But in case usage changes in future this is safe. so..

Reviewed-by: Mike Leach  <mike.leach@Arm.com>





