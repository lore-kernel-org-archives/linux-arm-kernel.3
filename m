Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C54D39013
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 20:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqnOAzGDSGz/Pq5ltfgAo3nZdVI5jHma+O2Q3Q6f4no=; b=cGuzkJEFzRbCLqLIyfj2+2+suJ
	cMVY446yMenByELNydFYsRewpkq++jax6xycoVRBPRoMov7epgnNWCb0ICVR5zjB3H6yidEf9zNMi
	FrQfVoJQznw4Fcig3dEtVG6QK1ADQRrjvzyHIiuQx64z4ZD2Wn9rqxgKQ6GWiZZSn3dHxaTZWBmnU
	2kpPrqPdolMkMFt1+5yJH/KOT3bDd7qAGA4HEA6f2SdzZwNVjB4ixLGp7VYNtr9GxcsQjS4kZ+vMO
	lCwMU6pf11HIFTh4DUpw2KzBStTLVvk93Lg91/YyIS/409mY9SeqMHP3uGbzkTFPcWDsh3fXURAOC
	5RgapWsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7T9-0000000AcrL-1wIK;
	Wed, 14 Jan 2026 20:27:55 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7T7-0000000Acqe-1zQn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 20:27:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usrXFu4clLxUl5FUcpdC3ujFHKQXwOgtEKM2TG3rteH7IajFv8SG50ZUyusnKwTqmJnp4O8s1BMb6qzbtFnayKHJ5Uq+9tUMlwtGXyVAKBXfM+EnTP/MHZvy33iRFBkIfzaPEuW4P9eAENCuJ1+oFBpmLaemHo6JrdNB+KXko1dEKof3XXnxmWZR94LGOe9hpficz/g6fn2f0XDysQg/EWy2cX7kCJqTvdg2E3m4QyqL3LWwGE31CvK5fPgFbwogAWV8mmxMxbyNDN8VsC/kWdCAVzAWLt1EY/Z/mlbvZeuKf9IdKbhixzbFsYkPwozWtrGTdLTAb/l5QIJ1DloA4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqnOAzGDSGz/Pq5ltfgAo3nZdVI5jHma+O2Q3Q6f4no=;
 b=WEtLWeFeeiFvJXo+uaeFGuLBqZwlDjiiO0mVgBa9+w8R9lQUIVuHbmIHRxODityKr11wqEPQZ4ZlxMYIhR0L+aKjL6BbEZoRTNCcWoNx0Y6AXchCBDzYUyr59JiSvGxLSUwHEIK022ysLjEm45RHURroS7dCkOryM3EHA+ZAmsQ+Jj33VMxVWVQesK2152bcYg0+/KUZ+o+P4XGId5cYn2gEy8QpWHsgcqT1hQs5Z+lWPB8plote1bw6JZYcXV58er8XcBZeYRRQ+v5KODZexbs/RWyjfGSdDYiu9KyQuxtbYDej/kzaEyVRQ2/37pTNNu+LDrJjTvIdre4/xuY8OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqnOAzGDSGz/Pq5ltfgAo3nZdVI5jHma+O2Q3Q6f4no=;
 b=tgZemxMfYUcKEkCD8fIHBBqk3074QOViRbHw0DjiW0NlUQSYKkbjTRm43cNgpllyZeaRRj50vZgXIz+nfc1z70m+LYdDJ50bsdPKQITevG4hBZZGNfBlsWcqjP+on0SVjL1yq/qNHEpNvo3NFoNQSGDQQq5tDH5tWGKQHfuFwMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6860.prod.exchangelabs.com (2603:10b6:610:101::11) by
 SJ0PR01MB6495.prod.exchangelabs.com (2603:10b6:a03:29b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.4; Wed, 14 Jan 2026 20:27:47 +0000
Received: from CH0PR01MB6860.prod.exchangelabs.com
 ([fe80::eafe:4550:9685:b560]) by CH0PR01MB6860.prod.exchangelabs.com
 ([fe80::eafe:4550:9685:b560%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 20:27:46 +0000
From: Carl Worth <carl@os.amperecomputing.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Taehyun Noh <taehyun@utexas.edu>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, andreyknvl@gmail.com, pcc@google.com,
 yeoreum.yun@arm.com
Subject: Re: [PATCH 2/2] arm64: mte: Defer disabling of TCO until
 user_access_begin/end
In-Reply-To: <aWJN9JvJilmquWlH@arm.com>
References: <20251030-mte-tighten-tco-v1-2-88c92e7529d9@os.amperecomputing.com>
 <aV_H9h-nSM1HlWnR@willie-the-truck> <aV_7Sm96Zf1Gfg9v@arm.com>
 <DFKNU3AVF9EW.3GHYYELNT4V9E@utexas.edu> <aWJN9JvJilmquWlH@arm.com>
Date: Wed, 14 Jan 2026 12:27:35 -0800
Message-ID: <87bjiw9byg.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MW4P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::11) To CH0PR01MB6860.prod.exchangelabs.com
 (2603:10b6:610:101::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6860:EE_|SJ0PR01MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 9386b97d-c683-4b00-dda9-08de53ab60e2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTd3M3RZWnZNS0cxSU1YMjdWTUFOTXRWdXQzTWZsZjFxVmc0OThmMUUyam5W?=
 =?utf-8?B?SUFIam9CamZNdWdCdUxmVUxMeXdkcE44V3VJMHZaeVRrUjRMUldqdldsd2Nx?=
 =?utf-8?B?U2FFaEZ1ejZnbXFhMkx4V3d0NEx6ZEJhOC9mVVRZclFMUFQvd0hKSGdyLzFy?=
 =?utf-8?B?RFk3VG1FOVZKejVGajZTbFN5WVZ5VktEK3c3TkJLKzlZNTRvNWtJL3lNSStD?=
 =?utf-8?B?K1lKek1jUG9sRm45K3JjT0JTZUR4YTN2YUk3YWhmVzN1RitvYi9TSFRBRHY5?=
 =?utf-8?B?dkJtV1lPTTg3MWdTNjNIei9MWkpKUHREaStqOEllODJNaHZhbFF3ckFFcG4w?=
 =?utf-8?B?T3E0QlNUR3pzMVhvNjBnOHljREFXWnhld1QwU1oxb3BWeHh0bkNJdzVPVG16?=
 =?utf-8?B?SWhNaTRnTHNORDBSOExPeDVmNURnVWVwdVY4NkExNisvOVNhR2RYZlhyRld3?=
 =?utf-8?B?VXVHL3VBUmp3b1N4ejluNkxuOEltQnpndXZNY21FeEhndG5RV1BCT0Z4VldO?=
 =?utf-8?B?OTF1Z3FkdmFoK3M5aUNQekdGejNBVHZNYjlaWG1TSHdXUlNlWlV4cXJ5bW1w?=
 =?utf-8?B?dDdWRjR4SU1aSmxUOEJFT0FTSERMYU5iRzVnRFRJMlYzSHNPeDhiQ05teHNX?=
 =?utf-8?B?R3ZLOVJOb3JBLzdpaHpCMlpHQUxhSW1DZmVlWlkwODVFR0NFRUk0S0Zidk9N?=
 =?utf-8?B?NzgrOTE2WHpZRldBUXVMWUFYdXhydWhCeTF1RnRidmJhWEM5bjNTblg1eGU0?=
 =?utf-8?B?dENISzB3VHdua0hwUjBCNDlTNU5HYnZlcG8ycnhJdUsraEpWQ0Jaekk0aTl5?=
 =?utf-8?B?OWNCQy9weG56WVlWTG84MVRZWm1pZmY0QnR1WS9QTWpBTkZaekxvbWtYcU93?=
 =?utf-8?B?YTZmZVlFTFI2OG1SalJ5c0E0MkdUYTBaQ2JxbXg0ZmJPYmhhcUJkZHhmUHZX?=
 =?utf-8?B?cHYzRDc5cnk2ekRzbkx3NUVMdmwxRW5GcERaUXRkTHZTQlJxT3VlRis1dU83?=
 =?utf-8?B?RVozSEZzK0VycXE0RXNtR3ZsR2ppb1lXTTVtTDRjbzhIM2E1bGQrVzAweHFD?=
 =?utf-8?B?TjNwek9TbGRwc1hKa0hUTk4rUDB2dithcXFMTmI2QmlCVTNrc2dRMjQrSnhE?=
 =?utf-8?B?VGZPNGh3OXE2dVV2bkR2M25qeFVZeW82RmUrNzBEWjFYbGM0d1NKOXo0a0VF?=
 =?utf-8?B?M3h6WVJYeU52VEMzUUdtbE16VVo0SWl6SFVueHNPWFFLQmlyOUdtQnpYTkhF?=
 =?utf-8?B?ZnRPT0tnb3dpa2V3SXRoWnB5UVJoQVR1WXQ1R084TGFTSWFyNndJL2dkd2pE?=
 =?utf-8?B?Y2J5c1RjOGdpQnF6SmNPNXBES3QwL0N2NTFORUE0NVFqMEROdTRMVll3VVM1?=
 =?utf-8?B?WjNhcVdGK3RVRjJIK2RJbjJNa0tyaTFlVERJektEOGViMDFYa21JT1huRHJk?=
 =?utf-8?B?VG5lei9SME83WlZVUGtONU5tb0VNMlg5UnJLbUxQL0dnV2tkYlIwYnpSMGtk?=
 =?utf-8?B?NVV2eDNRNHg1dUxzUWE5MkQxNk53YlNBRFZIaWpVQjZZblR6dWVVYzdRTVBv?=
 =?utf-8?B?UjZBSWZIUVdIUWdRbk5vQzdqWHFyVWlwUnBxZWdTZEl2b1RNUkE5bWpSMysv?=
 =?utf-8?B?WkJZNXUwcmg0SVNzWE9vREpKc3hxa3U4N3lqSzVkZ0NwcVJuWmpkUysyWTE2?=
 =?utf-8?B?alpMbTN5Qm1vRStEQ00vZndRT3ZjQTNTQVI0c3ZTdHZGcGQrSkUwQjRoM3lT?=
 =?utf-8?B?ZUltRHBpaUpWMEpoa3pmWGVHOXNWMmNudTZaR29XMU41c2pwMzc0NndNekNi?=
 =?utf-8?B?cVFkWHVtWVRsbFBua0NsZVI1QW41Rm5MTElma29RQmFnd1QzeGJUSUNRWlls?=
 =?utf-8?B?MnhKRE9wb3UrckhVVEpxcjAxRVhSK2J5bERTMHByYnpUUnhxVEhtaitNbjVJ?=
 =?utf-8?B?bUE5dmhhR3p6UTdObWJOaFJ0VytUS3hUck1FNFE3TmN2SlRuWXhMUUoxdU9G?=
 =?utf-8?B?c3FDQ2thMGIrY2ROZ1dBNHJDZ25ia1hSNHZaNnhwNWNCRFNoOUlzQUF0RkQ0?=
 =?utf-8?B?T2N5Q0NiTXExMURXRUtOUmNGcC9pVGhkZ1lZME1tNDVkNTZBcG5oQUV4RzVM?=
 =?utf-8?B?ZVprbXJzNE5tclFYYkljMllxWlFFbDJMbmk1NkRSd0lHR3JycWQ2eFRZZUNY?=
 =?utf-8?Q?xXYy0q0bao1uIdH9KoaCNoQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6860.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWYrMHB1M1phOUdndjg2bFBGcU0ybzdBMk9taG1MdUVReXlxaTE5bjBlYVhC?=
 =?utf-8?B?cWtpSzNzQklxMWc5SnZtS25HREdYbnBBbkJNS09DeHp0S1V0a3pNQU5PWEdo?=
 =?utf-8?B?aEZkb1VDQSsrY0hiUlIrdCs3WEFRUmNtdldGeGI1TDNCZDY4UUZqMXZTR2My?=
 =?utf-8?B?cXp0RmZYSkVVODRPb2l4Rm5ndk85VGxLa0VoeDJqSTRqS2VNVUZqQ2RmTW1a?=
 =?utf-8?B?Nm5OUFVPc3ZDTVVoa1RJUytnVGxlNFFPK044N0drNDRIeDhLekpTaWdrdERZ?=
 =?utf-8?B?SzBsR0NMVkdCYk1sMkJINVVxQUd5a1pqbDVsdUpaU2NSclFXcFNyM05SL1Qr?=
 =?utf-8?B?Q283aDdhK2Z6WjFPUWQvck9iZU00MFE2aGFVOHB1OWZlRTQ2ZlkvTnJWVEd4?=
 =?utf-8?B?YWE5UWtTbng2WGMxYzNsb2J5cmwxSjQ4QmwySmN5dU55QThWOVkxTlNtTm9L?=
 =?utf-8?B?Rjl6UlJrMmgzK1BTa09CWU5GUmZjMXNIR3VtY0tGNHh3dS9MdDFDSDZXMmow?=
 =?utf-8?B?K2NLSDlPazhDUklDSTRidnRvVlBsMXJIYnFtR1ZkazVtQXd2Q2RhbHl5bjhl?=
 =?utf-8?B?c2VuTStybjVzTUJkM1h0SkpaMi85NjlBL1d2WnNpR1VpN0k2dzkzc2tKR0Rl?=
 =?utf-8?B?Sk5oa0xhc1hEWmZCelF6bFZXUmNXaTdsczJXZkFIbXBmcGhmSytpT1dMOURm?=
 =?utf-8?B?K3I0U1ZMY2tVTTZkRkF5dmQ2Ym5NYW9Jajh0YVZxK3JyZlRXektwQ1JwUWlH?=
 =?utf-8?B?M2N5eVVHU0pBdFBocjZEaXhqbFJXRFhsVkpYenVaTm95K2xIN3o1WVJkb2JH?=
 =?utf-8?B?Y0Uyck5lSmZ1L2p4M1l3MDNRSS9EK00rOC9HSkdOb3UreityL1JrK09FQUJN?=
 =?utf-8?B?YWx2dUN0UzBNOWJXNDlxdncvWENHWHpGWU1XOVh1MTU0N2YrWURLaUthdnJs?=
 =?utf-8?B?alJia2VBMFJaV3N0N2FBMlc0VkZmZkVobytTNmhqRzBBSGR1eTgya0VxQjU2?=
 =?utf-8?B?cExLbEMzRG9vSEF3RlFjbnRWMUN3aWhqb3lGRHIvM0FqWjJJNStIL2ZMT0Uv?=
 =?utf-8?B?NXhLR3dtcWUwa3RMOFZQeHBJdVhDb05QVDUvRVFLbEcxWVRtbDF2ZzRjR1h3?=
 =?utf-8?B?NlNBaFBBaVRSeGtwN1N3R0RGS0ZYQkI5OTR5MmZvOXI1amgrMmV3Ynlwa2d2?=
 =?utf-8?B?V2lVc3hyR2NpOE9hK0RhV3lYQUtvUnRHbDNjZHJRbXRlTmU5OXNhUDR6TEFy?=
 =?utf-8?B?NUk2dndoMElVWUpEdkc2OVVaNlZ5UXo3QTZablJlT2tZUGJVMEtNd0kxeDgz?=
 =?utf-8?B?cXRUSEVTZzlUdkVLOEN1aWtxam9YaVR3R3RSSGd6c24wL0k3M3lxODFRd1k3?=
 =?utf-8?B?cGtZOGlDZDlwRUlLL2o5Vms1THBqc0VNTGxhUUFVVEJudGxNZ3N4YzZ3QzVU?=
 =?utf-8?B?UmUzdmVSYzlzdThKcFQxSkVNUjRMc3lCb3RhNWVXcU1SOU1scmRxZklCSmVa?=
 =?utf-8?B?RUdDenllWVZYdFB5MEZZZWtOTnBpeWRNUEpLOG54VTVxRjdYcjBLV3NwVkx5?=
 =?utf-8?B?a09lYVZiNkJtVTZOa29aOUJ0WGwyUkc1NkNtU1Fra1pJMHVjYTZKQ2xXa3pR?=
 =?utf-8?B?SWY2OXpmYzZsdkNHRkRnVUY5UDRxYXVFZ1E1MWx4NGM2TUV2ZmVJNDRSVHVq?=
 =?utf-8?B?eGl0VERtcUxkV2gwRnZCa25jL3diS0g4MXU5S1oyT3dQRWlCRi9OeFcweDJr?=
 =?utf-8?B?N1NsOUJoZXBZSmw3OGo2TUN0OFRyM2UrTGdCOTNyOTY1YlZXRnJrRStkQUVX?=
 =?utf-8?B?WGhucHZIZmJKTkd1dGlWajhnbUF6alFqaUJKT1ZPUFVKK084VHFUVDQra2dv?=
 =?utf-8?B?cjdNSXNwVXEyS1k4K2c5RFMxS1hMcGZLM3JEWDNFTTlzVmpieWtLS2l0b0Qv?=
 =?utf-8?B?NzRBQmRtS3h3eFZBeHBmcmpmeWNnTWVqQ2FNSEU1NldRTzg1OEROWC9qYkFo?=
 =?utf-8?B?OHFobTVZY1VJSmxLNUZ2SkRiMUdYUzJiS0toQk5rdHpFdDRiTm9hbHErRkFa?=
 =?utf-8?B?TCsvRG1GZW15SjhrSDZyUmhNaFE1Y1Q0SThIZnBxNm9uM1ExOEZNM0V0Vi95?=
 =?utf-8?B?ZmpvczJzSkNITUROTm1LVjgweEhBb3AzNitzVzNBM1pNd09mZWl3Q0Irby90?=
 =?utf-8?B?QkhyMWpFc3RyUTJJU0hYdWNpNEFlK3d5QmVkaXFIanl5a2l2QTVXUUpBcTFD?=
 =?utf-8?B?Nk1oeGpOdXhKcko5VmViZHVvNGVORW54cTB4Y2RKYi9HYmlyL09kZ1dDcE8x?=
 =?utf-8?B?QlhxOGxreStaOUdmVGFBZ0g1VllCeGpHeEJmcldoT0VHbHE2UG5TZXhNUkJB?=
 =?utf-8?Q?GXqG21uNCkyKwbWc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9386b97d-c683-4b00-dda9-08de53ab60e2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6860.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 20:27:46.5378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYSQ+YH4z+RHLYEjb/9cQeUrGyfEB3QT3oscKLZ2TnFSNukooK1XYk3fObvwSBykkcSBj1BstjR5dxLaHIDZ9H0fQ6WRxVBSGX7sVevQEpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_122753_525601_DBB39F2E 
X-CRM114-Status: UNSURE (   8.77  )
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

Catalin Marinas <catalin.marinas@arm.com> writes:
> On Fri, Jan 09, 2026 at 11:29:29PM -0600, Taehyun Noh wrote:
>> Our team agrees with Catalin=E2=80=99s TCMA1 solution. It disables every=
 kernel
>> tag checking but the user address will get tag checked as far as TCO is
>> clear. Also, Carl=E2=80=99s initial testing confirms that
>> `mem_access_checked*:k` counters drop with the TCMA1 patch. While we
>> haven=E2=80=99t run the memcached benchmark yet, we will follow up with =
those
>> results shortly.
>
> That's great. Carl, could you please respin the patch with just setting
> the TCMA1 bit? Just add a suggested-by me (I could post the patch as
> well but I don't have the data to back it up and include in the commit
> log).

Will do. I'm just running the final benchmark numbers and then will send
this out.

-Carl

