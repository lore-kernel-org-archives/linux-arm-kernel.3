Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69328C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtekIi4dVxHOjYPtqBRPrRHHzxTYakxXgOvOxOYclFg=; b=U2Ok+j+tFqkhumKADHbkQQPKo3
	4+0fwq8fn9MJ//MlcMF9wC+kEL7sjugt/BwQWbXIACX9TV4nezwM7In9BQ75Lkb40DnHI7if2aMmL
	q7YjiNpdN+SheYeHSv7bgGqBj+xdpLNgcAETKIJqcN2dcrRQw0YoMCJ4NH17FP1jd5O9MAFT9lBBl
	VTsTXoTJ+lPswSubUq8kCaYL0ta0O+v1JVgCHcXG/vyAS5Zq0z4WLg9YXKW8xxs9apwvEGfbklkH5
	5iIiN9xslXWnycMLOyrzABeZWW++hETuA7KjUT+YzQj+erxky6j5HHvq4L9l8Wyjr74p+yfSK4HyZ
	ivtnFCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPTb-00000007qYN-0U0a;
	Wed, 09 Jul 2025 07:44:23 +0000
Received: from mail-bn8nam11on20627.outbound.protection.outlook.com ([2a01:111:f403:2414::627] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOeu-00000007jL4-3PVY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:52:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9Y9lQQoKjlmYz6Bq2a5sl8ReMvcSSALtUqgafD+r6bafH76Reg5K5bCLu/l5N5fufllWTN8lrobBU85oo8AkcVYYlgs8H/plGhXEN4mO2WWKpFwObXQQsGItJ2qDLH6JsNMRiam2CvMNVtTnzOXPpMwzY2n9Dw89zE3w06GvqPDeL4Xw+zTk8Ui4Iekv/37RvcUQMUxm3mNUBoblOCnjfhaBxpRxqyRustmsZ5HGCPtLGx99QhFRG4Bd9GeMCrijWoTQHX3Id/b1Si8VVqLsnCCeKmFU6Ym2ORi74fUVPG4TpBYCJQgCwiHeegxTSKN8gGrhp3aIkg2Jd3Ue6asYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtekIi4dVxHOjYPtqBRPrRHHzxTYakxXgOvOxOYclFg=;
 b=GyT9GH+s5ELmULLgJQ8L8f1tr5IaWgNnu1vJLLrR7ELcNziCZQkTAWPLcg1BToF3pMBpyN8BAM4EtoKtB/NBz/661wPvvIIsb8wqVAkUxpbavI+qrJnKVerW4vremKbuc5d5gEQBxKOFOYqCZwbR0aifCm+eVgYaVqnxdr1xMmjbNC1nhLZgI6ibHyLVFDswHQeElLhIrJcdyiqRtR4cU8Lf0jPxGCc6nHAsIVsCf7lb/k+DP4eKTolCt/1VyWVLYLRUKkf3CWlRpNVTuTY28QNRXD/4l9tKRgLQNT60XRYFvq4Ew22Aume5V/5cq+U8aS2J1sdSSVn+LUROnSPKUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtekIi4dVxHOjYPtqBRPrRHHzxTYakxXgOvOxOYclFg=;
 b=EK7eO6vSOvxnKle6v9yCe0t246mihMCeo+qimBI/ycPzPzB2RXNH5gIJiuC5dSlOaVORlZDpgZcOXUGOfbHsSIrtK5Df/OYpuKJxTfMBsIYBGq0lsy7HLRBhFWXywL56lRPWX2JPE2VoYAuJptSm/4Cnf2bXdSlbBb+Gb3lCr2E=
Received: from DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) by
 DS0PR12MB8455.namprd12.prod.outlook.com (2603:10b6:8:158::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.25; Wed, 9 Jul 2025 06:51:52 +0000
Received: from DS7PR12MB8249.namprd12.prod.outlook.com
 ([fe80::eeb0:6d7a:ce8d:a5cb]) by DS7PR12MB8249.namprd12.prod.outlook.com
 ([fe80::eeb0:6d7a:ce8d:a5cb%6]) with mapi id 15.20.8880.021; Wed, 9 Jul 2025
 06:51:52 +0000
From: "Rao, Appana Durga Kedareswara" <appana.durga.kedareswara.rao@amd.com>
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <ukleinek@kernel.org>
CC: "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "Simek, Michal" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>, "Vanukuri,
 Meher Thanmaiee" <MeherThanmaiee.Vanukuri@amd.com>
Subject: RE: [PATCH v4 2/3] clocksource: timer-cadence-ttc: Support TTC device
 configured as PWM
Thread-Topic: [PATCH v4 2/3] clocksource: timer-cadence-ttc: Support TTC
 device configured as PWM
Thread-Index: AQHbZ0HQx65y/GwqLEerJm99AExLJrOClJ2AgIpUmbCAHYMrcA==
Date: Wed, 9 Jul 2025 06:51:52 +0000
Message-ID: <DS7PR12MB82495FE4A65F266D0857EB408F49A@DS7PR12MB8249.namprd12.prod.outlook.com>
References: <20250115113556.2832282-1-mubin.sayyed@amd.com>
 <20250115113556.2832282-3-mubin.sayyed@amd.com>
 <hwnhz4yr6vzz3oav4gq7qptejjy3rdwff7iveawaxexf3tbngr@pnrxi6jkpw3k>
 <DS7PR12MB824987018AAB745E38C638728F7CA@DS7PR12MB8249.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB824987018AAB745E38C638728F7CA@DS7PR12MB8249.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_7ab537de-9a15-4e91-8150-78a9f873b18c_ActionId=76ea000b-91d5-44ac-b769-f8e1e964789a;MSIP_Label_7ab537de-9a15-4e91-8150-78a9f873b18c_ContentBits=0;MSIP_Label_7ab537de-9a15-4e91-8150-78a9f873b18c_Enabled=true;MSIP_Label_7ab537de-9a15-4e91-8150-78a9f873b18c_Method=Privileged;MSIP_Label_7ab537de-9a15-4e91-8150-78a9f873b18c_Name=Third
 Party_New;MSIP_Label_7ab537de-9a15-4e91-8150-78a9f873b18c_SetDate=2025-07-09T06:49:03Z;MSIP_Label_7ab537de-9a15-4e91-8150-78a9f873b18c_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_7ab537de-9a15-4e91-8150-78a9f873b18c_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB8249:EE_|DS0PR12MB8455:EE_
x-ms-office365-filtering-correlation-id: 27e728ae-c124-4570-eabc-08ddbeb515d9
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?gnu09J3VapGDUYNAiF7HAM/RmpvtOY5VsjyEMvYh67CCKzZNLi3DPg5mu6?=
 =?iso-8859-1?Q?RkX0i7gdMWoF/us0gt2kcZwYbGiZYzMe4+cUpvavViCYXZFI/bftY/GuNA?=
 =?iso-8859-1?Q?+F/xRADOyqe/tWarSXoB+Nb5oKp8xB+0aatoGOPKFCpfK7iVQ1FC1xG0hV?=
 =?iso-8859-1?Q?/587MQPcn5NgZ1soO2mZwykXcy7mSp2lhip+gwv7volo2SXFXYJByprGVD?=
 =?iso-8859-1?Q?AaJoMqJjLf6JVmkB6T6eB/75Rx14V8K8kEZmJZDNX7tzxjyzXSwn7hcbZ5?=
 =?iso-8859-1?Q?hqNMNuzeLVynAJzd1gDJZNC1XZoZo4QZU6Wf7+v5BEyqH6z6iIe8ma8FKz?=
 =?iso-8859-1?Q?S6MC3kn4oU0LRyyRxADx91v2SvzOzM7W2jzbYdE0vxpKH3WWoTk/T7wAln?=
 =?iso-8859-1?Q?YzzhrtA5gqjTR5dYjxu6DEgpkOuH1zm8FpQyKISaWBGzEQ5x4ElQ2g/L/N?=
 =?iso-8859-1?Q?GpzBx5FuoGVh33ShUKYwpJLXX0M2LNfrKf1xLEeqzBZ9KU8AnypKeT6eMb?=
 =?iso-8859-1?Q?oDPxB2F/9LR7nBgWWnL6EbWzQJdyhgUAJp18D4d3MDuDgxo2yTWwsrRY2I?=
 =?iso-8859-1?Q?J2zhm25+sGLB6ERX447xXLPtGmVMG6SWoJO5LvLl9AA1Pqk7Nf8/D7np5o?=
 =?iso-8859-1?Q?b4FdCASughDFoQirwc95TtHWnsWVSHbDKItgjgXAOAvh2Oa5XvdqJNjjnX?=
 =?iso-8859-1?Q?qLS3EV3vXTarbOmOf7fFyf5I2Ag75P5IluyKnW/Wey3skfuNUE1o5yUDGY?=
 =?iso-8859-1?Q?wN3hPvtYS5hK1FjTTBHwmDDB3UzTzWh1zC1JJCVEdfwVBieDFz90znNiiX?=
 =?iso-8859-1?Q?jKKVoK8w2MykQJ+D03qjn/0zsrVdOgNnyaMf6FvrY4dOj03TRfroRoQcuE?=
 =?iso-8859-1?Q?dey7ZZthPzha0/ik31xCdhUkhjwNFkpmsBRSBLEnpJJr6HIydYQVMk4D0O?=
 =?iso-8859-1?Q?zU2MAKmg7l+c5MNStUht0X+4MeC9U3Td87BjljC18dkR/noXraI5Bdonuq?=
 =?iso-8859-1?Q?S9ruqqT2s5kXndGzI5vroV3kThpqj1uh9vrAwQu7NS6+ACu7IwDaoxhyt3?=
 =?iso-8859-1?Q?M56t+JlGKO4Cx1JuvhvRx8Zcprft+NmOHWTn8nP3do1DvFTGHyLq01hAbp?=
 =?iso-8859-1?Q?Qoq9RhVxGmqhd7d2QAomXx9dBm2gUYAtM0m2MEtWG70lSJ6zn8PbM5NsSa?=
 =?iso-8859-1?Q?L466EVelHQvqi+GjAcGnhZ5JbP8BPmLAm1LbZNHc0/7xkOZFmJQgzazl0E?=
 =?iso-8859-1?Q?4+uQ2RAvBN5YR1hozG3yOJ8C6bNZ3SoxXcRu/ysboC1HvF2KifZidlBoPF?=
 =?iso-8859-1?Q?8UveVMN1MhJODUY9DstD7noKRVtPSIc3u59p0lkinCxVbXhAnGrjRmb0Ao?=
 =?iso-8859-1?Q?Tbo5g9Sk+k0CB7r1ilXYj7nYfDvjCnRF0oszF+IYsLrqov3a0CeUPfJOwk?=
 =?iso-8859-1?Q?FtJv9SSdz8TVykics/RWVSVchA0hba1XvdXUUETisxhFa75i6tmg91/OO9?=
 =?iso-8859-1?Q?oldtQuwxvVuprtffoAxYeZi1PcI1gdoyHMJBnnfLZ3zg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8249.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?q7se94GnNQZ6jYfvNWW+REuKBDNPgjTcqzEzmxvQ5L9HCLaYpYo8pkM2wS?=
 =?iso-8859-1?Q?ZHiXfRLtP8EsBSyXj1+LTdLq6DNzISlK913KGHizGdzxNTsQERW1t20/AP?=
 =?iso-8859-1?Q?H4ebyfocGg7LPSJofomZHJNk0/UpuFm84ZlKR5Xog6NorGiongIFkSkiZS?=
 =?iso-8859-1?Q?PpSjO3iTtPPXV921wggIVBoix7mvTh42YEMa+0IBDPf8cjQ/VNHf3dP9BV?=
 =?iso-8859-1?Q?cIksDE4Cefew2C1J5nh3UcFQFhszgMaiV3ArFNgGrQEZL1PwTnDJmSX5e6?=
 =?iso-8859-1?Q?iEyV2/kSK+12P23YW4THwJ0rTQfXmgLGK19tESW86Glb6cYw8HfXlKKP07?=
 =?iso-8859-1?Q?iJ4F0Lq0GdNx+fdUmnsnR332wQJirdrwDoyp5azn39C4B6JUB3JUNLu8o+?=
 =?iso-8859-1?Q?vGeRgSlvqmLYT4vtolgNFlMn2FTUiifH0usYdktSIZk5/BxsHllN6gRmPG?=
 =?iso-8859-1?Q?Jojb8GhTd/7ok3LypaXMtwrqALJlOVDIryy8m20N/qu/cD+ZWrfc0TU8Fe?=
 =?iso-8859-1?Q?9LgcXSoyo3k4ZkrRJss9WhHcvyIyLp9CRGwd7po5cScXj3XOfTJ+uHuAdH?=
 =?iso-8859-1?Q?/P9p2J4da0Xsqns+GBhvsxx+N5VpV69L7sAPGuBE0cJyW+KyV3tUwVgahW?=
 =?iso-8859-1?Q?v/xNaU8hgePWiQbfW+m/RdHAOeEfshl7LT/SpH01F6sfSjBJF661TpYnLb?=
 =?iso-8859-1?Q?CUvsyEAo7o25rnYBKQUyw4tgnQ1Qr2G04p5ODuY1X3QZUUE2bfyc26cCdg?=
 =?iso-8859-1?Q?xWt3033PWXMqm+7GYgNyLR9vdIQKufjzzj1hIF7SXPPmqUlBp7Mh6bCkAx?=
 =?iso-8859-1?Q?WMJHfVwZtwYo61kJTD3z7jv0fBevGjuEiKt5Au5M8Wwsl0hLfzh8ICJIf9?=
 =?iso-8859-1?Q?ZGbo3P8eSu9+oJE9OZYLTYfgWpnStfUV66GJjqTVXXR5WEdIZs4U9sZC/9?=
 =?iso-8859-1?Q?DQPe4SsBRC56tzIOiIF9tA9jG+MW2Sk63aP9F9b8v0ZTO/z0CSBCVmUGqN?=
 =?iso-8859-1?Q?Pw8JdHIbqIH9bWuhtaOjaf1EZ+bCI2ErDzC6bsQqz2pn6+3x0Xw6RX6fYb?=
 =?iso-8859-1?Q?EaX5ADp1302Akth0L0+9YbJFAX+tsRvtqHHnpiautPHLKlbZtE2GyUqHfK?=
 =?iso-8859-1?Q?LaL1CHO+GIZ9DiIE47TC3yBeOB0xgcUvO1R7BH0jsHLk+25FBLxMOoLIUW?=
 =?iso-8859-1?Q?qZ8I7nkxy61t9ykx7jziI6by0TcHjcqOwSVNOrwZpVh3NYJV59Q3fVLvSc?=
 =?iso-8859-1?Q?LGlDE3QwnqYAONzrRmcuzX2vocDWm2rxyLnMsT5EJn6aiHJ4LJ3Oeigd+y?=
 =?iso-8859-1?Q?Ji/zgbvOEComWyxjsxACox17e8JW7dJ+xUM0f6PnVTcJoG3/0lrQdzbrhJ?=
 =?iso-8859-1?Q?HlvDUaxgzAPfkr8X7+NrsiIbHv/FYa9qd53udTsVmQmh8N0Q4Gg677whhI?=
 =?iso-8859-1?Q?KbgkA5nhXIi3BjNHObzm3+pLUNWht0vjJb3zYxkWnpYRSu/ytY3XzvRAav?=
 =?iso-8859-1?Q?6aNRDNO9lm4D5CsSqYdrtbR4+X0pdJkhxrNnE6UZDUGpGTueu8+BcRD7xJ?=
 =?iso-8859-1?Q?/WsxH97H9bfgib3HGtkZkza+fPolwGhQCwBVhnIklrUAi1sLwxMmuJYziL?=
 =?iso-8859-1?Q?LAvfd0NEUdIaQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8249.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e728ae-c124-4570-eabc-08ddbeb515d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 06:51:52.1287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqJBvBnODcFhkzGlFSTaVP5I4XXZrxeEZlAJ6B4rdQCVWENZb+jI69fUzi9Pvd6a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8455
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_235200_853034_6321F24A 
X-CRM114-Status: GOOD (  24.09  )
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

Ping!

<Snip>
>=20
> Hi Uwe,
>=20
> <Snip>
> > > +   /*
> > > +    * If pwm-cells property is present in TTC node,
> > > +    * it would be treated as PWM device.
> > > +    */
> > > +   if (of_property_read_bool(timer, "#pwm-cells")) {
> > > +           #if defined(CONFIG_PWM_CADENCE)
> > > +           ttc_config->is_pwm_mode =3D true;
> > > +                   return ttc_pwm_probe(pdev);
> >
> > strange indention. Maybe use
> >
> >       if (IS_REACHABLE(CONFIG_PWM_CADENCE))
> >
> > This is an unusal way to bind the PWM driver. I'd prefer creation of
> > separate device in the PWM case. I wonder if it can happen that
> > ttc_pwm_probe() is called during boot before pwm_init() completed. Or
> > use an auxbus device to distinguish between timer and pwm?
> >
>=20
> Sorry for the delay in response the upstreaming of the TTC PWM driver was
> previously managed by Mubin. Since his departure from the organization, I
> will be taking over and continuing the upstreaming effort.
>=20
> I have reviewed the v1 to v4 patch series along with all the associated
> feedback. In response to the concerns raised regarding the use of auxbus,=
 I
> would like to propose an alternative solution: registering the PWM
> functionality as a separate platform driver using a distinct compatible s=
tring.
> This would allow the PWM driver to be probed only when the specific
> compatible string is present, while the timer driver would be used otherw=
ise.
>=20
> If this approach is agreeable, I will proceed with preparing the v5 patch
> accordingly(after fixing other review comments along with this change)
> otherwise will explore the auxbus device please let me know your thoughts=
.
>=20
> Regards,
> Kedar.
> > > +           #else
> > > +                   return -ENODEV;
> > > +           #endif
> > > +   }
> > > +   dev_set_drvdata(&pdev->dev, ttc_config);
> > > +
> > >     if (initialized)
> > >             return 0;
> > >
> >
> > Best regards
> > Uwe


