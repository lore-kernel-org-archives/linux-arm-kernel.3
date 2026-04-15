Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216A2F43854
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eN4XIUjg8n2ESoaZHoB2k4PqWOqJq2nuszZfTGXaWPM=; b=4orR/RiiDz1k5FtX2P3loFQgNh
	5NRoeY7UtZdimzEjmH24enZEGskAUO+mlXRUcMhMM0sHZiCKeqIgrzJ6ll+YJS/t+xk4qk2OE8CXm
	jcGsGAQE1lypTT3ifxzZVvTFXVHlhsJJoV9c5husFX4yrcN5i9iOeJAY52rLmUJIIn58sJt9bDWsC
	k+3dJ2fXq5Fs5gBVRxmz+7RtucQYTdzfee0JJTpEs8aJmMbQhlIWEHKwxSMuNOlcZ1x2tCNCb6zTf
	LhRUV4j3vbK/nNg6B2KX5wKBnCnRhs5Y2wKnCoXD6+F1nKIGoH2ZZDZmh0KdCCMMASOJQ+fBBZr4i
	DM25YMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3be-00000001QoR-4AeP;
	Wed, 15 Apr 2026 17:00:50 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3bb-00000001Qmg-3Nml
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 17:00:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAUGthGjNIpaoPTnrre298vhyCv7NrzPXHRUJ05CjgvyTp3Wq7Scn0+/VZ+66k2kHuRkbgHWVOBizTWvY4btqrUmykggWHf6hWFgew59K0ycrTuY9mS62EpFdHK/v/VAjODIOPX8/oV655kT7I/2frQ1QCuoTwEWghTCYveK7YCfmkkqbLEa1AXmRhNXC3OrbrbUDnBWows55QHr9Ny90NORSjn28Mmt1uab6kNFOd1mJ5CVHq9kM+CtKLCM4SA62YC4kFE/8q4/EB1HdLndjiwJrNYngtYff/MdvIkrM5gqLVy3IBESComnh2uys3ren5GF9/8ShlNwBKUy63N8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eN4XIUjg8n2ESoaZHoB2k4PqWOqJq2nuszZfTGXaWPM=;
 b=C7Y9UKfKPVD+y5mxZXh4zHxNc1VvkQpeaJLX6UVrFro4nmrA840vKQPPpxAN8det5qRqDkj+4c1f87vstsgzaNlpL92plf8xXwE5Dp86Xo7ORRrkqAb7coHZChgIM5xT6GaLRSKz+kM+v6GV0IYp7o0bK8L5XD04Nhw6CAzD2uzP//9ZfFYRN82v73WE0t3yYMLqtpw75vbOMie8iIvYXMqSKygbQozBNAOgBs/ladogKL5GrdUdTxjyS9/+iKyqz1GIc6XVgb67P7MFNxXuXvLnDtICmAPUMupYLbSaq90o6o9yw4u/lKHrwp468Z04k11HQPjfXImK/W4xna5mZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eN4XIUjg8n2ESoaZHoB2k4PqWOqJq2nuszZfTGXaWPM=;
 b=lKL67vIABe+v2r3qo/pC7aal2am+a1VQINClSHz1BOO4II/p2KqByNUtVCavJ88p0gze7gLhY2t+LT8Dmymigi1UqpNOHFJJVzSloq17poUPd/TZLhMo3AGQEms4uGM0MkXRrpKduxIMOFhx1ey7tYJsjreQ7j5raAzV459+6jXNxwBJeVIiI7R2h3gUYvkY3vcRr+5I+6l4CLmd5aesV7888xOxYmaujqJdlgDXHeAGe8ndPmWGBevf5jKj77cd7Un1Rtwm9C5yuRfcZQPRYPA63pdZs+IS4mCEm0wZ2rz4v/DSyaQAZpKkP01qnNpCMyw6N9j7/sPeEP6I/tJG1A==
Received: from DU7P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::30)
 by DU0PR10MB5534.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:31c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 17:00:39 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::7f) by DU7P195CA0025.outlook.office365.com
 (2603:10a6:10:54d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 17:00:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 15 Apr 2026 17:00:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 15 Apr
 2026 19:03:28 +0200
Received: from [10.252.19.45] (10.252.19.45) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 15 Apr
 2026 19:00:38 +0200
Message-ID: <a72c3f66-1768-4852-9b41-cb8d9653f081@foss.st.com>
Date: Wed, 15 Apr 2026 19:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: Fix SAI addresses on stm32mp251
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260411130300.19603-1-marex@nabladev.com>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20260411130300.19603-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.19.45]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|DU0PR10MB5534:EE_
X-MS-Office365-Filtering-Correlation-Id: 424589a3-e6d8-4c82-0703-08de9b1085a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 67a0zw+FVZdR5h45sDyZv4NN7Zs5Nod0xtesPxuGL6GUjFBQAqT1vIl1yeuUnIDdwmIaCapMxLww+oIc1IOsYeqFaLy1fZUUVVC+C6SQ8z2zmBhptrfnCA3AUUpXm0aABMwMHgfQJL3vrGXfKmpvQjcNYEI9vJt1kddsb1zNdQ9uvl+QbrmdiEKdYKdBdYg5Cpq2IwaUO+4s+bboHFnTCbj3JAKQB12csUFQtEBLZIgo4EXisQnjjPljxEzeKGrLb/ouDHh1vfIfV2fgE7LJt8Rqhm0FOYNt+GMlp839RusQk7HCtfRZgtvptt7z8QxFoyFzWh1MrBxO0Km6wqbfN+247FYzn0L7y6PxpZr5P3cJf4aNndKW9d5z7xFA1A5jeA/Dn/jXeLYC529KKnkUY9UpyOF5N7a1YC2CYEztB/a+eM8F7bGj7scQ5dThFgmxdKGnJa3X55E2iVgZGrvMnQMxPcnKTRi9FAqhIKJ+ZrzLkG2cBDEm/xD10OOanAHbDXICmejOw3P9Rq+tcEj2lSQPVNysa3x7xFP24VUw0fTJpkocIsms1lk4dhk/4HzQ4EuzTZnlQidQGWJWmKRRRtnhn44cuhcE7w1kNCla9zJ4aqnXxPz7DiMulS5jdl+11ClTRsmax3/MkAwIbiNcXJrHRQqgtQQXUUfl6WQnS6xOK5elCsVX+QpLw2JtaUOrPxp6Te3e02Uq0zwSJXIcLI2yab5Wrkekwd78n2VeWE4W6J2TMBxLlbk409I5G1xcQ82apeNnsHQs7r0efckoXQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2qU+IZJAHS/5BJPO/KL76IfdjTG3bK5VK5C80mpmNHHliGJfOhhQLtv5RLaCfdD9a0RIr78fTN/c2gWQfMKeNhEa8aCx9WIsn6su30FuhUpE1hsYaExnHj0dTn52B6+QdXPFuAMouJCs/P/Evs535V6OH+JvoRIXPzcxZfQw+NhG0qDeDydDWGmEr8jKTAnqPfiRbAXCYlaj3+PTMcLrxtt24GiLXaM7uxgmks+z/EbQvbUUqrjNKBk9bzUYWw8OlTSDkjEj6JWAE6lltzIkNGGbduxbo6LnLy0GbtT+raIWq8WN9Tu0ejJawEuiFjZunhMN/posjoLRFKOFXsuHRw+pHRYKR3WKqSX2bv3Ih9uaN5z/kMjgAk4M3TLovhr0Wso6ZGJu1JTQ5lBFfVGGQmC1BBAxu89J6s3NGKiGSRk0yIW9t7A1ZJ2rlGJhgW2j
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 17:00:39.5779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 424589a3-e6d8-4c82-0703-08de9b1085a1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5534
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_100048_331008_F0E38180 
X-CRM114-Status: GOOD (  13.99  )
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

Hi Marek,

On 4/11/26 15:02, Marek Vasut wrote:
> The second field of SAI register addresses should be within 0x3f0 bytes
> from the start of the SAI register addresses, the second field describes
> the ID registers which are at that addrses. Currently, the second field
> does not match RM, fix it.
> 
> Fixes: bf26d75a95f1 ("arm64: dts: st: add sai support on stm32mp251")
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 673fbc5632e69..9c63fdb5a885a 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1202,7 +1202,7 @@ spi5: spi@40280000 {
>   
>   			sai1: sai@40290000 {
>   				compatible = "st,stm32mp25-sai";
> -				reg = <0x40290000 0x4>, <0x4029a3f0 0x10>;
> +				reg = <0x40290000 0x4>, <0x402903f0 0x10>;
>   				ranges = <0 0x40290000 0x400>;
>   				#address-cells = <1>;
>   				#size-cells = <1>;
> @@ -1236,7 +1236,7 @@ sai1b: audio-controller@40290024 {
>   
>   			sai2: sai@402a0000 {
>   				compatible = "st,stm32mp25-sai";
> -				reg = <0x402a0000 0x4>, <0x402aa3f0 0x10>;
> +				reg = <0x402a0000 0x4>, <0x402a03f0 0x10>;
>   				ranges = <0 0x402a0000 0x400>;
>   				#address-cells = <1>;
>   				#size-cells = <1>;
> @@ -1270,7 +1270,7 @@ sai2b: audio-controller@402a0024 {
>   
>   			sai3: sai@402b0000 {
>   				compatible = "st,stm32mp25-sai";
> -				reg = <0x402b0000 0x4>, <0x402ba3f0 0x10>;
> +				reg = <0x402b0000 0x4>, <0x402b03f0 0x10>;
>   				ranges = <0 0x402b0000 0x400>;
>   				#address-cells = <1>;
>   				#size-cells = <1>;
> @@ -1362,7 +1362,7 @@ usart1: serial@40330000 {
>   
>   			sai4: sai@40340000 {
>   				compatible = "st,stm32mp25-sai";
> -				reg = <0x40340000 0x4>, <0x4034a3f0 0x10>;
> +				reg = <0x40340000 0x4>, <0x403403f0 0x10>;
>   				ranges = <0 0x40340000 0x400>;
>   				#address-cells = <1>;
>   				#size-cells = <1>;

Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

Thanks for your patch
BRs
Olivier

