Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76F2D12D71
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 05:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAWcQ5veHhNVgjM+Swr4gUazUOqqofF4VZks+AvSvMY=; b=IFjbfSzP7ptboSF7StRFhFLpcJ
	ggnmWPnK6A1nT+EFaTjZRdjU+zK/qCrRcISsl82lCSSOQ2R/UzD6wQIKgygq8r/S9dFo8Z9ZruWWR
	8ipBsY0rPoiRzQSwkmpDxo4rJJsSkZ0WPmcdSx7G48CxVzxq72CsCPrN3QpTgjWjyDw4DBdtBkUQY
	5eHMo5QFWvGDJukyZ/FX9DzpkcmeAu0QDdR7SSrmsMAat03uPzrcYgVhKNJSM0ueY2AzRzeBDUDNn
	/slJdRQj+LgDQSbwyWEA+qKaVmMUVF/fEiAjFCBFVHIrLE94UKdN5Dh7pE1uxFy6hNy8rnS+/eAni
	prQi0SWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tANQ2-0000000GQdz-04YG;
	Mon, 11 Nov 2024 05:56:58 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tANOG-0000000GQUP-2KBi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 05:55:09 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-72061bfec2dso3812791b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 21:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731304507; x=1731909307; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nAWcQ5veHhNVgjM+Swr4gUazUOqqofF4VZks+AvSvMY=;
        b=IugAyuGIIYqG6TzPCzRTvvtxYUWgAX6IC1x5rrM8HELjL28tZQ7pAaVXy/1/it6iZq
         dJw2yyu60VTptt2u+KnoumYErdunPeg8ItGkttjylYyVirTs9/noy2CTS8+LbsqjqwXp
         DHJaVQk9FeWFmWHghYtMyZ6Quo6/q6hYJchnLbT+FTM6Lpcr/JTkXogLrFTTNxV2I0hk
         Q8PxIXgx9qY856YV1ldbSeplsX5V94OIitlN1c0QPWFT9s3LOKEkB2+N5uEAvzXg/J+k
         DTXhM42ddmIpA1o1+z3cUbnVIzBloaZXUOpbFfg1SXk4gKdwTj0bAWvJEEzPj3vqhWg8
         fzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731304507; x=1731909307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAWcQ5veHhNVgjM+Swr4gUazUOqqofF4VZks+AvSvMY=;
        b=L1z+z+k13liiHComyq3esVbj8jueVOi1muAAigIhh1yUkbQ1H2wdT3GpLzhouA/yg6
         1Hz9aKaDBoefxZIlxXuFajD/tTvvkV3m+M3G+fbvYkw2Ibz+xDuhLaxi63u8amobn9+k
         4OeVqMXUfTXNMhCNNW18W5jw5RXOeojGqggrn7gTA8lCYGPsDEG0sRnC2dsEttTBg300
         9ZS+7w436EkCG5SbCY3OHMzqalDqjYCj7bcFVni5TwOiGaTU7dh75eeTAgySK/Uzfww/
         rcEmAIDkEEYAjd60hh9U0LVBv8rto0FXqC0+VtxFsFuM6ovF1xZ6yEVUuqjeONtACQeW
         gV6w==
X-Forwarded-Encrypted: i=1; AJvYcCVLAs8o4FG68xBeyRJWzjns6Tq5aqRbNgZHBP+/mMenFBRQlnOtLZizYh7FUa0uZDqmtHENWbxI+EwvVKAy4wax@lists.infradead.org
X-Gm-Message-State: AOJu0YzfLxKkbfoTLxOQ4hHINLqz6b9EFTU/Ej1wCX2820DnM074Av5h
	NwZgpoootDgeVcV5chnUjIC0u9TDCaowY1GZEiNCFnch8aV61U0/XOFGIt7bv6I=
X-Google-Smtp-Source: AGHT+IHtqVtA35vMC4e1EnNTvwTwqSJFlJzhlZOFgx3RSPLljVG5nE5Fqy9JY0g2bqUZOQmsSp1QUQ==
X-Received: by 2002:a05:6a00:198a:b0:71e:415:c4c6 with SMTP id d2e1a72fcca58-724133d215amr13597006b3a.26.1731304507363;
        Sun, 10 Nov 2024 21:55:07 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079a3d5bsm8443325b3a.106.2024.11.10.21.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 21:55:06 -0800 (PST)
Date: Mon, 11 Nov 2024 11:25:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 12/13] cpufreq: sun50i: add a100 cpufreq support
Message-ID: <20241111055504.2f3szrd5ahudvtqm@vireshk-i7>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-13-masterr3c0rd@epochal.quest>
 <20241111041311.hleaz5fgipsyxigm@vireshk-i7>
 <CAGb2v646NHFAni=P+iC8OZsWMpg0PJc=kYbuWaY=C0-W-q6qAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v646NHFAni=P+iC8OZsWMpg0PJc=kYbuWaY=C0-W-q6qAw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_215508_635420_9E520C03 
X-CRM114-Status: GOOD (  15.59  )
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

On 11-11-24, 13:30, Chen-Yu Tsai wrote:
> On Mon, Nov 11, 2024 at 12:13 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 31-10-24, 04:02, Cody Eksal wrote:
> > > From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> > >
> > > Let's add cpufreq nvmem based for allwinner a100 soc. It's similar to h6,
> > > let us use efuse_xlate to extract the differentiated part.
> > >
> > > Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> > > [masterr3c0rd@epochal.quest: add A100 to opp_match_list]
> > > Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> > > ---
> > > Changes in V2:
> > >  - Add the A100 to the cpufreq-dt-platdev blacklist.
> >
> > Can this be applied to the cpufreq tree separately ?
> 
> Yes.
> 
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Applied. Thanks.

-- 
viresh

