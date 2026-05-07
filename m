Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E33CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdOjF2qB/6xl59KowtlFUPqccFTyDFRXhfPlT4P4TYQ=; b=1c3FQE4IqALU8Jk2KAWUi9kTIe
	+AjOiytI6HBCRgbKWxmMNP6NB8SwxTaN6VJ/XxVSMLilqeczqJZDxKB1hyj5bvyXzxifsvpYSvVBG
	nDuyx59sWg5fkMualwFa+JDOjiUn2HhKomdlvPma8CCSd3Io6P6EWReVFDA5EkF+DN92s1xGCDiHV
	D6onlXSz23E8Z2t7ZHIEvb+Pqm+75fprptk5r9yGIfU+oqr94+V1f9HHa4cBXr3XUJbvh4+/JOIBR
	aj0c4esolToq+YnolX4VrN1nlXihvZa67MwhypDlHJdzUw7JybyxBqnRAvuoitrwEFYmWFkJXzTmw
	S++tdvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuQA-00000003EwU-3Cd6;
	Thu, 07 May 2026 08:49:26 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuQ8-00000003EtY-0FnC;
	Thu, 07 May 2026 08:49:26 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LrzIIlxdSMD7x9GgwdFEqmS8X5mFr3kJJbUbtmAVgGsDayEmWhcZrDQjP8ztZEB5lJxRUvHfN6Gngn3fj0T246b8ulrtDDCyLZDXKT2Iq9YLW81SbcslAR/Epp18QaUxf8Lphg2MsiW96Z0P1BSUEcNb0zZ94DWBFcOk/9As1ngDaQDZ39FAlsUFcyyraOcUS4RTu5cYzY09CiY806R9LFlX8mX9e+LXpzzbJq/zOH2pEcDKAM7KPPbwpZBUM8YliC6MfOtluP8RTnBraBBdljklykMysv6XJMzWojCFt5SmswkMjmdlJNrb4GymClwz5gKnNl+OEUtP4ooBQmQxIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdOjF2qB/6xl59KowtlFUPqccFTyDFRXhfPlT4P4TYQ=;
 b=FrbnW4x2d6jsRtboZJkNI3pOlfKyfho/jrt+hmU2jxpHCzdtOVrcroHOB0bdBszbOd0hQWeKdO0ZqagYwfUnIeywgpd/tX3Tpavac5ZpRJEiitPubHUDMVswkYnTqiC8GWM/a6y2np1snour0TQiG/Bb3sdnEXhxTYHk7DY1zoqSgrPi5gCUDi42cp/BjcJMNLxbLc9SRIyOF36HcLmc+RLTbIQnkbANCZ+Htzw5OPaWWQ/mZ1Nyjy9Q6aVpwj1eUNtXidPPRoT2S8RjlhBPGJfaawhX9gw0yr0Uz2irYK14fe9A0SBlIfAQpSfvGVwstsxsu9Fl3iJCCAnmtHTrBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdOjF2qB/6xl59KowtlFUPqccFTyDFRXhfPlT4P4TYQ=;
 b=f4oEeXhN5OsAqiep31asgy2cTcoKP7t4e0kLvINIuLQt4DEtIy7C3pcMejc7NQG3yV10Vf8VidMnPkxtlUhVTWjU0g6dYHCErOdy1UMwiU9I7+Qc8tMzrBP/iqqXqqbY2Mu3ifr9e//NLBGn5HqSnwu25JsbPIR8oIB2Vwo1nIo=
Received: from DU2PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:10:3b::32)
 by AM0PR08MB5361.eurprd08.prod.outlook.com (2603:10a6:208:18d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 08:49:11 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::30) by DU2PR04CA0027.outlook.office365.com
 (2603:10a6:10:3b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 08:49:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Thu, 7 May 2026 08:49:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZ8W3Ewf+8jR1J6DF2CBjfX4k6fqWRAWmyQHN96DcH65s3lyceifX6GvmRXWwyc8rgCvgQufba3V33fJtms245saK970aWrkRyqnhfQjlhatGSQIlybCQHBaXC4B8Gy2EDs8+u/2UzpCsX1qqdQ3gcq7Q/PnbO31sCWYebRR/Y4x9cUozIX/m+RiBnelmfc2ZD1SsaB7MPN1evttxfHcRF8qHE7KnjfHRQS13mKTt8akHucTRxTB23Pd+BIh8wxUthCOX6hsAlp+9dZvPHSivjmP5pkUnJ4HhzxfXK+wpu+kh7WKEbhZhB+9rMYdA+4qlMkcnSv//kgLn5OYJW7q1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdOjF2qB/6xl59KowtlFUPqccFTyDFRXhfPlT4P4TYQ=;
 b=UK90tAj3ATrYPGybybc8EvZg8Ar4qaSFqnZ92oWn+AWQx7z6GFI/h2MPAvdqq5NVKWimbTjujSEcguC1Z0WXLNOR0TYFKHWyA9lt5URyjO30SVtmreEwAQwIx22/cVDN6m1Zigh92s7Cfp4EYKSDwKkSulgU0GrR13J9kC7/ny/DlRNs+AQf82mAL6CqmEZgkrhwyAiuLUnFxMJzTPOPgo65MQ93jFFCCC7SyFXiETT09dF3bbfWKKPrwudD2KgrE3CffPiZEAMTMhJ9a92MDP9AieuLNCLAVZO9H9vts21S0kiNXV3NcZiFQpAwYNSA7byWyol39Ur/wPtVKoOK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdOjF2qB/6xl59KowtlFUPqccFTyDFRXhfPlT4P4TYQ=;
 b=f4oEeXhN5OsAqiep31asgy2cTcoKP7t4e0kLvINIuLQt4DEtIy7C3pcMejc7NQG3yV10Vf8VidMnPkxtlUhVTWjU0g6dYHCErOdy1UMwiU9I7+Qc8tMzrBP/iqqXqqbY2Mu3ifr9e//NLBGn5HqSnwu25JsbPIR8oIB2Vwo1nIo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9996.eurprd08.prod.outlook.com (2603:10a6:102:35a::11)
 by AS2PR08MB9200.eurprd08.prod.outlook.com (2603:10a6:20b:59f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 08:48:04 +0000
Received: from PAWPR08MB9996.eurprd08.prod.outlook.com
 ([fe80::5856:8db5:9ee6:414f]) by PAWPR08MB9996.eurprd08.prod.outlook.com
 ([fe80::5856:8db5:9ee6:414f%6]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 08:48:03 +0000
Date: Thu, 7 May 2026 10:47:40 +0200
From: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, nd@arm.com
Subject: Re: [PATCH 8/8] drm/panthor: Expose protected rendering features
Message-ID: <afxRrBmHpHDeMhP2@e129842.arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-9-ketil.johnsen@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505140516.1372388-9-ketil.johnsen@arm.com>
X-ClientProxiedBy: PR3PR09CA0013.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::18) To PAWPR08MB9996.eurprd08.prod.outlook.com
 (2603:10a6:102:35a::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAWPR08MB9996:EE_|AS2PR08MB9200:EE_|DB5PEPF00014B88:EE_|AM0PR08MB5361:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9b7d73-65f6-45b5-9d12-08deac15822f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: +QsJBLenHHrYr//l4cHDOaCyuPLHvnPXhlDDQZoFdVdP/wu5D7tbWF1pz5ddkR1p8vaXk70hGqsYN5DOlfMu1xibq2+kkKe4JkIU5pG5HLKeRb2dLpAd1kOant/cC7Xsh+XAAKztuxejJhi6ff26u4hOB7ZvjdhZyJHSalQSPY7bIJmFs+pa2dVlQVaJezzW4Z9y3tlUSaM+wXiAlHYAsHbhoU4YPIU/juVRMirWOGj9hHCM+zTIetfsA2JvTXyHaY86spwjL1W9GtcaKZzGe/HLHYcL+gEu+O/cQXSoZtovTKJgr90eza+XJgqyqwlft7kSbe1NP3li1/D5ZQIiEWpDWDJkCKJSuuzr5cXePvX3Wvsu0LmsZPjMvGBeHHviubx/bWfgja0zTjXW5LF7dKQ9QayJCJYYozHqXDqovLHykHRJ7LHbbBevYd5UUAHukq5Wn2fxwcIopgWL//ft9k0ZCUbAarlSdgVEM0SZrsKxionlpljs4TqGfFTitXRPTA1C314XfIWiVCPjhE7OJxWxtw/699KbWu4W7LvUA7jASHdzMhQlsAjXJ8xum/S8sfgZftCM+jEED1+Ows1zRbUhyH5ijPxHo8mtIFGIeflPHYf2mkFNhs2qYY7otQYwAyaimxuJrq45eIkiAFvJubo+66vIqj2B83RBdssO8ey7wAvKjqUuJKlegrxFRLFV
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9996.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: p8+RXVeFFv/eg40WlNJ1BentIoMSf2tJPYVmAOZWaL5r0q0bmsSHk5/yUii7VsVj/D3pqQJtxKl8lOTXG0G3aXSLPZXih7JtiSoXMqSV66WRWFFtU3CoVg9Daua0rua90aKnsmMknfX+u0vfCAmz24Y5Ows/uqi3L0yVbKGEoOgTJsHWrMLVW1SN8ALv3/BmwEKG+kXoaHpcYZLknF5+yeRV9hvIu6dSg3PxXEgRdvKVDl1ZSpphs8U3/S2xE2mt/G+HblBG6mMjeVQG2hj7dTfI3KM48w/HBoEYxtaJlM5NJNiYpblWOV7ChK2eG3gE7z63wDvpjfAsoEgFq42DKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9200
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 83696578-d781-4b92-9af6-08deac1559ab
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|1800799024|14060799003|376014|7416014|36860700016|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: eYERf9tvqat5MMRsc/fyWdrs6iEOFhjWIZgygrPa6QI98hNISl9Y8p1EuYmejKs9h4SGTXsYV22JKZX9hV0TDO5iwOFQ8ip0ChjDU9fckrq/gbsZ2+qa1PvX3GJUP9X9QZpKuC1qFu+hlO6OYEK1TOglO09xCzXgSNviTVsP4AD10xGYIJp4D2dCb5N9GHDk9DCjH4uc0Vnk+QxjyJWku/s2d+9BcTetZEf215yUuUzvwC1mEaLqkVpNJIvbY797SvLVe+JZsWB7cms9mc5V9/PLpycCe7rbnAz0e+p42ktqU5WPEp3H8pqRJMQOeOdBUzbqTqyhLrUUagJ5+b93z9W0NjKHbtzGC6SUWD/MsI15zXsQ/PUq7S388+nIi/zp0pHpBjJEdsoZTgfzqm8EObaBD2yNN0F+mWDZYsUn4xt1rpTTUxwbnXvkeLAH9glLtTo77bQrBBXm7knq90xibNKB0tBCmw5aVSkm9IroEV9f8g2SET26WioXHQ1IS8TFjfnH9CAR6LcGDWbRZttnYai7BlGQ6zdPNP1EMy8zACzcEgHWYP7m7FxE4S4f7NP+Em0Lg1tcYx3np8k/uqyo/fyG+I9I1JVBB0xKw+b13UdresiGTleKFGopVWonjfZWYrdc8IhtmKs+yrllGhYBEcOxq5qGepatqPRXToSuj8PPYt7wYtAgbJuiQtPrr8ah45dFICw6nJIbLa2pWdFbbICCW3FY7zlEIN0mbMctyAQ=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(14060799003)(376014)(7416014)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rt5Tqg+zLIHwLjtTOY+v5psTl4D/EQzvpCIr4yz4wrfocAebQPjY1P6qpt6F8dzSlkbcBKWg14MrZAwebnDpRgFAJnlZeR/Pb1Er8BJgxkTTfpHUimmdD/BrHW4AW1WE87qtrUk1wx6ag3Qoxt/oSFuiPbGLnnkAgXoH69GQXSs05FvEcDcAbHSaN+0iT68Yjs/1MIXyw5ypOI7qFrc9WHt9tReWKYoxwuZ2jfoWPmZoThldOzCPrTs8DJCvIcLAABYaYOObs8PjklyEL8FEQVOVJZ1gUC+0JUQ19XPM0rLXNRJjUFkH+wDb9YEfO78Ctjtb9zrP0gqBSwc1AqGZOfGfoRdO6JSl++URyvsraNvf3k4nRV16PMmoqanUPM3z39oRJnLqCVXp/YXKt+J3aw3t5dQE+QxN1XL+ysF837+tuW9faDe1QGmLNQVi3RFX
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 08:49:11.0559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9b7d73-65f6-45b5-9d12-08deac15822f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_014924_106191_1E321C82 
X-CRM114-Status: GOOD (  12.10  )
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

On Tue, May 05, 2026 at 04:05:14PM +0200, Ketil Johnsen wrote:
> @@ -504,6 +509,28 @@ struct drm_panthor_group_priorities_info {
>  	__u8 pad[3];
>  };
>  
> +/**
> + * enum drm_panthor_protected_feature_flags - Supported protected rendering features
> + *
> + * Place new types at the end, don't re-order, don't remove or replace.

I think this note about modification doesn't make much sense as UAPI
documenation, and for driver developers it should implicit, but if you
really want this then I'd change this to:

Place new *flags* at ...

> + */
> +enum drm_panthor_protected_feature_flags {
> +	/** @DRM_PANTHOR_PROTECTED_FEATURE_BASIC: Protected rendering available */
> +	DRM_PANTHOR_PROTECTED_FEATURE_BASIC = 1 << 0,
> +};
> +
> +/**
> + * struct drm_panthor_protected_info - protected support information
> + *
> + * Structure grouping all queryable information relating to the allowed group priorities.

Looks like description was copied from struct drm_panthor_group_priorities_info.

> + */
> +struct drm_panthor_protected_info {
> +	/**
> +	 * @features: Combination of enum drm_panthor_protected_feature_flags flags.
> +	 */
> +	__u32 features;
> +};
> +
>  /**
>   * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>   */

