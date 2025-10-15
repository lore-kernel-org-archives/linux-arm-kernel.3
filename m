Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9766FCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1zpA8Qmoox28oZX7oEPIRHD5WQvom1pEzWIwcXp3o+4=; b=QzPrRZbxFQIaruYwynLbXSHAf2
	TuXgZaU9DvFy0UrWBLrSz5h5FS/SqPWYy0ohelxTuG0d4RUhc971CLrlo+7poJ/qdYNJP70ftMVOo
	8aQWOEtaNVJL5EaZNr5q2KaDyL1pu/V8RXL7hyIu15ppA8CLCcGUaV5x6qCIgCVV1wzblt5aWWTUC
	9euewwH/khhuVzqYZhYr3LBtYd7fHFvVuuJLtSMtCpM8Iv+PMdJOYmvdYokqhI4HDKnK0p20OruxC
	NA+bIhmG6zEBszOkeCQVkB2al9NCrV0pFx0rvDGmdUTnvqu28pEzaazhr5Qnl4A9ZVukxyb+Hv6NX
	YwlPe/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96Yr-00000002eMY-3Jru;
	Wed, 15 Oct 2025 18:49:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96Yq-00000002eKz-09IM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1zpA8Qmoox28oZX7oEPIRHD5WQvom1pEzWIwcXp3o+4=; b=E+Ue06nrJzqRUdWdE+tccV9Qbv
	X0jvMczfxuBS4NdswHBB36dxfNAd8cG8kML+NjWUyPlMyuZ0ntuNO27fWtFLLwkWBep8CnsO/67X9
	W8DqeOiukm1lVn+mi1ZTSbjjMHGY9jzbt1OT+yb0Vvvob68AqUxmmpI8Ddn9yb/XuS7NfkI43ZWa7
	swfbrlfs1lmj1NxCUAKQjqrxg1XTM008xR/UTbEa+gPhaglPzv4hotD3xdoOrF7SEWN1MunZGhK8a
	TL1vpuliJChFK33wZ4010Vw8RSZgHXcOFiUxqjRAQdbJWKqGU+SaRaQ1CfT1lt0Eb5YBjpVPlt3yh
	2hh5rZpA==;
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96Yj-00000006926-3wlE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:49:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zk5dk5QVttCMCbSE6ObH+8DpWiCLFcwwJZv7gSEFeQ7cHDK1N/mk7xFaLqHVnmy7HkCJNSGAanK6nTXmdsdm8MbYP37XUTxpW4eUuKTNoxFzDdYuwgKUzw1Tf6BWL4RBQ1gBhohyQeyC/V4JV40G+bTQPMkBV8tFcgjIMeC+Y5LjVJE+b34Qc5EYT47ulnjTQWfNxrNIdrzjJzDDW8aMEUxo4AahknzPDw1iYzLEOWO01Y2UBH4c+GsLaJacq+VRVPtEJ/TtPAmfrC4jxFd36WzU5FmOu99dgmGZqRujVGg1sohihI9jrljtq3SfwheSIDJxwbyOaEVnsufgLwGyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zpA8Qmoox28oZX7oEPIRHD5WQvom1pEzWIwcXp3o+4=;
 b=T3d+IyjTz1UD1TcqERrMReIneFwPlxthBH9LK20wnUSpW8NfyUFc7ex3j3RnQOnPXVYa0W/ggV6idk6roP8fLkV08mGodlWWnYU5CUDVZxVndbzAGM2vN2caY51yPhMIg4FRzuiGpDCbesppAZfZAzu5EeQsnGZ3Jx14F6Pi30hJymIWVELgY5FTfte+86JYuZqZR/Ae7rd2fpiAZ/zUz+y5Wlmoascw++T5tBfoZOE2W12M8IAXYl6Zheyr71IpcxnF4vClR6OYiX6eCWUnrZXNa5hfrgQSYJe1R35lopNIWQBr0dE+0QK9Ib9tp64RXQbj6AlanaFHG63HbVdy+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zpA8Qmoox28oZX7oEPIRHD5WQvom1pEzWIwcXp3o+4=;
 b=PGnqVhHvLQK9it7+ZkYOt/yw1F0ryl4FOnIjQYfziBlBHSKAxBz8EF+Xwe9vuh4Lml2nxNHdEKmyKzHmrO49d2r2gSNgHBpCOzhNTk9f8GytimhQqF+QBYJ6VrRPtW8lw1JJbl0uXLdALQSbfJ53qEU9nRW/PQEbhu5MDieGSeewMCmsTJPydkXGtT84OKdrTqkkYhpVkFb21hT11AWll24r/Jo+/zV+OJGYxFL7DjFXrqOWzbI0f6wymoTBeUShgPL5XAt6vc6VoeBUFV0ecl6JOL8bZ15ADYVvscfr/P+muU2zSnVhMK0SbqRzoK0BnfGjd3059HsZs7XElVkVrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by FRWPR04MB11150.eurprd04.prod.outlook.com (2603:10a6:d10:173::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 18:49:01 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 18:49:01 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [RESEND v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Date: Wed, 15 Oct 2025 14:48:45 -0400
Message-Id: <20251015184846.2509016-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH5P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::22) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|FRWPR04MB11150:EE_
X-MS-Office365-Filtering-Correlation-Id: e7286fee-a807-4105-6b35-08de0c1b81bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gHEJhou0v9QR5wZfiQ0B4NcH7l0nJXvznF7kkFX+vmwCOcrW4vjQUtUodo8D?=
 =?us-ascii?Q?lDz0mpN3Nn3WIEWicVUJgAYqljPGT1tyeDP+MpOnH4jtmzOvmLYN/coCo448?=
 =?us-ascii?Q?82fdHE4Fb/U7dbCl9WUKoXQzJs0/4WR3xY7oM+qF7htaqa6Hy4NYefIFf+g+?=
 =?us-ascii?Q?WeZ9T4nnA81c5w4fJBtCUvpBUSKrEzFAHiHFQFCxenazQ+dwIzsqIxM2so/8?=
 =?us-ascii?Q?x68X9lJdEoXT41dkmk+DPYqxqLfZTSsrjTjJos6kw+vZX/oPRMHoNd0DROGB?=
 =?us-ascii?Q?iCtx8NXbEhDdrGdwQqAfi7IK3uIduwFLk5Rs801nV1B1E45ricIbF3JnV4TX?=
 =?us-ascii?Q?l7KKlTx93Z229zzOxmboNJM78/nJI4srx9BhutaqXsrEddFmQnP/39CMT4DZ?=
 =?us-ascii?Q?tniUs+SLaEi7SlgtXmS83prDGuieUu+XFu38wfnw7r1FmSK7+GSynuyAeW9L?=
 =?us-ascii?Q?Uy0+IiZuoJDgicFgmoJpHcVygfJM8esKA91TaHDb21bms2qyCc/+YbHz4Krb?=
 =?us-ascii?Q?Kj+M4ewF8SdYn9Hqs9hKd44SbMJtfGY0ke6liPqx4ad4gUUXz38pyuFz0rz9?=
 =?us-ascii?Q?ggitLXrM+Tgoz7GRUwfEHvKVI6eAX3WWmYys5fz8kLw7+QW6AiDAPFgAWhzG?=
 =?us-ascii?Q?Wcg+B5gf+sNCCPr9M0l8BalXvj6Gbby4S0WUwVu5hViKYyx1rUfFevrfYD/F?=
 =?us-ascii?Q?5prMjdBdqtgV3mlfNRbrttLROEQxD1cWBRHYJDUJdpiye4PBPAAdXInHgXts?=
 =?us-ascii?Q?TXH6yFMKmseHe72D591rqvNbylQVYE2vPoMH0L8imQF49Co64DHiOa/dxvYi?=
 =?us-ascii?Q?MvjLfrKj/YVQZC+SyATwZttRY3NxrMfOohLa53h96O6d/Yi8+mLbj6WtCbUG?=
 =?us-ascii?Q?hub3fKPHAeBrnaOSGf9HSlHwEntPQHKpL7aeH9rKTITzHwPiQORcbdoDsfSy?=
 =?us-ascii?Q?2OB4+vYZ6sxHFQaW843ThsZ3Es74IvvyhH7i+sWkf48EiACs0gnBuv+Mb2zD?=
 =?us-ascii?Q?lU/SJzgId4EgUG1A+J6jWkbi51EHYT9KMUc434+MHODzSAvIImgH6Vwuv3fr?=
 =?us-ascii?Q?pt28QNM354AjFxyv7CarDtS8TKGr7ajHaFSY3g49KGO8pc0gL9j2lvWNWAkb?=
 =?us-ascii?Q?idsbcZEvEi8kGzr1ywXz4biJW08T4qX1bGa3PBkdk0xsptA15ULewfGDm+E8?=
 =?us-ascii?Q?0jCzgUzqI2g8fy/HsOYN3mfCtR7anHnmP3XyNilnMTSRdzHZHZ3jn+w3czml?=
 =?us-ascii?Q?rX4fGnCIXFTexw+y8lMtX2UnrVeHD5kbDLdgz5S8uGmVA5IzzI3P77NdSNJf?=
 =?us-ascii?Q?gCPvdEoTm0zpihL5F+fCWlOG99HBZwpNlvjndSonuWEXbzxVMxXFx2jDx0lU?=
 =?us-ascii?Q?HS2UyBCGu3pSytQMyQ7KRSyzMt+vXBHjqslBo/Cb0Iur45y6VlV1U+jmQUfl?=
 =?us-ascii?Q?Yu5lPQuu/n0Q/As7cHcm+kIysNHP/+a4xxFAY0ZgDkIld08O9tRicCHZQe4q?=
 =?us-ascii?Q?9/QcPi6c11ckfcuH+r7Svja/XJrxe4kk08xV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EKmCVMyosF2Jkat32dMpL6P9bIhjxns3LnpsNf1sIkPBrS18EnK/ihhklYWV?=
 =?us-ascii?Q?AOs9KhBzLwzW3i8f3bE8Rd+EZefaDiOW9WXTObBwLqRnJVsa+F/DtqXyOvMc?=
 =?us-ascii?Q?61lmYqCSm4Tqr2SxFRXXGB5Ik0ZI0bYD4fTTjWwjjUX6mSJrUsx6cQZj4qeM?=
 =?us-ascii?Q?vlF7wAUWjgEj6cnIoTjIi3BhJ1CQfxJlIBDz36moSrDYVa+SyNtmQNldmm4w?=
 =?us-ascii?Q?ixpbaY/bFYcyGpNozDTQuaSa2A/5RafLdVDQUYEmERuGuRj2S35A3tzx4nc1?=
 =?us-ascii?Q?BZpfwetdPVSfl1Ur1ku3w6UJTGKfDXGFNWGRfh9WGbKyuVUg8x+r5yRO2MUo?=
 =?us-ascii?Q?QAfrnpZSbVCGW2CxVPwLFwh4J2svpfBzTTFe7eE22N0dCl3c76Cx9uQdo2wT?=
 =?us-ascii?Q?ljgp9rZ3qpOpfuswPFJIOhfkjqqRBxojL+LShDQUjNDqOEqPRhYNVHrE0gqb?=
 =?us-ascii?Q?Mg3qCIYyYGtztwCUfFeSNY+rFLF6leuOjNAPmYSFBOV5IkJM1lrrAqZDT9bI?=
 =?us-ascii?Q?SLGsjrxkBcMA2KukSPguyO9N23eiAt2EhqXLoeQamsZGXmaBrokYeTGSacA5?=
 =?us-ascii?Q?ehh4/CrA6E4uNmHkFbBNs8ZxL06uPogJWCrtqIx0oL0tLQfnTlDkWBD5ZDuI?=
 =?us-ascii?Q?M2GFpxyyq7Qvr7OsSf087DPrc18KjqbYV4EwI2ZFzlMuDbLyKUq2ZEgQvNGx?=
 =?us-ascii?Q?LAIbHWXMdbtuuH1VnAG1H2soLK++HVY66mhO0wKrnSXj65z+Ev9e31udd1XZ?=
 =?us-ascii?Q?ypIewA/XLqdiHnBH991s2+kz5JxV6rdCSRK0ZSzqsGtg3J58FPvzktxulEAa?=
 =?us-ascii?Q?0Up47hCFxi8C2esLNrLZSJD51n7zDjsIrF1kOz3B4dIbQyIZlWdb0yrrU+Fw?=
 =?us-ascii?Q?HWS+WohGOYSh+gh1K5DY2CNb26RuRcpjbLTyMdC1vcwW2ERO07G8eNt5ZznS?=
 =?us-ascii?Q?2Ev2GvUXjXJ3UwgzcbkZ3mc0Tuwft72QSudoY11v3LjJY6rT8z0190JTZRpH?=
 =?us-ascii?Q?5Qu6rlsAAH0LN86DM1cS90IUwJXUE/SAwRG/FTJGSGCyO/SjZPGC2rbTHlCM?=
 =?us-ascii?Q?HBDwrMJnrel++vCkZORmqogCiD7c5PnVDFdDXy3dkMD8ompkPcpHMSpPDSEM?=
 =?us-ascii?Q?9svqvW0z2QbSuNmyWOodBEaHj3oA8obUnKAuBxgp8b4xtuNKylu/Kfs4uDPw?=
 =?us-ascii?Q?5DPagNt9Ip9w+RJWJprEiPGjWl4fbF3bUowcxpR6gCdnwY+7U0zoUCFfwYRs?=
 =?us-ascii?Q?B0MbLq1etJ3tEDHtlZ+6Jujd2UwVzhC96GIyiuZVVNNFJuZgJia8PB4aiaqE?=
 =?us-ascii?Q?t1RGREYVrLTOIPTlFUWWhTfCfBTJzp3rAR0ABsOuf2XPWtifLNIAiJjW9MVK?=
 =?us-ascii?Q?8doEtIdeZXwOL10Ut9tEQlYjP3aBzq3PzINTM/2e0HAc3j+mfB6BdanYL9d5?=
 =?us-ascii?Q?icOlLCys3w4kY1P6vvXP5OFxbZB0U3ZXj8KTX/7x/zENmAYJBB2TVesjHV2D?=
 =?us-ascii?Q?a2AbDCRKaBVKolcMsqeNOPICP3lXLe8KuEeAWriF7QhQLDy2tHsfAcEhYhDO?=
 =?us-ascii?Q?t7ULGMsyZgChA7qRt2M87iyA+qxDWXR8+8OzGCnB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7286fee-a807-4105-6b35-08de0c1b81bd
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 18:49:01.5540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RE5yTvyquOBjfxXEGgdaLZXmzDRSTTh01zRKGSnBb3idtPPHVm2bxMAS0LXDaYKmbOLU2YJDxkniu55ssxZfGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_194915_785065_CA7FE9BC 
X-CRM114-Status: UNSURE (   9.50  )
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

Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
warnings:
arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Resend
- colloect R-b tags.

change in v2
- move to nxp lpc32xx.yaml
- fix ea,lpc4357-developers-kit include lpc4337
---
 .../devicetree/bindings/arm/nxp/lpc32xx.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
index 6b7f5e6f99cfb..1e290f16a7a50 100644
--- a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
+++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
@@ -22,5 +22,27 @@ properties:
               - phytec,phy3250
           - const: nxp,lpc3250
 
+      - items:
+          - enum:
+              - ea,lpc4357-developers-kit
+          - const: nxp,lpc4357
+          - const: nxp,lpc4350
+
+      - items:
+          - enum:
+              - ciaa,lpc4337
+          - const: nxp,lpc4337
+          - const: nxp,lpc4350
+
+      - items:
+          - enum:
+              - hitex,lpc4350-eval-board
+          - const: nxp,lpc4350
+
+      - items:
+          - enum:
+              - myir,myd-lpc4357
+          - const: nxp,lpc4357
+
 additionalProperties: true
 ...
-- 
2.34.1


