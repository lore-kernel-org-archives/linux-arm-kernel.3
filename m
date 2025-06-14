Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E450C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6V8NSi9e0u6yAl4REaHsMMg5FYKoLaEz+0hhohNVQQ=; b=juCnhA/KxhKCFEI1CzmkouOBfP
	bxDSj4JqwgEW6jAf8KHfsH0HIuQaKLtwXuwUAXO3xUFyEIQPMN4vUCjYSMoJ3ce27ZO8mAiaI7sm3
	pdmUw4stRzfTUWgdlN0Qiq5bbRquT5/F24/hN7CXCcjjzWt3/Wz2Qyi3IBMjGgWeg9HHXHKnVU+Nd
	cnF0yfIz5k2iD6x6WD5uC5NQJCtgS1mPYFmpj5lVQSdJOKWW1IQk6o3GVDTiEwWQ4f978sIwchiFa
	t6jFfS9+qqQHyhjWqZ956MtZ+qQibBH0XTWBdRYGIC5iKkHHw6fZ2Bw5zXU9bfOOduGZdJXAkvJfc
	IK+3i0Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQQY8-00000001HlH-3W2D;
	Sat, 14 Jun 2025 13:03:56 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQQPE-00000001HGS-2fjL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 12:54:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPyEDiH7PTud78O3gHwm6+7wv/4GsOmm1pBkhvcwvaXuY6lizGyzc5xTQ5qIAfPVNviSHSOmHuU9XGVoNs5bor5sLJo1i4cKuCtwUNXnq57igshcMFLgG7i/wfH7iArQIXfrPVqjRooubZEp053UkDqYGaLoPFjx1rpC9u3GujdlhFZyce5F1sAQJVoYh7hsboX8HuAHpVdDsHztJW9ZeylgGm+ILCIQLFvrvEfxtlyt70WpijzsXxhnWMLb1EROk67v0ReeTRTtVa2DU7ZyKSe6MFwN7O9vamw3SKIRk0DQHzz2Vyu28AMiLJ/T9EQ9YTP3+bBb+lYkqF9NAlCQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6V8NSi9e0u6yAl4REaHsMMg5FYKoLaEz+0hhohNVQQ=;
 b=ZQvf1JAfzYET3gjL0qR9iOvLyWkSAHjS7/ZCBMOWIR26Ilr2GPErDqgJnplFwrop2J+iiuYNSOmvw8DubJ2CzZC8F48Z6s7P5n/tr24eP+F1YxuoKdb8AhBI47AHylNfHUdwspO8vpoAgx1EYVfj2Ln8QNZ6Zz6j3CsTIpf1IUnUHf07h9/YKBCtTjDfT+WxILBtpyuOTD5E0gX1TYuGHjsKsl4J2L9ukpJNdhLOZvw8JjL9ZJI3stLGNxlfUQhxqv4B+GTaobqsHP5ZrxC+MOPILB++NSG3M0u3TvwlDq7vhzgv/80YJmGrP3NL7EtbP/3uo5p3I9mrpsJS/J2uGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6V8NSi9e0u6yAl4REaHsMMg5FYKoLaEz+0hhohNVQQ=;
 b=MwPFJBThv/UoCBDx+Tj8hb+RrrOM9U593thf9uIQXD1cZyhm5nkbZvOJc1zQSiQxXPLodfM/WdfUgy17Ulc5DBx+NrJX7PinTJXWR31HwghHOQp0ImBfmznHbpY+3kkfShJCcS2HR+TKrq7acjZMrFdjAJ6mWS7ntRXwlmUQ2jOgqLj0isdtb6Ax5wSBTMRiODLek6Z7KbMWXZkXZGOxkSgj+4euRWsfFXnhkCXxkNktVooRER0q216Ukop3r0qeybDEJGZZRjrvid12J8sDjx8XkGS6GLXOEsp5QIEXbYf7lZt7w40/+xQ1UmR6FTtM5GWc1jLH6eUxf86wieHvMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10958.eurprd04.prod.outlook.com (2603:10a6:10:581::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Sat, 14 Jun
 2025 12:54:41 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 12:54:41 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.d,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] usb: chipidea: imx: implement workaround for ERR051725
Date: Sat, 14 Jun 2025 20:56:45 +0800
Message-Id: <20250614125645.207732-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250614125645.207732-1-xu.yang_2@nxp.com>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10958:EE_
X-MS-Office365-Filtering-Correlation-Id: 268fdd24-c96d-458d-3048-08ddab42a0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1g/ew35wpSOqbqOmOZ2IR01I9KIBlOaFso83VQ3yCUy2GrqTqwdUeR8D7GAC?=
 =?us-ascii?Q?rwdViclWDk/ORAjRkaMwuadDU+tDO1qNKVDmXI7hBKJ8CVxLVQK8oXiBd+H4?=
 =?us-ascii?Q?18266nXSWZyv8xzDk1VUBrEpXKdRhbVUzJciJEmCjWVGRzKwMglB8yCSRT1y?=
 =?us-ascii?Q?NZUyfZmcxo9sJ2ZjT7+VHKF9Ajwed6g35Y94U84Tqb/nqkfGBeZjDRJYnnI5?=
 =?us-ascii?Q?EJrx9FfxGL7bEUJwwpxzvi+eR/xLq8afOPi2WLakc1AhrOIsFY2sso9Ueu7B?=
 =?us-ascii?Q?yXDbPqByP5jHwDR616uQWvGeGU5YCVa9xB5+hRYjOZ1Sf9LWkEVJyGeEZKCF?=
 =?us-ascii?Q?XLjLAUkmudTUanKfLkwHzXF7/8apygVu4MV02oHA9/9jsGzN6ARVLa7ledu2?=
 =?us-ascii?Q?XyISPQ6HBkXoQqk32v7OBz81I3HRMJ2zyVdEeWUUpTgG0Ag2/JhA+D9+qtbB?=
 =?us-ascii?Q?5MLqJFs8CyYiNZO4Hsx2mlxtwEd8/G8ZEG35rId6N10knfi6X4XPEKQa07Vq?=
 =?us-ascii?Q?/TeEuUST90Vum/lWOc7SmDfxNKPx0kTH+oKZ5OHpaA7FA0RQIEgvq05HInHF?=
 =?us-ascii?Q?fNTSbCOzhC9zbwCQUauir7LYfM6PjLQacYZ6GITlfqlGUQZQF1We8cAqR8+N?=
 =?us-ascii?Q?Me1G2fYY4vHGsfi3lUiDq5U6yLUlOw0kt1+OXSH6rwpF9F5J1+GT2OYzV/Ad?=
 =?us-ascii?Q?6Y4DUYvLP8TkaGRnhGmJRu/Xj20V44bczFmZN/53wOkH9SHCRVihBRIhUHq7?=
 =?us-ascii?Q?c8BeHPgBBC9R2oj9sq5FqfMtwC16p0WmyQYobqRD/hKIq4otoEJKcdjZPNyE?=
 =?us-ascii?Q?tlvl5msIOJ4RC3w21Jt4BCxtM5wm5HlM8Jk2UggOqS+Ctd1I8R3HwB2M/rgw?=
 =?us-ascii?Q?poP/PPyWc94Vt9mFpJ7JUNQDRjKbFgrZn5mjIJF/ylmC4YOLJ25DXYvJaE3S?=
 =?us-ascii?Q?kbf58GPxBS0xUp5PP+5UqiB7+Za9lKc6K3m8hrs4DcpXhRxuF/QEg32gQfYd?=
 =?us-ascii?Q?Ymg9IK0R/BKQd2JoFBwQ7bxa+aSDBf2T8OK5T6Ic9fODbSjLHeJvQWHjpsQE?=
 =?us-ascii?Q?ZKGokKvPbEE5gKTlUXqUlY6ds+sDZdQYrzzCmv2w31r6B+qkwrY0kvPfCG4Y?=
 =?us-ascii?Q?1MocAma2kbKKOHEeL2IgWuW4NeZwKv9bwYXHJERqCsQQlmsQXY7/PlR3dFY5?=
 =?us-ascii?Q?BHGnuYY3ku41WpHgxYOW0gvvXVErd5ur8eOTKoIv7G3Re3cHPi7jaSvSW5e7?=
 =?us-ascii?Q?2Tr0LBv+e2oCzn4imht7XuroP/inje8G150IT3jwJ9NfC9gazWYdkFLZF5BJ?=
 =?us-ascii?Q?rBRj5VJOlugLC92iZcErVIS1+7gJZNQv2NtlJnLWgvUOz3Peq/NKLkAIEo5u?=
 =?us-ascii?Q?FyflMu0BjCVc/7T/bKLXVow9urWFiNgnxkdC8g0h2wm/3BV9MbbYQ0ryCJDX?=
 =?us-ascii?Q?0cZLSNBk++y1qbLSC0JKTaDa+bMORM6N1ShCXv8xTA5ZKPVjUPE3wA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Y7m25aZyP8RsSp2T4MNopqCrp9S/CBmF6w7d/QjS96jRGFHK+YZQFdOIBKo?=
 =?us-ascii?Q?daBU1FaONijBBTSpSwq24rh2BaL4awEu7FicWCfEH3YF3LwfaMcLx+oknCdZ?=
 =?us-ascii?Q?AOc7Y7eZ98raNzYJfTkIO8WMYtqhVM4jdjxgcJeUev+x4ZzB3Khj7l2vHiz7?=
 =?us-ascii?Q?bOnUpT7PaJFMcSTvhURogawZPT7Hqy59OgXH8qNNGt2h8gPfly/kJ0H08cHF?=
 =?us-ascii?Q?nKgLBG1MLnjMJb5MIfKir6+yYR9etdWm4ExAEyFMxrtpJFn5UnNNRep/Tgfn?=
 =?us-ascii?Q?/+yyaN5GkTXuHvaMacT9WLb+LzO//nJ9kFLFTuLktD6FjogPPO+E6XevRXlY?=
 =?us-ascii?Q?uTsY2jLDx23Mp/fuunBZLm2ig9jp99ARos44Q/HKZ1x6+99pFR/6fFzlK0tm?=
 =?us-ascii?Q?w8H0ZsH43wQ9y8JuH4nPClwh/IRVU9sTKEiTPYm/8qO63qmukIWfKWu/DBTk?=
 =?us-ascii?Q?Sy1OvnE/L2JDOW4uZnuA+2Qh6tVRUyTxL4eZMLhRnQ2+AO5NL6nwlUh6rrvW?=
 =?us-ascii?Q?hzLixWGX3BFYwKk3c85rNiMeMH9RWob8cUeD8obCmLnA/TGAUoN79fNNQQsw?=
 =?us-ascii?Q?aIXEEsCexedLnCFyi4fFiF4Ae3/EqaETG0sdzPzMN5ABsw1KRs7t+A254d3W?=
 =?us-ascii?Q?Cu3lXouDPCb0AMvID48zoMJJXLPA00RsKu/ruB9Ksf/uxu85o6gmv3IiDaOx?=
 =?us-ascii?Q?jKKQfALWlGe6A/+ZH7YNkaHXMron1oLCbvNQqSLtpwpPJc/S44jnqkLm59QT?=
 =?us-ascii?Q?djJqhB7bqYps+yfrZ3tHd29rROzaDkqjYRmX2Xaq/cEsfw2Kw4KDj6dHeCQC?=
 =?us-ascii?Q?e7NX/Uf05dsC0dVugxzLiV6mLGCc1JARPN2IcQdGQ5hoS7l7uzaY+T4ILzwM?=
 =?us-ascii?Q?sst81v4HDkUdj+rpW8BQwJFCh063NzUgUiLcdYAzZbhhZfnuQkmn01hOKFPB?=
 =?us-ascii?Q?G9/3jsEJyb+MJ/jYJvU4BNDcrMoJRaUeDlx++3EjReVxnVLeI3ijBZis6gkP?=
 =?us-ascii?Q?/H2u92X1kZJG+slIiispVv4CbmDDI5NsF8UAEU86IzSEyG7bsjWD8TDaV2jH?=
 =?us-ascii?Q?6GS4GseN4xJZxc5aD23/uGXyJglz2ZakWvcu42iq93ZzlAwbpUA5hX7+24Tg?=
 =?us-ascii?Q?B/bNPPFpqUENOcJBiCEcISvikr5mWp92QS6Cj9RaHIcQsFCMutR8VRkda1Rm?=
 =?us-ascii?Q?wBFXob8S5DP2DZBT7MkztHd4ameAwhH7iVVh4F0NG5HJr9CZxAy/pTKWlvuK?=
 =?us-ascii?Q?OwtrXKVYdvlPDz4Qck4ZFo6OjDi43KXHzOu5SAqzoEKF1wjuWpQXGBSbasQS?=
 =?us-ascii?Q?GkFZfCHaFjBwwDeHnj6PnTbZCtZeRbqYCDX92MlgOtoGyE8PyIE1W0sHs5Dc?=
 =?us-ascii?Q?iuyTDH49gNGjqNYaCrZYnBmiiMTzDXHcl32u3UwM9ysfwkP4styO1j5Kl7xX?=
 =?us-ascii?Q?vvPT/9DEjP2RgXI5kSez4t/mWWI6jseVZj2618EhnvDc+lyjoNQR1O9h18eZ?=
 =?us-ascii?Q?xf0Yn/G2DM/X2SCF6nFKbjxwT6uAT8c2LUPfg/EzaF2lWXpOpegoqUonrEVE?=
 =?us-ascii?Q?vfRRtiaMIt6YV0nKf18sflHdruSlVvUkc4XDILo2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268fdd24-c96d-458d-3048-08ddab42a0bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 12:54:41.6196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aDU7AEhKkEH03pBKrmKpHmigdW7ZWW9T0VfvPNWqmRRWaAxvFJmHp+QotyFPPdb/DJPJoBhfLUNzHc0y/XCpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_055444_676190_68A14C7C 
X-CRM114-Status: GOOD (  14.78  )
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

ERR051725:
USB: With the USB controller configured as device mode, Clearing the RS
bit of USBCMD register fails to cause USB device to be detached

Description
1. USB controller working as high speed device mode with USB gadget
   function enabled
2. Cable plugged into USB host
3. Use case is software-controlled detach from USB device side

The expected result is device side terminations removed, increase in USB
signal amplitude, USB host detect device is detached. But the issue is
that the clear RS bit of USBCMD register cannot cause device detach event.

Workaround
- Use the below steps to detach from the host:
    write USBCMD.RS = 0b
    write CTRL2[7:6] = 01b
    write CTRL2[8] = 1b
- As CTRL2[8] is set at detach case, so attach the steps should add clear
  CTRL2[8]:
    write USBCMD.RS = 1b
    write CTRL2[8] = 0b

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  5 +++++
 drivers/usb/chipidea/usbmisc_imx.c | 21 +++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 780f4d151345..79e466e17788 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -331,6 +331,11 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
 		if (ci->usb_phy)
 			schedule_work(&ci->usb_phy->chg_work);
 		break;
+	case CI_HDRC_CONTROLLER_PULLUP_EVENT:
+		if (ci->role == CI_ROLE_GADGET)
+			imx_usbmisc_pullup(data->usbmisc_data,
+					   ci->gadget.connected);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 9db67d6d0ec4..415d3ba2e9ad 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -998,6 +998,25 @@ static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
 	return 0;
 }
 
+static void usbmisc_imx7d_pullup(struct imx_usbmisc_data *data, bool on)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	if (!on) {
+		val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
+		val |= MX7D_USBNC_USB_CTRL2_OPMODE(1);
+		val |= MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
+	} else {
+		val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
+	}
+	writel(val, usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+}
+
 static int usbmisc_imx7d_power_lost_check(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1115,6 +1134,7 @@ static const struct usbmisc_ops imx7d_usbmisc_ops = {
 	.set_wakeup = usbmisc_imx7d_set_wakeup,
 	.charger_detection = imx7d_charger_detection,
 	.power_lost_check = usbmisc_imx7d_power_lost_check,
+	.pullup = usbmisc_imx7d_pullup,
 	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
 };
 
@@ -1131,6 +1151,7 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
 	.set_wakeup = usbmisc_imx95_set_wakeup,
 	.charger_detection = imx7d_charger_detection,
 	.power_lost_check = usbmisc_imx7d_power_lost_check,
+	.pullup = usbmisc_imx7d_pullup,
 	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
 };
 
-- 
2.34.1


