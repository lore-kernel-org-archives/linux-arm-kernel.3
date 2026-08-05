Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338DFC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqxi35qz8X0Jeybg10HKbsHNV5CZpS0quNYjwJCSOIM=; b=uFKat/vTwFkIZd0H+C/g/jWh2/
	A9K3zQUOhfSuRtzH56B72rYciJ4mJdfFr6KQ+WKfYJwhmw64AfLWhbFDy/WqdmFL9orti/UM4tYly
	tz+rRXGTYz1BZphsReQ4dHGI0WpvICAT/xQLPhC08lO5Ydb95vLh2bWtf12Kn6A0ycZptuJ1/VRtv
	IkQ6qKe+iysR7xIdr13kTjs+zl8wjMFf60sUuoVInlqnKNIy6KbgL/i6fPhhvij9WdD74AAngDzgP
	ZAq+brWP0Vno/Xv7tz/11NXCCeEVonLR0wpSeC3WvBFx2P+32dOJswo3wFXkyCl9UtP1C64E/GuYO
	M7FkZ+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdts-00000004DAT-24uI;
	Wed, 05 Aug 2026 15:51:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdtp-00000004D9n-0pW0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:51:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4957952e0f8so915235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 08:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785945079; x=1786549879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqxi35qz8X0Jeybg10HKbsHNV5CZpS0quNYjwJCSOIM=;
        b=SZMPdmAhRX+Qg+pvH0fqXnPmoJObk7/tBVpbozxCsZyArhsX7GW9UzsY23I+Z3Isnp
         FTYmS+vbZ3/o2jmkiCB8lrPqOJVpQCmhtEiTGuECwQ+u8ldbxlAdz7GCi5woRrI/Azg8
         d46iXNvX0wErT3k6szpcDvWdmOqlx3HqTBITgYW0gqmJseTIgYwmru70AhIJ9e/3H25k
         1UZfWdT0xugt8IHKvwizVTnNanr5FFLtIPk4idto0upWSZ//hwyUiT1tz5iHAOYw1zh7
         +RvDyHTJVRmjjSvNpn8on/AUrJ49kJppejEH0jE548zKA/OE2fwrKrRMpdp1NbdMecCc
         Dmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785945079; x=1786549879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqxi35qz8X0Jeybg10HKbsHNV5CZpS0quNYjwJCSOIM=;
        b=qe1XkPGqaS8tXpBGRDLJWM2kddt4YuW59ivKC1s6arQyXkmrWCy5vY+kog/UnRTN1b
         iecmKi1pkA/8tQYb7ECUM8B5wVx2QYO/l+HH3NHCmp55H1csgZepXE6/G7rFG3OV83tD
         CXcaw7h0KoDxL46RBCUQi37zNUJSmfyF6GNWhkHfj01V8vLmwFglCkeT1Uy6A1Z6xf3k
         V9/mvj6yZVV4TfJ112qdjwrzfI2vQEr4RcJj+2FcHkwmYmpaLInN9fcPJ6mhkXXwIsF4
         ve+53YZF/MkQ90LG4Dil99ISMubT6p8VHposlyY/xkSViaRpVPMSrW0byD6B8ntTbo7K
         G6Qw==
X-Forwarded-Encrypted: i=1; AHgh+RoOt1RqSfUQhEt9eGiVEn+KwETh9UPYqJjj+rt5T+RiE4TIibAfZyY6jL5hlObjGsf6YHCUMrSrJCSwYQdhGfat@lists.infradead.org
X-Gm-Message-State: AOJu0YwFEGfA30OhHp9/ynvvznw2oc4qQO9+1v20uKqwYuAT3ceFv4PI
	YxoHp+xPhLte5l1De+mynzR5UrSwjqxWcRy9fdahjQqa7MTRBzCl/aAC
X-Gm-Gg: AR+sD10Mj0dHV1zpyKN5M4gHqgAjkQtFJu+8Musl2O2P/cgIwtDZrzc1zhX9nVFtJUh
	rEE9UvL7Ow1tVoWRd3ON+Fx4FNQpAextGji+btUSiTiQqRN36k3bQ/t4m/QqKGcvJZB1WPgStd4
	LM/P30BcSR1w0zvxnQxjG0jSJQaS/iHAeTxs7cfHlcQeKFJDP3y1q3vZ53oh7u7vSiejtZ1DERe
	ngSDc/Cxy/VNe8bQTSzJn6VfZGEvKk4lcclidmsrpvKoZJM+XrFtM3En5F509xxheqFJBwAupDz
	ZoEflFXEX/ZPoGmd4jRz3rKmr6obshabY1XPROhmgJWVZ1LDXj0h8RCOWrdUICbvdWD+7N0Y371
	sokr7NotMABQlA8k+WEvdzz39v6h7oWq9SsIiPyG1xCMilPUWsinUE1cVOH2lwRPiBSIVrtq4Ko
	oBIveKviZPlOvzkZHES2aIjYGbUc+cEge6G00XkrMdcvSvI/EfygZ3tEawu8oXi9t2ZLDH3x5HR
	U3GROiEHDx3rNoYXw1EfYhS6xDWO30SjswEuf4P1R71IRngtvj4Ypl94z4G0ffXzsBT
X-Received: by 2002:a05:600c:1550:b0:493:ad11:6d5c with SMTP id 5b1f17b1804b1-4994e7cf0dcmr48652415e9.4.1785945079009;
        Wed, 05 Aug 2026 08:51:19 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B86F10001BE789C6EE938EE.dsl.pool.telekom.hu. [2001:4c4e:1b86:f100:1be:789c:6ee9:38ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e0356d4sm101820155e9.10.2026.08.05.08.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:51:18 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v2] drm/rockchip: dw_hdmi_qp: attach the HDMI Colorspace connector property
Date: Wed,  5 Aug 2026 17:51:04 +0200
Message-ID: <20260805155107.11167-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805154418.8133B1F00A3A@smtp.kernel.org>
References: <20260805154418.8133B1F00A3A@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_085121_341378_48532AB2 
X-CRM114-Status: GOOD (  10.37  )
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

Thank you for the review.

The lifetime mismatch is real and worth spelling out precisely: hdmi is
allocated with drmm_kzalloc() against the DRM device, while the HPD
interrupt is registered with devm_request_threaded_irq() against the
component's platform device, with hdmi as the cookie and IRQF_SHARED
set. The bind error paths that follow the IRQ registration predate this
patch: encoder init, dw_hdmi_qp_bind() and drm_bridge_connector_init()
can all return with the handler still registered. This patch adds one
more such return, which can only trigger if the property allocation
fails under memory pressure.

So the issue is pre-existing, correctly flagged as such, and this change
does not alter the exposure in any practical way. The clean fix looks
orthogonal to this patch: register the IRQ with plain
request_threaded_irq() and tie its release to the DRM device with
drmm_add_action_or_reset(), so the handler cannot outlive the structure
it dereferences. Happy to send that as a separate follow-up if the
maintainers think it is worth doing.

Thanks,
Igor

