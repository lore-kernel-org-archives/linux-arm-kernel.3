Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32BBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klrRb34wKjAx4QD4DOsPfFa5Y+y4vc9xPa3T8I/olE8=; b=vlayvPW6xitynfRNtTahVbgn3Q
	M4WesdSZ/LpqGyapHkB2U/0NwV5VtKllv0d2YhHjtWUYR2OuYkjcsybdV/1qOgEAyfm+kfdwId61L
	JOay/mbxgDRfAXQqMc3S2IuP+olYvdyhy4pCMg5ZwnI80mNTUR29FK5n2BAPnhnLRb1bIYSB2q08X
	yEInjE76hesOrLhzZ/6HEi+dlQrVjM6NefEGJh7Fj6AqJeG3WsZWrOkDg8u+FlCSdcicjNDGq5PQu
	CftD3kQimVElz9VKE9xAaXMpaEzNb5j7WACi78BSFPKK/Tm5WWgKX3DHJj1JHcC/qTkjwGd/xoL6v
	PQf4LFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplob-00000004f9s-2EFx;
	Sat, 23 Aug 2025 10:49:41 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZhL-00000003Zbm-3i3d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 21:53:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755899596; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DaeXgqa2mfRAFXQsvYwFnGOx5N/UdDLKPRI4H35tJwQx+SwVAMnl0amneiS5XBvLn1OTE0Xpxl+ajk5yMdjEGmslbLGRV2U0QZynDlZ1uCaoo8YtNx3EDWBAjWd+aQYXrgT9lvThlHsOx/4pV6T2kjE+LJ72rAgB3pUSDjuJXEA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755899596; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=klrRb34wKjAx4QD4DOsPfFa5Y+y4vc9xPa3T8I/olE8=; 
	b=bZ1yeQlkjA1buILpzDbO1uU4/+W0ZCFzleflKEKwpEL2fx+rLE4nVogYYyT3IVed3c3Azh8F9uKmJ2PTWei0kwPZir70CLK6ngk0owgYeySKL6QFgD8D+K5kaTwO1lVtS+/hhlVW1soSQ06sW4O6d6wFAezH6aIlxELR9AvIRlc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755899596;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=klrRb34wKjAx4QD4DOsPfFa5Y+y4vc9xPa3T8I/olE8=;
	b=iSaUa7a2jNmxQGqe7vXbTWhQ/nmEra/4nn8lzccL0eqk3c1NKO3Lyu0hJ0YJtvCN
	PfHdixcUHSL4GNliUGu095teO9PJZt2EwBvsdLVYuRK9hYmyUKEsrpP8UCsxsFyN2Iv
	1AyfHKI5yCLvXxh8skcZWeTEK1n/n3jM8PHvB4io=
Received: by mx.zohomail.com with SMTPS id 1755899594556961.1841976736891;
	Fri, 22 Aug 2025 14:53:14 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 3A4AE1808AD; Fri, 22 Aug 2025 23:53:11 +0200 (CEST)
Date: Fri, 22 Aug 2025 23:53:11 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: defconfig: enable backlight device class
Message-ID: <fozbq6otnko75e4zfsad4c3qp7zgh5n3r4yj3swjd24dxdg4ue@krbmtduwdapm>
References: <20250408134249.1131127-1-alexander.stein@ew.tq-group.com>
 <2385138.ElGaqSPkdT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2385138.ElGaqSPkdT@steina-w>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_145323_988933_4408227B 
X-CRM114-Status: GOOD (  16.87  )
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

On Fri, Aug 22, 2025 at 03:55:12PM +0200, Alexander Stein wrote:
> Am Dienstag, 8. April 2025, 15:42:48 CEST schrieb Alexander Stein:
> > CONFIG_DRM_PANEL_SIMPLE is enabled in this config. But it depends on
> > CONFIG_BACKLIGHT_CLASS_DEVICE which is only transitively enabled by
> > DRM_NOUVEAU, iff DRM_NOUVEAU_BACKLIGHT is enabled as well.
> > As simple-panel depends on backlight, enable this in defconfig as well.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 65ec5a5be407d..b70257878812e 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -963,6 +963,7 @@ CONFIG_DRM_POWERVR=m
> >  CONFIG_FB=y
> >  CONFIG_FB_EFI=y
> >  CONFIG_FB_MODE_HELPERS=y
> > +CONFIG_BACKLIGHT_CLASS_DEVICE=m
> >  CONFIG_BACKLIGHT_PWM=m
> >  CONFIG_BACKLIGHT_LP855X=m
> >  CONFIG_LOGO=y
> > 
> 
> gentle ping. Any feedback?

You want to resend with updated mail destination:

https://lore.kernel.org/all/20250818-arm64-defconfig-v1-1-f589553c3d72@collabora.com/

Greetings,

-- Sebastian

