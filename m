Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BB1C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmGL764qJThpPP/c5hpSxsbOtcy82Ezbk27xa1+Q5mw=; b=qwMM1M65SpWNuQj/lTUagib/rB
	uKYLT7nQPQLgHsVCpZSXO/v4LGD/zuRoh/1Cbh+cTePBLbQBtq3pFnK1jR8jGQ7ArSDyPhSOFDSsk
	QQfeZrdQMRJjwng9UIMCCFj8PnPwm44k1AgnQ1wMIGflCRBhszpqA5yjySN6t3eN60EpLtAnSS+BK
	TbK3f1RoXwKRZUDU88Fn0AIyQop9Ewdt4C558TE/1gZZwh+kH7WJwn0M9DiEZtqkReFwK2+YOLDfE
	lIpZ13nf8Ie/OKgkZOizh3dwBG6EooHZ7jr7NFJT1kf+tv8lLFCkl7irsLILmG1or+iS6+uvWZUYP
	l+8il4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td5mG-00000006mPl-38La;
	Wed, 29 Jan 2025 10:58:36 +0000
Received: from esa2.fujitsucc.c3s2.iphmx.com ([68.232.152.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td5kv-00000006m9K-0Mvb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 10:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1738148233; x=1769684233;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LKCL7LjmP88pFmBSJ9yQR3YK/f4xhqxNWEZu1xxGAuI=;
  b=ZGHddmQVl0thgsvVJ3WgRoDZm5G/zKELQG8IZaDVVrbMFvCpvf7cUemQ
   HiiYT2xRFGpypHUYdHHzUUSZvvLHxnrdabrUm6iu0j+Z73MU/oTLfFsEd
   lrFiABwHFCD45WIkMez35eRmA8uc5IfFEa+C7Lf1z+0Lr6L0Ew7LbihEj
   Nz5jesf7bK1sYcIvSon7T7/ZvBGtmBIktyo3KlFoFKqWrH/lYoVrK1/Mm
   5N4JGcuKlN+h8zidOurGND96/13XDJrvy5Q6OkxLZUumjimUnsqQJt5NY
   qs6cQHEmADCl8eV4o9tdBz+wvo81Z4JMFfGDDXjvMFKyxND7/1xQ486zz
   w==;
X-CSE-ConnectionGUID: myW/L5e5T/Ool7uG+hH/8Q==
X-CSE-MsgGUID: Qnj2yfBARMKRQb3AO4Sn2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="55648473"
X-IronPort-AV: E=Sophos;i="6.13,243,1732546800"; 
   d="scan'208";a="55648473"
Received: from mail-japaneastazlp17010004.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.4])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 19:57:09 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6z5GMg4fStZWNHnLyFwzODsWzE8qqcjxozilBtQnUNf9yLU0D/+nwOJ8Ic3mpMxhOy1NFJjdlCtN2wICcyumMI5UQdy3xmnJYzIrAW8QLPmlY4fZx3/Ncub23h4FrYlgT84GdqbgLLI7zTdjhcKuWzkhSPHKNOK+B2JOCiwrqFSzNzEen6RatnKevhHWIX3PwJ8I560V6FfJrWdvdF4t/PRJW3OzeE+m/X//pyk3qDUAVXV1/ASNSCVQ2W3weeIZsaXz6mcc2Gz3x8UOxX2IIJyTrDTlMUQHFfGmqBIGk+ynP6+opc0Vyp6U/f2O9dfc7Dwa/H5v7SQc/J3G4nCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmGL764qJThpPP/c5hpSxsbOtcy82Ezbk27xa1+Q5mw=;
 b=pb8gpMgpEVFRhZQrJ1KYrmLgeYp+GkCpZ0T3ydXsPuVqrXD11nwUAFSkkmXyhEKMotmNLeaxmEGo0LYixRrAzVHAS82Z+CIa6JV8/JwppeJdFLbUo+uKAQ/DcdXYcQRd5GZYFHZIJAYbIWqnuogDJKZHmEE0pqDuSSa5TD1VsKfXjouW45wwxBqNGwWoQYMaACMjh7c/VEfrDBjiPkAxzu1mxBNWowDn7lVMypspIK3N1iWiOHzZ5zFUxHM1FOmZ+1nFiCPg6gf+akYnIfEYgsiJLqxetW9nc7RKmbt+LTMV2mbYrtREk13XGXUF7RZrT1oYqKyIn0vhLX7bGNUbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by TYYPR01MB8263.jpnprd01.prod.outlook.com (2603:1096:400:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 10:57:06 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%4]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 10:57:05 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'Dave Martin' <Dave.Martin@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Zeng Heng <zengheng4@huawei.com>,
	James Morse <james.morse@arm.com>
Subject: RE: [RFC PATCH v2 07/11] arm_mpam: [NFU] Rework ID remapping to use a
 kernel command-line argument
Thread-Topic: [RFC PATCH v2 07/11] arm_mpam: [NFU] Rework ID remapping to use
 a kernel command-line argument
Thread-Index: AQHbaPIW2p9LswibYkmW8ZLncONXzrMtpgVA
Date: Wed, 29 Jan 2025 10:57:04 +0000
Message-ID: <OSZPR01MB87987EEDAD9B27BEDCFB37A08BEE2@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
 <20250117151033.1517882-20-Dave.Martin@arm.com>
In-Reply-To: <20250117151033.1517882-20-Dave.Martin@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=5564c28a-d6a1-4cf0-99bc-61a4ca5eeb00;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-01-29T10:52:57Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
x-shieldmailcheckerpolicyversion: FJ-ISEC-20181130-VDI-enc
x-shieldmailcheckermailid: d862678988aa49b99cf179ce745e1202
x-securitypolicycheck: OK by SHieldMailChecker v2.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|TYYPR01MB8263:EE_
x-ms-office365-filtering-correlation-id: 13bd72a5-cc9f-46ab-859a-08dd4053aa5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|1580799027;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?YVJFQ2tmZWVRcUc5elN5cGQyQzlkV21vNE5VKzVoV0tkS1UxdndjR1o3?=
 =?iso-2022-jp?B?Sm9aWERRR0k4N3ZQUXE1NGFBbU1UWkxzRHZ4aUFFSnVMQklqcm9KRU16?=
 =?iso-2022-jp?B?d2ZDWE9XS1ZMMXA2VExjZGIzeWdqVHJiVXdzaTJRd3IvZE1ZZWpIUzR0?=
 =?iso-2022-jp?B?bUx3c2cvVUxKUGpsdm9kelIxOTI0RkZNN3FnaC9HcVdLaWpLck9vdVVm?=
 =?iso-2022-jp?B?WXE1Z1F4K2lQbE52WjUxYlVtNkZPblZTS1gzRlpnbEN6WDZkZGtSYW94?=
 =?iso-2022-jp?B?VzM5dzNTNWhlbm5oK1JXMnlwK0JtTEUzclhKMHNjSi9VdGFqZm5hR1lS?=
 =?iso-2022-jp?B?cWZPTHlyNUdDQ21JRnlHMUZNNEk1R0Y3WDlNZ0VrRzBjVnZ4RjdSVzk4?=
 =?iso-2022-jp?B?Ukl5SHBnWEJneFUrYVRIVCtIVWJHRGxOdEVPSmVJekFTK09oODY1Siti?=
 =?iso-2022-jp?B?THJ4NWFmZFlaZW9CckJkRkdzQm1MVEFTYXdwOSs5K2JBazFuTmVPODQw?=
 =?iso-2022-jp?B?MWNjUWZ3TjlxZkFrQUd6Ymw4cGpCYmNOSm5oVUNESHRVaU94STRJVWlE?=
 =?iso-2022-jp?B?U3duQWJOYVpvb2x6cXpNQWxSNWlJWjU2cnFuRDl3NlArdTZDREIxYkUr?=
 =?iso-2022-jp?B?KzJIVTkvdmY3SngwN1l4Rmt6RUdBWUpjZTFtM2JjZVZFa0hmRS9DYXVm?=
 =?iso-2022-jp?B?bzJjdWdzV0Z0Yklsdyt3Nk52YjJJNTRJcWtRdUtGYlJpbVJ1TVhldEp5?=
 =?iso-2022-jp?B?cWdPbm9hNm9ZR2taaStwYksyMjM5N0JnanlXMDkwSGFzZ1d3YXZ2M0Ev?=
 =?iso-2022-jp?B?YU5CdytzWGlEZDEwNU8yUy9EaGlBUDEyQXBaQTY3QnJzRDRTMTUvNWFh?=
 =?iso-2022-jp?B?Z29raHpjTUxCNFF3R29IUnZHMmp0T1BJQzRnUHNsdUVHcGFpZjdDUC8v?=
 =?iso-2022-jp?B?RGZiRGxVK1hEQ3AwdlBNSVZkVjVxWU51Mm5CNWdQVXRic0Z0UXVJR2JX?=
 =?iso-2022-jp?B?MHpPNk1JMEZaMnlIdGVrYkJIU1diZzJLUDIwV2FSbXh6VXFUbVNhNHRy?=
 =?iso-2022-jp?B?SW9kSkRCNENWVHpEeU14RHVQWUZJVDUzVVRYdm9va0pNVk9JUyttRFJu?=
 =?iso-2022-jp?B?K1FZM0d2bElIMGJ1U1QvVTRXVmtlNWxSRFdJK1lnMTZVN1BxTStCaTdI?=
 =?iso-2022-jp?B?ekxMUTBxSEN1NE95Q3d5WEEwejB1YzVndm1tS1pHaHArNm1jMlY4bWNq?=
 =?iso-2022-jp?B?WW5BZXpjdE41K2ovTU00V2YyMHVUUWNpbmhNelE4Qms4Y0ZWLzJpOUZ6?=
 =?iso-2022-jp?B?Ump5YnZSVFNYQU5WOUY5YW1IQjNTYXFmbUcyUTJpWk4zd0VRUjY0NVd0?=
 =?iso-2022-jp?B?WVZCMEpJRmVwTXZSWHFibGNhamRFbVhCNHkzSXNmNE5wQVJvaG1CWVJR?=
 =?iso-2022-jp?B?Q21ldTk1b1BSOEFEUm5sL0dqLy9NajNEb3czZlhucyt6enJpVm5pVTVh?=
 =?iso-2022-jp?B?bE5heEg3blo0eG5BaTN2Rkk5d0ZmMWFkQ2JjdmZoTHp1NFJpZUFCRWN6?=
 =?iso-2022-jp?B?bXY1eWFPMCs5WTg0SVo4aWxjZEZreU8wWnFLMHJyMC8yMjRsSS9lMExw?=
 =?iso-2022-jp?B?NmZXZDdtaVY0MHJnREhNOUY1Ly9LaFFFZk0rMXNFTXJrejVGZ1JYUkl4?=
 =?iso-2022-jp?B?UWZZcUpMc01PNVNRUzEwYTF3Q1Z4M3d0VHF1a3Vlb2Z1NUkrNkxsWDRQ?=
 =?iso-2022-jp?B?Y0dRNkVYeG9qVzNjNXkxM1NqU2dFNFkvSCtTZHIxRlArM1dnVytYRkZo?=
 =?iso-2022-jp?B?KytsZFhJNS85a05GOXJ4YzVUbUpEYWdIV1dCcThyV29EVmVCY2tHNm1T?=
 =?iso-2022-jp?B?cjNCbEY4eitMRU1CaWxtd1lzRFZyY25HcmFoVEZtRHVUVlBhOGdJQTkr?=
 =?iso-2022-jp?B?N2VrTitMS2Rvc0ZnTEozejBHcmhkWUpURlBEYStCU1BuUmZIR0hMNDcv?=
 =?iso-2022-jp?B?QjQzZWZPRmJEOU14UnhuS2N4RXZ2LzQxTjIyWkswTnZEY1p3dVo4TTVW?=
 =?iso-2022-jp?B?VW05RzhTWUJ5TkhWQlRpdExycVB1a0FtcnhRV1VLYVhwN3A3aGR1R1VV?=
 =?iso-2022-jp?B?N0t4Z2NYakIybmlFaCsxZnZxc0VmMmp3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?OVVyb05FMFhWVk1LbXVWYzBYd3EyRzdkSFZ3a2NHSCs3OUJqaWQxOEpH?=
 =?iso-2022-jp?B?eUFXY2VITDczV204ZSt0QWtvUEoyTzVwYXNDQ05CNzdZQXM0YW1CK242?=
 =?iso-2022-jp?B?UDdpOEw3SmdRZWJsR3JvN1RaaTB0NlFpMlZSSEdwT0cvekFndk9McmNY?=
 =?iso-2022-jp?B?YkVhZjFuZjlEdWpqY3RHSUdobnZNT09FdlRzdlZmOHgxRWc4RkZpTjZI?=
 =?iso-2022-jp?B?OHQzbkVTQ215ZmhVckZYU2hkOVhNOURuVzd2M2xlM1c2RTV0L3c2bXd2?=
 =?iso-2022-jp?B?NVVockQ5RnNPRmUxUW1qZ1RCVllzMklPMUJaTVIzYmJDb2U4VTdGVGNp?=
 =?iso-2022-jp?B?NGRrajBwUWRacTFYbE9zTEtObVJtazdyM0gxTGM2d3NIeUtDbzlTM1Nl?=
 =?iso-2022-jp?B?dFRjTS9RbmxWczlYcXpCMk5uOXpOUS9ZbkdENk5jMU9PMm53a093TGdC?=
 =?iso-2022-jp?B?Ti9CUnJMZjNlOGpoU21VQVpIVzNpQkpYeWpsOG9PS013YTNTaEl1QUM1?=
 =?iso-2022-jp?B?QXQzMFZXa2VIRUVYTGFUNUNCN0R0V0NLNUVjZUJ2V3Rpcm9xWVRMckM2?=
 =?iso-2022-jp?B?RnUrTWJKS2xmcWtNVFJrUlV4UEVzeGEvVm56L2tEdDBidzFONlhwbm5C?=
 =?iso-2022-jp?B?YStiR1ZTKzBtbmwvY0daQjUwNEk4YTdLZGoyR2ZtZVZBUFZqQTFETmd6?=
 =?iso-2022-jp?B?VDRQMHZWQ2pZVCtvTDg1V1NldmMwTEplOGwxV0NIRVpOeC93REcyQnJ4?=
 =?iso-2022-jp?B?SUdLOUtjNnUzemd5MlpGYlpSa2M2ek96c01naU9ZSUJmbDZJcmZJUkc1?=
 =?iso-2022-jp?B?K3ExQUJmRWxtelAyOG45WTFGSk9wNVp1RE5LTE9XcEpLaUlGVC9vbkR6?=
 =?iso-2022-jp?B?WlIyR1dDK1IrZWg2dzVEZzRHZjhQS0ZMY05jamJLK2RvRWZxTFFGVHh3?=
 =?iso-2022-jp?B?WGVXTUdGNFZPcmFTYmNnaU0wNTA5Z0dUU1JaV2NkYllLZ0t1ZmhEK0xy?=
 =?iso-2022-jp?B?UXd4VDM1SFZLOG83a2xZbGdqMzNXb3pabXY4aXJhWHBZc0E4QjdsT2Yw?=
 =?iso-2022-jp?B?ZTczNTA1WnUyODhROHFJNzVIV0V5Y0IveXIwWitEOG9XRGlHcks3SWox?=
 =?iso-2022-jp?B?RDNSOUxpTVE1TGQ2VU9NeW5ZTzZkR3NWK2NLVkNkMnEvUnY0NmRxR2w2?=
 =?iso-2022-jp?B?S3dwMjUxejVuZUp1Y1lXZnJCZEs4M2hHZml5VnNsa2NWbHNwenVLcmNI?=
 =?iso-2022-jp?B?c2F0VEIyYWYwMDdtVlE4TWp6RE5oWlJaeEoxbkQraC83dFlrSHpyUTA0?=
 =?iso-2022-jp?B?UzFSQkoyc2lJU0swcEZIZU9rY3dNeUlrWEtuT2QvZFVpU2xrSjRQSExw?=
 =?iso-2022-jp?B?NC9ZWitIMTVFMDExdE5OZzR0MFVLZjRvalpZUkY2dWo2M09SamNvaHZY?=
 =?iso-2022-jp?B?VmtwQm9DckVLekkwUEp1VmMvaDhBeTc3Z0ZXU3VpdzQ0Zm1VK1U4eFR1?=
 =?iso-2022-jp?B?L2hqUWV1cDRiYmErOFB6RUNWR0dodnFWanBaNTU1MDZSOXQyNkhOTFR3?=
 =?iso-2022-jp?B?TUcrT1hjcHpodytQcGxDOG02NWRmUEcvczEya1NhckphSEZKekxaTmxo?=
 =?iso-2022-jp?B?SUQ3NWFNd3BPUklPOWZMWGp4WUNHcnc4MTBVaU91ZXhJT2ZIa3NPNFQ3?=
 =?iso-2022-jp?B?Q2s3V1BPbko4SWx1Rzg4bDdaS1ROQ3gwcXNHVzBSV2lKZU1KWjdVUDBK?=
 =?iso-2022-jp?B?SWZTMmtuZEt3TnZROENHekFsSnRBZWNqU2pLcDRCWWwrYWZjV1Fza29C?=
 =?iso-2022-jp?B?Z1FlSVN6SnlMZHc2citiMGhSS0x2eDRUTkEzOFJrbUhWM1lqeVMxSGpm?=
 =?iso-2022-jp?B?VFFFWmprNVppVG15dWZvcmpnM0pkK0Jybm1UR2NuNEtFazRsR3hZSm0y?=
 =?iso-2022-jp?B?WXlub2ZxeGJSSWNqS2VHejNxZ3p5STYreDlkbkREZWJMem9wRnNVT09Q?=
 =?iso-2022-jp?B?M1VCTVVldTRuL0xCWXA3S003WVNrK3lVV0lMenNWaGNWVElSWGl4ZEtQ?=
 =?iso-2022-jp?B?UjdqQ213RkF0MlN6RFJmYWU1VEVoZHhIOGh6bnhHVDduVjJsc3N4UXU1?=
 =?iso-2022-jp?B?SlQ0UUVpWjE0NDlmWnRIK2hyZkVtMTJBQUJXek1laDhkSTUrNVhxRkJC?=
 =?iso-2022-jp?B?Ry9Ta0duZklCWi80ajhDVXZudXU0aFJ0b2QrWS9mU01saHZFd1dIUlBB?=
 =?iso-2022-jp?B?WWt1MkxZZlllV212TXFjaEZETm1QaVJiK0hldXdBSHo3anVvZUF0YTVj?=
 =?iso-2022-jp?B?UmtzRnRkVEJvNzF4d1oxcVdiOFpFREFXYUE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DEjpbp+Ov6IFxfK0RHiD2Y2v3AH6FSeWEsyS8qbBFgCXzUf7aMb7DUwIm+4m8X1jRQVzyMa8FKqKCu1PkwewK8j5qGeQ/qEQf2C0kOH3fQVKX2ldr0bH42J7acc3Ht1taSsQev4IAS/5scL7pNJfLSivoWG2xp/SApNz68OB3FgmOtHwi82sXlWiHTO+FKwuwkUDEjHl3x79IE99JA72HRowyMaK2OB/s7NVYlqpD930eGBzwwEv+2SGIctxwH+X/y8rDCxUG5m4zTpQkH1IMqruKTp8Ae9xRQeJoNVyfoLDJEpSc/qyiaqiXrSgKoE0MMF1TE+Fo3mltV7/rst24B3LR6P2ralRLoLYgFdi1RDw6PRtyLSbdAI39Z2DxZvQR6eriUhQ2XELTt6TDT53ZKvnG/ChGME4Zh67DqZE+AZMYauLXtMauH80n7QUTMWvH7IU/QUisPXXm+ui6imNKyHweqUy1T26pf/dXcpN3A77LNX3JLYCWo/AHdSL1LfYnImSKEuRUrRmog7YXcSG/iL+vQvQOJGR6UgZuRU93S2skuH1Gb6rguP+zNepv5eyPbzScVarIXNbjORXWgfMenp3ZrfRBUq6bs5FeGOO+4uOnbVy7mrAJ4+c+9AfjreS
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bd72a5-cc9f-46ab-859a-08dd4053aa5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 10:57:04.0902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QgGRSvOQOVUE2cCfFi7EfABx66OtQVdSK8KJ96SKnwsYSnvrYFOqqmwWjx0rRxeRnFjLTeekKfS6vQ3H9z+kAAR3rQIIybIzwflxOH01mMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_025713_527844_97B97DFD 
X-CRM114-Status: GOOD (  18.00  )
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

> Hacking the source is an acceptable interface for experimentation, but no=
t very
> convenient.
>=20
> Instead, add a kernel command-line parameter mpam_partid_per_closid=3D<n>
> to specify how many PARTIDs are used to provide monitoring groups for eac=
h
> resctrl CLOSID.
>=20
> This change is not intended for upstream.

Are you looking for an alternative to using kernel command-line parameter?
Specifying the number of monitoring groups under one resource control group=
 might make it easier for users to understand. For example, mongrps_per_ctr=
lgrp.

Best regards,
Shaopeng TAN

> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> ---
>  drivers/platform/arm64/mpam/mpam_resctrl.c | 22
> ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c
> b/drivers/platform/arm64/mpam/mpam_resctrl.c
> index f834753a3274..eb1ef5d2bc57 100644
> --- a/drivers/platform/arm64/mpam/mpam_resctrl.c
> +++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
> @@ -3,6 +3,9 @@
>=20
>  #define pr_fmt(fmt) "mpam: resctrl: " fmt
>=20
> +#undef KBUILD_MODNAME
> +#define KBUILD_MODNAME "mpam"
> +
>  #include <linux/arm_mpam.h>
>  #include <linux/cacheinfo.h>
>  #include <linux/cpu.h>
> @@ -10,6 +13,7 @@
>  #include <linux/errno.h>
>  #include <linux/limits.h>
>  #include <linux/list.h>
> +#include <linux/moduleparam.h>
>  #include <linux/printk.h>
>  #include <linux/rculist.h>
>  #include <linux/resctrl.h>
> @@ -158,6 +162,24 @@ static bool mpam_resctrl_hide_cdp(enum
> resctrl_res_level rid)
>=20
>  static unsigned int partid_per_closid =3D 1;
>=20
> +static int mpam_resctrl_partid_per_closid_set(const char *val,
> +					      const struct kernel_param *kp)
> {
> +	/*
> +	 * 16 in an arbitrary maximum, sufficient for experimentation
> +	 * but not ridiculously large:
> +	 */
> +	return param_set_uint_minmax(val, kp, 1, 16); }
> +
> +static const struct kernel_param_ops mpam_resctrl_partid_per_closid_ops
> =3D {
> +	.set =3D mpam_resctrl_partid_per_closid_set,
> +	.get =3D param_get_uint,
> +};
> +
> +device_param_cb(partid_per_closid, &mpam_resctrl_partid_per_closid_ops,
> +		&partid_per_closid, 0444);
> +
>  static unsigned int mpam_num_pmg(void)
>  {
>  	return mpam_pmg_max + 1;
> --
> 2.34.1


