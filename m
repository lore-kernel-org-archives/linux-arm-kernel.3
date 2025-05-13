Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B917FC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzUazx6iBs64AEsyxJAiqGGwIlTSdMC1yjC1DXGxq8o=; b=dE6TP5y/ro/S6j6wRBLYOGLj8q
	bc/4+8BdoGgIL0TtqDQkFRe+gUeL45wtjD8dr8TfEAvf+xWrqKsd05gCeY6L/CBG9luQ4qoGrHn+D
	K7FKTWFvFbTS+lUHaKVg04M5LAE9UBtdUCBT8XaCWJAo0c5REjwAzWC8y7yRFMl54JadBjGNooI+o
	hqXUc9pX1OEUhi5QaGYgWdD7sHEJUMFfq7oFIxJVPnbClYEizV1hXsFh7buYcUtPY+fmHnRUVBv4N
	7LProzX3+R3n2jX0nFX0e/ZA3yG+shYuS33Srl21FkU4bOvVuXSOZ+FPYmB7L3tNLL+rudasvb9xP
	uBqSJXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uElCv-0000000Bmpo-0s6h;
	Tue, 13 May 2025 08:41:49 +0000
Received: from mail-francecentralazlp170120004.outbound.protection.outlook.com ([2a01:111:f403:c20a::4] helo=PR0P264CU014.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEl7z-0000000BmEe-03xo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 08:36:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMlW9t5Rb17btrnSHnyQra5EJU72CpcnjtHNBI11+t1ROXvOBPo6856REeWFH4KYWWgRnmeudkmv1WPLGnZbsPXuoWILobXmPSqyx1nCNx1ASjm9xjWP6YA0T6WjG5pienzlaDUVQX1jmB0fF2Z9RsY9Gy3L5N1W+hIcGNVSiChN/hQjJWLCRRUNJk7Sms9bHToB3k8DBKNXM4sM2yeCOVD5L4vpK7AlakHlt8sqnRCvnTMkIlf+0xDFG5mAkfavHUwZvdmV1+zzmDm1F+nvTqwcZT3XLZDA36ZYMqJLH/lFr96+2SbLPZxL1pE8r+XYeoEifQxJdarS8SIlsX3eAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzUazx6iBs64AEsyxJAiqGGwIlTSdMC1yjC1DXGxq8o=;
 b=CjqcRTdxmi8tbB/khYEqG+KTqxbp3VaDvFaJEItI02n9yPdLJa5Xa/A4KLrNSR6j5P7EZDEicV7o5VSudxkudmwAB/LQwXlFjKPMpQMVJIf2VozyJ3tRjdxWmVvgmsNPXMAM2kUXARF2G/y0B1Yds3a+v2Vq5mGr2r90H0iemtNtX0Yv9fa36FqiYKZNgWCJlLxfa/I/iFZahn+VHBUaNCsnAi7BVMbs4p0Rjz35RVhZObmaC1ns873v8pS0PTgAfnpaJWg44kdXmx3b8/MEmbal6hBShSYpJ+zdqm9QEL57diHwghS/pMNF+0f8w8RF2MgTgyZMmHS3HmXfaSiY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzUazx6iBs64AEsyxJAiqGGwIlTSdMC1yjC1DXGxq8o=;
 b=wm9Y1sUSF7hekWY44VHBCG1E+gUzaN4TyAY2QArM8tDq5XKkiwzw3JV505mPmIYP83wHLoJC5YfZoiEUEjvZbrs1fNI9MFhqJFQmCztH+wtVEZOO3Xzrraw5wmMdfJ2vK1al9qJG6O0ySatxNMaRA5Nz0EhyEHkfyHlw7WcpunBazCUUPk6u1LJ63As4s57lko0duw8FVWS+grUdPQeF7buOj1Uh/CSsrQWAxKL8os/ENEnJoS175crMGzPJGKqa8sRt3uXvWHwYcnRZ135yBPzvKzIOZVl3jM63XfiA6O6jWKz5WrkVi4uoOdKVIoVpiyQ5dA0V6B0VlEZmTvjA2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PASP264MB5252.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 13 May
 2025 08:36:39 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 08:36:39 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Junhao Xie <bigfoot@classfun.cn>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 1/5] media: allegro-dvt: Move the current driver to a subdirectory
Date: Tue, 13 May 2025 10:35:46 +0200
Message-Id: <20250513083609.328422-2-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
References: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::13) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PASP264MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: d72f4944-6d6c-44b1-1eec-08dd91f94749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hpM0Dp9rrsFDeGI4mMoCkiBvMiROPzZCijlo/O1QSSfDG3TWrmm20h7CXiTk?=
 =?us-ascii?Q?23gT/Ud8/MerZsU3Mrk1l2J8ceAzGWowuhUHSqswqjR32iBlcAhEzV1jp3CM?=
 =?us-ascii?Q?p7fzih5JoArahsk7Y7Hmh9HrIRF7u2PyAE9pL3qodRblJuoilfC0G0/1AG3g?=
 =?us-ascii?Q?ex1qxoSosVd8b6EA9xPQ0cxibGgW868iT0LbipKWjCg5vIXotT2o/Q3q7EAh?=
 =?us-ascii?Q?Ib9UOTNp9wSoLDs4SSBrnBc05nTwLBMusCuPpgC0IgaE3LPsPoGCqkAb9ygR?=
 =?us-ascii?Q?fcYNcB5uYy/NaBaxWY7XGA0zvKNkvVYPCLzfAP+XI6b0XLv/+oYj9r7PtHHR?=
 =?us-ascii?Q?PAhxJ21okxGrUjmpkkS9DoEpqRVjMSFKF4URdM40LtPBZfJV3InMGHs53KY9?=
 =?us-ascii?Q?2VILbtci2e9zPqxumL7P4/vNg8e13CeSelRFzIkDUPJyKwXjfuBXnl+aPca1?=
 =?us-ascii?Q?tixz40LOdVxuNN+nA5jupOPMBRXSuHKBrypdzb7YBfIOiflNgebr4KLrdFw9?=
 =?us-ascii?Q?GNzeFsMV6CK3lHbTtOX7HZc7pc1n7ZX0MQbx+H3UzbdXpfPZ6gUcfCu21kpK?=
 =?us-ascii?Q?s4ZPMMHpVOV5b/5vd1gSb4nieAOgG9+t9hXL1AXfrAmLAeLVJkr6LZbph+Ni?=
 =?us-ascii?Q?51d9doAuA7MhIVkncSb30FCwoymsxla2JVOXfdJQb6GHs0Bv5ECNpxHhW6gv?=
 =?us-ascii?Q?qrP3QgWaJo0SEXKXmIwcbM3ZPa9tyjglp0setTIuCUp3KrN7wsCkynYeSpsN?=
 =?us-ascii?Q?kXa46yS2CmiK8O/ZDeS4a8O1b2LDms/zLq9HLV97pMFIFIrkaW9e74Zf3Ebf?=
 =?us-ascii?Q?vyTh1UpLmhTqt0Yo/IUEO+ERprxaMsfmHfjA0vDuGhmrWtRqvBA48jYOmRYE?=
 =?us-ascii?Q?/Kq9IPZRuE+XxK9nBA+ROaesFhXte6Ff3KDOQ0dAUJB7ly9noZUSpY27hYWe?=
 =?us-ascii?Q?62icsXoZe7a9uLT527LgZ1v9MDlgMOKy0mSKWXL8o8vBKRvc9en4foVz2R9e?=
 =?us-ascii?Q?PbHpVMre6cqn8bHdcnb3p/9rG14eS4aqf8D/AQbEl2Vr5UhqcgXzuV7u0mgd?=
 =?us-ascii?Q?9VWCyF4h/GCun5wGpOTRYIc038sjuv+TkgvhjUcolkP9iOtXh6gLlGFE36fw?=
 =?us-ascii?Q?N728tDr5jhJfuNB0IRbFiebyw5nghziZKu9JQZyI5s03f7dXXbwTIa4fSOdR?=
 =?us-ascii?Q?y2YKRc5wPuZhcKqKm7jqgVt3itxPmRoLeDCc3VG4ZJYq2o1AhEgI84oPXV/I?=
 =?us-ascii?Q?atl/RcZsGBsy1Ra/Mbjesq+Ey2HIAoTYHsmYqhokY3gf6qfxxzz97xnwFYh3?=
 =?us-ascii?Q?WNlLmzypTym99izJ2Ic7icKTBVdBvcv785HwOSU8u8AAogu9DQPnZ9f0/N56?=
 =?us-ascii?Q?0Sen4Ex3dl0NfnVSw9C0MBGZM1JJL+lnqrxRfwQdXTtvQxNMcKvMaL0+vdme?=
 =?us-ascii?Q?cvrseqKVZeFjJNX7dVJ0UaMJeQBFZNHx04j3afaRXVnat6EWLKhUXg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?byOpL3zrxcOdKimGcvAPlKIT9Nx3nsw3MT/MzKsbtPnYa/yjmzHqHagniVIn?=
 =?us-ascii?Q?S6ATCGq7aKfTAIAhSCcv/5cs4uSfA0voz0yeVs6qaFXTUT/sbEAfME5MdUYG?=
 =?us-ascii?Q?eP5UHyRD3krgLa7ZJzpRhZcIkrYBH8oN7BbgsuKVDdYVEULKCAs5xf5/1hxu?=
 =?us-ascii?Q?fpvWnv107lYZ0vwLtHBCuXMgWOjVt2zfBEfh5lpQsF+N2lI0+yp74RgapKrQ?=
 =?us-ascii?Q?qbcRcRxBo58u2WsOi56jqulXK+j9z33o4yfeEe2D4m/gsG2SDD5mprZ3q5tW?=
 =?us-ascii?Q?8QSZwe9x76dHJ19LmrQK+TP5PaIDiYr8EWNPQTDjk1RjBE0KLCa4piSXF97D?=
 =?us-ascii?Q?pwMtZLhJjABsdek4Oo9q0MJLYbJQkwY4yRXoQB03eO+tnFHu0vPsl9Ykk0L5?=
 =?us-ascii?Q?s/wXPrZgo/uvhVdy9iHkdag7yPQUKipmv9Ms9duEqGWjyfW8hRcuFYiZZq4e?=
 =?us-ascii?Q?8MM6i/d4tukgr9dh7N2iaTVvRLgBjqR40jUebEKOuHfd80HkFuJyMOQYPMhU?=
 =?us-ascii?Q?nNzWU4spsNWTB5ppE4N+ISJgjw8Wsvai6S6JXj8gHhesXXoB3qBKGH/D888K?=
 =?us-ascii?Q?4sNXsxr4C189iMYb1kunGMQqu61gD5qPQWemblSd1angBpnclBcFrRIFQ9rf?=
 =?us-ascii?Q?JAcTpR8G5LrN2l0luhZt8vWYipqMRl4N/Owwpy/f+cwkW+VqDWIQJ+EojEUn?=
 =?us-ascii?Q?v/7LRMWsWjdT73oOO9kewd1LaMADx1osSnwRvqDjb8TlTCrw4Y47FsPEZHJd?=
 =?us-ascii?Q?7QWdS+B+pbzA0+24CrRAf8vgmah7K+pRtF6fsrCYYfmW4dJN3IpVf7MpjYWb?=
 =?us-ascii?Q?KDQUL9R8uXPWq+CWzKoyJtvSYFB35x49sQc/ZyhmtywRVB65VO8stQmIlssR?=
 =?us-ascii?Q?pe2hRVQclN+PZuGfhS3IcEnyiGWsuEZCYp5OI7rVN9dQ5hMWntf64Cxh4CU6?=
 =?us-ascii?Q?S41CTXt9196XeGCAzcgRq6MPpE4gYRxqW5Lc50iaIX07hQ6UgKiwUbbxAbGO?=
 =?us-ascii?Q?jH4tHhpIb90VGLR+UGpt/Ek8udTawsjnY3efdc+6tWxUMyEA71dPiYP+svat?=
 =?us-ascii?Q?yqJn8Cmp+OdV8u7Djr7j5d5RfcUpqbM8fup0MJvuOyI8dp3Bu0KNcdTMRr/d?=
 =?us-ascii?Q?+Yfnr+AYG6SWGrqskFHz9itg1qlBkk8bEUZ+DW2rRcn6bvnWH1l8GoI3XhFV?=
 =?us-ascii?Q?llHWYqGzWkEOlKpWqjpKh+4iT7nuqk4MDPvxYsE+kFXHj1J49OMFV6lXTy58?=
 =?us-ascii?Q?d2GmuuVL0NacYtpprW5KGufXp0ApqTf+PGFIg1Y+3t6zYpdO7qfTpgTMjFxy?=
 =?us-ascii?Q?7Kw6oU4vBpNTikazm+1We2lWQnvxzledNZ0sfwMmwG3f0ug9n4r6Ne91a1t9?=
 =?us-ascii?Q?mLzqnRqMMZ/avGS9SGT+PgPQC8AKhbIRH+IqNc/ckzoP9krD8RlabOG6PuEx?=
 =?us-ascii?Q?8Mu3pkig9zJf6N3PIcDBVcCZBC0Ph3eDxY8fSWl8vfqWT3tN23E4HWU6fCV9?=
 =?us-ascii?Q?bp9OQim7HCYe8b9du4coSmrKszdDYywY5uLgIpyou0+kDU+ewVkcxzuyyIuc?=
 =?us-ascii?Q?hHZdgb9L6hRrN7MIEWCLYziPfPblqqhhiIEG/04wl5a++mVT5nkGFiT8tWqv?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72f4944-6d6c-44b1-1eec-08dd91f94749
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 08:36:38.7065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YGALneTcCKRS8U8hf8dDvW9hCj7Wy45hBSQl63knCW7rVy6gi2Q1HUP5ZRzOfkHzpnSvZMVaQ6Yz4XHPZkBatX0njspXhhlb/7btXMbVIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_013643_192667_E3C16C88 
X-CRM114-Status: GOOD (  22.70  )
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

In preparation for the upcoming driver update, we need to relocate the
current driver.
This will help ensure a clean transition and avoid any potential
conflicts with the new driver.
This patch is crucial for keeping our directory organized and
facilitating a smooth integration of the new driver.

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 MAINTAINERS                                     |  2 +-
 drivers/media/platform/allegro-dvt/Kconfig      | 16 +---------------
 drivers/media/platform/allegro-dvt/Makefile     |  5 +----
 .../media/platform/allegro-dvt/zynqmp/Kconfig   | 17 +++++++++++++++++
 .../media/platform/allegro-dvt/zynqmp/Makefile  |  6 ++++++
 .../allegro-dvt/{ => zynqmp}/allegro-core.c     |  0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.c     |  0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.h     |  0
 .../allegro-dvt/{ => zynqmp}/nal-h264.c         |  0
 .../allegro-dvt/{ => zynqmp}/nal-h264.h         |  0
 .../allegro-dvt/{ => zynqmp}/nal-hevc.c         |  0
 .../allegro-dvt/{ => zynqmp}/nal-hevc.h         |  0
 .../allegro-dvt/{ => zynqmp}/nal-rbsp.c         |  0
 .../allegro-dvt/{ => zynqmp}/nal-rbsp.h         |  0
 14 files changed, 26 insertions(+), 20 deletions(-)
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Kconfig
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Makefile
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-core.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-mail.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-mail.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa1e04e87d1d..d81d2756cb2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -806,7 +806,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
-F:	drivers/media/platform/allegro-dvt/
+F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER
 M:	Tommaso Merciai <tomm.merciai@gmail.com>
diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
index 2182e1277568..e9008614c27b 100644
--- a/drivers/media/platform/allegro-dvt/Kconfig
+++ b/drivers/media/platform/allegro-dvt/Kconfig
@@ -2,18 +2,4 @@
 
 comment "Allegro DVT media platform drivers"
 
-config VIDEO_ALLEGRO_DVT
-	tristate "Allegro DVT Video IP Core"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV
-	depends on ARCH_ZYNQMP || COMPILE_TEST
-	select V4L2_MEM2MEM_DEV
-	select VIDEOBUF2_DMA_CONTIG
-	select REGMAP_MMIO
-	help
-	  Support for the encoder video IP core by Allegro DVT. This core is
-	  found for example on the Xilinx ZynqMP SoC in the EV family and is
-	  called VCU in the reference manual.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called allegro.
+source "drivers/media/platform/allegro-dvt/zynqmp/Kconfig"
diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
index 66108a303774..d2aa6875edcf 100644
--- a/drivers/media/platform/allegro-dvt/Makefile
+++ b/drivers/media/platform/allegro-dvt/Makefile
@@ -1,6 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-allegro-objs := allegro-core.o allegro-mail.o
-allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
-
-obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
+obj-y += zynqmp/
diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Kconfig b/drivers/media/platform/allegro-dvt/zynqmp/Kconfig
new file mode 100644
index 000000000000..0a0a697c420d
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/zynqmp/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_ALLEGRO_DVT
+	tristate "Allegro DVT Video IP Core for ZynqMP"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV
+	depends on ARCH_ZYNQMP || COMPILE_TEST
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select REGMAP_MMIO
+	help
+	  Support for the encoder video IP core by Allegro DVT. This core is
+	  found for example on the Xilinx ZynqMP SoC in the EV family and is
+	  called VCU in the reference manual.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called allegro.
diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Makefile b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
new file mode 100644
index 000000000000..66108a303774
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+allegro-objs := allegro-core.o allegro-mail.o
+allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
+
+obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/zynqmp/allegro-core.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-core.c
rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-core.c
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-mail.c
rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.c
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-mail.h
rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.h
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-h264.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-h264.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-hevc.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-hevc.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-rbsp.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-rbsp.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
-- 
2.30.2


