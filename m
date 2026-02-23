Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA1EEA4FB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdFqhD5LZktUthfUhKn22Gtw8dIvqWt5ob2f7Qi3d0s=; b=0sYTfx2l9HJgqSdjN8oKGalFC3
	uWNrs4PhqcZQA5OaHJUzYubf/2Zs4KpyFBPCMwZZPG/a5BUdXvkLDgcTrkNo60Kri+0JnRxLyEH2S
	l0noqY+l53DTupKF9sCxNbuzIoQO8yEYbhRQ7zNrkd6GPQeVS+WtK93ZXHEFJeQSGMfAbYmFuPWC1
	fMVLgzoaRi6rkXdu+AZVk3Zr0esVkY2oRovLDm39ftL9RgvZ8OAShb7Z2qsYZ2q6HhJwNuINXOBVe
	l7NbURfXKWt4f9Cfj5QOa3/S/uxN9D1UpXYC1fjgsGfdggF406916P/UVjRn1EzVoQGz98hgkmvD8
	Fdwm7CZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUd1-00000000FGj-1UeT;
	Mon, 23 Feb 2026 12:01:31 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUcx-00000000FGL-38kz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 12:01:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/f4vjFYhkXjJPcpQGCkhnXPXrixIAti22m7njsFiSP4kZeku/v3HVvfld0+2RLyQaIzMDOMajT952W78cPhy/Mvb3EazpMYfqLTN+iYUKJ0yUn1cAQmb/Mmi1asPus++IJJECPekCh5e5GtpCrrNgdch/w8b+oWH6rx2zsyAbbhwcYjaxCVjZ8BlpxK6EU/y5GoVyjNU1tQ7fkjSUraMW+0vXG4U1tVk3Ajir/4z0DyIS43iIJ/4b82QOOLOGA6I+opjpe9Yrx2GqnfuBIRUw04MXcPEE/SGU4SUioeKfPk97dfffvTzYHXak2zZMC6U0L9dkn0Dks4K2AWCeFVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdFqhD5LZktUthfUhKn22Gtw8dIvqWt5ob2f7Qi3d0s=;
 b=lzju7HQK2mpJ/z599JtddUHhSlxfFV18so8hqEvJCr4yx8nvgNXezf9VncWPXlGx5xGKhayKFZa3TUjr70lm76N9IOxgmP9DuuZHI0i2/VcItXiRpc2yt8h8Jh9PYz422DH9gUxZX8QxYblL8aspVAvlCZkUI49avlxH/ENMEtP0mSPzohf+Zvxnjqlm7n7oomT32DtKQCVkv3exUvrpm4x/PJL3qRrdZNlPyu400N1oZfdyj47JC2JFs8zzCMBgHQiJ7EN7sIQ8NCo9jLR6Q0C6RlUevCrLQGzPCMJ/AE+5uVQCMYNq7Zfhy6QZ34nPCstBERomI8QnlVQl8Pxz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdFqhD5LZktUthfUhKn22Gtw8dIvqWt5ob2f7Qi3d0s=;
 b=QzFb364ivyljLJs1W06SH/vleGFY9TCaYg6ioqsMAkU2mOd632cNGazczskLjAOk2HNLsvkqZtozM53EEqE6Z5N1hXuA8vSKKZ6/VmL60ywdUes3WC2XjcIs5gciuBPdonxjS7Ioi9WguHTroAcmiuSELhYaRNoZ3hj3DiBK9DM=
Received: from BN1PR12CA0015.namprd12.prod.outlook.com (2603:10b6:408:e1::20)
 by BN0PR10MB4997.namprd10.prod.outlook.com (2603:10b6:408:12b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 12:01:21 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:e1:cafe::c) by BN1PR12CA0015.outlook.office365.com
 (2603:10b6:408:e1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 12:01:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 12:01:19 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 06:01:19 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 06:01:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 06:01:19 -0600
Received: from [172.24.231.225] (a0507033-hp.dhcp.ti.com [172.24.231.225])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NC1EnR732929;
	Mon, 23 Feb 2026 06:01:15 -0600
Message-ID: <385fee0b-5cc5-4fca-a109-47c47ecae6d4@ti.com>
Date: Mon, 23 Feb 2026 17:31:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable the Keystone PCIe host and
 endpoint driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	<geert+renesas@glider.be>, <bjorn.andersson@oss.qualcomm.com>,
	<arnd@arndb.de>, <nm@ti.com>, <ebiggers@kernel.org>, <michal.simek@amd.com>,
	<luca.weiss@fairphone.com>, <sven@kernel.org>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<kuninori.morimoto.gx@renesas.com>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <s-vadapalli@ti.com>, <danishanwar@ti.com>
References: <20260223104650.876632-1-a-garg7@ti.com>
 <abcaae3e-c0ec-4e83-9ec1-016f36212084@oss.qualcomm.com>
 <824b8e89-29b5-4313-83dd-141d97451b82@ti.com>
 <a7784864-5f9d-4403-ad66-841682315049@oss.qualcomm.com>
Content-Language: en-US
From: Aksh Garg <a-garg7@ti.com>
In-Reply-To: <a7784864-5f9d-4403-ad66-841682315049@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|BN0PR10MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: 74184cb7-c4e3-4ce4-fbf4-08de72d341c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmtHWEplOFRacHViOFJLbGFnZktGQmFhNnU0RTVLd29qMmhnM3Z2b0xRcXFz?=
 =?utf-8?B?Y0N1dFhXdytJYmdRdDE1K0lrcTJObnIxcFp4K2lWcmEwNGJPUDJhNXZrNG5Y?=
 =?utf-8?B?L0pFSWFKaGlac25XNWxpdjkxS21WeExiNjY0MTErRFJOQ2UrOVQ4TkV0K1ls?=
 =?utf-8?B?UElwN2FrWGlDaGhkTTJ4L3FMREwyRStGR2tXdERsb1pKUU44WTVtbzVsZjFJ?=
 =?utf-8?B?SW1wbWhzMCtmYzFQYmEvQzVxSk9RVytCYnFTaXBhZmNuY1llckZDZ3RaYmta?=
 =?utf-8?B?cXgzL0Rhb1l1aDgyRDYrRW9ZY2krQ0JEcFF2TzdvbG1FWXQzNm9HYnkvSitn?=
 =?utf-8?B?UHpIbWRWLzZUTVloUnRJeXdlTDh4NjI2T1U1Qkx6ZDZMVHRNUUh0T1Q1Rll3?=
 =?utf-8?B?YS90ZFd6K3lKTU1Hc01TdGdHV255ZDdFR1dOYzgxQTdnaHRCQzZSZkdzV3NV?=
 =?utf-8?B?WXU0QlliLzlkSmxoZnNPUkE5UE85SzExU2VPR1BuQUNCWmFJU0tTUzBKcU55?=
 =?utf-8?B?aHlmTjhPSlE4Qmw4Vm51cW5MUUkyUGpQcUNSZWFNM0poK210dkN0eVY1L2Rn?=
 =?utf-8?B?SmRrY0Z5MEhrNHdoa1VYeXdFa2ExS3FkSUV1c2ttUCtzYU1COWtrc29CaGx0?=
 =?utf-8?B?NG1NUDYvbCtWSW5aeE92bmxjeHQ3MHN1ZEZodUVvM2IwQWE0Mkc1QkJPa1gx?=
 =?utf-8?B?Q0hmK01XbGtROGpyR0xhMk85eEU3Nno4UitVMzlnbTl3d21namtkc0QzODBz?=
 =?utf-8?B?RHJVL2hEWUZlT0liTm1hcEFsS1hvaWRET2VOVmR2VkRSSzNNdWQ1d0ppYk9K?=
 =?utf-8?B?K1MvZjc0dFZjRks0aFZDdUE0Z1Q0cHY0R2l0Qy9ncmF2L2VxaGZNa3UwQklk?=
 =?utf-8?B?M1lldlVjcGRXNjBQV2FEcnpXcUh4OFgxQWpYazRSUk1QSnJVM2lmOUZxNFd3?=
 =?utf-8?B?c0NXYmdobnJPOTdFNFhKbUdvSHg1bHRpOEpwMjRYbTlGd2lTSDJNdmR1Mk9t?=
 =?utf-8?B?cFd2ME9tMXdwWkNkTXpYbmFrRDlZeHluS0hKN1JybkY0OU5QMVFIZjJYQWR3?=
 =?utf-8?B?WUlTNTVDdjBqeCtRQmpyb0pTbk9oaWwzNGc5NXFsQmN4WCtRalcvMXNMU1lu?=
 =?utf-8?B?M29XVzdaZUNUTitNL0F5aTNNRGQ3d1M2VGNqWWJXdXRTdytDZHRFRHpxbE0r?=
 =?utf-8?B?UEQ5QTlhcDRjMGxWa2VVTjdWQUJNNnlMMmVYbERmazFPWnZ4R2U5Y2V6WGRB?=
 =?utf-8?B?Smc5OTM4cFZXRjZBbklFVTFaSmtuT2NFOWpHMGNwRTcvd1k1NThESjdFcmQ0?=
 =?utf-8?B?ZTBwbThld3k4ZTdkL2RPeXNSTWVNNjBhQnFwUHc2cjNWY243Tm0wV1dJSllN?=
 =?utf-8?B?djhjdllxaW5UYllMUTJCWFkwaXhubEhCc21zYjhWbmJLSlBzMVFucDd1TW01?=
 =?utf-8?B?ekY5VTdsYnZHYW9hRElpYUhsUEk3Q282VzdDZjZ1djZvZXJlZ1dWMXo1YnBh?=
 =?utf-8?B?b09seXBEeVJ6MWdsYUx2OWFSMWp4L0VaMU5rZisvQ1pLZ3RqSmdraUwzWDRj?=
 =?utf-8?B?Mi9veUZ3bGtZZUt5SThuWjcwMjc5cGxuYVdHb2ZRY1o5Vm5EK01LTWJtRnJl?=
 =?utf-8?B?ZWIxV2gxTElNOWE3Zzc4QkdJTko0U1ZsSjhjYnYrZUxBajIxUWMxS09uc2hh?=
 =?utf-8?B?ci9aUytkbFpwSkRuNWZFdk5OL0pPNHM2YjkzNi83TXA5bzB1OHZDVWxTRVAz?=
 =?utf-8?B?NU5lY1hxT2Q4WVR6Nm5ldzg3R292QXFaRk00UFdJbnVSeTk0Wk1OV1lwbVJO?=
 =?utf-8?B?NjBHSVhpN2hkWnN0Y1MvcnRXQzl4bEdZOHA2alZTa3VmSzlWU3ZrV3lKbkFz?=
 =?utf-8?B?eVdIbnFJUnJjeVc0alNnekhPUzVRZWRTb1kza21mMUMxUVdEd1NYeGxjZUt0?=
 =?utf-8?B?ckd5NUpwcm5NRThYMURYaU5waEFoa2Y0YTRoUGhUZGlRcVhiSk50ZUN3ZlpO?=
 =?utf-8?B?ZlZoalhZTkgzZTM0Mys5Y3ZWZGNvMytvSU9aR3pTdytCUHY2Y1BnYzExMVFO?=
 =?utf-8?B?RkVEdGI4Qkp3SG1hSjFzbmtwUVZzZ3l6NnNQNjlWeDF2Z2g0cnRtbEhUWi9Q?=
 =?utf-8?B?OG9qQXQ0RC9qNi85SjZXYkNsUmJUR1FudlJzaVpOT1JsaytpY1BocHZjdXEr?=
 =?utf-8?B?NVI3WGJpV09mN0xKWnNZOEFqQjVNZnJEaXlSL205engramRIeE1nTjV0MXhv?=
 =?utf-8?B?ZnBEWUwrWXl1eWtDTmNPNERxNEpRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: siIuYh4dDgRUeppRlzXaKG9G/31k3LoDkkgS2/h9UsmOJsEq+jinLP5McpF9QbMNT7yxFb/2mwKRM59iCDfSULe26EY3oz0LoTfkFJ5PRN+vniizc6YfXhE7QzruVKNXRa8ZLd/Xz0BKg9vx5bPe4Uz0jW9vFtkyQ9ZLvnpRWLR8YcZHl5ltmRtHgkTeff1I3N1rPk8YkxrBJ0A5AidVsO8kJ9N3nGl7z686eMieofkNdmHklBqgn/YQcEfD/PT9AW2pSsnxTVr+sUzwON05bQlo2yFUqO8KuCgzvDwp+kFoBTxEei7WNcUwWWZXZbVPgqc1tNe7Krrka2toLJex+bImvNgqT7V8HNZHZeqTInz68Jl9pxJc9xOji1kfK+EBPgW6qjVGxGvIe3s309S2KGYr6y1+T0MqR77q1qA1mNxPHNV1c8BUzAGBzuHHJ6UT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 12:01:19.8904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74184cb7-c4e3-4ce4-fbf4-08de72d341c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4997
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_040127_928990_184E7DEC 
X-CRM114-Status: GOOD (  13.38  )
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



On 23/02/26 16:55, Krzysztof Kozlowski wrote:
> On 23/02/2026 12:17, Aksh Garg wrote:
>>
>>
>> On 23/02/26 16:36, Krzysztof Kozlowski wrote:
>>> On 23/02/2026 11:46, Aksh Garg wrote:
>>>> Enable the PCIe Glue driver for Host and Endpoint mode of operation of
>>>> the Designware PCIe controller in the Texas Instruments AM65 SoC.
>>>>
>>>> Signed-off-by: Aksh Garg <a-garg7@ti.com>
>>>> ---
>>>>    arch/arm64/configs/defconfig | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>
>>> Why are you sending two separate patches one after another?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> As both the patches does not depend on each other, can independently be
>> reviewed, and address different SoCs with different PCIe controllers, I
>> thought it would be better to send them as two separate patches.
> 
> So twice more work for us? Why this cannot be one patch?
> 

The only commonality between the patches is that they both enable PCIe
drivers. However, the patch for J721E PCIe driver only enables the
controller for EP mode, as Host mode is already present. On the other
hand, the patch for Keystone PCIe driver enables both Host and EP mode
of operation. Also as I mentioned, they belong to different SoCs with
different PCIe controllers, so I chose to keep them separate.

If I squash both the patches, the subject like: "Enable PCIe drivers for
TI SoCs" would be too generic, as TI would have more SoCs in the future.
Hence, the squashed patch with this subject might mislead in future.

If you insist me squashing the patches, then would the following subject
be acceptable: "Enable J721E and Keystone PCIe drivers" for the squashed
patch?

> 
> Best regards,
> Krzysztof


