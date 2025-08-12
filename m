Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B9ECA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2sB+0qnCRMPqW1KShGcR8PsF4cV+J4Rx38KY04/XIE=; b=npwzWNvUcVWdUTqD15ROdblM9z
	jCHo/YOPkEI2/3o3GZGlV7ybbfxpo1FxwqRRS/FgfuSBhcUch/Z0nND9C/FZQbLASPVhLd9jkdcQ8
	7rtZyFgCnmGS72i84REyqA1v0IpegiD4YQzRvXw/JtNvkhVd+GWIMD/VA0neQqb9UyFFRGishbZOs
	K9LF20ArtiMApj8/nlA+MT2TJtHr8Yu/g8zqVLVJLECtQniOAQ7CrUDf6wv2bLC9GzxURfFISr80o
	5LuxcwY22qd+cGbCQ6OtG/MTNSfYYP5+bFZFRWbYndu0mrl1UyRQQVnWcOLIKFkRwZlUvibm5d68L
	ueagYulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrlU-0000000BMgt-1BF8;
	Tue, 12 Aug 2025 16:22:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnuF-0000000AfQl-305R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:15:08 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2402b5396cdso33427065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000907; x=1755605707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2sB+0qnCRMPqW1KShGcR8PsF4cV+J4Rx38KY04/XIE=;
        b=lha2hYhANOiP7TUOEwGi3siyHCezQeAvT4mfi5GLeeTZKu9mHleaQhFVlDHHlqpKxl
         zCBff2/0qJmr1110sy05V0XW9kGH/qQUQHRmqmF5/p+vYJlp9oAxAGAbrEN9/ST+KTSc
         nm0pLXvsUYEA4GNDU4zmMI20SBXPJaBHR+772AOLB5oC/sWWrenLEFwds3NrVwuTX9UB
         bypqXGdw+NkNMM3vqPM0ojHNwXjYriWJNVIPQkwk6j1MpgNs8HIz1lvFdBSZnXzy5Zcu
         Uk5zhTSZZ9P1lPR+m+tUlwMnWhwQvOu0FDrR0AS8GTudYi30PJoCXu4ZZIfni1tdsEKd
         K/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000907; x=1755605707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2sB+0qnCRMPqW1KShGcR8PsF4cV+J4Rx38KY04/XIE=;
        b=kVzPVN97Vy80Hc9U6xJy6P4Ei7IUGkCnCLziMFwbasnI+cgQc5ZbyhWDKKXD8ce8Dx
         a+FluXv4Lz2c118n04uZrEABYByIE+ivBYKVQio9KqgpMFLdWTqz/v481CH1AIR15viB
         GEDacVwHz/DqkPraa3zR/7rlOIyNZPG0daruhEtK70NSuGPaERrkL/VC7LAdwB90jZoP
         hLRNDNk23/Nr/0aJnlBrX9OM21UAjg1zc4O9LwD7kb2JrC63FA9OGl6QwiAM3zz7PR+0
         5tdviYSjQjrquvnlSPv85HbP3hMMTDE+MDz83fIqJXFCSaci46uEi+e7LKhKu2B8nqwi
         6oMw==
X-Forwarded-Encrypted: i=1; AJvYcCVxjUokU3lsirjlinohktSzIV1NX3gVbIySBiK05svyNDHeKb8aEqCnoOy3Ojp7z9+wPlKpUPhUmbmi5bK7vaRS@lists.infradead.org
X-Gm-Message-State: AOJu0YypCrcSWVAmx8xTJW19Hw0E76ay16BYBpCY8vbvRgQqKx6BeIbz
	eYGghphkK3Kh10ojfSjdoRLxhHsugX1De8VXzXX3gkW0ZUTeY+XK8HX9cNRBaHnNhgzGggcIwmY
	+wtFI/zF8ZDEmnKAFsHO96PTsoKutBfChTplPK49R7g==
X-Gm-Gg: ASbGncstPSJZ7Kw4ylD1lcnujkrNHAjK6ldDuCEhbrzcPFLenCmP4iDFQ4y4nEcVE6y
	7d6u76d+8RhjD/D6yPjVXUCE6dTuq0kRbRPwRdA2nt2OuoQW/icJW1tqXDFgwTs3qlKsL4qITh4
	eCWUk8CnD3TFKma+tUbGIUVL0Sf2ZECA3QzxNmXk5G6l3GWQ1kPHolOzjtx0qDekcMpggwfL/Yc
	rkX/23vPHQm0td4ibhH7e8jJcNHyCI8hGdB
X-Google-Smtp-Source: AGHT+IEzociZzudTWGhuGdHHssA6mcTMWmh60p7KNfXRPqNC0sHerO7a3+ET+ENTi1aHgD3VUTer3FIsMhpz3v4Tov8=
X-Received: by 2002:a17:903:2408:b0:234:914b:3841 with SMTP id
 d9443c01a7336-242fc340444mr49380405ad.39.1755000906805; Tue, 12 Aug 2025
 05:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:14:50 +0200
X-Gm-Features: Ac12FXxLWlDkhK2ok2zf7fTots4VGX5EbCJBNgP5nS_eF-e5_DRefiW9dEXgJdo
Message-ID: <CAMRc=Mfwz7yD0rUKw+n8eOczrg6E0n=bPJ+ng32D=r-rUgp4TQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051507_757233_5759B7E5 
X-CRM114-Status: GOOD (  12.09  )
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

On Tue, Aug 12, 2025 at 2:12=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> I hit a network error when sending for the first one, retrying now.
>
> This is the first round of GPIO driver conversions to using the
> modernized variant of the gpio-mmio API.
>
> While at it: sprinkle in some additional tweaks and refactoring.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

FYI: This is the correct thread for reviews, I was finally able to
send out the patches.

Bart

