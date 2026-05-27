Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A945CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FW1o8Mstfz7HtwERoCbtrhXZitn0SCyLL8f980TymDc=; b=gNl60NJPU125ODAlxtCzJ6w/JP
	DSsWUKaSpB9D+hriRtlSeBgcxnKAH/4qLd5YTFAbj2BH+iPPSqOys0OtsXAmA5GDrZWHNr9a8iBn/
	OML+g9WXuEouuRjYPbVjmVblJI+t2nD+T6Uji6LmdaQTzqfiikalUJChzz+xr0055/CT6pmas17k/
	i32/Ufp2REB3sK9Ji09gYxoGI31Gn1TFJx2fQkwz6kkHAcgAyqnPnALVdcQzNgTaPjr2TS4ScbrLl
	4Gvgn8Z+vz6X6muAvmuh2/UPrQkdHZoqVuPnXFvMSK8ZAS9k0FADRxDR0CXGfddDMJhM2II4z68y6
	6+crwQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSANY-00000003c9w-0Mgs;
	Wed, 27 May 2026 09:16:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSANS-00000003c8f-1AXy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 09:16:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C4E3600BB;
	Wed, 27 May 2026 09:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971881F000E9;
	Wed, 27 May 2026 09:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779873397;
	bh=FW1o8Mstfz7HtwERoCbtrhXZitn0SCyLL8f980TymDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DIeSzj7mkAHQZrvnz4x3l4UQ5fpwG5PV0VOHWqVw/CeQs2ZgxTRqTrOB6lULCpp5F
	 BRM51npMY17KAJ+qaf99ur/O9rebdSLSnTDO3B4xUP1y0qRWjENP5dEvoTgPYUsHxE
	 eO/a9frK1eq7YSfrAyvYD4T9eKK2tglmeH2XyZnowVx/Edt/s3oNP/d2MN8jwxV6MY
	 Uqbp3c7cW7epfXTiXrgaMrBPLjsYentJwdsYfwKzKOACdFaNR+gd0nH3DHp4pRtohp
	 HRNyPNH+IWB3uTUjNhV83+IfJmSalz+BMVi9hMVjsUn4IsCehrTYChnqOR9b7hkbDB
	 TZFELXj9tdh5w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: Treat missing FF-A feature on a platform as a probe miss
Date: Wed, 27 May 2026 10:16:24 +0100
Message-ID: <177987332790.276916.3167298896223560976.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526103649.5684-1-sudeep.holla@kernel.org>
References: <20260526103649.5684-1-sudeep.holla@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 26 May 2026 11:36:49 +0100, Sudeep Holla wrote:
> When FF-A initialisation is driven from a platform device probe, systems
> that do not implement FF-A can return -EOPNOTSUPP from the early transport
> or version discovery paths. Driver core treats that as a matched probe
> failure and prints:
> 
>   |  arm-ffa arm-ffa: probe with driver arm-ffa failed with error -95
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/updates), thanks!

[1/1] firmware: arm_ffa: Treat missing FF-A feature on a platform as a probe miss
      https://git.kernel.org/sudeep.holla/c/18706ea68fc4

--
Regards,
Sudeep


