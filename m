Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CDDD2E035
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SizgIdNgryjdOlgkT7YRB2O9/7ON0hG/owpTs5VbQAE=; b=479sUuZ95yjQ07q/htDEpucrNs
	1CUI8XMlAwEiTg+gfPEiCLoohFubUDP/tl0QpH2wbwrHsGrmYmRuIAeeXZ+Bl7X9XbRM2O3cOvs33
	3cg285uSkU8fMxgifiANDU7ikpqlVGzWU9MWMf1g3z+Ystwjz9qMxb2PkiwauKefNdmXH9jyxvIDc
	+APSEBVjIsPkImnl0BwGVNfYPfNZ8ueySDYUNU5k297GwwiwMElN9NfW6qAlfujJ6POElE6bc2DIz
	EPO8Odwd5O7ALqXLR4rzzZxuezktBxhFUSKfU1h5nPLac8kQ5pI1JPYjb7iug0buSnTuBHI+drUvW
	+RGk+9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XrY-0000000Dptb-2fDE;
	Wed, 23 Oct 2024 09:41:08 +0000
Received: from mail-bmxind01on20728.outbound.protection.outlook.com ([2a01:111:f403:2021::728] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XR6-0000000Djwv-0eUZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:13:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjlM4TnKIT9IHlmsSUiNbkALRREGd486OnCTHyyTGL5ZZGqbK0+doWewIIxYS/BKQtUGBFic64qBoxWgKM+FeFuSu2Q5eyYEMpyKO922MDFh6kNywy83s0fKfCnNzXo3Z3sB09uDuMhuy7oP1FtIiKrUo0DnvQv0RUAeDgeIjPf2ttcrI+NenJ2ozrvNnA8svAdM3U4hPo+Yoi00/p5Z39uaVERH5cyIft71GUuvJRcRv2+9XS80eET31MHhtUyXx4fj3HcB9J7Dm355z4/yfUd4rTZmqSDgkCC7XpGq2iwonBlzcLzA+Px1A7qQB5JsoKEdm6ae6W25es+IbR8YfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SizgIdNgryjdOlgkT7YRB2O9/7ON0hG/owpTs5VbQAE=;
 b=o8hpKpvmjiC2YmvThAaHVRazaRKphSvHQX5CDTQt4I/FZWfvM4cec2JvbPXx6cTlVhxeVy5D9NpwuEbjzrqUWueQhtZhVy0e5aTQZQk9vKzf2BVgpo5S/R6a3/GFOUceKXDnXyFxaZO/WLj9Ex5TN9mL7v0zrjbS6dx5md6vRAiAjgONl5DbjDwO9fhgdrUF2buVgMtqDmg9dzs8HIMkMJKfBbohtlTCqsnK8F0OGkJd0PrsuOjoSFDRaWk+TmzgYIDXcI/awN9belLYfkIT0qQEbWcKKRWQREirHFcLAk3OYb1kHmtjf5qZERgWztbSmvdjwUMg4nYTccTzIxhsvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a1::5)
 by PN2PPFDCD372071.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::153) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 09:13:32 +0000
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::12a8:c951:3e4b:5a8a]) by PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::12a8:c951:3e4b:5a8a%4]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 09:13:32 +0000
From: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
To: shawnguo@kernel.org
Cc: Bhavin Sharma <bhavin.sharma@siliconsignals.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Michael Walle <mwalle@kernel.org>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] dt-bindings: arm: fsl: Add Boundary Device Nitrogen8MP Universal SMARC Carrier Board
Date: Wed, 23 Oct 2024 14:41:15 +0530
Message-ID: <20241023091231.10050-3-bhavin.sharma@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023091231.10050-1-bhavin.sharma@siliconsignals.io>
References: <20241023091231.10050-1-bhavin.sharma@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PEPF000001B4.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::6) To PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1a1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1171:EE_|PN2PPFDCD372071:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c164a1-963a-4f51-7916-08dcf342f76a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x4IN91rlNk1gA617Aa4ooP+FJbFrDVJ9k3wZec5A8e9IYQi/RTMDUDUlx0KU?=
 =?us-ascii?Q?1WU31S4DUA+E73RFRZEx2Ylb+tQL1r+SpXWnwA5MS+M0RADof0WZEUHepLQo?=
 =?us-ascii?Q?SQRN5KgtKXG3dgpR6jkLr8Sjiu0+aJ3KTbT3waaikhpVLYAJ6S5dy5lqqgxH?=
 =?us-ascii?Q?1i2RXT4vCg+vT3raDcBtzdTVaT2fFeA9LfNyrg03oxPHq3neN7PajP0eSjT6?=
 =?us-ascii?Q?TYENEM0h4lZ1QCwpODfvgsxgCZeFaBQR0DN+LE5W01bTP8ZB/+DqHFELyAWY?=
 =?us-ascii?Q?9kCfzRllAu7eRl0Gt3O7qbGyt1LENLCKVbiGbL3hgvYoq0AStDDJWuC75pBq?=
 =?us-ascii?Q?VZDDeIlIjXykijMAElmxcUW3sOWfJDtNnA3Y1f0adN634L/w/VHDbOnEhYtJ?=
 =?us-ascii?Q?a9U1YrTA6Kk3aYRwZEQBrU2sH25zz+tMPfmJkGuL6Y9RTMMjuBUorvjco89Z?=
 =?us-ascii?Q?099FK4HM5jrMSdZoGCxLwqFW1Fg+6JJBJXI7G3FoQvY3D/twxg869TwGwz7R?=
 =?us-ascii?Q?vdospMbh208V6w7F66xrxhddufHs3dwRPvVRQMPb20dPUMsptsHc81Iajy9m?=
 =?us-ascii?Q?cEnHDwkayMmMIKOCf+NAzj8ymkeufAx9OIymgo7xJ0LzpFQNA/lOM6j9xfTJ?=
 =?us-ascii?Q?pSbcUUu+Q4LR5iJal8cu8CeF99+o7w3UTRsSyeU2SB+WYpe4ei8GabyMIxNs?=
 =?us-ascii?Q?i1fprpRa3XEXCREAVJ5678keQ89TQoIBGx0kV7N1v2mfWw1hCmKMwyAItIOF?=
 =?us-ascii?Q?QpB6Z1bappeizuJnGjGagXedmh8SO9Q5cyX5BO0DMoqDiqI7NQYJGZIfYdXE?=
 =?us-ascii?Q?UKnkAL1ZkUGPDzuZ0skwkYjWkVVdKi0Y85FSj/FsfYdxUmQZ87smo9cToPpd?=
 =?us-ascii?Q?eFpa0rh6kYiSmjd1B11wYQ0Bl/8Cb115wEGQtfcngoubZwol57PmUVs/K+uc?=
 =?us-ascii?Q?Eo3FGMtLxbiUP2D/VuomTluljOBsN3ySXwHy/Tw1hlsbClvd37GcanrDcqYA?=
 =?us-ascii?Q?yVb5QdMrsyp7YmFBM+2KbQaP9GYgZbO79CMYNGgliWFiAP2QfcGnbVoTZbyl?=
 =?us-ascii?Q?EEmwxR5KXncErFmgdfl6RfXV8jgoBjOjGAE+4iHxNNA1CuomF+TIEKoeNNvA?=
 =?us-ascii?Q?K36e6S63zQOzgqfqlTwnvfCv9ACNW07kZVfQT1ZdjXUhWAI4UOoJ+Djiurfd?=
 =?us-ascii?Q?o8Y2vtIOAWhiN71VtMLl/u1Rh8iC5cwMMD8v9uoMGFsjIpjEhLSzKme0Y+RD?=
 =?us-ascii?Q?84+bloYfgJtfu3/Gmnl72u0XYaY3cmNtYm0LzxkCf7hdo8Nur7FFfQjOwTgx?=
 =?us-ascii?Q?Ojltj8f0BoFD+q/uyAd6Qfws6Cu5JPmHcj8Wtt0buWngG7nNDYKq/NBLDb97?=
 =?us-ascii?Q?bMrxvW8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1171.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W2lrmGSV/mtX9qQN9NweBqj8mROkTCn+/+EynbECTCk57xghXls79bWrEU8p?=
 =?us-ascii?Q?HL3VrbwwBNYJ9FUm5iQBq+GopPt1HzGAvg4O0UmWPzSWhFqjgU8E9LKbx+0E?=
 =?us-ascii?Q?Lj53dguu0lT0FiCD+Lxqod4PFENncsD39MD0YMCBk4IlgoYt81VB8UmMKzgV?=
 =?us-ascii?Q?Mnh3J99SpgQtEiVVhaoQ2eAjRPyVPoecY5chk7/nN9ioq4JWO3rOMuesM8S2?=
 =?us-ascii?Q?36ke4WrB1Ftog+NPLwuSphNfZ5/yAXj0dz3XHJchjwKRnz2Pa3Bz4I0Q1Q/i?=
 =?us-ascii?Q?t728oq0Ig10LLy38+mw3t5Ospy8S4rdQEPNy53BaxbKHXPJE/O7LPUWM0oAy?=
 =?us-ascii?Q?OgxRqMmqElJMZNK1UwsDJUlIYjaHIREQE1W5rRJ69BBHcq5JaCg9n2O9M0rv?=
 =?us-ascii?Q?eTDrmXJS9yJZnOgJ87cyCz9mAf/roqNvDLBXpBbIztt+bwNz1IFNCMhqg+RA?=
 =?us-ascii?Q?5GveCSzM79rdS1nM1XgzbYl/ss5hcxwurZ4u77jjzZD1dhopLOZDlourWrVZ?=
 =?us-ascii?Q?jcLGDNlgLirdflrUMuNxngLNhSWtvVjT4buCKVmrufxBzL3TrQbnl1QdLA+a?=
 =?us-ascii?Q?dUgzXtUXPFnNDJ81RSteIRpH4BmasSxT15Vn94ALp7m2aGn/dzOVaDyn+3UB?=
 =?us-ascii?Q?CjbgOshBLP7s8oqX4/AJHgp7zGd7CaDT5pUVfKog8bKZUbJVPupKH2PPT9/c?=
 =?us-ascii?Q?UPjB/uywbRY8OaYvb83Kn4d8xvVW5pXwrlKgyXHsp9rc5Aa8kts1GqowpAOh?=
 =?us-ascii?Q?9ItudidjZTbwPWBDwuK7g6NKTTcfIzhxCIjaZw7TQbTMvGbJi5megGmlbf1y?=
 =?us-ascii?Q?nDkNpm3HuWzFoEhpxJC1JPJlZ8/lDBjE3k+QuWntcP37s4Cs4hWrZSAKCfc/?=
 =?us-ascii?Q?gS95E7PJIoifOp4NwSOhQXYq/cHlBG+C7nrYed9TyECw5624CE+MesCc9W88?=
 =?us-ascii?Q?zyi7y8H/JoSBuejagMFZrBSROgtDo5XKw75xFFMhxZS0iYhhyGedQGeytVHR?=
 =?us-ascii?Q?Eu9yrVyoIpuiwaXUIxmn8ZQjOJmH3HkZ+9xTvx6DwKOZZ7T6orH9WYexlMvQ?=
 =?us-ascii?Q?wUjZM6Z4mqb4hF06vOlc0qj+cNWUoYZlsruXRPlF8KlRkSntq0KiTTEWBk4h?=
 =?us-ascii?Q?lPuXfZi96dSaQpVp+AuH+v2vYcK7PYyVXWdg5O/OwUocS8vmEgWDTnRa0LGr?=
 =?us-ascii?Q?2VfbFcL583QNJy3DKgVrn1tTQx8EmDj+AgVRZSEhfwl6eOK7YzHQXHi2qbEr?=
 =?us-ascii?Q?183pKkC8ljJJ/uXPjTFQ9DGrlbMmjNUoqP2r55fWuTPQqyJGxvUrDjc/CcM9?=
 =?us-ascii?Q?bhJ8B6PuYLWNq6xsuY4aYi0MxlgFew62uRwvNl0EzU1uHc1C6xlZ3FcQyvHG?=
 =?us-ascii?Q?2zoxsGRP2Xp/OI/ARI95/i8RDL3eMRoXjxWOLdEKhiyyY93u75Z2KJIPIodH?=
 =?us-ascii?Q?kxgXNBen/Iuz6IjlkmzJsBz2EBLpj6CNRa8l8o6p6mQFzHj7usDyspFjwBgB?=
 =?us-ascii?Q?E2eOWImaaQnFMyhGDwZmBPkvPyreMNOMNf+UGgGSFhbrrQ4G72P8mCZ8vxgF?=
 =?us-ascii?Q?/sx7qCRbM7KuFdT+044HSdJCVUhG2+AJRIAmxnpLaDbW2d11ZJqPEOMplWCC?=
 =?us-ascii?Q?wF2r/++1xFuY5NZiKLr28gs=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c164a1-963a-4f51-7916-08dcf342f76a
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 09:13:32.5146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIIU1S/XL3zK5CwwWcOCh9faL3kcjbqMhddXuxM6LlnhdbSbmso+N2Hvf2wAZBAxMApodzbtizZO4GRDq60e4X0inJ6dY36Mb3Zs5L6Ggcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPFDCD372071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_021352_019643_6181B748 
X-CRM114-Status: UNSURE (   7.30  )
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

Adds support for the Nitrogen8MP SMARC System on Module and
the Nitrogen8MP Universal SMARC Carrier Board.

Signed-off-by: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b39a7e031177..58979c030519 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1097,6 +1097,12 @@ properties:
           - const: avnet,sm2s-imx8mp              # SM2S-IMX8PLUS SoM
           - const: fsl,imx8mp
 
+      - description: Boundary Device Nitrogen8MP Universal SMARC Carrier Board
+        items:
+          - const: boundary,imx8mp-nitrogen-smarc-universal-board
+          - const: boundary,imx8mp-nitrogen-smarc-som
+          - const: fsl,imx8mp
+
       - description: i.MX8MP DHCOM based Boards
         items:
           - enum:
-- 
2.43.0


