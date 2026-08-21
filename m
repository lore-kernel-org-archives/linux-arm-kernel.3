Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141E3C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 15:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bUFTlK+5XU3ZDbFzawN18zGnh3Jrnh7ijODsQzHSPL0=; b=LGsC2I0F8sOrQNvKAnfL+06yZa
	FR865jc/Iiq0P73CJWxXv5RKSQRFEcmJJ3loq3651aLFNyNZNQgBv2ldSOcxFo/9pKUHXMrnMeLQN
	keFDFZfzxH3WQqU/a6ogSJQYLwoYSk63I7738ANdevEUa4c5Q1LP1RCn3kWh0FViqdoElyDk5BQb/
	jc0KMVzMxtQNK15QjkbUmNJuWaPeD4cVaNZF4EfdkA9ETQp+aKFAsdBjnCXwtug5jLnRKP14xnDQs
	icAhU/LZZVMHJoUnORcut6CxlgwLogLzfljVEGHDn6584BuI4uP/zhf583pi34qhgRlCPQXcQgPlr
	3xJhDzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxR6l-0000000DfkZ-0w5Z;
	Fri, 21 Aug 2026 15:24:39 +0000
Received: from mail-northeuropeazon11011051.outbound.protection.outlook.com ([52.101.65.51] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxR6h-0000000Dfj9-1Zj3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 15:24:37 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CjBdwLMg+qVrP+L8fyMAx6TU2G6Hc7Gd2hWz4Gw7x9kLPCek2DRWFWG7SJg7ksVKT4aD6KBl2p0R9N9g8chRfOLZvaC7ARzr5gWVITqHkmBkZB7MvlrcbQ0r5U+jsu/RW7eWBcuntd7mlrmte0gYSjGCp4xGizfsFIQsgs5UNTI8mLJwojPS98i7OFAfO8o1NYIBpNmE7Q6Iui+l8Dt1ygiHIjTTpiZtP+Yi3ZPTuS3V4O9cTkMvtYXW7AuB3WvRycDCb54vVZdreDsBXNFeT2ATa/EJVo5KmJqVUpg5WT7TFGq87GgT7CFx9140j9qpOxwKxjaxs84HvAkY/7ahxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUFTlK+5XU3ZDbFzawN18zGnh3Jrnh7ijODsQzHSPL0=;
 b=mYk74xVVzF2ZQul7AAIVfR9sg/Vj4K31jXpcyKQVL7KhIRrMoskYr2VKCZoLD++/BHMtKO4938kCMSctU/vMLqh1n7PQsGN1ZJiqr2KrbaMlz1Jc8XNdWKugC0V3mhG4Kth/xi6or1dFpxEjpx8OgFJPYKhcNTz2BJWM+Jo+Tzt1b+IwEnJkcaO/3SrUk0bWTxRJuCu0acJOLZicxKDHDjPvO/eHfM7ycUa22cdDxTW+4rdtH5/7q4bOUMt9LdDTzFiMVr2nK5fCw0Ugpf9SASlAnxL5WcnqEerpUaLDM0luU1B8X0fBJDrW6N8GB3taZIYHR71xp0ie7AXowSho/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUFTlK+5XU3ZDbFzawN18zGnh3Jrnh7ijODsQzHSPL0=;
 b=gniUxe5Jz6KTeFTdy/QUcCgHe64/EG6RGbZxiSqGQdlIGmrfL9ETkY0W2wJBzOGp2L7xtu2cSMx2gtU+XfFITE9q7lZ6WTo6WGuAy6rj9XxW9v7OwWCRX+U3kQYuuTOOGCPwxwDAZlGZUAkm9UcaK5SfuDMwC3652E816zD3Rwc=
Received: from DUZPR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::9) by DBAPR08MB5782.eurprd08.prod.outlook.com
 (2603:10a6:10:1b2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 15:24:29 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::89) by DUZPR01CA0042.outlook.office365.com
 (2603:10a6:10:468::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 15:24:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via
 Frontend Transport; Fri, 21 Aug 2026 15:24:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhILjP4Vi4fJO/oCuX8z8vOFBKqNsuopKsWPu/GndsBYwc5M69eMr3BrlrZ/h/I1J9fNzIVHbqE8JGxZ194ivJ7u82A367D1ve6L6bdT6YyJYgjt5/vXktwgh/vQkkzZlagPuLbI2C9ENoZc1ys2tlj75XNUZScHlqVhIvbTBBp2Y8DCNO7HYWjHVQPeUatLdTsclhKgHvYIowzQTrjZ1Q0COoYgCJFY3gcI6+n2jLoxTrjaAxrOojUcXFYIXuXTMeOE4eiH5/GDs/mCzAf/WwBVfWBBJycsk1ihM/8Pz3UHAMePNBuSFADuVdPWds84lWT3cajnicac0rZIdJ4wIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUFTlK+5XU3ZDbFzawN18zGnh3Jrnh7ijODsQzHSPL0=;
 b=WhwR3F1b/C4wfB+v5tHJI/LyNHBA+zEGbFUuJ3WPgfVhem8il2lU9GZwp2ZGsqOhWMmWdL5AZIr24HPKwQx5JR1GI03jLYV7/NN5NbQF4vvx588LEtHUqDKyTpWAMAOrGKgEUN3e6une/3RAdlY4Z+hvXItiwPQ3uVoERVZVoyxXVQBVgPf3/RxJT0ea3WB8NADJM5PHruYfX6bdYbIx1KkZiUyflIbye/oJhWlZWMrhMTv3bHv7mi9K2tM6TFWxjKG8KJB+0kSqdVXnpEVg1qje4Rq1zKL2lCtwYosJ/QWbf71dyS6RAy7w0y5wGz4Za8wwp76VxhXlUVrVip+jvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUFTlK+5XU3ZDbFzawN18zGnh3Jrnh7ijODsQzHSPL0=;
 b=gniUxe5Jz6KTeFTdy/QUcCgHe64/EG6RGbZxiSqGQdlIGmrfL9ETkY0W2wJBzOGp2L7xtu2cSMx2gtU+XfFITE9q7lZ6WTo6WGuAy6rj9XxW9v7OwWCRX+U3kQYuuTOOGCPwxwDAZlGZUAkm9UcaK5SfuDMwC3652E816zD3Rwc=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by DU0PR08MB9052.eurprd08.prod.outlook.com (2603:10a6:10:474::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 15:23:56 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:23:56 +0000
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
Subject: Re: [PATCH v10 21/24] firmware: arm_scmi: Add System Telemetry driver
Thread-Topic: [PATCH v10 21/24] firmware: arm_scmi: Add System Telemetry
 driver
Thread-Index: AQHdMYEVwFgkeABKU025zUsfDKIZGg==
Date: Fri, 21 Aug 2026 15:23:56 +0000
Message-ID: <3D833E1F-E926-4753-9146-9B7085192DD6@contoso.com>
In-Reply-To: <<20260815232604.3730754-22-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DB9PR08MB8651:EE_|DU0PR08MB9052:EE_|DU6PEPF0000A7E4:EE_|DBAPR08MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a4fb34-fb5f-4641-a9a1-08deff984b5e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|38070700021|3023799007|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003|5023799004;
X-Microsoft-Antispam-Message-Info-Original: TxlS+2KLB874kBjPlM4CKi+WLx5kRV9pvCnP6uE1o+kZwMVwT+2JvVjTOcxiMmZaREhxkrutoqzcC2oL2h+WbNfjXPFv5KM6Qa6yGQei5CmcSrSRJwFJJ3MSBuq47RHaKhyHglFidraSwQ2MrMbyv/z7/bEBPwrk2XnQnKvfc+mH/rNtemykcIkL2iIAgI++4bt1ie3DFnCs6rtNYN3cbxpcX/PHnvzCpUp7+uDyd5R6Ab4Adni3e4Sj1dYs1fPTx1ytKaJxowpi9kyEu4VWz1UEyCc/LGNoH5XSMFQKnmAepWO9gjqvWgmVOYWeadAR2hQeiht2flZj/Si8r9V390OwL9dhIfcnMz7NRISjmjPUz1LGXsZZ7wqeoXiZPHZTL69BK3vSNGotBuRqlsh7Ub810+75phjYo9ZeQQ0wfDYEBR9kve2eu4rKGLqZ3avjFpe55WntGTuDGPZZLUF8NJ9hOOc0omfN0V1udKyRUiXpkyH/FOzbw76sUD2VU+Ryt79JjcL9aQOv50dK6/BITQHLYKfAUQFpy8uBYkWJ29rICZpXB7rTZyY9H6etcw0aoaQ/0weDHlF0DUe48T/qfqPReEKHZAbtbZazeMiEh0iJ9ftZ5mfZahVb9Hpaw9dnNR3Q0GIGWM5qk0jik3PHGz4fzVOWdffIxXHW8rAWM3J4bqSfC/wT7LMexxDAGaWHKiGIIo7XS4k4ocv4ihbWbszMMrQ2EXr2YCcinQl8nfc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(38070700021)(3023799007)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(5023799004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0105FCB096AF7C48A8C025044392B4D2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DpNx5CuVnNPWar+/WJ7Oy3BcSi91YrGlm9H/kOCMdRgWRkCFzEPQEnIvpQ4NNWp2sW7YrppMfIIuNan0mMce8ABXSbOyY5+6aD8Ozm2BZcBppYR9V/ijcF1H5Eq2ixsPkW/7TPjFxyP02vVTHSep0o8YETrM59YTq19jHfEZXRrKATjmYBW16zxyogQ/5Hd8Lll9FK5UIISZp8s/SZOuhw+nEK2SDZ4A2TiVdiNtPT3neFyMcxEcCTwGvfVejlHifmymuX/0+H3hnkmfrgZy6Xy0H1pBfIRvkqfqk6kR0x5PxJwsD36ZHN7bE+wNkKqgE6tfypWUDcwbiJJQ0pfQNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9052
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4257578b-f921-438f-79b6-08deff9837ac
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|14060799003|376014|7416014|23010399003|82310400026|1800799024|35042699022|6133799003|18002099003|22082099003|5023799004|11063799006|10067099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: kiqGP5+fygT4Y7SDp0bP2ch051vdCRIRGQ3L4lTXoqO2aduW+M4QDbFHGwor6ZeKj5Pi5AGB69T00wvg190GBzOScyJz1fe23yPFsLtPpHofG63ybTf1WiclDXjTUpMWoPoVkT1ZQhBSwLLBoBTlQIJsbCUZP9oIwO2siXMk/pJIuJpL1/U2I5tcqgPD7UdEbPbBCLfEMzJwlclBnIUU0Jib80X7LbWYga1KWNB8dqtT02Tu3d95N1yBNlDfVkj6Bhz9lH5yi3Vn10YlUMDZeBYunb+epmrHmkLeDZhgANsCRxtVsAh/UIRGg1C6kJEwS/IDIRoQBYGVZi2wIflCaNCQuAnsISbqBeHcRzrF2S1bH6jrQQrFtkpIPsn6JjpMhNwQ9TQE/1j7iRAitz0biAsYvaonpSZ1WlabtShrtv+jn34vuFeh4gysP544GgAIDp+1qhuP1CRbmMMw9K+SJ3USyMZoI5CHDvMB26GOM1txVLHRrcjFfvcehFiPyghPU9fA6EEGp1fm9atVQ2OUmc/qohqkOwvFyzQelU2cDYdRSa3AxQXtSf6rnK5ZH2YhoZd3xy6U9vIdMi0UU0aB0vC08DZr1cSruWykJtCon+ZBKj4x6+AT1dG+mNsu5r+WkayfmQA1wi/tp1BSn9BUbqN1/0w+nVjpZz4lXExLBQq52/LK7Cv3EYPw8VEkG0GHKVGppETKBdAyT3d4Kpy0Tg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(376014)(7416014)(23010399003)(82310400026)(1800799024)(35042699022)(6133799003)(18002099003)(22082099003)(5023799004)(11063799006)(10067099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TBqVweQLZ55rPTu+V/AJZrzDH9JhGXhlyvGdwJZkJFtT/syMFN56V8588Z292HRHf4/xA/Tdc8kbywurclUpaJ/Q4a8MSXPN74VginreHt1GHHjbAbV0CgoNpMbDNLNi3Iv+fmgifvmDi15XS3aDRvhsx07pJSLw2toCHK8xy64StKdAFspgrqjdhcjE6w5MK7sKkRXtb7AG8rGP9JZg65emV6A+lELwv5uwY2hCrpMZYJ8SpDRFsxZGaG3sRR0Etb+Vbmkyn344JOjMYZGhwFhOmezWaYcC1pYZzPz8i9js+OtA+G1t5SVyOkWZYLWWugiF50UsYxfeVuxXrvI3Gdnw/0pSwieGWye4pSymrKhBNDHlfpj3DJhKKe6Q/Iaxx/+/u2iWY7IzqOZ9W4WVbxqjW0gaKAOJQXVOV2Bpp8jSq0XRrd32vu2N1FXefvvq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:24:29.6727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a4fb34-fb5f-4641-a9a1-08deff984b5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5782
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_082436_426188_41BFF392 
X-CRM114-Status: GOOD (  11.96  )
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

SGkgQ3Jpc3RpYW4sDQoNClRoYW5rcyBmb3IgdGhlIFYxMCBmZC1pbnN0YWxsYXRpb24gYW5kIGlu
c3RhbmNlLWxpZmV0aW1lIHJld29yay4gRGVsYXlpbmcNCmZkX2luc3RhbGwoKSB1bnRpbCBhZnRl
ciBhbGwgY29weW91dHMgYW5kIHBpbm5pbmcgdGhlIGluc3RhbmNlIGZyb20gZGV2aWNlLA0KYW5v
bnltb3VzIGFuZCBWTUEgcmVmZXJlbmNlcyBhZGRyZXNzIHR3byBvZiB0aGUgbWFpbiBWNyBibG9j
a2Vycy4NCg0KSSBzdGlsbCBzZWUgdGhlIGZvbGxvd2luZyBpbXBsZW1lbnRhdGlvbiBpc3N1ZXMu
DQoNCkluIHNjbWlfdGxtX2FiaV9pbmZvX2dldF9pb2N0bCgpLCB1c2l6ZSBoYXMgbm8gdXBwZXIg
Ym91bmQgYW5kIHRoZSBhY3R1YWwNCmNvcHlfc3RydWN0X2Zyb21fdXNlcigpIGVycm9yIGlzIHN0
aWxsIGNvbnZlcnRlZCB0byAtRUZBVUxUOg0KDQogICAgICAgIGlmIChjb3B5X3N0cnVjdF9mcm9t
X3VzZXIoJmJhc2UsIHNpemVvZihiYXNlKSwgdXB0ciwgdXNpemUpKQ0KICAgICAgICAgICAgICAg
IHJldHVybiAtRUZBVUxUOw0KDQpQbGVhc2UgcmVqZWN0IHVucmVhc29uYWJsZSB2YWx1ZXMsIGZv
ciBleGFtcGxlIGFib3ZlIFBBR0VfU0laRSwgYW5kIHJldHVybg0KdGhlIGhlbHBlcidzIGFjdHVh
bCBlcnJvciBzbyB0aGF0IC1FMkJJRyBpcyBwcmVzZXJ2ZWQuDQoNCnNjbWlfdGxtX2NvbmZpZ19z
ZXRfaW9jdGwoKSBzdGlsbCBwYWNrcyBzZWNzIGFuZCBleHAgd2l0aG91dCBjaGVja2luZyB0aGF0
DQp0aGV5IGZpdCB0aGUgU0NNSSBpbnRlcnZhbCBlbmNvZGluZyBvciByZXByZXNlbnQgYW4gYWR2
ZXJ0aXNlZCBpbnRlcnZhbC4NClBsZWFzZSB2YWxpZGF0ZSBib3RoIGZpZWxkcyBiZWZvcmUgU0NN
SV9UTE1fQlVJTERfVVBEQVRFX0lOVEVSVkFMKCkuDQoNCkZvciBhIGdyb3VwLCBzdGF0ZV9zZXQo
KSBjYW4gc3VjY2VlZCBiZWZvcmUgY29sbGVjdGlvbl9jb25maWd1cmUoKSBmYWlscywNCmxlYXZp
bmcgcGFydGlhbGx5IGFwcGxpZWQgc3RhdGUuIFRoZSBvdXRlciBkZWFkX210eCBub3cgc2VyaWFs
aXplcyBpb2N0bA0KY2FsbGVycywgd2hpY2ggYWRkcmVzc2VzIHRoZSBpbnRlcmxlYXZpbmcgcGFy
dCBvZiBteSBjb21tZW50LCBidXQgcm9sbGJhY2sNCm9yIGFuIGV4cGxpY2l0bHkgcmVwb3J0ZWQg
cGFydGlhbC1mYWlsdXJlIHJlc3VsdCBpcyBzdGlsbCBuZWVkZWQuDQoNCnNjbWlfdGxtX2ludGVy
dmFsc19nZXRfaW9jdGwoKSBjYW4gZGVyZWZlcmVuY2UgYSBOVUxMIHBlci1ncm91cCBpbnRlcnZh
bHMNCnBvaW50ZXIgd2hlbiBpbnRlcnZhbCBlbnVtZXJhdGlvbiBmYWlsZWQgb3IgdGhlIGdyb3Vw
IGRvZXMgbm90IHN1cHBvcnQNCnBlci1ncm91cCBpbnRlcnZhbCBjb25maWd1cmF0aW9uLiBQbGVh
c2UgcmV0dXJuIHRoZSBzYXZlZCBlbnVtZXJhdGlvbiBlcnJvcg0Kb3IgLUVPUE5PVFNVUFAgZmly
c3QuDQoNClRoZSBjYXBhY2l0eSB0ZXN0IGFsc28gc3RpbGwgYXBwZWFycyByZXZlcnNlZDoNCg0K
ICAgICAgICBpZiAoaXZzLm51bV9pbnRlcnZhbHMgPiB0bG1faXZzLT5udW1faW50ZXJ2YWxzKQ0K
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PU1BDOw0KDQpBIHNtYWxsZXIgb3V0cHV0IGNhcGFj
aXR5IHJldHVybnMgYSBzdWNjZXNzZnVsIHByZWZpeCwgd2hpbGUgYSBsYXJnZXINCmNhcGFjaXR5
IGlzIHJlamVjdGVkLiBUaGUgb3V0cHV0IGNvdW50IGlzIG5vdCBjaGFuZ2VkIHRvIHJlcG9ydCB0
aGUgcmVxdWlyZWQNCmZpcm13YXJlIGNvdW50LiBQbGVhc2UgdXNlIG5vcm1hbCBjYXBhY2l0eSBz
ZW1hbnRpY3MgYW5kIGFsbG9jYXRlL2NvcHkgb25seQ0KdGhlIGFjdHVhbCBudW1iZXIgb2YgaW50
ZXJ2YWxzLg0KDQpzY21pX3RsbV90b191YXBpX2ludGVydmFscygpIHN0aWxsIHVzZXMgfD0gZm9y
IHRoZSBvdXRwdXQtb25seSBESVNDUkVURSBiaXQuDQpJZiB1c2Vyc3BhY2Ugc3VwcGxpZXMgdGhh
dCBiaXQgYW5kIGZpcm13YXJlIHJlcG9ydHMgc2VnbWVudGVkIGludGVydmFscywgaXQNCnJlbWFp
bnMgc2V0LiBQbGVhc2UgY2xlYXIgdGhlIG91dHB1dCBiaXQgZmlyc3QgYW5kIGRlcml2ZSBpdCBz
b2xlbHkgZnJvbSB0aGUNCmZpcm13YXJlIGRlc2NyaXB0b3IuDQoNCnNjbWlfdGxtX2JhdGNoX2lu
aXRpYWxpemUoKSBzdGlsbCBjb3BpZXMgdGhlIGluaXRpYWwgY29udGVudHMgb2YgdGhlIHN0YXR1
cw0KYXJyYXkgZnJvbSB1c2Vyc3BhY2UuIFN1Y2Nlc3NmdWwgZW50cmllcyBhcmUgbmV2ZXIgYXNz
aWduZWQgYWZ0ZXJ3YXJkLCBzbw0KdGhleSBjYW4gcmV0YWluIGFyYml0cmFyeSB1c2Vyc3BhY2Ug
dmFsdWVzLiBTaW5jZSBzdGF0ZXMgaXMgYW4gb3V0cHV0IGFycmF5LA0KcGxlYXNlIHJldGFpbiB0
aGUga3Z6YWxsb2MtaW5pdGlhbGl6ZWQgemVyb3MgYW5kIG9ubHkgd3JpdGUgbmVnYXRpdmUgZXJy
b3JzDQpmb3IgZmFpbGVkIGVudHJpZXMuDQoNClNFVF9BTExfQ0ZHIHJlbWFpbnMgcGFydGlhbGx5
IGFwcGxpZWQgaWYgb25lIG9yIG1vcmUgc3RhdGVfc2V0KCkgY2FsbHMgZmFpbC4NClYxMCBub3cg
Y29udGludWVzIHRocm91Z2ggZXZlcnkgREUgYW5kIHJldHVybnMgdGhlIGxhc3QgZXJyb3IsIGJ1
dCB1c2Vyc3BhY2UNCnN0aWxsIGNhbm5vdCBpZGVudGlmeSB3aGljaCBERXMgY2hhbmdlZC4gUGxl
YXNlIHByb3ZpZGUgcm9sbGJhY2sgb3IgYQ0KcGVyLWVudHJ5IGNvbXBsZXRpb24gcmVzdWx0LCBv
ciBkZWZpbmUgdGhlIHBhcnRpYWwtY29tcGxldGlvbiBjb250cmFjdA0KZXhwbGljaXRseS4NCg0K
VGhlIGdlbmVyaWMgbGlzdCBoYW5kbGluZyByZWplY3RzIG51bV9pdGVtcyBncmVhdGVyIHRoYW4g
dGhlIGF2YWlsYWJsZQ0KY291bnQgd2hpbGUgYWNjZXB0aW5nIGEgc21hbGxlciBjb3VudCBhbmQg
cmV0dXJuaW5nIGEgcHJlZml4LiBUaGlzIHByZXNlcnZlcw0KdGhlIHJldmVyc2VkIFVVSUQtbGlz
dCBjYXBhY2l0eSBiZWhhdmlvciByZXBvcnRlZCBvbiBWNy4gUGxlYXNlIGltcGxlbWVudA0KYW5k
IGRvY3VtZW50IGNvbnNpc3RlbnQgY2FwYWNpdHkgc2VtYW50aWNzIGZvciBhbGwgZm91ciBsaXN0
IGlvY3Rscy4NCg0KVGhlIG1tYXAgdmFsaWRhdGlvbiBzdGlsbCBhY2NlcHRzIGEgbWFwcGluZyB3
aG9zZSBWTUEgbGVuZ3RoIGNvdmVycyBsZW4gYnV0DQpub3QgUEFHRV9BTElHTihvZmZzZXQgKyBs
ZW4pLiBJdCByZWplY3RzIG9ubHkgYSBwYWdlIGNvdW50IGdyZWF0ZXIgdGhhbiB0aGUNCmV4cGVj
dGVkIHZhbHVlLCBub3QgYSBwYWdlIGNvdW50IGJlbG93IGl0LiBUaGUgYWRkaXRpb24gb2YgbGVu
IGFuZCBvZmZzZXQgaXMNCmFsc28gdW5jaGVja2VkLg0KDQpQbGVhc2UgcmVxdWlyZSB0aGUgY29t
cGxldGUgcGFnZS1yb3VuZGVkIG1hcHBpbmcsIHVzZSBjaGVja2VkIGFkZGl0aW9uLCBhbmQNCmVp
dGhlciByZWplY3Qgbm9uemVybyB2bV9wZ29mZiBvciBkb2N1bWVudCBwYXJ0aWFsIG1hcHBpbmdz
LiBFeGVjdXRhYmxlIGFuZA0KcHJpdmF0ZSBtYXBwaW5ncyBzaG91bGQgYWxzbyBiZSByZWplY3Rl
ZCB1bmxlc3MgdGhleSBhcmUgaW50ZW50aW9uYWxseSBwYXJ0DQpvZiB0aGUgQUJJLg0KDQpGaW5h
bGx5LCBldmVudCBzdWJzY3JpcHRpb25zIHJlbWFpbiBpbnN0YW5jZS13aWRlIHJhdGhlciB0aGFu
IHBlciBvcGVuDQpmaWxlLiBDbG9zaW5nIHRoZSB0ZWxlbWV0cnkgZmQgaW50ZW50aW9uYWxseSBs
ZWF2ZXMgdGhlIHN1YnNjcmlwdGlvbiBhY3RpdmUsDQphbmQgYW5vdGhlciBvcGVuZXIgdGhhdCBr
bm93cyB0aGUgY29va2llIGNhbiBjYW5jZWwgaXQuDQoNCklmIHRoaXMgbGlmZXRpbWUgbW9kZWwg
aXMgaW50ZW50aW9uYWwsIGl0IG5lZWRzIHRvIGJlIGRvY3VtZW50ZWQgYW5kDQpjYW5jZWxsYXRp
b24gbXVzdCBiZSByZXN0cmljdGVkIHRvIHRoZSBvd25lci4gT3RoZXJ3aXNlLCBwbGVhc2UgYXNz
b2NpYXRlDQpzdWJzY3JpcHRpb25zIHdpdGggYSBwZXItZmlsZSBjb250ZXh0IGFuZCBjbGVhbiB0
aGVtIHVwIGZyb20gcmVsZWFzZS4NCg0KVGhhbmtzLA0KRmF5w6dhbA0KDQoNCg==

