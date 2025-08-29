Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3017CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 18:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGLIvrEeA6aZSH5bbWcCyh35lvNtwwlGEu4excYVUnY=; b=qo7/6Gi81GRmaze4dDilZuDnnc
	5mA0LaeKATbyxgfdaYCZRVD5fy2kRVUlyTZ0zUyNUtqUGEsEJZGlSq8Ce9/rz6O99/Jp6JqjYNW9A
	aS/sTr7S4Do8t4IG+JIjenB6+mnYv1aglpf8GWszI3kuunb2FCLAuGByMkTNhAn+gOz7ifgP6jhNN
	STyMNjzrOa6M2vX8a+eN1SVC1dvTH3vajqMkSIfI0jNNuq7YXt8BIqcCKSZHqabKBMKYm9dbABiiQ
	IUBCLFAjJO0KlXSQnRFVEf/l4WRgvUf107jkLC+kae4bDg/XevLURuUdZep9SQdTo4UYnwQeNvima
	+XkyBlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4B5-00000006gIE-1WZY;
	Fri, 29 Aug 2025 18:50:23 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0ju-000000069Tw-15DP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:10:07 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7f7a6baf794so275903485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 08:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756480205; x=1757085005; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EGLIvrEeA6aZSH5bbWcCyh35lvNtwwlGEu4excYVUnY=;
        b=CgO9YgpOZUpUTO2M8Rk/kYMKAEsnfyvGwd8jjLFpSNhne4hSYh0BtTgESH2CDFSxfe
         1Je2gwp4c0qTZat+ELKqFQncc0rANm4X3xSkUt0NHj9b8CFhtmLQtO5LOnUjcIBDdPC6
         9rXDaQYjyb6X/NC6FISn0GD+8smaA0mQiq5g06laMffBPfhf9Qu54WpWIVSTfkyIoFIs
         UUr7m6QSQpprbfhBmME82zUJO+AxJCbsr11vGPioUW2Cfjnb2G+fQcgj5wRf9dxrjGXl
         UBbF6J+WFVCXt6O17J+GTZm1GSxoawYo/xCxLohpRH0WeseMn33Io4dv8Q2dJgZYlwu9
         YAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756480205; x=1757085005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGLIvrEeA6aZSH5bbWcCyh35lvNtwwlGEu4excYVUnY=;
        b=T9dtcv4ZWw+hqqMBlS0H7dsyiwt5fLVN/F5U7mJfq49n7pfMyN9M4OP3SwajurFVXZ
         j9Ss23Rjtknv92ed3ZSarM+W1qwSWcOqRpmvDhcxFko/Eswe3vzOYtgNH4CggVlF7zi+
         HuNd4vWKj8qCheSpdUqYaNXS2I5xRCvPpwMby0mF98QjV+UH5K95f00zx97xWDDx29Nj
         3Eecm0VvHdOoRvIEcSaY27GmPsjkJwZxeBBMgnfisEQB4ej5KSI7ptPJQzGo9c/Fj2hr
         cUC1CGHqAbDfhb/3aO3l10aKDvB85MXqvfIQqPRy5k+o3cwd2YjBlayiR/7b1hdzZam2
         3m8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWqSyKzZbOiTsC5u4X2U/0PvvPvo4lxv+UUi0Z6g7vMy7uLTYJRx0xwV725dk6CXp5+AGZMBvZS6VqaYZkgWBp@lists.infradead.org
X-Gm-Message-State: AOJu0YwOQboYmemjxHwDhvTrRGVpITflrKdgw7H+LkBi+lH0RNFb3TOr
	vppQgvmwjt0OTfBEl508kurYlfXYBBeVjOqyZAFYQBhGhgdb/n8BDRZo9sN8FS+xl7FsO4KKtyO
	83QmwVv3DzDJDEz/BdNLrTXVCKrQZr+PLrnDK9Pc2rQ==
X-Gm-Gg: ASbGncsSEwmxCyh8GV2YSQBd1OnNXQcKmloHNTFbLcqXZPmWf7Kindy0R46ueQhB9ua
	3lcmx+4FukmePY3WJnPFvSUX0B1nKm4WqIW5WoMfvUGq2zwrRMfnWp2waXC2DWoC/mG7WRFM3/U
	9sX7t50nHfKTQp2fiNqoDjeMoMy2kmBBru6qdlFszFadzNwnQ1GuBN4EGphh+BP/WE1mi49wVdr
	bo8IA==
X-Google-Smtp-Source: AGHT+IGKh7Y20GWjms5CEWqUFYK6Fhl4aSsCjrhVa2muuLuQNwyCT8KtW05eeJgqP4jwNECHf4vjyNzCIEKa9V1tI+Y=
X-Received: by 2002:a05:620a:269b:b0:7f9:98ca:af1f with SMTP id
 af79cd13be357-7f998cac79emr862285085a.32.1756480204505; Fri, 29 Aug 2025
 08:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com> <20250825-rk3588-hdmi-cec-v3-3-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-3-95324fb22592@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:09:53 +0200
X-Gm-Features: Ac12FXxjT2DMgVXZUD7stQTdp-evPmAyNIHAST4h_-TfcQ_juOKoIsGqjkI2p6g
Message-ID: <CAPj87rPhhhhEHrPqAcKNtWwAtCQRANp_=8sQtg3urqf5wcrmsA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] drm/rockchip: dw_hdmi_qp: Improve error handling
 with dev_err_probe()
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_081006_451054_C7191184 
X-CRM114-Status: GOOD (  11.01  )
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

On Mon, 25 Aug 2025 at 10:57, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> The error handling in dw_hdmi_qp_rockchip_bind() is quite inconsistent,
> i.e. in some cases the error code is not included in the message, while
> in some other cases there is no check for -EPROBE_DEFER.
>
> Since this is part of the probe path, address the aforementioned issues
> by switching to dev_err_probe(), which also reduces the code a bit.

Reviewed-by: Daniel Stone <daniels@collabora.com>

