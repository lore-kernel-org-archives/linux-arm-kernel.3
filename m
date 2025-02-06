Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407B0C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TnAEkAH1nFAtDYWTkkzGncJ8UZMiWkN/uK9DDdd9YNw=; b=H8tF2a3tN3+W7IHgIj8OLIXfxM
	NV9018btX6CNC8iuA6YhjdawR84a4mnGiAbMlao8ZAfQmyc0eu7agtCmISJjg0w4yJN4y9ussGZdM
	8M+VwM5JJEttloD17nnQbRQWBz7YQsiC3AH+rQmqC8Z3G//2LyrcH62v6aEA/OmckxERa9zm5pW6f
	kjJVSPpDivJHKEqm4krsxgp3ezaBYbaEUHzP1+/M3clAUOtXbwPw/4VWdkiTVIAJsBLDwrP+26wwA
	qBtVZVXBjoUna50EA7s98eF/jnuKqP7+vYDvBZifNUvzIGJGQb3FkU8X3ioIvMPbF1dSKE2CWwCW1
	Qt9OBXgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyi8-00000005vSm-2Qrj;
	Thu, 06 Feb 2025 10:02:16 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfye5-00000005uKa-0VUB;
	Thu, 06 Feb 2025 09:58:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+XKtyn5aFIdrAIU0KPp909LejvLfyptDk0LsUgQtg44w9lw5skMhXcZ3fHWCUNDgFoGb9/rZ15hHdt7TwSQ+gU6IUo2QtwWJXNDpaXgeYPDBwLRdAL+1w9L9g28Bl6l28FY4W2l7Waei4uvc1e2ta7+vvxSzSE7Hlcw3NTuFhJI0KkLG0sZy7kV5nZvPQ4oklLVmj83oNSL/dQnlLFbZrjIwGZBtUxxHWtgNVc1NGH1WGNVdBSpKEoNJci5XK4f1UL9bk6ilTGzvLMSoXpAejzMlmlof6pY75F/qQNhlpuA5YhooMprvskONEXS44exiFRk/BQJasSXg0pBDke8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnAEkAH1nFAtDYWTkkzGncJ8UZMiWkN/uK9DDdd9YNw=;
 b=t+4VnaCVJyaZ1SIgbaDKZhMdeQKTiHXmPm2uymtXFjH3J+qO+ZoUwgx1YtRKxUbm9wfZBaM4E6iUCjWbFqzYoa2ZnTd57V12T7ntQeudlTr4RhWrCm8SKLvTq7gyx7Lpqd6kv4rPPlAmzMUS74IqJuLwHD7SzciZDfu8Ciz+eCGsIk0ctvaoTUQZxyxPOZIiOQCCCxaWnykn5kLu1ZlS2cIfyciYGTwOsw6MX/5HO0x3ozsjsd9PSoT4dCNGzU+1kmk+fwMY/EVFlsPqC5JljLzy0pBHf6oaXGdr2DzRX1pBY7+2tLDk+wIx/xa5nnmPIIHC3EWfS75bsNRQno8vpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnAEkAH1nFAtDYWTkkzGncJ8UZMiWkN/uK9DDdd9YNw=;
 b=hwAGMkaIVysmZ1jxRh+EVoLUzUf//t/adRLzz5z6wS6yprcpg+/45rngDcsgQLPOJYLsmN8EaoCVQAdzPx2htMSPG9e7JaA3wQ32kO9FBnysUhOpL+thhjgVUUVXAprhO+brA7TxGvS3pIx+txRoGwmv4hx/blZhDC4ZqmUMsWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAWPR08MB9591.eurprd08.prod.outlook.com (2603:10a6:102:2ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 09:57:55 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 09:57:55 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v3 0/7] media: rockchip: add a driver for the rockchip
 camera interface
Date: Thu, 06 Feb 2025 10:57:38 +0100
Message-Id: <20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJKHpGcC/4WPQQ7CIBBFr2JYOwYGrNSV9zAugIKdqG0DDWpM7
 y7VxI0xLt9M/vszD5Z8JJ/YdvFg0WdK1HcF5HLBXGu6owdqCjPkqDgih1yBhrEfyEE8yXWlIZM
 zA9jaylDXuA5KsZK2Jnmw0XSunfMX3zYEWch5N0Qf6PZq3R8Kt5TGPt5fR2QxT//3ZQEcsNLci
 GAqxe3u2p/D+4FV50c2izN+ZALF5rcMi8yKRmkdnOON/JJN0/QEgo5O9SwBAAA=
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738835873; l=6525;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=63ITDtD8ccrrm+YlQdkRosqBVO2iTPZWu7P7uhReQDU=;
 b=dsUz0LMy5k0aooXD7NqLbUC1ZBoHAzuUAvSL7Naqk2pM78shN1MpaXnaFt9IR7fbW/sMI2Sjl
 OOh5JTn7gMAC3HrcgF85T+ZHNCcP4u//g4GQ6NAsj9lSoklUili5V8H
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAWPR08MB9591:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a5b39b-b834-423d-5c5a-08dd4694ba71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ME1GV2h4NTZSTUVVSktIWTc4a0JLTlpuV1JiRUtrdnVRWmw5aVpqQWdvMzFa?=
 =?utf-8?B?SEJXdWs1MDVrSVM3eXltV0lZbVQ1MEpqQ0JDQ1V6MXNRZ2ZVaVlLSUZVb1Qz?=
 =?utf-8?B?YkFoUDkvNUpVbEd3eWJMUWcxVmtPVXpiMGhpd1cxaHJsR2E0VVgrMVk3d2dr?=
 =?utf-8?B?cEg0N0dyK2VrcWN3QXZWSXdkRXpUWURRRDFSNTh0WTBXQzZiTDlnTHN1Z1o4?=
 =?utf-8?B?UFNKQ0ZTSkVidW9HemhHbGRpbVZNam96UDh1N25oYnU4SFE4YzliQUZYbEJP?=
 =?utf-8?B?b0dTZ0c0V1g1Z09jZmNxc1FqdzFTeVN4Wm1KQUJCSDRCRUhTOHdDOUYyZDJl?=
 =?utf-8?B?R3hOa2ZtOUVPb3M3RmJ1UFdEeEEvbFVuSjRMRmhsWnMrUXRPTWNoY1lqNENE?=
 =?utf-8?B?cTM2TkRPb21PUGNmVnZKNnVzSStUR2JVNUxRV2k0eHM4WDFqUm5Ia0lHU3o0?=
 =?utf-8?B?SlFPVk83Z3UxZ3lpSjl5aGJBcEZtU3BrT2o3YjBad3BBaUI4ckxQbFdOZ2J1?=
 =?utf-8?B?bndjRVJmTlZYTmZmdW5Ebm5nZmJPY25GNWJSclFUL2wzclM2QjA1UXo1OU5k?=
 =?utf-8?B?dm1ydlIwMlBTMjNIVU9ZWG9haE1hdVhFY3pIMnZLZXZUY0ptTnVsbHNaa0ww?=
 =?utf-8?B?TUhZdFRJZ3dNbm0wT0RNQUdLQ1BINVV1WkViVXBLckt5NVZBdFIweW5lQmFw?=
 =?utf-8?B?OUg0dVhqak82SHdPUDdXSytDeFpkM2NzcVZrY3JRVWE1djFPMHQ5UUFBcEg0?=
 =?utf-8?B?eXdub0hQR1hXNEc3WnRCLzBvMmYxM2tmSU9lSEk0WUg3S3dKZkMrMUh6UjV1?=
 =?utf-8?B?VEFIK09lT1Q4T1hRelNmRncvbUFkYUtWY1A2RFlYTjJORzU3dnllb0ZrTCtR?=
 =?utf-8?B?dWJkQVpRaEJxOS9BMmY1ODdjQ0YwcFl4a2oxeGRKQVpuQ1Z4SnAyWDI4TTcr?=
 =?utf-8?B?VnhTZTdlT2VPSnNReUlxTjFqdFFrWWhRSGQ5eFJVS25STXliVHAyRWxtRlBP?=
 =?utf-8?B?Z3k2YVRoM3JSNC9xa1dOT1pQMWlSR3lBTkM1K0pJSVppY0NlQjdVd0dYYy9I?=
 =?utf-8?B?OTNxLzR0a3A3UFlRT0IrNXd0V0crcm4ra1IwTnhXRUVOeElWOENwWDFPUDM1?=
 =?utf-8?B?S0JTQkVtRDloZE9LYnlmUXBvSktJZmJFZ3cwVzFISUNlN25CTE1XaTdkR2Vr?=
 =?utf-8?B?dTNMdFlIMVNVTDZjSHp1Y2NYTVFncEo0UGs2YlVCVy9qM1FWL2JyLzlJa29W?=
 =?utf-8?B?WC8wbENRSWRIOTllT3hpNjFqNDZ1b3V5QUV1M0hzTlRjNnRKc0szOENIM3U4?=
 =?utf-8?B?RElkTFdNK3p3RlR0V2tFR2t5QVQ4N1pTZjVLQkIzVHFIY0wrQm4zL3FhczhQ?=
 =?utf-8?B?ZmpoVVB5VlhBaU9FSmZUajFJWFRQSEFyZ2hPSVNFQ3RMbFhQbjFBYUpaWHI1?=
 =?utf-8?B?aHpPK3RtaHhTcVRsRVZHTFRHV0ZHYWFMWldNU2NyMkxuY0pzUWZLSHpPbnBU?=
 =?utf-8?B?a3hIeWRBVGhzSGFNWmI1dURqRkk1eGlkSWlBR1VQbjV0WE4rOGJ5dmhSRnk3?=
 =?utf-8?B?UnpRYUp0NWhVcVlyRnhsUld5ZjhqZmloM1BhU0NKVnZLbStvbDVJb0JKUmMv?=
 =?utf-8?B?V0JMWmsyT2lDOU1WVEVwTVpIQ0FaSW9HdU9qbEUwakNTekJmaUZXdm9ndzZT?=
 =?utf-8?B?Ly8xajNEdHRBblo2NmVKaHltV0ZZR1BXbE03dTFXV2krTy9SbUNNY1Bkay81?=
 =?utf-8?B?cGFsVk05T1hhcVpnQ2lmZEhlLzlMU3lqL0N3K2VTalROQzl5YXJuUHU3T29C?=
 =?utf-8?B?S2E4bGlxdUZmT1lMcWg4TmRRQUxwZHpCaHFZWHcxMis5dTM0bUhUdEtmTHFh?=
 =?utf-8?B?eXoybGNWUFlMSkVlQTV4ZmJDeXJTNnI0WVJiNElZYzE2VSs1TDZJYnRnM3cx?=
 =?utf-8?B?VkhQYS9NTnFEc2lwL24yTVhJcy84TlVyVlpCTnVZd05reWYwV1ZqcGYvbmZG?=
 =?utf-8?B?RWN4UjJiQzRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVNwbWJMOVB2b2FWVlFURTlKSEdtVDUzOUFPMzdtTVhUbHlOdUYvNXR5Qk1K?=
 =?utf-8?B?bXZLRjZuanNZMVEwME1DTDhEcmlLQldMZWFtOG10VkdMQzV1ZlhaRm1qTlZR?=
 =?utf-8?B?cUhCbkY4SVF4VGJGcDZJTng4YjFnNWVyNUsrZTU3aDJIbmpUN2Y2aklkZ0Vn?=
 =?utf-8?B?cnhvSjdmc284Tk40MnV5bkNLdWowMEZDTXF6cTZ3L3k5SDlVMUNTcy9SNnQx?=
 =?utf-8?B?Qnh6TGJYNjJuMDVwT1B6MDh6dHJQTmgrNTBXVlZFcXVzVzFDMkhDUVVSQXV5?=
 =?utf-8?B?MGQ1WHlPb3hNaHAvZGNkNCtVL0lqREJHMTdjZHhqU0FTSHRlY2hGdEtKQkxG?=
 =?utf-8?B?cEZUYWFmWFF0RmNldTM5OVdUVER4LzNQNHhHZXBuS2FBYTk2aXJjTldUQk1n?=
 =?utf-8?B?Q0ExVmhubzlGcTlVQ1JpR3RjYTZuVUd1TjFCUTRwczV1b1prdHhnRFg5b1RU?=
 =?utf-8?B?QjUrdVhQOXZ0QjBGLzgzSkR4ellkQ0tRdzJyTU9CMVo1eDV2NEdoMFdDMEFW?=
 =?utf-8?B?RlEzRm1udkhJTzN4N0xjdk8xT3ZaNkRGc3NNUkFSNitsK1oySW1qTUFibDhM?=
 =?utf-8?B?UDN1YTg1NVlRN09LaVpVTXVtakI5RVFJSnJJcXBGaUxodGd5cG9LYVVGNGQ4?=
 =?utf-8?B?TjB4N0tyWXBUMG0zRjkyMzNpd21EUGpQZFBnNloxY3B5emhqUVVVUytsS3Zx?=
 =?utf-8?B?alA4dmxjSy9WOTN3N3JtRU9SbXQ1WlNObUdWbHQrWmNlcW1DQk4yZGFzT2xh?=
 =?utf-8?B?dllMbFJEc2k5WEppT0RyR0NBOFpUc0h5RFU5aExMRGRYV3Z1ZzhxVGd1T01F?=
 =?utf-8?B?NHBDMkhaZ1FQTWVjNUgxSjNpaHdURWx4QnhtMlRnaUFzZExpdlRpQUx4RmtL?=
 =?utf-8?B?c3kzUE5NeXNyZWtnTHovQUcxaEtOcEFFOUtkUjBVaDAwd1E0Rnc5eUgybWYv?=
 =?utf-8?B?dlFodmgwOXA3TTBtNnZVTUFoVnl1cFN2bU9VdkZqaU5seG1hWVdQNGUyR0xO?=
 =?utf-8?B?eGJ4QTRPNTdYOEhMdm1xZlhVZUJaN0ZuYm4zd1BxQzYvdVVBUE45TzAwWmlq?=
 =?utf-8?B?TERnd3lZVzlPWWNwRjVGdFBtNXU3Nlo1RXVBUmtmOGNlUUYrVW1zRFFVdFAx?=
 =?utf-8?B?cmYvMkEyTmNXaERSZDhPaWd4N1pnckVUeVRiNEtER1lOUmdMMUlTRThwcFFX?=
 =?utf-8?B?N0dmRzhGYmpYQ1dkMklET1NwTlJJQjZIS05oWVJzbHVSaEppZDl2YVk3ZlFF?=
 =?utf-8?B?NU9Hak5lR1pBVWRFWmZOWmJPeGp3NkN4dUZ5WGJPS01UZFY5TmhmVjQ3SmVJ?=
 =?utf-8?B?U3hnNWRlS3A2UE5LRWFCenNzYXMvSVQwby90Z1MweVZManorOXNEUTBaQlFU?=
 =?utf-8?B?ZzVFUzJOSDEydnkyaFlzV3JMVGdKeEYyMUMvK2VJbm5vYjhGWGIrcXBlQTdF?=
 =?utf-8?B?RUp1K0k2VDdydHR1M21DNFZCNDVqTUdvNE0yS1NVc3V5L0lYcFlYV3FQRTRE?=
 =?utf-8?B?MmVzdnZQUHlCSHdleWsxb2NCdXdySklHN0dIMTNINE5RTStCZkxjQ0tnS1hm?=
 =?utf-8?B?QXoreUx0M2gxb3lpa3YxWGZ5ZXI3ZFhvR01MUVpFZVN2TVBKc0ZYZUt5MlNq?=
 =?utf-8?B?Ui9UU2FzUEpISXRBQ1gwVVhkVE9qYVkreU9ITmdVekdHUW91ZXVvay8wMlFx?=
 =?utf-8?B?b3RMVWlWZEh5MFRhWlVZTkxpMElBd1VtNE9BZEIyWFN5anhoek8yVzFkbHVx?=
 =?utf-8?B?MFBlbDdMeHhRNExLZnJZS1lxMXFMeFlSczIra3VDeE51MURvdDUrR0t5Z2xq?=
 =?utf-8?B?cFduL1N0YVZaTStXbFNudk00S3p1N3R1NnFCckVtYXplcVR2Y2N6TmdPVVNs?=
 =?utf-8?B?K1ZwSS91dmsxU0x4dE9vT3ZnUXNzZXE4UXFSRVd4SGJmQXRCYjJ6WnNzd1ZG?=
 =?utf-8?B?L1J3RDFCM3ZtT2dPaEVReko4MnBTMmRYNzdnb0oxam55RmVqdDlLQXpvb0Vw?=
 =?utf-8?B?Wk9DZ0YzenM4cVUzeUh6c2pGaExWWmpNZGszTUhWMzVSR3hPaFlTRFMwY254?=
 =?utf-8?B?MWVWMUlSb1Y5bGFDb1ROQzFGRU9QTnk2eG4rU2haR1ZVM21YT3o4Uko0ZTNF?=
 =?utf-8?B?WitTOEVKc1cyQmcrM2dId2JkVEVHMzNxYzZCUkFDQSsrMlROc2hnRWFGWTAv?=
 =?utf-8?B?eWc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a5b39b-b834-423d-5c5a-08dd4694ba71
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 09:57:55.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjDGEo9HIr4LzOvpvrlSSEJel1LxgS70pCWJv/dmnQm1zvDU0U2YjI6uu4136bceVJW+SyUqDEZT7Xcojsv2MHeaoY5OwYBzQUNELHLe1AU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9591
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_015805_313451_7B48CDF5 
X-CRM114-Status: GOOD (  15.22  )
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

Habidere,

This series introduces support for the Rockchip Camera Interface (CIF),
which is featured in many Rockchip SoCs in different variations.
For example, the PX30 Video Input Processor (VIP) is able to receive
video data via the Digital Video Port (DVP, a parallel data interface
and transfer it into system memory using a double-buffering mechanism
called ping-pong mode.
The RK3568 Video Capture (VICAP) unit, on the other hand, features a
DVP and a MIPI CSI-2 receiver that can receive video data independently
(both using the ping-pong scheme).
The different variants may have additional features, such as scaling
and/or cropping.
Finally, the RK3588 VICAP unit constitutes an essential piece of the
camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
units, and different data path multiplexers (to system memory, to
ISP, ...).

After yet another major refactoring and renaming the driver "cif" ->
"rkcif", the v3 of the series now adds a basic media controller centric
V4L2 driver for the Rockchip CIF with
 - support for the PX30 VIP (not tested, though, due to the lack of HW)
 - support for the RK3568 VICAP DVP
 - abstraction for the ping-pong scheme to allow for future extensions
 - abstraction for the INTERFACE and CROP parts to allow for future
   extensions
 - initial support for different virtual channels (not tested, though,
   due to the lack of HW)

The patches are functional and have been tested successfully on a
custom RK3568 board including the ITE Tech. IT6801 HDMI receiver as
attached subdevice. The IT6801 driver still needs some loving care but
shall be submitted as well at some point.

However, several features are not yet addressed, such as
 - support for the RK3568 MIPI CSI-2 receiver (I managed to get it
   working, but patches need cleanup -> next item on my TODO)
 - support for the RK3588 variant (-> next but one item on my TODO)
 - support for the scaling units that can be found in some
   variants

Looking forward to your comments!

[0] https://lore.kernel.org/linux-media/20201229161724.511102-1-maxime.chevallier@bootlin.com/
[1] https://lore.kernel.org/linux-media/cover.1707677804.git.mehdi.djait.k@gmail.com/
[2] https://lore.kernel.org/all/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net/

To: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
To: Val Packett <val@packett.cool>
To: Rob Herring <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

Changes in v3:
- renamed the driver "cif" -> "rkcif"
- rebased onto v6.14-rc1
- abstracted the generic INTERFACE+CROP part
- addressed comments by Rob and Sakari
- added V4L2 MPLANE formats to DVP
- added patch that enables the RK3568 VICAP DVP on PF5 IO Expander
- fixed formatting issues raised by media-ci bot
- Link to v2: https://lore.kernel.org/r/20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net

Changes in v2:
- merged with Mehdi's v13
- refactored the complete driver towards a media controller centric driver
- abstracted the generic ping-pong stream (can be used for DVP as well as for CSI-2)
- switched to MPLANE API
- added support for notifications
- Link to v1: https://lore.kernel.org/r/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net

---
Mehdi Djait (2):
      media: dt-bindings: media: add bindings for rockchip px30 vip
      arm64: dts: rockchip: add the vip node to px30

Michael Riesch (5):
      media: dt-bindings: media: video-interfaces: add defines for sampling modes
      media: dt-bindings: media: add bindings for rockchip rk3568 vicap
      media: rockchip: add a driver for the rockchip camera interface
      arm64: dts: rockchip: add vicap node to rk356x
      arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander

 .../bindings/media/rockchip,px30-vip.yaml          | 123 +++
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 167 ++++
 MAINTAINERS                                        |   9 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
 .../rk3568-wolfvision-pf5-io-expander.dtso         |  20 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  44 ++
 drivers/media/platform/rockchip/Kconfig            |   1 +
 drivers/media/platform/rockchip/Makefile           |   1 +
 drivers/media/platform/rockchip/rkcif/Kconfig      |  15 +
 drivers/media/platform/rockchip/rkcif/Makefile     |   7 +
 .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 862 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  24 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   |  25 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  20 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   | 228 ++++++
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 306 ++++++++
 .../platform/rockchip/rkcif/rkcif-interface.c      | 406 ++++++++++
 .../platform/rockchip/rkcif/rkcif-interface.h      |  30 +
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 131 ++++
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 618 +++++++++++++++
 .../media/platform/rockchip/rkcif/rkcif-stream.h   |  31 +
 include/dt-bindings/media/video-interfaces.h       |   4 +
 22 files changed, 3084 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20240220-v6-8-topic-rk3568-vicap-b9b3f9925f44

Best regards,
-- 
Michael Riesch <michael.riesch@wolfvision.net>


