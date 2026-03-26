Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB93510A62DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEszCpcd9A6bTxgGYdTBjiKN7sVkLFBm190n/h/2ExE=; b=orChnGp64eVU3TBxe7H74GKDBh
	kMsplmiUmB4mAJM4O7c2skujcGAeKB2nKTnU83CHAC0GAXb6S0oqGwTKSJxh4P/+9hlK8Y9mmAO5q
	3KfidCCJigZHqYBfnp6My1f9uzuR6m4Ud+dkdtH/0sbzqArYI2Sa18P39fYK4l7mElufxR+385bDR
	HZMissDSzlBUQBGkQiA/TDwEO13OlZyIL9VNq33qV+Bk7uSvDUsVsvjTHHbwWxLvjmgxSroXV/Jjr
	Vt7PcUY/kakKcL/L2kdIACwpwa64FW3AtvhtgN448J8bcrFH5s+jP+0MhCIyuBpz/kWvbUMP9HdjU
	d2DyxFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lZY-00000005dGu-1OAh;
	Thu, 26 Mar 2026 14:20:32 +0000
Received: from mail-norwayeastazon11013050.outbound.protection.outlook.com ([40.107.159.50] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lZW-00000005dGY-0S9U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:20:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMmR19LjYY4CxsuW5qXMlO3eINPDjOFv9O94svjh0I87EAkhhHAMkSXzlVZQWhrYi9n5CMHKKTksUOpbF6gUtshL+SUQ5bfroxjg9KoXQYcI4jYgmo8R8zlHF0IpwKQStIzL5L2rtbbyO99UoBpavPxMJk8kTiC3yIVn6kYr0wbN0+1/ruA062CUUEM6eCGzDj3PP9WOXgXxGOJiNk4JmhWesuXcb6alOf5UWnVsSxRPzq9Ms+NEkOV1s1KJzTl2QMYmfqL4QR9hAKxXy8GGTMkXukejrDWLlwFIHRI61pT2UUs7ZgkcNV1tfvWRLbz9Rg7z03Jvjz4k3GNhySBXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEszCpcd9A6bTxgGYdTBjiKN7sVkLFBm190n/h/2ExE=;
 b=bwTkIddaClqeM88qPEqweX09dOR8QaZnc7lfSV+PBmxRLi2H9y+Ug3+7m7TIPoatjL81h7kzS0yRje/Ydh/3GIeHQf4E7mnAQzbd9fgHlKtTaRFIiDcYOQy/+VkIuB6Y68q+TgfJ0BehZnPKCq0OidN3yvzYcAVlKALOBikaI5VtPnzDIc/ZATI4OKunaec9iJv6I9l2IBnqs6UxuxFpevPQA/5/D8HuZYS2Csv6HbtMijGy6/dxMLRzXJMpQvkFR3JSjOEd9xS0mHsMM6mYG2/epZfFHT8eba2W0vlyL+2zrI8MkUjuKhV2ZHkMkHcmMwwe9vLHF8twL0gpm2+q3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEszCpcd9A6bTxgGYdTBjiKN7sVkLFBm190n/h/2ExE=;
 b=l4qsnjNL+wfcwsi17AbFC8RZkTpSaEizUmkW8PTZx4wj+kb/i4f5yX1jV6/1Ni1ElVbbpWdvpAXv7mb74ySUESDIJE5POnXgQyyB92hjrNpTJ7Tsto489Hd1GUTqsjSiP5KeZfrDKPYQol4zEUJRkMb09/0Szo3jiGssHzhfXQZao2j8zxICW323zLsuF0jOMkg08uZZtsvC1iW4QuM5CHLkovEK8pq24bKOPpkaqXmbtKNNOguAVdv8PRVrfwZd9H0XpNbq6mdNfKg9wHjhCtdCxRyCl7emY74T19igrS3zjztMUQQr1xoq95fL3rnrNnDEupd6rE8by9sdQOUydg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8246.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 14:20:25 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 14:20:25 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Carlos Song <carlos.song@nxp.com>,
	Josua Mayer <josua@solid-run.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Rabeeh Khoury <rabeeh@solid-run.com>,
	Frank Li <frank.li@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 00/10] arm64: dts: lx2160a: fix pinmux issues, update SolidRun boards
Date: Thu, 26 Mar 2026 10:20:02 -0400
Message-ID: <177453464712.4156777.10663954783700076130.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
References: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: ef177980-74cf-48f8-9ded-08de8b42d27e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|1800799024|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: /R1eco/6aiyjX27O3ATAGktdG5+1mO3/XVYAm5xi2iQPIJNy+SQctfXg6updQU0Fn3FmQRzBog1MPmQyailCB4VpMfsykIuyQJseNz6idF/7Ge9kC0d2SrJTqiRa2WELE08iahyHBNebOsL9q//mh5dmMYrOD36xwht4vsVYrISt5jL800infPAaI0f9GM0DuvFZqDl80I/T8FPrxPM9jYdAOmQHz1WXOAv0KOioDLAu7JwSWZBItUV+j+ly9ASWF5y4fMqo2lxCdOhC2nX2lOpQqZJnFQEcoqaDBPaDxtiEqU6QzAfCEOf4UMt6iz4+puzOH+dwrh0dx3FAHR+z7K6xxnGrSQuT7zhI57hJIC7OlPaKMJLSOW+w2EhS2W6y8Gj1hts03ZSrO6eR9oD9JgEurkBPDrfLNUUy/4sL/ANEU0pTl0gKU42TJIjhhwXV1YEyrrAKmY+0qz2sLc8f0ffgn69L8k/BErsZDKhKvm3SVqC1qUic6tEiSiSpNeaOGJzIytzJTYyz5wP39KnhvkmDpm1EVYIXf3/1dCnBtjSYiCVjIi+dFcWkmBrTnGKAd+tYeATzY5meN1XCn26DLm7yneCNXKMSeNJ9r5W34tfralcD69utbQsqGXpoWdpzKnnhMgfwKKrMycAeiZLaeoJ/ftXk5bGSBlEYXppNpmrj4xzAXudfMUOrS9mLgmhWbf9/OIUSTf/xTOB0rrhTqgSFQ7OTVDlOs9UgNJKMFIJWp4WrabNUdC11ryHi1H3/nNAmrTDYj2u7s6T7iecNJPLxyhrbXHeuwdZhdr2mKCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(1800799024)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDZkb1B2aEhDK2Z6L0Z4QUpzQlpZVFNJQ1V3WWhnZmp5V2tuKzA5SkVkY0E5?=
 =?utf-8?B?MWNVNUljNDFRcWNhMTdEOTBMTityK1BQRUw0djUwSnUvMVVVQkdoZnZmcmhr?=
 =?utf-8?B?ODJCQ2Z6dzY1M3RHVFVrVUc2dkgwd0R2SVZjb3NzZitTV0wzUnRFV3NKeEhq?=
 =?utf-8?B?SmpTU1BUcXBGOUF0R3ZTYXloMnkwZ3VUZWlXbmlFYy80emJlaGVHTjZnQ0ZC?=
 =?utf-8?B?YmUrMHEyS1Q4bVg1T0VGV0hyaTAxWTVNK1ZxZkphMURXa0FGbE10bGZWK1hL?=
 =?utf-8?B?ZTlYMU9SS1lRN2JHeHRMOG1zaVFhdjh5ZEEwekpCanBkQlJRMDJSRFU4T2Q3?=
 =?utf-8?B?b0NYdzV0S3lvRkM0RW1FazRzNHh6anViYy9pSGZNZkJBKzZRbC9ZbTRsYmw4?=
 =?utf-8?B?ODE4RWhyUDN4Qk9icEo4Uy9EUWxSRmVkYisrRWVZa0pXY0Zyc3BDb1JQRVlQ?=
 =?utf-8?B?cE9tZXY3Z1RGVi83VjNCWlEvR1ZwUDYwMjFjSzNGQnFzTHBUb1FtSEt6eCtD?=
 =?utf-8?B?SDZFY2JDcUpGRUdURUZ6ZnA0YkV6cS8rMDZFbTlGcTdObzNCb0VaSy92d0pN?=
 =?utf-8?B?ZXA4RzNWMytlOHQyT0dGZVhhRHA1eURVd1RXaTVhTHZmc3E1czdOejVSckc0?=
 =?utf-8?B?TjJqNm9sOXhjUEhZdzU2eHZkMVNaSFdsaDRiazY5bXJyd1F4RFVHUXFELy9r?=
 =?utf-8?B?dmZ3eUV4UFBFRjdXb1JkbHdPMlJNMGJGaUZLMmowQkpjT3J3NklwaGNJZld2?=
 =?utf-8?B?dXA3U1QzYWovWm03eE9URFFVUWoxcDV5U1d3Q3VpMGFZY2xPNks5TVdsZ1A2?=
 =?utf-8?B?QXJBbER2WVl0enFjTlZRd2tCY0E5TEtoOGtFckw4aFdJU282dEs1NExSbm9N?=
 =?utf-8?B?bFQ2RUJVNW54UlNJVnFLT0lKNTduNEFsV0t5a1IxSUNGTFJJRkkwUjRkY0tx?=
 =?utf-8?B?NzJab3ZlS0NXVmFZVGc0Zk5jV3ZRT2t6TWJmUSt4TktsN1FBT1pycUx0dTdQ?=
 =?utf-8?B?ZThUNEQ1STNKN2dnb0s1cFR5ZlVBa1RhSUVnR0hITVZraEdBMWhBVGtRdVpE?=
 =?utf-8?B?OUVNQitmc1lkN3JqaDc1ZitKQnlXRUttY1lzaUNVREZoWUZWQkJ6QTJMOGd5?=
 =?utf-8?B?OFcrTzRLYVlRMmVkaE5Ja3Z1RFRVUHk4M1JJMHRSRGk4QzdZcUlPMmZzZWhL?=
 =?utf-8?B?RFN0c2twL0JleTJvRFZ1OUpUTHRmOFMxRVczT1VmSE5GL3J3NXpWb2gzalZ0?=
 =?utf-8?B?Q1QyZTVNZ1RDRHMvd1BsLzY3UytVMDRWcXpMMEJnRmtjbWdlSjZPNU1tS25h?=
 =?utf-8?B?ZTI2eEU1bWNrOHRRYklENWE2NExKRWdOd3M2UmdZNEo2ZGxNa1FaWDBXTVAw?=
 =?utf-8?B?amI1bTl1ZVQ2cCtMM3dTMGFJUjVXbU9EUkEwb0psR29zNE1hdTNzNFJocWtV?=
 =?utf-8?B?eTBoUzlVVnNSd052L1k5SFpTdHNBTkptUENYU25TKzI1czAvL2RoWEFzdXFw?=
 =?utf-8?B?R2RETS9od1BwWFZKTGlKcjU2TEg1eEhneGlBZ1kydmIxT2krOFZtU3IwZzFa?=
 =?utf-8?B?RS9MWEJZVEsyQnNiK3hRclNWMkZsWmo4U2N1WG8zOGVBN1FzUXYrYU0yeWJw?=
 =?utf-8?B?UDNBZk9rUDkvbWFWVzYwWkp4NUZRY3RkaGNoSlNSWmhxOTlXZ3ZOQWE1Y3Na?=
 =?utf-8?B?bjFkWjBNMWhPY2FQK2N5Yy9GWENEbStqN1lmTGFaZjduazg4OXg3c3VSRllG?=
 =?utf-8?B?eGVvK3RKY0FGYWVPQ1NJbGpJcWpmVG1iL1R2WGMwWHdvelJGRnlhczBsemFX?=
 =?utf-8?B?U2VXSGVYSHBpUWFQU1JEbEZQQzBZR1o0NndzZkp4cjUySWY2MWpkRWpDTG0x?=
 =?utf-8?B?MDJ6ZXAyLzhrWEJZbkFOa21CUDhKdHliaDBMUC95SXlDRW5YcnNZTzRqcmox?=
 =?utf-8?B?SHFXc2p4NlYvc2YxWEZkSDVCeHg1NWlLa1RTbEFUS244SnV1S2cxaGJzK1ZG?=
 =?utf-8?B?Q1lCOENxN002clhwSnJQc0VWVWs3dkhHM1BoMHYrVlEvdWlkMytBYlFmYXB4?=
 =?utf-8?B?dUZMU2lYbzQvVHpXTWZXSUZPNkowUHBnQVZac2kyZWpScU1oaXhYUXpRdXJK?=
 =?utf-8?B?Yi9ETndRdUlDazl3L1p1K1ZScWpJRHg4dDZPcGxBQmx2VEdJeTdSUFZ3b3cr?=
 =?utf-8?B?emM3WXBRaXFIZGI3d1F5TVdSUG1OUE1pZ0NFa2RBdDdYZ1RmdVJyM0owclpi?=
 =?utf-8?B?c09kYktGQkN5R3pYNnBrYzJ5MmhzeUhsajh2ZmdPUitWbG96eWZkZnFBQTk3?=
 =?utf-8?Q?6VtMFNzSATOhdLhAIr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef177980-74cf-48f8-9ded-08de8b42d27e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 14:20:25.1118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 353f06HbDA/exZuJnkymxQ44UvGMhHqa2/J+68ThW/jO2u5iHsDKdopv5H8CVrHCjf3TfWcxvloDI5nC8zdWQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8246
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_072030_153640_4A15FE68 
X-CRM114-Status: UNSURE (   9.17  )
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


On Tue, 24 Mar 2026 13:40:54 +0100, Josua Mayer wrote:
> Fix a bug with microsd card-detect & gpios pinmux on SolidRun
> LX2160A Clearfog-CX & Honeycomb, and LX2162A Clearfog.
>
> Then make small additions to SolidRun board descriptions.
>
>

Applied, thanks!

[01/10] arm64: dts: lx2160a-cex7/lx2162a-sr-som: fix usd-cd & gpio pinmux
        commit: 6bdd023311d9cc754126418875b5265dc5705230
[02/10] arm64: dts: lx2160a: change i2c0 (iic1) pinmux mask to one bit
        commit: 0973d9d880d26c85a9466f7b51163309c0d3177b

Remove words "This change" and rephrash last sentence to

    Align with documentation by avoiding writes to reserved bits. No functional
    change, as writing the extra two reserved bits is not known to cause
    issues.

[03/10] arm64: dts: lx2160a: remove duplicate pinmux nodes
        commit: 385c7dca29e416800f57fbaf96788257d455046e
[04/10] arm64: dts: lx2160a: rename pinmux nodes for readability
        commit: bb9407c855bbf62c404a3bc5119033198c5ae8a4
[05/10] arm64: dts: lx2160a: add sda gpio references for i2c bus recovery
        commit: fbf66a01af34364cb6b49fcf1d77deaf09afb9ab
[06/10] arm64: dts: lx2160a: change zeros to hexadecimal in pinmux nodes
        commit: ac26aca831c037a57286a63a6d924c5b956b7b42
[07/10] arm64: dts: lx2160a: complete pinmux for rcwsr12 configuration word
        commit: 92479a6b97a54a829a28ec57221f5b74e7ee53b2
[08/10] arm64: dts: lx2160a-cex7: add rtc alias
        commit: 7593c15e9512022f8bb57bb24995955d8dcd137e
[09/10] arm64: dts: lx2162a-sr-som: add crypto & rtc aliases, model
        commit: 112d3b46d3e00db17f0a309e479fe4678906b6f9
[10/10] arm64: dts: lx2162a-clearfog: set sfp connector leds function and source
        commit: 7a387b0b0bc2f2c703d8d64250a056f43eb2c800

Best regards,
--
Frank Li <Frank.Li@nxp.com>

