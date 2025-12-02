Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9E5D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2qTS0djCtlvzenkDRiQ4JmBu4W3Dqf8pIaygUtSKbc=; b=CNDi0Q/sI2ZD7R8FvICr3YHPgF
	VcdA4zHGpGk/tdqyNlE5cCfOt459mFohCoS4U14qpyATSAHmX/s2kAor+6WKPzXPG1ZyiciPYXVt9
	L4ozEZ28QcHxW0hW9MiAOwXm6sO5+IszXATMf/Q9w3u0MJDlBrytPb6K3Et9yD4TwDTQCfX3mKWe/
	+LPzm2CZzWGzRWauJVfLqiFaZhDSKVybOrTV3fDGkRiYa87McagriSoz+B/BPxXYke1PkQ3jTqnHp
	qao9dl7FRyPWsEJ9YyWQ2HfZfJuzEIyQlX13cTWA6AYX8pnflUHdWDIBlwR4aODnLIDz1EcdvTAsY
	OEtMi4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQHH-00000005QNg-0Ih0;
	Tue, 02 Dec 2025 13:18:47 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQHE-00000005QMn-2CzK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:18:45 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59584301f0cso4387237e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 05:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764681522; x=1765286322; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2qTS0djCtlvzenkDRiQ4JmBu4W3Dqf8pIaygUtSKbc=;
        b=P6gzwwHM6doo27prj7sHUNh9AadaJz/0jad0JZHfwNU1tDvtCPZbhszP0E7vOT2Qis
         TQdUX1fUgwga3HKzEuFveTvxEnGn5srkgMHGgHCPRcGZq3qTeZ3B96YAxVbG1p7fYfOM
         9vX0HJzAXK0Qlh5tJebC22yI2ot69en2yqkZubjXBe1J6JYub6cEWpg6YcDfhva+2x/n
         0yxZ9BqC5gg0xayjoFkDyKaBWPA221Vrmin8hdLKZSyoHiTvwgrcceFv61H8S8cDZORq
         b0Kh1Hb5RlGqiTsu4xWf6dIXGZ/gvft6fFnh30izmbg7IkmeleSJd7vNDBd0hieVZeW1
         oHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764681522; x=1765286322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d2qTS0djCtlvzenkDRiQ4JmBu4W3Dqf8pIaygUtSKbc=;
        b=ae5tvcvo3QiifPLv0GddydvJ+z853fptlx8/3P4HUxDqgvDG+VielbIUJ7OJePhAI7
         7B7pAXEYJgBeGT5+oERsIpImyRNHvyZoGD3lOm0STYoTRiCahe64umfYvmnUXEIuVII2
         ul+Tzkks3PcufXGLOl47jxqM6qOMVeeAhhe8risgUIss5v7yy+qzKF4AUbMiSyTbgHLz
         hWfaZoc8wOxfALigp9kPY4jigJjlqecAG9IoVZihu0XZvMte956DQPu5OP6ktXL91AdI
         jVWw17opxLuyXu1mgASbCL4WHa8ty7R9/ZOwd7pn/+6nbZj7g2zqh+3VLdFu2cZkDOys
         cyyg==
X-Forwarded-Encrypted: i=1; AJvYcCVSoDSfrTK1UxLdDOPTrdjH2JSM6K4ixBo9CrOqKaZNcPBRboVkFz7i7LH+MYS3qPMLNcuI4ceBgcAX7vLNLyA6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz23BD493sxmN470CJm2qqXeHTarxw8/dRqmeg/lilkc9F3y7ds
	oyNEF4tkWuzK9I+WmVPJ5qpNp2+fzbicp3Lll69+aUECFCX1kxIp03Z7J/aAt2hgKc7n3R5dFma
	RkZ8MUJXT3H3E2yR4xIFX0yNPk8Ajhz0GP1lzbR5Qkw==
X-Gm-Gg: ASbGnctt63TkeD3usUfRS1iWC+a6aEnwfXD7ZIzPcqltfGB1dq7g6HTKAC545zaIUCj
	wEtW5rRgwat8Dn9XCl0rvR5FnbJjsz1ruF0aqmG1s8EznO8JsOg11XV0f/voi/uqLtVB3pemVCX
	/dI4WQzzo4A+vACxMojzz3ZeYj09ZdPqdbvFd+U4jsnblFgZc4iIe58mbph1KodOE3QjfFcVael
	kgiMTznxvcFPVnEG0/iU+dSLbmlGeKXQgHnrWosXpKMdWSetspFu8RT9ttrBLHkrKBy/ISyg2jh
	6QYQcXbaxK/shiyJ0jB+883+uP1y
X-Google-Smtp-Source: AGHT+IHXPq/1WU7Y6p5Y1lD+k5wDuWG4cZs/H+fFh7MfEyTT0+oPBhUYEG6IeIhzVNqgsaoRyEt5M7vDP9CoP0oYIqI=
X-Received: by 2002:a05:6512:159c:b0:595:9152:b932 with SMTP id
 2adb3069b0e04-596b526c87bmr9950731e87.47.1764681521679; Tue, 02 Dec 2025
 05:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20251031104846.119503-1-marco.crivellari@suse.com>
In-Reply-To: <20251031104846.119503-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 2 Dec 2025 14:18:30 +0100
X-Gm-Features: AWmQ_blWaASpaRpR4V19dOIxX8T97Dq9h1s9NUCUDv7AzhCvoFkKrXxIheilGew
Message-ID: <CAAofZF7BnLm3XKBVsOvAcfON29PgxvA4dfkd4N4+yx40LSTV-A@mail.gmail.com>
Subject: Re: [PATCH 0/2] rename system_wq and system_unbound_wq
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_051844_585299_34BF5004 
X-CRM114-Status: GOOD (  10.07  )
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

On Fri, Oct 31, 2025 at 11:48=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> Marco Crivellari (2):
>   drm/rockchip: replace use of system_unbound_wq with system_dfl_wq
>   drm/rockchip: replace use of system_wq with system_percpu_wq
>
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++--
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Gentle ping about this.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

