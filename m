Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D20CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 05:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mo6OJDQ8THxzPM7pJetQZ6M7lkoCOKhFvfCms0/XEro=; b=Fpmq7Xj8INMNYtE35IfN7esZ5g
	tv/B+38bAu704J823NIA/OONFcQC3he0khwuYT08EQmOkxw7kSdduBLiyYmm6GrUf+b9beASOZ8pD
	/ejRan5P4GuSGJr4yU5yI0vRRn43AIiqw87aHuIvxSHeoXDMfojBqjUzQ37/Y47OCtBukWzlR/8Ul
	i38gaimWlxgFUyfy1q84Uo9cPyKM/MEFc52s3E59IMg6sJQhU+jYCX5Gba5PsgeV4zDzPGbd2pYD0
	uS78dRFXfGjIwLNY0BLIu4upJipKFXKDicWK8k78TPLJDIZPccD1W234rW6bqwUswdz8gyxeR985Z
	/bdReRRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1I6k-0000000FZbD-2oLo;
	Wed, 24 Sep 2025 05:32:02 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1I6i-0000000FZaC-1Ydj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 05:32:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ly8E23sy6eL4KSTX/Nlwp05O9P0WgyjDqzKoAdHCEb030b86jvyT8UaTIHuVmw0MPKHvBsHh4Mg1mZD7uZYoHvVL2yaacp3BY5X8c0W+ilO43MMUmgTIssn6V+JO1mMHtxZ6RS8NDnrCXgQbR2O3Ki+y88Vbhhd/rthuw3minE6uAtGmTSMwy5EcBABpeXeVyK5REmoh3zy4gIbkI+WiU0QVZHB8rBBMtT7TFfDNcGfOggV0bpjnShnHsqgyc0uJeBdg9UgbnTOzudqzxrf3DlKY4n3tMYmxv+H5umduDJeWrLkFmN7f/aEcP+IIFgCFgmkL845fd4BUxg14SCb1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo6OJDQ8THxzPM7pJetQZ6M7lkoCOKhFvfCms0/XEro=;
 b=tqgdNnWrXlg+pWgS1QRm6XjBfFSLhKSEimQQwBiWr9ckVt8JtM12S3Oe1t0L6tI6hcaKov6SWdlEB+0hjZFbQYMq66+5QYsAfWDNGxTWSUaQdpkIte5SI5lVVZyR2d/eklbLPJ7ieTNU5MaEXvcK8JIySzfSZflRN0id9kmtj0YK6v+DLLNn8dJMlh4BTZ+oZSLLvg0fjxSsXV7YfD9eemH9qfWCkZRwKklehnTENYOz+xADFnTicWCG7HEfhmWG3b2nrT+DOWMVSUK6H9JJp8w7Eg81Mezh3G/CDiZr9E4AIXBNo6X3vgc03JP23WjQiShmMSM0BzLTz2teAan7Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo6OJDQ8THxzPM7pJetQZ6M7lkoCOKhFvfCms0/XEro=;
 b=Hh0KHlW0qQiktxmq60iF5rvyEGji2es33L+mwYYkMGHb5v4MI43BM4Wslssye6yVTbwC+Mzro/nxRYMlflNS5WR5i5R0gBvTctSLrD/bJpqtRUq9G1/iIaDl+GJF8UAu8+uB5wLmY+tRqDIm24/wf2mNiH0W0s4Wneciw1y1HwQPeqT0kXqj9PIUE1lv7Jj1T7CRwUe6YnZ/F8xeCzEYb1y+d+eDxYL1vDfPSF7UJx+PxOBrKM6Ua8qWrTA0l63bFkMX37GDtDUmiEZQe5dndEnKAfXRhuAmV1JsmeD1WeckNGI3jkrq//2jUQV7f3eIqbQjYSowYYaHm8ccuG9wRw==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by TYZPR06MB7333.apcprd06.prod.outlook.com (2603:1096:405:a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 05:31:47 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%6]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 05:31:47 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Rob Herring <robh@kernel.org>, Jeremy Kerr <jk@codeconstruct.com.au>
CC: "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "naresh.solanki@9elements.com"
	<naresh.solanki@9elements.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
Thread-Topic: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
Thread-Index: AQHcEZHhMUfthzzCFUyK1ToM2tNFA7SPY8MAgAAHMMCABFcpgIAHaaeAgAbZk/A=
Date: Wed, 24 Sep 2025 05:31:47 +0000
Message-ID: <OS8PR06MB75416F7F1B5DBC95A5E87FD1F21CA@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250820051832.3605405-1-ryan_chen@aspeedtech.com>
 <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
 <9d6660f0bf5119cedee824cf764f15838622833a.camel@codeconstruct.com.au>
 <OS8PR06MB7541C0D6696FC754D944D45EF208A@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <03abda47219b8b0b476a3740c7ed2acc4b2b16dc.camel@codeconstruct.com.au>
 <20250919205329.GA2192084-robh@kernel.org>
In-Reply-To: <20250919205329.GA2192084-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|TYZPR06MB7333:EE_
x-ms-office365-filtering-correlation-id: 198b6514-6822-4ae4-d6ae-08ddfb2ba7e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?gGwe+k7WZqAhLrTp+xwG1MpL3kXet1e6xXzPDcRoTi9e7CUakfWXL4rIeYAD?=
 =?us-ascii?Q?oCzktORHuWYfp05mUXV+o6JN+pSqELGYLX6iTYHBQltVe7zf5GvIkbhYaWQw?=
 =?us-ascii?Q?/yHdpBIMyUsyKL1DYVHNFA1QwMZFlqWuCNrCq/fB/5bSA+8Vot7jLha7iWfH?=
 =?us-ascii?Q?Vj7nDC5K0AA3F89EWnF8FIvHSiuNfbLoGThGw7dksp20H09OTJlFyw/1zBxq?=
 =?us-ascii?Q?WVf6DebIoiMyWn10AEX3TNenoQQ+GJNoMnibsqqBH3fhvoVshG+H1zD/YCFQ?=
 =?us-ascii?Q?3I3tB5n9t3yWSfvZdP/VBpsu4+2LWBlP2HISLK9yhXWVNrjNAV9Eg8Ok/lv8?=
 =?us-ascii?Q?fCaoQVQfja1mInAPIdki8ojE1yW0gSe4bYOQor2VcqhyMH4nTlS7ZS39bcVD?=
 =?us-ascii?Q?2wa6CVjvIL+MPlWY3N45W8mVoSlI8kVAOuG6MSpGhqUqjrR8gfkiYZwLfI+r?=
 =?us-ascii?Q?Qf1FqGj6D9ZvRfwY4VCSEwpszbvW1slxZOR7r7NoFFOpmsdWBE2CqlAOV5nF?=
 =?us-ascii?Q?ATTu/tfx3iJKsD6qcoyCe01RPCsDkkJThzL3PzwRoAaReBw9qHMQO+folC5n?=
 =?us-ascii?Q?w61MRXMrBrgcF9cE0MnLT7f1IK/Qjsgs8kSPMdzg14KzZvSSqgAmZNFiAk5H?=
 =?us-ascii?Q?wigkp5DVs9vRWBMpj1d5NA1HhWjKdhcmNkSBvs6xSw15uU4DjfRZ12qjBWOZ?=
 =?us-ascii?Q?h9ywusEktzGUOhBBtRMGskOUF0JCwDXquJpq6AAwFUUACNiwnLVp+/L9poN+?=
 =?us-ascii?Q?CVvkl0lEPlqey0lzsnx4XgbEy5ENQedTFgZ1YoRKBJVtHzBkgczkoTJig7Cj?=
 =?us-ascii?Q?IEr5lGTnN+OCE8alr856Ex7nKKrm3hhfg5kkHPCzqwbFxgNdIcU6nTd+w7zF?=
 =?us-ascii?Q?Vxu778T/p0izNPzI6BLdnzVamOr/GT0PQOO+U5OqoM1hlq0ghSo3G434Bcj3?=
 =?us-ascii?Q?FvXBIAMbib62VvIsoUJyET8S/rWBaXd5INhHHG6+jnL5ven8oPRNyi/SEz9j?=
 =?us-ascii?Q?j90JfkfklSGrNZ9YU0p5a2fK44QO7Y+ty87kgjMwjwN4pvudidFmvUsfIShO?=
 =?us-ascii?Q?hpscdfXwdPm5maKwMd7+TA+Rh+++oJ0YyPbztQs8pvKbfHSYFvBNNjgo6huT?=
 =?us-ascii?Q?yO9MnWuuuT1kudEJgP5PeVAXn7L4gItsviCduP87NP//hcER4THxVM83rmus?=
 =?us-ascii?Q?YFrsEIvjl9Y9ZEU8WWqOb/+h2VO6n31pNtyhOLlC7GEaAeBMvnLlSTnJpZE7?=
 =?us-ascii?Q?WiUuh6AHXqJkvKXWx/DkACYXiWhGxGNn0K+1L8Zr+arRIts/eS/WrBOleluy?=
 =?us-ascii?Q?JX0a6WAj6hpnY4SyS9igMk2Hb/t5Q129c7yIOYLeo/ABX6wFTPrCeht6CHZP?=
 =?us-ascii?Q?WIFXiwbIrU1w+asLKsvlucfKCNHLHQ3UY+M3/tCuawb0mW7VKWP9c4QJJyKU?=
 =?us-ascii?Q?1aPj6i7wZbU9bQg/87Nv0qJXDapjlL1lf6Yc3r0fAgPI93uX/JMUqwHJrHZ0?=
 =?us-ascii?Q?oMHs5NN2FavdVxc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PdEOQZTGHrZInMyR1k2S5PZfcw5rXQ6VZxWB+2nnkU0ANBmY/7LdfwUZ/uRF?=
 =?us-ascii?Q?7FAQgeUzMo8mDG4rUfnvU4UGqDqLRq9VuGkbrfxBugzrnXd2k8b0jxF3w7pp?=
 =?us-ascii?Q?HKaAW89RppRXUorQVaePu+jQo8u0hqqqEC751eJJfiSIZrcVpDuBxja43osL?=
 =?us-ascii?Q?o3wHCVtqvdqUohIyZT7JdNVZdL0i1HjJxizxFgNtqhAiFYeouT/ZjGr9XXK4?=
 =?us-ascii?Q?sLdF6mBGjpFTThUPzeygqH8potTFg3ChiwdTNReFpRIGf+wxDDL50hZXXpBd?=
 =?us-ascii?Q?Z+RxaffMSrnwry2cYmawat9Lqu5V02BGhkPkOEgaC3apmteBW07Qiy4qlw7q?=
 =?us-ascii?Q?JgEsBvs7vSUPPYNYFJ3nZ1PwGC0ITsbb6yNbg8mTK7gAQoVZziUgMnn+RDXv?=
 =?us-ascii?Q?ogz8butsCqdCjj0sVJhE3B5i1TFTVRulwqY4bqwta5/1Za5Brtfl6Hsj2YrH?=
 =?us-ascii?Q?lfl8ZPBrOaq1iVFkIyIahOixDVDD63wyxuqRtr15kF8WBTZl4IS+BASjVGxk?=
 =?us-ascii?Q?zA5bzSYMx2t65dfaF4dJYVntqTPXRECyKWACjcKZ0zvEiQOEQG8RYlYpNB+w?=
 =?us-ascii?Q?euBugrXmo5usq4qs8dmhEGLFH1fL29PX5VGvVwW1OIsizjnGx5vMbLDiH9IM?=
 =?us-ascii?Q?TlGFH+QSzry17d+ig3EfIOU3k+7AvT7Mq7in9Pylx2KsOKI3MeAbK/YhqzAb?=
 =?us-ascii?Q?qQMX8hVOFnJY8utaZjKdIXYuUVZaF08zjQUbHhKsT2NUHJGPkmnvsTP6dj0U?=
 =?us-ascii?Q?QiGiW1Uwp9ZR4aFOIThrnC+UE51h/PGIYprP7+dbbd2AmR4oJDCvWhfmW++w?=
 =?us-ascii?Q?pRBAdxhpHpOqUe++axXEOMJE4xV/ydJwLxlH7UrvnZntvM7EU5c2po7nF3mA?=
 =?us-ascii?Q?Uv48QN6uNACeDsVFEIBmzpWRXNWFOqsCbOjTvNclUgXX6nKtevI2TnG49S1H?=
 =?us-ascii?Q?iTyiAlBZCum6dD+fumNLBeYwOZFcn7bXHaMUf4MrcvR2iGBtMXlsrhid20EY?=
 =?us-ascii?Q?3Ht7QcjAaVNGqMoZ8roMnqMb/xVVcvF5KhL/2S1KbjCFKf7isooCWqoKxR2o?=
 =?us-ascii?Q?MvKoXuPY70pOvIRnL825mw9kc0lP5Cw5nbhoI941BwCNPMg8EfUdXfhuSzKA?=
 =?us-ascii?Q?xtCToRD0uV9p7WrN0x8uW7kTKTCKsESg5jgXByCsF6kzjoCrDHwMxv5414tI?=
 =?us-ascii?Q?MYoCaUDkyhZjkaETeEMez1Cy8Ryt4Bt8tXUbH70Ga747LO81od+w22G4CrAu?=
 =?us-ascii?Q?C8PZswbXluwgOV5ZslBOoav7P4MYj9S109AoYuuK4YHFr3WlZTyy0ZONsNJo?=
 =?us-ascii?Q?RAznvNLpOyQjp3eiZJosay6zqChcma1VYj04nvz1BxAAgWBjKF9+JrhR2wlZ?=
 =?us-ascii?Q?GT6t3LdHCeHSGx1rPzxIeXptb6Fd78qOlSi0rnZsBj2wqoADBitZncYzJaQz?=
 =?us-ascii?Q?xHpKuATE1gNdQ+c1Z7f9iYpc3ZyJy4x64aLjVLSiCD4UBuCNVpa1oxmY7zmD?=
 =?us-ascii?Q?0tx+JefQMDgYD0+KYdeSW4wtAL9ZE04ZgXwmPBgH5PvAym5b/XM7Ujz4d+98?=
 =?us-ascii?Q?YR9Dyq2uNkUGjox2uLFBVJq2klLfKffruafx5/Di?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198b6514-6822-4ae4-d6ae-08ddfb2ba7e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 05:31:47.4946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYx0BiHC/13TGvbOe+Gy3FbaMV/dFwOBOSJqgpZdi3hY36XmAaSusVnOwJeaxDdjMtwv8DEtJkTWs/NDcOIZdBvgQy6fi+NtPWqEv3uhFGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7333
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_223200_423857_4F23C43B 
X-CRM114-Status: GOOD (  31.42  )
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

> Subject: Re: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
> transfer-mode and global-regs properties and update example
>=20
> On Mon, Sep 15, 2025 at 11:41:31AM +0800, Jeremy Kerr wrote:
> > Hi Ryan,
> >
> > > > OK, but the ast2400 and ast2500 I2C peripherals - which this
> > > > binding also describes - do not have that facility. Given the 2600
> > > > is a distinct peripheral (as discussed on the v16 series), this wou=
ld seem
> to warrant a distinct binding.
> > > >
> > > > Should this be split out into an ast2600-specific binding, to
> > > > reflect that it is different hardware? The reference to the global
> > > > registers and transfer modes would then be added only to the
> ast2600-i2c-bus binding.
> > >
> > > I agree it would be cleaner to split out a new binding file
> > > specifically for AST2600, for example: `aspeed,ast2600-i2c.yaml` But
> > > also I think `aspeed,i2cv2.yaml` more better name, that compatible
> > > will support next generation such like AST2700 .....
> >
> > The ship may have already sailed on that one, as you already have the
> > existing compatible string describing existing hardware.
> >
> > I would assume that the compatible string should be fixed for an
> > instance of the specific hardware, but the DT maintainers may be able
> > to provide some input/precedence on changing an existing binding, if
> > necessary.
> >
> > If this does get changed, I would expect that you would need a
> > corresponding update in the old driver too.
> >
> > Or, another option may be to keep the current generation ("v2 core
> > with compat registers") as-is (ie., at ast2600-i2c-bus), and introduce
> > a new string for the next - where the primary hardware change might be
> > the removal of compat registers, but it's still new hardware
>=20
> About the only place we use version numbers (without regret) is when the
> version can be traced back to the actual verilog. This is typically only =
IP
> targeted to FPGAs. The reality in SoCs is h/w designers can't help themse=
lves to
> not change things. In reality, there are almost always some changes.
>=20
> Rob

Thanks, I think I will work on new yaml aspeed,ast2600-i2c.yaml for ast2600=
 i2c driver.
That support global regs, transfer-mode properties.
Then will add ast2700-i2c.yaml for ast2700 i2c.

Ryan.

