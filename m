Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD7AEF371E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqAVWUH0bKDoeJU4Txzc+Lq5tfW4jAkf0KzdfnA0I6A=; b=AYaquBTpbhnNd68MOkDO0wHsda
	iusouHaRxDvXjil9DRgVf1+V/5A4PDzQBWc6r2kDmNEzJ//R+KuOj1YSaC3U6FPxQ1IiFfbjkbdd7
	WDClSyzwTvhAinqyUM8970w8R9R9KBOs6meXmSqvBpi0x/gBf4y5uSWBh20gS8zgmoUdEntdzTAFb
	D6FjlcBZ9tQ8XmQFhyC9RJeXcz8BmNhWr2hYqKy9Y+i9o/L9UFC4g0fgOFO20femcbTgzH3Cvcw5W
	qoN8y7J27VI0N7/fEjrH/Q/nRu+YwejGKOMa2oDsRqhg3ftGCl/vy/Rn/EOGgTMgduQtBQ8Hl+l7T
	81K0M44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWTS-00000006vGQ-0VYt;
	Mon, 09 Mar 2026 09:00:26 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWTM-00000006vFS-34eJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:00:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWFxwqbLxNAPlkVqjciI9OdLyfEteAg5OIvLAz61f0gKpSUQ1u5KTAeyIxKFUAOSxULC6+3eMrMBWM5KbKuzWennI2ecIWr0RtVrlFrHwGa9Ke0bRxDa88yhrH04DcwvBL8cjRfqVsqOC7Vzzy4BK+LdogHTIYUBLUVcsptbAvat8lLcpBBGs805Ah5RTwrhWALcKV+bJDLUo4zNjnNBKmC8OnxBhjDxWl3fLGlV4PXav0ZSwsjbMSoE4Q4LSYVpLbMEqtmgwYv9uWIWj9A/dOLU/mnvF1HjcP9jkfskxwADgM/pXoizoeiYH9dtKohwmXiTtezAxvKhk2u82mQ3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqAVWUH0bKDoeJU4Txzc+Lq5tfW4jAkf0KzdfnA0I6A=;
 b=dJyE9hEzmzhGex7vGDZKiJTIramIe5NkNnh3kQ+Rz03ISHEGqh/9VVgqNpzvw/fu1Nm3IvXzKXqB5vLZls53sUjwNQ3Rn2eamhqEwb89yIFLtAER0+CYn0jIr6bvRzihuM5DJ2ppqBeqMy3kOA3RlWBcHz/8vwD/kRFcI3ZlWU5AqPlEaNeuyAEv9usKb3RXruTeHFZFftGURvswQoTOozqJbPL48HvfPVWiFgePBXwp7+IJ6O++QW1dEGotZC/fSJycyEC/dS2pc6XmfMdtKYHk+YChCJkcqqamGcjo8NgPeyKRzJHw2cNDyVD6zhLWq7euvhMGW4qbO0o4w2+1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqAVWUH0bKDoeJU4Txzc+Lq5tfW4jAkf0KzdfnA0I6A=;
 b=toSK6ZZ8XUW0mXM4yfCZXpdV/XmwEYmqVAqiUdDFJYNGefbrShJBh4m6J6OArbIhzHVHgwVruje4Rq1q6T7yYXUkj0HP/n+Ii9XJTpxVRuqFn7V3CBinFEf5eHig1vIl1f8IJmwMzGzJhoJgarA+ePHKIqjI6zFh6D0bMpAuaVsz8BAF13HEQ6scKNgMFJMN1vPIcDhkumL+prcRACVl8/9xhbtgv5I4GOWAxXQe9hEdM3fpeFq/KRgVZTiNH4NPpA1oJwCa+axLZzigpofB6+/VJKVsQ1fH5OQ9h+CA//ctSgqAiiLd64Utfy7oONKkgLyze+s6Le/iiLRwGrG5dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by VI1PR10MB3677.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 09:00:12 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 09:00:12 +0000
Message-ID: <af54759d-b65e-4a12-a507-2a357bb7cd0a@kontron.de>
Date: Mon, 9 Mar 2026 10:00:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Kontron i.MX8MP OSM Devicetree Fixups
To: Frank Li <Frank.li@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Frieder Schrempf <frieder@fris.de>
Cc: Annette Kobou <annette.kobou@kontron.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260220103636.9697-1-frieder@fris.de>
 <177281293090.267666.2279739168174022521.b4-ty@nxp.com>
 <aasSIzf8JKPcI0xJ@lizhi-Precision-Tower-5810>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <aasSIzf8JKPcI0xJ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|VI1PR10MB3677:EE_
X-MS-Office365-Filtering-Correlation-Id: 9554f6eb-43e3-449d-3128-08de7dba45b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: 5ShhFNKw36r9H7om2dQ4z2T1s4YlyptGvENFlC1w+0kfEE0nkcVm9vPP5KN7UyW99ACGcXLWsVcp/TUouSFo76GNNXd+9tOJvq77Lln9K811T9aNqWhG+pq1JSh7Cmq50SiyXpbgz7ojIYaHXa90HRU7OkC7WkUY+uN56AP/ppRE6ma1jluHny7H8VpzuNIdsS0QjiU+1V2ycI2gYkCI3GJ5EvBB05SIF8o+3C75hIxhzpwpaawBjxOrd9A11W04TTTiCPVQ8QnvHwzy2HNsqkCOTetsGBPzWi09j7Qd3vfxWlXlMzZN8rtx9bQBKqhjK3ebLS5wAQ4sPrlIxUJytuXgGDohSlZOHQFyaA/FuXCEoXYQVid5wlflKNz99f6EqS+P8SQsQXmwU+Sb5JDtLgGSq2/DNBhMdeW8SgiaJlbRyoGiQ/lyi/qyjQibFyBu8y1M6NCib6VZguEuYpup/cTUGCDGXyOnKpjEXIIIo2HBbcoLWeQCn5OQXbF45H6Y5zy3/RCfFUWQPnD3NTkRM57BpQIuhhitIG4MI6fowzn03fNonJ9Fe1mekeC+t/m0pkFs2xANhu/FlJJuS7vKUq4JRnb3r8ppiRIaOk9JHzxh3/8UrlfHOHXFr4icSRPkWaVNnrevhSFx4wJoyNxLv5XS/9jxXaNDknkzBXBGG1qqTp3YQn1lOL7P50t0mKniO2E3KqFCiSPKF1LyiYVWVyZ+MFSnoYDacxZhXl8pcaRcje+v37u6yWwekBqR/3251gQhG7TKJrLBmQB+/Ajiqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG90QVBHQ3NaT0JBYS9nSXBycjRZb2Y4NjJTWjZsejVZMVpJVktNeVlSWlBM?=
 =?utf-8?B?cVhOK1FZam5uaEtSZFY5VFBtWmNzbUx1VDVRS2Q4OTh3Q2RVZDBrOXh3Z1hK?=
 =?utf-8?B?NkxaYTZrNkpkSXoxV2FZbFBLcW44bzFSNkpybGxTS1orVnI0M0NtNU9WV0Z2?=
 =?utf-8?B?blZmaTRPQTYxeFFrNXR1b0xnRXdGaGJyZWZBa0M4K3VnZlJsUkdsSE82VElO?=
 =?utf-8?B?MXFKTExTVGdtYmx1WC9hL3NWdWZBRGxMWERhRVdGWllzU3dnUU9vcjhQVHl1?=
 =?utf-8?B?MitTVzVSMDlwRnEzdXpYZ2NiQWM3akZiOFhzNDloblQyd0F5T2lIVnpoUjZD?=
 =?utf-8?B?Q3dVc1NzT2ZBY1h4eTlRaGFZVWcrVzFWR3crTWRFRWFzYzJ3ZWtWZDM4dVlq?=
 =?utf-8?B?SDRmZko0c2Z3cnRFRG1BQzhNMmkyRWdwVkhaY0JJVmtiYUFIcjVFWE5Vckp1?=
 =?utf-8?B?bUtwR2dTMUZTVXcwUHBHQSswZGk1SWQySkwzMzhDVTZOc3B3K0w0UFU2eWNn?=
 =?utf-8?B?eVZ2V2tqN1RDbmlkbE42NkwxUjZWUWpHY3hMYlJSVTlkTEFLb0ZObHRtTDZm?=
 =?utf-8?B?ajZqV1pPZFF1RGhBa0NPNXE4VTlRWUQxRmlxbmw1YzQ3c0ZxOHNvS3NRVlNk?=
 =?utf-8?B?VUJTVVRBby92RDV3RU1mK2UvaVRDRUpiY0Nza0dybFZuMERkWjRYVUV0aE5h?=
 =?utf-8?B?d25HaWhpd1FsZGtoeGJYaUlnWC9pN21sazBMY3pPbEdvVThTR2E0YWJIc0V1?=
 =?utf-8?B?ZzhQeUlMY1JsWlQyYSsybXpKVjhNYTlqQ3VVYVdWcGI5ZHQ1UzBWd3UraFVq?=
 =?utf-8?B?cmFuWmpKTnRLdFQyOUdlaTg3c2RBZTJJWHZSbzNHYjJzL2s0OHNOV3pyQnRE?=
 =?utf-8?B?MENDYXR4TFU2c3ErRkJEeGQzM0xjYStWM3VvWWNKOHFkTXpNbkFhVGxraDNH?=
 =?utf-8?B?T3o1c3JIR2RwVkJLTzFwM08xMnBOZm9oY1diSGtwUDRuZHE0ZzhwaUFBK2hq?=
 =?utf-8?B?RmtRUkRNVEhYZUNOS3lUTDIyNU9mZ0UwKzc4Q1A2TWNjbkJpWU5hVDNOUVMv?=
 =?utf-8?B?dXBiUFA5V3NSeTFqdytWcFRnRXBlNUpQVVljVFhTYUxrZ1NVbEczeFkwSzBQ?=
 =?utf-8?B?K21yRUtEcXM5VWJpZkR2S3Q4eWJtT0lNWlFrUVhqRnlOaE1PWDJwTXBVbFJO?=
 =?utf-8?B?VWNadis3Tm51bnZ4WDVtNnJJV1ByNkNxRTI3VlVacXNGMkRid2Q5Rk9ZMHBH?=
 =?utf-8?B?R2ZKcnh5SmJEVnM2ZUV0QTBDUHMrQkhYZkFhV3dvNDV3bzYzdTZ1NU9NMGtn?=
 =?utf-8?B?K1FPdHZFNFNiK0xHWUwrSGcwWWNkSURHZC9jTUVSZmNnOWt1V01UY3BlRGk1?=
 =?utf-8?B?WDZFZkhUNFZpNUI1Ry9VdlpTS2NkZVZqTTJ3TXR3YVY5SVVuRnpmdVJndk1r?=
 =?utf-8?B?NDBGV3NyT0F6RmF1Q3J0YlpXeUlPa0Q3QTRSR1BuSVFldUZwanlZK2JSNGND?=
 =?utf-8?B?WjVjcnFGRlBGdkJiek9kaEtMMzVrTTNUUTUyRzlVc0sraHdXcXRPRkIvQmJt?=
 =?utf-8?B?RGxvWWI2cjgrdG41SlE3aVpCdy9uWWQxODNpSGdDS1JXNThnU0plT00vc1Ni?=
 =?utf-8?B?ejN5Q0F1blF3cktNRGFVd1lYT1JkdlNpcnlUbUFIUVV1UDdONmowNHNJcWVB?=
 =?utf-8?B?eGtCMGxCSmtBOGpQRkVDckpQTHJmWVVXc2J3T2c4TjMxUU9qM1pEeTN1bjA4?=
 =?utf-8?B?enpaUWh1dW90RU52K2tRNU1jbjBEcE0rMmZXWkhHTWttZGUvNGhkME1WYU1E?=
 =?utf-8?B?dlQxV01ITFhwdlYwUU5iUlNRbm96dDJnZ0RNQy9yT2JVVWpTWUx0UHhDRlk2?=
 =?utf-8?B?elpyTDdyZElvbTE4YlQ5amdhWnp6eUdLS2FWa1dmSEJtcGRMd3pzSjd0WUVW?=
 =?utf-8?B?YXVkdjFaQlFwdVRuT0JRZE9UdCtSekd0YzVjSkdMUXVjazIvV1hsTzlSOGxH?=
 =?utf-8?B?ckZkd0xtQ0lRV0o2dUVxV0VBSCtLWVk2KzdyY2ZWRDNRd2ZLVmJyKytzM3RH?=
 =?utf-8?B?VW1PcURhZHdQYURQeUxjTjBFT1RJN3cxRmdiRXEwWkNZUmk4cmNjQVNhVTZ1?=
 =?utf-8?B?ZXprRVNSaFhzd1FOR2RvTkNLR0NwRDZ0V281UTVlU3VucURNdGZVQ3JYbVBF?=
 =?utf-8?B?N0lZMUhXeHlsZ29JSytqd1pNSW5jK1EzOVhNUm9CT3FkWmFsTnJmejZsSGlv?=
 =?utf-8?B?MnFkcDl5NExCSGRkWHVOQWxYcHBDQWRndE4raUNFQkMxbWEvRWVZRHpGUElR?=
 =?utf-8?B?UWMvZDFFbTdoc0Rmajd5YmR0Um1qWi9yc2JmUDhqNTN6UTh0VGNsRzJYSzRS?=
 =?utf-8?Q?3iVSOqBLrh3/XrN8=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9554f6eb-43e3-449d-3128-08de7dba45b3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:00:12.1564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+cI1buy85PAEto014i13uktOl8i6iWD/dVHLHgOnZUyQTtSW9Zb9nQDpqpl2HZCJ2PWFANmXzZ69IGIz0qgMWvQ24nbC2/bG/Ct9nzax6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_020021_131738_314E4CC3 
X-CRM114-Status: GOOD (  14.07  )
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

On 06.03.26 18:42, Frank Li wrote:
> On Fri, Mar 06, 2026 at 11:02:30AM -0500, Frank Li wrote:
>>
>> On Fri, 20 Feb 2026 11:36:15 +0100, Frieder Schrempf wrote:
>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>
>>> This contains three fixes and one cosmetic change for
>>> the Kontron i.MX8MP OSM devices.
>>>
>>> Changes for v2:
>>> * Add Frank's R-b tags (thanks)
>>> * Enhance commit message of patch 2
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/4] arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL devices
>>       commit: ed35f6162eb43e5dc232b91e903e6a76ee5f5601
>> [2/4] arm64: dts: imx8mp-kontron: Drop vmmc-supply to fix SD card on SMARC eval carrier
>>       commit: 02ef82e09f96a0f5c996cdd4d62e66cb80df9f0f
>> [3/4] arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC
>>       commit: 0ab1f5f3652424de16b464488c3d3db3d88b1bd5
> 
> Sorry, I have to drop this one because it cause dtb_check warning.
> 'vdd-supply' is not allowed.
> 
> Although this small changes, please change binding firstly to allow
> vdd-supply, at lease binding change need get ACK from dt team firstly.
> 
> Please make sure not new warning.

Sorry, I forgot to check the bindings. I sent a v3 which includes a
binding patch.

