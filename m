Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB588C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 08:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyrlTTmc9NMnPyJyk7FRlMaZdQ4CTLJwmqBOWT/aSFY=; b=kXhW6y533erO+6B149cr+Mbv0i
	VXDzUpXn0CuVkrO2SYMJ3bIXq3+BQ0a+a0uCyIsLDJ8SPl8EEPdHQebv6NYcYAAWLKC5lTD8DoE4y
	Lzw5cYTG5C1/pInmoaTUwthLTk81B0eYMbq8yx0iraT+im+sBODMa7sKUjqLus5uNCX37aoqYJ3Hp
	2IA8VMVEsfgtuqNXJBVQyV/+Ck/M9TYf6mfASTMKK6CwoQPW/QqrNsTjuiE0tSbBS7nx0vXtOMc80
	K0CKk+tdaVyfDylGizdulylGMR49U1at9DHvAvEx1Xo4A29wvNKniVIUq9ENzvizYREyo04pXAPFv
	7KSNZljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIjC-00000002Lvd-24d2;
	Fri, 08 Aug 2025 08:45:30 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIYw-00000002Ko3-0EWj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 08:34:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxG4dp/A21U8cX4vjNU3j9kMviWTkYGear+7qFEKhpCjb3vtZMcGEJYSO5+4HTmPGtyhiu+bJhKRmKtKOvuWVR/S8LpZp1Tub1qQG/sjfzMde5IE+Xxquu9t8ORbKnIH/WJmL2o0nzO1jojwwrNliSmtYoNxXmqfyhp8h9Md2YRf/IuDEDXonQnB8ehMJx+9SqUJpN69WquvfIpsgzFmVehVPQ3kiEnZmphtoqnUvINn8S7WEoI46cVITEKjXOZYkUvd5t4fwFKHNNsGVOIFAkwwWTga8R7RX91vsc/9Rr5m4IAiag3v6uzonODUXNcXfWmNz3rz60AKWttE6udOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyrlTTmc9NMnPyJyk7FRlMaZdQ4CTLJwmqBOWT/aSFY=;
 b=iH6c4tzleawlfQZlWpWcsGXe1kVxdkYA1ywFlJz8/TRycjVOXlM5B9qxL7A/WbnOuzIwYUi5iCNbteb92aHpqMNovlwC6b8s5mG6fBSTTSJMN8AbLGXSFIA4yx+Ezd1J1XAr/mKKUPod84pOYhN+J4FeDeYAMfrbHH3Acxy02U3TkRxhu9DwP3zfpSb1YVPacSNeWzYaqH2BSZUBRoeNu6sPn/VTqgihqldAcOPz4imp+s7y0vxPenaoLOUyP4w3A1JUXVhJpdaYWX8s1NeGCiERTqkBBgZ0cjxgdYxZKin9KiVjWjT7kzSXTPGfIACSw1lF6FzciIGYK2KqaO9F6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyrlTTmc9NMnPyJyk7FRlMaZdQ4CTLJwmqBOWT/aSFY=;
 b=iJTzmoie6ZCoOOhHIwIPCzDzmNFoKKMVlu7HdZp5TBlqjb1euY72iQixyEx9/BBlzqFzP2Mrd0yMP9nqXUc71fJoFT2vMkSCZB/V8XEM+cegAz/MQpUbTjOxpq68GzciK0b0JYykyEAB9xyJ0BjWn4ECxPU7dOKxrywAU+YddFeVt46eXds+P+DwTX3yHqsFYbbKLzC/CbPwJj06n7f23TLMcEDsThbH2R7UPcP1IMcuhocqmpOtk41/wNBek5h2PwLlc2b4LNS2bpVU1B1WK5A+NJNtdTfoB3E947R5JWwDo33gKrtJNyuc6SocAI+60m8HIPHIhCzRwMyHONuNQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PR3PR04MB7212.eurprd04.prod.outlook.com (2603:10a6:102:8c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 08:34:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 08:34:49 +0000
Message-ID: <6ee93c36-27a2-4cd9-b1e0-e415e5645bfb@nxp.com>
Date: Fri, 8 Aug 2025 16:36:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
References: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
 <20250808080617.2924184-6-shengjiu.wang@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250808080617.2924184-6-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PR3PR04MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: ab74f9fd-cf53-4bdd-57fe-08ddd6567018
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amQ1R09jQjhIU2lSU0VaQ2J3dkd2YWo2RkUyeTNIbWZFanVDRlJ6cThjcTBq?=
 =?utf-8?B?QnhBN05XakVGaEtHamlJaGlPUGNzVG1IQmdZc2pmRGIzYXRMQUtOdTM5Zy9h?=
 =?utf-8?B?Q3BjWThUVmpneXN5Y0E4K0NFbGhBRlgxMHBObjU0T05RSGJuMHRtTGdxRDMv?=
 =?utf-8?B?cDhDWHYzZTRyNDlxUHF1WW52RnEvR3RjSHJ5eXBnQ3pxelBBK3pPWG5lUDVP?=
 =?utf-8?B?ckRQenU2MGNta21Nd1psZ2xhaE1GMGRWeE1CWGR0YzJTbzd5Vm1CYnRSMk1F?=
 =?utf-8?B?dFhmMll6R2RkMXBHc1oyVEs4bnI2NUJIdHNMM2ZBbUdNRGtFcWE3aUw3V29S?=
 =?utf-8?B?MU5uUkQvL0dxUFFvZ1JZL1FvTlZkRFkvNXdnckNMQUR3OW9lZlRETmp6MEsz?=
 =?utf-8?B?dytzRXZyUjQ5M2d2TmVKZDV1V24zYkNuWHlkZVBsR3JraUlNUi9Gcnl1OGRz?=
 =?utf-8?B?bFNoZlFucVNuZG9MaUdwKzl1YmFWZlRDSnhyWWM5d1JYVTkxR2RrdkVGOVJk?=
 =?utf-8?B?b3FDYmo1VW1IN044Q25kd0YxZWdPSXRVUXdMT0ZWSEN2RDJRWjU2cGZ0bnIy?=
 =?utf-8?B?VG16cVR1dXRsRUVDdVNlY1Y0UE44dVBUMGVza2dPVWVhdzN1NGdLVEtYR0hS?=
 =?utf-8?B?RUN5eVhhRmV1ZUVPaDRNRm1tT3Roem1WdkxQL3gzdWlsR0tHSlBqa2pJWm9P?=
 =?utf-8?B?cmNtUmRraDFLSjBWb2VxQlVMdjBNRGZta2k5ckxCK2NhWGNjWjZ5MzlYM2Fy?=
 =?utf-8?B?K0MrRk9VT0d6N0tuOHlhL2wzb0pZOXljdUNBQzZtSEtzeFZ1eG54Mld0UjlU?=
 =?utf-8?B?SEE0a1l4TExUdFpXb3hkc1cwM0tBSWJLY2NMajVYc3B4M1B5TGtyYy9PdEIr?=
 =?utf-8?B?S1lmdFBKYzNzYW9ZU1RXc3NHUGRJTmM0dFJzckpTcnZ4dklqQkIyTDROaTEz?=
 =?utf-8?B?eDZMdm9FdnZqakYyUEZSZC9RWlU2eC9pajQzVkV6a1U5bVp5OTdyUTlEaW52?=
 =?utf-8?B?MWVpMlZoQ1hOL3BwL09XNXZBeUk4bG8zeEQrSEs2YU1XOUttQlg3a0xzdGI5?=
 =?utf-8?B?c2VITXdQSklWYlJkeUlnS1Z5Nit2Sk4vZHRGbGJzN2JidHhYd2Z3R2xkcjFm?=
 =?utf-8?B?OWxaVjBvNmtZOUF4bkpDKzNZWmVXbVh5VnJrZTRVNG5LYVBiLy9wMS8rNUJW?=
 =?utf-8?B?bVlrVTZpSEpWR09UWi9GNGNYMlREVGsreFBldGw2Tk9pR0REK3gwYm9tc0Fz?=
 =?utf-8?B?Ym90Zlc0RkJlZkNaT0dwb1VsVnE3ZG1KQnhXSmZYWUwvVXlyczV0Uml3SG9x?=
 =?utf-8?B?cFNnM1dSZ25aU2RhWER6M3V1NXJJQWpQa1BnNWRUS0NOWWdzUStHcitTVTJ3?=
 =?utf-8?B?elRXU3RURk1HcnhyN2hUUlY4MjdiaVg4eUtkZGJTSkgrMXRHZVUrUWJ5NUdn?=
 =?utf-8?B?Mkg4ZDZEaDFvMlNXaDNSeWRkWmp2WVozeG5RWU9DbjJmTGNVUkRlSXRIOGRp?=
 =?utf-8?B?UmlkSHFxenFHUUxuMXlNWWc0ME9wUzdkUWc3RFdTQWRvRXhYQ0Q1NW1Wb1Yz?=
 =?utf-8?B?T1d5S0hHMzBDQVVuZFp6R2VrV3NuekZSK2pkUGFyajd1NzBEMTV3Y1p3UXA3?=
 =?utf-8?B?ZGVkeTZFUHFEWlR5ZFhhdEZOT3BJTGdvMEtxUzlDZWhhZ1YyVC9BNnFQeVJM?=
 =?utf-8?B?VG5LYUtnWDJRNHJaczVzUFRjNWRjUzVaRHRoTFJGSmtrbU5rdzI4dlMrQkVE?=
 =?utf-8?B?YXBsWlpOcUlFRFFvY25nT2ZSc3FaRC8rNjg2U1ZneVFON0ptSkhzUjZBdzZa?=
 =?utf-8?B?WFNFdXdJM1pvYmlHcmdUb1N1UkhoRm5JYlhjZWo4RkN6RTFvT0FMdFdrTGJj?=
 =?utf-8?B?enpyVmJCQXdzR3l4bmwvejg2S3JabitMMEpncVdRYXNWRCtkcXZOWHljU2kw?=
 =?utf-8?B?UW8waDdTOTZXNkpUZGk5K0lwdnNFTkoybWIyUkx1NFF6Rm5uaVJyREg0Vm5R?=
 =?utf-8?B?ZlByKzJVcXl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFhONUFqMlJOZjhTNUlEZyttRUxuWkMydHRJV2lFNWVySXBCK0lsbXVqN0VF?=
 =?utf-8?B?WWJnQ3lIazhNdzVrYVV0Z1YvVDZkT05ER2IvMm5kbWorWmFTNnZqZjlZZk5X?=
 =?utf-8?B?ek54TjUyUlJYNmkzWmEyWTU5UEUxU3hPWkhHVUV2bDRrWlBKUTJEL1FraVZ3?=
 =?utf-8?B?cmhXZVFNY3NsU2RjdHJBb2Fhek16cWZGNjBiTUJqeUtzTHozdjNIQXo2RVc5?=
 =?utf-8?B?Znk1eUZ3RkNLWFZEbnlGVXV1TCszb1lvaWRtUExKUlBsUkp5WEFNS2dSUmc4?=
 =?utf-8?B?M3g0OTFjb1AxdW1zenVMUkRQSFQzWkpjTS81b1k1UmZaUFBOdTJLcUpOQzNE?=
 =?utf-8?B?N0paZDl5RkswU1NlZmZUdnBYQm4xMDRRdE5hbE9lYkxENGdJWHdjZXA3WnFI?=
 =?utf-8?B?bDg1ZlovYVlhTUIrRFdTM2QrQTdWZ0p5b2puWE1jTDMwZi9YYTAzVm9iQWxx?=
 =?utf-8?B?VFZzNFFsZkFJNHBLTThEcUdPV3RJUlZJM3Z3aEZTd1prZWhTNk51YS82OW1I?=
 =?utf-8?B?QVZZQWVOQ3VnZ0VIdThObXVMOG9lWjJhVXVWMi9aeVY5YXc5U094ZW42QzF2?=
 =?utf-8?B?NFpPam9zc0FFK3REOEVvMDJIS1B6bVdsQWV1RXJJTVgzcU8ydFJ0UHpsQkpQ?=
 =?utf-8?B?Z3dZU3FwVzFxVUJEK2MxYTJHdW9pSk8rU1RBanpCdDBoR29vcFlxdmtaOS9G?=
 =?utf-8?B?UStOSmdLSzBhM0NBMFRTTkYyb3NwNzlPeHhycWZHT2d0TnNMa1BYQ2hpVVVM?=
 =?utf-8?B?OFhMekFQMFNxc0lrVjJ0NjZIdTFFVHMrNzB6RU9CcTF0ejUvdjViZGt1RGwr?=
 =?utf-8?B?eHA0MW8wK1ppSWk3RWZFWEY0WDkvMW43OEZ3VGFsQ3FRWENpTWQwU1RrNzYr?=
 =?utf-8?B?RkFDdXFJaHUrNkVSVmNiQk9LWWtUN2ZpOWhRd1NEbXd6UG1SVUIwZ3Q3ajg4?=
 =?utf-8?B?RlUveXJSbWtJYVpOTTVNYThIcFNVM3NrTURHT1JjWjhMRUpaUVpWdGs2a0xF?=
 =?utf-8?B?NjBJU00yeXBjcHlobkNtanhPVjZqaDFhRTB1OEF4S2Z1aDVYMG1XS1FrTUx6?=
 =?utf-8?B?MmJKWkNpR2hNSXZvQTEvUFNTUjlkWU8xa09PeFFZelhkYitmN3gwNHBVUVBt?=
 =?utf-8?B?UENTVmZSUlhDUkd3NnpyM3F1d0o4RFEyb1c2ektkSkU3czNqMS9Kd0krejJj?=
 =?utf-8?B?bHNlWWxVVnErTVBmQVc4U1BweTNuVGFkV1A4TFprbU5pUEtRUkh1ZGFLc0k4?=
 =?utf-8?B?UTlvTnlZM2l5bmVibFd4VEY1bUhWS2laK1JxeWdkNGlVcFdwSm9KUUlwb0RE?=
 =?utf-8?B?ZDFMdERQVTNrelJOUDB4VE5OTjVCejJWbC9KOWhJR2xFUGxjWGpNdFhDRE9L?=
 =?utf-8?B?WHRuWGNJNU9tZ2FFa3Z4eXV4a0MrdGdUdkZIOEVCenp3ZFhRazlZNmh0R0dZ?=
 =?utf-8?B?N1RablU2RUFPaU9IREgzSklOK0ZSb0thUXBPaFpoWnZiYlRYdVFWdm9ldEd3?=
 =?utf-8?B?bW1Qc21RNDRPWFFpcmV0VW1INmljMHpxMFNuV2tVRWozTzhGR3pCS2tLc2ow?=
 =?utf-8?B?NVp0TWdJWENiUEYzWVNvQ0xaeWtWNFhJZkZMZTZGbTdHb04xL3dvbVAxRlo0?=
 =?utf-8?B?R2hJRkZWTlFGMlMvYys5d2t6cFpzR1FjNDFUNXZuTUh2SlUwUzN3UW9uSzgz?=
 =?utf-8?B?MGVLWkI5S1J6MXlXbFlKK3Vnc0o5UnYrL3lpdEU2ZFViRzFBSm13c0NDekh0?=
 =?utf-8?B?eFJQUzAvMnMxcVZtdzVabzNPclVPVFlXSU1vYlJhNGZ1QlUzWTJmbzJ6eFJj?=
 =?utf-8?B?MkhQenZFVHpOaGcweFVlUXB0MlZTV0R3dExGYUpxc2hHRmplbm1aWjZyNUJm?=
 =?utf-8?B?VHpLV09ra1gxV3duN09MdzJ3a0JjN0pUQXV2RjFQZHRMTjZHZnBhSkR2L3RP?=
 =?utf-8?B?UjE1K04yRzlJZ3lZRnRmRFN3ZHgxTUlhMys3K1N2MUdMMnI4M2NGZWJUUTcw?=
 =?utf-8?B?OEJFeE4yV3dadGNkbnNJbHVoRW1ZNm0rU0dlK1BFdHJXTUxwb2k4ZWIyK25j?=
 =?utf-8?B?ZlJaTCsrSytKMkM3aGJSakxYakFpbVMvREMzSjNndmhGamgweDJ4Sk45VlEv?=
 =?utf-8?Q?rP9LJjsD5PNG12iRzIsW9QYcy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab74f9fd-cf53-4bdd-57fe-08ddd6567018
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:34:49.4214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUfXv0esTkWqf6/fYhwIoGsvt/zxHf33N/xFjhARH+g5xr5FCPi387Ge7pt4bjicYfd8jMdxo32lFKV34KQXFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_013454_099634_6482C2A8 
X-CRM114-Status: GOOD (  14.12  )
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

On 08/08/2025, Shengjiu Wang wrote:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> 
> Data received from the audio subsystem can have an arbitrary component
> ordering. The HTX_PAI block has integrated muxing options to select which
> sections of the 32-bit input data word will be mapped to each IEC60958
> field. The HTX_PAI_FIELD_CTRL register contains mux selects to
> individually select P,C,U,V,Data, and Preamble.
> 
> Use component helper so that imx8mp-hdmi-tx will be aggregate driver,
> imx8mp-hdmi-pai will be component driver, then imx8mp-hdmi-pai can use
> bind() ops to get the plat_data from imx8mp-hdmi-tx device.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig           |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 158 +++++++++++++++++++
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c  |  63 +++++++-
>  include/drm/bridge/dw_hdmi.h                 |   6 +
>  5 files changed, 234 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Thanks!

