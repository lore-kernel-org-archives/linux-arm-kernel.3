Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DC3CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRWB95Qlir73KKuDeIaeNHmxVlXHTz0Z2/ddJLSSCA8=; b=17IoyFUZXR4F1/Sbxv0nL9C7g4
	Bx88ka2rmNM0r0az1Tp7IB+guHBmyDV+7n6C1NHfBatufMw0aI8fOBOh6ZWwrtRMBXwcSTqQA6irQ
	3rY843w1JkQ3JbmIRamU1sPMHlyOa6E3qEZa/Xz3zyIDStvIktSHTmXri7QqUl17qoMXhxF6rVLrJ
	nvDOXtoScYSqOPi3q8GVLkS0pDLwihpv9tnMJUEkBWJ8PsCeJ4GS6OHDgZ8wWrdQCNqNdPxXjS8O4
	LbnGqSrHOegG0S2SWBL3SCloPXyyeMfB0KAD84SzKbHHd3mdtqMJvnIrKFHQOD0TkGuBKISbXMsIM
	+U5sgJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqTt-00000005VDT-3aXB;
	Thu, 23 Oct 2025 08:15:33 +0000
Received: from esa7.fujitsucc.c3s2.iphmx.com ([68.232.159.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqTn-00000005VBj-0joC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1761207326; x=1792743326;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=94N06QuM+VCr5zMtNQA3mmn3NEwoEv7ai1drIKf/x7M=;
  b=h4PMQ9SO+m/dwdPmeGccN0mzQQuq4D4y8n9rKqa9kl/MXBN2czAtX8U1
   7Jjs5+GJuOoo9cmqELKbVVrit957AF8pxrJje+vuAiGyNw6hco1FPucSx
   9swFQzHlwbaCL5q1vhPctyLHxo6WvC5Be8dtKvPjRyX1GJFkt0hykVSyl
   iM+84NeCDs/489vT9Y+OfKsZ8wNdzuA1DOMNlTVB/Ffco1NrRVkYrO8fK
   F7yl0A9NndrY6cJzr85/fFFtvasApvesBp8PU6DwzEtHjFPFU2XoavVP2
   SMciDxVX11O34Esdajmq6M3cmqbMkTwMsaGBR3i5VJf+56LFXeOlVTr5C
   A==;
X-CSE-ConnectionGUID: DteJmbfRQtyn3keapNWs+Q==
X-CSE-MsgGUID: Ucapsu9jTSqWz+uugCnSdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="171723380"
X-IronPort-AV: E=Sophos;i="6.19,249,1754924400"; 
   d="scan'208";a="171723380"
Received: from mail-japanwestazon11010022.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([52.101.228.22])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 17:15:14 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grzbjs9XwXNuhdPzFWopWes526vNnWUzcDDqBW6bu2+v0GCLxIGsRc3dHMLdREj3Y/LfmMiOS/GeRA+Sdx1ct6InWE0aiozfvLVb/RAfd/rsV3Tc5NycFSdmQtC1HJ4CdEUQvFpWK7Wp1cpaU1yBcy98MNo7dI4dO2KyBL0sHMu0Bk/DaaTOX+qQq8DvdIc7Vg6lQFh/hfNLfPXz5muh9I7SxASbVVqW+nahDdxutyso72zkVhWSMYOIu+ktzrMxPapXUv4y6ycpTjmm0GQtzM3AdqkC1e0pqONT0Y+TiiVCnt4ygtG39Dbo+gXrLbS8YlyS8oO7dCyNiwxxEeXg7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRWB95Qlir73KKuDeIaeNHmxVlXHTz0Z2/ddJLSSCA8=;
 b=jkVlQMc1jKDSm6Vi66uDWbsbINVR5xHusuDfImMB0jkcZuh7aYcm2UriGiTg0VYHQKGIJKqOam93GmaradUsgMfHBjlnsPucu7a02kNZQ5u9LJ4YFFo3rT8n93WybKFwrfwyfQRM1SAGhij1b7+1jz7JvBuIeKo/STDItZBe93eHioGamzsTTnQeMkejAQo3jSMH1MwcH4MoPLfiXrC2siqezqtFg2N5emHP15FXdOJlvJB6rMlR8JbB6KW+30QSYvhjxKibPW8FJ5+IJHGI7RV35Og/pIfIeYneKspMxyZDd7N5HBt0MpMYGd232HJOiXpNv6sWigrj+UQ4+sWEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRWB95Qlir73KKuDeIaeNHmxVlXHTz0Z2/ddJLSSCA8=;
 b=PJgVN44MVqiB5p8awfxOEN8RISZlyQJerCR7vwI3WC7GN1iNlzWXgyI/j8hMwog3TemUE555CXfV3ajXn8i+uFAVDqHR2+JLs1TiWifmKPsEAz3fHuQAatsIArHkJDeJYg1LJHVPK5BhOetSV+kl8/wJOYLcbqH6ZW7db+smJJDvcFpFPJs+53qpmzSIX13nSDUo2Kgg6A72fszRp8RF3gTLPVbwk2yZ6rqSe1eSaqWNqI/Tl2GABsHh/22kf8X0hRAMyv5Imo41EeY1xyNUyjrLMk9xmJV4bQrcysyeKTHFnCefo5158m6awFwTCgfmzrKPuNbjrkV5bQiyqrJnyQ==
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by OSCPR01MB16163.jpnprd01.prod.outlook.com (2603:1096:604:3e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 08:15:11 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::e366:d390:4474:8cfa]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::e366:d390:4474:8cfa%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 08:15:11 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'James Morse' <james.morse@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>
CC: D Scott Phillips OS <scott@os.amperecomputing.com>,
	"carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
	"lcherian@marvell.com" <lcherian@marvell.com>, "bobo.shaobowang@huawei.com"
	<bobo.shaobowang@huawei.com>, "baolin.wang@linux.alibaba.com"
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, Xin Hao
	<xhao@linux.alibaba.com>, "peternewman@google.com" <peternewman@google.com>,
	"dfustini@baylibre.com" <dfustini@baylibre.com>, "amitsinght@marvell.com"
	<amitsinght@marvell.com>, David Hildenbrand <david@redhat.com>, Dave Martin
	<dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker Donthineni
	<sdonthineni@nvidia.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, Rob Herring <robh@kernel.org>, Rohit Mathew
	<rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
	<guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, Gavin Shan <gshan@redhat.com>
Subject: RE: [PATCH v3 00/29] arm_mpam: Add basic mpam driver
Thread-Topic: [PATCH v3 00/29] arm_mpam: Add basic mpam driver
Thread-Index: AQHcP5fcVga2rgSrYEOj4Z5weGnRALTPamvA
Date: Thu, 23 Oct 2025 08:15:11 +0000
Message-ID: <OSZPR01MB87983EC9DDD46653231A6C7A8BF0A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20251017185645.26604-1-james.morse@arm.com>
In-Reply-To: <20251017185645.26604-1-james.morse@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=74e9b11a-221d-4a30-8984-33b081f44383;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-10-23T08:12:41Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|OSCPR01MB16163:EE_
x-ms-office365-filtering-correlation-id: 671eba32-f528-40b0-b7d6-08de120c49b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|13003099007|1580799027|38070700021;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?WGxibXN0NUZRbHhXVmpSUDlEVjdXRXV0ZTYrRURQK1p0MVhZbjJTNk1X?=
 =?iso-2022-jp?B?S2VwaG4zNUtwTzFwekRTK0VHdVFsZm0rWFNWb2tOV2w4dVFER0lNajZ3?=
 =?iso-2022-jp?B?UmZ2Vk92T2dzV2cyS1NwaTB2dDZMTFk4TDdUaFdaVWtWNDBJN3JZTlpT?=
 =?iso-2022-jp?B?MzdreXVhZThjUWozVWpXRmpkZmgvS1dpOTYraXpnV3BnUnlGWHZJYVhn?=
 =?iso-2022-jp?B?aFFEM3ZSNnQzb08zT3ltaytIblVPMVppU3pWcGFGbXFEWFZUZUxtb2tZ?=
 =?iso-2022-jp?B?dDhQeU50VXpldkRyRVF3UWZJZ2VNcWlpblZod2tLQW54ZFplOE90VGRO?=
 =?iso-2022-jp?B?d24ybVY3L1BPeXdFUWFmN3J2enYyVWpXbmkxS1VtanFsUGFUUWtiK1Ro?=
 =?iso-2022-jp?B?ZDBtUEhnMjV1UVFndzF4elVFUllSMEpSWVpjdk5LQnFDdVFBN1d6a1Bl?=
 =?iso-2022-jp?B?bmd3YkRobHcrOXBDaVBaUzMyeGxRdWVJMUpZQVBWYlFqeFROUllISU9N?=
 =?iso-2022-jp?B?UENTbEdhNGF0OTNWT0RoTnp4VGJSc2VoOU1rem5CMWFURUxTMmZzWUc0?=
 =?iso-2022-jp?B?VnEvMmFKdzFIWlE1ZFhCWllpdVJIYW4yN05TT1FEVWQrMHRMclJzTG9N?=
 =?iso-2022-jp?B?cHh6ZlpSTGs0ZDlWUmgrZFlueERNMU9qbElJVlVsR1hTRW1vOS9MdkY4?=
 =?iso-2022-jp?B?RjBpUmJPRnlqYkhmZno5S0FuOFJTVjIvYW9CbWg0L3RBZGx3eDN5MU56?=
 =?iso-2022-jp?B?S2RYV25oNHdLMGI0VVdrbnRtL3hkSU45eEJVcEN6bTFYeG5aVGt2NEFG?=
 =?iso-2022-jp?B?SW9yRVJpVUJJQmE3Nm8wejJQQUg0N3hhYXpFelVZUk5pNW5TZ00wMjk5?=
 =?iso-2022-jp?B?cHkvSTBsNUJtZURRTzVHazg2MkdTLzRCRmIxTkNMeDJHUHVjSmlzZWhK?=
 =?iso-2022-jp?B?Zm5lRWJ5Um8zNWhhY0paa0hGSEl1RmV0SWU2R29KdXk5QTNMcDdNbStk?=
 =?iso-2022-jp?B?eDdQRm5ORXdHK0JHazdHbjlnNzZzS3JwS2RpM2d5czBrZFBnWjd5dWdP?=
 =?iso-2022-jp?B?K05ra1ptOG53S2ZBeU5ZN0dpQkM2LzNPZ0NUYUNndHpQY3ZmNDhlMnVM?=
 =?iso-2022-jp?B?L1g5ekdxSTlEWVQ3eGt2THNJUmhJcm9zTE55dDk5QjBVWVN4K3JlYWoz?=
 =?iso-2022-jp?B?dm5tTWZQS2JIRUdONTMyc1pjY3lQNytVRVR5VWxNb2Q4VDlKYSs2N2VI?=
 =?iso-2022-jp?B?Uk94d3AvM1N0Q0dudmhjRmF3L1ZHaldZekdqTjJVMzgwZ3cvY3F2dzFz?=
 =?iso-2022-jp?B?UldUL2x6UE9aWWZmNnRTYzZZSU10K2hqaDNyS1JNcUQvYTNUYU1BK1FM?=
 =?iso-2022-jp?B?bVA1alcwdE10WG4vK0dYZlFDZldwMlY4VGdLdTBqb1ZsU3pobXpobjBM?=
 =?iso-2022-jp?B?dTdGNUlXczh6d21Uc1pBNHIyd2kzbUs1NE1tc0U0Uzl0TjJzRUdVVEZp?=
 =?iso-2022-jp?B?MUIwYXkvN1BybXpvNWprRmlCajV6ZTZ4L2J4VWtxRE1xL3FoSFA5ajdM?=
 =?iso-2022-jp?B?SzlMeS9BdFVFOUZZRnN3YkhnZnIwOGE3N08zZ3VEZkF6NEtMMTU4RzNq?=
 =?iso-2022-jp?B?VnBTZkExb2RLZmRUNE1kSHZNbDFXajhpbDNpTzh0TFgzeGJnMGVlTngv?=
 =?iso-2022-jp?B?VENnYjF6N1BDVURhVzQ5WGZ6RTRQd3dZVWlQZVE0NjlmV3N1R05NLzhv?=
 =?iso-2022-jp?B?VmRucVkvenprV3ZERllUNDNPOHRmNzJNakVlZlVYalZ3MUNCQ1BDc0w1?=
 =?iso-2022-jp?B?emVFY1dqeGp5RkdxR1AwZ3JUZWxqMTRJM3Rvb2xZcWo2cFI3RXRtdnZ1?=
 =?iso-2022-jp?B?WXp5eHZONk8wdGVkUUFraTRERUJNRWZkR3F1ZzgyUkJtanhsM3JYN2JE?=
 =?iso-2022-jp?B?SHpSZ1AxSWtsOUFPVFNZOVYvS29xZ0hZbzRKT2Y1RG5KbU5HSkJXdWJj?=
 =?iso-2022-jp?B?eXhNV1RBU3ZlZGFsVWNQckROZEFMOUY2WTUvbFV6Vzd0RDhndVZjZnpy?=
 =?iso-2022-jp?B?STgwNkFoRGFTc0hjWmlmWTQwb2VPbTVrWU5LNjRBSU5ESTdyM1ZNbTlV?=
 =?iso-2022-jp?B?TmdIdVpWeFFXdXpzSmppeTNpU3pRL3NUZ3ZHMlRmcVpSZ2xNb1Zua2d1?=
 =?iso-2022-jp?B?V09ibHljeHArRmJpTHhSS1ZyU0tIakFvY3crWXBsc1BXZUNRc0pBaFkw?=
 =?iso-2022-jp?B?KzNuSHA2R2xhNWFqN3RCeXh2ZTJZMkYxTT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(13003099007)(1580799027)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?Ly9UZlBXeW83dGMzOUp2MmZYUTkzakliTzh6N3dXOUFFcFV1SnNyZEg5?=
 =?iso-2022-jp?B?NnpCcW9IbXlGelQvOVEzWEpncmVTVmFBeE9vSmFWSVpEdDlINjV4Tk5q?=
 =?iso-2022-jp?B?bFpzVTJYZW9hK3l2REtVc2FKVGcrRERjRnhSK1YxK2Q4SytHdHB0cGdJ?=
 =?iso-2022-jp?B?KzF0Ym1Bb044cXR4OW84OGRuSHhaeWxOQVdFVkFIenlLSEx6bnhQUnd3?=
 =?iso-2022-jp?B?UHJ2ZHN4TWZLWFNnekljMGZKeVp3anVpYlZBVkhzbVRqYU1qa1RtdnRk?=
 =?iso-2022-jp?B?dTMydnNEVVIrbFBRWkcwblhkRGhUNEZMN1RJdWcvVExINWg3dEdMYlJx?=
 =?iso-2022-jp?B?N2hTRmdmY2s5d2lEV0U0dFNqTFRRYkU3aWd4QzluZGdpREtqRFRKVElI?=
 =?iso-2022-jp?B?Qml2RXhScDF4UUdTOEJDTE4zajlOaXNHVmhPSXlEWk5USWRjMzdSOElm?=
 =?iso-2022-jp?B?SVRBc3plcVZlS3hhZnkva2FlanJLeG42OGRKbU5oVUZYUDUzdndtVWFH?=
 =?iso-2022-jp?B?S3dERDFhK2ZTOEJoUWx0OW9pNkFmMkJqNTV6ajNKMTV5NytQUWRmMTZ0?=
 =?iso-2022-jp?B?UlZnaDNxZXFGWlF5MGUrbUI4WXR3ZURiTkVXbyt1ZmFwbkZTQmdFL2hR?=
 =?iso-2022-jp?B?VmRrc1VXZzVwRE9KcEx6bjI0UXoyU2s2VHRhL1BSMDI2QlJ4bk5iQXFr?=
 =?iso-2022-jp?B?YWx3YnV6ejZOeTRybklLUi9pbzhpbEJlSHpOQW5ERlZ0MmVidU1ONXNQ?=
 =?iso-2022-jp?B?SFp2ZFVwTDg2UHFZY1F5U0FJd1FaekJlQUpabnUwMkNuZCsrMDNNYkh5?=
 =?iso-2022-jp?B?T0dYcmtjNTR4WURUekNPNjFVcWdLaHdQUkl3SURKdWFBNFZ0SW5sZklY?=
 =?iso-2022-jp?B?dG1VZEJnaHRYNEZnRklOKzFSWERYT2FrVkhqZnR1WmxQZzBxNURUK2Yx?=
 =?iso-2022-jp?B?WTY5WS9vRG5hbjg3NTAwcW1YQlA3SEZkbFZNNUt5OExndGZHVmQ2Y0k0?=
 =?iso-2022-jp?B?d0wwaWlUYzhsYWNRcVJIbVRqeHNVeXJ4VERGUGVLM1ZkRHByYVd1dnJo?=
 =?iso-2022-jp?B?OFlBQXpIN2lTcy96YXA0WE41Um1salJSa3R5ZG5HNHR0SVprZjhrVEJa?=
 =?iso-2022-jp?B?VjQ4NFFBWklSRjhqRHZBbjh0WGxpU0JYQUh2ZUo2a3ZtMlhIWkxBZWxK?=
 =?iso-2022-jp?B?WkNWdDFkanFBVFI2Qmloak5RWXRWcXRPMldudXBUNW16TXd5VmZTUGNv?=
 =?iso-2022-jp?B?eHlmK1gwVDlMV2pmRk51OWJZdlFXR0NpMWRhWDgxV2owN0dJb2tPKzJs?=
 =?iso-2022-jp?B?eWhQRGFvMFg4a0FrY2ZDZnhDdUdYUnRrMWt2amRLZVR0cmsxc0NydEJt?=
 =?iso-2022-jp?B?bU1SUThoaExkN0dWdWR0UkJpb2Nnb2h6aHZoWXMwRjArTFhqT3Q0ZllQ?=
 =?iso-2022-jp?B?NThMTzJOaUZEZ3pTTVpONWdieFlpR2dMbkxDS1IvamVIdGtVbDVTUUs4?=
 =?iso-2022-jp?B?VTFxTE9uSktzRmJ2V01DWFpMWlEwelpnNFJGejVibzVLbDhPZVg2UFZ3?=
 =?iso-2022-jp?B?UVo4b3V1REUvdm84Zkc4VnBOZmVjVzZkUHV1N1FuVTVITjJHWHcrWHoy?=
 =?iso-2022-jp?B?NDdRZmdCNHlRWURmZ0thd1k1YUxjY05nMlBBbWF3SE4vVkt6U29ibXFF?=
 =?iso-2022-jp?B?R2NwUERtNDJwQjdtb25EVWd3ZGFEQzBNbUlyeStMOFVFTkZ1NU1SeG1T?=
 =?iso-2022-jp?B?UmV3c25iU1V1WkFkdkZBbHhVRDdUVFhlSzUrWkd1MVNQR1NlQVhKYmp2?=
 =?iso-2022-jp?B?MEw3cUxCaDVKaE1mUmpNQ2ZLeDFGTkVLSDc1NmxRTWtsU2V4RlEvSktU?=
 =?iso-2022-jp?B?VmQwU2FpTnpjd21HSVBOZElPQkIrQ2FpcW8vc2VFVWtqRy9oZW5rcGJv?=
 =?iso-2022-jp?B?RWlpOU41b0xUNVNJUklpdTZZUng0MldBbTNyaXY2clF4V3VaK0FrYmN6?=
 =?iso-2022-jp?B?dURQM240VjlpNmExNzB0YnZRUGI1OUxTa09yOW1OMk9YTFJTU1BQZEJS?=
 =?iso-2022-jp?B?V2x3L3VKOVFzWEZvU2xVVENJSVhpUy9ZV1dsbGswZmNvYzBoem1KQjZx?=
 =?iso-2022-jp?B?K3VlSmRwaERCUjdSMHhJdS9mSVBYN3FNZHVjVjJ1eU5QOENTTXF3TXlP?=
 =?iso-2022-jp?B?RlhJV2dEUVRTNXlQMDZYaDNaeUZQYVRHaGtDU0ZmUCtSOHFNNGRCN05P?=
 =?iso-2022-jp?B?dHhFYkZTWU9hb1JjTi9VYXJmVXZuQXVPYkdRTWIxK1RXSnhsZG9NOC84?=
 =?iso-2022-jp?B?M29zQXlWNCt6Vm44T1lmQzJmTEdTSjI3Unc9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ffxKn/97q/Llb8Az/0EBY0xUPQedyZmOXEEEbPGUDL/43J9agzPqt1g8d7PYUNjPfPX7NkYE2ndzGLMe/v+Kutxm5I/3Q8ZzVeXksdhViX1RRWzX62bAwfz+vFPpoUV8N92I8nFjxWGBYuVFHbRGW4c6t/3MSwr2tv7vUMyLgPIpSEhPsvb8FQAosVBVg9MzdMlKMTTujs3Pyzn/uaMNFZBQokRdMZ2vBg9YtLrUIlI6YmPQbQqx600kqcg26vYopJCF9fnu7UJ0ZEl6XRgh54G75xrwg+k9BegYEJxTxw0uaxdgwjC9EoEg1k+mIB3egY6i6X8Y/7pBJK18XtO0NOgKsHZl9D8yiqh7e4/uj/0TsZ9ZIT0c/+l6TNt8JBfpRPPme0e6EfAr0+0ZAtsuMbpV+92v8ayUShpsaW/EzhpVhLkN5/JL4fwJI+06XsfIcy34OG3Ykj7cnjd0GFINxz7fIy2iE86NuULZrMJuX7Lo0BRxXywItVLvJlYAqVm2knO/x830B0f/HVH4sKwxYfA22XmCtpFJ6Cpnz9yCAnLw+iv0wlp1rOM6W32g98yWWAIiaVTPFnFVCSkmBhNDyJf6dJThJPfxl+5NcjGHbx3cjiCBDDnf8Gi7d2mZoH/8
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671eba32-f528-40b0-b7d6-08de120c49b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 08:15:11.8451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bUMU/iA20FUzNBj9mBpC1nXbxvf4unV0aYZ/RHg2LSAmnp5LIfhE288TDkO02WkKzANKOZiTxfnaLaXVMSZ6Z5U/W5yjS7SrT8maElOwXRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_011527_925583_700BF515 
X-CRM114-Status: GOOD (  11.03  )
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

Hello James,

> This series is based on v6.18-rc4, and can be retrieved from:
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
> mpam/driver/v3
>=20
> The rest of the driver can be found here:
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
> mpam/snapshot/v6.18-rc1

This series(mpam/driver/v3) based on v6.18-rc1 and mpam driver(mpam/snapsho=
t/v6.18-rc1) can not run on my machine(The cause is still unknown),
But I applied this series and mpam driver on v6.18-rc2, they are run succes=
sfully.

Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

However, I make a few minor fixes as follows:

1)
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_interna=
l.h
index f890d1381af6..dd6041ae7cc9 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -645,6 +645,13 @@ static inline void mpam_resctrl_teardown_class(struct =
mpam_class *class) { }
 #define MPAMF_IIDR_VARIANT     GENMASK(19, 16)
 #define MPAMF_IIDR_PRODUCTID   GENMASK(31, 20)
+#define MPAMF_IIDR_REVISON_SHIFT       12
+//#define MPAMF_IIDR_REVISION_SHIFT    12
+#define MPAMF_IIDR_IMPLEMENTER_SHIFT    0
+#define MPAMF_IIDR_VARIANT_SHIFT    16
+#define MPAMF_IIDR_PRODUCTID_SHIFT    20

or
#define IIDR_REV(x)     ((x) << MPAMF_IIDR_REVISON_SHIFT)
s/MPAMF_IIDR_REVISON_SHIFT/MPAMF_IIDR_REVISION_SHIFT/


2)
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.=
c
index 0ea76b7783b6..99b2bbb80a5a 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1113,9 +1118,9 @@ static void mpam_resctrl_pick_counters(void)
                                        update_rmid_limits(cache_size);

                                counter_update_class(QOS_L3_OCCUP_EVENT_ID,=
 class);
-                               return;
+                               break;
                        default:
-                               return;
+                               break;
                        }
                }


3)
when building this series(mpam/driver/v3),the `EXPERT` Kconfig option needs=
 to be explicitly enabled.
This aligns with Ben's observation in the following patch:
https://lore.kernel.org/lkml/146ad8f4-ef6c-48cb-aed8-db619c8258a8@arm.com/


Best regards,
Shaopeng TAN


