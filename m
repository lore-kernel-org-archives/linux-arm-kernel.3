Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D887AFEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag0b3LP+0vk7euuSiFXtUPSJV7a6sEIoSr1314qkX/0=; b=VN/JrPNOJh5KB/wKCKYjaac1ji
	Xv1DtbARn5M52sVhFPdzbEjWS/4NCAobj+bPpgngfZdmzWlNG5hj6wgZNDz3BgYTL4XrzJCgeFNvH
	fpYH7urXZmuIADMzRCuxdCTYUX+/OmR0A0IP7Mj+/2UsPbmDB2lj/yV5OaJvo7rUaehk1EsKeCfL9
	sBQbSVXzry4/nHc5G0PkiyfgWGvAUn4wUI4aFOh8kaQ6FHehurL0jpRVyX1PzRryBpomJmP01DE1U
	DFRSE/mHPj6mx9VhzWhDX8MabSCyDpwOYtn93Ggjfw33xIoVh8CJEmfPEUHQtxcw7h/Tykzznxh45
	F9YFe01Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyn9-00000008Ulv-0Msb;
	Fri, 27 Feb 2026 14:26:07 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyn6-00000008Ul3-0UDq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:26:06 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=i+FhnkL+V7lXSWmeIom3XjaZJupwev8/xTcVgpwBuvnH0+ekk0R3Ww5RLyX+pFcxJNRtIpKEl3XKyJThQifUtB2u3KOnRwS1NDNjy/0oRl5+GQskwHpTaa0uhNl/oQZbNYx5kIbHAJs0I0j8mcF30V9N73agC+lspWqzBxDzD+COtFal1fvO4Hqlz3gPOn1COh3U6Jzlvydg+FQARegtXM0mxcVYVw0XBoH0T0AKQlWV1eTsmc7lT0jU3VRbrAlDn2Mot0yDzsVzjfWtpEc7h1AM2GRR5ix+pz+F2hspaOaMX9i34zmDv/IbtI3A8BWgW4krF7yZ4zBeCKHInMH6SA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag0b3LP+0vk7euuSiFXtUPSJV7a6sEIoSr1314qkX/0=;
 b=HtKFd9jQIN0v/rm+QsDpu2FHdwnzL4iUDFa//cB+oAnomaXzWhMqWF1oa5hlcTxlElulv/mBVmnDVNMiTfOuSJzqq58f6mTYddUSU1XwlrWcizHazTzYKQZLWJV96D49CVSfS7gbemBlh2T7dffLHjifsT0pw4CyJZTJv0eHSyJDsshm+9w6EcGL4PsApLAvogaojVFoeTepvx9XzS/6iSDYVPgcKOaIyrFYiqm+nIYmssR+t76sWPBl93/dF3c0+moRSARcSKwl5XPzdyC4XrOFgl+gEyN0NMzyRDH4d4wBWikv1I/zGHoPMo6JrmwOQHub90dcvw8v2HxqjiMR1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag0b3LP+0vk7euuSiFXtUPSJV7a6sEIoSr1314qkX/0=;
 b=c8jx9yt910HTHJJmNMvf3YTqCiyw1KuXSSJLsGZQo2F2MCooWlOe2wz1fs/lWIVvZlT8gsg73Ikqn03SldDV8wp5QyfSMBVQuYyIeMvYyV4SE81ltAKMAAb8kJ7g8kxOkvRXFISHRhJ1AME3f2ZkOBMz3uKHpqI6KJL8BnOFPOs=
Received: from AM8P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::24)
 by AS8PR08MB10245.eurprd08.prod.outlook.com (2603:10a6:20b:639::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 14:25:55 +0000
Received: from AMS1EPF00000092.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::da) by AM8P191CA0019.outlook.office365.com
 (2603:10a6:20b:21a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 14:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000092.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 14:25:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpKsGOa7J27GuWxQF9aDCoG3JWFU7bXGkb7h8LsswmBNz3Rs4LxNcL4/sbvogJh7ofajchPczxKwy8dvbVLHiY/2d6T4ftWhohY1xPCb9XZlAaSw3eHUgkypzuo/zyKiS7dPbaJsI4LZAFAI07QwWq9/ukO6Z0/wGUB8ni5t7W7+Uf3e9tP6yfDdcwFYt295fHpR46C7RiA9cO2E4XZXbJE8tS8D4xopYYMu//Bm7ea3mNutz65nVzijUcimEr8HqdjkuhOSTz8oNXYkn+aqymeHjWdAZAtv8rfrAZbndtH71DVAbGgRcJXZLaRk/9gFvvhFKeOWj3FpXxuP/NRqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag0b3LP+0vk7euuSiFXtUPSJV7a6sEIoSr1314qkX/0=;
 b=pWMflbJWpnWVzzpUYBN98JKacsjJ7zpMjvqDqfr3tVz3/S13XfFyPwJjUkqA+DnukIfmOdzZA8Chm9Q8kwfN7LkHzHDJB8XRP2LRIRwxjq1ohuAKx0tSm4bYIqJA4JfOS2e1/9ingitR8/uF7DoIDe7yDqGDCetKtA4/H0cDu4Tj0YxdPNtz9lBpejgtRB6ssQPtgW4zVv4KVLeSRkvruUZR8aBk3X40J4c432Vb0w6bGqfGBhS75BoYgTYE45ySAteixauHbmR85NfgCWBty6t0Twpc39zEC5UFBSp2ojBTIRp61i8cHpA351AUKNlXOF73vT5XaGhquWDRV7IHZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag0b3LP+0vk7euuSiFXtUPSJV7a6sEIoSr1314qkX/0=;
 b=c8jx9yt910HTHJJmNMvf3YTqCiyw1KuXSSJLsGZQo2F2MCooWlOe2wz1fs/lWIVvZlT8gsg73Ikqn03SldDV8wp5QyfSMBVQuYyIeMvYyV4SE81ltAKMAAb8kJ7g8kxOkvRXFISHRhJ1AME3f2ZkOBMz3uKHpqI6KJL8BnOFPOs=
Received: from DBAPR08MB5687.eurprd08.prod.outlook.com (2603:10a6:10:1b1::17)
 by PAXPR08MB6462.eurprd08.prod.outlook.com (2603:10a6:102:155::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 14:24:52 +0000
Received: from DBAPR08MB5687.eurprd08.prod.outlook.com
 ([fe80::7d4a:f17a:4cb0:9793]) by DBAPR08MB5687.eurprd08.prod.outlook.com
 ([fe80::7d4a:f17a:4cb0:9793%4]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 14:24:52 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: Joey Gouly <Joey.Gouly@arm.com>, Vladimir Murzin <Vladimir.Murzin@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>,
	Mark Rutland <Mark.Rutland@arm.com>, nd <nd@arm.com>
Subject: Re: [BOOTWRAPPER PATCH 2/2] Add support for GICv5
Thread-Topic: [BOOTWRAPPER PATCH 2/2] Add support for GICv5
Thread-Index: AQHcp/Fud0nyjHe2TkeXDTGfKIHzybWWYlgAgAADnwCAADPRgA==
Date: Fri, 27 Feb 2026 14:24:51 +0000
Message-ID: <d1f1eea815dad4fcb9eeedbef8e50af68e415284.camel@arm.com>
References: <20260227102049.8015-1-vladimir.murzin@arm.com>
	 <20260227102049.8015-3-vladimir.murzin@arm.com>
	 <20260227110626.GA1980869@e124191.cambridge.arm.com>
	 <3048e8c5-c14c-45fa-ba5f-1346df084486@arm.com>
In-Reply-To: <3048e8c5-c14c-45fa-ba5f-1346df084486@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DBAPR08MB5687:EE_|PAXPR08MB6462:EE_|AMS1EPF00000092:EE_|AS8PR08MB10245:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1a193c-7dac-4639-1706-08de760c1e22
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: c1Ft0mkYGtrwidfOKNhgzs1NlgLFElBlnXLyMLGq4AXeoqpWa2VHgfG7LESvYrN/4t/c1+0uqlbXHIClbJ9D9XXtxYxP8RtEtskEG9890oFDwksiCnUjuz/NWsHUqJX5Cm4q95yKEJVxqi/iW4vAx4UxfpTADleMc7XTpfIYsdK6G0B4X/dDQASrx7MthusqMVPTATp35p4X0fQDpkVV2yY6CtHCucpqgcHQAFd48FknCu7r/KqqLIlYm9wdfOAHZ6iiwc5HNI/fBORSXfFeCz991l3TFe4I58pb8mUgrsuB4in9ikBgD/jZ8DCNeGOhiIIBcJE8Q8++PJbkxJsVZk1OAZFqi3NOivCm44c91foMKAMyr4G/LEQeUwyYlNXHrEzosZfgO1HC4WoAn5kVrDCNOeGMjjzNx5ITjR5YphvwxYGBJ1XA0f9FLxxR5p/0ZMq+u/WNxjS9r8gt+PSnSWgpg3cL76TSEqyyjNxG1aGAy86uHyww22e+t9wUXDsOOsmba4jXINmJYffD/U2vpiyo3riNGJTWSsHLd+gqEWgpJc980oK4KX4ONSuX5OT+4lngBTpcfW54rEZDjrrkqyiAY8vfSYcNpXjRiKNuo/EM5iZKhz3I/S7s9SpYZ5MwasT2k2/kFXTvJuVy4w+KiLwJ3oay0dZtZjreYJDL9isl3erDA/XyXF+TviSLqz0djX/jQTecgOu0msw7GegtaPogE3g1s7epzDq2ob00NBjHindlhFlRRt6SwFCDhLcjN4dLsMnzf0mE+JI09nEizC2WoFG1wslCJgnfG2JEVpY=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5687.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEDDD4B0C1658D4F8D09A516B61985BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6462
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1e5058c6-a2e0-4a4c-5b44-08de760bf8ab
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|35042699022|82310400026|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: zfc6HUxlgZp/FMGqQ5KP/vi6xX+21TR1VHDs4TVxNbvOlWvv7FPL7kLtXa51ra5FUB+UVlcKkR86VC4FyP2HqTVJWx2VNqq6N7Nj99ZU48Shc8bj2CWgHHMWpSBm1hPQRwYbfXVFzABSJSVhibtI/mWaolPBwCnW9O2C1LvFsXXgvxHE1vcgBoN0f7kGbowTYVuNi+NmiuGs+jq9xjmTMk0RatqgK4N5AFgygvfyXWdcctXQx/qgR9f/zsawDwS7jceUG50Rp3cH/M0wCbOOcQdYBQlJxCWmwEStEra0IR80m5GjONvzPmV2/zqn2csOhrVhaT7j5E3gx8Rsl/PfvZ67dV8hkZGglhZymOQyaC2vqpHVVnEIKFT8EOhX0ffVF21Tfo45r0EGpYrXwziyrZofSCNgNT5oMlvEPoRq+lLV3lIfebWbiCKGvQAGilBn9XtbEUo6bAltU8EAE/N3PCyY6QHM1L9bUtONC+1CN4UURdpW0y/KLqmFQURVMiZt/Vpsph9PZFYsx849drRSL6SIvxifptDXXIHoVSTupC9L6YYJ0OLahoDcNfX5t0t/uSGU4aMqtt+ASjpQv8FSGas7Lz5dnqlFDm1m+TShKuKFr3Bw3XY7/z5zMpoaC3d9gEYfRbZBexNZHnI+zOPc0MIAc19jOwxJVkBa3KBCKwoxiAWyKxXotj4kgBTscco8zMgCPJw0HBeYLJUB4N1mMLqtAtA/R7nK1TZVd3EtXAqcsxQKx8RM5qPvbGZIRfpGtg5npCeqr2pYvGGe9El17FnVGIlGh+Q9KTIH7yasEj0x6suW5kDTgpMkCfuOIy5J8ZMb2LR5Mq1qI3Fp6uah/w==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(82310400026)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AiGnu1fGOV+OObY3CDqKSMMjRiUZSYG0j7XL5Qu1MJZXTuuSJHWTN6IOUeCN+iaH4Ab4FeJDQrrT5EN6Kol0qPYTrk/wlCruXb/+vpuWeKyCAQqWflhdDJyozb8h1qQhn4eaSs1dSSTf/11tfm/HkyL4B6VXlsjXko30mOo8vEMM50lT4cPGuCFxaD0ajN1NvXPUzaxkYo/RmsnEDsV+Wwvc0U3y/+/92v6SrmwhkJ+5Yi7yZU9qzC+Jpw7QPBqICihWFsSObkd3VwehvEEHCapEBQk+3T7wPVxIoke3kEWwqWTjsMJzd4mjekg2TJOyXDsJOeyszT+bl8og3fl23DiGTKftIyR8FOwq6QQO58lQqesGlzOKv6IDxh4toJnizM06kLd61IbCUIhJWdf2xyC8B1A5wwKIPyTAXKUErz7H8OxQ28DrrvO56keqVV+e
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 14:25:54.9978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1a193c-7dac-4639-1706-08de760c1e22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_062604_606567_7A89818B 
X-CRM114-Status: GOOD (  16.75  )
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

T24gRnJpLCAyMDI2LTAyLTI3IGF0IDExOjE5ICswMDAwLCBWbGFkaW1pciBNdXJ6aW4gd3JvdGU6
DQo+IEhpIEpvZXkhDQo+IA0KPiBPbiAyLzI3LzI2IDExOjA2LCBKb2V5IEdvdWx5IHdyb3RlOg0K
PiA+IEhpIQ0KPiA+IA0KPiANCj4gW3NuaXBdDQo+IA0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyB2
b2lkIGdpY19wcGlfaW5pdCh2b2lkKSB7DQo+ID4gPiArCXVpbnQ2NF90IHZhbCA9IDA7DQo+ID4g
PiArDQo+ID4gPiArCXZhbCB8PSAxVUwgPDwgKDIgKiAzMSk7IC8vIFRyYWNlIEJ1ZmZlciBVbml0
DQo+ID4gPiArCXZhbCB8PSAxVUwgPDwgKDIgKiAzMCk7IC8vIEVMMSBQaHlzaWNhbCBUaW1lcg0K
PiA+ID4gKwl2YWwgfD0gMVVMIDw8ICgyICogMjgpOyAvLyBOb24tc2VjdXJlIEVMMiBWaXJ0dWFs
IFRpbWVyDQo+ID4gPiArCXZhbCB8PSAxVUwgPDwgKDIgKiAyNyk7IC8vIEVMMSBWaXJ0dWFsIFRp
bWVyDQo+ID4gPiArCXZhbCB8PSAxVUwgPDwgKDIgKiAyNik7IC8vIE5vbi1zZWN1cmUgRUwyIFBo
eXNpY2FsIFRpbWVyDQo+ID4gPiArCXZhbCB8PSAxVUwgPDwgKDIgKiAyNSk7IC8vIEdJQyBtYWlu
dGVuYW5jZSBpbnRlcnJ1cHQNCj4gPiA+ICsJdmFsIHw9IDFVTCA8PCAoMiAqIDI0KTsgLy8gR2Vu
ZXJpYyBDVEkgaW50ZXJydXB0IHRyaWdnZXINCj4gPiA+IGV2ZW50DQo+ID4gPiArCXZhbCB8PSAx
VUwgPDwgKDIgKiAyMyk7IC8vIFBNVSBvdmVyZmxvdyBpbnRlcnJ1cHQNCj4gPiA+IHJlcXVlc3QN
Cj4gPiA+ICsJdmFsIHw9IDFVTCA8PCAoMiAqIDIyKTsgLy8gRGVidWcgY29tbXVuaWNhdGlvbiBj
aGFubmVsDQo+ID4gPiArCXZhbCB8PSAxVUwgPDwgKDIgKiAyMSk7IC8vIFByb2ZpbGluZyBCdWZm
ZXIgbWFuYWdlbWVudA0KPiA+ID4gaW50ZXJydXB0IHJlcXVlc3QNCj4gPiA+ICsJdmFsIHw9IDFV
TCA8PCAoMiAqIDE1KTsgLy8gSGFyZHdhcmUgYWNjZWxlcmF0b3IgZm9yDQo+ID4gPiBjbGVhbmlu
ZyBEaXJ0eSBzdGF0ZSBpbnRlcnJ1cHQNCj4gPiBXaGF0IGFib3V0IFNXX1BQSSAoMykgYW5kIE5T
X0RCX1BQSSAoMik/IEFyZSB0aGUgbGVmdCBvdXQgZm9yIGENCj4gPiByZWFzb24/DQo+ID4gDQo+
IA0KPiBObyByZWFzb24sIEkganVzdCBtaXNzZWQgdGhlbS4gVGhhbmtzIGZvciBjYXRjaGluZyB0
aGF0IQ0KDQpIaSBib3RoLA0KDQpJIGRvbid0IGZ1bGx5IGFncmVlIGhlcmUuDQoNCkkgdGhpbmsg
dGhhdCB0aGUgU1dfUFBJIHNob3VsZCBiZSBhc3NpZ25lZCB0byBOUyAtIGl0IGlzIGEgc2FuZSBk
ZWZhdWx0DQpzbyB0aGF0IG5vcm1hbCBzb2Z0d2FyZSBjYW4gdXNlIGl0LiBUaGVyZSdzIG5vIHBy
ZS1kZWZpbmVkIHVzZSBjYXNlIGZvcg0KdGhpcyBQUEksIHNvIGl0IGlzIGp1c3QgdXNlZCBob3dl
dmVyIHNvZnR3YXJlIGNob29zZXMgdG8gdXNlIGl0LiBBDQpwb3RlbnRpYWwgdXNlIGNhc2Ugd291
bGQgYmUgZm9yIHNvZnR3YXJlIGluIHRoZSBTZWN1cmUgd29ybGQgdG8gcG9rZSBOUw0KdG8gc2F5
IHRoYXQgaXQgaGFzIGNvbXBsZXRlZCBzb21lIHRhc2sgKEZGLUEgZG9lcyB0aGlzIHNvcnQgb2Yg
dGhpbmcNCnVzaW5nIGEgZG9uYXRlZCBTR0kgb24gR0lDdjMsIGJ1dCBjb3VsZCB1c2UgdGhlIEdJ
Q3Y1IFNXX1BQSSBmb3IgdGhpcw0KaW4gdGhlIGZ1dHVyZSkuIEluIHRoaXMgZmxvdywgaXQgaXMg
YXNzaWduZWQgdG8gTlMsIGFuZCBFTDMgbWFrZXMgaXQNCnBlbmRpbmcgYXMgcGFydCBvZiB0aGUg
cmV0dXJuIHRvIE5TIGZyb20gUyBzbyB0aGF0IE5TIHNvZnR3YXJlIHJlY2VpdmVzDQp0aGUgZG9v
cmJlbGwuDQoNClRoZSBOU19EQl9QUEkgc2hvdWxkbid0IGV2ZXIgYmUgYXNzaWduZWQgdG8gTlMg
LSBpdCBpcyB0aGVyZSB0byBhbGVydCBhDQpub24tTlMgZG9tYWluIHRvIHRoZSBmYWN0IHRoYXQg
TlMgaGFzIHBlbmRpbmcgaW50ZXJydXB0cy4gSXQgc2hvdWxkDQpuZXZlciBnZXQgc2lnbmFsbGVk
IHdoZW4gcnVubmluZyBpbiBOUyAoTlMgZG9lc24ndCBuZWVkIGFuIGludGVycnVwdCB0bw0KdGVs
bCBpdCB0aGF0IGl0IGhhcyBpbnRlcnJ1cHRzIDspICkuIEl0IGlzIGEgIlBsZWFzZSBzd2l0Y2gg
dG8gdGhlIE5TDQpkb21haW4gd2hlbiB5b3UgZ2V0IHRoZSBvcHBvcnR1bml0eSIgc2lnbmFsLiBI
ZW5jZSwgdGhlIFNfREJfUFBJLA0KUkxfREJfUFBJIGhvd2V2ZXIgc2hvdWxkIGxpa2VseSBiZSBh
c3NpZ25lZCB0byBOUywgYnkgZGVmYXVsdC4NCg0KVGhlIGV4cGVjdGF0aW9uIHdpdGggdGhlIERC
X1BQSXMgaXMgdGhhdCBFTDMgbWlnaHQgY2hhbmdlIHRoZWlyIGRvbWFpbnMNCmFzIHBhcnQgb2Yg
YSB3b3JsZC1zd2l0Y2guIFRoYXQgaXMsIGFsbCBEQiBQUElzICJiZWxvbmdpbmciIHRvIHRoZSBu
b24tDQp0YXJnZXQgZG9tYWluIHdvdWxkIGJlIGFzc2lnbmVkIHRvIHRoZSB0YXJnZXQgZG9tYWlu
IGFzIHBhcnQgb2YNCnRyYW5zaXRpb25pbmcgdmlhIEVMMy4NCg0KQSBzYW5lIGRlZmF1bHQgd291
bGQgYmUgdG8gYXNzaWduIHRoZSBOU19EQl9QUEkgdG8gU2VjdXJlLg0KDQpJIGhvcGUgdGhhdCBt
YWtlcyBzZW5zZS4NCg0KU2FzY2hhDQoNCj4gDQo+IENoZWVycw0KPiBWbGFkaW1pciANCj4gDQoN
Cg==

