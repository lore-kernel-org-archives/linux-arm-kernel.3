Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0980D172B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=diuyA/zRlN/SxJR1qHfAbY6q1K/AqSvgM6PsxB5YD2g=; b=P6hyJB8eJA0/B9pOK3BDIjoUnV
	N8e+dORu2MdlfP2tRuAfuFVWynmr0HW4ZXbTI3GHonLt87i8blpGTog2Eh6QdR0w5nmRN6BfkrX3i
	RsEWum38uEyZuVLik9q9SdGfi3j/HcWkuTueHzmw9LgRQqg0mvpOjHitd4TDNXUntyef0WXeeHXR8
	3w+WYQIw1rLiMZSSYQ4R/Xt18F45vAQjFWyXRRWmxh1GK9dT1VP0hhz8sHHDiOniqFfkl7B+fZq67
	/CzzhgqBGLMrHr+2hds0EgdDyBBMnmkTphvS2h/2bCZAXHMdkALfKjfE0fwFsNVim585PINpT880i
	bmL7USbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmodV-00000004c0r-1wEp;
	Mon, 02 Feb 2026 07:46:17 +0000
Received: from mail-westeuropeazon11010043.outbound.protection.outlook.com ([52.101.69.43] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmodT-00000004bzu-1ur4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 07:46:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZeVozrI6T6A6r2B7m8Ff1UbkeuEGYN7ocAl798Qbz+JCR0n4WOnb5AiocVEPfXh4A5xukFqmxNj5RvhWySKEnw8xvBfhnixbPCGPMntmbB6oiKZP1zmxFMkTHhzewGYLOTbiwrJ2VV2AkffodOmgXlQt4JVCR0RpqrP5xFLT6YmhZidivZG5QJIrkMUvBLvr51ShRQH87cbXVgsSwpXyG37PkNK3xyVdz+gh+HwCooF2ZIm6QckpRM65KV09zbBdY8CGMl/SbJtkv0BoOjzxcyN8PjOOypZBK4CNpcWnkKEVIieekSOUTDwq4m7ZzhQS0aoGSIECQRO+4sNsETkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diuyA/zRlN/SxJR1qHfAbY6q1K/AqSvgM6PsxB5YD2g=;
 b=d/peWbR1L0YXcJbr1J+l5iDBU0UgScyvFD/oPgx9IYc+nOR2bK9nDB22noc1QWn2bjO64wZWLa7mY60+C1zDtC/UhQBxoxXOAbpdEK9gJERfZZSN139cUjBnVLyWzpWHWEnTWxOCYI1Pxj8JFZ+GSoF/l9wg+7nhm5rY/EliaqbgctcNhT/c5MMKv0JSDPRDTNOI+zcBl2CIKQuyROCICsj1xvOJIGKYCSIiOwd1gYCzu1E/f7Z+zwzWxtjlN4YikOZF3rOHO8yMaviAXoGo+uAklV8JLGWO8CHZbLfYpBLiYTeZrkRz567S1aOaVglP+tgSRy/gMndfrI3Qw5y1kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diuyA/zRlN/SxJR1qHfAbY6q1K/AqSvgM6PsxB5YD2g=;
 b=gJQK1aaw5I800y38cHoy5kQo6fTWwOKwDmMXg1kRA7TSe7pT6pYgDRU+gzyWc+B//e8arsf2F3ebDLOFKRUIQ1V77NtbD5ijy2FPRorf2ydtsOnjnpoOQLhuOuC2mDL588dHN/VZOQLlD72BPtXVDIwuTq4cmtG7YL3rigSZp1tmFVwGo06sPlfZi800hozMMsBc8nA9DWIKWByVVHfABCGvYnuKPEzwfEuoDErFmwAs0uSnUsjEmBFFdLt2r+XXiM+Vn4EqguTJMGbfPg8t79l6R2ldPV5LQP7y4k1L3KLUcll/eiFtk9z1bnavvm4VnXKVq6iZs1GdLk6YYVcyFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AS1PR04MB9405.eurprd04.prod.outlook.com (2603:10a6:20b:4db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 07:46:04 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 07:46:04 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: ulf.hansson@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peng.fan@nxp.com,
	jun.li@nxp.com,
	rafael.j.wysocki@intel.com,
	a.fatoum@pengutronix.de,
	ping.bai@nxp.com,
	shawnguo@kernel.org,
	l.stach@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pmdomain: imx8mp-blk-ctrl: set awake path for power_dev if attached device needs wakeup
Date: Mon,  2 Feb 2026 15:47:29 +0800
Message-Id: <20260202074730.738760-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|AS1PR04MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: e792efbc-f413-4d19-d955-08de622f1d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|19092799006|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DEcL/4LStp+v52BNSBCAHMX7dX4iDZe9/iH6nqW6rukcF5Er6Mkj6sZnJiOc?=
 =?us-ascii?Q?eCOVHLlpug23J4o0FXkTfDY0NSwGcoq1ufr6vULpjrqFGiXfYKIfsojvbDLu?=
 =?us-ascii?Q?IsttKZqeQJ1Tyi0NwZbIo7QD1KDgvrV9r/52s39ZvZhoV91jwFWLpCEEh+q3?=
 =?us-ascii?Q?h9uCTOrrDT4/Pm13FOkosKxvjXBWzuBHlqTW5k6vxQCzDbEtLHGIGIeiJcdI?=
 =?us-ascii?Q?qxLU9qbE9+B9nQJVSdlCP5mSae2XvgYH7z6xD31fYySpunSPmfYdj+sA7Hn6?=
 =?us-ascii?Q?wb5ZWWcn2AWEKFr9L1qQrk4OVTeikUZqPYjzuebrweTjzLm/bL6rdx0GAFYs?=
 =?us-ascii?Q?v7HccDkqoH64Lk6/ma4jx5d83FP9zZB32hVi2lYbEmyWQ40HilDgd9Hw1qa3?=
 =?us-ascii?Q?CsoFQpnITmvYu7568Gc/M7CmDRMi/jBl9WO1bYbC/qUYlfxvjWiFkG9j9Bfa?=
 =?us-ascii?Q?2t1TBYhINIoT6KZJ48zsqu+NapuWzHKg8IeelwC22xzdD90A4lYjNFh6hRuS?=
 =?us-ascii?Q?8n1Ls5F20iB8r/nr0BrMzMbscKZcK7f2gdM/Ttb8gKh+4P852nblyPiy29EV?=
 =?us-ascii?Q?LGGprk+1669YFQKSvo3W7hUyrbo0PfvwuCeZacjOG3BVX+iSjeUxTfLqwk7V?=
 =?us-ascii?Q?ABceXi32f9ZDOYkTmAupTEB/bYV8iCBZC2H2LxVlgJxJCQLUNLAYVGpTECU5?=
 =?us-ascii?Q?RWAc9KfeeyxDsvknQnOxbaykguMG+xxbD4f9sSoxtLk+GRUlJOuWfy99fQRr?=
 =?us-ascii?Q?3oc6ac60ao9n2zymKiO149Fe+LyFDM0Gkf35a0j+aSrGvoujDvv9LNaLFnyu?=
 =?us-ascii?Q?YRNoetGNVRN5egySkvx89+dzDp2D0lLzJ8trpIMmDS/HijyuVKEupXR49QwA?=
 =?us-ascii?Q?2YxJMFT1k7ckhppNnqigOKC0TV890C5Mu4TDiqahKPpT2Z+r9L5p8ckjFcea?=
 =?us-ascii?Q?oqF5arYjfWehO8eqnevmfpvlr62wih5uIgC/x875xmlkcxn+p3CDw89HOXoh?=
 =?us-ascii?Q?XgN71wkceXhynj9EBrS2JHc8y7Orm6Vo2+q8vQc/sZ/i2JVtw5QVT42JyGn4?=
 =?us-ascii?Q?7uF0niyzV9Y1IqMCgJc1+Jst1GP+KaY/fiQIf/CQP0ZVR0sFXR8uZ11HGfYS?=
 =?us-ascii?Q?bvdXjP6V4RQoaZ+muOD04J8HVuzuk2DpEuDu0rvbRiLTZubye0Khxd7fdcle?=
 =?us-ascii?Q?/aI1QIdBITHxQJkZ9SioSOttn1zm6UTqoy8hyIGIMDduSwykhsEhUDXMkavN?=
 =?us-ascii?Q?3ZewXs4lGjOLfCqB8BnJI4rAQ0DHe87qa15L2CEA2a31rC6ctWtTDBaiqmPO?=
 =?us-ascii?Q?q5fJwnstlhfQEeANFMrfRP/D986EOoxJmb90nf/nnX9iT5nXdaZzkQZycXID?=
 =?us-ascii?Q?RrpBNT2cW04IUJDxIQqfraNFwiLCMCyVyY/vRTJFVHxI43Djo0K2OsssHPOv?=
 =?us-ascii?Q?7KD9mayuIYyqAOwOhpoQHL0YtwicGkyDendbGp/84UtcK2Y2ZslXr521JMM+?=
 =?us-ascii?Q?S+JEd7sJqiuYCNaB0M8NGQKSroXqZOcKYAzuJisxklNE2Ngezshcu3pGDc0q?=
 =?us-ascii?Q?iYY+xzCvr3JLPdB5Lf5pcBbtrKDjkIlHOndQ5bmyGhN2+sRzA1DudybFqG3L?=
 =?us-ascii?Q?dmHMUiVDwT6Rf2+Ct2nD6GAxxNanfx/kAJmRW5G85VAX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(19092799006)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SOpHJnuK7R2aoRaFyV2I0bUJ1F+RVldu3Pylr+m+59rb9Epq0g+pfmT0y4hs?=
 =?us-ascii?Q?dEGC2+d0wjAGcpLEqvnUGbLC8SouhbR3q2ozyNydaeTH0kgyjBvODH0lXCFt?=
 =?us-ascii?Q?EZdBO4oBef3yQ8At/3P8Ia4yiuJT0uQeHMW/1juE0VFtoDqi0mannWRAC6nH?=
 =?us-ascii?Q?/D4iwaG6Ys/zpJJti0//qIFKy3noXRQlN/Du3eQ2kHgKiYdSYIpnTxIMPmau?=
 =?us-ascii?Q?AXGF5I3emV9lbJFrbANH4AOMRc8EPrjT7dNue4k+xAwPyVN4Gsk6lwJzeWjG?=
 =?us-ascii?Q?KkQBbBtp+qLimVr+poQUcLWscT/bj7oIwNaTKwDdt2In+Nz5fSP3BrpFqj65?=
 =?us-ascii?Q?ASM6XUB+viPJuXMyWYqSWegh3j/Krm0jEE5FmYY/Kcv8fYQajP4WFa5cOyZw?=
 =?us-ascii?Q?DuBEHIrM1356AKVp7b5+MUSrJMpx+EqEfmkBcITX6zJeRSGN0hNAhFF7JwBg?=
 =?us-ascii?Q?ptfghVqJjrYIjM045pRxZM2JdN1li5Fn4AHf8Aff5rKxOSc04OopATIxzaFr?=
 =?us-ascii?Q?1shxYlFj0zLiYNtfqh1PGRkmPb3kQHtKEawM7fFXmITheyodG304IYNgLG19?=
 =?us-ascii?Q?gWr+S4k981BPr6D8Wzue+WC5m0833fPi/rfQG124GxGtuyv0WiWZJA/EYopl?=
 =?us-ascii?Q?X9eVHNAALyTKcFbTiOFoo5QnL8DBrXnc87B8OV7rV2iM4Ange2ogX4DQzO4j?=
 =?us-ascii?Q?eUYP2LM9mWRyjqnOEJ3th6fPssdqGhYuIGI7UBtaPGtf+syj8r1VrPDLsl/3?=
 =?us-ascii?Q?k/szpjKcnpRV0Seu96Hy1rgE6helLZSnOdTjNeQgr35HKpQ3lYqlHYVHo8zT?=
 =?us-ascii?Q?BnKd/jtaqkqU/BQHJMq9ktEmwWtaLsebfdgmLEVrmgycr9Rzmm7ZwAjgOlFP?=
 =?us-ascii?Q?I8X/mo6XnTs20D3prIpinbbcHyyTvZ8ismAsxI+eunOh8zn6RihvXWZtAv/M?=
 =?us-ascii?Q?DtJkQgcqyEN+y+rZVDKRK0XoOOJQLlMkvMJCokra1gJW+DjhIgbUCrD4Oo9I?=
 =?us-ascii?Q?7J+TnWfKCwHnUJUuLTmDDQwXDCh6QVS4PqZgT+9CHkkETDSsub2Wrfz+2oH2?=
 =?us-ascii?Q?UNEyu1k1Iec4fspj+vKgvWvQA51+s1Cha6/rlBX7lxDwvVX4oObubIEtRfWL?=
 =?us-ascii?Q?LKfieMlee0GAsJ/daRi9RfJnIbJ4w9OdWsYl7SzpvNBLLBvLlZzS6q0NXTrH?=
 =?us-ascii?Q?OZ3hJejyN1FV+69LVhVpazkXbae9dZAFFlZA9jR/Zyxp17P3bss+T2rPLD66?=
 =?us-ascii?Q?RDiC+ba74Uo/L9XS1M0F3EMS01J+1FYJD4/tBiWJdzeK6GtYO9XHAxk61XZj?=
 =?us-ascii?Q?nkP5nrtm+8Iq+sYWWTNI+GL5l0a7Fs+5dEapBSHQadzw7r0A42xDitmLs2Hz?=
 =?us-ascii?Q?+Vld9QpvTE6Jfm+O8EjVffOVhLuwTZafhbhaCRtnOt4XxKzdUSRv3Lp+KKE9?=
 =?us-ascii?Q?KFfx/usxbaEh5e++Tt3ojUJMRiUWMMOmzGSLbcZXNfAyJlkkQrm/3lflHvp7?=
 =?us-ascii?Q?QXffLbv/kCPyg+ah9REtdZaNBlSJTZFyOE9lGQy9bjBmB149pEtJmgokm5Rj?=
 =?us-ascii?Q?nGdqIMbgLRyR1lqkWzmstrDLru0qNJGeCwNeGfZXHNc5kU0X79tYoOc53OCa?=
 =?us-ascii?Q?QnjE3TsnBjSZUvfVHJw3AzrDi69KrZG6Lvf5kQ58BbxHdVp+/uRFeVIizAOK?=
 =?us-ascii?Q?h8bxQc41oEUAmnHRqu5FpgTmJ3LumV6H7AqeZRfgVtZGyIaPszVlcoRMagdd?=
 =?us-ascii?Q?rqGoIqbitQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e792efbc-f413-4d19-d955-08de622f1d53
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 07:46:04.3206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGjTiXvZQwikRya8uT2NrGABwSThkT96bOFf5/n3uikiRw1pHDfZwjiwUQ63PKDntzrKze6yyEUnf76G41yZBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9405
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_234615_498600_46EBF991 
X-CRM114-Status: GOOD (  15.68  )
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

Current design will power off all dependent GPC power domains in
imx8mp_blk_ctrl_suspend(), even though the user device has enabled
wakeup capability. The result is that wakeup function never works
for such device.

An example will be USB wakeup on i.MX8MP. PHY device '382f0040.usb-phy'
is attached to power domain 'hsioblk-usb-phy2' which is spawned by hsio
block control. A virtual power domain device 'genpd:3:32f10000.blk-ctrl'
is created to build connection with 'hsioblk-usb-phy2' and it depends on
GPC power domain 'usb-otg2'. If device '382f0040.usb-phy' enable wakeup,
only power domain 'hsioblk-usb-phy2' keeps on during system suspend,
power domain 'usb-otg2' is off all the time. So the wakeup event can't
happen.

Let's propagate wakeup path to virtual power domain device so the wakeup
event can happen properly.

Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
Cc: stable@kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
index 34576be606e3..f3bfd6d22722 100644
--- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
@@ -804,12 +804,20 @@ static int imx8mp_blk_ctrl_suspend(struct device *dev)
 
 	for (i = 0; i < bc->onecell_data.num_domains; i++) {
 		struct imx8mp_blk_ctrl_domain *domain = &bc->domains[i];
+		struct pm_domain_data *pdd;
 
 		ret = pm_runtime_get_sync(domain->power_dev);
 		if (ret < 0) {
 			pm_runtime_put_noidle(domain->power_dev);
 			goto out_fail;
 		}
+
+		list_for_each_entry(pdd, &domain->genpd.dev_list, list_node) {
+			if (device_awake_path(pdd->dev)) {
+				device_set_awake_path(domain->power_dev);
+				break;
+			}
+		}
 	}
 
 	return 0;
-- 
2.34.1


