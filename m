Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5EDCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 20:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To
	:From:Subject:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5j5Nk1nvJBPLYuxHFSA0kqPXhXQZcTtQKp/iX7Jb1s=; b=u1C5dZQzueF4DjIu29tqmIoWZp
	ObkVBe7xxJmywDpZ/iw0aQpT2megROy7/PWAG0XXj1Lr4Dc4+fXmQfxd8aIliy+qhsi5BgatHv/b/
	SjXEkDH5K/6VRQOf+1OEVkQnssyPbiiraPn5X2/mm0mRZYfeoDYTtTvIRl4yZckpplvk5MQs4fGUd
	dZV6up/mF+T+p0OeB3j7yvYfu127PX3dHUyg9NwfTH29C14G7y9h4f2hfDfCCnc5fouj1joZ0KhZB
	tVoiVwC+DN28KHo6UWPpdb0VAoVkJKd4bOZPmwYXAQCad0AWQt8P0ZkRalvf83ZFT00UKqa5TCAMv
	CABUyqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umen2-00000000WR0-2lnY;
	Thu, 14 Aug 2025 20:43:12 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umekT-00000000WFt-394G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 20:40:35 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EKeQu62011538;
	Thu, 14 Aug 2025 15:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755204026;
	bh=A5j5Nk1nvJBPLYuxHFSA0kqPXhXQZcTtQKp/iX7Jb1s=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=Wbis/2q2+SDxJ+NvmaShsH3FG869f0FYFjq5GwTovn6wO2qIpXvhrELlePmQG9qIw
	 rJ29O/kfgB6AP1TLgwF4L9rmBJ7LAuQTY/m4aJBXWiYoHAR2iCt8McumVThbPIzp6B
	 FcSv98Y3d0zmBRDEDgZaZPQTtlSxsMVlFy3bP8pQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EKeQRN1400343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 15:40:26 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 15:40:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 15:40:26 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EKeQ064172623;
	Thu, 14 Aug 2025 15:40:26 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Aug 2025 15:40:26 -0500
Message-ID: <DC2FWE35CXPV.YM6MK820R2PV@ti.com>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62p-j722s: enable the bxs-4-64
From: Randolph Sapp <rs@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <d-gole@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <detheridge@ti.com>, <matt.coster@imgtec.com>,
        Michael Walle
	<mwalle@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250808232522.1296240-1-rs@ti.com>
 <20250808232522.1296240-2-rs@ti.com>
 <20250813151721.nc5fr3qmro5grlda@steam> <DC1HS8D8KLIF.2MN7D9EXGQQ45@ti.com>
 <20250813184229.dhgpqvi3b6aat46g@managing>
In-Reply-To: <20250813184229.dhgpqvi3b6aat46g@managing>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_134033_879170_18D110C8 
X-CRM114-Status: GOOD (  11.41  )
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

On Wed Aug 13, 2025 at 1:42 PM CDT, Nishanth Menon wrote:
> On 12:56-20250813, Randolph Sapp wrote:
> [...]
>
>> >> +		reg =3D <0x00 0x0fd80000 0x00 0x80000>;
>> >> +		clocks =3D <&k3_clks 237 1>;
>> >> +		clock-names =3D "core";
>> >> +		assigned-clocks =3D <&k3_clks 237 1>;
>> >> +		assigned-clock-rates =3D <800000000>;
>
> btw, as per https://www.ti.com/lit/ds/symlink/tda4aen-q1.pdf (page 86)
> 720MHz when vdd_core is 0.75v (default)
> and 800MHz when vdd_core is 0.85v
>
> 0.85v is set in the board dts and higher OPPs are enabled depending on
> board capability.
>
> You might want to check the assigned-clock-rates based on data sheet,
> default should'nt need a assigned-clock-rate.

Are you suggesting that we set assigned-clock-rates in the board dts instea=
d, or
do you just want to do away with assigned-clock-rates in general and eat th=
e
perf difference?

