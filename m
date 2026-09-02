Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9CBC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4iJy799LoR8KgiCvaOrADwHw50fH/YRLglDnVUY+U4=; b=Q2XFfsf6nOx6EX49EN72b845r+
	joqbUcCx+bClbGvj6wRUFm4Hck/oTRd3y1AdoL20ierylTmdbX2vPVVVW9b1zCdkD4jW1D9VHcyLW
	ihYUXh+9gRVHs/gnYbmicgnbMiYtyk9ARDpqCtM1f9ENABqa2YTb2hP5nsu5O7YfVmOwdC7vmEU7j
	ofSGgzQMiYy3eK6kVl+iXY5SyhWa7JDWEsgPc2iSB23xu2ENxV/xpKKWVwOsv3D0TIq1D3KdSTyrI
	7P1Pt8BIvcTBwg328kXXWiqWsH1KoWdojGK9cB6JkEt6kKif3vZXZJihMt2lksorgojyNTfhhVBQV
	WBsyMqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qmN-0000000FkSp-3cQo;
	Wed, 02 Sep 2026 19:37:51 +0000
Received: from mail-francecentralazon11013055.outbound.protection.outlook.com ([40.107.162.55] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qmL-0000000FkS7-0hWK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:37:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbhtdtUpxConMQN3p7I5MILgTO8xhcMzoGb8EmOnY4yD9TqZNkbuaDc3HgHmiNxAUNuHoKYTQjvwtgT1KeYXgUJlwCMrhPDj0MRE4Oo1j6WYGb9+aKAHixFI+r9q8ygi5vBkqnugQbAW1HI2iWP6pPA/7Ohf/EkPY355fC30ux18GZGdE86ByYqnMON6zRPP59qubR2RKavZ7tXbLpSRwGY3mQsuRNldOzpQ0KKM0h4EMzxJFdlDECGRJ1b9TgYqmJpQF9SHaqzQIibpSyjPyqeZFeODSvvC5lFXbQDmz+qKNqA6XPXOl+E9L+7oKdNu+D+iC33TRORjSSc4W0hGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4iJy799LoR8KgiCvaOrADwHw50fH/YRLglDnVUY+U4=;
 b=NL8BGOqIQGWW8OtZUHvAHOmt7WXpSF3GMGuyeglDb2z9TrBBf1TZsGJPozNpzmRqvlgOtR4BhTPFETCwmc86MUXoPzVm0371sEfoMSlFa++r9+kiLqI5SA703nLIjK12jdk6lwomevs4P7/WE84sp/AGndF872zLF7iWrcebclGsmbdf+Bw9N5Wa50d28KsC7pTWsPUi829FqI0aWId9pHCZAeleVk1IFqnR4x/CBhfY1/1S6r/v9BlcHas8Mk/QON6XLsP930ePsuTfB7BWoJZhMPCyD7c1PqbR4JwGNjynCMqIn0SOIATPcMZ9qdoE4WlD/v4a9Dn1VTCdnKwPPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4iJy799LoR8KgiCvaOrADwHw50fH/YRLglDnVUY+U4=;
 b=QspMpd7Tqxb9/jdx772boccEdzZI4+ciy0/x26a5I0oeriF1o98a1AaZmzXCa9xiIKC15JslTyr31+fJkf/7nvG8GBrzMkU5V4VYDJ+ebuUhnL3j4p8T28fUEz2fSfrSRMhZDpEVhi7hngK5o7vifp+03kSZKuXvdGhC99DYwMOtElgYKC9tXhcvtjt6DpDcBrN6+BM4M1YXwpX+PR+k0fmHTo5TQ4PzruMTND8GUecSZMrFfviV40806eSyxwnd3eaAT6jdDIyft+JBV82Wk9Z9UsCXfmiMczphV/hhKDTMAXLHiMNasfr4VvzfE6FAMRYorXazrc7qmWi8GEt8UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB6950.eurprd04.prod.outlook.com (2603:10a6:20b:105::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:37:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:37:38 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Yo'av Moshe <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] ARM: imx: Fix suspend/resume crash with Clang CFI
Date: Wed,  2 Sep 2026 15:37:31 -0400
Message-ID: <178837784486.2111832.15893203834665425306.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830155100.1020620-1-linux@yoavmoshe.com>
References: <20260830155100.1020620-1-linux@yoavmoshe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ed::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 384c3e99-5391-42ef-a8f9-08df0929a528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: wLJSVauuKCViogBdqJZCkgYAFh5ykRfGOIOpkBm5S6SLF9Hnce+E7N97U35FvTog+uPOZbbAUI3D6lu9w9hfXRiXg2dCYVq4wNGW5MEVUKTtYt/5W4WMnEKmcErLfAAn3HR2V1i1ozLZJPOpxydkE8JHViqAbvR0T6wGz7+Z2VUS8ODtDtri1BUdDMuukqrn5UZ0qRCv24goI7bMC6w7HAmeNjH60AKXjteOcVqi9t1NP6dd7NvIPZKxM3gWKCZWAeTAPVwYm/3vovcJ2P1HPU64eqLN35NNZ+JT6B+dQ3hedfYgZfitRL24IPzSI8ZLzPqvrO0SYFgReiUozNCIm1G/7RchP78ltws0RoDFYUQUvY80QxcY08OMs5XdP4pRsVtKnslkC4hORYZzS6FQKXFRL5Of6mruellmLIYveiP5bq2bmo2rIamCg9s6P0q0T6oiYVxyMCLFN7NJ27sGGAo1exDqn6XaeI28AxxldkMMol2QYz7EuaODKVs+YmYqXYnv2hnXtabcZoNOzac+8Q6n+1XK544fyUHcYTt4HKtF9pqAv/CPDF7gAWTLhHK/i01cYjazp+7PUl6woSn0KcPzBh5EqjfOUwrgymGP8MXTViKlwpXZ+kpGvVMZSth9siHqJjM3xhOKXofE1J+w2Vmdr/AqgsEuCIBI5i3jqno=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3MzdUd6VUF0QVY4VTVWei9tSWdqdGZ2YW9pS2c3cjFVL3pIcGdJTE5VZm51?=
 =?utf-8?B?ejU0T0FTL091anMycThxV3JFZlU2N2kxSnZHRUNJWXk5SytEaCs1U0ZTQnh2?=
 =?utf-8?B?aFMzeUlWR09ZQVBObjZ2N1J0dHd5YmNaSEtqSkFmUFdnYU11bnZrR0hBb2Rl?=
 =?utf-8?B?U2h2NWIwU2lwMmovTlFrUzM1UzlhY04xejZMVjR2c1NTemRrWVhDZkt6ZWJH?=
 =?utf-8?B?RDZDNFRhekxuODhCSDBhSm15REhtTG9sb21TT2Jxb2FQb21ibFYxaTZObHdn?=
 =?utf-8?B?MG5hbGtxYWlwd3RoUm5rSjFyVzF1a0FDeVFWVkQvV0Y3TnlNZXBmRFdKM2VK?=
 =?utf-8?B?SmRHTlFIcXh5YVM5ZE83dmYxem5SbU9xMkVqS2tvZWs4NVRlTEQvUWJocVFt?=
 =?utf-8?B?SGRDRkJMT0dMMW5PU08veHhWSnJIMzZTS0FTQ2FZK3NYY0ltWHl4SGhnZzVS?=
 =?utf-8?B?eGcvUVNKdlRjR0x3dERsaGFFenZFMzJjS1lvNnUwcGtQOG1TTldyQnJXTHFD?=
 =?utf-8?B?WHFMdkdIMFJWTXgySk5RWVN6R3YzaVJIK3RLbGwzbXVrVjVQczRabVE5ZFdN?=
 =?utf-8?B?VURPcHMvYnBDZWg1UzVxMXd5NTNvcHY1QWNSeUw4MlVVR1pRZDVuV0dWUlAr?=
 =?utf-8?B?bFRCWE83MnJiUGUwSVAzYjVLNTRMcHhqdFhrT21BT2E5NFE2YWp3RExrcEU2?=
 =?utf-8?B?UHE5RThRZ3c2Q1ozTHV4Unl2WUVFVDNLV3dad2RRNGIxVGxLU3hpaFo0R2lW?=
 =?utf-8?B?VnRMeGRjc3htNnZEWTZuekliU1Y3RXUxU2thQlQ4eXZGaEQyb3hoVFgxZXd2?=
 =?utf-8?B?WFBIWVd2ZnlvMEF5MjNpUVV6MWQxdVpjUlZPNlpPWEkvQjkzR2p6V2dxdUFJ?=
 =?utf-8?B?VzlZRTI0WmRpUkN0Tm5ja25Oc3JrdXhBcnBhaXBuNU5Wc0QzV29wcFc4TTlP?=
 =?utf-8?B?YUtvMXoybTRaUXNqOTh1a0dYb2N0OE5VbS9NMlRTSTUrVjZqOExQS0ZkZmFM?=
 =?utf-8?B?eXdzUm8yRjByZEQ4blQvZnFKS0dsNit3ZVdlOVpaZjZyQ1ZBQUhBY2hDOVVJ?=
 =?utf-8?B?ZXJXVWxoWWlGb0tjN29NWW5wb3dXTkFwZG9ZY3VRclNiMmxDWHRQUTVTWlBJ?=
 =?utf-8?B?SDZVN3lhb01ocE1XejFMTW02L3RJUytORGhXZVdwWnJVTGVDU1pNMkttVEtS?=
 =?utf-8?B?T1hVWjljdjNtUTZJSHArWmh6S2xUWUJJdTdibWdHL3duQWVnOWd4M3UyajU3?=
 =?utf-8?B?azZ6a2xDMCt0SUdBM1g4TlU4eUVLbjN1ODZTdkVKOVRwSDN5K3c1WEFuR1JB?=
 =?utf-8?B?TW5PRWVXL1JWMFhmM2JkMFVzTUs0THFnZXViNlJMNVM4TkhNVGVDRG9LZkY3?=
 =?utf-8?B?R1J0cnZxbTlDTmpldHFycVFLbjhpTk5rSWR0L05Ma2tZVUhuWlpCZ0s2bnRa?=
 =?utf-8?B?aHV0eHZBalpJVkhsSWM2aWR3Z3ZnaEhZNmlCUllxL2NaSlR2SXQ2S1dabTZs?=
 =?utf-8?B?U2lKbWoxSDVOVUpiTkZabG1XcU0wMW91d0VraUZVaFRMYnZzdnZVSGF2bHZC?=
 =?utf-8?B?Sm0zdGdtQnBkMG5OS3d1cE5xTFk4SXdlWE1mbEIrV3pmOFhxTytNUTR6SlN5?=
 =?utf-8?B?SmZtVkxQa0R6SzVXR2J1YzV4N0lxZEVTMldxTmlXM0JmY29MTzJ0b1RrdUdC?=
 =?utf-8?B?S25Kdnp3Q2xRUXhlSGx2N1JlKzdibUFlenFEMGpyNVZva0V6a0UySVUzVHNU?=
 =?utf-8?B?Vk5kKzNxbXdVS1VockZPZHZpRG11K1RNdkd0OWdoRUFvZTZXQlhSMU9KNkFx?=
 =?utf-8?B?WG9idXMvRlhmTFZ4dnZrOUErZUF5bU00YnFTYVQ5TVZSOFhQSGZyeEVmYm1s?=
 =?utf-8?B?K1duakhuUUM2aGlQWFVScjAwQ3lXeW5ZMUJxSy84OTdYLzJFbkpXMXVaK3gr?=
 =?utf-8?B?N1pJZTh3K3ptTkw2N2F4WG9LYlZDRWdlaS8rSkVrR0RkMFovQ3dQV3dVaTZh?=
 =?utf-8?B?dEN5S2UvNWNrL25MdFpmNjAwelovaFRobEordXQ2anVUanY5ZVZ1RC9OSXJl?=
 =?utf-8?B?OWRPOHJBK0x6cXhBZEd0dnVMY3MrVzVpQllrdWVONlhhZG5hRFQzaXBNNTBB?=
 =?utf-8?B?TVhGNm5pbmFDQ3dsZmFycTNHTzBMU21VZnl5eUt5Q3ZmSUYvcm9MZHAwc3RV?=
 =?utf-8?B?RFVmK3Fpd2JvSVJuQXBmeWprMEp1N3JROWN5UFZoaVRrOVNnb1FTZkJhNlFD?=
 =?utf-8?B?cGVUWHZIT3BIdjNVNk1NZTJLWmFGK3BkOFpJdjFaUzF3KzVHb1BETHhqUjRY?=
 =?utf-8?B?SWliYURUMzJzaURpM21yVTNLd3JSaWcvS1Z6VlJGUkl1Z3J5OExhUjQydFVS?=
 =?utf-8?Q?9LfEWS5N1ZJ2AlwAf1ZxvrQEEn4CiUm+edZnF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384c3e99-5391-42ef-a8f9-08df0929a528
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:37:38.0794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgJhtHWfoeVhKrg/ToFeWjojzSPb1YhOUUz2i+u2PaGTCL+7dm02PnueWDCkYEMUakQjhpk/sawFZSdjlMHnKY4jMxx1QXGeUZ8vwb17b47Ia/0eVNxzu7xsuLCNMbgv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6950
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123749_206753_80DE6C95 
X-CRM114-Status: GOOD (  10.29  )
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

From: Frank Li <Frank.Li@nxp.com>


On Sun, 30 Aug 2026 17:51:00 +0200, Yo'av Moshe wrote:
> The suspend code that runs from OCRAM is copied there with fncpy(),
> which does not copy the kCFI type hash preceding the function. With
> CONFIG_CFI=y the indirect call through imx6_suspend_in_ocram_fn
> therefore panics.
> 
> Keep the call covered by CFI instead of exempting it:
> 
> [...]

Applied, thanks!

[1/1] ARM: imx: Fix suspend/resume crash with Clang CFI
      commit: 242757d109bd5c9b8fb7194fb4d44625be0b859a

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

