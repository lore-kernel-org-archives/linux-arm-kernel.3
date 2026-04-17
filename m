Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D3FF43697
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=; b=gHnP/SYk6YwT3PjHw6qq8mY1BB
	x9sED06Gn/3gR17ZeMEq4X2gWH9k7YV3hPKqoZM2NGlffKiU7LuOKzSRyXabeN8Ftw8N3rFUdr39t
	4YsC6iGZPLUqsCZ+DCOJzR3nQKp1fe0wd2tZCYoAVBBM8eIxXeMilLmBe3tXy2ahAiucskqdYZUrc
	DJoPfzlY7MnRYR9udv3H98/UNssrGizg4pwG4CBEbiirX7chB9NTzKEdpk1rTvaWTqTNnZbya/LKv
	5e2YuIBSIVQIkp2bWAd6rer+74qPQIhIeRDG8k/axL1YNpBZ+TGUYFaM/pZHrKSiZT2PKFThOSZVu
	HNis1QvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDi9G-000000041yT-0zkV;
	Fri, 17 Apr 2026 12:18:14 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDi9D-000000041xN-47Tn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 12:18:13 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-9589125e047so205447241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 05:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776428290; cv=none;
        d=google.com; s=arc-20240605;
        b=Q6pP6hucVPvtVxVm5xodY5eTnCkXk8IHdOtqkVTeh9Z528hJNO6Hz1No7AR26jqRdL
         g55iGf7OWfIyRHhNGtnspbHz6OAgajottcliV2kb2whEoyykXl+H524siDYRPZ4cw5wO
         Ce0AkGJOesrCTLdwTeYm+3cpAkdABbaQjQAiekk/9WHva2NCfm6OZYjyAZ1bRUW5prry
         aAeByEVTQ0TrxNsWoD5JQlRQ6HCkxo720Z7IrndjQWmZLMx5ZnDKBNy0QlMDPCvbz18y
         X1LWVgwx3B2CjvQE5feunNhzyK+51CYrjmEAstJbJf7ahn+7dR6YuX2JSc6l3BdGgDWX
         ZULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
        fh=TC2jdvl+H3eGxdRh5BXJ0VQBCvA8kmK11OKiSYZ2GuY=;
        b=k8B3iSGOp5n/NUg0+sjqGvX3X6JK0v2mtdbfiNgy4iDW8P0VwILURusseTn5QkDFG3
         zC6vADkqBuOarK4Kf+YoogsVgvH4ZAd4C8/C4/5+7zQO4LpX5cBqvxn9PSmYf7S7r0DK
         HHwobP2xDY8Z9lP9SDFT6nglN4+E5jKo7+0aBT8tLoj8IJxeA4OH/z5e/K+nT+gH6uSD
         3lgJjfUKMLH1UJ5TG2YWw2Kwkia/T7KrNPU95cH2AAUWikYjp9YjkPJQlGXK/sLu/57X
         6PgGLVqBVFMQt2JTP/z4RXJzEhsFZHCBtxqUHmOp/bsIZLiOe77keaAJYZzGEQtirx6i
         c7ZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776428290; x=1777033090; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
        b=QL3KvrsUEGvosDAZhGvg6haNaFBHpxXylQ9MQxM641NnNzjvESeg91oJqA0svEQMrS
         bN37C564LCksChzUAzN5T7T9mUUNAF3MyZ4ckuNsQdao8os3/kTCW05wephrR8iKyYnB
         /ax+FGRIFWgJu4LPlO3weadL0uJmiU85VtCXYfRpXAkN2/7f/b2SQKEIDMxKkPjTG8OD
         FxxNDeheON9ZAzHPJHV8ncXb0ZJRoUUw2hmTTuDAVLaB6Nnne8859d3RmQAal7NWZrsc
         9Ek9B4zcr84NOg+VXPus/801vtMZR5rolpJZFCyfm6wWA8ExazjV/74OR4pb5tiDm8CU
         jhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776428290; x=1777033090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
        b=pX7RvDhkqipZAcsROR48eD6IEm81aMP9AP75VeBPBaXYv9jwHFCXaV0AowIt2k74wh
         WS4UIsHZk37CPuUc8GHuiEDIY31GtUxNs2z9Xe8M6ZyqnSsX6l3epgzwNmSEnnYJ3MLJ
         X5q6AroULCJn8c+BB/F02B3SXgkgUInR6Z1KSOyFpURVvK8flQ21o7dISjhMTo+tqtU+
         fobgq91ngvT8gVUZnIAA58qnAz0vlR5iVzQselq8/KsNOlVCQ6uEhVnI2wpSVh0O/Jsg
         upWArcrCzRY0vIUKITVymPB8PucIQvNgYogrknr7AuB9OkFIOoNVd6ui06u5Tg20xrGU
         JV9g==
X-Forwarded-Encrypted: i=1; AFNElJ/Q/DMue6Mrm2PdDwJyMCeURCgrpEc0ULYWl0reGk40E+R/W/9yj7SSF3cRcXXBFcqnj4qhnLeM0keAbvcKD+B0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwlw0CxvzxF75rlykKv18TTLMtPNneFygS2wE3BIz8kTkwmBbO
	us9EzVQedA40g1xZ1H93gZJh2VqjF6jxDj8U0ktccyXlK2p+3mJi+/LVsTohvloj9N+nnvEpcms
	K2GX7TSn4JtyDHmt+kTwQaHxaqkz5GgE=
X-Gm-Gg: AeBDieurlsY2O/YfyReNipGkg2ExSxladYssNiHQ036S1hIIfmUxMDj6TAL+W3yWUd7
	uf1i7lAeeIT0y5x4zYr3tXt0orOG8gOd1rSDLbX8Rgw8KoIDZep3uIjlzBwQuyx9XojXu7JxKMI
	k6WHzwC2uFRbfq8T4Huailq21qy8qcyD9QhU+odrA7r06Af/PJTsJvqAAbFeRuLS1OmOuGpEKUw
	Uhklkra0BMAp50V8LQONuDIv7fcMtKfTJ6VKhgUKH6CnqioJJhK+wmegYCd93VvYl7E5K398+V8
	Tg/HsRyjvwik7DlxeA==
X-Received: by 2002:a67:e703:0:b0:602:afbc:ae78 with SMTP id
 ada2fe7eead31-616fb89ea6emr791230137.2.1776428289898; Fri, 17 Apr 2026
 05:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com> <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 17 Apr 2026 20:17:26 +0800
X-Gm-Features: AQROBzDTVswzyUjJ6xkXYjkzbvzXgr8nk22CVU17PBSoxKtVUOrPnYmdya4d4B0
Message-ID: <CAH2e8h4rLZB3E8Rdwy_LtfwtwAKZCOgL18fRFVqGBx32Cm2N2Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Nikita Travkin <nikita@trvn.ru>, 
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_051812_053690_5176A962 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 16, 2026 at 7:22=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
> the DisplayPort driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>

Best wishes,
Pengyu

