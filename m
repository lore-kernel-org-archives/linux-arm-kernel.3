Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267DEC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yz9VcErMjGO3vNwh9dqM7n48B2M1Epsp5tOmMhI3P0s=; b=Pr4O5JaRbATK9A3lO6/qpqyE+r
	uI2BP3l3fuN5zCfwnKzwu3VDmSlsUs3oREl4X9PVm9cj3qAzkSxbG62uYXEZRchzVhiRqyQ0bwhRN
	UXJ6BlJbch+QKvGdalKsj2bvzod0mM+JmDKNQdIo5R6O8dJks/TJ5y/AWnnHN2/1QQvIKR+bWp352
	CzqS7R+/6POwcUp2a5kAzTmFTKzC3pyoUsIJF+f6dwIoSoH4WYQfa+59OKMSnnCHqLpGFRmL2lUcL
	5IFtTLUBOR3qvtK8Na9H8/Kq9eExxn4Lknb3ctbAaKpevQzSloVIFDBVsZ4X9rhUNW5Hhz0Xzp8Ow
	qMpiA69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoAn-00000002w8s-0eoI;
	Mon, 07 Jul 2025 15:54:29 +0000
Received: from mail-dm6nam10on2061d.outbound.protection.outlook.com ([2a01:111:f403:2413::61d] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYo0x-00000002uSl-2B0n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:44:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/DofugqC1G9gJmqjcSbBaNQ01Bz4FAd8eDMLKVcNlld1SXVo/TC7CzLKLC0ezq6Y4pRtud9j5HpdxxlvhtawsNNROvpDjdi17YQbNK5puNtuHC512clED8ZaLW60BL/wBLS7Uij3wwrXKd+zVl9mjQkCoypBwsPHw6jmd4L7dJBpkz075jZFG/Wh10l+48gsY+zYuXixbG9MhtX3P0qswBaWnbzfWKfK44svN4BB8lz4eIjz81Uv4UbuuMMhf1kqq/mR81FvElxIaR6ptJu+sHZg20v9g2Eo78cdDNOiqjoA4ysBW+xpCmPg+MZk5XN+RLcNyUn63eQmru1YRHhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yz9VcErMjGO3vNwh9dqM7n48B2M1Epsp5tOmMhI3P0s=;
 b=CdPYPwHsJkQEi5soT3cuOfrCKfrCGodYyzoigyceVZnU6TqZJecRFnbc3+mERHF/UtBoDepwWILEtWU62OAgUye6WVFwnYxkhicObkY+Nx2KPAQwexSsl6NeUxGWxqT9GQVCwgDAuRoebjJMfkaPfTnasX1uQhYWqkoCa8AJUOYnOiepw8SdghDa+vpIPiHgnSjF+QxyZlU/0C1IMtxPQhLlgxzwl1/5xbfvyHp6aZl9Ovbz3s7BJG3Q4JDCzYgKuLZ8QtLfD5cJ12EzN0uDuC38Sn9fky1OK4lSMN4AJoNrcirQtUETflhdDTCXaF51ddBFioTYQ4wmnbmwQqJ+Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yz9VcErMjGO3vNwh9dqM7n48B2M1Epsp5tOmMhI3P0s=;
 b=QrCb8pAPgI8WA8mNnl70DJKpheS9FXLs6PnB/JrsBoIqOVUboA0WzglkB0xUly/YApAChXtxDH+ND2sgX2ciOGyM3T6KspYJ+ZAh4T5VaeAtltsT+cZn5Go/ThcMeARwbsTH2p8egoZMKtfdE0cRrQ92I50LXbj0ojgRKjSgFM60DFP5MtutzbJ74sXOY46dDC6XDWdwbEQ6PkcXXdApH7hhpv71BcNhWVaNln+aQYwzuq/+Vr7OejrhbaueAREYyzLDh097d5JfDEEjYpqyiPgzgapyT76eBCD/EoryPgsaM9b0vj1KDmbHGHCIJRw0ZQh3Ch9Ur1GWITj6oLWP2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by SJ0PR03MB6600.namprd03.prod.outlook.com (2603:10b6:a03:389::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 15:44:13 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 15:44:13 +0000
From: Matthew Gerlach <matthew.gerlach@altera.com>
To: dinguyen@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	maxime.chevallier@bootlin.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: Matthew Gerlach <matthew.gerlach@altera.com>
Subject: [PATCH] dt-bindings: net: altr,socfpga-stmmac.yaml: add minItems to iommus
Date: Mon,  7 Jul 2025 08:44:09 -0700
Message-ID: <20250707154409.15527-1-matthew.gerlach@altera.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::20) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|SJ0PR03MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: feff6ac2-341b-444f-f979-08ddbd6d1f23
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/qNjxhF+hSx/IsLb07ynYInQgm/xk6IW48P0kkNoGhvxSbCxkw7V7ztajZ25?=
 =?us-ascii?Q?rFVDWzxynfl8mZF8Vq5g6Y3X1JaUG91whXg0aPgjFv6LO+ILfWRsuMeJKMm2?=
 =?us-ascii?Q?vtJVGWYYy9WYlqmd2K23q4/dDP4tsHpVQ+9LbgTVDiXdZDQAkcHdWvLyGoT1?=
 =?us-ascii?Q?r1+HIgybn5hPYnE78xagErFKDGjjPebb5Nvwb293I/YMpCq3NIJThsaEhpCe?=
 =?us-ascii?Q?iRcUAFjPQcY4CLkhqIDpCy6cy8HaJAYN3CkTfSNxgFXV8djJREG/dNS4nJEz?=
 =?us-ascii?Q?07M4h2Oi1pYOQHSMBRLxlhz/dDWfPuNQSc91npGVXEjLKF7bPM0mWOc1oM2K?=
 =?us-ascii?Q?RzuqNWIb0LUa8IVKYcKcZ5U//jMSvPB8L7OLEh/lMpjvmBxbXublsVs/A2c9?=
 =?us-ascii?Q?siAyj6DSzxRGC4b4nhGD5WzGTMHwuebPx6fbEHGXnkXk9ojVKb2bUtOnPe+R?=
 =?us-ascii?Q?fMJrvmOJe7ZWxbKtrHnBPYbCi6NKBQaEtiWdVHeitTmMN6NGY6yDdU53YjoP?=
 =?us-ascii?Q?/IzuM2ycCh1vm1DsXSP8CbSiiUKBRHeh+MWkaWun82IZBdvS2JW7k9c23XCF?=
 =?us-ascii?Q?LbONrGcTU5/49MBsElCkrati0iD2iT0JmVIwE2m+c0twdcIp4/HU+mybHvTR?=
 =?us-ascii?Q?71ndQAtDXfGAQmHwIBmpg/jlhvrmR5KFIot47rVnoIJ/O8Qxbf2ervcRQnmb?=
 =?us-ascii?Q?kG2lW54C5siyOPt2YMphU4NBifMNdmEhRGq1sWXrePRDcMB8E3Q44Nvj4M4Z?=
 =?us-ascii?Q?9YH1NzxbAywgYNm1GOsfdbojaRaPjuipvySsxPF16KYrikZ7q79Ld4/RfG25?=
 =?us-ascii?Q?l7OCgWBjkAbGXwbYz/Bd0AkbVXQQMsnTi7hTHPK3cWQZFf1mDX4AZfHw5Rc9?=
 =?us-ascii?Q?qkUlqmVu8lGb1vjJGbBD2VCaTa9kdNeRVQSRsc8UPROgC/5XELKcipX+vZBE?=
 =?us-ascii?Q?dlMlcSFlCZE/eLfaDYDhh4/znq4hL46jho8dy1mOYZ52C95o8tkMalARqv3a?=
 =?us-ascii?Q?s1DKygpndokLT7G0EhSpVUbfHHlr1SCG2qcueqLmhQ2hEIFx+4pDJT/YN/zc?=
 =?us-ascii?Q?wRzIjXDjO3F6MHyOhRnkSlJbd++G0A1dlNii1I2z5g16I9RX4CdIXYzpTniI?=
 =?us-ascii?Q?vqQy2K98CL4LwBMsqE0NFl5l8B/3P6GldgCLTlPU4R4RV6sEw94zPeEnYbZD?=
 =?us-ascii?Q?epOERiSpx2gBpvmVKEOd58sHPztrHK3pnYsmOAlN0C/FqU/xiPvIlCti9z5Q?=
 =?us-ascii?Q?kHduBHZvyb01kHtaSLVXIRGgb5iIBdT/kZaCb24sxAu8WBNkXUfjLui5hKX3?=
 =?us-ascii?Q?0iHQJVh/z2e6zUh6fqL8GzLjAbWQA/5KyDQTE4/OEj/Jsj8SLZBW7Do/TM3D?=
 =?us-ascii?Q?oSR4unhwDVCDTfkbIufFwoXe9k+1uy47gBgIgWpotvBPOEy9ahr9PaPeBEEh?=
 =?us-ascii?Q?r0Fi3KFQPkMjWvYRJndDTyqgwdPGHtoLcXrPQPk4C0IrJecL40MccQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3461.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IGOzMyBbiP4xZAcC2XHZ+IUorLbY+BhMnPvhrPPEukiQxgjtu5TQ9QPDEN8X?=
 =?us-ascii?Q?TgzvZjGN+PXUIJ3n5dUXPgyN5mc8dUSGERkGmcSznEMsOgBcE+19LPNam2ig?=
 =?us-ascii?Q?vpaCBqtkc3k0FtO/rDlnZC/003a20lpy4SSfRFAYL+JRnwyeAAemmJyC91K/?=
 =?us-ascii?Q?SysTc34c/yMfn3y2qQxBr3q2sDSpLEO7wePqZ2VVmU0Ll3Aim0o51oyAxreQ?=
 =?us-ascii?Q?FoiHuZ3aOaRs+CICDgJYkXfEdZxr7bsQsUPknGSlUWLhUftH0Rj/c3EqOp4N?=
 =?us-ascii?Q?M3DxfkkhOAh6g9zkxe5cnH5NWZDnEeKZrClKgYk9W6yEzTcb5BYScGX0wDw/?=
 =?us-ascii?Q?K2Gjt50gquzZR+kitd5uWPfyMb9Ph039+wYq+VWhktfLblPev+legzs0j3Hx?=
 =?us-ascii?Q?Mk+aevr2FGKUzKsf4afCwVbslLdB/ywr44gjmhyDGupxs4AQoF9Px9zc7OwK?=
 =?us-ascii?Q?njtLlrnGd5+vQZxssh2yi9nI2sZqeEcpYXHHahxjf0Xx3e8n/t/sQMfw8vjS?=
 =?us-ascii?Q?VGIpQPwo41GSvJAiImTMqOu3m6Y+axhX3b8RxDoc3xx3DswESevZEw4PF0o6?=
 =?us-ascii?Q?Qew/G1+sD+Dc9euJU5DA6WCh8Vgqw5/aVC/rUUZ+Bxth98icPU3Pec1CdEMf?=
 =?us-ascii?Q?IT408K15FBQCDMBuOzkUwNaqJqXQa/1I5Vzs1+7/a/hwY6YDcExxwCkirrCT?=
 =?us-ascii?Q?ErXQOA7Rgr6Uhw9wdqMCzpOnVzFRciLOOOqfzlkoQ3Aa3a/6bkakD+Kt4zbH?=
 =?us-ascii?Q?adWbCf6KmtaIW94uSlPS04HdK2EVoC7DTDCfbasOT+v95la2LZv284D/lynX?=
 =?us-ascii?Q?t3B3scAXn4oUKcQDAtt78UzQqiBBz4xhB8tpzq9xWGpl9BjPXpV3ucOgcvMR?=
 =?us-ascii?Q?x0xGCKIDmmTZpdNpjaH87Lwi62Li8VA9qJfy/4g7h9bHeJ2bs9UyEK7KkMl2?=
 =?us-ascii?Q?VUX7TaOSnXJxoyfg17jNlA2oxqI7qcmSeLOUg9X6X+UoBwlJKo6GZExNMMrB?=
 =?us-ascii?Q?CbqWHK9KHSB9whB32y7fa5rUYAfalCoBdxBJb9piJLycUl5AczP2/4bygoww?=
 =?us-ascii?Q?ZF+1Z01dy+Kbzc6U/10JwBNkL0Tg1dBVxdmpm66M2/Bysrk2X7Pm9GA/HKQK?=
 =?us-ascii?Q?Aj9Tw9949cOQZLqTuTLU31kN2zcdjc+6s9GXlY8PZwfomj2b8GzBTuPH2Rb9?=
 =?us-ascii?Q?vKO8Txy5NZf+O1HRAbhlzbpqQecXfsuQZ2bU4DcNIOqSOSypI8eJjqSd0BAK?=
 =?us-ascii?Q?WrZC6Qkf9zkrh2eSXOFUtK/blkgMVjRfEox0T2IYCnf+VvuDAXruM0f3xwbR?=
 =?us-ascii?Q?2TBClKQUCgPAqq3Tb7zrwMFray7HJUN5pTniU4awq1p8axEG3IYqTEEUzh0x?=
 =?us-ascii?Q?oR9tc5/6zC0nJOUqtFXB3nSkiWgNhj7mE1tpvzgGyvEnUfR3QqEtY1TKJSv4?=
 =?us-ascii?Q?a13lJNvY5Ui0iqvP23U/yVHk1FteE+RHi8D5eBoVLGx4oiftLxZV10i0DyZR?=
 =?us-ascii?Q?2bPuo+rsFwPwtxr9sUatUuZQEEeK6nSj3vU66e6vYTSe7trkTqRmqUdMTgr6?=
 =?us-ascii?Q?neLaI61nQ2CAhznIxcHGUpmGfLEmRoQkvpFlYCs4jvG7jD6PBM9p32gW/Dnl?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feff6ac2-341b-444f-f979-08ddbd6d1f23
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 15:44:13.0353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiwbEHNjND5meTQvCog8MjCIESgr/zeJ4uInpBBQdxxVvAMDM/gXrD4H4UTUtk3m/F81Ps/297LKpvK1xBJ2yKig+TnfqpxyUU/TO+jew8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_084419_571551_EBECE2DD 
X-CRM114-Status: UNSURE (   7.75  )
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

Add missing 'minItems: 1' to iommus property of the Altera SOCFPGA SoC
implementation of the Synopsys DWMAC.

Fixes: 6d359cf464f4 ("dt-bindings: net: Convert socfpga-dwmac bindings to yaml")
Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index c5d8dfe5b801..ec34daff2aa0 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -59,6 +59,7 @@ properties:
       - const: ptp_ref
 
   iommus:
+    minItems: 1
     maxItems: 2
 
   phy-mode:
-- 
2.49.0


