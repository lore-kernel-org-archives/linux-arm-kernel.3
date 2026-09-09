Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F2EC79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMS1hbLMg1gsIduehGePlq8QcJPEKyefk4+J94QrxTY=; b=cn8tXL48XeCIJKo0dyaLHJzgPW
	oCroZsPTzvD0+nH9yHQBqCMzLG3l9Sd8teEerEM78Ucg6dEakVQpIeKV7CXtH4wedk4mtvY87N/8J
	kDqknXB91csXMPcrq3HlpoMYq8qd/cnWSFCDOj7x1O+4PI+pDs3bg/+1DpDYzBiaZIRM3aHWFhHrS
	9N0Est8PFj4x3z2L0Y55EtW/O0EBz2GAnYNLXWVelHJWuDDx0idaI9NZ6KfRPTer/12XFY58FUcOR
	MQfteTY1FIbyEiDzc7VPY28hRAqga41D8ihsZG/Sre/uED+tFQQwNwnFDO/d9tTDTvrXlTQDl4BGm
	85wUjVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Pwb-0000000Ctfy-0Nur;
	Wed, 09 Sep 2026 21:35:01 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4PwY-0000000Ctes-09Ag
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 21:34:59 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c25420fe973so1141751766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 14:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788989696; x=1789594496; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sMS1hbLMg1gsIduehGePlq8QcJPEKyefk4+J94QrxTY=;
        b=dNnjDAiza9qLopMkHW+xr6FW4oCXi/r/+6xU34ibKG/aa6oKs9Q9D+WI0zKxV1ZNJr
         mqnLD8HWTkpwkif6SuXo3ed/xm4+do365JCUfkaO6sKgT6jAb6tguFTAvgSc11cC7o3q
         fLLBjHO4adhbvJM4A7WVSLbYZLsheGanALSSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989696; x=1789594496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMS1hbLMg1gsIduehGePlq8QcJPEKyefk4+J94QrxTY=;
        b=KZK2t5HwJHzR6dx48mUUBgW89elTjncCSVvRKt1LV+1v1yx5XTEPh0c1ed3jNj3Cni
         SW8QpKZRG2EMbQbiTCol19j6JSTZ3JT8/QqYra8LiY7WpD05lp5596JGloBXKCp037DA
         +NVUGalKkEPV+xGAd+aIjO4kXizZs/cGIpeQ8q1eDCLOkQUsskW/dDO21yoPLO6mQ686
         slczD6pCvbgM/IXYJWmOvedQbBocEMflqY9Wfx2HW15SkQ+JmotYvhpKGYQ9CD8tpQon
         eKw9zrHZJzGMOhatUNGZ1tRrxdccJn30L6iMZ+Ai3sV9iOQrKyPArUnELzktrhrZCxG5
         dERw==
X-Forwarded-Encrypted: i=1; AKwUvBzJeZn9ja7nMcVMEA1NhlWS1ECLi79K4ET76dtvBwqd0ThHq0H68zhsD/9k5F1ho+g8UIG6WrNa0Ncge8QeaQVW@lists.infradead.org
X-Gm-Message-State: AFuF++mZR83PRdgO/jUDd62VUm/mMXKS/Uqk4Kvcp6By3cOEywj9NaUv
	zFFZ0huBZVsDBRl3L+OkNrLw9YIG4h3Sb0nSz7OZx3A5FgCI5h9LrxLUoZK44e+00WHFNyZpMup
	fRPVlWA==
X-Gm-Gg: AYBFou1odgq1Xt5KkqE1WujBn7yt6A45BRn63vy6H1nHUmpGYxXtynHCkLEhS7IqR5T
	dd9BxSPCp+yjWu9RTPeXKryFyX2hFtw0pjPaSTz2urlYHFdOp29PIxp3tT+8WMsyag/FwIdg3Ks
	3V0QTP1/c73b9ZUsjmW6dwFuECmV/v5KGTw25cviaAG2mGuFQdg4tgWb/g5mPK5AMprpaum+tCD
	h7SOYTdoVIypvgU0EQ0+/abBqalHNhV1iZRGrTFVHN96SS7BQf3taftInDtmvw36mhakDpH/0M0
	idoZsbOFRsbRe/cL+xjzB2rly0X/Uw2sZrT/S1IxVcSct1tRLYlHB0GDdwda+3VdDqp4esazQvt
	T/2PgcsjjVv/kpH1Ce2GsD6GiYhJaACq95gVfuRIW1Y2BaL8MS0H6wmmYvg8Kea/2hudr0vz9Pz
	KyYCcRqtLymRgRv7n8+sIIenQnCxZXE6Lku7idX8HaOvh7yozCFheDNWRKzxykPCIwa2015jMc5
	j/yC/kvOGNd4+CRxjEZLqsy7GCFDQM5EodXIg==
X-Received: by 2002:a17:907:9720:b0:c29:3c6a:8357 with SMTP id a640c23a62f3a-c293c6a90e2mr211579966b.28.1788989696189;
        Wed, 09 Sep 2026 14:34:56 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d501662sm838746266b.23.2026.09.09.14.34.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 14:34:55 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4869b6f8629so376513f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 14:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwln1T5dAHJOX2IRlAt61bUq12tJYIXhtp8FCidgHb/5mpOPprGI1926FMCq/J8uJ/VKXUHWMOkogJUzEy4RtuK@lists.infradead.org
X-Received: by 2002:a05:600d:640e:20b0:49c:fc6e:a3e1 with SMTP id
 5b1f17b1804b1-49cfc6ea77dmr253931435e9.32.1788989693915; Wed, 09 Sep 2026
 14:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260908013843.368364-1-justin.yeh@mediatek.com>
In-Reply-To: <20260908013843.368364-1-justin.yeh@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Sep 2026 14:34:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ui1XYRXb6ZqmAgWqF3TZaAcGqfsV6KodqPbk-sGqHdaQ@mail.gmail.com>
X-Gm-Features: AcwNN1UfpgY7Rw4Gy4MtVJB0f5LgowF3gCGJtAAU-5vzKs2VDiX_yyNNYapd3c4
Message-ID: <CAD=FV=Ui1XYRXb6ZqmAgWqF3TZaAcGqfsV6KodqPbk-sGqHdaQ@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: Unfollow the panel on shutdown
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_143458_580366_2D91F5C4 
X-CRM114-Status: GOOD (  27.38  )
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

Hi,

On Mon, Sep 7, 2026 at 6:38=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> i2c_hid_core_shutdown() sends SET_POWER(SLEEP) even for panel followers,
> but nothing in device_shutdown() guarantees whether the panel, and hence
> our own power, is still on by the time we get there.
>
> Do what i2c_hid_core_remove() does and just unfollow the panel.
> drm_panel_remove_follower() calls panel_unpreparing() only while the
> panel is still prepared, which powers us down properly; if it is already
> unprepared no transfer is attempted at all. On MT8196 the panel is
> unprepared long before us, so this also drops the ~2s i2c bus timeout
> from every reboot.
>
> Fixes: 96a37bfd232a ("HID: i2c-hid: Support being a panel follower")
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> ---
> Changes in v2:
> - Unfollow the panel instead of just skipping SET_POWER, so we no longer
>   depend on the panel having been unprepared before us (Doug).
> - Link to v1: https://lore.kernel.org/all/20260904035009.4114363-1-justin=
.yeh@mediatek.com/
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c=
-hid-core.c
> index 0ff07fdab442..c7e46004f513 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -1355,7 +1355,16 @@ void i2c_hid_core_shutdown(struct i2c_client *clie=
nt)
>  {
>         struct i2c_hid *ihid =3D i2c_get_clientdata(client);
>
> -       i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
> +       /*
> +        * Like in i2c_hid_core_remove(): if we're a follower, the act of
> +        * unfollowing will cause us to be powered down. Otherwise we nee=
d to
> +        * manually do it.
> +        */
> +       if (ihid->is_panel_follower)
> +               drm_panel_remove_follower(&ihid->panel_follower);
> +       else
> +               i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);

This seems right to me. One note is for panel followers if the panel
_hasn't_ been powered off by now, the drm_panel_remove_follower() call
will cause "i2c_hid_core_suspend(ihid, true)" to be called. That does
quite a bit more than just "i2c_hid_set_power(ihid,
I2C_HID_PWR_SLEEP)". ...but I think that's fine. I would expect most
systems would be powering off the panel at shutdown time anyway.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

