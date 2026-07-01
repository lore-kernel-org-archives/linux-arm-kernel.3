Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D07C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OI9r+oDLNMoCCNp+jvgl6P08jRKSfU7E7aeuxBZlOQ=; b=r3uIv42sArh1CdqajI2mB4QMzc
	Dg/AABmbIFVp5Xa71MtaRAytOXjCc4qTT8hYCDYxNY+hBaEkq5fFFOGoXODxY5mwruBwcsd9WggfN
	4d9MmO9Adi5C6YZlYyhgpj6dg53+N7t14BqGAaxMP/fnILBdYCbMAMXiLXkt7WR+B1IO1tnE0uIpd
	H+djKBGsq7QJVXUF3FdtXmIslAznSDO3b6FybXf9smdUhOsbszohmbq+n3pJ1AafUpc7XAHx8hqSL
	2wrZzaRk8mnMTXy8nHl1eZcfgJ7pM+D/XDs9TfBQ4f1WqjrH5yezzIxjPSXRtXXYTfC2EWrJlpH6y
	6Xsd9qCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1ru-0000000301q-2qRK;
	Wed, 01 Jul 2026 20:49:14 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1rs-0000000301H-1m2R;
	Wed, 01 Jul 2026 20:49:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1782938946; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OwFN0gPD+BiuM4H6omziC9HWaxRyCyapRT2uKi9EFb7YL7zfTa4siBw6pjiqE/E2UW
    /9Jnw079GPsGR2Dd0YfwoAv4V86rwJw+vRzkK3k86qBWC/iJeM8/pun8FvFuuxXYTkbW
    PTsmffApLXWk+ZD1L3mhWM9OCPcFEKMciwrK/L8ZTSPJkJ3nrrik496TGRewLL3LtX+8
    WHeaPZZ6DojK0KUhJKp6ENyszQrAm6cLORJrJW/5+DV1g8e+nKCPiyqHwB7n9aPWN0Et
    tnh0hK9lNOAIvjZzdRKLgnjFDAvj8JAK1k7gblXsCoRPi4Z4kVa/o5Yh3H2QDM1ezBR4
    zOjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1782938946;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=0OI9r+oDLNMoCCNp+jvgl6P08jRKSfU7E7aeuxBZlOQ=;
    b=HdxzqBaRCHSC8u3tKtwPAL0ctTU1/AVWXlIBgGV9h+RnuRUZZDw/0k/X13tuf7EtDY
    /Rr0wzdZRFpxUPYxdJgil1Y/3ClsS6LlJ6PmKuDUgvMrB8i8reRXpDcaMXw0+ly+22OE
    1z2jnL+pxkFmGAgv4MT+LndKUh+W7oM5N9ycbcFIJaPyd5+PmuMQL+AouE3iYufMuG1j
    MMXXTtlMx/SCqovv7WM1qLePnBNzGl94rhiauUFZqQOf1lNhO5S2diJDUHBMiumWpbVj
    zRzuKo5ehy+6cppXJP7zQEfW3lykUpmKRdroa+/fakg1hfh2/nt0b1bRw4T+B+0gd+DR
    RO0g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1782938946;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=0OI9r+oDLNMoCCNp+jvgl6P08jRKSfU7E7aeuxBZlOQ=;
    b=sIai4biILPLJ3qx6cnpm9RRIVP5MADxN2cHXM5kK9ofXpRkcri9XD/IddbgDCMEYFY
    Nucj8fnxifKV2l8OECinbLlPVfMjK/xFKoIW1HlMEF5tZswCxIp+OKC+35xggA8qbeBM
    cbi1mA75/rXPK/M/Wl/rymRoVdkw1CXAwC0u1e+JkIFKYqk05yYtZCPv3glH/hYV6SUk
    SolA0aRAaaj83QrkXMLAVjSbwYTZHAh121nyyWTwuKVeJAjBLgILocbkGh704GCeCeLc
    l+heDDEZnDcCIRLD5i0MB0N58Qsz0tt4E/j3gZDU3yF3GnkvNBzrjIPzA80ua6BzzZyH
    z2EQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1782938946;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=0OI9r+oDLNMoCCNp+jvgl6P08jRKSfU7E7aeuxBZlOQ=;
    b=tHf9G+j3iVW3fB/gSnpgkz62pZdUbJLh5lze5IV0e5jjCcfBXOSjuB23+y5f7nDk6j
    UBBbT+xn4e5QQR33KQBA==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0zNriHg+YfT0rGWUpI6weUrZX7j5d8vw1ZwljKUZAZetExYucA=="
Received: from p200300c5871477310ac0be5030e43536.dip0.t-ipconnect.de
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id z4d388261Kn5VQK
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 1 Jul 2026 22:49:05 +0200 (CEST)
Message-ID: <3362cec069bd3437c378f356c3e1333d3428070e.camel@iokpp.de>
Subject: Re: [PATCH v2 3/3] scsi: ufs: core: Always run tx_eqtr POST_CHANGE
 notify
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, bvanassche@acm.org,
 beanhuo@micron.com,  peter.wang@mediatek.com, martin.petersen@oracle.com,
 mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, Avri
 Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
Date: Wed, 01 Jul 2026 22:49:05 +0200
In-Reply-To: <20260625121306.1655467-4-can.guo@oss.qualcomm.com>
References: <20260625121306.1655467-1-can.guo@oss.qualcomm.com>
	 <20260625121306.1655467-4-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_134912_748195_89641FDC 
X-CRM114-Status: UNSURE (   6.94  )
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

On Thu, 2026-06-25 at 05:13 -0700, Can Guo wrote:
> ufshcd_tx_eqtr() skips POST_CHANGE notify when __ufshcd_tx_eqtr()
> fails. That can leave variant cleanup incomplete when PRE_CHANGE saved
> temporary state that POST_CHANGE is expected to restore.
>=20
> Always call POST_CHANGE once PRE_CHANGE has succeeded. Keep the TX EQTR
> result as the primary return value, and only propagate POST_CHANGE
> failure when TX EQTR itself succeeded.
>=20
> Log PRE_CHANGE and POST_CHANGE notify failures to make variant callback
> failures visible in TX EQTR error paths.
>=20
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>

Loods good to me!

Reviewed-by: Bean Huo <beanhuo@micron.com>

