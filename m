Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D9FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs/aE9VBUtWkbTYcRJAW9cr2FVba/GqgJ4VTSr8qjZw=; b=eqodPO0t71Lb6P7RBVH3sKX73n
	rhHTLaBycldiaAO22VYmpoFps/LJ+jMUp++ARdofAQCgogR3T3XHlplnMW+bibUtl4J2yYEp/GAaH
	D+jO+4lYR3KFTLmzkCbIY1sNGEn5yOdKb4NL8yF/ScpXFwWPLFUoEjc6TS4sCTfzzbLy+Ij20wKnO
	ac5TuAbQb8HOc+zMNQpjkBdeKOFelF4MHbX5lSsl1FqdJqIoP83s8iQdYxgCgYdcPdbHsVfMWcEN4
	gLxkznjAKqOw9gjbK0uU6UyvHkMUCtBbhGI1HCpHI+jjrRO8bkZt0/TAivJ0Izcr9oat7UnTEIbTk
	4NAuBo9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FTO-00000007hHc-2d84;
	Tue, 22 Apr 2025 15:23:46 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EKL-00000007R9r-2mN7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:10:22 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso5375271a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 07:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745331020; x=1745935820; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs/aE9VBUtWkbTYcRJAW9cr2FVba/GqgJ4VTSr8qjZw=;
        b=WK5Zs9mj2JTVuwK/BoKA20mP9SHEldOJk7EgGE3fwt9b/Gvdjdc24WDy1n1aq/BgmK
         1Pu7BjyXuoXXS8Ppvj5Bi1XT0+iNGs57sHouFHbQzs1WdFs+clQQXYEPocwfhFHdfKvc
         CHDLurM8ytd6FpXIhD+rhR6eRluOlG+aOJRqh05hknIV4gAtHRecM0Bd/aKx9BxGI41O
         LBEawd9tswsH4Udfb41nCekYQNwp4Dj6qfwK7zOeJDCDY9M0kgd90BpdbN0OXsk+/fsx
         7nM7n1V1k1rySO9LcF8D+u21grLiW9lGIYdgbpIJcu6Lqt8o8nQ8kdEHIwwjt+3Meg05
         Qi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331020; x=1745935820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bs/aE9VBUtWkbTYcRJAW9cr2FVba/GqgJ4VTSr8qjZw=;
        b=RU4RI8FYhqjAP3UZEUUDl3j30TcXyU4nE1F71bMOb3c05WjE2XJxUn7G66RKZejiyk
         y/QjIQsbEyrxMtPCV4p5gABVCBnspgGmanRjY3f7AGbq/gxEcjC0srl8mA18QHyuO+T3
         X8EETf9MWtt0jKuPHj7TqRm2FUZpqMQ3TFIYNoKoMbyrWEhEiRnsmECwtl+4crvKmGUE
         /FWlrtcA9KoH7BFcFvt0zev+FAskELYbQ52b8DVxDZQep9EJxuXWyC2GDOrQHj8eZQUd
         lELQqbn0Alw9hNJF1PR+M/XY0Mm9U8MZSZqksD2E9x42N9t++z5lSRIzTQNo0y4YS3uc
         qthw==
X-Forwarded-Encrypted: i=1; AJvYcCXnDr5wopuRuPajWdu+wWn5I02+SIPoAB1wY/r1io+gpu+BpICc/F2YKOKzZCPZygeo5zDSub5uRHINhp13LVdB@lists.infradead.org
X-Gm-Message-State: AOJu0YzGI1E8SWGZCCSrYS9akdepcn2dVMaf45HY4B9j2R+TjVY96ZJA
	pkUR9WsKUGOetAkkZUD6xU05T6Cl0eBte8UIO3djSf0tfpmhGC4AhiG3N2FGb5c=
X-Gm-Gg: ASbGnctIw0Vn0kmblFigEKxD8avmhDSHYyYnptHk6O5llh4QdQPLH6k2PvAE3E+dYAx
	3JI1pwqimu0aqpo7mjD1nAejunhK8qKXRzfaGDq7cULIIYsAyMejx+HnG7GPmh3W8jy8qKHIuWD
	5woAh3Ui8iPLU+bXf1R1hsgx661Fa5r8O9RilkGdE8zH880Q+//Um0b+NuHxxOr9gNb7nikmLGC
	Pj+Nlq7HgqvUQ8wN02vcE7LAvDphe+77eNQb97vlDdZ0mPze0P4tpOvuGYE2fAwn44Z8yv43a6h
	uJElR7H3FeG8/Yg2vjpiKzxWT94/SMThgqWBeQ==
X-Google-Smtp-Source: AGHT+IGSxDHn1oc0UD2CkTcdu1FzGaJupZaMzOQ7CTorW8aiy1O1jrh0PHmOMnjcVt95Ys7UnKelxA==
X-Received: by 2002:a05:6402:1d4c:b0:5f4:c7b5:fd16 with SMTP id 4fb4d7f45d1cf-5f6239dd7b5mr15160699a12.6.1745331019689;
        Tue, 22 Apr 2025 07:10:19 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625592cffsm5911761a12.35.2025.04.22.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:10:18 -0700 (PDT)
Date: Tue, 22 Apr 2025 17:10:17 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/11] pmdomain: core: Export a common ->sync_state()
 helper for genpd providers
Message-ID: <aAejSTtrgufWInZk@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-8-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-8-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_071021_703857_4C9582F3 
X-CRM114-Status: UNSURE (   9.62  )
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

On 25-04-17 16:25:05, Ulf Hansson wrote:
> In some cases the typical platform driver that act as genpd provider, may
> need its own ->sync_state() callback to manage various things. In this
> regards, the provider most likely wants to allow its corresponding genpds
> to be powered-off.
> 
> For this reason, let's introduce a new genpd helper function,
> of_genpd_sync_state() that helps genpd provider drivers to achieve this.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

