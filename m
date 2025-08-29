Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237E8CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 01:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghrhxwoqKMCN5VgWcIThzYZeVniKtHuv8o+iU1wCEl0=; b=DufRoSLcg5PEidMDAuX7EaNS/9
	yf1b8SIM2ADrnrHHaCtauWrGFgiOVRm/lhiNrrRJaUAadzFSQdB0HjrN8+Eg7fzHb6DWwo33Z3y9v
	fYIUAG2G+xun5dO5l9EeHgBO4mxNE+bKuEFequjuVbXBwyS96AKePubgaqzH+JWNscWUAT7KJuho2
	sgnXY+zN2Ojg0RTuRRxzL3IGVfeopH2ghDVnMhNlKuIOgBXxy7gWXoaERtCpdpMvC6YttMFyr+sBp
	EHpK3FBROyLAt3mfLSR7hVMSq/GWcZBrwKRKg1dnzRUoLVeN4FQkNbDTgEBluByU6puK5OAbjIzO4
	VZwB9vyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usAnB-00000007Isl-1Laj;
	Sat, 30 Aug 2025 01:54:09 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0s9-00000006Ab2-1xDO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:18:39 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7fac8fdea9fso159351285a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756480716; x=1757085516; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ghrhxwoqKMCN5VgWcIThzYZeVniKtHuv8o+iU1wCEl0=;
        b=CoFanu4S+a+emL1gzy92D88S8EEU9835pU+Wriy99Q+uZvTgmKe9CQg/IYg+MC3Hp+
         9odWKoUXck1Z6onB+CA35yv6fmkxjWzKE/t8A80rJwf8IiqPNoOYxMCTKE/5Xbsoy2Es
         T1lxDDbBxEyWP/6y0Q3Pop7Tp8Wp/mX34b7EsjCqkxCr4j6yMyC9glyFtLDyrI819Tw8
         o/hX/g+OzaoGsWDnffaKzkq60AYPReEuQVszcs9J+7iLBweNoGw7cXuw++DfzGvMNDLl
         DP/enwxG9kWDnGVdcE0M6GisHyAYMCUWK/dMweQVE6yz9QIXOMVt67G+uO3lKUZko+qh
         4obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756480716; x=1757085516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghrhxwoqKMCN5VgWcIThzYZeVniKtHuv8o+iU1wCEl0=;
        b=O5NXWa3AEDcHmey8FEG+wDa3ZRNXuvyzqOqG63Cq+E3agloOc7JK5YpcRDbjy8Vk0M
         IKxw6vYyF4EfZkSsgFV0mh22QY8f1PEaS29xUE9aiLQuiBYiECtZZkOuV9A2Zpj18e4e
         EGNkBIVgBG3WVtNsPoOkl4LzSN1lknZUySPgq3kAJgAaTfHx4cK52eaeCvUqFZJHPExo
         fDVPa7Mlia1PKrDq8lTGFCKzLF7DksjRs434BQPayR5cMoEARFBdvUxmzOQm3kpFMbVF
         VNhUvCPlKkyLDbIGmc6wSDI8Tzj3ENd5fAGSAsz0VXyPxmYW9YDaadrj0DjiF6b7guSP
         6B8g==
X-Forwarded-Encrypted: i=1; AJvYcCWh6PNGs1dcDF+1ZckUxAY6HHEk1JT5bw24M9Y2A9Q2bkWQ/3B5GrM3wwrkhmGxEzfPW24960CVBZJrtX/W6YgA@lists.infradead.org
X-Gm-Message-State: AOJu0YxOWShuMGjVdwY+4mqsSmongFBgTm/aGYhi29hH4gKWDI3Y5Yoz
	WrwaqTEpZUwzjYHyS83gfCrUkBwSndBwT9SSGMRZc82Xq0P9GmYqPc9UjIVHua4ZRNuf7mINMB9
	PVzwi+uCZipKb+WvhGrQvpMMrHjopvmuqeZTMg2AfWg==
X-Gm-Gg: ASbGncsKWbMmeI7G1Wu4euROVFOWLpfgs7BpF25hc6C4/bJBpyM/hdpYnR/0sng2ag2
	l+UuejST40cgUlSF/Yu7ThK/fs/qST7OUKI9/pO1ziP85cL7ZlXfstQupwHcRoaBsgQYJTqYWxt
	adKc7VYiCOrdO9bVjK8NzGxcP/Ovv5cmQfXl2eWt8kHNt0wxa8oKy/FcfXUkkls3dRJ0ms8pi/p
	Qiq59Npe/6GeKRo
X-Google-Smtp-Source: AGHT+IGmPttzEK19ZD3UTDCY1FnzsKcijNSUsN6pQPrVL+2gsomLPlupJ17X2EjGDAqx5GLvtjHyN5i9KgoNezf9kFI=
X-Received: by 2002:a05:620a:2888:b0:7e8:1d4b:b00e with SMTP id
 af79cd13be357-7ea10f73af4mr2964339785a.30.1756480716220; Fri, 29 Aug 2025
 08:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com> <20250825-rk3588-hdmi-cec-v3-5-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-5-95324fb22592@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:18:23 +0200
X-Gm-Features: Ac12FXxmGn_rShnoeRaqJ2HPo1b9mmmJuCbdWBYqIMqhSsoU1twbnPqkg976p5g
Message-ID: <CAPj87rO1NKnApMkw75CmAXS6_ARpFDiofgwiqH_uwfrB6BFcUA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/rockchip: dw_hdmi_qp: Provide ref clock rate
 in dw_hdmi_qp_plat_data
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
X-CRM114-CacheID: sfid-20250829_081837_503441_74343DA2 
X-CRM114-Status: UNSURE (   9.50  )
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

On Mon, 25 Aug 2025 at 10:57, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> In order to support correct initialization of the timer base in the HDMI
> QP IP block, setup platform data to include the required reference clock
> rate.
>
> While at it, ensure plat_data is zero-initialized in
> dw_hdmi_qp_rockchip_bind().

Reviewed-by: Daniel Stone <daniels@collabora.com>

