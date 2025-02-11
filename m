Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B320BC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXbkU7EOOtqcoRm1Ch5mfofnBRfBeS3/voENVv+WEwo=; b=HJUAG0mHB9mahIhbppKY3jMRfc
	utvvdpGooHNr7L+7yaxxkPmg/c6OIeCazMCASoZHgeqhFDti8DUEoVDQHwFZ/141hysQd+DkqpDWZ
	1xT6/zuhwKanLcIaIehdfa4lJb/J1vxUNwaWTjPoLnOreGWRVHkJtNIIP2jj8N8y3M7DfTeFarcs0
	9qiuyXDJMqWzAf6c88nr7kUh+y5XUm8h+eO+a+U/da+1vneoFY08QoTxtjWYH0SIICb9DeXTbKkoP
	jtJt6v2/yLiHk2mT+6abpZaEET1+CEXVbYzLfx7nNfvBgNkUmvAC4pNqng0a1hJaXbqCJJWV1kvqF
	xLyVDGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmAp-000000036jy-2pmE;
	Tue, 11 Feb 2025 09:03:19 +0000
Received: from mail-koreacentralazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c40f::2] helo=SE2P216CU007.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thm3c-000000035BF-1RwW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxIuExucNy8eZh50gzUerUaLy5wD453KUxVQql/2wtJILoRJ8QefwxzIab8MJGzPDWVq5C6BqvFXccSNkwgitVqGOCCV7/gEPcq/vePQMY1/k9QIsHBc0a9yPXfzdpS7dGC1HTigFjKXV7796ECBXPfPskSEAn8CAuo1CloZ0wvvgwRr95l8zm6jVUKWuG0Rqe0/c7JMz9vlzBt/85bAZUL2fQDGOJPgDB1oNLhgqsNIEYwaC8AQh/ey8JYQF4uYxkx1taWbxP3TIxfYCJwcXSDmzfwJnpg4Lt3WoiVFV9gBZInvKGZBb1lo6FK8gc8DMm1KUJZaCw20GcUoQFDQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXbkU7EOOtqcoRm1Ch5mfofnBRfBeS3/voENVv+WEwo=;
 b=Fi6Ugm2GlVCq0Amr4SyN4AgOMDBaIHUT7BvnOaZRlE2C4QYMopEq9Jyp4CrUBwaHa740C8321I+7pcd9rZvPH4Kx1dqqeMW0WB+SUAGcdS04ImZWgJz12K0clo31thKknJqN5lRknledt6ohkCDlw0UIPu36867yTe7Qb0vyhJU031z5RdT/YnxSF5E3sBOQ61JezRaB2NqBxKLV6UTDQTwVpt9BxghE8LcIIjm8qo0asLABHW6gxD9DLAs5+NYpMBiAWusqjgOQmE2Z+nEVdtTwtwQDIP9/WuNrkXgR2/qHeZxkS4FpUKJHdYJClaqfoBZTgB4jwZRv9kaKe7Z8uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXbkU7EOOtqcoRm1Ch5mfofnBRfBeS3/voENVv+WEwo=;
 b=Hh9qPU+I0x44DeJ8vVnY5QCJvK/pjqMFMvQ2tPQpXa84+uH9bsCU6Vv9IF6312nAOgUKgi81gbecRF9ArECoEpvXlwHL/Zf0Zwgxp+3goaoK3Zhq1VAOelk06eGs6Jlyf/dqNQAuLQA/rYw/EwYrz4JCddKJraofxJhyrz0PB5o=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1409.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.19; Tue, 11 Feb 2025 08:55:45 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 08:55:45 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH 7/8] media: chips-media: wave6: Add Wave6 control driver
Thread-Topic: [PATCH 7/8] media: chips-media: wave6: Add Wave6 control driver
Thread-Index: AQHbe5s7cZfX4msALk62wDljhUBtgrNAzcUAgADwDbA=
Date: Tue, 11 Feb 2025 08:55:45 +0000
Message-ID: <SL2P216MB12463FDAFE6EBB827D16BAEFFBFD2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-8-nas.chung@chipsnmedia.com>
 <2c3b9e21-06fc-4108-80d7-c4e2c4ceb2fa@kernel.org>
In-Reply-To: <2c3b9e21-06fc-4108-80d7-c4e2c4ceb2fa@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE2P216MB1409:EE_
x-ms-office365-filtering-correlation-id: 370e521b-1fae-4271-efdc-08dd4a79df8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?KaotMhHKpqWrqrNGMFXOX0tGRDF3Mxt9t0BwK48Tvda72FO6Xs8ofY2fr/pI?=
 =?us-ascii?Q?7CfWFma0p5BY1pbptIRWIjijSAsf0RNmkCLaHG/ImgFXnPBZUXzPo52FeGFF?=
 =?us-ascii?Q?rZVTWB9jXqISDxt1Bhc79ccbw9tXKp6Dp7MxgSwjx6416h6eTx/A+6WcMzcI?=
 =?us-ascii?Q?RjkCwODD9rhgd7oJxV2bBk/kpQTuyysOPhzsFl4ql9VeKUf9MJGo9KP6toFW?=
 =?us-ascii?Q?HheeQEgnCiztlenOivJC6AGEYgptK+G3C8g5I10wSGORRrud8eLgralxABMf?=
 =?us-ascii?Q?zBDCQEUpRPjRDTHMsktAWqB0pfb2S4okB28rPr6cFgXmU0ZJKSfn4U1oMasL?=
 =?us-ascii?Q?ORsM+GWy40uSeIDU1t9WqT4WMnSicfS0GWmZsKhVTwj38ROR0iHl/X/kGfdn?=
 =?us-ascii?Q?TSEM27Wm/jrZTJWXaMPjux6I865+/pEjug7xMtQJ5o38P3uAhTq1Uc97UKQp?=
 =?us-ascii?Q?TYJdAB9emMdeuBUkUANU9SzZxJv01i0NJthgDQntpi2mGJJHXwh3Oxl+VEvx?=
 =?us-ascii?Q?0chGL3eujAfA/BOomqbkmv3piaNXSQ/d9iEP0R7dptoVIqRcen+px7hznuDj?=
 =?us-ascii?Q?z7/wzoZh2apMOv5WY5SMUocdrzPORkTV6QLj7n41lixnUuI5sTab/ZzSldlH?=
 =?us-ascii?Q?BE3Vp+BtiN7UidAxKlJJDPq5ow1976nZoElzsEU/htiEMShmiw3HpaOnJ0CF?=
 =?us-ascii?Q?EKilcQrK9xeQ4UIUjCEyBngR4DitghuTclYdXs5pTBT5d1PyMXtTlIZ09Mtw?=
 =?us-ascii?Q?78i62kbNyjwpIkeX6Bbk6NRW+eoBSjetOGXS9etyLCU+NnohkvNm5dXK27Z/?=
 =?us-ascii?Q?yQOnTJt4frgbhhgH1xaQ7oQiNoNc25+QVcHACmZFjEKol467GxLXX305hZKD?=
 =?us-ascii?Q?vmiv1duHkeWWxkuCxQlL8JAmBwsJlH8xYck4JKZYrd4PjVkzdUzoPWNxh2gI?=
 =?us-ascii?Q?R2zk2jpX6AbL40WY/YRQEDbwmg/GP5anAfNMM9/GmPvORR7Xk0sS/yzYx7MY?=
 =?us-ascii?Q?1cMmGWf7xRIsrrEhwvpKgdvIiaar4JLm1+8dieMncJHsC1MQtl4qEUq6D3VE?=
 =?us-ascii?Q?kQce0p2ztTKEr7YBy53FPf5eDFSPUInnH02B940jYthv4OQ5guQ/n3JgQifp?=
 =?us-ascii?Q?K4koZheFBbawxCYZs5pYvy/BL8HcnN4Kt0FZYTqLzP28EF2m8PXRH54mvgPh?=
 =?us-ascii?Q?oxZRo4HjzJmzN/kkS8QR51yAmZAZFkPbGmw6c1aj1rU3gm3vj1nB19ai117L?=
 =?us-ascii?Q?cb5UDT1mwl3r8DrHb5OcBdgeuuYoIf7SXlmNa1f6DHG91YUpNyU1mpyhb6sW?=
 =?us-ascii?Q?FLuo1jB1kM+POkLJsGzHSp/YK453AL0Lewcggg2aytgM+QZl7CeWDsgX0E2a?=
 =?us-ascii?Q?44bXXcp8JaMPPzCr8BqDcYJ7TX6g76A05TT/RWfN2xvSNxU7pMSrEiLoqKtb?=
 =?us-ascii?Q?WBDsAeNmfhDGrIFeHfu1QFGRGNd65EF8?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0ESJ+X95BFeoupRmb8UdiGv0SRKRPl1O8hFgLENHC/TiQdgOwnQsmYMe/UYO?=
 =?us-ascii?Q?Q1a/x3sb3u5wdjTtuHEGgUDYCixKK0KK4fdwtNI4KxNZJLj5O1VPLxtexMnD?=
 =?us-ascii?Q?G2F9yCq7SWSzA89mtNVgF2HJ6JYJtXFE65nAPoHd6DZ4oXPVLU7tKnSz++1o?=
 =?us-ascii?Q?JtbBDf07/rz1Qw+6rnVvayenqaDRrjeXp664GMvh73d30X58JzgITHlb0y2R?=
 =?us-ascii?Q?a2TAsQhJ8dUQpsY90/hQ4lD9cybe5jci6JNjtIcEZ31siePndVP391Hovxkf?=
 =?us-ascii?Q?Qv7D3HMDIoogUk8Q0ujdnN5/3S/UlrPtHshq6DtbPAtwXd9r35nurznoh26O?=
 =?us-ascii?Q?sH2cbWfMk1HlvYHcUI6pBjMbqzCRZAtg6Kr4TcchYtcaGQZbwXkE6vqgVzhd?=
 =?us-ascii?Q?CceY8xk3gi1vDHlKD5A3zYvWe663lyIJvNvmygh2eAW4NAd1n2TvteJt+y8T?=
 =?us-ascii?Q?fhrNcKNibt0c4x3ZYpWZwXKkE4xMK5WTYnxs41ajKUpcVZf5Q3ePoTKgiXyZ?=
 =?us-ascii?Q?3Lj9YJXurtg093g9g8ntczJj07+AlIps/lR+ORoWtL1lWCk4KyJNQBwviEZk?=
 =?us-ascii?Q?Kl+CiSIm/JEB24ZDMxkFSLryYH9LAMPDBTn2lvs7aLDiVWMrEHOUKM1wKGCh?=
 =?us-ascii?Q?HC6Rvw+imrh6kGkfj2XqwtAhHnp1alUa3nU7/ldoEwbZyX00rADH6JtYkWId?=
 =?us-ascii?Q?+hMbxrUSraCWCdXTWVZlVrZ14evid1cnFk5Kh1usdp/JMFpT0J69qiwxLKp3?=
 =?us-ascii?Q?jANSnjdOObEIKXGozNTe640ykKW/PyNivdLfy6uuKtKQfwW9V0LkLIP9i5JA?=
 =?us-ascii?Q?qpBSjuffYM/krdN1Q6YxCCGsm056JNVvgyq6oBAzcDwQ3qlXSp8409Z8oFhB?=
 =?us-ascii?Q?2ySBL+5nJEYuIWtr8gkidrTGcSFHF4k22fcEBddGzuqSY8W6UViUP90mmKuc?=
 =?us-ascii?Q?HHggiw9DPNLv5H671qcJblLuK1jfk5kzttS9IbW9tT7ZabGD7P/WKebtelGZ?=
 =?us-ascii?Q?ec1eWzJv6xeIv1tXLTHHL67T/J3ypLjjZL1yHUvbUhUtPKuhrB1CZLSKuaxt?=
 =?us-ascii?Q?5uc4fSpT8BBhTxOPtPcTttR+VytmXgxxqDqeQ+CaA+6cxDhJawaSqiJA7KNd?=
 =?us-ascii?Q?zyDO3P16VKlCmCU5uHGP9V94VjCj5hlEbicnP1YEnyt6hd6TeuabvTlViWal?=
 =?us-ascii?Q?SQrxSBXLgzNjvg0CJPL7ilK/TjL8QADWpxaCo89lM5D8yl+ZQTB0OYoA30qQ?=
 =?us-ascii?Q?iMYKRDOlw1dNsY7Go/4uxdOfe74Fwu6KoMruY4VakwF6HWEwrFs+3iRHWJkL?=
 =?us-ascii?Q?wUJTPG/pG1ig0cbTj+UfRnRNufZnuMIqreEsIgn3DYRlcngiC3CFohPpjeWH?=
 =?us-ascii?Q?Q23TV8nOOQ/6YbM2i3quAJQbCwM6mOzC/r4wR4Hbr2jnxPnbNxaXs/srjVH9?=
 =?us-ascii?Q?dc1PQWb/RgpgZnO0kXcrxgF9FSlV8BjqFnUBMjtI9q8s5x+cAiWRSfSvcoK9?=
 =?us-ascii?Q?Q9Hs7wIY0hvFaiFSCtvtm9IvDkvDVPNOKZcb5FArDhinj8u+MHLdSL4jdpKV?=
 =?us-ascii?Q?zwqG3xxR3PKiJFO5h4HU/hJs7o62+KwNh9s6IgqcejnrGMB0eKYkhS1XKjJK?=
 =?us-ascii?Q?sQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 370e521b-1fae-4271-efdc-08dd4a79df8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 08:55:45.7998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kI9/AfVaYpf8qWXMTIaEVr3APOl8bA7kpzFMk07NFSL3UefgFg8h4l2BonmECRHecykezoyhe/1XkTftQiOtYRmUXhUM9t4IuE7X4ub/G70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1409
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_005552_530464_E4E9FE46 
X-CRM114-Status: GOOD (  15.71  )
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

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Tuesday, February 11, 2025 2:38 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; sebastian.fricke@collabora.com; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH 7/8] media: chips-media: wave6: Add Wave6 control
>driver
>
>On 10/02/2025 10:07, Nas Chung wrote:
>> +
>> +int wave6_vpu_ctrl_resume_and_get(struct device *dev, struct
>wave6_vpu_entity *entity)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +	bool boot;
>> +	int ret;
>> +
>> +	if (!ctrl)
>> +		return -EINVAL;
>> +
>> +	if (!entity || !entity->dev || !entity->read_reg || !entity-
>>write_reg)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&ctrl->ctrl_lock);
>> +
>> +	ret =3D pm_runtime_resume_and_get(ctrl->dev);
>> +	if (ret) {
>> +		dev_err(dev, "pm runtime resume fail, ret =3D %d\n", ret);
>> +		mutex_unlock(&ctrl->ctrl_lock);
>> +		return ret;
>> +	}
>> +
>> +	entity->booted =3D false;
>> +
>> +	if (ctrl->current_entity)
>> +		boot =3D false;
>> +	else
>> +		boot =3D list_empty(&ctrl->entities) ? true : false;
>> +
>> +	list_add_tail(&entity->list, &ctrl->entities);
>> +	if (boot)
>> +		ret =3D wave6_vpu_ctrl_try_boot(ctrl, entity);
>> +
>> +	if (ctrl->state =3D=3D WAVE6_VPU_STATE_ON)
>> +		wave6_vpu_ctrl_on_boot(entity);
>> +
>> +	if (ret)
>> +		pm_runtime_put_sync(ctrl->dev);
>> +
>> +	mutex_unlock(&ctrl->ctrl_lock);
>> +
>> +	return ret;
>> +}
>
>Drop entire function.
>
>> +EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_resume_and_get);
>
>Drop.
>
>> +
>> +void wave6_vpu_ctrl_put_sync(struct device *dev, struct wave6_vpu_entit=
y
>*entity)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +
>> +	if (!ctrl)
>> +		return;
>> +
>> +	if (entity =3D=3D ctrl->current_entity)
>> +		wave6_vpu_ctrl_wait_done(dev);
>> +
>> +	mutex_lock(&ctrl->ctrl_lock);
>> +
>> +	if (!wave6_vpu_ctrl_find_entity(ctrl, entity))
>> +		goto exit;
>> +
>> +	list_del_init(&entity->list);
>> +	if (list_empty(&ctrl->entities)) {
>> +		if (!entity->read_reg(entity->dev, W6_VPU_VCPU_CUR_PC))
>> +			wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
>> +		else
>> +			wave6_vpu_ctrl_sleep(ctrl, entity);
>> +	}
>> +
>> +	if (!pm_runtime_suspended(ctrl->dev))
>> +		pm_runtime_put_sync(ctrl->dev);
>> +exit:
>> +	mutex_unlock(&ctrl->ctrl_lock);
>> +}
>> +EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_put_sync);
>
>Drop entire function. Dead code.
>
>... or you arranged your patches really incorrectly, but this I can't
>really judge.
>
>
>
>> +
>> +int wave6_vpu_ctrl_wait_done(struct device *dev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (!ctrl)
>> +		return -EINVAL;
>> +
>> +	if (ctrl->state =3D=3D WAVE6_VPU_STATE_OFF)
>> +		return -EINVAL;
>> +
>> +	if (ctrl->state =3D=3D WAVE6_VPU_STATE_ON)
>> +		return 0;
>> +
>> +	ret =3D wave6_wait_event_freezable_timeout(ctrl->load_fw_wq,
>> +						 wave6_vpu_ctrl_get_state(dev) =3D=3D
>> +						 WAVE6_VPU_STATE_ON,
>> +
>msecs_to_jiffies(W6_BOOT_WAIT_TIMEOUT));
>> +	if (ret =3D=3D -ERESTARTSYS || !ret) {
>> +		dev_err(ctrl->dev, "fail to wait vcpu boot done,ret %d\n",
>ret);
>> +		mutex_lock(&ctrl->ctrl_lock);
>> +		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
>> +		mutex_unlock(&ctrl->ctrl_lock);
>> +		return -EINVAL;
>> +	}
>> +
>> +	mutex_lock(&ctrl->ctrl_lock);
>> +	wave6_vpu_ctrl_boot_done(ctrl, 0);
>> +	mutex_unlock(&ctrl->ctrl_lock);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_wait_done);
>
>There is no user of this outside. Drop.
>
>
>> +
>> +int wave6_vpu_ctrl_get_state(struct device *dev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +
>> +	if (!ctrl)
>> +		return -EINVAL;
>> +
>> +	return ctrl->state;
>> +}
>> +EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_get_state);
>
>There is no user of this outside. Drop.
>
>Whatever export stays, must be used by a following patch. You *must* add
>the kerneldoc for it.

I realize that my patch order was incorrect.
I will fix it and include the necessary kerneldoc in v2.

>
>> +
>> +static void wave6_vpu_ctrl_init_reserved_boot_region(struct vpu_ctrl
>*ctrl)
>> +{
>> +	if (ctrl->boot_mem.size < WAVE6_CODE_BUF_SIZE) {
>> +		dev_warn(ctrl->dev, "boot memory size (%zu) is too small\n",
>ctrl->boot_mem.size);
>> +		ctrl->boot_mem.phys_addr =3D 0;
>> +		ctrl->boot_mem.size =3D 0;
>> +		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
>> +		return;
>> +	}
>> +
>> +	ctrl->boot_mem.vaddr =3D devm_memremap(ctrl->dev,
>> +					     ctrl->boot_mem.phys_addr,
>> +					     ctrl->boot_mem.size,
>> +					     MEMREMAP_WC);
>> +	if (!ctrl->boot_mem.vaddr) {
>> +		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
>> +		return;
>> +	}
>> +
>> +	ctrl->boot_mem.dma_addr =3D dma_map_resource(ctrl->dev,
>> +						   ctrl->boot_mem.phys_addr,
>> +						   ctrl->boot_mem.size,
>> +						   DMA_BIDIRECTIONAL,
>> +						   0);
>> +	if (!ctrl->boot_mem.dma_addr) {
>> +		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
>> +		return;
>> +	}
>> +
>> +	dev_info(ctrl->dev, "boot phys_addr: %pad, dma_addr: %pad, size:
>0x%zx\n",
>> +		 &ctrl->boot_mem.phys_addr,
>> +		 &ctrl->boot_mem.dma_addr,
>> +		 ctrl->boot_mem.size);
>
>No, drop. Reasoning further.
>
>> +}
>...
>
>> +
>> +	ctrl->num_clks =3D ret;
>> +
>> +	np =3D of_parse_phandle(pdev->dev.of_node, "boot", 0);
>> +	if (np) {
>> +		struct resource mem;
>> +
>> +		ret =3D of_address_to_resource(np, 0, &mem);
>> +		of_node_put(np);
>> +		if (!ret) {
>> +			ctrl->boot_mem.phys_addr =3D mem.start;
>> +			ctrl->boot_mem.size =3D resource_size(&mem);
>> +			wave6_vpu_ctrl_init_reserved_boot_region(ctrl);
>> +		} else {
>> +			dev_warn(&pdev->dev, "boot resource is not
>available.\n");
>> +		}
>> +	}
>> +
>> +	ctrl->sram_pool =3D of_gen_pool_get(pdev->dev.of_node, "sram", 0);
>> +	if (ctrl->sram_pool) {
>> +		ctrl->sram_buf.size =3D ctrl->res->sram_size;
>> +		ctrl->sram_buf.vaddr =3D gen_pool_dma_alloc(ctrl->sram_pool,
>> +							  ctrl->sram_buf.size,
>> +							  &ctrl->sram_buf.phys_addr);
>> +		if (!ctrl->sram_buf.vaddr)
>> +			ctrl->sram_buf.size =3D 0;
>> +		else
>> +			ctrl->sram_buf.dma_addr =3D dma_map_resource(&pdev->dev,
>> +								   ctrl-
>>sram_buf.phys_addr,
>> +								   ctrl->sram_buf.size,
>> +								   DMA_BIDIRECTIONAL,
>> +								   0);
>> +
>> +		dev_info(&pdev->dev, "sram 0x%pad, 0x%pad, size 0x%lx\n",
>> +			 &ctrl->sram_buf.phys_addr, &ctrl->sram_buf.dma_addr,
>ctrl->sram_buf.size);
>
>You are not supposed to print addresses. This look like fixed hardware
>mappings, so probably harmless but dma_addr not. Drop entire dev_info,
>this is really discouraged practice.

Thanks for the detailed explanation.
I will address this in v2.

>
>
>> +	}
>> +
>> +	if (of_find_property(pdev->dev.of_node, "support-follower", NULL))
>> +		ctrl->support_follower =3D true;
>> +
>> +	wave6_cooling_init(ctrl);
>> +
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void wave6_vpu_ctrl_remove(struct platform_device *pdev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(&pdev->dev);
>> +
>> +	pm_runtime_disable(&pdev->dev);
>> +
>> +	wave6_vpu_ctrl_clear_buffers(ctrl);
>> +	wave6_cooling_remove(ctrl);
>> +	if (ctrl->sram_pool && ctrl->sram_buf.vaddr) {
>> +		dma_unmap_resource(&pdev->dev,
>> +				   ctrl->sram_buf.dma_addr,
>> +				   ctrl->sram_buf.size,
>> +				   DMA_BIDIRECTIONAL,
>> +				   0);
>> +		gen_pool_free(ctrl->sram_pool,
>> +			      (unsigned long)ctrl->sram_buf.vaddr,
>> +			      ctrl->sram_buf.size);
>> +	}
>> +	if (ctrl->boot_mem.dma_addr)
>> +		dma_unmap_resource(&pdev->dev,
>> +				   ctrl->boot_mem.dma_addr,
>> +				   ctrl->boot_mem.size,
>> +				   DMA_BIDIRECTIONAL,
>> +				   0);
>> +	mutex_destroy(&ctrl->ctrl_lock);
>> +}
>> +
>> +#ifdef CONFIG_PM
>> +static int wave6_vpu_ctrl_runtime_suspend(struct device *dev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +
>> +	clk_bulk_disable_unprepare(ctrl->num_clks, ctrl->clks);
>> +	return 0;
>> +}
>> +
>> +static int wave6_vpu_ctrl_runtime_resume(struct device *dev)
>> +{
>> +	struct vpu_ctrl *ctrl =3D dev_get_drvdata(dev);
>> +
>> +	return clk_bulk_prepare_enable(ctrl->num_clks, ctrl->clks);
>> +}
>> +#endif
>> +
>> +#ifdef CONFIG_PM_SLEEP
>> +static int wave6_vpu_ctrl_suspend(struct device *dev)
>> +{
>> +	return 0;
>
>Why do you need empty callbacks?

I forgot to remove it.
I will address this in v2.

Thanks.
Nas.

>
>Best regards,
>Krzysztof

