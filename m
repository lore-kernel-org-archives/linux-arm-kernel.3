Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0BDCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 17:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CRXwPuz/NhaSoWFa7GAAxsUPAsedTFcjoey/0ALnry4=; b=rdJwzCc/fu5DKAaZOKr4neWqz4
	kOalj9C73ZYWCAEsVoik5pdpQRkeBKD+eXMD17NQKw8qJusUNA1ZCEsfKxzjX8u4owQeE6ygyDW8U
	6itjTPwZkqlcoH1b/gGmWRHmzViPd04Z+nMwMOkkWYsmSSm0EB8Yf9B1TtYAhFLMV6mb9r8CUFYnQ
	uQoY8CIdsPDq4MGp8XMsdehFkvnayxB8pMokcTclYBjK4J1Ft18wSyxo0g6IjWOZ6lv6d/aVnQRa1
	YqbDKphVy3VO8zj+l8n0hpTgb7vHGrtptHlxToWVjcZtEZiP9bd0ehN/A3svn74SaSR/3yHtN4Ilx
	ix4YgT4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZtI-00000008gU3-0drM;
	Tue, 16 Sep 2025 17:54:56 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZtF-00000008gSr-16FO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 17:54:54 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58GHsfOq1422194;
	Tue, 16 Sep 2025 12:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758045281;
	bh=CRXwPuz/NhaSoWFa7GAAxsUPAsedTFcjoey/0ALnry4=;
	h=Date:From:To:CC:Subject;
	b=nmcjTU3BS8/SUDGlEU1E8SXbYGXkqXR5y4eayT1pziueEjhKCNgXTyQHQQMENJ6ea
	 fJOKutd3Zu2XE/KnaMfzLbQZizDBZD/E3UmtnJr8Lg1txEtQoZr8+0fjbc1VcmEQ+Q
	 u2AaT8ZUvF4kCbH7+2oG9aNZWXqeF4YnSRuwd8dM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58GHsfHU148743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 16 Sep 2025 12:54:41 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 16
 Sep 2025 12:54:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Sep 2025 12:54:41 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58GHsfd61997140;
	Tue, 16 Sep 2025 12:54:41 -0500
Date: Tue, 16 Sep 2025 12:54:41 -0500
From: Nishanth Menon <nm@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: SoC <soc@kernel.org>, <arm@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Subject: [GIT PULL 3/3] soc: ti: Driver updates for v6.18
Message-ID: <20250916175441.iehltsk2377rg5c6@alike>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="onodo5ysbkjttlvm"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_105453_394275_E6ED3AAA 
X-CRM114-Status: GOOD (  14.28  )
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

--onodo5ysbkjttlvm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following - PS, my updated keys are available in [1]
if that is needed.

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driv=
er-soc-for-v6.18

for you to fetch changes up to 037e496038f6e4cfb3642a0ffc2db19838d564dd:

  soc: ti: k3-socinfo: Add information for AM62L SR1.1 (2025-09-12 09:42:44=
 +0530)

----------------------------------------------------------------
TI SoC driver updates for v6.18

- ti_sci: Add support for abort handling of entry to Low Power Mode
- k3-socinfo: Add decode for AM62L SR1.1 silicon revision
- pruss: Replace usage of %pK in printk with safer %p formatting

----------------------------------------------------------------
Bryan Brattlof (1):
      soc: ti: k3-socinfo: Add information for AM62L SR1.1

Kendall Willis (1):
      firmware: ti_sci: Enable abort handling of entry to LPM

Thomas Wei=DFschuh (1):
      soc: ti: pruss: don't use %pK through printk

 drivers/firmware/ti_sci.c   | 57 +++++++++++++++++++++++++++++++++++++++++=
++--
 drivers/firmware/ti_sci.h   |  3 +++
 drivers/soc/ti/k3-socinfo.c | 10 ++++++++
 drivers/soc/ti/pruss.c      |  2 +-
 4 files changed, 69 insertions(+), 3 deletions(-)

[1] https://keys.openpgp.org/search?q=3DF8A2869354EB823217A31A34DDB5849D173=
6249D
    or https://lore.kernel.org/keys/20250916155707.gyyy5tiu4swqlwwo@gecko/
--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--onodo5ysbkjttlvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmjJpFkACgkQ3bWEnRc2
JJ0czg//XkBISt/S5WiVy4yfPRuPoJrQd98Ppq7oaiAyOFlKwNgpNd2t759zFIdp
JTM9Yr2LEBbbwwMTOBZ7ImSsK5xUfBd+4k12RcNuiXhEjqwdHj60McU+d28JiqTM
WSuutCeCGa0LO+R9OHZiF9pbLbOgCCd8wZ1jClKrsR3OfrQdoRnLL4jjox/EJCcu
rI5ZOoxHjJh8LmhwHR41a2PkKdXKjjtSY1nU2rs8Awohxnd88Wxs3gC/3edngvzH
CiRQmUWC5iImRZbOm192AlMufETGoCNh1j9VQ2WgkIkec3kS8g7RwglfEST09PXA
NZLDoH9e9PdytM0i6uUhqXl0jAqAyXGcf1MBcory6vYnoeZlK5FAuNQRUpGvUeEx
+NtP0s4EB+ezOVscxf325nU5PqRSAuZzMDxtTZVXhGJnhlaCvHUTrEr3S2hQETfi
jCT64Z700gr/vOgclVvi7ulmxf/nKyD4rsYvOKH3T7AJ1NvKLY2IS1rQB9mJmYQ/
+MXuwKpK+ib7UbA6BjoduEYUqYfPeU5Ug8ykuUhlLxg1Ur5ndlA6TndoBMECM/3s
S0DEJtI5fWM04TIhLahFjebJFFia354wF1Bn2LQscXsc8kyjw6ViIEWpy1FkECaM
Lb41zk1mPS57qNlj1+9w50VyzLqAMrOQNKa4vRVeoDevZgnEiyY=
=dX79
-----END PGP SIGNATURE-----

--onodo5ysbkjttlvm--

