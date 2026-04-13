Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E10EBFD1C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xP+3+D5YOUSzMn7p/BoTnXi3i33C9bBpd6D8xAW2Cnc=; b=fTete2RRta0LbjAJ0Fu8J/h2GH
	Rnn0VtgCAJan1igZnmmW1xw6QPt/dA8kk63bQBSuGFb3noK7eNoCISdJFJuw95C/VI91aYqJ+XSH0
	T0Xln/4LT+/16GAi4NLB7AYOjEC5t5uJ+Ru84b5mvN2+0sSBRTXdSr8iAcRh5QjqzUEg5WMGAJR/c
	zRwuQlaSoi0+310JU0K4s7cTG18iuE9dAt2+qxX0q8dearVsPKlJZjwslLZ5XBnJ3ijgfJSsHMLXy
	jDwjqDqBR3qpnEaUQt1YewJh1A79ZAQAHAMS1Peffj5UVrhuG/ftbBL65n2KAEW6MrX5mQl6SlcGF
	0VBWsLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD2M-0000000FIq0-3fQE;
	Mon, 13 Apr 2026 08:52:54 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD2K-0000000FInd-0rq8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:52:54 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GufgeDjyKJmVM1Yd3uguKzWUk70U0LcUsxB0hASv6opejQzqgLNftE2bsFZx7twiRUq5QHyvqa/JR7ZCM09r6HFMFvHhGOGI7e1hMyIJJpnYvCnkLX+VQHZT6Glai5nRkbkoTyykVLEWTBDBfUihRN9cv8jgEjrFHH5bJv72h3A6gIk//FxT7VndrqWCOn88CUhaxwqFFQHfPq63B7zR9upNudGig1OcEFR3JZ1n36+sRE2c+oX0er+Ll05DpMS45VW7NIzRXmsfTO0RyA/Siobxd81Hfn3YULb2wbFCRIof8BwJQGuGgtOGovPZJCGmcoEpGNBqGEuthTIDdaDcGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xP+3+D5YOUSzMn7p/BoTnXi3i33C9bBpd6D8xAW2Cnc=;
 b=qqwYrVqxHSRhS+wE2LjFwBHa4XKi+eCMlDlXEVA4NycKYT0Wpq5KQi3l2dxmh5BRzxBBTzFn1PSdKhXGhdsEsGGCJ11uUz8zrnr5K6e/l84fdDiOhQghxip2vz2YEVQemyy5sDjr8FMsgAXFecse/Qw4MQ6Cs4GyRgjnNBLkY/rn7PK+7W3Dvxbr7N+wRQyj1DcIoHR7jSN+sAp8ZrclCPc1dz3Ndceb+IdIbz/GloN1ChWwo/jgH/fyz0LSCZCJniawhQPZ7D7Un1VBYzphp6RzoTPXlj15Uy4Ov/GG3r25s/lFEYPg5Lgm+BDHdfDSddQdzgIcAESQa3y0c/1zJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xP+3+D5YOUSzMn7p/BoTnXi3i33C9bBpd6D8xAW2Cnc=;
 b=JlS3oy538sFtZ3sb0ABJM3n9X07lXFnaW7NyenGDDX0bGmHY1tHrB0L+6CdsgsW0PIir1rMDw6thero/HMh7solIwtdWUAOcC4zwGk2YXmsyZvUNwdtg30xHNabi4c32NzjaKgRbTkIeqD7VBX9lM1jE3tSZ0H27B4I2rvjQFtQ=
Received: from AM8P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::34)
 by DU2PR08MB10130.eurprd08.prod.outlook.com (2603:10a6:10:493::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Mon, 13 Apr
 2026 08:52:40 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::c8) by AM8P189CA0029.outlook.office365.com
 (2603:10a6:20b:218::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 08:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 08:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gp/gOjzkZ06UztarskWeMHy3f+BAvzZf8S5zQC4A17ae49SoD8KhjLvRcWo+jlENFBjyWCf0gHs01IDWcb6CmvoXmBtOOJm1RORers9l1zkKYPCohoxWgJgUCf/Tds1DL0VABqvrPJ7aPGzav1GyTyPKGq19qxEaiQ0BpvrUSoH/OkOvGCOqh3PwsXriubxVUnpob3eLodlI8rcvMVy7Gg3qJuKSqFVFmouhW8B5JvF+6K84f2Yf48vQ8oa1ek1utVPZ8L6oz25/KfJPvO+/XQpCtODdAUsGxbPcm7mTt5LG2/Fg8RA67Xx/WIwaA1vzPo0iw14rMYuUFDWlimeKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xP+3+D5YOUSzMn7p/BoTnXi3i33C9bBpd6D8xAW2Cnc=;
 b=nmo8SajkBSsx0OXx7dKjZ3aB7oHikOY6p1lDW6XkLABsLluPXG/WJYGKoU+vyX1/qKBFAeT+pwuFN8xE07VNUl59GHy02sf9YgVOiLMdP0Q6o5ESDgFQ6k3gv2S8spi0iBZIx8T9cbgK0STMP7h2R4IbQMc0n0c+reow32Tf7re1JJOfSlicUvylaP5Q2XGSqaRlqrNxnJ6gJYEfBfv7a508RZ9/1QTKF/sfJ4x/270OQZEXTCaSgDmZ8bBCTVQOFdsE1KRV6+PMZWMTRpYfzyg5qtuwJInd8eggveXT/u3ECVRPH8PFpljftsYAfdp7pAPWqbxKxfA+DI5DXRAqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 172.205.89.229) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xP+3+D5YOUSzMn7p/BoTnXi3i33C9bBpd6D8xAW2Cnc=;
 b=JlS3oy538sFtZ3sb0ABJM3n9X07lXFnaW7NyenGDDX0bGmHY1tHrB0L+6CdsgsW0PIir1rMDw6thero/HMh7solIwtdWUAOcC4zwGk2YXmsyZvUNwdtg30xHNabi4c32NzjaKgRbTkIeqD7VBX9lM1jE3tSZ0H27B4I2rvjQFtQ=
Received: from CWLP123CA0086.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5b::26)
 by DU0PR08MB7881.eurprd08.prod.outlook.com (2603:10a6:10:3b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:51:22 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:401:5b:cafe::3a) by CWLP123CA0086.outlook.office365.com
 (2603:10a6:401:5b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 08:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 172.205.89.229 as permitted sender) receiver=protection.outlook.com;
 client-ip=172.205.89.229; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (172.205.89.229) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 08:51:21 +0000
Received: from AZ-NEU-EXJ02.Arm.com (10.240.25.139) by AZ-NEU-EX04.Arm.com
 (10.240.25.138) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 13 Apr
 2026 08:51:21 +0000
Received: from AZ-NEU-EX04.Arm.com (10.240.25.138) by AZ-NEU-EXJ02.Arm.com
 (10.240.25.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 13 Apr
 2026 08:51:20 +0000
Received: from localhost.localdomain (10.1.31.15) by mail.arm.com
 (10.240.25.138) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Mon, 13 Apr 2026 08:51:20 +0000
From: Sami Mujawar <sami.mujawar@arm.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <jgg@ziepe.ca>,
	<thuth@redhat.com>, <Suzuki.Poulose@arm.com>, <steven.price@arm.com>,
	<gshan@redhat.com>, <YeoReum.Yun@arm.com>, Sami Mujawar
	<sami.mujawar@arm.com>
Subject: [PATCH 3/3] virt: arm-cca-guest: Add support for measurement registers
Date: Mon, 13 Apr 2026 09:49:57 +0100
Message-ID: <20260413084957.327661-4-sami.mujawar@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413084957.327661-1-sami.mujawar@arm.com>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5F:EE_|DU0PR08MB7881:EE_|AM2PEPF0001C716:EE_|DU2PR08MB10130:EE_
X-MS-Office365-Filtering-Correlation-Id: 611bfe9e-6c95-4735-afd6-08de993a043c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: rZTexo4Uj0aqA2QrQM3Oz68276tdrvefCkbXMXsu7UmrUyhHT+9YIaMyfswI2BUKRvhx8Pj8XENGeJGIY1M2/agEYYOeybKniXgs5Y5MmB+FJqR3IaWI9aZDDRsMdaXuEKswyraLuw1LnsNYM/NphxPhus82iWfx0zfkA5IfTt+p6gvfvi3DFeDfCSj4kgMB/RlS0qX18OqxdLqboHCfMvjVv7wzvJ1MbHzTdzGVJ4ZwWfdL0T9heKw6hfaB78zZZv07gz0PIVBHB85YjG7knfSyeNN20KdoUL0BFuRoL+VjHD3ETiK8pqY+0bzmG1RSYwNPtfPQ9Q6f5rcug+ITZVUf8cPtMeFupP2ShRWO18m+50jdj0KMnP09iQmWp5gQPif/tHfCyzSnN4vPBHqlxPM0TLRorCQ7gj25gwMWkyAjF6Nx81K89upQlbbg+jA5znBKdzPcLlNeXdmhzfQ0um0t1+aBzWOYfdhe4eKxNJs1yeNGttWMA+Ujs5orWmTrrvRgdxpfQg5MfzASQ/mmJblVO0f5DA2DgynXSfsoViLAgtjS4ksytMnUgDW4mCWmryL0hsRY9qXzcJTZ6iOEsy8aOs2DikLIbQd0B71bM3q39ZR72HviKO4XUd3J1k2UAqR6Fb26h/+jOkG1kmLFb2yxzIh1ivb9G5N3sIJvQaOt8tZt/8OrpYdLAlZf63d4HUjmYo6URjetPEq47IFzIORxhBUl44rgsjUQsAPM30oxX9cmfr8Qn7OPoPHaggxFF5S1BXL44slMazVCMFs537FsgzJcyx3CyDmjJfbg5V8=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: saDN0pC+UwqPeNDheE9pZv3hahXuNY3f8moKsGc1ZaOnxGxptYdNg9YZ7PzD+jkXEyXU4X0fL8M7nQm/0DrjQ0QsobdZbYDxoAVCGbBYPgrpVlZaj+jQhW4eEVkH512kZrq2m0omo87e9uo0GFtDiPY7OQuLF2IA7pV973ziAALqfKsuL1+QCnyNvvj2kuqWOcCd3Zj6y6pRq+tMDRgl7PB6WCEP3nGoHIDKNOfN5zI5yzFU5B2FCgycIRylPzyI1JAzZVSqfqK964v9QCuAX177/GI9YHoEXnrmsKS3MHZk74U31kuPixTO+xu/zY4cJYy4EmVLDvlSVdZs+hL1oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7881
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c611b0a0-1629-4694-c413-08de9939d62d
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|14060799003|82310400026|1800799024|376014|36860700016|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: auH9mzYme57Ymbf88mzCk3ykWM9dkCKaO0xTewTV+qSd/MYWc7kS9vg7rapuIbWZ2Q138QmWl7nsP7auuGIcPvn9BV7+Pa5hC7UxI4TvqzrwbYLEBCD1j85AnvDhnoEj2/qmMOgc0Nr/QKvSvBZ2nJtqteAGWNctXondHg9vYIWOMBK5P5bqxXa84LpXtmRb3cLnYySCkrNbcWF4nvHF4C3RlJ9vRcJdFUcMqniBz8bOyDKdy8Wt4bBAdy7V9cvncUfVLZFDUcTikQwHGWBz/UpGPwvhzo98fMXbjgzyxj4OM3xxQs4OiGxM5uh7N2Tb6ZiCOCN7mVMk2tYtxNFo8S1jodCqgzKndHLwRo08vFUu03775XQVd8DxIbqeFutmOGmOUH6zpnEAwJ/x/QLyP1knajv4lfvMYFfivgyhKt9anqAC440YP+cTbdn93VRTpByCR46oynK4be65xPU6KEbDnhUWHHJPeNv4YMgdPvj3ZDQnp0wy5dlKoqq3gsBZGcw7pCN0s02iFYhPR+jp80Y1Gdb1pXG7eQR7NDXZoXe05KdiMf14Z6KYBsX38H0dIkEUVtaPDto2J3RCHClsW8hou+vwT44cMgQu01J8AgzuubMwXIDzp5S6QEl2mM2yMoXddNALMyDelZifygwUidDu+Wbp2v8Y4RSkWnFUfOU8z2siSP34ZKrrdv5lH1WqGeUgYbEc1znsEsl7LYaHSfyhDJKjvKNh5Rp5IuBkwPias7XaBgO78d7niTtYA8mPbHerCyjv/bloX4ZnydtwWHqR1eOwqMsKlPqCVSE+2MY=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FDH6lQ+iPIVJdSgrN1G4BxmALoGjpThIHteWCVPL1IKCcz+K6q0pe2nZcbmvp9ljsHc/qKB3uyShtEyK3maWoCqp8JT/LI2AE+YMID6LwPKLs3QM1dE032zSQ4KnuBeKWM+dUlb40vHezJ0LNQyUv7LusSAxNH15EVHwi0+SElzgNFjScKFCAB+k/5+LpcmgCBeS6+/md8730/xliUrYaq7v39j5krp7uKyXL3sj+jTBLWxlRWr+ZdTAsOtj/Y0P7WWNwiDGPep/LXnlYFpGIJVkLDvtI5za84TxvWaKW0W89/E0Na9XmVSUY94E5Jkp7F6gJ2kf4ezlNUt6lutfQGXfNtpmaWDd96S6SynLMkED7/XjAKLzTdACOb+DpOPdcragR+hs+ZDLnnR69fDzSF9OqNin7qLOMETsagBLounSPaPJIwg1m7GmB+wmxhJY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 08:52:39.0437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 611bfe9e-6c95-4735-afd6-08de993a043c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_015252_406687_EE309013 
X-CRM114-Status: GOOD (  15.81  )
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

Add support for Arm CCA measurement registers (MRs), enabling attestation
and runtime integrity tracking from guest Realms.

This implementation registers a measurement configuration with the TSM
framework and exposes measurement register values via sysfs using a
misc device. The supported registers include the Realm Initial
Measurement (RIM) and four Runtime Extensible Measurement Registers
(REM0–REM3), each using SHA-256 or SHA-512 depending on Realm
configuration.

The measurement registers are located under the following sysfs node:
    /sys/devices/virtual/misc/arm_cca_guest/measurements/
       -rw-r--r-- 1 0 0 64 Jul 21 11:46 rem0:sha512
       -rw-r--r-- 1 0 0 64 Jul 21 11:46 rem1:sha512
       -rw-r--r-- 1 0 0 64 Jul 21 11:46 rem2:sha512
       -rw-r--r-- 1 0 0 64 Jul 21 11:46 rem3:sha512
       -r--r--r-- 1 0 0 64 Jul 21 11:46 rim:sha512

As seen above the attributes for the REMs are 'rw' indicating they can
be read or extended. While the attributes for RIM is 'r' indicating
that it can only be read and not extended.

The sysfs node suffix for the measurement register (i.e. ':sha512')
indicates the hash algorithm used is sha512. This also reflects
that the Realm was launched with SHA512 as the measurement algorithm.

Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
---
 .../sysfs-devices-virtual-misc-arm_cca_guest  |  38 +++
 drivers/virt/coco/arm-cca-guest/Kconfig       |   1 +
 .../virt/coco/arm-cca-guest/arm-cca-guest.c   | 296 +++++++++++++++++-
 3 files changed, 331 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-virtual-misc-arm_cca_guest

diff --git a/Documentation/ABI/testing/sysfs-devices-virtual-misc-arm_cca_guest b/Documentation/ABI/testing/sysfs-devices-virtual-misc-arm_cca_guest
new file mode 100644
index 000000000000..878dc54e48f8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-virtual-misc-arm_cca_guest
@@ -0,0 +1,38 @@
+What:		/sys/devices/virtual/misc/arm_cca_guest/measurements/MRNAME[:HASH]
+Date:		July, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		Value of a Arm CCA Realm measurement register (MR). The optional
+		suffix :HASH is to represent the hash algorithms associated with
+		the MRs. See below for a complete list of Arm CCA Realm MRs exposed
+		via sysfs. Refer to the Arm Realm Management Monitor (RMM)
+		Specification for more information on the Realm Measurement registers.
+
+		The Arm Realm Management Monitor Specification can be found at:
+		https://developer.arm.com/documentation/den0137/latest/
+
+		See also:
+		https://docs.kernel.org/driver-api/coco/measurement-registers.html
+
+What:		/sys/devices/virtual/misc/arm_cca_guest/measurements/rim:[sha256|sha512]
+Date:		July, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) RIM - [32|64]-byte immutable storage typically used to represent
+		the Realm Initial Measurement (RIM) which is the measurement of
+		the configuration and contents of a Realm at the time of activation.
+
+What:		/sys/devices/virtual/misc/arm_cca_guest/measurements/rem[0123]:[sha256|sha512]
+Date:		July, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RW) REM[0123] - 4 Run-Time extendable Measurement Registers that
+		represent the Realm Extensible Measurement (REM) registers which
+		can be extended during the lifetime of a Realm.
+		Read from any of these returns the current value of the corresponding
+		REM. Write extends the written buffer to the REM. All writes must start
+		at offset 0 and be maximum 64 bytes in size. Attempting to write more
+		than 64 bytes will result in EINVAL returned by the write() syscall.
diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
index 3f0f013f03f1..62fcc6b16843 100644
--- a/drivers/virt/coco/arm-cca-guest/Kconfig
+++ b/drivers/virt/coco/arm-cca-guest/Kconfig
@@ -2,6 +2,7 @@ config ARM_CCA_GUEST
 	tristate "Arm CCA Guest driver"
 	depends on ARM64
 	select TSM_REPORTS
+	select TSM_MEASUREMENTS
 	help
 	  The driver provides userspace interface to request and
 	  attestation report from the Realm Management Monitor(RMM).
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
index 0c9ea24a200c..2b5c5fa01cb3 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
@@ -1,18 +1,286 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2023 ARM Ltd.
+ * Copyright (C) 2023 - 2025 ARM Ltd.
  */
 
 #include <linux/arm-smccc.h>
 #include <linux/cc_platform.h>
 #include <linux/kernel.h>
+#include <linux/miscdevice.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/smp.h>
 #include <linux/tsm.h>
+#include <linux/tsm-mr.h>
 #include <linux/types.h>
 
 #include <asm/rsi.h>
+#include <crypto/hash.h>
+
+/* MR buffer */
+static u8 *arm_cca_mr_buf;
+
+/**
+ * arm_cca_mrs - ARM CCA measurement register set.
+ *
+ * Defines a static array of measurement registers used by the ARM
+ * Confidential Compute Architecture (CCA). These registers are used
+ * for attestation and runtime integrity tracking.
+ *
+ * Register types:
+ *   - rim: Realm initial measurement register (RIM)
+ *   - rem0–rem3: Runtime extensible measurement registers (REMs)
+ */
+static struct tsm_measurement_register arm_cca_mrs[] = {
+	{ TSM_MR_(rim, SHA256)  | TSM_MR_F_READABLE },
+	{ TSM_MR_(rem0, SHA256) | TSM_MR_F_RTMR },
+	{ TSM_MR_(rem1, SHA256) | TSM_MR_F_RTMR },
+	{ TSM_MR_(rem2, SHA256) | TSM_MR_F_RTMR },
+	{ TSM_MR_(rem3, SHA256) | TSM_MR_F_RTMR }
+};
+
+/**
+ * arm_cca_mr_refresh - Refresh measurement registers for ARM CCA.
+ *
+ * @tm: Pointer to a struct tsm_measurements containing measurement registers.
+ *
+ * Iterates through all measurement registers in @tm and refreshes those
+ * marked with TSM_MR_F_LIVE or TSM_MR_F_READABLE by invoking
+ * rsi_measurement_read() for each.
+ *
+ * Return: 0 on success, or -EINVAL if @tm is NULL or a read operation fails.
+ */
+static int arm_cca_mr_refresh(const struct tsm_measurements *tm)
+{
+	int retval;
+	int index = 0;
+	const struct tsm_measurement_register *mr;
+
+	if (!tm)
+		return -EINVAL;
+
+	while (index < tm->nr_mrs) {
+		mr = &tm->mrs[index];
+
+		/* Skip if the MR is not Live or Readable. */
+		if ((mr->mr_flags & (TSM_MR_F_LIVE | TSM_MR_F_READABLE)) != 0) {
+			retval = rsi_measurement_read(index,
+						      mr->mr_value,
+						      mr->mr_size);
+			if (retval != 0)
+				return -EINVAL;
+		}
+
+		index++;
+	}
+
+	return 0;
+}
+
+/**
+ * arm_cca_mr_extend - Extend a measurement register with new data.
+ *
+ * @tm:   Pointer to the tsm_measurements structure containing measurement
+ *        registers.
+ * @mr:   Pointer to the specific measurement register to extend.
+ * @data: Pointer to the data to be used for extension.
+ *
+ * This function extends a measurement register with new input data.
+ *
+ * Return: 0 on success, or a negative error code (e.g., -EINVAL for invalid
+ * arguments).
+ */
+static int arm_cca_mr_extend(const struct tsm_measurements *tm,
+			     const struct tsm_measurement_register *mr,
+			     const u8 *data)
+{
+	if (!tm || !mr || !data)
+		return -EINVAL;
+
+	return rsi_measurement_extend((mr - tm->mrs), data, mr->mr_size);
+}
+
+/**
+ * arm_cca_measurements - ARM CCA measurement configuration instance.
+ *
+ * This defines the measurement set and behavior for the ARM
+ * Confidential Compute Architecture, enabling measurements
+ * for attestation and runtime validation.
+ */
+static struct tsm_measurements arm_cca_measurements = {
+	.mrs = arm_cca_mrs,
+	.nr_mrs = ARRAY_SIZE(arm_cca_mrs),
+	.refresh = arm_cca_mr_refresh,
+	.write = arm_cca_mr_extend,
+};
+
+/**
+ * arm_cca_attr_groups - Attribute groups for the arm_cca_misc_dev miscellaneous
+ * device.
+ *
+ */
+static const struct attribute_group *arm_cca_attr_groups[] = {
+	NULL, /* measurements */
+	NULL
+};
+
+/**
+ * arm_cca_misc_dev - Miscellaneous device for ARM CCA functionality.
+ *
+ */
+static struct miscdevice arm_cca_misc_dev = {
+	.name = KBUILD_MODNAME,
+	.minor = MISC_DYNAMIC_MINOR,
+	.groups = arm_cca_attr_groups,
+};
+
+/**
+ * arm_cca_get_hash_algorithm - Get the hash algorithm and digest size for
+ * a Realm.
+ *
+ * @hash_algo:   Pointer to an int to receive the internal hash algorithm ID
+ *               (e.g., HASH_ALGO_SHA256 or HASH_ALGO_SHA512).
+ * @digest_size: Pointer to an int to receive the digest size in bytes
+ *               (e.g., SHA256_DIGEST_SIZE or SHA512_DIGEST_SIZE).
+ *
+ * This function retrieves the hash algorithm used in a Realm's configuration
+ * by invoking the `rsi_get_realm_config()` interface.
+ *
+ * Return:
+ * * %0        - Success. The hash algorithm and digest size are returned.
+ * * %-ENOMEM  - Memory allocation failed.
+ * * %-EINVAL  - Configuration fetch failed or algorithm is unsupported.
+ *
+ */
+static int arm_cca_get_hash_algorithm(int *hash_algo, int *digest_size)
+{
+	int ret = 0;
+	unsigned long result;
+	struct realm_config *cfg = NULL;
+
+	cfg = alloc_pages_exact(sizeof(*cfg), GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
+
+	result = rsi_get_realm_config(cfg);
+	if (result != RSI_SUCCESS) {
+		ret = -EINVAL;
+		goto exit_free_realm_config;
+	}
+
+	switch (cfg->hash_algo) {
+	case RSI_HASH_SHA_512:
+		*hash_algo = HASH_ALGO_SHA512;
+		*digest_size = SHA512_DIGEST_SIZE;
+		break;
+	case RSI_HASH_SHA_256:
+		*hash_algo = HASH_ALGO_SHA256;
+		*digest_size = SHA256_DIGEST_SIZE;
+		break;
+	default:
+		/* Unknown/unsupported algorithm. */
+		ret = -EINVAL;
+		break;
+	}
+
+exit_free_realm_config:
+	free_pages_exact(cfg, RSI_GRANULE_SIZE);
+	return ret;
+}
+
+/**
+ * arm_cca_mr_init - Initialize ARM CCA measurement register infrastructure.
+ *
+ * This function sets up the internal data structures for handling ARM CCA
+ * measurement registers (MRs) and creates a sysfs attribute group. It also
+ * registers a miscelaneous device for exposing the Arm CCA measurement
+ * registers to userspace.
+ *
+ * Return:
+ * * %0       - On success.
+ * * %-ENOMEM - if memory allocation fails.
+ * * %-EINVAL - On hash algorithm retrieval or attribute group creation
+ *   failure.
+ */
+static int arm_cca_mr_init(void)
+{
+	const struct attribute_group *g;
+	int ret;
+	int hash_algo;
+	int digest_size;
+	int digest_buf_size;
+
+	/* Retrieve the hash algorithm and digest size. */
+	ret = arm_cca_get_hash_algorithm(&hash_algo, &digest_size);
+	if (ret)
+		return ret;
+
+	/*
+	 * Allocate a single contiguous buffer to hold the digest values
+	 * for all MRs.
+	 */
+	digest_buf_size = ARRAY_SIZE(arm_cca_mrs) * digest_size;
+	u8 *digest_buf __free(kfree) = kzalloc(digest_buf_size, GFP_KERNEL);
+	if (!digest_buf)
+		return -ENOMEM;
+
+	arm_cca_mr_buf = digest_buf;
+
+	/* Initialise the mr_value storage and the mr_size. */
+	for (size_t i = 0; i < ARRAY_SIZE(arm_cca_mrs); ++i) {
+		arm_cca_mrs[i].mr_value = digest_buf + (digest_size * i);
+		arm_cca_mrs[i].mr_size = digest_size;
+		arm_cca_mrs[i].mr_hash = hash_algo;
+	}
+
+	/* Read the measurement registers. */
+	ret = arm_cca_mr_refresh(&arm_cca_measurements);
+	if (ret)
+		return ret;
+
+	/*
+	 * Create a sysfs attribute group to expose the measurements
+	 * to userspace.
+	 */
+	g = tsm_mr_create_attribute_group(&arm_cca_measurements);
+	if (IS_ERR_OR_NULL(g))
+		return PTR_ERR(g);
+
+	/* Initialise the attribute group before registering the misc device. */
+	arm_cca_attr_groups[0] = g;
+
+	/*
+	 * Register a miscelaneous device for exposing
+	 * the Arm CCA measurement registers to userspace.
+	 */
+	ret = misc_register(&arm_cca_misc_dev);
+	if (ret < 0) {
+		tsm_mr_free_attribute_group(g);
+		return ret;
+	}
+
+	arm_cca_mr_buf = no_free_ptr(digest_buf);
+
+	return 0;
+}
+
+/**
+ * arm_cca_mr_cleanup - Unregister sysfs attribute group and free the
+ * measurement digest buffer region.
+ *
+ * @mr_grp: Pointer to the sysfs attribute group.
+ *
+ * This function performs cleanup for the Arm CCA memory registers (MR).
+ *
+ * The function should be called during the teardown or cleanup phase
+ * to ensure proper resource deallocation.
+ */
+static void arm_cca_mr_cleanup(const struct attribute_group *mr_grp)
+{
+	misc_deregister(&arm_cca_misc_dev);
+	tsm_mr_free_attribute_group(mr_grp);
+	kfree(arm_cca_mr_buf);
+}
 
 /**
  * struct arm_cca_token_info - a descriptor for the token buffer.
@@ -188,12 +456,16 @@ static const struct tsm_report_ops arm_cca_tsm_ops = {
 
 /**
  * arm_cca_guest_init - Register with the Trusted Security Module (TSM)
- * interface.
+ * interface and also register a miscelaneous device used for exposing
+ * the Arm CCA measurement registers to userspace.
  *
  * Return:
  * * %0        - Registered successfully with the TSM interface.
  * * %-ENODEV  - The execution context is not an Arm Realm.
  * * %-EBUSY   - Already registered.
+ * * %-ENOMEM  - If memory allocation fails.
+ * * %-EINVAL  - On hash algorithm retrieval or attribute group creation
+ *   failure.
  */
 static int __init arm_cca_guest_init(void)
 {
@@ -202,9 +474,22 @@ static int __init arm_cca_guest_init(void)
 	if (!is_realm_world())
 		return -ENODEV;
 
+	ret = arm_cca_mr_init();
+	if (ret < 0) {
+		pr_err("Error %d initialising MRs\n", ret);
+		return ret;
+	}
+
 	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
-	if (ret < 0)
+	if (ret < 0) {
 		pr_err("Error %d registering with TSM\n", ret);
+		goto cleanup_mr;
+	}
+
+	return ret;
+
+cleanup_mr:
+	arm_cca_mr_cleanup(arm_cca_attr_groups[0]);
 
 	return ret;
 }
@@ -212,11 +497,14 @@ module_init(arm_cca_guest_init);
 
 /**
  * arm_cca_guest_exit - unregister with the Trusted Security Module (TSM)
- * interface.
+ * interface and deregister the miscelaneous device used for exposing the
+ * Arm CCA measurement registers to userspace.
+ *
  */
 static void __exit arm_cca_guest_exit(void)
 {
 	tsm_report_unregister(&arm_cca_tsm_ops);
+	arm_cca_mr_cleanup(arm_cca_attr_groups[0]);
 }
 module_exit(arm_cca_guest_exit);
 
-- 
SAMI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


