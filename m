Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6E0C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=630w0M/aQYySyjRQCdqJUi3C7HaAuAlMPzLw4WGSXZU=; b=nqIcfc5zqIdeVjh4N1OqOYxmvP
	eBFJTbFF6mlMpXAlBd1/fjv+HpCakLLPEjVUhpsff35Xk0PvY7nQFG35WoQmUT3xtdcDjwIMPbaYx
	oC+Id3xXJwvCyyCXNuYgcGu+gDJm52GZd355BwvU9LRrdkg1n1FPifTUjKiL0EAUPo5AEnjLjH6iU
	jo5ye36M9yrP59a+UTg6vQNicfzLW2KL6rvWoSYzc+Kwq4i4TsuKFzjht5He+IPVn87orPOTLLC2p
	iao4aj3ZS5++voU+k+dvC1jtQ3HKyZGSro2niNBQF+wwcQyxcONkuLGAuLn2BhhpbPSkYlN/FHG2k
	JRTonxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0OJy-00000009RxD-1pvp;
	Thu, 03 Apr 2025 17:25:42 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0OFh-00000009RS4-0317
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 17:21:18 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gChOmmAwUshCuoAqv2jI1kUlnY43ShygYcaFepMX2ngBL9dj30mifRpplT5d4lbWotfjLRK2JzLw/OFxNt6WRp7eUOonFOH1no4Ms9iy/cBPz+YESawLBwLbPoQJWa703ZqFuUissUhiEd03GZfFyXdZU9Wscum7eCcU/NXaBeecLTf03p+oIkPGTaPbD8OAOFK9SAqT+qnHQ1IGt5ZJAmx0KS4qBcPxHLHn7ZxmIxBaz5Y82jJByPbOmt3EtZw1UoeMuXxSYA0KAO0ZHDkB9FVAYjZEUWJSbUtTxnLQ1nBl/uK9tvWvuOj0bVxVGIbWD2FPcr1ArvoSD55IJFAEWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=630w0M/aQYySyjRQCdqJUi3C7HaAuAlMPzLw4WGSXZU=;
 b=JH0EFQKQNBijXIERt4rkXsDJ32i7z39aiBYU2QZaj6l8R3z5hctyEc/lIZJoPEmMLutEJdJUnQFx+6rTa3wWjS0eXtuDpatHBgWxfA8HLuSIyMLdQkO+wux9+OoYWFJqCofYvzsmn2H3V6CB1GWXP4qe7SOTxwkESUrvbasyy9G47Wne+3v565x5pUavuscJp6FyyQzDPzaqUoKQ/OHD9+br61oX5AlNqZ2eIaJmJhzbs2ksk2KpcqIyXtxsMPkjTpOiJje4tbT88lZ+eZSJwyzxQMRvo9lqSDswKZ7nhqTitZtIJgIpUe3bxKhepgQetE8fHoaZMW5YjWUP6Lih7w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=630w0M/aQYySyjRQCdqJUi3C7HaAuAlMPzLw4WGSXZU=;
 b=NlVEcwfJjKzSOlBsHubr2UnheFVjB4q+2ztZXn4p0Hh0xUjXSaAw+Mo1nPBIvh/G08/XQYwBp/62RUuA+Z3SUYDn3g0aTxHy5JyxYBRPqJWooTQzEM2IYoGyhq6RE6CYNC1FKDU6UwqoTecmko1dbCW231G0YAv3DD99Ge4dQu4=
Received: from DUZPR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::15) by GV2PR08MB9952.eurprd08.prod.outlook.com
 (2603:10a6:150:b6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 17:21:10 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::13) by DUZPR01CA0051.outlook.office365.com
 (2603:10a6:10:469::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Thu,
 3 Apr 2025 17:21:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Thu, 3 Apr 2025 17:21:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnnZRm5yyCa69n0+/0gIYC2hdF2/Lvm1QriR53PS4U3qeWLz5DlTDKRrFy0sNP2EjCBov8lRVl+qpzj0EULdfIayqXpPhHUg7+Uis8LaZdD8BskGtPpbmiRPTD8Oo8smhoyVLCZmt/s2vKvn/shtlu52i0HNYfqNgSiv1xIVfW9L9GGxQt2CqGu/pTF2xB1BpStPtKJypz2IF4mnkXjUpjKZfoEPu43vce4pTm1di6UpfcmUFKXaM9CK1KeRyjP/qjmUEidGLp19TvrM/cqL9TfXG6uYwjLYQhEuEyJ2z6y7vtiFtSreGPVi/0A+k7JNu80RnZTQPwM02J87TMb0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=630w0M/aQYySyjRQCdqJUi3C7HaAuAlMPzLw4WGSXZU=;
 b=cDL5Mc0gcUpIye1CSUXnYQxViopo5LOARF+TpSub3k14aHgUf8NPNv//4Phjzu0AWrgIbmELK4GSLNWx4wgwGzAyrXQHkQg6+RBt94PEI0P/5nvIqxNrZMyS9AW9Ty4eejITypkmnTE8jj3XVpOzztfezfqTbek6C1B2C4nORMND9e9uy7jWp9ubK4pf4XTvdTiOWSTIJxPaMFsLbAxpALj/wUMGGQ43v1d0eyGsSs+ea/wA2/D2YoXL/2P6S7z0D8eR2dpE5rTEX1nM67uk/p4fDTpj3OfZbL4eDYeJfhh4GVJ/jymVdf2T6+y1JlH0s8iBU1BHcgnPsKSph1MwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=630w0M/aQYySyjRQCdqJUi3C7HaAuAlMPzLw4WGSXZU=;
 b=NlVEcwfJjKzSOlBsHubr2UnheFVjB4q+2ztZXn4p0Hh0xUjXSaAw+Mo1nPBIvh/G08/XQYwBp/62RUuA+Z3SUYDn3g0aTxHy5JyxYBRPqJWooTQzEM2IYoGyhq6RE6CYNC1FKDU6UwqoTecmko1dbCW231G0YAv3DD99Ge4dQu4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM9PR08MB6724.eurprd08.prod.outlook.com
 (2603:10a6:20b:30b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 17:20:36 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 17:20:36 +0000
Date: Thu, 3 Apr 2025 18:20:33 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: add FEAT_MTE_TAGGED_FAR feature
Message-ID: <Z+7DYaphzZMzCke4@e129823.arm.com>
References: <20250403141535.23496-1-yeoreum.yun@arm.com>
 <20250403141535.23496-2-yeoreum.yun@arm.com>
 <e397283e-4c53-495f-a699-16c2f556837f@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e397283e-4c53-495f-a699-16c2f556837f@sirena.org.uk>
X-ClientProxiedBy: LO4P265CA0281.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::13) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AM9PR08MB6724:EE_|DB5PEPF00014B89:EE_|GV2PR08MB9952:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf7938a-a688-4c23-079b-08dd72d3ec4d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?NIxrAw/J1HwKHWRaJZcwKPG3OrQT3J737aMw3JMIDALlpc1uUP9pzVE6n8uR?=
 =?us-ascii?Q?feAWqhIAPDUyQid008Nc635vNyL0ih6lilrQzJHUvtMOWX4jqxfQQe9HZ1N6?=
 =?us-ascii?Q?saLRZkmQpoBFdKmoLAkprHayHIMcANoi0CHGTCOkFE0D1vYLXxcHUYwUfTf1?=
 =?us-ascii?Q?GQ5loaglLNXGj8y33GkgTE8nVfLkHq8TbZvhJJ453QULB8cdK7/E38gzfqwy?=
 =?us-ascii?Q?Rx552COjMjPrN3ug/+fJxi4AMjn6W92T8jornr8RuQu8RJp2i0tVlIlz+EtK?=
 =?us-ascii?Q?Q6++9IYbf+ZK4I7kwci9JUDL7IPoNwVZfalp1pZDQd/1FbCx6TN4uZ0p+ii1?=
 =?us-ascii?Q?RD86QtOl3km5DwOWIdMV9CDDhU4Sz8h490DLw3/J2+Qap6lZw7rgO9fm6WkB?=
 =?us-ascii?Q?9SxtUCzg2+rLMkYznHmT3pccFiN6MKt7/UUjZ481HJaHy6MYJu7a40IeXYJe?=
 =?us-ascii?Q?wUdJA4GVRaGkA7L/pYRGJFPIhJijrntoHIjNxdE/QBkTtLd5HpEUaLBm6r7b?=
 =?us-ascii?Q?TDZXHl1jjlTaGtlV3JyHKH9bBCcU2+ilKUs9b9Pt7I1r9Q7CNfMqdsAOUuF/?=
 =?us-ascii?Q?zmKHA6K9XWkmMtiq6syIcrVwJT8GrgC6vq0r/p2Zo/kuHWC+Y4kOxY8mhA01?=
 =?us-ascii?Q?EsudDb6OheXLd6px36TffyoK6tbhC9qTZVyW/YSwNDJ9/xKmvg/z1HE5HpaC?=
 =?us-ascii?Q?IC7rQZX3nspa3hliVTKw8abUBnZCUquZPZOamj9vsGHcRGaxmfCDgvkj1c2Q?=
 =?us-ascii?Q?sOLJL01rrFCdQzXh/jOvW9Y0FnBjJ5/HC5pggxUE/UInqmUTVGSHuu1N0wTp?=
 =?us-ascii?Q?XdfoJVpSwfIZlD9fH7WdW/a0PntpCUfo6kNt3JF0ybqtuIf8zULQ4ngPp1Ly?=
 =?us-ascii?Q?o6GoAC3pXsEGQzvh2iTtmfD1tLYvNBrYpAgP2R1Xnc3QCd/jqNPo7SFqnxQ/?=
 =?us-ascii?Q?9F/CDhPw7Yk3zBl8TzaM3Whq0FyolAPA+fWd7PE4rS5zAmOnRxNdUQwb8vOp?=
 =?us-ascii?Q?feiIycFkzqF8CRJP15nVrtd6rhUH/rQ5BLVrXNT7QZjrI4hQ27rSLqrf1yQ6?=
 =?us-ascii?Q?wzUZz0B0MzSpnLmkjY0WQwZCTxi+zFsYg63W6ggzKdLYJHsAEoVrZ76ct0AX?=
 =?us-ascii?Q?A1POylHG6MI/ug4LUIoLVRuS5H4Bub7r/soxhllPD+pEQcs7vg5UCvs1BPDi?=
 =?us-ascii?Q?kQbQnFytM/y+RTTh32F3rzndR7rJyOJWC1nLVIxBFqPJp5tI1S6ZjYp2bdkM?=
 =?us-ascii?Q?kK1/WDvVfBwncxS0MQNhico8KRAmxvvsb/ECAywOBjFlaWvhSftoF+snfB1X?=
 =?us-ascii?Q?weM+LUYFnU/YtwFminHhcJua5JCcVjOFuhrFaEDgndKeJ2kpPNll4m1JO2i/?=
 =?us-ascii?Q?qGVuKbOQnuYPX1i72l4KCQJlJ8S2?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6724
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c57f23e0-9c4e-48b3-4ccd-08dd72d3d8fe
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|82310400026|376014|1800799024|7416014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vAKZ7/978dUOECH8ber3bADWR48LONnN2srH40iDxJjiYeguB+Hpr3mCIKG5?=
 =?us-ascii?Q?QpwqassF/9CQYEOkPfQ1XS21aR29r7vmAfiRszrLNxWRBpkOB31rVOiWXmEY?=
 =?us-ascii?Q?bUDxzFeG0JtQR/XZZJN55mSFSErqwLu35Fj8i8lNHscsAwtLaBcop+OGUdlY?=
 =?us-ascii?Q?ARh3SiRb26uBCfPd+BTtrIgjJp42rY6GGlcD0m5RIQv+5yCG92I6zoYe08FJ?=
 =?us-ascii?Q?8LxL/dxrwY8hdaqJj5vhLY06ZaqTbvo4fRtIuzpvihmqbdGFNqwdQcnTaQ5d?=
 =?us-ascii?Q?3SvtQ6NS0XZurGevlV+kTW6fPVzufkt4lE+bN9QQ9pnD/Uniw6spg/99EpnU?=
 =?us-ascii?Q?ojEsNAfekCF/fbLBKDzl82d1R/oGySH1Us+RJbAz5ZsZFyS5am8gqS4q/HAb?=
 =?us-ascii?Q?UQM1EI6fa5AtI7byFqvSX2HiShh+bV0p/t0vxVRxmHq3vEd7Zuzmw2K0OeBe?=
 =?us-ascii?Q?1XVAd1sb6Jd/JupvEPMGwm8UA8l1cJxS9rvZObSPw3bf1B3ryNMNgcREhC+o?=
 =?us-ascii?Q?o/gnJISus8G9M58WhPd5FBxoM5Cyj6OABcMyEelWdOiMrJu3Y28QyoQX7dv7?=
 =?us-ascii?Q?gNB6shpEXn7FpSbNR66lNm4/G5hpn/7IgYuBcvGmMOYd8wXlEyP5tLWvaSBT?=
 =?us-ascii?Q?C6ukCilAdVsnK3hDAx6wHyPPhzCII6hZy68UtJScbM1zrn/IgYi/mnQh8T7r?=
 =?us-ascii?Q?Q+m5q3ZCZ/xbFXiELNwgTo2EwFdyJZR0dzO3DNi6mekcIELH+cpk6e3ZCWdU?=
 =?us-ascii?Q?S/HIV1u2RzzDGW23dCBhmld8V1+6+X66+XH352OJY0pG/F78T1DTqgvBCX0J?=
 =?us-ascii?Q?ZkErBcID+md8giHCFMz+xZ8YXajW1B3bagkGdgOAcd7XoZj7TLWr4nKTauhc?=
 =?us-ascii?Q?5qWuhs4bl/aYBU3MC6WKt3ar/QlanuQnG6BBefcpcAJlMVu9+T4anIAtENJD?=
 =?us-ascii?Q?sc9hSByYyhu3zVYhh16F4cw3OgwhsXWA0Kc69grJuguwJ2KECVsKh5WrYbz8?=
 =?us-ascii?Q?pz2ca/A7S5oIZaIb252F6ssXmYpvgPPfL6ziIor29wfY6HlFIkmcPyQby4JJ?=
 =?us-ascii?Q?Jg7N+Tqp+34yDd601K+1g3+I2JdqVNsL6LE+pZA3C8pmCAR1cFv1sXzvZ7EJ?=
 =?us-ascii?Q?bKx3nt0lm2bfSrESAdHtK4d4UuS2thmnw00/X1k9oYnKt+Fw1jERRuOop1eI?=
 =?us-ascii?Q?G7vMpKYSvzJ1/rw/Aq4x1tFh3VpEgOt10b6dhzxfX6BqsWXV1Tp3hDI+979Z?=
 =?us-ascii?Q?rRNuIO5WLATICtHFdmbBZc1N836zXY6qR6un/9EQfpFmbPbjNepNCJym245m?=
 =?us-ascii?Q?jZLl6AIxGKuRT/6YMU6KkV6z3n0dhDftNJZgHSSN1pFVAc9s6kOoyp0Qyq2D?=
 =?us-ascii?Q?KQ/ERslW/50kUAsIQqkW50CBrLged1aDPZfUDyxJB8r9Z4DMaHAVzSg5PJdo?=
 =?us-ascii?Q?/iKIxATGz+2Pqfg0THck7ZJcPpwGbAbHlPA6VKMkKOQ7C/QMlynWFY7ILfWE?=
 =?us-ascii?Q?iZUsD284osa397QpSaZzRfc8K7NyEaMOPDJL?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(1800799024)(7416014)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:21:08.3678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf7938a-a688-4c23-079b-08dd72d3ec4d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9952
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_102117_054603_10D6F3F6 
X-CRM114-Status: GOOD (  10.30  )
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

On Thu, Apr 03, 2025 at 04:13:27PM +0100, Mark Brown wrote:
> On Thu, Apr 03, 2025 at 03:15:33PM +0100, Yeoreum Yun wrote:
> > Add FEAT_MTE_TAGGED_FAR cpucap which makes FAR_ELx report
> > all non-address bits on a synchronous MTE tag check fault since Armv8.9
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  arch/arm64/include/asm/hwcap.h      | 1 +
> >  arch/arm64/include/uapi/asm/hwcap.h | 1 +
> >  arch/arm64/kernel/cpufeature.c      | 9 +++++++++
> >  arch/arm64/kernel/cpuinfo.c         | 1 +
> >  arch/arm64/tools/cpucaps            | 1 +
> >  5 files changed, 13 insertions(+)
>
> Please also add this to the hwcaps kselftest.

Thanks. I'll add.

--
Sincerely,
Yeoreum Yun

