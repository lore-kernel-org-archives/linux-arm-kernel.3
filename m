Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503F9107BCFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 07:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jr47S8Omkd671RmRpwVUVeGq79Jq1P9/cSVeCw/uis8=; b=HA7kLHH+MyXZKp
	lTxiI0xvJs1drbkkPKpkSibWbRGEO0DY8ozi8Rq3Lqfpm2YvWy0nDPnYr7ZqaE4mc+yuFqvekxCB5
	1r2fPrakArul/wrjc0zQQTmLpasFkVhMAjaR+jpriO3rI2Vsb6Vz1ufMGSPh1nVJdZ+hmPE4/uXa4
	iE2+ix0L/RxyassYL6PDq/5bZ3eVXD880sxDUhPT8Ig+aKxSd0px3JlisMp7jq6m8xQvcrNekXS55
	8qtKMR8s0ttrszJxl6ke9TG2yr3jYfz337kSM0UZ8nLbpJ8XJHnvUzHX/Z8eoKxhRV5BgJfDtAXbq
	BKk+YAcEHAPkE4KnOESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Jbg-00000001ayS-1Q8r;
	Sat, 14 Mar 2026 07:40:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Jbe-00000001ayK-3wg0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 07:40:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B6B3F60008
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 07:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5BAC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 07:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773474017;
	bh=jr47S8Omkd671RmRpwVUVeGq79Jq1P9/cSVeCw/uis8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=VOu1zzQe+2Yc0ZFpfntKg/CMWuzKeWujXrmWicC7XhZE0fF/reknaXH1ch7dgAJRX
	 8dKORNHxbrVdXcLjewURgcrue7eJMHWrVug2WvioUOG9/zM8Q8mj0rPDH8iAfszfAo
	 o/r8kjQs3ApJW7CXTwUWADBSH0tCEiexiR7XZ8LHgVfUswprQaZut8lGw/nAlJ9Etn
	 oocTr2M/9+tWHDBkjff62v8eVVXI4Si/WnPQfqlnrAF81chdzxGW4XusBZF4aZz9/S
	 WPJZEs7giLAM3nlSJsQnMOflj+gZzSqKRUNhAXaDnno7lZpQzvHS7sntOBwR6tWRhb
	 KP1P/RcG4lOoA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a1273de95aso4193992e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 00:40:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2ia6e/egAKJvLzCRq08XtT0gR1Eb8orwDidQNMUuIFnghg3zoPunC5clUg3venVVEK6KpCxgE+UPB783tI2cm@lists.infradead.org
X-Gm-Message-State: AOJu0YzzjJrjN3Bit1kJ6Xr1cuQEOizC9i5G6nk090RNsPPQvMcn+AUE
	tgIiicryrayFVhbxJIL8UdQAs5mpiWGZ2Z1wsOVzFLaOczdXL4nu/VXS7dVHgVUeYSnjxM73nHT
	bP8TSbg4wawF5yZwLNclnP0JcT+stRX0=
X-Received: by 2002:a05:651c:3251:b0:389:fa42:b278 with SMTP id
 38308e7fff4ca-38a896a7e7amr21812631fa.14.1773474015748; Sat, 14 Mar 2026
 00:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com> <20260305-b4-pck600-a733-v2-2-ba6bbed7d253@gmail.com>
In-Reply-To: <20260305-b4-pck600-a733-v2-2-ba6bbed7d253@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 14 Mar 2026 15:40:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v65h4aXPAfZ1KnsxgxwtOmfu0ZKbzHjYoG3auacpoBg57g@mail.gmail.com>
X-Gm-Features: AaiRm50gm5CxKsArz3g0RHJT9DAFqfRxhiIS2xZcN5maI6-RPumGZgYHHPT9O04
Message-ID: <CAGb2v65h4aXPAfZ1KnsxgxwtOmfu0ZKbzHjYoG3auacpoBg57g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: sunxi: Add support for A733 to Allwinner
 PCK600 driver
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Mar 5, 2026 at 11:34=E2=80=AFAM Yuanshen Cao <alex.caoys@gmail.com>=
 wrote:
>
> The Allwinner A733 PCK600, similar to A523 PCK600, is likely a
> customized version of ARM PCK-600 power controller. It shares the same
> BSP driver with A523. According to the BSP provided by Radxa, unlike
> A523, it doesn't require reset, as well as a different pair of delay
> values.
>
> Make reset optional in the sunxi pck600 driver and add support
> for A733.
>
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org> # matched against BSP driver

