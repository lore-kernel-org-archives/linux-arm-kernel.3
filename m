Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B409EFB81E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GufYseaGZLRrts3ZONjHZTkOxrkS3SWFZw90Ehrbpyo=; b=mDQAl3J+Bm08RLz9ghykIqRL2+
	4IgBq7m8EGmq8DiaiopcP+0drZfuF+RfRg+FmL6SaibJAkElL3GCbEkeZ8iDDJcIUlFJF1h5AsvVv
	uL2AWVBqIrymo301Wy7OY+pVsirfQ2p5vgY5aKwQ55RSIA0ai/g3jZlkHBLdXhTRHqEWuqLW8Q+t3
	bTsdoWhQhiUoYjY76VRMRl+2SuzYNkjwyTJ7e8orjyM93eomhPW9+UP6Y1lLqkUPxFFkgflmZog5q
	erQCmKeE488ettIXoFIQSTCkTyPoYCSe4BvKpBrKU4dCfWLM3I+UVlWp8yGyJPfI1xTkhw7qZj1m1
	QhTREctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoXx-00000001img-1HJC;
	Tue, 24 Feb 2026 09:17:37 +0000
Received: from mail-japanwestazon11011022.outbound.protection.outlook.com ([40.107.74.22] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoXs-00000001ily-391o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:17:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtI46CpF2A7gtx2qgLQH6NPWOarSrP98h3m8aFv3VmpFVTCPSpROK8l70PH3K2LB1Ri48wklbkaorq4YvYSYpjhvrBDqYm8y3MxLgtlpHuJsXSfUmGkKbV+lfxRF2aDpXUS3XMQ/pKD2aquv9bsrPG7WQHeGjA5a9vZBCDX469vUCmsvg8hN0YSxRF1sP1JxVCGEPldgq3hSa2Yuwo8t+h/uMYKkpdr0/apS2czc6o3C5GUhoqNDdNurAFO1bP3i0KcccU8skVwfd0pFzjlYal+s4hs1/N87LPgo9u5hI/HlrfVytKr8bWJbxL/ZvFmiSSJdFEIH6EtgUSICmTM4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GufYseaGZLRrts3ZONjHZTkOxrkS3SWFZw90Ehrbpyo=;
 b=A0NQDVWo9Fc35bYGDZSiJKkPNkiOVXMnwyyz5tDHSfQjtgRpgSOatF+ErCImmCl8yFy1jeRy6r3F9sJ7AnzLi/I8LD/Zn4J8ylitNFhtojrBI9KDKObVCEuXYI5O5ds9Nkw/WdK00KVyajhL8MThJ5jsGrzMFI2kubVHngeMXyTCbc+c0qBk0NNrt2okhMXq/anuA959x1pWFMCCIWWDM4bBrQWG66ZPq51DCOYGnT/H11kWseBZMIHB2GYq0+T9TKEIODIx6nsr9e3hzrLk2LKI/hIa4CV3UfRuRtrOMiGUU2H/3pQd01meYCYZVLU6YZY/NvmvJvhVkxKBGFgjIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GufYseaGZLRrts3ZONjHZTkOxrkS3SWFZw90Ehrbpyo=;
 b=B6yH1YpzBLC+WfgJ5NOlZZuFpuHJ+v7xqceCLWPaqsm8Dv/rhPqfJhD1UDqeZqBlmWhy2InBpkQObQTChEPf5n+lSqUGl69dg88tpqhgE+g0Q+ZG2ZY6fu0GMr9nnZrDAm5RvGCiB1y6BzkhKmfSXUikncrBDY4X1dSua9URtAM=
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:38d::6)
 by TY4P301MB1490.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:2f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Tue, 24 Feb
 2026 09:17:22 +0000
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911]) by TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911%5]) with mapi id 15.20.9654.007; Tue, 24 Feb 2026
 09:17:18 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Russell King <linux@armlinux.org.uk>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"boon.khai.ng@altera.com" <boon.khai.ng@altera.com>,
	"rohan.g.thomas@altera.com" <rohan.g.thomas@altera.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	"hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
	"matthew.gerlach@altera.com" <matthew.gerlach@altera.com>,
	"vee.khee.wong@intel.com" <vee.khee.wong@intel.com>,
	"boon.leong.ong@intel.com" <boon.leong.ong@intel.com>,
	"kim.tatt.chuah@intel.com" <kim.tatt.chuah@intel.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next 0/4] net: stmmac: Fix VLAN handling when
 interface is down
Thread-Topic: [PATCH net-next 0/4] net: stmmac: Fix VLAN handling when
 interface is down
Thread-Index: AQHcpMroEtKQiaBP4EeeH6aeIKu7CrWRiqOA
Date: Tue, 24 Feb 2026 09:17:18 +0000
Message-ID: <TY7P301MB198424D6E80CB19AC9D035B9D374A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260223124102.120432-1-ovidiu.panait.rb@renesas.com>
 <aZxaSq1mrfInWClI@shell.armlinux.org.uk>
In-Reply-To: <aZxaSq1mrfInWClI@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P301MB1984:EE_|TY4P301MB1490:EE_
x-ms-office365-filtering-correlation-id: 8a5fc66f-e4dd-4d90-5020-08de7385825d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7142099003|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?LROQnT4wxOR6jGju1HaKGog2OGzZg9gUnOfZdukuyfAY4pwlkC0FG15bpG5n?=
 =?us-ascii?Q?920y1y+CV/lqfD0qcCGl8afumqfD31kT8hqhbdwxrpTljoiJKctsSgF2JdOi?=
 =?us-ascii?Q?wOF4/Bqa+w0CjYG1rQjzmGq+KFSqJAsOcw1UH7X8wfY2WrdENhfHsAKmB2Pe?=
 =?us-ascii?Q?2eYbJYhrln+6tcjroV3q1aUffonxGcATGL3HRK1QX3TohRiP5qGats3xCtTC?=
 =?us-ascii?Q?qkruFmuuI7kC/KmvzlN0c8xzMehw+ug8ryNr4/DjkjVmc0QUdzVp4qUsZ3Jt?=
 =?us-ascii?Q?brlAi79AuUQibm67meQSDZu1xu3+6674NZqvgGCNbwXF5lkYic50gJ5aAT3P?=
 =?us-ascii?Q?FC22OfwryWfvxncT4Mdiu0B4ixrRYv/Xjx6VElMPxLWFROJ7Q2iy0cnWwvun?=
 =?us-ascii?Q?GJ0rh2SIsR3wfi3HU614DDNl5pGueTCb+gSy1O7e6Q0HXw4MXvd6OId91N1R?=
 =?us-ascii?Q?8lNEg0knxW0QrG23oSLak1oqUVe2SjTwPwFb3CjPnMPy0lZan4iClVl935W0?=
 =?us-ascii?Q?2zIXK2aAYsSv/TqzuzfuQSqEX0lvupUpRBR5i3U0BoahizU1Y5JqK9ddBKvN?=
 =?us-ascii?Q?AoHgA+TG6vqlBN2lDZFv/woacrKcYWPjAXEUR2y0k2sudj8hEBF5rv4yy+Tx?=
 =?us-ascii?Q?40r/PojlsFvvqtQI34kZMo/JvE/ptLXYENkTWS0GNxP6KvZSzRdnro2gk2lC?=
 =?us-ascii?Q?1SaxrFoAQ7DYWYRw/6XFsQTvZqRHPcxcowveLZMtHqmR2blrlmEhrhu58eRc?=
 =?us-ascii?Q?YXi1C/c15+o/U7yFReowRU/zHUmylXeiGK0+Qn1rF3ncR0YEDLP7kU0clsc8?=
 =?us-ascii?Q?AIPSPHIS1AkoGg1Wx7m4507mmXg5jbiyEWZl6vsquP5ugSoH24vpRBI3h71Q?=
 =?us-ascii?Q?pjYODzxhezuQuSjfuSZ8mJbL9ooQ7bcYNIAFcGjvKbG3kg5IuWQhMDdP8FPa?=
 =?us-ascii?Q?FnIy+x/8Mp/l3w0XI9pk/4Ann3tRAWUu+4pSbcyzfu8WwNAj55kLENksIwKd?=
 =?us-ascii?Q?H0Egf0bOT9THaYA4XByaByChihx5dh7rq9sUXrspqfsconV6uy3/tT0ybn6k?=
 =?us-ascii?Q?Vh4dsxdgywPXRk+DwDmuBgGjMv0+JUu/3ZKrZULZzEJ99sc7qhG5r6+6IF2Q?=
 =?us-ascii?Q?5JXwFv8lt6bfjBQ+WRSP0nsl1cDkW174eCP6e0LedsAmiXYAdjkwUT2SiEiJ?=
 =?us-ascii?Q?NTqEZY3D9dIqdW0zIiPw2EAQ1jxidqXpqngn/JLyqPBKUAyYptb5FcyY/C1+?=
 =?us-ascii?Q?WLlVByQKPkPIdrINnnGqRtsdmroKYWZ7DhbBoHVJsVYEYzWEDHgDjz03WM53?=
 =?us-ascii?Q?eagbU8cAhkNreeY3L28h3QfPylALFccJeBugWpE6Q8YTRwHj9Fy0ZIy+j3+3?=
 =?us-ascii?Q?UOsti6l0TGHXvHEBzzrXtiLdgNBnrlFBoTxSe3rQ0TI+EtRaE8JAmqgbYBZ5?=
 =?us-ascii?Q?IAdquC7uWMdUuP0DkfSqXXSVpQL8AgeIg79b+J3gHpn5HvDuKoLtjKCMuwNj?=
 =?us-ascii?Q?9iRs2rRs1GgB7AkGzyGYgz/EdaYZ36VOurYZBA7Cz4FfTizIIGZkjezP/4HZ?=
 =?us-ascii?Q?cI0celyCjIFkJ21Sv3mx36kq8vYQlPHm6jgd6/Ae?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7142099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wpe4tKFmpflvUuu8a8QV8U130CDcMb2XRvW5OrEBc3Qn7O5IWmCjKIzdjdAC?=
 =?us-ascii?Q?uHV1pcL22V3lI+ipRlpFSuMpP5Roj7hfYcHgGTjbSLipukqyyhQhI2FbC5w/?=
 =?us-ascii?Q?Dje8k3Z4gmNeevziIRNMmlEXMrZVyYTXdp5l9R6kTO60ammDdBaawHw2c5fO?=
 =?us-ascii?Q?ajLivaI0UAfrMlnqkK3CAvNWPqX1apPTyoH5Uv4efp6Rrs+IE+U61jCcl83E?=
 =?us-ascii?Q?KHhw60N3vYv4TXPRifd667qAQ8WSuLN6IW8apf/kgtPnxfXTnxK/1agk5acD?=
 =?us-ascii?Q?3cXwikRO9A7qKOUVDZ4gzYOEuw/bc7EQU9SCo5sBNCNHMVzvdDVA3mALNynC?=
 =?us-ascii?Q?mzan1sY+XO3NR6UwA4zF3N7X/OQ9cVJ7G/hKdsyX2DNyUeWfvwFnx9OVPhWC?=
 =?us-ascii?Q?dnUUjqUI7B51xkbElMrmS1fzqFZ8gD/vastf6DEmF8M5X5yQbUIPQcIbC3gO?=
 =?us-ascii?Q?g7a5MXz0nVLK/ghmj4XyhkULrLFl0Ali91xxjLyZD0U+WZPflbtlmyXGEt6P?=
 =?us-ascii?Q?QeBTecFlLb9uKtie7mRuTTwHyigXd8bmhM1wQMnE8++Pk8mrzngPTn4w5wMu?=
 =?us-ascii?Q?zWlfXItnjL0WxubqHdMA4lEQ5MFJo8EN7hWRV6jx6ug9c2pEttKUskZjJyV1?=
 =?us-ascii?Q?EcbtArDqNV7h7ysULtpEuCvZaT49k2YTbNR7BiJ10PZqsHuH24rO03u+tcgf?=
 =?us-ascii?Q?Nbje01Ux1eOuo058RcEcL5fUUinvEzlD/+JFsvyPCWuKD93St/0pd9ef9Oxq?=
 =?us-ascii?Q?75JfBHNlS+kp47WskS5jFxR5Fz7WniUik5X6GodGbHZTxdvZvNHdddygFtI6?=
 =?us-ascii?Q?UOFmnU3kfYOcbpXuEwBqkKwltlikg/hD7aVPmtp5fo15IbnfiC+ARQGrC71Y?=
 =?us-ascii?Q?1cGHLFH0ExDS6gfli347h8l8Up3numUee5oJJi51DNfZjDPYux8cfXd2iQdB?=
 =?us-ascii?Q?efcfx55Vth6FaFG/V6AvFGRssBTWzPBZ1Gx+CtK74BwsRjWRKXFXSkievEAL?=
 =?us-ascii?Q?IbGezbdZFEfJfxz9kx6B50SYGtuHfzsZfzNfMWpfyKzYOocEkppJktRm+ZYP?=
 =?us-ascii?Q?MRFKE5DM5sTKEJExaIR2FjVQ38eu0vYbAPjlV9LSQbDETtuUHQPV99Sgre/c?=
 =?us-ascii?Q?Tz7fwjK7NH5w2QLyrues8YS/5PY5B2pl+ppu62+N6rJYy1qVzE/ZGbJfWqvw?=
 =?us-ascii?Q?2wHVf3AzJWnVnC0KRLRO2NOT/L/dzZ2ZMAInHtI457U4Lq10/s16rN5zvRXz?=
 =?us-ascii?Q?0wpiRTB2VvGvKSfWUrqp0hYVRQ0e6b/Tu64Yr+FgY5u7QUGt4DzIc/ZAqVTG?=
 =?us-ascii?Q?dwcJbxTLCfAgV5ojdGASn+m5WWtpHvjtDHwd/r/dRj1Q1i3oJagIa0yrakgr?=
 =?us-ascii?Q?fPwrUBfWQb3g4VBYT443l5j3HKjiB7Q7Y5vIx2SaIxz6kDN5YXt/eSUIdbdE?=
 =?us-ascii?Q?VrZmAOriEQYN/G1+7zDFI3fVc7HLa8sWG2eZd4p8sS5mjeO7TQnpF4/z2TRo?=
 =?us-ascii?Q?8entFVjFD8XD9voN326gU+19IIQacTjIluQXYb4c/IKwjsV+DLzHggFDGdOQ?=
 =?us-ascii?Q?HCnEYFeF6FIs+75toKoMOpZknYkaa94KwJoCVNsNT91YTWykuNdBbRLwEkZk?=
 =?us-ascii?Q?REtXljrOODHMfN6S0nyQRdJmocD8nLMffzUF9HSw/6UpzDCBsoTADPMS1Wmz?=
 =?us-ascii?Q?I1o3E/UA1bvGgmCtlOKDXvcqULu/S7EQ218WJKJZbTUDQeDfTtnm05i3s3Oi?=
 =?us-ascii?Q?rf2QCzA4kio6BgN3dZj5T2DJ8wlMT18=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5fc66f-e4dd-4d90-5020-08de7385825d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 09:17:18.7578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bSzCGfXlmVDZQUpJYlFlcr+khKLCUTtm5bifiEVS4nPVXv5W0489sxJbjwcjJ/Ktb6w0S5gaE0MuQWdyqIlzwtE9kknGES7L5u17aHqMNAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P301MB1490
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_011733_045304_99C9BF11 
X-CRM114-Status: GOOD (  33.35  )
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

Hi Russell,

> On Mon, Feb 23, 2026 at 12:40:58PM +0000, Ovidiu Panait wrote:
> > VLAN register accesses on the MAC side require the PHY RX clock to be
> > active. When the network interface is down, the PHY is suspended and
> > the RX clock is unavailable, causing VLAN operations to fail with
> > timeouts.
> >
> > The VLAN core automatically removes VID 0 after the interface goes down
> > and re-adds it when it comes back up, so these timeouts happen during
> > normal interface down/up:
> >
> >     # ip link set end1 down
> >     renesas-gbeth 15c40000.ethernet end1: Timeout accessing
> MAC_VLAN_Tag_Filter
> >     renesas-gbeth 15c40000.ethernet end1: failed to kill vid 0081/0
> >
> > Adding VLANs while the interface is down also fails:
> >
> >     # ip link add link end1 name end1.10 type vlan id 10
> >     renesas-gbeth 15c40000.ethernet end1: Timeout accessing
> MAC_VLAN_Tag_Filter
> >     RTNETLINK answers: Device or resource busy
> >
> > Patches 3-4 address this by deferring hardware writes when the
> > interface is down and reconfiguring the VLAN state on interface up.
> >
> > Patches 1-2 fix some issues in the existing VLAN implementation.
>=20
> First point to make is that when the netdev supports
> NETIF_F_VLAN_FEATURES, receive clock stop is disabled. In stmmac:
>=20
>         /* Disable EEE RX clock stop to ensure VLAN register access works
>          * correctly.
>          */
>         if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI) &&
>             !(priv->dev->features & NETIF_F_VLAN_FEATURES))
>                 config->eee_rx_clk_stop_enable =3D true;
>=20
> in phylink:
>=20
>         if (pl->mac_supports_eee_ops) {
>                 /* Explicitly configure whether the PHY is allowed to sto=
p
> it's
>                  * receive clock.
>                  */
>                 ret =3D phy_eee_rx_clock_stop(phy,
>                                             pl->config-
> >eee_rx_clk_stop_enable);
>=20
> and also in phylink's phylink_rx_clk_stop_block():
>=20
>         /* Disable PHY receive clock stop if this is the first time this
>          * function has been called and clock-stop was previously enabled=
.
>          */
>         if (pl->mac_rx_clk_stop_blocked++ =3D=3D 0 &&
>             pl->mac_supports_eee_ops && pl->phydev &&
>             pl->config->eee_rx_clk_stop_enable)
>                 phy_eee_rx_clock_stop(pl->phydev, false);
>=20
> So, given that when stmmac supports VLAN, eee_rx_clk_stop_enable will be
> false, so phylink_rx_clk_stop_block() does nothing useful and receive
> clock stop at the PHY will be disabled.
>=20

Thanks for pointing this out. I will drop the receive clock stop
block/unblock calls in the next version.

>=20
> So a few questions:
>=20
> 1) when the network interface is opened or resumed, a DMA reset is
> performed which resets all hardware state, including VLAN state. On
> resume, we call stmmac_restore_hw_vlan_rx_fltr(), but to me it looks
> like that is incomplete, and bits of the VLAN configuration don't get
> restored on resume. Please can you look at this and confirm whether
> this is indeed the problem.
>=20

I checked and calling only stmmac_restore_hw_vlan_rx_fltr() on resume
is not enough, the VLAN hash table and the VLAN_TAG control bits are
not being restored. stmmac_restore_hw_vlan_rx_fltr() also reads the
VLAN_HASH_TABLE register, which is always zero, due to the previous
DMA reset.

> 2) If we can fully restore the VLAN configuration on resume, I suspect
> the driver will be doing the same work at resume as at open time, so
> this code should be shared.
>=20

Yes, both resume and open need to restore the full VLAN state, so the same
code can be used for both paths.

I will prepare a new version for this series to include these changes.

Thanks!
Ovidiu

> Please can you look at both of these points.
>=20
> Thanks.
>=20
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

