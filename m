Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF8DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76ANipvR3P/jVIpgRlnkUUgAgrkLoL0o+K6EABpA1ek=; b=Jy1ahdeljbWdWbcJ+R+Q+0v8jw
	EeWuVfkvIGL6AiSQBuHCcz+PaqFCvYmZENwZC5cKJJXyyCvtHwUNHOV1FT0lYttbtvv6ZXSvL8jip
	v0GL8xMXoNKyU8P8fhgHtsJbEAemSfamF0Q9VL9sQ4lLT9JjXf9Fz182IyuC4EPhjkpvuTOGj9OcB
	ICH29s98b2MWOXV+KaCOOzMU4lGPkRdMSWNc/sGaRUAcOsIqeKtZ3lFC61xGKdES5lDviM2OY+qnw
	gYD9fYS3x1bwCGveunY1q6dmppmTaYX06YCN56fYbuwbt+ZbVoD3kwGZag/NRzz1flk725zSE8v+f
	M2lMi4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toJj2-0000000DjGw-2eTx;
	Sat, 01 Mar 2025 10:05:40 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toJhT-0000000Dj7l-3LbZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 10:04:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-549490e290dso1700460e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 02:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740823441; x=1741428241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76ANipvR3P/jVIpgRlnkUUgAgrkLoL0o+K6EABpA1ek=;
        b=YkG8YbxJWGRjEtrhIQ9j3keDGL2OjojAY2QqZSfheOIwLgRaI/OkDbLuljZORpiXJp
         yd0AMjWukrqzNgb7IZK3SzV2IaLDcr13m0e2eCX5/sX7c15EIBR+z3miod7WydcASM20
         lKadEAs77EL4na6jGoaU0eC8UI5r5jiOo7jgwEooOcmpQqEfECJuARC1GeYG7OaeOD0t
         7sSGQnpg1R6hYGqA5Ga8I5JL9Mzmdhocku1M51Att6prJoONiwrddmj3x8gpPAyLq9v9
         cvubpsK82RwnhCk5WgKYfIY0KZ4dE1bWDapZfnNehjv8V6iJwS87tMR0Z+ynNYjzWAeR
         +EUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740823441; x=1741428241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76ANipvR3P/jVIpgRlnkUUgAgrkLoL0o+K6EABpA1ek=;
        b=pyKNGJtXDzFmFwuW47U25Z88i22/6c/SJoHc97P5S4WmxUOpIbuDVBa7MqOxSxK5xs
         Fo4xRyDRwQlKXQYjZblpCZuEd/ui2RxexRB8cF4l44kIaomRkbXCW2ncSXgHs5Dn7Iba
         8v2PDU9qilirVbgwrP6/kqEJzVUh+wYO2MEUvgHq61gTCeha6RYvnBC/gxbR6n6ngrcR
         TfRC3U/WuJLWY0aBZauz5sOg2VAZadU1LQ1kNzHyxiKsocnV2ez6tH/7DSGYx7SaWnhU
         gYtM+VQRUwOgq7G5fKuSRLV47uesLW3JUn36Cxkp4I5n9YS6DQ6EFXq6oeFBPzoB/+aY
         eCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHxH1goVUnFOlPQ59zhEiobU6vpRsc7Hjin6RBcz0tNy5DlX2UB/kII3OK26aW+Uau/tUR4WEhO3+WRr/Gh+Sg@lists.infradead.org
X-Gm-Message-State: AOJu0YxSw9QhwhvFbscFWNbyz09lS6aJa104j/E0UPPNLe5zvg7X5xhV
	xE6JUCxL5Cbj6cyaEborV8qwIQHM7I1x6Av9ea/SPJkPOZt+ieoBiuGUn0nGWo8=
X-Gm-Gg: ASbGnctZWC2gYLi6Lp4GCAlHvarDcw3kiyqMw+/eSPRApeMhmj1fbTGo5rtmki67L4K
	z/NxxLiuI/qTuPZkqFs6YF4NVRy2kNdC/1ckjY5TD/Bo/2Y2cePIQPHio5kwOhMPnoZARl2A0+i
	gH7tz5bghUoCM31MAvPUbu5GwoIPmdbK3ytWiS43GvJHE+N/NtL5Ba2eVTZUkeKwbUg24Ts4z7Y
	SSjHh0EImPxCB3QSYQUB6h4EaR+ArgCC03Vkbh5/wyaOKohkpjfOwKdl3udEfdraUlupAlTA72x
	eQ1ADRHjuqh1WOa2G+I0WHXTHJ93Orz0t1ob33A/E4E07CnLAtTNwmwwSPdf+sEbEMuOe0lNQt4
	CqDZUZEDyoT92
X-Google-Smtp-Source: AGHT+IFuYzubuDyf6X5ei2oE/n7MHEB/XJ+jimftn4XgARTj9v/mjL84XjfF68VTOLYEok0MXR5YaA==
X-Received: by 2002:a05:6512:3f1d:b0:545:aa5:d44a with SMTP id 2adb3069b0e04-5494c33304bmr2297080e87.42.1740823441381;
        Sat, 01 Mar 2025 02:04:01 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494f8bdde9sm463722e87.148.2025.03.01.02.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 02:04:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	deller@gmx.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux@treblig.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] gpu: ipu-v3: Remove unused functions
Date: Sat,  1 Mar 2025 12:03:57 +0200
Message-ID: <174082343297.2941786.11452976094065423321.b4-ty@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_020403_852509_65997325 
X-CRM114-Status: UNSURE (   9.54  )
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

On Thu, 26 Dec 2024 02:27:45 +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   This set removes a bunch of functions in ipu-v3 that
> have been unused for a long time (since 2012-2017).
> 
>   No changes to functions are made, just full deletions.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/7] gpu: ipu-v3: ipu-ic: Remove unused ipu_ic_task_graphics_init
      commit: 16e3bf497fb2d379f3d461fa0c85d14de0a3d183
[2/7] gpu: ipu-v3: Remove unused ipu_rot_mode_to_degrees
      commit: a52ba18c254c0a3819e632e6371554f1c6f5bd16
[3/7] gpu: ipu-v3: Remove unused ipu_idmac_channel_busy
      commit: 4f9c64e95c3510f4a5192bd401de5611c1dd5637
[4/7] gpu: ipu-v3: Remove unused ipu_image_convert_* functions
      commit: 96e9d754b35e87a5be2de7dce3c810ffdd769c84
[5/7] gpu: ipu-v3: Remove unused ipu_vdi_unsetup
      commit: 27985c86e283e1e5ac8a9809f189f03643a6f5f2
[6/7] gpu: ipu-v3: ipu-csi: Remove unused functions
      commit: c687c3147d5de801ed835b077802b68fe85d8a3d
[7/7] gpu: ipu-v3 ipu-cpmem: Remove unused functions
      commit: 2800028d5bdee8e9a3cda2fec782dadc32225d8d

Best regards,
-- 
With best wishes
Dmitry


