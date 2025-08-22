Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521F2CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSGxJSn/2n3PyNBHNAnkcPXaTGaJNX+JxFYp3H3S7XI=; b=VYXdoLVxaB4/9syoCPy/k6DyPf
	0+wOSjMMuVhmvPci7+boSsA+oi35kWvaJsBTX5qKOl4+SbVPTlmtNhWIsLctoaQll5V/LNTk1r+Zk
	HVZnBe+a1fKfPciIvwtkvH793qYJ1qnhb84HQCKxD3FKlCymiaVivpYfNtk6HUEuD0zf/9KlrqHti
	Hq4O0lUCkYbrDHyZlTQVg0SK7USViv9nzdBCJW9fUQ1SfgwxdbHYscwKjPX18OhebliZlDj5NiCoD
	q5IKRx+4GmQU8rqx4+ef2AybcBfFSe8o4OjEAk+SP4iwwnXEud1GcUFWm8shi5ORuE2Hd2HzDxmOV
	2B+bNClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphqm-000000045jr-49fd;
	Sat, 23 Aug 2025 06:35:41 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSEi-00000002gjo-0qQ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1755870920; x=1787406920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BSGxJSn/2n3PyNBHNAnkcPXaTGaJNX+JxFYp3H3S7XI=;
  b=fAnZj+FR3eve65Izg0E5vDeF/t89BdIDB2sE1BovCnP+YC5mzCJIIqrl
   FxsAYuLj6n4P2fgUupWsDYbyqR6BdMv53qELEHsqOJ1coDSW9gr0sXf+h
   YAIcoHvSCuZlMXel5TkuJzJ8mpOZmpVXd+fWfnoIdur7LRSvn8Zk6nqWx
   2Tl1zWSnyJlvLiuc37SYXvH9YBhJY93qc3mNh6I+NZtWgXVGrc6yBUNP7
   /ebSxefF820l0aGeHxZJw8hiIzZnVMzO1ZfhHraRyXIwaNorgUifFbX57
   MUL5hRWrw7oxcryu8z2OC8N5KEuWCZZxDM1zBUI4rg5T9zgfRsmyUSDX5
   Q==;
X-CSE-ConnectionGUID: uQtDp9sDQGi4/XdVsoW79w==
X-CSE-MsgGUID: /5l/3tQYTh25k2Gidfn4gA==
X-IronPort-AV: E=Sophos;i="6.17,309,1747692000"; 
   d="scan'208";a="45868412"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 22 Aug 2025 15:55:17 +0200
X-CheckPoint: {68A876C5-15-20CAA7DA-EC9DC758}
X-MAIL-CPID: 746B3D6C51CF356B3828B6C881666656_0
X-Control-Analysis: str=0001.0A002104.68A876C6.0033,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42C46164C6D;
	Fri, 22 Aug 2025 15:55:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1755870913;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BSGxJSn/2n3PyNBHNAnkcPXaTGaJNX+JxFYp3H3S7XI=;
	b=oQE/4amKYk1f4dIXaH4ppDQxEuZVG9H6tw8bkFXTJ1q+6ejRGw3lvLlvf8SfiJo9aryi+3
	+qWcitNsyVbVqZFc2zco+JaTZ3UhQoabQwFX6iexJVWch+VWwXvUS9w4zN8eBqjuPzbecR
	v+45c63JacoNm7/IDXwzMU3CcxvTX/D7cSrkevDM/+S/eQzsGdF7uRautKQ+9zWvrQJJ3E
	PCUnw6TBn85MUjZKKLe9gfyHRnllM4sVQJs0DaHBt1pSI4D1iUXjQqA/BVwgPcYhtcwwM/
	EjQLvcU/kHyOY/jfYRSZ7UFzBClKTIygh/nZ79p9UDNsuf5K9zZ0VsKLHMdUzw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: defconfig: enable backlight device class
Date: Fri, 22 Aug 2025 15:55:12 +0200
Message-ID: <2385138.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250408134249.1131127-1-alexander.stein@ew.tq-group.com>
References: <20250408134249.1131127-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_065520_575770_EABFA0BD 
X-CRM114-Status: GOOD (  13.69  )
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

Am Dienstag, 8. April 2025, 15:42:48 CEST schrieb Alexander Stein:
> CONFIG_DRM_PANEL_SIMPLE is enabled in this config. But it depends on
> CONFIG_BACKLIGHT_CLASS_DEVICE which is only transitively enabled by
> DRM_NOUVEAU, iff DRM_NOUVEAU_BACKLIGHT is enabled as well.
> As simple-panel depends on backlight, enable this in defconfig as well.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 65ec5a5be407d..b70257878812e 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -963,6 +963,7 @@ CONFIG_DRM_POWERVR=3Dm
>  CONFIG_FB=3Dy
>  CONFIG_FB_EFI=3Dy
>  CONFIG_FB_MODE_HELPERS=3Dy
> +CONFIG_BACKLIGHT_CLASS_DEVICE=3Dm
>  CONFIG_BACKLIGHT_PWM=3Dm
>  CONFIG_BACKLIGHT_LP855X=3Dm
>  CONFIG_LOGO=3Dy
>=20

gentle ping. Any feedback?

Thanks and best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



