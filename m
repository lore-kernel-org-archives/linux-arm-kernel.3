Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889D2CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 07:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRIMfFBwB5qjEkjy+MVoP/dubLHzL7QTTzDJW8peLog=; b=SUmAON0jgtAp/Gi4K+d5sEU7Zn
	QLYabHaULULPk13KwkXtbaUadFuxdWCPb1xurH9ldgGCXAFf28uoA0qIdvwdFwQlJnV1DCuayqV76
	9g//DtKaupJJS3HruUvAPNicBJEX2kvqgiP0uYLFb+0qca15j3P59McaJ4CttQhNQqXVmvlf5zXAU
	kbz0JcXzmmXI3aWXEnsJethY0fNoReUk2p1wi/h1IeuWP9OohyVwt17bupJZ2SAU8oPNpiFt6mP7n
	nFdOTgWAnZ+oVVhy9K8ZgEaOnstKkXse2EZTrVMEti7w31HQCmpww9+rT52PeAtP1FqTU/15yuVNG
	+/LXRgjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWZM-000000000Tj-2p83;
	Wed, 06 May 2026 07:21:20 +0000
Received: from mail-francesouthazon11011062.outbound.protection.outlook.com ([40.107.130.62] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWZL-000000000TK-0JSZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 07:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGoR4tFpvr+2WrYzHY3vlFf4L2I6ZyzTnrnQQBXttNbIu8xDdOo8fmUc4BGbNs3TCQRXei5TpA82Wtv/LR7IibHlwcp19yDh7SBU37L41eyAAgHsqVSmuoOp5lros1GMyS0JEANudeQd57na6lCGvW8Ba5MQZ/UedReFOX4WaO+g8goDAAJ71Bpeh41MKGqa/+jTrYCaFmSxmspnkNGo5HRNr+UM1pER6MspVhsjXcnTnATl9n5xV9qDWwSdxX2Uvta7CtcwwK0fvHle0zEviEGhAENPuZBDayC7KbY4XhPcNX00hJYjEu+x73EgI8AVaQ/OxX591VV9+1npN+XhqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRIMfFBwB5qjEkjy+MVoP/dubLHzL7QTTzDJW8peLog=;
 b=pNGwsZtM8XDFBA+ePOgxbX1wT3f6Zn7G1nxJZy7vxFUhYRtm3OWVVaWYykRyfsRGV8MnllKrtP44nlZi+mN2fz2WzsZUOI1KvSEs+yUZWmGXxuSDOnTCMlDTeggJbtBylUaROg+zAgiB93QhsVfLU6qs1JcZN1bLWn0XyaZvaJ5HpPxpVpZJzSLW4rik7qjliYpMjqlruWB4Bjp+U0PMDPiGG20Q2jC9OZqFqyzgbOaRNZ7KjPqdJu8r52BpAWo6H5//SsKUvlJrL9gmpVSI55ZubI/hE91gSPCylkZ3VqMo8OhyHSmA0yA8SBWG//9ZgYgpOhHNCE+iHl578FLAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRIMfFBwB5qjEkjy+MVoP/dubLHzL7QTTzDJW8peLog=;
 b=GzCxyydyTPswr2PoWPWRKZDtNBhHKua6vZQb+wXYPrNLENxP094mMHEabLPQ9ONVb/Q6EFqtdbEoDfFZ+IW4ay8LjrqMklbqzumpDHAzss4Lm77j1PMo6dibwIAjWn7V6eTFZS34SUNe59y7Figjt+Qoo0Df1On953hTEkFvk9nN3tOkRx5BiaGpCIjzj0J4qU14fHtyOafb4WkLxwh3joQ4DyKFdlJfmvFUISee6/ibf1JTbp3p4D7zCcAVGTedNRQIhBlxR8M67eRSdL9iY594YBuqqyyflqA0hD/zP55FEgfNdy4Y46tYxtmsDqcDaom07Y76tFrHP/qyPDFNBQ==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by VI0PR04MB10710.eurprd04.prod.outlook.com (2603:10a6:800:260::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 07:21:11 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 07:21:11 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, Frank Li <frank.li@nxp.com>,
	"chleroy@kernel.org" <chleroy@kernel.org>, "horms@kernel.org"
	<horms@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v5 net-next 06/15] net: enetc: add support for the
 "Update" operation to buffer pool table
Thread-Topic: [PATCH v5 net-next 06/15] net: enetc: add support for the
 "Update" operation to buffer pool table
Thread-Index: AQHc2EvGYQLCqoBg/E+Cc4krWk1Fi7YAnjaA
Date: Wed, 6 May 2026 07:21:11 +0000
Message-ID: <DBBPR04MB7500426432361E0957AC1E86883F2@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260430024945.3413973-1-wei.fang@nxp.com>
 <20260430024945.3413973-7-wei.fang@nxp.com>
In-Reply-To: <20260430024945.3413973-7-wei.fang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|VI0PR04MB10710:EE_
x-ms-office365-filtering-correlation-id: 1f6b8b1a-1c39-435d-5591-08deab400cba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|921020|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: u7/lyvpjO6UvVGx7oKLupgDZHyYpMZbQJNv2fMTeKT3u7YzODtGcXMOjBxIWKPk8IwaTGySxZtYeu9tgYdohWHNyh62PZ7vmG7578Pb2mPNiRV5CUsrTi5nw+BxT0NurKgF3gbIDXO7+02cwiDmVjrvIo1meL3vWqkIbTRwSz+jga6D3Qch9vFTHCzTojTWBaBT/BeWZJJ5qxG3dP4lWQye59uGLLYPwEbnMRsHbARY27eIeOM+qABebQ1V/uBFVjSxs+FbRmAIX2ZQp1GaST5SffHPkQVFJUNhT8Z8G33GVpKu8rIIaOTUKXMWuNdInFgYxF7/qa2EpzJPqCSL+MPlROUNGm/9as/Blq5J+50RjtN5VAJnZcucBPUcqWWrvFt9St9lEGTHKUWkZwf1wuaq0fd9HthtMJVIrZbUrbWF4D5SghOKeCUT/Wsl50Tyb0Kokg9VfRppJQzHBaiYChwP5rUr2WRfyZ4CHpEQ9b3jG8b6R1DAmVEaHTSVXCU1500vs5/m4FjgR0+8/Q5rbDQoc1XFAP9CAAr3+e3LYb8c4I/qEEFu7kvi+y5MGu+ppa4loqY0U9aHatZ9gSbaj+Qwg9nTaKrQnQUBYZS/fulePIlJv+utGTZp3ytf66LqK/YBsLeBp8TxJLWqitbu77pANWAfrfFI5O+AKPwcMlRf/UyS3f4RzQoILJD8Rqnbfzgh/RfeUJZdqxDk8jYVqD8Yp21Ybq7yKOJMfcucdj1lYnFjNe3G11p1Zk8LOXRNfHgmvhpEFI8f+CjiOzUeefA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(921020)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2BcVrHN84Je1d3VHpXIQasW1lQB7Ix7zNcgJNggcvh5DL509adIBSdK2G0Kk?=
 =?us-ascii?Q?Q5OhwyPG9PbqYxNqh9TOyydWct9bhaiCv9xHsYY+PJQGsaG11A4cVKFYGjiT?=
 =?us-ascii?Q?ccQBJSdN5oW/ome5ruv02QNTp5O+3FhJlfxMRYSFQ4cQCd+pEOXf1SpuU43R?=
 =?us-ascii?Q?13oY8lwVZozvowxQAhVPr7wo0YPA8Jjf3Nq1UCHHrx3mPaFysAdtBybTEeWo?=
 =?us-ascii?Q?Ms92uTsp8yevyQI6r5yzAVzpxMk/FWNe9c7XzN6t8NoW1GpXPF6nM3SdsL27?=
 =?us-ascii?Q?MqNxicrghYolnl5OVt7rrTOVnW57//2I7RHrNJf/9NZZ1WwJIpow546yeli1?=
 =?us-ascii?Q?IJMp67Ek5O4E7iekA2zXE4cu2cTrT2+cy5t9h+hbX/Nw8vI26t+IJ8SnbYZ4?=
 =?us-ascii?Q?v6MSrXTUanzdYh8oOex7iOj8BTRSRNBUPsgKsi0pxzavPYwC2Ynfh3/Ek6su?=
 =?us-ascii?Q?zIoWYP3XOOOSTjsblHL79TTLDd/rYVBaPaLvJB6Az4UjSl7CpFzoyd61uNLi?=
 =?us-ascii?Q?J27g5ZRUBhjgybZs1RHqvrX9gQ1+CX6AX/9GkkouE/pFWL99Czx2BYVF1C40?=
 =?us-ascii?Q?4vQAg9xuQe4JT7k9r5Wd/d/wbufALijKE3lCadBPi1pJ1hqwWvHiFzpBEmV0?=
 =?us-ascii?Q?4O19oQJqzRD0w3ZFgerW0DGpykMsjqWxCGOt1IdZYM78yknZQHk4/DMMvltH?=
 =?us-ascii?Q?Q8efDpmAFvXGhMO0S6khMJ4fjjxtByYap/UB/Favh+xW6NlFtnQ775MnlPXH?=
 =?us-ascii?Q?z5ND3GqOdV/TuoW2/fKjdCbemxw0tvGGEfmQvfN2Mh8LxsAV8p/BdhChsdDs?=
 =?us-ascii?Q?eZF3YGTy5jYxqRcYLGa8+HjX57sBggKooVpomRXxjPtNaDauTJABooStvsoX?=
 =?us-ascii?Q?JsvZnpUQiGDUbr33blt/VPzpVKZDp+9No7lkTVLmDtp3J9yImqlavopelwHY?=
 =?us-ascii?Q?i0Ri9gRbUrdeJi+2fFMNu7OHjUNzNvuvVyDrKvXNIJaReFlsUuSS94ebZfuG?=
 =?us-ascii?Q?FMOVTh7M8a3er0YQwIuGXsEtd9Tlzk3gafr/B17WWb5yYrxZBL3b+LxNemN4?=
 =?us-ascii?Q?IFUdGyZW7570sGwdWrjMX6SxmjBMtqFPgGzVXpeDn9ilBaaQWy9GPjjhylZv?=
 =?us-ascii?Q?KGcE7DSBqRKYpi01kl6mzv4Zt09V1W2wRket8FOTvc+8FGpPxKsO7qXPxhG8?=
 =?us-ascii?Q?fa5wTinl3lB347VoP3hxblpji/O2H7SK4dQHsDjx02w/5mKjfbtiRgQ83IQ1?=
 =?us-ascii?Q?Ws38UPe/YNaAkL2h/mLunGvR5rC5ZmWf/G31B3yAKxx04BQBZ7+lbxGMGCI4?=
 =?us-ascii?Q?PqUS/F/zJeposBp8X3r/pG+Qcozdtukj6uqBSMU6gO3sDJRyq1UcMrIX0p+9?=
 =?us-ascii?Q?kgHzdCITxL/Rm/N3UwHG0mAvQxJy52OAqJYnRkZxP03cJIv/LBbmdvO13NZW?=
 =?us-ascii?Q?MYWVepvrNccy8JV/w7c9rQ3kVLkaEd1SDOh9mUY+l7CY6rs4L0jvDpPFdaev?=
 =?us-ascii?Q?0RjsCN5v6TjEjiSUdbSS9+GpLqzl8tKS2nBQ1eA6IBAOIaUWlEdU4TUEGYxK?=
 =?us-ascii?Q?Ldl0jbJF8Nr1B8DThiLXcuEg+89LB5Exw1v+SUe8a8RS4Gdg/qXOr2i89Z81?=
 =?us-ascii?Q?oXLHoFPdbHdRhxxQwYl0G0bN9bv7X44KrOI4FxhljiY0hA3u1pR4Bnb5QpXJ?=
 =?us-ascii?Q?+KRltrevMerSJCEjlovLhdYYgHLvTGc+BaFaABPtMuqB6slt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7500.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6b8b1a-1c39-435d-5591-08deab400cba
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 07:21:11.2707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQrs10N44/VdtADJW+GYogerv7N/FfVCpv9P+5EIN0J2M8x78RDjufHCYiTbmtN2gD+WDUuk76kUdbVH3s0uPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10710
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_002119_149696_A8A24D64 
X-CRM114-Status: GOOD (  13.66  )
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

> +int ntmp_bpt_update_entry(struct ntmp_user *user, u32 entry_id,
> +			  const struct bpt_cfge_data *cfge)
> +{
> +	struct bpt_req_update *req;
> +	struct netc_swcbd swcbd;
> +	struct netc_cbdr *cbdr;
> +	union netc_cbd cbd;
> +	int err;
> +
> +	swcbd.size =3D sizeof(*req);
> +	err =3D ntmp_alloc_data_mem(user->dev, &swcbd, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	ntmp_fill_crd_eid(&req->rbe, user->tbl.bpt_ver, 0,
> +			  NTMP_GEN_UA_CFGEU | BPT_UA_BPSEU, entry_id);

Below is the comment from Sashiko.

Will setting the BPT_UA_BPSEU flag cause issues here?

The BPT_UA_BPSEU flag instructs the hardware to update the Buffer Pool Stat=
us
Entry (BPSE), but the allocated request buffer (struct bpt_req_update) only
contains the configuration data (struct bpt_cfge_data), entirely omitting t=
he
status data (struct bpt_bpse_data):
drivers/net/ethernet/freescale/enetc/ntmp_private.h:
struct bpt_req_update {
	struct ntmp_req_by_eid rbe;
	struct bpt_cfge_data cfge;
};

Because the length passed to the hardware is only
sizeof(struct bpt_req_update), will the hardware either reject the command
due to a length mismatch, or read past the end of the cfge structure and
write garbage into the hardware buffer pool's operational status fields?

This is a false positive, BPSEU flag indicates buffer pool state element
update. The state information is maintained by the table's internal buffer,
the table will clear the information if BPSEU flag is set.

> +	req->cfge =3D *cfge;
> +	ntmp_fill_request_hdr(&cbd, swcbd.dma, NTMP_LEN(swcbd.size, 0),
> +			      NTMP_BPT_ID, NTMP_CMD_UPDATE,
> NTMP_AM_ENTRY_ID);
> +
> +	ntmp_select_and_lock_cbdr(user, &cbdr);
> +	err =3D netc_xmit_ntmp_cmd(cbdr, &cbd, &swcbd);
> +	if (err)
> +		dev_err(user->dev,
> +			"Failed to update %s entry 0x%x, err: %pe\n",
> +			ntmp_table_name(NTMP_BPT_ID), entry_id, ERR_PTR(err));
> +
> +	ntmp_unlock_cbdr(cbdr);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(ntmp_bpt_update_entry);


