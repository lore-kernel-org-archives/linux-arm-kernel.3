Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69A4CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Dg/fQKFRKiQFhT9w/Pj60e36nurv4DmYNa63cuyXbQ=; b=rifEksY6YYF5qGElCUTbVyZQku
	KKa3UlFEfjO5esT/nIwzaHgTOC/VZ86e8K/hcWT5TS2tERQTQPpVnLdvcqa9IO1Gp8ZLBmhA/3N24
	asi2+WUd6EowGnaSjTynqJ5bHMQgxy9//SL6q3XX6O4AZ5ZAhMFMjufd8KugnaPtj8YJnAXmQ4Ai1
	NNDc3R0jvphSCmdlECuXSFwccBt+u1UkWpBrMEJn+ijb4Ve+fKGdZ/3CeDc6kJXZFbwXSgxDXhSyK
	oJ6mM9i/8c0n1w8WhBZxhNFEPMQbEHhidwO7IL41BjOH7o74AWSVlyoIy1JGZ/6WWdFp/4+ixq2ty
	9zXFSX5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIyL-00000007mG5-0JZ3;
	Wed, 10 Jun 2026 13:27:57 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIyH-00000007mEl-0Shj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:27:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4600cbb06deso3730705f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781098071; x=1781702871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Dg/fQKFRKiQFhT9w/Pj60e36nurv4DmYNa63cuyXbQ=;
        b=Ij40Mum91ArJmAKd1qQWIakdq063WO4KV3ZhAtOgL4RPn0QSCvIxL4eE5Qj6uaz1DG
         hejjWYFEsdURxrtwr54sIZdBJakQio65bk7cXMkMy0MDGK3wvLB45jgzEjEReJnNxl5X
         roQ0+dkD6zh3kk9gz8FzBeKaK3Kxf6A814CyR7dNy17upfeWh/89KKRAWMk0wDs+KnIc
         e5sMf22TUEiOA8HPuc/A3GIfnUmdF7WlZCNl1E8EiNMVVvxhOEBBg5em8s9kCG8UAFPL
         c5V/PcfRfhYGlx6W3w5PRsnBoR71xkKYrw0WpBady/Qz+V3yHcbB1CZqsv/S13dBsp2W
         hlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098071; x=1781702871;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Dg/fQKFRKiQFhT9w/Pj60e36nurv4DmYNa63cuyXbQ=;
        b=A6ohrLuvungZhLwe0efF1O2kaLDpMXJbn38K78TbVPUW1tkhJCCQPiOpu7Qia+ctIH
         RN1KDoCYJ59bGsQuikBpbZLzBIdwvNdYHGDYKVCnMAanrknAfHh0AH7bJtIvRuuDsH5x
         k4jZwnQopaH1dN/YHP0z28rrrdeE5I0oFp5DUthhl33u/QqNuhbGEYzVu/zhIL6pOf1T
         tl8Cs5sH4/olz9OrBD0xcb0G4CIhiVWGSDuf9xlEUR+13pbgTuVDq8JsMOTfT6ovtLOF
         dx5f0BNDfVXOhB8LDJrWJdv67YEQZa5ebnqnrhirK9f3smATs/rNBh00CFH0x+XyB8bW
         Bq+A==
X-Forwarded-Encrypted: i=1; AFNElJ+4GdxP9CnPOUT10zYK3KaZHNxzCwgd1m+50rxWjXoEHhMII6Xd6xAg/tgWh0cuJzm5GCprygZZiKKksgo9B2Q7@lists.infradead.org
X-Gm-Message-State: AOJu0Yybn1DHVElqLmNNZp1lWii1jxJ7GZznISpsoBwyz98LM9pv/Hi4
	YZkGF2hhJ7MIi8yQ9obFvjONS1WHq3Jy/CPUm15IdDj7SnyQbNR61spXyQrawEHroCE=
X-Gm-Gg: Acq92OFiIN+861RjFyFYL1f30V1pYy57jX2o8tKvW7oj58wyTZox39QSxoJutJap0BU
	1WZRU/+kixf7B2T5AiV4JhLH4nEMhsR/QKXIZGu3pyVD0S2yW9PLS0mFo6cvAwVmxAAwKOlhlcI
	uV7kBRnfeLYbSZeIiFH9AqZ42LtrOKC+Ob05ZNo5zgO1L/VKYC+c+KsSQuSy0Hzd8K/Z9y5OvpT
	evx1Pi7t5VpbZrguVOGTsmK8oTIfeDYFARoDr+0JtlC+blsYVvTmoqH5zG8RLjwNNMnkvK8muAv
	vz/O3fC0g6y6zG0pdiH2PCz1dwOgUGimR9HSDJSiRuHEdu1NImvJ76FxPrQ5FJj8UzqtJ9TAyuy
	6vkPJJFNH3vWHB9cnAx74+CxKEg3B05DOARYrkOFZYdirtNcDPm/UsoNleWdIPb4f7qGgKrfIPB
	eNw5pn+Uyp+4MqOyH4haNTi6KtQ9wxv3JO
X-Received: by 2002:a05:6000:400e:b0:460:18cf:d49b with SMTP id ffacd0b85a97d-46032dabbc0mr33050153f8f.15.1781098071144;
        Wed, 10 Jun 2026 06:27:51 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c371:18ed:9599:7f5f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f2eadefsm74272179f8f.11.2026.06.10.06.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:27:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format
 I2S output data
In-Reply-To: <a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com> (Valerio
	Setti's message of "Thu, 28 May 2026 17:01:59 +0200")
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
	<20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
	<758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
	<891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
	<a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Jun 2026 15:27:48 +0200
Message-ID: <1jtsraed9n.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_062753_177311_5EFD798C 
X-CRM114-Status: GOOD (  34.76  )
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

On jeu. 28 mai 2026 at 17:01, Valerio Setti <vsetti@baylibre.com> wrote:

> On 5/22/26 18:24, Valerio Setti wrote:
>> On 5/22/26 01:15, Mark Brown wrote:
>>> On Fri, May 15, 2026 at 05:10:40PM +0200, Valerio Setti wrote:
>>>> Create a new DAPM widget for "I2S formatter" and place it on the path
>>>> between FIFO and output DAI interface. Remove I2S output formatting co=
de
>>>> from aiu-encoder-i2s since it's now implemented from aiu-formatter-i2s.
>>>
>>> This series, it looks like this specific patch, is breaking pcm-test on
>>> my libretech Le Potato board, the clocking looks to be seriously messed
>>> up.=C2=A0 I'm getting:
>>>
>>> [...]
>>>
>>> Full log:
>>>
>>> =C2=A0=C2=A0=C2=A0 https://lava.sirena.org.uk/scheduler/job/2786342#L19=
34
>>>
>>> The prior patches seem to test fine, it's this one that seems to
>>> introduce the issue.
>> Thanks a lot for the heads up and please apologize for the problem.
>> I wasn't aware of these testing tools so I based my testing on playing
>> with userspace alsa tools on the physical board that I have.
>> I will take a look at it ASAP and send a properly tested v2.
>>=20
>
> Hi!
>
> I investigated a bit on the issue caused by my v1 patch series and I think
> I've found the root cause. I suspect my patch series helped discovering a
> misbehavior that was already present, so I'm seeking for suggestions on t=
he
> proper way to proceed.
>
> # First: the background
>
> By default on OdroidC2/LePotato boards the only available audio playback =
is
> through HDMI. From DAI point of view the flow is as follows:
>
> "I2S FIFO" -> "I2S Encoder Playback" -> "CODEC CTRL HDMI I2S IN" -> "HDMI
> CTRL SRC" (mixer) -> "CODEC CTRL HDMI OUT Capture"
>
> In this chain the mixer "HDMI CTRL SRC" by default starts as "DISABLED" so
> it should prevent "CODEC CTRL HDMI OUT Capture" from receiving data.

Yes, leaving registers to their default state (even if it is not a
working configuration) and relying on mixer path to be setup was done on
purpose.

There is not a single configuration that would work/please everyone,
especially on AXG but the same could be said about the GX
series.

Not hardcoding any such configuration in the driver was the only sane
choice, even if it may seem to weird to have pipelines that do not work
by default.

>
> # What changed before/after the last commit of my patch series?
>
> - Before: "aiu-encoder-i2s.c" was calling "aiu_encoder_i2s_setup_desc()" =
in
>   "hw_params()". Audio playback shouldn't work in this condition because =
as
>   I mentioned "HDMI CTRL SRC"=3D"DISABLED" by default, but apparently
>   configuring the AIU_I2S_SOURCE_DESC register is enough to make the
>  playback to work properly.

Nice :'(

>
> - After: those configurations are only set when "aiu_formatter_i2s_prepar=
e"
>   is called which happens if "I2S Formatter" widget is enabled. Since "HD=
MI
>   CTRL SRC"=3D"DISABLED" then "I2S Formatter" is not powered up and there=
fore
>   its callbacks are not called and the playback fails.
>
> Simply issuing the following command:
> $ amixer sset 'AIU HDMI CTRL SRC' 'I2S'
>
> resolves the problem and all pcm-tests pass.
> This also explains why I didn't catch this issue before sending the v1
> series: I tested with NXP SGTL5000 codec, not the HDMI one.
>
> # Final question
>
> I have 2 alternative proposals for this:
>
> - Change the default value of "HDMI CTRL SRC" so that at boot it's set to
>   some working configuration (ex: "I2S"). This should be done somewhere in
>  "aiu-codec-ctrl" I think.
> - Run the 'amixer' command above before running ALSA tests.
>
> Any suggestion on what's the best approach?

As Mark suggested, let be nice on the user and poke the register on
probe. Just add a big fat comment around it so it is clear why you are
doing it (and why it is not something to be copied)

>
> Thanks a lot.

--=20
Jerome

