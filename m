Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960F11093188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/U3TV99qKOsT1waJyMq+2+PdBlVfz6ApVFATfxbkDE=; b=WZ/tQHngFUEQn/jRGV0Q6BxLMH
	F6K5Ro9UqsbKTtDSF9E1WoCJiT1QiJoaCb9H73C88qZdDa3maJ6oSbAMvhh3ZdhfurqKo7sgMWL+w
	Mfc75sCLJmVNJNLS1HZytRe125F+BmzCRD/j9ac/g6uD1GrptHi52Ge/wpgiiLKPE8rxbkMy1Ib9Z
	6h5HHywGNC9SMjGgjPhmVKnRQCApRAKk/EWbwmd/4q+fOwUX7V9rBIgf3ayzxsb6tjLWpjT5gmXxc
	wsFJ9cLcPESkrqNE7a0brSQN5O1L8+3AkXp1WQaml/9WUnMHfFyM3TUzte9INknNNe03A37p0igWm
	AbynOdfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3V2L-0000000CK9M-0gKd;
	Fri, 20 Mar 2026 08:16:53 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3V2I-0000000CK6H-0KRA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmZ4+jkvbYUUpg7+Fw0nUj1hc4+JCTQJZJqwjZLG1U8gBw2GhKHUcS51Nq2FZyVdsAKmBPb6RcL3lBrl2USwIz6gV5sqwVNRfD0eOEw3GiKNK5z8iYwgqAqbkVW3lwr9JSE6YQf9Nql8s89fqJdztNIb7j9jWSCykd5OBVn2b2f0UFMiJ+q0g1eQVo10LZ/Xs4MLkj6xGsoVPDIe9rePFly4sYR+X63/4d1Y4SVAEG0KnSmVFaUc6hA63mE2oJR4CsdLg1mS6JgqJtskRALyAFO6JB3ExlYltna23cpPiTpQVqjNv2/ILNns2gNIuidyt71MfN+8E7eaXTGTHbjs8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/U3TV99qKOsT1waJyMq+2+PdBlVfz6ApVFATfxbkDE=;
 b=Mf8epyq9CRBH7sSxxKy9UlTeMDoO5fCwp7mNGj3vgVgcJf+iE0KmzhyvKBJW/pQ1RiB0sWjJLMHPwVZmT6XSc+hPrQxnTUw85ZCZBgATjWrEDF+ZgUN+qonNFst2/LaC3zwPmgDts0UFXxI0CPAgqeXswqK/pYF35sOAjUuGYLgjxeneEC0uLQOMWLaH9LDv/E2I5gWgMoDedBmLx+Dso4I+xABlNBqA8jfveD0KsjdypcLP4cyZAJPbsu94ynzhLjJrisBuxyolLDfAVMse2uiyrrv1wKbCXEjWSFyDo0xuXdwpKuECNCWOIMUVNmV+zSJUbB54aOzGwbHUhtk93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/U3TV99qKOsT1waJyMq+2+PdBlVfz6ApVFATfxbkDE=;
 b=LEzoNpkct0XWxIFQJQA27FenBOF/msK2U45kptq8yDTTn+uWqSSImWlUajeKaDEcMwKC73mm6P/DVf/9F77HzQBWfR6qSzMhUFGaD+WDn+reg3Y8lsBdxsNTIypAtnqq/8zPdxYqDzF80AC9PfcheyNSSXChVXDngwFLGRi1hO2FN+Esul6ULNshCKcHadT4NNWvCeFU4fQJ8p1T2fJuFPEcSE/YveAHg3ReD5/AW6H7oloeeHEU+hOjU1qIQrCTgWH1QJaKPmdHBoLd/CSaBtRgWtrgxatPtFrugJVVxwgngtutnfJhmdQ/pN06UQHYeF5QDTwC7HLWdL2PHpz1ig==
Received: from AM0P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::30)
 by GV2PR10MB6935.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 08:16:41 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::ad) by AM0P190CA0020.outlook.office365.com
 (2603:10a6:208:190::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.22 via Frontend Transport; Fri,
 20 Mar 2026 08:16:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 08:16:40 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 20 Mar
 2026 09:19:04 +0100
Received: from [10.252.17.77] (10.252.17.77) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 20 Mar
 2026 09:16:27 +0100
Message-ID: <9aac6a80-db08-41da-bdff-f92affa56965@foss.st.com>
Date: Fri, 20 Mar 2026 09:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] reset: sti: kzalloc + kcalloc to kzalloc
To: Rosen Penev <rosenp@gmail.com>, <linux-kernel@vger.kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, "moderated list:ARM/STI
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <20260320010517.31917-1-rosenp@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260320010517.31917-1-rosenp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.17.77]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|GV2PR10MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: fa04234e-10a8-4c32-a871-08de865903d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: X08HYIcRxqKXxHeMF8Sk3rdkIgeirk9DzI3xBjltzvVY0ZsjnCUY8EeiLQavTvJCFQkzC5XKsTFOsS231AOM/DWZalbEPJc5VbSEPZzTDACxJKp+N6K3bDgdSeu4MC6gQUUI/OYCKr7FeoiUmziUZhUX9woPeF8FWI0/6D1Kke6ByCOwAml9fl49p3CNzS+Z3RggSQKw75mFTRcH+L2zscsbf2iKx1wpQ2c3gaHkOYPlRjs+t0fvylqMbhSrQABz4YjU+hR0//4l5ElAEIzgs7WqUKFtUlH60sL5n9dJaGUO1QX/7hT3kicMf26vCMCPPhGgh4RdepgH0sXD0Mv8Xm1Bn9iHGEEzZiVQyJjkzRweYSOIC2LPcvGp5pQbPXHwQoZNRn8asePZBi851ctrsFwhSR0c0HT9tnG/vSrX2MMRMkAcTcJFD4uK88a0N0vCz+RRfMcbWEsZK7e313Au1vTHdormw2pe0I8ZO8/JTYlC0/5SwOCdklheCYbabbIEYACpx3XkL0+nIMdwh1B0WDMGVHaBPw5pmER3Sf/1ZtVdWPawYDjjs0UHqzNLdPDZU5nffIzEp3DT7HaWI+lFsAeQsA6iwojqYnYQuQVB+B7mzWnc2T754EZwAi9BFmVcwk+MtBRwa3YCwxXGGaThru247c3P87vshsL8YPu9WmYjp+2civ/utNYIzfsLOTkwwAbU4NSDdZ6fPSEps9Al24uvzpFsquUBStrn40Ji78JyRjeJHhMa8wPDaDNAzCMTJQgMPZomHq6eHjKNkWNQyQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vDUszEqiprQLE4S+2T2Wvg8cDkFPymcHjc3yMtVJ/fJ0RJO9lEeIxp0vuQlq2FJTPbqS5x8+FH/H4ZuwxiVIT7NJ1eKR78S9d6pr1LvXHuFfgrKLiR1q4693CifQE5QgXspWyJBgPv3LAPFLJ6KHjCudn0BdyfCH8gRtOITtlG61/6W142JlxgPP1vCp7MLmUr4AJlgpcTZmGdgxFQmhgGrBECbqsDwWpPEoFRzKALdYr8y8gVu3ZGQPvX0/Z/RxSI5dofROURYwTZaaxJBJ/9N1/bbaugLC9/1SxYTSj0HtwpVCW4y4RVQuGLYDgPShjStLTQGpN/VRtFlOUxVreIkln4skb5RGfQwpX8viOAyGQKo0/zN71OxxslE/w09BSOOLVrmfPBsyoO6YDN6ObFONNC31b/N3TsUNcbAyxx1S0hCH32f8hd1eUUv3vK9b
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 08:16:40.6635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa04234e-10a8-4c32-a871-08de865903d2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6935
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_011650_568048_5CCE0EF5 
X-CRM114-Status: GOOD (  11.27  )
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



On 3/20/26 02:05, Rosen Penev wrote:
> Simplify allocation.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/reset/sti/reset-syscfg.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/reset/sti/reset-syscfg.c b/drivers/reset/sti/reset-syscfg.c
> index 2324060b747c..38f78d78fa4f 100644
> --- a/drivers/reset/sti/reset-syscfg.c
> +++ b/drivers/reset/sti/reset-syscfg.c
> @@ -41,7 +41,7 @@ struct syscfg_reset_channel {
>  struct syscfg_reset_controller {
>  	struct reset_controller_dev rst;
>  	bool active_low;
> -	struct syscfg_reset_channel *channels;
> +	struct syscfg_reset_channel channels[];
>  };
>  
>  #define to_syscfg_reset_controller(_rst) \
> @@ -135,15 +135,10 @@ static int syscfg_reset_controller_register(struct device *dev,
>  	struct syscfg_reset_controller *rc;
>  	int i, err;
>  
> -	rc = devm_kzalloc(dev, sizeof(*rc), GFP_KERNEL);
> +	rc = devm_kzalloc(dev, struct_size(rc, channels, data->nr_channels), GFP_KERNEL);
>  	if (!rc)
>  		return -ENOMEM;
>  
> -	rc->channels = devm_kcalloc(dev, data->nr_channels,
> -				    sizeof(*rc->channels), GFP_KERNEL);
> -	if (!rc->channels)
> -		return -ENOMEM;
> -
>  	rc->rst.ops = &syscfg_reset_ops;
>  	rc->rst.of_node = dev->of_node;
>  	rc->rst.nr_resets = data->nr_channels;


Hi Rosen

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

