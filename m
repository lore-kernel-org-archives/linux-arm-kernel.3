Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D9CF531FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 07:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlzMDNQ1cM8ah+38Tw9DOLxzKgOZGgHJ/+gYu0boa3s=; b=DCP9XXcjHts8wHLGIeZf6Q1GWD
	xSH/qZnvqJh8zQ6V61zlJA7Qh9hsF97J+nVgTw4MJdpLUJeaJela6O63FvxscXQ5bAh4R7tYoz8uI
	rk33cpJG3h/lMe7nXJGM2msF/Yz8F05KzGtVKcOkTwQ9UPXnKwkhvbtgpZK6GjNFinEXuVlhI91gt
	mVDJ00joCvNVdTw8PR5o2BdDFXqi1SDoHW8RDXeZFbdU2V+hOErTAR76dmcwDemhrcTCYGq5vexq5
	VePMit7542p4xZE0vBC774qhd0caIr/+UT5T1hsOdxsqCc1wvMjAM9zEjWsMZTjlnTVK8bQQXjEC3
	QDRvotpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYRX-0000000Guvq-11Cu;
	Tue, 14 Apr 2026 07:44:19 +0000
Received: from mail-westcentralusazon11010027.outbound.protection.outlook.com ([40.93.198.27] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYRU-0000000GuvT-3exA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 07:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Daq48RG1mDNMVwB+0HUpcykBvLOhHPUwgnPVXS70tVDFkVdGSLzkus+UH9KRvRse6fRAexGfondOxtPH26Xcg0uyDUACOkaquvidKQrAViq6MYYx4LbYZlTZ9U8g/jnpSIIaLd/K/IjVtXaQu2Y+BARnLWs+24udeSouOavKhI5R/m6T1nkoj3IltCuT67V0Y8QDm4Tf3zgeUA6I6tvMp1zhc1la5bb/h8qYhInd+1kuvreBJNcNBB1nkep7oawCJ86DN/kE+t9XyS0qXZEXm2f5v5SUi/vEWmY2ihIDNLhNossY6er9xsl/2XulezthKcPBEETVzyTfy/9OltLkJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlzMDNQ1cM8ah+38Tw9DOLxzKgOZGgHJ/+gYu0boa3s=;
 b=TuQSNULQTHeUxEKPUloD177ysyTv5eZmb3XsGE+Zwq/ndfRUJPJL16bjHIFJOAdo8WbYmRsChaAFDKr25pjQVdQaADl8T9xjj2BVDj6Wq5chquVdQBtLJPVt/ZBymzqJK0tdUzdwS58TLgE+5n0hJLgBIQ7DeUYF2I/IHn9qi8dWmeyKnb7NOyt78aaGzVQfvvbzgvPq+M3oKwb8JUuus15SFpvtib/LaSrEOzINZQ16RJSdyzpQ2KzrqK5/q3EmCKsSAuHHXOLEwVdCvLe2HG9gezHTDvTipoOCBYOVgo2yFTojkBmSzXqo3FfEYneqXIPLFhnoAuYCbjmNNB2iOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlzMDNQ1cM8ah+38Tw9DOLxzKgOZGgHJ/+gYu0boa3s=;
 b=sf08aNdhr/yipIZfbiW5ttb+k2L9yYo/uOBH5b7y/Kk6P9wllPo1E1fCsfp7Bf2VBBWH9VRA782FpC5jVM3fEfGrf4qR+yYV/cymjcCgF+EtwqaZrCF013vs7JCMKZJ2TmsMTWAgmWYY0PdW8MXEA/NiPmPasf5CdT+Xlk81+qbF/DjgvU3EK3gqP3ULTQDyvqadxJsb+v89IrNjVq9zslZTZQCy4PwldP4CS8BcA/RjkAAkR2SRWOSXheUOxeh2RCXidsF1dn3eA5IyFAt/Laxoi/XC/4WWzNH/6ZJ3CY0HxfzyqjVt0SuCE5qCQJHemZHxLFPI4/uV+e4/ReG/wA==
Received: from BYAPR21CA0025.namprd21.prod.outlook.com (2603:10b6:a03:114::35)
 by DS4PPF242240EEC.namprd22.prod.outlook.com (2603:10b6:f:fc00::b0e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 14 Apr
 2026 07:44:09 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:114:cafe::89) by BYAPR21CA0025.outlook.office365.com
 (2603:10b6:a03:114::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.2 via Frontend Transport; Tue,
 14 Apr 2026 07:44:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 07:44:08 +0000
Received: from zoo11.fihel.lab.ge-healthcare.net (zoo11.fihel.lab.ge-healthcare.net [10.168.174.93])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id CEDFD131E4;
	Tue, 14 Apr 2026 10:44:05 +0300 (EEST)
Date: Tue, 14 Apr 2026 10:44:05 +0300
From: Brian Ruley <brian.ruley@gehealthcare.com>
To: Will Deacon <will@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <ad3wRQt7K-QLX8Jw@zoo11.fihel.lab.ge-healthcare.net>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
 <adfDEMK8EbIjPu3J@zoo11.fihel.lab.ge-healthcare.net>
 <adfNN33QIOP3VfDm@shell.armlinux.org.uk>
 <adjYlUk8_JjPivNi@zoo11.fihel.lab.ge-healthcare.net>
 <adzMOdySgMIePcue@willie-the-truck>
 <ad0Ky09tLcFx7JCa@zoo11.fihel.lab.ge-healthcare.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad0Ky09tLcFx7JCa@zoo11.fihel.lab.ge-healthcare.net>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|DS4PPF242240EEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 489e76cf-8209-44db-e313-08de99f99ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: U7kCcKgg7A8U69UNFc5x9HZ9HDPtFYRipkDTPfx1O5jE00e/jAI7LfOrkXlJvgFSUlu1QVzaSkusZzjecuWDKZPD47xUIQsMN1euzvnfBC8mB63zMMV888N0YMrA5MKKOhsVpQRDGHQEyLdVPJrxWb1d/iKo23JXuuCC8mW/5WT/9uSb6JZx3Wkrh+OWRFk5w2jx8nP7zD2Q3fR2eNL8WtduIpKVTTsN9Nl6V+uIwYi/JhGWP7Cm1qiXGgklUaXH1cLOU/4h2Ppa64p60BTfqFiEEJw1gYgzAOBa0no70cNqQlx2MeRGyDWMvt57yCG4eqNtMtnoDqh2YQJ3OvgF9EsNz+nuiWw9mWUihdftuvqGfCHVIVUjYiQexWq8cnd9mLLDfQrBHLWjqok5l9G/m6jLn/XuFe/IrrMekdmLNH7pt36MGhNIi61r9z1PSbHATqWYKduN8YGJrmqOS0grdhGeUme0LDyXjwjIUpqqXoLtYL7cr1GtsZa2djhNKFLp8eOz0HsCNfCWMVdth4WNGnSZpN+Uz8oz2zdfgygqPiPsaEi571WODEeREbdOtWy+B3Q7hd6zGlSXI5pw+AAUTApe3Xym7vUHeeAWPMb5nOuTKvYYx2NpLj2CNo/P+kv9OswDBC/zpOYmvlbfF4BJcKmeEeikIaZ2HABFXKEOlsSNTkDsRk62EiFgO/NtJEScwIAjUk8cBFvWsruu9oWJIFg4OpLUEFJAl7woOkhm46akkXOijjBfjo48q2UVAyFzw7qgOs8st8Ej1yxtFJDGQw==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XwjXK+ie0rPNS0KwE0FTmng5jrfPqTBekxWqqm9I8WR4uWQLMUX69dIxMii9tFlzJ6hAw3a2WY+bpk36OxU7cs85/GAIc0DBtGbykN4kig1wS9jZCTkMbk2d0lNP3i42u27iEnO9FeKPlq2bb7YrOBNpSXeJHituq77WYGYVeY2si4FWHxKhsXuK2Z+WGCrJCxA7AGYMhYLmgIP0MxxxxRB6MLo5E09mkybPeaDgsP9pZNAoSi/aZYvPJfcBK8GCiNqJwIJcQM5zDNthV2t2dR6wWEoKq4TqQhxu+Yy7WkkaxRI5NhU9u9hdo6x4jRIKgLSiZ0GoPKcVesw1cSqyrgh4hz3z5LZHDpsn0BCHGE+F3D2KD2NVrNtl5BX/0xRGOJAo2aO1m8x6d/3DowFOV149vQiFmRkRmf/T8oMtk3VAr4FN4xS0zQCzQr3wqODY
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 07:44:08.4496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 489e76cf-8209-44db-e313-08de99f99ca1
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF242240EEC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_004416_991278_66ED0B4A 
X-CRM114-Status: UNSURE (   7.55  )
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

On Apr 13, Brian Ruley wrote:
> 
> In the meanwhile, I'll see if I can add some instrumentation to
> verify this is the bug we're seeing.

The instrumentation worked (used the same ring buffer approach to track
dcache flushes). Here's the output:

```
kernel: [48629.557043] SIGILL at b6b80ac0 cpu 1 pid 32663 linux_pte=8eff659f hw_pte=8eff6e7e young=1 exec=1
kernel: [48629.557157] dcache flush START   cpu0 pfn=8eff6 ts=48629557020154
kernel: [48629.557207] dcache flush FINISH  cpu0 pfn=8eff6 ts=48629557036154
kernel: [48629.557230] dcache flush SKIPPED cpu1 pfn=8eff6 ts=48629557020154
audisp-syslog: type=ANOM_ABEND msg=audit(1776154637.460:15): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=32663 comm="journalctl" exe="/usr/bin/journalctl" sig=4 res=1 AUID="unset" UID="root" GID="root"
```

BR,
Brian

