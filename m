Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DDCC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 23:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDdXf6oIZVGyX7muyvj4oq7a9ScDmRL4WmHTJ4hM6oY=; b=vkYgpzwALAGe9728LML69P1fV7
	UhxN9kxuwb4sgh4juGNe+JR6UO4Kn6smYPNO2ncnJHmDVi0eiPTSksncuxzqZIzkWL95kYI3prBAM
	d71CMCPDpbDPW0yWOY+Sw8bO1/a1RCjcDnYMnPMO1vvmy+lRSl9+UJd5nezgLDAhvaf5uogV3atU2
	0A1/h7dOdylDH1FdF2BqEB7VSrH9X4OQw6V0Zx5IKyLYHr04CVt3CCXOzmWHny43JW+sJLDaZXYsH
	MjfD6k6KO15OolIC58XnHfzFwV8cQvKVe2xjzgWDk9m68wr/ASC0czDqteTv8uYJHxyZY0fxbrHiX
	JXaBiq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZegs-0000000AHTV-32hk;
	Wed, 09 Jul 2025 23:59:06 +0000
Received: from mail-bn8nam04on20617.outbound.protection.outlook.com ([2a01:111:f403:2408::617] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdD2-0000000A4sI-0TqF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 22:24:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yz5JYZfNoFFwzzToITZEDtqzN3i0Lzd7JILgE9jdtSQbaftcyP9gEZ5+SIs+u6iK/L/mVeYaAcfbNBHrjEJ+k7e+y+PBmRFGGwp1DXwC9LYJF0mI6ZEL0wJNDMt6V/j0vWs7uBlSgv9IaGrfI//BhBlnM98UyPwqjJnkk0kVdVsQUVXuXogWlN2ItVNTgEcNR6WMrcTpHhY3ZgFrAQZ9R75IKErXPL8wdaDfze7xruphmv+cu2p1vJxOfJy98K6QAAmR40azxsL32bwdzDqWl0CzVKODkt9IbihpjD5Af438Rkki6uU3l7WNWkRqyLeovclkVlOQMUF8GTuNTxwcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDdXf6oIZVGyX7muyvj4oq7a9ScDmRL4WmHTJ4hM6oY=;
 b=FLVqw72EoEYApthbC+HshWiEit5VQn+3QoMXtKCG9bcVOcThhWwhUs0H/kvhLrrIxoGulgO37/58bTj72ILaQhY2A8uJBf+8l7wR6h0/Uh+6TEcVRY4X16wdu/7tDmiH+LAgqq9X0soeyyutGNNEiuVukEbu4FiSvTn3P7dfPp5udmRhTFuQLLJmbdZ2eTDrFmTv3OrbHluG8Qb86BeV1ncLpV8+aM/a6ipbKSMIIxs47jYpVXmxFakM6Kq6K/xipZhGyadZc1HYd2R+8Z+AWxPAGTFsiGj0r3VpbZIQiKeKrFm6knRRx2XDdt3E/frPxlPjIw7iJRsskvQcYLFYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDdXf6oIZVGyX7muyvj4oq7a9ScDmRL4WmHTJ4hM6oY=;
 b=j5n41i/UfXBG3mavPfp++UqrwrhZ+tsnTPYgr+cOkupz9xn7IjqWgrU5Ij4Ki1qE/UiICcRD6/eKpK0v3dN6zb8MUp+FnIT4iZpCivCgjIUDnQ654Dz4jMA0QZsOMlI4m9OSreh+cCAhW4IRwQ01w60drbfMpR63suS31Ht4W8dbUbjlk1J6n+qHlj4c0VS4lNRO4i1ZBA3rKv2m2peQhbYrsRacGtci9/nLAa+cGq/2BWa2KUJrUbkqvbhbp+0iuvcurOyPB+1QwL94mLcZnrWu2myromiQvGVn8Ndsk5czw87sNOIlC/MGtkwFOWh2ib6mWAVjuamNf4k1etfnGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by SA2PR03MB5866.namprd03.prod.outlook.com (2603:10b6:806:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 22:24:00 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%6]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 22:24:00 +0000
Message-ID: <c048d76e-8187-440f-9f28-b6594810d5dd@altera.com>
Date: Wed, 9 Jul 2025 15:23:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: altr,socfpga-stmmac.yaml: add minItems
 to iommus
To: Krzysztof Kozlowski <krzk@kernel.org>, dinguyen@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250707154409.15527-1-matthew.gerlach@altera.com>
 <b752c340-bbb5-479f-bc2c-a9e8541509c3@kernel.org>
Content-Language: en-US
From: Matthew Gerlach <matthew.gerlach@altera.com>
In-Reply-To: <b752c340-bbb5-479f-bc2c-a9e8541509c3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0380.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::25) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|SA2PR03MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f9e7c7-e064-4c8a-10b7-08ddbf374d78
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWJPMEkyb0pFYS9UTDdJSkE1S2FqaUFib0hDcTBFMFZ6bTdwRG1LYU5kTVVq?=
 =?utf-8?B?MUk1UDVKdUMwcFNvbHRHbkxLS2JtRmNnOGdPTUFjTVBrOGc3T0c3eEZGaS96?=
 =?utf-8?B?emhySHZEWDlNbTVpT21EOFZGazFFSHo0dHFpSEk3WGdiR2dFNWdkVjBPaE4x?=
 =?utf-8?B?UUlpVThpVHlFdThIcVRYc05yWVNzc3pwMWw5Q2xnVDJDbDJmZXVTY2pHS04y?=
 =?utf-8?B?dGhhYkNOK1gxUU9OTW1GYlFmeHY1a2lITkY2YkRPNXh5c2k3b3Z5YWZHTDk4?=
 =?utf-8?B?a3liVGZENVNXNjNMbXAvMFlpT2RCRE51QWhPOFlIblFFNEFDSEhEL0YrMC9F?=
 =?utf-8?B?bEhuM2crZFhuZlFMOEtHUFhxdVV6b0ZMQTRvVEEzNk1RTmM3OVd5N1RFMTRQ?=
 =?utf-8?B?Yy9LMWIrZ0VpTDYwWEUzSUkwdXF5NnRPYzUvS2hTcCtrOWR3dnRaVW5Ddmsy?=
 =?utf-8?B?ekpLM05nOE1PS3hPNUs5RjZsL2F2aWtxcEU1UFExcDdZY2lGdXllR2NZTEZq?=
 =?utf-8?B?cUM1ZU5rRkpYWURkYWNHQWVhYkxaZ0NsVVhWR091K1grNXIzQmp3VHVscmRh?=
 =?utf-8?B?Nll4dWd5Zldnd1luTk1IeHpLeklTRDdmNmJiVmFDK1pFQ0N0L1RUVGtmZE1T?=
 =?utf-8?B?ZDRXRDYvQ2ZIUTZvNVV6MnlSUGluZ3pOT0xaWEV1RnNQdWJwVnNvbGIzVk1C?=
 =?utf-8?B?Uy9obzVScTVGTEFPd2FmSG1SeVlXM20yTmsyQTdXT0U1K0dFTks1dy8wRUFE?=
 =?utf-8?B?WHFDNDJQcllkYlZFS0tOazFCWUxjdTZIZlEwQnFsd3FXQW5MRXl5VWhVNVBV?=
 =?utf-8?B?endQc1JlMlFtZm9XSHZiMXNjbEtqdHY4WnpOZm5OTlJoYmZZcGdiZXI2VTJu?=
 =?utf-8?B?N0s4QlJkaStXMFNFbVJ4Vm4wcUhVWm5XSTh1NVJmTjhGQWNlOExvYlBxTTVu?=
 =?utf-8?B?REViZjRpekdKSUtjczVpWVgvRlpYV2tVM1dmdHE2dFhVb0dFUi8wQ2hXUUZB?=
 =?utf-8?B?L3pzM2dncmt1UVRxU09zaWNnTzJocTZhSERrc1VQUkZ6S2NNRHR0SjNMU2d1?=
 =?utf-8?B?RE0zTjZXbTlkbTM5VllCL3QvZk9GaEVuaW5leGw4VzF4VmNiSk83WGRKd3da?=
 =?utf-8?B?WEM2endJWUs5a3d5ek15V3NlVlpRRzdKN1FUSUR5TlR1LzNmY0xVODlhcjlv?=
 =?utf-8?B?WFJhLzRXSDJsN3lVdnBtOURCc2tqVmp2cjFoMkluV001KzlnbXRzSjFUVFlI?=
 =?utf-8?B?d1NFOHlxaXhNMjBzUEY3cDhLN21WNXR0eFFpdkQ0MGRoS2VXbGcxRGxTOXFH?=
 =?utf-8?B?N092QmtPYWhHNmlSZDBKWWMrbVZ1dFRZeUhyWG8xdDVxbVBnK0NCTHhpdG12?=
 =?utf-8?B?VGxYSnhLdEpvbkRha3lVSFRKNGwrVmMxT3ZZM3Ard2VGdW9XUEhVS3RTempT?=
 =?utf-8?B?WnYyVSt0ZExGLy9Bc0tsWWlkRHBTSWJIOTZ2dU9QQVRqTmkzUElQNWNDbFRs?=
 =?utf-8?B?TEI5Uy9FOHVIb2U0SEtveTF5ZG41cjRVaG9MS1QveXFZRkNDVzlQRk9ueXhv?=
 =?utf-8?B?ejYzZEFKTjNNcVN3SFBCV3VyYjRkN2d0dlp3Ukl6NUl1L1UyeTFmZlA0STNj?=
 =?utf-8?B?djhmaHhrdys2UU4zcE90SGZoM0RBZmtuR3F2MEwwQnpsa1g1MzdWZWlXRFM5?=
 =?utf-8?B?NitJcmZkTEh0c2Jsc3JZV0kzN05pU2VJcHhTSFM3MmpDWXFmek9QL0RUOHd3?=
 =?utf-8?B?OEppZHFjMWpJR2pVZjF6VHlvRXhzSnJCNTBpTGZKZ1lWU1pwc2ZFVFFtd2dr?=
 =?utf-8?B?R2c5TVBsS1ZLd2xyNHpMekVJdkV1RjNFclNmQXpvUURWeW5MeTlpRU9qbjdu?=
 =?utf-8?B?Q0VueTlFaWs4N3lLdXZ2RmdoeU50dGpHQXRGbS8ycjRLUlNzZ2c5Yk92Rk5Y?=
 =?utf-8?B?M3FaV2wyZlRmTEllQ0xRbFJiWW9Vck9neTUrcmhkT1hrYXpEckh4enJ2MnMz?=
 =?utf-8?B?dzluVjlnUU13PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3461.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckZ4aTUrYk45dUZXUmNTYUJvcXNFakYvTXUrWFVSNWIrZHZ6eE1Dd3dLa0lw?=
 =?utf-8?B?RDlucUNoQ0pweWR3US9vUEE5dUxsZ3h3RVUwTHQ0bU9kK3RteVAzRFhRcVhS?=
 =?utf-8?B?bmNkUDBGakNkcmFiTCtydFJ1Yk5jZTZlZEpjaFpVUDJaNFlYWjNOOHhFUFVQ?=
 =?utf-8?B?YU96eG9wL1hyRlJVNitoZ2xuYlU3dlViQjBrVTdwLzZ3aDRzdTFXSU8vcytt?=
 =?utf-8?B?alI4eGcvMHRsNUc2TVFER05uY09aMlRqRUQ1MTFkUHlWTGR0K0RXRlhrNUVP?=
 =?utf-8?B?WEN3VEI1VTgyT3lYKzYrRFErMVgvbWt5aEVrR1BnYjJrZnlpK0VSaVE1NDVP?=
 =?utf-8?B?M1VrMFo3OEFKUUx2dFo0WlVMa1dHZG1DQUNyd0Q0Qkh4ZThSbHlKQ2J2VFZk?=
 =?utf-8?B?YlNtWGNPU2Jtci93L3VRcnpyYklLY0tXT0N5NzdJcFhJck5OSGt2UTF4VHlP?=
 =?utf-8?B?MDZKdnVhd3Z2bVRMemVvZnpUTCttSjBqN3B1c2dHTm1hZHU1SFNZZy96WHNC?=
 =?utf-8?B?aHU3TWo4clJSVzAzZCt6alJ6UlhHMDBja29FckxyN05tc3NXNmIwK0l1U1RN?=
 =?utf-8?B?eFV6RWowTVp2SVJmdk1EY1l1M1liV2o1UkkyMUM1UWwzbFFRRmdwTm9QUlVQ?=
 =?utf-8?B?MTgwSktBWTkyL0lZN3NBbkdmRk1XQmloK29TdjhsZXJGNGlXK2dmYUlnT1NP?=
 =?utf-8?B?ZkJHL09ncXBleHd0dWpPN3pJODZUTko4VllSUE9rWlFUcE9RYXpGeEdUQnpV?=
 =?utf-8?B?Z0JiOXRDMVNHdklhb3Jma0RMSGVKbjJ5K3hUK0RneW52eUVOVHQ4eUxySmRS?=
 =?utf-8?B?VjhxK1JDd1paQlpPZGVFL1hMeUV6cjlFbUpaMjNwMGh1aHI0a0hYUlNDVzE4?=
 =?utf-8?B?M1dRUVN5RUJYc3BWWUlCZENzQkRiU3Y2Q3loNFB3M1p6bm1ueGVSSG5iZnVX?=
 =?utf-8?B?SFN5TWZ6em9RdHJFUFNRR0RqUmsycFZXcnV0bGxCdFhtTi9URWxCaDRBZzdy?=
 =?utf-8?B?ckFtMS9jOU5aY0crNEwvQUFvYkRSR29xYnh3azdIY1ZpOWNJRnRxb2JzR212?=
 =?utf-8?B?NjRpL3FBMGlwUkladDhFeDgvK0pBM1BOVnFCNUlKdGsxVUpqQTdOOHJHQ2I0?=
 =?utf-8?B?VjE5THVjTk1FZ3hmY0hIY21KMGJjMlcydlcrMHY1SnNVc2l0a01lVERGdTNk?=
 =?utf-8?B?bDFhVUlONWkxOUpleEZBRmNRRzRwWkN3akZPSjJUK0VlY1NMRHBoMGU2MHl2?=
 =?utf-8?B?ZHQrTGVJK0J6ajhGTTNOdEw2bkFzemhWclZ0L1E0K0x6amExVnlQMzhmRVZt?=
 =?utf-8?B?dXBXMlliSFVCM01BVTZTNWR3L1N1YW9pTkdPTUJ2VlloYWRKelJLVGdOS1A1?=
 =?utf-8?B?UytmOC8zRXE0dndIMlVtSTAwTUQyeFFNWGVMZ0xLZ2R1SWZkbXpVKzZrTjZO?=
 =?utf-8?B?S3oyZjZ2d1QxQTA2cmNPS1RBMG40b1lEempHcmEvYXQ1cEdGZGdldjNXRFds?=
 =?utf-8?B?N2MyN01FV2hWcWlkR2R5QVlLMEk5SGZHY3RrREp0M2tCUTFlYnZhY29kbEJR?=
 =?utf-8?B?ZWx6VTIwL1l3cnZrNGM2aVNsNGFXL3R0TDhqTGVsbGNyL010amtaZGUxU0Fs?=
 =?utf-8?B?V1IwV1I1UnQ3L1pRRWd6cUpBY2lHN3g2L3BOU01NNjVMMEVjcTluUlhrdHFY?=
 =?utf-8?B?akNkRmJWQm9nZ2Q4Wnpqa1llb1Rkbmg1bEJObGlxdVVLU3dhc0sxblFVMDBu?=
 =?utf-8?B?YmcvV0xLU09qSG1vVk1OSFhrM0xVNnV5VFJBU01nNTlkMU1pbXhRSkpVbDdF?=
 =?utf-8?B?SHRVNk5TdlBTeGFzeDl1a3locFRSM0lJY0dpRnhPdjNxU1p5cmNHR3BiUzhJ?=
 =?utf-8?B?dnRkSGJKV0ZDb1dOL0hOZkpiVW14enlkbE1rb3lvK3pReWdkZ2dqYUNYTnM0?=
 =?utf-8?B?cWNMc0lQbzRIVlFUZ09uNm1GY1prVWQvaytkUGZiZWt4YlJnWHYrUjU2Q1JZ?=
 =?utf-8?B?ZHlDNkpNckhGbWdZWkt2NFovUnRUVXphUzBpUmxEdDZsWDN5Qk5iYzJENlZ6?=
 =?utf-8?B?MjNkSmdlbVAwdVNPaGJRZmNTRU9KQkh0dkh5bXZ3RXR6ZzdSMk84Tyt2Y1lH?=
 =?utf-8?B?aXFNbVErYUhPcC80bFRNa2lmMGFRZ2ZFSmdCS2xZZU5hK1RNMUpBd2J0cmNv?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f9e7c7-e064-4c8a-10b7-08ddbf374d78
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 22:24:00.2285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0Y4TkOFJnLPPc0Rb0lqEoTkkYJlmTpMWoXUJWF8/Jx46ObAPcSohKGtEj0QWNKbryEiN9InlLsxuEDY4O5dkok+YxFVtDnbjzWytvYJJqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5866
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_152412_175334_D0A8332E 
X-CRM114-Status: GOOD (  18.41  )
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



On 7/8/25 11:54 PM, Krzysztof Kozlowski wrote:
> On 07/07/2025 17:44, Matthew Gerlach wrote:
> > Add missing 'minItems: 1' to iommus property of the Altera SOCFPGA SoC
> > implementation of the Synopsys DWMAC.
>
> Why? Explain why you are doing thing, not what you are doing. What is
> obvious which makes entire two-line commit msg redundant and useless.
This conversion to yaml was a merge of two separate conversions from 
Ding Nguyen and myself plus some resolved issues highlighted by Rob 
Herring, but I missed the minItems:

https://lore.kernel.org/lkml/20250626234816.GB1398428-robh@kernel.org/

>
> Original binding had no iommus and referenced commit does not explain
> why they appeared during conversion in the first place.
The text version of the binding was created before the device trees for 
the Agilex family, which do support iommus, were accepted into the kernel.
>
> > 
> > Fixes: 6d359cf464f4 ("dt-bindings: net: Convert socfpga-dwmac bindings to yaml")
> > Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> > ---
> >  Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> > index c5d8dfe5b801..ec34daff2aa0 100644
> > --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> > @@ -59,6 +59,7 @@ properties:
> >        - const: ptp_ref
> >  
> >    iommus:
> > +    minItems: 1
> >      maxItems: 2
>
> Why this has to be flexible on given SoC? This is weird. Same hardware
> differs somehow?
Dinh can you comment on this binding from 
https://lore.kernel.org/all/20250624191549.474686-1-dinguyen@kernel.org/?

>
> Best regards,
> Krzysztof


