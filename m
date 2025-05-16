Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7C0C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g4JVnYx7Ql2ZP7pvG4EZmLx4MLnfdlwPAkFhnxRA2Kg=; b=beGQefxR9gi/Dg
	zAyommFaoJerSyPCHHxQC6PvWs6Y6F/KSOrMRO9xv6lMWNkXT+7bswl5WqmUIyvT4jwZE7uuIvzAq
	ay69pVAhzQoe5i7K1CCGMedQq7bdWKVJUU38aH5hWzGSY3IItAAMvVH84xeLg27fziS9Cts/FK4XT
	s9DYAhgM87UYvKL4LrT1nvB4LYn2W3wCrklRekYYRNTziNYlU+h5eC6NAG95spPpxqIDHcYTbn1t8
	PsxEG+3aOeNUKP1/8p26jfMw1QvltpGz31GmtMMGGEG1CYrxPyQxi+oHB5Q9rvNdwna37SZSiVevX
	JDuDlV4+u9tkoAAEzXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxk8-00000003zcn-0Hdn;
	Fri, 16 May 2025 16:17:04 +0000
Received: from mail-bn8nam11olkn20831.outbound.protection.outlook.com ([2a01:111:f403:2c14::831] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxQr-00000003w28-3Mlo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 15:57:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJrvyx6HbpH/OEAfz3/Bhq0iOpFdR+eNXL9uexH4WOtXyiidaagddCxXSO2+Tgp4of27RKnHqMrkjMfeCnl/BU/MAueR8U0hPyF4P/WsH5sjiQZb6wRuz8MWSQHhyF+7Fzc+s8nVF5QuEXg7U3JlnPCq8qRfY4uPAem4YFBUom9958XY/VcwdvZWT3YjZ9aVA/0/vymVoNrgserXzMFflBQiDYou5gDIjgdSX4lrcUgFkBo441iIvPpY/oB31U1Nd4q3E22lpXYWeLh0A+2ygq5PzJ7LXrOsdKxI2LlknMVZ6n2zrpyZwC+fMtscic4E5TJushz3cKO3hKTALYgcXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4JVnYx7Ql2ZP7pvG4EZmLx4MLnfdlwPAkFhnxRA2Kg=;
 b=wzFiRLwNj/Y7HnXVioUi/X01Fduf1wU//U41xPmiYavfl3dNAPirfLz6Nl9vsQ3eRyWwMYpHP0W7ZBbv08/zopKA80qC21AmZaErVR2xikL9/EpZoLy9I4XK32uiRVUY7ix97vaePq1p3uTgkZoeMv69fu+o1vx7gFK771iOXp2LFahlBE3zXAmdZdWTVx3zdFS+y+zJZNETaepH2UCKyD18mqbt4esuPJI52AW9C0gDTZr3XRGD18IxYYQA7r8pCCg7riYqkQORRxN0yvJyiL7FblB8REXWYmuRr1XdqF+gBlVNfXpJBkOrbLBbMhhKGw27vDwNRJkyokJh35lhyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4JVnYx7Ql2ZP7pvG4EZmLx4MLnfdlwPAkFhnxRA2Kg=;
 b=VV5XyU2QLrmY/IiDgDwsWXRXig+KYOfYAWbCeNbu8I/IwfnbOe94/A3q+z9bStDgEqs0FHF3/v+OnA6tQT18ahw2y9OXmr9UuuzE3lSEsqeE1FM4anBA9qv+sv8I6zwq4e2yk7hlKIXsWtM8axzPHZ/0daBf9U0pvlkoQbP6QV8D6ttchjow6FGgqVpUNHwtu9ZM2Ro0zbkVJmx6LgfId9Ji5/6wvFVIQDlQE0kyjhHmsRenVCXzFgqtlS0wVPRfTwbLWDQ+vy2En/bonjLBRG0RA2oS5/rh4ty+n7gQflG7kau2hhJG+zMJDeuXER3npnyaYMTsiy66E+Nv2lGqIQ==
Received: from DM4PR12MB8474.namprd12.prod.outlook.com (2603:10b6:8:181::13)
 by IA1PR12MB6066.namprd12.prod.outlook.com (2603:10b6:208:3ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 15:56:58 +0000
Received: from DM4PR12MB8474.namprd12.prod.outlook.com
 ([fe80::7101:bfc9:9e6e:bdb9]) by DM4PR12MB8474.namprd12.prod.outlook.com
 ([fe80::7101:bfc9:9e6e:bdb9%7]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 15:56:57 +0000
From: Lena Schwekendiek <lena.protechinsights@outlook.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Elevate Your Air Charter & MRO Results with Customized Lead Lists
Thread-Topic: Elevate Your Air Charter & MRO Results with Customized Lead
 Lists
Thread-Index: AdvGbeR7f0uNvjHoRjOrWZU9ixdvZA==
Date: Fri, 16 May 2025 15:56:57 +0000
Message-ID: <DM4PR12MB8474E0D8B5DBBA140D9421969693A@DM4PR12MB8474.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8474:EE_|IA1PR12MB6066:EE_
x-ms-office365-filtering-correlation-id: 70408966-f6c6-497e-a0a5-08dd949249ad
x-ms-exchange-slblob-mailprops: znQPCv1HvwVu6ov8hlKZu5ytU8AWxKlxSl029wVXIeXD0+n1WbVh+g+IdLa+Oc7ulSBv65KRTQeFNLNfMOKEhzJ4iiF9BsCiFepxT4ED53jDOF/TrJpQIJH68uEjCqqEDAKFwIQqmiZ905F0ornjI8gRxpqZP+XuALZFFC/tqtLZUiUgNYQD6dVuFpD6v/Jpc7N2BctAQ19nmtsYSkEGczWM5IpVJMhBoLUweQW1FzNVTdmX2T4aHJv4buGT3G8OnzKDIRM43CTxAJlvGDiKG8kduXQsz2Mp4hxn3FhYN5mQV05fzWt0RCeUf1fp33jOBQ9NDZ08KQoRKjaMpcW3i00/BN3WtyrqhEQanxmm+GZKaC0IetYfsM2S0z1cgBzGNx5NJiUL6erX+yy4JI2u/E3njeqaIrOiAlwurfnXx3iJne3qPyJPSlnuQZRel/xqpdNFg0YNwYnaswjV2BmvIQfW4TI059CHQbM8k8xjDiP+NYRmGCLLXxnp0Qva/aUgmkPu/38T1aa0zRni0WQmXBlKRPsF7k3ipTEYz8m/2247byp5Y/J+3KOB4I50sJVBt+rYoEmnazxNnaD+S7AcuUhGbXuct5e9rwfr9WtnzRbcPpTMQT6g/27PFPajmEojSt2j84/PrvGIJL3Ncfs68dFoNWzdzn9WpdULL4daXdCi76Y7VLmuYj0W27wAqW2suuDL7fMkrkzNA3YKFrL505C9/wEmRsB+ZEqFcHbuX+UOLfg6zy3rk+Djloyj4XzxAHFXac+wFck=
x-microsoft-antispam: BCL:0;ARA:14566002|461199028|8062599006|15080799009|19110799006|8060799009|56899033|3412199025|440099028|102099032|12091999003;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?GwRa/BfAJwtQMpiCo6ZgwpiNNXTtpNRENm5VAKRVENGjG77LST7pTGCsJi?=
 =?iso-8859-1?Q?qg0dfAwvAP36lkhJMknZ+lQ770FPNImHEt94dQ7JLS2gcrDqsm5eKDo4PI?=
 =?iso-8859-1?Q?hAP6AEO4v+ALjZH4EuX3S7cXIdpcvIQOYdm+r97AYjWhbiFv984f31UtDp?=
 =?iso-8859-1?Q?lzErvoxO08tb7IUwBtTfF1j2lW5vIYTtsyiHWae27OHdHA5+EaQdNxMhKW?=
 =?iso-8859-1?Q?4JWL1rGNsMzdQG+wtXUhkDroEjCKm3dRQdsaB6AhxB2jrJevL1b5uLbwEK?=
 =?iso-8859-1?Q?pCDHKivmL/IJ4Y9xhGYALVOU+0EUwsVtOU6iCdGPYO6Abgb4wjx3lfGdRu?=
 =?iso-8859-1?Q?XkUU43ODKko8JhHs5IsTaFUvoaQqQEunxqjBJVG42fTehnA2pOPguZe+1F?=
 =?iso-8859-1?Q?6ccNfPz+Ax57SIC0gDk6T7lJONvC3B5nWFmeqPnPazpHv1w0jKRKz00lPM?=
 =?iso-8859-1?Q?5zhKs+xxrE8Q9wFGwczesEjCC/SjrdysdUWAHHtN4Ip1HIQ2lV/DNgjM3g?=
 =?iso-8859-1?Q?ulOkEkx/lo+NQoTYsvfqqT0N9i27U0+AXE9OsL4hUO4sHwKD31yTB6cmFg?=
 =?iso-8859-1?Q?VhtpUgMqLVAorujb+ex3pK0BQGuLeFkcHJGKCYudWFZ0fODtH6AUFTJZCN?=
 =?iso-8859-1?Q?ysQaSg6HQJTUT5EJb5DO60PYTZlCQFIYjkh60hZdEiqX8ur58oBCUQpkMy?=
 =?iso-8859-1?Q?LxkLgcszw2OXnBYVfkV/zVGqenIvsXHzcAh4bpWzWGQkRudzBpqoOBcES6?=
 =?iso-8859-1?Q?2uRNOPIPTmAO+JVtn5VolH4eQo/QhlTaRe48vItnUkQ2TnGBbBAMNYT/Lo?=
 =?iso-8859-1?Q?NppMeCSvQ/zSidsRo7o4KYcM9hlc5UgS5JkfxA889xbLQgdoK/27+FLOS2?=
 =?iso-8859-1?Q?QewvEIhCfOPCZTexrYQWKBt3KNLWlm/wdIhYNgTGrKnh+/FdhD4MQBRkSQ?=
 =?iso-8859-1?Q?GDRrUqzcogxSSVjjRUJKYSrRQATpR2jIp1AKhNrVynDrl9gUJ7oAhrytkA?=
 =?iso-8859-1?Q?vmdV5BysamTdTomxYpZKn3JFB69Q8+SMQSp2brUANPiksnttIN/eJDarSL?=
 =?iso-8859-1?Q?jn/e4uPlni8pe5te5NLkqc6j5+VcPyuViB87sE2m2DiUTQ1EV8j98MFjZY?=
 =?iso-8859-1?Q?FxuMZEJgQXlMDT2h9bdoX7e+Dp5+p81D7nuE2wG08Up/raKKDE?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7fU3nhwzi52qVPmuMB7tYGhQ9JwwFnw+miiD79NdEhHxLdDmpTvT+95whi?=
 =?iso-8859-1?Q?jj//QAg55i+CTOJLC7lXL61MKTUpocnf9QEPeIvzV0rZ93UyVwDWwFE+yD?=
 =?iso-8859-1?Q?kPdUUVuy0fhnD3YArtGdpcPfNG20AbFoAaxVGOVX1izXfsp4udWFwXfCU1?=
 =?iso-8859-1?Q?INnXgN6OxFJL9HJnap4//cemWm5XVvKQAo0MUW1vZuItK41EC7Z9DAvvfw?=
 =?iso-8859-1?Q?COkYZ1bcgmU3peEXdV7QTfE0FfcegkIk7ikPEMAf4kRdyD+UBP6tGewXif?=
 =?iso-8859-1?Q?xaOG0n1Wnjoua82MdVBqROaIoxFuqclYaqRJoMHoToJRjinc+FDqGrG2nb?=
 =?iso-8859-1?Q?XtCKkuU60f1EVkr1mGF0JeoWgn7MHMDavWWt9kBukITw+YoMwe/UUV8jDT?=
 =?iso-8859-1?Q?6F7ZGp0cRvUHwQQbxmpgoRGBixkmZR/8OMOeaNmru7eYKIJryPlRscoNiE?=
 =?iso-8859-1?Q?wUQISY6yMVKh+2FLBGSbSo/7gsLlIpFvvdqi+5MhP3D+fq1miI+XcnX2Ie?=
 =?iso-8859-1?Q?Vetk7Gl3xfroDc6p52bB4rqKZxPji1nkZnf4ZCR0I1EerjZPcLDLFDIN96?=
 =?iso-8859-1?Q?tTduuO2gyEQP123fgdtBc+aZUsuTGIEP3nV9IQH6eG6Qyoo5zWQzFrI/fH?=
 =?iso-8859-1?Q?WOnR2AlcpLYyA3Y5YSAnODDh/qmG7h0+wKLKAG2haJIn72fEvrSAry9AGI?=
 =?iso-8859-1?Q?rkJNWOChMk7ZLnWQIM183wAXxPvzBbb3EQOi88iku9Stvpu8TNyN7+fAcz?=
 =?iso-8859-1?Q?to2lrtBA6mxsPM8uDjmfjU42vcWoy+1v0YT8JYKWotYPCtEMrwizX77mzr?=
 =?iso-8859-1?Q?jk4WFy6nrQpQ9fQ7xmqwutGE/MfOCnAsu1NGRYOIPVPLsZ/13GO5tkei5n?=
 =?iso-8859-1?Q?Wsj0cLiBnofoB1YPh4w0d68lix/riW449XpXamNT0tSnJpZEGNqAimG1Lc?=
 =?iso-8859-1?Q?dPKN9tzEuVHWXiJCotxZOL6a5KpauILR5ypRODKsSA2Uybw58UCWSVi+9Y?=
 =?iso-8859-1?Q?3KAZlPI0QH6smLG6Ye+loDABOc+0lPuhduyKFSedpubn8vC6WGfJxKAMIp?=
 =?iso-8859-1?Q?FWcBzRU0BUcyH1Rr3gN9n50NG37guzzPCrrAjxiODK5eIpQEiUNCs2OxwG?=
 =?iso-8859-1?Q?y99AGexoAXGic5kmzr0LYD9f8jRvfn4fWNUzwZVROCB6orPvFjCxeMchon?=
 =?iso-8859-1?Q?Itcfo84ghT90djrEIudHCKsqD3GjNcD6iDQwukmVO2eLmkYnGdwndsEYLu?=
 =?iso-8859-1?Q?G4Cswrk2gd8Q9F42gYqss6JzXOj1GIB3xN2QkMkcNyEcfsW9+GrzFfjXQ4?=
 =?iso-8859-1?Q?kPyRHVr175FNC8I0uBCZtZMiuJfX4tDdGCZjx4bmsZ5EJ3pVm9r+M8qpYy?=
 =?iso-8859-1?Q?YFShEAvBnd?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 70408966-f6c6-497e-a0a5-08dd949249ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 15:56:57.8673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_085709_860252_1345C491 
X-CRM114-Status: UNSURE (   3.32  )
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

Hi ,
=A0
I wanted to offer a data-informed opportunity that could support your aviat=
ion growth initiatives.
=A0
Our contact list is both fresh and accurate, specifically tailored for busi=
nesses like yours.
=A0
(i) High-Net-Worth Individuals (HNWI) in need of exclusive and custom trave=
l experiences=20
(ii) MRO Professionals optimizing maintenance and procurement operations=20
(iii) Executive Assistants assisting with executive travel coordination=20
=A0
Target the right prospects for your charter services, maintenance solutions=
, or aviation products with these segmented contacts.
=A0
I'm happy to send over the lead counts and their pricing for your review.
=A0
Regards,
Lena
Marketing Manager
Pro Tech Insights.,
=A0
Please respond with an Remove if you don't wish to receive further emails.

