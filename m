Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E36C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6DdaVZ57Cvm8wo8IqS4pyHaIv3vcpLo2R5s1tMtqxI=; b=EQc8KJ++q/KKIAVOH/Wlue3nos
	GGxM1IKGXjHmm1Ew2DlEIzlaSsZ9qMa/HnNBMe/n3muPyLio6txdkZc+kPgsTExuSRSS8edko52fD
	YKLvPLISrcW7dNr9OBnHegkR/b+IepBhzD9MbLTI3pUkSyQ9+Ol5pJ0DCC0whgQd3Y4lj8JW3g8KU
	osIJdSJc44Xl2JNcrzCVFebz7tC3dY4ddhmFt/AA+5LeLUEhfqoVY9xULc6id/otXOlAEg/W6321q
	nqpa869rgZcZweUH20tsMf00S9MqAS2veh1bMKDUbJsrPV2WjNzeizWtcYJqDwPf3MDXILZBwDukV
	/3uTkHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKl3-00000002k4e-35Fe;
	Mon, 27 Jul 2026 12:48:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKl0-00000002k3f-3HKF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:48:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4954dff6536so19811665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785156512; x=1785761312; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J6DdaVZ57Cvm8wo8IqS4pyHaIv3vcpLo2R5s1tMtqxI=;
        b=fnb4Wdyd6sWGyp5BtG/Oth2YdZqBrFBDt/tB3V5VNDEJQlOkBZVxb6T68Yodn3Askq
         uKvsspjaiyWB69pP24FySNcQevA4tNKAxjx8fdWfFAld3phpq66nBI24NCt0NlPoKqPK
         hxGdz1y4TsGQLlFMa91oQbULpltcRB5F1D4kXUqXnsnxBjCez+/3/pIbuUv9tq1yvGdw
         UlpFYOWeBiiqC4O/DjYJ858X8hFa7BME9Ss7s/b0eRexKECLPzKOVkUWfAhxn0K74sL+
         qsf/bEU9BpWPno0wtpnU9TFKai8wB+lky76OqsPEMewILfX2sPWiNwf4YRiQw79hfgSU
         q7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156512; x=1785761312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6DdaVZ57Cvm8wo8IqS4pyHaIv3vcpLo2R5s1tMtqxI=;
        b=ssLLpTjZpV2inVhAMQgC8bxz2dNsC3bPDCEbqITv9Rvvi2gEkFOzybfPXV5UKZTDEV
         h5pxogkUtOjr52sDj1VbqXGztkXRDJFWaSGjnk3JmhHuz09F+EZ8uPSEpQtlY4Y1HJhV
         0m8z7e3KJ61qMCIdyVJGqGWCD6H/ZG6tiqdugNk+EHJqRxcNlglmdA/GiDXY3nQR4ISN
         vj7Ftn4QNfbOyezvEDdeFLLJovGnAfCROSLMLBoQKP55ZjbODDkSG3S4/E9h65WrEBsK
         3ss7lFFjpW9R4234DbnEaGErLzuExjahtBqF/eDTN8//6aeOdudOep+rOeUjjueTW8Td
         /4Fg==
X-Forwarded-Encrypted: i=1; AHgh+Rpoxk+IV8yt/3okaZZy29xyfiA1EIDpenEwMY7cOzEXihdpM+CeqiGnwic7FpU8VBVCc9p70JLm6WLPxjJArM/c@lists.infradead.org
X-Gm-Message-State: AOJu0YyEABG44uCSYPWZwDnbI5JTz+yjcWGQ3H/jbOQvqW443SdQypM6
	RksJH+TXszI+9jB1CfOs5ITD1VAn4brUnnuTRKILapc6tUR66h0dzIRx
X-Gm-Gg: AR+sD12+Ng2E8ctfk/0/gFGlNc+X8tPizGC3FLZQLqMDV57b4YKazmDC2GZkAIMHdL+
	wjBnlxDtF6PQUQBP7uuj6ilCUQiRpWAPNdByf2maWiA8XQ6mwmK/larx64U0j1Eic0cnHXfDBSl
	LkfpBrFSMlEI2fGgAtpX/czVkmyY9LTppBLUH9kxYjHArsOUTwddiFo8IzH8nSZy+XkVFwMs2xe
	pPGyLsnfo21+kegF96Tbqd/7ZpobNfwvqz0sdLslt/huIL8Ht1sF1oL9CnJsuxrkvPgXtGU/r9K
	Z9Qk52p5v8LRrAJ3mZM0roPYTeQIFZpTGN677OGZPeiDlgfZvl6l5N6gbyelGbbE9vZ4bznFgGY
	xwVj5XXMw1E+OvK2p7pR34dZcckWCBvyCOIVO7qekv3n9hfktWxEvs++g0t0xexKaJX70sNwcuw
	==
X-Received: by 2002:a05:600c:8b47:b0:493:f176:dc69 with SMTP id 5b1f17b1804b1-496b572e886mr119294425e9.37.1785156512062;
        Mon, 27 Jul 2026 05:48:32 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:e302:2368:a20c:3848])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4858cfdsm238084945e9.3.2026.07.27.05.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:48:31 -0700 (PDT)
Date: Mon, 27 Jul 2026 14:48:30 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Adam Thiede <me@adamthiede.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
Message-ID: <amdTnudq48tZUTG2@owl5>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com>
 <aleM9Wy9otpd6Je3@owl5>
 <aRN3_2FHX8XmTcwduTAPwz4UFde4B0tbB09ajyeUg5qZxiIYMmbvMkG7CPoNTl4iySYMZawbLMWijO47R22gkg==@protonmail.internalid>
 <65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
 <87h5m0mkca.fsf@geanix.com>
 <alpTEPsy-SIQv_Oc@owl5>
 <b26a4890-12e9-4995-a71d-d0b7458b1570@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b26a4890-12e9-4995-a71d-d0b7458b1570@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_054834_843572_F2CA8B22 
X-CRM114-Status: GOOD (  19.59  )
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

Hi Thorsten,

On Mon, Jul 27, 2026 at 02:28:56PM +0200, Thorsten Leemhuis wrote:
> [top-posting to facilitate]
> 
> Gary, Angelo, what's the status here? It looks like this fell through
> the cracks -- or was this issue fixed in between somehow? If yes: great!
> If not: Would be good to finally resolve this, as we are long past "fix
> within a week" rule of thumb from Linus:
> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed

Not much happened I'm afraid. The status as I see is:
- this patch is necessary to have TI SN65DSI83 working
- this patch also follows the DRM guidelines saying that HS clock must
  be enabled during pre_enable (see previous answer / [1])
- this patch has been successfully tested against MIPI-DSI panels (by
  Angelo) and LVDS panels via TI bridge (by myself)
- Adam reported an issue with another bridge (PS8640) where resume is
  broken
- Esben offered a patch to the TI bridge that would fix the issue we
  were seeing in the first place.

But for the last two points, I'm not sure this calls for a revert yet:
- enabling HS clock in pre_enable still is what should be done [1]
- maybe the issue Adam is facing is due to the bridge driver instead as
  it could not be reproduced with another setup
- Esben patch would break the SN65DSI83 init sequence, suggesting that
  the culprit really is the MIPI bridge for not following the HS clock
  requirement in pre_enable instead [2]

So if we agree on the fact that HS clock must be set during pre_enable
then I don't see a reason to revert that commit.

Regards,
Gary

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_bridge.c#n169
[2] https://patchwork.kernel.org/project/dri-devel/patch/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/

