Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3241FCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 20:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FyEUtKFLklEUtpQe0DxzOZL12124nnWWfV6AmUlXpPo=; b=t4+qeiu72EsS8G
	Pm/ciSXZ6uOGGv6LcEioZ9ERf5tcTasN4k+jMALd0j50a4eLU2L9OcxuIxXL/pkXqfaHH7WXbkGoP
	tJtdQc0saBqiUhrg9g+zODFiATJHeyfMUCLKlJqQafD8030YLVtie0zCpgLRSY/xULfx8qHUuozHF
	UZ+K4iSYVIEEcuF7EoW/Mz6cWejPy7u9eqAg/7qO6CQyOTnRbeMPYwImH2wq9qcrFXGz5gayZa+ee
	7R6919mLqU6+NUYHFAA+HOPB2f5LPTY7EqCB4mY+w/pQryki/oCTmdJxGms9qEyTlbKnYx5hw/PJL
	61tyvZSYFMKYgRzJ5APw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEvwB-00000006n4d-0vZT;
	Fri, 31 Oct 2025 20:41:31 +0000
Received: from mail-southcentralusazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d10c::1] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEvw9-00000006n47-0eNk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 20:41:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=et/QYiVN4WcLOihsz2VG5vNbPe4vQUeQYsjjPn2a6I1dGWh+s+vFhbgT81myD7MbTwdlrLW9iYIVzgUaAf4rJtXPSDntmGjMs95nyeO1u58lgZilqyxi4uTxvRmQIgQ+VXWhpR+CeoC7qQpY1UbE4r5JqqomoxrOrWBq51cyLYpLMZDKBzSEPCp9IxgUfCD6BTdAWusUUaLE9j+kIBuv21r0WjUJ5rMpGNvv997dY145s4BU/MkTvVw0TXUO1S00NlHR9KH2XvapjKWxEFo8Sa0I+ylqycxAfynyzbt3iuav7x+634XwoxsGTFYoyv0AZur5o7fz6fdj2jSgQdR3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyEUtKFLklEUtpQe0DxzOZL12124nnWWfV6AmUlXpPo=;
 b=j2I0iX9ghQdtecjhM9d8V0VWHQkmKVAf0JaNJ/vbQtzTIFkFa0WI40NXslNMcu83FRFsSnNT0jOlivG95AIrFcd4llMT3rCxmtKjYgtYTNPVx4MYkU5EqJmKnIYG4vjJs2FFf+W9L6RN7lwHsiSJlkuBk6ET+u1Ilh+VQxdlbhaxNnljHsrCikTZ+9mTy9DhCNAHJVZfVpGq9O3A8M1wv+krc2TmPj84J9bjQNGXaoKBaS9kT+ZjebhV8/kJcnhy1TtkLh1atFOik6nSnDUm2tCpKFA9KAKuBuXqxISxAhHwnD7SKdetlxje5IP6SpMlNdQWEYCIo0Rffh3nJL5+xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyEUtKFLklEUtpQe0DxzOZL12124nnWWfV6AmUlXpPo=;
 b=Kz9+nM5GDShWcbGaLsZA7k8Ep3aaFYYMF+Ll//u3jDx1fNnyHKapde3sEvGe/fjfD+2zE0DZN1GljhzmqdnTIx7R4ZZLAX1ONKUhUUNDPPFTy9ypLOHCppEAa8p86jGxhFo0301xNKkHvQJwSlPNVXjrj9ZRLX0Wgu0yg0BiMp8qQUiuh3CMidrXSduA3oyh8adiNw6V8kKzcBmSc7Wv10TRymQdLsWylq+x8lmv6Ry/KyaKBx+Bxu2vF/ZOMDnKJ8eclSvvfhRAsYoriTdq1G+zgr5syHyrcHf8bH5t21h/af//s1DlRUA2jOnGO7TqCc4tG1dLiW0xCH45OvzrWg==
Received: from BLAPR20MB4051.namprd20.prod.outlook.com (2603:10b6:208:320::7)
 by SJ2PR20MB6068.namprd20.prod.outlook.com (2603:10b6:a03:503::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 20:41:24 +0000
Received: from BLAPR20MB4051.namprd20.prod.outlook.com
 ([fe80::a906:5176:fea3:94f0]) by BLAPR20MB4051.namprd20.prod.outlook.com
 ([fe80::a906:5176:fea3:94f0%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 20:41:24 +0000
From: Ben Graham <ben.usmarketingdata@outlook.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Reach HNWIs and Executive Assistants Using Leftover Funds
Thread-Topic: Reach HNWIs and Executive Assistants Using Leftover Funds
Thread-Index: AdxKcVxK+cbHOO4cSR2r6GDFGkJEyw==
Date: Fri, 31 Oct 2025 20:41:24 +0000
Message-ID: <BLAPR20MB4051D48B6C14275CC7E008EFE9F8A@BLAPR20MB4051.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BLAPR20MB4051:EE_|SJ2PR20MB6068:EE_
x-ms-office365-filtering-correlation-id: bdf950b7-2fc4-4e3f-4b26-08de18bddb55
x-microsoft-antispam: BCL:0;ARA:14566002|461199028|31061999003|8062599012|8060799015|19110799012|11091999009|13091999003|15080799012|440099028|3412199025|19061999003|39105399003|51005399003|40105399003|31101999003|102099032;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Vp+m0/FZCRwYQD1sDBWaIMbPP1docxoOCRAJsDdveucKFWGKmh4B4dO7Ri?=
 =?iso-8859-1?Q?TjoDWBa84smsyhI5c0Y47B139OuuMOhGSa4BJp+GEdGXn251ZJzbMNYyVv?=
 =?iso-8859-1?Q?IMJs7t/JTlTcWGDFlBfQ1swurAk1jw3Xi+cnj2wNc8iRw3i4ZVUnVSqZgt?=
 =?iso-8859-1?Q?MUCV52jddOegPcnuUYSrjOtSAvnvpJdBNEJafFxQQNrkeEJSk019iDa083?=
 =?iso-8859-1?Q?4cdZMe/SpdVOK+fsKLYVoa+fLwZRqdmWxWel6LzsbVpKrYVcLoO+EJOX3P?=
 =?iso-8859-1?Q?nxxtHEKuP6VFENUns6U56cS7lr4ML5pdozRGpq8gKGtJVf1UNkw1QkTLKb?=
 =?iso-8859-1?Q?76nd/Jptnugtl8zVjxuoCzhjIHl7y4e7zK4Ns84YQ4XuJDBICBULv0og/t?=
 =?iso-8859-1?Q?AR+Cfn/m7T7ImypG52ZCTry+ru5ZT6qa2WhrT+xewoMmSjIzoFUyesZ8Ht?=
 =?iso-8859-1?Q?Qnu6PXrqzYzrEXY4tLhrw+aLnC/sQWHJKVSX1STANfdI0g2QUww0Cu/KPK?=
 =?iso-8859-1?Q?88mhpDXWzqpxNdWVWSFMadF+FdzSezqnJLILj+n7iWswg8dorMfwOz6hqj?=
 =?iso-8859-1?Q?jpWybVTJGkaKoezvX8hRAx6pwY9nhTDz7uGvdOD5P90zyWOemQHd++QWVs?=
 =?iso-8859-1?Q?IgJIx93zh3LsBVrTMHXIDp64002eg2WKlfkJxbDoWhwzMG/OhhBpFkAXyj?=
 =?iso-8859-1?Q?dyOoXnettkzd2Dm/o4Eqivu0M9tcNhOeRJ9pVCa39P7NzLa9Dn5wwTENNq?=
 =?iso-8859-1?Q?5VKYB/0AKwQdSts9/ndEvnAzUnYo/LR766lUb4Shi4NF/xQo8ywgTRCqNV?=
 =?iso-8859-1?Q?x0aaX2kZS6hZtuHtD6AjIgWQKfPqxqgvccn9sadA4O6OENk7jkT0J3ghpl?=
 =?iso-8859-1?Q?TV28Xgx6sc7UXsf7I7P6QfAf+4EMx1Q6DDZbI5cMHlEighg1auUYImPtSQ?=
 =?iso-8859-1?Q?cu7DcVs9gjnEBraIA3tOqFXBpGXcMDxpO8zgvBYT8wq2rqcgcRSIPwraJX?=
 =?iso-8859-1?Q?fgC1KkwZOT4oLEMeQlPo+k/0Jf6hwwosoine3eyZcH6+JRRqcRc/KBgAXj?=
 =?iso-8859-1?Q?OooFk49Ko1QWmZLk5nuvWYpBSf+QgQi1PiQXBo7xsAzMJ7fCjuX0Isfb3v?=
 =?iso-8859-1?Q?lsC63mHYIakV3a8tojteoTVgmwjsOb4yU+b9DrjYdiwbY4OOYCdQ9QbAeD?=
 =?iso-8859-1?Q?7zuN+N3eIgnFwDOQDN9ajhJ84qT6GkmbNnbD6UNcNljgfYhfpBAFAh2AJe?=
 =?iso-8859-1?Q?0+iV5Tq5iBFw3ZSo1YyTBfWgJNXe5v5RRgFAYQDaOP6dG/boiYzF3XJylF?=
 =?iso-8859-1?Q?WTTfCSaZwsg72JoX/GmfvgyVXFb+D8vCFAQxC4PhFBveJa4bJnL9FVS3g2?=
 =?iso-8859-1?Q?36KXWP5y0upwQzqfoHxJ1nrJWZByG4HQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?a0WP0v40jmsh8GN8n8GNS1RQoJuR1f6EvylJMyVE3uclGCBnnCAKDLhGHe?=
 =?iso-8859-1?Q?5dF1IzUiBTeL7cKxuddAaAUfPcouShQ1N6GPd6j1ORNFhj6I12YOICQKiN?=
 =?iso-8859-1?Q?3+44Bwww7fTBRhFF2H8/Bj3f+48y+s4Y/PRvzf02OwDRU2wTxo7gxf5Iz/?=
 =?iso-8859-1?Q?pXMsziTaRg5U1QGRvHUI2o1KXeZh+PKHfJBjd5YCol372WSG9UcCeVGGJ4?=
 =?iso-8859-1?Q?qShqR5SB0ndgU9hQ+PEJsctOFWeyUQu7qOOfXF5fjFJYSJ514IYrLmGQk7?=
 =?iso-8859-1?Q?gzYmS97RB02ZIk9dRCkBNiLmQFxR7L13fb3Vi2KcEYWVoWhE3mxfVElZoN?=
 =?iso-8859-1?Q?LjWkPHQVsfOIKgr9QAanEuOokXJ1C2vAsccwwHPTFW+QGE3InfGNWveW3z?=
 =?iso-8859-1?Q?y52pLdrkwr70Mfkl2CBxPd3PXdS5qMz/yaX4XnjSg4hQ0Lffhq/VBOHcSj?=
 =?iso-8859-1?Q?meCM6QXIqar2g7mCa3+J0/ia2Nb1ZCYQLYvMVzqp/JJIlNvDPmtdSAqZLe?=
 =?iso-8859-1?Q?GoEzpVPJD2pZw5g6WsjDnpkTKEN/2K5Ix+y7MnH9IzrSPGrAwoL+0cUb4b?=
 =?iso-8859-1?Q?2XpC5FuhCC+GgYURlMjbzX7ED/BMS2qP6t1H4alCeGlDdW/g34DXfmkO4C?=
 =?iso-8859-1?Q?o/CVr8JBCdUzmtLpgyCYkiloCq5iUJ1+/9QNrLHEawAjsrgPPYmdnk6gNA?=
 =?iso-8859-1?Q?KsDj75BoqILjzSLfdvpE7Usb8zZDs2JoQoSruXNzsbNbIc/fjzeCbCaNpg?=
 =?iso-8859-1?Q?kTx03Kve7rFeC4Ln0fPZK2BTBCgwnKxJ6O1fNHs0umjTbN9uNcxzWIyUng?=
 =?iso-8859-1?Q?2n9LbeucIpi/hH1J7Pw0gOQblW88doPiFo2ox2qDEyMWiXsUHvrOpgbl1O?=
 =?iso-8859-1?Q?ZBdbRhFI2JFPkAzIMPeuH5I6drS/ioeVWHZ2UUpqhFuUGkgneZQnoYj3u9?=
 =?iso-8859-1?Q?2PW92uvmoQjK8FFSrE3TUVN4369ugjEp1D8eGGEjZwCPyJQo9hsF1KPxbw?=
 =?iso-8859-1?Q?QLw/AqQ+zZBPGXsSJknJjcsLMKBt5RhoAcSdji2pro1NtixiT1SZs6dp1x?=
 =?iso-8859-1?Q?0+YpeW/2FBbWiepwkDYh9iwlzzkdb6pupNXYzSjduwoPxaafHEZfGB6Gju?=
 =?iso-8859-1?Q?WRBC9hrwCMtcK2HjzgEXbJseQDvoxkHXGQBUWxRACdTWFiLycIrP4+DZLT?=
 =?iso-8859-1?Q?NHjZ+GKny3hXbUu6E/Cz4332l+X0Hwou0WfF5nUwlQg/9lhRlDGMK1V+Qd?=
 =?iso-8859-1?Q?yyjeVz04AaURq+yINbHmU1ZTPp0sH5XyV9uJGjCa5TGXIIuOLHO7X/orWj?=
 =?iso-8859-1?Q?ZkPXU4j1VHu0oqUmkZMM74TYYI4s6AgMGKDJpZAnhu3njYL5XBLJM07vAm?=
 =?iso-8859-1?Q?w5RetlSumC?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BLAPR20MB4051.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf950b7-2fc4-4e3f-4b26-08de18bddb55
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 20:41:24.0336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR20MB6068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_134129_291405_41C59C9B 
X-CRM114-Status: UNSURE (   2.54  )
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

Hi ,=20
=A0
The final quarter gives you an excellent chance to optimize your marketing =
spend effectively.=20
=A0
Our verified database is built for targeting Executive Assistants and high-=
net-worth individuals.=20
=A0
Executive Assistants: USA - 25,000 | Europe - 15,000 | Canada - 2,000 | Mid=
dle East - 2,500
=A0
HNWI & Senior Decision-Makers (incl. EAs): USA - 500,000 | Europe - 50,000 =
| Canada - 10,000 | UAE - 7,500
=A0
The database contains Business Owners, Founders, Entrepreneurs, C-Level Exe=
cutives, VPs, and Executive Assistants.=20
=A0
Data fields: Name, Job Title, Company, URL, Email, Revenue and more.=20
=A0
This list allows contact with gatekeepers and decision-makers handling char=
ter service arrangements.=20
=A0
I can share the rates if you want to know.=20
=A0
I look forward to your note.=20
=A0
Regards
Ben Graham
Demand Generation Manager
US Marketing Data Inc.,
=A0
Please reply with REMOVE if you don't wish to receive further emails

