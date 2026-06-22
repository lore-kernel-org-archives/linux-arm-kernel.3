Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1A3CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AyS8AVdBmzU2aZhzB876b6+oR1bkRWyf2k6qwyBPaI=; b=holJp29u/4kYNBHJGkUqUBe03N
	Bb6qxY9AfpTPc7NEgENWlTSPidX8aZ/1rEbaZA+xBO2tZmpwLum32V3HaBmPyAqp+MPaQ+/AxeVug
	/r84INBBCn2PtQK95hUn7hlhgikGVAw+MdupLi7bN/dzjoDnS8jciDvb89Xw0NE/Uo8Hxfz5cN9MU
	MLQbwfPMjitdM8gDjzieiWz15+5YmJV1iPz96tDAtEz1YyjyclxupJpuNyygURq+G/Nhcx6nkfdK5
	KcuqfMlgPJr+7DiAhWkflbLNsDL1JZzF0XF8mAz5aMfVxax1bKsnlHOVDmh9YOcjsvqFgGY4rSP+r
	Ti8pubRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbffp-000000054SM-3n2L;
	Mon, 22 Jun 2026 14:30:53 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbffi-000000054KN-41eY;
	Mon, 22 Jun 2026 14:30:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZSFKd9PLp6A/l9g/U6aUeMoDPbszfyuHiaAiSTIm+qPczHUmQijfQXnAwBI2gp7zbOyozkzpI6BcVUr/8Pld7zMCj2lD6xzFRohvhaPpXX/kgEI66CptKbxBUwgdlp/STwYAYx2Poi5gNwHXAN6CJlqmoHp4VyFWvKMz+LM0R18T0cWZBnG13g5fSzFRwVIN0uGEayPY8F+4BRt6uIZi471eGAmfQEso9518cP7FTto0/p05HM3Z9KuXUQp3mj/lurPDvfqizKV3BL5nri0DxgHzzfT8fiXzjHu5tpPqJ+FUSoLTuzxEiTxQi/YseA74FFX2T9/agVrYiZb4W0ePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AyS8AVdBmzU2aZhzB876b6+oR1bkRWyf2k6qwyBPaI=;
 b=dcECatIgQXCQFMDMASBY0sXmIUW7FsSNlERCooq2bKid7SaNlByH7/bJS1NbDeXAMDd/2BYqTc/e0u19U9QgWCp0tdys9CL6s9hTARXCbbyRO6/UWV8pG23jzoBoWeycYyLrCG6GvTZTAnMGtoq8weNDgcMy5Fs4xEvxIFWm1wuefoIBbMou7lcVTqSe8Mb8WS8pdI5JjXqa6MMZ7o0gzbbJjv+LaRwGdAG2FiDlKp3myJdSQ42EClF6EH3kphzJ9+Q3mx9j5QNrQwfDdrIDh4L+OcJ4IcotrQcF/09n7KJW1VjJ2rrEC99FhH7/rGyiHtv35Wpy32OUuYbzGANorQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AyS8AVdBmzU2aZhzB876b6+oR1bkRWyf2k6qwyBPaI=;
 b=sDOaJ6HuO0giZ7WtijIyLNM3/YpVMVUEJjJICn0ZPM9D2Ag7+fF6u3lIv2K7p9Zak+cgEwEgTx5XYDmgE0C+4HOZeoGq+RQIRR/hITnDcFzmp+ldLmzp4Mry7RYrI+UDIBlxAI/i0a11oVcw8ONoyDAq6RRkuIMBDVCM15Jvrxcz1vuZhTRjINZkdpEalogfoMdROf+qQC7fMUoWwjXO/Ebu754MOm6XRqfzP2oAhygjSc1nfq+waPsnPPo2UQNFNE2p0xTmn/7g0WKEy+wONLnkbZAQ/fjBq253i+z7famQEH74yOs2+sKe3C+pxguNZybnw4K20Y0x6YjhdGkiIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12304.eurprd04.prod.outlook.com (2603:10a6:800:304::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Mon, 22 Jun
 2026 14:30:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 14:30:44 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 22 Jun 2026 10:30:12 -0400
Subject: [PATCH 2/4] media: mc: use fwnode_graph_for_each_endpoint_scoped()
 to simpilfy code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-fw_scoped-v1-2-a37d0aac0a68@nxp.com>
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782138630; l=1197;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=9mt0RV2tWpdMtooRWG3o0z+R51GFXNGFNzYBgXhnwu8=;
 b=vNzvmzixqR8kAEfK5IR5dB8DfZbcWnLQBeUfhpLbAVFUIGiklWjgNxXnrN7qllCNfC59zzRF2
 8LNUgEO7OxrCMybWO8H6y9rgc3Fmip6oOvvkSYLnsE+QGdC2lPhj+HX
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0168.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12304:EE_
X-MS-Office365-Filtering-Correlation-Id: bd3a8dbc-a079-4af0-e994-08ded06ad80f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|7416014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DzSKgmzOPqDvLJH1l3ZHx6XfPAwMt9AoDcS/p1fQjV4BCqh7GUUcBZNbCjYLRZZjmszoDnNy/GxWw5tfHyeST4k9WsLkZa1rsEPcIeH6C5D9cWQxI1J6sNCSVjEjPwXZO6/bARdoj+Xc62dWPzrzi+6eZWGejqJy+w3TAshD8gDy42MUKFVksNkggENbhwYEBeJRZP+sfxxSyUaRkPJslaRhKiBE0/imc59UvGb3TZxzkuJyBz+918M7ZIIN/bfxjxuqetDoi71alCpZSBxaGMm+PlyVvko670RC3xKpxPsNAkaB3ax4dOb8zUQCgzGidKvIsn0uKgcPXnCUt4St6KlrchsMDMx2zSwBL4lUsFol1eRT+p/2nbQhTN/5MKILASTVrFbeoaR3ll4QTN3Hpg8pS51sPE0XNnxzj1VxplUO2Uvx7ltzBJ5UmwmTJGWJtjbgU7LJT952VzRG4No9DVfclT6sYQe0XO+65Ejx1gr0Goo4pPjrTEbrYLmUK4WvqSBB5WARBlhv+AMqL8JEkVUXauRxlNs8fSADbdjdW9P9EbtPfwuDdCRB0kGYU04Dxogojr2kCOuMUOyOW/vWx5En6ig7d9NErYAAftQV1witJc043vRE9kU/O2aFTiVB7jLIoFlQEYIgR+TysoNcvIf5BVpTD9dSxQmJh1GxLzxsllTOoNzIIaypFQG9Fmx8swKfDCyydiasq1QgpW62KQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDRHM3k2dGdqK3ZkK3VPaXhtY01ONDlsVi9QYzh1bjhFTSt6ZHF6ejRvSWlZ?=
 =?utf-8?B?UGNuTXBHZllpaGVSTTBSRVkvUTVOUVI4L3JEZit3QTNCU056bm8vUlBTdzI2?=
 =?utf-8?B?OTE1eDBYai8yMVR1cmI5ZG1RNTZvWDAyTGxqT0ZGMjVNK3Y0S0Q5VjFoVHZR?=
 =?utf-8?B?cjBYVWduNnRyWnovR04yMDZiRmtOTGFoVXJCVG5BSERrc3FZc2gwN1l2UUgr?=
 =?utf-8?B?VStNYzBrV1NUbGE1QmNVRy94UEZqcldSbVNZa3E2bFhZWEV6VlgyWlFEd3gz?=
 =?utf-8?B?aThpYmxMM3AzN0Y4bHVzRjZzWG1qUTlwS3p2VDZ1a0pFTkVuUmpMOXUvMUVV?=
 =?utf-8?B?SVhRSGNQNE5WWG4yZ09rdU42Vm81bSsvS1pLU2MrQTA4WWswR2srT2RoVlBH?=
 =?utf-8?B?ejhGQTFHUjhpU1hBZmhlM1RZc0tNVW4wdHZqaDBPUVBaSDZEU2UxaHErV0pq?=
 =?utf-8?B?VnRMdEx4Z1U5MmhIUXNCZlVSeWhuYW03NjdCK3JlYjQvek9neDRhcWVyazd1?=
 =?utf-8?B?cE5iOGkyTDJTMUdGajdoWFpkcjNkOVBSSE8xdlNZNk93cTlFaEVWWGxSc1Za?=
 =?utf-8?B?em9pVUowMUdzRXJuaEgwWkpVZkQ3TUIvcnBGWkJhQjR1ZUJBZmtHZFNsNEc2?=
 =?utf-8?B?TjJkZlp4d0dYaFM2TVRhaGx0U2k3MVAxeENoaElyeURrUVpQN2t6Wjd6MjhQ?=
 =?utf-8?B?M0diVFp1bDFqN0xEUkNTaWozQUI5ckNYTTlMK3NIQ3p4NUQ4UmlYTytSTlpl?=
 =?utf-8?B?Qkl4VjFFamtDNkoyVENsTVNqQ2xObWpUaGdCS0Q5MERiWnN3S1c2a3hUMGl3?=
 =?utf-8?B?Vy9kVUJZRCtBK1NrUFhiVzlvUW1yZUFReC9OREhWNXByVW9KVGlVcm4wbkpP?=
 =?utf-8?B?aFUxbFlwSjU0NzROVGJCeFE0VUhPdjZiVTg3ckROaUxLWWtqcHpGdW5YV2RE?=
 =?utf-8?B?c1dpUExDaDVyUE1JT2NyaDRrTnVvMERSWDR1N2hPS1dRb3pjOVc3UVRGb2lx?=
 =?utf-8?B?WHZOblZRL0ZZTXlocG9OcE5EV0w1RGFjYmcwQzVqVmxBdkNFRGRzamVyNS9O?=
 =?utf-8?B?VHdHUUw1SDFKdSt0b1JKQlQxaXEydUFBSUR3a1JQQmlud201ZTdhOG1zTTgv?=
 =?utf-8?B?T0V5S1J3elp3Z3hoSEdkZ2NiZS9rQjF5eGlGQ2JrczF6OUQ0OFVDKzdJcCs4?=
 =?utf-8?B?Ni9hQmtKU2JvS3VJRjRWQm9saUxkaHdRUUdRa2NDS0FLV21zMkZ6WXlockE4?=
 =?utf-8?B?MzVxb3RxWmRqd1h2a0pJSjJkblV4K1VwTnFXRTVmZkthSnFrUk82TG9LZ3o2?=
 =?utf-8?B?UFZHdWZYS3g1R0MvZXpRQ3pUa2RPbU5SYzR4ZVNZdDY4c2Z4OVl2NEhmVnZr?=
 =?utf-8?B?Q1dJNjdYalhEblNlbk0yVjBCTSswWWdIZlRwbjRLeFMrN20zT2NIYW84ZW42?=
 =?utf-8?B?M0VyTVpmYmU0OTZSYkJKMjFIZ1M2dWJVK1NzQ2h3eWgvNmc3OU9FckkxWlpo?=
 =?utf-8?B?TCtaNk5vRmwzMldrY3l5YVIrVDdHcHgwaGxvTHZOdEJxRnQwbENhRm1Ucmo3?=
 =?utf-8?B?a1d6R3J3U0RxYTVkMHdFckFtUHk0UytWem82OGZLQVM5MVppNmMrN0FpV3dC?=
 =?utf-8?B?REFDMTNXUlF4WnJucVhyT3YxdDl2cDN6RVhTV0ordnBJaEszNFIwZXNnV3E3?=
 =?utf-8?B?YTJCVGw4YldRdklNMG9Pd3c0RzI4SE5xWmlkZHhrOURjcDh5MXNwRVAxS1Vp?=
 =?utf-8?B?YUl5QTlBcC9xYlJWUUJhNXJQWG80bzNicDY2RlowTm0rcEtwRlZwZVRDaDFC?=
 =?utf-8?B?em9QcXZGQm1HR0RXOXJTRWQ1eVB3RW5YOWtYVGpidEhMS2Z1dE5BWHNlUnov?=
 =?utf-8?B?Nzh5clQrcitaWUZXMy9QcXVQclRscWJWM3dON3BNRzFNUDA4TE9EZURGby91?=
 =?utf-8?B?NEhCbUNoanhRdkxJVzRJSjh3b2NuMU5yM1lSblRwY01IbTVKYWRWM2VPY0o2?=
 =?utf-8?B?K3JzSk1vd0JVZnp4QmJ6SzlpTThqSFBQS3VBcDQ3a21BUVlKaDVnazZvMzRM?=
 =?utf-8?B?K0lWL3FXZDJrbllxNmh4SGRvQ2t1Qi9ScFJBdFNPMzZNMUdzMmxseStTVzkw?=
 =?utf-8?B?Q3VPVkFEL3hSMXJVdHhrZ0x5dGNUbDg4RVoxbnlCbkxpKzhGZ251TVM2SmJu?=
 =?utf-8?B?SEQ2TGNBQWlNRnptS2xMek1rTFhIM29ZblFUOWhaWXBINy9TUXM5aHNEeFBw?=
 =?utf-8?B?SkNwOXJteVhwVGNibXltL0tlRWZTcGptYTJJZkxCOEs2RTVWRVUvNWdlbktJ?=
 =?utf-8?B?N3dIeStSZENvM3dZaks2eXJHZVd5SnlVUFNoTjZuanJIWnc1Z01tNkE5cU5w?=
 =?utf-8?Q?NOt42GKUAP6XZF/E=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3a8dbc-a079-4af0-e994-08ded06ad80f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:30:44.5348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WJTgBDScc2Xo4m9zRElccXotmuIFr3LxDUHHA51h/xF74oVvqus/nAu8zIBNx5EDyJAYTFvSGD6ZdQwMRogpL/P9VdpxFcQ/Y4KOy9WonCVPErLcLxNC6ILdmYjFik5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_073047_024799_0CA1298E 
X-CRM114-Status: UNSURE (   9.42  )
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

From: Frank Li <Frank.Li@nxp.com>

Use cleanup helper fwnode_graph_for_each_endpoint_scoped() to simpilfy
code.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-mc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 937d358697e19..5d7fcd67dc42e 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -324,12 +324,10 @@ EXPORT_SYMBOL_GPL(v4l_vb2q_enable_media_source);
 int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 				    struct media_pad *sink, u32 flags)
 {
-	struct fwnode_handle *endpoint;
-
 	if (!(sink->flags & MEDIA_PAD_FL_SINK))
 		return -EINVAL;
 
-	fwnode_graph_for_each_endpoint(src_sd->fwnode, endpoint) {
+	fwnode_graph_for_each_endpoint_scoped(src_sd->fwnode, endpoint) {
 		struct fwnode_handle *remote_ep;
 		int src_idx, sink_idx, ret;
 		struct media_pad *src;
@@ -397,7 +395,6 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 				src_sd->entity.name, src_idx,
 				sink->entity->name, sink_idx, ret);
 
-			fwnode_handle_put(endpoint);
 			return ret;
 		}
 	}

-- 
2.43.0


