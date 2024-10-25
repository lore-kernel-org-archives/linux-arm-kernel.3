Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC68D0C600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sRf6jyLr7Lp7D8SrksXFJe24XLraz/lmXNXBNiv60s=; b=lj6yCacGLBC9ocQWek1ne5vkY/
	6qLEMY/hlhMIbBEUQbE+gupJbF2DQR8I6QyOUWIRtY6b0WUxlsb548atk0SqlAbLUCtN1V6aTqdMs
	sV30ii8v2zo36bQq2M/bLHtT+yb25cxRFEWLoX4lympBViM/Wb+l/1Tl+0UkQ3WL9Kgvr9KvmKwOq
	r36MqBwf/wATOKHX6O9mJe82rq4OsTdbnfsMrB2T6BhWvLHKsf7e67OX4dXD/6mZuc2UqD5xM9P6u
	RSqgaH06U4DbnWjtxjbNBgGU//qK6rjIN/uD9mH0riCoz3H0g60zSLAAd7upFE965vwfrS/iro0nC
	ZktFYNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IcS-00000003Wx5-3zpA;
	Fri, 25 Oct 2024 11:36:40 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4INe-00000003Uct-3HLi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:21:25 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-4a47f8a9168so669354137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729855281; x=1730460081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sRf6jyLr7Lp7D8SrksXFJe24XLraz/lmXNXBNiv60s=;
        b=U3ZOxK5SFWGujYqULnEtIqFsO+5wgQDFJWbpw5Lz55K9zMqJ/8Y3IEpp4RzBIb63B6
         BNVw7Zqc0+l0hme8N8ojRAvA81wtDjVTfqaD/JywjnhFAm/GkGQ6/18CTnjIfzpipO5u
         7m6MSS1BzOwhWxwqqEVdZWeKKv7pase2w2mwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855281; x=1730460081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sRf6jyLr7Lp7D8SrksXFJe24XLraz/lmXNXBNiv60s=;
        b=Ry2hG8jOz32x+tT2237VZFNq9wX38Asg648oYozJJaY+Rho0K3iEpNKzNF9KwV8c4r
         +hNldy9tQhMBhL7br3IVbq9C85aWXIh3pCwjAWoPNOtua2iZKJEtPXSRLipBknZic3ZT
         OsBvLxooadZ08+FyBjNwdoIfSk51Xx2cXfKH7iIjUX4yMCFIKhb3dsfXlIRmOqTLgiB2
         zdJDQC8yjvtLKJdfV8qwlqhlOqcfpKSkItnsX5QmAb2rl05QNd/k/Fgg7Qhl1r86mjCz
         AROAlmKRILLResngenU7RtsqFI/R62naPsLjXP1YNcSDveOt5Pzc2gKSgy0zYjr+yFuU
         dZIg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5XYRWQHKMbD3ZnCIW649xOLqin3eaMSJW2AXa+oAlsXfEtqNAtr/lk/l7jkA24uX7zgmGE/l7oVXrkhk/CQz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnxm1NMRG1fwaTmyVBTq8YqCz3AMWYXU0ABU/0nygudbKXm/Yc
	R95bGDFGuJtKsyyItStXL2UsnkzbUoX9x7FCxvicQ5IIbfDyU8dcVSp0UhOOWr6TKu0N3y5Hcce
	eiw==
X-Google-Smtp-Source: AGHT+IEjv3Sc9WpaE+s/1IvgdsiNrbsS2hGVgxYIYbG/whhoOGv2GtpqLcVv9Qostjh0CL2DW0PFdQ==
X-Received: by 2002:a05:6102:3a0a:b0:4a4:8651:3c2c with SMTP id ada2fe7eead31-4a751c94332mr11629231137.20.1729855280742;
        Fri, 25 Oct 2024 04:21:20 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85580ab7093sm139431241.20.2024.10.25.04.21.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 04:21:19 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-84fc0212a60so522108241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:21:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVynSO4dMzflo22wPqzSzMtCwzKpZcXEK4cePF8t6rL5/sf6/om/AXZgSFAFXNyx3OetmyIWM7vC4YiMHjyPORW@lists.infradead.org
X-Received: by 2002:a05:6102:a47:b0:4a4:8346:186d with SMTP id
 ada2fe7eead31-4a751cbd6ffmr12043723137.26.1729855278733; Fri, 25 Oct 2024
 04:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241025075630.3917458-1-wenst@chromium.org> <20241025075630.3917458-2-wenst@chromium.org>
In-Reply-To: <20241025075630.3917458-2-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Oct 2024 19:20:42 +0800
X-Gmail-Original-Message-ID: <CAC=S1nip+CN=YEA7qWgZzx4wY666Qpn1-S2yMHw_jQTcjGcRDg@mail.gmail.com>
Message-ID: <CAC=S1nip+CN=YEA7qWgZzx4wY666Qpn1-S2yMHw_jQTcjGcRDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8183: Disable DSI display
 output by default
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042122_857301_545F5832 
X-CRM114-Status: GOOD (  12.63  )
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

On Fri, Oct 25, 2024 at 3:58=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Most SoC dtsi files have the display output interfaces disabled by
> default, and only enabled on boards that utilize them. The MT8183
> has it backwards: the display outputs are left enabled by default,
> and only disabled at the board level.
>
> Reverse the situation for the DSI output so that it follows the
> normal scheme. For ease of backporting the DPI output is handled
> in a separate patch.
>
> Fixes: 88ec840270e6 ("arm64: dts: mt8183: Add dsi node")
> Fixes: 19b6403f1e2a ("arm64: dts: mt8183: add mt8183 pumpkin board")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Fei Shao <fshao@chromium.org>

