Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3856AC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAfX3k5wj/8KZVt25ucKMpfpE6MXGKKgl1Anbl2kKTI=; b=fUdnxTjXTZlbHdNVgrE6JbiFvf
	7dxR54lFfSFhqTnJfed4S9Rv84jAHBxak748m9DmT6VMOBi5Xvm7WWPrAXygsSoksLraE0p6YpNLs
	+AWrMVhbAwok2PaLRPl75c+ipQeGJO9xLNIB8s3qStoqY8CFq1TL7yUbEd7AT3GSY5/4walGCRVtU
	J27q4wYWpuPFBjLRVObynSyshceQXeIl090+k78K957TaIj4MIZtHX9doutqvWx1rTlfJn/BmMirO
	QHAbAgjwwu9acY7tOM+wjd3JHSwCruhX1bZE45fY8Dh15TaEke4hDNQDV0wZev7u+PyZNIWZMQ2ID
	NCkRmjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAqs-0000000FkT2-0Ubv;
	Fri, 24 Jul 2026 08:01:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAqp-0000000FkSd-31yN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:01:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-495437bb891so1646985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784880106; x=1785484906; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAfX3k5wj/8KZVt25ucKMpfpE6MXGKKgl1Anbl2kKTI=;
        b=ivqXzTO8E/zeLxM3TALfiNQCzqMVghijRaI8/3LCYNMvjPmB3/vJYoHsUQ3y/20sja
         +wBADdMQH470UZUskgtvqrVF3Q6I7FDPy/uqyzqpd8T8DCXTaDNJ4q6x3DqiA+JfbfDI
         DvcmS3nvVXsKRj5DZr9I9Xe3hjng0CVCS0N7z70ztUeRhS7ZUpIQSgzl7LEUzKAJPa/9
         ZIviYNR46f9AqUvgEqhoJeQHWiSNp3SdQmG+CDRynXIAeaSEtCriKIQc2LvFLAbejXZa
         yfWpm3LbEbxwQ4LcZKhJ2cj13onKmxHd60ym5amCAqKdi81g+oo5C0Bhu7S/yYJtjwVC
         59Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784880106; x=1785484906;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAfX3k5wj/8KZVt25ucKMpfpE6MXGKKgl1Anbl2kKTI=;
        b=crkDdM2mBr0RLTe/L3ytWgRvNj9BAJSiupyoyb1e/D21NrXb2HbNiNYJXmEszERCHd
         O4EzrMbGg4BthESiDBJOdYihdGQGYo3ubtwldv2ZKSHSk9nWbEvyGCyA5K7+9IReJQEa
         e5tKoun3jDR/npFvsAUE1gVLEUmdwWpGGIJ+kdUR/ObQoDuc4ToF8vakAsaX5MXkCQf6
         52cyj4RNO6JBDWJ0DI2+6ibBZ58TuJgAlYa1rCzTDdF192Gak1mvg6LH1zJGsDIS2dPS
         KOifwhTIkWadJ9naBrtMQg07T8UqPVrK70Io6KW79dkxqQbLMgtwiWcTh/mYamxTAChD
         VCng==
X-Forwarded-Encrypted: i=1; AHgh+Rq64G+xC4miAouA9gCOs4V+KUmgO1LSl30YA3ewdtE2hCUaUAEY4x/BDLywSNyKHVqpvOisdQvR3wGZ8ANLAp2/@lists.infradead.org
X-Gm-Message-State: AOJu0YxC+ZFfNEBTjf00JwhBU7T8kyMoDphT/8qkX8bPkuPNEWcEthQn
	8Neog4f8zI5M2cd6abUzUi7Pt/pjqCU/sQvyxlaxOj4guKbJBVeOhrZtzZDuLLzHtMI=
X-Gm-Gg: AR+sD10wCayL/NcdEKSFIsabWtOs6SuWG4J+T3PmPyu1Gh7lAJv1y+owf2xdClden3p
	hO3CMLzpbWP85H6SFDUyl5MNuwKgL7eYz69hAWpQGDWTANF1ey8TMhJ8IXu7DxJ+pdvgDIiuwS+
	9N0pFw6QPy6TbDNvvblPvP6gJGJYQAcyO9iM3K4N/pPjB2JBLR6P2rjWNogqHSZhrJsHFvrzBAf
	dX6qVlaf8lP6fiHGHGT+rr5f1p4FI/QbiAxFMMlx4/pjMr51J58kidDFvvmWhvb9CHwyR+HfEu2
	xIZxfgiucX0knMc4ZX63ovCEb1S6tMGMfx1jcCRhGrIUV7xMRMqDeIptZVEfrjUfygi2gA+1y7v
	nBwprzM4yXhDeI4Tg0nSdivnMrAHXMaALXOMvwjlhYEbufh7Le8AmOXu4m2bl6rL5OjwcJEwdI9
	1mobZMxhUYKyceTygHSZViI/Y=
X-Received: by 2002:a05:600c:26d3:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-49574593d20mr42472695e9.7.1784880105557;
        Fri, 24 Jul 2026 01:01:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d4d7sm54404835e9.2.2026.07.24.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:01:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: laurent.pinchart@ideasonboard.com, jesszhan0024@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com, 
 sam@ravnborg.org, Leonardo Costa <leoreis.costa@gmail.com>
Cc: leonardo.costa@toradex.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
Subject: Re: (subset) [PATCH 0/5] arm64: dts: ti: k3-am62-verdin: Add
 Toradex Capacitive Touch Display 10.1" LVDS
Message-Id: <178488010464.449291.8023888105582692289.b4-ty@b4>
Date: Fri, 24 Jul 2026 10:01:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_010147_778682_AD02DCDD 
X-CRM114-Status: UNSURE (   6.90  )
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

Hi,

On Tue, 23 Jun 2026 16:57:36 -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> This series adds device tree overlays for Toradex Capacitive
> Touch Display 10.1" LVDS V2 on Verdin AM62.
> 
> The display addition covers two interface types:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: vendor-prefixes: Add Opto Logic
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4685230d8288a99f1c664768b6eb2bd1545524c7

-- 
Neil


