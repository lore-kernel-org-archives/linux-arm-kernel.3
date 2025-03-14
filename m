Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DB6C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 02:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=il06D9hr0Fc9RDaH12vgTcO4maMntEHFOsv/sipTbFw=; b=K5/6WdEHYoeg5Z6Zy+uK6pUbrq
	jPD3Oaw6nI+5zSrbmpIhZKgpzOVb14N1/dd5Flwz86oODhddq3NfBBIOd7kPAj2wijjaQQ7vECXpP
	4wCy3OBB6NrYoajiJFw0A9iizt/fXUDupolPdCEpPe5F/DypHGnBZCCQDZozOmj7MUllCqAjXfGDA
	22IMKP5on4tRwZHILV1zC/oClvO3YcqzYqJ6XGKwhF6+e9qNLufAE82iPYF/6v1DMkVzQ67fm0PBW
	XJYXMI8z+s38BIQ9dPmxh8WNo5go8WQJy3agfL0h0QaSAMO3XSKpyFPGrWJbLRqMikqGQaVZ1TMH+
	Ud5iqXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsupf-0000000Cx2b-2OEs;
	Fri, 14 Mar 2025 02:31:31 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsumY-0000000Cwli-1oot
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 02:28:19 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so28132981fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 19:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741919294; x=1742524094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=il06D9hr0Fc9RDaH12vgTcO4maMntEHFOsv/sipTbFw=;
        b=cZftJX4pC1g+7HVE9dxF+4a5PH+0DGqSLPM/1ghC0EwzMcPGg/Lt217Dqm60/shoLQ
         Pdw5Tdhraj2hHcbtJo403H/6tOoZcOqp1kCII0+dJS2MlppLddmZECXAYhHTPNy4BYNA
         00ayUj4QCx9mqRd0NIg+0YEbJam1tXtSO3rXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741919294; x=1742524094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=il06D9hr0Fc9RDaH12vgTcO4maMntEHFOsv/sipTbFw=;
        b=JreoR7Q4OOj6z7v9y7XintvuuNNbhwEGe7gqVjwIbVgSHcFpW/dw/ooJXOnmnA+R4z
         J1ObpCh2GMNNNDvs2t+Q/d+XRw9oz5O3E72SUVfkw3nkgKAaONmbwfnIJNOw8c9fNvYn
         iCJqWJwx3J2gekzeFWU1u/7BMJum8lDQXEYGhTlqL5RPCUFjbYzm0IVih1pXfgbnQqFs
         X52RIKeGu17gu3sjPVpwvCtrL3cdTBW8w+afTvTN9PZ2S8aflLmwI6X5C3egfrkyHroi
         WSnui/EJI+Q1/prrSPfwFE8MrHxxoGt3u38SGPvmAgPfqObef6KFpjz4MJbtFVaSEITB
         zLgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWyUWdORXEI4utrsR72yW5Syx7R1MBBJLV1+ciaaD2Etmdi9gh/SXFFcxXTLVHKKMZehVEGIVcG9Cgn0nURkzu@lists.infradead.org
X-Gm-Message-State: AOJu0YzWtGmmAOFoBuh/4PGnhUxDNCrGaaZkRcA4xXLeWMGyP+nIJ8Kz
	EfH33YxdcjN0Vz3d/UejizOt0SM5ATfPYkjE713nFi6v9ujiegadv2i7P5JAw+jS17HxJJ8WfBY
	RMw==
X-Gm-Gg: ASbGncsmFVUaGpJwDZEWXqzZ+jlAHpchSeZxYdq1/Jh2VSrCWKYducfr4u/OrqqaTDx
	5iPfK0hTYz0FA46nPS2AV6mx+Rarv8aSStYtu8DkLEzm95XhFG1/99grNkfpd6Dj0VaiymjT9mN
	GibOFIihgjCtSWAtl9jk4OHa41I1l6lUKd/g9wL3bynpPOjwMpby9b8qRwvgM7GGNHKH9ENGPq2
	rwmoGLLNsD6z7WfaMDPHMtN81JLLMdATnUqQzOx0VWlwMbX5mzjxppCtyn77/4bUz+OYWI/mno6
	Lu9G61n4qNUoQCKl+kG2KQkmzwlCirYnHxSkJtB/W0BCTR/4X/CCOl4+HLcqt8Xabg9UdLDXUJf
	YrlswhiJw
X-Google-Smtp-Source: AGHT+IFzsUM2ryf7Y7Wz7bz7Zl9MPcNNpQTZYJ6ltk0ysnOuVSiIo2FoJqBk5gsssa7CiVHCr/7rQQ==
X-Received: by 2002:a05:6512:3e10:b0:548:ae6e:bf43 with SMTP id 2adb3069b0e04-549c3fca548mr216495e87.24.1741919294190;
        Thu, 13 Mar 2025 19:28:14 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88213esm379284e87.175.2025.03.13.19.28.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 19:28:13 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54957f0c657so1604634e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 19:28:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIdhEzaBtvXjobmCJbR7d0FUSaHM/zPP74B8il7Sv7I6gUSubabR56wz83SENzAnT9Uv8sEwf5imLowR4gGZIc@lists.infradead.org
X-Received: by 2002:a05:6512:238b:b0:549:88b8:ccad with SMTP id
 2adb3069b0e04-549c3f97e1amr221177e87.20.1741919289506; Thu, 13 Mar 2025
 19:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250310104114.2608063-1-damon.ding@rock-chips.com> <20250310104114.2608063-9-damon.ding@rock-chips.com>
In-Reply-To: <20250310104114.2608063-9-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Mar 2025 19:27:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XYt894pPyvRxHAe1LjCXEorzB3xBkAKZzE6Fntfac5GQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrcEIf4cAvd2mSC-J3hgcRSHWlS6TAPo8G1EtX7yAuKQEhPcQq-mGynGdM
Message-ID: <CAD=FV=XYt894pPyvRxHAe1LjCXEorzB3xBkAKZzE6Fntfac5GQ@mail.gmail.com>
Subject: Re: [PATCH v8 08/13] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, 
	boris.brezillon@collabora.com, l.stach@pengutronix.de, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_192818_469450_DE2BE730 
X-CRM114-Status: GOOD (  20.24  )
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

On Mon, Mar 10, 2025 at 3:42=E2=80=AFAM Damon Ding <damon.ding@rock-chips.c=
om> wrote:
>
> Move drm_of_find_panel_or_bridge() a little later and combine it with
> component_add() into a new function rockchip_dp_link_panel(). The functio=
n
> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> aiding to support for obtaining the eDP panel via the DP AUX bus.
>
> If failed to get the panel from the DP AUX bus, it will then try the othe=
r
> way to get panel information through the platform bus.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>
> ---
>
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
>
> Changes in v5:
> - Use the functions exported by the Analogix side to get the pointers of
>   struct analogix_dp_plat_data and struct drm_dp_aux.
> - Use dev_err() instead of drm_err() in rockchip_dp_poweron().
>
> Changes in v6:
> - Keep drm_err() in rockchip_dp_poweron()
> - Pass 'dp' in drm_...() rather than 'dp->drm_dev'
>
> Changes in v7:
> - Include the drm_dp_aux_bus.h for devm_of_dp_aux_populate_bus()
> - Use dev_err_probe() for the return value check of
>   devm_of_dp_aux_populate_bus()
> - Select DRM_DISPLAY_DP_AUX_BUS if ROCKCHIP_ANALOGIX_DP
> - Restore the error check for drm_of_find_panel_or_bridge() which was
>   removed by mistake
>
> Changes in v8:
> - Add comments when drm_of_find_panel_or_bridge() returns -ENODEV
> - Remove some redundant return cases
> - Add comments when devm_of_dp_aux_populate_bus() returns -ENODEV
> ---
>  drivers/gpu/drm/rockchip/Kconfig              |  1 +
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 42 +++++++++++++++----
>  2 files changed, 34 insertions(+), 9 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

