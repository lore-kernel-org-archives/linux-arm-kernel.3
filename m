Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11944FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWeO98Nt9yPBFV9mUTW4xZfhM/Yh8rc/7tXj3PKgVVc=; b=0zMVzukGTHtbGtNkUBfJhgadSE
	6t4LkZT64nBTdl7GNvTHlar2anRR1cAKCJlMBlGLxACwLK45gpNU25/N17O5xEDmmY+8yY+nzv2pN
	y9AhyUx1vzeKJVVW+Uxf0yM7Hy4qwL7+PsSytHW3Qk9bPIvXYptkxoDayQJ9Y4q7Au4l7yCgzdoYQ
	f3FlYUimWYtZwRVsjCfiew6JNNFnKMAcfLLmRh9GvpZT9955DiIpMweQyLabzDAJGCv9LepUwCWrs
	/hl/MNu2obzm2arRXhgbbXMqRPVRgf+qEjIbCWji7Ui4cL32moEi2mBuan32domyJikAhENaVQWzB
	b/b8SQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIlI-0000000Ge82-1pP1;
	Mon, 27 Apr 2026 10:00:20 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIlF-0000000Ge68-47TD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:00:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-445795cf6f1so224093f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777284016; cv=none;
        d=google.com; s=arc-20240605;
        b=dg3Gjk+p64ZSzvd1OST02bPpRVgfkshwMSLf1TDgbxQLKZttTgYLhK1g8KCfpA80MF
         O+zuiM0nqq+tLTpo0fTAGMoQv6D3vfizFNwNRfkXRG4/fuhXaW1QmcNbYtH5f0sIAGRQ
         JD8wQNWBTHlC6sVAJ2n7v8O5IiyuEVj3NxI7xxxx+zjCpGP9m61emfJKI0GLr3rRcZQq
         extzQTqGpZKVGflMu8k6mckbcLQaMdaWWkUZ7c0Ch5mHYa/zqi7LLuaWxYgTe+GmxJCH
         mbgLDpUJs9X37eR6orU5yUREWhU3U9Fu2PEoDMLRFR4L/IpSAHkjzB7KglQCjFCi8Pk6
         KeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eWeO98Nt9yPBFV9mUTW4xZfhM/Yh8rc/7tXj3PKgVVc=;
        fh=HkV1RLoDLOMiemCRCues3y7ihLqgTjctj5uqnkB3B/c=;
        b=TBjVOqjo6LaKHnmtcuCkB4uXeHubI87ui95PG05phbHkcEb1/bRjg0Kd+DtlUzusYI
         h6bhOo8jHF8lbPwLOrOfcA6lfiMPmQvj0EDUGxarlGvC96Wk3s7dr0KKmqyJlh8x3GI2
         P0REf1ja5D4IRUYpCvegL6s0shaxp+YpkaEEd3GDJFfjB2xAWzfT8QnpTFdGoFBlNj3S
         9DO5d9lgpeCx9rPfMO7zQNZY8Mu0YFPOqsbMHvDujcK/KQAaWYyhF4BoN66aOH5pOVgF
         UnibxNiuZ4weDqBDQIyyS6JpWejmDr1AXlagoFoi2Axj3dwybfbh19Dq3pbe4BV8fUTp
         8mPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777284016; x=1777888816; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eWeO98Nt9yPBFV9mUTW4xZfhM/Yh8rc/7tXj3PKgVVc=;
        b=lynHnLMvk+R6gBrvMgK1X06V5ah7arxfvkKZ/ixwttl23THPviTzO943fTFE+kWF0t
         KphsRqZspdYyXeihn8Q6it1OTXuH5cx4LWxTmGSs4XPiuyTqVVlUlIVjtzxmdmmSJjHy
         zYb6bPnO0c2qFZHzgHBCaX32ftSN/kdAuLzWR1IlfrbHDXX+MI5BwE3OOHCtHXc6uONY
         BG2HRG7B+SzXCae9JhyxjHQK/oLP0VKCS+W7Q1hiXTwk0SHQQNqMlT5jIL5k1UyllrpB
         Q9/y33eYmYg4gDNQp6yU6CqaJw0PZo+9psRBxZC0d0izYItgGKqlwy5IQ//OMMaIOLl6
         dm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284016; x=1777888816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWeO98Nt9yPBFV9mUTW4xZfhM/Yh8rc/7tXj3PKgVVc=;
        b=WTgU7xbmmpgbHWICDL2t9smobMIX7Lg6UVyJhnYXZyxmmMFJ4SASSynNsEFVMPfZdC
         jVA/85GQq4xZCnkFqu2NKW9fhlKDULKE4RMVATvUrAlRjy/5THhSq0O0LrmFwWfUnRn+
         /vCwmPFkqIphIPn3vrKHvmslfonhnECkJwIqDALcSHCxN3qYsl+lZnV2qNnadO84bQ4f
         a+05Rh7KCHajlJ3ZkvDy6dV2Ms46R5oM2qaAMabO6m0goT3jVyqiYgLS/P+KisL/oK2C
         1PMd22jElB3+bKUdkNr2zJ14RudWpphrzhBEJt8oalAH5glZi0uvRNGzrevVPJBZeq1F
         qBPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sZ2YK/7E9M54ykjDbM6hHW5qkPVbgq7p9kWjSlbSkqTtNvA9Oe/OcqkHr66wmLR9c67Z16y677dlFn4lmnaRf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Zgu/Q9+fmdKqG6u5XTGUIouV/MTHveoF4VIT/+dJDeVKHBb0
	qRQRuQ1nWbQLY1uQqsd5dJUoINyZYLC9cr1FD1+hgcjQwFw9birBCz1XnZfvsTuFpZ71rpwAjsw
	l0yDJwn08G5iVNtujEo2Lu7k+lxcRjNE=
X-Gm-Gg: AeBDievz5iiw6lasxYjpojZ7EvkuJaiModjzjoJFARN1/uxNPKZzKK+/9KqFwzAGMH5
	svhg1LzzqwuGXcYf5WZ/MkE4ZjwvXixhpFLUfKV7nmquD39A3WSjv35XXTEqgNp7wZ6I6AQGq3R
	1IQg9x+eNPG/WWmgILNGoAg1J+Y/WXICsr4VaaexJ5myWA6V+uR9NrdxttTrG48p9H1Q9ncaskg
	4Hltty6SkeL7xKMg6UHHSytxhtFQXHCeFWML1hGQyijRALZ6xuMJbXj8dBoIAfF2CTImzU3bW36
	UNwBNsq7cjl1pkVzmLQAlqxUbCL6oqPZee/78nasmI9o6XZddnTS8xOXOiQATEz/JyNzyUl+6Ym
	+HMGY5QIvPXO+/BhIMw4GYGrYvtHsbz67waAakLRDmRzeWlbXwVXA8lupTLn9mW3QMXn2Q76xAd
	iAbL0z1Kr0IDcXvOi6
X-Received: by 2002:a5d:588f:0:b0:43d:1c7a:8b5b with SMTP id
 ffacd0b85a97d-43fe3e11665mr63059205f8f.40.1777284014766; Mon, 27 Apr 2026
 03:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260426211834.3318306-1-caiomorais@usp.br> <20260426211834.3318306-2-caiomorais@usp.br>
 <CALoEA-zz-2cG7SJr1iKNQ0H81TVMXLQh3omkxJc9YRW673Kqqw@mail.gmail.com> <ae8xeI8VVUWn6OqQ@ashevche-desk.local>
In-Reply-To: <ae8xeI8VVUWn6OqQ@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 27 Apr 2026 12:00:02 +0200
X-Gm-Features: AVHnY4JjJ-1A0lty0OYBjPLv7IfMOB6XONqilcNpgy-xtOBrXG3SycZpHUetd8M
Message-ID: <CALoEA-zgYuPM667fm4XPcxqbsXkQ8G5t09aj=ZHmsx89UFYKSw@mail.gmail.com>
Subject: Re: [PATCH 1/3] iio: adc: xilinx-xadc: remove unnecessary includes
 and add missing ones
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Caio Morais <caiomorais@usp.br>, andy@kernel.org, dlechner@baylibre.com, 
	jic23@kernel.org, michal.simek@amd.com, nuno.sa@analog.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_030018_113786_7B610E90 
X-CRM114-Status: UNSURE (   9.54  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2026 at 11:50, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> Dunno if it's your first review (congrats in that case!), but I fully agree with.

Yes, this is my first review :)

> We do not accept patches with the empty commit message bodies.
> (*Yes, it used to be okay twenty ears ago, but now.)

I maybe also take issue with the fact that the series (although they are
the same logical change) is composed of changes in different iio
subsystems (adc, buffer and common). Shouldn't these be sent
separately?

-- 
Kind regards

CJD

