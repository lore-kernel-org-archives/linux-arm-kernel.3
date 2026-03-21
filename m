Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D8B1094463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQNlAf6vdnJiKr80lkdqTbyIfJO8B2GTTG5cZRsC5qE=; b=cN97l/66aDetVD7fnQdqn50qhT
	GvaXdL3R8ESmh0CRaDW1ZOotWIDhKfjmcggxt1Epvr/mi6Gi3HtFZtDyoWZ2BrHUVEFnTlpFDlKs2
	OdV0BK2xnjuqiQq+n7mP8zpW9SpGXSHVc2gG95qBHzfOGZiDRtpROKc4wy9a7fd9YN/guewlt0iDe
	HreVcPi9TJR2TTJfqT3tynGbOn6eCuRwFPwD5LeIss78Qb2lxrV6MyCzSC765FqLDmL6F8vuf36IV
	lxTkbUVYXGLqyc+at6yeXN3aCDaHyAvzK8tgCtG8ml82l3Ic3GY80EyOo8hfKNksXI7gacL+GUjkI
	kdd6ZbfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tL3-0000000EKy5-0iZ4;
	Sat, 21 Mar 2026 10:13:49 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tL1-0000000EKws-13up
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 10:13:48 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-439b611274bso1412243f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 03:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088022; x=1774692822; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQNlAf6vdnJiKr80lkdqTbyIfJO8B2GTTG5cZRsC5qE=;
        b=g+FAHbaJjfTpmyD9uIAc5TiobI480TzT4GlMhk8tE4AzV+IYk8EYbbXuu6DhCK9XGS
         fLo5z20Qqfe7SrEDVa+Vx7oxZYVWA1FtNVtMS1uSOm7niYYoGmtyXt8M2K01d0ApNk1b
         YqlODLuSbs7g9jrGPV0vEw5K0Dz3h78Ki7C0DW1BvxZ0YJ8Uhmiabz1Mwxmop/UK/Vbm
         qOKfDqUeZvjaQFgeounVNQT7TX2uL2uh8KmpzCZfOhBVTawsR5x6RzGYkgUgeUvMjMRU
         41NStzM6l8DQSFaC39o3bEU84kmdPwUcEesp0ycBML8OVZadrPGvZoowQLqdZxeCTXs5
         7h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088022; x=1774692822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQNlAf6vdnJiKr80lkdqTbyIfJO8B2GTTG5cZRsC5qE=;
        b=SvFPvVfXVmRwyHNokknuXvfp3opSaFKzOez5s4eoSjIIHuZM6ed1z6VXj+eG5ODU6e
         2CGFGo4eTpOhAmJCbZZo/cIPxCNfwwggXa7mU5pL2rm3zQcwOPu9jAhy7MIUB3Vg7oIX
         U2DjoEvCZOlu4xrEsqHZoKiWjcWAgi56HAFP2JNXyNUq0/Pw9j+tHvYy3NmyqlH54G9n
         vY0d93RfD4zzPesf4T17vIivmHZmuML66Hd8C79pV/V/82aSKaYXgf7QfBLVALQig+kh
         621RqN2uFXO5hKDPSyfBmMwIfZ/SKsvaEZaZAEOhCaJ8sFB1q2wO69ndwdxEmkBnXGpk
         un5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhMJqfrnIqKRljavgPSPM6qOZAfBTUi59IMrGLTsz5y1G1xF6JdTgQxWEdbNpDy9VrGsKYJunflPZ48PffEeCU@lists.infradead.org
X-Gm-Message-State: AOJu0YyUqS9U3oBtyYRTq+EtL+57Yz5SWztuAK6b74QjHQHAM1ObjKzF
	1OyL8sTN56KINZgoMuQB0oCTuk+p21QRCS879nV+AEN2T9hIPcAV5kgUDe9v0G+NvAM=
X-Gm-Gg: ATEYQzziLwSfmLAM5iT8fe2q4RO23jxU86D7raxn+cYtmx2xFQoaa5Q3D5SP88bTxUt
	CmadwAMxc+uIuKQJ057MfZlC8fn1aWc2bzjqZkR3dlGtJ2HDCFDkz4bcYB8gZ0V0LNPRcokae4y
	TmALkBwrVUmHSHyPIt8MCQr0oELgdVp0qJaT9nY3lG3dDLZ6UOEKKOZDs5iPLndLMcQADJaheGN
	2jOfPJPrTU9wKWMDJO1K0gxEyBs1zR77lAGm8VD/Q/NodoiTD6c2bCxrInpbhUBcDY/wt5WGDz6
	EUTHDEyJotM7WbF4Rz4G+oH5fkQkSuAzGL5PteMIx81Cj5BZ9cC+Lln2pGTiuhZkmUHE49szolu
	X7fMz2DlE1o7En6Xv93HC5x1r017b+bWJYWX517zXx9fen50M8WyNuDAWHxAXPagu26rdYjLdf9
	AYEXKh65UrFDE+lxL08bAaKctotMYH7WGI9CCdhT4=
X-Received: by 2002:a05:6000:420c:b0:43b:460a:b13 with SMTP id ffacd0b85a97d-43b64281506mr9452939f8f.44.1774088022148;
        Sat, 21 Mar 2026 03:13:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm13473541f8f.18.2026.03.21.03.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:41 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v5 3/7] pinctrl: scmi: Delete
 PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
Message-ID: <955306193a128db29f62a4a3261a1d67561834a8.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_031347_298578_0E8EA713 
X-CRM114-Status: GOOD (  11.69  )
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

The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
be expressed in terms of ohms.  But the pinctrl-scmi driver was
implementing it the same as PIN_CONFIG_OUTPUT and writing either a
zero or one to the pin.

The SCMI protocol doesn't have an support configuration type so just
delete this code instead of replacing it.

Cc: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
Sorry, Peng Fang, I really thought that if I put CC: Peng Fan in the
patch it would CC you but up to now it hasn't!  I should have noticed
that.

v5: fix subystem prefix
v4: add r-b tags
v3: new patch

 drivers/pinctrl/pinctrl-scmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 5d347e6b2e4c..de8c113bc61d 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -254,9 +254,6 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*type = SCMI_PIN_OUTPUT_MODE;
 		break;
-	case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS:
-		*type = SCMI_PIN_OUTPUT_VALUE;
-		break;
 	case PIN_CONFIG_POWER_SOURCE:
 		*type = SCMI_PIN_POWER_SOURCE;
 		break;
-- 
2.51.0


