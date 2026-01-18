Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DF3D4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gHlQR2n2SQOu8sa/Hq4BCD/kICl3RS2AvTGlWnAtSA=; b=wXp2w21PFchWZ5cl/ngXp1xNGR
	e3UnoHIfGM12ErFTyefvJYEAS8l/wywSEhQcqZz52mJAKLvPuYud6LvEEI+ZaOsYgMN4rg+vq0XVg
	bRMlm9eiWcO104LWtSWe7c0GkxmvYOMbjM/eLlJHaD0hRhudmqI80kj4BCdlzjJwN/cL1CMyvOqLX
	qHLs2XSYz6Eedx0IR+SSSWUihWPkkSs3nGQVxNkBWGXEh1L+FjHMpa897WceV9uR36jUx9r+9t2C5
	Pd4gIUCAI9C9yKRYgr16R9OUxF02b8PNt+q24Jv54dQDJjn8n7B0q2kHppEZ217htuxdWJGm8SUOT
	7HA7YOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhSNN-000000003RN-0Bhh;
	Sun, 18 Jan 2026 12:59:29 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhSNJ-000000003Qj-29sr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 12:59:27 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-78c66bdf675so31726577b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 04:59:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768741164; cv=none;
        d=google.com; s=arc-20240605;
        b=gjucapq39WuGRX6SpsJp35njB5JwHBSQg+xBshKFB8xxk/H4zWCOX4RiDNCqIAMNF/
         VPkNF+vpUCkh6qKrrWRM8Re2ss/FJjBx71cYCz1dikgWEz9VbpHOllG08xkqPKLPWDEi
         LaAYuH7A+W5LZxXzUCFLHnt6UZApdcYALymBOqZdqj26ZxySmAPtsIUYlGoDKTheWlhx
         xL73ZCgqgWK9+AO8nclj9CQJMyVGivJfjkv3aW84fjx7WPw/uUMhCCnbZuiV86gISVcf
         /q7H0ZV3mhvFbGBnvWxqmXiI5sixdxAHFK5s/Oy8Qd5N7wRrt4Ymr0eR4yRHzFfLyOva
         kkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0gHlQR2n2SQOu8sa/Hq4BCD/kICl3RS2AvTGlWnAtSA=;
        fh=GySusurYFrJloPRsdQHpzXvMz4FNGFjp3unGNFJyI5A=;
        b=SF29JZjm5Ce8LV4Kh1jA5XvAewiNVPrk/Kzrgir1v6jZo0sHM17gOk8UZu3gqc8eJj
         SiGPBRWV5zbo8gN6+0t1o6VjMh95XyrVhHoCKu205dgQjejlykk237HdED3qBaf0AgHW
         7qZPU3QX3l6eq6F0+JLtcA2GmlbZ9iUS8A19HUK55PYOVc3z66miqjH/GCx7sZZg6+N0
         EctOHyrdJ0jjXniM3DTgLgBMdEcAQhm944DK+DuGFZCUtQy8Bu2Sb3y1h8iQAnurT0D8
         nulB2Igu1aseqtRuDJcL0bi2s7neJ6f27AFeSjaNlnrX36+GoomqMW1kkcfY4gKsZynS
         Z3bw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768741164; x=1769345964; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gHlQR2n2SQOu8sa/Hq4BCD/kICl3RS2AvTGlWnAtSA=;
        b=LhNM19zxp8dHRIPM4X3VvkMeqSbUPLU1LF0QuxV63f8cLJ/FIn5nblqHU5SJnyvs4X
         U1Xz9m1kE8SlWoxm2IJ9/f/LyPhzFlSg5tGzSnnJ4GCO4S40aqAVozoNtcz0LMz/Y6dv
         Fln3vbFBgabP3ow7i0a4nvO6SCi95+baB/Sto9PywS4R7TSQ/xLIk72wCXOqL1HU1Cmw
         IVbF09C9ji8ExLR9eo9+K2k/KK/Ai3zx8HSnolAtUvtyBoB5LpAe/b3yZ9jjt32XVQoB
         eJLz5AdOTqfr8RtvesNF6uN8IrZm8SOX54DQ+EZSh/azYeKXrAJK2pQgao+CFGOipHNj
         SPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768741164; x=1769345964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0gHlQR2n2SQOu8sa/Hq4BCD/kICl3RS2AvTGlWnAtSA=;
        b=iDX6eo7YFvF7NEeUVhU8Cmjxbz0Zeo7gskzs45a62nPMyCZUgr4qDRNiv2GL1diuzr
         C/Y19cImp6wYjVaRnzcF+kFBbseXlcOsbCO/bHD3xwzLNFhxOTXnRIk0EMxdkK8ScrMC
         NpZAgA7uVAmNerDiBqhQhUooZTavwaw/a+TqhNlQ8MeHItCiWH1qe9Z2YNU1SnOa67+H
         6XiW9FdEhi7AZeTIkCt6yjwxhHveYzvWgLrRiQstiNKJbB07ZZ/U9dPPDlZafMfwq6Qh
         WNZaA/YcEpMHv0usVQCQHquSUryIsnVdTrlEJizbg6tYBAE73k2Rn06vFE6xjrt5F9yo
         cKTg==
X-Forwarded-Encrypted: i=1; AJvYcCVwTC6TnBR+iefE9Ly1JdIuQ90nc8fCXqoKpvItgEnh6WATTJbLsrIcmxZxWkCCSh7Ktwaplfc6rPaEEA17tqet@lists.infradead.org
X-Gm-Message-State: AOJu0YzzvSP1pyOX4zjGD8yzfwvk8DpSIEvE2t7bThb28nKFgfd3RvN4
	IQVIgtVpWeY0ASY88nhvLqn9kvFviNHeIGXvWs077MVFXCRTm1qx4AgIO/4UReuHfReOonhO85B
	P09DD/xsGZbp+FhmxgD2RScpYoaNU1L4=
X-Gm-Gg: AY/fxX4GmIEaXmYskk7/tDze33QLgwoSHchISgBvl3BgiavJkdQSNydfoPzulJBIv+U
	+ym3NYpGM0jhJyyneMqIVYEva5rMMqexUoJVHMzHqUEe+haVshBiIGpZsEH9zPnLncG9XTYHOGy
	Ej6vf5j/aPcrJS+ukfb6BI1+ppVjrgQsbnvHcuTjVj2EYmZmSEPrsFqAsK59PQdZD0ojcVjIs0C
	hVW6T/vZdXZmIFJegdFdneyeQ/PO4NnlQFnV4zY4jhHzuoNvjRNVQQCOvae91/3y1+cK0m7fc1P
	8/xtZ+MpoJHdh1xEnbTRiA/88qrsLdpG5/5q8Ng=
X-Received: by 2002:a05:690c:b9b:b0:78c:6919:e891 with SMTP id
 00721157ae682-793c5362c87mr69778347b3.25.1768741164092; Sun, 18 Jan 2026
 04:59:24 -0800 (PST)
MIME-Version: 1.0
References: <20260115-b4-macsmc-power-v3-0-c236e09874be@gmail.com>
 <20260115-b4-macsmc-power-v3-1-c236e09874be@gmail.com> <20260117122634.GA58217@robin.jannau.net>
 <42645fb0-3ae1-4ded-91db-f1435fa79a72@gmail.com> <20260118124941.GB55832@robin.jannau.net>
In-Reply-To: <20260118124941.GB55832@robin.jannau.net>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sun, 18 Jan 2026 23:59:12 +1100
X-Gm-Features: AZwV_QgRSJtAstMhf1XFh8WAeds6sVAVJ_jue344ww7fc4fj3urFIPj_v4YtQAo
Message-ID: <CANpmGNv6Yd30YXat1OAGN-Fs495DOAnttQEtOayq+wLpHMXS0w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] power: supply: Add macsmc-power driver for Apple Silicon
To: Janne Grunau <j@jannau.net>
Cc: Nick Chan <towinchenmi@gmail.com>, Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_045925_667377_D992F204 
X-CRM114-Status: GOOD (  47.89  )
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

Hi Janne,

Thank you for the feedback.

On Sat, Jan 17, 2026 at 11:26=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> On Thu, Jan 15, 2026 at 06:08:15PM +1100, Michael Reeves via B4 Relay wro=
te:
> > From: Michael Reeves <michael.reeves077@gmail.com>
>
> I think the driver is overall similar to the downstream AsahiLinux
> driver so please keep Hector as author.
>
Will change in v4!
> > This driver provides battery and AC status monitoring for Apple Silicon
> > Macs via the SMC (System Management Controller). It supports
> > reporting capacity, voltage, current, and charging status.
> >
> > Co-developed-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Hector Martin <marcan@marcan.st>
>
> The downstream driver a quite a few more Co-developed-by:/Sobs. When I
> squashed the commits I decided to err on the safe side and included
> commit authors from incremental patches as Co-developed-by: Why did you
> drop those?
Oh sorry, the UI just displayed marcan because, as you said, the
commit was squashed to a single From: marcan commit in the main
 upstream branch.

I see them now on closer inspection and will add SOBs/CDBs in v4,
except for the contributor who added unconditional available charge behavio=
ur
reporting, because that code is not in the refactored upstream driver I've =
made
here - it's different and conditional now. Unless you think it's
fairer and safer to
also include that?
[...]
> > +
> > +struct macsmc_power {
> > +     struct device *dev;
> > +     struct apple_smc *smc;
> > +
> > +     struct power_supply_desc ac_desc;
> > +     struct power_supply_desc batt_desc;
> > +
> > +     struct power_supply *batt;
> > +     struct power_supply *ac;
> > +
> > +     char model_name[MAX_STRING_LENGTH];
> > +     char serial_number[MAX_STRING_LENGTH];
> > +     char mfg_date[MAX_STRING_LENGTH];
> > +
> > +     bool has_chwa;
> > +     bool has_chls;
> > +     bool has_ch0i;
> > +     bool has_ch0c;
> > +     bool has_chte;
>
> I think comments what these keys do and in which firmware version the
> appeared or vanished would be helpful here. I can Help with digging
> through the history.
>
Will add in v4, thank you for the suggestion. WIll let you know on IRC
if any help is needed but can see the full history now.
> > +
> > +     u8 num_cells;
> > +     int nominal_voltage_mv;
> > +
> > +     struct notifier_block nb;
> > +     struct work_struct critical_work;
> > +     bool shutdown_started;
> > +};
> > +
> > +static int macsmc_battery_get_status(struct macsmc_power *power)
> > +{
> > +     u64 nocharge_flags;
> > +     u32 nopower_flags;
> > +     u16 ac_current;
> > +     int charge_limit =3D 0;
> > +     bool limited =3D false;
> > +     bool flag;
> > +     int ret;
> > +
> > +     /*
> > +      * Fallbacks exist for keys that may disappear in future hardware=
.
> > +      * CHCE/CHCC/BSFC/CHSC are considered fundamental; absence is an =
error.
> > +      */
>
> Why did you rewrite this (and many other) comments? I don't think this
> is an improvement over the comment in the downstream driver.
>
I tried to make comments clearer / more concise where needed / make more se=
nse
for upstream, so that it would be easier to understand for a wider audience=
, if
there's any changes you don't like, please let me know and I can restore th=
e
original comment if that would make more sense.
[...]
> > +
> > +static int macsmc_battery_set_charge_behaviour(struct macsmc_power *po=
wer, int val)
> > +{
> > +     int ret;
> > +
> > +     /* First, reset all inhibitors to a known-good 'auto' state */
>
> why? I wouldn't expect this function to make any if `val` is not
> supported. If has_ch0i is not true
> POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE will reset inhibit charge
> and return -EOPNOTSUPP which is unexpected.
> Resetting the values first and then change them to the actual desired
> values doesn't make much sense either.
> Yes, it's a little annoying to make the same calls in multiple cases of
> the switch statement but you could move the `power->has_*` checks and
> the smc writes to a single line.
>
I'll refactor this to handle the specific writes within each switch
case for v4, thank you for the pickup!
> > +     if (power->has_ch0i) {
> > +             ret =3D apple_smc_write_u8(power->smc, SMC_KEY(CH0I), 0);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (power->has_chte) {
> > +             ret =3D apple_smc_write_u32(power->smc, SMC_KEY(CHTE), 0)=
;
> > +             if (ret)
> > +                     return ret;
> > +     } else if (power->has_ch0c) {
> > +             ret =3D apple_smc_write_u8(power->smc, SMC_KEY(CH0C), 0);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     switch (val) {
> > +     case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
> > +             return 0;
> > +
> > +     case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
> > +             if (power->has_chte)
> > +                     return apple_smc_write_u32(power->smc, SMC_KEY(CH=
TE), 1);
> > +             else if (power->has_ch0c)
> > +                     return apple_smc_write_u8(power->smc, SMC_KEY(CH0=
C), 1);
> > +             else
> > +                     return -EOPNOTSUPP;
> > +             break;
> > +
> > +     case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
> > +             if (!power->has_ch0i)
> > +                     return -EOPNOTSUPP;
> > +             return apple_smc_write_u8(power->smc, SMC_KEY(CH0I), 1);
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static int macsmc_battery_get_date(const char *s, int *out)
> > +{
> > +     if (!isdigit(s[0]) || !isdigit(s[1]))
> > +             return -EOPNOTSUPP;
> > +
> > +     *out =3D (s[0] - '0') * 10 + s[1] - '0';
> > +     return 0;
> > +}
> > +
> > +static int macsmc_battery_get_capacity_level(struct macsmc_power *powe=
r)
> > +{
> > +     bool flag;
> > +     u32 val;
> > +     int ret;
> > +
> > +     /* Check for emergency shutdown condition */
> > +     if (apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &val) >=3D 0 &&=
 val)
> > +             return POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
> > +
> > +     /* Check AC status for whether we could boot in this state */
> > +     if (apple_smc_read_u32(power->smc, SMC_KEY(ACSt), &val) >=3D 0) {
> > +             if (!(val & ACSt_CAN_BOOT_IBOOT))
> > +                     return POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
> > +
> > +             if (!(val & ACSt_CAN_BOOT_AP))
> > +                     return POWER_SUPPLY_CAPACITY_LEVEL_LOW;
> > +     }
> > +
> > +     ret =3D apple_smc_read_flag(power->smc, SMC_KEY(BSFC), &flag);
>
> the comment in the downstream driver what the flag is helpful
>
Will add back (maybe with clarification/cleanup) in v4, thank you!

> > +     .set_property           =3D macsmc_battery_set_property,
> > +     .property_is_writeable  =3D macsmc_battery_property_is_writeable,
> > +};
> > +
> > +static int macsmc_ac_get_property(struct power_supply *psy,
> > +                               enum power_supply_property psp,
> > +                               union power_supply_propval *val)
> > +{
> > +     struct macsmc_power *power =3D power_supply_get_drvdata(psy);
> > +     int ret =3D 0;
> > +     u16 vu16;
> > +     u32 vu32;
> > +
> > +     switch (psp) {
> > +     case POWER_SUPPLY_PROP_ONLINE:
> > +             ret =3D apple_smc_read_u32(power->smc, SMC_KEY(CHIS), &vu=
32);
> > +             val->intval =3D !!vu32;
> > +             break;
> > +     case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> > +             ret =3D apple_smc_read_u16(power->smc, SMC_KEY(AC-n), &vu=
16);
> > +             val->intval =3D vu16 * 1000;
> > +             break;
> > +     case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> > +             ret =3D apple_smc_read_u16(power->smc, SMC_KEY(AC-i), &vu=
16);
> > +             val->intval =3D vu16 * 1000;
> > +             break;
> > +     case POWER_SUPPLY_PROP_INPUT_POWER_LIMIT:
> > +             ret =3D apple_smc_read_u32(power->smc, SMC_KEY(ACPW), &vu=
32);
> > +             val->intval =3D vu32 * 1000;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct power_supply_desc macsmc_ac_desc_template =3D {
> > +     .name                   =3D "macsmc-ac",
> > +     .type                   =3D POWER_SUPPLY_TYPE_MAINS,
> > +     .get_property           =3D macsmc_ac_get_property,
> > +};
> > +
> > +static void macsmc_power_critical_work(struct work_struct *wrk)
> > +{
> > +     struct macsmc_power *power =3D container_of(wrk, struct macsmc_po=
wer, critical_work);
> > +     u16 bitv, b0av;
> > +     u32 bcf0;
> > +
> > +     if (!power->batt)
> > +             return;
> > +
> > +     /*
> > +      * EMERGENCY: Check voltage vs design minimum.
> > +      * If we are below BITV, the battery is physically exhausted.
> > +      * We must shut down NOW to protect the filesystem.
> > +      */
> > +     if (apple_smc_read_u16(power->smc, SMC_KEY(BITV), &bitv) >=3D 0 &=
&
> > +         apple_smc_read_u16(power->smc, SMC_KEY(B0AV), &b0av) >=3D 0 &=
&
> > +         b0av < bitv) {
> > +             dev_emerg(power->dev,
> > +                       "Battery voltage (%d mV) below design minimum (=
%d mV)! Emergency shutdown.\n",
> > +                       b0av, bitv);
> > +             kernel_power_off();
> > +             return;
>
> I don't think we should return here. kernel_power_off() may do
> nothing in which case the orderly_poweroff(true) might save data.
> I would protect it as well via power->shutdown_started like in the
> downstream driver to avoid calling kernel_power_off() once per second
> until the battery dies or the system shutsdown.
>
Sounds good, will fix in v4. Note that the way orderly_poweroff(true) saves
data (if userspace fails to respond) is an emergency_sync() before
kernel_power_off() so we could also just add emergency_sync() to this
code path to achieve the same effect.

Re protection, it would probably be useful to, if we go down the route
of removing the return, have 2 separate flags for orderly vs non-orderly
shutdown started so we can "upgrade" a shutdown where needed as the comment
I added below clarifies.
> > +     }
> > +
> > +     /*
> > +      * Avoid duplicate attempts at orderly shutdown.
> > +      * Voltage check is above this as we may want to
> > +      * "upgrade" an orderly shutdown to a critical power
> > +      * off if voltage drops.
> > +      */
> > +     if (power->shutdown_started || system_state > SYSTEM_RUNNING)
> > +             return;
> > +
> > +     /*
> > +      * Check if SMC flagged the battery as empty.
> > +      * We trigger a graceful shutdown to let the OS save data.
> > +      */
> > +     if (apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &bcf0) =3D=3D 0=
 && bcf0 !=3D 0) {
> > +             power->shutdown_started =3D true;
> > +             dev_crit(power->dev, "Battery critical (empty flag set). =
Triggering orderly shutdown.\n");
> > +             orderly_poweroff(true);
> > +     }
> > +}
> > +
[...]
> > +static int macsmc_power_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct apple_smc *smc =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct power_supply_config psy_cfg =3D {};
> > +     struct macsmc_power *power;
> > +     bool has_battery =3D false;
> > +     bool has_ac_adapter =3D false;
> > +     int ret =3D -ENODEV;
> > +     bool flag;
> > +     u16 vu16;
> > +     u32 val32;
> > +     enum power_supply_property *props;
> > +     size_t nprops;
> > +
> > +     if (!smc)
> > +             return -ENODEV;
> > +
> > +     power =3D devm_kzalloc(dev, sizeof(*power), GFP_KERNEL);
> > +     if (!power)
> > +             return -ENOMEM;
> > +
> > +     power->dev =3D dev;
> > +     power->smc =3D smc;
> > +     dev_set_drvdata(dev, power);
> > +
> > +     INIT_WORK(&power->critical_work, macsmc_power_critical_work);
> > +     ret =3D devm_work_autocancel(dev, &power->critical_work, macsmc_p=
ower_critical_work);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * Check for battery presence.
> > +      * B0AV is a fundamental key.
> > +      */
> > +     if (apple_smc_read_u16(power->smc, SMC_KEY(B0AV), &vu16) =3D=3D 0=
 &&
> > +         macsmc_battery_get_status(power) > POWER_SUPPLY_STATUS_UNKNOW=
N)
> > +             has_battery =3D true;
> > +
> > +     /*
> > +      * Check for AC adapter presence.
> > +      * CHIS is a fundamental key.
> > +      */
> > +     if (apple_smc_key_exists(smc, SMC_KEY(CHIS)))
> > +             has_ac_adapter =3D true;
> > +
>
> I think a short circuit check for !(has_battery || has_ac_adapter) would
> make sense here. The setup code for props is quite long. It should
> return -ENODEV. ret is not -ENODEV. anymore since it was overwritten
> with the return value of devm_work_autocancel()
>
Thank you for the pickup, will fix in v4.
> > +     if (has_battery) {
> > +             power->batt_desc =3D macsmc_battery_desc_template;
> > +             props =3D devm_kcalloc(dev, MACSMC_MAX_BATT_PROPS,
> > +                                  sizeof(enum power_supply_property),
> > +                                  GFP_KERNEL);
>
> I don't like the dynamic allocation for the props. I think we can
> currently get way with static property arrays and so we should do that.
> See my comments below
>
I think dynamic allocation is useful for backward and forward
compatibility in future (while I have been writing this Draft, Nick
Chan has sent a reply echoing this
from a pre-M1 bringup perspective), and is also cleaner / less hacky,
so would also prefer if it's kept, but happy to change to static if that's =
the
consensus that emerges.
> > +             if (!props)
> > +                     return -ENOMEM;
> > +
> > +             nprops =3D 0;
> > +
> > +             /* Fundamental properties */
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_STATUS;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_PRESENT;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_VOLTAGE_NOW;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_CURRENT_NOW;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_POWER_NOW;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_CAPACITY;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_CAPACITY_LEVEL;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_TEMP;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_CYCLE_COUNT;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_HEALTH;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_SCOPE;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_MODEL_NAME;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_SERIAL_NUMBER;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_MANUFACTURE_YEAR;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_MANUFACTURE_MONTH;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_MANUFACTURE_DAY;
> > +
> > +             /* Extended properties usually present */
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_TIME_TO_FULL_NOW;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_VOLTAGE_MIN;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_VOLTAGE_MAX;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT=
;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_CONSTANT_CHARGE_CUR=
RENT_MAX;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOL=
TAGE;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_CHARGE_FULL;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_CHARGE_NOW;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_ENERGY_FULL;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_ENERGY_NOW;
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_CHARGE_COUNTER;
> > +
> > +             /* Detect features based on key availability */
> > +             if (apple_smc_key_exists(smc, SMC_KEY(CHTE)))
> > +                     power->has_chte =3D true;
> > +             if (apple_smc_key_exists(smc, SMC_KEY(CH0C)))
> > +                     power->has_ch0c =3D true;
> > +             if (apple_smc_key_exists(smc, SMC_KEY(CH0I)))
> > +                     power->has_ch0i =3D true;
> > +
> > +             /* Reset "Optimised Battery Charging" flags to default st=
ate */
> > +             if (power->has_chte)
> > +                     apple_smc_write_u32(smc, SMC_KEY(CHTE), 0);
> > +             else if (power->has_ch0c)
> > +                     apple_smc_write_u8(smc, SMC_KEY(CH0C), 0);
> > +
> > +             if (power->has_ch0i)
> > +                     apple_smc_write_u8(smc, SMC_KEY(CH0I), 0);
> > +
> > +             apple_smc_write_u8(smc, SMC_KEY(CH0K), 0);
> > +             apple_smc_write_u8(smc, SMC_KEY(CH0B), 0);
> > +
> > +             /* Configure charge behaviour if supported */
> > +             if (power->has_ch0i || power->has_ch0c || power->has_chte=
) {
> > +                     props[nprops++] =3D POWER_SUPPLY_PROP_CHARGE_BEHA=
VIOUR;
>
> This is the only dynamic battery prop. With a static array we can simply
> put it at the end of the array and set batt_desc.num_properties to array
> size - 1 if none of the keys are available.
>
See above.
> > +
> > +                     power->batt_desc.charge_behaviours =3D
> > +                             BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO);
> > +
> > +                     if (power->has_ch0i)
> > +                             power->batt_desc.charge_behaviours |=3D
> > +                                     BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR=
_FORCE_DISCHARGE);
> > +
> > +                     if (power->has_chte || power->has_ch0c)
> > +                             power->batt_desc.charge_behaviours |=3D
> > +                                     BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR=
_INHIBIT_CHARGE);
> > +             }
> > +
> > +             /* Detect charge limit method (CHWA vs CHLS) */
> > +             if (apple_smc_read_flag(power->smc, SMC_KEY(CHWA), &flag)=
 =3D=3D 0)
> > +                     power->has_chwa =3D true;
> > +             else if (apple_smc_read_u16(power->smc, SMC_KEY(CHLS), &v=
u16) >=3D 0)
> > +                     power->has_chls =3D true;
> > +
> > +             power->batt_desc.properties =3D props;
> > +             power->batt_desc.num_properties =3D nprops;
> > +
> > +             /* Fetch identity strings */
> > +             apple_smc_read(smc, SMC_KEY(BMDN), power->model_name,
> > +                            sizeof(power->model_name) - 1);
> > +             apple_smc_read(smc, SMC_KEY(BMSN), power->serial_number,
> > +                            sizeof(power->serial_number) - 1);
> > +             apple_smc_read(smc, SMC_KEY(BMDT), power->mfg_date,
> > +                            sizeof(power->mfg_date) - 1);
> > +
> > +             apple_smc_read_u8(power->smc, SMC_KEY(BNCB), &power->num_=
cells);
> > +             power->nominal_voltage_mv =3D MACSMC_NOMINAL_CELL_VOLTAGE=
_MV * power->num_cells;
> > +
> > +             /* Enable critical shutdown notifications by reading stat=
us once */
> > +             apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &val32);
> > +
> > +             psy_cfg.drv_data =3D power;
> > +             power->batt =3D devm_power_supply_register(dev, &power->b=
att_desc, &psy_cfg);
> > +             if (IS_ERR(power->batt)) {
> > +                     dev_err_probe(dev, PTR_ERR(power->batt),
> > +                                   "Failed to register battery\n");
> > +                     /* Don't return failure yet; try AC registration =
first */
> > +                     power->batt =3D NULL;
> > +             }
> > +     } else {
> > +             dev_dbg(dev, "No battery detected.\n");
>
> I would drop this
>
Will do in v4, thank you!
> > +     }
> > +
> > +     if (has_ac_adapter) {
> > +             power->ac_desc =3D macsmc_ac_desc_template;
> > +             props =3D devm_kcalloc(dev, MACSMC_MAX_AC_PROPS,
> > +                                  sizeof(enum power_supply_property),
> > +                                  GFP_KERNEL);
> > +             if (!props)
> > +                     return -ENOMEM;
> > +
> > +             nprops =3D 0;
> > +
> > +             /* Online status is fundamental */
> > +             props[nprops++] =3D POWER_SUPPLY_PROP_ONLINE;
> > +
> > +             /* Input power limits are usually available */
> > +             if (apple_smc_key_exists(power->smc, SMC_KEY(ACPW)))
> > +                     props[nprops++] =3D POWER_SUPPLY_PROP_INPUT_POWER=
_LIMIT;
> > +
> > +             /* macOS 15.4+ firmware dropped legacy AC keys (AC-n, AC-=
i) */
> > +             if (apple_smc_read_u16(power->smc, SMC_KEY(AC-n), &vu16) =
>=3D 0) {
> > +                     props[nprops++] =3D POWER_SUPPLY_PROP_VOLTAGE_NOW=
;
> > +                     props[nprops++] =3D POWER_SUPPLY_PROP_INPUT_CURRE=
NT_LIMIT;
> > +             }
>
> we can do the same trick here assuming AC-n and AC-i are only present if
> ACPW is present.
>
See above comment.
> > +             power->ac_desc.properties =3D props;
> > +             power->ac_desc.num_properties =3D nprops;
> > +
> > +             psy_cfg.drv_data =3D power;
> > +             power->ac =3D devm_power_supply_register(dev, &power->ac_=
desc, &psy_cfg);
> > +             if (IS_ERR(power->ac)) {
> > +                     dev_err_probe(dev, PTR_ERR(power->ac),
> > +                                   "Failed to register AC adapter\n");
> > +                     power->ac =3D NULL;
> > +             }
> > +     } else {
> > +             dev_dbg(dev, "No A/C adapter detected.\n");
>
> same here
Will drop, thanks!
> > +     }
> > +
> > +     /* Final check: did we register anything? */
> > +     if (!power->batt && !power->ac)
> > +             return ret;
>
> See my comment about the changed value of ret above
>
Yes, will fix in v4, thank you again for the pickup!
[...]
Thank you so much for your time!

Best regards,
Michael

On Sun, Jan 18, 2026 at 11:49=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> On Sun, Jan 18, 2026 at 08:19:38PM +0800, Nick Chan wrote:
> >
> >
> > On 17/1/2026 20:26, Janne Grunau wrote:
> > > On Thu, Jan 15, 2026 at 06:08:15PM +1100, Michael Reeves via B4 Relay=
 wrote:
> > >> From: Michael Reeves <michael.reeves077@gmail.com>
> > >
> > > I think the driver is overall similar to the downstream AsahiLinux
> > > driver so please keep Hector as author.
> > >
> > >> This driver provides battery and AC status monitoring for Apple Sili=
con
> > >> Macs via the SMC (System Management Controller). It supports
> > >> reporting capacity, voltage, current, and charging status.
> > >>
> > >> Co-developed-by: Hector Martin <marcan@marcan.st>
> > >> Signed-off-by: Hector Martin <marcan@marcan.st>
> > >
> > > The downstream driver a quite a few more Co-developed-by:/Sobs. When =
I
> > > squashed the commits I decided to err on the safe side and included
> > > commit authors from incremental patches as Co-developed-by: Why did y=
ou
> > > drop those?
> > >
> > >> Reviewed-by: Neal Gompa <neal@gompa.dev>
> > >> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> > >> ---
> > >>  MAINTAINERS                         |   1 +
> > >>  drivers/power/supply/Kconfig        |  11 +
> > >>  drivers/power/supply/Makefile       |   1 +
> > >>  drivers/power/supply/macsmc-power.c | 834 +++++++++++++++++++++++++=
+++++++++++
> > >>  4 files changed, 847 insertions(+)
> > >>
> > >> diff --git a/drivers/power/supply/macsmc-power.c b/drivers/power/sup=
ply/macsmc-power.c
> > >> new file mode 100644
> > >> index 000000000000..9b3faefe7a45
> > >> --- /dev/null
> > >> +++ b/drivers/power/supply/macsmc-power.c
> > >> @@ -0,0 +1,834 @@
>
> ...
>
> > >> +static int macsmc_power_probe(struct platform_device *pdev)
> > >> +{
> > >> +  struct device *dev =3D &pdev->dev;
> > >> +  struct apple_smc *smc =3D dev_get_drvdata(pdev->dev.parent);
> > >> +  struct power_supply_config psy_cfg =3D {};
> > >> +  struct macsmc_power *power;
> > >> +  bool has_battery =3D false;
> > >> +  bool has_ac_adapter =3D false;
> > >> +  int ret =3D -ENODEV;
> > >> +  bool flag;
> > >> +  u16 vu16;
> > >> +  u32 val32;
> > >> +  enum power_supply_property *props;
> > >> +  size_t nprops;
> > >> +
> > >> +  if (!smc)
> > >> +          return -ENODEV;
> > >> +
> > >> +  power =3D devm_kzalloc(dev, sizeof(*power), GFP_KERNEL);
> > >> +  if (!power)
> > >> +          return -ENOMEM;
> > >> +
> > >> +  power->dev =3D dev;
> > >> +  power->smc =3D smc;
> > >> +  dev_set_drvdata(dev, power);
> > >> +
> > >> +  INIT_WORK(&power->critical_work, macsmc_power_critical_work);
> > >> +  ret =3D devm_work_autocancel(dev, &power->critical_work, macsmc_p=
ower_critical_work);
> > >> +  if (ret)
> > >> +          return ret;
> > >> +
> > >> +  /*
> > >> +   * Check for battery presence.
> > >> +   * B0AV is a fundamental key.
> > >> +   */
> > >> +  if (apple_smc_read_u16(power->smc, SMC_KEY(B0AV), &vu16) =3D=3D 0=
 &&
> > >> +      macsmc_battery_get_status(power) > POWER_SUPPLY_STATUS_UNKNOW=
N)
> > >> +          has_battery =3D true;
> > >> +
> > >> +  /*
> > >> +   * Check for AC adapter presence.
> > >> +   * CHIS is a fundamental key.
> > >> +   */
> > >> +  if (apple_smc_key_exists(smc, SMC_KEY(CHIS)))
> > >> +          has_ac_adapter =3D true;
> > >> +
> > >
> > > I think a short circuit check for !(has_battery || has_ac_adapter) wo=
uld
> > > make sense here. The setup code for props is quite long. It should
> > > return -ENODEV. ret is not -ENODEV. anymore since it was overwritten
> > > with the return value of devm_work_autocancel()
> > >
> > >> +  if (has_battery) {
> > >> +          power->batt_desc =3D macsmc_battery_desc_template;
> > >> +          props =3D devm_kcalloc(dev, MACSMC_MAX_BATT_PROPS,
> > >> +                               sizeof(enum power_supply_property),
> > >> +                               GFP_KERNEL);
> > >
> > > I don't like the dynamic allocation for the props. I think we can
> > > currently get way with static property arrays and so we should do tha=
t.
> > > See my comments below
> >
> > Dynamic allocation is needed to properly add support pre-M1 support,
> > as the SMCs in them misses a few keys, yet in iOS 16 the charge limit
> > (CHWA) keys are added. In a similar way, there really is no sane way
> > to add any new properties for M1/M2/M3 with static allocation. So I
> > would prefer if dynamic allocation is kept.
>
> ack, I wasn't really thinking beyond the code in front of me. Let's go
> with dynamic allocations. A check that nprops doesn't exceed
> MACSMC_MAX_BATT_PROPS should be added then.
>
> Janne

