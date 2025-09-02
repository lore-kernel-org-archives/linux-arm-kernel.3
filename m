Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02DBCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9/dg3rMdImtSDs9qVPDpc7idBTBiPszJRQRzWERi5Y=; b=MfwMAEa6NgP5H9Ygfn3MM2leRW
	CTbZuGUaThz4Yn6YuBx8PASh9C6FV9jlIRgmpRqJI4NOywKs0kFpwqeN1gfK59V1mtrn3MTaY8w0N
	gNqMydFbz64PUyjdqu38YHerim7YJR1M/hFkqgvzCcuQlN4g3mI+EpkcGHTrKxQPFA9Xh/cIf+xsD
	NqepZr+pa3QMnVBmEFaZKwh9nQB8ltRTXTU1DidX4w/gSqrZxSugJqqH9LLhjJBAXwEONmqYBqrBc
	ltcTfpGPRwsbzWMiKcqR08FfyqGw2Zr7yvkVTtLf3iCxc4LWffFQ5ce0HCju9cuf8F6AofDStptlj
	ujpvFeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQAd-0000000HItd-1Zqv;
	Tue, 02 Sep 2025 12:31:31 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNyh-0000000GbNt-1o3H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 10:11:05 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5607a240c75so1697368e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756807862; x=1757412662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9/dg3rMdImtSDs9qVPDpc7idBTBiPszJRQRzWERi5Y=;
        b=Z60UBJyJW+2erPYJ57In48YRzqU4RabXLzpvgN6HWtHTc7pq7YpjU85bXzxSWhjFFL
         E5E1+VvjAUJpghUta83WNYywkPxBub3PGJNzbjn9Orry2L42gKeiqLJYvIfctVfMstrZ
         1K8RYryKbenzCNywFf6SxwD0lwVu/dLBHjE3lEAWEhwB06V4lrB/I2RfxnUSs1d4mytA
         2XPwoWVAmTga9pjElaA60Ykrb5XaQS50At2sG8Ziazs2IBRZ41oREgTRYCDEKDYF8GxD
         1d1r1YV4XvW2P0Hgn1HBsR2ymqpcAwSZ9X5vl+WZqC5M/0LjscP1LO57bXhs2bgEmmAc
         Mu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807862; x=1757412662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9/dg3rMdImtSDs9qVPDpc7idBTBiPszJRQRzWERi5Y=;
        b=X+uP8hspE1abf1Gj71zkztzV78kB8yegLsAsoJyTGx/TMOrdwCWMAkPJFiILKCpHUk
         qGwdu2091AWHRXdW2efEzvCitrH/fgWjFZT+K7DLOsoT86MBEQZNubMGCinxh5zB6L37
         2hmjWKnbpTeCPx1bliOsiwn3QFeXiqI0qckxVGK8ebKALG/J3x0o1/ZFnENzqKayiRIe
         ISGNhbNXC7XX4h9pwu8iiY038viLOU0GHOAlggjrl9kQRWfyhJn2/qbL5QwwrafmBpN5
         7YDdGi/Zv+FmhgruUueMIQ5cYgE84GG5XBYHiCTrGFhQ0ONuMiQJ+tt1k58fUXqsOF6q
         dvLg==
X-Forwarded-Encrypted: i=1; AJvYcCUyP0Sjvp9hkDympJaDWstWPDbqs3CjIvV+et5c8SH4i3K0oJ/qtILnWx662nkI3u9rPwfOOHY5P/f1YnXogzCG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8CsdBlcNsWH2T66HUmN5aZbOSDIjCUHpwSWHdPL9rn/mr5Poz
	SI3ar60O+xAMUaggAzLIPT0vwcIA8E/sk16X/i7sDwGPr+imEHN3hS3l0OcCioZtgCYHvAVkSX2
	E7uADmqt419T+B5yPa7vgiUio+lryEnmQ0WTIHE+ZqQ==
X-Gm-Gg: ASbGncuhRZjw+cY0vvGOZofTDVIpCk1BfAMP3NcXMn83wUfBs8PxpkhPHhUZDga1CEq
	CHO93YwyT7ooMA1yPfTuQZUwL/1pz1AZ5g3TMdFUCXMPzKOaDhghGFSH22ToD4JsVk8R5bpmNa7
	NOdSV+TZtXC+GJqc2+ORCrO/mRyCq0boprTOlTu1AUqApzu9lGNvJPGNOJWFZMbbKYITA1R4xLP
	WHvCLk=
X-Google-Smtp-Source: AGHT+IGvJOVNe+LUFvOCbgL5wgN/h/Cjvl043KlTfsb1COy3EuiSQw/TerVuRTUEwrGuUBs+VE/GG3RycL486iAnqi4=
X-Received: by 2002:a05:6512:250d:b0:55f:34e8:b1a4 with SMTP id
 2adb3069b0e04-55f709dda1amr3184317e87.56.1756807861583; Tue, 02 Sep 2025
 03:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
 <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk> <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
 <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk> <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Sep 2025 12:10:50 +0200
X-Gm-Features: Ac12FXw4LKCvHHNtKGBjLfwABtGCHq93WPj_v3YPD6EUsw9OMGyVKBEoUj5pgYE
Message-ID: <CACRpkdbrRc6E5idzkdN53QPDCSGpPUfdjmFmEFsS3g+v=cB6LA@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_031103_484845_AFBD6FC1 
X-CRM114-Status: GOOD (  19.77  )
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

On Mon, Sep 1, 2025 at 9:22=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> On Mon, Sep 1, 2025 at 4:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > On Mon, Sep 01, 2025 at 03:20:44PM +0200, Bartosz Golaszewski wrote:
> >
> > > That's not a lot of info but it fails in strcmp() which - I suppose -
> > > is the one in pinmux_func_name_to_selector(). Any chance you could
> > > check what the value of np->name is in imx_pinctrl_parse_functions()?
> > > Is it NULL for some reason?
> >
> > [    0.628245] imx8mp-pinctrl 30330000.pinctrl: np->name pinctrl
> >
> > https://lava.sirena.org.uk/scheduler/job/1758947#L705
>
> Linus,
>
> FYI: I reproduced the bug on qemu with an older ARMv7 IMX SoC. Should
> be able to debug it and figure it out shortly.

Awesome, thanks a lot for your perseverance on this important
patch series.

Linus

