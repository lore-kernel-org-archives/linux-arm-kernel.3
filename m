Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3B2C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpJ6tRtq0kD6QckM+vxr2/hQM/9cNm0GcMu4unLJB7Q=; b=VcZhCA6q1fibVfJEYD3mdtya7h
	9PN7Q6jfrI9GK5+IuIyWd/OVcYQuUI1yCA8gR9SYVu6s9QP+GitzWQMyFJf0/EthCE/wmGqSDKo5f
	061L8rDDAw7jq1GjyBDKi/FrHm08kN73NKMBP0iVliditmaGNZzOaT+7lNcwewnlOhBXoPlHRNaf2
	Y3vfBIM0n4zrFYuvjIakd+ewTVHEtZp0kW5u9TKmiPil0g9WJ+K4SRkrPQLCl5o9MGmIRHArzUJso
	MClWtt9Fek2Z+P38IPTt0wKOESYU50zYWH5R53/6hXoBaUEcGN4tMHcFbtwbCpoQ3S2oN0gBWVpzX
	IW5O6UVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhp8-00000003F9b-0VdU;
	Mon, 24 Mar 2025 13:26:38 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhmO-00000003ENl-3qpH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 13:23:50 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xY1sKIVLqa7q78SXAGCBjv8HwHtLtrDwzzRkJsnFpojs3xMG4g5DH9FKiIjo8127NviMojw28ZiqdiHnoOdIO9+AY+KNxS9yhdxmsH2NqlYv50ViefnD4AulZKLm5rkMBbi6MqJXETycEbYxfZVPrI+5iR6yywbTrxlAmMiga5hSWKIZ1b83AzOQSmLAFPKo6rz7086w7cmxJ8boodct8CIADOeEzlblMLN3ZP6pYCFwpMiZm2bKR2yxYrPZIsj7INoDN7S1MI8tAxwI+Yfi/UmgYpQYfQC1piXAbMBNg+dxlA011H7fj+I+O7EUEYEzIDFgfMK7MOsF4YXngXk9QA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpJ6tRtq0kD6QckM+vxr2/hQM/9cNm0GcMu4unLJB7Q=;
 b=FHu8pg/DPlr7EW/ZxU+rcMnNIHiyRLO/fhbuDivCWR7VA0JD42S6vkXW3gVVpJ9MrFj/rup+bPUKjZURnSgQqkdU3VlDvDifFfGCPt4BgtNk/c2B5x4Wo9mYqOgGQDIDof2ANCL2cCTuKdac5bnCfvObst7I72LicGFJX3Z3zjFzgtyqJpCMSVYsiVyBrLAGtw5r8Poe+sAelg9txnnGfmfQEx6q4LNjF6TnhxNepbiBZcqxdly3119E8FziXcB7DizVz0xRgMPSjaNoen3XhKeMSBdcmtgyYws+BtPBdL4Q6lhF0SLzEXlCCj0bt28bCKehcpuM5t6L+Vp/jYpGVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.33.187.114) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpJ6tRtq0kD6QckM+vxr2/hQM/9cNm0GcMu4unLJB7Q=;
 b=ImmGbj7kjzBQ809mQidBb4tit/ryp93TYZ62acp3SqHA8H/kiz4NLtphsDvFC5RQJJtj7laili8COfjHoi5UG+6Rzva46kcVlspUh10hf1NSgUhJhIuoV51+pp/Z4v4VKQEAXhebaTww7W586D5lPcfIZgIkGvzyLw2x9DriFkg=
Received: from DU2PR04CA0359.eurprd04.prod.outlook.com (2603:10a6:10:2b4::26)
 by AS4PR08MB7927.eurprd08.prod.outlook.com (2603:10a6:20b:576::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 13:23:39 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::b8) by DU2PR04CA0359.outlook.office365.com
 (2603:10a6:10:2b4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Mon,
 24 Mar 2025 13:23:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 24 Mar 2025 13:23:38 +0000
Received: ("Tessian outbound 55236bc907a5:v601"); Mon, 24 Mar 2025 13:23:38 +0000
Received: from L0d122db3d6ca.1
	by 64aa7808-outbound-2.mta.getcheckrecipient.com id 782A6F22-3149-4CFF-9D66-0A7BD2ECA59B.1;
	Mon, 24 Mar 2025 13:23:38 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-2.mta.getcheckrecipient.com with ESMTPS id L0d122db3d6ca.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 24 Mar 2025 13:23:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SE1uaICPaCTGVLv0/rfQP41Ci7MwjnUlCBXKPy7DCoo2X+UI5P73B7XvGjsRngz2fDgv2EaTxwrDVCi/oe4pT0RH7344znUaxIHx5SnRJom3+lDJs4U+l6LvDOuWWRJWLBzqDTE9xYF8S6Adfik2jtncQWGPDvhfjILuweXsH9dRF1zaDDJSUqb0xVmSo7+jmFN8ZQHDxnP9GUQFAWLm+XDcKjACGa+wnrjYVHXmXwt4aQyEGDUTKGOCY7OWv1/koAK5nmn0L56GhqtyqiatSCYENAws7VCPupj2La9u7zHC8ceRvG60DrhWHnHCRvrK+wFmd1NSWd1WfRCUO3coTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpJ6tRtq0kD6QckM+vxr2/hQM/9cNm0GcMu4unLJB7Q=;
 b=LCZsp0Vj6pUgm8Mb9DC+tCdVQRllWwLWC0FeMXLFn95OnZh0Ye3uaKFl2jE0W0KgEenJ1jOB/4k6Px45KZw7exyrIDHajPtaikY2/b+zVkSYBFbseHZ9DskdgCb0MYEC7JCGTewDIQpUEN57vH9Wg4MP3+odTxaAV+DloK6jcpmGkS6et+KTa/PngBOWNP0hcpIeSSHYgQVjk9ZSW8MyBCCtFfSdYzyJqrW9V3S5dTcugD+KAcNx03deAaxCoux6nb7szBTc1Q6FpHW4IHVnjNyDOUQnBj4oaVDw/Z+osTEN5mDflMZBfnRi2crNAMatjDR1bIgcQROpDE9xdMizHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpJ6tRtq0kD6QckM+vxr2/hQM/9cNm0GcMu4unLJB7Q=;
 b=ImmGbj7kjzBQ809mQidBb4tit/ryp93TYZ62acp3SqHA8H/kiz4NLtphsDvFC5RQJJtj7laili8COfjHoi5UG+6Rzva46kcVlspUh10hf1NSgUhJhIuoV51+pp/Z4v4VKQEAXhebaTww7W586D5lPcfIZgIkGvzyLw2x9DriFkg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB6636.eurprd08.prod.outlook.com
 (2603:10a6:10:250::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 13:18:04 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 13:18:03 +0000
Date: Mon, 24 Mar 2025 13:17:42 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"james.clark@linaro.org" <james.clark@linaro.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <Z+FbdpQ5wfx2sDjs@e129823.arm.com>
References: <20250109171956.3535294-1-yeoreum.yun@arm.com>
 <CAJ9a7ViuVntYL62q=WYPkFR3++cyufPdKUHm0FUAPyGy76pB_A@mail.gmail.com>
 <GV1PR08MB10521BB7C93822F5124F2D66EFBD22@GV1PR08MB10521.eurprd08.prod.outlook.com>
 <CAJ9a7Vgz+L+UYf8Yqyu9J5hp3AB3WPSKutA4AvR-OFdu8b-dPA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7Vgz+L+UYf8Yqyu9J5hp3AB3WPSKutA4AvR-OFdu8b-dPA@mail.gmail.com>
X-ClientProxiedBy: LO0P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::13) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB9PR08MB6636:EE_|DU2PEPF0001E9BF:EE_|AS4PR08MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1e179f-86cb-47fe-26f6-08dd6ad716c0
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?xP3/+r5oZM11HpHVs93rEHx7pG6PbiV3dwJMpJPGRXwbRlaTDPsU35lvVPSX?=
 =?us-ascii?Q?PqL8XIfAPMA9Pu06E6hcK83EdtPBgX1Z5jlG//pLD7ma/H43rPBeFmiPeKWe?=
 =?us-ascii?Q?N7Sg7tKUmtXokl/MTwut+QXTYoWzTr7hmOjZtWIsk/sOhyDm4vgVwca6QkYv?=
 =?us-ascii?Q?TKpg4m/hLbd9duYfK4w4vtPtqmZwRGN0MMuAaCyL3ioUtxijRpEdEnaqVgUP?=
 =?us-ascii?Q?CEsK4/FmOEGiCGd7MpoMZlaZEAKBoyU/o/LHbdGfouMbN3nHI08aPj+6h1hi?=
 =?us-ascii?Q?WjCrejEnO4ZtW4FiDgKh2PHdr2if4ciTvikHVaI0x0JOkMImGH6/3RJrbp6n?=
 =?us-ascii?Q?x+7DkhcXOhK9BrMK400edYq3vw8gIThD88AKhcZNJJFQYY5fzisC26C8BwEE?=
 =?us-ascii?Q?w0gniK99pRY3iWXaHjwS0CjHmT+K0fQv7yIfxmc4LMTtwITjyy6Gg8Bq0rpe?=
 =?us-ascii?Q?/UarN06ExfNmJmpEkDiB/HY8XetRBQjrOTG2sjKWN28Eqd20gvpcs1cbo4XK?=
 =?us-ascii?Q?xEIeJlwFErPHqJBUPDMmIk23K+hO/wN/LPU7aKDHn3tky+yRFR1Jx057OCmS?=
 =?us-ascii?Q?nE/AAXlaKatKSrv1QaLlj/RDzlHs0c+KuV2ksDH03pkbdNDLEoY6Uxthj8aj?=
 =?us-ascii?Q?2vLUpiwRr8b934E+AaPbhI44IV4RP1DKkdVjebVBxfpUNAykSg41yD8eb0xh?=
 =?us-ascii?Q?icnv7FZ9anei9tHwhFVYJ9bvTqg5kRdBONSQC/C5jk/v2O3ZUxUsgdmIgJr/?=
 =?us-ascii?Q?x0OIn5zRkoij4NQiUgS2gqpb+3f2XgFdu2skQZLoWje0dcrXhxt8wqXU71aD?=
 =?us-ascii?Q?dEfMBmjuzccRWcZB8VGO1zXZYwzQ1JQUZAqjAtDq6ysXG/wLe4PG0V2KDfxm?=
 =?us-ascii?Q?C2gKOdh4LpwoCZyj0ETtJJLGkV9rgG5OawBdhSzKlbyacknw0ZJ++bAir5CB?=
 =?us-ascii?Q?WE/Z/Npiv+BjeCEw9f8m8CO5dJyO4Me8a+PR29k8exltsbh6F1IeUDoDwBEb?=
 =?us-ascii?Q?ec2NhMGMFhRt3t8Ap9s9K735w4duo7Zfw01qznWWQSEoBMAiBq/kk+oKGhWK?=
 =?us-ascii?Q?VxrqR2aFMhHjyq0Wp9N2JPZv3B+utfFrGTu3imDwwm4Ky8HdvVv+fvy3s3Ic?=
 =?us-ascii?Q?/upbVtGyivjxGscSd5luRYcO0o0FhLJjSUJv0kI6XHXzuXIOsbSnYPkw0Ems?=
 =?us-ascii?Q?2x+qHmNbEpCEjo5Q+cgx1Loa1VrtMiI2yLWVjrrF+noo+ipgW2Gh7bpUf8Yq?=
 =?us-ascii?Q?kXY7FUElCdeaUAwlaCcqyZ6G7UKQ9tTZ7HNDl2ZhA6br6/cpGT3W6V92nnMz?=
 =?us-ascii?Q?mo+8EESBScaEQmh9LMl6TyeOEDu1L07ALcqkSs0PYUicYkMhJaPLeEHzcoRa?=
 =?us-ascii?Q?7unF2Y+NZH7vtg6+WPTtevd+2b45?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6636
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 18cac715-fe9b-4c70-fdfb-08dd6ad64ed6
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5JzV4l8F699QWQWFJzypHvEX8TLddBPr3dckDQlh6sLt4ObPKi7ZF/ZMGiF/?=
 =?us-ascii?Q?r4FkkhPAQPiZnU/+u4B2TR/iLq+u3SHUF8URBI8h872X4weEn5dfd30OELis?=
 =?us-ascii?Q?xQ8fRiPA8+qPc+XvN4iEgTs3CdhJbyVLG/L+xb1qM+RleEuf/OtZIZRLZJwg?=
 =?us-ascii?Q?GuhlXunlco5/0xvygSDWV9BuN1t6W4WLdfT+xqGkH4lk25tAQY0JQieT4pi5?=
 =?us-ascii?Q?yY0O1q1CT6KGt3RiDrdGM73JZ4dwOGifzlgTuUQewtIpXSt/0cksPQaXXNAF?=
 =?us-ascii?Q?GnbuSMe3Er6Ci7MN5glDP7JsBZC85Zf5nEIczUa0P16ZXdkmiesbVwyCeUOk?=
 =?us-ascii?Q?beSm7/FD/2EeAVGEkFd4kZnQLOPg2HG1ygtxaOJHoBx3zvXX1qe1lZykY8il?=
 =?us-ascii?Q?G4MEwWJruvIDRckk2yXNbQfYRCudFGHziheV9B7jTq21qseHIGD7uS2DqGv/?=
 =?us-ascii?Q?CD45Mh5N0b0+i2goxRNcGfjWY+FS7xByo6/+VWN0lRMfzIOPJV2vFXaeBDsI?=
 =?us-ascii?Q?0YRzr7+Mr0rBApzS2voXVk53jJbZLDypYmNkDYIS6oEqnn0twz9/1CaE5VV2?=
 =?us-ascii?Q?OJrXcdKmzyckiF4vKOszF1bptemGWIH73CUktX4a5jJBJPxtxbrbtdN3YWFB?=
 =?us-ascii?Q?CCOmsnt8+sILJ7iQHuXBKqLabZOFQKkPBLB6MHUxpSnCtn6hdkN+tZJj8xnI?=
 =?us-ascii?Q?urJYGwnDIisb/D39RrbHE4fw7AjZMiqoLD8QMJTmRQpFkfzs94bWaBply3ek?=
 =?us-ascii?Q?htJe0qLssdlj3o2oNKEAzeventMIMlcsBeyHRvQbpGSvGN9gyCLFPsAfMCZ2?=
 =?us-ascii?Q?WMG+jNHn+9yADpRte4d1UBU8Y+t+cpta0FQQsCJkjHBYBdjS5N/R4RXwmhT8?=
 =?us-ascii?Q?Ts7+LY+ybogf8Visveen39KY739T73M+Zv4CLZK5vfW+cAS0JUqopK1PesX5?=
 =?us-ascii?Q?oAviNnrQNdvck7EutG1f49WY8I2O2S99DzJyCRkf0ip1Ksf2N8pUZDsy0yIn?=
 =?us-ascii?Q?Ig7knWcarEGN6tC8/skNGTGsOrNuoIXrfxfaHaSfqhFQZ5mZyEq1pRlreXeD?=
 =?us-ascii?Q?C2c+1EW1ULE4zeatoBdK8sdu1qIHtmDW4+5Dml9bgARSYQW5X3YrMGzYM11c?=
 =?us-ascii?Q?xHaXF66aijpK+U1B+2Fi8ZRs2PUn4KH67RAqYZUxsqGvEo+xYDm3HH8J3xhP?=
 =?us-ascii?Q?zoi9frwQC0soqHYLi+dzllskS94toZiv58AW0RfB1AiOZAqaeM0s495kO171?=
 =?us-ascii?Q?K3K8mdgeoKdhb66Vl/N7rYtAlX4lcU1wfsaChaiD6a7t5/Hq0byLR6HaT9SY?=
 =?us-ascii?Q?llCJ3juE2c/efR5jZrJZbt5gCVO53ztt9uRUiud3DzwgIRv9Q5bcgaK30ynI?=
 =?us-ascii?Q?K3AoglNWB78mOGPxxZjfy7y+DIFlJBP7KKZiaLoY8czQdDT80XH7GPxaghP2?=
 =?us-ascii?Q?GzIz58024QHTyNcDHov3n4o2Wo2KQ+OT1rlQay9PFnL2g0epNUKVNmAjlkEO?=
 =?us-ascii?Q?iVBWEgEULoYU1Fc=3D?=
X-Forefront-Antispam-Report: CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:64aa7808-outbound-2.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 13:23:38.7901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1e179f-86cb-47fe-26f6-08dd6ad716c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7927
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_062349_101567_5624C78E 
X-CRM114-Status: GOOD (  17.08  )
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

Hi Mike,

> > > >  static void cscfg_remove_owned_csdev_features(struct coresight_device *csdev, void *load_owner)
> > > > @@ -867,6 +870,28 @@ void cscfg_csdev_reset_feats(struct coresight_device *csdev)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
> > > >
> > > > +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc, bool enable)
> > > > +{
> > > > +       if (enable)
> > > > +               return atomic_inc_not_zero(&config_desc->active_cnt);
> > > > +
> > >
> > > Not sure why we have an "enable" parameter here - it completely
> > > changes the meaning of the function - with no comment at the start.
> >
> > Sorry. But what I intended is to distinguish
> >     - activation of config
> >     - enable of activated config.
> > Because, current coresight doesn't grab the module reference on enable of activate config,
> > But It grabs that reference only in activation.
> > That's why I used to "enable" parameter to distinguish this
> > while I integrate with module_owner count.
> >
> > > >         list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
> > > >                 if ((unsigned long)config_desc->event_ea->var == cfg_hash) {
> > > > -                       atomic_dec(&config_desc->active_cnt);
> > > >                         atomic_dec(&cscfg_mgr->sys_active_cnt);
> > > > -                       cscfg_owner_put(config_desc->load_owner);
> > > > +                       cscfg_config_desc_put(config_desc);
> > > >                         dev_dbg(cscfg_device(), "Deactivate config %s.\n", config_desc->name);
> > > >                         break;
> > > >                 }
> > > > @@ -1047,7 +1066,7 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> > > >                                      unsigned long cfg_hash, int preset)
> > > >  {
> > > >         struct cscfg_config_csdev *config_csdev_active = NULL, *config_csdev_item;
> > > > -       const struct cscfg_config_desc *config_desc;
> > > > +       struct cscfg_config_desc *config_desc;
> > > >         unsigned long flags;
> > > >         int err = 0;
> > > >
> > > > @@ -1062,8 +1081,8 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> > > >         raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> > > >         list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
> > > >                 config_desc = config_csdev_item->config_desc;
> > > > -               if ((atomic_read(&config_desc->active_cnt)) &&
> > > > -                   ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
> > > > +               if (((unsigned long)config_desc->event_ea->var == cfg_hash) &&
> > > > +                               cscfg_config_desc_get(config_desc, true)) {
> > > >
> > > This obfuscates the logic of the comparisons without good reason. With
> > > the true parameter, the function does no "get" operation but just
> > > replicates the logic being replaced - checking the active_cnt is
> > > non-zero.
> > >
> > > Restore this to the original logic to make it readable again
> >
> > It's not a replicates of comparsion logic, but if true,
>
> sorry - missed that point .

No worries :) Thanks!

>
> > It get the reference of active_cnt but not get module reference.
> > The fundemental fault in the UAF becase of just "atomic_read()"
> > so, it should hold reference in here.
> >
> > So, If you think the cscfg_config_desc_get()'s parameter makes obfuscation,
> > I think there're two way to modfiy.
> >
> >     1. cscfg_config_desc_get()/put() always grab/drop the module count.
> >     2. remove cscfg_config_desc_get()/put() but just use atomic_XXX(&active_cnt) only
> >         with cscfg_owner_get()/put()
> >
> > Any thougt?
> >
> > Thanks!
> >
> >
>
> The get and put functions are asymmetrical w.r.t. owner.
>
> The put will put owner if active count decrements to 0,
> The get if not on enable path will put owner unconditionally.
>
> This means that the caller has to work out the correct input conditions.
>
> Might be better if:-
>
> get_desc()
> {
>     if (! desc->refcnt) {
>        if (!get_owner())
>            return false;
>    }
>    desc->refcnt++;
>     return true;
> }
>

I think it could be with atomic_fetch_add(),
although, it changes the order to get reference count
(config_dec->active_cnt, owner) cscfg_mutex will make sure
live of memory for csdev_config while unloading module
and give a change to get result of get_owner.

Thanks for sharing idea ;)

I'll respin it.

> put_desc()
> {
>    desc->refcnt--;
>   if (! desc->refcnt)
>     put_owner()
> }
>
> and then change the enable_active_cfg matching logic to
>
> if ( (desc->refcnt) && (desc->hash == hash) && get_desc()) {
>      < set active cfg>
> }
>
>
>
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

