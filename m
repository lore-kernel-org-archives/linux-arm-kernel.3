Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F7DCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 04:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=; b=aXJ1GoY3kHzp6MeK58apcjRH57
	Pbu3+oRV21c1HOP3X8j2gljUGK19bcwfASjGZC5t1MdXoKwrxTX5eyV7ApSp4UTFOu5MPbikwek8x
	5OVwU1xaz5hAUrqHZcQxoNFI6YAFgPn5PDeDOIFGO58xZCn/rm7GZEzVqlx7LrNbRwu+fKhHvWIZZ
	xnQARw6/jNodiSfQjbleH7QfkSNhPn4PxYVYd1zVNySRut/sbh9AOum1aIHAaobBUJAgfZAEchZsj
	X63z/sMg0UM2oD3TVf0KvfoMLNIjHnt0zWRP0JSz5RzgRdX498UY2tWA52fiHi8hQjYaNcEPmbFcx
	6gyHJlHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umPCK-0000000Fihl-4AxA;
	Thu, 14 Aug 2025 04:04:17 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umP68-0000000FhtD-3qIv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 03:57:54 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55ce5253adcso512410e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 20:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755143871; x=1755748671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
        b=QMzWiFHd1PubSEw6X9sM1Dg7Jm2iAOqJ2eMnUdpfr3wgj3mL5UOIJO0hqY2EB5bMP+
         rO6zCvIEBrWuJTKVoqXCUrEspitd6WQmNx6XbKv7FpsNI6gt8yuqqIfuBQWq7qaRwZq2
         UPJdIsIWZ6JrDFw6Hh9GfugB7kuoUGgfVM3Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755143871; x=1755748671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
        b=A2IC8BJ26mVkxq7TLqMUpA+ym77sEgFjzw1g9HN5EPTmZtaLMzR/RnmLhHRGn/+pBm
         2lemhwmno8mYUOpm+1Iew2x2gTdEqLSuaO8+lvoBFoXscnNXb0RZmK72RH+TjpG2FLVx
         ijXY63vQhenHWmENSHFpVk4qlOEpocOfq2USBi+lipfS/fiw+6gKNLqY5/i5L9D7POma
         2RPDaJrlU05qHXqNHoSoHG82KYo+fH8Jlimht9PqKh3I2vDxYPDW222GTYYgICCrDBMl
         MaGvP9WJH8R0Xp1hA1WUA90q69DfUYGfPGlNGfKemfb2CE/n3sN5PkLTgYILZJy/yovG
         Tenw==
X-Forwarded-Encrypted: i=1; AJvYcCUq+Oqjlk11hTSWKMgxS/sOa1APCfdN4esEj9B/Ht3lfehx2IKwB3jUxgddyNRqTbnh+Q+u+/zOJvDHSi7s8DI3@lists.infradead.org
X-Gm-Message-State: AOJu0YxfExiRv0tzc/aV72jvygMLd6TyqJWWogj7ww6EnqBKOP6orDax
	BwCPaX/bZTVbIQSA+pIGmm4+7g8ohnwgx9gOvOx5b+5KhS4xuyeySS6zYkIAz8yv/yxhlAVwuz5
	W/Eq6tqS91jq14AZerp40dnZnYmdhXrFZMf3q9ROW
X-Gm-Gg: ASbGncv0Jz8aaL6uRXZSMttenKUn+fM29lSzOjcq/SNufX9x851/C6kInDOS0KxSQgA
	trR+nQZfsJ+pAE8JFYWcIPURrKJsdTC/je1AdRoD3vKyPN+0mGIdxgEUOrkWpiBzQWxEBojeSzT
	5vuYuiC+IBP1xwCE4PLPxzjrfEbBarfbc+BfXpkJdLSKoaCwlVCzRWsuBP+XvzILKImMv7vWYE1
	a+2PcSrY8C5iGb4enLawMZMRApCnf5rJQBCeXanbhS/DA==
X-Google-Smtp-Source: AGHT+IF+5iKv8rMK9YHb6myK/q855kRCdUIsQfOlyE7uVil4m3zuwOKJ3gr0xAyECxLHg6Jl7SqsZkrMsfX9UPSHH2s=
X-Received: by 2002:a05:6512:b8a:b0:55b:8211:cc88 with SMTP id
 2adb3069b0e04-55ce508ddefmr488807e87.51.1755143871084; Wed, 13 Aug 2025
 20:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Aug 2025 11:57:40 +0800
X-Gm-Features: Ac12FXwH4SzGC_raZvHd6w5DhOOOwcWIZ0DYC3dWkFgv22xak8lk2qDrshBunvY
Message-ID: <CAGXv+5EDj4JEKAFC-Sv8kyiBNy8SViEXaepdssG5QTu_HtYQHw@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_205752_953979_FB0F8255 
X-CRM114-Status: GOOD (  10.42  )
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

On Tue, Aug 12, 2025 at 8:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a dedicated initializer macro for defining pin functions for
> mediatek drivers so use it here.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

