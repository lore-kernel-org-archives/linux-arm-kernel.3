Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85200CCA474
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 06:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfCe8SmQAHAct7mpZyJeNqeq8O+Ruejbrp48T/gcUh4=; b=lPisj9UuVf0PDaSfsjS9y8zLQ3
	bEgFs/SArGK85IEdB4/x9EgbyyBaYmFZ2jSTdi+WQWxhQVeOE3WJFV/0dZlTZ2jnT/czD3nNPRfSd
	kpaW7Wzj30QE0HREC3ggqp/Ko6JhLx45mDXPrR4lamt+QVWZsun3ETZZO8nyCjzQFPFqgyRhyrEnN
	H2QJutMu2u8FcuZJnLuG7nr6PdUtX7nGTjrgfyGUXUNkTqkk+cJ91dhSEdjntN4/2c9YsAk4qgcBk
	3taQIFMPBaFH3swBHG24z4P7SjVZlkMO3OpERarrTWIncDGTLkfcqOWok+4CjLS88YAgVt39IninO
	ZzusYWIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3qmq-00000006qit-3RGU;
	Wed, 01 Oct 2025 06:58:04 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3qmo-00000006qiV-1rx5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 06:58:04 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-36bf096b092so95551301fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 23:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759301880; x=1759906680; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hfCe8SmQAHAct7mpZyJeNqeq8O+Ruejbrp48T/gcUh4=;
        b=GtwgRWZvHyOzUqXfqA0qEKeY80Y8ZNk/5B9USjeIDqXb9YYCvez5z3ovNwEbbKzr4m
         LP0BRp+2QIi8NAMyod+blLtuhnWTTAJm23pmsjCB/QXsFQbKpqrHi4wG6cGI1qhzWxwv
         fVXwLCsSNZ7oegXwhA0lzJbMHYKApsiHdXTYQiD6llAiz5hxhFeLyusTPyPEVGVc+hB/
         kQClLL0rs0YGMuaeREp5mfUoyEiezt6gKkuL50kZvkGXu91BofMdRHWztkVD3mFXyd0H
         Xu3GNeLYalGdaHDwr02qc8TIYTfifrkAeRVVehLPdxTZKQi+6oNaCe/LG5c2SWoAySq8
         xoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759301880; x=1759906680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfCe8SmQAHAct7mpZyJeNqeq8O+Ruejbrp48T/gcUh4=;
        b=a2G9TgqVFNl0re2sJirxK63NKOmaudYwgGr98OyWHJiUgu9zhLCBdpVBLd0Dfe3MPG
         fU5/o8kGD2W4JQEbF6HyuTOunsCF0wITr9XHYHhqKQ/MP5uQg5/wJU0LGWqxN03Vr3AE
         vaBEQn23Op7RaqMcypYYbAnzeGuT2gzh1WfgECbJpzIVDjB+u0vf9VZn40JBub+BZVwF
         Ms9lN6jfIaDcghux1Of966DhqczEw+w/Dhw5IJ0dSiAq7WwvA9Wir0gic5LPkXmzt2gF
         oFdeSG60D6ZFGb96lkOt3cFYAsD2JF5CvNVKLXRSfjz2LrDEQHiL+k/x2vSt76IB8tCu
         Uh/A==
X-Forwarded-Encrypted: i=1; AJvYcCWSiNqmuoliKkA+uDwPrSmwi1LGTtC0zU1O/I12vPrFJWYp4JFRcQ3v2/JAocqI8z+DTcTHpxhfFJrUXDgMsl+V@lists.infradead.org
X-Gm-Message-State: AOJu0YxgtntpiImNbx4gLrASH8/h+UccL5Y3ATPzqrqZAenONVxoJP/n
	MvxZFndwz8J5FdD+IOZ16AT5lqYABuui22x0XirLxA/tw4thOWaEOfnobnoVRVoqSi86qQhvMgo
	OFu+dRTzYGwiqoDYZfkTfws8x47bjJ1XMiquPG3n3qg==
X-Gm-Gg: ASbGnctlTWGCvU6AkV9F72CO2zV5lpy2STp8EOWk/5gtBg+M0H5lHOn3i6C0Ha1PxZc
	Zk9xWEVO+WYvcaCmGLANTa0hy2+4akofAoSvysG+ohciGWLz5bJbJW+nI8n7kecSkHHITdpIJQi
	C1v0/bwvdnXVcwTL9TnzkSRQhpMqB1YlJXab7nOniOZPwrG74xkCONLQt8kNubv581A/FMaz5KA
	cZbIoG4D5Bmgn8YPWIa2X6En3QOw8o=
X-Google-Smtp-Source: AGHT+IEFYBTk9nGSfmBNRwdlnBZfU/Sd6UTKJyGtF8VquxDEPDVY/XxX8lcgahg6Ei0VXCczWM+mbwbqwLB0jcHsDcE=
X-Received: by 2002:a2e:a548:0:b0:332:37d5:da95 with SMTP id
 38308e7fff4ca-373a7404f33mr8420991fa.33.1759301880298; Tue, 30 Sep 2025
 23:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250922200413.309707-1-shenwei.wang@nxp.com> <20250922200413.309707-4-shenwei.wang@nxp.com>
In-Reply-To: <20250922200413.309707-4-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 08:57:49 +0200
X-Gm-Features: AS18NWAuz5cqgLXrZSSINvwGEDmvTaVcLOQI-X1PgOUAiEVmWUpsc5bfCXSgBKo
Message-ID: <CACRpkdbB+DfhqUE-fsz_RQ1U02+nMEhNsXrKB4bd6dvLDLjWUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_235802_504465_4B198E9A 
X-CRM114-Status: GOOD (  10.64  )
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

Hi Shenwei,

thanks for your patch!

This patch was not sent to the linux-gpio@vger.kernel.org
mailing list, please include that or we can't merge the driver.

I think the OpenAMP project should show interest in this
patch series so I created an issue in their github:
https://github.com/OpenAMP/website/issues/122

After fixing the issues pointed out by Peng the driver
looks good to me.

Yours,
Linus Walleij

