Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A77C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 08:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6sHn4p0jl2Ye72vHLwYMBaPu0ECRAp3siZJhH5iNPY=; b=ooa9H8DAIjik3vNXF7fzWRRDaL
	zlRw9SXBswloowOFiaPyNMsjkXG2DS0V17uyw/Mu+Nu9X8Cgsf3pCymdNPCqNLCJ4NUNEBnJV13Zs
	TGAQB4XOHYqkdoXspGeOvjE+JCcsYMIjm0WHQYq7j3oo4zUauyl6PhD7jYX+L3lrzvueAXYf/C5qQ
	PmJTRtP1g0azRJNYPaNaRMsF4kYvnz79Mwauj3eJNW6yzjgwqiIo2J+b4XjGgJASWm0oVis7HyISF
	ZG1Tu/BfRw1wuErKyRWHrt+2f3ddaAhWRbCBylzQxkkByRN/Pcr1Y3ucNXeO1fvm6B75P1OOILedT
	y1uN7BUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKHy-0000000ClcE-1z3D;
	Fri, 21 Aug 2026 08:07:46 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKHv-0000000Clb8-1xG9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 08:07:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qR1UUBM0mHGh/xZsr5GLQr5UBk0kNumDZalrOmYuXYcbM8F0ejlDkOvDkvn3WhBWh86XHYSIWSLVaHlgshdaGUPdukTwEqBmNM+mSmQ7tGfGOtMd1A0y3U8C7hJIuGiB1HI4qkcFTh9znmzRb1pbz5wnbIbxyNTi1bIQEs0YTvN6XzVk1Bu2dnDf0hSnHW6+1FDKMYBPL5g5ObmW2Z31iYBKkBinl3i5PdUrb7HrYUtmu4cRSlsp7c9NG46GDOpuxBk/Jo5UULhGb+mhUquWzI2IQxC8g1wtA9UDMe5ahwecknlkx2cLJ0Db/2PlI/mcieLQR0N7+GOGUhtrbn9MOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6sHn4p0jl2Ye72vHLwYMBaPu0ECRAp3siZJhH5iNPY=;
 b=FEsIPrQmzBA5ZN+vhDDmvDobhhhMFWSPNAuIyRUF3mlRYSqmNhnjnbIlye2lr/rzGvakIrYZuMig41ZdiIcesVhYdrfwWqRaGJNmnsRfMWpVWSdoCBCF7MYkBC11qnp2wVvvkTLzQvnYr+qe+UZ75y6+rZrsgYRWCPFRfKRPGPpylr/8e9jQCpjatpiVV67WuX0HtXZeSm20oydV4nn6AM9vAeIbTrm34GpS4hoql1qJV+/uTxtepCvZckNL0Zmd1IlcKkLk4/qeip4o+z/Yt4znNYecYXV9wVHGtBzeUB5920I4sTDTCbNGbS0jeNdfXlINtdm22FWdqbh/hvcDDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=163.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6sHn4p0jl2Ye72vHLwYMBaPu0ECRAp3siZJhH5iNPY=;
 b=frPvbcPWlYcsTIeA9kWkGMniCxEIr0j3HLaoL47+gKpjTtoNYWpCc5RvwO2KG8iaj9tP5ffH9ymOVlrC7xowxRcTN1pREWmae0ZfKu6VGZ9xDEKVgb549tKlixW3f1aIrhqNF/rWyJ3RDbUSdZThJrRvqGAphPQYuvzVlsC+JzTDEAWzbn9Nqo9ybU6eR4XqUimjhkkzWQkYNVFYf4Npi2jg5qyBaeTIHju2QlVMzzz0ghy2vRjNWtECrMN4PWE7jxQGzz75/WeKv6V8bDRib1wpuLuO35mqZ2PdUNaF2STqBG0vks8xfyxtFp3OnfmMYks801vvpuKCfDRNg/4QNA==
Received: from AS4P191CA0052.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::25)
 by AS8PR10MB7641.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:636::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 08:07:35 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:20b:657:cafe::c) by AS4P191CA0052.outlook.office365.com
 (2603:10a6:20b:657::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 08:07:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 21 Aug 2026 08:07:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 10:12:34 +0200
Received: from [192.168.8.15] (10.48.86.45) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 10:07:34 +0200
Message-ID: <7900f737467ef06076829db3087e4fc6b080e9ef.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3] irqchip/stm32mp-exti: fix the unit of
 the hwspinlock timeout
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Ju Nan <junan76@163.com>, <tglx@kernel.org>
CC: <radu@rendec.net>, <linux-kernel@vger.kernel.org>,
	<mcoquelin.stm32@gmail.com>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
Date: Fri, 21 Aug 2026 10:07:06 +0200
In-Reply-To: <20260821024756.24927-2-junan76@163.com>
References: <87cxvdkhmn.ffs@fw13> <20260821024756.24927-2-junan76@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.45]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|AS8PR10MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db43b38-43c6-4f2a-bd34-08deff5b4228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: EzPAjciLjG5TJ0YS55A5dpMAK+eyG/bwGkRMML7Cj835/qLZ1QEfgtn2P+wCYZNht3hfha5y40/iMS2lQGOwCBgbcxFmUMttTWe0GYKDqBiKnQCNAKb08HGhG8Z757QKcx/NsSCJMP0C3HZOAIC5tzE5nWRXg7yVquJcYLawBzkelVG+22Wvzum6A4wlpob3gDwKPsCaIoViLaZ75hbiabcpQB7HuOEzjLgUHLxT4LBJYNZ5CUfULGLWJaWGwVuPmhwzADXI9orjcmRYuXH64Mrq0Si3trQ3uimTHH2ElFUa7mYVMBBA1K9oPTzY692t8ZXYU+OPvXB79DdaIvOQI6jDt5UDDuyvp1+Irh0fD9LPq/45me2gC739gPnOlGgu3LSmznbDw9KkAyMzXbHDlAeZBKg1iSv95UZlJiGg/cMJbSNCHRCR4g4DwYiIDbYU735dC76Y/Q1P7ESIiFKGQcbs5F8i8bQOBVvXu00Hi1dBd7x5D/J4mFn1m2I65Olm8u34uL1eaw1v1agAYR+3HTm0AV9aW2OnOXqG2m4SOO7daT7dXK5O1bhQqrY6t2rUTAQxg/JcnQdaSTzU3scfN2rigx+NNT+Q7ekAGBXP9huQKSfYyyqlnkfWB1syMwjaeb1GKbct96n2D3gPbCKIzMcS1TAvng+VyW03+vKhPCRhKPR+cFDQ6SJPAo4uV0tKql9euNDktJg0FFXjwus+SA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lnYRASTJ4f4NqkmE+UaWERqVwE04TBjWhtLpuSvtffVhmRUQGCCt5cWGjqUm5sHtH+RJvUgRXFFoDd1S3KDlCajik8XzkZPbbxgyp978Uod/UHQr4UL7bVede3Og28F/m5EjTlIBv6sRE5GiwKLV75lDC1VFKBM9rAbYLrWpviF4xeMgCTTkMkb4NszxvHlXa1+FOm9RqnErlOpFAW5SO28Vy45GW0qpU9lrPA+oAWwpsEl6pAKuNiYDM3Nlx3KpOKornHN9rB2Hi8gLKpVbXl4udHekFTqbr2GlCnMi8zlIGbDNi00+DiGN/h/cL76YwWnYn5oxNxlQgzoRWy0aZoSsEqUteNNmqvuJ3tg1VGzy44QStz/FVWfSFJZHmTxRmEDs3SxKgnvbK7e2eRt+ymqHyNXaEenQEzvYDgeIp3zTSPYTaRePUnqQLXekxL2Q
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:07:34.9095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db43b38-43c6-4f2a-bd34-08deff5b4228
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7641
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_010743_733755_F60A498A 
X-CRM114-Status: GOOD (  18.29  )
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

On Fri, 2026-08-21 at 10:47 +0800, Ju Nan wrote:
> HWSPNLCK_TIMEOUT is passed to hwspin_lock_timeout_in_atomic(), whose
> timeout argument is in milliseconds, not microseconds:
>=20
> =C2=A0 atomic_delay +=3D HWSPINLOCK_RETRY_DELAY_US;
> =C2=A0 if (atomic_delay > to * 1000)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ETIMEDOUT;
>=20
> So stm32mp_exti_set_type() asks for a 1 second timeout where the comment
> next to the macro says it wants 1 millisecond. The semaphore is polled
> with udelay() from a section that holds chip_data->rlock, a
> raw_spinlock_t, so preemption stays disabled for the whole wait on every
> configuration, PREEMPT_RT included.
>=20
> The hwspinlock core documents this explicitly:
>=20
> =C2=A0 If the mode is HWLOCK_IN_ATOMIC (called from an atomic context) th=
e
> =C2=A0 timeout is handled with busy-waiting delays, hence shall not excee=
d
> =C2=A0 few msecs.
>=20
> Fixes: 5257169ade8c ("irqchip/stm32-exti: Use the hwspin_lock_timeout_in_=
atomic() API")
> Reviewed-by: Radu Rendec <radu@rendec.net>
> Signed-off-by: Ju Nan <junan76@163.com>
> ---
> changelog:
>=20
> v3: redefine the timeout macro with time unit on it
> v2: add "Fixes" tag suggested by Radu Rendec
> v1: https://lore.kernel.org/all/20260805032139.35420-2-junan76@163.com/
> ---
> =C2=A0drivers/irqchip/irq-stm32mp-exti.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm=
32mp-exti.c
> index a24f4f1a4..ce4e03ee1 100644
> --- a/drivers/irqchip/irq-stm32mp-exti.c
> +++ b/drivers/irqchip/irq-stm32mp-exti.c
> @@ -23,7 +23,7 @@
> =C2=A0
> =C2=A0#define IRQS_PER_BANK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A032
> =C2=A0
> -#define HWSPNLCK_TIMEOUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01000 /* usec */
> +#define HWSPNLCK_TIMEOUT_MS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A01
> =C2=A0
> =C2=A0#define EXTI_EnCIDCFGR(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x180 + (n) * 4)
> =C2=A0#define EXTI_HWCFGR1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x3f0
> @@ -377,7 +377,7 @@ static int stm32mp_exti_set_type(struct irq_data *d, =
unsigned int type)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0raw_spin_lock(&chip_data-=
>rlock);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (hwlock) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0err =3D hwspin_lock_timeout_in_atomic(hwlock, HWSPNLCK_TI=
MEOUT);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0err =3D hwspin_lock_timeout_in_atomic(hwlock, HWSPNLCK_TI=
MEOUT_MS);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_=
err("%s can't get hwspinlock (%d)\n", __func__, err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0got=
o unlock;

Thanks!

Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>


