Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619741076382
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpPm6HFZxTIvQ6Pp0/R8nMogtOCzE/Fn8ozPhiZGaXs=; b=PG8+owLmO5Ez0D6FHXRSlOcMj6
	HTO3TiyC5qHN3G435ZSyIuvgKG8c+p8tkboWo7tfOwUwLJt8iUXP2nYDR4qwF0yttUkIqnILjHlnY
	8GmxVniZygfwndTdBUZJtKDq3YavMyfAzXy63e1BLT7b5PEorfrvQAGV+s/JwqOdpTplQYuvNUOqQ
	/KLiMcpwd07ktoYPfDSvimRQshLCktCFFkO6gXpBdszTBfQBtr6dVTgGuRhPBU3s2zDu0uw6NXEly
	rUAc7RraLPNMDxSnu1jcAK8sRvOWekEgPZssgzXpe8bQEeW1BGeicrqh6u+jsOSMmJxML/N9lESDS
	N6x1MFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wda-0000000FVBW-20LQ;
	Wed, 01 Apr 2026 14:33:42 +0000
Received: from mail-westcentralusazolkn19013084.outbound.protection.outlook.com ([52.103.7.84] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wdX-0000000FVAx-2tj1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:33:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSaoKu0cLGooWjxaTf72V+jBmsSkOockggL4zEKW/9gn1XV1jdcmlJar9mVXO8AfDkhHzLnyy2wB0q3bo75uHNafDzODDE5c3OF2gOpn03iP3FvkvZ7HRS40QQi+ahWjAypARBSj/+AukHG2wtCNBjgSIjqO7I/MBAkX65+NByJz7bGh2pp1hluouufi46RPMSPJDmkHPhJdcfA5iXxwnmHhulGQii4PfmXfjz6SOgWYpeErgVwnGClLGrnrzViC6EGMR1ekQhofEDV0bH7GM2Quc58Hx0gF56Tma1AGlzhsZWJ12RXVv0wBrOOoyXBW0X2Ish6dAGe+Q8bq53NdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpPm6HFZxTIvQ6Pp0/R8nMogtOCzE/Fn8ozPhiZGaXs=;
 b=TVX//A3vrgG+btGUhXTkYDLmEMuNEocGq5UtiUBDFItyuRpsyU8YX4fFZcFAcDkkiClFGFxYv855eALn7HHwyrD6a9WaCzRAGbMURwaY+8oTyrN3WcV0pLetMIjt8FqUFgbQ30wkg4XM3PYEnDheRF34KxpnHi4roMmfuIl1GuKcAXfeGdONtN+W2xqIimkIur1Tqbe9plqplxykkzg4xO+hmV1XXW8bNvStyWQ4UCeKFaZFo9bQz/vvjes6hEXAVJ1dd776htImNvLeKYsP5ZpTRqKI6CaYpL+b+V73Qj7Gt00+ghrWTLwLwl8kdEANsb1bewWTHffjbC29aFh+Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpPm6HFZxTIvQ6Pp0/R8nMogtOCzE/Fn8ozPhiZGaXs=;
 b=H2EhAzTlZOxQkMvx0PZnhv+pkoKngVREuAAYh1a7vpnzywKbCaGwgW0xrR16PTGZ6FBrxL7MxNkH09fsmD6ysZPsCYGQeSk59F+NOGZCioKcY61Y72XYwtcp916xTvui57KZQt7fmBkFACCaFODEwQV88BZuzRKo6OFcS+gpvRmTV1XhJjd+1QNeRWmL9nxhX7XiXuF+jL2enmnSx4+lBB23E0sKRcHRFu1/Xpecfiixii9GDCM1DdCXSqnnGFWXETj3GwZGx5+ZAXqq/UniGPuAKN2HylBeW71eheTmgoRza/G7rLQfZUzEq5aON6wd8bt48UoRjD9Uw1dfoWLvNQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by BY5PR02MB6980.namprd02.prod.outlook.com (2603:10b6:a03:235::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 14:33:35 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%6]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 14:33:35 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner
	<tglx@kernel.org>
CC: Michael Kelley <mhklinux@outlook.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: RE: Question: interrupt randomness and handle_percpu_devid_irq()
Thread-Topic: Question: interrupt randomness and handle_percpu_devid_irq()
Thread-Index: AQMiJ5N2+2jpdkiknwvGtETdlqxuqgGzqqVeszHXKoCAAAVfwA==
Date: Wed, 1 Apr 2026 14:33:34 +0000
Message-ID: <SN6PR02MB4157BC5ADA592D8D6084C6DED450A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <SN6PR02MB41577F8265CA23C3027364F7D44FA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <87bjgik042.ffs@tglx> <20260401141417.6uJk69i9@linutronix.de>
In-Reply-To: <20260401141417.6uJk69i9@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|BY5PR02MB6980:EE_
x-ms-office365-filtering-correlation-id: acc31949-462f-419b-032b-08de8ffba7e6
x-ms-exchange-slblob-mailprops: 02NmSoc12Dc6c3c4/rztiZGf6bH6e/ZC4VL6SDdNiqOi+rTyKHu2shSTCwYTW49td1qqKwaDGYfxpY+JovXpscc9ygZNx7HaojM7f7osz8KQ8vNCywGHNQQHxXs/wYC1exRoHcCy9c8tBQVaL7E+dBzbLuxg+ryVkiXdk4sduLz+QqhF2x9ZObOPjtdYSeLYtkNOQKCUEvqqlpr9vO5QP7W6a0gBJKyLvZwO0mIr8IC1aMKm8/UsVU5Ag9gWnX3mpQJl16KRB1LlQY0VSKuu89K0XUCv+igtZhanMyftgOgcg2+i8f8IPCTQ7V3UIrpnbcUyvDDQvSnwQOkhjBoT2E4kVlYe3Ebmv9aZE2kWJF3m51bsZxmRY7Y8mBJMiBF8vtNp+hBkYeN3lR34EeJj5wD5Y6VxU4NrZj3vmPnki//UMNR/8x1Y0amdB42OgYK+/s4vdTm8OqBoO+Su27Va5z3Vf32Ckulp5DpBm34aVkLEU1Dkd3EKotwT6JJQrGxN9n2DpGRHNSIyCfENEDqC3nt/JJS9/GdyaTd1UMqCqWKbNEe7QGzEAufzpfdujZNc/TV2vRqpkJKUsHOr0QJ8iYrerprniR53r5AQOBfyRMr2PVYRN4r9sZYKGlCPK0j6u9B0DjudiezFUIIprWmHNmT4tn0myWLz/zsxU4K75bwrKWrPYZuqILP9LgU6ZsPFAIb/14WS/EqzzhLca9wsGWWtW5jmfhU/4sGVuxS3vuVLhqGt/07v1QpLxHKwgiHC
x-microsoft-antispam: BCL:0;ARA:14566002|12121999013|31061999003|15080799012|37011999003|51005399006|8060799015|8062599012|19110799012|13091999003|461199028|3412199025|440099028|26121999003|102099032|40105399003|1710799026;
x-microsoft-antispam-message-info: =?utf-8?B?YWRJdCs5em9wcjdzcG90QWxiY0FvSlk2ZlJwM0NNYlRDQ3NwQjNrL2p0dVJi?=
 =?utf-8?B?aDJDM0ZDTXpHYXVqVnYvQitncDAwRnpLbUR6ZVZIbTFjWlowK05ES051R1JX?=
 =?utf-8?B?ZEVsN3NSQy9naHMrNHRSNzVrakxmcHNUTVRad1VQc3dvc0t3V1ExeGR5TWVV?=
 =?utf-8?B?U0Rqb2xtY2h1U2xvSjhqKzE2TEkzK3BEMGJqYTUzRndpWGlVcm9OdTRuaE9t?=
 =?utf-8?B?UlZReTVEWHB0aWl6Qm90U3ZXY0dYZFdadVEwNHJheGY2SFhGb0p3TUVXZGw5?=
 =?utf-8?B?dW8yZ1F5OGYrYmlCZmIwQmRoRTVPMVNMRCtUZmQxY2pOaGNSZTJxdkw1M3Zu?=
 =?utf-8?B?UjdheGJBQU4xWEI1V29iRVhoYVMxdTM3Uzg0Z0dBMzM2dHh1c0FkQmVIYW03?=
 =?utf-8?B?OTNlazhPWm1oMVpWZkpGL251bDl0TXpXblRKU2t1M3cyWkJSQnhqR2JybHg5?=
 =?utf-8?B?dThsSzZ0b0hxZDhtcmhQS1I2MTlINGVibHhHc0JuSmxOUW1BVDRPSzRGcjFZ?=
 =?utf-8?B?d0JrREVNOGhQc0g1Z1gyc2dKc0trOTlJOWhQdUdyMWtTd1craVVsbEwvU21j?=
 =?utf-8?B?NjZDS3lHbGtEVlhCZExFWGNRT1E2YW1yc1ozRHNxaVE2Z1g1QTZuV09POS9p?=
 =?utf-8?B?eW41Z1JneUlPMUdtWk5yWU1LbzNrWkFIM1VQbFZUSG9HaEdrNFFqZjBLSHQ2?=
 =?utf-8?B?UlV6ZjNCcTRXL0lVWk5HbTcvUkJDSk5POTlRbzVhOFhQZ2VxOHJyQldUU3Fn?=
 =?utf-8?B?MFQzTVBqV0ZzU0I3dHR2cDdWUXVjK2pqZ1FlalVQTzBSYmw5ZEx0M1daOTZj?=
 =?utf-8?B?TEJUR1BOVzNISHpvelJ0QXIwT01mc1Z4eWVKU3lQM0hrYndvMTBHZklhMlVZ?=
 =?utf-8?B?Qjd2VUhKMUl2Tyt6R2grZTc1SWlsYUViOVBNdTNCaXNjKzFVb2dUMUJ2c0ts?=
 =?utf-8?B?MG9ya2EzaEJuZndhcis3YUtzVlhqVUlvTi9hRTdCT1FwQWVQOWlyL08xeVcw?=
 =?utf-8?B?Nnh6Z0N4TTZETzgxZTVRQW5Wc2F4dWJ4b011L255c014NlN6Z2FESlFEaW16?=
 =?utf-8?B?OTUvU1lVc1lIM2M4MnJ0MGFhQWF5Q2FqdmIrdCtLNFB4SEU3OFdONnptdGQx?=
 =?utf-8?B?MVpyWWVmZC8yNHRpTDdGb2ROQSt1QUw1NnVhYVM0VWxZQkl2QjNKZTRKY3BS?=
 =?utf-8?B?L010NDRzZmdsNDFCK2ZDeVorMVJCYTYyZGRveVRwRDlmbUI0QmVuWEZWZnBl?=
 =?utf-8?B?aXNrNnNQdTZWZVNEMGtlMjJOWjRDSElzSDVxNkloaWV3eFVOLzhNWUppOTZF?=
 =?utf-8?B?TUVvMDQvYWdlMGwzRUV2c3dQSHl1ekU3M0wrOEoyN3JiMWdTbWpOK294VGlJ?=
 =?utf-8?B?emtaWjBQQ3NZTjlpSjlGaDNkZnAxdExkTHZmT2xvV01OdzN4TVBXbCtsYVFo?=
 =?utf-8?Q?5pa3N4P5?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzVtMUUzR2E5RHRRWVZBK2xEdU53TENrb1NWUlFzZ1N1eWxCbEJXVHk1ZTI2?=
 =?utf-8?B?ZjYwbHVyT0V4ZDlJTjRvZUM2Z3B3TUp5MUR5SkJQYjkwUDVTa3VyK3U0ZExT?=
 =?utf-8?B?ZjVMczdnUkpEOEpnUFdVeXJBTHlpbzhjK0xtWHdGRW9YcGxOWm1pclBpRU1D?=
 =?utf-8?B?TXowS29oejg4dHBRdmlKdjN2TkpXZVJ5eDNBK2pLZ0l1cm0ydXVpang5QUpQ?=
 =?utf-8?B?SE9ZQUtsRjZDU2hiYTl0elhuMXpQd0thOEdtR1dielZOcDB0WjI1bjlGUnNP?=
 =?utf-8?B?cWxzUDhrT0tDZDREcHViNjJIdWYyZ0I2RUx1WDd1RlFlcGpyMTF3bE5uVGJI?=
 =?utf-8?B?V0s3RUgyYmhTSmhmL0hhT05JdkRobGtySmNGRkU5T256dGRZL1Q4cmNZVGxY?=
 =?utf-8?B?cW9WajUvbzVNcmdHakdnZHhSNlhsUkFIVGNBVk5aOStLc1Excm43T1k1amts?=
 =?utf-8?B?a0luNVoxOGlValk5NDkwV0o1aUlTYjF3bVNoelRnRXBWZnZBaUFJWFJ6a3JV?=
 =?utf-8?B?bWl3NnVhNGo3VzN0MUFHUmRRSGk3NXVZUzJCdHRqbEpmbW9aV1NjRzJIUklP?=
 =?utf-8?B?NmQ4dmhlelNGbjJNM0o1S1R4UDRpOXRKcGNRNGVET3BsT1BaUGNCeDhDZFJ2?=
 =?utf-8?B?Zjg3MnYrdkFLZ0lWbWNkaVdTNTUwVG12NUM5cHJjbW13SGVLcVBxYlhnRDE0?=
 =?utf-8?B?eXB1Sm12dCsreHpiU0ZJTHZEOTJzTE90eFpVK251Ky80WmgvU1NPbDNIcW9V?=
 =?utf-8?B?T1h6WGRqK1hvMktrTEFyYmFMdVM3M0tIK0NVRVpKMFRIOGFGOUhxZmVMazhW?=
 =?utf-8?B?bXdSKzdXWEFTamNWUHVzSGFtbHNiclAzb3RZYjJpMkRxaHZCcVRuUk0yY29n?=
 =?utf-8?B?WXBmWHFJV1RlUC9Cblk0dUJyMkFlTHlnTEY4akJuei9yY3ZtWldYMjdiMEZz?=
 =?utf-8?B?UHZaeFU0T1g3Y2F0cG1lY1QwUDhTM2xCbjNCY3pZOTgwSUhFZ1pnRVlmcWNP?=
 =?utf-8?B?UTdsQXhTalRjOUxwMjRrbHYyMUFXSzJHZlh3ckNLa0hnNXZJQ01Tbmd6VVow?=
 =?utf-8?B?cUozNk92cHIydkdtQmJGV1VCK09lZW9uaDFDd1VFcmZvTlJwaWNTMnpGcys5?=
 =?utf-8?B?dWxJbno3WmpldFFBZzNLV3YwTStZbHNjZWZRaGR4QnpiVWF3ak1jRGtBeTgz?=
 =?utf-8?B?dXdOQXgwMmpvRXk1TmhhSWxNV3AyM0JJbFVJYkhHTEJIR1RTQ2I1azFjTlBq?=
 =?utf-8?B?dGQrMzN5dVNlMW1yM0dyY05zSlM4MDl3bzJXYnRBaVFxNXBCWHYxMDZNMEli?=
 =?utf-8?B?YTBHZCt2bHJkNXd4bjVSUUJKWVkrTDErREhJVzBobXhLSy92aERqTlJiWitO?=
 =?utf-8?B?QitPWllGZVNUUDM4ZmNvZDJ1dStEZVU1SzRXSDlYRHNSV0ltUG9neUt2ZHM3?=
 =?utf-8?B?Y3BkWE4ybUc2RDNPNUlYaFB5QUpVRHdjcW5sbCtoekU2M2UwUW9lZWdZbEcz?=
 =?utf-8?B?a2JoS250Uk02OHBvdDdIc0VEQ2JKZXl2ajhiTHhsTWdPMER1QkozMGRGOHJt?=
 =?utf-8?B?b0grbk85RnFjc2RvRGp2a2s1aUdnblFuY1BrdnV3c0NzN296NURwMEpOSm5V?=
 =?utf-8?B?aGVHQ2RVZXBHRS9pZmhKc0JPVzY1N0JYVzRXRXVXdllselVhSUNuV1JwbTd4?=
 =?utf-8?B?V1NKeHBKNlhqZVZrcnpub3FXMEFjbEN0c0h1UW0vNVV4OVlNdTFhOCswZHZN?=
 =?utf-8?B?bEJ3TnNEU1FIS2lHYUttYnR6aWZDOEJxUG9KNmhldnB4cmJvZUQ2eFJYUDFL?=
 =?utf-8?Q?Hds4BYe/kQY9g2SUNsEYI3VZd+Y9gme9eQJuA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: acc31949-462f-419b-032b-08de8ffba7e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 14:33:34.9112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6980
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_073339_753847_99990E85 
X-CRM114-Status: GOOD (  25.66  )
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

RnJvbTogU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciA8YmlnZWFzeUBsaW51dHJvbml4LmRlPiBT
ZW50OiBXZWRuZXNkYXksIEFwcmlsIDEsIDIwMjYgNzoxNCBBTQ0KPiBPbiAyMDI2LTAzLTIwIDE2
OjEwOjM3IFsrMDEwMF0sIFRob21hcyBHbGVpeG5lciB3cm90ZToNCj4gPiBPbiBUaHUsIE1hciAx
OSAyMDI2IGF0IDE5OjM0LCBNaWNoYWVsIEtlbGxleSB3cm90ZToNCj4gPiA+IFRoZSBmdW5jdGlv
biBoZWFkZXIgY29tbWVudCBmb3IgaGFuZGxlX3BlcmNwdV9kZXZpZF9pcnEoKSBzYXlzIHRoYXQg
aXQgaXMgdGhlDQo+ID4gPiBzYW1lIGFzIGhhbmRsZV9wZXJjcHVfaXJxKCksIGJ1dCB3aXRoIHRo
ZSBhZGRpdGlvbiBvZiBhIHBvaW50ZXIgdG8gYSBwZXJjcHUNCj4gPiA+IHZhcmlhYmxlIHdpdGgg
dGhlIHJlYWwgZGV2aWNlIGlkLiBUaGF0IG1ha2VzIHNlbnNlLiBCdXQgdGhlcmUncyBhbm90aGVy
IGRpZmZlcmVuY2U6DQo+ID4gPiBoYW5kbGVfcGVyY3B1X2lycSgpIGNhbGxzIGFkZF9pbnRlcnJ1
cHRfcmFuZG9tbmVzcygpIFt2aWEgaGFuZGxlX2lycV9ldmVudF9wZXJjcHUoKV0sDQo+ID4gPiB3
aGlsZSBoYW5kbGVfcGVyY3B1X2RldmlkX2lycSgpIGRvZXMgbm90Lg0KPiA+ID4NCj4gPiA+IFF1
ZXN0aW9uOiBJcyB0aGVyZSBhIHJlYXNvbiBmb3IgdGhpcyBkaWZmZXJlbmNlIGluIGhhbmRsaW5n
IGludGVycnVwdCByYW5kb21uZXNzPw0KPiA+ID4gT3IgaXMgaXQganVzdCBhbiBvdmVyc2lnaHQ/
IGhhbmRsZV9wZXJjcHVfZGV2aWRfaXJxKCkgaXMgdXNlZCwgZm9yIGV4YW1wbGUsIGZvciB0aGUN
Cj4gPiA+IFNHSXMgYW5kIFBQSXMgb24gdGhlIEdJQ3YzIGNoaXAsIHNvIEkgd29uZGVyZWQgaWYg
SVBJcyAoYXMgYnVpbHQgb24gU0dJcykgJiBQUElzDQo+ID4gPiBzcGVjaWZpY2FsbHkgZGlkIG5v
dCB3YW50IHRoZSBvdmVyaGVhZCBvZiBhZGRfaW50ZXJydXB0X3JhbmRvbW5lc3MoKS4gQnV0IHRo
ZW4NCj4gPiA+IEdJQ3Y1IGlzIGRvaW5nIElQSXMgdXNpbmcgTFBJcywgd2hpY2ggdXNlIGhhbmRs
ZV9wZXJjcHVfaXJxKCkgYW5kIGhlbmNlICpkbyoNCj4gPiA+IGFkZCBpbnRlcnJ1cHQgcmFuZG9t
bmVzcy4gVGhhdCBzZWVtZWQgaW5jb25zaXN0ZW50LCB3aGljaCBkaWRuJ3QgaGVscCBwcm92aWRl
DQo+ID4gPiBhbiBhbnN3ZXIuDQo+ID4gPg0KPiA+ID4gVGhlIHF1ZXN0aW9uIGFyaXNlcyBpbiB0
aGUgY29udGV4dCBvZiBMaW51eCBndWVzdHMgcnVubmluZyBvbiBIeXBlci1WLiBIeXBlci1WDQo+
ID4gPiBWTUJ1cyBpbnRlcnJ1cHRzIHRvIHRoZSBndWVzdCBhcmUgcGVyLUNQVSBpbnRlcnJ1cHRz
IGluIExpbnV4LCB1c2luZyBhIFBQSSBvbg0KPiA+ID4gYXJtNjQuIFNvIHRoZXNlIGludGVycnVw
dHMgZG8gbm90IGNhbGwgYWRkX2ludGVycnVwdF9yYW5kb21uZXNzKCksIHdoaWNoIGlzIGENCj4g
PiA+IHByb2JsZW0gYmVjYXVzZSB0aGVzZSBndWVzdHMgZG9uJ3QgaGF2ZSBtdWNoIG90aGVyIHdh
eSB0byBnZXQgZW50cm9weS4gVG8NCj4gPiA+IGZpeCB0aGlzLCB0aGUgVk1CdXMgSVNSIGhhcyBh
bHdheXMgaGFkIGFuIGV4cGxpY2l0IGNhbGwgdG8NCj4gPiA+IGFkZF9pbnRlcnJ1cHRfcmFuZG9t
bmVzcygpLiBCdXQgbWF5YmUgdGhhdCdzIG5vdCB0aGUgYmVzdCBhcHByb2FjaCwgYW5kDQo+ID4g
PiBoYW5kbGVfcGVyY3B1X2RldmlkX2lycSgpIHNob3VsZCBiZSBmaXhlZCB0byBjYWxsIGFkZF9p
bnRlcnJ1cHRfcmFuZG9tbmVzcygpLg0KPiA+DQo+ID4gSSBkb24ndCB0aGluayB0aGVyZSBpcyBh
IHJlYWwgZ29vZCByZWFzb24gdW5sZXNzIGFueSBvZiB0aG9zZSBpbnRlcnJ1cHRzDQo+ID4gaXMg
Tk1JIGxpa2UuDQo+IA0KPiBTbyB3ZSBjb3VsZCB3aXJlIHVwIHRoZSBnZW5lcmljLyBhcmNoIGNv
ZGUgaGVyZSBhbmQgZmVlZCB0aGUNCj4gInJhbmRvbW5lc3MiIGZyb20gdGhlcmUgYW5kIGl0IGZy
b20gdGhlIGRyaXZlciBiaXRzLg0KPiANCg0KSSdtIHBsYW5uaW5nIHRvIHN1Ym1pdCBwYXRjaGVz
IHRvIGRvIHRoYXQsIGFuZCByZW1vdmUgdGhlDQphZGRfaW50ZXJydXB0X3JhbmRvbW5lc3MoKSBj
YWxscyBmcm9tIHRoZSBWTUJ1cyBJU1JzLiAgSG9wZWZ1bGx5IHdpbGwNCmdldCB0aGUgcGF0Y2hl
cyBvdXQgdG9kYXkgb3IgdG9tb3Jyb3cuDQoNCk1pY2hhZWwNCg0K

