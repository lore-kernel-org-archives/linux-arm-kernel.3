Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68440CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 06:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPxnu8JjaM/yvdOpkZwcHlIZVYiDwFghDn0gsxBWGdg=; b=U4WUmtcErY172gyqTujLr8Yo7V
	IRL3LfoTEeqpDpv7TZ6HQ8gNvwLrkVXqybN68fE8fDdsg6s/qnMOUu7trG7Fo1wzNfBwGwL3Ji4YQ
	DGNZgzS5AP12pLbKAHFQbrCSAssLJ+7ZdilF24C4A6w7w0Kgo6ZqD7s9FcFkFdbINNMoNjIzDgWD+
	s38caL7WnBpra5gq3GLRRB1KI+LP8OqapGI25QbRmPqZOfMsJ7LqFls7kBm5EV/mxvjTOvbT2lOHO
	19o2rVtWQrSwAyUhq5RxVcjEnD6+lRJuKaCc00m0GKSFEvGm/eqHJh8SkMnMRiea/1n2YiQB6892q
	CZsgvS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR3m-000000074cz-2V5e;
	Mon, 25 Aug 2025 06:52:06 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR19-000000074Fp-3bWY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 06:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756104563; x=1787640563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CPxnu8JjaM/yvdOpkZwcHlIZVYiDwFghDn0gsxBWGdg=;
  b=j5OJayz9BM8r+dMFCzUsuH0nNdLzo6YISw2Ef1/dRsUBDt6JqMa5v3BQ
   EIPRdSIiZUXcErEE2hCfqzN4opaMmPtSpfUEBjUDVsuds+Wi08uarvNfK
   YffB4Wt3gHrpryeeZeVkRF/xtAMDDWukqAjg3oxLINECE6Gj5UvenUCKU
   Hs6ypulWZ5USdH9SNvbWeLFLYWD9cD+suKOqun/vEzlF5pv4huRK1pFkN
   JTj7ysJpxNsktzY0WrgxxBmxs2FhfL+ysxHCOHAONZNC1W8kWG0I/aHAo
   R1tcXwDONvfUo3WOh1tHUKdvq0X4bcAi0TX78zy23IUstu3SxvEvUGlqT
   w==;
X-CSE-ConnectionGUID: EynKlmkURxCd3md4UWSzaw==
X-CSE-MsgGUID: PvNnWamSSwO7tl4Zz/f09Q==
X-IronPort-AV: E=Sophos;i="6.17,312,1747692000"; 
   d="scan'208";a="45885091"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Aug 2025 08:49:18 +0200
X-CheckPoint: {68AC076E-8-20CAA7DA-EC9DC758}
X-MAIL-CPID: 835B404CD54FE37D8B940634E0216E79_0
X-Control-Analysis: str=0001.0A002116.68AC07A3.0064,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DB3616626E;
	Mon, 25 Aug 2025 08:49:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756104553;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CPxnu8JjaM/yvdOpkZwcHlIZVYiDwFghDn0gsxBWGdg=;
	b=CBpO20PmHcjpgD0YMs8GbLgLQFIV7URaZdaqNCp8IXdnG3A714hhT3v1hWvc8p+1aIBsBc
	O26e2nu+imD88hGNenwH8vM3KYdbiWwG3KJAETknhc6aw4GOjUigj373L+eMAgk38s8uaH
	yIMmzKVKSHSMF/Q3+S78qNHfC531lVaj0AhE22VTq5WBOaXiwCcpK314/PAnZN+ilfbO77
	vstrp5X9rCetDfMVO3dYoh5PvahixFSR5IxqCdXIRB1GM7zTvdQcysiKACsD3aUATWgx3t
	eidBlT0T1SqKg611a2BpAyW14yYzAxAeYRL4RKyofriwVXfqZT/82ASKN84eqg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: defconfig: enable backlight device class
Date: Mon, 25 Aug 2025 08:49:12 +0200
Message-ID: <5012214.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <fozbq6otnko75e4zfsad4c3qp7zgh5n3r4yj3swjd24dxdg4ue@krbmtduwdapm>
References: <20250408134249.1131127-1-alexander.stein@ew.tq-group.com>
 <2385138.ElGaqSPkdT@steina-w>
 <fozbq6otnko75e4zfsad4c3qp7zgh5n3r4yj3swjd24dxdg4ue@krbmtduwdapm>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_234924_200915_D5F4C767 
X-CRM114-Status: GOOD (  16.51  )
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

Am Freitag, 22. August 2025, 23:53:11 CEST schrieb Sebastian Reichel:
> Hi,
>=20
> On Fri, Aug 22, 2025 at 03:55:12PM +0200, Alexander Stein wrote:
> > Am Dienstag, 8. April 2025, 15:42:48 CEST schrieb Alexander Stein:
> > > CONFIG_DRM_PANEL_SIMPLE is enabled in this config. But it depends on
> > > CONFIG_BACKLIGHT_CLASS_DEVICE which is only transitively enabled by
> > > DRM_NOUVEAU, iff DRM_NOUVEAU_BACKLIGHT is enabled as well.
> > > As simple-panel depends on backlight, enable this in defconfig as wel=
l.
> > >=20
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >  arch/arm64/configs/defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defcon=
fig
> > > index 65ec5a5be407d..b70257878812e 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -963,6 +963,7 @@ CONFIG_DRM_POWERVR=3Dm
> > >  CONFIG_FB=3Dy
> > >  CONFIG_FB_EFI=3Dy
> > >  CONFIG_FB_MODE_HELPERS=3Dy
> > > +CONFIG_BACKLIGHT_CLASS_DEVICE=3Dm
> > >  CONFIG_BACKLIGHT_PWM=3Dm
> > >  CONFIG_BACKLIGHT_LP855X=3Dm
> > >  CONFIG_LOGO=3Dy
> > >=20
> >=20
> > gentle ping. Any feedback?
>=20
> You want to resend with updated mail destination:
>=20
> https://lore.kernel.org/all/20250818-arm64-defconfig-v1-1-f589553c3d72@co=
llabora.com/

=46ine by me. But this is not SoC-specific rather than a general change.
So who should be addressed then?

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



