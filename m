Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48905CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eA7yRXvTEh8fNrCRO00h2bUBzADrGeYwcxZYdic1EgQ=; b=VZ929a3gSBGjEwPPX7LycXj/fT
	h7Nu1L0Sv9gwTHmOQ8qkHmt/aj+e6Yz5nb6O+wXO5dPDIcFQ7ok1Nwd+AA0eMY2tNkeNHBQflR6ZA
	84W++ANi5h9BGuXtrRNV9kN5oGrTZYCs0xFwtahVoezDy+x3AWlq5zwb9TqGddmYQ8pcEb6sRCvuV
	TT6L0PkhRXnKbPt4DrejDqrH3VeNaNRFIQWyytCrNnGPMYK4mTlg16mpeSG0EF3C9x1sXy9YiQZuh
	BBbdK8GQOrYJP+ffy2ZmTm2yeLOHwp6St7oTvrzNSw2MaIYoP4ex9a7IYgZ6ptG6A7zYng19N/klD
	pnNLsPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXizB-00000009oMX-28XG;
	Thu, 11 Jun 2026 17:14:33 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiz9-00000009oLr-1J4o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 17:14:32 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-7dd3f176f84so1105117b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 10:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781198069; cv=none;
        d=google.com; s=arc-20240605;
        b=J+bfJvdKMKhx7ZxrK0+w9swuhQXfiDMPqA8e/2dqSOmUffQbd42c8ZT8Mton/Su10d
         ebwedvjEtmAt2dzOUVl4qi1Q2ce/7GdyU2ktO55EULAIs6tMonNg279y4mrqAMibdt+H
         06K/CHZirJwoRRDeMWL27ROA64tyV5E5OhKaWMaQjVGV4EApj3aYeZEmL0QiWCp1dvKf
         R4f418uToGuivDlV4QoQDNLupeKbIyCOOrmT6jrq6iOmjOdU8S6R/MWL2axsmGp6+mOk
         r9Pk1et8Qn3F5EpFOg1MoMHDPTcQkV/r8cYBgc1E1xxXxLxdcyMh7XPI37Uf11rJ3VQI
         ya3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eA7yRXvTEh8fNrCRO00h2bUBzADrGeYwcxZYdic1EgQ=;
        fh=Y/AmneD1FEqikSeppcnoQgoyA0IrS3PC+QR2kV0trWg=;
        b=gqZZtjb7m0snHwMHQthIODJ5Dzd0gj5/L3MM1PfNS/JQXHSn2SyyIy3jqLAk8OAwQj
         sFAuNbuf2qNURRB/x4A1pLSNtQEalxVu3V4sFsf4MqfG6LzKW0e2PU7RswzwDfQPZVzQ
         UPvLPeYRUQ6rbZsvbCsePdSURcDLZVRUBzhwCKNMOAW5NxPC9gYrGpTM/CB0vEf1oSsi
         zxScVWG22XzvDYeuc01H/dOSBRRD1mZu5+sG+cePerESR+X+r6dtE0Z/UfirhCvsHevN
         sP+4ePpykNiSw1dpYiIPYd8jrFG7sMsEjWsR608rOzvbPRieMW4q2PrjUy/Tja9HCtnq
         Lm1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1781198069; x=1781802869; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eA7yRXvTEh8fNrCRO00h2bUBzADrGeYwcxZYdic1EgQ=;
        b=NaomlR6+8nI1SKftRqzo+Ky8iHS9ojyiRINjFIBPu3dnLQuBjFbjoODXR9Tk/4oxeP
         /r4EjwBvETOt6aIF3sl3nT9gMOj3vJwrFuB4aWQB0bNgiQAxuoRPTNR9ZMNKSqndEfWb
         B4Oi83MBgEOlv+pEnlctWUWotYoNXZyHlCNRVC/ScH+sDitTchRr012NoxrBVLxjB4Nt
         4gGqGXKy2goPrIL1qfl3DE0P23sveEwGkf3a/mkUl6ZjpBZ+benEQCpi83RzSmYD7BJl
         wgDELd5wqLyn3cGtwTtJ0XtEQ7Xg7v6nUe5wu+ZvpcTovlFZx8aCH+VrgQW+a28UZgXi
         btAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781198069; x=1781802869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA7yRXvTEh8fNrCRO00h2bUBzADrGeYwcxZYdic1EgQ=;
        b=inuF8UwE/HizJLqMBxIqjqujx8wDViHqwjAkzYopZO6kwYLhKfadYaM7qUUoeGwBMX
         E3iNOVpYnQADTGa2+NT6nSdVAq4xE7JBQ8U4GjyF1jkb84I/3x2gNgFnf2eY9PKuyYFY
         IAEmt786p9VHgwnctDUlM5EU6GnaT6tj24+t/IpMILTAtMoQaXhKeE12FqDm0LIW51+W
         lCwlhzQu7V9sVFIUtzm9d/8MS7xfq7PJ+8RSqyPGKG4B96A3YazzCozNUWTmnE2KSNk9
         iPPyelV1seT5Ea67ZlIqWqnOjAs5IT/4qHIMkL+jmjbxU1kRqFPeX51bysf2H8BIfzn6
         4C3A==
X-Forwarded-Encrypted: i=1; AFNElJ95OPOewNn/pwUIHCQgvCNDSB3sUDDCu6mDe9tndaO/Ts3I/zxqgtiVjPEPNnqYurwvFm3UewpYlPoF4K0IWfgn@lists.infradead.org
X-Gm-Message-State: AOJu0YxnB8fMIS6AnVD6EBLJTix25qJ3PykBFXm3FDZsC5iRavq30JUl
	nl3DK1DqHW/YUVl/MkpuHm6oGOzUxz2tJcR0EGL+fofdgE9v2PwvbGDbTqpsVqY27JET9HDx5pu
	8X5cslVGyN9h000ENIcEjCFNyi3U2ROp03bWz05wHFQ==
X-Gm-Gg: Acq92OHDYuJkW+kcMGaI07Nu5KQQ38TNs6nhF3loGI/NgpqcuASPFtkwFAUMrg3nGVB
	s6YeIIj5a4UAZFyvE0yGh7qDA9HbepMnUBCy4k4zfeWve5RFaKRIJkpBaUR4V9JfuVl+Icv1Vop
	l6hGL/A1MpU/lGXhBnIdT9eTmfFJcbElpeDgAnU6BXE2JeVFC3fJyCnGFzaWUbAsLO68fWi2dmb
	Y/Fb5VI4JYKqsxXD1Nmg48wFWgGuS5GRehmptFRCYKJr8rWP6X/koYaPYnc7OJz9GmHnavKJPhE
	Y0xbYtKOrBHdcQ5I3xl9ivBIZQwcQa0v4WyU47nkwkAe3MG2J8e7zNWMl/aHAggJQny9QvOoX0W
	yBKfmkb5xx42cNYvP8ZcKODUDrR5Iwfp3O68=
X-Received: by 2002:a05:690c:660f:b0:7cf:f14e:bf5a with SMTP id
 00721157ae682-7f655cd3b81mr39665227b3.20.1781198069266; Thu, 11 Jun 2026
 10:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com> <20260602-dw-hdmi-qp-scramb-v7-24-445eb54ee1ed@collabora.com>
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-24-445eb54ee1ed@collabora.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 11 Jun 2026 18:14:11 +0100
X-Gm-Features: AVVi8CeUnQ0ZG_IBJrTt3afcxP7ht6E9ev0RCneHeSMnT7NSdu-xpfFzb1oLr80
Message-ID: <CAPY8ntDw9CSZgMzdDenHdv8ZN8Ho5JAhu1h8FXUiqLfxcVCWLQ@mail.gmail.com>
Subject: Re: [PATCH v7 24/30] drm/vc4: hdmi: Use common TMDS char rate constants
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_101431_432376_AEA8C5BB 
X-CRM114-Status: UNSURE (   9.18  )
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

On Mon, 1 Jun 2026 at 23:45, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Replace HDMI_14_MAX_TMDS_CLK defined locally with
> HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ provided by linux/hdmi.h.  Note this
> incorrectly referenced HDMI 1.4, as the 340 MHz maximum TMDS character
> rate was actually introduced in HDMI 1.3.
>
> Similarly, use HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ instead of the 600000000
> magic number.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---

