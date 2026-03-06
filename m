Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71BCFCB624
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPbm74xN2+Y21qx3rocGpWyhxvRCDrZci9bzZw3coec=; b=GUusve1sK+CVHbxMxUN7ESGeQo
	+ANikbLm7Gq5iYz4Du+Eqi8Y9QAPdx62unfgZ9I/Tou7HECr1MMrl/5HhagxVKSL9afZETmp/rMsq
	P+Xs+SnjxIsfbgyohIqvYKi3pNrw+DbR66LDvdkIXqBA02LF5x1x3yWC8E2/ivNaSqgBf/iLn8kIA
	2Kg7YDOoB5Z4MDMKioaEpJD3RVxqG1pnDqJeZcAs7ZS0poQAqk6vXD8DylCx6/vwubWJNi1uWh1uS
	GRkCnHYMmLyrGK51B49ziG4thQPS0zU9K05pJOVLWMJ/Z2TizQAzDX4a/v/M5cZsJM8n8qLyTjEet
	VSbjPBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYPG-00000004Bcq-40NF;
	Fri, 06 Mar 2026 16:52:06 +0000
Received: from mail-francecentralazon11013049.outbound.protection.outlook.com ([40.107.162.49] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYPE-00000004BcJ-0LuI;
	Fri, 06 Mar 2026 16:52:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axboH9SjgeQaKY+933IN/+NFyhCKBjP+0Qj8J9iXc200VVP2CtjKVyzzkhSRp8xyD98+dPAOXWwxZYnumC2S1dbGSiKR/mT8DKodizBORadDueaY8D6fptWKqZlpNGhmW/oQ5ds1F1VOD2IMl35o976tOTjrcQMaLYbiD8kh4KOKQaSWKjL3aVO3ouW5CPeAm0fKlfnjRvj0ezUtkYG1SBYo+nblwprWYosOj1JP8AfcJBOQ2bCkhiP2Oodye0u7Esa530cdfTMpbUSsYZHbOxpFET/hfvEdV9vgIPshXf8ooctRqR77hiVqwEmG3InoaBWyT26tPHcNdw0Wuw5JNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPbm74xN2+Y21qx3rocGpWyhxvRCDrZci9bzZw3coec=;
 b=JIcpQP2h8APz4k7p7+CQxgbo5SUuBB0EyLKZqBmDGFyrSl0qbGliujk6TWhU8fKJy7LQYMbQM9Pj6mD6HB/dSGZLvmJ5tEU9FCxqYe1a13B/nR+rSDumsPQAb0hai+75c+hYVzV4t2BwzL9LS4fByOd3MFdAoEABo5gnQHKxuMowJ/1o/2Q3suhRu4pTCtrb6uYfikshvsokkAHJvAIz/pM8FReOdWJLmHys+vOBJE+Smu+N66sIbapf5Rq3FW+/bsmL7+AfzzgV5XcA/oS7ax6ic443891zNvL9nqgGBlcGLajCxv0r7UIeTfqvAjPEYS5M2w83b8iCALRO4W3YlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPbm74xN2+Y21qx3rocGpWyhxvRCDrZci9bzZw3coec=;
 b=H0R8bGrzZWuEVFxaDexzYJJnjso+v4Mqf48uPUtPmYNvQnl1/qRBB0AsUQtQ7MRJTPIHyWSrjvxYg8tsogQXTwemtukMrYhi3ruHI+a83bdTuGv07OJXadpGKDT3A/JEfQBeH/Mtxi7wVos6wbse8622d9euTQt90VQF+uv20Lin8ZxeOU4D53L59cj+/VtxnVr2bJrirRRBSYm3C16L5JaJHmaW1Xn1znT8Hk05vrwhKNz1bLypbuiw3l3VBrjTrPBysIZwrHrc8BOoTySSJsghUu9IpELVjlW9mZv9glqgjT5Hav77JbeSBCd8l2ZLw2o/U1uM7HHoMDW+dt6ztA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10608.eurprd04.prod.outlook.com (2603:10a6:150:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 16:51:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 16:51:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: Frank Li <frank.li@nxp.com>,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: Re: [PATCH v5 3/4] clocksource/drivers/timer-mediatek: Convert timer-mediatek to a loadable module
Date: Fri,  6 Mar 2026 11:51:39 -0500
Message-ID: <20260306165140.293012-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306085021.1231032-4-zhipeng.wang_1@nxp.com>
References: <20260306085021.1231032-4-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:510:174::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10608:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f20270-ef10-4ff7-be07-08de7ba0ad1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: AUka9AOKDnUv2O3jg+nFiIau0mtKjdlZgqwc1pfKJHfIbYZXDp8dgfpIzwvIWPVcVVZwVE2q5AURhPh0E/YzkkG/5JVZBbXoKqF6cvZS3OHt9dXRF2XmCVhD7+hsVkG9CCxqQmUyv0Ul5vqmsi425mkZ4OlFB5adD4+jQwh9f6eD85R5a2OUrbZXtRsVq4J8SmKgF2EjPUc7wCFISeFg6Tsz6pJEUSjwZG+bQ/KaW8PnHYsV7yCmVO/BxcZYyzp7exETBbo1UjGvDbjOL0LO6PrmV9G14c07bBQ22eqAcyC0v6Nrn1Iy2IjB//Yqm0IrQA5uskzAP/if5JzVh+5ktt9DsP1IsWW8M+3ZkU8jNlAFOwPi8HbFfSbR+fjyt1PVik6JRiqaFC7mygWOceORhndmvGWXcrKYqGuU5khYQq3U1XYbB1xttm3nKuMKJW9IoRVaA8EIzNi8AqJe2gyFlacdbKyTmKBfo2Hk3hYV2UVcuGfQ7wC+Kq5x6g0DvLqm1yaZiQXyUwTnnWKiUDSWbb39J7uphbuThhVNkpacQqewJSGDu8HgdI/hW+JG9Ks9cNB0MFD4LddEImZ8GBFIPbzsVvMfyRdhNpsc7aruDaIXK5YnCw0xslDkVzCwuUzERucIPzij4YMEYCAPBoWKU68YTv2+XcMaAb65Mu4vV045INTb7d2yN12koBFcL3yZs61UnoUbKWwubOTlqB0xkUvnC7f60oKIC8rR2sTAa2Vq94X2M8Y7+Pdf4LK0hAenG1eK6LTswZORygMoeWyB3lT6Nv6MgU2vyv+fjyGiHng=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5eeKO+6+T0Y1tKaqJdvM8vDahoqRsqBGqmcAiw6A/zVHe6ax/lhuHV+VOHUB?=
 =?us-ascii?Q?x1aGc9UGPyjTmSWkeO4A7/b4q/KSQ9kWEqKM+qKtqF1CMgq9ec/hP/axKymc?=
 =?us-ascii?Q?avT8s7FUAZU7K81vpT2Tm5eFkQpK7EfRK4Ec2U3TfXuxgWFe1g/XlkMoC4HK?=
 =?us-ascii?Q?EVMKXK1g+drxXuZHOe809fQwovGH+1XItd1jiIK5up+ZCgPI4qmoCjo87ccm?=
 =?us-ascii?Q?5QJZyyMZU65fgctXCejiTX9+XFbS4caFbfcP2cTZk3tN8fK7OaCXQx1S8cn3?=
 =?us-ascii?Q?AmCKIpgtbK8v4pqlm++MWIHEPlnoZ+D0oqc2M9KdTkv/qfrlPwPkIIT7Eg0/?=
 =?us-ascii?Q?lh3Ozeuh0l4LqtAX1b4d20JGycd3uHHO7NMsE3I+Ujdv6piseJO86FK1vJG5?=
 =?us-ascii?Q?kBdyfg4SybSObLhnq3wwDQ7gBo2VDtIP1tpAnUIDTAVgJwtMvqTioyX+Zftd?=
 =?us-ascii?Q?hLdDqkdv3mk9CCa8e6auK5QwC1NqpJgQyHLaaK5EUAz/o8Nc59UbU8n62y+F?=
 =?us-ascii?Q?X4kIAS06ZqVE7aw9ZlLR9kAzsf0jS0fTFM9TDCOHGQvvuW1qH9nZeeWvUz/L?=
 =?us-ascii?Q?OUz3+kDRJquQxma3+dhf+A7jGHt4uUhcBRbLKWn5pIZze3BNZpLIL7yR3HXL?=
 =?us-ascii?Q?5Mf0I8VmVKmZURBOTuyI44BKE1CoDSAD+7b++Lb3qTUHPn48v3WNiakAkEpI?=
 =?us-ascii?Q?nSnYhH5xl2BzSglvATBGSJNb2qYM3p1/7ntFR8YpsaTJVAuLZGems8v6lRb7?=
 =?us-ascii?Q?nt9FgnzGfha2j8H/qtX9vKJ1j66fYyNrFXFzvJzdiR/BlXn3fq9hAS/VIrD+?=
 =?us-ascii?Q?e+cDw3bkLxkyWHwluaLCHdawpveKt6nJ+JV2mVJ1GY58DxK6Om8dqgpeC9fz?=
 =?us-ascii?Q?0aMRfmkN+85tMpVc3NvOKizckWhyN+5BNqKCNjolpDPD426OEzYLw74fdy4H?=
 =?us-ascii?Q?x8CTzG+DDxPZbodgCEjY+XUvqfK9UNVhe+T70mGB/N74u1joNhZZsa4PjgoV?=
 =?us-ascii?Q?egMaPoyDNxkhsO7ACI0f/A2CqQJTMVzOecgbXMNMXTwjN5NHjsoW22h9at8L?=
 =?us-ascii?Q?Aaoaz3i4cRXrYqyg2b8iFr8LfYd+0UfVNg+w9mWJnG8/JfRMtcGI7SHgZw/m?=
 =?us-ascii?Q?8yhH2Hkxhc++ZpBny/IxUg5fmFWrk8zGiKoamUukZqLZPhC8s8xcWYGtn77f?=
 =?us-ascii?Q?2FKQTjoLBjdbNa4dkG7B+mZGTQCCon/laRtLRtyeLpKelP9szJlInx3K+X/9?=
 =?us-ascii?Q?MmuqKuS0bhifYwldHoZRbLAQf+AZiAdORtEtppM6ixajQyIZ6pz5GX24Bkpt?=
 =?us-ascii?Q?JxYwnPshRj0e3brqYyGkdSjHS4xvNITvHM3Hy6uD/qxpDwybKYCrnKDHdowh?=
 =?us-ascii?Q?79uk3AFG+9lyPK8oWbb55jwtj7FzFx3dkCHFaDzbjf1b9CPPuW2mJjRpZj0X?=
 =?us-ascii?Q?KEnO9yJ/BpIL3vZ8/+TvZ3FbgyMlUEyIYg4veWz4i+L2rSgMVOQHTwWGZeod?=
 =?us-ascii?Q?BFUpu+HAnXY7VDHWaeZMOxmw9rNe47qI1ebRfLpDNmk9ZjcsMg0CQtjeEQKr?=
 =?us-ascii?Q?ZYCssy4ZDW8YZ4ckeY8Fau5bWiT5yvDceFHCUN+RmbEqAk2g5HEsjBtzSga1?=
 =?us-ascii?Q?fSp3DWStM85Rj58YEjNqlm9ldlY9PrNvUgfSX/XyBaoGaRMN9z3Xm9SjMWF5?=
 =?us-ascii?Q?6qy/HotwTFt8nnALjj29nDUL8UId5ZWIYmCWAzaReokG0LVj7CIF5OTv8SfI?=
 =?us-ascii?Q?l+l1Uosc7A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f20270-ef10-4ff7-be07-08de7ba0ad1e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:51:56.7319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2OLxT2lcfcj3EFE2Cx1vLF/yphjVuKbyTZ6np1QfhTV7o0sJpbPteAgvuHogSWTY3dPpQGK4kFtx8Ti8p6P/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10608
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_085204_128213_9B043688 
X-CRM114-Status: UNSURE (   4.71  )
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

From: Frank Li (AI-BOT) <frank.li@nxp.com>

> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>

AI: Include headers should be sorted alphabetically. "of_device.h" should come
before "platform_device.h".

Frank

