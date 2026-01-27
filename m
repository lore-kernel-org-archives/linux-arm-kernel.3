Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20848CA6CBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAlcWCtQdB6zFcgT1AEpGn9kuon/qBctbh//4Nuyblo=; b=yOU12W9mUxQwJmVvouuQoSfpsB
	Ec6XyFCAU9i9g9vZ2ncRD3w709b2+5Pnf/HiQsH5HMyxecpGAusVOk6B4YFKdp8gjfTnZLQQ0VMta
	42WZRAdRLretd1G2aW9FtCe2NMaVlhfx6QYQbW68KmH4ms1F3J4lSGVvV44TUX8k6+yT/Iabx+XOT
	liVyPpkwQHAtheM/IXhUS831HZPOrc4bGkRwEbl9J14dJVwUk+m5vODzXNMq5mnAQBT1IFPuhUMxI
	AYmc8r+4t5B/cHivU9ZKDurz+7MjqgcrQFxLEKqFy3pmJeBnvu0tJsxWrknXmaREHyJu3gfSvWX4w
	BrfxT79g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfJW-0000000DvhP-1hFT;
	Tue, 27 Jan 2026 09:24:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfJT-0000000DvhG-3NOn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:24:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3222A6014F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2283C2BCC4
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505882;
	bh=IAlcWCtQdB6zFcgT1AEpGn9kuon/qBctbh//4Nuyblo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m5B4fFTRykSx1iXEUZ9o6PvTZRS69FB882HHAz9VKjMB4EiGb1+Sjpt4v1YU+X2sJ
	 iFcHLvFGJ9tcRarjXkzPGwmmgjOyp9eYPgR79CBtDuerf1x5yCMhvbnxenXuoi4CHX
	 67vgFROGS4FNLu0cfQsesjaP/DXhZImHOy7OxNrQnT0kII4qslvsA2WlY5p4ABnUta
	 O8KMX4J6OylXZehLVg0k/7CzLbM3YLqQQZ3KzO3nEeeHr4rzzugkF5s04CN8ENSv5T
	 Q2cL9PWH71aewyr5fDuTzxdfgDVD2F9COfFaTobjUz8lV9nL3+Wzgvpz1waiKBRMAS
	 YbI5GreoSvQnQ==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6495d592c45so4081014d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:24:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtuc0mzN6Bn30+/Gddto6Is01EAgUJbkvnds74vhkZJspcGUZ1jVbMyK3ujO0mrmxOtu8uaIYO/rK4pWyAUvgg@lists.infradead.org
X-Gm-Message-State: AOJu0YzYGIQhlJmqqD33022uRYGJ6gft03lRYuw5CV/t7CQD4bcTVGMz
	NFKR++jAGj+TxepghV9anjigiNhnS9V+qRjMIqmLF1gI5nELCifIAcscAcHi+NAXRivddYK4KCW
	20t3HUXs5oViIJc/n4+5amHgJ++fnxFI=
X-Received: by 2002:a05:690e:128d:b0:649:6ae3:59d8 with SMTP id
 956f58d0204a3-6498fc1489bmr707379d50.16.1769505882102; Tue, 27 Jan 2026
 01:24:42 -0800 (PST)
MIME-Version: 1.0
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com> <20260123-debug_bus-v5-5-90b670844241@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-5-90b670844241@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:24:31 +0100
X-Gmail-Original-Message-ID: <CAD++jL=MPPM5HWYJzc3ckbnP5GVjfvSobmKE1xx=5Ud6964NZg@mail.gmail.com>
X-Gm-Features: AZwV_QhQdyIiz4UerqYl3hvl_Hh7MKvqx_tg7HoHtzwKBdCqkSeZ5Xn1a3ShfdI
Message-ID: <CAD++jL=MPPM5HWYJzc3ckbnP5GVjfvSobmKE1xx=5Ud6964NZg@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] bus: stm32_firewall: add stm32_firewall_get_grant_all_access()
 API
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	jens.wiklander@linaro.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jan 23, 2026 at 11:40=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> Add the stm32_firewall_get_grant_all_access() API to be able to fetch
> all firewall references in an access-controllers property and try to gran=
t
> access to all of them.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Excellent, just what I wanted.
Thanks Gatien!

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

