Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BE0C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 04:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuX1XQh4QIqj0OBqsC3MCSYDV6O2s1yTx7p4PzRw0nU=; b=U+v3PKrnBiKJfB/vnLB+t7u5Em
	YpysU5o/jt+IzxZcYZzT/tEbtSGTI2dAAI7XABtBw+6YnhkkIn3GtA4H5EnjyLpXoNPHWbMYcrjoB
	XjGaJMiroGsUeTgUw49Qns0XuRfKja9T2hEMsyUFpI7/0oELK5WraYjRmwHYpc5c4HkcXfTx40a2C
	UAruo1nbCYOjVuU5ysC2g0Ojwfupoy+iKxQzH7NY1nkMXi2bWiOJux8zLSBeE5CveObeQnJ9P8E/E
	44amDRjnuaN/jo2qNNdeFHtF0SSJJBrk44DUmkaqfljHUtSM+pdDbUU32cH52oorbnflDh9GmPQZi
	F8vMZaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1Rx-00000003LHe-1Urj;
	Mon, 16 Jun 2025 04:28:01 +0000
Received: from mail-mw2nam04on2071a.outbound.protection.outlook.com ([2a01:111:f403:240a::71a] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1Pk-00000003L8I-3gvt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 04:25:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUwyuol4iUDBtvwU5LHbr2bUGFwLdiumtZPP7meH2E7HkiBQCPPoKo7Lm2M0U0v9pTDLfQcnZ6KqfQVXG2ipq5siNjpQx7s4DVr6YpM67Llxr3iq1gcQvDDZikC0Z1RTLyrHf0qbGv01WOo+lA44LMZulITs2LbEcY3C+6ufzNLly8WxfmimQiTIbC0ghrjB1IK/fHc3ZkRHgPCnOd+ng3Hb5VhqnnMoNC5WPf3rJcsKFpkXmVkQwJOwGldSRn8O1RXBftpiV4N4LllbFt+MkDsiNAs07rJzS1A4o9DaX0UuzYKzrRcoaYXMD/4kH/fMlfqmUpyXtOL60FoTi8nmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuX1XQh4QIqj0OBqsC3MCSYDV6O2s1yTx7p4PzRw0nU=;
 b=aEX6LB5gvmMSfIpt9rvVcz8fhg/svTQFL7x2KyNicb6JGlLi5NDJ9G1wn9GGI8AFt3qqYjGjk+OksIJk7kpHQk9d3xl6qA5QXgXtmXJMNkT1L/aAdQtQ/CjQDQcTpswkG5msGCVynoYwO2wR/yHolR0P9htIr/g7plNPILo9bio1PK7/jKX9cvcUzaWdenzAx9WEYHMMfm23twh4GNKtT+P8OJaN8CxjQGutPzHRbCHda3fnPfDC/y7VdQfW7xc1fsuhrQkcHQNL+HFWalVEKyyk45WKVCwj75BKSaigd27ZF0KqBz2Hjq2V2HWrEeMPEFvraoELp/zM3sXAPn3RhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuX1XQh4QIqj0OBqsC3MCSYDV6O2s1yTx7p4PzRw0nU=;
 b=QZ1BLZHPj3iACxBSsD/0zitpOq05TppzG4CcsB58RefUjV3zy3P5dUqBTaCs0XIfcfBSxYL7JKHF3xhPJaHk4u7Pu72JrBM4dhJMEaEkLbz0/erZG02r3/txckY9f4q3JxIuLzcK9rmvDT9T0T3RZSjvYgQNXDNvYywK0d8T2VbUs5Xz4ex7lSz/V5Gg/nvhKD48XWyCnMxGOBWPWRuiQ438ZdEXXfR3C/d8ZzU6JDhLAQiJKXM6NUxesTpr0mcMlPDM6yiCbLnyQTaxgHLV6YGGDTb/EAdhzsCo/mBultOlxDZhZNqnFJUqqSmkCJ9gGrW9vyac8wBVkIOWzhGv/w==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by SA1PR18MB5945.namprd18.prod.outlook.com
 (2603:10b6:806:3dc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 04:25:39 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Mon, 16 Jun 2025
 04:25:39 +0000
From: Harshit Shah <hshah@axiado.com>
To: kernel test robot <lkp@intel.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: Re: [PATCH 6/6] MAINTAINERS: Add entry for AXIADO
Thread-Topic: [PATCH 6/6] MAINTAINERS: Add entry for AXIADO
Thread-Index: AQHb3ZKyJ4KbwhoafUeD7rxhhPkQ/LQDflcAgAGzeiI=
Date: Mon, 16 Jun 2025 04:25:39 +0000
Message-ID: <IA0PPFBEC4B1F8E381366B3EADB63903279D570A@IA0PPFBEC4B1F8E.namprd18.prod.outlook.com>
References: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-6-327ab344c16d@axiado.com>
 <202506151027.IduXJqR2-lkp@intel.com>
In-Reply-To: <202506151027.IduXJqR2-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|SA1PR18MB5945:EE_
x-ms-office365-filtering-correlation-id: 50b7e59c-e139-4f67-f4eb-08ddac8dd941
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?sca9Ut6FifRfEhcAoDm0KRmlOfYt4+SaR3NatsiZeF79Juduf/0Ji2PUYU?=
 =?iso-8859-1?Q?b180uHNStS642PoFZa2xtGsUjz84LQMSjKYpUMOtLALuKbdX26e90D+e9L?=
 =?iso-8859-1?Q?v1ZBX60z8ammbNFrhbMwBl4n66XefkkqOr9L+nOamL9LVw4b3vS2Tq+iSE?=
 =?iso-8859-1?Q?jl4ZLrieIkEZV0U0SOO49vu02dEITcAOBoEg9WHam5y08I7nMN1HJn4j0K?=
 =?iso-8859-1?Q?em6k7GABBi4LK2kd4cGV8jEQEW97xSlMFOiXICnWf+0tBfSPgmdzFvAmd1?=
 =?iso-8859-1?Q?9cMaMEBq1YYrXIF0lWytITu5niK3EAOeTgHhSk9Ak4cyg/v8QXWbqMZlfC?=
 =?iso-8859-1?Q?bdAhX9/LNPI6CGvq/+/OwmvfRWqfAjWNDt9ErIchqjCCVSAtIidsrEj50Q?=
 =?iso-8859-1?Q?uw2rzSrOc0Scl1h3uRFfkLiJomzAPSMTbZ6XTVlL7uQ+g+rF2z6ApXPZN9?=
 =?iso-8859-1?Q?DC8tR3trK2N3DfOBUe/qwiMvkzCttnH1rKVFwkC3R7YDzfyy3PWkTTrqLc?=
 =?iso-8859-1?Q?rAAhb7bVQ6yzGKeJEq2ru6nLysFnfO27kLFWpQUPdx1Blg/w6rBeDuZm9K?=
 =?iso-8859-1?Q?dIwWTCaUONFGUlUSjN+WxiYqSpPKhYyqxEZRAaZAB+Rbv+78WaQ8m+8IDR?=
 =?iso-8859-1?Q?sdwQV9IP47aKoq1fEFMMTdI2DIT3J8A/g1fLxdb0FfPt3+/T4CZsxrLdtC?=
 =?iso-8859-1?Q?6fRbcbVPlOQXO0+8tLYx9aWdK27nX0JfQY3LzLlfUZ38rN3Bxagrbslc7P?=
 =?iso-8859-1?Q?9Vs2jdQR/4NKZyahlfj0YrlcBqMeZCNeHvIfBabSgATnA28/RvTE0B0gKk?=
 =?iso-8859-1?Q?LG177xs5NIkkpp82lGjlADLOxs67P5iVl96h9PrNy0vQ2iyLo9WHAWjIDO?=
 =?iso-8859-1?Q?V4cVm+JcbHW4AxrAFXyqyXz5blP9VpTWrZuDbH81+K6dvZorRz/fDB2CSg?=
 =?iso-8859-1?Q?l9neLOwADGsyvhIv7coI0v/9SMG//t1zgXHv8S9sRIAgXTGR0mROVuoAMJ?=
 =?iso-8859-1?Q?d83/bRvFEhPdm2MnfT9zEHO7QGs4ln0Xu0cCG99uUirvYI9HCPsLfTNmfZ?=
 =?iso-8859-1?Q?s6WVbMMOnYIN7XXloFje/cTSQbXkyWNC/7ss8blQcrNRWsRTgPQIyUkDMF?=
 =?iso-8859-1?Q?m5nrLMdavIAssK+O+XvCROpDGUnaTnhOMXd6yM5eZqxl52nDsWiXe8IXFj?=
 =?iso-8859-1?Q?yZW5RVQq3URYY/RhRF/2I/s+ai+C2W15rREG3BmGBa3Ccd/uExHP2s8Jei?=
 =?iso-8859-1?Q?kijBD6TueupVH3fQB2Y9DpPyI9R0e/f/umJjYBSLE+vcYQB7hUVFdyYE7/?=
 =?iso-8859-1?Q?F3SAgK0JxF0VfahPF5YHX6OomG16gSGEt3TAKn2KprpKajnd4FtDXyiUh8?=
 =?iso-8859-1?Q?V4KAmYNFRdYYgoaTR0ZGTw79IdaMppqpg+bUUXKCB8yjj9OL+7tBF8WcaB?=
 =?iso-8859-1?Q?ciHxaj7+1qCpyqQYAFpP3+EfdXKiONfakunp2fGvuwKX7CxVX0/pSnk88i?=
 =?iso-8859-1?Q?Fc4YvqPJ2MUblZwxDrYcTAoSyBwyLDEqze9JVD7sBBYg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iTTYYa6nTSF+PL0ry3/C09Ujz4Sg8uimRd8B5clSOqNQpr7IRcz8ffmfhE?=
 =?iso-8859-1?Q?qp+DnCREH0DxsNepKOnyLdHVH7o0Hxs5JF8d4caymYjNs7eFhLTgTB/zzV?=
 =?iso-8859-1?Q?koNIH805upDsAFVLLnOXRgbSp3VLD2+0JTLA53uMKVx+NJM7ziDwRw95jH?=
 =?iso-8859-1?Q?Ams/r56w3Mk1plK7YAeHK7ZxpshGW4fOae7pObBgsgwDqlDYbODdY1KMli?=
 =?iso-8859-1?Q?WMcNFrVta2gLz0ExNYNyk/mwVmPoggJQE3yq6TBxhUL9VPJbKo8xnHlDye?=
 =?iso-8859-1?Q?N6A8lT9GksqkU9276oraU2kmFMm0bsuhiTmhOWDGn+24zpfp1Nomp3NlgF?=
 =?iso-8859-1?Q?E8s0qOOe4q+VCGjA4YyzOr54JZFL3y9QSkpw+pXpeGlRHiZ8LBvfpmtb+m?=
 =?iso-8859-1?Q?78ptG1NX/MHboNskMOpJ4MVvCl9+cDUAPzL1B9GkWYxR5yj7/Rd1EPhd7g?=
 =?iso-8859-1?Q?0APYpNow2py60YupFmgTmqHIuvTfofnGgEm2rtYLkHj290aSDaJl2Tx0bf?=
 =?iso-8859-1?Q?niiROLDos7+url+eluQonxE/3Tgoluv5e4zXa0KSIpcl38A3LXl+IlDm1z?=
 =?iso-8859-1?Q?A6wijg5F6bJAWhr7NHebHys7TjZlbheBqrsF3odQ2XECT3/LxynU+AHSes?=
 =?iso-8859-1?Q?wzfXGjmn0r+6XgRUXMcf1TXiJwO7fQQxo2vdo72gCQeTMNGCkUk8kaJGMb?=
 =?iso-8859-1?Q?Bpknsv/HQx90fc0vAOtQjEAueb/z1PeK+lXsCNHech3fVdclxFzcImCHP/?=
 =?iso-8859-1?Q?bmv4hoKEnWZerPqKZTKUh2PnAXVWa87GdM6Qw7eGfUZIZq7p/fnDYmSsCL?=
 =?iso-8859-1?Q?Ccjo5lbiXLdbWZXK8wx5sanc6yKO7AYOkhxKHcmpUtDxJYhQTSN2ndhgRg?=
 =?iso-8859-1?Q?shuRX4DfWYSD/WYUy7+huOj6u2xqfYXaGnmTA/YbBEIj9HnTWb6bnaUvsV?=
 =?iso-8859-1?Q?KyIhg6HruNFtPuEVYjMKSCgLE5qznhTe/xUVQ5dSkpxVbE71w3VZBPJB5t?=
 =?iso-8859-1?Q?BLf2EBQ0bddOUA73w0OhNbNFlv0IpKB0Y1fKY22MmC9LddxPvxA+VVSZmx?=
 =?iso-8859-1?Q?Ec9+xBWS9o7Ql4iXK6hqr0Te9Orxh8HhOUjQxS5lP85Mb6fsrq4Cgc1QLs?=
 =?iso-8859-1?Q?973CuHuzHsjHFqmmpCKkR4XKqci4qmmJ3d8t7nAxqKf3ObG7QxRQov+jf0?=
 =?iso-8859-1?Q?oXG0OPyQY1Nh/WjHM98QaeOfUqV7ySy1YOrlPu1QEaI4G1OXKYwBOot0+W?=
 =?iso-8859-1?Q?pc2ruKwVzcrjsbvHV6dNlVVA0+zq35XlSfR+ovStgDbhASQplsIhRf9ttG?=
 =?iso-8859-1?Q?NNkCZ0yftzpc9vUYge10rvdKjBnsLOjvPmlKlSL4i3lvLbwldwnabAn3co?=
 =?iso-8859-1?Q?FU5FIjOtqImpCfZNNCcw2nC4Wk1z2XBMPuDwvgAVJezInvcskcZoIkFUMi?=
 =?iso-8859-1?Q?chcANMi2x7kw92aHhlfdmhNCU5x7OpD2bW+D4z6TBpwN/ua38sibK/qVAm?=
 =?iso-8859-1?Q?GWysDr5YB7Z6RwlFdUb1Ej1Y+RZkbXCOBXL1DNvEQOH0VpMFpIsQuBEHhj?=
 =?iso-8859-1?Q?MSgR0umRFI1vCwY540LwGQ4vRSNY2+9IodSlTRUia1DlAKveHAunVPJmX7?=
 =?iso-8859-1?Q?5lgp9Z6FsXeNFg0sMEuU0BsNdxcmjMs7b8v+PSuRxo3C+en91Puyj2r55L?=
 =?iso-8859-1?Q?TvOgpbbl3OEvq9mNMYI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b7e59c-e139-4f67-f4eb-08ddac8dd941
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 04:25:39.1277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m0/SEclG33FYxM/n6nHQ2YMoeSmDhiFYE4zxsnwZkN4dLCbbSgIa5XjGf8J1I+7nIp2N9pfNGI2WOwdAU8K7ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB5945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_212545_337106_19CE50E5 
X-CRM114-Status: UNSURE (   6.87  )
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

=0A=
=0A=
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation=
/devicetree/bindings/axiado/=0A=
=0A=
Thank you for testing this. I will send the v2 with the fix.=

