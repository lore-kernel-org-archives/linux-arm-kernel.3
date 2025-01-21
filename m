Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED95C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sKmlgZFxW5SzQMIIe+zswmZcO3cIm/lz/eCX/l5rXA=; b=dWYJB7WCEf3MZa+OuOtcwu8jk8
	UWPeFzJRU0fnYsEnOs4nJJPE04uLoWZkDFf3Rkssjr+ZtauWsTUgyimJAhSOtIef4h5Buq8agEgFI
	PZ4b0Vq36AUd/TqbpDHUdEelP+ZCc3Uymret9IzjBKMbMEWizuzeLF7CbFGp5ubmhRTJgig7k1O88
	TF1a5OXUwDuzVKdX/3dCRTcmMHrAsz9o+L11SOsF3z41VrpXz3KXtR4OffnNkHbscllrsHa2ZO1Vz
	E2o6s24n9RCAoFWgTLN2ucWAZn3d42UaHh3SY1xCN96PPuOenYbXfssWDUux9AfQQ+7c4zuMgIXts
	YTdGrG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBKp-00000007Y8Q-0NIW;
	Tue, 21 Jan 2025 10:18:15 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBJX-00000007Xry-3tqo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:16:57 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3022484d4e4so55987201fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 02:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737454614; x=1738059414; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2sKmlgZFxW5SzQMIIe+zswmZcO3cIm/lz/eCX/l5rXA=;
        b=YkAWoLfL7Lu7CPAiesvXJOq2QUZZOWiPneUbRi+OfBxLoeio41T/XnmPtxI0zYXwFE
         g1nPE8vT11wm2zzcxGT8Z8VfWTg28lsP6ys1yzd7QDL6tE/F2r8v51czVgLjYJ6DbIOD
         HMd4JVjo8+7KugSIG+sp4nxEKHGC85931WsL2v2eZobpZtwT3BW6qf4UbS9isoX0JbKy
         irVug2OtMwi1qmBRrAGwPFRvyAJQESt7cCsdubQrJ22zO4js+Lk4We2ljq6OXWTH1q/v
         HMzy3uFOAiZB8C5Uow5xi7/OojUDUzE3IxkqkMbUbPZ0mo6ynjBOmWlv8jEVBjunlp17
         fRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737454614; x=1738059414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sKmlgZFxW5SzQMIIe+zswmZcO3cIm/lz/eCX/l5rXA=;
        b=tNNj0qhealvFQtwbr/MCL09Xf/Ewd6IT6C2qUFzg5vx7R/qtL5U0PnqdpS+XthXF23
         22bBizrbPJNq8UEAdVf/pJ0EGKug9+FOiHde2rpqa5ik/j7xzfQ2Ou3E2wnfhluuEMQi
         qBdMVTEc9Fycucb4CFtzvo28ZQKk9bmHURrTFHkJyWubKZ1dWCiTWjnjiXzTZQZaUxEj
         Ww+tCwvx7XRCUobzvLnPDlltTMgbBaPZpoTBWsxX9MBP9H/BiAgSZpuuaqXvSHqhHI9f
         pBEn7qbhBtDbDkWd+qCiHh3LCMVdFRIribiSZ7Wi3/TzQ6TMopUts0pc4yTDpufz4Llh
         0uVA==
X-Forwarded-Encrypted: i=1; AJvYcCUsXjAQ3MHgPPJRRObyRpPvFjdSF2KIBj8759H/qXS7JkVgULRU7DCjdFz483SYnnUJ3UUn5Zok2x6IHc645AnZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzONqqvp32nQFa0O2YX7xP0stnPyTow0xoCa9jyGs8z6EGC74H4
	cqxXxTeCUXrsmAA+bdqiu0FinffA4zgEgqUyG1xJs0eNDnPdyrl8r4EAZITbVNg=
X-Gm-Gg: ASbGncvoJWVmeYLVrO9EfEkjKNJKMYDMrRIIAlM5fJWlz/bHuBXVa9+Nx+tic38+JL7
	fGZOa6qcfZ/kPXKuefPJ5BBmSyZ6wrwBBtTXdI4OANNFiMg/dsg050Yu2u2xwkHS8yFlM5Wi4Zq
	QOywrVEVVe2qqcnJn1eulkfxd1pKV6o5ciZOi54P2CCk1iOJbcdXsNaUFPIhITy5yS7uXlljEuA
	WymxHy1OyzXhvIOSY0qtE5QWyTNUIxzzIAY0EJ1cdrBTkaQIFr/9ESjheC0jA5gxq5pglKqeqwO
	P6WrRXlFZ+P1jruJ+9iJjtO4Dprz+3Gmr0naoYVkJ0hu+qomlQ==
X-Google-Smtp-Source: AGHT+IFznj5QTkxejj1h7e2DHbCZsbF1n+9b/WPMSF7tP8oviwsQK24SYuQjBNYHiYuWIa5m3UyWwQ==
X-Received: by 2002:a05:651c:1309:b0:300:3a15:8f0d with SMTP id 38308e7fff4ca-3072cb284e5mr59022731fa.34.1737454613712;
        Tue, 21 Jan 2025 02:16:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed203sm21215321fa.73.2025.01.21.02.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 02:16:52 -0800 (PST)
Date: Tue, 21 Jan 2025 12:16:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: oushixiong1025@163.com
Cc: Joel Stanley <joel@jms.id.au>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH] drm/aspeed: Use devm_platform_get_and_ioremap_resource()
Message-ID: <b5rhfo6q6ko4vf2vubkcma4v7dnpxruh7peyqav6tszj4sg6ee@mzjc543jsujn>
References: <20250121075041.201599-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121075041.201599-1-oushixiong1025@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_021655_965422_48977D87 
X-CRM114-Status: UNSURE (   8.44  )
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

On Tue, Jan 21, 2025 at 03:50:41PM +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
Missing commit message

> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

This doesn't match your email address, so SoB is missing.

-- 
With best wishes
Dmitry

