Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F877EF4EAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 06:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6kdWCFQGhso/9sCzQu2HJHKfgv2F+U+QjFNPPaouJs=; b=Dv0FRiXRgD1aeRwztVxH7Fwjrb
	6KpdQBLRgJBp4mg12rhyofvbOVxUW5jNa/Hp/K8pbsxa9yUpHhciUUVhxUjZaKFqjBObOfhPcTCIJ
	kzbpqiNtyKIhEa845dF0oUEB5luoLeuUCvN+fgLSzJIS+fsFixt2vK4vd8RfjvgTLR1tHSXWTDuGY
	1q3zp0xeknYh/MskXAUeJPpFxxR+/WPsune1VL+gfkKNQ8k9nIoaDgs2DnGw/BiKOeZDC64CNK3iM
	LyVsHdOWeYv6QrX6xod0rtPe2i6Y0Qlob3SJjySnWac6bSMgbMkL4Q7axDd2Xz3oE/Cm7fdkEIHVM
	XNzeTz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9dWr-00000004qfC-0mmq;
	Mon, 06 Apr 2026 06:33:45 +0000
Received: from mail-eastusazon11011060.outbound.protection.outlook.com ([52.101.52.60] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9dWo-00000004qep-2n4n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 06:33:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqF51v9hyxuS9AMU/MxL9eKFZcWa0m93EGsF4dl8z8IDwezmGrCHSSHWTzWiNUitlrx8fCbscbdEgxAJNPIPZ+Q+StUsUxBwFA6D1NKuvezsIIycwCTIeFKeG0/tpDSdJjpov7AAHNt/pShA5mnaZ0n6FpGJWCxAROrpQoiT5BQd2PySiKa2WtsOxlYWN+CEPlo4tv8Xip8KgaHf5F484zHwZ/fylwgIyXHktnqjxa/ZPaaTAzVUTCeWqsRuGgIUXmug+l4NJxPQM5Nl2nUJVUcVHYGxCPJwyWB80GEdaO6rosxtC7qawsyP7BOIHvayEN7X8rMCF0esXn4CNPct6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6kdWCFQGhso/9sCzQu2HJHKfgv2F+U+QjFNPPaouJs=;
 b=onS5F3dpGKFAbEUep9zFWoUl2OffqNVkPtV3TeNjlOW6O4bsi5Q32jOow5wMBIvRXgykLkSoS1YOCxPZzOlxSkEnsJhggFfiA5kdu9q+RvnP3jlR/e/uKmGxq9PxHFwgEiDPW8leun7pbshnBwKLlOnGeuaNmRe8ABgp8gHlfYYZ4BzC/mo1Wwa4cRMnnwD81PR5gFY41O2QVfKdHprNqhMR8E5NMpjHAlkUubImeQTI4p28r14vaX3h1TItWew9nRbm4k3PzaZBBUO1YwP2XdM4OZYoyPkwufjKIPVIDTk3HuSlr3tVQ6w0hyI4HiGNRpQMGp3XBLckrZ1CXGar+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6kdWCFQGhso/9sCzQu2HJHKfgv2F+U+QjFNPPaouJs=;
 b=wRdFAONvxV5jHtz2nlp5lXJNHEkmSpc+/P4pXI6xsQbeymbHCerTTr5LmSanAn9oOGSq32HLEYtnccjgHJXTavUPnV2Qd7sDAwIy/UQgscJt/qqrBKQPnb+matWUmQvhMIzfMkzV6uxt3utOCdHV14JkPIzHHugWS9HmqsCtI2M=
Received: from DM5PR07CA0119.namprd07.prod.outlook.com (2603:10b6:4:ae::48) by
 IA4PR10MB8612.namprd10.prod.outlook.com (2603:10b6:208:55d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 6 Apr
 2026 06:33:38 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::c6) by DM5PR07CA0119.outlook.office365.com
 (2603:10b6:4:ae::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Mon,
 6 Apr 2026 06:33:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 6 Apr 2026 06:33:37 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 01:33:32 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 01:33:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Apr 2026 01:33:32 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6366XTJe243894;
	Mon, 6 Apr 2026 01:33:30 -0500
Message-ID: <f70d16ec-f472-4b96-94d0-43eb4acffff8@ti.com>
Date: Mon, 6 Apr 2026 12:03:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: K3 updates for v7.1
To: Arnd Bergmann <arnd@arndb.de>, SoC <soc@kernel.org>, arm <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Tero Kristo <kristo@kernel.org>, "Nishanth
 Menon" <nm@ti.com>
References: <e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com>
 <1ed625c0-e977-42d4-85f0-91e90a4c3547@app.fastmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <1ed625c0-e977-42d4-85f0-91e90a4c3547@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|IA4PR10MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe5e0ea-24cf-4061-0827-08de93a66f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xiZ39vWuiupUPkN56WFVNyrDO0wLh2iQ8vPqK3wY1J0mPrmmXzIWaaoQt+mOQ3s6K8n8XIrM2qv8FV8SaDk/p1kwDwxVPVPuYqNAoDo/KWJwonHwsQEhw/VF5+Cp6CPop1CMWwvAqgAW0+SBRpJOeciOxBUY/xteLPZZ/45hkYZnu9N7jTcqlIvGreYnJIcK49BJMAZxq65vvi6y0Pu29nYUIj/PoaNYiv0TUgKElZZPJaAuKo+ZmokwPECI4cF2MjBJBGmlm0cbwwqsy5tj2x/1bJ64PpfxXyJF9kXUUG8P3Y5nmOrWNE2bp00zSmMSYBeKn0uuKNcH/+0MGit47LAlfpMdvST7+qlhz+LqRzWxEQx5bizgSn3PoNTLxtUhutdOorXsp80cQhaSv5jbAjamoWwX909ODSg8ktcO9HHSorQbrCRIbJvxXG61V1eG/trFN9bHJMK/ywkOYQ9iPN1Axz3Q1qp1Yt+d/wRBtC28mpWa0NWyawJ6HVXFIw06S3PwRDsTKXn2C/4vYS8tYZU89hcUVHUPa95OM5RYY8e+4Icu+pW4Xvlf2u2FmR0sMkzZquoIvl1WzjWq/JZxs8XaOAGjtxge3w1rx99K38buwDQpxwCj+PHAcqqHnOrylEM768dhvugHMAysck8kbOPJSlvLNPvmd1D+wEHS9zcgLBk12O7Y9nD0jjIZvXHhy5WQhI9NQeFPMC9p8HnW5swq7aITGj8CUcEO3DDWVaTktGpD+6CNaGjbx6b80R1/s/gMlmz4nLYNmnGUT4w8pw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oJJOHH80HZykyO/qNHCUq0Aw++854nveBxeytEHZZb6glCOD++XSY7dd1mpxxzo6/5GnGoEKy2z2W8A0MRiS4db/pt/A3qixeycdr5RM5WEDas+n4eHSd4mX37HR3jDjMoDkew9cuP9bi9ECu/2Da9Bto0Y5s+kGzofmZkTmddboX+tt19uVuhsSXpXY82NvxgwWxhpQbrGDlCKjZPW4au5cuv/LERs9YzZ3yzd4qufXBEXneL6l/YZIUZjUlEW/hcJw7OXZ2561J0g9tDSOJYGP4DSvuvRcUMlWR3WzzYyMnTek3f6Tg4QeKZ8dL6HgOL6XyUDqAm2HOwAEiTeDjQQrLP3jqCp6DSo7Jvg8hzFnLoVxjcjPb9WoNhj9UQSpmcxZNq8ClDcGFrQfdfdXdnDmzUSIBdG5V0aOfwvyaDa5Zppc51C6dfVIZaLSLSo8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 06:33:37.4739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe5e0ea-24cf-4061-0827-08de93a66f63
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8612
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_233342_820241_46D2110A 
X-CRM114-Status: GOOD (  12.45  )
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

Hi Arnd,

On 03/04/26 03:30, Arnd Bergmann wrote:
> On Wed, Apr 1, 2026, at 19:14, Vignesh Raghavendra wrote:
> 
> Hi Vignesh,
> 
> I've merged this now, but I see that there are a number of
> patches that look like they should have been part of an
> earlier pull request for 7.0 and possibly backports:
> 
>> Generic Fixes/Cleanups:
>> - ti,min-output-impedance addition to all K3 board DT files
>>
>> AM69 Aquila:
>> - Fix DP regulator enable GPIO
>>
>> AM62A7-SK:
>> - Fix pin name in comment from M19 to N22
>>
>> AM62L3 EVM:
>> - Disable MMC1 internal pulls on data pins
>>
>> AM62P:
>> - SK: Disable MMC1 internal pulls on data pins and enable Main UART
> 
> Can you have a look to see if my intuition is right on these
> ones, and make sure they get merged more quickly in the future?
> 

Ah yes. These are non urgent fixes in terms of impact on functionality
(except AM69 Aquila one perhaps), so decided to club them into the v7.1.
But, will keep in mind to send them earlier next time. Thanks!



-- 
Regards
Vignesh
https://ti.com/opensource


