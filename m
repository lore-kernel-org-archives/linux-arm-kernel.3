Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B60F54AA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZruyXZrbQHt3N4rmi80wfoanB43KDupr/dMlhmmcn8=; b=sXGxrcCrXAmZ3T6m7n2p3fR5zS
	FY41YJrwhreigTlXqA1GKy2N7N1bZZLiZpAJRPl+HOKpTMsayDIT3uHkzuZYvS3Pzc993rOkYEEo+
	MLQR2+5SvRO+lhk7J/znAe0KxDqe37jh93HU8gvKuTomZXrAUMeJTTf+gXocwidKAFHcV9wtOia1D
	QvM5+uhrV8vDj13DfM4TKsICNiF1ES6va+jIfqoBbJjV9EGTiiYKnk6V7OAdc6vtHqpdLF8TSF6PT
	7tVK34gx3g8UtThAQzZCzRK6Nt80s3aEyq90dQbJRu3OVKUd8yBERwrCMQ61jcB4s2TLeGRlx79qU
	rey+yFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51bv-00000001WSy-1q2w;
	Tue, 24 Mar 2026 13:15:55 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51bt-00000001WSK-3Yqi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:15:54 +0000
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6686697f578so2095407a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358152; x=1774962952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZruyXZrbQHt3N4rmi80wfoanB43KDupr/dMlhmmcn8=;
        b=cM3AjryAzTH5iJ/jfsXiAMJ1mUHoTvPSZyqqcs2zilcEXwVYmHgmOc8IEpYjmkMZHR
         /hA+GyPK14WAOoIxTQHDFz0ikgYWXBR2TkWY6o5+F2rHBwBBtdSPlgQlt7iJA8mRj5Uf
         EglBr1EQ2RsUnYvyldUDaZYP9evz29zj2T/gsPS5B7T+as+eWtptf0wGV5d7u7kwNNVO
         t4pgXidFPIUUbeP3ZXKNTgoCPKY6lVDxmItOhRZmkjlNQO8kkqQAZ7GALeuugQkE09Fl
         Op3uZFqelRDw3rP1EA1fQ60W/Ry3386KWb87rjBAiyHiuh+JSkfM76Rx8KZmRmvGOJdI
         Pq9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzV127+7xMM7P0KRSByuu5s+xs/FAn490PIaV2afOJ6TbN+RAyjHgN1dGtBP9r1PFrQXq2Q5Dxn0vt84nUwMZS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyp3QvdJ/eBZeq4eZ0pvRmHVV1jsdLpoRtLgd6YKqJcfeVyIII
	KErrP6gjLGE2Kq5+6/hiDurzGDRS8d/f/cUVlYEM56GieXzGvw+WnI5Muu/BDvQOyao=
X-Gm-Gg: ATEYQzw7+gykvPkkgJcRrCX/B8SltJ01/SRqhVuB+xbWOMkMxzBA745RMWiSqw/Vt1r
	DqEzV7s+RsivQi2bs/EBiCvnqsnk3hKD1wWYclYHzQj3LUqk8hufEFDQnI/WQx4siGyf61FL1fp
	XE5lvyfvi7sOB6VIUCQvZwgtPGXhTDcKQZ1coNtQkFDaWSHBD4FS8LQ60w4UlrX98vVyPsljXA8
	UNfOI4jMPrESQ0lRsDGjUybSomf/9P/YLzlkE57uTilSjCXyUoHMsZJsW3tjinN7kkWiLxF6G4q
	0F+21IdgX9XlqNMsEBWX6/K9ouM8YcNbVLZgw3NR3XAfWsouKY379Fv39b+cLSYtFelyTkntcuG
	InqaVBXNhRGgikQF/G/hI8rYbQxub+DcXhMxkb2EpabderapuUuXoCGx8TgiuZWu24rh6I+dRd6
	aSPPpDJFwbldhcnrPXrqmFOamSnk8t3w5qA1r5Qj03Xl4qrbtt0HrubHldv27m
X-Received: by 2002:a05:6402:3707:b0:66a:55eb:1cfc with SMTP id 4fb4d7f45d1cf-66a55eb1f5amr1088733a12.11.1774358151526;
        Tue, 24 Mar 2026 06:15:51 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d1cc8a17sm4636550a12.18.2026.03.24.06.15.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:15:49 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so171078166b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:15:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXazW4G89c4MwXe9/yhKpkUcOOQTegcg2FmWFTnsY92BrPyR6bBvRxUKxA8WXRu0bDvcOQ2B+SH2Z58dmOyc5bZ@lists.infradead.org
X-Received: by 2002:a17:907:2597:b0:b97:b20f:c5b2 with SMTP id
 a640c23a62f3a-b982f245b2fmr799019466b.9.1774358149303; Tue, 24 Mar 2026
 06:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
 <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla> <acJI7o79lVNMjV_d@pluto>
In-Reply-To: <acJI7o79lVNMjV_d@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 14:15:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcE439Cyn-TCoioLZXP-YpqObZ0UF8F2NvMCZ41eO6QQ@mail.gmail.com>
X-Gm-Features: AQROBzBnIg65Mgs2_Bw6h5VRtO1WdeEHkhxhLMRcr_UZnpHgg5vJ_aKHfWStJwE
Message-ID: <CAMuHMdVcE439Cyn-TCoioLZXP-YpqObZ0UF8F2NvMCZ41eO6QQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in scmi_clock_protocol_init
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_061553_899095_F7FA26AC 
X-CRM114-Status: GOOD (  38.47  )
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

Hi Cristian,

On Tue, 24 Mar 2026 at 09:41, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Tue, Mar 24, 2026 at 07:49:22AM +0000, Sudeep Holla wrote:
> > On Tue, Mar 24, 2026 at 02:24:14PM +0800, Peng Fan (OSS) wrote:
> > > On i.MX95, the SCMI Clock protocol defines several reserved clock IDs that
> > > are not backed by real clock devices
> > > (see arch/arm64/boot/dts/freescale/imx95-clock.h).
> > >
> > > For these reserved IDs, the SCMI firmware correctly returns NOT_FOUND in
> > > response to the CLOCK_ATTRIBUTES command. According to the SCMI Clock
> > > specification, NOT_FOUND is expected when a clock_id does not correspond to
> > > a valid clock device.
> > >
> > > The recent hardening added in scmi_clock_protocol_init() treats any error
> > > return as fatal, causing SCMI clock probe to fail and preventing i.MX9
> > > platforms from booting.
> > >
> > > Relax the check so that -ENOENT is treated as a non-fatal condition.
> >
> > I understand the use-case and the fix here, but still wonder if this
> > should be treated as quirk or handle it in the core. I am inclined to
> > latter as reserved SCMI clock/resource ID seems to be trend in its usage
> > and hard to classify as quirks.
> >
> > Cristain, agree or have a different view ?
>
> I was just replying...
>
> Looking at the spec 3.6.2.5 CLOCK_ATTRIBUTES
>
> "This command returns the attributes that are associated with a specific clock. An agent might be allowed access to only
> a subset of the clocks available in the system. The platform must thus guarantee that clocks that an agent cannot access
> are not visible to it."
>
> ...not sure if this sheds some light or it is ambiguos anyway...I'd say that
> NOT_FOUND does NOT equate to be invisible...
>
> ...BUT at the same time I think that this practice of exposing a non-contiguos
> set of resources IDs (a set with holes in it) is the a well-known spec-loophole
> used by many vendors to deploy one single FW image across all of their platforms
> without having to reconfigure their reosurces IDs ro expose a common set of
> contiguos IDs like the spec would suggest...
>
> Having said that, since we unfortunately left this door open in the
> implementation, now this loophole has become common practice
> apparently...

When I first read that paragraph, I was also confused.
What does "not visible" mean?
  - Not present in the clock ID space exposed to that client of
    the system?
    Yeah, multiple different sequences of contiguous IDs, depending
    on client!
  - Return failure on CLOCK_ATTRIBUTES?
    Which is what implementations seem to do.

The next step in the fun is when the system actually needs to know the
clock rate of such a clock...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

