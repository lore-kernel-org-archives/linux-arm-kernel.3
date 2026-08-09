Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0EEC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2Ph1N2YXDcF/EsJKreKtP+YQA5yS18iu0pKlYJPT7E=; b=rvsKmoDly369UfuwWRwVa0sJMq
	QurJEuHX6Ci1eya8pykamrvUABNcucWMfbOBmdO3LGbWTiGZXpQjmenXDioImOrBpKhGFmz2vgbq0
	WTsRnbXZuz5PweBOv/nkuQRa9vwDm1UX7No4zMKWhGc/GWaRN8MytLFQflAxrTo/r8q5AtLHvmkXB
	kUElv2npYI0hWpWxiYEaYdDwEW9j0GLC6iI0qaUl6Sy5lRGOel/uSnYaLUNlNcEmtb8ndJD/a9J/h
	aifHOZCpk+I/3qwm2xXbxLRV9V5alAGK4zu+LF0E6X/ntxMK1Eh5Z/PyXbpecRBfHqnHGBbViWThm
	wHFa3QWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt533-0000000AQ3n-2JhW;
	Sun, 09 Aug 2026 15:02:49 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt531-0000000AQ32-098e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 15:02:48 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38e7109321dso568916a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 08:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287766; x=1786892566; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2Ph1N2YXDcF/EsJKreKtP+YQA5yS18iu0pKlYJPT7E=;
        b=UqrKWrNSTCx5h/QsnmeEZoinFqKt7lGlrb2wGLYMW2IV76/mdxlVUnk0+jbrh93SON
         UjVuRX39wHwKtqkxyL7C23WAEQYvmejzkQ6QFCW8CBh9DzzUp/AG04hszJX5RNpTaGUv
         XePuiPUqduylky3rO5tO7Dfxu/RklhsU7nPRpPaNAT3wl15ckkahIatgl4FHxdFU5fg8
         GD6jQwbsieTqlRw7AHJ6fTZ7WYvLnk6U0nbEeBFAh65GHkLDQx13dW+wZVLblLxkvL+t
         f1wbucCroOh4VCQ7ih0trP4sSHjYb84/sbw2IGMYkx+TtpCevC2aq3SsimHCi3rWJ9hf
         mmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287766; x=1786892566;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2Ph1N2YXDcF/EsJKreKtP+YQA5yS18iu0pKlYJPT7E=;
        b=rY5jHsA2k4ksslB8pS0YqoV2DB9xrz5AOG80L/SNvQv5yMoG8SnhGPoJAbq504P477
         1o1ycPL285i5XnoUU26b9SSLfiCBYNk5OP6AdEtRqti6y7l4nQ7OK4EMu8lE5MsFz2QM
         I4LXCPUFEkepik6l4Twz4GVQ1pL0r1ybcbRK5+IKm+T0gBsXLcwzS2OkHGctBUQwouuN
         zAPE8kLDZH8T0M4yJe+j+UHk43S+fxWFq/BOqPQmTXTYPI5/aGs/Uvg84ykB9rYQfbrI
         tkVl/K4tbL5nkv4CUAmd2B43oSkM+XfeHSCvQshf/rtGe6X9Ik0zGdHBePxx4BmaXwZK
         SScg==
X-Forwarded-Encrypted: i=1; AHgh+RpBqzr8kqHm26Wp7z5hHMqB3EPIob19xe/jMYwwri0Z4l7RAgxD/Zvb6frTOGfGFrGi16RQprsbidFM1sxXQTy0@lists.infradead.org
X-Gm-Message-State: AOJu0YzgcT5Q8w5XUIKghkl1TO/ZAnY/9/C/70ync07P3yV6BqmYgTl1
	jEfWPFGCyb6+YYjJZWRwRxpjCLf2lEwtWepLE3oGnFNEOsGXVp1Xx0bu8TDCXg==
X-Gm-Gg: AR+sD12hvjIk6kpCFKv5uBB7PRmDhA5GeStpKtqb0Ady/bUia3bh6bFecDTvyJpnCUO
	zGlTGjlJtaWXzOCpSe6hJS+obWgYT2f497rhnkHPDc5b7/uD7DB5Ts0XheALYyRo6fwj0pbHkoo
	CsxWrF2lbc5nd//8eIqIgSAAuB5B55dcjZ+Vo4wrMpHuAX+olcu3sen2N/f/gjJvMb/qYifgnZD
	gEEarjDXCnl1F//wMpp2ncD0TQiZno0U1xMrtvecwVvxWWDZBf47fz/DqmSA4eEio0wO7bsj5DD
	u4HaD06XMLlHIQCHWyXzyhM+MGMrxJI6hwec9hLVTj9YDl8nGqBwNtnnt4W6cysJ1SvxitZUWL3
	XgSiSv2ojRtmKsushsXivFjNP326EYzRcT6O+omShh1U2Vykjw4tSAhe8aZalZUuS4BsT+Y1HZW
	DC+QQPAIA7qzcGJPBUq+CaRntHMIpfPsA+kIDXF/Q8ehZQMc7+sqyFntrfDA06h0nGUaxBhW/bl
	2mJ+chEnLGZ
X-Received: by 2002:a17:90b:258f:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39282247ee9mr14215543a91.5.1786287766154;
        Sun, 09 Aug 2026 08:02:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b41d9sm25594852c88.5.2026.08.09.08.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:02:45 -0700 (PDT)
Date: Sun, 9 Aug 2026 08:02:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] watchdog: mediatek: Propagate errors from optional
 IRQ lookup
Message-ID: <4a875307-19ea-486c-923d-78a362651f60@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-2-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807081652.38692-2-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_080247_077731_B71136BE 
X-CRM114-Status: GOOD (  11.20  )
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

On Fri, Aug 07, 2026 at 03:16:50PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Instead of only checking for -EPROBE_DEFER, propagate all error codes
> returned by platform_get_irq_optional() other than -ENXIO, so that
> failures are properly reported to the caller.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied.

Thanks,
Guenter

