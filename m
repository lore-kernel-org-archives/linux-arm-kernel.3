Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B380FCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 11:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISAg9Ds4B98LuZFnY3KHAcg5cDgsZo8MNu8157jR7xY=; b=PqwQe2JFt2GpUUdxTR5XGSVRxu
	FIuJTxlBwvGvzorMFwr/SRn0oLVuqt6+yqP1vrCh/zF/W/ClclgXdwJdx/Kxv0dkWZriiJ2vBO9Yf
	4dinLi/MD4ZnwHj60fquPgqY/1jERK/psLy17dHCO3X5y0UoxeJTM3rrRvEAgaaC6qOkQsD0/OECH
	MQRNQamycYbt8nJhkA1Er6cKOD3PXAzy7xwoK55p8QFwURFd2mlSaZ5z+H0nGrR0ea0l/L8zYsagl
	8TQBShyXhgZE5XZ39T3ykte+dpzkuKD2l8ipnw2YoUkLWb1Y+p8eZr0uO3Iy4SSqnack8Vf3P3qm3
	Z5PX7XbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMtf-0000000ASoo-06Eb;
	Fri, 22 May 2026 10:14:27 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMtZ-0000000ASn6-2mBJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:14:25 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-7c2fa14795aso55417507b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 03:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779444860; cv=none;
        d=google.com; s=arc-20240605;
        b=VherJatToUCIwOH91KjLpTYQiL18L3qrmCj9NzeTD+FzMcWCe+gOqtCFyjwKAei/JC
         ukW+CxeZTw6ScK0bk+ESeShZ9SAGnN8jGhGlYTfm+t9IeaOIEHY1OJnmKQ/CT7Ei5BR2
         nBFlJ5Nn7Kt3Rf1O2aj8aNN73WEYMweZPMyp1KVO9xRzDpSIWCMF5pMTbRw72hbSVZ2u
         qaKdbrA7NHhi5bzn5fjrFFNRZ0j9Bp33ea3hgSp/DUZ8maJJkw47FcASGdD+78KI30MG
         w30wuNraRVbkZoZqv5loFEoV9qHWlXjqNnMcHsXwRSsER/h3zWPV1bZ4nAaOhd4WyfWu
         sk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ISAg9Ds4B98LuZFnY3KHAcg5cDgsZo8MNu8157jR7xY=;
        fh=aBSbOPiEs1EyPUse8/3yqwQdfu4kFlZhPiQ5deiOiso=;
        b=abdCKn458ta0qgYK2ffV26Y4YcEo7M223fct29duAgkkWITxcnC57cJzhp3CWW90C9
         0oioi4Un5VJVLFxIfVOLNKCBM3yx3VfjlmXgzgEEBIbUxLV7MO6mt7NSGLubs4lgP+qn
         gIjyR4nrrqu6zZe8QXthiWg+0HP1aCjcr+oHfejky/K5yiuK384mYXSAIw0nCbRk8iwE
         k5rBaGNidxutYjpkA0j7Y3rK+q0g7pOAnMhRg+n884m2QhB6fo5XvcH5liKEH8BRM+jl
         NobSJlKj76cV6msLN34C8WjULEr6ZAl6LJWJzppA8oCn2gTVvblpMGbRFuB9W0UcbelD
         yPdQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1779444860; x=1780049660; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ISAg9Ds4B98LuZFnY3KHAcg5cDgsZo8MNu8157jR7xY=;
        b=mlTN2b2Vt5j+MkOdnDe09+GJ2qbf9YYFv7MYx4G6swjEgOnrnrjVlhlcPODKa8Iwyw
         0tgSVvtG1Lt3WbdUZSi+SZXSMgOVoGhrV7Ix3MG/9XVilVmO30azlunDsW1E7WusHMSL
         k32XG7mDSG7e/nSKamfdiWZgX8zWL2zLc23kBEzFzW32K/JcxSVxB+TdeAuIo2RWQlY3
         CgonEnPpszCeNiKNZtsasybRwbGbY49U+QgD8B5ytoP/EvLyhRtqXL9b8TtuzcqHsuDS
         mlRKqBz+W0v22DsRNdyD45BNNjSoSMcrNjgzJdbN9A9l8XrTtejL2XOXnQeZZ5eQDXs8
         sBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444860; x=1780049660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISAg9Ds4B98LuZFnY3KHAcg5cDgsZo8MNu8157jR7xY=;
        b=YVHYJjMimq8zCqc9Q6EhYTD4ER8etcgwpTSSB6oVO2JhmXICCA2P3S9zaSvwtgzyH0
         x+y1cMNMz3Y2hgxBm5xto+igAnmJ4vdXemR+jXRvkSDaSIvcNFYEIbKql8macq9b4ibd
         MPy1jCypLayD750EgIPMLx+DWl7JXV8gKSDgSB/KXlDji65z3tzZGnn7dZtitnv4qSd3
         QwOlwJpzHUVv6b3ej3myJB04as/3xeS3CY8zve5wwpPA5D1eZ/XGVUoYHYPrrdCJzpUY
         cli9sYN40W1WEiFfwitocrG2b3NmGqBNec4MPKfPWwcXXzF/V+85APslySrZ12kuGDQf
         iZmA==
X-Forwarded-Encrypted: i=1; AFNElJ9xUxd06i2cruGXeM6Ii3Fr8Mz7XYqcZ6gE/Th/I64aEMTLMYKl7MWS3Jeo6wtRGEuZJv4wzK9Os2IGPlnY6W/H@lists.infradead.org
X-Gm-Message-State: AOJu0YyH/1OCZ0MBGgf8yAb/dACzgTf7JzSxM2uJbbXh35wMqIXmIeVx
	N28631OmmYY9KYdnR8B1/wWCeCPuNyvJTGOujHv23dEJojkGqKdXTmo0aXIcLdlGY5ZDzEFuJhv
	CJJOgrcvW7JdB0uuVLml2PQEoh50BHn0O/9O4OtFMJw==
X-Gm-Gg: Acq92OEyfonXMAtuHsHtRECmj/spHRSSfNqAI8MnbPY+zOJZ7D39ZbQlS+C2XcHIng1
	B0Z1EqYJUQOvIg+vSmMCZ1NGfCk8IBb6oKVN9fQWfP7q4qHbyNCAwrhSKHITMwI6SuF8ljyvwVa
	JZa3tbrLqPSMP6+pEQEc/UmkwOggYJ9vO7mXZuFB5bmBURupRQ5ReUd9qHaJeg0jJT6sL15KllS
	Tu1CWPa1w5/R9Z982VIdP2LH28dgyfVMV8nraBFU9MXugFpKT0MKSotFnT2jbgi1GjYLo00Lp7r
	Y1rljEE6LeP5E3upYwObXslXraAEVminlThumquV/0lHv+icwPjH2O69vX6WJl1NJK15Q8rKv4H
	NYD2kCgN0n+R2B5Dd28cndJr5
X-Received: by 2002:a05:690c:4483:b0:7bd:5cc4:1962 with SMTP id
 00721157ae682-7d33b03c490mr30276877b3.48.1779444860430; Fri, 22 May 2026
 03:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
In-Reply-To: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 22 May 2026 11:14:04 +0100
X-Gm-Features: AVHnY4IeLXy9JqzoNas2NyKvVLWqLa2ctNUPTJGytHN4uTeTbLrA8_-wW-eJnfM
Message-ID: <CAPY8ntBGJo9yGku5LVLyR=o9iF16jshfFa-uCFj7Qk8oTeMnLw@mail.gmail.com>
Subject: Re: [PATCH] media: rp1-cfe: Use IS_ERR() check for media_entity_remote_source_pad_unique()
To: Ingyu Jang <ingyujang25@korea.ac.kr>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031421_747140_B47BED27 
X-CRM114-Status: GOOD (  18.63  )
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

On Thu, 14 May 2026 at 20:32, Ingyu Jang <ingyujang25@korea.ac.kr> wrote:
>
> * Spam *
> media_entity_remote_source_pad_unique() returns either a valid struct
> media_pad pointer or an error pointer (ERR_PTR(-ENOTUNIQ) or
> ERR_PTR(-ENOLINK)); it never returns NULL. The current NULL check
> therefore never triggers, and the "pad not connected" error path is
> unreachable.
>
> Replace the NULL check with an IS_ERR() check so the validation
> actually detects malformed media graphs.
>
> Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 8375ed3e97b9f..91e9fa0341e06 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -1779,7 +1779,7 @@ static int cfe_video_link_validate(struct media_link *link)
>                 link->source->entity->name, link->source->index,
>                 link->sink->entity->name, link->sink->index);
>
> -       if (!media_entity_remote_source_pad_unique(link->sink->entity)) {
> +       if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity))) {
>                 cfe_err(cfe, "video node %s pad not connected\n", vd->name);
>                 return -ENOTCONN;
>         }
> --
> 2.34.1
>
>

