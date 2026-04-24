Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3365EFED3FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 19:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	References:Cc:To:From:Subject:Message-Id:Date:Content-Type:
	Content-Transfer-Encoding:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ph9tK+wEInRKOFsfsLm/eSjv8AIJDC30WzRRRTv3SHo=; b=AjWUPwZLgoVBCOX1nOeqbheLes
	OoPBQd0BJ0ZUhfqu6Oc6Paqk9qolIBH6IXH+eKIJArDK1VrlTXiJ9Usbe+UNlAT6N8vdEZ3WV202J
	KxA5CJIhWeqCTacJLq0igsYDjIhf6Qei4UE2Q/6Y3B9sNr/teRX9nOCwz5rOJzHV8urgnOPhoEUl3
	uaa2CxRCq1cYd+SLpHwVJ18vbJAy5Inx7rYWzWm7HjCPE58IKkuomxOPovw2DVyywLXXYS+zg6fYs
	94jX38rB2gP7pnyBTIKIa7LD1sSI0No+kXX77lyIyGApeP19m4ijPppjpGf8lsVRAi60gG5E5uNMQ
	bVlMXYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGMAE-0000000Dhg8-2zW2;
	Fri, 24 Apr 2026 19:26:10 +0000
Received: from mail-ukwestazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c206::3] helo=CWXP265CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGMAC-0000000Dhfb-1HK2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 19:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPJSYj2oDhubaCriarin9xO3QGNKCVMmYl1zeVHnuYXvNXMa+mm4EINAnISImRqCIJzxWCCOmNdzkAX2bbBa9JUXaBAZqtFOYg+kVTecbn8tbQdBJS+wq/xrbgTFaa6rfO1Wn9nziKXiqvdHEU68/VLo4ZyTLEWDjzOFhfovOFmR/5xHNIbg42RMCXBTohqULOA+g877aw064Fwg6dwuUadHT4ZfgVqeBCeslFp5cB86bC1FylKqK7mQuJ7vStor/6DlPVQW0CZfaXTzu0Ng/0B7QOjClP0nSIio6fnXXhUPpFcY8yz+7slLml0jvqobWraq4H16WuZKDUtOm82sJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph9tK+wEInRKOFsfsLm/eSjv8AIJDC30WzRRRTv3SHo=;
 b=d65/I5R0rpf86ulm+S4P+NwBdcmQ4D+gw8fPc3HQM5SIA48Frhxos/K9yLytUJbVdvwAqbd31cZyfB5tQvBT8DAak1QbsJhruzm26FR+nDHQV5NFU1x4eW9/xqdR6jqRXSSeYIOzYuy3ajlK2SP8O6Fulc5bjFYa/QLOPmBM4+AeyNvTPz+mH09eOwAI6ruFAMo/LVSV1KGdn2GHpJI0Ibt9zxD0130Cd6HJ74mUq8wCCP1Mg0zNwFVx0j9dBEn+oi1zM3H3lLVZIBJPD+hwnQvP3+8kOVq3JNwGaMAw0VomU+XWAXsy8nH3nbtjig49S135vcCaPeEV6I5topJNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ph9tK+wEInRKOFsfsLm/eSjv8AIJDC30WzRRRTv3SHo=;
 b=NImdIh9HLce7W6ye4Mc2GhiixGEqtRZhDSfYox86ZpbfhJQVS0rdsyXwvj1aZ65eZGErq+EkfGVfr8dagnYj5vMK4drcjV9l5Sm85O4QmzCPwpHyj2g5pyCYwA4XZn4sGEj/5dblNf5WhM7atCdOU6s/R+i3MBjL+tp0J2/EVM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB7217.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:32e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 19:26:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 19:26:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 20:26:00 +0100
Message-Id: <DI1MR8ORSJ2B.2M6Y3TMBMVVPI@garyguo.net>
Subject: Re: [PATCH v3 1/4] kernel: param: initialize module_kset on-demand
From: "Gary Guo" <gary@garyguo.net>
To: "Shashank Balaji" <shashank.mahadasyam@sony.com>, "Suzuki K Poulose"
 <suzuki.poulose@arm.com>, "Mike Leach" <mike.leach@linaro.org>, "James
 Clark" <james.clark@linaro.org>, "Alexander Shishkin"
 <alexander.shishkin@linux.intel.com>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Richard
 Cochran" <richardcochran@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>
Cc: "Rahul Bukte" <rahul.bukte@sony.com>, <linux-kernel@vger.kernel.org>,
 <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Daniel Palmer" <daniel.palmer@sony.com>, "Tim
 Bird" <tim.bird@sony.com>
X-Mailer: aerc 0.21.0
References: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
 <20260422-acpi_mod_name-v3-1-a184eff9ff6f@sony.com>
In-Reply-To: <20260422-acpi_mod_name-v3-1-a184eff9ff6f@sony.com>
X-ClientProxiedBy: LO6P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: c62731bc-ce1e-45c5-24e0-08dea23751ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|22082099003|56012099003|18002099003|18096099003|921020;
X-Microsoft-Antispam-Message-Info: DoA7nnC/p3lgkeKpfu0FwTBXmBTl/WlxO5+9ttc1egmUFxNVtPS8kPfm0wHHSLRUZIaA78WCf6XaqBiHdDftrqAnaBLeKU4dvMAnN1Z+2UZl0eKB9hWz3Adm5dbAORtW+FmvsGlumE8MMAWBhlAjXCWYy8Gzzx636H1jdg+fAdA9QSkxe9GwqrD4xGzBeyOXDuZ/42xtuoMD0OPvJ324iuVfxtPqA4h7PtPI9/0vGfYysJYmH/TmTxDK9tr5doXsGhvLiqwPC+wzevxXPUZa4AQHsTH4jGjjqjiQ9gH6mHcd71ioyZQfncaA8p+qD/4itZbEaIGZxQzWf0Um/5zA2ENaUsC9MC8amOHby0iW6HIti+L4je9NQbElBAzaIgqOjqVPsUFXE3siZ/BeU8yyAHQH/r8jeFTFIacmElzLKN1Paro8diVZ0aLF6Tj1YrRP/ycffnl9TL2huA4bUr2kg8ibOBHMnBEo0EMuhTSSBj2byVTMDDDA/QlZYQrUpNUefJOJs7rZQqRCNugUYCtBRsipSK2uzIg862P0m1cHSNxev8UZsfKeF3JABC+R8QWpPia9d8O9tQHK54hJYKdWNAJC3s1QKGbXf2eY1+X4XcDd8bNKbdcdcgC1zg3MMJt9RXOIQt4xiTqHXT3lvvd2vkFoQhxsClzcih3FKQcUwIMWhW/SVHYYQF9qF81+ywuN9u6Qf9R41/x3eEToKqfewfBvKBnHAAm6lwRNsTh7tDI5Tx4yP3c2hS5HkjYZgveKtzqXDFGi4QYRXd3fvZGtGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(22082099003)(56012099003)(18002099003)(18096099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjJwVEFOVTVveVZpR2FGSHJOUm9rdmE5ck5rUHlTdjNacEZVeEpJd1FRUmdK?=
 =?utf-8?B?TFFvUEcybENlaG9pbStyZjBjYWNWRXF5UXU1cFkxL283angrL3NOUHRRL2ht?=
 =?utf-8?B?MEx2UjdqT2x6NlRLN2V6bDhOSjBSb3lYMmdadFcrek1XaC9ERmN1TmphWk5j?=
 =?utf-8?B?WjNZeWF2TVFuZkk4UjQzNU1ldW0yditza2gvOGcrdHZWdTVXd1RJbU1jWVRF?=
 =?utf-8?B?Y3BaZ0UzS0ozamNtWStRS2xYZjZMeXJOcC80cldwUzcwMXgycjNoejYrSTRI?=
 =?utf-8?B?NGxodW0yUlpOcGtEWlBTSFVzSlBMWiszNDhEQkQ4SDgvbm9XOGRkbFBOK25P?=
 =?utf-8?B?YTd2RWZBdXI3ZkFPeTZ1eEdsRTBqQWFVT1VadE9wWGI0Q092VFRBQXJNY1NW?=
 =?utf-8?B?TWdkUG5vM3J5V1NMZW1tMnB0VTdrNXZ0TGtlZFhwVGd4WWFHL0lrbk1HRENZ?=
 =?utf-8?B?dTMyZ2ZncitkN0prTDEzd05ETllaMXVtS0VVNUVuL0NnTTdZUGN6eWJ1YUIz?=
 =?utf-8?B?MnFJNXU4TmNvWFpXUE0ydXpuSWFVYXYzaHNQcktyZllEZFFERERsOUJmZTJM?=
 =?utf-8?B?T1JubCtRYWRpd2ZuZVNpVEU0QmdJeFdaOVJUTnhDQlhTYWR2b3U3bDkwODBp?=
 =?utf-8?B?Ui9uT1Z2WE12LzU1NytNaWd5OFEzT2VOem1CaG9XUnF4V09zYmJMWmdEdnZZ?=
 =?utf-8?B?LzNWRnNuanordzZxRkpHY2hsNlFFVStUcW5pd0NOMDgzVUNVK3Z0UHA2S2ZI?=
 =?utf-8?B?bmZhZGt6bDlDb2ZYVmtEMjhlaWswcTkzd2NVeFZpOGIwN1pzUVVzWENnUnR6?=
 =?utf-8?B?RC95TUFlTHNjMTliU3dZZlV6QmNsekNrVW0zc3J4b1NVemRiMUhqdkozNk1p?=
 =?utf-8?B?NUdiWnR3eUEvNm5ZVXY3MlIzUzNZRzZzSjAvVWI0R1JRakVSL25pZ3YxM2ND?=
 =?utf-8?B?VDMyeTE1VkoxNHN3NWw0YW1SVWdrZzROMUErZ1NpWDM3cm9CMi91NkZSSXlh?=
 =?utf-8?B?dUlaNngvZ1BPRVR4cXpURkh6Z2FDTnM0NTJnSERJRDhud0xYdmNLVitKTXFu?=
 =?utf-8?B?ZWRhUUhEVjB3N0hmakx1Ym51djNRaXIvOUZjaFFKUms5ciszaFNlNTQyb3hL?=
 =?utf-8?B?d2ZwMzBaVkxhN0JXVFF4RTBWeG1VN3JLeUZuS3ZnZ0tacDRiL2hGNXFiQXZi?=
 =?utf-8?B?RHl1VFprVDUzdDNFdkVLT0hqK1ZPRnFVZ1h4K1VWNmdQb2s2WlZGdjFRZDJ4?=
 =?utf-8?B?MHA4dlBXUVBTMlYxalg0Y0xJWmw1K1Zua0hSTzJoSUtPZ1JPK0haVEE4NzhG?=
 =?utf-8?B?dExjMktXL3JVUnFKajlEL2JDZTl6aTIzU2p2QVczeEFreGVrVWJ5Wm1MQUNK?=
 =?utf-8?B?eSt4UkhhaEp6ZEloSkhiOUk3TnBnSW5nanlUV216RkhIOGVsYUNaTDdoc1RF?=
 =?utf-8?B?NW0waWE3aUFxWUozMkFXWGh3eWJPMUhJZG1hQ1VTbkQwT1MvZ1hrRi90K2Zj?=
 =?utf-8?B?MjRpRlQ5dVljUlBEY1pYZjZvL2ViZUVBMmNkdFZhcFp6NFhvM2JFU0ZRQkxa?=
 =?utf-8?B?THRlUVRYNFQwM3FmWWxFRlZJQW1ZTSsxcnBpa2NFa2c2S0dKYmFPQmp0NnpJ?=
 =?utf-8?B?ekxTVjdoUWdwckk3WXZsajZpQUNIeU0xSWJ5cUhtMFQ1TmJ6b2dxbHg4OHZw?=
 =?utf-8?B?MUkzbHRicHB4bWVUVFM2MTNkZVlHOXdSODJlZ2pld0RubkwxeEhWVWRNcmgy?=
 =?utf-8?B?Z00xRm5pL0NLMVRGc3lCazViWWZOTnBuS2wyeUVhNkxUcjltOEE1SHhqbGR2?=
 =?utf-8?B?MGcwaWZCVzY1SE4rbVA5N1k5Rzk0WnFKU0tUK3pXVW50SlJkRXR3MGZDcmNS?=
 =?utf-8?B?N05PanhTVEMrbDdrU0FNUkgzeHZ1L2l3THA0Zm1LcUFnVDlpTlErV0F4d2V2?=
 =?utf-8?B?Y05TTVRkcUZ0akxReHZreEtZL0swQldreWY3MGpCK1N4alNZZklLb1NqRjVs?=
 =?utf-8?B?TXhXbEx3SisxbTl4OCtaekVIV3BlaGc3STNLZ0x0SVZGQStaM0I1TEY1REk1?=
 =?utf-8?B?STNtRU1mdlNuZzlGNnNQdGhoRGVrblYyeUFqVGN0QXlSWVE4Z2MxdnFyUzNN?=
 =?utf-8?B?empIVkRSRC95OGc2WmZ1M3BKNDRVdWxETUUrYUVqOXhJUnppU3hIRFZHNktj?=
 =?utf-8?B?Wlk3aERDUzdFMm1oZW5mRWdwMWRsT3dHNDV6OXB6eGpLbVZFWEx4Uk45Q1hp?=
 =?utf-8?B?aUlaZE9LQ2xCaU9LckhMQXNWczB3Si96NG5ZTTZ4eVp1OHpCRStFVjk4Tkhv?=
 =?utf-8?B?OVdsWHpwcCs5RGxpMUFrS04vcjhacW1LVVgraE9iSTluWkVJNHlJQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c62731bc-ce1e-45c5-24e0-08dea23751ff
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 19:26:01.6558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XD5x1aq6apc+4pOfLHONymZ0IqWmKZnNYNXVK7/FZ6qDXQRBM073ceXv+oYO7d2tuY+bifF8EgbjOHvLhm3lIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB7217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_122608_346522_E07A2BD6 
X-CRM114-Status: GOOD (  26.77  )
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

On Wed Apr 22, 2026 at 10:49 AM BST, Shashank Balaji wrote:
> module_kset is initialized in param_sysfs_init(), a subsys_initcall. A nu=
mber
> of platform drivers register themselves prior to subsys_initcalls. With a=
n
> upcoming patch ("driver core: platform: set mod_name in driver registrati=
on")
> that sets their mod_name in struct device_driver, lookup_or_create_module=
()
> will be called for those drivers, which calls kset_find_object(module_kse=
t, mod_name).
> This fails because module_kset isn't alive yet.
>
> Fix this by initializing module_kset on-demand in lookup_or_create_module=
().
> Retain the param_sysfs_init() subsys_initcall to ensure that module_kset =
is
> live after subsys_initcalls (assuming no OOM) for any users who may need =
it,
> on the off chance that it wasn't init'd on-demand because of no
> pre-subsys_initcall drivers.
>
> This on-demand path can trigger before subsys_initcall. kset_create_and_a=
dd()
> be should safe in those contexts because the allocator is up and running =
by then,
> no userspace to start uevent helper or listen to a uevent socket.
>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
>
> ---
>
> Patch 3 depends on this patch.
> ---
>  kernel/params.c | 41 +++++++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 16 deletions(-)
>
> diff --git a/kernel/params.c b/kernel/params.c
> index 74d620bc2521..f25d6fda159c 100644
> --- a/kernel/params.c
> +++ b/kernel/params.c
> @@ -745,6 +745,26 @@ void module_param_sysfs_remove(struct module *mod)
>  }
>  #endif
> =20
> +static int uevent_filter(const struct kobject *kobj)
> +{
> +	const struct kobj_type *ktype =3D get_ktype(kobj);
> +
> +	if (ktype =3D=3D &module_ktype)
> +		return 1;
> +	return 0;
> +}
> +
> +static const struct kset_uevent_ops module_uevent_ops =3D {
> +	.filter =3D uevent_filter,
> +};
> +
> +static struct kset *__init_or_module ensure_module_kset(void)
> +{
> +	if (!module_kset)
> +		module_kset =3D kset_create_and_add("module", &module_uevent_ops, NULL=
);
> +	return module_kset;
> +}
> +
>  struct module_kobject * __init_or_module
>  lookup_or_create_module_kobject(const char *name)
>  {
> @@ -752,6 +772,9 @@ lookup_or_create_module_kobject(const char *name)
>  	struct kobject *kobj;
>  	int err;
> =20
> +	if (!ensure_module_kset())
> +		return NULL;
> +
>  	kobj =3D kset_find_obj(module_kset, name);
>  	if (kobj)
>  		return to_module_kobject(kobj);
> @@ -911,19 +934,6 @@ static const struct sysfs_ops module_sysfs_ops =3D {
>  	.store =3D module_attr_store,
>  };
> =20
> -static int uevent_filter(const struct kobject *kobj)
> -{
> -	const struct kobj_type *ktype =3D get_ktype(kobj);
> -
> -	if (ktype =3D=3D &module_ktype)
> -		return 1;
> -	return 0;
> -}
> -
> -static const struct kset_uevent_ops module_uevent_ops =3D {
> -	.filter =3D uevent_filter,
> -};
> -
>  struct kset *module_kset;
> =20
>  static void module_kobj_release(struct kobject *kobj)
> @@ -940,7 +950,7 @@ const struct kobj_type module_ktype =3D {
>  };
> =20
>  /*
> - * param_sysfs_init - create "module" kset
> + * param_sysfs_init - create module_kset if not already done
>   *
>   * This must be done before the initramfs is unpacked and
>   * request_module() thus becomes possible, because otherwise the
> @@ -948,8 +958,7 @@ const struct kobj_type module_ktype =3D {
>   */
>  static int __init param_sysfs_init(void)
>  {
> -	module_kset =3D kset_create_and_add("module", &module_uevent_ops, NULL)=
;
> -	if (!module_kset) {
> +	if (!ensure_module_kset()) {
>  		printk(KERN_WARNING "%s (%d): error creating kset\n",
>  			__FILE__, __LINE__);
>  		return -ENOMEM;

I don't think lazily creation of module_kset is the correct approach.

The only thing that param_sysfs_init does is create a kset_create_and_add, =
which
can be done really early. Driver core creates a couple of them during
initialization too.

This is ultimately just an init order problem, and you need things to be
initialized earlier. Given lack of dependency of anything else, this could =
just
be a pure_initcall which will be initialized before everything else.

Best,
Gary

