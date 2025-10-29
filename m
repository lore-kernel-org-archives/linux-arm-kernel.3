Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4402ECCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjbKfgzHn5tyeA0m3V5JJ3BLODA9JPFCp9Sk+QT8tK8=; b=g0M9esPlJPOCfiu6trm4Hw36yt
	sZgtz5rrYU/P1IvMMpZkMknJ7QladsKwhWucbsBSwz43MvT3RAtd8EUjR46zYfaJDgOPT6WVaRquQ
	KfR8YjMhD2+Dti+y6776RWxjuWeIPRBgI8kydPmEc+PMYZt9g+ilWG4miI+ZSqEYnsypZvGF3x9U/
	E03hzaqnK0Sp6/1WNg/wCs49wVBpSSHfdBfJgP37VfukC5qu+LnlUPBBI/GGnoUWzDYYAFG6F+hao
	2Q6t6hPmUVgCHBg8OSffcPGgMA48/TD64KVydo3VhsZyTpyoN3kJYU7WLAaz+3MTuN1bGlwDbbjeT
	tyrNcccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8bA-00000001uLj-48A9;
	Wed, 29 Oct 2025 16:00:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8b9-00000001uL0-19Qv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 16:00:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47710acf715so20329735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761753629; x=1762358429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjbKfgzHn5tyeA0m3V5JJ3BLODA9JPFCp9Sk+QT8tK8=;
        b=NIArlrotaLd6zyHMkDTY+iHYgrm7jYr0KtTqbsMIMh0PlKq4fXMWHzui5es9gbwLqc
         owSc7IybewYAmsycA0U0MH/KG+wDVCVxrikcgyj7ozfR61R4zDdbvIe+KYH0J6Tj8IoF
         jYhQVT4hAQWlBY4TCA3wG3YJMDQfqAAurOm0NXZT9MEL+UyIoRc7wYiIc8nBdgWxE43S
         5ApPhWj1QZnFSoveIT40KZuN5HIZnyKLiGuxHjDF3u9Yj98Wr7oC2LdUFTu9zcNB5Awh
         NLx8IVC+M2n1O+N3EiRFBfhrkUduERDDR+Px9C7IHhEI5kEt6dpB/CgzPgVA6hZLe6Og
         CqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753629; x=1762358429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjbKfgzHn5tyeA0m3V5JJ3BLODA9JPFCp9Sk+QT8tK8=;
        b=CYIbttLPcP8QGHCiRa05XALXRFPJ+lOHtqF3ftUERe9/WZ5JQS6vPkL0bzizAEvZFD
         K1zhTsn+pPlpOXvh8LvLBp6B6hsP5bQn+dJ040rpD0Nf3r7f2wvXMH39q0v4c58DNAR1
         MqN61QS4FV7UXYX+9XswPfM0M1mI82l6eAnxLwY4R0QibXtdSvcbVSKV+u6Ug4i4DYHC
         3Q4fm447jDeFU22uXq7xmC5bgBJFQhpSddzn8Qzk6oz3iwSFzGuubI1P4hM5ThdtpzlP
         X5g7hJlByZzSdwVMlgueXzedxyZ5VmH/fwuVQ346u11r1mjuuxhqro/hCEi7fZ1kYJr1
         7CRg==
X-Forwarded-Encrypted: i=1; AJvYcCUhgOVZDvXzKXimHxj68078wVMC4xxho1/p4tIbsfyDoq+r9fu4L6dNsQp5ZARroQJGdI/12nEuXcxUqq7K+rOr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrg+NsJy4ishAnkmJh9LdZ3X2WNRtcyUG7zmtIafLPay51bl6X
	JzuUkzMCudMvFfkcel/ccM1MricEvMhm5/rq3ONMVZL/6x4nxklOAgA2
X-Gm-Gg: ASbGncu2bnZ4mq0QGM+J2928snjNNYG1ezkJPEmI2eJJhPcq6EPk6QLN6EUXiO1Xk7K
	VEv1A/udK/hvm6w4+xSD8iAZSbpB17qOXbyHblE41nR84i+NMbytoyw0tna6fRjIwJBcswYSt3u
	xohJPRcMdDirVoK4JLtOuxdMuvTYU34LULtaLiFIMcZBX1JpfBsuaPjj5GhC/TvMcpymNt2sccA
	akZLrEXhsmlFEc3lJhVgbVlTezxmuPaQsTfNN7r5AmTZSP/qRVdLjQS0YhzX4rtTec2oqB83Jat
	YhjcmjbPm3dG88/Ghr3Z2O0BXFSfgRHcVV1KfBBVwtSj5SsA7UeHkOay51B5bnEGswWiFU2gLNX
	cEOS51MWjRKRT3eaRUxtjfiVUOpRt7ofV4V+CA/JWymLf5POdKEKU/L14gI+BgTDs6F2X/T/vfU
	nfd9t08Tnu5mHY939nfPx73CE3zDccm89r2zAZIDeu+7Mwu8dT0y2ufbVsoxNT3yi8AqPF
X-Google-Smtp-Source: AGHT+IELwKkyoHZcEXoDh+ODYAhJc1PkQChXNnF/56yRmyxyp0iQGf8PAy40wU0hq97LrnXaNPX15Q==
X-Received: by 2002:a05:600c:848a:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-4771e21c484mr25812165e9.21.1761753628706;
        Wed, 29 Oct 2025 09:00:28 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3a8209sm54097015e9.11.2025.10.29.09.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:00:28 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>
Cc: linmq006@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Fix device node reference leak in
 sun4i_tcon_of_get_id_from_port
Date: Wed, 29 Oct 2025 17:00:26 +0100
Message-ID: <3848160.MHq7AAxBmi@jernej-laptop>
In-Reply-To: <20251029074911.19265-1-linmq006@gmail.com>
References: <20251029074911.19265-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_090031_314504_936E3EED 
X-CRM114-Status: UNSURE (   7.81  )
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

Dne sreda, 29. oktober 2025 ob 08:49:10 Srednjeevropski standardni =C4=8Das=
 je Miaoqian Lin napisal(a):
> Fix a device node reference leak where the remote endpoint node obtained
> by of_graph_get_remote_endpoint() was not being properly released.
>=20
> Add of_node_put() calls after of_property_read_u32() to fix this.
>=20
> Fixes: e8d5bbf7f4c4 ("drm/sun4i: tcon: get TCON ID and matching engine wi=
th remote endpoint ID")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



