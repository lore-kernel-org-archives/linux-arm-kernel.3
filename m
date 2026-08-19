Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C87C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2Nq6oWt/A+GglsE2R04tSZrXRfphvvWNtrnE+gHf8s=; b=NwxhJSYm2ZvmANu5gw6jLIRskE
	a3Ypb6gfvbj9FVzd+ilgXil2UBAHfgvwmM5htv5ZYZwLny1lz0YbbC9gjN7bankba/9zpk3pLjaHG
	uUMHg8lKCc9cnXiOFSr3tXNq0NeY6LaH2Goli7zjTO1rNutfA72EVB16YDcH1r5E4C3R6686YDnhb
	znzoFZF7rMUdpbMgnbUfNea5++TfEOAxT2s5pUHurP2XT9haXIO+zLQZeTgs7bTgQez7dZRFed978
	pyIHG85gtbaB+gMPBHaEvCBLFY88zFLh29AUyEBfVv88ePtG/RrJljR8npqr99wjC4qrcWNv2jWSw
	yXXzr3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnkd-0000000AYrv-20pd;
	Wed, 19 Aug 2026 21:23:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnkb-0000000AYqn-0xax
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 21:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2Nq6oWt/A+GglsE2R04tSZrXRfphvvWNtrnE+gHf8s=;
	b=b6h1Fv9r0ou5F5BvmXegQGdpgGcuz0wok8QZkDQriME3ijWFH/FJbi4B6wUv1QxmPlQ9y0
	l1wL+6OdWxSA8sdVtRawK7EG3kEX12vglc9pbLfdFtMQESG3YZUzPUOPZRWAPqjkETyxMa
	1XKMJ49u0FrX9lTNogXCbUfvWiP8XHU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-ZZz0C_8LPNywhu4WCk5c1w-1; Wed, 19 Aug 2026 17:23:06 -0400
X-MC-Unique: ZZz0C_8LPNywhu4WCk5c1w-1
X-Mimecast-MFC-AGG-ID: ZZz0C_8LPNywhu4WCk5c1w_1787174586
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efad04d884so28297446d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 14:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174586; x=1787779386;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2Nq6oWt/A+GglsE2R04tSZrXRfphvvWNtrnE+gHf8s=;
        b=b3bmijbKVw4sNL/iIxZ0CV8dnW+GlUoMWy/lWW86QeEeunml2121mS6Nqo6qUnzy6x
         IM2zuFl24Jhqr/oleM2blAJ7K4labA2D6tun07E0lu7+sNSPXDt6MwKGqiQ2Q3esejO2
         Cm8q8HZOmTnGJo+OPtNOOxQ2oMuAwPtinHIz6h6m8oQzGzlZpzKbt7+b82wWwrO11Hoa
         9y2hbM51xRfL+Yle6DPRfqVWB3LlpreYVaxuCx4jaq2F5GR+3HebUTqw0AFlGXqGmzkh
         na7c/6uoeCFxUb8aEWbp1qX61LUSmXWAlY+hQdaSyX2F2DiZJe0aqWOUezZap00dOED4
         fU2g==
X-Forwarded-Encrypted: i=1; AHgh+Rr69ohB+Jm794K3wtSaTicIi34zmkAmpBcTYXaYBZb+5xgT3dSJIXFly0sDP74YPxiLYksP4YacbhXcvJ4RRqzl@lists.infradead.org
X-Gm-Message-State: AFuF++njmEmJRoOOYSbzHncQapmxfvSzm8DgyzVxlZdnqTC+5DJc2Zy+
	wjbVeZf9+Q35fGNrcodAc/EKc6yQlT0nCJXEAvHCja3PWgUW6V9nsFgvpQS40+fqwWndExHUWpt
	wO6H6EA3PncVVbSe+ARdq/+/piywLyDGmZI0m8EQ4TSaDZYu4JdjCisXsQZK/gUZ23XfXIeN0kk
	YQ
X-Gm-Gg: AR+sD12ndKdjgCeIz873WYLmlGQwy6n2UKyNJpXinlVr9dtFwIGh1J4/Ls866jcNWd+
	jxT5J3kUfb7ExtiOGRM50cLbfUvFOwynq93q+o2KoqdhOg6BDyq5e0b7RhPRjGG6dw+7ZEppTgJ
	bCc02wNXRpgVVjOel5UALE39w7L6Wp4tNGXVhhCgNqfF3e1EpFu9XEpRbQ9oMuhYml+/Tn8l++0
	fcn8qhbL2wJWlLZU5wlYg/8YZETLrGvMvZa9iRZYZpo96HD5gOxQZv05cSXwAVhF2FNhxLBi9Ds
	rO4pxni2D8NL+LtyL9fpyPi26Mn6p5n1RSlioV/G8rFOXRfQvdvZc48JgmFBEvyzAANRgMolAWW
	KqN/NybPUyWZrDRCBvvMWHFkrR82YJPsm3tA=
X-Received: by 2002:a05:6214:260f:b0:90a:804a:968e with SMTP id 6a1803df08f44-90c5eb8132fmr77665696d6.32.1787174585751;
        Wed, 19 Aug 2026 14:23:05 -0700 (PDT)
X-Received: by 2002:a05:6214:260f:b0:90a:804a:968e with SMTP id 6a1803df08f44-90c5eb8132fmr77665056d6.32.1787174585342;
        Wed, 19 Aug 2026 14:23:05 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2a1139sm23455876d6.34.2026.08.19.14.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:23:04 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:23:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 5/5] spi: amlogic-spisg: Make sure clk_init_data
 is fully initialized
Message-ID: <aoYetnpb5fu2M9u6@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <9fb35ae0aedb7a6db0db6c78a8193c7602dd9d44.1787165329.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <9fb35ae0aedb7a6db0db6c78a8193c7602dd9d44.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QAkB0PIjBVmqx9OhviV_KD8PuvLFJlNSojo6p_9TbPk_1787174586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_142309_346644_AB8831C8 
X-CRM114-Status: GOOD (  15.40  )
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

On Wed, Aug 19, 2026 at 09:05:19PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> aml_spisg_clk_init() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: cef9991e04aed330 ("spi: Add Amlogic SPISG driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


