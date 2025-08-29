Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E555CA1000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 19:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMllst7gcBdZpXi7zdiPGvGRd+qrzm4OkoKr77sAH60=; b=hIBpKfNbFjwzsUT3ZI9du6iXll
	x/wDv4Ca6X1VL81Lkmq6eavjh6Z47PYL3q+jcuiS24dkxO/3oUPxYi/ePJSaFF+yTpo9y77B/lFwh
	P6/o6U5coIugtMPHYNjYCcvy0R5Sktrjevu5wMLJQfFZjyh3bVqs27v5yihPkGSrZVmrmpKN2mi76
	6+1CVo78DTMOh2Fya4fnI6NiKdJUK6EVvDbzKEsxTbPEe97BNPnzAkW9SqNBf0xvJ5efLsDA3Wh+Z
	nwmlYU3pATg1q5Vfu823bXOY3PVz63CXlItMALox2oxYQdqeEBR6YHaVkxaYVufN+33W2jOh8ojBV
	nargDuZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4tN-00000006l3t-3vGk;
	Fri, 29 Aug 2025 19:36:09 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1DB-00000006EVD-1oyy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:40:22 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7f84c170734so262904985a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 08:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756482020; x=1757086820; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vMllst7gcBdZpXi7zdiPGvGRd+qrzm4OkoKr77sAH60=;
        b=frtE3WzRPir046AXoIPi5CQLh/ULmoA77buvNsgOBhx9phfSbKMRq9LuC58sJs1I6a
         +jj7J9qfNQgKLtJYk+IN6gntx4waA4EYS2lVaLSl9FFpsuPEbl/hiDGjY7F8YihH0KHq
         8M89vTDDNisWILOU/moVAVJpyzCwErslR+PQNjd8IEkbrXN3HSFtEAc2VmfbnwN0CDoI
         GW/UQYHrlIxLJ8ExoXt3VRqc8IY5VsM9ij4v9RbYiueimiULH5nIsMdCGgGQ8c0sHwNI
         d4b1Imn+kCWB1XRs/gpOGlM5P9TPkPU82MfPWa8+/p5YH8XfebhgKiDzzXlQL+WMRERy
         sQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756482020; x=1757086820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMllst7gcBdZpXi7zdiPGvGRd+qrzm4OkoKr77sAH60=;
        b=V/FWfvIoroqgyKaQ//hUiEPcnxQx3zwCwtv+cbSszoEupfAJXJfU3sxcEtnPjiQh3r
         ncuSdYJrTehRmHVsD/jLE7matG0ylkmdaSUqcfHmyP2nk/DG5hvDNM3hY42nbNNmVPGc
         uJuvGyevt4oRp91vW3aASdLqG4HF0Sm3YeNfnxDeIo3gr2ENux9zcupS7g/95SM67z+Q
         p4mvy9WiBJGcIN5TGZwzDWAlRbu0/0anylI4tfuehMTUaNmVm0nzLhA44UrepNIPKRdY
         KKTIbb2BjkUxX8bf5K1tq+0YWAwWxIJ1P41KyulUT0qBj1Es+5IKFwkEd+UMfVdU18Uq
         Ngqw==
X-Forwarded-Encrypted: i=1; AJvYcCXQGEwU/ke5OA3ICmDkoA8QeWKRNOSMl896ZMjhsLH8A93MCPZDvJ0FdP81PKuwNIRLlyGqOVvabQTnMNUlpGqh@lists.infradead.org
X-Gm-Message-State: AOJu0YyIsmX9yOmmKBgvNv7f6XiAnBP8bnTWzbRT5dQnuUJ+HART6HV3
	vjLiw2E8t9dZLaq0eAJpNkpSgaTLlE328btm/j4ztr4Lh8pT0YFLQPQ4Z24vBkBgdQIq7gv5A++
	ovFHfYRpQTRkXeQdZjv6NdlBRlel4Cgt/9ayi4JA8Aw==
X-Gm-Gg: ASbGncshB0/xcO/Fzm3Tl8siom9G2305JfbBpdkW/OZZL12+ClPOpgrWQ9+HejTCFjt
	mEWbubVfRydvInpGDPC7+JpH8F107fvLyOEEIZx9vVwE299v8UgEpGP8fZlwZ1q/cfOscpCZlX+
	v0wN2IQhSHWzuTbgJ1rHQ5og4daUBPiqUMzbxTdSk+YJ9SbMIvb6ABo+Y5TH3hOtg8SllRhSrRh
	AClNwJy3UD+lYxl
X-Google-Smtp-Source: AGHT+IE8Uc8yE6e7x+T9rqx7j4SzBv64YwjT0y2LqCPYIhx7HTc0mU0MQAVdWTXexDU/wbuTY+TnRdDvA85/7NRQ3wc=
X-Received: by 2002:a05:620a:a08c:b0:7e9:f81f:ce8a with SMTP id
 af79cd13be357-7ea11095a39mr2507020285a.76.1756482020300; Fri, 29 Aug 2025
 08:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-10bpc-v2-0-955622d16985@collabora.com>
In-Reply-To: <20250825-rk3588-10bpc-v2-0-955622d16985@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:40:08 +0200
X-Gm-Features: Ac12FXwMRvICk8YV3mQ4_G0eTMWJVkBD72BsJ-WaKgZKQMAHDd1L4Y9QuXJV1oE
Message-ID: <CAPj87rNgW5-1YzurL-sFJF2SsGFmENF9JD+82cqHAYLfa67LZA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] High color depth support for RK3576/RK3588 HDMI output
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_084021_468206_CF816A80 
X-CRM114-Status: GOOD (  11.40  )
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

Hi Cristian,

On Mon, 25 Aug 2025 at 12:08, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Since both Rockchip RK3576 and RK3588 SoCs are capable of handling 10
> bpc color depth HDMI output and we've already landed the required HDPTX
> PHY driver changes to support the setup, let's add the missing bits and
> pieces to VOP2, DW HDMI QP encoder and bridge library.
>
> Please note this conflicts with the HDMI CEC series [1], hence I added
> that as a b4-managed dependency.

Thanks, no comments on this one, but having not read the PHY changes
at all, the series is:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

