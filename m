Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E79CF8543
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 06:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKZodm+ReYNusY2xVVSFiAlOsTVc6bMMlqux5zRbruQ=; b=N2wkmetju4+ibdCgXjl8pYg2y6
	rGTMtgOJg7Q1hhpN7oDrHOlv75nbbQW+fhvCbiFG0GghHIWB1yp88vO3ZV0uC/bJUCFfFQlXLEXXs
	+4TVqrxRbjBwtrDQZFZsShOFRSGdLQy6rtcv/n4OLJxPMtyMb1SrrXsXseyyf21fQ1pEwS9PoaVdt
	ilwOFMBDdpuDOaraM8YOrHLfcMm7Vkc+UVisXt8TOwrh4vZDqPn7NGUHN8EkfUAPLNhUpBHSY9Kod
	EXJ5aH+e6G1KmX9pu8A0jkRAr7sOHynuSE9RxNSykY4lldXe0fJuLXRako+l/Ds6emlvmmzX6Hvll
	rMIGv4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLy4G-00000006DUr-0L6z;
	Thu, 20 Nov 2025 06:22:56 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLy4D-00000006DUX-3XMm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 06:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uKZodm+ReYNusY2xVVSFiAlOsTVc6bMMlqux5zRbruQ=; b=h3LFlK7Wtmag9cy54MP7LldHv0
	UnEGkpirnMoMHP7tGCIkA/m2YuWUpHPS7P/73KIrEKIK/16xg/QXA/I4zkZ0VxiFysuxDshAsY4bF
	uHpXDfqmGc9IOamajZPyc7tJtXoabNFcg5m0M06gq+d1Mq1clll7aoLX8IdnAM8u9Lb6VjD2jxRrd
	AE32+R8VUBbFhz6hS+0qDGGn08EZmMKXnfshIX5BkuDRmYMw25jg1dmkORYjD8pDpCl0s0DV+Va6j
	LQdcP5pZ/kPlk35c9GzHjADvc56VR/vh6GCMPZMyUv5XkfXLvNnM5lBM4WDn+EIHAm4pq5ZclGNzR
	Xe61u8vg==;
Received: from [122.175.9.182] (port=22234 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vLy4B-00000004wxM-05Sy;
	Thu, 20 Nov 2025 01:22:51 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 078A21A681A3;
	Thu, 20 Nov 2025 11:52:38 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id DuUOaIeWS9qg; Thu, 20 Nov 2025 11:52:37 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id D46A71A6818A;
	Thu, 20 Nov 2025 11:52:37 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id AirGp5UpjfKQ; Thu, 20 Nov 2025 11:52:37 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id B10181A681A3;
	Thu, 20 Nov 2025 11:52:37 +0530 (IST)
Date: Thu, 20 Nov 2025 11:52:37 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Simon Horman <horms@kernel.org>
Cc: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>, 
	afd <afd@ti.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	ALOK TIWARI <alok.a.tiwari@oracle.com>, pratheesh <pratheesh@ti.com>, 
	j-rameshbabu <j-rameshbabu@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>
Message-ID: <1902810966.5288.1763619757671.JavaMail.zimbra@couthit.local>
In-Reply-To: <aRuOzelPTiwaoNop@horms.kernel.org>
References: <20251113101229.675141-1-parvathi@couthit.com> <20251113101229.675141-3-parvathi@couthit.com> <aRuOzelPTiwaoNop@horms.kernel.org>
Subject: Re: [PATCH net-next v5 2/3] net: ti: icssm-prueth: Adds switchdev
 support for icssm_prueth driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.10.233]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC138 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: icssm-prueth: Adds switchdev support for icssm_prueth driver
Thread-Index: yIyBbZf/3F6Je9h5CgJpEDaQYsxTKA==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_222253_903945_B602BC24 
X-CRM114-Status: UNSURE (   8.26  )
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

Hi,

> On Thu, Nov 13, 2025 at 03:40:22PM +0530, Parvathi Pudi wrote:
>=20
> ...
>=20
>> @@ -222,12 +229,14 @@ struct prueth_emac {
>>  =09const char *phy_id;
>>  =09u32 msg_enable;
>>  =09u8 mac_addr[6];
>> +=09unsigned char mc_filter_mask[ETH_ALEN]; /* for multicast filtering *=
/
>>  =09phy_interface_t phy_if;
>> =20
>>  =09/* spin lock used to protect
>>  =09 * during link configuration
>>  =09 */
>>  =09spinlock_t lock;
>> +=09spinlock_t addr_lock;   /* serialize access to VLAN/MC filter table =
*/
>=20
> addr_lock does not appear to be initialised anywhere.
>=20
> ...
>=20

Sure, we will address this in next version.


>> +static int icssm_prueth_switchdev_obj_del(struct net_device *ndev,
>> +=09=09=09=09=09  const void *ctx,
>> +=09=09=09=09=09  const struct switchdev_obj *obj)
>> +{
>> +=09struct switchdev_obj_port_mdb *mdb =3D SWITCHDEV_OBJ_PORT_MDB(obj);
>> +=09struct prueth_emac *emac =3D netdev_priv(ndev);
>> +=09struct prueth *prueth =3D emac->prueth;
>> +=09struct netdev_hw_addr *ha;
>> +=09u8 hash, tmp_hash;
>> +=09int ret =3D 0;
>> +
>> +=09switch (obj->id) {
>> +=09case SWITCHDEV_OBJ_ID_HOST_MDB:
>> +=09=09dev_dbg(prueth->dev, "MDB del: %s: vid %u:%pM  port: %x\n",
>> +=09=09=09ndev->name, mdb->vid, mdb->addr, emac->port_id);
>> +=09=09hash =3D icssm_emac_get_mc_hash(mdb->addr, emac->mc_filter_mask);
>> +=09=09netdev_for_each_mc_addr(ha, prueth->hw_bridge_dev) {
>=20
> Is there anything stopping this event from occurring when
> the port is not the lower device of a bridge - before being added
> or after being removed?
>=20
> If not, then passing prueth->hw_bridge_dev to netdev_for_each_mc_addr()
> will result in a null pointer dereference.
>=20
> ...

Sure, we=E2=80=99ll verify the code and add the appropriate conditional
checks to ensure "prueth->hw_bridge_dev" is valid before using it.
This will be addressed in the next version.

Thanks and Regards,
Parvathi.


