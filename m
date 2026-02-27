Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E128FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MO1or7rWP0MPM3YaX01enhDQVeQX3ICbIeXiOCBEemc=; b=owhKk+bYQyAIxWyX6TG0h+irhG
	BEQP9ehEEvQ0drs7PDtgCOwRaOSIl8FneJT9mLCcwEgUGAu5tSItpAcngErsmo+KdR8nHXFtxqjyY
	b6jVOJLk1GPJY/GkEoRQCTVIVLgBFd/DDglUGl0DOOa6IX2h9F5npJ1gX8elMgwSorLDkzG8lhNHy
	hnDvREx1W8IT7CA86p6ZT/IAYwLH8Can0MdUP1PwpiS/TcGsxrm1BvYD3U2YX37+F1FFbe2YfnFK1
	0SvXKAJ1VGvVfKrlP98geE+aHkFVKK4ykDPmR4TbcmK8C3gSHBqY1+wQlI19xx/Dev2ThO8t506Jf
	Yd1LGWXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvz93-00000008W0c-43l4;
	Fri, 27 Feb 2026 14:48:45 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvz90-00000008W0F-3PcN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:48:44 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XWxCYMmOzQe0AblYUu3yvSKGgeUMzTlqYfKdNSGu73z0TAR90RCSp+Bvl96FiMiM40X1rv2c8kbIzaC6RnfmZ/Zn1dqiHO3K8oJXoii9leAZk4DUx0dqZataIsvZlZSJz+XJQhOTrTjNSJEiV1/w+H5b/N0/0SjBcoB/YxPVIMoZUtOrAThWtFA2SBj8AX7QL8PbcJnME66QlFjJGzx5FcVmef6mI9Kj1nIHXdMh9qso7eCRYkWkqpD0U0EjOxTInj9ZU04pH5QX/6PguBtkxv07G+vLpXVJxyfQ7fLbZeDJuCpMtIQxaZFivQtoZe+DLZ3TQE7lDwlJMi08PtdHjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MO1or7rWP0MPM3YaX01enhDQVeQX3ICbIeXiOCBEemc=;
 b=yeQa0/iCTv+D9umKS/0nxMxV/1ovyfzfYbn00d9/Qo8kRMgvISaafNKnOSKtVptGg47s5caAhsS9pwpdZD/85qDVhgu1qAbAWZ/BKMhjtkke00HQOdntgfNjpZVJR/SAHST4if8CK6UR8X+/4c7zWOjOELO+p37VMCqrD5VfWMztaTWQJoQ+d90+dclx+CZrc9BlUHb4UosYmFGISptWtmRNpChP0RN4t9wFAiCT6FYC69fRVL/7eiw0arKlf03agR/xhDkcwumiHALpuWBFjmdjygkuxu7/DOGm+Vum9LV7wDOaYy8ZQhFD01WfzqEIdFlPgSHUjB07D5cQYZdIoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MO1or7rWP0MPM3YaX01enhDQVeQX3ICbIeXiOCBEemc=;
 b=gYPGJ6VHMLPCd7D2bS0Rv3SBoGazmOu3/kLy/wT1/UAO7mMCAxWh406PvgaSlkzWI8uAbhByn5UHnJyYmBVnOBSBY3Y7oHLdQVULoEl2jvtKAIava/WgcnoR9c2lvDY/wtJIVPYoPJYe13+dHRLAQw6M12coPV7LWSf/7f0TXvM=
Received: from DU2PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:10:3b::32)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 14:48:34 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::cf) by DU2PR04CA0027.outlook.office365.com
 (2603:10a6:10:3b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Fri,
 27 Feb 2026 14:48:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12 via
 Frontend Transport; Fri, 27 Feb 2026 14:48:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ukg6MW5jFCcEUHPqLqdE6Cl1Ler8JHvaS/DwcvDzNnszrq9YtiVZRJ++QAVCTVz5EfEmHZkQD+ABOgdRbrB1oFSE14vNh4xS+MZDYs/FVxPtfFKYHQcUo72y1LiFvcCjj/YFX7e3YGAMqqRQuomqfZ8bP0yqyc3u147w8/edWFun3V19t7mQWwiimOmJxXzWBRiWide4z7f+mzGnp9AV36TMa5so2raOK1KA4pH2rL/60cRzmIKkgE3a7qe/xvPl+p9ek/i06ShBspI+ZEy3ttoou+iSvY6VStzeWVrYQwCkKIwBJj6HSrOtO9F++Zr8RfCAAYF5eCAju8/oFQqNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MO1or7rWP0MPM3YaX01enhDQVeQX3ICbIeXiOCBEemc=;
 b=hmQZYnLCPrWU+/slZ7r62kzqIRy651mzP7FAEeFQU2l2JzP6VGdVQYFqyeSqxIUBZsCZzbjvtTgdXI6w/Dts7hSPDw9Vcle+FmnRHjlcOyvehGfjEGF6/nEDLO8xYk+3id0Vuv8I9ncoZx39yorHRLIK5wN616VLC74GokgLNmffuNAnNCqZli2Rw0x8keg0foyAaW8PnekF9wNJ9MqrRyZqRRQgVDACeJ8/CHsD3vyrs1llPxOuSE6dvobf1W0rasFuVdlACaT3Ks0tw0LQGzNu+Hk7+VhBi33h6cAF6WbBZJx2ybe012NB6/syUNbzTeGV2td4j4zeTVIOXLnJrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MO1or7rWP0MPM3YaX01enhDQVeQX3ICbIeXiOCBEemc=;
 b=gYPGJ6VHMLPCd7D2bS0Rv3SBoGazmOu3/kLy/wT1/UAO7mMCAxWh406PvgaSlkzWI8uAbhByn5UHnJyYmBVnOBSBY3Y7oHLdQVULoEl2jvtKAIava/WgcnoR9c2lvDY/wtJIVPYoPJYe13+dHRLAQw6M12coPV7LWSf/7f0TXvM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11842.eurprd08.prod.outlook.com
 (2603:10a6:800:316::11) by GVXPR08MB11700.eurprd08.prod.outlook.com
 (2603:10a6:150:314::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 14:47:30 +0000
Received: from VI0PR08MB11842.eurprd08.prod.outlook.com
 ([fe80::2c32:d089:1d9f:b0c6]) by VI0PR08MB11842.eurprd08.prod.outlook.com
 ([fe80::2c32:d089:1d9f:b0c6%3]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 14:47:29 +0000
Message-ID: <c91853f5-04f3-498e-9231-eb3876471609@arm.com>
Date: Fri, 27 Feb 2026 14:47:28 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [BOOTWRAPPER PATCH 2/2] Add support for GICv5
To: Sascha Bischoff <Sascha.Bischoff@arm.com>, Joey Gouly <Joey.Gouly@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>,
 Mark Rutland <Mark.Rutland@arm.com>, nd <nd@arm.com>
References: <20260227102049.8015-1-vladimir.murzin@arm.com>
 <20260227102049.8015-3-vladimir.murzin@arm.com>
 <20260227110626.GA1980869@e124191.cambridge.arm.com>
 <3048e8c5-c14c-45fa-ba5f-1346df084486@arm.com>
 <d1f1eea815dad4fcb9eeedbef8e50af68e415284.camel@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
Organization: ARM Ltd.
In-Reply-To: <d1f1eea815dad4fcb9eeedbef8e50af68e415284.camel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0504.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::23) To VI0PR08MB11842.eurprd08.prod.outlook.com
 (2603:10a6:800:316::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11842:EE_|GVXPR08MB11700:EE_|DU2PEPF0001E9C3:EE_|AS8PR08MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f32e9f1-e573-45c6-df16-08de760f4857
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: 3rf+M3vKQrDiOda5qOD+KskThgTpNAFl7W+KCJ/RS/TPJbXsoHk5LJKV658hdmtrldZTdLe0RWG2vFWPSIZj1lOFrNgS9jSNw8NdJKRXfeWrOydjYeXFfuuVLJkCh9sxJnyy1FdoqNA6aLktbkP8o9i1xI6XWDdv7BFLfNrS5iRc7NNo3ubTA7aV7+gNaVCJ21j8dPVRiFQrISNv1JD66tU3nz0oeCvoe9d6e88PWwK5y+lkbxQCTpetwDa07N3Bu4l2JDeGoQjJf4CaQe6l3VwkiJWqz77Carw4/BqedRmupI2jv26GLJmLbxL4pLGPhZKznHHmG3SlmBWkT3JcwoVFgOE8wmOdG8TMP3aB5pm3oHxVYytdLj0adjncAk2c14og8Mwn0S5q91Tl+uUHwJFanwzeHyjUzLTiCWcBcOWOERQlbPBWqXWPtlPTRDJNRiibwahiJKveZqZ7/98x6otqpQx0u194EarRZdHfrbiUeiKTHA82VPRy2dFdME4Rk1RNO7nxxpIL/jBFKfoJZaCFfuBhZi4mjivU47EQzujHPBcJJlAQ/lgxNq2neMUrwuZNwsWFsQRAfW/brr5ldl1PJ/vRwRt+GSdluS9UUnXzB8zvv1iat/dSLTPRCkM7RY18SZ2byb8ztvDTuCNwJOvt4HvhEFlEgnB8YfLQCwDKzjz78cESJeXnPwaoSm6MAhk6xlMnsvwiPY4ZajmyxV7I6OcKnVUtsf8ruN+Tc/s=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11842.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11700
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fd2255a6-bbe6-4f5f-9b99-08de760f21c9
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700013|376014|82310400026|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info: JyQ42anrGO8zwRbnE1xfsC1kREualn4IBdSR1U4o6jOH3de4dNTZLYF+G8A2myvsMh7p7+87tHP93pjUEc7+poyVr+fBiDTZkz6ZpRL6/wOc0ds/dqYNBqz7vFNjrRt28cyzcaRXmrslioyYvfX/3QM8WgR5qDo6CTPG9hEqAu4YkwsPf4doDCYv+LIaZOEV4/dS1XgcPs/QntlGMEIXtO/5O7+kvoU/Gz4nF6sStsfJwntVYQR68feY/tK5RHyhmXE2ojfDa94NHdoOVZ79U6w6WEg+ao3WKWRUuw0J4yB0g1vC+MgSPddVJhKlFP4DmfsFS32vIolWfSoSuOFM4Ir9YhxmXJeZ2VGtax4hnUQz6kWZgkhJv4ER6NIcZ2dWNn6JSf9GCptTiEhwctaTSLf5jV/N9CU2ZfHEPE4wh0S0l5NBAjQ5+ovo5Y4eM1l/6Ez+497pHfjsAj2KdUzcH1sxXr/IY8uN/4rqSXbRjRHa3MrAmxP7tHcvwwSOLeyyr26FFGZcZYsllH5oUuu23Oil7FnDukoydLQ3PIsJbMKiXt+b+invYJYh1KYomMnmKEGAwPlgHVPfNPFlO1knhNdLLp3jrblUrsIAIg1Vtbbc+nzFqN/dqZIAeRVgs7xyVEQSlS3uigiwJ+EGuHeTyRL8lI0lPobFpVHR+cMXMCjXTU0ouj2BNyNTcFc8Sbfm4phDSF34kjeMzsyEA0lO+l70ygGFajhcdccocrWpm5caIj/N6GekJIpZsBWuhTfrxQsB3GTyTkJmZFoykJYSf2GkgjL0LIX0X/VEnhhqnoUV2sgkceoYpFqkHDO1RIJD+/dIb+ldsF9rO6rajfLaOA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(376014)(82310400026)(14060799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2VN0j3Ryzmxms1mTdmkcGBb7wKKpv1pknH90gdDX8W6O6QnXBeaZ2O60a+8seCRzgi0ksDdUX1+jYrWJ5yNZsX9pUzI6G95/7JZyWB/nyWi0AxgtReLO/8mtR2f9FITgsO6KkyQL97aSnMV/lpPB4MDNQfx/eOLISlTp5ZZPszHZ1k3HBvtyBgBHtL9So9ZGGfLtiCwxSZiTatdGrO1JDx+wPyE1BiLZ61ToT28YBMK0TxQvycvZmavUOcsoj6eOwUhOO2Hpp72EoBJLuzbBZc7KgoP6IylA26qqiwdIoXW9RcMGGotPjvSDdJ7kpWvx/Uq28ldmOEkCMc8v2bSBVFs7YyNomInALlPl9xlNdY4NE17+nQwlqD4iHUtNksIfh6lQo/BPhYn9EW8b/xhWYGwshiQr8WzwKkxXkKENaU/IwcX7yMJiwxNrRYcIern3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 14:48:34.3034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f32e9f1-e573-45c6-df16-08de760f4857
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_064842_866564_3DDAADC0 
X-CRM114-Status: GOOD (  21.33  )
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

Hi Sascha,

On 2/27/26 14:24, Sascha Bischoff wrote:
> On Fri, 2026-02-27 at 11:19 +0000, Vladimir Murzin wrote:
>> Hi Joey!
>>
>> On 2/27/26 11:06, Joey Gouly wrote:
>>> Hi!
>>>
>> [snip]
>>
>>>> +
>>>> +static void gic_ppi_init(void) {
>>>> +	uint64_t val = 0;
>>>> +
>>>> +	val |= 1UL << (2 * 31); // Trace Buffer Unit
>>>> +	val |= 1UL << (2 * 30); // EL1 Physical Timer
>>>> +	val |= 1UL << (2 * 28); // Non-secure EL2 Virtual Timer
>>>> +	val |= 1UL << (2 * 27); // EL1 Virtual Timer
>>>> +	val |= 1UL << (2 * 26); // Non-secure EL2 Physical Timer
>>>> +	val |= 1UL << (2 * 25); // GIC maintenance interrupt
>>>> +	val |= 1UL << (2 * 24); // Generic CTI interrupt trigger
>>>> event
>>>> +	val |= 1UL << (2 * 23); // PMU overflow interrupt
>>>> request
>>>> +	val |= 1UL << (2 * 22); // Debug communication channel
>>>> +	val |= 1UL << (2 * 21); // Profiling Buffer management
>>>> interrupt request
>>>> +	val |= 1UL << (2 * 15); // Hardware accelerator for
>>>> cleaning Dirty state interrupt
>>> What about SW_PPI (3) and NS_DB_PPI (2)? Are the left out for a
>>> reason?
>>>
>> No reason, I just missed them. Thanks for catching that!
> Hi both,
> 
> I don't fully agree here.
> 
> I think that the SW_PPI should be assigned to NS - it is a sane default
> so that normal software can use it. There's no pre-defined use case for
> this PPI, so it is just used however software chooses to use it. A
> potential use case would be for software in the Secure world to poke NS
> to say that it has completed some task (FF-A does this sort of thing
> using a donated SGI on GICv3, but could use the GICv5 SW_PPI for this
> in the future). In this flow, it is assigned to NS, and EL3 makes it
> pending as part of the return to NS from S so that NS software receives
> the doorbell.
> 
> The NS_DB_PPI shouldn't ever be assigned to NS - it is there to alert a
> non-NS domain to the fact that NS has pending interrupts. It should
> never get signalled when running in NS (NS doesn't need an interrupt to
> tell it that it has interrupts ;) ). It is a "Please switch to the NS
> domain when you get the opportunity" signal. Hence, the S_DB_PPI,
> RL_DB_PPI however should likely be assigned to NS, by default.
> 
> The expectation with the DB_PPIs is that EL3 might change their domains
> as part of a world-switch. That is, all DB PPIs "belonging" to the non-
> target domain would be assigned to the target domain as part of
> transitioning via EL3.
> 
> A sane default would be to assign the NS_DB_PPI to Secure.
> 
> I hope that makes sense.
> 

Thanks for such detailed explanation, really appreciate that! Bootwrapper
doesn't run services in Secure world, so perhaps we can leave things as
they are and add any additional PPIs on as needed basis.

What do you reckon?

Vladimir

> Sascha


