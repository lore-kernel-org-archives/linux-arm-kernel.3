Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC4EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC/H2cuyuVcF1bm+9AJAHRDxXDge73SORGMtEmq6LB0=; b=vQgo8ubP60fsoYls2JEsjQjqQo
	+MVg7abob52kcK7UFa9fQgaubqe0YONOlFI86bU7fxCBoi67nBMoJuKX+VfbT1g45dk0C3JhgN0BH
	N2NRaiRkvkEWCqBn9fBzo4NoCq8aKVNEvA33e4O5zbIGyzlinctUETn02Ui4uduAW6GpZg2GOtRCK
	CeiMZgw8cmgEPNXMdyW9nYhPnq3UNFze6Svk3b0TpA9jpgBc9VusXUVyed2tcy/0VW3s8xjCku07p
	r/O3yE70FzfTSDovo9fQVRHxTZHh5xKiznxFQX1piLWZHDKFUys+ucSud+srYZQenDQkDPTdxhsq8
	aoVmYA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCwY-00000002vNG-1Y6C;
	Wed, 26 Feb 2025 08:39:02 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCr7-00000002ty2-1Alx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:33:26 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E2DE92116C;
	Wed, 26 Feb 2025 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740558802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nC/H2cuyuVcF1bm+9AJAHRDxXDge73SORGMtEmq6LB0=;
	b=P2vP3XoRM7uZT+snoQbbmxka88487yAgQSpvfojnC0n1eO+UJTNQ0lcs4+Sj9fwEQ4B9PO
	8L/KArvlRZSFGHD34XbQXL6Bt34M0oi+R1re07K0IW4yws6KBh+UTOxZh/DH+AkRKOIWin
	C4/0657h2/b+JPvzgSZZrqORhxgbyQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740558802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nC/H2cuyuVcF1bm+9AJAHRDxXDge73SORGMtEmq6LB0=;
	b=y2wGj0tqcVc/Ja/3qtttFNmsIfdg+Z8lzaTfU3iiH0Xi4mba02xaqrGmiP78pNAqSOLLk2
	1dwERc9PAyY9cNBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740558801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nC/H2cuyuVcF1bm+9AJAHRDxXDge73SORGMtEmq6LB0=;
	b=cYHnReVTl7Yr9Vdue3qbwC2hy867Xeteb+3zbFxx2CPZkSxwgEtrwESy+uQIlwyJh2lWtb
	xVv4OBEsrXMrCUjfdNFadR9CZdi42w5u1I9HMdIUlxiNeBa9szGUZGABZIaw2ZSy4NvE+w
	ihnKlr0NwjXKE1OgAA+t/zOSAA+cwlA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740558801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nC/H2cuyuVcF1bm+9AJAHRDxXDge73SORGMtEmq6LB0=;
	b=2sFZCcjMBaEBPEMHi18r1j2crwh9pV9xUhWY1wzljfaQyYXlfbrV7ODNsVCRgxwtX5iRib
	sOub7FKwesCJfLAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9AEC71377F;
	Wed, 26 Feb 2025 08:33:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X5WkJNHRvme5SAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 08:33:21 +0000
Message-ID: <21d7745d-8fcd-484f-b1f2-82fd87dc8079@suse.de>
Date: Wed, 26 Feb 2025 09:33:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/rockchip: stop passing non struct drm_device to
 drm_err() and friends
To: Andy Yan <andyshrk@163.com>, Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 sam@ravnborg.org, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
References: <cover.1737644530.git.jani.nikula@intel.com>
 <f42da4c9943a2f2a9de4272b7849e72236d4c3f9.1737644530.git.jani.nikula@intel.com>
 <2c0a76c3.618c.19497bb4329.Coremail.andyshrk@163.com>
 <87plkcbfp0.fsf@intel.com>
 <730ee1d4.f63.1949b97fc99.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <730ee1d4.f63.1949b97fc99.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com,intel.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_003325_612328_697CF149 
X-CRM114-Status: GOOD (  25.16  )
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

Hi

Am 25.01.25 um 04:53 schrieb Andy Yan:
>
> 在 2025-01-24 19:43:07，"Jani Nikula" <jani.nikula@intel.com> 写道：
>> On Fri, 24 Jan 2025, "Andy Yan" <andyshrk@163.com> wrote:
>>> Hi，
>>>
>>> At 2025-01-23 23:09:09, "Jani Nikula" <jani.nikula@intel.com> wrote:
>>>> The expectation is that the struct drm_device based logging helpers get
>>>> passed an actual struct drm_device pointer rather than some random
>>>> struct pointer where you can dereference the ->dev member.
>>>>
>>>> Convert drm_err(hdmi, ...) to dev_err(hdmi->dev, ...). This matches
>>>> current usage, but drops "[drm] *ERROR*" prefix from logging.
>>> Frankly, I prefer the original version of the log.
>>> It is a platform driver, so it should use its own device.
>>> It is a driver that works in drm subsystem, so it's better to use "[drm] *ERROR*" prefix when logging
>> If you need to do struct device based logging that is not the same
>> device as the struct drm_device dev member, you need to use dev_err()
>> and friends. You can't and must not use drm_err() and friends.
>>
>> It's as simple as that.
>>
>> The current drm_err(hdmi, ...) usage is simply abuse of the macros, and
>> must stop.
> Perhaps when you initially designed this macros, you intended it to accept only drm_device,
> but your code implementation didn't enforce this restriction at the beginning.

C'mon. Are we really arguing about type safety now?

Patch 5 adds a little getter function that does the type check on the 
function call's argument.


> If that's truly what you intended, I suggest just reverting this commit that converting to use these macros[0],
> as neither drm_err nor dev_err can maintain consistency with the original log of this driver.
> Alternatively, as suggested by Sam  in the initial submission of your patch 5 years ago,
> there should also be a macro similar to drm_dev_info(device *, ..).[1]

DRM code tends to keep a reference to the drm_device somewhere and 
fetches it if necessary. For this patch, it should be possible to fetch 
the DRM device from struct rockchip_hdmi easily. Just do

   drm_err(rockchip_hdmi_drm_dev(hdmi), "...");

This would resolve the problem without new logging functions and keep 
the "[drm]" prefix to the messages.

Best regards
Thomas


>
>
> [0]https://lore.kernel.org/linux-rockchip/20240813-dw-hdmi-rockchip-cleanup-v1-1-b3e73b5f4fd6@collabora.com/
> [1]https://lore.kernel.org/dri-devel/20191212215303.GA11520@ravnborg.org/
>
>>
>> BR,
>> Jani.
>>
>>
>>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>>
>>>> ---
>>>>
>>>> Looks like it's possible to hunt down the struct drm_device in most of
>>>> these cases, if that's desired. This was the simplest change.
>>>>
>>>> Cc: Sandy Huang <hjc@rock-chips.com>
>>>> Cc: "Heiko Stübner" <heiko@sntech.de>
>>>> Cc: Andy Yan <andy.yan@rock-chips.com>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-rockchip@lists.infradead.org
>>>> ---
>>>> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c    | 16 ++++++++--------
>>>> drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++--------
>>>> 2 files changed, 16 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>> index e7a6669c46b0..f737e7d46e66 100644
>>>> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>> @@ -203,7 +203,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>>>>
>>>> 	hdmi->regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
>>>> 	if (IS_ERR(hdmi->regmap)) {
>>>> -		drm_err(hdmi, "Unable to get rockchip,grf\n");
>>>> +		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
>>>> 		return PTR_ERR(hdmi->regmap);
>>>> 	}
>>>>
>>>> @@ -214,7 +214,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>>>> 	if (IS_ERR(hdmi->ref_clk)) {
>>>> 		ret = PTR_ERR(hdmi->ref_clk);
>>>> 		if (ret != -EPROBE_DEFER)
>>>> -			drm_err(hdmi, "failed to get reference clock\n");
>>>> +			dev_err(hdmi->dev, "failed to get reference clock\n");
>>>> 		return ret;
>>>> 	}
>>>>
>>>> @@ -222,7 +222,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>>>> 	if (IS_ERR(hdmi->grf_clk)) {
>>>> 		ret = PTR_ERR(hdmi->grf_clk);
>>>> 		if (ret != -EPROBE_DEFER)
>>>> -			drm_err(hdmi, "failed to get grf clock\n");
>>>> +			dev_err(hdmi->dev, "failed to get grf clock\n");
>>>> 		return ret;
>>>> 	}
>>>>
>>>> @@ -302,16 +302,16 @@ static void dw_hdmi_rockchip_encoder_enable(struct drm_encoder *encoder)
>>>>
>>>> 	ret = clk_prepare_enable(hdmi->grf_clk);
>>>> 	if (ret < 0) {
>>>> -		drm_err(hdmi, "failed to enable grfclk %d\n", ret);
>>>> +		dev_err(hdmi->dev, "failed to enable grfclk %d\n", ret);
>>>> 		return;
>>>> 	}
>>>>
>>>> 	ret = regmap_write(hdmi->regmap, hdmi->chip_data->lcdsel_grf_reg, val);
>>>> 	if (ret != 0)
>>>> -		drm_err(hdmi, "Could not write to GRF: %d\n", ret);
>>>> +		dev_err(hdmi->dev, "Could not write to GRF: %d\n", ret);
>>>>
>>>> 	clk_disable_unprepare(hdmi->grf_clk);
>>>> -	drm_dbg(hdmi, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
>>>> +	dev_dbg(hdmi->dev, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
>>>> }
>>>>
>>>> static int
>>>> @@ -574,7 +574,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
>>>> 	ret = rockchip_hdmi_parse_dt(hdmi);
>>>> 	if (ret) {
>>>> 		if (ret != -EPROBE_DEFER)
>>>> -			drm_err(hdmi, "Unable to parse OF data\n");
>>>> +			dev_err(hdmi->dev, "Unable to parse OF data\n");
>>>> 		return ret;
>>>> 	}
>>>>
>>>> @@ -582,7 +582,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
>>>> 	if (IS_ERR(hdmi->phy)) {
>>>> 		ret = PTR_ERR(hdmi->phy);
>>>> 		if (ret != -EPROBE_DEFER)
>>>> -			drm_err(hdmi, "failed to get phy\n");
>>>> +			dev_err(hdmi->dev, "failed to get phy\n");
>>>> 		return ret;
>>>> 	}
>>>>
>>>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>>>> index f41151d49fca..3d1dddb34603 100644
>>>> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>>>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>>>> @@ -242,7 +242,7 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
>>>> 	if (drm) {
>>>> 		changed = drm_helper_hpd_irq_event(drm);
>>>> 		if (changed)
>>>> -			drm_dbg(hdmi, "connector status changed\n");
>>>> +			dev_dbg(hdmi->dev, "connector status changed\n");
>>>> 	}
>>>> }
>>>>
>>>> @@ -472,7 +472,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>>> 		}
>>>> 	}
>>>> 	if (hdmi->port_id < 0) {
>>>> -		drm_err(hdmi, "Failed to match HDMI port ID\n");
>>>> +		dev_err(hdmi->dev, "Failed to match HDMI port ID\n");
>>>> 		return hdmi->port_id;
>>>> 	}
>>>>
>>>> @@ -496,20 +496,20 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>>> 	hdmi->regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
>>>> 						       "rockchip,grf");
>>>> 	if (IS_ERR(hdmi->regmap)) {
>>>> -		drm_err(hdmi, "Unable to get rockchip,grf\n");
>>>> +		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
>>>> 		return PTR_ERR(hdmi->regmap);
>>>> 	}
>>>>
>>>> 	hdmi->vo_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
>>>> 							  "rockchip,vo-grf");
>>>> 	if (IS_ERR(hdmi->vo_regmap)) {
>>>> -		drm_err(hdmi, "Unable to get rockchip,vo-grf\n");
>>>> +		dev_err(hdmi->dev, "Unable to get rockchip,vo-grf\n");
>>>> 		return PTR_ERR(hdmi->vo_regmap);
>>>> 	}
>>>>
>>>> 	ret = devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
>>>> 	if (ret < 0) {
>>>> -		drm_err(hdmi, "Failed to get clocks: %d\n", ret);
>>>> +		dev_err(hdmi->dev, "Failed to get clocks: %d\n", ret);
>>>> 		return ret;
>>>> 	}
>>>>
>>>> @@ -517,7 +517,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>>> 						    GPIOD_OUT_HIGH);
>>>> 	if (IS_ERR(hdmi->enable_gpio)) {
>>>> 		ret = PTR_ERR(hdmi->enable_gpio);
>>>> -		drm_err(hdmi, "Failed to request enable GPIO: %d\n", ret);
>>>> +		dev_err(hdmi->dev, "Failed to request enable GPIO: %d\n", ret);
>>>> 		return ret;
>>>> 	}
>>>>
>>>> @@ -525,7 +525,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>>> 	if (IS_ERR(hdmi->phy)) {
>>>> 		ret = PTR_ERR(hdmi->phy);
>>>> 		if (ret != -EPROBE_DEFER)
>>>> -			drm_err(hdmi, "failed to get phy: %d\n", ret);
>>>> +			dev_err(hdmi->dev, "failed to get phy: %d\n", ret);
>>>> 		return ret;
>>>> 	}
>>>>
>>>> @@ -564,7 +564,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>>> 	connector = drm_bridge_connector_init(drm, encoder);
>>>> 	if (IS_ERR(connector)) {
>>>> 		ret = PTR_ERR(connector);
>>>> -		drm_err(hdmi, "failed to init bridge connector: %d\n", ret);
>>>> +		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
>>>> 		return ret;
>>>> 	}
>>>>
>>>> -- 
>>>> 2.39.5
>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-rockchip mailing list
>>>> Linux-rockchip@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>> -- 
>> Jani Nikula, Intel

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


