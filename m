Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EAAD132A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WvkfngB4XoL3a3/y5Nbuy6d6xgsrNa9eoK/eIag7oHI=; b=CnrwxWLKOM7NEfEBJFgTlpetOW
	HtZy76SqPw/04pQJbgGNl2LdfFurdGgf6fAUY1yfkWiS5HmL07CyUxv2XLgZwpsFZWa+8dGx7dBni
	G5mKN5oh2gyJECDZcQrMzSz2qGFfNZ+gx2iQcCZfxaIENal+UBa+TYNd3Csno/pynGmrAvrxz9zrs
	M0uvhmUHKhZxRz0ZzD3+GOQgAV0/C4J6BFAuO40IjePOBEBZ0avcdA0lNDH45Mm4oB92ohaOwio8p
	qL4uGXYGB8Mq81SqDZ4Au+hx6WUbAV2m0uKBIZ3KGEdQm4PrtklyAXud09gvHmDFFSk92oHoO4DN2
	M14fCqKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7u1l-0000000DGgJ-2wAp;
	Mon, 04 Nov 2024 10:09:41 +0000
Received: from mail-am7eur03on20603.outbound.protection.outlook.com ([2a01:111:f403:260e::603] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ttI-0000000DF3z-3TJi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 10:00:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVrAYYuFB88H6WOfRsX2sGn60xvQANv+LCijKdFACMFZpGtiLXqDbNFx+kdPexfiX8XMchtOhadB3bTObvc5sQMCxN3N7BobK0XKfAfwsKwnEyZZC8EcbeXB2kgtPbogw/MJqdJ3wlEREpJ0kQs9ILYpW2JhqP8e7i1O5HVN/aelWMPg8eUkYaYwGO8xXowd7ZBJbgUzCGJh70tjuRFelxnoHmuTAIZhPvkX67jGVb/6MJlbBDN3imIoSoSLlYloWnouf0A6Aoe4YcH8YPtoV9PO6t4R6Bt/xbeVv3xW/K/qO9K01X6dfE2+GKUubDWPlq3fhnpjyRH6BHOQQw/Vng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvkfngB4XoL3a3/y5Nbuy6d6xgsrNa9eoK/eIag7oHI=;
 b=qFBcaxr/PygSoTNzWVCtC9+u6vBId2nbu19FsYJt8SIg50/rDKPg9aiXSHeuCcxYBdSboM3wXYu7jPshoMJ4i/WWosbz0hjmpji71bLXWNINJYwd9BBhhXkFHgV3LYovJU0TCi6qBg+ieu3QBQiRfhWkMZbV/yItsIGxvtgaZgCXxW4eCYPEEWc8aY3MiNcYVSQ2m3/CaXvrdZPKqH3woCraiuVoC7Oy3HMRZQAHC5zgk/IqyrJPsXi/6ry5gQWmMUxCdR+a1KRjOcVGye8lbCmZeNy4Jz45QXeiqQR1QZLVrsHU5UfMXLnNwd692GLwbTDiUorKPHSV0mc386M0bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvkfngB4XoL3a3/y5Nbuy6d6xgsrNa9eoK/eIag7oHI=;
 b=lksUewncL9V2DhnOUhP2GO2P8jSEo0iWLKlXRDaHGCmot37IbiAXwGaADkQc/wVuY6KNeeDYAHPZlB6xPR9cRA2GXC80i/oT6Xklobmmzg5gMXRJoVLXGVHtohTDZfeoRyIMOlmk+d+o3Vd+CUxcAzVvP5oKiwM/fFZ5sBQr3KZmRn9CNaGoFC/A4tFWRK8ANN9SEYOtKP9+Wugh194p8fQgk1i3lVCiTAbb+Oc7sNmH6OQY5360A7IjXnxbmY6fXubGZRc9RKDI+jZ5Eq5nRm5gCKZZkzqg6dhNu7zF+MhFLXkApgMzsO39JCkRnWpgj0/I2U1FiEhjw3K0vXsoIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB9229.eurprd04.prod.outlook.com (2603:10a6:102:2bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 10:00:49 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 10:00:48 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH 0/2] add I2C support for S32G2/S32G3 SoCs
Date: Mon,  4 Nov 2024 12:00:42 +0200
Message-ID: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::13) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ba7804-76d3-4598-e9a4-08dcfcb78ee0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDU4VHl5V3pRcFZMM1VIc0lheXJ4a0xOSHVMNzdUMCtVT0IxOEZSSWlXMXBZ?=
 =?utf-8?B?RkdVMnllcnpjTUkwWFlJNENqVGJTUnh2SFROYm56SnBDSWErTUwxdDNPSDhI?=
 =?utf-8?B?QnpnbTBaMG1pcG93VjEyV3IxZVFwZ2VqL2xIZVN0YU9mcUVvYVM2Z01qNG01?=
 =?utf-8?B?U0doVmJMMnE3YjFGOW5BUFdUSmYvVXR2cUdHOERENlEwcVpyb3ZZMUdST0VD?=
 =?utf-8?B?cyt6SzRaMWhsVE5oT3Q4blFyYTJqSDNMTmRvUXV6YzNlZGRiQXl5RmUxRUlS?=
 =?utf-8?B?Vk03UnlSS1B5cTVITlF1M1B4dkM5MHRFeUxDMCtieXJ2SjhjZS8xZEZPVDhP?=
 =?utf-8?B?cE13a0pZU0FSKzRtWVFSa3ZvQURqQVZOSkIya1lWQlRDWkFJNDh2dzFPSUNv?=
 =?utf-8?B?Q3dPODdiUEtVV1BmUW1NK1dzWmhqaU9DWURIdjUySFVYOFFFd05hdFJwVktn?=
 =?utf-8?B?Sno2VjJncXppK3puR0ppK0JEM3lnSHlSSnpjWWFJcnB2WnZVVTFCMW9sRVV6?=
 =?utf-8?B?YkxjVDhNU3dwU1lCQTExVHlXNnpHYXIrQlcrWDJwdFZWanBRQmxmalM0eDFZ?=
 =?utf-8?B?c3dkQktGMjhDMWMrMG4ySjNiN1RyUzMrZStqbS9CMTk4Q0UxaWlBY2xhUmRR?=
 =?utf-8?B?Ym42S2tEVjJ1MW85QTFzcElaVFA4THQ4T2J3d2txK0lYWGNHZi92SSszejFP?=
 =?utf-8?B?a2lPZXNERWJZZkV4UDdOaW9zL053UWtrdnQ3bEZiNGJUSENSdmZKUkdPMmhh?=
 =?utf-8?B?a0RNRGJ1cDJETGkwY20vdENhN2dWR3B3WEJ6WFF3eEpGeFM5Q2tHSkdQTmIv?=
 =?utf-8?B?RGJzMENlRk4ydFNENmdOQnkrU1l4Y3dhejBtdFE1OUttc2haMk9tdjNjUURl?=
 =?utf-8?B?enVLU3BScjIydGQwOEREY3hSckFuWVRoV3pGVWdza0lDMVNhOWozV0RHaytv?=
 =?utf-8?B?SDZuakVDZ0E3bkh3bmZ0c211Qk5UYW1TaERzYkJ1dHgvOGJHOTJzdFBaTDVL?=
 =?utf-8?B?SGRWcmxuVkVhdG4zejYrQlhLdGZYYmNsOGxHemJHemtwNTJsOU1IeWY5ajY4?=
 =?utf-8?B?aDBnbkorbXlGY3p1OHdSajlrc1p5dmhNdDNxU2FtV1gvM0VqMHNYdVlZL0I1?=
 =?utf-8?B?YVBvMFlFbE5UTXQ2UUEzQ3lINzdXeFJrdlozRHVBYi80UndORWxpZHFLNFJN?=
 =?utf-8?B?SG8vbmNxZ3NNYzVOamhnY0xkbWRIUVZGc1pnNWRCbVI2TG5WRDNwNlhPMXIx?=
 =?utf-8?B?MlRtNUF4L1RmN0MzV1dGRUUxL1FvbkpoTjRJemRPaVZqT3lBZUxaNVVqenVs?=
 =?utf-8?B?cVpSOHY2VmYxanFIUEdkcTAzaklVR045TDUrN3MvQVRUT2pURWZSSUtIM0Z2?=
 =?utf-8?B?dlV4YnNUMlJHSERFbWJBYmF5RVVuT25VZWtZWHdLbnl2Mm9qOWM1eC9MWDRF?=
 =?utf-8?B?NmQ2MlV6QXdtOXlwWFFVbXA4V1VkL2tvRDluaEt1QlVGMVhPaThDMnhqQ0dl?=
 =?utf-8?B?S3phaGx1VjhlR1JGejBYTU0reHdKbWsxSWl0ZHRzZU9ValhGYXJaYTY0UGF3?=
 =?utf-8?B?UHVoVC8xeDkrN0ZkdStmNHZWa2VuVnM3UDV2am45enZYWHErT0FFQy9zSmJT?=
 =?utf-8?B?V1ZYcHV4b1JYUWQ0QlgyRVJpSEZCOTNZeWRzNjFLY3cxcndLMEFVYmF3cVFX?=
 =?utf-8?B?UlFpNFpRcU53UytrM2N1UThKVWFzcnkxSUxHYVkxcVQvMkMraUI2WjVMYzNW?=
 =?utf-8?Q?Bxo5AYxa7CDzm2YF3A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUFQeGNUN0w5WTRzK21yN3hCUTdXSDBMRkRRWFhTTUpoMHZLTFRacUFaN2NF?=
 =?utf-8?B?TnlFd3F2cG8xcTRjMStQODNQYnZFUmNwQ3ZLWE1MRWMvMlBZK0t6dTF0V24w?=
 =?utf-8?B?UTA5bmp3WHpFVEFPM0k1NW5HekNDcUxWaGxaYlB1TGR0SU1OS3Rzc2tVUDYy?=
 =?utf-8?B?SjR3MGFzNXpCOTVkUEdGZFdIM3pCckYzSXF4OVJpTndKNlk2R1Vtd0lNcVc3?=
 =?utf-8?B?RWhpdU8yaS9UK3hYQTNnc3dGZnYwL2dRSS9UdS9EbkRvZm51L2hMQXFUNEJv?=
 =?utf-8?B?UytXS3pLd0NrVGpxK2tMRElVdTVBL3ptYTdZL1Fqa3hzRDlPZGZJTVhoSkRQ?=
 =?utf-8?B?d1RVUmpRRkt1WG0vM1NDTzFoaWsxeHlWSkxFcGhSUE1xYXpTZkk3ZDRsWERl?=
 =?utf-8?B?S3YxTk4wT3RVWHlsUW0xemViY0RJODJEWnphaXVCeW5rY00wRVdLVDZqSlo3?=
 =?utf-8?B?Q3pEQ0RaY1JLSERud0k1YkVFT0xyY3diaDR5MTFYSiszT0E2RkUvQXJ3TUFr?=
 =?utf-8?B?aVhqOGd6V0JQUTc2WXB3WU9WRndaRzRMS1JhWSt0TWpnb0hSeUdHb0drd0tZ?=
 =?utf-8?B?VUFFMFA4WEViVEFjamIrU0U3dmlmZHRzTW9IM2NGdTJjZVJDekdnT2NUcUhi?=
 =?utf-8?B?SjFVTVBIenRrVW9uR3l1aXc0UlZvTVlvRU4reENhSEhoRmJOSzh4YlpmTmJu?=
 =?utf-8?B?SzcrK3JPRzBQQkIzZnpMbEtUSXZtb3dvVk1RRnpPMGR0UnR3Z2l0RFJaOERV?=
 =?utf-8?B?dlBpdDZ5R3BsR1A1R29DZ2ZETHBBK25MZXhIWFUwYUY4QXg0UE0vWVY1L3Fy?=
 =?utf-8?B?KzVKZXZ1b3NXbkRCTlRzTEY1WjR5bEcwZVQzZmEvd08wWWNSTU1KVkhyblk4?=
 =?utf-8?B?K0QyTjZxQVJoSEJ6M2RKbmozQzhrTytFTVlqWEdIMFJScThQeHVPS1NDUks2?=
 =?utf-8?B?VnlDN0FJaGNndnFlcFBidHFxMXU3ZXFBdDczWVRKdXhRVEwvOUtVZFVJcTVS?=
 =?utf-8?B?MkhSVW4wTUp0SVFmMmZhVlN0akpleW41L1VSaFVLVzZUdE9zYjE0TGRtZGoy?=
 =?utf-8?B?VHRmY3VTQXFaNzBGU292dERNTlJEUXh6NmYzRkZiUmNnbzUvNDJEeGNrTE5l?=
 =?utf-8?B?NlREWmZRU1RuUVA1bTdHdlFSWENIVGlMS3BQMDAwTWNpYUNqOTB5THVvNHZo?=
 =?utf-8?B?cUhGc0FBVjU4QkVOaGZUdlhIampUK3dzOENWV3NBYllyeWR3K0d4Y1FLZnh5?=
 =?utf-8?B?THdJRkM2S3YwU0NscGNDcDNCNU1zTDJxdm1ueGRwUFdOUDNJQWRacTRZVFBW?=
 =?utf-8?B?bnJtS0JOQ2xhTjlSaUlLUjhiZmNadk1qWjY1eUt6UU0rdkRFZmVoUEZOamRr?=
 =?utf-8?B?eHZxUEZJUi91b2pUbGxISGdtN1FNWXhxWmUrSHR4ZUk4elpEMnhrUnhxbFlF?=
 =?utf-8?B?aWt2QmRXSXlPMG9KRlYzYnlxVlZrL096b2RZMkE4TDNIemJWeDZBay9YUkZ3?=
 =?utf-8?B?RGY5Y2FMbU9SRjllTUorOXUvemRMcXpqNWhnWHR3WWZZakFXMXdPWllhV0p1?=
 =?utf-8?B?MG12OHh3MEVYa0hRZFJTTDU5WGtCbys3aVFKMmZ6ZUZyM2tlZlFIeHc4S3JV?=
 =?utf-8?B?dCtHYXpjSUQ1MVlORVcyb2ZjcU0rVXRmTDhlMy96UnQ5aXczczE5NUhsVkVj?=
 =?utf-8?B?S1NRbmp6OXJEenF0cjZSV2hVUWlFYnc2dXVzZzlkV1pxYWRSY3E1bFZvSFdQ?=
 =?utf-8?B?bTdmZ2FKRTkvRVl5VWtZaWZKVzdhUytwTFBMVHlVbDFtcXowS1Vzc0phYjdX?=
 =?utf-8?B?eWtFM1FpTzdGSjRZRG5XQzl4UGh0YitkelVLUDVYbEZSbVh5UEdGbjB1RTVR?=
 =?utf-8?B?T3BldkFWalpFRGJhZlZEeDN4c09RNFR2cklpYlhUeWhQbGFjdlh0VFN3ZitS?=
 =?utf-8?B?RkxXdGxzV0FjQ0RPTTBCa3RDSVRsN1NITlRoRFFlaXk4bnp4cmhvSFV1T2VF?=
 =?utf-8?B?SU5tWUp1cVlrSnhub0VKRVEweGVLUW50ajZraEFtYmkrcXhsamZ4d0dneW9V?=
 =?utf-8?B?dGkzVFBSZnFwYTJmSldCVXNHL2tXN0FSNVZQMnM2Q2UxVTFMZUkyd1BVbXJI?=
 =?utf-8?B?b2JqYzVrRFZrUzFPLy9RUld5aEIybmg0VXo5RW5qSW0rQU5vdnczV21RTURa?=
 =?utf-8?B?bkE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ba7804-76d3-4598-e9a4-08dcfcb78ee0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 10:00:48.8831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSxGdVLYjuFTFRXP4yh71alDX6rcBQtgQ+0fsLbVwoP42JMHNFf9iaZuv9fMQiVmrCwVLr1akmsJS4Nt6APeAtBr9ocwfcK/JeySnB+VHxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_020056_908378_6FE69972 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

S32G2 and S32G3 SoCs share the same I2C controller as i.MX.

Address the hardware particularities for S32 SoC family,
such as:
- different <clock divider, register value> pairs
- regshift

Ciprian Marian Costea (2):
  dt-bindings: i2c: imx: add SoC specific compatible strings for S32G
  i2c: imx: add support for S32G2/S32G3 SoCs

 .../devicetree/bindings/i2c/i2c-imx.yaml      |  4 ++
 drivers/i2c/busses/Kconfig                    |  7 ++--
 drivers/i2c/busses/i2c-imx.c                  | 37 ++++++++++++++++++-
 3 files changed, 44 insertions(+), 4 deletions(-)

-- 
2.45.2


