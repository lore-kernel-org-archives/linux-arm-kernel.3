Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FD3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 02:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CexyN7yq3ZomFRZpH3TTYROjTS9LM/5OPyFBlEUxihQ=; b=x4XaJtZFhGn3XXwozs2+vx8Sgb
	yfTCgmVN697UwSlA/E4CoAFUs22lMPCmKLjpRdy7WUXHbmRcz/iM6IdXb5DUTtvp4G0DG5Gx3cEVA
	1voGEHCJVcLIIqMPMTS8nGbFerJnyU0mUFpOib4Nhv+e/CyqGMCLHab9qHf51MG+0Ib3Vzga14gFb
	noaQ2mYAuSx45HCVUE6+i5v1hhsJDdgQ1n5OEAsZNQ6f2G0szlcZmLFJpx0yqFGcs621SaZIRx8EO
	YYXP2u7EPjf9Snu6wdRCpVWZre5Ea+z+eDVfZnm9lsaZ3/+1XpXwaz+e7jBWi61Lwn1lLqlzBgwsC
	snS+pnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNK-00000000UrA-0uTG;
	Wed, 01 Jul 2026 02:08:30 +0000
Received: from mail-norwayeastazon11013013.outbound.protection.outlook.com ([40.107.159.13] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNG-00000000Ul3-0cv4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 02:08:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeLaMGdaw6PCE6BJFzzJTxmZTYAjdHKCyAG4EswHElxBUpydH/iJc4hrioMHUiCOD1je4tcRMvG7h2bdRje/GE1V/DkLSHiuwywN+PCS7GY8CNayk1ueGC7C5dYCYw9WdmBdFTRroY8rWgLCPH2BHZJJAa3dmGZ2Ot18zSLilHO5dp/LyY583zH1lqNku/01hm4MC6hIWeg9CRec87aaxGdclN72A++plJcUyrgTdgkaYKHR10uL09WYiS8TQ4n9vdPKT/kc2Li1xu80bUdkAkN+bUOu1XsnjazSooilH23MTq6JduQL1N0v/8LCnqigWlneuNEar8Rrs0CvSfp64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CexyN7yq3ZomFRZpH3TTYROjTS9LM/5OPyFBlEUxihQ=;
 b=HgpHnjZqANURK5gUgtRDKR/vVbVa7ipQL1J0m2YIBb28h9gTf0REUCM5AEcJL3vAtXTE0Vd8uo/KCj/NQG4+jbwOkqm99Au/A0JNWyjabyfj4nk2QSUGEUqOW+ngebrwHPfk8R47HGjbD7k6KKjL19kN5VKAwxATpkNHTKrbCwz8ehAoX653/ThiQ5D+6eZx5o65VxXqx6aY1vs6I+OgjYWY9urnToqq/8G3c/Ts73A/PxrzO/FgSQo+iYPhIsb481E9rN5iqZoXioV27vmfPCNIFR09lZ6PT19IREeFmKvXUDMvNvHCGQRjpe6WO+Z6myWW4QGEhVae9iOYl/IEnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CexyN7yq3ZomFRZpH3TTYROjTS9LM/5OPyFBlEUxihQ=;
 b=TsEKxKV35wjCZcoWwogxaBh5DlZ9QHueNmNuuNirb1eK14DxlCJn6udnoBJZipRGI3I40ZZjmNl84bkVUQ55jOpv0NAyPQ3CCW54qMtle6gqnV/4meDgVPkuzlWa9z88P2wX0c5PH6MRHO9V8TZo24Cmm0wMvLVc4F6XLp04PLkfYBroln+krB1LlQC1Vy21htHsjKX2m/7e1xc91UhKdfxoJpGenyT1Fkom9HMqFeMijuCAQ+wwznqNKP8jIfR0YGPF6wza4ZwhpukLbtYu1LJOvkH3BWqztA5qJJfkItUNmEfXMjfh7lxaUe11JUYzPC2Cz9E51wK0evTbwlLoDw==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI0PR04MB11724.eurprd04.prod.outlook.com
 (2603:10a6:800:2eb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 02:08:17 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.21.0159.015; Wed, 1 Jul 2026
 02:08:17 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>, "Sherry Sun (OSS)"
	<sherry.sun@oss.nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, Amitkumar Karwar <amitkumar.karwar@nxp.com>, Neeraj
 Sanjay Kale <neeraj.sanjaykale@nxp.com>, "marcel@holtmann.org"
	<marcel@holtmann.org>, "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
	Hongxing Zhu <hongxing.zhu@nxp.com>, "l.stach@pengutronix.de"
	<l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"brgl@kernel.org" <brgl@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-bluetooth@vger.kernel.org"
	<linux-bluetooth@vger.kernel.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>
Subject: RE: [PATCH V4 1/8] PCI: imx6: Move pci_pwrctrl_create_devices() to
 imx_pcie_probe()
Thread-Topic: [PATCH V4 1/8] PCI: imx6: Move pci_pwrctrl_create_devices() to
 imx_pcie_probe()
Thread-Index: AQHdCHt3fMfFnQkxKE+c3n4Ozu8chbZXXVqAgACN5VA=
Date: Wed, 1 Jul 2026 02:08:17 +0000
Message-ID: <VI0PR04MB12114DC73A4A436EADA5FFF8492F62@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260630103139.3823329-2-sherry.sun@oss.nxp.com>
 <20260630173745.GA155769@bhelgaas>
In-Reply-To: <20260630173745.GA155769@bhelgaas>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|VI0PR04MB11724:EE_
x-ms-office365-filtering-correlation-id: 1b1fd785-df21-457d-b8c0-08ded7159dcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|19092799006|23010399003|7416014|1800799024|376014|38070700021|4143699003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: 2arqUEewpT9bAuQt6sK38H7+bYPTsbMoRoWzbcV6q40/XrzFcaaZ++HH6PwmVq7ILC4J3J7Kvlg0f0D0lUhrk/asq1Si1gtPgrXz5+EhglDFRTd9O+Ou+9cLcjHv42+NkJ47iu7AcuTQ9SUvM+izYp1zBQAVzDxspy0ech4wZpcgbHeX7kSbFQIvtp+xJB3AjYDjM0BJjIgaHcZVhmQU9Lv8RHfX1vN0Ym4ihXPSfb1XVCVSSO5HfZVurmQOXlgg5+N3PvsLMihgHAuKPTXFR8Y8dwwnARA1j9U2IEzvBQ4VrantN3cjLwzB5sbORGIviFRccIJxevZAXbXNRb5jIzN3ISDFxbFO1P1b8QKH9wNjk8j493Y+J3RxxwTNAJq2ZLvx7//ktCvevQjcEeYx7bblynIPAbsqTyB5d2Hrrgqg3LXkW1zGqCodUYcqNjWfYnNBEZPOILa5mZjQXpu6MS/Y3JSby8ssnuFW3QcU85s0EtmNVnhOiqUJq+z1WjfLC6ceARwl2zGC39Zsa9rJJx9Luv6Ydikd4N6/coxwlhb93EbR/Cdn5dTcped0dGrPbV0T0nI+qSPdrmDVuThe8uzCHtz8o5l5UF6IHxSPHXjfgH7dK5HsM4RwT7JQLATbxV8ACVON6xfjgLNFIGRnfXsFgj7JgvxbxfN1ElnJ4TTdOvA0hMT3QcQImlOp1lLiRT9o9CwyB8PqxZt7yIBqZYuo6ZYZcsFaUQotEyFkhEQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(7416014)(1800799024)(376014)(38070700021)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rp3f1CVobMgStIfRyAznVCU7p7xKB/lxTKZpG9zcAkIug8RNMzga2dLoB/nt?=
 =?us-ascii?Q?zj192GhpxsCqL97jYJf6JVNqxLFBtbW2fnzwr6X+hoSecFijyi7Nj67+vcIq?=
 =?us-ascii?Q?48+L9l/in9jl1Jf+p3SzPwNEzL6qoaBu+fNvywL6Dchbx4msMpAYjofXTzsR?=
 =?us-ascii?Q?R9LkeNxPLNCDF6UCNQIt79ksVuwRwkovhIKKTctoyux0r+sCjD5W9aP5UnLe?=
 =?us-ascii?Q?8aBQ6KkePB/5k8EOhn6dW5Je3c9ykNT51GRK7iAf4MjlSO8aqxbYCbsU3p4I?=
 =?us-ascii?Q?KVl607Z9YOmgiSG80uzMWSk5krgXlcxU6BLy2IsXjVTNzxMzkvmhpr0nJc6b?=
 =?us-ascii?Q?XlKwn7jHdGiK+odQFLWFi5cLo61y/43HX44hdvPRfkAGMulBupzoKIaSAXZe?=
 =?us-ascii?Q?A+Vn93KEbEVjrx8xu+KK5pvZs7fhr+AqRlHdNuurP/uHoZXQis1/DFNI0Tl7?=
 =?us-ascii?Q?Jw8C51eeU8y+n+eQ5Hx5SrgdDfWEiO3yD7/+ijXVUKMQF/N4x7mYCe59xLu6?=
 =?us-ascii?Q?sZECTtqFap4wLt+O0TBMpXrdQ2yvLhqA0N74ws5LbqNSGaS7/wtcetX7+KgU?=
 =?us-ascii?Q?09z2G+GsZe35OaoeLPzjjKAbIZVCaboNGLc/EzGTVe4owZeO9Vo9UHgifnFq?=
 =?us-ascii?Q?eAcAybJfwjpqHj+EWs8SINrLWsqSMpL7jsTWlsMVjy+HDiaK9YXCQtKEon2h?=
 =?us-ascii?Q?I8bYeTzwDPG9UWW7Th1sS74emXVvT6kUI25ClcYWSu6SBXgKlTgRfFzyzeN7?=
 =?us-ascii?Q?HcgGxI2wfJQX4Y849tzU5PNTo4We13TxcIHIzws3Mi+k8pYT0sK5eQyNRCyR?=
 =?us-ascii?Q?qtGK5GhDUrZyjvo2S9+TFU1wobOn7mr790hOaPkOR5EskfFa2IiJRGOQO5rD?=
 =?us-ascii?Q?Tx5c5XQF0pSQCln7tBLmJOT2epNr23VHCSSzHjh5u0I5x6kzX5v3aonhTgck?=
 =?us-ascii?Q?a3gVmkdoI6SG/sVsXHmDBOWxEsbxpx5GJm9DlRwyC9pc3/ROxT4QRxSqQq6L?=
 =?us-ascii?Q?OqRhqDYQdZ8zC4PlljXQeNwzPAM6FtabQIYiKfzBsa2ChXK6Q9Tgd0M8jxx7?=
 =?us-ascii?Q?3xnywkMJ45YmXOPD+Q8hNCf5EQQjNksVQ2a6lh6fK9pgWsQSEF5FmkulakMu?=
 =?us-ascii?Q?ghxQwpjziqaeoPCJcPJrjojfhfUmjF3yFbH8O5ttWFBkCFGO7BM06NGOM3m2?=
 =?us-ascii?Q?effWg/vfnOZvoDAlWfRwBh8LTT0l3Kp5/tm73Jc5F9FJ2dhNCjfiOYR5c6v7?=
 =?us-ascii?Q?5mB7aZ2Qbd5z0eOTzUpLzJJ/spKnGHxSygBSzncmS1+VH53uTCZvh2pivenB?=
 =?us-ascii?Q?ACloz/7VU5NhEgS6hijmS/2tP/IHpqlLHzfG1ZOlXN/xEXx7zbAUE28Z8y+G?=
 =?us-ascii?Q?FpOIidU6vAu4s/2M8EMuymK60A/arnP+VdHpZCewSg/ixwbg8Tp36ZDO365u?=
 =?us-ascii?Q?FLiw9kXidrRB6JttcLlzA2KkpzscLACHpK8CkxXHBEP5ZfVbUObbigR0mkY0?=
 =?us-ascii?Q?IrBMR/O1dLfmlfoC0BIwPqI5uLKQSQBVWKZz2XMoeUOzUpLk5izXl3d3bIy7?=
 =?us-ascii?Q?KwXXrpwxKOO7/oTpuuhBbpZrmVoMLFpp2wO4/ILMf2EJ163sCnoqCxxW8IfG?=
 =?us-ascii?Q?4u5efDC86Id32ek2vWu8daKKgvHOQG8vBVEuPmlpWWR66AdqZaAYTZ8e0YNQ?=
 =?us-ascii?Q?WPkUplrhlpf7D1cVYN8rYFe9BZF5ICM16q8Gbkzo80jpMtWL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1fd785-df21-457d-b8c0-08ded7159dcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 02:08:17.4455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqEAC2EHIHYfKILjuphbvr9RfPAlmBVlvxnvlvUu2Xj88Rm7vedEOT92N9hqxfX3mj/le58+rZ3tUIs55EE1uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11724
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_190826_386049_07056FF2 
X-CRM114-Status: GOOD (  13.65  )
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

> Subject: Re: [PATCH V4 1/8] PCI: imx6: Move pci_pwrctrl_create_devices() =
to
> imx_pcie_probe()
>=20
> On Tue, Jun 30, 2026 at 06:31:32PM +0800, Sherry Sun (OSS) wrote:
> > From: Sherry Sun <sherry.sun@nxp.com>
> >
> > Move pci_pwrctrl_create_devices() to imx_pcie_probe() so that it is
> > only called once during probe, similar to other regulator_get calls.
>=20
> Can we say something in the subject about the purpose of this?  "Move X t=
o
> Y" summarizes the code change but not the motivation.
>=20
> I guess previously pci_pwrctrl_create_devices() would be called during pr=
obe
> and then again during resume, and we don't want it called during resume?

Your understanding is correct; I will improve the commit message to include
motivation. Thanks!

Best Regards
Sherry

