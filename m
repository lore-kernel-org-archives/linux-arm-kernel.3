Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE208C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 07:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RtKA7NZNuHzBQS6CrTPRAttssEFDmPD1Z8kR1U88AY=; b=vSLXtiVnZnSBWpsbpXX1NIndAG
	AlaYWFB/WyhEfLKefZbC7usrrn56LkfSCxIx/KbDthox40Lzu7Xm92PCb2Mq4yjCQBYNsvKUClEm+
	3hsrhpIh9B8ydqS6N90qVy6HpzDTfBP6hQqZlMn0KBwGwr0L2nsnaXMPYK23Lw3ZlzASc3dS3C0qs
	30EeR6LR5dqyvW9D1uySW1BvWTM92LjVDly2pDy0vlLMXW0qAs+gNB9A9VjgpDdSuE0mi0X2bhzGb
	+VY6+GPZ9NfbYgPzrK0bxIoJupVSYW4aXd1iEziwC7epdvwqjxrULEzyofUM/r09VN6uvNPCIctNV
	f5AFWyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkQt-0000000Bh1Q-2OS8;
	Tue, 13 May 2025 07:52:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkMZ-0000000BgDQ-3vby
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 07:47:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso35466905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 00:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747122462; x=1747727262; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2RtKA7NZNuHzBQS6CrTPRAttssEFDmPD1Z8kR1U88AY=;
        b=gGG8YzfwuAuDNbaZ2ue/m71ha5RuNZdkCPCMtSAyxiEUjkYtovRjKwZHS6wxt3r0Yi
         7QSBfrh7c9nk4aFqR8Hca0OmfHOdUUymGo+Oa5hWwfEl5sJxBvmEch7601YKxkHul7gL
         w2k6S52Zzei/GmunGJegOyM15BWU64D9NU5akPPwqO7osbLlDb+lSAx32UlxdrdGy9np
         ctWIpZlFIHOhhAHLdHopd/FEqT8Wx4i7EDLY0xTP6A4u03idzsAMAZJdgXqDgvKpTM1z
         qL8lYNHRBhnLmyETL7QNxpKaBa1zCpc+SEIHGnZDVc1fMHyeOmweTJCR01veN8wcjE/e
         hfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122462; x=1747727262;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RtKA7NZNuHzBQS6CrTPRAttssEFDmPD1Z8kR1U88AY=;
        b=ALxSIsfwqjCWpunJXYvSUgWapxNZHpXtteNmpA61OuUv/leWut7b4rtEX06XaKhn4q
         zhk3MoEpNOdHPNUsoc8fh12X5gU5+8qbIbDXNg6EAT//1nAkaCDar8DhGWfACOktqiRv
         MnmbJmuP2eXnfqHhvacN3xBfyOaV25ESyGkpbM3vIHPAFolxuDDhtysiBa48UIdv1XHw
         dLXBVEIhmMe/cfHx+zRbdUQY3/cDRbOK/wgH4htWOWJGzZkuA0tsCWll7wpFyyKC4TOo
         jNd4s5ptDVKCkiHx9KWrgTSTT5ko5tbkKtZaUuj8NXis1r2Xpfj6ZdN/q0LO25OH7Fl2
         AaUg==
X-Forwarded-Encrypted: i=1; AJvYcCW/uyOKtlaH1Tgi+488hcPHIQyVl/ZlmEb3j4A0w4OBp+mHDEXCP3F3WZaKFbYeC5JQjR6TFMfnztGgYB5ijsQQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1iqv9MTWDPvc/3r6PGzE/wyuYRd5ldq/Dq7Jr+i4djzmCoW32
	Y2SWXgNOIXkByvTXNH282tG9HSGwAeGV8Xjmx8qEsn1+zOmmkARyOHgYm9YlATA=
X-Gm-Gg: ASbGncvCCZOs8PDUeHAJyxIso657r4RAHsGDOpYGC8XEEbal+mj/WZjKKF37rXz9KbE
	5W2HVlRkH4CAgZYLCWbklJ9OKIbdr4JquuRwYlAFzuHWmMGdCd78VI0OfXtcbWt+WEBPP8MnfnP
	sI55CHS4Xm3PhGQewz5go8C2N6fhvNjO7iHhwaJQS1VayIbSuHgxYj6VRm73fsilm2cfXye9GNe
	5nlJ8s0WgvHAijol1v4SR2HUqcpal30m3kO4nkwK0eEbxiJeY5ioQeanWL7mzI81xCVdLVHtWFX
	3MkGT06IlDj1N3wnp156HrX04sqvz47Wid7VlGzZ4xwWLUegHnI=
X-Google-Smtp-Source: AGHT+IFAnCZ6nPY5UPyadmr7YhyYRo5ZU39JgB3mmEwc8mv+oARHGq0H1ti0jbO/TdUIglDMyD/fWQ==
X-Received: by 2002:a05:600c:5d6:b0:442:e27c:48da with SMTP id 5b1f17b1804b1-442eacabc61mr13471135e9.8.1747122461595;
        Tue, 13 May 2025 00:47:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:780d:7cd3:15cf:b5d6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a2d30asm15070456f8f.76.2025.05.13.00.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 00:47:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  stable@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
In-Reply-To: <20250512142617.2175291-1-da@libre.computer> (Da Xue's message of
	"Mon, 12 May 2025 10:26:16 -0400")
References: <20250512142617.2175291-1-da@libre.computer>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 13 May 2025 09:47:40 +0200
Message-ID: <1jecwtymsj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_004744_238071_D045ABD3 
X-CRM114-Status: GOOD (  18.95  )
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

On Mon 12 May 2025 at 10:26, Da Xue <da@libre.computer> wrote:

> SPICC is missing fclk_div2 which causes the spicc module to output sclk at
> 2.5x the expected rate. Adding the missing fclk_div2 resolves this.

I had to re-read that a few times to get the what the actual problem is.
If you don't mind, I'll amend the commit message with

'''
SPICC is missing fclk_div2, which means fclk_div5 and fclk_div7 indexes
are wrong on this clock. This causes the spicc module to output sclk at
2.5x the expected rate when clock index 3 is picked.

Adding the missing fclk_div2 resolves this.
'''

Is that OK with you Da ?

>
> Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK Source clocks")
> Cc: <stable@vger.kernel.org> # 6.1
> Signed-off-by: Da Xue <da@libre.computer>
> ---
> Changelog:
>
> v2 -> v3: remove gp0
> v1 -> v2: add Fixes as an older version of the patch was sent as v1
> ---
>  drivers/clk/meson/g12a.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 4f92b83965d5a..b72eebd0fa474 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4099,6 +4099,7 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
>  	{ .hw = &g12a_clk81.hw },
>  	{ .hw = &g12a_fclk_div4.hw },
>  	{ .hw = &g12a_fclk_div3.hw },
> +	{ .hw = &g12a_fclk_div2.hw },
>  	{ .hw = &g12a_fclk_div5.hw },
>  	{ .hw = &g12a_fclk_div7.hw },
>  };

-- 
Jerome

