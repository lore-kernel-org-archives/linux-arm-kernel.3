Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79272C5DF96
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Xh98pnEKcp7jzKYQDbW7bH40Dmhm2l7sA8No2Hw+M20=; b=zrYT06wgis72QleIt2ESwnM3cV
	WVL2W+yEDgn7LWrJ0+4JUyM/t6SrdlmWe8tic5TLix9w/VG85rQmQq+IiKGZXttr0aLuRQQE+tCgp
	pYtsNXdjd5wDuwdG3TS7wM+gSV9evm7B7XgCpZ5S4EITI3gy0ikWo9ROIPcigCJaY3UXXhhg1exgj
	UzVFu6GD1idv9pXgfJjZVUfmJefZ9ds1juYbqZW9dqzVm3VtxOLcnSrWkZHZF9u/Dgyv3zh2+DzSx
	IhqzKLWdwBrqmBauiOlTytrKzWGHIDYeWvzwnWmjmKBW4DlW4WereAQzDXUhcrPKPTYsYCjB88ZdP
	WcHlRjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxR5M-0000000DfHZ-1uET;
	Fri, 21 Aug 2026 15:23:15 +0000
Received: from mail-westeuropeazon11010035.outbound.protection.outlook.com ([52.101.69.35] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxR5K-0000000DfGi-0Xt5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 15:23:11 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NWw1WCQ/eyOwMx3ZPqEROnIgAr4ySr0jquWv7VDZ9DlkAhid71p9Y7X7SrDnOevQPQnldLbEv78pN3P6c4uu8TS8KKrDRshlAQa+LvMgbHUWNtP8MGLcm9X0au8o7JoWSIrxd6eIgrHlyq643v4iSqC87bhcgz4NJdipuztukzW4a+0oF+CfMGUlzmqI2Y2leAgk72b9h0BybRTUuHQnrVBo/m6nC33vp/1Mj/bq/oxWQy5YYGgugCXD97etfqgstbDxivmXHtay/CIATrplthlBNJVl0vyLcdSm3VdzrAGCVjVnWd8Z/NT+eSnQmphnnSE1pL6NbkVaQdJmr79wog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xh98pnEKcp7jzKYQDbW7bH40Dmhm2l7sA8No2Hw+M20=;
 b=YnnUCgpeKDguZuwkjE0banGJkuH84SieEcwQmqQD4ReOccDXUfdHrRgxLeacXZSpWclEI1wEJ4xh2Ml9Eigc+y1/2IaHe3kG7WQV4hE82+NFmopnfOErIYe/3Jp7xCJjlC/0/geGYb+nSCcwlSJf++tyKA6ErwotuL36cu2OBbry8epGhPV+LXwLoD77M7QR14gl7iF7/Dbx7GR2A3qJivtWYudifSuvNg6JadrNMhZpb5FJKy8vmWZWQM3LmKGhF8XDrQBFwf4GHlCl16Twb20QlP3ErEaYodrgUC9mdIFxjWdoadCK6gahF7hR4Re4QmrQ++IBkQS2qxhfkFkiKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xh98pnEKcp7jzKYQDbW7bH40Dmhm2l7sA8No2Hw+M20=;
 b=EZKuK5uuHU2NIxJdRPPXCV5OkDsPilPv4ljJsXINWaexDbNR5ZGesi/FOaVTowX2LJxbgRaYTHhmyIjYvlzEPOpbDiKro/E97i1vIkx0/X2C5exfdDAre5tNJx0hRWSQZHjVRtS3onlBFpdw8+DFOjAPgWX7OHrvLX66Y7TJ3lo=
Received: from DU2PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:10:3b::35)
 by AM9PR08MB6097.eurprd08.prod.outlook.com (2603:10a6:20b:280::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 15:23:02 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::83) by DU2PR04CA0030.outlook.office365.com
 (2603:10a6:10:3b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 15:23:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 15:23:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/69hNJWG7uH/KVh4O0d6AnSM2id6Bk1qYGlgesjh4QyhpwlXPjkhTrIvInzMK8NZJQEhPEw+PPPMa6/MzKEv87i5IP5qXKLJUDSnuvlrD+YRBBNL3phXAAEPCX5Kx2dyh048R+igcqlBg8JxlUGRmIjWV+nUpi8atNvhlV5Dfo8I3APYs8hwXDSqqhyLJyWdNChMc4dyly9FYd+6PhePDu1emsxasIyWl7Gb0R8ZAjXLy5zDDJuu6ZR1Zn7ma/wisqcIGjrmHY7GS9v90CTa87Erdhc/PInXo/F0i1HBr5WhsS+1NpDFHkyuLnmtk84anmBpmS+i65JCoSgxUdDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xh98pnEKcp7jzKYQDbW7bH40Dmhm2l7sA8No2Hw+M20=;
 b=Y2VaNfo7Cov+3wy5ckjNKhASwdjKJ6K5hoFwDawwO3XnEJtZLvtQ04IMg1k85oMthUEjxEo+gP6KCCs+h7fP8EnzSGFDq6t0qdGCY5DMxOrWD8DTY82y3D6OXXKFWY/nDD1y0RiO1cDPOJQ8LykW+XH8dq//7Oeu9BaLG4Z6Ak5yI4UkKtADSObvOplxoPcFc5cHNkF8UiL3Vjd5tPBRSz+vcW24yJxS22YaWeoKAiY1FUd+j++41PcKsf2GcbnbKdzopBCRMcf7UIK20yDxDA4WHWp4EOe+omteWyqTVgTburHo/o7dV963T6iYIS7QCEkGlUNNzfBxH+fNmU8V9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xh98pnEKcp7jzKYQDbW7bH40Dmhm2l7sA8No2Hw+M20=;
 b=EZKuK5uuHU2NIxJdRPPXCV5OkDsPilPv4ljJsXINWaexDbNR5ZGesi/FOaVTowX2LJxbgRaYTHhmyIjYvlzEPOpbDiKro/E97i1vIkx0/X2C5exfdDAre5tNJx0hRWSQZHjVRtS3onlBFpdw8+DFOjAPgWX7OHrvLX66Y7TJ3lo=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by DB9PR08MB6553.eurprd08.prod.outlook.com (2603:10a6:10:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:22:30 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:22:30 +0000
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
Subject: Re: [PATCH v10 17/24] firmware: arm_scmi: Add Telemetry debugfs ABI
 documentation
Thread-Topic: [PATCH v10 17/24] firmware: arm_scmi: Add Telemetry debugfs ABI
 documentation
Thread-Index: AQHdMYDhpq3pH6xB1US2/pRACwR0vg==
Date: Fri, 21 Aug 2026 15:22:30 +0000
Message-ID: <1265D36C-4FF2-4F96-BB30-94FFEAD703C0@contoso.com>
In-Reply-To: <<20260815232604.3730754-18-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DB9PR08MB8651:EE_|DB9PR08MB6553:EE_|DU2PEPF00028D12:EE_|AM9PR08MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac50636-50ce-4603-d89d-08deff981752
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|38070700021|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: fUU9ooKJ7rH3Wlr2M+YhF2R92aWQ9lbhfCbvPRUZxP0qtLCPc1RAVQJiT7l1OOqCo+71X1uuxCi2czKO2sypv8SUW9EOA5JIA5iyNlFg+QibHkNu2MUAhQOfUYwRXB4oL5d5MP75pRg5m/tE75zPVYo2KbmjCew6WOhbxqhVksje1Rzay8h7VUkV8WXjF8Zb8UKwxFe5SVZDJZw9nocdpzHOyzhFrFDY4qC7+E4tAuEMusewmYJhWAcw+fLPOje8PWm3sHAG9FyT7U7D020B3HVHAsNmxqtBSSYrv/ltg4MGaSDEAwmZPKGRc3PjrUGXkULJh5Nn0QyHv+8/0tKfIEJAq5V/DCbdQPSyWCmOnPi+EtklAXIMPh/A/rIQnRxIGoVVklq1g4HeBJN/4IG+4fU7bWaGLD67U1+2jcbjlyIhY+VjtjPFPSUjH18IT51TVjaVRYFBj/TGNiYH11ZonTF4u6Q26ayq/+bxp7brtuQuQSFwFjFqvjRiUS77zED5FGMUYpZXli2cKdxIQLnGq6c4TPxtInVy5Ev7IKfNGn0naFKXqO3wNEKwzS+5EkanbJatcJyixqJuEKfs6PnsbRPTnW7DBZYl0+JAkPP6IFaOz+NVEgGpcFC4uqqeA3QTX8ev/U6xfSryWpBxBDjTjW4bz2EwTpzdn/xHHtQ7PTWmFAaiqxI779nz0KMOrDukAyhPbNhCQ+xrow995FuUmM/lxAgzaxGludebxLLgBL8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACC98AEF0519694CB3BCCA508E791944@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ruZeEv1/zEFGKkAG+1x542mhCHm0hMe8wEV6x66VbR9mlEP2YLPxTKofYkBkBj629+O8dDP7mSZhH2Mzm+Md001IubeURKiGHF0OfubwRDVqhdHYsrqLBtmnCF0NAEXKrxwmJIVCTvvTR6i7FyfMDrxY+dI/y+3a/jtqW4TfeWn2xTSvuOUsai8AMk0dk8iky1/AXgwSvGfayZJbIr1fO8/A0OH3Jfo89e3rrxZDTiAlPrqBgLrJRibrQYPDAyNg8jQ2ot6WGNx/89WjFzuB2GqNzTBAk9JLwfH/pVwq/DuHrCtRRlg4betNR1GdXgaF3UYUUSogsqXe+0zWSPIfoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6553
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f0524b6f-6099-4e64-01c6-08deff980414
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|36860700016|35042699022|82310400026|14060799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: NWS+ooMicj+qw/FW8w6RXwMpZ7GCALPrJwZq53Mq95Cm7YD8uUIv5jtN+0LDMe0xMzWqickap42Mq/S9xeXrjenGJhGIHIGwkWn07w5MIlADoKkJS2qf7YVGDYnRrHYYyL376MzWwa+SFK3wBcQMOFLMGlcfqU/495BNUpARPsx0b50bm6cAOoY+ut0NLoHNyoI3kj8OzweEnGey3FVZ1GK6WwopZhJuglDMu4Rb0HeA15C0THhrvUUc9LOoHZbv7KYSwqXWZY0EeS42X76qiugBZ+olBuWuKSSR6A0Tz2BbE81OXs6FHRjGdoO/z9e9/QZEo2CFdXf9h7jKyRd06HBRoXRFd4zSKCF1xWNtgd999kifcS8+9HBr7vnpEeaNVRqMv/CLMWNIZxjiNVZYSkdRgYCg9ZidevMpR7xUbx7Hf4en0aUrNILHiR8XGC5hdjjNvj6fC6wsm4/W1RekeF09hZR7VaCQttqCb8gs+YTFLKr62QnnWs9chy9g6Q/TbNBswk2ZQXhyhz6Qg52gcj/rMiz+Zn/65cuY9AanKOk2/9i9ZQASMqn/+YfdMdb4KAQvqAgN/iHphfjLTupTnYtfBst6U90bh5SstGPo6Ftd2m1RhVKHtzlJSLfuhJ843XRdN5mN/dPC+uoqjsVF+rQ9JC8R0fnt1hch37nO6AvP5h9Xkq/3OLtNj4rBZg1GKdDOWZ38BrmKtIDqvsjHaQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(36860700016)(35042699022)(82310400026)(14060799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mLm49lOgSDgCcUMH/7zIFeb5ztcM0tGj2oLqh4UPdDS+KysgVQ5z4vvZTpM8xCQbKiAAXyIAjGod0ptlcwKeNmrkzZf2E57DDu21mfKbmwGCD94y0Ztnpj5RGxy8dUfXUk35iiNLHk+G8TCS0NKxOEaGdIOG+Xj4hml0mOakCDt4NezzpuB1ejiocaQ0WzRRICDYXpm+eFVJcAWUKKsLsMihPPxqqwFodAOI22yM3Mwoj93psoEIjBpttAO21gp8SNSbbp1fsIvLtL4vQ2aeF6oBBIEHKpttzT/cUhJYv1+8AML0EjFH2AL7jYq3CQMMwYSbtOEpJ2oIDIqeiDKWbfa+FgeIoNCtB6XnwgWLanKYd9l8nbuz6p76PkV33rpRgZQhPgcF8eZTUSXdDaPfl3AbrS8UzXCtFzPhGdhmh5P40tA8KkTYeXKNj6kfP8F4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:23:02.3581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac50636-50ce-4603-d89d-08deff981752
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_082310_172126_FC35930C 
X-CRM114-Status: UNSURE (   7.77  )
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

SGkgQ3Jpc3RpYW4sDQoNClRoZSBkZWJ1Z2ZzIGRvY3VtZW50YXRpb24gc3RpbGwgc2F5cyB0aGF0
IDxtPiBpcyB0aGUgU0hNVEkgSUQsIHdoaWxlIHRoZQ0KaW1wbGVtZW50YXRpb24gY29udGludWVz
IHRvIHVzZSB0aGUgU0hNVEkgYXJyYXkgaW5kZXggYXMgdGhlIGZpbGVuYW1lLg0KDQpQbGVhc2Ug
bWFrZSB0aGUgaW1wbGVtZW50YXRpb24gYW5kIEFCSSBkZXNjcmlwdGlvbiBhZ3JlZS4gSSB3b3Vs
ZCBwcmVmZXINCnRoZSBmaXJtd2FyZS1wcm92aWRlZCBTSUQgYmVjYXVzZSBlbnVtZXJhdGlvbiBp
bmRleGVzIGFyZSBub3QgbmVjZXNzYXJpbHkNCmlkZW50aWNhbCB0byBTSE1USSBJRHMuDQoNClRo
ZSBtZXRhZGF0YSBhbHNvIHJlbWFpbnM6DQoNCiAgICAgICAgRGF0ZTogICAgICAgICAgIE5vdiAy
MDI2DQogICAgICAgIEtlcm5lbFZlcnNpb246ICA3LjMNCg0KVGhlIHNlcmllcyB3YXMgcG9zdGVk
IGJlZm9yZSB0aGF0IGRhdGUgYW5kIGhhcyBub3QgYmVlbiBtZXJnZWQgaW50byB0aGF0DQprZXJu
ZWwgdmVyc2lvbi4gUGxlYXNlIHVwZGF0ZSBEYXRlIGFuZCBLZXJuZWxWZXJzaW9uIHRvIHRoZSBh
Y3R1YWwgdmFsdWVzDQp3aGVuIHRoZSBBQkkgaXMgYWNjZXB0ZWQuDQoNClRoYW5rcywNCkZhecOn
YWwNCg0KDQo=

