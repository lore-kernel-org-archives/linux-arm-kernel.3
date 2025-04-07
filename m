Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726BFC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDu17t7QA6exZYoRurdfltwiK2f3AboG3S2VqLAUx8o=; b=y6BPb/IuUTzA2b
	SULZf+V8hkakEUY61Svhu+v89OThC40S104XClD4cj3Olza4WwQ9YL9g8De4nyWTGSQqpr1Zo5ozT
	BdB3Gfv7CagkYAlmy8VZOUQ2NxjnVh9ugKNl5t9wzOvVxdfWuPYMthgt3DsPoggxjlCtpqsgeEV/D
	w2STtwKKWpz2mfgH/r6btgKaMScPJhlutNeFKDhebnMBk/FwYA/LmB2RSEm21K8d2csqEnzR0EBaB
	N4M3IoVn3+yvrboltM21pYZZzkH9fdCxBJpG83vv3agqJdwofHOcM3P7JI9w6IKMdqos1DrrU/eNA
	pBbiEtBbmMOiFwjOlSsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1f0v-0000000GS3A-3K2I;
	Mon, 07 Apr 2025 05:27:17 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eSW-0000000GNpP-08I4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:51:45 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-549967c72bcso4634326e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001496; x=1744606296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bDu17t7QA6exZYoRurdfltwiK2f3AboG3S2VqLAUx8o=;
        b=czg3JUJBTOi3hhvs/SL/78VBS/tYIoPgLXY4FWIqrB495h/Du7+0HkEJA05o+XkUuj
         A12xnTY09Alx4eYgM+6xJw/40oaHbtgC2TMfr9iXH8TtLAhx0z5pF4NE6ejQDBB1+B/4
         EnSeIuE/7AIZgf6bbcE6+AJ30XL6TtbFUHMFVklqmlOTPw5fuspREs1+6r/z1AQE+TI8
         6g4lXAG1bpV35HegbA1S4r9L9e/NCXmVy0tU4jksTvYedHmWAm4uNvSqymjhCUKUPour
         smtexqdxYJ96/EZDgRifzBFxOeJvNQXCOyAFYjDgxCih1nDKb3j+P9pdWeblCybApKGh
         MVZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6PyeRFnHMUMFip5ygJbu3og7wxyzGqE5LE2IzmCOZ93BIBYqOxBbj9IYqxqqqpDNzQ52zMBob6orzi5oWc5bT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7On3+CaNvOq+3Pye08GmX8dSgY9JAG6Vee9UG1ULg9HEnLSo0
	pt2O0yYvg6WSrWwvALWFRcTeOauZhso80MpGFscDbe4C6zc3U1o3nnSWqWCwtBA=
X-Gm-Gg: ASbGncss827fy6IS6pX56xRzCX8OqIKxYP20CW2Grrnad8kRDXzj/1eQiCNytiL7W3k
	nPc5noOkJPx8TWmFXU4d6fM+ymSm46zTgUGP4Ba+gCv90Ntkr4o3uTVuNRXfQfROrICjb3n0X9+
	uEmxBKfzRRxmvdm7h1n6DCsoswAKfXAWiaYocyUuOCepv1cQRC2cHpwFpZ3ZpXqbe7ecT0/p16y
	ojr4Sed7zyOFfJATgKI79PGyfz+rvu4jJPfnLxThYASo0hnPOyC9xdcj2xuKtfJ3BjhkwlGeC2N
	UyvsSE5ftj2c8w5uDAgYkN4jPLZNSQwB27v2KZaQdM6dIuvHOSDNHoxM5UkWy5GZev6etOifwN1
	QOE6S+tKf
X-Google-Smtp-Source: AGHT+IEyGytC6ByHAqPIL77ZLuROTP9172Jieq9FoYKQp1qpUOIvIx5sKZs7SgqZoeR91IASoQ7Bwg==
X-Received: by 2002:a05:6512:3c82:b0:54a:f7a7:6800 with SMTP id 2adb3069b0e04-54c23375434mr2712282e87.41.1744001496080;
        Sun, 06 Apr 2025 21:51:36 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65db99sm1130728e87.207.2025.04.06.21.51.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 21:51:35 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so4942020e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtaWG78T7B6I04zk1/KzfBtK0uGfDET4qsACbvPqbMmY6ZSX6QNeMObGV99HC5u/5Apwcj9byAaug+p72tTjic@lists.infradead.org
X-Received: by 2002:a05:6512:23a9:b0:545:2a7f:8f79 with SMTP id
 2adb3069b0e04-54c232de7c0mr3438632e87.16.1744001494072; Sun, 06 Apr 2025
 21:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250325092640.996802-1-nichen@iscas.ac.cn>
In-Reply-To: <20250325092640.996802-1-nichen@iscas.ac.cn>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Apr 2025 12:51:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v66jSyedrAAn+7X0TG4PGvK0M8m3WSF5Rt2483x02R0r2w@mail.gmail.com>
X-Gm-Features: ATxdqUEZG7Odd0SifC_ricgYeL5KuO6wOUwtgabtbNsFOdLz6S_zfFbrTXMlBZE
Message-ID: <CAGb2v66jSyedrAAn+7X0TG4PGvK0M8m3WSF5Rt2483x02R0r2w@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: sun8i-codec: Remove unnecessary NULL check
 before clk_prepare_enable/clk_disable_unprepare
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	jernej.skrabec@gmail.com, samuel@sholland.org, ckeepax@opensource.cirrus.com, 
	u.kleine-koenig@baylibre.com, megi@xff.cz, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_215144_066090_82ECBAA4 
X-CRM114-Status: UNSURE (   8.02  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 25, 2025 at 5:28=E2=80=AFPM Chen Ni <nichen@iscas.ac.cn> wrote:
>
> clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter.Remove unneeded NULL check for clk here.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

