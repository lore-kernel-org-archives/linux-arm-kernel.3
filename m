Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E85D5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 07:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Dn5emzHQjzqWwc2FQrDpB+iTBUBF/aM0kBTlUSu6yo=; b=AwIoYvSuW0XuuXhx9LURvXQVXF
	6M/BNOJV0SSVsF+a/sXft8V+iQIQHx6GIt+/UqozunSbUHmJBVW9MSZnQ1vozgPAY6S5Wwerw/HAD
	P/apWyO7jZvU7sdYZfb8Wtmqrn5gykHzWE2aEKZ4KHTwXEGiFRJpY9MZwn4QdpTzWVGCA6/6Ul/3B
	wYdXKJM/Rv1wA6OMn9U146hjG2H5eK7Vmkv4hsuv8OKt9HJb5x8yeD59IyJXb7P5FaWyelkgpyMzh
	qao5nd2qashbiEpP1xKSWDsM8tNf/IjKu+QYijAJOD8iDfDVyI/BOiFrPX1+w6Xj+SkD7UEluGdQu
	EbJp9G7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVP34-00000004omM-3flr;
	Tue, 16 Dec 2025 07:00:42 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVP2s-00000004ojN-0CuI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 07:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuSKw7xIKv/5sREhoszHif9B/KYOxXUlSvwkWBsfBJxce2JHMiCEU8d6zILLVS8nJvbADHHKhXbf4IMm8NmoFTV9W4mkWFUhcJngUJ3RS2IwlG5BNxABa/+IFZXRZ1B0Y+tQMrwPAo3XegBhLBKbCz2dsoUn6z0tANU/eHtkNRPhIo+J6ZpBO54OV8jyGVtOY4znl38wZm9G5OmdGZVDRQPZIDolBHBUJnnMEYWjuHydj8gQdtcDdUVXfCBJl9F770R7pMYoApBMsvrozGvZ+JS+tCO84UzIRE1L53nOxY4sc012UhJhD2w+AXI0Qo0KcEK77JhEmaY8U+o7mmtZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Dn5emzHQjzqWwc2FQrDpB+iTBUBF/aM0kBTlUSu6yo=;
 b=dU5ws+pSgkOCRzGSqdudWUoXIqNHCzmZvH0jjxcD0HweorpnvJ/CknWXiRA8Jj4vnIQh9hK9Vm/sFpKynNU8BXG4ealpJ1k3iioJRA6NJOBz9fW19jHsNgedNMTOccxRfaa1UbxW+WdElrlGlT+yyEx1fdpxAOcyQsp+GcTZWih9WBKZcWH66b1Vg7k3AbD+9OXJD6/03iDQqhIBuf9wvnrxt32B+XKu7wkZY6sxdkS4T62xuq9imTYh9mnD8xRvHTUhkTx3J/lVNY8nu/DKkmfFFbTLBBhtLOfGO/2r3XO5dV2YrzC1Ooaj+LvuN9bSN0wm20I+vyrN6ZRjs/4N1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Dn5emzHQjzqWwc2FQrDpB+iTBUBF/aM0kBTlUSu6yo=;
 b=Yp6RTB0ZDWqe53Otlf+vc2oAIQU01K8EYhreoIR1MOLqxQEuZoDHF7+fvKxXy1CrXaKXq/2LoXzrm5jtM+X++/UTeASWSp/RCtRMCGr5oU0yI2vK1gDNexemxyEFST2t+qRqdZvEZnoqnFfYq4GDsSU6zBLPdPrtz8P+IcoIf4dyn/bKOqb6jdy1t2vu24C0Zryr/T6vYVaS08N1CrMWOgYSumATCabdsy5mt1/CQW5xw/7QSmI14kHeXxjuaoPEQfGy43NgqwyddqnmehJ64Ko8sX4ZT1xDQ482AFtuaDB50q9u2Cw6W2fuMn1V99zX5Y0J2iHdgK9qJUr+7bOsXQ==
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by DU4PR06MB9757.eurprd06.prod.outlook.com (2603:10a6:10:56b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:00:24 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 07:00:24 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
To: Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "arm64: zynqmp: Add an OP-TEE node to the device
 tree"
Thread-Topic: [PATCH] Revert "arm64: zynqmp: Add an OP-TEE node to the device
 tree"
Thread-Index: AQHcXeC3qXeZtP7hEU+jYtZJ2X4KuLUDMU+AgAAUI4CAGr8iAIAE7KsAgAAGOQCAAAd/AIABGGIA
Date: Tue, 16 Dec 2025 07:00:24 +0000
Message-ID: <d4b2d17c-37f0-4089-b0a1-b790da36827b@vaisala.com>
References: <20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com>
 <88b72343-e86f-4b13-adcc-ba09683eb898@amd.com>
 <199062ba-9a0d-40ae-ac8c-0fbed5615cf8@vaisala.com>
 <3654c600-553f-429a-8bec-1add7f6eb5c6@vaisala.com>
 <db79cd4a-548d-46f1-b498-aac82ca53010@amd.com>
 <0435af95-a3bc-4ec7-b07b-bdec42f25c56@vaisala.com>
 <7e82a871-0234-409a-8fd3-a548cbb789e8@amd.com>
In-Reply-To: <7e82a871-0234-409a-8fd3-a548cbb789e8@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: AMBPR06MB10365.eurprd06.prod.outlook.com
 (15.20.9412.000)
msip_labels: MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Enabled=True;MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SetDate=2025-12-16T07:00:24.081Z;MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Name=No
 Label;MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_ContentBits=1;MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Method=Standard;
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR06MB10365:EE_|DU4PR06MB9757:EE_
x-ms-office365-filtering-correlation-id: a9444cb8-dcf9-4227-d76b-08de3c70c96f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?PXx5Mf74KQHXTT6RppKbUY31afYpgbEpp43Xr5UMIOKUaLH97zxMTMAAVn?=
 =?iso-8859-1?Q?3+MphsAcwh4rzcwwztBGathU/rS7oecKVhlZz4ZBrjqQrUyU4J+bYP8em0?=
 =?iso-8859-1?Q?qZMIHOAOL3XtWGBnEo5tQMxDTwYzit8zwIpfBp4jQAmc7jl4zoeKZQ8eNZ?=
 =?iso-8859-1?Q?M8QHHk7tkZ63Xc9jzlchKDmX/PjiZPlL3ua+E6OIobxKVW+4BDy5oYaK7b?=
 =?iso-8859-1?Q?cM0UsIYvXfI3N7dVOGS63rR2mAk0XwhaNbjvoBoKpeUO0rv8WoNrHmk7Zj?=
 =?iso-8859-1?Q?P77xPKVuNKAka3Jy2ez1gsxKpWBOoj0XGtkdV8gHJAGL8AfB2OXIdwutk4?=
 =?iso-8859-1?Q?YnZXzZE9lx95B1NVJyBjXHx0BJf+ZCeldl0v4Tk+2U21LlZDMlz/Mt+o5v?=
 =?iso-8859-1?Q?TPhqbpqw8aGlppjSZBOHmhgEM4rxcDBH85HBZPBfMaKo3gqREe39+1Kule?=
 =?iso-8859-1?Q?4m4C7IsamcUnuaOr24WnQNQyhERyBLMaU9K5b8Hww3Hty253As3bIjJXPr?=
 =?iso-8859-1?Q?N/xjjovl4xWFjW4pM+NTwE6n6JKtLJiNlvNYlnvdPDX+qBjzmdbF6sDryD?=
 =?iso-8859-1?Q?K6q/4XieDG4XkK0njz9yCkg3sNq0bFJWTRjl7/vUSE9lZaTj9WeHGs4y+s?=
 =?iso-8859-1?Q?NESxbZ+nPVCPBQGMtt1SulbW5IH6wABEg1LbjgtpMvaiN9kSe9Zv5udZaU?=
 =?iso-8859-1?Q?pqP+4YWdbWmzk9zFFBMtQfQ/oO8fWZAerFMpEhULeTQJ5OM4DyZ17BRNAx?=
 =?iso-8859-1?Q?HddqzLayHU6DnOgOhf0TnqfKU590wrj1cVBPduxL9rXHdoBZp9qaTpoKV/?=
 =?iso-8859-1?Q?8vRPBIm/hTgmtMUCQWftkJGD3znkD3zzDSVWHMJI+WiPgBZYLhbVYM6QEY?=
 =?iso-8859-1?Q?FB4d2nmJJ9FuaHUw6AZJEiIPs4xXouPFi5cMzTIUtN3jXUGu2xgVjlSfqT?=
 =?iso-8859-1?Q?u4AmAEnj+AZ/OKc3p5Sg+WvCBjgWXQSZNv/X8sNjwn/HI3diCLbAg0Z0pq?=
 =?iso-8859-1?Q?/WR7a77Hb/m6AWa9RWvoSDxPvEENKi3/Ibix5BMPLRYfHnSOIK6K0F5veH?=
 =?iso-8859-1?Q?4r9Myyad7uU2cv8S47NbclZbtwBjyXBSSdRoSG9XrzTW1lee67AOgB8LgC?=
 =?iso-8859-1?Q?IylFhHhYPJtVEX07UwJRPa4qSj8jNN8yoqvi9QSG2T1OW8mwKaGzdUR4dg?=
 =?iso-8859-1?Q?+1jkpt2BVXwc1NfcaLDLzwwFlrBnRoN239KQgAQ8la6dxYc8ZINaXJu5mu?=
 =?iso-8859-1?Q?elY8iOCleFnzvcnXDcpW2rmgzknJSt6mBYGj2kj3caY3cAZSypFUiru8XN?=
 =?iso-8859-1?Q?jEjHFM0qK+NqoZSL4obSp48BQp5VgybdpinDRS/usgx8QbKkx/dOXEvmau?=
 =?iso-8859-1?Q?ANofpVfQipIH8gGtTeWLm0ow6JyQLPu8WyRbPx18u1vkMlN8OVH9XCPBJp?=
 =?iso-8859-1?Q?2F/VvAVd/LOXs7NWGEKWogQXzLHSsixXw6mZW8vjNsHY0YJhw3B6/tDVpZ?=
 =?iso-8859-1?Q?Ev7tA86NLHhLQEfd3vOI4Jip/j3UnV8/s9NPYViMZoM6PPJ5lw4j8XMSjD?=
 =?iso-8859-1?Q?AUm/b/IGYZkr8+ocu7S/Z10OELOQ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?TsFcwq4yEZOe1ruaT0leYVXX0dPeRe0EDfAZDiCgvCXCeKCoHcpdE6GZRY?=
 =?iso-8859-1?Q?UM9vdG9JMShltN/3SUTdbzTDNz5Snqt4Nay3fbA1sUI7qYkjX4akRMaxnj?=
 =?iso-8859-1?Q?m3nUsogPwi3k/M48zjD9QQxFKhkxVgTeJGQtc52xLX5PaMusqbHgqfTfI1?=
 =?iso-8859-1?Q?5kaHh0WiMf1RMpX/jlt6nDqb8fY1qtnuCBNsUnQcZBIXGcWWSKznaB+obY?=
 =?iso-8859-1?Q?ChWa2ni7Y7jXSbcMA3sdaVpm7LxfWO3J5mlcLuuSbvCPLjMQ/3Os/2xzbi?=
 =?iso-8859-1?Q?9wbx8abteUjmbGPIPtt0YIT+4F/jZzmBcrB00nPuBAGzDm2QDsjb9L31T3?=
 =?iso-8859-1?Q?RvGN6/2y+jbGUS52B+SzsAfwEaYNrW8PesrcoO35/mjAoFE9fa1JQPbrzb?=
 =?iso-8859-1?Q?ABeaBu0zEv8KJKqrqdpYrfrt9Qmtv3PbT1hZJDp6wCS5jcA6glU0Zwszhy?=
 =?iso-8859-1?Q?l3MzQi3wU1xknyeoS7WOm22GjyIT8fgu8yqIG45IaIyy1dGflvQKY4J88Y?=
 =?iso-8859-1?Q?6VplPxklp/RqHG8gEc+IRzfdNxEaalmQx7Fu9X2TlKKzDhXvY2v6Xw2yNt?=
 =?iso-8859-1?Q?8mC/gISnfUG3p6cMkpnQRuV+cK8lTE3+DqnlyyAmx0+S0Rju3dZj/TNvv5?=
 =?iso-8859-1?Q?TfeOK72xKBcfIO10ZRcFRJ6mxSRS/K7c1sYDylcUzCofdUiSW6Ro1RnnDZ?=
 =?iso-8859-1?Q?k+6OXrjlccW4YOf/h6AIb32dnNQo8b8aH3B/W5NGpBCpGnRiMbJ+/G0KX/?=
 =?iso-8859-1?Q?3jxmeXmLk78CB3MSZWAAMMddWt4uwNNjiTvolSLkYeqF1SH6MD9b71hJ0/?=
 =?iso-8859-1?Q?J45qtN15oAgvsFD953IyRQcDhcKJSV6IX718c/7+/aa8f1hwJgz+d9fveZ?=
 =?iso-8859-1?Q?hZnw68mQ7ssS4wsLvdlXGvzDrC4X+bNQD5WgVGNDNvEAJk82CKm9aQLgrI?=
 =?iso-8859-1?Q?VcqjBOeaQWgipNvNNxg76vo4o3HoeCXqJ6HzeqJ/vTvF5VEylg1dXeyvfY?=
 =?iso-8859-1?Q?g4dI+E2KzZf/8lNinEtyNlNU2ebc9hyf5L79PwPDZzZRluBEpT6ZBIhl5T?=
 =?iso-8859-1?Q?fmWsHMEcfMEWjf9jh0LS25bhGJDReU8rGusHgZ5+3DmqFiVxC11RrvJJOr?=
 =?iso-8859-1?Q?8Einuo0ZmULz/OeP0OWGatAMZQRqp8ujAAgoEHN/a6hBlT2ncfAX4GkL1E?=
 =?iso-8859-1?Q?/HMM1AG/BiZTMC8A0X8ishKVojBrpJL8qXYjGevO995NO3hfRj+MJF8TQP?=
 =?iso-8859-1?Q?TtrQKNVcL1gz8od+9d1/prD9ug7j21TqCwBb3vc1pj6DBhNgU12LzcNK9E?=
 =?iso-8859-1?Q?PaptryA3oZOKoeIkkhWSsKBi7hqFtznAPpChKy3YS5sGi4AHHKHKKrTheA?=
 =?iso-8859-1?Q?YZv6qhOd/eO/Y4dMEK3MwvQT/q1qUXLd7fQ9f+pHMMI2+5XcoIme9arQq0?=
 =?iso-8859-1?Q?0WBZWV33LbpMV78O/raXraxHyeG0phEtYWMXvjbO1Vl9wXzApG4DP59c7B?=
 =?iso-8859-1?Q?FrmZ+DhgPXZzfWzDjt/o9fUrXwzgn6fFfM6O1DGE4l1b7TtcXuzl+c9GFh?=
 =?iso-8859-1?Q?3NIX+Cdz176N5Is4oslIEsqMNfP/grFDMc6yVuV3eq7t2Rp6P+wo+s/RR1?=
 =?iso-8859-1?Q?lx5SsJAmo5C1WjeMcmdKVN77hWLkxBodKK?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1267AB43D6A1DF4895D997A5A2FC26E6@VaisalaWorks.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9444cb8-dcf9-4227-d76b-08de3c70c96f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 07:00:24.6312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6uelL/pIRtac0Pm2wcv9Yi8EcxCms4kOS1kTSwaoagFchjN6Fk5ni/u3rDpSY/tbo4megY5reMjAt06uvupsDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB9757
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_230032_084183_DA0DE4B6 
X-CRM114-Status: GOOD (  11.11  )
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

On 15/12/2025 18:10, Michal Simek wrote:=0A=
>=0A=
>=0A=
> On 12/15/25 16:43, Tomas Melin wrote:=0A=
>> Hi,=0A=
>>=0A=
>> On 15/12/2025 17:21, Michal Simek wrote:=0A=
>>> Hi,=0A=
>>>=0A=
>>> On 12/12/25 13:09, Tomas Melin wrote:=0A=
>>>> Hi,=0A=
>>>>=0A=
>>>> Is there some more specific information I can provide regarding this p=
atch?=0A=
>>>=0A=
>>> I am trying to identify U-Boot code (2026.01-rc4) which does what you h=
ave=0A=
>>> described in the commit message but I can't find it out.=0A=
>>> Can you please point me directly to file, line number where that descri=
bed logic=0A=
>>> is skipped?=0A=
>>=0A=
>> Please check lib/optee/optee.c, in particular lines 128 ->=0A=
>> Target dt being linux kernel devicetree where the reserved-memory nodes=
=0A=
>> are automatically injected. When node is already there, it bails out ear=
ly.=0A=
>=0A=
> I don't really mind that's why applied.=0A=
Sorry I didn't really understand, where is it applied?=0A=
=0A=
BR,=0A=
Tomas=0A=
=0A=
>=0A=
> Thanks,=0A=
> Michal=0A=
>=0A=
>=0A=
=0A=

