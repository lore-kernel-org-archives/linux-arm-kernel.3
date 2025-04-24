Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604AFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkcCSbDN/ZU2oZjime5zidqS1XL1m5hB3C//OeBt6zc=; b=lcA9sH2C170PmZn/CiAa0eTbzu
	+/T260T0drj66xJPpauTpoJYdBXDvmOKJgzrFhmFmLkslQ9IpNBLg1jOB9cnJ4xnPxRv8jf9fibqL
	DIBSEVwtBOqREMd2Gn/wb5o/BjRHfRU2SZVn6/d+w7yIYrDGNz/WItT26gwJGftRS4YdiKirnIVqw
	9tycIxMw6CEh8j8XMeUnBuom1aSByS0JRBd4tDnNkQPtbtY8dBGq7AkRh3OnZWF4LusMoW0OldxIU
	xJlruC+jVC6UD1Wk6BweAjZA+GGucyA0tK12jaTR3xhr5b9c3+CHnVYQjEJbjQy8z+cefH015Mon1
	UO4x7dIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u807h-0000000ErAo-0PEi;
	Thu, 24 Apr 2025 17:12:29 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zxr-0000000Eq9b-2it6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 17:02:21 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso766986a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 10:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745514136; x=1746118936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkcCSbDN/ZU2oZjime5zidqS1XL1m5hB3C//OeBt6zc=;
        b=JJ9C+e9EXNdMFjDl0WqL032lhSYWgoC7r0rgM3gaPrlt0iemmQpV8uvH/LM1rrTF/7
         0nQLefInQsjOSnBBxYD45ePuFmTj57qrPzazMuxzBvWmq05t231iuaL+kfouywEF89XC
         hz+Co1D1R0OVd+qfRQavcvxsFWw1aI+WQHVoghFwK7ettLppK9bK9mqFMSuYrH26b/Bs
         eOwZ9HLlMksPn+oYXI3b6o0K+Bob9X7fevQHb6HJjEf0RXyaz3V2E6OjqKYxmMHy1y9W
         +PMKqwQD+d3DZDVR7AEYaYiL682LCBS1ywo0v1eCnXrKCWeONxzF+FAmCeIDe5ZgXb/V
         n6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745514136; x=1746118936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkcCSbDN/ZU2oZjime5zidqS1XL1m5hB3C//OeBt6zc=;
        b=G3YudpXQiOSPs64Mrae5+mzDen53W9F/Rlz87KY6rxxFFoihfEO4pB+WplNfVWERfu
         V7BaeJJl7kF5kMDYJS4vgwWxfkODhQd8YjlzMXVGnDd0vo1VwAeict3LyhPjagx0QIyT
         GOoRn1KLv1QZuRzOp16m9qg4wuUvx8ytwUQftVSjgmosTCS6pAqDRm8OkdzA+maSp29q
         jTAaJV3LVTVaWvKplOi0Cs7jznIAsNLsX3gjWDM+vpudmuxMI6pmr7SlsBr9DnZ50+/m
         F3KaquzoshpjyfbY0n91QRvVq+HK/v28rfyDuS7J/xqVozVohwI74Pq52gNS5SJ1YSCb
         XEvg==
X-Forwarded-Encrypted: i=1; AJvYcCV+IRhkpne9J6xVo+EZcvJW5pzMiq6Aj47oyCb5DlFA3jE+QssXKvSCyODwzV6NXSUNkyl445U+1eHhtQ979NX0@lists.infradead.org
X-Gm-Message-State: AOJu0YyfbeL6nsVF6mezci4AcczEVpCyNeoaOGgt1lte8Ut+VGDopMR7
	uaOAqs/9XJMKB9wDND9rFNBbUDx+DMwvBWnqSFXFleOP8s6U5GtulUvmLicthrOYYQL+YEJxH+e
	t2O2A1U2cZooBhYokTfE2x6jxxhE=
X-Gm-Gg: ASbGncsoRdY8eF9y8pw/+bgKr/5GfwF0TDBXkGF6svkrrmKXHssDaL+dFE5MWon0vzj
	cjQofWxeh8KYWwY4eMhviYLI6FfSUIDRvZXc10OZ82999LjnigQ7TLDSncAUdR+3+3Edq/VJHC0
	29LniHaXkw/MzMcaknAr6RbTuS
X-Google-Smtp-Source: AGHT+IEHxo13L0sXvAke4ty9b+v4Z7Y0lEATPj2aXj/69ooRG7KecObOYygckKmL5PhgxgGc7inKBrIS/BRos9kUdGc=
X-Received: by 2002:a17:906:6a1f:b0:ac4:76d:6d2c with SMTP id
 a640c23a62f3a-ace6b54761amr31197866b.40.1745514136147; Thu, 24 Apr 2025
 10:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250424151604.626758-1-olivier.moysan@foss.st.com>
In-Reply-To: <20250424151604.626758-1-olivier.moysan@foss.st.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Apr 2025 20:01:40 +0300
X-Gm-Features: ATxdqUEBDL7z20qNs0yG_M2X9nqYMo67214nlsnEXBB5e6fuFVOwBd_KZJdSur0
Message-ID: <CAHp75VfwiMAa+y+_sHpJ27D34=PtMG=nskXbV+GuNgWpH-85KQ@mail.gmail.com>
Subject: Re: [PATCH v5] iio: adc: stm32: add oversampling support
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_100219_684502_A3EB8F4F 
X-CRM114-Status: GOOD (  13.12  )
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

On Thu, Apr 24, 2025 at 6:22=E2=80=AFPM Olivier Moysan
<olivier.moysan@foss.st.com> wrote:
>
> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
>
> The current support of the oversampling feature aims at increasing the
> data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution, a right shift
> is applied to keep the initial resolution.
> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2^n ratio <=3D> n right shift)
>
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
>
> Oversampling can be configured using IIO ABI:
> - oversampling_ratio_available
> - oversampling_ratio

This version LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

