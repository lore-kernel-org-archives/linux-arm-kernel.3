Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EC3CDB462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 00:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eYfkpKYFt7uYtdW79BKvBtD+axsSdBTTAkr2X2B4wk=; b=tfisMOWN3oSfGpmRrclDnKDQhd
	nFhp0o93KKVMw1r8ftuBshjJ9s27wXOhetn+742X2fRidf219mOBvr/e+CGJN2HTY9GBJCpmNpCo7
	c8Qy3dhDPDPyHPdQpqpC/QbgqqdyJrkrFf0yiCguWflJPqFFfIPK3QoNEf8nqatZZ/vN5cDWUNP+e
	9v3UVu3hUyLscol7FYM7GaWnlrgkcUwZUCIkZZPie6LpTy2+/rZBHynvGCbto7wL3AkUfbEiMY7IR
	me/DHooD3KDhw66AqAVanYoRc9vzthNA00deCK/53MtKAKlJO27Umb53+k06quw8y4Tka80OpHSCR
	HoWylabg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhES-0000000BJi3-0vSr;
	Fri, 14 Nov 2025 00:00:04 +0000
Received: from mail-eastusazon11012048.outbound.protection.outlook.com ([52.101.53.48] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhEO-0000000BJhP-17GS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 00:00:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mS9N03rVQeSdr5YcBYuvjuQyR0tSY6UzQu7T9iLFALYpXzC34QssAU6V8kbg5QhFeMS5yEhzaVm+LEdNdV6T+nEdLwELnscwWrnqMF2jFF5PYj/gIzUp8hkmA17UYjoelDHUGrO4sQFnonxWPOwIz5cVmzPeovFO1khngX+uXvUx2rMfSCVdxMIdexM2M3+qSwGKdOfBWPl4vFhTuMz79Y7ogEpAH78qJSqt2mZ4PPMqnjUY9VpS9lXZA+vloIrn7Gfy+U7JnK6UhYw0XzltSee3AxHUIi7pQ1HqGjZumRuDVXn/LJmxjiiJ4XWxCpA8YrqEHYaEL1x7jtvU2erTcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eYfkpKYFt7uYtdW79BKvBtD+axsSdBTTAkr2X2B4wk=;
 b=iDJm9wo9rLQn9cbGjkl7PJ7TrtyjEnQ1DuJ4Bm7aJ6rhT2CKQlNsgPVy/+9Qfnj0DelhXmJHdQNZmTKDSaerfCdpgv3M2ByG8G6BxgYFnlC84idtpNZvJxSViR4caQZOTNAXAUivcdL1Fwc3HlRemN6xMf0n49uUy87rrCiddKzRLXyk56UxP7MEsO76n2huaK7ST75iyIxshWn/0va9EsAHWsldsIOPXrObSL0LjfoH+v9ecg/5Uuls8YqeZummxowyQHVEteer2mkHZxw1BDLjVP6yr2zOAlDr32YtBYv1P9Gf8JXMl2BAQVfhYn33TIvah9oOG/5fFgFL9fGA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eYfkpKYFt7uYtdW79BKvBtD+axsSdBTTAkr2X2B4wk=;
 b=p5b+uFxYbqMe5GajFiXP0+8xZDiKQgRr42TMNyZmsVMVKIKphJtWFP+g4u6kLC01zdMiJRqxfbt7WvOsYJcAklx+ObAoSJSwNPMgsLcwnoJvSpX40NxSPBL2nT4bKwBUwa5P+nC/Uss1H0vhoDyoCqsDozPV3Jj4hm4V1JyN8+Q=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 23:59:41 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076%5]) with mapi id 15.20.9298.010; Thu, 13 Nov 2025
 23:59:41 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Sean Anderson <sean.anderson@linux.dev>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mike
 Looijmans <mike.looijmans@topic.nl>, David Airlie <airlied@gmail.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Simona Vetter <simona@ffwll.ch>,
	"Simek, Michal" <michal.simek@amd.com>
Subject: RE: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
 plane
Thread-Topic: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
 plane
Thread-Index: AQHcVN1gVOfL1cVpIU6CqHq/hvIMtrTxNXCggAAJkiA=
Date: Thu, 13 Nov 2025 23:59:41 +0000
Message-ID: <MW4PR12MB71653FD94A2109A45BF4EDA1E6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <20251113203715.2768107-4-sean.anderson@linux.dev>
 <MW4PR12MB716514EB76EE4585605D0E5AE6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
In-Reply-To: <MW4PR12MB716514EB76EE4585605D0E5AE6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-13T22:48:09.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|LV8PR12MB9620:EE_
x-ms-office365-filtering-correlation-id: e46054a2-8268-4b60-4bb9-08de2310b629
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?vxMWDyv5SiAG5e6SVbBvg0X3Pwcc79B2EgVVR83tiNek8hm7R5q3aLyFRrn5?=
 =?us-ascii?Q?b5B6YpVDMDSHh+Qr049QzUVY1kQ3UD11t3s3LcNjUPSLhnP0mRUVT4hM2Tvi?=
 =?us-ascii?Q?6RVyvlZCFbOwwR9NDWcniXyLWZnIaKl9nr4nugribObnQhJS8eUSmLYVvrh4?=
 =?us-ascii?Q?G6SFWd5DPbeaueSE0ewoAuhVae9GJMeQ6Z17SWW7jTRD90QPY4plhE4dz71v?=
 =?us-ascii?Q?L3tG6jxO4Fb4GI4r/gtW+y5vc93u8a8NxZbXZgRSldQAScoEPd94qA3QJlYX?=
 =?us-ascii?Q?/IW/ovAHkG0H2YdCn8KEd1n4aE6/VYbaiWnC7CcgjD+nfeDyaIQH5PYKfU7C?=
 =?us-ascii?Q?mudEmYqszo3OR9a+IpVyF2z6afUkeUdFv4CV4UM2ZeNhuaqd61s6IuAv8KA2?=
 =?us-ascii?Q?/LBbTIM6OhIqEC+77gAroEgjwBhCaiCKadOmXEr6eyFJ3wWYCl02MZfi1N4F?=
 =?us-ascii?Q?22R06Yy00iOhtKsUSm6/BnUuZajhjhQuEwxsUbjeJo8T4iqFwncRp3ZqLdqI?=
 =?us-ascii?Q?jf9zvRCu9b0wsNWPV96wDzWSrq92pELKGrFOo69/SDs9FDUFo+/iWInxGXEh?=
 =?us-ascii?Q?93FztOTtFWOvoQPnud7W1VZ2jtfESFkoorxCBoRLTk/LbqvWwI1UD3LIfO/4?=
 =?us-ascii?Q?bl9cEEaH+haKwCldhGt7HhyH6neSx4eXERVar5ZVHeBUw4rzpCcnNYkiCVHt?=
 =?us-ascii?Q?Xl738LJ7DI+rcryHL131DUEZ2rniZpqlQVWIwwGVOHRyNFbD/p6yz1S79fzI?=
 =?us-ascii?Q?3ZeJ/JB7pGwWMoqPGr06YoHiw+alCVTbUBlKjPqNYaJNalPPvM/3Ek1prgEf?=
 =?us-ascii?Q?9jbRIe/T36cu61myoCll6NgIH9jkgGH2kcEzYF6YSXElxDteJXlTnrItk62F?=
 =?us-ascii?Q?rngylUH3BKlCJCfqI9SSDc87WaLhSJmozZ8QxtnqjKdE6ml8PVUEqdn+TyVd?=
 =?us-ascii?Q?COuMQQYYlnXVs3HtVXORBMcExFPPMbbZIQjBGgc9ZeAEncnhr/GlGnt4YN/K?=
 =?us-ascii?Q?4ELvDvjfnT8JsOhABqx7rQw4s7v+Y0orBdUJp4arBJT9/yCUvWhDCxstndgB?=
 =?us-ascii?Q?3hccsEvQfhJLqiXwlyQ86poS4OejG7zKKrGE1xWaVoNdq4QGallhdhRTV5AN?=
 =?us-ascii?Q?44HygRidlWWn5oebDGpuNFfDXaEgO1lomJIbBEBZ24Hj717LoKwMzRiqw80z?=
 =?us-ascii?Q?btO/OGzndTsqrC7EwkM+YIWRj6kkRg3aZbfnzOC6zBy2oFTjAdSVBMoOSIEM?=
 =?us-ascii?Q?uRrxmDv+l1Q/LxN1ce79MeDLxhFGnSURPV6tFpGIrU4STJG8iwchpfX47QSO?=
 =?us-ascii?Q?QYRJimwwqmxMwwwo8taXz8Va0f9IuXnxr2Gt03nCrd85xK/YQrTxU5cbonsF?=
 =?us-ascii?Q?QpoV15xUhZuA0z6on98Euiqzh57WjWPGYjMcz8aQqQ1Kbeel+t9XKIqTNZCS?=
 =?us-ascii?Q?iuwiH1iOkSP6EMHx7yKjLOEWj9vb0v0YkH4ZvPX6ywee76ef1XgkABJ61mDO?=
 =?us-ascii?Q?puqygBaeqYzJS1Z8y+bvi+K3NZzEkMFvu3WK?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7165.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GqZ3dzu/97MsQtdBCniAZRU/L4CKuVC8zWelgBpwhJ/jZGbOlLEF74LmfeeF?=
 =?us-ascii?Q?mCjqxWk/JuwqYlKN1zkm1LzwyO5eEmt+xPaFpYTkFGkxuUSddeZRpqUhle1L?=
 =?us-ascii?Q?hSQvSs6lTuGDaR4l3haXOLiAIEtVSJUW86lK1V/DhvdCHsJ/ev0E6ldXJ5zU?=
 =?us-ascii?Q?CBGLXSS80eYe8nYsKB7r3SjhND8txfQ18rvAAU9z8K/UxzNyMmdQuRXe07k6?=
 =?us-ascii?Q?5dJH0gdKCFj0eN3pYMTlG/7g65xEcEGwtwf8Wwj1vpszecBPk+tiIyhmc4f7?=
 =?us-ascii?Q?dUVDRW7zTmKX1vbQtKUFVu7Ez2R1Bh8Nb72QPy418vEhLCZiK3o0l3psxoNf?=
 =?us-ascii?Q?X3FYlhEX/DQuAhONUUqwlKIkM84orwIt8d3/91UgJz/RmdQ/d4Emt3tb0avZ?=
 =?us-ascii?Q?c7qsFoZQOy9xLxMtyKxwNhIEL3DKKT6td2lyAtLhFa8GRukxwmDa+itn7mi4?=
 =?us-ascii?Q?gBdtUYBJkQeGoml0qdH6RU3iXRZjZ1TdMcnkh8kOJ2Po4P3g8eX7kdILONzJ?=
 =?us-ascii?Q?I7M/TTUqhDezzoDzAdipVQg9uRKp9Zbpjs0xTLPAP9cJZMIIdiaFjMHqC5A2?=
 =?us-ascii?Q?6DPLKZlXZtBMHKx7eWPnIGhsWtGKPRFEvPbWFqX957eiarDRSuREejn54UyT?=
 =?us-ascii?Q?Vy3j/3EAU3N9cWrNIHOKsY37Q0Lx6E4UjJ0wBFnaL1v7azJKFBdiXsf+cZlC?=
 =?us-ascii?Q?sKvUhi1B01B8/Y/tTMmHXLlND+JfiiMxcrHhR/8jaEuGXJXqE5CDdoS1Ah5F?=
 =?us-ascii?Q?x+kTeWYgt7uO4eRrirlZHR/sx3vu+J8DpTrQj6kYEkp+K89gdUHG8nwPB4D7?=
 =?us-ascii?Q?rH46PKSab+eyS4dhP0pGHIyecdv+dBvvsyOtotbSrOFcsI+VYg/0yooG1OWu?=
 =?us-ascii?Q?x17GzIWELQYq4v8yhrfxMAARzZRKT0Bnbqo63aIWA9z781MsiEokP7ODBQc8?=
 =?us-ascii?Q?VNTeVihphb/hmx1M6AExKfDPxsVZeHlLmxOKFDMWAXEJEFeQNfN58ADBb2yB?=
 =?us-ascii?Q?A4YAPKXqO9Di7+UPoCpGc2KYfXKw+cnY62jKjCv29sqNkHvxngwwW9yri6AH?=
 =?us-ascii?Q?0WJ6NSDk1CjisRi6yeynHdvXOTRnV7gijN4ibXH2Xgv3KI12IHufUQpPzivU?=
 =?us-ascii?Q?IDLzCglrqnG5J5WBVYY7QVAzoEBZrEKZi12/gV6t/49cmXGW0ZElJKqrxKjQ?=
 =?us-ascii?Q?v+iV+chOL/I7zzr1ojbln9T72SOabH0ogWxmQ5vSDqjRpbM+1usjX+Qfjso4?=
 =?us-ascii?Q?WuJXCFMfs+CkJitJuVpKfQ7FY0sxFbn2wQ0EfGYDNmWqjRyMlvB82zXRXPZI?=
 =?us-ascii?Q?QPz1AKiubGLhDMgk85faepk9mjFQCMDfLTC4StUAMvMl4z2Yk5zZL5NvUo02?=
 =?us-ascii?Q?LLdcNknokToYIsP2c7ye0pO/9MPGeBkectHY/Ao1y2WA36r8hD8Lz0IwMUfX?=
 =?us-ascii?Q?WERrreK08iB6McX/4aJNzgQ45cV23dFZHVX+WHdnEOh63nGK7MiRr3Jvp5xD?=
 =?us-ascii?Q?eH3mc3ogdzcob/vDUGzKqVqlyEfv2HrKkDtZvd8j0GGoK8pKucPedefsoukp?=
 =?us-ascii?Q?7yTzYSJLB2d2oWwz8OI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e46054a2-8268-4b60-4bb9-08de2310b629
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 23:59:41.5576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LEw8+CQ5f0U47tG14Tq03lm/rokox7FkZZpRNWYtXJugUfElzitB5pddaugIU24Zae5KTr1UkVktZhVczOjo9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9620
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_160001_921422_AB44AB16 
X-CRM114-Status: GOOD (  30.39  )
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
> From: Klymenko, Anatoliy
> Sent: Thursday, November 13, 2025 3:04 PM
> To: 'Sean Anderson' <sean.anderson@linux.dev>; Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl=
>;
> David Airlie <airlied@gmail.com>; Thomas Zimmermann
> <tzimmermann@suse.de>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> linux-arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Si=
mek,
> Michal <michal.simek@amd.com>
> Subject: RE: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
> plane
>
> Hi Sean,
>
> Thank you for the patch.
>
> > -----Original Message-----
> > From: Sean Anderson <sean.anderson@linux.dev>
> > Sent: Thursday, November 13, 2025 12:37 PM
> > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Tomi Valkeine=
n
> > <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.=
nl>;
> > David Airlie <airlied@gmail.com>; Thomas Zimmermann
> > <tzimmermann@suse.de>; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>; Klymenko, Anatoliy
> > <Anatoliy.Klymenko@amd.com>; Maxime Ripard <mripard@kernel.org>;
> linux-
> > arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
> > Michal <michal.simek@amd.com>; Sean Anderson
> > <sean.anderson@linux.dev>
> > Subject: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
> plane
> >
> > Caution: This message originated from an External Source. Use proper
> caution
> > when opening attachments, clicking links, or responding.
> >
> >
> > When global alpha is enabled, per-pixel alpha is ignored. Allow
> > userspace to explicitly specify whether to use per-pixel alpha by
> > exposing it through the blend mode property. I'm not sure whether the
> > per-pixel alpha is pre-multiplied or not [1], but apparently it *must* =
be
> > pre-multiplied so I guess we have to advertise it.
> >
> > [1] All we get is "The alpha value available with the graphics stream
> >     will define the transparency of the graphics."
> >
> > Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> > ---
> >
> >  drivers/gpu/drm/xlnx/zynqmp_kms.c | 24 ++++++++++++++++++++++--
> >  1 file changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> > b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> > index 456ada9ac003..fa1cfc16db36 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> > @@ -61,6 +61,13 @@ static int zynqmp_dpsub_plane_atomic_check(struct
> > drm_plane *plane,
> >         if (!new_plane_state->crtc)
> >                 return 0;
> >
> > +       if (new_plane_state->pixel_blend_mode !=3D
> > DRM_MODE_BLEND_PIXEL_NONE &&
> > +           new_plane_state->alpha >> 8 !=3D 0xff) {
> > +               drm_dbg_kms(plane->dev,
> > +                           "Plane alpha must be 1.0 when using pixel a=
lpha\n");
> > +               return -EINVAL;
> > +       }
> > +
> >         crtc_state =3D drm_atomic_get_crtc_state(state, new_plane_state=
->crtc);
> >         if (IS_ERR(crtc_state))
> >                 return PTR_ERR(crtc_state);
> > @@ -117,9 +124,13 @@ static void
> > zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
> >
> >         zynqmp_disp_layer_update(layer, new_state);
> >
> > -       if (plane->index =3D=3D ZYNQMP_DPSUB_LAYER_GFX)
> > -               zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
> > +       if (plane->index =3D=3D ZYNQMP_DPSUB_LAYER_GFX) {
> > +               bool blend =3D plane->state->pixel_blend_mode =3D=3D
> > +                            DRM_MODE_BLEND_PIXEL_NONE;

I would suggest adding
|| !plane->state->fb->format->has_alpha;
pixel_blend_mode doesn't make a lot of sense for non-alpha formats but may
have a negative effect on Mike's fix
https://lore.kernel.org/dri-devel/20250627145058.6880-1-mike.looijmans@topi=
c.nl/
if user isn't careful enough around this property.

> > +
> > +               zynqmp_disp_blend_set_global_alpha(dpsub->disp, blend,
> >                                                    plane->state->alpha =
>> 8);
> > +       }
> >
> >         /*
> >          * Unconditionally enable the layer, as it may have been disabl=
ed
> > @@ -179,9 +190,18 @@ static int zynqmp_dpsub_create_planes(struct
> > zynqmp_dpsub *dpsub)
> >                         return ret;
> >
> >                 if (i =3D=3D ZYNQMP_DPSUB_LAYER_GFX) {
> > +                       unsigned int blend_modes =3D
> > +                               BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> > +                               BIT(DRM_MODE_BLEND_PREMULTI);
>
> | BIT(DRM_MODE_BLEND_COVERAGE) - this is what implemented in the
> hardware.
>
> > +
> >                         ret =3D drm_plane_create_alpha_property(plane);
> >                         if (ret)
> >                                 return ret;
> > +
> > +                       ret =3D drm_plane_create_blend_mode_property(pl=
ane,
> > +                                                                  blen=
d_modes);
> > +                       if (ret)
> > +                               return ret;
> >                 }
> >         }
> >
> > --
> > 2.35.1.1320.gc452695387.dirty
>
> Thank you,
> Anatoliy

Thank you,
Anatoliy


