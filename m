Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F56EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8WAZg13/CfTa3/67qQ8rfOLksxPtJ2hWpbHSQXenEQ=; b=Y8dWkOchFHOZBGJCHXlfpD2HsO
	EXQvX+ii08Wea0DbKuozqft6fjZX4+/r4GoF+/ehID97Q8+gkmJAS33knrm7pFMqcmSNmTgi2Eygj
	kDza0YeCZjL4FeVQrR110cxItAYN5/iqcfRLzo+mHDy8b2BrJb484ubcVDhYIJv2caLm9tHr11G45
	vU1ezf8or1z4w6ofqU66XkbiCiRsUj0P2fYrJJGZqd+rv+0mtZHE1oct+2rPdKrMIplizyXxToJjg
	7op49AkqePQHQ/RD9PHB7dJ1YakUQzrjJVBJUe463RYtSp7k9m6iIwbnQVpHrYdCSkC8zmQunjJ18
	LiTZcLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5W7-00000000kL6-17BO;
	Thu, 20 Feb 2025 12:18:59 +0000
Received: from mail-dm6nam12on2062f.outbound.protection.outlook.com ([2a01:111:f403:2417::62f] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Ub-00000000jxO-2e1K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:17:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaOlCyw4T4ESYIV4K+FPYhYLXl1ecNTocu9VJ367jERVwzpCTmGKNqPGIUH32/hJuQPcjxcdq4wwXzQS4M7fwJTJ1GCjZ2A8flf6HzLOEaYDcq4/WRiLG34U2VAR7Tqcc8K5CJHAB5WsUA4ziQfzpFc8zFMkgpwg05mDM80hQ9BdoAc84GjJyTLmEx2VzO5u/Y4vopR5gLUWS5WqmY0MAPcwvU2LCuRD9wtfgU6036mGu6zjx18NPyAvIIE18IWkuAB4QCmBwuF+pSBZDQGEhcWdz+fFHtq7cokVjhPaIoOEItAlOwA4Mz0yaEkR5sk31r2zbvbh92nE2TEHzDsWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8WAZg13/CfTa3/67qQ8rfOLksxPtJ2hWpbHSQXenEQ=;
 b=b5V4XAnfzD4YA03m9FLUVCEWsKonC4ZtUheF/iNoNK1ar2oxtoLF8o9PiiIC6TO2Xvdu6d9Q0pFPpc3DHJrABqCe+XRjKpU2UPlHSP1UJBzGbH6ZqmIm73w+fMu4zMOEnD2kpc9+RPY0D5ogOkw6rluMQhS9q/RTe3iII0UTvXk+7E2HI1PNVCpdkfjrFVddyf0ba1Wxbw+dJkTVN17atT3MLfz986+cWwCnfPUkTv1IzntkkoJETCKPZVMMJH957/3rqyYWSabNNtrHSYCUhX4HP/q9sOsDeDEwJ9WsJqjh5623zxk8k8B0pXg1iuM6wF2wESJRV3tMsKcd+OXsLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8WAZg13/CfTa3/67qQ8rfOLksxPtJ2hWpbHSQXenEQ=;
 b=PL02xjL2B9CrM1g4jxoPcTKADsoLXSRLS2XOlrKaONK/Auw98l9QJ471giwekkwcChRR06haFdD3Giyphp786EVBU8rzsSlBILKT5tqO4ZwQEjUcG0jctkotBExEXeqxsPvP4fY15Fy+GNySBQNeB6TOROMseOpfmwqFuHvAbTA=
Received: from BL3PR12MB6571.namprd12.prod.outlook.com (2603:10b6:208:38e::18)
 by MW6PR12MB8950.namprd12.prod.outlook.com (2603:10b6:303:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 12:17:19 +0000
Received: from BL3PR12MB6571.namprd12.prod.outlook.com
 ([fe80::4cf2:5ba9:4228:82a6]) by BL3PR12MB6571.namprd12.prod.outlook.com
 ([fe80::4cf2:5ba9:4228:82a6%5]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 12:17:19 +0000
From: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
To: Russell King <linux@armlinux.org.uk>
CC: Sean Anderson <sean.anderson@linux.dev>, Andrew Lunn <andrew@lunn.ch>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"Simek, Michal" <michal.simek@amd.com>, "Pandey, Radhey Shyam"
	<radhey.shyam.pandey@amd.com>, "horms@kernel.org" <horms@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>, "Katakam,
 Harini" <harini.katakam@amd.com>
Subject: RE: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G MAC
Thread-Topic: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G MAC
Thread-Index: AQHbOZPrN4QoHKQMl0i3DrWTLLaCrLK9McgAgAABAgCAAKDGAIAA6DIAgAAGTACAkbR4cIAAL+SAgAAG/0A=
Date: Thu, 20 Feb 2025 12:17:19 +0000
Message-ID: <BL3PR12MB6571DD63F0AEE29BF2CDFC00C9C42@BL3PR12MB6571.namprd12.prod.outlook.com>
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-3-suraj.gupta2@amd.com>
 <ZztjvkxbCiLER-PJ@shell.armlinux.org.uk>
 <657764fd-68a1-4826-b832-3bda91a0c13b@linux.dev>
 <9d26a588-d9ac-43c5-bedc-22cb1f0923dd@lunn.ch>
 <72ded972-cd16-4124-84af-8d8ddad049f0@linux.dev>
 <ZzyzhCVBgXtQ_Aop@shell.armlinux.org.uk>
 <BL3PR12MB6571FE73FA8D5AAB9FB4BB3CC9C42@BL3PR12MB6571.namprd12.prod.outlook.com>
 <Z7cVlwPDtJ2fdTbY@shell.armlinux.org.uk>
In-Reply-To: <Z7cVlwPDtJ2fdTbY@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=b1ff02a6-6148-4337-8fdb-a15800c31246;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-20T12:09:25Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6571:EE_|MW6PR12MB8950:EE_
x-ms-office365-filtering-correlation-id: 7a76c1c6-c441-4fec-4838-08dd51a885b4
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2gxpxFJNu/qTTjSSby97HeVyh1bIATLUYsSQslpGoUyc0fnAL3YJX/LSMPIa?=
 =?us-ascii?Q?RgEFMfgVCNVyc7D7oY7r1SrAO2P/7yqytPyorYcWQnuQWK3PkcOLWjgjovU4?=
 =?us-ascii?Q?XYqGZE0iMO3MwH+VtGRcATdwMeWGMngqo/Z8fu92Z4T+94iC23OnDjK4ag97?=
 =?us-ascii?Q?F6zSdNAljl3K9TZI+rBy4VRMhK+BoU46i7I4V/styhjnGGLl10vdUJE9ExSY?=
 =?us-ascii?Q?/js8ffj42U/+YXmkpmc4Y/Zwg6DaqaXLyHVPlXBG1jId6LTlDcAiBnNITX25?=
 =?us-ascii?Q?Vucv99KSCk13SSZ7wh47vcfP6McwY4idtcYaGEG6KZctU6cVNqwgfHMvemJB?=
 =?us-ascii?Q?4Mbhm76Td8wq+KbPgrTFzYn90yXO3ZSp4/kzkhZXEPgZfJ/Yefk3JOX5Bru2?=
 =?us-ascii?Q?0xbJAAsk9raqlEL/JmzzCIBqdQOY+rXty5FW5R+9SclN0hFqFjJaoWd3JCfO?=
 =?us-ascii?Q?JTNNgIRyOnYSsd5JyZQt4Ih2Z1H/AwLZq8flZbN3hnGnMQt+/lmAcCdUGNBM?=
 =?us-ascii?Q?+yi48A0whUjePle3m+RtSjvR0TPkPn1PVuL7+kO+nCPzTaF0HrCHYpMlJw+J?=
 =?us-ascii?Q?t5lyUaIUOzHQsWNVzP2ztLYXQlf4i+OJ2gaYnIN69GGxXDxbT8QdWIEKdMlC?=
 =?us-ascii?Q?cw+Grn71UlIl5mjeeEwMWicAlOEJZl1Yb2p9wQOLSBGmiGzXwnTIRZMAO03V?=
 =?us-ascii?Q?kf6iLFQCZyEuF6I+HXqwHWAqqyEFZoCv77GybmRJLkTZjKXW+GY6Zb512/iT?=
 =?us-ascii?Q?hn8UZKU9cD8iQCFz79dl74SDB4nM5yrRE6qvDGfSXwAuQd0hTj6wbFXV20Ub?=
 =?us-ascii?Q?6kO3fz3D/z8dGSPdALpc5EkcL/XPYcH1VHv/REAPEbmeJvdK0Yr6FznezWWL?=
 =?us-ascii?Q?y4C1d740FZV4Lkx2ud6tJUGkLyx/uJrQsj5MM2Ctymj44gFoGkWpX9smEpqu?=
 =?us-ascii?Q?sbe0kmcqpkDDnekGIQxAGSLQdhODJh+KPPsTfiBP9tGRiGJwgt+suJCMTeRP?=
 =?us-ascii?Q?LD/obB6ZWC4bA1Od6XPMfEEe6eIAesyWdwJBpVrXd9a+zTgvC96gWCefdm2P?=
 =?us-ascii?Q?TjwwabnhJvVSj5qEz4RNqBH3PMSLl7f7HOnhidLBi0GUVC4aZJDurGXA+zyc?=
 =?us-ascii?Q?jhzFzQCdaUfBY7f+rP0ngrhojTODcf7StMFY8UbN96GuEnyKuqz1NmtZPMqJ?=
 =?us-ascii?Q?WcaLtfTG2lzUgKAkRGUKerioyzQhgyqxWLWU3IbSGowubyYEqUEpe9VX7RH9?=
 =?us-ascii?Q?WaNDhu7+7dgni9Q/vfAEleLWHdAu/ZuUnC4ZOLIW2qiktt6G0tCSntVfeTom?=
 =?us-ascii?Q?t5pBAxLRXbljWcoUKKhr5+S30y0Rb3YL4WHaOMNNpd0WWALm+UTfQyPqc7+n?=
 =?us-ascii?Q?ZR6SvMmpNSx9uqJnqK/XwFCz9LdW?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6571.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ap/2w8TU4gZowO6HW7+noXv4LaY/stIW249HW/5qEHsbirkMeFzSjYdSDMhH?=
 =?us-ascii?Q?HGfaxipwvw1zhbl7SB7srJHt3gLuYzC+UHbo5VnMmOf2GZuca8HyPAP1NftN?=
 =?us-ascii?Q?sgfhwV8tYYynrNM/7l7IgHM8yh3rbBeL8Gj0qa+5n6W7TgStQqLhauTjCIPh?=
 =?us-ascii?Q?PtdZPmsyelseQOk5iPrr6HSCyVbcAGaqhjcVEh2y22i8SGFyJtXKvmjQtlk1?=
 =?us-ascii?Q?2ro1qAg09c0b8H9cBxByDNf5KLxnr3cTOHlo5yVfl8llsG0070HeO4BV/shg?=
 =?us-ascii?Q?gMuxDvGVolz2g9O1qqzy6FIZ30whwrb6u1V+y0aBJjYpGGiOAzgLGg86sAWh?=
 =?us-ascii?Q?vsMpGypY5yn25c1h1WEQ6UJzZstJoK/zFWzdtETcUah5XkWuDOX1BpwhBKQ/?=
 =?us-ascii?Q?XTagJSJig7oFsAuTr6GWwFgWQwUzKDUPDcJbBUSoztIbwyQ4afKKZmwF3Pii?=
 =?us-ascii?Q?vUAt+RksM3ZkOu/jTtf4IfOBU+Rls/eXvphRojAWeZot0HPKTEJZL/LtfJQ7?=
 =?us-ascii?Q?6US3sxa5t+IdavYPmhFkDBc6RD6l33t2gYmHMYxZHn1mMM37N+NvYRoLhixV?=
 =?us-ascii?Q?nENoYcsnsUGiGH7Ac1jkeoK9Y6H7kEV9b+pS1IPcauYDA4FhWYxRFzYrn3We?=
 =?us-ascii?Q?6ttY6B6hdnXuFISKX16MwD9yfVvNogeskv1pBJzE5MyctD3ou8BrivDyam7M?=
 =?us-ascii?Q?uiexrHGGDbJwQgoZ6ZH7r02iqIk3wbSSQ2PEEdk4Tq3mZfosL52LhZ7+bsGU?=
 =?us-ascii?Q?DsLM+DUDgxGxyM/WKu6qObx01FZV3V6Sk+KlCuCEx/PivbZRc0QPZCoYhK7p?=
 =?us-ascii?Q?LWb5DJVWn9Fg0bEMBv5xM6SN1OCohSVrYkQnnqL9M9wwtEjgaVai/7NES5JG?=
 =?us-ascii?Q?brv4kCDLxAAoDZn6eOMlp745f06Xju7C9gb0P6gpIrkeBibCLTilDzwV9tyF?=
 =?us-ascii?Q?Mnqj1dilMjsbNhupshMUMD26e3EvxRfh2zO9CZH20ubse/eYgaIQjJElwNnG?=
 =?us-ascii?Q?mbeOLI4ZctQU18TOk0n1wgPRX+iwl6iWEjh2H+dAZhUZlChWy7sQUaIFF9sY?=
 =?us-ascii?Q?vfxs8o6lhI4zCkKTCm76wy/4JjU21VPBA8jxUHcwtX6d43eFLwStZ+uj4wik?=
 =?us-ascii?Q?RthKQ5ITOTfFk4qjyl+CJo83rBG9T69um6EzcHxS82x+a5thzdzyjKZuCoTp?=
 =?us-ascii?Q?rhaWgzHOufcWiai/fcjb5YW7T+liBGxfeqBcNvXM301M3M+yLeWBeyUeHY6X?=
 =?us-ascii?Q?/QC2HkTNlIHLoNgLUctTNBamiKLpkRMp3bkjiGLJ668rsO2vd2VgupQGc9oM?=
 =?us-ascii?Q?VarzZ0rSqLLQqvwmtU/L9GeQ1R/urnNZ8smIL3bJKPCXIzGn5UkDOLkSdW/y?=
 =?us-ascii?Q?bJf3/xhxwqugcOFceXXeeaH/krG6IZRVzw/17R4s1k06ekO4Yq6V/kXB/OGD?=
 =?us-ascii?Q?NEINQyQyOebvMs7CZ3JEKVCQ4CnhNmQAjFzHKd5raW7HM0Cnu+nXwaw1rvuc?=
 =?us-ascii?Q?xraRiTlqag1JmBkdM3oHEbl0elN3AbTMTXYsw7196fhkZSbYILbLpE4lYbRN?=
 =?us-ascii?Q?GXdTrJcPFXOvw2NMfDw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6571.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a76c1c6-c441-4fec-4838-08dd51a885b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 12:17:19.5962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Or/+1UmxpoGT+BnBJ95Gv9pxH1H40MNpREDWLHLDEqNf4FitGWigkno1R/ruPTKeIIMljr6QAFHRMsCO293ndA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8950
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_041725_673650_348188CC 
X-CRM114-Status: GOOD (  28.47  )
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

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: Thursday, February 20, 2025 5:14 PM
> To: Gupta, Suraj <Suraj.Gupta2@amd.com>
> Cc: Sean Anderson <sean.anderson@linux.dev>; Andrew Lunn <andrew@lunn.ch>=
;
> andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com;
> kuba@kernel.org; pabeni@redhat.com; Simek, Michal <michal.simek@amd.com>;
> Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>; horms@kernel.org;
> netdev@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>; Katakam, Harini
> <harini.katakam@amd.com>
> Subject: Re: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G =
MAC
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> On Thu, Feb 20, 2025 at 11:30:52AM +0000, Gupta, Suraj wrote:
> > Sorry for picking up this thread after long time, we checked
> > internally with AMD IP and hardware experts and it is true that you
> > can use this MAC and PCS to operate at 1G and 2.5G both. It is also
> > possible to switch between these two speeds dynamically using external
> > GT and/or if an external RTL logic is implemented in the FPGA. That
> > will include some GPIO or register based selections to change the
> > clock and configurations to switch between the speeds.
> > Our current solution does not support this and is meant for a static
> > speed selection only.
>
> Thanks for getting back on this.
>
> Okay, so it's a synthesis option, where that may be one of:
>
> 1. SGMII/1000base-X only
> 2. 2500base-X only
> 3. dynamically switching between (1) and (2).
>
> > We'll use MAC ability register to detect if MAC is configured for
> > 2.5G. Will it be fine to advertise both 1G and 2.5G in that case?
>
> Please document in a comment that the above are synthesis options, and th=
at
> dynamically changing between them is possible but not implemented by the =
driver.
> Note that should anyone use axienet for SFP modules, then (1) is essentia=
lly the
> base functionality, (2) is very limiting, and (3) would be best.
>
> Not only will one want to limit the MAC capabilities, but also the suppor=
ted interface
> modes. As it's been so long since the patch was posted, I don't remember =
whether it
> did that or not.
>

Sure, will document in the comment and limit both mac capabilities and supp=
orted interfaces accordingly.
Thank you for your quick response and guidance. I really appreciate your su=
pport!

> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

