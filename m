Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3554C71159
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 01:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dubD0U1H3HppTicQpmQyP4bDfSZx5fYNRUYJd5JG+M=; b=Kt3CZdfSLqRXoqMxHEcsjiXRDT
	AT4MGIqPn5WQqNlZChqt30mm9EmYVO6CP80X2z8oRjKHoe22jmTpjd0oTp/JVVYgwR/d7KfvgrGqm
	fiPbCFlVKIfLjiL/urLm9bJeCDD4+81Prs1ablYeyZhzcl9jp20foYQRT3BPkO3Zs0j8rf37qSJvn
	y89rKQTnCfjU8H/BFjV1SNo0WnSTPMUGzWo5TKv+8SpJ5goPa1pD8SC0rvp3RnGT+y394J+F7N3SY
	GK5WKBJfS7ML7OES77BL+UwhLT4tIbJzg0pbH0L299YO71pc2d613/uoBGmxccg+nFbKHz/OkA/5S
	g0Yj8JbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLHX-00000005xJ0-20ac;
	Tue, 17 Jun 2025 01:38:35 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLDA-00000005x3p-0Bw0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 01:34:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNcmC5+o53lmV/HMn3b8rZPLgWdm+vPVo+FbTrm+na2XJRGnjzPI3g5rxBqzy/rWGmSXuRmJ2z+ci/jBL4VZbD5G3xq0r93VM1iOMkVBAzj31VyF2OF8PRlwWugZn2HT6xQqMix3y77UbWAgWVCkOodAImwJTQgUAHRUBApWVAjnJcZ3/NB961Jsf/QoIA4Ed5hRYGtISixo7LTaZYgnBSxLu5Su/dClSaDM+lDU6Ki+KHmUGRVrMP6WrHlCe/Vb6pwr6JPmFYtpwdVP+/1hIUXJi7ABTmDUhq10Kx10IgjkhXB6lFqvNp+maJsXJP1jBBrG1q24w0KRU4pZSOgGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dubD0U1H3HppTicQpmQyP4bDfSZx5fYNRUYJd5JG+M=;
 b=ORQe/vD9Fm9S1eAs4M4sdn9dBpx6dm6jclXjFgvZXlF+5QlMYqKMbETR7o6I/NjkvZQbj+MifH+QmtsAZw7cdiPEhZ+oD8doI6vdxLSC3nF50wyA1C6l3ORUT5auPx0ptWi9piEmnXxxik7NQHbB1Apg0rF5lFdLfb6gHVZZNjWlHGLxBnns1wD5NU0go9ks6F6mXcOueyZM4eDLiANemftJvEA1sJb8lphE7tlL+ASy0pwWB15YM5GcrAb3I2TT+SiXDObZbLuKYIRmmZgDmFJcADOmMfWSWUumGgfOagKQc7vcr/Babg3Wmq7SP1xaobjdq/LpelNCw0fDHShHMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dubD0U1H3HppTicQpmQyP4bDfSZx5fYNRUYJd5JG+M=;
 b=Zz5iGxmPJ4+T40qWarTpD6I+VdiwIw7i+WWZRvKWujoTMDdRYjrWu3JarW6b7WmxlrGPTM0ob9+5hmZ+aDcLIh+p9g9KbJqeXqwcuxIsu5DBkxFU/lBUdjvC04MATVMqVoVI4T2up8uzMh2+CHpL0kzGJ1FZvO39zFiIyEixcWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9766.jpnprd01.prod.outlook.com
 (2603:1096:400:20c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 01:33:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 01:33:38 +0000
Message-ID: <87h60fnoct.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexander Clouter <alex@digriz.org.uk>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm: orion5x: use string choices helper
In-Reply-To: <eaa1038b-9a3e-4f42-abaf-8bb8b92aa482@lunn.ch>
References: <87ldprnsc2.wl-kuninori.morimoto.gx@renesas.com>
	<eaa1038b-9a3e-4f42-abaf-8bb8b92aa482@lunn.ch>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 01:33:38 +0000
X-ClientProxiedBy: TYWPR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9766:EE_
X-MS-Office365-Filtering-Correlation-Id: 4916986a-693c-4069-7a3b-08ddad3efc05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EYsCoD7qEVtersni8rzowAAu1vVz8/TXXNnWENv7qqgZqpvpUsKgsy4ZUC0t?=
 =?us-ascii?Q?zQJFtMm0QEAfmR/bD1mmcfyR1894tjI7zmIvy0UCiRCToN5h+zx6PUTv23zJ?=
 =?us-ascii?Q?fUKqEAqiVl6l4nYjMIfhcyeiyQIPk1WoNqteT+gIlF/xNT9oXuqU1+YZOaWh?=
 =?us-ascii?Q?LTg3eVctPPGi0KScqO9zB/Nau4hU2/GVc5tvS1kt8ueLE6SkgN6gTyMfBSgn?=
 =?us-ascii?Q?nJB0q6vqVAhd4egSw7zkBvZfcHuABPTcVM5BrX2teAEMxLsRm0A5ZJv++n8f?=
 =?us-ascii?Q?FJAQk7N8iXGLa1eOPypdzrRezFozb4ZLJDlycMG4+ZcEnATtGaMV7SBec3Fz?=
 =?us-ascii?Q?VCpdBCwJ7G9BewqLCNVeLP66xJsdkuPJbGQ+nO31TvMyzxzh27P+aoBHHL9Z?=
 =?us-ascii?Q?6/TzPLwPkDhwoxq1WMVooNR44yQIMIrHz0MMOx9TQECD1ZiNcPMDEBUUv2m8?=
 =?us-ascii?Q?4cwmvvMOmMI8U0knkzC5ZE/c417mjQBD+5BGnDsOiHfL3j4VBaOfIVmdnprs?=
 =?us-ascii?Q?LVVkxhI9oh3ykgda3G3m96hNA4KQdLaZPmW/sdTlOcsm58v/FELnXhvEDvbl?=
 =?us-ascii?Q?Q2+jno7Bty1Fzk7LcqHlbhqSRnVZ9+m25z7Va4u3IJWakkbKQCDPA2r0fjk1?=
 =?us-ascii?Q?hqOkJnJyZlSDxYRjOihkiTHlOeRh5e0Hjzp9dv/ZFUUo/w8zEiaAemZrU0Rw?=
 =?us-ascii?Q?9R9j55HPfc7Ta7lqi5/Va1yAv4botne9IudSY6vUcXbiwryKBite5SWMhoXa?=
 =?us-ascii?Q?MMmQz70g8QmIF3qBkqYRK4G0QDdDbaJsPYy4nyl1m5n9pBzJ61TI1glBui3F?=
 =?us-ascii?Q?wvYThntmqigAOAOG3R2S3TOeCkfchjDzl1bVqgpGGuMgLA4pDQcqqMOve6Qn?=
 =?us-ascii?Q?Ln78sMedIplrKHRqXAJCH/aS+zXeG3vydUa7wn4FUB8Bb6bSuayapjnas7sn?=
 =?us-ascii?Q?D6DDmNBXZL57i9S7BM8o2hE8ItEnPivBUxYSxGLeF28ldAR1hdzOznHgWGyJ?=
 =?us-ascii?Q?KaNhknL6B7qAJDL+kc/ryIuXjWXH90jjH/Lsyl0M+lQUoTi5GrYYEtOzT1u9?=
 =?us-ascii?Q?sb5EL/5idgy1N0WYlv/5nf2BAGjGITw5GuKiZgmFl5hyNsi2FezlUoBGM6OM?=
 =?us-ascii?Q?61Khj9BzLD3B4Rm4DrlW4bkpoFU7RstBr2aPsqQHlHl6c7KR7EOtPWLmhxTs?=
 =?us-ascii?Q?Qlsg0hACzzC0C0LIZEr1Har1/AJovUq5jNTb45aFsS3zNsVqml2Th+fGsC+Y?=
 =?us-ascii?Q?JrNtGd/AyBszm7ik81/qpYTuc45vtt5ZJK+aCdySXMpyeqAnOqjgN3xYFpWo?=
 =?us-ascii?Q?TFVzz0lTaDO7jzeHJjMxvo9zsqfLhZz0PUmcYSX+5qrwnkSYPyu5r5i9hnMg?=
 =?us-ascii?Q?7c8JtSFSSdlXYr1uTHeyRT0Okb7bPpikKVuNDN9Q2A7QD7tWfuk4nSC1UFz1?=
 =?us-ascii?Q?rxzByaIqkeqliWBfzguYqCz5aBtClDdoFfFEYG1ExyHQjAN6tcjCgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ssmphsb5Oav1Bc/oeKk0t3IyT7PSWiBiBioKSuOcfGyrvXN+2QWwcMuDXFu?=
 =?us-ascii?Q?tzMx4zIqoPilTFKtpy4BC0NctYwQniGgqrfoDnVGQSxgdmuxedxsfXYEcdZy?=
 =?us-ascii?Q?1ggx42s88078byFOr82Ie7ABRJCgV8smP8VBkV5oxlR/fIeLBPNi1J1ZB+VH?=
 =?us-ascii?Q?5G8mw2WWXx4REWRGLtB/gSN2UKipmG0YOqYes9kLrzYQchkgXz0MQ2rTSgxs?=
 =?us-ascii?Q?+GG0+Kp2jzje7iLo4Vph2b2P2MNY/w9zdmJL7o3ijrqYLV74NLHEMkbSt/+5?=
 =?us-ascii?Q?KE3s34Kd3FvIpEBUgByu9HwOvkxw85j2h3XqamdId9v9jf6+iStPXn3IksJe?=
 =?us-ascii?Q?tk2vlzN3F8GwbdYSwS6gYWvhDFbwqkAHOPVHH4V4paTvVlyyu0JppbZJiZ7I?=
 =?us-ascii?Q?uLBrhCii0m3dKjmJSsD8wgLUd8fSFQOmaK55AVEmsUF5ewshlDoP92QtduCY?=
 =?us-ascii?Q?zQ9chwwWJpMYF1bUf6gUHJEVPBGESQgdSmLhohoMrwE6SVo1yh4MTLwOq1Sk?=
 =?us-ascii?Q?HBXLrqbjuo+jdekza+2dI2y2HkXqodWVGKJ97grbMmEpbGDMp6qQP9ph8UXS?=
 =?us-ascii?Q?TQBrBOHdBLIXmWQCwHW18FJbLubszAS4+mcb2CFO0X6YDuD9K2SIgwky1PVU?=
 =?us-ascii?Q?WmxU9gwUuEfeaarB/6D75jk/0Zzml1nqPDNlPjpAcEdezbw3AYqmZ0dLV4OH?=
 =?us-ascii?Q?SU5YOH00uoXvAO8gqpmcSeRrRHU5ooWBgWoHXWWX4J0zYyvCqG8Ak97PJ9UU?=
 =?us-ascii?Q?6SUmM0Ycupqft9d376W+yPJ2YQH1tUJU9GAEeR0WkgWIRhVabchO1JSbioMI?=
 =?us-ascii?Q?8rwuhEMWrwtBgHNOzRB2CkFAqTCoLphGOgqO0FMop13NQBWEYQqGg4NrWxu/?=
 =?us-ascii?Q?52zUOnor/jS+aDvRpGWKcVJOAUltKfokEIbr0scJPg4cX1csMfgSysT92GS/?=
 =?us-ascii?Q?j0G4YW2L/zz50PblcBpWQbD8m8Mmf4krosDhAbLhPOt3lNCwhPJqAqwpeEsm?=
 =?us-ascii?Q?0zVYF8VgRG28etdifbyme4z5WZtex903eX8RmASFP5SLpDEy6ujVLwusHrll?=
 =?us-ascii?Q?xaRiRATgqw1jS4GkAvdkyLy5mvV8FPUws2MVwOlTzExDuWbcW4uazs0WxOKX?=
 =?us-ascii?Q?jS6THqUkV/I+9HHobi8rEunPbTBV3je+9AV2BnPvpp0awzY1a8wO/wtU18lT?=
 =?us-ascii?Q?8ksU21W6YohQqYwa4ncES6oJyaL3R4nkMyUOm5TCzHrE0Aa55AXrwAR1hOx+?=
 =?us-ascii?Q?WMoFu+g23LmDd0rCZeYLNIBrqzQSiM/SkQzLYRCMlsk5flHR5m5RQZFdUHhL?=
 =?us-ascii?Q?z3nis0R1E9O9GuMLuwE948TyxKB9tzgzreU80OpPTv558RB0Gsb/ACzfvu9n?=
 =?us-ascii?Q?1QxF8SJGtvooW9wEC88JbdQJP6b9yXArvNxibgRkwxIR4KavenfY7UvyqLFq?=
 =?us-ascii?Q?hLRBQOhlBgx1xPuGtSu4hxP793Xzcy27V8LffsDojmik7Pv9OeN7Dta6JLNc?=
 =?us-ascii?Q?pfagRbvAtsxLb3kWaBk9xaC76+PvC7/kdQuRou1EYvp2ufMsO/KsDbExca5X?=
 =?us-ascii?Q?UCY2e9UxLCIy9ohHK3hMusHF+DnHjY+MzZqvV8ZIU6fs08uEdZqeFPK9Y/QL?=
 =?us-ascii?Q?8OxmX6nD7BY3LwXnm8eRcb0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4916986a-693c-4069-7a3b-08ddad3efc05
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 01:33:38.5756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1JQyNPPqmiLppaBMzuiv0WrJ41bnsYeJNQ21bCw1u2fHElxqqIvW0pjPa3KuyEu6CYtinqKwWESJyjUcEcDFN9+tQZxK8gyYfGjrVXzS0sIx6QoihgKMRMEvOLTgg4e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_183404_358293_00BF57F2 
X-CRM114-Status: UNSURE (   7.28  )
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


Hi Andrew

Thank you for your review

> > -	return sprintf(buf, "%s\n", (ts78xx_fpga.state) ? "online" : "offline");
> > +	return sprintf(buf, "%sline\n", str_on_off(ts78xx_fpga.state));
> 
> static inline const char *str_on_off(bool v)
> {
> 	return v ? "on" : "off";
> }
> 
> That is an ABI change. Sorry, but NACK.

It updates format too, I guess it keeps "online/offline" ?

	-	return sprintf(buf, "%s\n", ...
	+	return sprintf(buf, "%sline\n", ...
		                       ^^^^

Thank you for your help !!

Best regards
---
Kuninori Morimoto

