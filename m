Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4C7E77199
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJSZIXJSkHeJBkdcb6ya9oMRq6rzriaUtPDL7vlAVQw=; b=DEPY0O8WM4gMB9BAjNH7GIbKHh
	ZU+XRgUPwclSeJCg5W4mk6EmbliK1ZYu30a5LW5MqCS61P+UoXKAlwyuD8S+ozQr5jKMRx37QXwnW
	UJO4OLvi+7AtHv05XmOKgIKE8TMiICMZg8f3H6lIZaBwgHg9gJzdJJWi5M+wlcggpmZ4j0lyby8Up
	UXtU8LarCnSmcIMHjFT/Dp7dSFUj20ZlUsIKilNqBbX9JOqdSq2rQaleqe8mx+fe4tAI1IjB9JOOf
	F94oCslHmtrfAxCWKWkDmtBOABrSITpPITLwu1y81cdC8Uf1ukm11UIXtwmNzWGwr90dk3wFnpGRu
	m8v8ctMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoPX-00000001drT-0U61;
	Mon, 06 Jan 2025 14:48:55 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo9o-00000001aMq-3hdQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:32:42 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e46ebe19489so18293430276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173959; x=1736778759; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fJSZIXJSkHeJBkdcb6ya9oMRq6rzriaUtPDL7vlAVQw=;
        b=kJw8LumpMKyLYmrquxvbJ/YkBXfubB/aeYQLjiDVXzDJEr6aYWrhBHixq2aiI07mYc
         m9UEi6QDv21Gn76Kb0NIvRyA/xzSYodOQwji5H5vHaWbtqosatImZrs2xMaklT9E9KVW
         g4g2VSDgcFkEyyuRYyStWGpecf5LiqV4wYcj94M3hV/lrXfhMjdF3zfNq/SVUV9cA0Io
         HF4imWzBGJw3vAx8GPMO71WCgJHU7N2K9SXwSaBYynO+q22JPZ5vbDPXeZfQf6a9hxR0
         9flXmYVBnznCPX0Z5+05aXE0OJ+zmo/8dJVE3nRc8gVf7bHdEV+H1PqmZGyigyNqHA8O
         wNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173959; x=1736778759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJSZIXJSkHeJBkdcb6ya9oMRq6rzriaUtPDL7vlAVQw=;
        b=vaOiG2v4uaoxdGgogW5mtvH3CjJCXX/tiQOhNHQk3Dvs17ZZ9QArX3zKzxwohCQXxK
         vm0iliLC0xgaO2X40dUvQMo0cKlmWHXM8AMU6Pl7huMRY2wvpb8VTu68Dp3zG8uHDh6n
         bWWUdChCD8mTgOB7Er8WiCW/l37Csyj0Dwm5WtUQtlyXg3ISZu0sPyIgTa4ucgnG0Dbg
         E+g7g1F2o//ipunbBP3lAbpp0CQAwCVbiKQvMpMobh9jHRW59CV6YEZuZhB5ozz4Sikk
         Ncvb51AXGytmBr5CucD39yryd37HGvZQD7sfLaQsKisAQbggf58mDpXLtGDbipLG8Nlh
         8L6w==
X-Forwarded-Encrypted: i=1; AJvYcCW88gEts0mIicfAlRzbdT0zN6rx5XgIzxEL4VSgTt+umwx1aGh6tsPUMgWXeeD0Icoi5rsLIYxu64P4NBfaHYlg@lists.infradead.org
X-Gm-Message-State: AOJu0YwMZ4ppV3S21mxDwt7evpz71s9xaCrH5wa2HfN9NeWXj4uxCcoy
	EuH25gzWqKCXI735lzCzWPd5qrM8zCqdaUZFD/yuiMBxfKJdavvKsPJe+SjDIzlVBt1P+tPwr6Q
	2W34f/2nLr+qu40QcnQSS+vcEos4R81rFiFQggg==
X-Gm-Gg: ASbGnctIa4IGpxV8Jepe/eJuOImNVQFQJ9OQP0AppZO8XIDdDO9SOa37+OF0/zD0kEQ
	qU0AmhhBytXY+j3P1k6RRKYb1EerO/4oYphAmxeQkVTQhtNUrqAngeKel6WXlJyOkJdSnpA==
X-Google-Smtp-Source: AGHT+IHmvXuwvGSdBr59QFJmGXR85prnYmkeJd5ryoQXMvTWEemEChNFf5E52WxYsQ1l+y7kBas5ggRo21B4VIcMRB4=
X-Received: by 2002:a05:690c:7106:b0:6ef:7640:e18a with SMTP id
 00721157ae682-6f3f820f277mr479003527b3.31.1736173959645; Mon, 06 Jan 2025
 06:32:39 -0800 (PST)
MIME-Version: 1.0
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-14-damon.ding@rock-chips.com> <e52pbjnusvuoqiyoorjr5msrfmgeqs2jt5sk6zcesvzy7cszzk@fzrtpsjoklgu>
 <e2a18f8c-dc38-4b12-968e-dd369cb34cb4@rock-chips.com>
In-Reply-To: <e2a18f8c-dc38-4b12-968e-dd369cb34cb4@rock-chips.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 6 Jan 2025 14:09:34 +0200
Message-ID: <CAA8EJpo5aE4itm8MTeCpqns5eLuWj0TaZW5qwrw02_Zc73NNiw@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] drm/bridge: analogix_dp: Convert
 &analogix_dp_device.aux into a pointer
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com, 
	cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_063240_963969_22019CBA 
X-CRM114-Status: GOOD (  29.84  )
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

On Mon, 6 Jan 2025 at 13:04, Damon Ding <damon.ding@rock-chips.com> wrote:
>
> Hi Dmitry,
>
> On 2024/12/30 21:35, Dmitry Baryshkov wrote:
> > On Thu, Dec 26, 2024 at 02:33:09PM +0800, Damon Ding wrote:
> >> With the previous patch related to the support of getting panel from
> >> the DP AUX bus, the &analogix_dp_device.aux can be obtained from the
> >> &analogix_dp_plat_data.aux.
> >>
> >> Furthermore, the assignment of &analogix_dp_plat_data.connector is
> >> intended to obtain the pointer of struct analogix_dp_device within the
> >> analogix_dpaux_transfer() function.
> >>
> >> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >> ---
> >>   .../drm/bridge/analogix/analogix_dp_core.c    | 92 ++++++++++---------
> >>   .../drm/bridge/analogix/analogix_dp_core.h    |  2 +-
> >>   .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  2 +-
> >>   3 files changed, 50 insertions(+), 46 deletions(-)
> >>
> >
> > [...]
> >
> >> @@ -1127,6 +1128,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
> >>
> >>      if (!dp->plat_data->skip_connector) {
> >>              connector = &dp->connector;
> >> +            dp->plat_data->connector = &dp->connector;
> >>              connector->polled = DRM_CONNECTOR_POLL_HPD;
> >>
> >>              ret = drm_connector_init(dp->drm_dev, connector,
> >> @@ -1535,7 +1537,9 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
> >>   static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
> >>                                     struct drm_dp_aux_msg *msg)
> >>   {
> >> -    struct analogix_dp_device *dp = to_dp(aux);
> >> +    struct analogix_dp_plat_data *plat_data = to_pdata(aux);
> >> +    struct drm_connector *connector = plat_data->connector;
> >> +    struct analogix_dp_device *dp = to_dp(connector);
> >
> > I see that Analogix DP driver doesn't support
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR, but at the same time I don't think this
> > is the step in the right direction. Instead please keep the AUX bus on
> > the Analogix side and add an API to go from struct drm_dp_aux to struct
> > analogix_dp_plat_data. Then your done_probing() callback can use that
> > function.
> >
>
> It is truly a more concise way.
>
> In the next version, I will add the following functions on the Analogix
> side in order to get the pointers of struct analogix_dp_plat_data and
> struct drm_dp_aux on the Rockchip side. And the way has already been
> verified.

LGTM, thank you.

>
> struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct
> drm_dp_aux *aux)
> {
>         struct analogix_dp_device *dp = to_dp(aux);
>
>         return dp->plat_data;
> }
> EXPORT_SYMBOL_GPL(analogix_dp_aux_to_plat_data);
>
> struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
> {
>         return &dp->aux;
> }
> EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
>
> >>      int ret;
> >>
> >>      pm_runtime_get_sync(dp->dev);
> >>
> >
>
> Best regards
> Damon
>


-- 
With best wishes
Dmitry

