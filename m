Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7075C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 01:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZquMrz3MxhujiT3zoWS1KqMIbTBGGKKaL07o76V0Tc=; b=euXGdekp5rCf1NvinpFewif3QY
	cf+sXv6wepDHSt370S7XdVxWfNxS5dQIuY1w5jwrmdqqSI6dRTBd+uU3Sbqm0ORlwqY0rnZ32Uudg
	YLt66N/zLAHI2D87ySq+/B1cIKFRGxJagrzuHXm1/vxugefJaBmupdGf/0vb7f/Zpho/c3xfc6Z7A
	aR6Ve1zsv/MAdNgc88vKeZBz/bdHF1u43Kli5gbg1aSHkeonhJpXrwtawY0imyK5AxZIkVu163BPV
	QtYgCH8e0H136WEPlYgBDkcVGE/uXEF7KOySkbWLXR+wa4+tcgE2N0Wm68gzYXvCSd41dgiZu3YNI
	ZiDWbxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Khc-00000005tV9-37wf;
	Wed, 09 Apr 2025 01:58:08 +0000
Received: from esa10.fujitsucc.c3s2.iphmx.com ([68.232.159.247])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Kfm-00000005tMZ-0ik6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 01:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1744163774; x=1775699774;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3ZquMrz3MxhujiT3zoWS1KqMIbTBGGKKaL07o76V0Tc=;
  b=Nlw6PkzSVdU6x4T+Ag9yQ19feZouoej12Xc6k+Y74iUKIaGeeMBd0pAE
   cv/poJ/iymc62VizKlds0/aVCLt9LFuCtPsx4gxY32yTe+2cUdPMOU//T
   ZPHqze+R+tAKRLgMIYEyuIapgWubrhhcUxkvj3ybKEX0lM4fkQMXjwYim
   kNwHyw5zfGboC7a4EhFr1vKjVkRXsfxvf8QFfAyrcRWG8eDl5/NbIF7sf
   Gah80O2a232sCInu6qsLfY6069huyRoDcm4+I0YBI5+a+rilZ4SBSRQkq
   EYacxYmogUvG9ppmpMy/MgWaAtrXAV8iJqzv2QzrVi9HiSzeeFjPJGZkQ
   w==;
X-CSE-ConnectionGUID: bpwf/8SWRpeqGHRnRrkA8Q==
X-CSE-MsgGUID: RIZW0EVVQ9aMEJufsuWtSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="152289704"
X-IronPort-AV: E=Sophos;i="6.15,199,1739804400"; 
   d="scan'208";a="152289704"
Received: from mail-japaneastazlp17010005.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.5])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 10:56:07 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWCTd6e0IzjGgVcc5PCxsFj7+WTQ0eX+X162R+TVGem0Y9qSo+CqgCzuuVvWxu/oRgLsw3LbmHyr6s9PlikSVxgA/EheWzQazGafrHJAJhOTaiZmRZ/iKa6i0wMYHFGmNMUxUgv4tInVfNrLVzHvyBOpZkDB/TxSbVetiOJ15IH/XidqB4kMrstH+WL1xTDw1xDJe1hPw0fZv/TaedP/X/E+1opGZKA34h3IZI8pFi8Ia0x2SBIMR0Z1BeBcZogFFo/9JvQI044j2lpkL7B756bsgErQkhTo36TyzvLn0ykA5ulfNX5krXyn/Rqfl+2xY+9R8Ui4ZQnz/ZM6y7LbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZquMrz3MxhujiT3zoWS1KqMIbTBGGKKaL07o76V0Tc=;
 b=yR0g7rdOC8D9wlz6uopTV35pkYn1NwGEylMmrKtui+jKhbwJROqn++zbUC0GAj1TE9pClQWkJxkDiWVGJ1t/mZjxPRzA8nZbtyDm3qRXgt0wfHeP6MOJRdB+QAGZ20A76946XeHTN1F8d/hZKAeCn/2GxEPp7ISQ6/ySjgD3WGb3OmYF6bg+bxBinlW/I/hGBtBBUwVMQkY6SQpUpeOmw9IrjpWueyZR0EfV5eaohyyevFMN9ShL/MD75wE9BhxSWpKFnc9pOU5XjWSi4h8rmKQHZwCyiMzngAV0pQRNxePDDO8An7++we0o+RacaeRLiepF52CVctfrmRtWLcvGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by OS0PR01MB6163.jpnprd01.prod.outlook.com (2603:1096:604:b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 01:56:00 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%7]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 01:56:00 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'Xi Ruoyao' <xry111@xry111.site>, 'James Morse' <james.morse@arm.com>,
	'Marc Zyngier' <maz@kernel.org>, 'Anshuman Khandual'
	<anshuman.khandual@arm.com>
CC: "'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>, "'linux-kernel@vger.kernel.org'"
	<linux-kernel@vger.kernel.org>, 'Xi Ruoyao' <xry111@xry111.site>, 'Shameer
 Kolothum' <shameerali.kolothum.thodi@huawei.com>, 'Mingcong Bai'
	<jeffbai@aosc.io>
Subject: RE: [PATCH v2] arm64: Add overrride for MPAM
Thread-Topic: [PATCH v2] arm64: Add overrride for MPAM
Thread-Index: AQHbqOvOCwL1ZLd1A0uBFPTiuax9UrOakkrA
Date: Wed, 9 Apr 2025 01:56:00 +0000
Message-ID: <OSZPR01MB879875C1914245E1556838F58BB42@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20250402031603.35411-1-xry111@xry111.site>
In-Reply-To: <20250402031603.35411-1-xry111@xry111.site>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=e813e31c-f6bb-41ab-a6f4-5eb900dc78eb;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-04-09T01:52:36Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|OS0PR01MB6163:EE_
x-ms-office365-filtering-correlation-id: 2f38466a-b160-471b-c2dd-08dd7709ad7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|1580799027|38070700018;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?YkdaMFljckEzNUQvYkVnc2k3YTBlbUNwWUdhSm13RFRHU1pHZTFFMGN2?=
 =?iso-2022-jp?B?SENhRVpZTitkNlU1cDU1dWErZ3dWK1RSMDRkY0crSVBFVXpoQlZRcXha?=
 =?iso-2022-jp?B?OUpXZTIwT2x0UTE5SmdvNVVPUlRrYm9idS94UkNXSG5vT3Y2T09VNkhM?=
 =?iso-2022-jp?B?WjIzN2ZKZk1oa2pzZ0k0bkwwWjlRclNremhJMjdYL1FWVHNVTngwbXhD?=
 =?iso-2022-jp?B?NTJqTGgvMVFPRzF5Lyt2djV1TlN1YTdhTzNsR1V3YVJMREx3VDlOSy9k?=
 =?iso-2022-jp?B?MndpMzNVSmR4OWJRT25pYkJiTkhVRlVwYkUrSEltNGdUVnNvbWN2Y24r?=
 =?iso-2022-jp?B?YUt6aXdmRDJBd3VVSS9QZ2RLdnJ2L1N5ZnRMenFneU40ZkV6MEljWmti?=
 =?iso-2022-jp?B?cjlPMEhZY0Y5ZHZucjFwQmJuZmMzS3l6MitsWlJHa0x2OENGZ2JHZjdy?=
 =?iso-2022-jp?B?c2J0LzIwOTNhbEF0bWFxbUY0WUx1cVJCNnd6Y2ROYURlNjNYK29IallQ?=
 =?iso-2022-jp?B?VlRQenErempUVFZ6cWpIQnoxdk5OdXhVaTU4WGdBWE1ZU2VneWw1d3Ar?=
 =?iso-2022-jp?B?S056Uktza1daMFhWSVhIb0p5UFFRSEg3MlljY0U1L3Z4S1NZcWkxL3k1?=
 =?iso-2022-jp?B?UFN4NDB3Rk00aHFtallmRWJSWTg1YnJyZXJndzlidVNFM3dQUysweW1N?=
 =?iso-2022-jp?B?YU9LMlhWYkdVQ2Q4WEd2UjlDeWZFRmlXNkxQd01heGZ0R2hWRm1pNXZM?=
 =?iso-2022-jp?B?YUJKYXE5UUkzQVdBSCtWVlp6L0NHL1JYcFkzdzQ3dFF3ZGNSUUx1OVFk?=
 =?iso-2022-jp?B?Z0xKb3p3M0hkcjV6NXEyTkxtVnh4YW5ad2krZVhqRWNuNjk2VnI5VkhJ?=
 =?iso-2022-jp?B?OWVJSmZrV0YyY1BQQzhVVXBQU0l4T3hZMER6WDdKU3NlN2VtUjY3OWQ4?=
 =?iso-2022-jp?B?cEJPR0F2Z0MwUmlDdEs2cU1jNnhiRDJ5dDdxZmUvQ1pVOHlCZVdZb1FX?=
 =?iso-2022-jp?B?Q3JkUERtRjYybitzL09JaHNIeTgxN0VQay9xak82MzFqNSt5ZnhxdFJI?=
 =?iso-2022-jp?B?WGh0Y1YzMGh4V2ZiWnZhNy9MRVVUc3ExNDZmaWg4Vi9oWVo3MWx0Ync0?=
 =?iso-2022-jp?B?bUxCSWNVTnVpRWRKNVNrd3JpdEJkOTU2SmZKS2NHdFYwd0lhNU9zd3Bm?=
 =?iso-2022-jp?B?djIzOVo5Z2dBdXpwaWhVM1lyQVE1cGFSOVNFOHRNZVN4Vnc4WFZTZDd4?=
 =?iso-2022-jp?B?RXd1YWZOUi9uakVHTU1LWTlTR2FCVnJsa1VpTlJ6c3dwZmx3dWlCK3pt?=
 =?iso-2022-jp?B?c3FqUVFiOVRxS0NrbC91eHVQODc3R0daQmNmSkpsY3RRQzNVWFVwWGtH?=
 =?iso-2022-jp?B?ZGNRTTVaNU5ZWjVvbHFEcEJoZWJVT3VoWG9vLzIrWUxvcG1IcWdlRFhZ?=
 =?iso-2022-jp?B?dVpsMUlvN1RMMDZBR0E0ZzQ1Ry9pQ3FrWkZ6cmM3eFZKLzBVTHFZdkg5?=
 =?iso-2022-jp?B?czFOdkZrZWhpUEo5aWIyeHZxQjFzQ0g2RUhlb3FDQTZTZGFVTGdBUU16?=
 =?iso-2022-jp?B?aGlQTGJzbldJUWZDK3lQWUNGY2RiYVp2UGpFbEtFRnZTbU11M01qenpD?=
 =?iso-2022-jp?B?M2NLbDg3R3VqTng3OU03cFE2dXV0YzJzTmE5VXRHcGw0TnVHRm9RYmd4?=
 =?iso-2022-jp?B?NFduU2lNaXpVTGhCckxoSlR3Z3J6TFk3YUpkOFl4Y296dnZWWHhwTkJX?=
 =?iso-2022-jp?B?Sk5ZQnV1TGZ5VDNYYzlEOVZwcU8zam5ZS3EwQ0ROaXlCWTNWcFBWMml1?=
 =?iso-2022-jp?B?WEFqZmN5TzVvRFB4cFVSdGk0allWdUhsK2M4ZDFJaTdzdUFOR251T21o?=
 =?iso-2022-jp?B?cTRsNlQ4T3kvVzEvTFB0bng4SXJEYjZhTnZBUWlCKzFWdU5lZ2gwaE1s?=
 =?iso-2022-jp?B?a3lobWxRLzNJR3hUMW9hUkJMMHZENVA5VzArV1B3RVViTTZGVzVXZXkz?=
 =?iso-2022-jp?B?ZmpjRWZSNlRPYU5JNllvcElsLzdrT0JhMkZhSkJPeTltZHM3TkZEcFZ2?=
 =?iso-2022-jp?B?WG9uKzFZV1JrdFl2OStlK0ZwM0tBVDNhc3BQT3ZycWNlNStDdGNHanU3?=
 =?iso-2022-jp?B?a0xuWktSODFhSWFkck1BeTBibG44YWZnb2pVakVxalVOeXBnemtnVkNt?=
 =?iso-2022-jp?B?cGJ4WXozeGduNFo0QmltL21kNlVWYWV4?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?czBTQ0VnR1BLZm5jUW1Fd2NVZFJBSnVGWlhjUHhzbXRwS1V4ck1RRmIr?=
 =?iso-2022-jp?B?UnMybXZTMEJnalc4L0pMdlQ4Z0tDOFBGcStBTlhSazVOVFpFcXhBZDJw?=
 =?iso-2022-jp?B?QnJmRVNraENidmxXVmlLSmdNaC9xSWJuTDFpRmJQNzF1REZwUEZjci85?=
 =?iso-2022-jp?B?Tm9hTGJURjlseEpWNjJLYW5zK2VSck9LaGYvcGZ1TXVkR1VIa2I0RnJ2?=
 =?iso-2022-jp?B?NVJUV3BDU1NBMStiY1VsVHh2RVBtR05LR2JySWQ1ZnoxWXI4RGovRWc0?=
 =?iso-2022-jp?B?R3FCeEZGd2xRSjQ0V201Ukxpay9UYXN0WUJzOG00UU55bHo2NlBDVDcy?=
 =?iso-2022-jp?B?U1I1bk5OM2MyZ0J2MVdsWDQ2Zm12SjlwNkdEUXRRN2tIbmlGbXFteVNm?=
 =?iso-2022-jp?B?ZmEreEZGOGdFeENQVFI2Wmo5Z1pjckdKOHVxNzVGMXA2TTVPeDNWMjgz?=
 =?iso-2022-jp?B?b2ZwL0xXY25WMlFMc3p5WXVmL1FaNVVJVXpVcnpqdnJjVmZSZjBlVmU4?=
 =?iso-2022-jp?B?VE5sZ3I4Tk1GR1lsYm1iNDhlMVVFaXlYRThQYUJJTnpRUW1XNlpPUEdp?=
 =?iso-2022-jp?B?bExCRXVTS0h6R1NIWEtvOUlFTGhGeVdkL25DblNveE10N1YxUlhEN296?=
 =?iso-2022-jp?B?emZVbnMxQmd0SVcxZTRFZitrc3ZvUGM5Q28rZFloS3NCNGdLTXZqSG0v?=
 =?iso-2022-jp?B?RXVtYmFMTnNaMjN2TzlzNzZlVmpZYUV5ZElQdncwQjR0MExZWVVjRnF4?=
 =?iso-2022-jp?B?OVJVS243ZXJ0blo5by9va3lIdEpBNnNSTk44aU55WjZLUjl4QStjN2ZK?=
 =?iso-2022-jp?B?b0l6cVZvZmk3K2pwdGFyWSszMHBITXYyZVZHVlhUUXl2b2JUUzl0UWp0?=
 =?iso-2022-jp?B?ZXdkbUs4R3Q0MjZIN0hQWGFTcHByL2gyMTA4QjdGTnJTcUJjQ0RQbTEy?=
 =?iso-2022-jp?B?bFdBUmMxc0xabFlVVFlaZnZyR2ZEYmp0VVllSGx1QU80ZFdwRlYvM0N4?=
 =?iso-2022-jp?B?VUJxakw3b3ptS0NlUEJMZkxQd0FjR0RCWTVDaHNiNkFVRGV2VWxXeC9s?=
 =?iso-2022-jp?B?OTlYVEhYYWZTM1hJS3ZXdm5SVjBoVjcvYjcxUEpwdFl4eFNNbFpCNnZY?=
 =?iso-2022-jp?B?YkF1NmpDRGVrMU1MWmN6Snc1UFZQeDhRNWJLdzR0cHVHL0FVbFpGR1dz?=
 =?iso-2022-jp?B?YW83MWZpaU1CRVk1dUJxUVI4WmF5YWpwU3lvdU42SVF2Y3VoUWdoelBm?=
 =?iso-2022-jp?B?QjYrUDNsWmNSUUpKVTJDaUsyV0krc0pualgzTUNxZTkxR3VWTHVnQjg2?=
 =?iso-2022-jp?B?TVNPK1llSGdXODhrNGhyMHN2SEpXYzNxWWRaZEF3Qmo4MzBpOEFVd0pG?=
 =?iso-2022-jp?B?dVo5WmVuVkRpdXVOVGdmSXhNd011cjZNSjV6NkZId08zdjhySmNxK1NN?=
 =?iso-2022-jp?B?bXZxYUFvN0JCS2FGM3J1cmJmQmRJRTAzdGswblgyZk9ZK1dqSFR0U1R3?=
 =?iso-2022-jp?B?WWYrSFdzWEFiejA0M0FFN003UHhuaFZ4ZU43V2ZRUEhVSEF3OGNHNkJr?=
 =?iso-2022-jp?B?WmFhSTJQb1dXRmJyajIwK2FXU0E4c2NZMndhNktEUGsxQ2N6VUFXSVpX?=
 =?iso-2022-jp?B?Vm55eEN1RDhGRURRYXJldit6UER3bWFHYmp3WXl4TXhnb2lTdXdtV21a?=
 =?iso-2022-jp?B?bFhoQ0wxcHFNaUpPWndIemJDTGVWTlRIelFxV1lJNlZxY2dMVDMyT3dR?=
 =?iso-2022-jp?B?UnN3bWVjWERsRzFKU0hHL2Y1dFdvSDJaWndYZXhSNVp2eVRWYVNpaURz?=
 =?iso-2022-jp?B?ZWZoV0VIUm9uSXVZUXRwV0lCVUQwcitHTnhSM0RTLzVUVDBhc1h6d0lD?=
 =?iso-2022-jp?B?ZmRFM3VZYlhXMkJoeVZwcm1TZDdLMnI5S2NrNnJTMFhkQVVpTWwwMFRi?=
 =?iso-2022-jp?B?OGw1d0NiczVPclpGdzNEQlZZZjNYWEFidDFCQWg1bUlhNlJ1dnp2Zndr?=
 =?iso-2022-jp?B?a3BQZ2lNVzBNMGRmc2xrMkhzWFMwQVZYK1BsM0pMT1FrUjNPSisza0tu?=
 =?iso-2022-jp?B?R3ZaQUpZdEpQcVZ5cGxEeE1MZUx2aW9kSExXZkt5Zjc0cittMDA4aXd0?=
 =?iso-2022-jp?B?d3BKMGlIdDM2TGJJamRjOCtZMWNLU2lvbXFqZFROSU83NDVlS1pCYU1h?=
 =?iso-2022-jp?B?eU5zVm5kNGFkM2tSNnVleEU3d0tKamM0RFI3cFcvd0wwbUpKQjkrakt5?=
 =?iso-2022-jp?B?K2J2UElHeDJEbkZKRzBEL1REQnluTjNWWncrR0ZPUThQRnByWkhmNVhM?=
 =?iso-2022-jp?B?Z3B1VEtvQmRDcFUxNkVkaUkzcGY4R05qeUE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TmjddOlpzNwzJ8V448XLo7zGQtVXgJVN6p6e/dGJu9PcnOHb15sutt/BMmSjSdB4c6MuOvPC7Hq8GCOtbwDkBbkj5MieAF5g24TEOnevSya03UMYviNMWVpS3thS4AOk8gjS0RhHy7/JK8LVNxwJsQtRg78cMmvKtrWSaW/zreMoloqZE6CrGYoIiFJZdIpLhsaGJqNzwU3awldlcmDTCac7m1FZtYNClXjmXZ/LIoLVCfGxTvZOF5MGqR5H5iCnWL7TtXqlytG7nB7t4end5sYHltPAWuU1gKS5pNxMXl8zR26ruwnt2iTuFO1Lx3ZORLm5W+eK6all4sROvmiDSmdzh+jcKd7g/vKVF+cS3gxGGmKbcS75SrJAKrI++TyfQRoRmZgaxql7hmNqlBAlyDO9aye0iHkG67XyNY9/NwDBbR3PF5IYNsKEY7TG63OofY5qEyhk4rWEtoxZ7JwPqtGcNB7XDzGdTqxsfIlCqRb4uCUW2wOUNDb61dSQ+7Okw0TXnSvfRcDMDLlQ4vMsXsDs9sTIAPZK3djQ1zJioRTf7sSzDY51vjnzZ2mG61SEArfwJIRlcVMamqI59aohVZYZlX9YQYZfGy0IvMrCpey4N2azGg+q7TamOPywCDlk
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f38466a-b160-471b-c2dd-08dd7709ad7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 01:56:00.5542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PSCxNLx7OHs4rUHn7RyWn0IMwbtf0IX0O7ff7fDZMiUFAJw2ylV2JbltE6b50+U2npD22fYXIF9Yi0y3hTKmTt+n1CBPjDx+QRYX3e6fMBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_185614_520015_BEB5C02D 
X-CRM114-Status: UNSURE (   4.67  )
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

Hello,

If the boot parameter "arm64.nompam" is specified, MPAM will be disabled (/=
sys/fs/resctrl file is not visible).

Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>


