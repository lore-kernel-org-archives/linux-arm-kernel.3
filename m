Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563A1F33A7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyfEWDA4WY/JVJH+sN9E8894942o4AuX6wqzVKR7s0o=; b=cq2EyyvB6DfAUj0TwVpqfTabym
	LUaUlrvPg2Qjhs9kbb4L7qeTMCMqoDfwFywNBpE3UNNbJB3jElUBT6KNzUz49q3rmi9gtJUwTMeRT
	mfOxEZ90jRe4zDZA/Ky7pyO0nwt5CsELndZAEEZIx9szfvm3ALOpSsw/1nT5c0cNZMm9oh0ZpimN8
	zp2slEwTM2Btv7PNUwBqS9ieDxgj3GG/wOmnTr5waZKN+j7fYqZbx7LwFN5eUK5y06VnDabRc7/CY
	mz+yKPQpbQyoWPF3GCYBGfL/8YQ8ZMM6stDn2RxcY1CF++Lm8pQufNo3SKbinZGqUYC1CG3BvbeJ8
	Cw5iFYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAFw-000000025FI-3LCv;
	Thu, 05 Mar 2026 15:04:52 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAFu-000000025Ei-3AUT;
	Thu, 05 Mar 2026 15:04:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772723084; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cw4m37SOvk8u7b9ffp1hw9PhdWe11RmUm9AziYiNGzXYouhmCt9WhPUIIRjdNPXjJq
    6PHfaodLGvgSyf7mKWV62+fqql0Ks+6szfCtMr1I+gdiZYSOJs4TgBIrrlDdsnwZAG2r
    aYDhUmpoKVe5mcGCo+zng3cvNgchf53GHRZRdLyItCF8bzkSQ08KmBxO9s8G+HlDFT5V
    tUoVqEU9LFvNGHc71KBdTeLO0++63QtmaRI95p21GjY7ndFqOxLm3j/mVr+QiVDIRRAT
    WyIh1Pqk2ZSrKdb+oF4qoZ5MrDrQn833OyOu6Q9Tx02jSvI5vcZ6P9nwZjkY9LHHMHzl
    ON8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1772723084;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=GyfEWDA4WY/JVJH+sN9E8894942o4AuX6wqzVKR7s0o=;
    b=SzhKspfABu22MxjYbpof4D4qXJH077/WPXs+E6FSiwuXMU/1oxDLqdjJyLtk1ObXKk
    Qy7RQwUFkq4U1y6b0jicRWmqEcYtZKkbGWGtBD9QouNhpf7wNmWfTuxOMcHtQHO1gxWg
    DNEXZug4l9cSZz/pRoSue0cRllLhwA0jUKvyUwiCA+HTb7Fq8rx5jQr8TyrJNhgqDFs6
    Mq+cQwmMMEYdq2G+RQJPAYfC3MlwCfX4IgDg49X2yF7pkd7o4QQIevl7+keUieRE1n+S
    KGKmXvWcTyG+HWMhTESKBXmlQ/rfvm0M+T70eDl4qPGLA+pJEDRFOBl6LpxD+0QIVj2h
    jD3w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1772723084;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=GyfEWDA4WY/JVJH+sN9E8894942o4AuX6wqzVKR7s0o=;
    b=Ivu5PIdLe657vURoySW9zhV5BcRkIGzQS9+Q5Xt9ocPIW1Te2r0gwnf1P6Uy/DW9u0
    Nb+/8EEaf0LdB00bTXANLcGq48MpPQEBekNLakrA7vcRDxutObNxfb747fqhPYN6wOqm
    wa5sTTIuduFF80x6p75uQXiOqV1mwUVcZmFC68R4ap7TvCDwz7oEDtiGvtHREm0X0KKt
    EiMZIG9F/8Nvl7ssut917fGxPGYuZwOhx0Kdu1YMdvpSdWPnz9vDAh6FEeQhcIqO/Ydq
    HkUIm3nFVO3gTK4YckgXWMjdzPLXabl1RbLF9UX4OVKQG0Q3Ng3pwuuOYwkS0UdIwN38
    HIzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1772723084;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=GyfEWDA4WY/JVJH+sN9E8894942o4AuX6wqzVKR7s0o=;
    b=UwRwlIrvUlqsxvhWnwFKEUi5e7iADlH5h+t66RJbZEC+WpmOsIRA7DyMrjSQAOBfNk
    tG6MBjwHM+9Mxc3tuGAQ==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0DBslXBtZUxPOub3IZqk"
Received: from [10.176.235.211]
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z79345225F4h63E
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 5 Mar 2026 16:04:43 +0100 (CET)
Message-ID: <e116e78ad9590f5845aaaf7d4e26833a7a0194d0.camel@iokpp.de>
Subject: Re: [PATCH v2 00/11] scsi: ufs: Add TX Equalization support for UFS
 5.0
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "open
 list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
Date: Thu, 05 Mar 2026 16:04:43 +0100
In-Reply-To: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_070451_070730_0BB3B71F 
X-CRM114-Status: GOOD (  12.20  )
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

Can,=20

On Wed, 2026-03-04 at 05:53 -0800, Can Guo wrote:
> Hi,
>=20
> The UFS 5.0 standard was published today,=C2=A0

Myabe replace time sensitive wording =E2=80=9Cpublished today=E2=80=9D with=
 stable wording?


> introducing support for HS-G6
> (23.2 Gbps per lane) through the new UniPro V3.0 interconnect layer and
> M-PHY V6.0 physical layer specifications. To achieve reliable operation
> at these higher speeds, UniPro V3.0 introduces TX Equalization and
> Pre-Coding mechanisms that are essential for signal integrity.
>=20
> This patch series implements TX Equalization support in the UFS core
> driver as specified in UFSHCI v5.0, along with the necessary vendor
> operations and a reference implementation for Qualcomm UFS host
> controllers.
>=20
> Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> TX Equalization is a signal conditioning technique that compensates for
> channel impairments at high data rates (HS-G4 through HS-G6). It works
> by adjusting two key parameters:
>=20
> - PreShoot: Pre-emphasis applied before the main signal transition
> - DeEmphasis: De-emphasis applied after the main signal transition
>=20
> UniPro V3.0 defines TX Equalization Training (EQTR) procedure to
> automatically discover optimal TX Equalization settings. The EQTR
> procedure:
>=20
> 1. Starts from the most reliable link state (HS-G1)
> 2. Iterates through all possible PreShoot and DeEmphasis combinations
> 3. Evaluates signal quality using Figure of Merit (FOM) measurements
> 4. Selects the best settings for both host and device TX lanes
>=20

what happens when EQTR fails, mabye you have this comments in the patch.

Kind regards,
Bean



