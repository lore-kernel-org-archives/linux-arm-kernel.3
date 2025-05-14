Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DA6C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eedV/wY12viBVchiRE/OIP5PIpgQSrislkOLpr9Sh3A=; b=PHpSGRNtFwxXkaKbhQ+f7cXvME
	SGf84LpC4lS+8vrR2TvfAOlyNRHPGzGlu2jl/FbPQMmZh4Z+03J+6po6DPtjE981v4YTlTusJdjqU
	5rCofZlCl01KHdRaa/M4EA5z8EsotdXg8YKaQEt4vIZZLztdnvibH7VtEos8o6YUsz4p/xOT+cGtA
	+R54Lf26A/Lje8qpVElXuEaI31+UwXIQnQwdJBx9UTQTa1sAO8VvJsONQnbv12YHJaA1nbU4RdrWk
	sS1nbLI38xXJJWeb1pr6rgZjbffY6y4bpQPJyl6Vqo6LKJldnYWB7l2chb+yzHnh7qKp7h69aIbC5
	Ub0khKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF81I-0000000EbPt-1svC;
	Wed, 14 May 2025 09:03:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Pv-0000000EUZt-0DYC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:24:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so1935115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 01:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747211081; x=1747815881; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eedV/wY12viBVchiRE/OIP5PIpgQSrislkOLpr9Sh3A=;
        b=RJ83KfYI0Sty5Gi/rrPwkbSO2PtAhYmkPVjEmIZ/KT1msXNNpXHQXISDFW+RXSuogT
         9FQWvP5EtR64+9vbs2yUnR63ICp/GI4sIeRULJ81EsSz9VCQaWd6XoZsqYg+NTETteTT
         7UyMTJT2lu3Yt/3KCHvHE3XwMf+RQxMksjyikjUi/VnjKj8aRo6MtEQDMUd5KtLGBDUF
         H4u7xOYAsW9FrDSwee0Tr7LT/OSsmF6nJyN0NNgvcxmMWyFtIZH+9gGB45HFh8fAJn+B
         n8pQy23di55X7wWpW2p+Zcm1Fw+J8ghcYDUZvHJDV/C09C6cAy07cu0qYNDipDt0uB7O
         Di6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211081; x=1747815881;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eedV/wY12viBVchiRE/OIP5PIpgQSrislkOLpr9Sh3A=;
        b=kOV10EcfkUyLqoK565wJ/a40L1FUqwEi+Yosab9Yobc8MFdYR9mmM5TY4HTwL6dwNC
         a7Hf5JbZdCSZBVFbEb60zzRK/5RO9z8Q4PHNUqbCtOhiRh+Iqk3SXnQTXfyyyu5w8gMe
         2MtJJpibXYqoIgxR68TgER6fLS8odnuurUc+Ob1ABcN/WP3TXjpWZgBWFoo1c86Z6sFV
         F3uo/YbWBKjT44Yh6+wPsEBEPYpR7urSB5gCbAUuIS/1hRHBs0pbToMVAxqt5+I+BDVh
         cR6ZXYl78iU7lB1Xs3GiezadekLzQePcnlEVJgDHOZtUsGSJaLInIp1AmONFAvgrPEme
         9Sog==
X-Forwarded-Encrypted: i=1; AJvYcCV7s5sCKiaRlM1Y2AQ+CuXHNsKyTQuEhCHBNhmpe34sd04Kk7MCJVg75o3imndNQtxcBkv071EthB37MRXXnH7B@lists.infradead.org
X-Gm-Message-State: AOJu0Ywisn4CDxaffEPMowLoKSlIVxzhTGfoPtRysgIDe3MxKALp6DPL
	YqFSH5gXrGXoBkRaDf6pGZPhc/C5t98UpqHd+alyMlDyTARU4wpfFw++zUime54=
X-Gm-Gg: ASbGnct+GQX49URh1cCT+v7GCxkyp/M599I54frqNpd1VfC4ZwPnWj4HmUk73y0z0qD
	yUgP98WmMnq1KbCLqYjCGRoQOWSGWBUK4ueetOsHvdWtp4G2WAgjK3hi2DKefKjB5/nhnRJ66hr
	ybqLcHWjuE7eh4n2wI13eCe/+6DY6cQ7c/7/fS6pbzjh8XM/OfB8Gr9TIiQl5dMMkmc9RGSKjeJ
	SJPnDPDfCDcwjRavTKoISYc4NQ3JYjhxhLlVrnBXkHBR8Ip5e3zZhehBe02hbdkGX0zstxexyFO
	FY08DGIMPFzChcYCHtH6EUnrZgqOHD00bDBipLgrZtSGTnkKFLs=
X-Google-Smtp-Source: AGHT+IH73owM6GDBNU0m8kLkod6KCAbzZS7b+xGxT9afNmDlYsKih/kTTaAbX9E4I3SRCyiriIu7PA==
X-Received: by 2002:a05:6000:4007:b0:3a0:a238:a59a with SMTP id ffacd0b85a97d-3a349694e6emr1950397f8f.3.1747211081471;
        Wed, 14 May 2025 01:24:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3b94:a3ea:946a:aa90])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f58f2a79sm18566020f8f.48.2025.05.14.01.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:24:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org
Subject: Re: Devices not instantiating on Alta
In-Reply-To: <aCRQqRucgWMOjUPj@finisterre.sirena.org.uk> (Mark Brown's message
	of "Wed, 14 May 2025 10:13:29 +0200")
References: <aCRQqRucgWMOjUPj@finisterre.sirena.org.uk>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 14 May 2025 10:24:40 +0200
Message-ID: <1jikm3y4zb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012443_082422_7E88E8B1 
X-CRM114-Status: GOOD (  14.47  )
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

On Wed 14 May 2025 at 10:13, Mark Brown <broonie@kernel.org> wrote:

> Hi,
>
> For the past few days in -next I've been seeing the reset controller and
> audio subsystem failing to probe on Alta, I *think* the audio is a knock
> on effect of the reset controller.  I didn't spot a smoking gun in the
> log:
>
>      https://lava.sirena.org.uk/scheduler/job/1388164#L4875

Hey Mark,

Maybe I missed it but where can I get the -next sha1 used and associated
config used for this test ? I'd like to give it a try.


>
> and unfortunately I didn't manage to get a pluasible bisect for the
> issue (trying again at the minute).
>
> Thanks,
> Mark

-- 
Jerome

