Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EA2CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ez+IQ86OcIW2xpYUL4Dj6e6u/7jBDRTC6sFWB4D53Bc=; b=JlbCMCOpxnOjSj6uQtfvFztmlE
	KmWCZ3gBcI+HWsQuifRHhNBHa9YEUpBFQoVSGb4hRMyb13SN43fKpx7p5CbTZWg8NX9bQvPgm++mv
	jVUG/Vld8Y7HRRlt5jqIpQ/yhXwKeAnpbw4kGB36fDreo0Ugir8a3pyB+nGT0N7FND/XA4+D1/9Im
	BcCfYhRr/TZvl/PzzZf70xIveKmLX3iwnIM086SmQc9SBzISbF8yXkA43MFVYTuqbyf/vJjLAfbEU
	QuBKk/Zub5Rn5lzGUCVoDErdwxWosfD+mU0UctAuHP2EzYI3yGpVR2/2+j7vIForUvIacJ+RD97JJ
	+Gy4Y9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlI4-0000000Gqzf-1Ct7;
	Wed, 17 Jun 2026 08:06:28 +0000
Received: from mail-westeuropeazon11011031.outbound.protection.outlook.com ([52.101.70.31] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlI1-0000000GqzD-1cdN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 08:06:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuMDq+SbTRLd2DjrToziBBSN778gg+wDBnPuSdakfACrMo8GwGzhbOyN16tBfLsdClfYzar2alarUfaFBmgZkrNMDAXCruSwWqqehzZrUwTqae1mAsT376IeKFBV5uN/VDsTL+nCaKlY8/KqRlQg0W8fi016qQi7F6JNrGnJnt3usXDlr+s5ubxdhkr1odjUzrbJAsIh2Vk0lt/LfKD5IcE2tgGCUoY/X+qg1XSTL3yasacbrP5VHY4oLelpiNSULl5zXX9RlD8R6saukVgi1E1srf4Z0Lu9HYd+qJEoyJQONpNBoa4M1JISuHnYDdMgnCEnFCzHY+YUOHVpoelquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWpyxkooGfjkm64EDyY4M87bFOa4rFFwwf75sc19/dM=;
 b=HaVM3SAEHg8J4eRi9jUz3jCSn4ylvvLYf5/OoBR+ZjPnBYNZQxMia0k+GKL6emgh+WsJ5IEg3Qiqcg9o/fcEoAU/meDAGpah5/DtW6lh0D/VOeBA5JTYGijTlT0KiL5vzDU3niDBBbs913cjaGEiVoKRVNKBdAwKWpQrY1W4+rBpKCRJo2FsfJFG2ctK9pYvmNEQf7ed0+IVp9up/WBMcHmkkQAtB4ariaLcM1juuh34gExv6CjN45DSO5sVVoM1Wwunbo6cCFiGKcs+vi1QjU3RbTOghsPFOdr5Jk7Ej3ypARklt6Ec+Im2GrqaxU8KSgf3goeB7yGLz0ckpW7k/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWpyxkooGfjkm64EDyY4M87bFOa4rFFwwf75sc19/dM=;
 b=nbw3FVUdqUGudQMITTsH3RyJ1UHu5xAOUFqTwhg9tk8Xen00F8O43QcVduscLpER4KjXd3+qq0m56mqlsdneLE0gbq2R8OHd3DSVEh4nkVCmI4Fhqm3ogHu0Q6vq8v/A17CMEeB88VxKR5V9RiqdTdFUsyv4pPibtFnuhCo4I97ZOQyMi/g+lsJQPJB18VNdoUy3pC1xZLlahs6yrbyXQci6xQRZbWzKn/CVyEthgoyH68O7IczQxrBZGFoIKcuN7zHJUhBcAzR7Q+0TRXAaW1A9YcMfLgjtQlIMfvUB0oypoIy5QpKB5PwYuMrc/jdO/wAHaEgLXowSx1y+SW2dGg==
Received: from DB9PR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::22) by AS8PR10MB5998.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:52a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 08:06:18 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::2d) by DB9PR01CA0017.outlook.office365.com
 (2603:10a6:10:1d8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 08:06:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 08:06:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 17 Jun
 2026 10:10:35 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 17 Jun
 2026 10:06:17 +0200
Date: Wed, 17 Jun 2026 10:06:10 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Guillermo =?iso-8859-1?Q?Rodr=EDguez?= <guille.rodriguez@gmail.com>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Andi Shyti
	<andi.shyti@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, M'boumba Cedric Madianga
	<cedric.madianga@gmail.com>, Wolfram Sang <wsa@kernel.org>, "Pierre-Yves
 MORDRET" <pierre-yves.mordret@st.com>, <linux-i2c@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: stm32f7: truncate clock period instead of rounding
 it
Message-ID: <ajJVct1fcVrUSuLE@gnbcxd0016.gnb.st.com>
References: <20260611104857.242153-1-guille.rodriguez@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260611104857.242153-1-guille.rodriguez@gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|AS8PR10MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: a9dbe4f2-4dc1-4c6a-9925-08decc474f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: luVVWUFWfkHPUOu7bRzbfLYzM7XiPwEEx4tGxdsxS0vGZrRFPKeKupW/lgWrT40XlRlhVPkphd5jzSXyNzgI2bcgHu3mjoPNqBRQ5VX+aXJ++VDGI0dE1ZhfjWmCZSs05YE17cv+l2liD3bxNi6+g1Q9Mg+yWy7eflUsdq5hu9nTUgGdYqJD9JGw28TF+inAU6+vqaR2+AmZFgFDgxw3wZPdPcO14+ceLSRtmtZQZ6ZlioxCZoynPX60IuLoE38rRfum0p/s4HeVX9v1fJ/EMULb6nwQ+ZfIgRXnuoTtZyYZdFHUjgszg0Ffc4OayndkzMcGmzwOggYrsZYpzCF8LrG/CBX/EJ2gUhATAHN0Fy1PQCZOj2omvZT+YhL2dYeJ5gVof1Zhyv94XPBDmd7DN5jAEs4uN2QvkhBgmdQaFAPperb/VewTyqVUar2ocTJE5W5Zeo9q0IK1Ys3LFZjrfZ6BTtF0n1ylUC01sMW4enWRp3arVZDzxCGFx32fLQxIowGhpLL6kkIS3vVTKG3S1zCgdklkzCLJmNNP5I1Ba646L6uz8h0DiH9Ta19tDnPfruTbd29odVDovVoUJ33qmg2Ci4BE3lVCn36vA70ARPs++Fo/kASeUuVHW4Y4W0duV+jiTFPi7ZNk8FPM3C/RYUrT8hwe6x3z0MuOcw+DPR/OWoPPkt/Y0W7pqfm6djy70LCwUkJfOm56g+WDNvYSEniszCshf5AtAV5HybdyUHo=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WwQ1a9SIjrzzREkJm+QZk5DKtpqpmzaCV7ePGh3qeOexjcLYhJ6sTIc6iZfRs7zhCRAA6D0B6V/iizX8DH0nzghasnvE23UlmW1HDq3S7CzipbrBHf46NCdu6g4WLtcm5i4jcRvIGiyX+Hfd29jR/30y8uQzIZ2smZC4aVrdeX8bxlacC81NmlnU6gmnUgAxDKM4hGK54LsmRwh6lKfim3SQ2CVwJJCMaLaCn3QfLLWKG09LPGWfYnGr3dzZazCyuTwbZIlblteU4cA036zS3Ng3pbsfjvWpV73ihN9iIf6R33uo6gIkejS8bz1dBlySdkV2Nt27x7RmL5ReRLfDU/PyU7WySE0whrbJ6VZreAeF6yt7bl+ixTnUkh1x/FJFmEfEWH8eCetfezkwmJ704gykKQylEq+/wzMRtDqRtBDZ/6FUlr6pNupXbRbfnAb7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 08:06:18.0223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9dbe4f2-4dc1-4c6a-9925-08decc474f7a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_010625_438728_3364733F 
X-CRM114-Status: GOOD (  22.24  )
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

Hi Guillermo,

make sense indeed. Thanks a lot for this patch.

On Thu, Jun 11, 2026 at 12:48:56PM +0200, Guillermo Rodríguez wrote:
> stm32f7_i2c_compute_timing() derives the I2C clock source period
> (i2cclk) with DIV_ROUND_CLOSEST, which may round it up. When the
> period is overestimated, all timings computed from it (SCLDEL,
> SDADEL, SCLL, SCLH) come out shorter on the wire than calculated,
> and the resulting bus rate can exceed the requested speed, violating
> the I2C specification minimums for tLOW and tHIGH.
> 
> For example, with a 104.45 MHz clock source (e.g. PCLK1, the
> reset-default I2C clock source on STM32MP1), i2cclk is rounded from
> 9.574 ns up to 10 ns. Requesting a 400 kHz fast mode bus with
> 72/27 ns rise/fall times and no analog/digital filters then produces
> an actual bus rate of 415.6 kHz with tLOW = 1254 ns, violating both
> the 400 kHz maximum rate and the 1300 ns tLOW minimum of the
> specification.
> 
> Truncate the period instead, so that it can only be underestimated.
> The error then falls on the safe side: the programmed timings come
> out slightly longer than computed and the bus runs marginally below
> the target rate (375.3 kHz in the example above) while meeting the
> specification.
> 
> i2cbus is left rounded-to-closest: it is only used as the target of
> the clk_error comparison and is never multiplied into the programmed
> timings, so nearest rounding remains accurate there.
> 
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guillermo Rodríguez <guille.rodriguez@gmail.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 53d9df70ebe4..6439620d6bed 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -464,8 +464,13 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  {
>  	struct stm32f7_i2c_spec *specs;
>  	u32 p_prev = STM32F7_PRESC_MAX;
> -	u32 i2cclk = DIV_ROUND_CLOSEST(NSEC_PER_SEC,
> -				       setup->clock_src);
> +	/*
> +	 * Truncate instead of rounding to closest: if the clock period is
> +	 * overestimated, the computed SCL timings will come out shorter on
> +	 * the wire, which can push the bus above the target rate and below
> +	 * the spec's tLOW/tHIGH minimums.
> +	 */
> +	u32 i2cclk = NSEC_PER_SEC / setup->clock_src;
>  	u32 i2cbus = DIV_ROUND_CLOSEST(NSEC_PER_SEC,
>  				       setup->speed_freq);
>  	u32 clk_error_prev = i2cbus;
> -- 
> 2.25.1
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

