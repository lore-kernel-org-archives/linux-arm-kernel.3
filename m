Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E8CC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 12:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pmRU4oV8Lwr70PJWkHKSc+JQWjhbwJ0zctlvUTldiE=; b=sQG6ZsCQ5JW203375oK5wRsj0O
	FUHdo8c/bA90Mvju5j382WfEkXXpw6kbe6LTOJsVNNxhZlFWtKO5C+yfRKPD1hBWcH6bXDKHTN62c
	aW3EwBbjgk9B71qKwxVweWep+uL9/r1Xzhp4Q5BgYAqVH1Fz42H/48XcB28hd9KTI8HsfTYIOw78z
	6183S04uWPOboCAz4ARVS3DYPdSPCjJvcg5Xgl8deSMlfq/Lv43NMhnmzqrYC5XOGdSrC7OLuAHC3
	rLE3LXUtQcxY2WGH4ITtpVcqi6xjYRw3g7xOXJH2a9u3gYAafECCJYDnsguHV3wIUKPNCq1URQKZZ
	ztwyAC7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjdq8-00000001mCk-0hkU;
	Sun, 16 Feb 2025 12:33:40 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjdof-00000001m5O-2TVy;
	Sun, 16 Feb 2025 12:32:11 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-471ebfbad4dso2081481cf.3;
        Sun, 16 Feb 2025 04:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739709128; x=1740313928; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pmRU4oV8Lwr70PJWkHKSc+JQWjhbwJ0zctlvUTldiE=;
        b=iU76+xzVetEmlFHRfQ354+AediFG60CubFTkehOUC1cdb8Bn03dFY41jr/vA6AvUte
         GVpXnBf/PAyut8MmCX0QpiCu7nEQ6cg+GyiXKDNpWGAYIESmj8NidmEz91QZ2cpwkmF8
         piJj6SSLwkFjSzbiFBVk1msdK1VTHzCOEA/kD5IkF/Js9L4vBf2gW261Uc/l4CG5fCEU
         jwWogPiRiviiUeg9hgnZEi3iBzNlDmzztXXXHdO/5nEdkgVGomqWlXi5xjsyof0+Lp1G
         scE79joS+TECLekAMczrZB5OofDXuFSB52eRxXDgYlPfxADGn8dvhwJcyPp55rxLfclv
         5zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739709128; x=1740313928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pmRU4oV8Lwr70PJWkHKSc+JQWjhbwJ0zctlvUTldiE=;
        b=j/IkSevVCbK9nB6Z0nTIiELtxIrk6kZueoMguTEPxK55vI5VprIQ0fNz3XSq2LNIWu
         HrRqSW5o7eHSaRv52zd488jknUY9MYhJzfXkWTODeBXHaYr7O7PM4GJtfBTlQkBtaPPk
         anh+L+cbdV1wIVzgCE1Tgoe/iWimTb/hPDlUsVVjR3g1Rz8jltCMYuK0EpniuryZpVjP
         3jYtJgsF68gc2MAJcpI4SuhH23aq84bl/l9KtM67Tu4dLq1lS+kKk5ciWmP3fNrkKxZb
         J6kGaMs6OykChW3UhfNU6pL7cwdFkpcv+JXpRPCvSyKv0q9R6AsyKSdpqU41tAnhg9yR
         phIw==
X-Forwarded-Encrypted: i=1; AJvYcCUd3EzXb2SEkjIkV4l15evsByWakaTBApJS9dfnTubDs4MPo8xBoCY3ytqYZfqqP1n8R7c3ExA1EA2BW0h5ZxQ=@lists.infradead.org, AJvYcCVShpn/ybERVBS2xMTlr1ISQMAlpxdiiCdp5RMoyX29KhUCn003qwgqAJO9Ph6a4Z7V5n3fcYKQBRQJM8VGdBlD@lists.infradead.org
X-Gm-Message-State: AOJu0YwRu/zIDCkQ8DzOUG8IjC+OHmhpKz/IUYBYerZ4da+Y+csorRk1
	YsKYziQ6r/xS6yRUAeT8sIlyUvCWXyOvtxzreJdTA0SMiwWjle48BnBGpToqCLVHo2Dkm732U77
	Eo9+MT3PFvw1uKDa7AvAX35Rmef4=
X-Gm-Gg: ASbGncv9+BVia+oh5ih/kxuYnJNhkXmCxrFTgBIW6jU+sATHY0Qr0CgMQLG2ORGuS33
	Tl8N9y4hd5J5ZA4NFyOsBrFOILUTGGWA3t1hvk8VVIKKqOfUhr6u/Oow+BqBxtJ9a2qR1TSnBEb
	A=
X-Google-Smtp-Source: AGHT+IHWuSE1Y3gFhYEtN+DZ/0JnI2ICnduM/7vMvfprywwSYgWgj2BhMei/y/cbzJAVNP5zlk73gFgjgP1Mp2EmMmg=
X-Received: by 2002:ac8:7e8d:0:b0:471:d132:f91b with SMTP id
 d75a77b69052e-471dbccbaa2mr79514361cf.3.1739709127957; Sun, 16 Feb 2025
 04:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20240617-rk-dts-additions-v5-0-c1f5f3267f1e@gmail.com>
 <d8ce8db2-1717-40f8-b53e-24cc71a758c9@cherry.de> <CABjd4Yw-r-ogfwcrph4K1wbkybS25gk6LFg8wpqLG27uWdybNA@mail.gmail.com>
 <2914631.KiezcSG77Q@diego>
In-Reply-To: <2914631.KiezcSG77Q@diego>
From: Alexey Charkov <alchark@gmail.com>
Date: Sun, 16 Feb 2025 15:32:01 +0300
X-Gm-Features: AWEUYZnpDb3wjAorVn4kGg8idUTWI0ik5GUkTOikdcLRJ5KAatVLRX81_8fVTX4
Message-ID: <CABjd4YxF4N1tAgGUZk-oKkMUO+Q9rWHZsas9gMQdJ+TF4A1=NA@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] arm64: dts: rockchip: Add OPP data for CPU cores
 on RK3588j
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Dragan Simic <dsimic@manjaro.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_043209_639324_BBBBF20E 
X-CRM114-Status: GOOD (  47.53  )
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

Hi Heiko,

On Sat, Feb 15, 2025 at 11:30=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.d=
e> wrote:
>
> Am Samstag, 15. Februar 2025, 19:59:44 MEZ schrieb Alexey Charkov:
> > On Tue, Feb 11, 2025 at 7:32=E2=80=AFPM Quentin Schulz <quentin.schulz@=
cherry.de> wrote:
> > > On 6/17/24 8:28 PM, Alexey Charkov wrote:
> > > > RK3588j is the 'industrial' variant of RK3588, and it uses a differ=
ent
> > > > set of OPPs both in terms of allowed frequencies and in terms of
> > > > applicable voltages at each frequency setpoint.
> > > >
> > > > Add the OPPs that apply to RK3588j (and apparently RK3588m too) to
> > > > enable dynamic CPU frequency scaling.
> > > >
> > > > OPP values are derived from Rockchip downstream sources [1] by taki=
ng
> > > > only those OPPs which have the highest frequency for a given voltag=
e
> > > > level and dropping the rest (if they are included, the kernel compl=
ains
> > > > at boot time about them being inefficient)
> > > >
> > > > [1] https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96=
c734f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > > >
> > >
> > > Funny stuff actually. Rockchip have their own downstream cpufreq driv=
er
> > > which autodetects at runtime the SoC variant and filter out OPPs base=
d
> > > on that info. And this patch is based on those values and filters.
> > >
> > > However, they also decided that maybe this isn't the best way to do i=
t
> > > and they decided to have an rk3588j.dtsi where they remove some of th=
ose
> > > OPPs instead of just updating the mask/filter in their base dtsi
> > > (rk3588s.dtsi downstream). See
> > > https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c734f2=
fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> >
> > Funny stuff indeed! Judging by the comments in the file you
> > referenced, those higher OPP values constitute an 'overdrive' mode,
> > and apparently the chip shouldn't stay in those for prolonged periods
> > of time. However, I couldn't locate any dts file inside Rockchip
> > sources that would include this rk3588j.dtsi - so not sure if we
> > should follow what it says too zealously.
> >
> > > So...
> > >
> > > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > > ---
> > > >   arch/arm64/boot/dts/rockchip/rk3588j.dtsi | 108 +++++++++++++++++=
+++++++++++++
> > > >   1 file changed, 108 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi b/arch/arm64=
/boot/dts/rockchip/rk3588j.dtsi
> > > > index 0bbeee399a63..b7e69553857b 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> > > > @@ -5,3 +5,111 @@
> > > >    */
> > > >
> > > >   #include "rk3588-extra.dtsi"
> > > > +
> > > > +/ {
> > > > +     cluster0_opp_table: opp-table-cluster0 {
> > > > +             compatible =3D "operating-points-v2";
> > > > +             opp-shared;
> > > > +
> > > > +             opp-1416000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1416000000>;
> > > > +                     opp-microvolt =3D <750000 750000 950000>;
> > > > +                     clock-latency-ns =3D <40000>;
> > > > +                     opp-suspend;
> > > > +             };
> > > > +             opp-1608000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1608000000>;
> > > > +                     opp-microvolt =3D <887500 887500 950000>;
> > > > +                     clock-latency-ns =3D <40000>;
> > > > +             };
> > > > +             opp-1704000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1704000000>;
> > > > +                     opp-microvolt =3D <937500 937500 950000>;
> > > > +                     clock-latency-ns =3D <40000>;
> > > > +             };
> > >
> > > None of those are valid according to Rockchip, we should have
> >
> > Well, valid but more taxing on the hardware apparently.
> >
> > >                 opp-1296000000 {
> > >                         opp-hz =3D /bits/ 64 <1296000000>;
> > >                         opp-microvolt =3D <750000 750000 950000>;
> > >                         clock-latency-ns =3D <40000>;
> > >                         opp-suspend;
> > >                 };
> > >
> > > instead?
> >
> > I dropped this one because it uses a lower frequency but same voltage
> > as the 1.416 GHz one, thus being 'inefficient' as the thermal
> > subsystem says in the logs. It can be added back if we decide to
> > remove opp-1416000000.
> >
> > > and...
> > >
> > > > +     };
> > > > +
> > > > +     cluster1_opp_table: opp-table-cluster1 {
> > > > +             compatible =3D "operating-points-v2";
> > > > +             opp-shared;
> > > > +
> > > > +             opp-1416000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1416000000>;
> > > > +                     opp-microvolt =3D <750000 750000 950000>;
> > > > +                     clock-latency-ns =3D <40000>;
> > > > +             };
> > > > +             opp-1608000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1608000000>;
> > > > +                     opp-microvolt =3D <787500 787500 950000>;
> > > > +                     clock-latency-ns =3D <40000>;
> > > > +             };
> > > > +             opp-1800000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1800000000>;
> > > > +                     opp-microvolt =3D <875000 875000 950000>;
> > > > +                     clock-latency-ns =3D <40000>;
> > > > +             };
> > > > +             opp-2016000000 {
> > > > +                     opp-hz =3D /bits/ 64 <2016000000>;
> > > > +                     opp-microvolt =3D <950000 950000 950000>;
> > > > +                     clock-latency-ns =3D <40000>;
> > > > +             };
> > >
> > > opp-1800000000 and opp-2016000000 should be removed.
> > >
> > > and...
> > >
> > > > +     };
> > > > +
> > > > +     cluster2_opp_table: opp-table-cluster2 {
> > > > +             compatible =3D "operating-points-v2";
> > > > +             opp-shared;
> > > > +
> > > > +             opp-1416000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1416000000>;
> > > > +                     opp-microvolt =3D <750000 750000 950000>;
> > > > +                     clock-latency-ns =3D <40000>;
> > > > +             };
> > > > +             opp-1608000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1608000000>;
> > > > +                     opp-microvolt =3D <787500 787500 950000>;
> > > > +                     clock-latency-ns =3D <40000>;
> > > > +             };
> > > > +             opp-1800000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1800000000>;
> > > > +                     opp-microvolt =3D <875000 875000 950000>;
> > > > +                     clock-latency-ns =3D <40000>;
> > > > +             };
> > > > +             opp-2016000000 {
> > > > +                     opp-hz =3D /bits/ 64 <2016000000>;
> > > > +                     opp-microvolt =3D <950000 950000 950000>;
> > > > +                     clock-latency-ns =3D <40000>;
> > > > +             };
> > >
> > > opp-1800000000 and opp-2016000000 should be removed as well.
> > >
> > > Did I misunderstand what Rockchip did here? Adding Kever in Cc at lea=
st
> > > for awareness on Rockchip side :)
> > >
> > > I guess another option could be to mark those above as
> > >
> > > turbo-mode;
> > >
> > > though no clue what this would entail. From a glance at cpufreq, it
> > > seems that for Rockchip since we use the default cpufreq-dt, it would
> > > mark those as unusable, so essentially a no-op, so better remove them
> > > entirely?
> >
> > I believe the opp core just marks 'turbo-mode' opps as
> > CPUFREQ_BOOST_FREQ, and cpufreq-dt only passes that flag along to the
> > cpufreq core. But then to actually use those boost frequencies I would
> > guess the governor needs to somehow know the power/thermal constraints
> > of the chip?.. Don't know where that is defined.
>
> personally I don't believe in "boost" frequencies - except when they are
> declared officially.
>
> Rockchip for the longest time maintains that running the chip outside
> the declared power/rate envelope can reduce its overall lifetime.
>
> So for Rockchip in mainline a "it runs stable for me" has never been a
> suitable reasoning ;-) .

My key concern here was perhaps that we are looking at a file inside
the Rockchip source tree which looks relevant by the name of it, but
doesn't actually get included anywhere for any of the boards. This may
or may not constitute an endorsement by Rockchip of any OPPs listed
there :-D

I haven't seen a TRM for the J variant, nor do I have a board with
RK3588J to run tests, so it would be great if Kever could chime in
with how these OPPs are different from the others (or not).

> So while the situation might be strange for the rk3588j, I really only wa=
nt
> correct frequencies here please - not any pseudo "turbo freqs".
>
> I don't care that much what people do on their own device{s/trees}, but
> the devicetrees we supply centrally (and to u-boot, etc) should only
> contain frequencies vetted by the manufacturer.

Fair enough. Let's just try and get another data point on whether
these frequencies are vetted or not.

Best regards,
Alexey

