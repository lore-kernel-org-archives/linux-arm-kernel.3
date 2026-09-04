Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFBEC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaJLRXdTfKBjKliU4yIsTLYlTagBUvh9PYCo9tJBrjo=; b=0l4RctSAQxzGFCRyGMEYlrBdic
	8mLb0ViMuQRrqzhPgDFeAVhVA8pth1xLjCA6rvC86qbyaDxjgMEv7MGcYTatV7IXlt+MJROucu+0v
	50EiLBh/ASq00nbC+xOlmRJMqjqULi1HBOAaw+wzRsFBoFoPQnfN9ystuZxqmHMzeBlhqJPjQIjZn
	OSvsAVFgYr/wuJOq/pmPBDgF3vj9xPw4EVsSzsC9hTgNefjDPMjhOtRhFzTsbSuE44J87soIx35mk
	6DuX5/VhFG7KrO7MTmFm3DSP0tEB6hCtvD6bdf/E1DEU/Cx9VrYQVtM8oSeRTpp0dItwG+bSVVRWg
	d7mt9rng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QCC-00000001X0p-1utS;
	Fri, 04 Sep 2026 09:26:52 +0000
Received: from mail-westeuropeazon11010069.outbound.protection.outlook.com ([52.101.69.69] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QC9-00000001X0E-0mFk;
	Fri, 04 Sep 2026 09:26:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKRKpCvDCk9ls7lAXfzRyJdLWIkP0A/t2LNo2EAeXmfmOvL4hhg0KRLbvJJl/WcMrNcKvcRGk4+UgP6vuKRairoJWT3cz12irNv/RKRvcSav1I2SMINr/dfsuFwcAzDlnboRf4oQsmfLAM0/l6Usnb98lqJQq6+YfBB5Sg2L/TsW5LzopRH1YV10hGR294NholmiJxCcG5op/zr7f09h9qIpVsoBW4/GjM7GTtQJ4UyLkz0e/QjBPpvdMPTow3p/cxY55ay2BV4bQDDULwPZ1894jfLYTiwpgZKphYkD0UGSY0uO8lOy3eIizlO7d+VetIp9uASRKlVyfjfWraLJkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaJLRXdTfKBjKliU4yIsTLYlTagBUvh9PYCo9tJBrjo=;
 b=IkWUriX2chGSj2rbPC1oieLbsHUUp4COVM9HLk9G/CK0yioglup0ioEYHN/6Sxd4nn7xLzD6GfRYiQVT4AIAWNAjY5VqiAGu/bJ4fNsujmQFJcrHcwv8q7G4ZDbY8FAm1WwMjq+url6MjpoBnWu9o20KHDLK04zgt2YB/1K+mvM5E/0rhe2YbxHRfeWDa5fKrFU89al/iQ7FnlrfNnzeoaM4n+dMV0Cl4SSzRIywAt5Ai9/J3X7E+1kzMaC7b99Bco4e5TvfVK4tLbaBZHByPkrsUYaUhPWRtqm9iaKqDYi7fackieJcVGlCo6V/fJ5SmR5NFu8mEVvVh5ctq+HTng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.88) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaJLRXdTfKBjKliU4yIsTLYlTagBUvh9PYCo9tJBrjo=;
 b=msEoMaqbYsaqV1ZQPmhcYSxwQMYYb86+W/3okiSZbBhwMY/qZBbKlAQuYBNpZJHzDu13/DMTjoasIEpi0ZMLUAPJR4Q8efjoVvPHUJuxkZeIGhc9+rCiPbwH8B+Vx6bBallKSnamIgfhgklR/oK7gRnRVFmUb4d7y5To6hpQn8wyX1M/9YsQ7WnGT4gBIsDwuCIn0F8shLFLRG05uTjo7DdNQVQccNRJU5/X4F8jitNRSXr2ZOHolIKlZ/8TTujiLDe2xnI168BZiILbAfaX0ikOZeFXhLTW3VoGD5VGXipRbzThjWeDQ9IxOSTY3UMALbyk1Tuuhh6jD/WcctIHLw==
Received: from DUZPR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::8) by VI0PR10MB747752.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:2bd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 09:26:42 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::4) by DUZPR01CA0033.outlook.office365.com
 (2603:10a6:10:468::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 09:26:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.88)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.88 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.88; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.88) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 09:26:39 +0000
Received: from ENXDAG1NODE4.st.com (10.75.129.197) by smtpo365.st.com
 (10.250.44.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 4 Sep
 2026 11:23:56 +0200
Received: from [10.48.87.20] (10.48.87.20) by ENXDAG1NODE4.st.com
 (10.75.129.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 4 Sep
 2026 11:26:37 +0200
Message-ID: <be376690-5219-4bf3-8ed7-02a49cee0e30@foss.st.com>
Date: Fri, 4 Sep 2026 11:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dmaengine: vchan: add vchan_chan_name() to get
 channel device name
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	<Frank.Li@oss.nxp.com>
CC: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Paul Cercueil
	<paul@crapouillou.net>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Patrice Chotard
	<patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Steven Rostedt
	<rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Ludovic
 Desroches" <ludovic.desroches@microchip.com>, Viresh Kumar
	<vireshk@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam
	<mani@kernel.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
	<haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, "Chen-Yu
 Tsai" <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, Kelvin Cao <kelvin.cao@microchip.com>, "Logan
 Gunthorpe" <logang@deltatee.com>, Laxman Dewangan <ldewangan@nvidia.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-trace-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-actions@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<imx@lists.linux.dev>, Frank Li <Frank.Li@nxp.com>
References: <20260903-dma-chan_dev-rename-v2-0-0db305b6c716@nxp.com>
 <20260903-dma-chan_dev-rename-v2-1-0db305b6c716@nxp.com>
 <apqKgda7dW_JXolJ@ashevche-desk.local>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <apqKgda7dW_JXolJ@ashevche-desk.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.20]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To ENXDAG1NODE4.st.com
 (10.75.129.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885E:EE_|VI0PR10MB747752:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7f79ca-0027-4732-cfcc-08df0a66a00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|7416014|4143699003|10067099003|18002099003|22082099003|11063799006|56012099006|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: iyoyOf3LVtUa56FiGdactARHtXf3qZbJg+Ym7tLfBsVQkpUD8TDuXyuvNn014MI+vJPGX/lVzaogT3SasTb0csZXPjriEPuwcHW7lcz6e+bOhKr7msAbG23aGOCMcADu1FUb9wv1KgMYh/rrJnY3jz+FRvmCOWU6Dgiea+81128aE1ixsZ9n+a+zTIz2IkOY2jU2DuLq6XfgjwmU0iI9RL+ZwgHupiiWUvIB57/vB7IUKeyGHkLZF0ZOHZkZ++zh43DcGWZ83zSj01GGEcM39D9UeuiU1bro/louxUU2PJLOpLG700GWItjkRyGmNvc7tqeP+wS+MmpuJEliStlUaih+2BSRTjri47fm5ZvoG6ypSZ7KqbUWc/sKxevY5LvQl+8xJowsMM5LN0jNWhqQTUvosDdG8Whw46mv82avSdB43SgilU6c+Y2/RDr8feaTXkKklGnVc2hoBqHNfJyxpe+nb0XP5fO0H58mZxTu/UFWt7uc6KbNxURdK+5UN/pDHIfUoUHoCGXgYtk8xdkv/kkcr6wp1T6ipPjeb/G0p/BlEjIyAnEX1a3ukRX3hT5f5/UcBtfKAndknwmAhkhomBXuSOUhXsMYd4pd3s6VjtmblGfVi9GEDv4wFiB7wIJPYzkmWDumq5bgn2i4iONaDKEOMiqQj5+y+XNWJULxyNLY16pnQzEthTRcxt/T85ZXYm6azn1UrMIVOrcdvhtlOgUZzulXyMCumD3W93zL1U8=
X-Forefront-Antispam-Report: CIP:164.130.1.88;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(7416014)(4143699003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(13003099007)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k35KY3k+uMIA+ymPEIQP6XqlVgCKMVi5Y8XGIWHJr1lmi6su34MqOMCY00yeX7PFejkyyXTTkwHau71TF0xwNoxl5/8T9CqToMC/9YY5trjFJmGZ65UxquCjt78IyC1eqz0AzjQb1zF4NNwBxyjD7MH2cW2LiY2EqsCLlrvpop+MdidVf04s+P59ok3HoSjF9q1DhTLJs4Eok14ryJHimCV3ZXNYkZjzFC+Vuxd3vwQwEtz5EBIH1n+zDG5J2NxH/CA+oyVnA/LcOs7zzyKtKnLHWWyG5dWXGYYyXJw4toKF0YX7e/RzHAJ8k3LnE74qpGkIIcVgFDemshPiOY/QUX87pqMV8N4/qQ8OH+Qj0GIo/yk9mcB5oMKSQO0fgFnWuaZ1CLpjEd24e0zL5sIjvy+nWmp7+SYSW+M+/xgtqEgJVWbumAULZ7gkep4455le
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:26:39.7294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7f79ca-0027-4732-cfcc-08df0a66a00d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.88];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB747752
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_022649_330340_AB46080A 
X-CRM114-Status: GOOD (  12.38  )
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

On 9/4/26 11:08, Andy Shevchenko wrote:
> On Thu, Sep 03, 2026 at 04:53:11PM -0400, Frank.Li@oss.nxp.com wrote:
> 
>> Introduce vchan_chan_name() to obtain the DMA channel device name.
>>
>> Use a dedicated helper instead of directly accessing dma_chan::dev
>> so callers remain unaffected by an upcoming rename of the struct member.
> 
> LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ...
> 
>>   		ret = devm_request_irq(&pdev->dev, chan->irq,
>>   				       stm32_dma_chan_irq, 0,
>> -				       dev_name(chan2dev(chan)), chan);
>> +				       vchan_chan_name(&chan->vchan), chan);
>>   		if (ret) {
>>   			dev_err(&pdev->dev,
>>   				"request_irq failed with err %d channel %d\n",
> 
> This one...
> 
>> +++ b/drivers/dma/stm32/stm32-dma3.c
> 
>>   		ret = devm_request_irq(&pdev->dev, chan->irq, stm32_dma3_chan_irq, 0,
>> -				       dev_name(chan2dev(chan)), chan);
>> +				       vchan_chan_name(&chan->vchan), chan);
>>   		if (ret) {
>>   			dev_err_probe(&pdev->dev, ret, "Failed to request channel %s IRQ\n",
>> -				      dev_name(chan2dev(chan)));
>> +				      vchan_chan_name(&chan->vchan));
>>   			goto err_clk_disable;
> 
> ...and this one are duplicate messages as devm_request*irq() printsr
> most of the information.
> 
> Not sure if there will be a patch to simply drop them.
> 

It was the purpose of this series:
https://lore.kernel.org/dmaengine/20260709135846.97972-1-panchuang@vivo.com/


