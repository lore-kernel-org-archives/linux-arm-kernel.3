Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E999C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 16:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STMuo8/qd05GfAY8QU0fDaRLs2uLrskCqPaVJINbTME=; b=i1iEt2oRAylzMA
	KlTBkM9ES0e2LJFS0ymLX4uh+4QSq7EZjlnMZ7uO0Fk21K2gZ74KpMSNOS5pvr+Vo9mOUSaGMKDkO
	PZug8jsjvwxk0gRZvFVtnugoCE6muX2F1ZIyYrCuPzhsK8YB+HD0Qa74nUGg5Mj/S2tgS/elQ0oGx
	lBAXqf5oGs74i2w7knN0AbIdbses/Z/T5lGx5gKDiRSuA6I+aC8Z99/JkVBHcbvZg6dWSlcYvgbzO
	cPuQOQXwRQUcBdsFCd56DocMjshDp6W2ajfPxHYlHPEnw5aJx6gxK4l63M/mKOaSMtK4MCjG3+V+5
	8VXdyXzdDv8rnTm8ur8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGhK6-00000007JcB-0y6U;
	Sun, 18 May 2025 16:57:14 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGhHC-00000007JR3-0Yl1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 16:54:15 +0000
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54d6f933152so5463489e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747587247; x=1748192047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STMuo8/qd05GfAY8QU0fDaRLs2uLrskCqPaVJINbTME=;
        b=o0NL5QQjZTwgU4PHcGEyhdD94ZGydVytDYULS1ax1uqVstGHVxSkcUB4F/xlbSy7JM
         wgKzJ+glAVgTO7Ga9CySEljH88gbTaOUSohJryuucv50zeLkH/pLvSeAscqt6aIdobG4
         XVO1D9kWyVWwOJp+jZU53SGvYfVoxl7xRjCLzyBlEnEhrfApq8oQxcVnoKQukW/zGQdr
         EXpJ2NS9jNbbroefiZvj5bmcM7c4I67SgOgmf789WmYVZ33W7mRQyRmiyJECIow9e+kD
         TarwrVjEade3Tnh93nkldArRSaojkkqMKOLSVF3y4aP28qFE4+EINo82Bh5IPvCOcifO
         D0hA==
X-Forwarded-Encrypted: i=1; AJvYcCW2FT11WL+p85zPVcB9WCTfqPZxjiNz3hIpMX2gYgsqwgaJWxeRTL+wvYjRWXHENu0n73eURyZR/XD+TtS22Hz1@lists.infradead.org
X-Gm-Message-State: AOJu0YxZQ30aumxpIHcaq0EKEpGb1DF29z1fl/me85cgg52rQwcfAhEc
	VUSpzPZtEiqb5MzSNvQTK0wde3ypJcO0yBAWhSSppBdodYsNDZIdBQxR1Ix7t09FUGI=
X-Gm-Gg: ASbGncvnjiZBGVs3kRLkmVSSoWmkoHjakF6cfiImP+BX8U3FXbCmlsOOkzB2UPU0rR5
	SOhil3RBikh+KVXu/YSKvMjbkal8fYQttT1U1DEkhyAh0pykphdpvigXoVDPivOKtx+S0syN+S+
	+voM+j86HD/ugzZSwhHomk4X6vqlWoTYqgKuGQszBc9yxjDF8V8i71kkniG9hiBz7rSktlCv8pH
	6vCZLKT4GZ1QkfKjkqVVmIvClm7hpcFQIKE0B4uZQRkB4Z3I42Czt6NLD9hGLusKbG50rcjXvdK
	WXH+8Md8ZZZEAt0Gu/soEe6suIPbYYK/fFWK8oA+Ad3/27eT2PubJ0lY5u0S8ZFsMAz78IwhUye
	j8SfP3HM8
X-Google-Smtp-Source: AGHT+IFZEb0h4VijqD1zpd63c4G/VPLNTnhx57oQoEEYauLRBvjixMi4Q4orMeiqenMsMnK4/8YMSg==
X-Received: by 2002:a05:6512:4615:b0:546:2fde:d2d9 with SMTP id 2adb3069b0e04-550e97cc81fmr2526064e87.28.1747587247136;
        Sun, 18 May 2025 09:54:07 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e8a3sm1485580e87.221.2025.05.18.09.54.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:54:06 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso34449371fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:54:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxVPH+zM9YbeC+rlvDsMXx083Zi10iGpXeJMFHk03WVtR7Ld3ZJM9BjH+6EtfS3z89nDiZv+Ff24gFM8kAmQG9@lists.infradead.org
X-Received: by 2002:a2e:a546:0:b0:30b:fe19:b07a with SMTP id
 38308e7fff4ca-3280974cd4bmr28754701fa.25.1747587246119; Sun, 18 May 2025
 09:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-9-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-9-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:53:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v64v_uDKVs0QZkC43fH9aiBbyBnVwJVYNWAHPe2GMtwo6Q@mail.gmail.com>
X-Gm-Features: AX0GCFvgY9QrpGrKT96c6LVa08NAsANlz2uVfwNxjbxYFVM6-idz9sCykjNFd2E
Message-ID: <CAGb2v64v_uDKVs0QZkC43fH9aiBbyBnVwJVYNWAHPe2GMtwo6Q@mail.gmail.com>
Subject: Re: [PATCH v11 8/8] drm: sun4i: de33: mixer: add mixer configuration
 for the H616
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_095414_163799_3E44A492 
X-CRM114-Status: GOOD (  11.00  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The H616 (and related SoC packages sharing the same die) carry the new
> DE33 display engine.
>
> Add the mixer configuration and a compatible string for the H616 to the
> mixer.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

