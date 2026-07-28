Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A915C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 19:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	In-Reply-To:Content-Transfer-Encoding:Content-Type:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drB80SuFXwLrSFqkjUU3e0YUHFiHR+FtKNDuC/PiKvQ=; b=o+/1wGSLRjwxxwst4J0PKpCKz5
	coNl+W6FZ13zxgpzq4D874LsbGO6lXs7vVaiamik7wBZjfKw9s6zkqfBlte1p06WWMn6IFrcXg24N
	E7OsapxS8unamV2HtzeYp2TPhoBZ6GXy8WNxITxuq9qzYaR4lp8L2LXS1HSQuqo/Ww5D+/B6iyIpW
	dPmYxnpy3VqHyKHuaU56v1rUJdbsxV4Ku5yCRSSjIr8Ckej7Zi7j8qQHH0oeeblo+vd+qogyiQfMz
	UhwCtDT/3SsFK9VOfW1A3+UJdtwXfXE3Gj/N2s9qnNrWCtzDV39WQnSioIQFDQGm8pvOafPNW/kTb
	H5GiOVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonEY-000000067AA-2vuO;
	Tue, 28 Jul 2026 19:12:58 +0000
Received: from mail-swedencentralazon11013020.outbound.protection.outlook.com ([52.101.83.20] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonEV-0000000678v-2BVR;
	Tue, 28 Jul 2026 19:12:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/VocMJPu1c+FZNQC9N0aliXu8YEjHjK6lV/7sILgidtFRkgRhwFRLwsDC90z9k8oL5dopvs4pnZJZKUCp8zLQL6cOYipXXdua+Z/QqkOZeoAq/yqN1/H5v+pv9/NuNX82ajTN4EATOSdbfbjGgYf3LT7ppjvH1HLGqNRysTlp5g6Wi1BtgYDaXNesGc8cgxwlSY2oyBQGboEnk5JjwAWHQbx74l2vEvANMJtc0nLAepJA6Ixp9XAoCX6jQBv9sVhOaTOz0rXibF8cZh+G1L/2ogMu5iVqDYwxlmTSRNu9OZGkdVYQZERJ47oF3uJyDHx/moIn65FqxFzu4uKXgl5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drB80SuFXwLrSFqkjUU3e0YUHFiHR+FtKNDuC/PiKvQ=;
 b=E06doNb5eg/R2IcSjTkgFWuMex2ZC9ki/7Kb+MmIo8plej6jTJ017CfTHIjnFu+Tc0nHQs3fk064CQkVTJJZV/jqemxq3dRGTQchWmfgtYylu8BzMASx0H/B7p8bYJnbKDt19F4e8lggjTMqMB5wMniy6qo+8qyGR4daxfDRYj3evFCdBhCuZeYMdCjlmZ7IIECdw5hEL3QEMy2ExuCkxK31h3s+ZTJecek5VYLEnRZlK2lkoMRVkfnhtvOxqGuGODjhWa16/+CQie5dZUauHblAw5ANvP0wLfcgoEdbfw7pEwOOjW197Yau7Q3XEGTndrbROBCg48Oup9ga+ORqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drB80SuFXwLrSFqkjUU3e0YUHFiHR+FtKNDuC/PiKvQ=;
 b=XkLWgNEKuoye/8HNYpISCHYUzSR/ZbothLNeekquETFJxjCd8RN0K+h2Q7VI8uTVxNyEzV3mQ3loUk+30FhPkEQq1TVTBlVyTB9A+As8D8sVQKQQH7nn5aoi/q2VUjepqyaPkQd1wAF178vJ/wMeho957oG239bz368apURL9WsocV6hRE5M43bDzmbywXbt2QKfHYy3do57Q921l3VLuzzIgUOI5Wwq50JMrSkxZEK/iKsAppiSI3Bb12yqwf+u1nfKrcqi0oHRdp4Bk6LydYysJaUpcxo7sIJLY+0jUYAsxNvl9CvRBAwyHq0PY45lzt4TZXZbi6yRggERcRaLTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10319.eurprd04.prod.outlook.com (2603:10a6:800:231::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 19:12:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 19:12:47 +0000
Date: Tue, 28 Jul 2026 15:12:36 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH 2/2] PCI: dwc: Handle return value from endpoint
 .pre_init callback
Message-ID: <amj_JPfOU2sNINxA@lizhi-Precision-Tower-5810>
References: <20260728012548.465139-1-marek.vasut+renesas@mailbox.org>
 <20260728012548.465139-3-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728012548.465139-3-marek.vasut+renesas@mailbox.org>
X-ClientProxiedBy: SN7P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10319:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bf4890-7af5-49cd-9b91-08deecdc35cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|19092799006|366016|23010399003|376014|18002099003|4143699003|56012099006|10067099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 55X/z13vG1l99BmcmSHJfTJcZR68JI9F7sScnoKDvEGdMObB1wbnCvo857VjhgQZiGtyZVCLsSEwnCdlNAuW2G/elLwrG6xnYxAXXnllMJRUJCvF28vqRQJCex0QFPofEEaAnU8s4G/wpDoAN8SrILgW88HU6hi7ZX0t+L4RxNoTglJhkBRKV4xS7yd/c9Yzx0tUmCCC4mxJYSIMk2HiSWDBIQgF8/4xztIRvyiOjJ8uJtswU29DapXxCzwJlBzUWFCmuJZoNkAuKgWKBnD6vg5k1HXgqGP82ObNpDxYzq/vV8OtPfS3ls6Zr3iutlcanfalUCdwc6FQjuemAGYtrj06ywdr9BpAasfaRo0RIoGQGtw+4hQf+aQSRxsDx9wF+WQdugY1cuSlNEecBzJitoajK+8fNtr5HcXx/h2/NXMM1OztAvFwV9JeaL+m6doVoYSbPV4qqLSe9Nuhr859mfaQ/zROek9Xg+bfNk1tzKG12/jAxzvyjQGq7FuvjVBr/J5kcRmeQYYdQvR303BF7SXffd7d/knCoZOXFDqcTkPI+6FxGZUw+dgQMMv5EcWLTFAIPUe07sTfYIRLChFsepTus+fLhpuyS3vHc+X1Jv2HK3IaBpSWbYzahOTMdO0i6qiDrcGB7qCmnLrYMV936/s4GgmM1+8rA6rXDx3tH0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(366016)(23010399003)(376014)(18002099003)(4143699003)(56012099006)(10067099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akRqc3FzNUJLSnpVdkxHM093aDUrZ0pDZlhxeWFsSXJFWHhZMjVSMGh1dklD?=
 =?utf-8?B?Um1uUjBkSFplVSsvTTBOZ2NpTDFwZ01INnVOVWhVUEtScjVqOVU0bThMWnMv?=
 =?utf-8?B?T1JFZFZDNzVTWHlPN28yUTdVZHRVWTE4b1lDaTdHY1pYeUlDOTJLMWRTbU9S?=
 =?utf-8?B?dDRnR3FhUDFpekRyRkc2VzNranFSdHFXazB4WU9STzVVZHE0RFdIdGVGUHlr?=
 =?utf-8?B?Y3N6bThia1lQbGg4WFpIeWlRcTNrZ05aV3dWZzcvOERxcE95TVR6TUdHT1Q5?=
 =?utf-8?B?MnhZK0ZGdDg3UllTMjdkOS95SVhlZEtmQlhqQTZBc3BBZjdRekhkSFFnbGxC?=
 =?utf-8?B?K1hZdmx2NGVyZytPazdoYzgxYXd1aG1hYVlIODBGVlU0d2FteVo5Q2ZTNHFY?=
 =?utf-8?B?bnJpZHRZTGFNZkdrcWxOMVNJOUl3dCtZeFhaaW9JOTJNaGFsR3FpQ2wycE5k?=
 =?utf-8?B?L2VWakxCWU1RdzVaYmoyR3F2ZGN1OWRlV3FFZFd0dHF5cWovRzUycGovREpH?=
 =?utf-8?B?MENBYnZsU3NkMkZnN05kQlVHN0VHWnRXeXJob0dPU3lGOGVEdlJDWlBYNmNE?=
 =?utf-8?B?TG9TMGZiZGFiaTVUU1JUeVJKSFphN3ZTTUlianhVZUpwNTVsQ0V5QXRIdWZI?=
 =?utf-8?B?amtCRnkwNzJqZ0Fpdk9zWHJPbGlWL3U4TlM1enErV2pDdFFFQ1p0bWdFcUZ1?=
 =?utf-8?B?dVVFOElIalJlYXNWTVEzRFFwY0J5S1p3NXJPVDhOQ081OCt2VHUwR0k2eU54?=
 =?utf-8?B?Y1ZHRm1uelZHRE9PMzBranI0ZHQ3L1Q1QnB2RXZ4MEdnSWtiTWtJY2tpNXBR?=
 =?utf-8?B?clpQclZLUTNhZTlRZ1B5bDlZV0lsZTBSSkIxNXllUjlaR05pRHh0ZG1iMVJo?=
 =?utf-8?B?bzlEcFlkZkIrY1Z2aVhwYVYvRCtydFhCZHMzQk15dVplSHptdVRycHhpemY4?=
 =?utf-8?B?eUZNYVZldFdyQlZOeHMxOENiMTVmTHBUMnlRMlJYVjBtcVBJT2lEdFdUcWsr?=
 =?utf-8?B?MUVRcUFmMi9teDJpNCtZY2ZEek1iaE9XbDdkMmpWSjVHTnVTOXJWV21iT2NF?=
 =?utf-8?B?R0ZRZExCRnc3dWRQcGs2NVRGOTVHK3ZqblM1YXVSMWd1SG5uUnNXV2dIMXRW?=
 =?utf-8?B?TllMWG96QUx3TFRsWE1XTU9CVm1hV0FtaHZwVHdBazVqYjBzOTk4U1pKZXlu?=
 =?utf-8?B?aWFWQ1o0RVBKaWkwQ0tUVGxneStaNXNHNXUyYnJmYUZCN2QvWGRYWjlId0Zk?=
 =?utf-8?B?NlQ3dlAyZm1STGJPcXVWbG9ZU3M3dURMOEJrTE0vMnNtTnI4QTkwenQ1V1Uy?=
 =?utf-8?B?azJtbGRLUEYwU1hUVFVjVFFNd3EvbGsyVXZ4YnlXV1RHVWRncThvaTRtclIr?=
 =?utf-8?B?dHpqWW9XaTR1eUp4V2U2dUszWXRBL2dSdFNxZ3ZBSFlGbTlzKzY2OHl2bnJI?=
 =?utf-8?B?RXhpSFdXbG5nRkUwaGVobDNZa0QyZ0ZEQTZxUFZsYUQxdllVNlArY0RiSStJ?=
 =?utf-8?B?Y2NNc0NSVG9ZTmJ3MXVkd09iM0hJU3RGY3hnNzNGQndHd3ZPNWRGeCtsTm16?=
 =?utf-8?B?SVVlUkxYN1ZMN3BnNGFpbkNUaDY3RUE1Q0R4ZEJ5VTBQUzdDZnBHMXhmTnF2?=
 =?utf-8?B?blRvTW9MNGRYVWUwWXNNMS83aHEwT0ozY3MxRDRqSG4rM3JEOE9hK282NkxD?=
 =?utf-8?B?OWRHUkJTN3YzaDV2T1d6WXZrRXRLSnBVMkRVMHlCMW9QSkl1THFRNHJmT0xW?=
 =?utf-8?B?dHl3OUlNS2lNWUpXeFh1b0dTVjVLTGtVQnJJRTNJRjlHamNoTGhQV28rbE1G?=
 =?utf-8?B?TzVIa0QrcEVZeWFZZnZWckdHN3Vrb05oSS9rSWxEcVdycHhrZ0xuOURKRXRV?=
 =?utf-8?B?Y3BEWlkzYVhyTGZCc1pDTGZXbTVQU2h0Q2lOMllrQkg3a2tNSUdjQlZvNmpt?=
 =?utf-8?B?bDhCOHFHd2VJMERnaCtIRGw0ay9pc2NNMEEwN0ZDQVJYZ25qTnM2bEhkQTlt?=
 =?utf-8?B?T1Z6WDJtbzJtREd4dEpFSkZTbUloMjd1aGQ2cGFXZlB1bkFObjJqTVNhYTgr?=
 =?utf-8?B?UXRHV0NmMDFCeVl2Q2pNQTdLMXNKZDl5OVJRTjVlZHZLcm5jeWtHTjBOclQ2?=
 =?utf-8?B?N08vaWdaOFVXaktVcVJsYllaSWdLclMxVTlRTHUwcGt4VFBPQkhCWi9XR0oy?=
 =?utf-8?B?djVkdlV2YXQyTFVUYUY2VU5EcXVybnNRUGZKbW9aRityVnVYcVFHN1owL2lK?=
 =?utf-8?B?citCbDhKUXJITHB6L0ZIa0lwaFFXVWFHeW9pRTdqc2lMQlBNNXd3Mml6YnYw?=
 =?utf-8?B?V2RIWi9kbTRaLzZBUnRaYnlMQ1h2SGNVMk5qN1QvaThTbFdOR3V4dEtlMU0y?=
 =?utf-8?Q?GbLa3KZ58JDnF+7EX6BljzgujpZpWXjfxZEb0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bf4890-7af5-49cd-9b91-08deecdc35cc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 19:12:47.4496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XS3FPMR2ghcJua70dV088B6wFddELbBUTkq2FfU3NZXYzscBEoXpEAB9ZPyirPVMmhCLugGdWqFSrC4kicbF9oWotQJF3sZLVIYyt7ZtlvylwehqqEpmju+49l7PI/uT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10319
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_121255_589078_D974E0E7 
X-CRM114-Status: GOOD (  20.00  )
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
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Vignesh Raghavendra <vigneshr@ti.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, Koichiro Den <den@valinux.co.jp>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Magnus Damm <magnus.damm@gmail.com>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Siddharth Vadapalli <s-vadapalli@ti.com>, Shawn Lin <shawn.lin@rock-chips.com>, Srikanth Thokala <srikanth.thokala@intel.com>, Manivannan Sadhasivam <mani@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Qianfeng Rong <rongqianfeng@vivo.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Yuho Choi <dbgh9129@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2026 at 03:24:25AM +0200, Marek Vasut wrote:
> Add return value handling for struct dw_pcie_ep_ops .pre_init callback.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> Cc: Anand Moon <linux.amoon@gmail.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jesper Nilsson <jesper.nilsson@axis.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Koichiro Den <den@valinux.co.jp>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Minghuan Lian <minghuan.Lian@nxp.com>
> Cc: Mingkai Hu <mingkai.hu@nxp.com>
> Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Cc: Niklas Cassel <cassel@kernel.org>
> Cc: Qianfeng Rong <rongqianfeng@vivo.com>
> Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Roy Zang <roy.zang@nxp.com>
> Cc: Shawn Lin <shawn.lin@rock-chips.com>
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Cc: Srikanth Thokala <srikanth.thokala@intel.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Yuho Choi <dbgh9129@gmail.com>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/pci/controller/dwc/pcie-designware-ep.c | 7 +++++--
>  drivers/pci/controller/dwc/pcie-designware.h    | 2 +-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 6 ++++--
>  3 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index d78fb845582b2..b00239097d893 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -1524,8 +1524,11 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	if (ret)
>  		return ret;
>
> -	if (ep->ops->pre_init)
> -		ep->ops->pre_init(ep);
> +	if (ep->ops->pre_init) {
> +		ret = ep->ops->pre_init(ep);
> +		if (ret)
> +			return ret;
> +	}
>
>  	ret = pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
>  			       ep->page_size);
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 004b433f17135..6546dc3aa2075 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -474,7 +474,7 @@ struct dw_pcie_rp {
>  };
>
>  struct dw_pcie_ep_ops {
> -	void	(*pre_init)(struct dw_pcie_ep *ep);
> +	int	(*pre_init)(struct dw_pcie_ep *ep);
>  	int	(*init)(struct dw_pcie_ep *ep);
>  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
>  			     unsigned int type, u16 interrupt_num);
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 5f7211b91ee5b..fbe465a29068f 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -481,7 +481,7 @@ static void rcar_gen4_remove_dw_pcie_rp(struct rcar_gen4_pcie *rcar)
>  }
>
>  /* Endpoint mode */
> -static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
> +static int rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *dw = to_dw_pcie_from_ep(ep);
>  	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> @@ -489,9 +489,11 @@ static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
>
>  	ret = rcar_gen4_pcie_common_init(rcar);
>  	if (ret)
> -		return;
> +		return ret;
>
>  	writel(PCIEDMAINTSTSEN_INIT, rcar->base + PCIEDMAINTSTSEN);
> +
> +	return 0;
>  }
>
>  static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
> --
> 2.53.0
>

