Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E746FC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSvkvCa4QalyG2BNxJcMEEX0DpoCO16400N3JfxMgjQ=; b=wHd6GfrsZQWUJpwUXpRolSqoly
	54Kj+rsrUrD+4dEzEJUdFi5LeA+7oB9NcfdNy/Zu+YMD7zwvQfw19O2hm26G6A+3GQT2E3obrqrbj
	sjzzgmN0F2TnwF/pXVgZwJdF+GTXgEXQGD005Nto++6v6tKTQXx09h2Meha27fummV5HhSR58c/v/
	ycBAyUb5Z4mYfkn8fsjmp2apOS/K0SixR+/CVp/5sACTW6sZBnG73wEm/hHa5BNHrVcdwEMZQqgk4
	pn0Cjju+IVFnOd1uw46rBwFxuSGaoaXFrph2nR1XZpgHp9nLgTcOLGogwZLRNMhq/iVVW7rniOVif
	toqphwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZZm-0000000DfeX-13EB;
	Thu, 10 Sep 2026 07:52:06 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZZj-0000000Dfdp-0u5s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 07:52:04 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b93204449so3706055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789026721; x=1789631521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSvkvCa4QalyG2BNxJcMEEX0DpoCO16400N3JfxMgjQ=;
        b=XJBhFjNsA5qSo4zv+BpWRnNM+lrhAu4xNi+vWeW7uEQWWUdhfMyzgPjGQDQjn8LEso
         JE8lO8YaOFCkxbt3eFNggsuQk2Vge9qwDkUseY3V8zxMB72RDB41OdvaFq65ENNPBriR
         cdUQkT5P2ZU9z6uL1ZzL44VDO/36GtaZxTGj5p49G5mNrshfpG65p5jZlxdN4C0dX9r/
         j3gHBjh5DXe/hbdOiiG7KavD4fy+pb1/JMhhNsesn1c+O7MODCUaVOJ7sOEoQeCS2pol
         prI6yFZhvzDddIQpP504N3+If777Q81fJxOxmaqASRUedlVIquYCiEhY+0jsy5PMio6i
         a/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026721; x=1789631521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSvkvCa4QalyG2BNxJcMEEX0DpoCO16400N3JfxMgjQ=;
        b=JTZKGAQEPpQL4I/Ayt3YwXjtiZq8ZRKcP2TyQxh6bM5AGiOwl7nUpCypXjwiY3w0fO
         MXDSFYTDFxFI7QQvn8tz/0dnpomC/EI8heuRd84cy/cD4QjiYP0bBdmMCMXuyiOvPinb
         YXBx/U31qeTaJ/pUB7uuEBfuRaCDw1L6AG0rE/i8dA8myixuSA6/CTmn5KzYxn8u/eJl
         unV5iSRiO4wmS1oSgWQUlXjdOvbZBDTobvDVLeYpbH0sfzFpp8R0o9ff615hDSet2uFS
         7sLppKnogwvtkhN1pwQ+C6kSGhTrT0ebx9HdhdZvHK7yRsTftN48Up6EmBvrxjH+tIIQ
         GS1g==
X-Forwarded-Encrypted: i=1; AKwUvBxLe3mOEEQ8Dqx9j7VvuEx91MIbysF8cUxII4ZHsp59RD14XHkWd9RMEZ10JHffQSuYiUtyDUcaRnZrcqjiwUzm@lists.infradead.org
X-Gm-Message-State: AFuF++l0uxTGPG3e60mifu2xTDy7S53kHBP1gQjesl06B/gBUUT2gwOo
	T8ll8JAzVx3S+wJ3L4mufPoz8Xav60jnZgNSBsfPB1f8KnAvg9mTOXHL
X-Gm-Gg: AYBFou35qqyhzShoGBC2lISeKS4IpYSZH4r81fmxWgFtNGldjyuzqiHvspVyy1rzlfN
	AFlcoakd+bBgtmZ81RE5xOPnyxwzH40ZkFU8ABU4EgDHx2oXAy852Qo53Zy2zFQ7p3kLBvEVat0
	33PBzV8el0ZCjZo3vvcafx0Ecuw3dqeol/mk9kKLvS37sCkCgzamE+mCxZhiamGweQI7GiXWXo2
	XVNzmMePy6bupt+xr4nBDCxECiKvQYskpLaj5Aq+Nkk3hV+seowikcMNcbtQxZl8ZSW6F8ChWM3
	eSNlAfcMav97NvGqVG2m4Kis+gxFnlfUm/umDvuiZbqs8iKBsfp5BkSAI66FG2wkF3H5AzEFOax
	o+f8jNzLplFhFGDR9AFdZWZxRK5KmNhKw5LYSWV2y/6DG0dZV7dOUVYSrUUK7oKkWHyznazl+i8
	WtdgCVpPH3LgAUefYH84PeCK4jqyjoShngaQn2SASvEBhjkXnxC7muPaMiDbfUoFuGEyEuAhsAF
	01hamzL78KWGQf0as/Y2T1z2bNPzQ8xf/JkAwP32aC6j4ZaRCk84BSyeVeNa2bq2RPcojc+NBmW
	OajE
X-Received: by 2002:a05:600c:530d:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49d01dce86fmr291744635e9.1.1789026720937;
        Thu, 10 Sep 2026 00:52:00 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B9146001C92980EE71198AB.dsl.pool.telekom.hu. [2001:4c4e:1b91:4600:1c92:980e:e711:98ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm251593715e9.4.2026.09.10.00.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:52:00 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v2 3/3] drm/rockchip: dw_dp: Attach "max bpc" connector property
Date: Thu, 10 Sep 2026 09:51:40 +0200
Message-ID: <20260910075141.48803-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9e77b5c5-f1d9-484b-ae02-846fae1b3642@rock-chips.com>
References: <9e77b5c5-f1d9-484b-ae02-846fae1b3642@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_005203_291288_E16E1A63 
X-CRM114-Status: GOOD (  19.07  )
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

Hi Chaoyi,

On 9/10/26 09:16, Chaoyi Chen wrote:
> I don't think this is the correct way to go.
>
> I believe max_bpc should be handled in drm_bridge_connector_init().
> Take a look at its implementation. HDMI already does max_bpc there,
> so DP should probably do something similar.

Agreed - that is the question I left open in my reply to the bot. v3
moves it into drm_bridge_connector_init() and drops this glue patch.

Three points I would rather ask than guess, since it is shared code:

1. How the bridge advertises it. drm_bridge.max_bpc is documented as
   "only relevant if DRM_BRIDGE_OP_HDMI is set" and the helper only
   reads it inside the OP_HDMI block. I intend to honour it on the
   non-HDMI path too, relax that doc sentence, and have dw-dp set
   bridge->max_bpc = 10. If you prefer to keep the field HDMI-only,
   a separate field is easy - I just did not want to add one unasked.

2. The range. HDMI attaches 8..max_bpc. dw-dp's format table goes down
   to 6 bpc RGB and i915 attaches 6..N on its DP connectors, so I intend
   6..max_bpc when connector_type is DisplayPort, 8..max_bpc otherwise -
   the same gate Dmitry used for the DP subconnector property in his
   msm series [1]. Nothing is attached unless a bridge declared
   max_bpc, so existing non-HDMI bridge connectors are unchanged.

3. Where the default lives. 2/3 restores max_requested_bpc from
   connector->max_bpc after drm_mode_config_reset(), but Cristian's
   v11 71/74 removes that field [2] (HDMI keeps it in hdmi.funcs). I
   intend to keep the value in struct drm_bridge_connector and restore
   it from there in drm_bridge_connector_create_state(), which folds
   2/3 into the same patch. 1/3 is unaffected.

The state still has to exist before the property is attached, so the
non-HDMI path gets the same create-state block drmm_connector_hdmi_init()
has. If you would rather see that block factored into a helper for both
callers, say so and I will do that instead.

[1] https://lore.kernel.org/all/20260722-drm-msm-display-interface-v1-24-368c10fe62fd@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260901-dw-hdmi-qp-scramb-v11-71-bc12954a0688@collabora.com/

Thanks,
Igor

