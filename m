Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78129C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IKzAyN3UxgggVyN4KZj4Pr8md5GcbQgqxRguhjWkY/Y=; b=I5izuqrnLoLeBX0r4RYBWQPWcn
	fUvh7x1T2WrOYzADFfpECZMAoDAWcxVdMxOsRggvn/qIh3s7Y0NefyluIaoQujN+wKDLRczdVkSsV
	aVNmXEAbH+RndypZT0b6K4KnWs6zwINPZGHR3N/LtdwtingWMPVXNvhQE5ixTKx6Nd5nm+5qI0eVn
	0+1i0+rS/5Ve6SPxdDHDFE2//magSt7LFo74TcX/6W+I0V5HM8UmXbvjaawHD57ZXkMqpWDm8eHdd
	ifJ3n65NRXDrKVQWTL+PX621AH/K7lhBL5Ps6M61I2k/CEycByuGTh2ZVEhGBh+OLmGq2bxzwtaK+
	2H0larrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZv6j-0000000Caw1-1faA;
	Thu, 10 Jul 2025 17:30:53 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZt7E-0000000CEr0-3noa;
	Thu, 10 Jul 2025 15:23:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCbiOYoGzWRz3CmAoCugCXz3SXZdzEXcwHBGoYtrPyhzG6NFwBtbXvoR8MzzFC3xWakFniENqFF79PROA3IS/CJr5xI90FiOfKNsuBEw5X6fouhr8wb59BA4vXQ98vu25yqhdZVUvrx5V93cgoIrETN6jcsUlJQKMS+RNzHxwtcdn4D2C8C+XGsRaMKZ35EW7HuinxhlPnPByjNXbitMiJAK6Hjjf6TfX1Z0f9tEHcuS23lnH06xPSFf4TBE5+gmsl9bE0VG+qs46jSBLTvVLHFt0ni3qOUSofNgPa7p/r4vUp0QrYVN9RU7HVrwEhiZdoVncrTtKAtFL4PhhcGfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKzAyN3UxgggVyN4KZj4Pr8md5GcbQgqxRguhjWkY/Y=;
 b=RoFXsMs0wKJP/cLgOe53wPh8InIht48aIrLORr64W/jkoBpcHcnoxqPnmiS5cH7sI7phMt5ih3Us9FCaZxRTWpsdkHrNOjAJxkLMdK0NGOjRqCjLRC319fmHYyaEy/0FQcvLf3jtdIN9Ws9AHaCZEtt3wXHclfx/K4wNdR+hXCVrWRlZojej/Ipli2P4hzSr/z55WrCMpgYEWZPFjoJqJmOmqeQoT8mFazfMyEGuuPAlZXAA1ZC5kZ8u4Rq5FcnrkQulCZEByK9B7cf8RPjsInFYxWGMJU4ev/uXlo2Ci+T5bzdISWz9mV0L+S8FIkXYq0ZQy/KwTObyu+BbpiCHug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKzAyN3UxgggVyN4KZj4Pr8md5GcbQgqxRguhjWkY/Y=;
 b=cbLyDErt3djkT+UmsDiqded0Tk0uCGZwDQmYO/3C0MJCQ5hIRE3p6AFtWOVowAYMJ6+3I+aImTI9OtqQ3VMDm2DSLLa7v8dMlWjqPEHEDFk/xLQdksFEvgklS/rlQZ/BbdMYsuQLJSMOvop7/R1zE0i8A9F8xDm6sK/9jEBsh5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by SA1PR08MB8367.namprd08.prod.outlook.com (2603:10b6:806:336::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 15:23:08 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%7]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:23:06 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: linux-rockchip@lists.infradead.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC/PATCH 0/2] dwc3/rockchip orientation fixes
Date: Thu, 10 Jul 2025 16:22:48 +0100
Message-ID: <20250710152252.2532020-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0621.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::21) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|SA1PR08MB8367:EE_
X-MS-Office365-Filtering-Correlation-Id: 801bd232-d26d-4450-eff5-08ddbfc5ab65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n5oUA06jKw/dBrbfT3zYSNkEdV+l8nnYcVJ5TE+dGD5tS+YbxMEyB2F/tXRP?=
 =?us-ascii?Q?xJBPECv3XQ+qGzXnRzW2b7lWr7/t9ilq2NBhh2vbmrXsHLBVzEbR/u8N2dt2?=
 =?us-ascii?Q?wsG2MqtmdXIXNDa2uxcURNanfYDhhQOA3YZK0Hm5PapVyTkaxjcM8jZCFTI0?=
 =?us-ascii?Q?wxBbodPexx8QdLo5YL4Vaz2xhTEZR8clbtG4dDzvfc7UVdp3odK3X3Hy7tCa?=
 =?us-ascii?Q?JRphj8+MnNJ8+HR626KSd/68BHtmysKBWyvBqtgTr4JTdLLa9DZiv7oUuxo5?=
 =?us-ascii?Q?b+cqX7299gJBThS5owkaO+uSmQsFwdW6ZilD8d8r+qt6ATnT+6z2vJyVbgzA?=
 =?us-ascii?Q?IDxwUXp+Q+uIpklu2CTamOsxocM3mAIp1uCbMQeBadAHAu4xRhs9O42N84OU?=
 =?us-ascii?Q?kGP18otZ95OeikA156P2xjADJeI6g5ru3eFbU1msbJzjzVQjXKzTUJkRzDHm?=
 =?us-ascii?Q?lq9uaHN8maeNa1b4qb9KuGSpZmkKbRsz02dZp4aO793fgwtTPF//kYtiti4A?=
 =?us-ascii?Q?HME7V6ukgfk1PjGs3HO+z+J9UjKFoWepDM+mZV4i0BcoQMHFM2Vyoxnhpw8E?=
 =?us-ascii?Q?rrnPc6hQdquYEdWnwqlIA2Uk8MFQaXiXCx1s5IaVlcWpDl/hcGBF1jqrwJSG?=
 =?us-ascii?Q?1CGyhk/03W6H7bZhlKCMdaIbjn+CdbgzsnmebFdhsq32w7XstWZX5Ls+QNDH?=
 =?us-ascii?Q?FkenmPpJEbPDgHncYGQhTtI+qHwTwI+ihoLGBpifeVRfaGEoGLoy56Kl8HXh?=
 =?us-ascii?Q?VxBSCeWMxfz0f7bNlMijKF/KH/KlnrdToxOsSjtyERRV/HscNL9anlI/HHSr?=
 =?us-ascii?Q?/TGtwswBHDl1EAk8SEpa0IMyXlwcKQA+t62OGE47Zzsbe/+fCmdvp4tJ0UX8?=
 =?us-ascii?Q?utPCK/+ciGuo0apch70PKJLmP3UUK57OnbkAMPT1Klc5rTEqK7J93ShcMhZo?=
 =?us-ascii?Q?DxXO/pahvbb6VTZAL3WrlnUw7EFhzX8hIgQq6wLUGGi6y+lGWo5E5ZR03YPm?=
 =?us-ascii?Q?jb+fTCVXYnMdpAKsE7bQz/0btlqxvK5BXfxuEoHx3jUWRZdAYR6d1njQuZrl?=
 =?us-ascii?Q?DOhxoSKR7oz9X6eVer7mRnc4/4xOW34NTz5hmDhA1kdrgeNVKObw9Je1+bp0?=
 =?us-ascii?Q?bH64rojjDax3cG4KebByJI1WwTS1eetO32tcN3qFeKD4DiEADouSIZjJ9Skg?=
 =?us-ascii?Q?npxfV0x4aGtw9rElcrzFmxaGU1Wz0EP3m86bF9MbKF36KjFS05yEmy4LqGWZ?=
 =?us-ascii?Q?FBewmSQJn04HwJHTFjI+7SdpLaOFVvCkrTx5R/zYvOGKvcmZUAz7XCQ+ryOo?=
 =?us-ascii?Q?Nw0ozrQLxDzIai5UZ+qkvURscKr0wa0efYdeagyzbI8gj3vgA6U2L6fJqqtW?=
 =?us-ascii?Q?21lpaLGI8AJ7FgCWZm/lKZEh+UDAk/mn/meOJgjg8VhKUG5ghyqCskHFJszf?=
 =?us-ascii?Q?j6Olu+UheBYoIvMon5/QsQZtRVsPLfcbYwHzNA3n+EWAffqPCMGsjOXqOR6m?=
 =?us-ascii?Q?gI9jOCoCaBxFHj4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OrAP6UpnfBPNb4b97Gm2BlTFJcSpKapcd6a3loosWP+DpCEBes4nd9NV1b9g?=
 =?us-ascii?Q?TsTqlhRrcGjEw50S02OeJPGa94YRfN42dXY0Hzu+FwkdUciy7e0Sx/b3/TcH?=
 =?us-ascii?Q?9jmLVwlUqxVzQt7+TXt7/5Uxjt9rV8t/nC3U+C9FTZ55VeII5ovusoS9coVb?=
 =?us-ascii?Q?e9hIWk/gKWEd8lkQuxFYfbnKEKAFcDYntlUkTEaEVPCN43WL9TeSHuWDKcAZ?=
 =?us-ascii?Q?UQhOIvJLHL+ndPIY6Nebc22UxUGzrQrCqTaKDdWEaAdeAV1KURneyI7/7psa?=
 =?us-ascii?Q?OutPjsaI/G1oR+o23WtTE9DlkIlD+2XtVQoGpRt9YXgDMj8cpA0eRXgFAOmw?=
 =?us-ascii?Q?nsww7LW0znGivsyZKNuGzI84YIvebMkj8ba4BPRgJVz7fD79ftrBe9ydLpV1?=
 =?us-ascii?Q?JCulO+9I86N+zKpoYVrFNUQi9nKWdxc5U4+09LeSBEtby1hwLnjR6wZWsHCf?=
 =?us-ascii?Q?aTXjo0kGKygTCXuRlU2Mbx6IEHb4GkjvVnZew9xKEdQmKyLQJaQ54jObSlft?=
 =?us-ascii?Q?sPAYtNYTDJF8StCdL953sySvgy+/92ayqGdZ8uirm8gjqtrzIKqpsESx147n?=
 =?us-ascii?Q?jqKkbJguPHu733TSHvBNQM1CL1YiogBxgbzcn8b5Sa1XfroPCv11OH+2h7gX?=
 =?us-ascii?Q?1CWYdWdXJFmgjiYhcLzMLzrFSIPE2GmaTou2QTKE3m0O+0fHaMPbImf9bm6O?=
 =?us-ascii?Q?5vGCC+nFwV4PQIXFW3HXp9MYf+mX3q8xsGJ6lFrbpQ/5f6jUsn/TsYLZcvFI?=
 =?us-ascii?Q?dPqD2NFE5qoa89AxsWGJJrl1f0wI1t/V445lKksaZgeLsXAxggqRLfYIPYjT?=
 =?us-ascii?Q?rEWvkomWfbMRSyOIikxHD1dLfNzsK1t0O/oL9w1tH1/M9i7pHuO9ZZpdEzBD?=
 =?us-ascii?Q?I9lVm2u4sbdXLXkIT4LEaYvW5pgg1t4fNpkoMZQAJEDLjjLbjicX5LSmczM8?=
 =?us-ascii?Q?nSAt2x7aiL22OF1p/OYDXLE1DgNPuKFBcqo74E/UHonGYhMNHm6sjxShKYOt?=
 =?us-ascii?Q?ex3KSAyBi3MbuK+uGrxeNpsCzVsRdDgiLKF9VdXk1UovNcFDg4ywnZcPkQiK?=
 =?us-ascii?Q?qkrmE7oHpVWlijn0arhtbKZwrFkDI6WCwBzMujTwilhpx/lKLV3wLqDTFkrk?=
 =?us-ascii?Q?ET5hUVeeyYwiRtMuWeGFR2m0w3BLRN+AdlmIC+pt2IAlx6v2yfll9FygzTOb?=
 =?us-ascii?Q?NOHIy6BXsQaiN5DWtZjg/KiVKlVfJJs6RxND6g5EWLiST4ofpJEJh4p4FYEx?=
 =?us-ascii?Q?M2PUrsOQbDjtL4C0zd/p3WPgV5XC+iyRiZQiRC8cKmV5jAiK4mVd5h1HKyNz?=
 =?us-ascii?Q?0azeeLFX960uNSbWgEdwojiK5vfb6Bdn04ec2BtTkB6Ylp1pUMY+9KDHxWbX?=
 =?us-ascii?Q?ThxMW4QDv8ZcG2NWxW66F0LrUixqEij+mXs8YROAAHFhiZpygImHZMUH+y4x?=
 =?us-ascii?Q?YJ0sVxaIOUP5T4ve7UAEewdKKzTqHd+LlR1BhNi4Oc78SL62ScVa0plR6n7U?=
 =?us-ascii?Q?79FY17LRMCEqtAKYBthaK9LgmKxG8BYVdNScJ1+5D8WWf3voNY24kPfG/Hh+?=
 =?us-ascii?Q?UdJUsifFEIY1hhlrfUXnKjeVeU4lvJa9LhhTxwWkX5zL/H94KQFqn/I6DYFm?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801bd232-d26d-4450-eff5-08ddbfc5ab65
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:23:06.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R06wzE9KWxrWd5o6lewFoeGP6quKv1dHO7wx1uWk8YWMZ1HHFYHsZ/HXUqvN04vG+0nEekY/wxoJ5MvUClPfPsqByhdp//HwmhRwLqkBdqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB8367
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_082316_977581_E0FECBEF 
X-CRM114-Status: GOOD (  12.59  )
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

This series attempts to fix an issue with using the USB PHY on RK3588 as
an orientation switch.  The phy driver only updates its internal state
and does not write to the hardware when notified of an orientation
switch.

An early patch addressing this issue [1] updated the hardware directly,
but this changes the phy state underneath the USB controller when it is
not expecting the state to change.  That was addressed in [2] but my
testing of that shows runtime PM overflows that cause the device to be
left disabled unexpectedly.

This approach updates the dwc3 driver so that it always signals a phy
mode change when a plug event occurs, allowing the phy to reset safely
at a point when the USB controller expects it to do so.

The dwc3 changes seem to work in my testing, but I have no idea of the
full implications of setting an "unsupported" role.

[1] https://lore.kernel.org/r/20250226103810.3746018-1-heiko@sntech.de
[2] https://lore.kernel.org/r/20250610-rk3576-sige5-usb-v4-0-7e7f779619c1@collabora.com

John Keeping (2):
  usb: dwc3: disable for USB_ROLE_NONE
  phy: rockchip: usbdp: implement .set_mode

 drivers/phy/rockchip/phy-rockchip-usbdp.c | 14 ++++++++++++++
 drivers/usb/dwc3/core.c                   |  3 ---
 drivers/usb/dwc3/drd.c                    |  5 +----
 3 files changed, 15 insertions(+), 7 deletions(-)

-- 
2.50.0


