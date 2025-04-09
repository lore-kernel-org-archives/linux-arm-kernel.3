Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B87C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 02:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQWROgvO7UznuBbKM2utIK2k+c11TvDzAXmVPXfsUnI=; b=XaNBw8IdVCU8w/gHvUsjBHRtO2
	Pg8PU/Xz/DSDuY4RdsR790pcJ/vRhyW84icOVqgXX0g/2ln4qs991oanV9/84F9Dn+Fe3NDahV05G
	aJqTdZ2sh6Xp7H8ymN+qSkA4ZZVuq5SC0LSKNGYP/XZJXaWT6/BLqoSzx5SMSkcgxXsiS6wSoCPR0
	DeUg10XgrguySKzz4Y0Jv5LEZrushnzdAMDNjMrgLJi7ixTwuNZctujejfhiGYQG7OWpB57CtB4lI
	whjlC7Y48cFJzp7B7HfmNluibSGa6sEkvT8OurvjjipcU/OsaohJlVxzxbPwFt78Kk/6m89Gt0uN6
	toljljng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LQn-00000005xep-1YWL;
	Wed, 09 Apr 2025 02:44:49 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LOA-00000005xRI-3KMy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 02:42:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYrxvbnrBVq7D2i4j7taFjeT9Gys1GqW9i4RmFN28D5Kni2IReal/CrQ4VDFfdRl4TqORWS+YyBpRAzCWSF9MPF1ZOZow+iDfhGWANx3IC2MMFLQdnCtAULZz5vHSAzOIZfWMSFHBybiZ3cDEM4icLwcCNxeTP+AKVrDGWRHhNgd9l+/TymxEk2BL0HfeXkIAQoO+cqW1jILzEunpSSp1fbRJLNrxV5CswCUq8BRT1OHmwc50zNQm1kbEHRIRD4LxR9RIa/ZAhf+hPsTXeIwToSJbmgD/B+a3lEWZyoc1HhN5w1yWA6Kwj6WFTF88HdaiXGGCN/1ADLckAdWiXKsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQWROgvO7UznuBbKM2utIK2k+c11TvDzAXmVPXfsUnI=;
 b=SKixCEaWrlhXDQtrPJYd2fOBwsrr3Ijqb4xmy7meSkI06bDppoO/6uHCp4LKZgUT0vh1p3auFYxdzIu8muav/MGyfrNRGPFODJ76eq5uos1Y5afWa4O+NHtiEOTM8uBdDAzF6mJtgVC93puRn+hQ9TAHzoyBUHHvRynvqP8FqDWFu5Cjy78Lu0twX/d0+ypbLsv9hM68fcnYZDXfuAPC/hyDhHiZ9yFqlHMKUsDw4XsN64ca3EclLi/cBPBWWSHI10/OBRCJ+hW8dMO5+nuilnV8eCn2x1KK2sukud5U/SiO7JUfGMupBZt7ro/X+N8jTiGX9S/xf1k4ifSOLufEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQWROgvO7UznuBbKM2utIK2k+c11TvDzAXmVPXfsUnI=;
 b=o63vkUY3l88bQNyWp7441ui3yvda55SD19v+KOEAzqlFKjteWTj4x3bOWEcvBVk8ka6cBMzQo9h+Z4Ulbbxqu7rAiJSqR2CvPiIoldCMGNOke9E3XxvRMOMN3evdaETs4HiThibHdTXqVRWTIGCPb77AbFZUyYe8TVY8p1SNtksnFJgxJXkepmsmPkWJ8KDq/sBMTsBafie7HotUcL+hfGMf2QrWyGE2X95SwkC9i1Tx5qxnFPpyoNyS6hEz3k99rRxXqdT4oej8yboQOSyZPGOuU8JLWyaDQgjghoGNoD3Jn+CaxLrx5+Rp+uUpRQY6mmmk4OtoIGKPC6Nr3xb1nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8127.eurprd04.prod.outlook.com (2603:10a6:102:1c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.28; Wed, 9 Apr
 2025 02:42:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 02:42:03 +0000
Date: Wed, 9 Apr 2025 11:50:29 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <20250409035029.GC27988@nxa18884-linux>
References: <Z86w3ZRS6T2MvV3X@bogus>
 <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <Z87UJdhiTWhssnbl@bogus>
 <Z87sGF_jHKau_FMe@bogus>
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9AdICiyaCmzKh-N@bogus>
 <Z9FnZzBQuZ1j5k3I@bogus>
 <Z9Fv9JPdF5OWUHfk@bogus>
 <20250313052309.GA11131@nxa18884-linux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313052309.GA11131@nxa18884-linux>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: a1660983-6dec-4e55-86d5-08dd77101be3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5NkN1YhdQCmYQDkd45RZyZzxZwHGrlyGZHA98V0ZXrHIyC9JpMbWUhTmYzhf?=
 =?us-ascii?Q?WI6vjWf38cw0WQXotmYNFouSqVwPJ4IZ8DTA4WfG4r9E4cJ2w7tQ6eQ4WapL?=
 =?us-ascii?Q?XV5vwqGezD9PSV3aNlf89k/ufZtXplZLDbRXC+eGPGsgA4lIBL0EbC5j3peM?=
 =?us-ascii?Q?GC/YIGy8VPhhYpP54t7iox2IgdJ3NZ68RhuHs7j2xRdc5R2R+WAsaB1xtfsJ?=
 =?us-ascii?Q?U0meZe3OR796AiIvlhy8shfVrjm0W3men2KOlBYrLwB1DIs3lrXNTVQBEAYs?=
 =?us-ascii?Q?7V7hO2AnKnWNHBV3UBDyqFTDzO8EGhiZ2/4zmTCRWevBj3zk+F5xet+pLLom?=
 =?us-ascii?Q?GcwQnH8gPBfDI0oEUx/b1n1RhvZQZm1aFtlQatKyh0o0oDTGUeawzP1RfXgi?=
 =?us-ascii?Q?g0KD1kDl9x9h20suVCB7tIe6ca45mls+u4DaK++qxIr3ZhSwL3jVf87+GtKl?=
 =?us-ascii?Q?u33/LqKXai3uXVacRD2MRTzATJWrdz9M5gRSJtDSPtgVlMPKhUR5emjVh4/d?=
 =?us-ascii?Q?bA3T5HuEZQ3SO1Lxj1eUG/m8RShNZDSYgKiEvZMmmH4qf4tkY4GyYZEkZLYR?=
 =?us-ascii?Q?z4Fer68kGy1tRUHBTn2xMDaP+Eo0Zjy/WfPwseUV+LH9GPAPjMJHRIgodjgg?=
 =?us-ascii?Q?E9NhOPLrrvwHjkLF1n3K8RsbI19Envzk5eMuFD+zxcC6J3v1EalAJCJRU5nr?=
 =?us-ascii?Q?0RmJVmVrCgZkGsJOJg4ZQlDQbt5fPJ7xXcrs3NnG4O7op6/ROwfWyiMkN1lb?=
 =?us-ascii?Q?Z5gE1b7QyQ87seCt3VKIUNV16FMPpBwSZ8NzXvU0gGLfsAj/wCoGYCvrgscc?=
 =?us-ascii?Q?yfsa8GoIQXt5EsODN8lGHE8vYyK8RRVL0KphIj6fbQLAfglP74i/6qcPOiH8?=
 =?us-ascii?Q?8W4JEHoG/AF+58CiQyuuvjLbA3vL2T+8ZgDRnmXwr4vY7TUexLq1FVg6CHWP?=
 =?us-ascii?Q?5omEFZ3mdVU78dAMZhtAM/mW+z1/ExdQCRcK51IXUqZaAvpn7bCCw6dKTuMg?=
 =?us-ascii?Q?RwmpeTTCF+WhTSYmuIOpKqlQr3WlVaMQMWYsrvTabyV1CVc0wlHBq6PlJDgO?=
 =?us-ascii?Q?D8QGzCyGsDpFTFmsW+9O9hEWv5zzVjnP2g26K0lb9KzNJJCv0vX0VZ1x6r69?=
 =?us-ascii?Q?Tr2eQC54cqnDrHkEAsoLKFzRnT3LfcMWbsYoYb87Iz6Jusy7AE3zf9/RIStG?=
 =?us-ascii?Q?SPokqkQnXsxy3S48SMddVf0RHr5fHPnwk7OfkT5CABmENX+U2AkrJVT9IX0G?=
 =?us-ascii?Q?b22WxHdX1KZceZRtcHBUwDYflHJHvlFny+juLrqRb4n4Ogza6uCj5bBXmtfU?=
 =?us-ascii?Q?k7O9jHMzamL2x7gVS1HLqDq5TOXzIuVwYKejT4KvOCdluERr6EuaSoX1HW+f?=
 =?us-ascii?Q?yzrYTQ2XO4olnJMcV7m7yX0BkAt/qaUW7kiLxA3PJE8aVKd+nerdgDIyqRMK?=
 =?us-ascii?Q?dK5A9q/4Mq/A6BNNrgBA8nJAEwnzG1ru?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6ZsFgNYxpe9/ofWcKZLu+PTg7OWGjdRWj3e21db9mUBUL7D5eqkt8IE2o+/7?=
 =?us-ascii?Q?HWt8Q4MGnaQOXKzEW9OUfRoPPfBXIo2GGwrFGYpjJSq1yj3CsytP5HjIrr3n?=
 =?us-ascii?Q?CF0OQw4PPhXddOfQIDeglQI/SeRx+vk4NrMOQX5ZTlfwDF1T8c50Nw6IJ7FK?=
 =?us-ascii?Q?rvzST4TH2mqqeDePVoX92V3BoSJYRxS32wrKKaFnupjO/TbtVSNMcvwUvEvu?=
 =?us-ascii?Q?qbs5rMMx3WP22zFfGnLDs2o79mhZlVXfgv54Cwhhv/s83ev/xC1g+gdrE/lB?=
 =?us-ascii?Q?TwxbqyzDyTvJ9wvEne/ETXlstTr27HEFS0vLj70123EgcvoPMR/+MEcY6ETm?=
 =?us-ascii?Q?YSzXQVIGL4DX/GbYwj1xUnfu3GDy79ZbrKZ2uArs2n/VBKJ6zen4WU3SLBIt?=
 =?us-ascii?Q?Qa56m7W3BQLGX391n5kiIQl2DUdo+zq3mxtHFyV2JliqUt5wJLZAf7D6QM+b?=
 =?us-ascii?Q?J1NyMGozNcxZKQyX7GOGqTJsLxUCXm9PiRYtziwGyETkaaElR8/QT9OPPJnW?=
 =?us-ascii?Q?UHYnZowrt788Iz2vW9K1+2gUgOqyDknEXD8fOpCrYtdSRk16mG0uOCxhMcp3?=
 =?us-ascii?Q?/ufw10FHsCaAKRI11eBS66uvA80F6pO9cXdk8c9N+jc8ecVy5tRSti96mIit?=
 =?us-ascii?Q?iyEKBWRzOksLaIIVax6otiSwf9DSi8ug/ci0Cp+Uvo4W1tGUPLF87zlHOvKy?=
 =?us-ascii?Q?3nV/0CJgoWlI+lY5BZWB6FrRccBqJTxLZhGlK4ag28PBPfiSRMAqPOWqpf/p?=
 =?us-ascii?Q?CjIMJaL+pOEO0lRB6P4vxOJFGJCJZ53Rb7kCiupzn6kXQBo2zwIFeE1W3fmL?=
 =?us-ascii?Q?uDaw04WRQdq7fr0ewUkBNK3dzru1H/o2db6iO5ffAYHTev5KYieIcnGZvdFc?=
 =?us-ascii?Q?fz4dp0nVDHr2tBjaFIHWuHbl4jfyobGdRQdygBxBivXXsAE3vsM9K7u+tZZF?=
 =?us-ascii?Q?kY8I7vUznBp8BxTVsv0B0OfXFpJ+YKl2ZBTmFXrzvGAe4s9YLsfYqZ3bdBUe?=
 =?us-ascii?Q?Aq6FTZPy1HGxNrymYOyrSh/YMr+kcut0uzuXGihpJPdcTfCz7Uh1+c8M0YTW?=
 =?us-ascii?Q?LM4w1ctq9QvwOIqofCBe+KNi8H3I8wvx66FOJ9k6HZ/Ckrzgdqv55QymnhB1?=
 =?us-ascii?Q?5ykCP20Pm62pj1BRFU7C6Ucve01qjxda+6W8cNoVxfkwqpYfHo26LZfsEliy?=
 =?us-ascii?Q?53Q5ul/oANxxqZh9NBOe/uTAPWvqu46fzZbcOPG13h8JVj61s9W2okmvJuG+?=
 =?us-ascii?Q?DmB37C//WlsrLWOWwTyAwPzKFnI9c0xPArSbzzvP8fPazsr1z1ABiHHhxLbX?=
 =?us-ascii?Q?WOnlw0dnfxT+syaLEyoNusEoR3sNC7X3MjEOibVp8g66xYfQgfS8C0Bmp+FX?=
 =?us-ascii?Q?U92cgd/CyIpyID2Ma7iuRA+Ak4RPSCYgPz6kgpR3DNZJXa8doUwDBzw7Yw3m?=
 =?us-ascii?Q?fvx1ftnnd5luK6zYSp+so8w8Ur+FxsbD8IE+LkBz89UOgDBFFv2JHmwdZmW/?=
 =?us-ascii?Q?DKgoZidzDXX2N61WkA23pNLiBKWnp76dHDwFM5np3jeZ4fBIavuJ8kzXvh81?=
 =?us-ascii?Q?d6rncy6EX8wTGexrfnRR/SvjAylkUGkPUaunVHth?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1660983-6dec-4e55-86d5-08dd77101be3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 02:42:02.9434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufO6XECNCVzxQvLLQGWrB2OBZU+5Hhaml9YiJHehaFYvNN+vpjGm1hWlVrGwD2QbgIhnwTEUjg9Xp+HhLKSTWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_194206_947428_995915AA 
X-CRM114-Status: GOOD (  17.44  )
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

Hi Sudeep, Cristian

On Thu, Mar 13, 2025 at 01:23:27PM +0800, Peng Fan wrote:
>On Wed, Mar 12, 2025 at 11:28:52AM +0000, Sudeep Holla wrote:
>>On Wed, Mar 12, 2025 at 10:52:23AM +0000, Sudeep Holla wrote:
>>> On Tue, Mar 11, 2025 at 11:23:12AM +0000, Sudeep Holla wrote:
>>> > On Tue, Mar 11, 2025 at 11:12:45AM +0000, Peng Fan wrote:
>>> > >
>>> > > So it is clear that wrong fw_devlink is created, it is because scmi cpufreq device is
>>> > > created earlier and when device_add, the below logic makes the fwnode pointer points
>>> > > to scmi cpufreq device.
>>> > >         if (dev->fwnode && !dev->fwnode->dev) {
>>> > >                 dev->fwnode->dev = dev;
>>> > >                 fw_devlink_link_device(dev);
>>> > >         }
>>> > >
>>> >
>>> > Thanks, looks like simple way to reproduce the issue. I will give it a try.
>>> >
>>> 
>>> I could reproduce but none of my solution solved the problem completely
>>> or properly. And I don't like the DT proposal you came up with. I am
>>> not inclined to just drop this fwnode setting in the scmi devices and
>>> just use of_node.
>>>
>>
>>Sorry for the typo that changes the meaning: s/not/now
>>
>>I meant "I am now inclined ..", until we figure out a way to make this
>>work with devlinks properly.
>
>when you have time, please give a look at
>https://github.com/MrVan/linux/commit/b500c29cb7f6f32a38b1ed462e333db5a3e301e4
>
>The upper patch was to follow Cristian's and Dan's suggestion in V2[1] to use
>a flag SCMI_DEVICE_NO_FWNODE for scmi device.
>
>I could post out the upper patch as V3 if it basically looks no design flaw.
>I will drop the pinctrl patch in v3, considering we are first going
>to resolve the fw_devlink issue for cpufreq/devfreq.
>
>[1] https://lore.kernel.org/all/Z6SgFGb4Z88v783c@pluto/

Not sure you gave a look on this or not. I am thinking to bring this V3
out to mailing list later this week. Please raise if you have any concern.

Thanks,
Peng

>
>Thanks,
>Peng.
>
>>
>>-- 
>>Regards,
>>Sudeep

