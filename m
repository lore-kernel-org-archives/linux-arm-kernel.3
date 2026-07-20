Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D66C44524
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFQlNZKrCEhOc+6aXOTGSVDcwURJmp18SbzxbmbgH5Q=; b=E9R7LncSla9GJwKVZ5GSfouXye
	p8p4EMw92EWdgEkS0pOiNWk/slsZQI/iNYru83sQNDYnB02yYMBjTbUf238tCYDQoulvOlGPPOyd2
	WdBlOOhHNjF8hRnp7LK7N5WsOCVK8oxysdQqTg5hi+S6lMxSnbzIKc5XH8SURquvWylZEPjkTqam5
	ixmm3gwdy/Q5/QluTcKPufBmUmY/0v2wUruX5kjPamOeoXIvQoKTwXRF1OOQkmFHiChZ+1FTcr4GW
	/4yS1+Zg7EIOHyaIJ9tS1b7jg0owISZWhBHJ1mOGbV3lBsr0vAhrC7Uak79gnTWelGKwqFcu5+JCN
	whk0SuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkBP-00000006HyJ-0Qjg;
	Mon, 20 Jul 2026 09:21:07 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkBM-00000006Hww-21Qm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:21:05 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-848593533cbso4120068b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 02:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784539263; cv=none;
        d=google.com; s=arc-20260327;
        b=VzX6SrSlYjoucQw5l6FZUOvCeFZZHX9kPvQJm92QX38qlwyLsG1MVNgTq/umOpeFR9
         8OVH9oj4tRcyJ79mIB64ZRFq5MA3sQujzICfKjnXvzfRVj6sFxT8xUtIYrJaK1+HuIsb
         qEObiGoywEl8k4iyxJrBxU0fhWjnA82nlY9uAcfeu7gXm+MXUI2o9lTrnNmlmvCoUYoy
         drHgdATOwzuA4WVhw/BX0R8SmvLWSFx+Y1dOtszX8hVHdf7JztqPPYVtkNX9jeVdqqVN
         ijoQ+/DL/UGhntbBJ8DtE830nqdfUs4lZBvJq2waQ7XzMJ6XG2k2hDfPz/aLpYEVte9R
         tt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kFQlNZKrCEhOc+6aXOTGSVDcwURJmp18SbzxbmbgH5Q=;
        fh=iXWop/rKuqjMpsM/d7dAb79mTMQSpYtu4R32VrhsjCU=;
        b=FaaPgmwJeLQty0hXpaCR+ZQu1IuHAvnVG3+CklK8FkS82sO3/ga5HASXXNgKIRj3iY
         axYQQGOZ10rO2Hl1/QJ5Va+KbYy9ZajWkqtU270ATimXXsSYYCSsbKrjZGgj//8YsnYL
         rMJBQoAsIZqMG3PPq9jl2CusflpZfOKSkB9urcDHU8TsSI1Zs1JGau+EV+cHzehwRHlD
         CsnO1AWVjQiOnWFdGGbax0s/AhmHO0YmhsLJd5/tOrKBB1rnMTt1q7qzOVEElV3yNfgm
         gNQG22rd7xUQm3HvY6ODYcfs5FzkV/vLxfBUQNqb+jRiXZA9r75kNjIytMIIKI5OexMu
         6zEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784539263; x=1785144063; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kFQlNZKrCEhOc+6aXOTGSVDcwURJmp18SbzxbmbgH5Q=;
        b=Mt916OKL4kVOC4pFGF7tByeATa/YmemQ5rKFAA6NyeXycCSUhJAfUUr+qv4erKmqQv
         DKp0e/WfhIfQgEBsYFAxdtkGppyQxe54UVoTp4bL/Ma/HxU+RDX8mh4LVoNZTkt203jE
         xe+Nlc0/RgWYesqyFiBWwFnLPTZS+yYJSYnkrv3n67aXCDNeYNuVTw0t0cCRroDTAaIX
         3BDX6zffpUEbXJWYuD3+LNvu2h7do8hdQXJcT40texQSbuKh+/C9eTrFAfEWNwJL+p5O
         gCJXuc5rYyxcLA3nXnGJ4ilOAx04C8iYaxqweXuzGD+diykwfx7nUyKAR/oEiHu4a8Wc
         y+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539263; x=1785144063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFQlNZKrCEhOc+6aXOTGSVDcwURJmp18SbzxbmbgH5Q=;
        b=VNtTkJAsfH4zJDwyyS+PLxI22fBhqPmSoQxKuIT9yoG6KpoZQP1Ft20C4IIMyDAQ8i
         bpQLdqIu43hpVYmraSSiYnGjHnA51zcLhAIwWORJ600zZIqbCUXOaswUya3j0Obdtn7/
         r093KrfIhSgGQ9fJdI6si49rZUL9IJZkmJ/hFJjGRvvFwKrEyKQt8HBq/hXKOf5ECs0C
         Ov4q1Y/roypRuItNMOdH978VB76w/cJY62ZZefvM6ckAlU+XQQrSV92CKJ47DU8Sx1TY
         0/VFDWt6e9gndHxfOPeteiiWBDETUrQDNwur+21kMHObyZMU73IAcOh/01t1gUowjcJF
         4B3w==
X-Forwarded-Encrypted: i=1; AHgh+Rrva6pMfBCF/BRE5sdwikXBS4XjfxYMRXqhm5UHis1Hhb7jVUqRUduiCuh9uvqIXUlXAsbQYyMVZtVT0JTjbPmx@lists.infradead.org
X-Gm-Message-State: AOJu0YzqmLfi1gGSa/6AMwJSemn/8vPYY6A6ubyX4SOkHO/Env9HPsNY
	WsQOzuH2UYH/HG7II5HKnp/rheR2hb5lfpycJC/7oNrEg8SYtK/dhUtkYx0npWfmruug84njkhK
	xTdjHDlgX4sO29vQFgC08ksvmoOFaOJe/9VVsjDdV1g==
X-Gm-Gg: AfdE7clp3sU6msjg+8KpHArU5Pr87vNTeQsa17Z5uhD9Jw1iMiFVn+W2rM2Qm1q3edp
	hSwtCPkGz7aGbzFi4qgMoVlq88zyGSCapEmthA0biGS1eh5IB6pRNlcGf0p+Xv3VlbQ+oZG4alQ
	mJTFaHHsEiCUJTS/1yxKtZpcF5dm48lYZUhlR9jaJXW3v7R55LoKAco2Bz7hUUGnmc/ct6IAUlQ
	3jYqp6Wr/+MbIfxzXOqXXDxfEDLDrNC7fW7mIkiXn9oxrAwZrLbeV7FxkcYKPU=
X-Received: by 2002:a05:6a00:3d4b:b0:848:7784:37d6 with SMTP id
 d2e1a72fcca58-84c295526eemr13782465b3a.58.1784539263267; Mon, 20 Jul 2026
 02:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260717-pwm_meson_convert_to_waveform_api-v1-1-d7dbdae1318d@baylibre.com>
 <20260717192735.3E71E1F000E9@smtp.kernel.org>
In-Reply-To: <20260717192735.3E71E1F000E9@smtp.kernel.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 20 Jul 2026 11:20:50 +0200
X-Gm-Features: AUfX_myvcar7qwuq7Xpd8sJoS8D_uPqo1YRJ3UYnt0Ec3GkeZR_OjanqrOWTVXw
Message-ID: <CAFGrd9rnPVAhiTJi964t0AH=1S8sjDWhy1U2iBs3aaQ=zk+85A@mail.gmail.com>
Subject: Re: [PATCH] pwm: meson: Convert to waveform API
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_022104_532925_B859D12A 
X-CRM114-Status: GOOD (  23.76  )
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

On Fri, Jul 17, 2026 at 9:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Truncation error in hardware waveform quantization breaks legacy=
 polarity inversion.
> - [Medium] Independent rounding in waveform readback produces an invalid =
state where duty + offset > period.
> --
...
> > +     if (meson->data->has_polarity && duty_cnt) {
> > +             u64 offset_cnt =3D mul_u64_u64_div_u64(fin_freq, wf->duty=
_offset_ns,
> > +                                                  NSEC_PER_SEC);
> > +
> > +             /*
> > +              * Waveforms with duty_offset_ns + duty_length_ns =3D=3D
> > +              * period_length_ns are implemented by inverting the outp=
ut:
> > +              * The signal then is low for hi counts (the offset) foll=
owed
> > +              * by high for lo counts (the duty cycle). Other nonzero
> > +              * duty_offset_ns values are rounded down to 0.
> > +              */
> > +             if (offset_cnt && duty_cnt + offset_cnt >=3D cnt) {
>
> [Severity: High]
> Could integer division truncation cause this check to fail for inverted
> waveforms?
>
> If duty_cnt and offset_cnt are calculated with independent truncation, th=
eir
> sum might end up strictly less than cnt even when the original lengths su=
m to
> the period.
>
> Would this cause the driver to incorrectly fall back to normal polarity w=
ith a
> zero offset?
>

At a sub-count boundary floor(duty) + floor(offset) can be cnt - 1 instead =
of
cnt, so an inverted request can indeed fall back to a non-inverted setting =
with
duty_offset rounded down to 0. That is a valid result, not a failure:
.round_waveform_tohw() must round every quantity down and only has to retur=
n a
waveform not exceeding the request (see the contract above
pwm_set_waveform_might_sleep() and pwm_check_rounding() in drivers/pwm/core=
.c).
duty_offset 0 <=3D requested duty_offset, so the result stays within the co=
ntract
and CONFIG_PWM_DEBUG accepts it.

The same count-based test is used by pwm-stm32.c (duty_ticks + offset_ticks=
 >=3D
arr + 1). So the conservative count-based check is intentional. No change.

> > +     /*
> > +      * wfhw->hi and wfhw->lo are u16, so their sum doesn't overflow a=
nd
> > +      * NSEC_PER_SEC * (hi + lo) fits into the u64 dividend in
> > +      * meson_pwm_cnt_to_ns().
> > +      */
> > +     wf->period_length_ns =3D meson_pwm_cnt_to_ns(wfhw->rate, wfhw->hi=
 + wfhw->lo);
> > +
> > +     if (wfhw->inverted && wfhw->lo =3D=3D 0) {
> > +             /*
> > +              * The output is constant low. Report a normal constant-l=
ow
> > +              * waveform instead of duty_offset_ns =3D=3D period_lengt=
h_ns
> > +              * which wouldn't be a valid waveform description. This
> > +              * setting is only reachable when the hardware was progra=
mmed
> > +              * by the bootloader as .round_waveform_tohw() never prod=
uces
> > +              * it.
> > +              */
> > +             wf->duty_length_ns =3D 0;
> > +             wf->duty_offset_ns =3D 0;
> > +     } else if (wfhw->inverted) {
> > +             wf->duty_length_ns =3D meson_pwm_cnt_to_ns(wfhw->rate, wf=
hw->lo);
> > +             wf->duty_offset_ns =3D meson_pwm_cnt_to_ns(wfhw->rate, wf=
hw->hi);
>
> [Severity: Medium]
> Since meson_pwm_cnt_to_ns() explicitly rounds up, can rounding duty_lengt=
h_ns
> and duty_offset_ns independently result in their sum exceeding
> period_length_ns?
>
> For example, if rate is 333333333 Hz and both hi and lo counts are 1,
> period_length_ns rounds up to 7 ns, while duty_length_ns and duty_offset_=
ns
> would each round up to 4 ns. Their sum (8 ns) would exceed the period len=
gth,
> potentially leading to integer underflow in consumers attempting to calcu=
late
> the remaining period time.

duty_offset_ns + duty_length_ns > period_length_ns is not an invalid wavefo=
rm.
The waveform API requires only duty_length_ns <=3D period_length_ns and
duty_offset_ns < period_length_ns (pwm_wf_valid() in drivers/pwm/core.c); t=
he
sum is deliberately allowed to exceed the period and represents the high ph=
ase
wrapping past the period end, i.e. inverted polarity (see the kerneldoc on
struct pwm_waveform in include/linux/pwm.h). For the example {period 7, dut=
y 4,
offset 4} both invariants hold (4 <=3D 7, 4 < 7), so it is valid.

The core handles it explicitly: pwm_wf2state() maps
duty_length + duty_offset >=3D period to PWM_POLARITY_INVERSED with
duty_cycle =3D period - duty_length =3D 3 ns, so there is no underflow. Rou=
nding
each reported value up independently is what pwm-stm32.c, pwm_th1520.rs and
pwm-axi-pwmgen.c do as well; it is required so that feeding the reported
waveform back through .round_waveform_tohw() reproduces the same counters.
No change.

Alexandre Mergnat

