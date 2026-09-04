Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5231FC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foFTrG5K5GBINGP1ISszqyndvxgyaNt7XJ7LpKu6ReU=; b=SEPwxcLjF+Xjq+YSspaDV0E8wg
	9ci10WfwW6ErEldSVHZZ2Cvo0ME78EsGpIn4uk8IHckipA7tSlsG4cx1QNkvPnZXcaWNX7EEaOz1V
	DJ7bPZoc+6FFt43NKNCTBeb5ivME0nD6JaFLejjZJXTue8wGGKIoNK4FTEuPlRXooldIYJMMm1oAU
	T6iRj7sLuOieSuGSd53Lbhtm++fC0GOWfTiqOox70nbNPqIg15lfhNR62K0zR2FK8NSR8P6fderCQ
	zGMGHjA6q4urRESelrtj2Ov3as4O2TkT6gaCA5AYL8IPSM9BeB6p0Hr0hhW1zUFcZfipFV7nc7Zqi
	cIBg0zRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QLn-00000001YOI-0OkX;
	Fri, 04 Sep 2026 09:36:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QLk-00000001YN4-3uPm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 09:36:46 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c247f6687dcso122375866b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 02:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788514602; cv=none;
        d=google.com; s=arc-20260327;
        b=rl5Z+9mRVHNYd8FJjwg2bL6OtPMzTnsyD7qTD+qgy8r1sNwVh3haGOm+b7k1MUqQqq
         ROSidx84z9Vna4FF2kaLUdQEustxFoyRwWbhoOjRbNqlhzpz2UOec1hM/9Arse9SgQMg
         Q9It8iAqYFejI14bTxOruc59fg/iquOTYozPwZ1OK1WuYb0nzp58+H0ZjM9PmZma9s0/
         oK58jwyUCcq0hL/TsDNfNRwIru3izUX9xQMHdkmpE/9HP3+nS8ahF6vbJbrL46OUeeQT
         n79GHe4yskvtIbUkZCZDRbDJQ0Ixi1WQk0klzfRXWXc1NubTvhIJ4ifjI4lHdubRV+vy
         w+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=foFTrG5K5GBINGP1ISszqyndvxgyaNt7XJ7LpKu6ReU=;
        fh=xsMHg3+nLbQOSn14x0I9ETSUHN6+hPoED8i9rEoU1k8=;
        b=IoAUIr+UeU69hN2V1kCPycJH1Kcy0m7JiwOqJQFGuhbdOvbvNtckYvMvgJunI//VdR
         s6nF6j0iaqwhpmn/e1W2iGjqirUkT7C9poW3NrPz4GF8+0blKMvuYuyHemYzFGivfpre
         +vFMLpsVOo/nTymtR27Gjw/S/G5KpT+UlkMUo8abYcrBoP2YDafdTvTwGnfEyTxvjLKb
         V+QqRhw7Hp/le0g+eq3NofZjo7QRuKBOqyVsSUiGSFBvviPR8C2jCfC+3a08nhhkku+j
         6zK9pyRS5LO/14gciGpTumMadEFAnD72GT3akZlORJi+En7mU1Sjpfen1VTLlQW+Hvhh
         E8fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788514602; x=1789119402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=foFTrG5K5GBINGP1ISszqyndvxgyaNt7XJ7LpKu6ReU=;
        b=zfnkT7jihI7QOzzBg55Z0KT0PcQ2OCMi/P0HGcFpDHlggFDy1ql5/fAwu0zAci2Inc
         6U0z/KLj2H8oWh6Mcs6IL3rLmp7Auhv5GazG9fdVQYF1hyX+WAUkyU65yipeVlrQpA9k
         FXLwRexhj1acRBSFCpXC5nFKelYrNNlvI3Zf7raoBJRFM62kiGCJnG5Zd7aAyit44R0b
         mISGmykqCiF3ZQdSdCe382aOOQYKhbH0Y7J3MPlTqOx0gEWkeZxzZOgP9jagXLA7aNEI
         g3vrCGSqNoWZH+pilm5wMThLyGMa0B5SKyFCnzdKvP0uea4LcX/9k8OtbGdtq5kBhc/8
         2XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514602; x=1789119402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=foFTrG5K5GBINGP1ISszqyndvxgyaNt7XJ7LpKu6ReU=;
        b=r85MLMu0T4emNKz51mhww6cn6KW0+6ism94YR4Hw4PqF89uRcHxY+txqztyboXAfMA
         a6M4vMIl+gjJUvTVc7EfsiXkTgF2ss8eKhUucHDmRFDT1+F4ClhAPu3VrDvtN2J3lmzj
         5loDcaCZqNAlYK2ZWuUoBDk9b83CXCoPBGVRj59/lkAzkbCQ/47pC5YIjmp2HjXOL3jA
         DdLPefw2FRYVQLt/85qs4EnK0NAysubINHm6mtYdW4POD8qCZwZmqZw8lKs1dGi7XhCZ
         dOtLGv/bOq9P7tWG6fWGWoZINvuVtS0FrzCwctWV2uxNlfNMzCD2umZy7oMeqV2xgpUB
         eWxA==
X-Forwarded-Encrypted: i=1; AKwUvBztajZDpAGaH81zyyQBjA5n2Je7IJ5MEHCoNJPSm5d01NwiCx+lhrwXfedzto+N0obeCADG6D1NErfk5pLy2kbF@lists.infradead.org
X-Gm-Message-State: AFuF++kxGDsyjVvMdSjuKG91n7y9A2omrHYPadm/CuN3j2SQovZD79wq
	l9TJLDQljnbDZhBWOt3frPexB/KZRTc808G8IE53lkXrxvmZPlEfjvQYHiITxs1JnTXrB1WzMp8
	dTGlwsmiM6zFF7Yi8A5XMDGSXq5x9+oKLXExUDLYqKQ==
X-Gm-Gg: AYBFou2UaGuRScds1pSupSorkRBcpSHnUURZHvK0qLse7Nl3oVlZMQWZFzxEl0+F4M+
	CeHA5qkeCWyic/muZ0sRUeU/lMnt0bov9aFQnFKnjB5jKoZgUb5YlQjYT24RDLh/zQJ+bPhyJll
	nFws0rFig7Ot3SWHEzcAvpgBLP1pCwOXYw4pEAMM9yP7/nueeDkFhdfpQQW7PrhCc0aWJlzmpoB
	niEoCrJDuZ0Zdb6PYA92cve4WpInJayMIGs/nk6Dq1pvWFhonuVRHXKhBGPbm5tu7NAlyWEznM4
	XnjpKM2rOjYL5ATHWH5FwYnsvXJN/NPl4taE2meQP5xYzeD80f+scruZ3apxqeJ0VGA8XgwtpSN
	d
X-Received: by 2002:a17:907:fd17:b0:c26:1648:a069 with SMTP id
 a640c23a62f3a-c261648b781mr97301566b.36.1788514602405; Fri, 04 Sep 2026
 02:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260901234351.190506-1-anarsoul@gmail.com> <CAKTNdwFqSBt4QVCuYJxTyEDsxkW96JbUirFNAgJYWVLHzGpk4A@mail.gmail.com>
 <CA+E=qVcizyQZytw8M6DA72YGrRDDNx_cCvYj565zf9wjMWh8tg@mail.gmail.com>
In-Reply-To: <CA+E=qVcizyQZytw8M6DA72YGrRDDNx_cCvYj565zf9wjMWh8tg@mail.gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 4 Sep 2026 13:36:34 +0400
X-Gm-Features: AcwNN1WNG6-4w87ND0ZEi9BFf-EutUvUpsgbnymsPufvucLp1TkkKsdtlvZ3MeQ
Message-ID: <CAKTNdwFQvKtHQA0JD-GAq3bgr5Brq2NyLfccenkHcrKcjeptwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_023645_004669_AD9F4195 
X-CRM114-Status: GOOD (  23.44  )
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

On Fri, Sep 4, 2026 at 1:59=E2=80=AFAM Vasily Khoruzhick <anarsoul@gmail.co=
m> wrote:
>
> On Wed, Sep 2, 2026 at 1:43=E2=80=AFAM Alexey Charkov <alchark@flipper.ne=
t> wrote:
> >
> > Hi Vasily,
>
> Hey Alexey,
>
> > > diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip=
/clk-rk3399.c
> > > index c2b243d7a5e2..db241d2df625 100644
> > > --- a/drivers/clk/rockchip/clk-rk3399.c
> > > +++ b/drivers/clk/rockchip/clk-rk3399.c
> > > @@ -98,6 +98,7 @@ static struct rockchip_pll_rate_table rk3399_pll_ra=
tes[] =3D {
> > >         RK3036_PLL_RATE( 148500000, 1, 99, 4, 4, 1, 0),
> > >         RK3036_PLL_RATE( 106500000, 1, 71, 4, 4, 1, 0),
> > >         RK3036_PLL_RATE(  96000000, 1, 64, 4, 4, 1, 0),
> > > +       RK3036_PLL_RATE(  85500000, 1, 57, 4, 4, 1, 0),
> >
> > There is already an entry for 1368000000, which is 16x your rate, and
> > the 16x divisor should fit comfortably into the downstream clock's
> > 8-bit divisor field. Do you really need a separate PLL rate? Have you
> > checked what the hardware arrives at with the unmodified PLL table -
> > e.g. via /sys/kernel/debug/clk/clk_summary?
>
> See arch/arm64/boot/dts/rockchip/rk3399-base.dtsi, hdmi ref clock is
> wired directly to VPLL, and dw_hdmi-rockchip calls clk_set_rate() with
> pixel clock for ref clock, see
> dw_hdmi_rockchip_encoder_atomic_mode_set(). So at least in the rk3399
> case VPLL is supposed to support the required pixel clock. Without the
> first patch 1366x768 mode with 85.5MHz pixel clock is just rejected.

I strongly suspect that the dtsi doesn't describe the real clock usage
here. The TRM for RK3399 doesn't show any "ref" clock for HDMI, and no
TRM-documented VPLL users look like anything that could connect
directly to the HDMI controller.

I believe something is hardcoding the divisor (or leaving it at the
power-on default) in the actual DCLK of a VOP which the HDMI
controller uses, instead of modelling it properly as a mux (frac/div)
feeding off VPLL via another mux - both perfectly representable in the
clock framework and already envisaged in the clock driver, making the
PLL table patching unnecessary.

Can you please try re-pointing the "ref" clock at DCLK_VOP0 (or 1,
depending on which one your HDMI controller uses)? Your clock summary
already shows that something is assigning its parent to DCLK_VOPx_DIV
and the latter's parent to PLL_VPLL, so rate changes the current
driver code does on VPLL propagate to the muxed and divided downstream
consumer as a side-effect rather than as an actual rate request.

Best regards,
Alexey

