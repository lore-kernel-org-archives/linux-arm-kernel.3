Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958AF105F7B1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2fdB4tcrcTDH2TZskAzKYMDJmAqLtq4qdykh7rZfRQ=; b=SFzQeJEDJwwQoLZqwWvXk9dtK5
	7hEOTxqjp6GPEsgbG1ex0A7NIwX33ZLJpToygoVO2CowaYIQnPO9TZ3uJQp29KAiyU+oMEuSoaJnj
	qTwkoFRh20gCGcViuThUQ6dbgbTBbTfnLCVkNUWlv8sHiKTEfvZC61WIW2RitZSGsSGK0qU/35Gy1
	pw/cdWpJ0jbsHg/SB8ismj450klcjdZu9o4R6zpwMZ788WVWQjHgvfXL9Y3UKhSD36l5zBMtpYShN
	OIH/D/VtmPm/UHlzuJ516f5l/riwwsbffFmguvOtC6P11a/Bpxy2ZyZZUuH+i6d7x0nY/QN0fUdqr
	kFncotXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13OH-00000000MvK-0uIX;
	Fri, 13 Mar 2026 14:21:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13O7-00000000MoI-1n0S
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 14:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=L2fdB4tcrcTDH2TZskAzKYMDJmAqLtq4qdykh7rZfRQ=; b=FhlwUFKqx3MaC4XwVjJrDWxAx4
	xC118UK62rmSp7u9JT5Wvnris1tj/xjnq338e9xp8RYSbIoQtj3Q0uEDr5B2PIWXvJLyM8pa7905L
	0oSopm4/kLOU16/9yHWVcFQEnbIsIdNqOQ6q4pnhpGkcGihNuCdto2MQAwPC1CwZKUkXMOam8kbXc
	WepapXQWOM1vTqgrJ4fR1p1A7aNnCD6MMtEFH+MeI3+Uv1mdG9T0TRuy972MazFTk9Yr9JBeB17ny
	lHB8LHXL37ALRUGoUYpctbUgxOenxWpJ9NPNEGN9RBfcxmIExCobvNurJWtYjl54EdRdXePamNtIp
	evdpssVA==;
Received: from mail-northeuropeazon11021125.outbound.protection.outlook.com ([52.101.65.125] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13O1-00000003W9t-0kT5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:21:14 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Uwv6IP+LvWMTVbXrIsYmsk5xN1XWJbZ25Bg6HGJkUeHH+ef9Yu74cSprWd+IMp9c9Vr53V5RG5LVCmpgM9HDW9V2icW4UTM99vuQS0TLTJOF+eFxBeF+Vb5a6YL9tNK3vlTgzpxUUBq2BBtlDj7FFk0raUPOpBmK93QVzJggBkSRow8y3dYPKilQKSIYPQZNon8p9Em/c8bALiqQ+3O83IFuBc2yCOFC0f3J9A5AgQKUtkVAQJ0itQMIF7RWL+cwg9ySaAP+1UfDwDM9fGmte0Q8U7BZkTfzzDP+mgqQG3O7CCKApgZguMsDF7ItdbOgFkdmp0T8EbJPuqPh3RcH2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2fdB4tcrcTDH2TZskAzKYMDJmAqLtq4qdykh7rZfRQ=;
 b=aoO+zwx1QnFiL/ri0bvkrb21Xhv2FSmt4hVGLA7l/lYDkSayeuTtUdviMnUS5GVZXkcPPVil/t9qhEe/9YAlPvAXx5c8xPAn26zMrx9hnd4l69GI9hwURdQ+zhJ9665JbnLyCun4p2CTXgHwMbMPTkjtyouE417BAeUrQ5zf721glApzmQFi/ambAt29LyAXW3UARjN5YUoHx5GLYYETrx8+TAOT6oc5rAw94kpMpc0LsVe54fstAN+kFGmjFISAswNERFXvUI6KgpVlJcIYRPk8edOs92+UJZUkDbdO+zgzsImsSHKsZMAFm/OiQJFlYQRwltQ5yVOKifY2uyiE5Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2fdB4tcrcTDH2TZskAzKYMDJmAqLtq4qdykh7rZfRQ=;
 b=FosXhHeI1CdNKXbUGMEBAXDxV4c7IIXeezNodWg2aN+zpT80Y3cekj5HjxmiUmWVPON0dQvzSJH4vvGSCriPCZI1BiF7Cz2JuqNSz9zpWbIe62Hb8vWtPRlqmj4d8C30EYCsTxa+qv6gOmHPUckC3uMVcHLogUOTdMhCy1PCxYw=
Received: from AM4PR0302CA0021.eurprd03.prod.outlook.com (2603:10a6:205:2::34)
 by VI0PR04MB11819.eurprd04.prod.outlook.com (2603:10a6:800:2eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 14:20:54 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:205:2:cafe::ec) by AM4PR0302CA0021.outlook.office365.com
 (2603:10a6:205:2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Fri,
 13 Mar 2026 14:21:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.1 via
 Frontend Transport; Fri, 13 Mar 2026 14:21:01 +0000
Received: from emails-6715857-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 9652C80C4A;
	Fri, 13 Mar 2026 14:21:00 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 14:20:55 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8hsNA2WMl7nuJ1N3fefItQEXszbBsoLyBbw8cw/YmXKCptAlGbj1BMcsnNbDvW1tXFipMtNO8NXjpMq04zKhjVv+NguJwWAVo+1AHtdnOAU050IbjXs15Gcwim/u3GJfHLv6yvNrvfzxenQ4GFVvO3xcS/WDd8TS5qdbndI3hOE/Ss+SbMm9fP2zw4ldIgSIapG4aov6o4mN2WkQNGQpkgRDlsU5L7ZFtXX7IgRSuem3VBVy6sxJi+fMC6tvMbjh3LA/pnSYFjF4BtnP9SYSd+UqF5IIgFkBtqVR3xX9kGmVqpLdxW912DLwzWIvhi/7r8wNF4UwTM79NytDJtCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2fdB4tcrcTDH2TZskAzKYMDJmAqLtq4qdykh7rZfRQ=;
 b=UZklgVTD1MHy4mexOdhsZXPenEKTbcIh9dYL9CTRvMhn38miebaIZyVV5OrUsF5AzbyFUSKWyxMQoqeySBdSS8xdL9YTg1cwL4eT4MQ8uRlPBZbqyq+fSJ7lba3oEjXav3+ZaeuFQuQPrdqy98wKFJJlvgjbYIXlV3zK9+foxuDA1tUIMj10iztSJuxJkiAztwJp/KKo01H7Ic7LogLS3r5XzxwXHvQ2rbl4x0r4oIw1IzKey6yD8zLC1/O6lgajvbFLfNNDNVPNqLhspcqQWze++dW97q62kVBK/+LdsxGNc2Jfub3iLZNmjsElF6kVf9tE2g0VJ1ALrr0W0xV5bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2fdB4tcrcTDH2TZskAzKYMDJmAqLtq4qdykh7rZfRQ=;
 b=FosXhHeI1CdNKXbUGMEBAXDxV4c7IIXeezNodWg2aN+zpT80Y3cekj5HjxmiUmWVPON0dQvzSJH4vvGSCriPCZI1BiF7Cz2JuqNSz9zpWbIe62Hb8vWtPRlqmj4d8C30EYCsTxa+qv6gOmHPUckC3uMVcHLogUOTdMhCy1PCxYw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 14:20:50 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 14:20:38 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 13 Mar 2026 15:20:45 +0100
Subject: [PATCH v4 04/10] arm64: dts: lx2160a: rename pinmux nodes for
 readability
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lx2160-sd-cd-v4-4-aabcf230fbff@solid-run.com>
References: <20260313-lx2160-sd-cd-v4-0-aabcf230fbff@solid-run.com>
In-Reply-To: <20260313-lx2160-sd-cd-v4-0-aabcf230fbff@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, Frank Li <frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::18) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8355:EE_|AM4PEPF00025F96:EE_|VI0PR04MB11819:EE_
X-MS-Office365-Filtering-Correlation-Id: 9845eced-e38b-4805-e4d6-08de810bc0ce
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: zVX9Qzpkk+pwVvqmb9fqokbs5i7z5UABlJcFtFIMVByEfW5arsZAbw9w9xj7cOE4ZFljjLNL7CSFmJlAD/Y9PjFLYKdUjAnqsewAWUWmXCgTyMfmsgpimqZn2DDoKvE/x1Ftaobb1uMMQmx7Ecn1oZi/GUCzh68zZAEkjKw+aApaId75s/Wh6B9IeFx/TGvMMAzuSfbbTg0jn/r3OZO7OKy8F5rmc64pdODGiKB6V8YHZDkz9o/Q9aMh2PEcbDrPtRDoJjgArCZvSDAW6p3ykMd8MS0evm+kXoLGL7vcO2MC2JR1YWeh1KhbdPx8w0Yo1ggvLjJFQXkKkanjh2MrNhFlxgSiLy1pcmTuYgdC3uNoBsrqCEyz7M52p4PlReWppathdba1zNad2L4G7ve/GnKoNFUPZ/lYeuvqgjrY0p/NIFpgSfIcdkVMJfbfT2Q3v8qunSDGC119HEmuT/Dr36kz+4j5Ya9Dx+/Sw+an0lkW9CP9tX10dR+Lr+VEmXecGKiLfvvVmFlNW47xssW1v0EPE2fcxIxbZzkjay0QP89f5LLobJURcFuNad5OrnZTUsSLkXdhjf9kLobXZa+rR1Hmxfw8UdhTU134T2Te98t9bQOCUSkUtYtMySg+NBOyM20p0Mt/MqIGLMZV2Gm4bikSKOZgPVm8ar+y4+zG2CQhGciljFmwwU7k6Akl7xA8g1MyVYQjqH+pxWG4HhZW4eLqpy/o9BXGkREB2JNS2xbaWdkCjzeko+pNyXnoGHVVrPQZQDSyU9N906xrO7DXHrp7134wtmb9et7bhFpsF8Y=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: mc34q9zOd0TWt84wLwDMqrYfBSZRxS+Udsvzj87MLyH6FKwTKz+FRHEV06F/JMPqXoWI+50a3oZ2Ub24VJ13h9GUpCrFdOkfTK5of4OLuU8L6l44jW6vBJg53MW4jibPdQVXpPfFn1v+upf/P4NdDSi1rP/unzXEqcIcX3trDG9vbPPnHH2ymxrwWOLrMWGa7XCEIEIDHU2gYF51j8IlhoF9/xRY3M2xioX2pjIo0ZriAXTE5bLhzS4aJVT3HAinSIjmsRHD54ykgqws6oA6W5HOVEjhjqan/xCAZhUeNgw0c5rXrn3rlKqBqUUKsf5/4WQEhkR6PqJtWfNnhW8yJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2b49662666e34d7996027b2fd025993d:solidrun,office365_emails,sent,inline:63fc3aa5d97fb79fbbc6fc70877a80c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9302e54d-9269-4698-7497-08de810bb32a
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|82310400026|36860700016|376014|14060799003|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: fGVG0NjTB6bptVT0aEoBTqSMkhvcjbUFnPU8KBBkW6S/TKxYGxqgocvzcOq9Jzd8mG/cDe7qLbi8pdRisqR7UpJ0wofNNIuf3ZQdvJDwK+hWSjZWUQyZLW8ZT6PHX/uEVr0vlnoyfgYOt/aD2tZknKptfB0fjwXVMsRk8Bp31OGVLdGQZcTbrswsrVc73kNa47Zh1oWf2+0xG8yEue9BQm6RM8SP0bAhsgejjoN8ew1/GxRRV8r2eHHXej1GB459J4M0cogwdgCm5SrW7atZkn0Pd6pnEj0x2Z6hlDkzfZf/Jr7kZtpqZCD77YMo5TdCUMWmD2SU37tTXT3ydE+FyqIitOQN819bCHa49uixsmr/rd6eK2nFUuYOSDujtEfTF2Jr/BFaB4OunrnRVCm37dqzMQnEWpNS4CStD5NUD1uqn3eoHw8qtySIJYnJRtzbB5lcs46GbwzF9xBrFm/+iTyWL2E+eBgV1WyX7Lr9XRCvL3v+BGUm03gt/Kjb+RItpWoyUgaawWEgT7kZeGgcESq3iHO2VM8FEfC9d+mCHbbvA1qTxAkYRLrbNXvAKpquf/QnXxrMY2nWeUjkN9DkAxrd9hjYHdxjG67jBW2fepVg5oFxmH+ecmdvn5mwsPnsvirs0T+W8wzVxum/YAxJVhC2bEWDHnVBF/dyyrOg+SfEZkYZrfrCvYy9Zb3s2k9Din5q6rTi8YMZ2bz8adFaQu6/LY+yrMigETAMPTQuSyrEOTH4xSb//8cgTmJ2uV5uWxSCRQG+cbmrgEKSd+vEXw==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700016)(376014)(14060799003)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bdy/7BiXVxlCTkyf3VyMcyvzBmYqtlTJn0qtYdwJRiTWJRC5LN2jtm7+Of9Sn5ztYSCrL2f9Br8a7duCqeAf1pi6RIVWEdIYLv0y+OEuFuXGjE59nQ8A8i+0DsKK9+JXEaBfWlBeohcmdr7EiYf6X4La2V1UKBfq9nnrD8O2cL6sBGRiDs1sog9ZtR5acq44AXqwzj6Hnone0TkW9wosBuoTb9NViDJWgLDGFEX3Ew9Zz5a3FgBRxzNJrgl5FRH/yaCc4ya1bYkWsFCJeBouZiCnwXgLlpBf+J5rnkU1yfbFXxg4lVbdaRQ9G5L9mEzRdnKcwVZeg0igdhSBsbcFwaJ4ooz+yTw6hICttHq69/g0wJvAsN1IR2NwdaInZKcjcVY84N3uKHU0N2F1S0YJ4F4LcgKFO/Tz0GXGUc70jPk5MK+frpGg8PYkauG64qQv
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 14:21:01.1555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9845eced-e38b-4805-e4d6-08de810bc0ce
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11819
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_142110_927545_DE108556 
X-CRM114-Status: UNSURE (   9.07  )
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

LX2160A pinmux is done in groups by various length bitfields within
configuration registers.

Each group of pins is named in the reference manual after a primary
function using soc-specific naming, e.g. IIC1 (for i2c0).

Hardware block numbering starts from zero in device-tree but one in the
reference manual.

Rename the already defined pinmux nodes originally added for changing
i2c pins between i2c and gpio functions reflecting the reference manual
name (IIC) in the node name, and the device-tree name (i2c, gpio) in the
label.

This makes it more clear to future developers that these nodes do in
fact configure a group of pins, and helps with cross-referencing
documentation.

No functional change intended.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 64 +++++++++++++-------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 41c9b4253f4a5..28500e8873909 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -750,8 +750,8 @@ i2c0: i2c@2000000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c0_scl>;
-			pinctrl-1 = <&i2c0_scl_gpio>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-1 = <&gpio0_3_2_pins>;
 			scl-gpios = <&gpio0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -766,8 +766,8 @@ i2c1: i2c@2010000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c1_scl>;
-			pinctrl-1 = <&i2c1_scl_gpio>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-1 = <&gpio0_31_30_pins>;
 			scl-gpios = <&gpio0 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -782,8 +782,8 @@ i2c2: i2c@2020000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c2_scl>;
-			pinctrl-1 = <&i2c2_scl_gpio>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-1 = <&gpio0_29_28_pins>;
 			scl-gpios = <&gpio0 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -798,8 +798,8 @@ i2c3: i2c@2030000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c3_scl>;
-			pinctrl-1 = <&i2c3_scl_gpio>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-1 = <&gpio0_27_26_pins>;
 			scl-gpios = <&gpio0 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -814,8 +814,8 @@ i2c4: i2c@2040000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c4_scl>;
-			pinctrl-1 = <&i2c4_scl_gpio>;
+			pinctrl-0 = <&i2c4_pins>;
+			pinctrl-1 = <&gpio0_25_24_pins>;
 			scl-gpios = <&gpio0 25 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -830,8 +830,8 @@ i2c5: i2c@2050000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c5_scl>;
-			pinctrl-1 = <&i2c5_scl_gpio>;
+			pinctrl-0 = <&i2c5_pins>;
+			pinctrl-1 = <&gpio0_23_22_pins>;
 			scl-gpios = <&gpio0 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -846,8 +846,8 @@ i2c6: i2c@2060000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c6_scl>;
-			pinctrl-1 = <&i2c6_scl_gpio>;
+			pinctrl-0 = <&i2c6_i2c7_pins>;
+			pinctrl-1 = <&gpio1_18_15_pins>;
 			scl-gpios = <&gpio1 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -862,8 +862,8 @@ i2c7: i2c@2070000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c6_scl>;
-			pinctrl-1 = <&i2c6_scl_gpio>;
+			pinctrl-0 = <&i2c6_i2c7_pins>;
+			pinctrl-1 = <&gpio1_18_15_pins>;
 			scl-gpios = <&gpio1 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -1713,11 +1713,11 @@ pinmux_i2crv: pinmux@70010012c {
 			pinctrl-single,register-width = <32>;
 			pinctrl-single,function-mask = <0x7>;
 
-			i2c1_scl: i2c1-scl-pins {
+			i2c1_pins: iic2-i2c-pins {
 				pinctrl-single,bits = <0x0 0 0x7>;
 			};
 
-			i2c1_scl_gpio: i2c1-scl-gpio-pins {
+			gpio0_31_30_pins: iic2-gpio-pins {
 				pinctrl-single,bits = <0x0 0x1 0x7>;
 			};
 
@@ -1725,35 +1725,35 @@ esdhc0_cd_wp_pins: iic2-sdhc-pins {
 				pinctrl-single,bits = <0x0 0x6 0x7>;
 			};
 
-			i2c2_scl: i2c2-scl-pins {
+			i2c2_pins: iic3-i2c-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 3)>;
 			};
 
-			i2c2_scl_gpio: i2c2-scl-gpio-pins {
+			gpio0_29_28_pins: iic3-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 3) (0x7 << 3)>;
 			};
 
-			i2c3_scl: i2c3-scl-pins {
+			i2c3_pins: iic4-i2c-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 6)>;
 			};
 
-			i2c3_scl_gpio: i2c3-scl-gpio-pins {
+			gpio0_27_26_pins: iic4-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 6) (0x7 << 6)>;
 			};
 
-			i2c4_scl: i2c4-scl-pins {
+			i2c4_pins: iic5-i2c-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 9)>;
 			};
 
-			i2c4_scl_gpio: i2c4-scl-gpio-pins {
+			gpio0_25_24_pins: iic5-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 9) (0x7 << 9)>;
 			};
 
-			i2c5_scl: i2c5-scl-pins {
+			i2c5_pins: iic6-i2c-pins {
 				pinctrl-single,bits = <0x0 0 (0x7 << 12)>;
 			};
 
-			i2c5_scl_gpio: i2c5-scl-gpio-pins {
+			gpio0_23_22_pins: iic6-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 12) (0x7 << 12)>;
 			};
 
@@ -1777,19 +1777,19 @@ gpio0_14_12_pins: sdhc1-dir-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 27) (0x7 << 27)>;
 			};
 
-			i2c6_scl: i2c6-scl-pins {
-				pinctrl-single,bits = <0x4 0x2 0x7>;
+			gpio1_18_15_pins: iic8-iic7-gpio-pins {
+				pinctrl-single,bits = <0x4 0x1 0x7>;
 			};
 
-			i2c6_scl_gpio: i2c6-scl-gpio-pins {
-				pinctrl-single,bits = <0x4 0x1 0x7>;
+			i2c6_i2c7_pins: iic8-iic7-i2c-pins {
+				pinctrl-single,bits = <0x4 0x2 0x7>;
 			};
 
-			i2c0_scl: i2c0-scl-pins {
+			i2c0_pins: iic1-i2c-pins {
 				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
 			};
 
-			i2c0_scl_gpio: i2c0-scl-gpio-pins {
+			gpio0_3_2_pins: iic1-gpio-pins {
 				pinctrl-single,bits = <0x8 (0x1 << 10) (0x1 << 10)>;
 			};
 		};

-- 
2.51.0


