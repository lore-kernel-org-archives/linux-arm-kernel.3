Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76D9CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 15:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZv8lf2HlFMbPq29wrkvMcL46ITw+rgkk0A4gwUgT7k=; b=xXGFI7rY8W/tEiuxEy08IWs4z6
	Ifl/qQC8hzlhqwg7UWUVjro67oGW4IwjUIcrOHApe3FFKBS6pLAw5M8QK+heeNhHqn1Df34NG0CSD
	3OHPWbfF7PeErOQ6i/Ys4ThIltdbDmeT/li0m7jTDnXXDKdTosTLRCsEM6Gzh6SAXwskUhI29gBYm
	irA8EjQUFlLZpWfGE6+0mJSE+EaUGf8TF41evOkN34eqRzyc/3eniajptHFqXnrse9im12ODcrBP2
	JpzMkeNhwBRt3nuGZTZfeTeaelXW4RrLhiIeUqNppCYoCQmb3kP3xnPnOkZwI4teYMH5ZmwvbmFX5
	ZKWcLKHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbgam-000000058HF-3DyY;
	Mon, 22 Jun 2026 15:29:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbgak-000000058Gh-06LC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 15:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782142179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JZv8lf2HlFMbPq29wrkvMcL46ITw+rgkk0A4gwUgT7k=;
	b=Ve7CaDdV6Y79JyAHW3MwStgv6eqVizn7mNiEFNbkG82lYPvo2syGs6/XGpy4hKnVOWGPHU
	e+Ih2xBbEL3vJ1jaLNeKBH0nFGPzsjIttWsEi8jnGntW/qpWGprEK6QpJ3o2RsNOENIiMe
	k7puCzE+uJ5tTkpGth1CtKDsN0/mcoQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-yLfbJzkFOpyIABmB5ULuMQ-1; Mon, 22 Jun 2026 11:29:37 -0400
X-MC-Unique: yLfbJzkFOpyIABmB5ULuMQ-1
X-Mimecast-MFC-AGG-ID: yLfbJzkFOpyIABmB5ULuMQ_1782142177
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517d766e05aso244261cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 08:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782142177; x=1782746977;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZv8lf2HlFMbPq29wrkvMcL46ITw+rgkk0A4gwUgT7k=;
        b=Zt4buGG4ypFZoKUu1EFxCVnEEHAJ5c1umWqpE8/j+Fsfb8HEDac/OMO2qNISxwZsU1
         pz2cH2t2a5UwRX3Ovnrvwg13OVc10dSHyuHnNyCPlK/ePPvMjZC22tx9524mtOgijbKe
         4/BmO3c3soCnexLDWPWDRNek1JfrfGDLyFc57EjRcLq01xuNX3cz4Qj6HJJm38PwAINY
         gt0mfTkSZK+2BwUjMwug1YLh40knV/3YgYURXsKFn/92tjoQ0Iuf6MH32peoqJtRRujl
         atH+KT5+Qqc8xzNz736hdf/5gDESRZDDRbA3TR98nLZ8CN2OD8hRwjnHbgspKVtRg2O5
         FGtA==
X-Forwarded-Encrypted: i=1; AFNElJ8yS8QZacpLosps4X/rmCqAfyRVkZ+ihfasb161J09W0NrpB5dcVxZ1F0bXbQ9T5hjGM+jqSIabL3MFHWfsr6rN@lists.infradead.org
X-Gm-Message-State: AOJu0YzdeyO1ohOSDIjOm3SsWtEAU2D+8sDAnVwFGmQP2R7rwhj1K/XI
	3Sft/+phkvKpHcEVIOUuNaYn08ZLvRDVEwyeaMseFnFS8H8uwEfEPogGbwgx7iwE6wMbAThTFys
	bjHBcLCpBVk86K8uhPSzrCKRyITlIyPGXHSeTbNc3GuUc0JWhyKlNlUTvM+nvB2sGAX9xWajQTw
	VG9vgxv7BH
X-Gm-Gg: AfdE7ckSdRNiYnZbAQe5lGPX9+7wJRSbWXQNqfYBjT5N43WFMZTovFPHC6S8gXGi8UR
	yuf1anTxGtqDTGrQNiPiZyDl8FkwnDeLOyfwz1l98ynVzPqdsdeOJlZKW1LuqnF+aKwHP8pINlM
	ICxz/2aGUurqAYjtOcb0BHoATOh+36Hfg+b9GP2Ihz4N31HtBVip9oBzk8CHkxFt2VT/yGLJAxh
	H+lEB2xrwBiINUPSa5Klh9UzLfty28XG0WpCT9DQupym0Yfm+iEot6bvgtN+3bvQwN8rvJ92fAo
	Y/b24+To+5opOaRI/nphJMbU495X5j4HaoabJBpYiq6exN6RUAF7rIgf8PXORjc3f282H6reOgd
	C4VF6hEasHqRb3BEsB3O1iv9nWptf9+G75XcoE5hqi+Lp8w==
X-Received: by 2002:a05:622a:946:20b0:517:2a93:474a with SMTP id d75a77b69052e-51a514b9349mr336121cf.0.1782142176782;
        Mon, 22 Jun 2026 08:29:36 -0700 (PDT)
X-Received: by 2002:a05:622a:946:20b0:517:2a93:474a with SMTP id d75a77b69052e-51a514b9349mr335711cf.0.1782142176280;
        Mon, 22 Jun 2026 08:29:36 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a0984da98sm70349361cf.15.2026.06.22.08.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:29:35 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:29:32 -0400
From: Brian Masney <bmasney@redhat.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulfh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-sound@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mfd: db8500-prcmu: Fold dbx500 header into db8500
Message-ID: <ajlU3AsNUeviLuj8@redhat.com>
References: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Idx6yczEiEbRSulPhIt2D0Z15pzMXn9K7T0ByTfFJPI_1782142177
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_082942_141846_76E31048 
X-CRM114-Status: GOOD (  16.20  )
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

On Fri, Jun 19, 2026 at 10:27:10PM +0200, Linus Walleij wrote:
> Move the DBx500 PRCMU definitions into the DB8500 PRCMU
> header and delete the wrapper header.
> 
> Convert users of simple PRCMU wrappers to call the DB8500 helpers
> directly.
> 
> The dbx500-prcmu.h header was the result of an earlier attempt to
> abstract several DBx5x SoC PRCMU units to use the same abstract
> header. They are deleted from the kernel and this is not just
> causing maintenance burden and build errors.
> 
> The stub code is using -ENOSYS in a way checkpatch complains about
> so replace these with -EINVAL while we're at it.
> 
> Assisted-by: Codex:gpt-5-5
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606180825.vUSQntkJ-lkp@intel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>

For clk:

Acked-by: Brian Masney <bmasney@redhat.com>


