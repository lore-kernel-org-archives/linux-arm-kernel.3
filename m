Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDB9CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mc/bdvdkiAk+yiOt4oL4sGGddhVVosjzwOkJ8zwgM+g=; b=AI7aXidVIqpzy6tGSaT1g7rAy2
	Pig+ByZaox/LSsB4kbTECQJfJZNBDHfi0OgQvqvBGkPvGmMtabNHcpdqIFfqMeiKrut7UiggVwvJL
	oRUnTuCvMOnZtFHc1glP2WUflPRBj2euhIlt2cFD28PoPcQQwk549C9tRTOs67czHa2k72ZizgUt+
	cV+1+8i48+JS2N6MYK8WtNHyCsp0L0t89UxsBePC/gezufyJOB18mojCdSx7/okAO16KNQlaahcJN
	PjV9qeE9A1gkHf4gjMcImNdUPCgPdMJZwBUXvnGMckPTnxsb14f2kWJ+lvb1vbat2SqqSuZUbeJ0g
	DgcZxbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAar-00000000ZUY-1SPO;
	Mon, 28 Sep 2026 12:36:29 +0000
Received: from mail-northeuropeazon11012039.outbound.protection.outlook.com ([52.101.66.39] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAao-00000000ZTy-37MY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 12:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWSOntlIHhLO1Y6ENb1qMxmS7fpDIzGyyJ7zuzNIMHt6rMbuJzyIImJ2JjSEreaFRs4YfUsxaDfIIoazCsxtTu/jrmTCfy/NR487GKe/XNfFPprqIVSRYfVaiWi2aiPT4HgI1KlbMCGOmz3NNWBg6orDIodeBALr+TmEMTddpEUpZXPq4OzPHdDplqwaYOvijhDkkAbw14K/UtTvMcaWqhbnUreHIqX9vuRnZXbGs0KBqKFGhYB5SG5WITC18YZcrGVyhYpBrPHakdUkg/O5MCqeamFNG+JbFtHyieaoCR8uX30NQ9ODv7Xq0ADXd86FQU9T/u+B58oNDCzLe0pSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mc/bdvdkiAk+yiOt4oL4sGGddhVVosjzwOkJ8zwgM+g=;
 b=X2JjO6hX5lIzx1Cq22FWpJ7CIV3xTMof8yMfTTk07KPMAWe+NV02WXemCiAvFx7a8ucLmlzBLUtxvJuLvozDAoXFD2eijNMjTdYlBZ+ac553iaoE3Knep5cL6Ih4EfRwmQtsmtC4bjgBNTc8mwQgY0eOhcOmaMC3yQgtujfs1MbNDCpALCsauiONQhly0FBe/qvIXbqaXugWyGOqk+tlbxDRX/8eKxDkoba74dkFB50AxbZDHpWkFIomzkiYc6SMYiBTcHYUI/3J4G1KvKD3gCoCSycVGvvuBwmMgl0xO+Lt1nEmb2ArJGY4TJKZSpL9ha44aCb1zVeE7h1Dcs/CpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mc/bdvdkiAk+yiOt4oL4sGGddhVVosjzwOkJ8zwgM+g=;
 b=ZLpQCEX0egHX171bZnTkqw7rydB/DsE0YEEBaGGrxWNBSdCWelAhEleVZ9LDFiga5Zmw9c3OzSzyWnL/dc8I0+l8eNQvBIBYCvKY2xqwuzJHiNq1+FLnd16BcdLZDfCmGQzDk0mi5qzYMdGkwdv8ysqKToF5R7+93iwY+B/IwwrEu+X1xp9lLpE7HoYVcaSW5uX8SV7gZoxaSGisowdmUGxnYp0FwoGkpLP4WMvPJ1igbEpt/HtKOKf1YE4V4iHUhd74zNhcq9Tm64zTqefvLWPaaO0cFVr4XFv4jaqUAhKR3oZW6UqCcurq+GaWJkuB1EmU50dGRN6k2s0LI3dplQ==
Received: from AS4P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::11)
 by DU0PR10MB5267.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:36:20 +0000
Received: from AMS1EPF0000009E.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::ae) by AS4P195CA0006.outlook.office365.com
 (2603:10a6:20b:5e2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 12:36:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000009E.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 12:36:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 14:42:12 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 14:36:18 +0200
Message-ID: <8e590e6e-30bd-408e-a570-93a3cc107f27@foss.st.com>
Date: Mon, 28 Sep 2026 14:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] arm64: dts: st: enable camera on stm32mp2x-dk and
 correct stm32mp2x-ev
To: Alain Volmat <alain.volmat@foss.st.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>
References: <20260914-stm32mp2-dk-camera-v1-0-2f2bd719bb63@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260914-stm32mp2-dk-camera-v1-0-2f2bd719bb63@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000009E:EE_|DU0PR10MB5267:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1be176-5973-4ae4-46b9-08df1d5d1924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XmLSGWaEoRSfG8GgGRWDPuX6qLkorC/8AfjMr5JZuBXM5lF9yomAsXsQj6aVSxgDMGngOMsraOHgWVKEL5p15PiVvaXIdXvwxqLYBkbPg8IsgcW2TZTF/Y0A5ZIL2FDelicn00WI4qQMViTRBGg4AF9OU3zED62mLjay5yQe655CXiKuOsjqoT+OQz/9MJxF9NgO7CLckWkjrPhGmykOxeDWqirbQvBKm9rRUb/nI8EXXxgctQBP96OGJgElfXPPVmVbSIOIBFzNwAvbP1SirKEhIEoXftpU/Ns+IJ2pskJesMtkV7m5Pib5ckXcVI0rkiyvpLja4p4fv0S4Ars0Rbv7REvDX/pJDvKc5n0qKx/UveaNGmV1PJvc3F54jxBdihkbt1Xbo8A25kmd/zEZ8H9rkTHq0tsZl+bR7is+jLKindU7ky5ewnG2VgPs02lQNnbJ6C702vyVR1Sh17cloD7w6cvxU+Vfwjq9git9eLc42kdWpwPn0GJ2jsmTIn3Lcg0kXG0B+FLBVwVk4Cd/P08pqMC0BJ7hXnptd6VTg2Ici1dW44+gLCYFY4AGrCB/OfKEUDmzlKP+RQQgKbNVbRSjkVMvdMQPnd0fx/og1nd1T/cCjmTUEBWibgzBo8Me/hZ1Kra3D/dz3LMBn2ofvQTC20epzxcNMroiPmTjnN0smYuh5WI4tGPXpYaT9v1IDXKlQE4pkC0Jid73XuE5ug==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BwXUV7npmiC9oRddofK4Eo3CEG4AECQo8Wq6AsRZEL/lQzPzDVHf8VGKTroplmwsCvY6TquIcs2aaBARW9STPDlWyFIa6LUbRREjDg9282E+UrZt1n+un0LJ3jwpgHhkwKImAKuNPutzxaW7Zjy2cnIKA9ouvkNqCK2fpfJqmk98k7aH84wTUIRJ2karaIutn5KuTnW8yLYz4vtCK1JJHe3ih1jR09eSRii2LNA4V/ozB3/rT5M0TdcwRXw4oWv/UA7RTjcH/ddcBe5J++eWSjDhDr3ZJt8pMxY2xOuw6CPaZ9vSoHEJTQfRPJj8nHQ8XIgWrifp+MrPILxocid9F5Dvxznr36pywtutfOOSUFdwXfcchB+UWSl4KXCN77BLyrthxsNxJRqutqUMUoBrX+RBTGKoRuKkog66c60/XgQOS2DmLu/tYZwz5imeJq9O
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:36:20.0053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1be176-5973-4ae4-46b9-08df1d5d1924
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000009E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_053626_789540_E3AF9E8C 
X-CRM114-Status: GOOD (  10.64  )
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

Hi Alain	

On 9/14/26 08:54, Alain Volmat wrote:
> This series enables the camera pipeline on stm32mp235f-dk and
> stm32mp257f-dk boards via usage of the CSI IMX335 sensor connected
> to the CSI / DCMIPP of the STM32MP2x.
> It also perform 2 corrections to the stm32mp257f-ev1 board to ensure
> that the IMX335 is well enabled.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> Alain Volmat (4):
>        arm64: dts: st: add imx335/csi/dcmipp nodes on stm32mp257f-dk
>        arm64: dts: st: ensure IMX335 is enabled on stm32mp257f-ev1
>        arm64: dts: st: use video-interfaces media bus type in stm32mp257f-ev1
>        arm64: dts: st: add imx335/csi/dcmipp nodes on stm32mp235f-dk
> 
>   arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 75 ++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 74 +++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 45 +++++++-----------
>   3 files changed, 165 insertions(+), 29 deletions(-)
> ---
> base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
> change-id: 20260913-stm32mp2-dk-camera-7ad3ac8d3075
> 
> Best regards,
> --
> Alain Volmat <alain.volmat@foss.st.com>
> 

Applied on stm32-next.

regards
Alex

