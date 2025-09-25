Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38354CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 02:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2I39N+U/H7g3FqPp/lHWzKeTZ8DH0ARsOj1XHH367Q=; b=dyIrIdnC5Zqq5vraGrjFAs/4Nd
	k9ICCfHRutaHpsisobsNpPLidBUjoAT9lnzp9Kn1I4sBe1iZd+IhiTtds373NAehdKmEeVYPoPYmn
	BL4CEqccTWZuaTptIKxVSe94yMiEtXxWOYyXqKFFjFcXFAENM75DtDfpwBn7ds7fmEKNXWh8tRaTc
	pmQt0fIwMtygBDp0sdZvHHAQNPAtlj5FrePCBkJGVS4pyUtTU6DPNUtfhg/cXUd0NX6EHV1F60YU0
	WLJ6LqxfIjmdrChJ7klL62wfwwUGNB+WoniA7xhab9CKGF7TMiKZ5Owll6joaZrUwnICtDQy7bjIh
	exlAesXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1c1o-00000005Lf8-1laf;
	Thu, 25 Sep 2025 02:48:16 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1c1m-00000005Lee-3Ot9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 02:48:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtoLqfteFT2d7NHq0ipqrcY7QJWLeIJsLpXxYCnD/0iY80HF7ATpMdF3yADL//rKDw/q3AOYaNOYoWXwSU7jz3J+P5f7f1UpexIr4sFKlmfrEz7tNmydClaJX7VvZpG12ci2tIcG0sN3E1yH5dTDxWlfIw90pgK27licaHgsilUJFf/WpuVnbjljKfeDW93JB8d6tXXWDIgdx3mOitCUIEsC6DEGnTIWZO1k+Ir/oTqR/Y5iEprC71dAgsIFhc/OtD57PkR9L1reYF2JrJRPFe5yX7g65M2yxDbY8BeGv4cqDC74ayR9jxSv1XkKXsbcM4+Mu08xsSZPpwmZx1W1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2I39N+U/H7g3FqPp/lHWzKeTZ8DH0ARsOj1XHH367Q=;
 b=Topu6E6ozavv18Kx8RfjwYU4mUbNKnwyDwmzoibF9p5MHo18aryBWvNPNFdU4+Pcf/YWV5cMj+fbMqvkpf3GEDwMZFbppbY0gA6LzJaz/xMXn9Lv9dKjtyVKMggkhs4tnQqYWLd0QeXJGDf4t9sr4vW9E+en1LJe0OMeYT6HM8ODCi+WWjXhr0rkmVCgeR72VIJLlIR8GzR4HKxdoiqCj6b4Ynoq2LvOKejDfFeBCt4SKozxxXC7DzX32Vb9wzqSZOMOrWhbNwRxvKsYXxxoM4uFkFIZIRPdhQd4lLBEwmpdk4kmq87A1Xzn2Vmu/vD26YsQ9qU9pUzfJf7pFgt0MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2I39N+U/H7g3FqPp/lHWzKeTZ8DH0ARsOj1XHH367Q=;
 b=tGvhOY/tYMdeVTYYQbrOUCpVRjEyuWFlAFVpj2RzL0vv2ILyARAUBg6XfFMO6v0bPGKtjiRGPK6tWSMXntoHQhqBGlOVtWXdC4/z0fvZqo7hxp/zwgEATFy6AqfQzWgGP6Cxam0X4i+ROX/0Mm4nk/O+riCpYrFwQc/00t9WnrAkaXjdZSU+X2aww0Gb+3y8ntugtugijks8p63toh9LOCKN1lmY7Gbs/IRMyga6nJwKIvpkdNIogqKWug2jS16vN1YLvsUcrZH8ydb/6HlU95djXr19tEdqn+TQx2yXiASS0NLhAtLC5qrxDr5kaGjSQBDGElLtpqUDPYmdHW6MrQ==
Received: from SA3PR03MB7187.namprd03.prod.outlook.com (2603:10b6:806:2f6::11)
 by CH5PR03MB7983.namprd03.prod.outlook.com (2603:10b6:610:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 02:48:05 +0000
Received: from SA3PR03MB7187.namprd03.prod.outlook.com
 ([fe80::3145:43b1:92d7:f7a4]) by SA3PR03MB7187.namprd03.prod.outlook.com
 ([fe80::3145:43b1:92d7:f7a4%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 02:48:05 +0000
From: "Ng, Boon Khai" <boon.khai.ng@altera.com>
To: Jakub Kicinski <kuba@kernel.org>, "G Thomas, Rohan"
	<rohan.g.thomas@altera.com>
CC: Rohan G Thomas via B4 Relay
	<devnull+rohan.g.thomas.altera.com@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Rohan G
 Thomas <rohan.g.thomas@intel.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Gerlach, Matthew"
	<matthew.gerlach@altera.com>
Subject: RE: [PATCH net v2 2/2] net: stmmac: Consider Tx VLAN offload tag
 length for maxSDU
Thread-Topic: [PATCH net v2 2/2] net: stmmac: Consider Tx VLAN offload tag
 length for maxSDU
Thread-Index: AQHcKCVSUjA/+iFPsE6iPjJqCYA0c7SX+60AgAnSuACAATDIgIAAPgFA
Date: Thu, 25 Sep 2025 02:48:05 +0000
Message-ID: <SA3PR03MB7187E86569E04FD731FA69AEB41FA@SA3PR03MB7187.namprd03.prod.outlook.com>
References: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
	<20250915-qbv-fixes-v2-2-ec90673bb7d4@altera.com>
	<20250917154920.7925a20d@kernel.org>	<20250917155412.7b2af4f1@kernel.org>
	<a914f668-95b2-4e6d-bd04-01932fe0fe48@altera.com>
 <20250924160535.12c14ae9@kernel.org>
In-Reply-To: <20250924160535.12c14ae9@kernel.org>
Accept-Language: en-MY, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7187:EE_|CH5PR03MB7983:EE_
x-ms-office365-filtering-correlation-id: 6b0cb85a-ccbb-406f-0d04-08ddfbddf3c6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Txopmeu18fhH4dz0m2W9k9y1lizLLtx2s3STa7FlFujjLuGr4B5peBb1B66s?=
 =?us-ascii?Q?p+rxN+ZNuFSIL6QDKEBJcZxWBnTrmmSqMabn7t1BGmxqTBiAr5JT6p9fPwYr?=
 =?us-ascii?Q?dioLXNNX5pQTSE49xuUHEh5ASWbNrUQNL5x/OOYVHJGgGmEsOJxTEC9WwqJg?=
 =?us-ascii?Q?xQ5nAZZ/syZTML314US9mnHwBQSO/9/45NJfEc1l5XgpTge9i7CJvUQY+kY5?=
 =?us-ascii?Q?d31msoJDMiyYn5Fo3Byv8JyMnyg18HvDC9Gt2dZHf5pW8+9i1ccR4Yx3bphD?=
 =?us-ascii?Q?CJbphGSes35ueHee2jkUv9iKSoVaOb6SDOC9+qnQ46bOMs3gdRTVJQs6Q9Cy?=
 =?us-ascii?Q?1njOlXq7cgWxXZ4cbjFSq4zk0i+UWwqB8l0m74l5lLrSr6UvdMw5rqX4GvRT?=
 =?us-ascii?Q?7wRexqN6VNbTB8DKBKPd1B6xuhek3IE1lE43NLOdcXh2zXgpCFHpULA4m1Mg?=
 =?us-ascii?Q?pjA8jhbfZ4Swwdj1rfalb6wW1Y8m4qUAqYvzuKx3XXinakt01ijpbA01wiIW?=
 =?us-ascii?Q?ddqVlG7GoSYDBQLvyra8CxVew2yG6GV+CP+vXwDULtwrdnGl3icCdqrepsID?=
 =?us-ascii?Q?3ubbHi8jQYSrbrzrmyErb8AWMAacam+CupKlAyqbqaTd9b9PoO7n4Fg9jxAT?=
 =?us-ascii?Q?irKhh171sHkvu2iX9MTGyhe7h3mIOIDPEkfD5OmEfOqY1qWsVnPAxFL7/Pgw?=
 =?us-ascii?Q?nz3TQ7n6FhjHI1Ore8+4wvS7eIVfslpbGGxbGZYWPixmeZPxyihdQleMZDpA?=
 =?us-ascii?Q?NId7AHbop3+O1soWLdKutfmd8edNfH3X6LpBbESo8hYs6Fg+VBbdXXlNO7Qs?=
 =?us-ascii?Q?OjAip5BnN73UsGuXT2imbRSTk0VrpssPJtzaSDKL8VELlKDE8+/T6Ug80pDF?=
 =?us-ascii?Q?askq7yQIRF5hNlkGc7dQ7NZn99jHwDoNtu2nH8fd7R2bkHn0IE7t9qaXG5fs?=
 =?us-ascii?Q?iS4eQPu6EDI0EQ2BH1YdD/WpfgM00LUnWa7ICWDz9guwNOizpRgSotJY4w4n?=
 =?us-ascii?Q?MFhY98REV34mRxSrLvVJhRDcSIKM7tnHE/IFZij55G3DHJ8IGE/tbdY9lZL2?=
 =?us-ascii?Q?Fiq0fldQh7EcUhZ6uWNk/yCN1rR2a2d7tAxD4UVJdgTgayHuTqOr84D2JQqm?=
 =?us-ascii?Q?17v6PNNYRyJMLV3w0J4kVpYH3rRs6VmSfELcw58cxdDHNthEd0Z1QEl9LNr4?=
 =?us-ascii?Q?2XK1L+AMYve+fTsBOJ86FRdhhz61bOVu7E0Lz/dtma0VRBk5cTdwyf+7BZzi?=
 =?us-ascii?Q?NbwW0kF9GkwwmjlpjtpDD54q5reLlw3VPgROCi7ZX/v7P45HGfKHCN/YeDaY?=
 =?us-ascii?Q?YcMFLbmNQRXfWyKFVY/cJ/ZUH8rytz43bIonRWFQJTNSvLJFsWO0J34mpYId?=
 =?us-ascii?Q?Bvn/l61MnWHKLpqkTi0WeWMBfH04w6e+X1jRlg6Qvp2MPCujO8y69iz+6a0a?=
 =?us-ascii?Q?R6UK6ty3yxtLG+NcqEOVJFUHsJJsW4txaKQGFsYSkkeqLlzzt2L6zk/vapyS?=
 =?us-ascii?Q?UasQEJ1zTh1ID/oH7fUhLitz+3RCJNAY0xJa?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7187.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ee9ukpcaY6ngAbCjC7GLy6U5egqUD1T5s86XXX8ucACJBOH10+woZQcqSk4q?=
 =?us-ascii?Q?GaTkJ79XzHf8/KBRkfg7EUo5fBBaSTIgjtHpYxWpgFvgTpMprMrzZBfLpE1K?=
 =?us-ascii?Q?j4AxL4MtUSfQrDd1ZOvleQ1q3UfhSoCAxtz+rJ6eQ1lbJaWUceiVoPM7/KTJ?=
 =?us-ascii?Q?C72a8q+vfVVifwcw0DcDre83NoFcZEb8mLSQJ7BY8Es3BE+8NBbNnJncxE1B?=
 =?us-ascii?Q?7ZJhzbckHa38zB12dJ/pqXj3LFkxxBoBoEV5FNQVXrKNMrYiV7u9WU6GYtVt?=
 =?us-ascii?Q?lnhzBbwzL9u12dVefFmmOPviVuCLLWFvWStBzcuVccU8SPlRYCNTEodPgtKa?=
 =?us-ascii?Q?8t1/SV0V5/tNCxy3Yj8OZf0URbbIPAvhKsfCq/eKAVsxOf+Dc0rBDe+vNkRA?=
 =?us-ascii?Q?0JDyukIUiDqJwri+X/vloyJvVQkLPBJSLdsZanP5vwc0bq/Uhk9z3Q16ueyc?=
 =?us-ascii?Q?GDQnGpUSBcotTZ7MRG2zlGHHLkjAo+pRlCrSDp2nCWoBn5JvTncEdNXcIqwf?=
 =?us-ascii?Q?vkg0Xw5c/0sQhMMfeizu53bTuafzRJL1NmQkeAIzrJ7JZdkSegXHqMvJi2/v?=
 =?us-ascii?Q?4X073tD+scu9hKSz88lN9ZVewmisDrQp9gJ/Laj3iFRCoQuZ5siEk2ldMFJs?=
 =?us-ascii?Q?sH4La0/FN6a7ZFWFujIdd36bnaGVGnvtH9+1RDjXuwpmdlEHW/4J7LTtrRxQ?=
 =?us-ascii?Q?IIcGVLxyjgxdUrI9L/vniNHVfZ0HfzoIAztrjYU7HACShUXaZpLFqZA7jdim?=
 =?us-ascii?Q?3IcX8npVGjpZIkJ1xURVTYM9/Wqbdtn5QtFoDaZi1X3MXyxXLrevCfWy/+u2?=
 =?us-ascii?Q?vylrwSxcQ4zBdod7CGe9bv/aeHD6+pBbJo11WnX9sZkBYiZJ2l1qMfRF4rjN?=
 =?us-ascii?Q?PWFjd5l2u0d4Fx6XQT/7xsfRCYhRCQoUynZNt0xjAVTL4AtN/sHJxziB0ttv?=
 =?us-ascii?Q?8rzOkrKZDD5FADjTcreP7A7+QpvUJcN2qbiwbqqgacxaIOZ1hES4zwCT2C+7?=
 =?us-ascii?Q?2GdO06ROqnRnGN9ypxwpamOAE4n7bWNnEB9Tl7QHWgfWejst1hHyQm6damdI?=
 =?us-ascii?Q?4BewNkmMW9AD5obJjxVJ2odRNCAEfsp4Rgui+Zav911qX92lcyCBTXBiNqOt?=
 =?us-ascii?Q?ifvxzl79WDZpqmbEBElHVI/vWew+YMDHSSeVbAK+KcqgBfpG0BXhx497+jjX?=
 =?us-ascii?Q?cjiqr8BOQKpNE307r8rXs40fEtQFmAf/+uBdeCOh7XSPJsOBSdvlGGdQ9bTX?=
 =?us-ascii?Q?XLvMp/IBi9h6nSaHL7wYcsqxZ19noN722qOqSh03dZZp4RfyKRfn/XCbiUik?=
 =?us-ascii?Q?7gH4QSC7MaXVZoGUj2aux5PYG7RBg+nuL1h2T4dc419zAKn9L7du3m5AVn/2?=
 =?us-ascii?Q?DRVkq1pKeHuhXPHvLKmvpDf2xO1YdJ8mLon9Ppc/xYJarj3XvoiUsOxXU+v0?=
 =?us-ascii?Q?vKB76B0sAgbKwNKKZ67Jki9bFDg94oWRM+aUj+Z2Lt0Za2V3Mxok4dmsZvrb?=
 =?us-ascii?Q?6Y8w6DaarGTjJlw2uP3SmFv7lrHR7bu1DM7sQ2IUFi2vkTctvgSYsVprj0P8?=
 =?us-ascii?Q?BWripk3BmJ6Yg7qsCu2e/X+H+94ESQ8UndPvX0Oa0CJnBE5br3EqG+aP+PZz?=
 =?us-ascii?Q?jiMUIZ8IvDnuOhC/0ZFgrJlvwLRsXP6I3Ll3hOyfujyY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7187.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0cb85a-ccbb-406f-0d04-08ddfbddf3c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 02:48:05.2615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BF1CWOqqDAX5pyeFVgclSZG+MEfAHnvg7Cc21uzCaPB+mZJt2QucYpHVSaJlAT9zIkyMZSFpK42bx4XRyQEiPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7983
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_194814_849479_EEE0C185 
X-CRM114-Status: UNSURE (   5.05  )
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

> Please make sure to CC "Ng, Boon Khai" <boon.khai.ng@altera.com> who wrot=
e
> the VLAN support (IIRC).

Working closely with Rohan on this.

