Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AADCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4p3gP1BKNsOyumwZ41XNXqcHO+zE6pW57hSzLCM241E=; b=kEVF+b3db3N0ryF3xpIP/fqfEJ
	0M7M5Jqvz40ZjkorHyFjEalRx4hQw3ms4YS0SGdBkWrGKcYcj0wlC0umvJo8FypR3MDQ/KVoiwapd
	I11VY0tca5WHsZkds9MBe1BMpjUp6ZCMxPRRqPsgVI+28TRKBJQjKWrBYoFQd8Rfh25TDT+nVQBwe
	PXkTF8TskxC4shaB5eNFvmbilDv5fItHt236z7uxWeeJcYqtKGQxcHJclC3VPNTLBJXqLAumhcXLN
	/m2Nvp/J9oZym7t/xOSUhz+3JtUSXj/a9QlLPP6ihnqQQ9kOx9D27OI4vKhKvlIupPtrqk3D2mGdI
	XoyR/1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYgJ-00000000Mfc-25Te;
	Wed, 06 May 2026 09:36:39 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYgI-00000000MeM-0uKF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:36:38 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VViU2CB0f+t8xxolqR5SeL9mzd20FjPq30JI44OCi+HYV/6aabhbwKbxC1yL17mz+FHpgx4wS46/3veXWU6Q6UzImh9OJ04GPsfNye40ojBP73VZr54NRME2sM/6GhAwVHxCNe0LMiIJcrlpbOwRRI157l1foh5ZQoAF1jPA6IQ7I/ZelTYHR9qYl3b5pbTs/fnTI1j3f2AQFYxV18Ksmfyegfu1svHceC89NngFMmIYtbLcTOv084+sr45V7tD7uk6t8lacwZUfl2MBLtN9v6eOt7R8yAsqjmDo218ch6oLt2M/w+Ea60Im5GXYQFZPY+1WPK4UZc1CwSuLScDifQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4p3gP1BKNsOyumwZ41XNXqcHO+zE6pW57hSzLCM241E=;
 b=DFOOgKgOo9Ep+SKXP9KntzVWKLd4Qy3F0LRP94auSeaPhrV6f8MfqeszwtnY9onHYnPv6t5G38b7AzlKAWmxJ4hK9p1TTWnA1+vs4GcELCTtW2hwVJanu3R6Xbg1Sp3RS3zYu7PXpyG337qBgig4N6bZ2Chpom2IABTtgdc3QZD6xdA/Dif7J9cmKJrhhlTY3OI9dXQVaYTINfVVSqVJP6fznf3gkQ2KHvhdHgM4jtB/CkyziQK4glcfl1DumYS9oq9ps0AX+lmGEUrgRa9SFcLxBmK72gW3IxcSaVXQ5s7QcY70P4BpZ/rqng419q64gsOFBItMvynU7G+vYIH28w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p3gP1BKNsOyumwZ41XNXqcHO+zE6pW57hSzLCM241E=;
 b=gC5gc3Pbb+QnIfAEPXK7HLBy1QWnHKaxS1QxwbQTITqJ7Jl7uR/pkqvBT2o/OJ6Ix+uEXwyBYiKXQxqRuNj06C8CuolAw6oUK8xiDXPSK3oupv5/jNKsVYX0Lv2QaN2klx8Lf0fQaaohK8bVt4Fd0EHX6zdfgf+XpmPMzmhts70=
Received: from AS4PR09CA0014.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::17)
 by DU5PR08MB10823.eurprd08.prod.outlook.com (2603:10a6:10:528::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 09:36:28 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::9) by AS4PR09CA0014.outlook.office365.com
 (2603:10a6:20b:5e0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 09:36:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 09:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7OGTgObWsG5qz2C+baXCIk5uuoNU1Cfqn4p9B+LwCC7ZlgQQA1hbF2v9WUFgMVPwP7o8zWYd70qmUU0mi5CEQX7bt2HXaVClk/Ay6+YJdwRE4S38QYuwPDAlSkQJ7IcPF8A2CwtgVCdXY86K9wt4wIAVg0G+rI7WI2GeZFPFZTaRhRm+2VcERzjmiAIqJJ+rrlOqyO/fGhFbJ6Gm50vT5GV8sqSQV1f+LJ5RHIbcbb13GUGuca8Fk/yrRg8sYgdguM7RClkPGUhvIj8AbjpL84NyBMGuPpCNv8W/vdZ87QTKzFKFL6CAYWKUQ2b1M2YUcGmd96zGsPJhMsobXxjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4p3gP1BKNsOyumwZ41XNXqcHO+zE6pW57hSzLCM241E=;
 b=sYuVtNOTrorX26Mhy5cnAGk3XIZkQCyeE/6rO4iacgwRtsRCJoiSvFx11fCljL6g/GHdaK3ZfZP5/N2f+mtVSlQz3kOttxyyACQxsoW7S85gGTa96tZhgs+e4mhq7Bbc34Y8a7OQJnLT+/joL6xxHIhKRaShmmkLziMLGyu4Xibs5cytoxVpQMg7Ttxoxjd8K8OjhLyr7L4CbgIwwIB6dAbx8Jd2VeIW1LpQmR10rZqOgVYLDEaAGggNxpM5lSoRPbNEia2FUyAp0xbQH6uWUdg2QE2tBFbMbfcUVPdwpU+v3z2lb83n/6acjlgQh/zmgz7M0Hpoh2RnoBssC/c5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p3gP1BKNsOyumwZ41XNXqcHO+zE6pW57hSzLCM241E=;
 b=gC5gc3Pbb+QnIfAEPXK7HLBy1QWnHKaxS1QxwbQTITqJ7Jl7uR/pkqvBT2o/OJ6Ix+uEXwyBYiKXQxqRuNj06C8CuolAw6oUK8xiDXPSK3oupv5/jNKsVYX0Lv2QaN2klx8Lf0fQaaohK8bVt4Fd0EHX6zdfgf+XpmPMzmhts70=
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18)
 by GVXPR08MB10519.eurprd08.prod.outlook.com (2603:10a6:150:152::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:35:20 +0000
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7]) by AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7%5]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:35:20 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "maz@kernel.org" <maz@kernel.org>, nd <nd@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: Re: [PATCH 1/3] irqchip/gic-v5: Move LPI alloc/free into LPI domain
Thread-Topic: [PATCH 1/3] irqchip/gic-v5: Move LPI alloc/free into LPI domain
Thread-Index: AQHc2LbPXVvomoi+T020nCY0AkLbU7X/4taAgADjCoA=
Date: Wed, 6 May 2026 09:35:19 +0000
Message-ID: <00a7f4faaa58deda275e99e3cf9d9eefa2f789c5.camel@arm.com>
References: <20260430153352.3654325-1-sascha.bischoff@arm.com>
	 <20260430153352.3654325-2-sascha.bischoff@arm.com> <873405y68s.ffs@tglx>
In-Reply-To: <873405y68s.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AM6PR08MB3399:EE_|GVXPR08MB10519:EE_|AMS0EPF000001A3:EE_|DU5PR08MB10823:EE_
X-MS-Office365-Filtering-Correlation-Id: 103c8b60-06f2-4568-aff3-08deab52f22b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: XnZUeabn9jgrGUUfFMuo29lbcawgyHuz+0TfNfFd3+jP2KKjWUT9n8fT1wNzkZO9f7uboy30K963QM2T5S5pdHuhFiJQt0vjjmpR3sKGUBMWkQeSFXzPgAtFyERazsoVxs++YVtlsp+/1AILht1oovqg3MRNy0n5j0bBCXBi9hZ2Vr00zfOEPLOJRcw9ULkFqDgqbUiTU8KWCAfHupvX1O30bWcmH1hJdnXhym2LEDaNJyherDv0wefADubg7/MKvOqtd7HZ+VywnAesr5UiZLsrjOaEWaEdhPolcEok8tB6sK47ip2pqjq3/7AHoLn+qIeDoFnwRzIM1pornlYfETTcKSOMPWAKLaS/ErbtLIzzhYPSU5a2qIATGtNFu25ATBPuNJ2j8hXCMQ3hDsIwRAZVXJG8EyouaBwcJfEln8yE95oF4r/EJxJrWxBuC8GyFGJGBxux+It1ANKiEwnhMlILPYRyb4auraRgyYRkNc8ItKLIMDde7SPyBzGACIFy63pA9DzFBYpp8vrB417AmOUctCpUFPO4eZt4e1vk7QUXyKGniFw7tK3Mg0ldv4pI0gfjFA8AWUoIBT9e+tjz8FeZefKOjRQMxVwyn6gzCvs6DRKWOMrLsX/EOmVbdDRBjZGznRqTo9oD5asRSEstxrOgrjmJBqTwsnNiAB9qKk/T2K/eBGZGrUTJwfpGqPJ0x75fIkogG55y+DGdj49HqAxu5nuxY7Zb8JvOKsSB69ie57H6CVK1HodjWNDyukr5
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3399.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB64E094C7ED884BA56FAC1AA989B5B9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rDMvA2Q7wpyajWzRGu3m909zKl0E0wu9W8iNcWDJ9K3jBJZAoGkzVee0Ph+wxv1kfrC7Msphe+7WsJqVqHlU/Tt43SAo/9w5/H3Bidv+FrPYPv9KEVcUWobkRu5i3QWTR4RSU2AmQS85WMxeIqfWCftepyY/3ZYyJGHW/1afIygkVVb2+iFmFmGaTCRsXI4ySDz+EKX0v+pKELDDAASHJmro7HG9RB4linSqEMzc9uJgTmBx3EZplpTcOT8bfsyRXuxm7P09UDclDj2w6gwwkqnBCyKgX1SR90KVZJa8/tVxmsOj33yO4vJFqop3PAVGCsJvPzCOblQb4ZY4Meo6gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10519
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e002a7c2-90d6-48dd-f87f-08deab52ca35
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|376014|14060799003|82310400026|1800799024|36860700016|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: heL7WHB0lI9mTsyb/+5Rm+SUwhLl0Enpc9/IvC64K1GNlEJQTLGaxBgzyd+k7P1eaHlELiUBI+dfnaLK9Jzkwn2+S6sYT9l1BP/Q26DoQs/5pJH5Kiyy0ViPIgKSlHaOJKTZL4EYJiOwXlPKMrJ5yddhCzEH7+HJ3Zv4nISt9XivvkE5goaMXRcBfEsf6MnNOCWucjvFBk5pLUj+V6JTO2znDE/Ks4jfprApoz1iBeqdCVatPixWTMgSi1SnqJJxIWheN3V+/oVKzvrlsHCXLkUAnbnGUEtZ3AJ1rXkCpmHWz9C6VQXvLRtt0MXarnGHQ/Shck7x0A27Y1O/UtYHMQVmBfM6q2lf0QwUuvE6fS4nmRY97CTIdNsBch5VvDPG7/eooX3Z06zA4ZojLqSsXcSdCeZ3HU6a0DcIAqhmNgQxTVZrS2SxQIVM9zRFPfQ6qa0calB/aEkwivwmbrPJ1bVajyG80luK1OI/LKEPWn6no8FDk5Ni5dZqXzDGBDAAf/Dpn3wlJZgap//xdD9n039WXBgLXpfD4IfIcrnB2vOw1l2T4oXNPkpafjQj0a0CHIL0wJ2n7F9c81Z2Pk/VveU29XzF+7d1HXjtg6TB7qE7SgNKm1ESHmNudd+s8v91WldLXOB9+qlhgknrUV9p6w7uXwk9kKw/EcNG/pxfc2arJX8hy9yAvdrq0b9nDHaGx060YyZczKqvoIGYek5F9yFmfoVGckTbbBiAt61t3XrGjy0VrZFbUdfWfyrdy1mQ
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(14060799003)(82310400026)(1800799024)(36860700016)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cORYQACFjdrDzjtH9nFAsx1JzQmi/iRA0Dhox3OG/dlVGkK1n2E0rPkBGjqlCSxbEQuh3qkuCS+NqRTBasY/CygJShWoUcN9frIdodwoq4gQ3EzDIDA9JlWjGj6sywpvOi0ddzr1zlCYQB9nfg96wCyp7YgVTksthFff3HFFGf7BUVFtLXMrJKw1VgVg0pphBVDnDviihZiOpOfEpq/8e5aqTqoDj1+jf5SRrkR178TezvM72wmNKCcb+FhrtUlurWWRu+cFFRz4psPgZL3ud1RNGmgophq+qtHQtDIssyxdld0l+HLWoeh+ew50WSbj1A4P1sBYs3JklJTcqD2GndIRJqSWMgAYCgWSzrifkC3auXwR/tXJmnTiWm4bntM+S+EGJBaeWvWVHXvPAYpyZxS6SeUfNp9ZZ4BYCxgcwL7QUJdxqGlGO9xUjUTc8KL9
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:36:27.0838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 103c8b60-06f2-4568-aff3-08deab52f22b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_023638_257415_F712C0D5 
X-CRM114-Status: GOOD (  18.18  )
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

T24gVHVlLCAyMDI2LTA1LTA1IGF0IDIyOjAyICswMjAwLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6
DQo+IE9uIFRodSwgQXByIDMwIDIwMjYgYXQgMTU6MzQsIFNhc2NoYSBCaXNjaG9mZiB3cm90ZToN
Cj4gDQo+ID4gUmF0aGVyIHRoYW4gcmVseWluZyBvbiB0aGUgZG9tYWlucyBidWlsdCBvbiB0b3Ag
b2YgR0lDdjUncyBMUEkNCj4gPiBkb21haW4NCj4gPiB0byBtYW5hZ2UgTFBJIGFsbG9jYXRpb25z
IGFuZCBmcmVlcywgbW92ZSB0aGF0IGludG8gdGhlIExQSSBkb21haW4NCj4gPiBpdHNlbGYuIFRo
aXMsIHJpZ2h0bHksIGVuc3VyZXMgdGhhdCBkb21haW5zIG90aGVyIHRoYW4gdGhlIExQSQ0KPiA+
IGl0c2VsZg0KPiA+IGhhdmUgbm8ga25vd2xlZGdlIG9mIExQSSBhbGxvY2F0aW9ucyB0aGVtc2Vs
dmVzLiBUaGlzIG5vdCBvbmx5DQo+ID4gY2xlYW5zDQo+ID4gdXAgdGhlIExQSSBkb21haW4gaXRz
ZWxmLCBidXQgYWxzbyB0aGUgSVBJIGFuZCBJVFMgTVNJIGRvbWFpbnMNCj4gPiB3aGljaA0KPiA+
IGJ1aWxkIHVwb24gaXQuDQo+ID4gDQo+ID4gV2hpbGUgd2UncmUgYXQgaXQsIGRyb3AgdGhlIGhl
bHBlcnMgd3JhcHBpbmcgdGhlIGhlbHBlcnMgLQ0KPiA+IGdpY3Y1X2FsbG9jX2xwaSgpIGFuZCBn
aWN2NV9mcmVlX2xwaSgpIC0gYW5kIGRpcmVjdGx5IHVzZQ0KPiA+IGFsbG9jX2xwaSgpDQo+ID4g
YW5kIHJlbGVhc2VfbHBpKCkgaW5zdGVhZC4NCj4gDQo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
ZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3MvbWFpbnRhaW5lci10aXAuaHRtbCNjaGFuZ2Vsb2cNCg0K
SGF2ZSByZS13b3JrZWQgdGhpcyBjb21taXQgbWVzc2FnZSB0byBiZSBtb3JlIGluIGxpbmUgd2l0
aCB0aGUgZXhwZWN0ZWQNCnN0eWxlLg0KDQo+IA0KPiA+IMKgDQo+ID4gK3N0YXRpYyB2b2lkIGdp
Y3Y1X2lycV9scGlfZG9tYWluX2ZyZWUoc3RydWN0IGlycV9kb21haW4gKmRvbWFpbiwNCj4gPiB1
bnNpZ25lZCBpbnQgdmlycSwNCj4gPiArCQkJCcKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG5yX2ly
cXMpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBpcnFfZGF0YSAqZDsNCj4gPiArDQo+ID4gKwlpZiAo
V0FSTl9PTl9PTkNFKG5yX2lycXMgIT0gMSkpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiAr
CWQgPSBpcnFfZG9tYWluX2dldF9pcnFfZGF0YShkb21haW4sIHZpcnEpOw0KPiA+ICsNCj4gPiAr
DQo+IA0KPiBTdHJheSBleHRyYSBuZXdsaW5lLg0KDQpHb25lIG5vdy4NCg0KPiANCj4gPiArCXJl
bGVhc2VfbHBpKGQtPmh3aXJxKTsNCj4gPiArDQo+ID4gKwlpcnFfc2V0X2hhbmRsZXIodmlycSwg
TlVMTCk7DQo+ID4gKwlpcnFfZG9tYWluX3Jlc2V0X2lycV9kYXRhKGQpOw0KPiA+ICt9DQo+IA0K
PiBPdGhlcndpc2UgdGhpcyBsb29rcyBnb29kLg0KDQpUaGFua3MsDQpTYXNjaGENCg0K

