Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BFFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIWP18m3HG8WOaoy4MbWUmKe5JZZFk+engmnmas88Q0=; b=LG/7BlzjdGdVvWO/hjvbCQwZzz
	Drken9h2CfOc+nt4FzjcmweXhlA9YY84LFw+bDEJxFmzube4u4zC4aEkiOoVqUkkJf6UqqHIlQLqk
	0FW1GyoO1lu/93FsMdYW2ycRehXW71GSE0tR2k3kqorpqfC/IjPjkrVcGEeQClwBeHhEAo3N3BqMq
	ntF20XjBZu2wkhBvmkTQeoS6omW9+Ey1+ghSHdhbfUCsiVuTyIpAf4eC/fvR2Ca+UzCblXn3mke9x
	UeYYBfHR/9cMbLJHnZzgH0LAt90YxMmnru4tDXF2aCyKTz30Uq0usP9xto6DszvglXWgSDD3rd2SB
	Aaa8gBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDMp-0000000Bos8-3XWA;
	Fri, 26 Jun 2026 20:41:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDMn-0000000BorO-0kXi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 20:41:38 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c8c30492a0so7375755ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 13:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782506496; cv=none;
        d=google.com; s=arc-20260327;
        b=s/XDpX0whwFhkLXkh+K2fpvyKYwQll+3rkbR1+NieE2YfMVRIK+3FM06V1kbTi3S6A
         /BvLStytmWh5jy2+rIKgIMqwsiyhvxVPQ9NgtniNaat1Glrnxb4UE6g8njef1gJUrlx9
         DP2aOF+59/9u58wjCCXLb4OOxQAKvkDufAIaBfQf3qBE+XjAZBtmt+Xv67B3Yj9bOLhQ
         xXaSyJ8t2KLd2HaB2TtPuFqU2WVN+g9rz1R4RaCbcgaYnqA3GuyE6hKdwfjxIeEynyGN
         jtrz4BVKl7K5hR8jX/dT2eMwDMFbQI2P43vKDtdNI6mMqECDNlWUnLSe0DgO6o2ge5Nc
         /cyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIWP18m3HG8WOaoy4MbWUmKe5JZZFk+engmnmas88Q0=;
        fh=dKwcoyiUgGP4X+/+E/nJT0OAlHtECHvmCz55LY0iwWw=;
        b=VbAfcbUTfXBNOB3nvmFM7uTMX84CavdJTmE6w7WpgPJNLVc2WFI0enKs7/p5x1QB4B
         1gdzLaSuDO6k0r619tdTNoI8gte98ADe6nlInwdljO+zxATaHlIHjr+bUEWUjNf2j8by
         ++KYY1ZK81kc7aTb58EXatUUxmUJmZP0HSGQ+8dGLirSHaZGizDZEb0ngO2g7HkEmGm9
         RWWCgYlLzIC8KQo1CdbvIklEmVFeS3fln0pbxIP+gVP7E7OE9oy+bG9NKm69+xjykYF8
         zEtZkE/13oC4XL1mb459ITmb/IG/tad+KfbGGB5F89HRUcQbYG6e873MuPBMvyl8oDo/
         5u8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782506496; x=1783111296; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIWP18m3HG8WOaoy4MbWUmKe5JZZFk+engmnmas88Q0=;
        b=EkEdcAzbhjOzK453372FKqSrsj4L6f2Gx1DZKb+3ji/lYJV1HBKUViA2Us3dlsq4Dd
         yjS0aB4LTlbm2tRLWuBDcyKpaVJhQZxQShVuPNRkGgyH5ehH+W6Jcqn+xMv+JRUTD7mS
         Tpkh+fU2iV7yvN/RX2rwzBQXPlJQcsQklYckQxbNQphvXq58DrM9BkskLthBSgu10v8E
         FqcQQ5vaJMa2YcORxww8xrFvPJMvJ/L0vluEwNDIlKxSiRgbIfDHPTK7im3sLZW4UV95
         /aoj5jGr1AycPnWcodcuXEGIE59aSjj2aB63UUDsJ0S0s0BcA6LElGJnbmjUiIqoAfSG
         AEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506496; x=1783111296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIWP18m3HG8WOaoy4MbWUmKe5JZZFk+engmnmas88Q0=;
        b=g/OD8VfR9sd2fq1FO/08tTFNkwF500QqrCNUa0qb27riOuJzAuvFzQW4h3Qwe2BFrk
         TL+cN7woEYP28OIBYNWnAzj2w1lovromcmkMQ9eFqUCL8BsbDpPmSKu1wnzD+EgS6zgm
         1wkPVqdWco3gXpwRQ0cKOpKf+YtIRWwgcW9Gtyyu91JuyaCmhLK0oUaI/TG7QBkimY6A
         wHH/yVB/70t3lmzVQ5T8uDk8qrVbCDWQbBMTbh4JqotnOVYW2max68gaAe9SYGnws36B
         92k/sBrQ7VHzN4ycwzO10iu2U1yUuWWKjPGaHHb0uQzR9EzdJ4M8lvYaX0AF4JOEApAo
         AUuw==
X-Forwarded-Encrypted: i=1; AHgh+RoWRtKEFwxTF6shQi7+SAp+0E9NWpxXJ3kPEN/WxEY7NxwN3E8beYxRfAEyon3Jjv+PLxkc+In3nogOhHa/DLhZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwNhf+YAHItfK+GkY1i/Qt13JbS05uyZgo/CYEuCieQS/LI+3JD
	YCDckFer0O16/kCRVnV1Vgf1k71c99KAAmvYrnhu1mlb0WXIQME7R9jv1WE/NhIS7JJOvhYlP4i
	+pO5IJdhIN0O7bUMVb8qfDtiCwwlHOmk=
X-Gm-Gg: AfdE7clEWN0+lV+jj4D+xC6CzljIi3CUfXCisgX6ps67OvZrV3BXxgxVM3GHNft9hBx
	nBvlWwvgO80u9gAETFpYCQd6fkuuLxlrWwWAgLOF8psWlyhG+61PRhiV34+QRXVSn6OVJIih1fE
	CdaAzvKREKcVcYrq0cAYkgNkoKtmaPz1EO5AQY0HB5sNCUncLjAx2bgt9EWp+o4Mlb7MYgAvdiK
	QJAJwuluvaI5WZAwI76qEI3UmdpyG4Hjsi4vQyG7IUidRlpdeRK+PVm5xdpGRoLcosUl2GnWNW2
	5+BkgDDDLfcrGtVR35nxxkRP7DEjjA==
X-Received: by 2002:a17:902:e847:b0:2c6:a404:ee91 with SMTP id
 d9443c01a7336-2c7fc6f344dmr79970005ad.21.1782506495557; Fri, 26 Jun 2026
 13:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260626080422.4191435-1-christianshewitt@gmail.com>
In-Reply-To: <20260626080422.4191435-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 26 Jun 2026 22:41:24 +0200
X-Gm-Features: AVVi8Cfn4WVK2ZPqNv9jC0XwZH2Brmz7LG-ORQmMP9Wwtqmvfi60nz5FLrHG7m8
Message-ID: <CAFBinCD5bn5VixbomCz0nmHuopBmgh0CJc-V4jY2vdXhoP_VCw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_134137_224145_62AC1CAF 
X-CRM114-Status: GOOD (  14.89  )
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

On Fri, Jun 26, 2026 at 10:04=E2=80=AFAM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 +
> AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
> vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no equivalent=
:
> it only toggles the IEC958 DCU, so a stale datapath FIFO can be replayed,
> producing the "machine gun noise" buffer underrun - on start when switchi=
ng
> outputs, and on stop when playback ends. The latter is audible on devices
> with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek Play2).
>
> The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) on
> both enable and disable (audio_hw_958_enable), and when reconfiguring
> (audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the same:
> reset before enabling the DCU on start, and after disabling it on stop.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This matches the vendor driver, references:
- fast-reset SPDIF is triggered on enable and disable: [0]
- fast-reset SPDIF is triggered after all of the configuration is
written, then DCU_FF_CTRL is enabled: [1]

[...]
>         case SNDRV_PCM_TRIGGER_SUSPEND:
>         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>         case SNDRV_PCM_TRIGGER_STOP:
>                 fifo_spdif_dcu_enable(component, false);
> +               snd_soc_component_write(component, AIU_RST_SOFT,
> +                                       AIU_RST_SOFT_958_FAST);
It doesn't seem to make any difference, so just for the record:
The vendor driver first triggers AIU_RST_SOFT_958_FAST then disables DCU: [=
2]


Best regards,
Martin


[0] https://github.com/endlessm/linux-s905x/blob/c1391ba1116aed801aaabfd9c7=
bbb76fda9801ec/sound/soc/aml/m8/aml_audio_hw.c#L1016
[1] https://github.com/endlessm/linux-s905x/blob/c1391ba1116aed801aaabfd9c7=
bbb76fda9801ec/sound/soc/aml/m8/aml_audio_hw.c#L979-L983
[2] https://github.com/endlessm/linux-s905x/blob/c1391ba1116aed801aaabfd9c7=
bbb76fda9801ec/sound/soc/aml/m8/aml_audio_hw.c#L1016-L1018

