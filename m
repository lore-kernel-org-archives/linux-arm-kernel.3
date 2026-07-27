Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF5AC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxswdzoAQvQGkPWUS0AeYk7qhI5OcIZi4EoyckriCiQ=; b=RQ/N107zBzUis8dZBc+lLd3/EH
	vyoSFACULH5326qViAy6l+n08tt/ZnUIY0qD2uId2w+0Khol6XryanEmNx4I56J6V5mfnwWD8slmL
	Idm9RzY2EbHspNCg1b1oSTDdEVgW0ewtipuo8Ga7A1+h72OEqvwnN1mOQRlvINGLRKoW4HimaWzKf
	UkKMllSfZ9mrXNHmFFymjAC8jjn6YkyngxGHKlHZozad/Ur6Xy3306pmoEPTlO2hJWOT6jfz7Vhrw
	Wx8Dv6M3Zw97AEKB2oX8ChRvUDWsPd/NTJXgFH9JM1zNCfkfP36xFdD5ABV7TBy/ahywIjikpfCPq
	sgVlmRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKp8-00000002kYZ-2BMR;
	Mon, 27 Jul 2026 12:52:50 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKp5-00000002kXt-185S;
	Mon, 27 Jul 2026 12:52:48 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4h7z5h4RMrz8tyC;
	Mon, 27 Jul 2026 14:52:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adamthiede.com;
	s=MBO0001; t=1785156760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PxswdzoAQvQGkPWUS0AeYk7qhI5OcIZi4EoyckriCiQ=;
	b=eyaQO3XoQJC0CJQ2LEoHk1Iumkqt80kZxvuK3C3ZuwmdLxQB9WwA+Tzfh+qJwzCDlDAI3c
	V3L+ARVx77vsqLQ8HF2dn8oE0tsoYQWkr5ZUygs4zTLYMP5wDqolfgD5nhZBQpAELXxAWf
	tFT5A6KHSkjN6rAJLUCwRDPxk6vtXssomCJKReiXjGWyzaHPAxMSC9sRldc51ffdUlkZ+o
	txCBM5DUQ+QTwn4Goo5K+lRuyK4XonvfvsSk/kL3XrPfn850KMJpaTFtaiMH5bHC1wbGfk
	Ob0CLVWlMD+6oAErfqD3w19bVCRg+mYHR5Ta+CMCJlWMtTCygbgGxGp9FyWGjg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of me@adamthiede.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=me@adamthiede.com
Message-ID: <e18e4d30-8c54-4b4e-9d32-cfb8bf974b9c@adamthiede.com>
Date: Mon, 27 Jul 2026 07:52:31 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: Gary Bisson <bisson.gary@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Esben Haabendal <esben@geanix.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com> <aleM9Wy9otpd6Je3@owl5>
 <aRN3_2FHX8XmTcwduTAPwz4UFde4B0tbB09ajyeUg5qZxiIYMmbvMkG7CPoNTl4iySYMZawbLMWijO47R22gkg==@protonmail.internalid>
 <65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
 <87h5m0mkca.fsf@geanix.com> <alpTEPsy-SIQv_Oc@owl5>
 <b26a4890-12e9-4995-a71d-d0b7458b1570@leemhuis.info> <amdTnudq48tZUTG2@owl5>
Content-Language: en-US
From: Adam Thiede <me@adamthiede.com>
Autocrypt: addr=me@adamthiede.com; keydata=
 xsBNBF+n+90BCAC2ZRLVcvdXDgfY7EppN05eNor3U7/eeiNCCEIWZkYLhikUEP1ReLGBkXpK
 Pc70hfnKAKkCoth3IwhDty9WXMNU+iLNei4ieb2luW+UqluR6xIUIA+txahMU9YcjVaQTKf/
 yZWO4yl6pfBPCxC2UdPZKBAdGoi5NnE0ABFNbhBETQhhBic533lZn33ByupfI3acECnQdjgQ
 llCUpDbw4I+S/N1iFiEHcbMXH7ZB00e3IYNorZ1E9v7p++5rDY1fQ9gXpieg1vFKwSq1NJWo
 9xx336YjaTUbX0EwrdKd9l8AktA3yRjckaK5TAcwSQaDtHvhpbl4ebvPhtwHh699MroXABEB
 AAHNH0FkYW0gVGhpZWRlIDxtZUBhZGFtdGhpZWRlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIG
 FQoJCAsCBBYCAwECHgECF4AWIQQtG9pGQ7sz3tf8M/kC7fV9o/vRzgUCZL1HxQAKCRAC7fV9
 o/vRzgyRB/wLqRCvvWhQCMgvzeKvru9wcXquhb77K8H/ByLbfiT8YBuP3lZFVh0IQhgO9Ylk
 fIoOJE4V+jjxyOnO2d9xjGbvAmmR6yT0gfLzSVWqrC4k+V9MWLv43nrNzxt41dvo5j824FAl
 X+zaiRZCdO8Jtxg5Elpiop2SKLi1utX1Z8i6YZh+ccJZlchUBAGUTk+D4UjK7vUcjLWT96ya
 CtdtTfXyw36CvGOPEWfc6++Kkl/5sgej1i7biPYzu/r0vssaQYTXKSrv6Cfa3Maa89ASiTtv
 q4qmhLnJeCrPxWlRAf6LEizeBEkOasYni2u8sp4wBezEq45Ozu45sfPkqLpPolG7zsBNBF+n
 +90BCADBRt+vrToRBEG580n77S99qSEkbKD+oJtCVyovnjMNkg0K9UG68LIeCX/ezngiV1M8
 JISvw5iFOuUFqGX/1hLl9wgt/YpuIrgWOp8XxkotavTCloLDvQmufJPO1L8bnnA+WgP2YgVZ
 5MJTj/t4DI+yQgysEjsH8aurHO2uuqgJE+xK+2dy6Cl/wskuGxObksSPmmFH5PH0Joziwrtl
 61ouLE2XwKbkMgIGEKkbFgbfwz3/QuLZGBni+OOtLzXeZ9wNTW/AHUPy6S9U4F+5z6/09fVT
 tTH0cvrgAGjbASlYx2VqGONXAsxCfjulq6ryJBFlPLp949c/JTTgOojukCSbABEBAAHCwHYE
 GAEIACACGwwWIQQtG9pGQ7sz3tf8M/kC7fV9o/vRzgUCZL1H0gAKCRAC7fV9o/vRzlamCACs
 vHw+0heTm+BfC3S8DUST6889gidIIwdqBep1ByzetCph7Bq8Y8BlT5YTX0u/bSKkxCzFgeTm
 vC341Q09ST2XjLAl1ZTdzGhH9gcgYyOw34pr5fPQRJLB392mPzD8YReRzciNbhWzj+DLgeVe
 ouyfGajd6jDjkf4FEq+trQLGZhpfsKn3JnDbzBUs945D50l/vz9q/QN3qZO+H4F6g8ZeMnqo
 FOEFN26xVtdEDr+0DNFsbgKmEzs675kdAY78ZZdbEetX/FSknxJ+FK1ZW3J7Yswwulj34AXP
 LB49Mk8Ot7fo6mdt0DkV11JS9LmKxKvpY+KTlrKG+i7pVCSZvVUx
In-Reply-To: <amdTnudq48tZUTG2@owl5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4h7z5h4RMrz8tyC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_055247_471860_AB7050D3 
X-CRM114-Status: GOOD (  23.13  )
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

On 7/27/26 07:48, Gary Bisson wrote:
> Hi Thorsten,
> 
> On Mon, Jul 27, 2026 at 02:28:56PM +0200, Thorsten Leemhuis wrote:
>> [top-posting to facilitate]
>>
>> Gary, Angelo, what's the status here? It looks like this fell through
>> the cracks -- or was this issue fixed in between somehow? If yes: great!
>> If not: Would be good to finally resolve this, as we are long past "fix
>> within a week" rule of thumb from Linus:
>> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
> 
> Not much happened I'm afraid. The status as I see is:
> - this patch is necessary to have TI SN65DSI83 working
> - this patch also follows the DRM guidelines saying that HS clock must
>    be enabled during pre_enable (see previous answer / [1])
> - this patch has been successfully tested against MIPI-DSI panels (by
>    Angelo) and LVDS panels via TI bridge (by myself)
> - Adam reported an issue with another bridge (PS8640) where resume is
>    broken
> - Esben offered a patch to the TI bridge that would fix the issue we
>    were seeing in the first place.
> 
> But for the last two points, I'm not sure this calls for a revert yet:
> - enabling HS clock in pre_enable still is what should be done [1]
> - maybe the issue Adam is facing is due to the bridge driver instead as
>    it could not be reproduced with another setup
> - Esben patch would break the SN65DSI83 init sequence, suggesting that
>    the culprit really is the MIPI bridge for not following the HS clock
>    requirement in pre_enable instead [2]
> 
> So if we agree on the fact that HS clock must be set during pre_enable
> then I don't see a reason to revert that commit.
> 
> Regards,
> Gary
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_bridge.c#n169
> [2] https://patchwork.kernel.org/project/dri-devel/patch/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/
I'm also happy to try out any patches and report back, too! Just point 
me to it and let me know which release/RC I should apply it to.

