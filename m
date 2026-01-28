Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512B8D3F083
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=; b=u1heqoWh3N2SWRzxD2XCCvT4qP
	qbwWEg+x2hxZ5cpK74SQGBgwIcx4acgFmMeGuHETmXX/41V7cUuytGF3c1cmYPWkflK3G1L3q0Sdg
	yWK9OBNdO7zt/yojeG9nPJkTNIqvpPZKrRjqiCpgWeIbj3QaC+PCkZ61fHegELjMioT0/zySclkYT
	Axs2HP5yOJ0txbpji3LgSB+YllEb9xKrRZAS30wZpUtzO44vo0G2zL6H2ghXBMRVbHFLPrsvivqbv
	ZH33yqDmd0Ls31gEOU7Z1JyGtTQXZyfvtVGn8qwni0TG3ywioS9LIo3Qx21Pg63Nt6FIJsBvqh3HM
	9Aga6pbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8JG-0000000GNj9-1IY7;
	Wed, 28 Jan 2026 16:22:26 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8J9-0000000GNeT-2XRL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:22:21 +0000
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YQsmHsE2kaGqEpwRlclb6PO4ugkkqJzkXC3zXLN94C4F6H7aAyxRJ1VIMGGPSt+3Tji4K818pMu4owHV55caO1AsS2mPJjgRH17c3x7SHBC86NJkXd5f7h0mb9h6TyrBUtZMEJoGj9ld47i/zTBg9uCxFil+te8LBKWueuIP38woQ675FxBcPQhIIFFEb3Kwx+0kVeYwGR4bsavTsbJrkFvxKPt7X/tC5Au06o5wudvH8x9BmTiApU6PgrCqF/u4w4Ctb9RTKdhVAbFzG0m09zu13d1vbSwiXCX40b5OLpxBY/tW06rqywfEWQQOIkMy+NTyv4HvAigPEHReUATfpw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=nCxsrQBWpTzVqu9vg309CxeotJpDL/4v4iMnYSu/cxWE+Fc7tlIOJCNJddcIdE7P+vpfu6oez9NvSEUyhfdyT4GNQVVoAnm7HQeNKO5cKnhDZRrDapG4zTJrrtbcTlrM81x7GQ3ES8ZM7aiB2EMpTZEetHsm2SekvN2K2Ku/qQ5ACpWuvZxqY8Hkke1bc9GXTrWjm9eFJNwk1g8raks3vfMx8dVwxkMENONVOam6JRujVjOw+kIGJvtg7kQlx5OmeWMuJRduTUH7I7KkTHWHf9QjVRW/U7BB4HEgjrF95oeKfkQQ68bvUVCRHxYmaqII28puBDVcqFwOd0rc/qJEog==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=AaJSRc412Vxj3jztv4KcffmH3CF9hG/okr7nfXwCpR2/mePSPy1yzy/GodQam4JgIrfEI5RkCa/EDV22pzWW3b+r7hZEfJV/U9S/+RX+aF3uO7zkal7sM3V/sDGY8osnZh8aOT6yqgo6H1VrA/uImspu0uuYn0O24n0xuzhj0Vk=
Received: from DU2PR04CA0257.eurprd04.prod.outlook.com (2603:10a6:10:28e::22)
 by VI0PR04MB10418.eurprd04.prod.outlook.com (2603:10a6:800:231::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 16:22:13 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::4c) by DU2PR04CA0257.outlook.office365.com
 (2603:10a6:10:28e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 16:22:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Wed, 28 Jan 2026 16:22:13 +0000
Received: from emails-7093823-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-51.eu-west-1.compute.internal [10.20.6.51])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 857D7806C0;
	Wed, 28 Jan 2026 16:22:13 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1769617333; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=R7jjxD1U1gu1s62DnC4ajRjujRpdifnYIhfjI0lUpYfQvKclrAbPCdqiN9NWE8UUM2WnL
 rdSH1TtdAzFB5axyhxSnL1X+aubfdo9q8ywb5M8VPWNnqEZqlw4SHxIHYCCQFhmwOKFnwfj
 8+HKSJCXeKjtec0acgI58v3+5NVYF7Y=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1769617333;
 b=K2JkekHSSuIH4Mqcp5yRjNSrYv3Ebru0MWD5rdoeo3H0ur/71iC9wOsev/QOv3dOIUMPF
 9Mm6whdpymq4kOhORKCBzVSckxeycBSxcfVBpk63G7sc9f0FPn/3ILKUY3G5+RpHaTH1xxx
 V+7QmEOmDXk4z9Rv5cLzNObpC88W/no=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ls4NdYhpYro6ZTBNu0CJQZuKoGst4leNjZINcHBdWOxMiwr4kaAxe8eR6TassL1vLGU7Xxg95jjNAyBBjySsv8tslyFqbSfjXVSZqa16dEwUbZKId+UHNBHFAMOv4t+p3ilU1hUL68CiXJoh2HevjFscAgB7dhkrf8/3qCZvPXZX9c6e4wgSWu/WZTrPXzFwNQma2AZyZlXxnZcX9qCSX0MY8NgP7Rl2O3NKFR8AP1tVdMq4wRpiQBGrfO2M9RJ7uBL7ylnZt/wq8UwYo7LmdpKsnv6mD488qOQVux2zWcc95iSFSJ2K9Z8C8KlFNafTll1HjTsNceUiw13wl9Vh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=sQ9BwUQOcbtuPWTl9gTij8OBxK4X9c2lpnnuwvCmrGEFk2anUg2l3LX6ldcIE1NVKpw+4BvrrIPOYyM0DEQHDlTSxPgNo9gTjPrJQqpxsHlxcOiyyTl8e4azGZ3Raxe0A2hq349Yn0g+Up8JcP7V2cQa5bxlfMXQNe4p+C7P+lp0MnlqpR4tbYAm9TmSpaCzMetXQrn3Abxd/u7HpTrQPH8j0evkdThJ3z/AqKqLKNX2ineJUpaBfqGj0CJztmqKTJHrvuMLXONGFWTPuOc1aDLGml3hs/E6+mVSEv9rHq0DXnsWoza9yMnw0QjUgTL27f0ZkAXRzRzjkH8YCNqx5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=AaJSRc412Vxj3jztv4KcffmH3CF9hG/okr7nfXwCpR2/mePSPy1yzy/GodQam4JgIrfEI5RkCa/EDV22pzWW3b+r7hZEfJV/U9S/+RX+aF3uO7zkal7sM3V/sDGY8osnZh8aOT6yqgo6H1VrA/uImspu0uuYn0O24n0xuzhj0Vk=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAXPR04MB9447.eurprd04.prod.outlook.com (2603:10a6:102:2b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 16:21:32 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 16:21:32 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 28 Jan 2026 18:21:25 +0200
Subject: [PATCH v8 1/8] dt-bindings: arm: fsl: Add various solidrun i.mx8m
 boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-imx8mp-hb-iiot-v8-1-9646a3025cf4@solid-run.com>
References: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
In-Reply-To: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TLZP290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|PAXPR04MB9447:EE_|DU2PEPF00028D01:EE_|VI0PR04MB10418:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e076756-61f9-41be-7546-08de5e896552
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Y1VXdjcxWmltdWdVK2dEVndMdDgyRkQ5NU5XalZ1UktYVTRTc3lJN1Riek1G?=
 =?utf-8?B?NW9rY2dqOTdINVVkRGIrWlh6V1V3bkZsYjh0Tzh4azhNWDFiYnlXc09jcWNZ?=
 =?utf-8?B?SXlNUmhOUWZNaHBSZ015aUJka0VnT0JhUzVoc0NyWWl0clExRUxzVFd0YStJ?=
 =?utf-8?B?cDZtc043OGpRZEZpeXFrOEhKN1RyZUhNN1MwYkhQT2lmQjY5RXo5aksxelFR?=
 =?utf-8?B?bytST1pRNlZLdHZaQWE5V1p3OEd0MU5jdWYwbHFhOUowZitXWGI3Qyt4c083?=
 =?utf-8?B?MGVubjJPUXNoc0ViRVhZZmtGbVhjVmRjUkxkdms5WUNqejNaUFFXSHJwQytH?=
 =?utf-8?B?Rit2Ym5zSmtZdTdTSG1EbU1kZm8rVXcyVzgxdENGSU90TVUxRTRhMlp3THVl?=
 =?utf-8?B?UXl4ajlXYTVkYWRCSnBnZm9CVHQybkRlZElwcGFKb0F1UGhWdTlqeVU4QnQw?=
 =?utf-8?B?RkVnQ2VEaG41RlRNc0dSWkQ1cjMzT0craDg0YmNkVlJJT3orc0Z0eDBiVnBG?=
 =?utf-8?B?SzNVb0tUSlJBSVdBeDJ4MWplZmQwcWhYem1JR0JaRlA3UVJSclU4ejN1N1dV?=
 =?utf-8?B?SWpLYWE4ODdsb0VzREhWSkM2UkFHZ2dGa1grMWZNQWZNZGxOTnJ1a0xLbk5I?=
 =?utf-8?B?dXBzSnF6N2xuUk9oMGJOZjAzcFFEYWxzWTRXemUzdnJINnZSVzhadXMrbTJl?=
 =?utf-8?B?c1dhaUh2bmhsQjR0QmZLbTd2NDBlSEhMMW9sdm1YY0lMcU5tVW1LeTA5cmNu?=
 =?utf-8?B?U2tpRW5vZk9TVjNtMDJYSGlhcDEyWkFEVHpIemdwWGozY2N4cmd3dW96VmdE?=
 =?utf-8?B?UjN6MTN1dml4YUpwU1BNQWZ3RGZPY0RsZlhweHNRTnBUWVU1VXVxWGoyN0Y4?=
 =?utf-8?B?RGh5TVdMa0kyUXhLa085SnJKNHhLTUcrOWRiY3FWVnRWMTA3YnFyQlRFbkc1?=
 =?utf-8?B?Q082UnhSczJqaHJVdi9YRnM0NVZWajZUd3lNeG1GVmtOTU1hOXc2NmVmbEZi?=
 =?utf-8?B?VjFseTMxNjRqK2ZlYjg1T0ZSR0FqUTBMSXBlSU1ERUdRUmRhdmU3MHpkc2Yz?=
 =?utf-8?B?YVVWUnRuQ1BmbHFHU3c4TS9nRzR3TE8rTlZubnkxWWx3VGp1Y0dGeCtDOExX?=
 =?utf-8?B?QnBRNGcvcDZ1bStWd1pydTQvUE9GMnZsNXFNZlo0UVJ1dTNHL0hjSTByQTEv?=
 =?utf-8?B?NjJ0R1puWVF4TmVUSGM5Tkw4QzhCbmt5bDVwUElJZ3RzWmxCK2dNQzVXWDl0?=
 =?utf-8?B?RWk0Yy94TytCV3o4ZjI3ZjFXd3dnZGZ4cnVzVmZJckQrRkppcmhvK2hVTmh5?=
 =?utf-8?B?eVo3QXJWVERYeUVRdThqUkgxT3h4ZDRSVElJSGgwRjFzcUpRWmd1QkZUSkll?=
 =?utf-8?B?RTB6S01TeHMrY0YrSjNrYlBkZkdleDVuSTlrNjFRd3RjNE5jUVVrTm9zR2lz?=
 =?utf-8?B?M2dqdkx1Tmp4cklNZ2NPTDh4RWNlZVhlMysrWEdTRUpQM3pRb2hBWU04Vjhl?=
 =?utf-8?B?ZFh0MUhaOW9QeVdKZ01QVTlPVGNCTWI0aUZEbzNoalQrbmdDaGdKYWxHaEdo?=
 =?utf-8?B?RS8wajQwc1ljdkNFd0RVYnFkM0R2c2JhWGNiUFZueExzaUNidzBKSmlrUGtS?=
 =?utf-8?B?K1E1SW1wU1dwUFFBdmFjNG9oalp0QjRndkZ1b3RaN25qa2I1VWR6VXQwdS9K?=
 =?utf-8?B?d3JwYnBYRXF3eEtNVGpoYXBSUmZndlNhU0Ztamw3eWFkTzBMMWRhUjR0ckpY?=
 =?utf-8?B?dTZmbTRzeDFkSXZnSXZvajdRdzJueGQzT0hrcThScm96MEsvVXBxcjRTNGl0?=
 =?utf-8?B?dk9OMFVBdE5uNWJ2NGRNVUlQVGk5bVM5bHdnYVVqdXdNeFdPNHdNTThOT0Jp?=
 =?utf-8?B?Z0tZcjRGSERqMTVKRUlqOGp5WnMyS2Q4eExhY1cxMVU4RUhEd3EyYUo2QnZl?=
 =?utf-8?B?WkpBbDAzY3BpWi9OSTNlODF0VWdpaDNCUlhGR2ZUQVZkS3dFQk42eGhPeEZH?=
 =?utf-8?B?cjY0WGswVWg2UElDK0pJTmtZOHExd05vZW1BQ0oveU5pVHczb2FaQ21ZWmVh?=
 =?utf-8?B?bU9ITG5NNVc2ajlFa3NlZmRsSk5pZ0VQVnJ4QVh6UnVNV0F3K0hqU0VWdUNk?=
 =?utf-8?B?OFBrekxBUjdvUkFFY1ZzTUE2OHVPUVdibE5wTjB5NDhJSUpScHlSNUFjUnlo?=
 =?utf-8?Q?KmUuwRP2swFQSOxGY8XmA5g=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9447
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c73c22fdb2b140f092f2833756b93667:solidrun,office365_emails,sent,inline:9b090c66d9ef8042e2fc0e00da84b2f1
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3ee5fa94-3167-4c53-bae7-08de5e894caf
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|35042699022|14060799003|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzBBbVphcThQRWVWdGlpKzBqeG1YTW1Va1Fxa0YwUEFvcUhFNjMyU2F3QlFD?=
 =?utf-8?B?MHFvZGRiQjZIVWU0K0h5d0pOYURMRE1JZHllWVA3QTg4dU1kN1pYMzBYT2t3?=
 =?utf-8?B?RnFtM2JYd1lvYXdyMURDcGMzanNVVkFJVkZrWnp5S0d6NWp4SVdJRm5TY2pr?=
 =?utf-8?B?UmlqL3JJMCsvRVliTDNLVTd5Y015QXNwemVWZXlDZDdnS1dpVU5TK3Zvajc1?=
 =?utf-8?B?Q2psTWxYRlk4SE9lZ3JjbElYTkVaVld0bGgxZFQ4VC9lYS9QcFZNakVLOWhF?=
 =?utf-8?B?eUFPMEsxZ2xlaWJRQ1dGeWg3RHdxVUNhRGJ4VDNDOHM3bzhYV0t6czZ0Tkxx?=
 =?utf-8?B?K0x1UTlSbXJYZHZDMGlMbUQ1S2J0OW1SakFUWG9rRVcwdStUWTZXaXhGUEYz?=
 =?utf-8?B?Sm9EUHAvUno1U3VndDd4QVNvZ05NcmcweWh3OU5YWjVjK21TUk5XdDY3MVJj?=
 =?utf-8?B?V1N0WmtKaXVFZjBOcitIQmRsYXZJRTVlTHN1ekdWUlBoMGdtNE9NR0J3TUYv?=
 =?utf-8?B?Ry9vZUYxa2tabURRajdwM2NiUVdFNmhvOWdWN0NHM0JXOUMrRWRxWW9NUzhl?=
 =?utf-8?B?VFgvSDgxVGhvWXdVRUhLRDBLc3dvcC92RW5XaHlPeVZaRkJkOVF5YjRtVDVl?=
 =?utf-8?B?SGhRcVJVYTBDM1JUMFp5SVIxSmZHcG1kYjBWWDlpVVRmdExKOEJIK3g2NkRQ?=
 =?utf-8?B?cTNCZm9Dc0pFcjNGRnlPbitlTWlFMFhZb0xuTm1SaDBBMm10N2kvQmRoaVhY?=
 =?utf-8?B?aU55MFVJbnRKc3F2TkV1bytMQTNjdnVEVmZwUGZNNWsweTRSclp3Z1J1Q1Bz?=
 =?utf-8?B?WnBzaDlwajJwdkVqZTEzd1E4S1l1ZVhTYjhJNWZEZHZVWG1xL2xXNHFMUyt3?=
 =?utf-8?B?dmV6VmFpSnRBUklJZEN3b05rY3NUVU9sdXJFR3JKeEF6ZzB6aE4yOUgwblVp?=
 =?utf-8?B?RjhJZUdTL2NsdkRINzlhOEN1aHY0UEg3WmJoWUxieDJHK25wUDVsQXdMc2Nm?=
 =?utf-8?B?TENMbzJnRGs2Sk56cTZFdlJoN3l0VElxMzBzS0h6dUYwR242ZGtPejB1bkJR?=
 =?utf-8?B?N2FrU3BYTXN4YU8rYVZNWVpWenl4WFZPaktGQ0Q2NGpMd29aOHV3R0lMY3lM?=
 =?utf-8?B?YzdCRmk5eHhtN0p0aDBNeC9lQng5REJsQml0Qzhqa2JPOG81c1ZkMVlvUEJu?=
 =?utf-8?B?dHd1bkttZGRhZkhZMmNMVm5FVFlGaFpTejR4YzMveFo2MjJRa0VLRThXUnRW?=
 =?utf-8?B?WEZPQzYwM29jK2JLRWxMZk4wcGV5aXFCS3ZqSndyYXdBTUdJRHZrS3hMblJn?=
 =?utf-8?B?a3ZoaWJEUk1NZkNva2Y1V1AwRHNVK2xERnhwU3dTUlAzZVRSaTY3Q1p1dXJ6?=
 =?utf-8?B?bzhOSE9jZFkrY0phSjZYek8xdkVIcGJHVFRFOXhjTVJhZ1NYTWR3WXhQSEw0?=
 =?utf-8?B?dlZIWTBCcUMyY0Ira1Foa3VOTzV2L3ZDUTV1ZEYyVnQ0Z0RadndlTzh5VVBq?=
 =?utf-8?B?cUJtUkZpV0owZFEzNWM3eUd2Zmx6OHNGUzB6VHExU09CMVlXWE8vNDNxQ1pW?=
 =?utf-8?B?UmxLTk02MFNHZmc4WHRYS1pBUnE3dzBUOXhscEZWbTd6cW9rbjNOZFhWV2FB?=
 =?utf-8?B?czczUlVXZjEycjExY0pXWk9xeGNMd1pVdnN0OWJxZE9GSXF1M1hMbGd0dW9m?=
 =?utf-8?B?YWRFdG0vRGJRd0doRzNzTS9LamN5dnpFYTZwcVVBSTV1VWs3Qk9HS293UXQ5?=
 =?utf-8?B?cUJpcEFpcDF1Z091eThMZ2krS2wyeFcyWk5ZNU5xamdNVExoL3hhb2xpMFZS?=
 =?utf-8?B?Q2Z1bk0zKy9wRnJhNTNjcHprYi9YOUNIcjFQU0U5bkVOUk5xSnpBbG9WTjlk?=
 =?utf-8?B?ZVVRVHF2a2xCNGNhZnhES0NsZEhxSDJDQmJxOEJRM0tocVovVER2RU1ablV4?=
 =?utf-8?B?anR2dHdCaDR5RnVDcmRUZUF3azZiWis1VXNqZUVEOTNKMmZCZUJYc0xVWDBj?=
 =?utf-8?B?aVZ4WldicVJiMy9rM21VanFPRnFiZWhpYm5vZzk1bWJlT1hyREZQYkppSERh?=
 =?utf-8?B?K0cvME14NDhUaG8vTFkyQ1FMbU9DR25xUFlDOTBGN1ZNWkNHRkhTTVYyVStq?=
 =?utf-8?B?ZXc4S1B2TnFyQlFwOHREa2VCaUlsRWQxckswM3BhZVlvY2dSeVoyMUQ5MjZB?=
 =?utf-8?B?eEJ4eUtHVXpiQVF5ZTBmVTBPMFVWK09Ea3UvU1NySXZpYmpJTGRROGtCcm4z?=
 =?utf-8?B?WHdtUDYxN2xtZVRFQ1VGSmg1aEJBPT0=?=
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(14060799003)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:22:13.6197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e076756-61f9-41be-7546-08de5e896552
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10418
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_082219_806664_7D6E44D8 
X-CRM114-Status: UNSURE (   7.08  )
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

Add bindings for various SolidRun boards:

- i.MX8MP HummingBoard IIoT - based on the SolidRun i.MX8M Plus SoM
- SolidSense N8 - single-board design with i.MX8M Nano
- i.MX8M Mini System on Module
- i.MX8M Mini HummingBoard Ripple

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..97144a52d5a6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1041,6 +1041,13 @@ properties:
           - const: phytec,imx8mm-phycore-som        # phyCORE-i.MX8MM SoM
           - const: fsl,imx8mm
 
+      - description: SolidRun i.MX8MM SoM based boards
+        items:
+          - enum:
+              - solidrun,imx8mm-hummingboard-ripple # SolidRun i.MX8MM SoM on HummingBoard Ripple
+          - const: solidrun,imx8mm-sr-som
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
@@ -1069,6 +1076,7 @@ properties:
               - fsl,imx8mn-ddr4-evk       # i.MX8MN DDR4 EVK Board
               - fsl,imx8mn-evk            # i.MX8MN LPDDR4 EVK Board
               - gw,imx8mn-gw7902          # i.MX8MM Gateworks Board
+              - solidrun,solidsense-n8-compact # SolidRun SolidSense N8 Compact
           - const: fsl,imx8mn
 
       - description: Variscite VAR-SOM-MX8MN based boards
@@ -1208,6 +1216,7 @@ properties:
         items:
           - enum:
               - solidrun,imx8mp-cubox-m             # SolidRun i.MX8MP SoM on CuBox-M
+              - solidrun,imx8mp-hummingboard-iiot   # SolidRun i.MX8MP SoM on HummingBoard IIoT
               - solidrun,imx8mp-hummingboard-mate   # SolidRun i.MX8MP SoM on HummingBoard Mate
               - solidrun,imx8mp-hummingboard-pro    # SolidRun i.MX8MP SoM on HummingBoard Pro
               - solidrun,imx8mp-hummingboard-pulse  # SolidRun i.MX8MP SoM on HummingBoard Pulse

-- 
2.43.0



