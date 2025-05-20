Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADA9C54754
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 03:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVoy5wPmZ4TYfzXQ5DsegzqV+JTmGyRKf6B2xcBjK+s=; b=2yJBDZbaJShpnPLmPEJsUc5F4b
	KK6scws4wM7DsDfQqM8IYO1pSGeQyecBSVNyYGe/0CTz3vmcVPCTfZMOpOaV+Zoz546vxrB+WTx6a
	y5c6pDiA0hSE8DGyPBcjp26/IcNYvI66VBrnkpXBMveKTVAGhrPgwdJBMdip9Dd2ioWjvE3bou/Bl
	vySW60dIOtDcjuBbUEihsmtY/C/4qKAhKF9ZTqZAlDTr+b8koEk7sAP0hT4GLxJW6wl3+qvcBsEm0
	tjzpAyH50WFw+lMUiaeiTTyurlNH3h0AlMbeOrrT5fk0KEXiZ+okNUAHWb3ZlIzMlUZSOLezScdSQ
	mJ90Wa0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHDFK-0000000BOWE-3eXq;
	Tue, 20 May 2025 03:02:26 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHDD6-0000000BO8h-0aXN;
	Tue, 20 May 2025 03:00:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTqw4Lwi8GKD8008JORHbuobqGajyPs/r09e4KC2KV94JCdBkQMXlPYyEDe1jOueQpTs9yCX3p0bgF2B1SC+qimipc1O8guMk7rM42DqLu0aCfTtsAgx7Va5idq4XPHfumxuA6snxk7fYgOH7wTL0Y/4tEOQXRZbEZglnL4tBCcyJiRczjETLoZejgeZmB7L6HlL23ZkVZoLLmFAjGxQulJxJKAcIM77JyU+g6ay3Lg7jZbkyuXjdmhjfl8Zme2zN9n1lu1qJrIGeFFRyC//wa/4qKBb2W0t4cDxl9XcEswwT4jnkCUvcNhW8cP4bYCAPy5wHd5DQwDZL5TnJCcX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVoy5wPmZ4TYfzXQ5DsegzqV+JTmGyRKf6B2xcBjK+s=;
 b=S6PTPcAdhwc7vqeZjs18wt2sxuGJrMuWsmohdLjefL/st2lrBtY9sBHHp4oPwSiRa8TUgXRhxUhAJjeAa9YGvkOTR252bTX8g1WbOEhBhvCiSMvczBm+6QrBAMawRfJBIi9YKfoWhEFExpHO2cxeUCOOLbYzWoXjwpe3u6LCqT+HimaEWYQxQngc+HfwxveAnlou3/F0F08EbWqbH3S9J15hZGX/BHVWIGRnJOBuKsdyeZcBct7z/TlulFvr0UdvtTdEFsVf4mMvzBmcvsIv0WPDa+AcdLbRJwsQ6QvSSJTF0ae/TX4VZsLx/Q677D8lHGT40aRIuCiN7OkWeE74bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fibocom.com; dmarc=pass action=none header.from=fibocom.com;
 dkim=pass header.d=fibocom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fibocomcorp.onmicrosoft.com; s=selector1-fibocomcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVoy5wPmZ4TYfzXQ5DsegzqV+JTmGyRKf6B2xcBjK+s=;
 b=KpHu09Ie+EscI6djJpWw1JdUS6Om+zwrbzPOP+ivoKp2MnJnirpdk6zeiqftNMLA4TmMnO72wqTeBduZ3ZLgttL4d21fR7CbuP3uSYMxzj3qt0KbDuoM7gDiAFpWNs2VQFnm9mum1rNHzEs3UDpGbV/yk2+4LIa2bsxbnf6oyrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fibocom.com;
Received: from TY0PR02MB5766.apcprd02.prod.outlook.com (2603:1096:400:1b5::6)
 by SEZPR02MB6410.apcprd02.prod.outlook.com (2603:1096:101:12a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 02:59:47 +0000
Received: from TY0PR02MB5766.apcprd02.prod.outlook.com
 ([fe80::f53d:47b:3b04:9a8b]) by TY0PR02MB5766.apcprd02.prod.outlook.com
 ([fe80::f53d:47b:3b04:9a8b%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 02:59:47 +0000
From: Jinjian Song <jinjian.song@fibocom.com>
To: kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com,
	chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	corbet@lwn.net,
	danielwinkler@google.com,
	davem@davemloft.net,
	edumazet@google.com,
	haijun.liu@mediatek.com,
	helgaas@kernel.org,
	horms@kernel.org,
	jinjian.song@fibocom.com,
	johannes@sipsolutions.net,
	korneld@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	loic.poulain@linaro.org,
	m.chetan.kumar@linux.intel.com,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rafael.wang@fibocom.com,
	ricardo.martinez@linux.intel.com,
	ryazanov.s.a@gmail.com
Subject: Re: [net-next v1] net: wwan: t7xx: Parameterize data plane RX BAT and FAG count
Date: Tue, 20 May 2025 10:59:34 +0800
Message-ID: <20250516084320.66998caf@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516084320.66998caf@kernel.org>
References: <20250514104728.10869-1-jinjian.song@fibocom.com> <20250515180858.2568d930@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::10) To TY0PR02MB5766.apcprd02.prod.outlook.com
 (2603:1096:400:1b5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR02MB5766:EE_|SEZPR02MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a23eda-2558-4edb-ad5c-08dd974a60d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|4022899009|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9u901OPDmZpmx3z20C7ZvN7TpiVkuuytul3VEgORu/oxgRDnkg+KIgqchzl4?=
 =?us-ascii?Q?d+pKBXCCArGv4K6clB98RHfJJetw4O28FLsjc9Lbcumib2NwxEXdkdXFtS+3?=
 =?us-ascii?Q?KEmDs22jryvJ3wmCrj0OLMeJWpDm7St3TnIAFUeZ6mPT9yrSZDP4mEt4XnrS?=
 =?us-ascii?Q?uuq00PPsUocdOsAcCEkp4c4UNpo0q2B1qMgTUTDXHMzSyOdjqY1UjAaYEVqr?=
 =?us-ascii?Q?ozJ1VLF94lnEazu+98mvKVg208qMJm/yZEyvfIlekQKxLs9kkUV9oTb/fhDC?=
 =?us-ascii?Q?qwjmnzoqiZbPB8vcS0O1iBnN19NXBeVdr6Z9bWQai96jojcsg7bd3gOgAERG?=
 =?us-ascii?Q?v3SdblpQ2fUI/Ok5A8dhkxxi2y0sAYFgrApDlpxBcdrb2KT9UU29knBXLApE?=
 =?us-ascii?Q?8oa4SkKrKNjeoNcpDnxQPKGtkjqXewzQtxH9bBoLyGuTfece+NUUEG4LWotc?=
 =?us-ascii?Q?lpRUyAGFyH1aVdWEnFLnWNWh3SsKul6Dfa6m298BGgEkkY/2sWFgNYewWU/Z?=
 =?us-ascii?Q?eR21mnOGPlZ94WYv96ANsw9zpUHKHFNMwwFLphJVRWBmik/fjE7d048sKo5R?=
 =?us-ascii?Q?5SqrTDoPedBtpwF58CBpVEsS6MWYNRv8fcHoMj4LzBKTvaRNvDPLGYsyshSc?=
 =?us-ascii?Q?Avplii3eZUK1kG7sigJmjfE+4dTAN4OwNRRen9xLwy7wHRmXSY3zvjLxxUCD?=
 =?us-ascii?Q?5YTRTidr34QfTgxgJ9bKd05BPZ2HM1g5y6fPOLIUOMlFsv82M/afhK9Kt8Ol?=
 =?us-ascii?Q?Po31n+Jw3ElUesaowD5jZl4FoqWnakYgYUXgk3eCFbwvPrZQvCtRC7KUZ/6K?=
 =?us-ascii?Q?MDjnR/NJpox6fsNkJqOgojg5aezRI8FLwt9OuToQUgJPtkuOiH6BPRGXD2Bu?=
 =?us-ascii?Q?0gqQY00Z4r5lPR7TSmaQKODmPAlR3G1CY1LQsAhcIeDU72X9l1eku5QkcHmT?=
 =?us-ascii?Q?Wxmv566VfuGheBuInt/LtnLFmuGtnI6JKW0SfV8ltJHtIpZIOfh9Pi72XHhe?=
 =?us-ascii?Q?yuMG3AF/NmUWMWDFmMngZWrgkpIobROFqVIrwE2axNc4maWs715FI7fAASa4?=
 =?us-ascii?Q?u/BZsLWVrSPzm0r8A9Yx1FxDptRRq1WQPV38wGAtULf2RJys/cHtbAFvJw4Y?=
 =?us-ascii?Q?NJApfmEpLyTyhOZbhYAcuH+fRL7JsgaU6CQTAdD/Ewzu33CM1PAWAGJYobA9?=
 =?us-ascii?Q?sB2OdrBjBrYt3/wbyYvnuS/ODfUSmiUJ6lKHbTcwfZF5M6ajd0sUBOpHkCzu?=
 =?us-ascii?Q?Barl1xh/p7W/lFD2+oRGAcsuE2QMOlN4X7qO/irSWe7qgeMrzwTZfE7fR14h?=
 =?us-ascii?Q?HRdU4Q9Xnf3Sv9uqqqx61ptylay1BhpwBqrmJH1wiHeqVqgbXt6DJGTna4kc?=
 =?us-ascii?Q?yWp1woFMqMjFPid472N9E29IV+vZ5R6FpuNBNfongXebUx+1tsSBSUgM6GJO?=
 =?us-ascii?Q?FR6AwhiCv44=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR02MB5766.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(4022899009)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j3K2lrJbx7TC9GZny+6reYv2HwoKwJ9e2MrgMXouPt5/6Xh7oNeB1OdLGhhG?=
 =?us-ascii?Q?7VDbFDA0U+1H1qDIJVLhVo2NSoRhlVT/RXPOT0MbyFIvVWGC2pHkq8TcWwU3?=
 =?us-ascii?Q?0156EbZFp/OtuUf+GamTQ9TAA1Tl3BuLCgaeFFJ+iHTRhc2B6BTw9lk1nDHf?=
 =?us-ascii?Q?ReWAIHusnifcCdZVVsBs/2Jxh2ZcUKT1mQz1WyO44YbBmOHHvhzFfW0AG69b?=
 =?us-ascii?Q?OFsJVBPv0evCyQr0dl7OGYLTTTRyEDgjlQAXkqe6FHGQKBV03ZLPuiH95DJY?=
 =?us-ascii?Q?hCLHrq6cF4crV6PgQoe4NZ1pD3JXlEMKZwV6uZrAMloBeExTkkh/ryPxI8ZF?=
 =?us-ascii?Q?3zpCFXmvEAC5NyofEeQH7kWN/y3iPwLw+TwUAcNf3h3O60HNRMxloIX9SA9M?=
 =?us-ascii?Q?bVlZqEnbZLXNK24z2DbviBYzAWu/903MG6EToqNiHa/7t5sKbEu2lTjdvQGH?=
 =?us-ascii?Q?U+GBWOrdSdxqhdyeU2awGypN8OBw+hAydhe75m1tGWG5uUdy3sCViujnggOf?=
 =?us-ascii?Q?XnhpZ3BRtfJpsn7Ud1dFWjnoERdKIPWxDPubdpZ4Mgz9OPO6qgmd8OOsoHTd?=
 =?us-ascii?Q?6NM4jlarfO5p4gCPARQCEwiZ4nH+pE2zJzpRxokPBXGJZ3VNxj8dmYlG0wPz?=
 =?us-ascii?Q?GhdX/lHG3FPeHOVMViLaq8WVTCeVzOkLAX6S8OfOp/CKJ3UvPW0JrhbTjJSE?=
 =?us-ascii?Q?0A+FqGhOhWdyiHoVhL2/EPBmnwOwab2CEZGXuiCvv8QmMX32oXkWKZ4QlN+X?=
 =?us-ascii?Q?myHVxnv1k99vWNmtJe0h29yNs0zQ9uKl0kCymynrboy6MxTujlkejj/ny9+P?=
 =?us-ascii?Q?Y+SeOuDGDdVYmAHGmlSEMWlFoCKMXVAre++T4gJ7po0Tg7u+hpkzg8X+eApS?=
 =?us-ascii?Q?tRFv1q95fof0dWASBN7g8Z4VvtU9nNNePsg3y146VXHwf9/UUFTzQfghFkDb?=
 =?us-ascii?Q?oVJ1EksjnGW2Z4IlpyWQExfg/kvrGAeN/lTDVpmdELUKUE23eLgETfk5dEdd?=
 =?us-ascii?Q?vJBzk5j24VmMeE0yFaOwM9+1pDYNS7RCd+fCv5Z9Df/CgPyCzCCFaK/H6kq9?=
 =?us-ascii?Q?UuaO7FbpzkIcCp/8m41fDNfjRl6sK9F1tVm4tQY1nxKLWo1iZnjIj7QR/CwC?=
 =?us-ascii?Q?w789HyM6u30AZNULLIkCGmLD9BTlTygSAWacY9qcmAgqdeXdhB4Q2fZCGukb?=
 =?us-ascii?Q?r+L0rkkCixfRT9G6aCVyE1Yqs+t9bitmfWNj1iQA8RAY5XNXbBBmUS0zPHQG?=
 =?us-ascii?Q?GwDA7wTTSo8DMzYPHZozUE97RzPL608k3XWv2IVyeIblemFrrZhETjUsoXKH?=
 =?us-ascii?Q?J3SzqvLLXBqRcguDdr/uOGqTdHkA0xCl09hDR+X0XmRg0MYE5a478z2f6r7V?=
 =?us-ascii?Q?x36X3LXJ0hRxC0VXFk2LukdQdUVHJgi1Aon0YImUgfMpS/SN8vrh5IPKQoFV?=
 =?us-ascii?Q?ouRnjY97DUx5ryZkCOyl1aMDHpXIFBzgDsfCDBWwYQbo6c9bqd4eVOxSMLcs?=
 =?us-ascii?Q?jr2k8X3n48SUGJElJgQF8uoIdkl8y/XjyA1w1QUZ5gh+wb7E/d3ThbjuEFt5?=
 =?us-ascii?Q?Xh+3I/GQdlTdoL4D6GoN8KsJiDxuq/aSdruBUMntpsgKZHMAIz47FpNVkjMn?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: fibocom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a23eda-2558-4edb-ad5c-08dd974a60d4
X-MS-Exchange-CrossTenant-AuthSource: TY0PR02MB5766.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 02:59:46.8188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 889bfe61-8c21-436b-bc07-3908050c8236
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55oDUp/Sfqhh7NG/e2zzRXA3+llAGcrPbOvJMkq7qHSjqXXeqjKf1I0tUNGaqet4iHg0tCTofUsvnvltlSfd6OKcWBTgamEnzX5QJ/anKUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB6410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_200008_186345_0AD34904 
X-CRM114-Status: GOOD (  13.92  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Message-ID: <20250520025934.f22GRoQylqZeJah4YriZ5YYy03Cn2wXZOqrpwHuNdmY@z>

>On Fri, 16 May 2025 11:46:57 +0800 Jinjian Song wrote:
>> >Module parameters are discouraged, they are pretty poor as an API since
>> >they apply to all devices in the system. Can you describe what "frg"
>> >and "bat" are ? One of the existing APIs likely covers them.
>> >Please also describe the scope (are they per netdev or some sort of
>> >device level params)?  
>> 
>> MTK t7xx data plane hardware use BAT (Buffer Address Table) and FRG (Fragment) BAT
>> to describle and manager RX buffer, these buffers will apply for a fixed size after
>> the driver probe, and accompany the life cycle of the driver.
>> 
>> On some platforms, especially those that use swiotlb to manager buffers, without
>> changing the buffer pool provided by swiotlb, it's needed to adjust the buffers
>> used by the driver to meet the requirements.
>> So parameterize these buffers applicable to the MTK t7xx driver to facilitate
>> different platforms to work with different configurations. 
>
>Have you looked at
>https://docs.kernel.org/networking/ethtool-netlink.html#rings-set 
>?
>

Hi Jakub,
  Thanks, I've just learned this content.
  I think ETHTOOL_STRINGPARAM is a good summary of the ring parameters and can
be referred to and applied to WWAN. However, it seemes that this can't be configured
when the driver is loaded and requires an application through ioctrl. In addition,
directly using this parameter can't well correspond to the multiple buffer representing
BAT in the t7xx driver.

  If it's not feasible to directly add parameters for configuring this RX buffer(BAT/FAG) to 
the mtk_t7xx driver, would it be allowed to add aparameter for a default configuration 
ratio (1/2, 1/4)? Or is it not recommended to use driver parameters for mtk_t7xx driver.

Thanks,
Best Regards. 

