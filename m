Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCC5FB5173
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 02:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3908iiPI3hECH6QUcIBezZy77aQeoYAT6au45Bpg6gU=; b=3Hh1wj1Em2mNv0zF/D2z0DkkeX
	EhIcz5KIvkyva9AAWle1HxuGw9FoFiB/JSuUO7SLIHdZm0Y+NC21b0kRvKDK3EiFoY4hqGdjQPWP+
	owOFphjcubFD74VIizdb7rVw6QkG6rXWO1aSfu7WDRapRC8J9iPREdqLHLjsKVCwmqtOkr1jPNNKb
	W06oMSlWf8/GGs6qleDaXoktirfS/UtMnwZzsLqS2q8F3VzKLYKjRr2UqdajkqMFwa9IWCjgab1Kf
	ykmLIJKTSf8vhV3RbCiC0ADODTB/xErzYt/9NCc5y7HDGQDocAw1SzfhemUOwS8ItZPLV50oeAWV3
	zTdxlrHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vsD-00000005jto-2UnH;
	Tue, 07 Apr 2026 02:09:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vsA-00000005jtO-1gpV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 02:08:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 213B740811;
	Tue,  7 Apr 2026 02:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73830C4CEF7;
	Tue,  7 Apr 2026 02:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775527737;
	bh=He/fqeGcwQSmgNiVZyJYEsyIDIMjQPKTbSWJEV+kcCU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SCwtf8bsMl12ktsPj3oFIc41TE+oL3ZUtJTlC97i90HEZdaH8X31PgsavVyH3kh6k
	 CCCqFJ/2XHGourzmLkiJRmAfLRskkbx//u9zDnspLyUJJWy70eweGSOZkVwIYbqLGf
	 ygxoAxXlUTUgO93D+H9m/4LbLJkeShPK28qPppBGLoNDwCd2oK/GZDkb7X47QZaZHk
	 8Aq/Ph9PlCkVvCXuCAvJb4hbQNA2U701K8T7huPQWgxAkBNufohNjw58v29o2tFMGt
	 aeImjBNE+hCaCnqJ7xKFrunMecQIm/I3xxrR4QLVV0FPhPVsKGkNO+b+3jvojxvhFh
	 SWhw+PJl2n2UA==
Date: Mon, 6 Apr 2026 19:08:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Jitendra Vegiraju" <jitendra.vegiraju@broadcom.com>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 richardcochran@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, john.fastabend@gmail.com, rmk+kernel@armlinux.org.uk,
 rohan.g.thomas@altera.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 andrew+netdev@lunn.ch, horms@kernel.org, sdf@fomichev.me, me@ziyao.cc,
 siyanteng@cqsoftware.com.cn, prabhakar.mahadev-lad.rj@bp.renesas.com,
 weishangjuan@eswincomputing.com, wens@kernel.org, vladimir.oltean@nxp.com,
 lizhi2@eswincomputing.com, boon.khai.ng@altera.com,
 maxime.chevallier@bootlin.com, chenchuangyu@xiaomi.com,
 yangtiezhu@loongson.cn, ovidiu.panait.rb@renesas.com,
 chenhuacai@kernel.org, florian.fainelli@broadcom.com,
 quic_abchauha@quicinc.com
Subject: Re: [PATCH net-next v9 4/4] net: stmmac: Add BCM8958x driver to
 build system
Message-ID: <20260406190854.13596789@kernel.org>
In-Reply-To: <20260402213629.1996133-5-jitendra.vegiraju@broadcom.com>
References: <20260402213629.1996133-1-jitendra.vegiraju@broadcom.com>
	<20260402213629.1996133-5-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_190858_482170_CCBFC53F 
X-CRM114-Status: UNSURE (   6.09  )
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

On Thu,  2 Apr 2026 14:36:29 -0700 Jitendra Vegiraju wrote:
> +BROADCOM BCM8958X ETHERNET DRIVER
> +M:	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> +R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>

Should be:

L:	<bcm-kernel-feedback-list@broadcom.com>

It's not a parson.
Before you ask - FWIW what other subsystems allow in MAINTAINERS
is irrelevant.

> +L:	netdev@vger.kernel.org

