Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5534C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KikhIJ71LRulU+X7zUMP+uZ4gpDSLuQefUfh66heziM=; b=aZIuFPajjEOK3n34revlFtPE5t
	EHIJLhy+aaOvOIY/G/qt604WU/KgjrpTQBPWvnU0f2h9azb/Xte8H/irtwdF6WFOIMp4QDSgC11+d
	BLNZThnOXC+9fv0ZaNy0Js2iUD3H4yK/Yf/2pLhOuda1D+t4HgQkukDZY0omAUzpdE1z+SGzaRX+J
	MoCTzNh6F1/L8fpzxglmlsz3ViHWmaO2No/G2vvl+4ZKl32OgrzyQFNI4daPnB+IeTxUtiqoLcnHA
	OrUnbb/0nmQ/ZSArC8io7iwml/xjKVbYmFJGeNE+WDBXRr4RAJMkL3CNZNFGaaFMWZ2evTjZSJaDY
	4uFSzEfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDsb-00000002Wr2-2Mhn;
	Wed, 26 Aug 2026 13:41:25 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDsR-00000002Wfd-1WLj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 13:41:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njbTAa2CzzsbIA5hTWRdQMLYWr2ik6Ko7ZH8xbJ1tm5KXyOfc/BAs5KfGY2e5Z9GQ1OiEdz0ON4Y0eoHL0QPvaxrAHFyKqVJJfHj3uHh3qkf/0UjiYab5Oyew3XU+0dmEKftpJPrqj36XR61r/tguK6PuZI/UO8tpOLMLVhOhfNnS7+WrE6+6N5biiaQaNxDi+mf0kQrQFkioUuXyZAWtWywuakw8PZJpVIP/NsOwPk79kBiZ7mTtE1wqdBwTTb4GpwLmR6x1eJJHM4wuuCxqFyVWq/taKyyB8BhQNDr/3qSjtDQSN6/xbOV3KY5UXzEOsy7uzma+PPA79tgNjrcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KikhIJ71LRulU+X7zUMP+uZ4gpDSLuQefUfh66heziM=;
 b=CnBYxJPiKCBDvEFlMGCYGnp2mhTX8nWs5udwDTrpRxaFpalJx+8UoAmEYWGflKXciU3XVvXRLP/DUaPDxM77YI4L18h9kxE5vV3HP+G8XfNPgJAjx0duKeKEHg7w3xLilYLWNAC3zJUoO/dlWI966HI+K8HlMng+An/iN0m5NwGbiiNhAy9pH9X0GxN/XoNaiXtoUwb/nRuEQUOuYeqkHtoMOZLnI46Ytn/s7nF36w523kjvFkTXlV3HZCd7mdIfUdeStL/0WV43BjnJ0NwLSYCeps+eZ/ycMG0RspWNPUkIksUxkWZVODwvxkHlyc1ObqvX2LYNkhF/kPp7PA9k+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KikhIJ71LRulU+X7zUMP+uZ4gpDSLuQefUfh66heziM=;
 b=xN5iHdKL4P5BA1GTZZuOC1AQHZBOqmQ7QPb0Hh9iyGIgg4NW50eiLflFaPevsUp/cOfExOkLqXfsyGSaKQ8lp2sHaaQjIY19n+ThgaPHCTp2y5k2+uSn/sK5poNRsAqnsEMU/zH76dbaxm39yGzJXgYZEkgyKHPz/9rXhP7FjRDde197lh1Y47TvaisdrKvAvVV8mmmQqLnm0/MQTBHnlxFS5HJ9lhuZREw8A6C/M1xeOAqARN/kVSgX7GxK7ZoDmopuP8cmqbBZj4H+aweQe4Zeut0mlOqSbOwJvVKUO7fYHVcdkfS3vNhUn6/jCJfqQVaWpZUNgH8p38EafK3PCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by GV2PR04MB11862.eurprd04.prod.outlook.com
 (2603:10a6:150:2f8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 13:41:04 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 13:41:04 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 06/10] dt-bindings: ufs: Add compatibles for S32N79 Host Controller platform driver
Date: Wed, 26 Aug 2026 15:40:44 +0200
Message-ID: <20260826134048.854748-7-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826134048.854748-1-larisa.grigore@oss.nxp.com>
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0424.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::17) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|GV2PR04MB11862:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6fd16f-361a-47e6-2d75-08df0377ace0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|19092799006|376014|366016|921020|6133799003|10067099003|56012099006|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Oo4s9hYZMKgh3LOwxl/7YtfvJMj9pazlWkNmw9hsFGHARt8DBNOdmST71BenF2lUssPJWuNvREX9//t2V47/q5YLPb5DP44gbhfJ9rOrAFS2PgEaSY2t6f568k2THmHqCAR/OOtuEG5AkYta0DRd0XRJ4t3Q7P8GcmFXFF+MVzELsG994ksXii1atFP73zz9Ge3SxaWF3dXuZPwepNOyB5Bp5ApuNPOtHhGPsbyPQJ8zgoKjr+yArDi9M01TDpSSXgU5S+26JIJVjiAKJ3GTMz0P7WbIlxNsSwzVkrrvogX7A81wfa6poyOhQxj3eEW4ZtHXxN9dJQt0Jas7CZZ14q/4CCNkZHV6snh6gBPloERIFARiLQ60n0gvYfuyrdvPJWLhtVvYsGuT0XIhu0sQnSgJAVLtn2MQ+Bx0+DgmuTMcRxKGVtayLI4xyY1Dm7qPd+1Foe6P9IIjHWcg29dvRudVgAvRczoK/pPzGDzEJvD2GG8qjKYYcCXm20vtUiHMMBhE3RA1gSkng1KS/XaPu9v1Q3uELfBGTZfcLcvn2nGKY6l3A42JD/CoX4+zKH50Hst36fFhH2G3Ue+wPM/FaiZDxwBmK7sQsWbXFBhV9ZO7wXHFNCsikE0CA5FunfCTH7liFzbMyeDh3mKx5zmOkdQ/eFD+5hk1HwzBWdn6b+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(19092799006)(376014)(366016)(921020)(6133799003)(10067099003)(56012099006)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0ZtUjMrUkkvUHY1SmNHNnRFbm83bUU0Zk9ycGtsWkRQMDZyWUdpek5jd3lp?=
 =?utf-8?B?TExaVGZBRmFlT3hBTXdpL0VXTTdlK0dGbXB1aVdBUEV2dWMyN0Qva3YySkxn?=
 =?utf-8?B?MEpYOWVxdmJCN1ZDRUNaOUFjKy9Vb0xudHlXL3RGK3VVQ05VSlo2MkJHam9y?=
 =?utf-8?B?UDh1QkRFSlNzbTVZekNCSkFody9EVnNXQkxpNVRkK3FPN2ozandpS3BUdDNq?=
 =?utf-8?B?Y0diYTMwMXRhSlZibmJQZUxscFh4UE5kRUE2RktFNmZJMWhaWEhjTUNleS9q?=
 =?utf-8?B?Y25lWnZLYUNndkQ2dnpzNXp1K1h5RzJ6aGZlb2pqQldJWkNoMy9tQmxLcmdn?=
 =?utf-8?B?bkxNaURmTUptUzNZOXNobG03aG9PUWEyN21pZ2FWSXdHVDlxQjRWZlh2VWVF?=
 =?utf-8?B?dzk5ZTBvRGp5U0tmK3Z2UkhmTEUrZ2xFOEJuUnRmbDNvSERSblN5MG90UUxW?=
 =?utf-8?B?bkJwM0k3NUgyaTcxNXJaNTQxUFhOM3JvUlBDNjFSTkhqUGxNQWM4UVZjWHIv?=
 =?utf-8?B?cGwzRFYzNUw5V3pueGxlcHVTM01keVBYTlNOWEJNNGdpdkNrZ2c2RGYxYXNY?=
 =?utf-8?B?Z1d5S0ovUnFPeUcyRWZPRXdXNHAydTVPNlRIbkU5Q1JoK0tXSnpGK25iaEVG?=
 =?utf-8?B?MThpR2ZaSVdVTjJyazhZakwwVHErT2FlVDMzK0QxQWtqSHUxQ2xIWGhqMFhy?=
 =?utf-8?B?cWFBQmptMnRZMTYzVnZLeEI3eFVwbWJrVUVuMktXOWVlOTVGRXZnaDh4bk15?=
 =?utf-8?B?c3d3Y21XZkdiR2lmQXkvZERqdkpzSHlIdk93ZGhuMElXcnl4MnJ5OExpMUFo?=
 =?utf-8?B?d1RtLzM4b3g2cUt5dFUycnhDeWF4MGlJQk8zWEhLcVlWcjVMNFhBQlh0K1lR?=
 =?utf-8?B?OVJYYXY4S3FpV0hxOE94eWFZRk9kQldwc2EwT05Rek1tUVVhYTRiSVdPeTM3?=
 =?utf-8?B?T1J5Yk9HdjljMHhSK082MU1SeTYrK3BYaU5yRGEwRGtwL0p5bnJ0bllvMHdG?=
 =?utf-8?B?OEN4R0xzVE1VN3VOZVFZb1JhT2hCSURwM1ByMmt6MkFsSWMwa0QveVJqZkh2?=
 =?utf-8?B?dGduN1dmcjZRMkU2dDBMT2p6OTlUNDg2Y2kyNmIrUmp5ekQ5a0o5TjU4ejU5?=
 =?utf-8?B?azhvUG9lTThJKzZGMGRtcG5WQ0NNSmJXcWJnZjJtNWMxUHRFelBkV0ZUc1BH?=
 =?utf-8?B?NzJ0TTVBci9wYWVhZEowWG91THV3dFBXWGlFdkZtaFJ0QVNDVzdwS3NZcWtQ?=
 =?utf-8?B?U0Vxc3FBS3JIRnk3RWZ3b1BJNG04cDk5U3dNSndMd2ZhVkt4QndCQzhkNjVl?=
 =?utf-8?B?ajIrdDd6MzBOMHJPOHZHdk1sQTNNKzFoVXgzcEN2SFE4bjFNNGFwVW5VOUNT?=
 =?utf-8?B?T2pFcEJ5dE4rMGdwSlBZTUViWFdNMFpyRUFXODlOdHl0R0w2YllWcThiTGxQ?=
 =?utf-8?B?czYyT1BseWNmY3NZZldLTDA4T1ZOTHpxR0E0aU1JbE5pVi9pL21zMzJxbjVI?=
 =?utf-8?B?eGZWVVUvZlJ2aTdBSDF0djFhemM3ZUw2MG9NelIrWWNZNTBSNmhlTURPb3Fs?=
 =?utf-8?B?bGVheTJvVjBMU0NJNGxCTXh0L05BbFdhVU5HVTBZMk9qcHRQbXl6dW9SeExa?=
 =?utf-8?B?bC9nbkY2TysrNDlSWDhhZ0dLYWZyVkhQRk8ydEVudU9PbG45ZWZTSHdCWjVD?=
 =?utf-8?B?R3pyV1ZLbFQ3OTBidzJTNmdCSXcxd25xa0ozZW1kc3N6QldRNE41R1FuTlMw?=
 =?utf-8?B?UFFvR3U4SStuUkxuek15eVc0WEVXSzZvUVQ4ZUNYV25uWm5kVU91VGZVNWRF?=
 =?utf-8?B?dU1jaXkxSHhzb2Z5cTIrMUc1blVRWFBoa0FqR25yMXhjZ01sZllRL3JLL3pl?=
 =?utf-8?B?TStSVHowMkNMcmVUZFYwaXlCZmQ5T3I4M3N2WmtZY1J1YjF0RG5aY2VOV3Y5?=
 =?utf-8?B?N040alVVVndpQ29JeVNROCtxV1hEZmlWZTBZWlpCQkM1ZGJqK0hBMFpTM041?=
 =?utf-8?B?eEFIbm9zeWFnM1NXekE0UFU1RjZheGdTSG1od2tvYS9YRUNkL0dhbndiZEMy?=
 =?utf-8?B?TCttRFVUQlFyMVM1Rklidkk2eDJyQmlyOGQyRUdYM1Y4TmxtYjZhaWlxZmFE?=
 =?utf-8?B?UXhrN1Bwc1VlcFFqeW05WWxzQ1Z3bER1SC83UWVhRjc2SkNmdDJTeFVmU1NY?=
 =?utf-8?B?ekRJaVJjcHhETHk4akx2bFlsMDhGblVmZ3Z4NlVmUWVQZ2JFU3pTanlmd1I0?=
 =?utf-8?B?clRhUlZaQ09raEkvb0gwVlEvUzNUWlVUZFhSUHcrd1VlUXZVV0xXZDhKcVBj?=
 =?utf-8?B?ZUVaTURSVGsydVhWV0RPRHZtZk1WWTRPMFhDUEFmaG12Q0Q0MWVIYURjVkM2?=
 =?utf-8?Q?m8XXzjtBI83sq8Nk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6fd16f-361a-47e6-2d75-08df0377ace0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 13:41:04.6980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWbGj9sD1613qJa6XxcwE66TE+JR2gFEnqZJuM5cavWzn55NMWLLCiCpfSd8KtG+IxSaVT6U7S2Fwr7kOKhp4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_064115_669593_C03F5FFC 
X-CRM114-Status: GOOD (  16.36  )
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

Document the device tree binding for the NXP S32N79 DWC-based UFS host
controller which is compliant with JESD-223D "Universal Flash Storage Host
Controller Interface" v3.0.

The controller requires access to the SCM register block and the core
clock rate when M-PHY initialization is performed. Add the optional
nxp,mphy-boot-mode property to select the M-PHY firmware execution
environment.
Currently, the M-PHY firmware can only run from ROM. If the property is
omitted, M-PHY initialization is assumed to be handled externally.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 .../bindings/ufs/nxp,s32n7-ufshc.yaml         | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ufs/nxp,s32n7-ufshc.yaml

diff --git a/Documentation/devicetree/bindings/ufs/nxp,s32n7-ufshc.yaml b/Documentation/devicetree/bindings/ufs/nxp,s32n7-ufshc.yaml
new file mode 100644
index 000000000000..d9d5669be313
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/nxp,s32n7-ufshc.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/nxp,s32n7-ufshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32N79 Universal Flash Storage (UFS) Controller
+
+maintainers:
+  - Larisa Grigore <larisa.grigore@oss.nxp.com>
+
+# Select only our matches, not all jedec,ufs
+select:
+  properties:
+    compatible:
+      contains:
+        const: nxp,s32n79-ufshc
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: nxp,s32n79-ufshc
+      - const: jedec,ufs-3.0
+
+  reg:
+    minItems: 1
+    items:
+      - description: UFS Host Controller registers
+      - description: System Control Module registers
+
+  reg-names:
+    description: |
+      Names for the register regions. The first entry must be "ufshc".
+      The second entry "scm" is mandatory only when nxp,mphy-boot-mode
+      property is present.
+    minItems: 1
+    items:
+      - const: ufshc
+      - const: scm
+
+  clocks:
+    maxItems: 1
+    description: UFS core clock
+
+  clock-names:
+    items:
+      - const: core_clk
+
+  nxp,mphy-boot-mode:
+    description: |
+      MPHY initialization mode. Defines how the MPHY firmware should be
+      initialized and executed during UFS controller startup.
+      If this property is not specified, MPHY initialization will be skipped.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - rom
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: ufs-common.yaml
+  - if:
+      required:
+        - nxp,mphy-boot-mode
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+      required:
+        - reg-names
+        - clocks
+        - clock-names
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ufshc@4ac80000 {
+        compatible = "nxp,s32n79-ufshc", "jedec,ufs-3.0";
+        reg = <0x4ac80000 0x1000>, <0x4ac40000 0x1000>;
+        reg-names = "ufshc", "scm";
+        interrupt-parent = <&irqsteer_coss>;
+        interrupts = <211>;
+        clocks = <&sys_clk>;
+        clock-names = "core_clk";
+        nxp,mphy-boot-mode = "rom";
+    };
-- 
2.43.0


