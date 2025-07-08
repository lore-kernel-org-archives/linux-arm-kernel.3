Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8E2C71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 05:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNLGdtGiLP2sQdD/DngbmuGIM/jxvNClAvOYArQMTFM=; b=soLEkhFbZ7AC964MLfcmMFtwJf
	C3WG+K0We8qvBcUZkB7CJgvkIJ/FK9LSqzbPTDzqzkuOiPBKCFmxe0X74Aw39Ea4i4Sa3T2NZgRCO
	4/BNU1AcNWXTG8VIgjQQqSM9HAg7SF0dzqqx8XvlpVQZpx01p8eVhhapZB1dt4IuChDdZK8ooZ7YJ
	qtiay+LrME1mANbVz92grTHiVkxP5sUQGiBhqK9F4YwCCTtaC4JKBlytvcQFTBNZFtNcJCHLTfMfJ
	/q6jbpP+SZw2Rn94XwIHDvvohYoXRbMsMJqk/jgx8fSnYi1hx4267UFIUzpenkJl9x7y9UhI8r17x
	Nq37IpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1Az-00000004LyP-2RWs;
	Tue, 08 Jul 2025 05:47:33 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ16b-00000004LSQ-1LTm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 05:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751953381; x=1783489381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FNLGdtGiLP2sQdD/DngbmuGIM/jxvNClAvOYArQMTFM=;
  b=Clixd4F/Pt7ZO8W3mmA/i2mOG6Azjmt06qXSRIgrsEHNR4OOrcbM8I03
   SCKBS7ajRWAG5qQMsCSnGx6v6VRNL7MKwa3Ja/hHe3SJm+H1VxWd9XQrz
   CgdbgGf0nHbacKTEfJupSrXtn/cGx5/Eqm52S94Ej/wJ9YLTHHp88xJrW
   H6e+nqCMzrLl0XTePqEbGlRX8FSvQTbfCzdfellRt8Q0QOKXR8FIs1UEj
   rbShwET9L+TXP4+lzrjLdK1M6hEN6i43Bv8zQJ6Xc/hBB+fi51Fo0N9Qa
   As0X+V7mlc9zjNk0jE2OaIkFOJdBUti7BIJbnbIAnnN4ncnbRw4TJ6VrE
   g==;
X-CSE-ConnectionGUID: EFPn/MLrSC29i8zZr4Wdjg==
X-CSE-MsgGUID: P/MUXaiqS2ioqgneM/5qYQ==
X-IronPort-AV: E=Sophos;i="6.16,296,1744063200"; 
   d="scan'208";a="45074471"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Jul 2025 07:42:59 +0200
X-CheckPoint: {686CAFE3-13-B791C630-E7A1546C}
X-MAIL-CPID: 8D2021FD5B7F91B62BA81C32DE8B9514_2
X-Control-Analysis: str=0001.0A006375.686CAFF3.005D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5F1016492D;
	Tue,  8 Jul 2025 07:42:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751953375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNLGdtGiLP2sQdD/DngbmuGIM/jxvNClAvOYArQMTFM=;
	b=PdeKKxyzIDI83ozs0H8VrOSRqTM6/9Rm8cRvMy+DTfUAZw1QstnaeOHNsGVjz7jW0xgtET
	wz+FXeV/uYCriQijzkMRSTnQuaol82jrevqKYF0XU5u0FfpKb01uHibu3DT2x8lY5zjyw+
	r7I1HKyeShl5x/FlTYmLf86oq4nMWZ44gggDMfHueBZtQzUcGR7uW9awczYlGaeQ2UCzZf
	nTFgY/iuUT9QYdgVPjKjhjGEn1+ZJscAMGxKxvNKYz1R0xzhmbV+YCzRRAmjTkX8VGgVdP
	k4y25Zsi3HE3bJj1eE7p8nbMtyFBeePLvl/lJEavhWNPNnJErIvz1XCXTMo+iw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: defconfig: enable i.MX AIPSTZ driver
Date: Tue, 08 Jul 2025 07:42:54 +0200
Message-ID: <3894475.kQq0lBPeGt@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250707234628.164151-3-laurentiumihalcea111@gmail.com>
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
 <20250707234628.164151-3-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_224301_672653_A7DBDF06 
X-CRM114-Status: GOOD (  11.15  )
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

Am Dienstag, 8. Juli 2025, 01:46:28 CEST schrieb Laurentiu Mihalcea:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> Enable the config (CONFIG_IMX_AIPSTZ) for the i.MX AIPSTZ driver, which
> is required for platforms using the AIPSTZ bridge (e.g. i.MX8MP).
>=20
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 739b19302865..4d7a60444bf5 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -262,6 +262,7 @@ CONFIG_GOOGLE_FIRMWARE=3Dy
>  CONFIG_GOOGLE_CBMEM=3Dm
>  CONFIG_GOOGLE_COREBOOT_TABLE=3Dm
>  CONFIG_EFI_CAPSULE_LOADER=3Dy
> +CONFIG_IMX_AIPSTZ=3Dy

Why not =3Dm?

Best regards
Alexander

>  CONFIG_IMX_SCU=3Dy
>  CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=3Dy
>  CONFIG_QCOM_QSEECOM=3Dy
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



