Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3058BCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NX3XRbTWFhy8qHA+snouR7cCPmoi3TJ9WLm5fMQGIRs=; b=Se+w22oOxnsVDlCUAsg4BKPiXM
	lOlciaQ+/6ladlnH9wh9z4n/Khmxzt2nmEDh26v4wO7Cm34xkqeagjsRDsYvMr7SIkO2qrMjZHKRy
	YrDl8jjd1HVKP42aJIDgtYTgbUoIw/HyNzevOgbfPq2oKb7wvVvtc7hTpSSkP7VdreSXB/u0/76d6
	Pnpl0xc09UKnXvQ/ehBFDPiBH6UQYBP6wzpF/1rs6hMBGp4xo+1DHlhYdLlO11wH6kgZiki5kqn6c
	nQs0ZGzMeZGzrjmrBLNhBnTNjgXhyltKrTZR2fDc708TEDsMYuYh9tgQs7bj2b9sL37Ae5gHG1BlZ
	M1a5xueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMjJ-0000000Aey0-0l5x;
	Tue, 19 Aug 2025 13:50:25 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKMk-0000000AFmj-2SXy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:19:00 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-333f9145edaso38204601fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755602337; x=1756207137; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX3XRbTWFhy8qHA+snouR7cCPmoi3TJ9WLm5fMQGIRs=;
        b=kQulUvDo3oFf6XIAomdY+gTxp01to9t7/DnpzP/L+dsHYdjcjPbst4dCRIcQAlzCm3
         4aVKBkX+Qjh8GpZhkWPFh+utaV+R/iL1bwYerFqOsD4cGU2KIyWlAecgdJxkAaRX3q/R
         /eEhfuxcCMoqHOBrs//tHAMSSPGoxZq7owU9AuqxgJmpcoNFfHJddqyYkVz8CwVXiPn9
         wUeiOHYXeoorK2jkllzXLOMcARJqXNO4oPkqQI1FdxEUgGIr8Y9sX+TU/1R88EIgKXn0
         VX3fUPs1D90UdNlvnvluF4X9FaYMQCrccfTkG/4h6KvKPhV7gPPz6Pz1MI+JWpE91sxD
         kTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755602337; x=1756207137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NX3XRbTWFhy8qHA+snouR7cCPmoi3TJ9WLm5fMQGIRs=;
        b=Lj42lOnMsN7am2Zt5tAASQF2yNgtrpB/9yvQpkFhi8dF3eMxVNMoFhEZhrQBSgAonV
         9dBPF0IcMblMzSLPVA4GZyPjPSTjAsTLetVNtkPLQGqUR159aQ/8I+UVBYJfihzfRsVn
         Q4/wcUZDd+Ol+R1+wlLs5Vuq5vCf9w/ygvQZw0VKBZKaWOe4nMguWba6qsf1JK9zVbw0
         ShNmuCsRw5OApGKg7kjNxxxppsPY3HgGR5GiPIClMB9WUe0GDZrgaabLqW7IhYCO8obV
         qM7KJ8o4eNUnu+6as9J/JFdx8Nr8YpU9gHAU8XkNiGXxZZHJN6we+D8odGL7Z9e+xOFG
         IAAA==
X-Forwarded-Encrypted: i=1; AJvYcCUoOQJ/uxCSVDOUB4hTgwseb1CYkcVvgY5xZ/acGUhKvOYOOXUNooY0vQPTBiR+n4WeKBKeVpfRCmQ/mna4+PsS@lists.infradead.org
X-Gm-Message-State: AOJu0YzhkV3/mCg5Uw6uF9Aqvs+wy5a7C8nWOKTAvsPdT7LPwEpN5xz6
	O86CbmsSrZnPfbieHaMHXcDCTWCM5A/M37p7FbAC3oOMqjxI/zPG71IoRpfhvHK7OdV/LdX7rgw
	DWvbUfXo6zBlMHO3PGQp6ympTgsTGliwsFnW9WAsChA==
X-Gm-Gg: ASbGncvkg9bHwJ7dpwUBGrUPrU2mCjMru1qztLwihuEZj7rsfA2VgYvk69uITlCmzgx
	RxwrsLhrUxNuFO9pnt3xC9qTDVTlOeO3ExEmynrHyUfwbrq0vyRdZdF4ZpLykDW+GKbF3D7mBpV
	ccSEXNxzYLE+uOifZ9pJOqLQj7Y3JnIrkU/kAIPzwW2wQOnT8D3eHtyVSETrV2+xH+hEMw7+UZp
	R9nIyfUlL6n
X-Google-Smtp-Source: AGHT+IF5Rxp44h9YjTaSl1t6nVA/uVTlR8ilarZVRtlGRvVzFqaYBKn1JKCnP2fps/Zf7ov8QpfkeKC1NgQ3gPZd5qU=
X-Received: by 2002:a05:651c:215a:b0:333:7e57:67f0 with SMTP id
 38308e7fff4ca-335307c8f54mr4038981fa.28.1755602336799; Tue, 19 Aug 2025
 04:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 13:18:45 +0200
X-Gm-Features: Ac12FXxFYBBQyI_iKlXRT-qDi4lu6GUwcftI1vT80UrnP1NXIlX22xDpuKA6mi4
Message-ID: <CACRpkda3jHWF1ww0t-wLndck4UQryAUsEeQQsX=1Q3qa-VLTVg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_041858_634895_6D08AB45 
X-CRM114-Status: GOOD (  10.83  )
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

> I hit a network error when sending for the first one, retrying now.
>
> This is the first round of GPIO driver conversions to using the
> modernized variant of the gpio-mmio API.
>
> While at it: sprinkle in some additional tweaks and refactoring.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

