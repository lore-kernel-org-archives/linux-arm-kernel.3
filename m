Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB32FC592B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MR6gesGSkCrAAgYgHgLWmn3PJRepX1k7pJtTosmuLGc=; b=AxOuY8G6PPPf55Wae1R9EBqwTX
	klt76tcpxTFTpeRPeCNTzEBHe20eOW6QE/pPOGJFeMz+YSUD/lOER/a8FYapsDLMl4qNDj3iWXNZh
	76ww/G/qMabqW3xLybf/XpDFyKq1wOfWXxXq9cuzUc7nuqPkYUQt0MB2VuqA9zFxeb/TZf7GwrVfF
	gPnPvH8bh76JJDWZK7lUWeNGX3R2KBINHaJAWWq5V3LRw0/0WRY48jCKgL1rjkjiVEBokgVlvuwin
	g/wfl4YFvbcblBjHywbe+cGrJV1BJvNeFFH571bDk8h+o3NfjhVwju/wGIxw7aU6R4DVFcX+JaPtp
	UcON7elQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZ12-00000005yEV-1SXh;
	Thu, 26 Feb 2026 10:54:44 +0000
Received: from mail-swedencentralazon11013040.outbound.protection.outlook.com ([52.101.83.40] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZ0y-00000005yE9-059L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:54:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKE78XMHZ24An3uLnHO0njBEl6mIqs9VeE7zgnPbUIjVZcqosWyIpWqwbz0xq1+3uZCy4BwtGsuGRmOzfmup4tABAJix7oI4sb0wA5UrNJpHbY3BI+B4jigSRsHKwO2X0yJ0WVTkCqASswS1WwWH7VlsSpWw8MqKvezZafWgBhAAScbwoL/wjjettc/WpI0KmAqdcTEU3/XAcMnzGa371SJ5fbkLWmAGXpH7DIBKW8DEZkBJiOAbndQSpzfprxBY9HAwc6Xx0b8AXQIQLyiDqI2s3NiQaFR1WhchD1zLHIAjKAYLuYJbqL8+EaLbFu+twxva6JItqcyNUwtf9EppGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MR6gesGSkCrAAgYgHgLWmn3PJRepX1k7pJtTosmuLGc=;
 b=LVyndfryUn5riBuNQtf2vtVnn9nXtjEue0ljF2WjIKEOCekwClXksrRVNI3VcGenVwDTs9nZ2YMT5hU3264sNHaI+1cYYqCCYmGNOvO+liTwjmdwAZ9RmWyuxtwl9Dv4Q2tD0ujiEtPLoNDrtuI37fQ561OQcClJraqTvfmaS5h6dRT+mE4f/bMl3eI7g1Qk1D+lojJTK5NbnmflwhihGgl+En0M5h2evfXTs5YHuX0hBKYMHZkUJ/L86v0Op7dEg/2tqo5ZHRi7RGVkJtxCoknvnbBcTT3HzORYSw0kt3iPmAGqxImpvsUy8CttfhnljHXBq8MPsDdGL0rDNp397g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arm.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR6gesGSkCrAAgYgHgLWmn3PJRepX1k7pJtTosmuLGc=;
 b=HfHSicDXWDW40DRosplEBfiHVtAls+TAOVfJDFPGlWgCxBcfHt8C909y8ad0oJI9yBTJM4Z/2HMxjIpp9Va7/rLH00OY1ZtcuAMVOkGOih3w8mX5YizmncQVtDwccEG8feo8Hl6m/QgV9APW0dgZAYtNW7+fRGqktfnbSE6xS2T5bcBKIMUUkoDsVGOApKtk3nRMZaS4iRMG/WNidEs/NXjPbAATRQ3hWw0vZ0++lJS7JLb8hc9B1hGeLF2ItTseJWuOTNsxieyuV1UFHxYQjWOAlu62j+kE4dOuUM4n597WhuxOGQS7NOkVG+QgJLHgVA54+UoVTHMX4krbzb+o5Q==
Received: from AS4PR09CA0029.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::18)
 by PA2PR10MB8338.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:415::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:54:32 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::7b) by AS4PR09CA0029.outlook.office365.com
 (2603:10a6:20b:5d4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:54:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:54:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:56:50 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:54:31 +0100
Message-ID: <7c60e928-d99d-4341-966a-eed759069f5e@foss.st.com>
Date: Thu, 26 Feb 2026 11:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/12] dt-bindings: document access-controllers
 property for coresight peripherals
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <cristian.marussi@arm.com>,
	<jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
	<sudeep.holla@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
 <20260226-debug_bus-v6-1-5d794697798d@foss.st.com>
 <fb91b392-2a01-4f01-85a2-335bb39ec60e@arm.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <fb91b392-2a01-4f01-85a2-335bb39ec60e@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|PA2PR10MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a79e09-de99-428d-d873-08de75256c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info: ZCAxP8EuI1H7ApXPVimlBnTq3s6pVhSkNC5uiaIlRV0el6CRJlbEoWODsPCYCGhZuZPoyd+mWQe2DGPl2ddUDp+mCcke7mJpFwt1LqlhElbLT0Q1RkrpN2kIkYaStWpMcszAG1WrIpeRQY01nQhYRaX3VTKcxmdj5WFI7xQJ/fzsfYrx/Pw8TWn7HurqMMG1wUwCT5IT/t4DyLD7I4aF5SAdG/0wLpGyY4R8KKiZF6wwMkxQwxUI+Z1pmB6V8G7Xg8/Z66HOBUqjrw0dxbHNsTGZI6mGXu63Cgrq9sWvKNz8SYPu7mPtI+WMx3dmSaF/tSk+Ruy6+UEMxhGgMG96gdmbZJ6TEXMAhT3I1EzSSr8jGLEqmcpVj/gPHk0naBKb8QwdcyWQEuiIJ4ihJaHy0V+SBncn3+BjyWZLGtenRvwTRutnd0WUWKmEZowspQ+5iGb5fjURi2pfkHPpS2tmLS4ahMo9y1UFIrrcSCcg7iY4MJ0Lm1By/DS4gFQtqrAXPjE3AR9px89kv6YNia5U1S4vu5wf0dpRBHrbIxks8N99lAf70grGCf0XlGUwAcxdyL3gG8W8Df1AtVsQNNX8qLSUIL5m42cZKDtx50P9FoLzz3M+7OCsYI/eN8lamCl4BPoatZUvrOlLccQyRoRz4i9qDu852FknuR4/eFSIhGtEJBiFq52CUWOtbNkwRymOiChx53ZWniJEV/MxK6AnwhuPSZVSw4DViZgRP44qITBYsIDzjqRUyfj+bfvapSgy4k7o/jPYPPyIoMwHDn3K0gjK57AQ/TEZO8i3Y6iIUw1CqyyR9KfZ376kCf3306UMrkasiAIEDN5AwHVI6b5YjFTPXu5hhsSU2tuINmEeGFE=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gR00r5GqJCTK1jas8+TJVdHphyCAU2R10Z38P+nCgiCmgnFOxdPyWay4nRMvMCM25Mojc2o5qiUlrbF6bSRpaB+UDfTAney4jd55vkLeNrj3c9QHG7iTceNnniv+LiqjKXgK3Z7mEJDNtZzNMN1JzBIVSGNscZuKVksUZii9w3ovTLyM6gjeMLR1vcrYkJEWUAQoaXly2K8fPJ/V2ygKzmhk+TWV1/F0I7N6+62EJ+Q4Ysbwk5L7AloQOOcUZ8+Lm4WdBsQ5tQtD7BQB47Gf4fapDrvNzXu39gXCzMyrFRbm88OpbIjBkshCNGwaepjcWb3EWwfo2WPN+M6pVByYJ64D4sYbZ9sc8MOFEc1O7AiZ6tL0NWQOikXLXZuDcwJ2G91NRNVa3amrvz5r3SrctpY/6GpCLmk6cAQfZ4OA6fpAfvHnuWRtJmcmNY7mKbxG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:54:32.6979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a79e09-de99-428d-d873-08de75256c80
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_025441_803742_8C79DC1F 
X-CRM114-Status: GOOD (  16.45  )
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



On 2/26/26 11:46, Suzuki K Poulose wrote:
> Hi
> 
> On 26/02/2026 10:30, Gatien Chevallier wrote:
>> Document the access-controllers for coresight peripherals in case some
>> access checks need to be performed to use them.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>   Documentation/devicetree/bindings/arm/arm,coresight- 
>> cti.yaml           | 3 +++
>>   .../devicetree/bindings/arm/arm,coresight-dynamic- 
>> funnel.yaml          | 3 +++
>>   Documentation/devicetree/bindings/arm/arm,coresight- 
>> etm.yaml           | 3 +++
>>   Documentation/devicetree/bindings/arm/arm,coresight- 
>> stm.yaml           | 3 +++
>>   Documentation/devicetree/bindings/arm/arm,coresight- 
>> tmc.yaml           | 3 +++
>>   Documentation/devicetree/bindings/arm/arm,coresight- 
>> tpiu.yaml          | 3 +++
> 
> Are you sure, you are not missing "replicator" in the list ?
> 
> Otherwise, looks good to me.
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 

The replicator is not present on the Linux side on stm32mp1x platforms
(Only present for the Cortex M4 co-processor on stm32mp15x platforms).
On stm32mp2x platforms, it will be necessary so it will be added in the
related P-R because we'll need the same debug access check mechanism.

> 
> 
>>   6 files changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>> cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> index 2a91670ccb8c..949444aba1f8 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> @@ -128,6 +128,9 @@ properties:
>>     "#address-cells":
>>       const: 1
>> +  access-controllers:
>> +    maxItems: 1
>> +
>>   patternProperties:
>>     '^trig-conns@([0-9]+)$':
>>       type: object
>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>> dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/ 
>> arm,coresight-dynamic-funnel.yaml
>> index b74db15e5f8a..b0693cd46d27 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic- 
>> funnel.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic- 
>> funnel.yaml
>> @@ -78,6 +78,9 @@ properties:
>>           description: Output connection to CoreSight Trace bus
>>           $ref: /schemas/graph.yaml#/properties/port
>> +  access-controllers:
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>> etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
>> index 71f2e1ed27e5..10ebbbeadf93 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
>> @@ -118,6 +118,9 @@ properties:
>>           description: Output connection from the ETM to CoreSight 
>> Trace bus.
>>           $ref: /schemas/graph.yaml#/properties/port
>> +  access-controllers:
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - clocks
>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>> stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
>> index 378380c3f5aa..f243e76f597f 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
>> @@ -73,6 +73,9 @@ properties:
>>           description: Output connection to the CoreSight Trace bus.
>>           $ref: /schemas/graph.yaml#/properties/port
>> +  access-controllers:
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>> tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
>> index 96dd5b5f771a..9dc096698c65 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
>> @@ -128,6 +128,9 @@ properties:
>>         - const: tracedata
>>         - const: metadata
>> +  access-controllers:
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight- 
>> tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
>> index a207f6899e67..29bbc3961fdf 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
>> @@ -70,6 +70,9 @@ properties:
>>           description: Input connection from the CoreSight Trace bus.
>>           $ref: /schemas/graph.yaml#/properties/port
>> +  access-controllers:
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>>
> 


