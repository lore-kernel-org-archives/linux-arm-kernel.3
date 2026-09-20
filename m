Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03892C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 10:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQGkC/0ovBlL7umsVYJQyGtZti8U2xXAnfauLkAmoBI=; b=KCjo435eSOo9J4kpYcNfk4o/iF
	fG/rXzM7Qx4KObcKjlTCIllsFTr4mDIy+An8OWyaVo584jK5XVt3dQIyaiI2+OkHlOCL5rGfi/DAf
	HO2BC2/oEb/ijPENhnreNAmA59aDCPpP1zxw50/ow22TAICWl+HP4BUfFddD0SrC6yvsKrAMgabgB
	0aOMfk3nDV5Jj4T0wbAypZsmlXepX0ZCrSCnDHqES3mZ33dezqzd9L0/vV9IL5qkB/QudIDUSPTbW
	/bep7plrc7DpUO0nClgIrt+YD0du8TtCoGtRxMMJEaAJvC9dT51FXLunMou+pgaISiDL40C6pGhvD
	K8gDzJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ErW-0000000HHBi-3PFk;
	Sun, 20 Sep 2026 10:33:34 +0000
Received: from mail-northeuropeazon11022095.outbound.protection.outlook.com ([52.101.66.95] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ErV-0000000HHBA-11h4;
	Sun, 20 Sep 2026 10:33:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9XffCeCGjrQaERNeq51/YQhIgF9JBsTaxlREiMX/ENzFTSZhrGjwKJdZV8IuVhxDZksr8q/Se/AYc6BhR7aJi9rm2S20EaG1bwKeX/SbAMdlisoh8ZsTeKJBDVt73cK1bNhJLTGrdeRKd70yq3c252NO6GM6wv3WvNoPIteQml4R4gVrjJ5QgQofFQHsjir/xhhHqJDDel0QVW/nIKLHUKA0kRVBWlif7sIwIi9StJ6evx/Yt2KRTaVCtufgfKWq2myFRbHPszXwlqStpOuQenywf20+SsBXcvqPaVteI475joRej6HccQ6yBKTwzHLFGRMwmR8N2jjtcsLyhaROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQGkC/0ovBlL7umsVYJQyGtZti8U2xXAnfauLkAmoBI=;
 b=uaonliWKtYazupdMo1RSdqvGHIN7zV38/QBIE24ZuTBATyQMozPhDc0h9WbReB7WYcWfU+Js9GyjELaKhLQ/aQq0S2VblJUspnWfJ7UfKVS73OsyhCe0Ak8UrV6aVKJKd0J5Ot5UTRikasWQu7cPFooFNUw4Iw96/zOO+09Mf+baDaIaUl36R8p8Hg+G/7+H1X07qt082SyXLq5DO9dIK8IrBThChif8tt7Km4TbnIdnUA6lb86GOAgle+nddQ8AeCAapOn0XQMi4/de3nT61wdbt9kHP5D4UEolzsuUAn7ZLeMRNInU8Tc3QcvmVCBvXhr8owCjK09Lyz58yF4hDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQGkC/0ovBlL7umsVYJQyGtZti8U2xXAnfauLkAmoBI=;
 b=bazHlJy6C5BHmsYcfuf5RHhRm97IxGO/OuyXUkXthp6ikYxfsf4CdfmSLS16X7NHitJ2KlUHrKVlMpH6ff5kMrxqwrsUsPJ07Wu7RT5CAhA4NBkWPa8VFcVhDjZKQPwHvF7CsKYlp67JzyuJOVIsyx1yW/yiMmXseqMtwhGwqJOkaA2xarQb6Gz9/r2U0HXw0jkrK+ocvsENaDZxdr+sHvKfwqxAV8oq6emZWHNlAYZtuOFB+eoVe6MriWxO5JnzL5DBozAuMTAPXoc38YsktwBtAflqWpX+ofVL2tE1DoGuW106bNNQcJQHVdtUmvvYZgbhqzZ6JPaBL3vPKx9Zzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com (2603:10a6:10:2ad::14)
 by VI1PR08MB9958.eurprd08.prod.outlook.com (2603:10a6:800:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Sun, 20 Sep
 2026 10:33:24 +0000
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f]) by DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f%6]) with mapi id 15.21.0451.004; Sun, 20 Sep 2026
 10:33:24 +0000
Message-ID: <4310cd4d-d9e5-4bc4-bdee-7f6f6b3a2409@genexis.eu>
Date: Sun, 20 Sep 2026 12:33:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 7/7] net: dsa: mediatek: support EN751221
 switch
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, linux@armlinux.org.uk, arinc.unal@arinc9.com,
 Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 naseefkm@gmail.com
References: <20260915174643.253660-1-cjd@cjdns.fr>
 <20260915174643.253660-8-cjd@cjdns.fr>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20260915174643.253660-8-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0001DC36.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2ec) To DB9PR08MB6697.eurprd08.prod.outlook.com
 (2603:10a6:10:2ad::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB6697:EE_|VI1PR08MB9958:EE_
X-MS-Office365-Filtering-Correlation-Id: f985d9d3-b415-488f-e6c3-08df17029948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FOke4Q0uXqTJAIlsth7xcSLPBfdWfU8+gqVfzsmFXZF0tSou4i8iHV/pFXsAx3F/BhqgrqefgDzfrUJAwrKE7cR3POvsS9pjzQ9BSK9EHuN8fS4dNgJ0g+Em+qjwLHckfyhxsFPnw4Xu0pMM2833VGzVrENaG8nmj7emYRU6fYUgcLY2USpr7ZkuShA+k8OV2Ig6uBchqN+YNrIC0hwzEHR8zF0cgJ34z+cQ+v6PL8Im+9WjRhCJaUK+CPkLtCxzeZpin8fTcq0YPKiwTSsoBCr5QsTSBG4LQYin4TY+aJX/Xq1DnCu3HdAIFR/MPngY5JHgS977HGEnNdK2oTVuF3nKukUgXvLmLlzUbC9/EhL+s4rAAmDUbZs1p6O4/IYsqqEtkIa1PPV7GB0gTq4kKg0lCGvR9GLpdeppLBGpVatrmY3fdGAv+2fnvZu0r913SpFQFgJMY2ApH68UnixPbKEuiKsloOZT00tqFKktnZ837F/5wb8o+VzAZlMLVCdhFXKcFyGJgbnd4ELQWQ59bOrxNwEuU7y1f7t6xYCmW/j59JEtK/3aTskzWZWZgG77WRVzy/lg61E0pgT/svfggzkVBpcJkgPxIOZUFkpJBgHK7l6DOzCSTZfd6jlXfcecZojQMx8MVhwvolzaxfiKZTKYBRMmmMxBu6UFNgDGHLg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6697.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alRHS0JHVE5aeFMwZlVlWjZETW4yNEsyU2RncUF1cGJYTm5ZRnBYTG1HUHVL?=
 =?utf-8?B?RG14L2l6eThSOTdQK3VPZzZxOTIwaS9uZlJBRTcwZWxmYytvRTFzZ2c1dHRM?=
 =?utf-8?B?WVlrcjNRM3RZM2ZUY2p5bFV0ZDRLVlBhbi9KWlVSamRybTVXN00wZGpMajBu?=
 =?utf-8?B?dnBxUDUvaHdMNk9GOVhWNWFMSisxM1BwNDF4ZTRqR3F0WXZkZnNJcVUvVnJo?=
 =?utf-8?B?MlE3ZUN6dm11WmI3Q0dJbXNtQzhrN0k1K1hRMWIycnZpRjMwZEo1bXFyeE9B?=
 =?utf-8?B?OWNLQ0dUUEE2WlYwZW5kdFZDcXU1OS8zZ3RCWmoraVlTNkZQSEpSS3MrajRV?=
 =?utf-8?B?Z0l1ZlNBcWN0YVVwTmJTYmFhcFlOODlMTU5aQlFxZmt1S2tSaHZROTludmtz?=
 =?utf-8?B?QUg3dWFSL0RhZkdJSzJvd0hha0M0QU94MS95UXp5SmZ3QjJuQ2s0TzdWMGoz?=
 =?utf-8?B?TTlTdFpMSGY2d3ZGNUl1UUxxdGpEc0phdEpMVTFtYmpIMVoxMFpNV1VOWm9y?=
 =?utf-8?B?OE1JYnRwQ3ZrU3ZGZlp2aE8yUFB0cnNNbnRtVnk3VHc5YnJsbXp6czhqODFo?=
 =?utf-8?B?cEtXOG95Q2gvWkdPV0VQcjNIOHlNSGZDSzcybTdqbExWUVc0QzdnOTg3NFNB?=
 =?utf-8?B?eWxtajk3Rk16WjkvamNxQVJnSWZXVGZDQWlPYkhQWm5aKzFBQ2ZhdTh3VC94?=
 =?utf-8?B?N0NVUkNCUlpmUGxLM3B4eStpbEZwNGhqYVhLcmZucW5JTEZEV3NQTlpoUmI3?=
 =?utf-8?B?L0pQSmNJaFdmL3BKSHhndTJyS2NRVmpTQTNEWjZuMXlYeHdOc3A5bmdzdG1j?=
 =?utf-8?B?bmNIY3RXa1QyR1pRK3ZaTS9PTExSUzRpNGNjdG9ocjRjWG9oSDVueVNvS2tO?=
 =?utf-8?B?K3NOQlh2aWg4T2NQWldqdGlBTkVpYUwraFZiM0dRMWdHT2RnQUZITk50cjNh?=
 =?utf-8?B?c1pJRHZPWWRiVDZoTWg4WUQvTjN1NGlsTFRmRjFQRk15S2x6TzZhdzV6ek45?=
 =?utf-8?B?OG1EbWJHWkQzcTdxeXN5dkZuRnJnOWl5QTByYTI0QkJnZnZ2T0FITG9pVzUy?=
 =?utf-8?B?bGIwRUhtR2pRdzYvbzhOQmpQdlEzb1VOeGM0c3Z6U3NMWERqTmVtblp0L05o?=
 =?utf-8?B?KzVzY2EvdWZKOHRXaTBLRlBTWVl3MWZneEI0enZYcHVBaHBsSnZLQlE1VVVY?=
 =?utf-8?B?R2JWNEFrWThLb2xGRUovL09xTDhscFJKd2ZIbHJxYkhMTE5MOURqdnVSVk5O?=
 =?utf-8?B?NEd0Q01oTGhKOTUvQXpoWnhsOFkwWklZM3F2QVlwL1FUWHM5dHpjTnJUSCtv?=
 =?utf-8?B?UldUVGVLU1UrdWNpdjJSakdEVVFDU0c5Q01ZZVppdlBDem01aU1QNVhRVjBZ?=
 =?utf-8?B?clNNSUhpWmwrb00xaUdCM1FkRXZEbU44WllMMmlPZFI5UjdpeU9Wem9sNU4z?=
 =?utf-8?B?c1hTR0xQdjFlaHRvSnFPK0kxaHZLZW5DSmpDNURTVS9zV29yZ1ZKUVd4SVNp?=
 =?utf-8?B?ZkN0VW1meC9BNUtBQmtVNUsrSVFNYmtyZmlaL0l0YVk4TktCQ3hNZEVDTDNn?=
 =?utf-8?B?VFd2NmhjUTRYYThSZ3dYT2djT2FvcUdiQlFLL3FnQml0L2x3dWpDUEl5bDhN?=
 =?utf-8?B?Sjg3Mkw1b1FGUC84cncyZUpjU0RIdHJsT3VWSWtRNEg3aXJVaU94MHFpTG1s?=
 =?utf-8?B?UDdQb2tWektIbkVGVEl4QTljUjh3UUs5K0t0RkdkQmZwNXJtZG9tM3d6TUlx?=
 =?utf-8?B?TEtpTytpWGhSM1NiSDBoazRJZk93OUVzS2RhWDBzSGxTdVF4WXBzN0ZwL1h1?=
 =?utf-8?B?RkpSWTZZdzRhQVBralFxWWZ0bEk1TGk4M0RMSkJvYUIxa2t5MzZ2TXFMRmYx?=
 =?utf-8?B?OVNNWHRjelgxVjZxL0NRT3dQTkhTM2NiV1oveXhKSGtlM1dxcGZLL1dxSWl3?=
 =?utf-8?B?azNIa284eEdxVHRSalFvM0ovdjFnRnNsOWJmVkQ2ZHE1UUNvVVJBY3ZmZlNx?=
 =?utf-8?B?ZlB6aVM2Tk4wbVFzVkt5bHFhbmd2b05rb0lSRVdlbHdWYVI2S2NqTzVXWHJU?=
 =?utf-8?B?TlNXZmtCRTFzTUdKTE8wU25aOTRMcDNHb3pXejF5czR4bmhXQ0VEaExyRUdQ?=
 =?utf-8?B?WUpYbnpFcHJtMVFrRUVoMkUvUFh5bWpBeXBIZDlkYWFzL1FwbHlJb2tyd3NC?=
 =?utf-8?B?aUgyUHpTb083ZGpxa0JjUlptQVl1TFAvbGwrdkFjTGMwWkhCSEx5S01kQ3Zl?=
 =?utf-8?B?VWpZUVgyaWpkUHpObk1tTnNydGxrOTh6WVRMTXdCUTQ3SlNhRzJQbytucVBh?=
 =?utf-8?B?K2tXZUg1RXVER0ZvWVRSWWtzMWsxQ3RLVGFKdU1STS9KZmQ4OEk5SzlIUlVO?=
 =?utf-8?Q?fXcPiIdjnd6J5BMY=3D?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: f985d9d3-b415-488f-e6c3-08df17029948
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6697.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 10:33:24.2785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPCMWDIXQA4LtYjv2AQ12ceKWuIoTuYI771Ee0m7IYInEdpu8WXEOlDNOU36CWz3VpAwxeJValp+YU8tj6d14DndG3g9cYMxh3l5kW6DNVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_033333_312295_52A9CA66 
X-CRM114-Status: GOOD (  16.38  )
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

Hi.

On 15/09/2026 19:46, Caleb James DeLisle wrote:
> The EcoNet EN751221 has either one, or two, onboard MT7530 switches.
> Every implementation of this SoC has one switch on die with the CPU,
> but some chips - notably those with a "G" in the name, have a second
> MT7530 as an MCM module.
> 
> The on-die MT7530 has 4 FE ports and 1 GE port. The MCM switch has all
> gigabit ports.
> 
> The MCM switch connects to the SoC switch via a TRGMII link from port
> 5 on the SoC switch to port 6 on the MCM switch. This link undergoes
> calibration on startup.
> 
> All known devices with the MCM present do not make any use of the ports
> on the on-die switch, it is put into "passthrough" mode in which all
> traffic is shuttled between port 6 and port 5 without alteration of the
> DSA tags.
> 
> Add support for both the on-die and the MCM switch, and calibration of
> the TRGMII link between them.

On pcbs with rgmii connected phys there is an optimal delay value where 
the data line is sampled relative to the clock line. This value depends 
on the length of the pcb signal trace and is thus a static board 
property. The same logic should apply to a SoC. Ie per different Econet 
SoC that implements the MCM companion switch there should be a value 
that is optimal.

Thus I suggest that dts property also is added and that the calibration 
is performed if that property is not present.

The original SDK and production units seem to have a fixed setting and 
user testing also indicate that a fixed value results in a working 
trgmii link.

MvH
Benjamin Larsson

