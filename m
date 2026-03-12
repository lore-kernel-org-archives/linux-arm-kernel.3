Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694E4106ACDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uRNP8sj9zOHORQvbyaXxs4QwcaBwFw81kautX3rWdo=; b=Ek0W6r7OrBRdePW+dyiOOmsKXB
	yoDStAwJvCsV3kxPvqNWGA7j3KK42QOHLTnwdN4MiBYzdhAhdpvE0xlIUA8A+4AoBWdUE0C2AViny
	hbq6hOrQD8snP+3+nv+fSW3XXi06ohb+abIGIDNA+iRuJUF8OW3AyZqfc+jibENalnLOgWqnHUiu+
	3wCEcspMBGoT6yQtZNGoYa/2ugnrpopuTJMEEPZPrgXlHhieN73ILb2CNgIlnT0nkVUFW6XPZWP6H
	wCOEcxvRIcBt0ubq/J7TJyv1WucmTL0GBHII3RwOTOoj0/fJ635Q0kaFJyy5Gs7YJxfRleVoxgaoX
	O6PyA3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lGn-0000000ExuO-38Us;
	Thu, 12 Mar 2026 19:00:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lGg-0000000ExrC-0jvt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:00:25 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so15515765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773342020; x=1773946820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uRNP8sj9zOHORQvbyaXxs4QwcaBwFw81kautX3rWdo=;
        b=JgCc7e4FajjfsLcTceWUdFrnkJc5l2U9M2l/BxxzZBOKfNom+I5MwzKeBgluHML8lh
         6pORnQk6rqIV15k8pgbcFIjz8w3v1uRcDU/27mBc5zFuR+iybYqo3UntJiDDTEjKsVYU
         DNNMMQDsiUMu9vLvESGm0mZ3tYECfjxzqq3IFmOZrA4GWIposhg+ydmQ0Wyc8uVTcUFw
         Ob33bURvRkWPzIJbCVt4eCmp0gzpld1k7KmthACSAB/fH8buDoPn1PGOOJkPclh8qYgB
         9ssQ5TOdIVo/64ao+U49j7hwZJhqgh1gwYduayOjTeOl+mBLQwUT7+FZgfSVZKwdIRCW
         mBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773342020; x=1773946820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1uRNP8sj9zOHORQvbyaXxs4QwcaBwFw81kautX3rWdo=;
        b=rZWW9vW+mnUZ8pwY7cYaiw7zvaKn4YGTPJGcZLDQ8byqJMd3iHhTBCZ5cZA10pnrzR
         RfWA8aBM2EakVUhGEkjYpC2H1gZRlTuy5ZUtpFgrVs7hhehurMsBY3a8R8YemHJlTUZH
         Litb1QfuK4BxPc/ZyNQM/KWjFZQ8qv2Rm4ws0/olKx5/OnueyyOosWmGVzYGNR3qwxb+
         eQ+LS0EOinvmI098dg2oQzDQ8Pyyq9KP/SBcIfitrcrqt6sNrR/I9n7LpGgkAuDhWLN3
         cC1WEhbVBbHxTQzclazTa3/Zu+aK4Vf5I/fS7O6+/GrYxz9SgJ8pGtV2PcrY58hCCLtl
         wsrw==
X-Forwarded-Encrypted: i=1; AJvYcCXtNCDRdboS10RVbxR+DRKifzeSg0PTSq+c5kGT0282Kb4Uzftxi9bEh1lu44M7hlxUIrfWymHSDa04Ia7nkq6v@lists.infradead.org
X-Gm-Message-State: AOJu0YzoubvZWnSH+QTvPniJt+QJpT4KuiQq4oR/5iVVn+qoxFklEy5S
	3k47Mqv2/UioepFwIiz7DJEEoDicoRXwWTDePV9v5GEmmYZLy7iYcUwo
X-Gm-Gg: ATEYQzyDqp+q/gsuZz7fQwY6Qh66rHA/Ut741BbRD2KGDZ38sEyIpkBgepuk1d8fV+G
	Mfy/swhuLiLspnA/reYueFBvvRaeWqlh5NuICE7I87/ZCiSJPGM2lWu8BjIEtoLvuB/U5ie3ulc
	k+Og/7l4j8tj1xpZHjkSDTfeCgTzxt4LfkwSNicImQhebAwVasf3qi+L8c/vnVJ2PSjs1w/ZMrQ
	YcJeBYaZsP3JlPeqbHYUQFyLZE/Jab9jdXFyoqFEacjgbETnHUPRFcqJaLBGe9baXrC3wZhvZBm
	xCrkuvltrlSqoPAvj5WVi3VFygksF0BTl6Lqi2SdWmQMwL7Th0rY6ly4ZXQpEf11cor5zY4UbmS
	rX8IbOIcchaUQNH7z9L8fUMM+AbPtE08Ut7bVoaIS92k7wy04TKaPv33OsHxd3C5FL/N8TbmlRh
	p53cpryplsDcOd4ssPX+i+InthsNR07bUNGks0tIR5lP9OY7Ps4AdPND0xSjMQm2nPU2kKa9VP4
	Cg=
X-Received: by 2002:a05:600c:8286:b0:485:34b3:8585 with SMTP id 5b1f17b1804b1-485566d6dffmr6984515e9.8.1773342019666;
        Thu, 12 Mar 2026 12:00:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19ac5fsm10964630f8f.1.2026.03.12.12.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:00:19 -0700 (PDT)
Date: Thu, 12 Mar 2026 19:00:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Johannes Zink <j.zink@pengutronix.de>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Bartosz
 Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Gatien
 Chevallier <gatien.chevallier@foss.st.com>, Jakub Kicinski
 <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Richard Cochran
 <richardcochran@gmail.com>
Subject: Re: [PATCH resend net-next 1/1] net: stmmac: actually error
 requests to change the auxiliary snapshot capture channel
Message-ID: <20260312190018.15e6310e@pumpkin>
In-Reply-To: <09528d3a-e08a-4942-aff7-b59610f6b13e@redhat.com>
References: <20260310140155.3359-1-david.laight.linux@gmail.com>
	<09528d3a-e08a-4942-aff7-b59610f6b13e@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_120022_256945_0FDA152E 
X-CRM114-Status: GOOD (  21.29  )
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

On Thu, 12 Mar 2026 15:07:49 +0100
Paolo Abeni <pabeni@redhat.com> wrote:

> On 3/10/26 3:01 PM, david.laight.linux@gmail.com wrote:
> > From: David Laight <david.laight.linux@gmail.com>
> > 
> > Commit 2ddd05d1d5ed ("net: stmmac: do not silently change auxiliary snapshot capture channel")
> > added code that attempted to return -EBUSY to a PTP_CLK_REQ_EXTTS
> > request whan a snapshot was already enabled.
> > However it tested bits in 'acr_value' after they had been masked off
> > so the check would never return an error.
> > 
> > Change the code so that the test actually works.
> > Note that when the commit message says:
> >     Previously in case of a PTP_CLK_REQ_EXTTS request, previously active
> >     auxiliary snapshot capture channels were silently dropped and the new
> >     channel was activated.
> > this only refers to two commits earlier (a few minutes earlier).
> > Prior to that only a single fixed snapshot channel could be enabled.
> > 
> > Note that the check will reject requests to re-enable the currently
> > enabled channel.
> > Plausibly the best fix is just to delete the check completely.  
> 
> I agree with this last statement. Enforcing the check could potentially
> break the user-space.

I did wonder why the 'half hearted' support for multiple snapshots
was added at all.
Either it is needed and should be done properly or always using a fixed
snapshot bit is fine.
Not that I've any idea what this code is for...

	David

> 
> /P
> 
> 


