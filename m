Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2454C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKW5gFGH/771IARNO8a+Mk4z1dF2QiKqn10sOpp4x8M=; b=j1QG9bVv4SdJjz8zRALzGU74Yx
	RxtqNu+8rgwYlcY+Tk0RvYESwLC1ad/9nybHcIUEVw4LQXawac3vnkpiyBeHQyoNo7QcO1YzSvPYF
	LttHPpfo8WZBgfNC8ctIIXgJGLOm3P2qO/secBarVqmxc6V1/KcdhfMJb21dDycFFL5GrEokbageM
	MPr4cxEMSErGf113UrT/uPM0BBiO3YVbaoo/5WLcdeR8R8yN0xK43cbM0cFH8yUppnMkVJ+JymvvT
	ZVUln/vSXKO3oQDeUPPhE60Gca7FI1sXvyqVDS6JgVuRRY8hxSqqzBqLi2uiRJBqbFmKKrYxIYVsR
	Mn+3gdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whR9M-0000000H4WP-27qm;
	Wed, 08 Jul 2026 12:13:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whR9K-0000000H4UT-0wvH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:13:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493c83474ddso5306905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783512788; x=1784117588; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKW5gFGH/771IARNO8a+Mk4z1dF2QiKqn10sOpp4x8M=;
        b=ixgMBob0LEhAgT8kdsUmd+ZXIWgCZ4YgsTuj6k9oej4Eb0/Juy8bxCcniEOmlhDU5/
         +ksGKzjok6ZE8WCTTzrO2h91DXkAmJjyDKlZr2Q7/8Diaxvwhj5XxP1NTWEaP37jw2eI
         RaajJoXbIQhdIC4kJ/chaAQ+eWfd87gqXo/I4WnbV48IK4yxiJxNKiyKkaX2OgJ8awhu
         omL82dFB3/XCm0UHIBaqjfZ55+vGUS4yIFcznYznnwQhEu13/WP0mVroN/P9wWKN6vBq
         nnFyQ8VYp8mcGw9y25eFdGaCQoKx8M6stVj9Oc2DHUvprLDVQUMXaxmTCRX/d09yZZtX
         9jBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512788; x=1784117588;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eKW5gFGH/771IARNO8a+Mk4z1dF2QiKqn10sOpp4x8M=;
        b=LOmKCJ4hUOHouICzndwyJJ8yL9+uykZKcO3b5Hw5wBb6zULpKlayvurkniC3YnF2sn
         TxxCf1Umd/fAKUjA1RLXIFbqV9aVK9p4bPN0itFQ2rUwp6cYTDfLYmw1CCJUmwRwG9Vt
         J+3RPYU4WhNX/iJbHVYkS/DnaQiKjKPGBR4K28Y6/lamn7ze4XpqeF74VkM7OxP39HbW
         E4c5ZI2zREKfczERh2Pn8VdfnvDKiSMbiSa5eF4kGUHISioscTv/3wnMn2JpQoRKcyCX
         w15IVUCs+3Zy6uqtNbNhqVXlp42M6C0REtIJRSwln8rBkj8RCpcz0RlYPspRCyrRoIMH
         I1fw==
X-Forwarded-Encrypted: i=1; AHgh+Rqe2rtHTXq+v88FwAY0V7id5Q1GOTCpw1Bt1+w5WQzcWhXhmtvh7vYPH0HWogmdUCk12oIY3PIQOLPgVlWGgMmW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnzt6z06LaOa9X0LyNrb11mCR1JPgfHGgw4hGwKUnzVldDmSpF
	9tLWkHWGLzPOvbaBeAxo8FYpukulV0XZ7MEG94P3p8VRgnnqiNM5oaBL
X-Gm-Gg: AfdE7ckduIslEbMkCKXQdEAnkA71ebb4dRepOVB5YOCmEYYg3Co4nNCojPr4CK0Ifhs
	caJECWh3UK8VuaoYaHY3crWYpSsoTsEBSxCibAOjJTVXMYJKd1SmFjeHAkqZ9atfqIpa8gMkmg1
	IHKr97Dvgb+Mk/rz94YjV9cfQo3cMcN033YlqisaJkgC9lwVZ+5zZgmhmq5kyauhv1mJO68yswZ
	tNVBDA2MDF/69cDn886K81OlOk9BdHkQbEU25YTfQMNtiTrtG5zgmc0WENoNBEv4iqeNDG7a9SP
	OGsWOP0XJakmJwuJv9OmFaWhm/Mr97O4RAzO5IvW2e58pQNNGC1gXfJCV1vJa2HtuQkk3W3Ras1
	jJJKVi3lYN/mBfkD/KPNKMFuTqP+Wi9uwE39yiTTz/ab87rGbvClxFNZ4a8VtTHQtVTavK2ePLq
	PwFRIl7YWZ
X-Received: by 2002:a05:600d:8498:20b0:493:d115:d835 with SMTP id 5b1f17b1804b1-493e68b8094mr18294835e9.8.1783512787657;
        Wed, 08 Jul 2026 05:13:07 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:d412:a0e9:ab11:7221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a572c3sm64268235e9.1.2026.07.08.05.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:13:07 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:13:05 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: Adam Thiede <me@adamthiede.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
Message-ID: <ak4-0SkPaeU3N2lh@owl5>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <42607fa4-485d-4142-b31c-7bfac71118d2@adamthiede.com>
 <ajka2220depklK1_@owl5>
 <bac79214-050d-448b-be63-0586d45c807d@adamthiede.com>
 <f0d99b1a-e383-4d14-adb1-4ccab46efddb@leemhuis.info>
 <5baeb90d2c3736df67ad075ede4ac765bfeaed2d.camel@mediatek.com>
 <84233951-ee22-4980-9f17-2af1df51fdbf@leemhuis.info>
 <6fed12a6-0c94-477f-8a2e-466c33ea2e29@collabora.com>
 <dbc251f2-0c67-4970-a101-c19129055082@adamthiede.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbc251f2-0c67-4970-a101-c19129055082@adamthiede.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_051310_298583_CA181CD8 
X-CRM114-Status: GOOD (  56.90  )
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

Hi Adam,

On Tue, Jul 07, 2026 at 08:25:41PM -0500, Adam Thiede wrote:
> On 7/7/26 05:38, AngeloGioacchino Del Regno wrote:
> > On 7/7/26 10:51, Thorsten Leemhuis wrote:
> > > On 7/7/26 04:20, CK Hu (胡俊光) wrote:
> > > > On Mon, 2026-07-06 at 12:16 +0200, Thorsten Leemhuis wrote:
> > > > > On 6/22/26 15:23, Adam Thiede wrote:
> > > > > > On 6/22/26 06:22, Gary Bisson wrote:
> > > > > > > On Thu, Jun 18, 2026 at 04:06:28PM -0500, Adam Thiede wrote:
> > > > > > > > On 1/20/26 05:36, Gary Bisson wrote:
> > > > > > > > > Some bridges, such as the TI SN65DSI83, require the HS clock to be
> > > > > > > > > running in order to lock its PLL during its
> > > > > > > > > own pre-enable function.
> > > > > > > > > 
> > > > > > > > > Without this change, the bridge gives the following error:
> > > > > > > > > sn65dsi83 14-002c: failed to lock PLL, ret=-110
> > > > > > > > > sn65dsi83 14-002c: Unexpected link status 0x01
> > > > > > > > > sn65dsi83 14-002c: reset the pipe
> > > > > > > > > [...]
> > > > > > > > 
> > > > > > > > This commit was part of 7.1 and caused a problem for me.
> > > > > > > > I'm running postmarketOS (basically Alpine Linux) on a Lenovo C330
> > > > > > > > chromebook with a Mediatek MT8173 processor.
> > > > > > > > The problem: when the display on my laptop
> > > > > > > > powers off (via suspend or
> > > > > > > > idle,
> > > > > > > > like xset dpms off) the picture does not come back when the display
> > > > > > > > powers
> > > > > > > > back on (from resume). The display backlight
> > > > > > > > comes on and brightness is
> > > > > > > > adjustable but there is no picture. The only fix is to reboot.
> > > > > > > > 
> > > > > > > > Reverting this commit and applying it as a patch on top of 7.1
> > > > > > > > addresses the
> > > > > > > > issue for me.
> > > > > > > > 
> > > > > > > > You can view the config I'm using here:
> > > > > > > > https://urldefense.com/v3/__https://gitlab.postmarketos.org/
> > > > > > > > postmarketOS/pmaports/-/__;!!CTRNKA9wMg0ARbw! jrsPDtSEUdaINzLlq92Li8gmsEBkTOxZ6WUzNHjvIN6CyOJjHiHkNSOhIRPXFTLPlaYlxU2uvryVkwjUAN9bmax5$
> > > > > > > > merge_requests/8819
> > > > > > > > 
> > > > > > > > Is there any sort of testing or other debugging
> > > > > > > > info I can provide to
> > > > > > > > help
> > > > > > > > address this issue?
> > > > > > > 
> > > > > > > Thanks for reporting the issue, could you share some
> > > > > > > logs? Is the driver
> > > > > > > saying anything during resume? Also, what type of
> > > > > > > panel is used on that
> > > > > > > chromebook?
> > > > > > 
> > > > > > The curious thing is that there are no real logs in dmesg or /var/log/
> > > > > > messages about this. This picture just fails to come
> > > > > > back. If there are
> > > > > > some kernel params I can set to get deeper logging, that
> > > > > > would help, but
> > > > > > I'm not aware of any.
> > > > > > 
> > > > > > I think the panel is a "BOE NV116WHM-T00" - I used this command to get
> > > > > > info: cat /sys/class/drm/card0-eDP-1/edid | edid-decode
> > > > > > 
> > > > > > Output:
> > > > > > https://urldefense.com/v3/__https://termbin.com/8nbd__;!!
> > > > > > CTRNKA9wMg0ARbw! jrsPDtSEUdaINzLlq92Li8gmsEBkTOxZ6WUzNHjvIN6CyOJjHiHkNSOhIRPXFTLPlaYlxU2uvryVkwjUAJooSyqL$
> > > > > 
> > > > > This looked stalled. If I'm mistaken here, please let me known; but if
> > > > > no solution is in sight, should we maybe just revert the change until a
> > > > > proper was found?
> > > > 
> > > > It's welcome anyone to provide a revert patch,
> > > > but I would still wait for the fixup patch until 7.2-rc4.
> > > > If no fixup patch exist, then apply the revert patch.
> > >  From my understanding of things the position in the devel cycle doesn't
> > > matter much in a case like this. To quote Linus statements from
> > > https://www.kernel.org/doc/html/latest/process/handling-
> > > regressions.html#on-how-quickly-regressions-should-be-fixed
> > > 
> > > """
> > >  From 2026-01-22:
> > > 
> > >   But a user complaining should basically result in an immediate fix -
> > >   possibly a "revert and rethink".
> > > 
> > > With a later clarification on 2026-01-28:
> > > 
> > >   It's also worth noting that "immediate" obviously doesn't mean "right
> > >   this *second* when the problem has been reported".
> > > 
> > >   But if it's a regression with a known commit that caused it, I think
> > >   the rule of thumb should generally be "within a week", preferably
> > >   before the next rc.
> > > """
> > > 
> > > Adam reported the problem about three weeks ago, so we are way past the
> > > "rule of thumb" timeframe Linus set.
> > > 
> > > Ciao, Thorsten
> > 
> > This is a kind of odd situation here. The fix from Adam is actually
> > correct, as in,
> > the SN65DSI83 bridge gets broken without...
> > 
> > ....but then, there's some more oddness going on: I tried to reproduce
> > this on my
> > MT8173 Elm device, but there I can resume the system just fine, and the
> > display is
> > up and running like normal?
> > 
> > I'm not sure what to advice here at this point - just adding some info.
> > 
> > Cheers,
> > Angelo
> Angelo, would you mind sharing your config, and the details of what you're
> running? It might be a configuration difference.

As a FYI here is the latest branch I tested that patch on:
https://github.com/gibsson/linux-next/commits/master-mtk/

As far as I remember suspend/resume was ok. It was tested with a
Tungsten510 SMARC SOM (MT8370) + sn65dsi83 + tm070jdhg30 display.
Both the bridge and the display are mainline, you can see that the main
change is in the defconfig where a bunch of options are changed to be
built-in (for NFS booting).

I'll try to repro against latest kernel this week and report back.

In your case, is the panel upstream as well?

Regards,
Gary

