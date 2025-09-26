Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBDBCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1+1kTUUs/RVTWqBOqpuuN8DYjuh5UTJ910VA1slb4s=; b=PzzH+pefe+mtjRhQbrwjQRIdnn
	TRCYOXctCDP+ePR5X3gQMc7AdEvvBUnN4zbf9vqcy6pDBxPtFUS9po/YWs6trQSqoZIYsyD/1I8kH
	vupq9/FBznh41QO65BLb+9tOrk/CBWsb0xP0+oQ3LTSfz8qOlHBLciPPoFaIeUxGUsDWOu7kDTWCD
	TFFlaS1v7gty9BJKmKXZRPN5J4GeJ/+oIgk0/K7NI5csIQej+8DpgfwaAJOTjHuey+zsyDjK7Rz+2
	koIKvjanwIhF5oWDVt0STvdnJ5A+iXuo3QVzIhYDvBcl8D1Bhx+J/0BT372E0P1BbHrz8+tboX7Q0
	vtNX06XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28HF-00000001TIm-1yQS;
	Fri, 26 Sep 2025 13:14:21 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28H9-00000001TFx-3hSA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 13:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=J1+1kTUUs/RVTWqBOqpuuN8DYjuh5UTJ910VA1slb4s=; b=WUoMo0Wy+nPacAu9OKv3Ewu3Du
	yjpIMnMNRkp2HeuMut3UOgkPIeITzZgmEzsqK343DoId10dQwdfVKJiB4uw7Rv6+CtEAEm4zF9qKO
	Wro6MmVi0ePIHeyRfP2yddxFxJ9d1WF2EyT56woXjAoub2CrGXTAXWJvCsvoo9oiwEcX7kNTt3N32
	/s+qfsxPQl8/jMiTb4zb6qiVRQyMDveLiW+y/wRW9Tad/+X1IGtG+mGj1EDq7fymA13DcIxEp2Kw7
	dDYGQ2EA34HoGucTn5cUJ9vhpSZos7CVVn+6nO7SNHlg1SDJukOJvtxBqld1qOFqFDRCNqQ2V+XsP
	ui1FeEAA==;
Received: from [122.175.9.182] (port=32198 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1v28H7-00000006Z08-3jh8;
	Fri, 26 Sep 2025 09:14:13 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 0CDCB1783FF9;
	Fri, 26 Sep 2025 18:44:10 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id E95871783FF3;
	Fri, 26 Sep 2025 18:44:09 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JJ8fP1ec6_8K; Fri, 26 Sep 2025 18:44:09 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id B5C521781C3D;
	Fri, 26 Sep 2025 18:44:09 +0530 (IST)
Date: Fri, 26 Sep 2025 18:44:09 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: parvathi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>, 
	afd <afd@ti.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>
Message-ID: <464535038.433548.1758892449616.JavaMail.zimbra@couthit.local>
In-Reply-To: <02f2c50f-31f6-4d4a-9cbe-5f77d1d60706@lunn.ch>
References: <20250925141246.3433603-1-parvathi@couthit.com> <20250925141246.3433603-2-parvathi@couthit.com> <02f2c50f-31f6-4d4a-9cbe-5f77d1d60706@lunn.ch>
Subject: Re: [PATCH net-next 1/3] net: ti: icssm-prueth: Adds helper
 functions to configure and maintain FDB
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: icssm-prueth: Adds helper functions to configure and maintain FDB
Thread-Index: f16IARbcZW1mlifyPMb+ZjnZ1I30tw==
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
X-CRM114-CacheID: sfid-20250926_061415_946946_0FD1B537 
X-CRM114-Status: GOOD (  13.99  )
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

>> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth_fdb_tbl.h
>> @@ -0,0 +1,66 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/* Copyright (C) 2019-2021 Texas Instruments Incorporated - https://www=
.ti.com
>> */
>> +#ifndef __NET_TI_PRUSS_FDB_TBL_H
>> +#define __NET_TI_PRUSS_FDB_TBL_H
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/debugfs.h>
>> +#include "icssm_prueth.h"
>> +
>> +#define ETHER_ADDR_LEN 6
>=20
> Please use ETH_ALEN everywhere.
>

Sure, we will address this in the next version.

>> +static void icssm_prueth_sw_fdb_spin_lock(struct fdb_tbl *fdb_tbl)
>> +{
>> +=09/* Take the host lock */
>> +=09writeb(1, (u8 __iomem *)&fdb_tbl->locks->host_lock);
>> +
>> +=09/* Wait for the PRUs to release their locks */
>> +=09while (readb((u8 __iomem *)&fdb_tbl->locks->pru_locks))
>> +=09=09;
>=20
> Don't use endless loops. What happens if the firmware crashed. Please
> use something from iopoll.h and handle -ETIMEDOUT.
>=20

Sure, we will replace the while loop with =E2=80=9Cread_poll_timeout()=E2=
=80=9D API from
iopoll.h and handle the return value appropriately in the next version.

>> +static void icssm_mac_copy(u8 *dst, const u8 *src)
>> +{
>> +=09u8 i;
>> +
>> +=09for (i =3D 0; i < ETHER_ADDR_LEN; i++) {
>> +=09=09*(dst) =3D *(src);
>> +=09=09dst++;
>> +=09=09src++;
>> +=09}
>> +}
>=20
> There is a kernel helper for this.
>=20

We will use the =E2=80=9Cether_addr_copy()=E2=80=9D API where ever it is ap=
plicable.

>> +
>> +static s8 icssm_mac_cmp(const u8 *mac_a, const u8 *mac_b)
>> +{
>> +=09s8  ret =3D 0, i;
>> +
>> +=09for (i =3D 0; i < ETHER_ADDR_LEN; i++) {
>> +=09=09if (mac_a[i] =3D=3D mac_b[i])
>> +=09=09=09continue;
>> +
>> +=09=09ret =3D mac_a[i] < mac_b[i] ? -1 : 1;
>> +=09=09break;
>> +=09}
>> +
>> +=09return ret;
>> +}
>=20
> I suspect there is also a helper for this. Please don't reinvent what
> the kernel already has.
>=20

Sure, we will check and address this as well.

>> +static s16
>> +icssm_prueth_sw_fdb_find_bucket_insert_point(struct fdb_tbl *fdb,
>> +=09=09=09=09=09     struct fdb_index_tbl_entry_t
>> +=09=09=09=09=09     *bkt_info,
>> +=09=09=09=09=09     const u8 *mac, const u8 port)
>> +{
>> +=09struct fdb_mac_tbl_array_t *mac_tbl =3D fdb->mac_tbl_a;
>> +=09struct fdb_mac_tbl_entry_t *e;
>> +=09u8 mac_tbl_idx;
>> +=09s8 cmp;
>> +=09int i;
>> +
>> +=09mac_tbl_idx =3D bkt_info->bucket_idx;
>> +
>> +=09for (i =3D 0; i < bkt_info->bucket_entries; i++, mac_tbl_idx++) {
>> +=09=09e =3D &mac_tbl->mac_tbl_entry[mac_tbl_idx];
>> +=09=09cmp =3D icssm_mac_cmp(mac, e->mac);
>> +=09=09if (cmp < 0) {
>> +=09=09=09return mac_tbl_idx;
>> +=09=09} else if (cmp =3D=3D 0) {
>> +=09=09=09if (e->port !=3D port) {
>> +=09=09=09=09/* MAC is already in FDB, only port is
>> +=09=09=09=09 * different. So just update the port.
>> +=09=09=09=09 * Note: total_entries and bucket_entries
>> +=09=09=09=09 * remain the same.
>> +=09=09=09=09 */
>> +=09=09=09=09icssm_prueth_sw_fdb_spin_lock(fdb);
>> +=09=09=09=09e->port =3D port;
>> +=09=09=09=09icssm_prueth_sw_fdb_spin_unlock(fdb);
>> +=09=09=09}
>> +
>> +=09=09=09/* MAC and port are the same, touch the fdb */
>> +=09=09=09e->age =3D 0;
>> +=09=09=09return -1;
>=20
> Returning values like this can result in bugs. It is better to use a
> real error code, just in case this ever makes it way back to
> userspace.
>=20
> =09Andrew

Sure, we will check and address this in the next version.


Thanks and Regards,
Parvathi.

