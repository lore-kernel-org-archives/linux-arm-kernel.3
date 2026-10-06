Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8222ACA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXZcbfQ5R2pnW1rQGIme4m8Q+eJ1+fI6owtjAZk1BXE=; b=rRFrEeZzgNe7YLQoivJbayUASi
	8CO6wzmirUwS+6P+lMmhM2fburC0Tt/+FkyrHv4QowjOtzizlkmNw7HHCrlQygs9hC8ktKSKsnyrT
	CQMHBYnkFnF22ImBczvuIkPlclwcmMhMnVZTuIcHkP380JySf2mjrW+Bh4RNvqsNxzLQGYt3yNoeY
	k5CrA6/JAv8Vg5w4xnTtn81N8KYD0jg4+WS5RrKVziQ24b+MbS1K63dRv63pK8ENcC/ZO1TWIBvF7
	DVsUhHrrQHxx/YZUXOR/hgKJN/wwFMZl31n/Qfw179dmaHO/qoM3qBqh8GJs6ggB2d5fMCx22ZRTS
	63e+gQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4Vi-00000000me8-2qBn;
	Tue, 06 Oct 2026 12:43:10 +0000
Received: from mail-northeuropeazon11011037.outbound.protection.outlook.com ([52.101.65.37] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4Ve-00000000mcC-10f2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 12:43:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fM3itzYz2AZWQkP3DbjX8YGHnTHoPnKI+02sXETRLCmFlX1A8+66TgNS9/eapoApzJglUfFfNwzN0ROSWPKpmtcgs7GjB//jJma+Dy6wyHPImE9fqgicAvP3s8KyGQ50COJ4qyhDt+gX2CQ4XvFxJ1mIy8S2H7nW6g1PdMd0bImNGWm9KOEdAXtQ1gRArI9OhV0hlu3kLaPncqOu6O34XiGWYH2AEn/N+mV38BzKthjqz/RYz2FykCAri3QHiTz6on5nji42EIt/d8bvsdUCQEnXa/rWXAIyYQjbDYtIYLNBtnzYCDv/Awns1SBY8qjhOSNcZ3lWzUmTLRq7IFfUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXZcbfQ5R2pnW1rQGIme4m8Q+eJ1+fI6owtjAZk1BXE=;
 b=alGokxrVMqohW9uG+EHuQOPkzrf8b5AguDLRI50xwpVMLSvi0VJNXZWziwVBgAMd1O7bhPb+QgnYdqS0GQDmo8Jf+Ck0qIsHi4cAwrLwr+Qwvxg88HZOPrPifDhDJDYLRTgZhLtQ3XkfJGDfMUyUWRRokGM63uncQ0XHtsQ4EuEa8MEBvjCFxfLQYD9v4OyEufP8p4djh0/03iUNrY9mlCKxzzDNLRSgpfabzlv9S5inwBfIJ97WmzHxaAqtZab9R0Q5xD2DZ1nFdufj3XDO03wHClcRQjnGGeZHU+DIRxKB/gY/cjYYRtBZ3cx9y1xXSJhDbkY0lmW1+IcHwQpcWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=chromium.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXZcbfQ5R2pnW1rQGIme4m8Q+eJ1+fI6owtjAZk1BXE=;
 b=ofH0KvjJp6pvf7JpNQO5Q4t78qNpiAd/g9ggutW06AnQATK9gAMi3Z8tn/eEqRvb45SWEtMeCTNSwYY5Qm0lX7pbmQXuoQr+7Fg0EKFHX6Drei7Z2sKXDZw9cfVKYjBMwbeAA1J9yIqTXscpRHPvLEE9HgPDX5/9vDKNea5PgtkYFf84oKg3dPxzcei8Ma72JiYxV1KjWrEq9hV71Hcmh0g6E86/UsgYuAZ0u19+BabYGReTg7yeapJOrWDmmiWXw+Pq/xchSXz4B5fetDYNhbIOHl1FTHQQjkLF7gFuXgi8mrtsJ+womxg4PWJSFFicH9OZ3qUBhLoZ+EpiBzmBvw==
Received: from PR3P189CA0086.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::31)
 by GV4PR10MB002783.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:404::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 12:42:59 +0000
Received: from ZR1PEPF0000E6BC.eurprd07.prod.outlook.com
 (2603:10a6:102:b4:cafe::42) by PR3P189CA0086.outlook.office365.com
 (2603:10a6:102:b4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 12:42:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6BC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 12:42:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 6 Oct
 2026 14:48:58 +0200
Received: from [10.252.27.219] (10.252.27.219) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 6 Oct
 2026 14:42:52 +0200
Message-ID: <39d56818-922f-488e-842d-19a194654921@foss.st.com>
Date: Tue, 6 Oct 2026 14:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] iio: adc: stm32-adc: Drop runtime_idle()
To: Brian Norris <briannorris@chromium.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>
CC: <linux-pm@vger.kernel.org>, <linux-iio@vger.kernel.org>, Andy Shevchenko
	<andy@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, Jonathan Cameron
	<jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <linux-kernel@vger.kernel.org>, Fabrice Gasnier
	<fabrice.gasnier@st.com>, <linux-arm-kernel@lists.infradead.org>
References: <20261002230714.507921-1-briannorris@chromium.org>
 <20261002160309.5.Ica1e32ae51d7975844386684d2b6a097f3ca9122@changeid>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20261002160309.5.Ica1e32ae51d7975844386684d2b6a097f3ca9122@changeid>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.27.219]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6BC:EE_|GV4PR10MB002783:EE_
X-MS-Office365-Filtering-Correlation-Id: 14bae2b7-1ba4-44af-ae8e-08df23a75a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|7416014|1800799024|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: h6E94C+Qe3Gmv2c1AZ6cdIRzcOoa57aXSF5xEw6JHM06tYsni0TpIZNjnQeuwOg9JxwwJ2k/Gl0w0tzwc9JPB4Yg0xAlTD4I3Y5L3uDaqCuu3WSsnF+OQ7ZlA5qpw3YdOviC9sBd4g3qonMuUoVtQgByKy/oNh3ziq88iptVvkHnT2Q9uyqzBtk+cpzYTa09WGOdP0tREbTMHNDWmBE/Gc4lCoX3ck5HpT41cnlXwkrOTEYkZ+O8mzDygOpyjxfka0UM//viT/ORrOng0RXcFG8OR3bayWEBbTbv6NtpvqFPM3CCJCnuHw31VjOPxiUb76xTaF0tf7MtV9NxLS7l0BCxlHap3U4nGRJ2tmUIojmhkCbOMKl97wb1lXdkqRrqqMtcTvSm4qMtNlSayWMcqd1gK9JRibWEcltY+ORwKBiG6KaRf7CwsGBzRZerfH5A//PByEoY1YzcUY2Mzf2KdmICuQetrtda2p3XbKgAH9xTXGP5TqFXnNtUmd40Ydy2KnEbm+Y4ITJ72PoaACEBykwPkO7Ro6i0aABVBQb7PSFjG4GTMdoxyIdEVqqgeLKDOnWkfkMeUO/TVswWf0fvq5Dsrm+e7niiZjYxBIv4aZCcpQXdQ1N8PJPfXIo1orTgIcOEwkbo1YJXJkrlJ2mdLWBd19bXP9a9+OYwo/tea8exhPDVdtXxtaYJ6EwzRuzr3Vq/A6RWZwIPa/YbC5av0A==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(7416014)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FWLOLvhxvEutvQBvRi2QcPrejuqfkQOZEVv4sONd1dFqN3js++QcL75Mj+s0y6GRduTMeDgLQKZw0EpQ1rSQkMfjuxv8Wq6xatU9b4P5IcQ7jMtopOp/RSg2RBbmKLDbiduoWDkgALARpYXS9rIKRYL1Y7yK74R2kq0fYUbL+CrTxts8kJ65HozyiZx7s8Bx6Eu0HPfp9jwzmG51bWadsGYLbKs2175b0dtKYPKG2xbAOuevNPs/JA9EjC1dLlhVPrHrT87PZjxmazWVk2jThK0EEoeGSiK0mTXLF8Dfl+O8cAK495A5ayM1t/OskpSXbhSMQFG229MYiR6YPOKmQdjYZOx8rflZNsQxtLzmZJsmWaZB+x6IVUdWinMNTtNw3xoUIneUu4jIdTLZzk1ugj1/QqJfufcjqTajmZwx8ONkXozLcMijuFZCLnJztMQz
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:42:59.0257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14bae2b7-1ba4-44af-ae8e-08df23a75a46
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6BC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR10MB002783
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_054306_513944_DD300B80 
X-CRM114-Status: GOOD (  16.87  )
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

On 10/3/26 01:03, Brian Norris wrote:
> This runtime_idle() implementation was added in commit c537d3457542 ("iio:
> adc: stm32-adc: fix runtime autosuspend delay when slow polling"), to work
> around a suboptimal behavior in the runtime PM core. It should no longer
> be necessary as of "PM: runtime: Propagate last_busy from dependent to
> dependency".
> 
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> I do not have these devices to test. I have tested other drivers, and I've
> verified this behavior in unit tests as well.

Hi Brian,

I've been able to reproduce on stm32 earlier behavior by applying this patch only.
With the full series, so far, everything seems fine from my point of view.

I haven't deeply inspected all the series, at least for the stm32-adc driver, you can add my:

Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Best Regards,
Fabrice

> 
>  drivers/iio/adc/stm32-adc-core.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index a42d82d61cb8..e9e113a46ccf 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -836,17 +836,10 @@ static int stm32_adc_core_runtime_resume(struct device *dev)
>  	return stm32_adc_core_hw_start(dev);
>  }
>  
> -static int stm32_adc_core_runtime_idle(struct device *dev)
> -{
> -	pm_runtime_mark_last_busy(dev);
> -
> -	return 0;
> -}
> -
>  static DEFINE_RUNTIME_DEV_PM_OPS(stm32_adc_core_pm_ops,
>  				stm32_adc_core_runtime_suspend,
>  				stm32_adc_core_runtime_resume,
> -				stm32_adc_core_runtime_idle);
> +				NULL);
>  
>  static const struct stm32_adc_priv_cfg stm32f4_adc_priv_cfg = {
>  	.regs = &stm32f4_adc_common_regs,


