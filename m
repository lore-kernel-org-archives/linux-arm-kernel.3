Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02669CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 04:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VA9Uj7x6YGsbqAp1uyJCms8Kk+z1fYnFr3KjaEsulGc=; b=I3JK4DgBYPKowdrI8KJPxz3mop
	T4Nm4sJgffav0VEhh18LylazSRbe6foMceOjxGMSuGzTcDp94Tw6TqCwp+G5lZxAb7+fVCRBBAzXd
	mp7gSmB4u2Po7M7MT+KwBpQA1Quap/Hurztt+dbUT6uSSz+tft3L285pDvDfEiO9EX6MNjbJuvz+P
	uQMN+vdKVMSHpo7WcvEhoxvLBm9TMnyWS+pQ0QcHsGFbAQOeN8lhUyu29xEJsk6wMLA5msN1voXT1
	NkP8AcwQthiaa2sZXX3KF/eUutcNVmghU/1r/R2MH2rTT9kg2Dze2z93Ogf4XyZVLbt8MbfqtMACp
	DQjTQ3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtd1-0000000ALvK-267A;
	Fri, 12 Jun 2026 04:36:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtcz-0000000ALut-0qfl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 04:36:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so5921955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 21:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781238979; x=1781843779; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VA9Uj7x6YGsbqAp1uyJCms8Kk+z1fYnFr3KjaEsulGc=;
        b=tVUMvlCofRBDLkFMdJmVFy5Ig9ZzA4UQ/xXLMmlBNSouDUfNskL5OGP64F4ZtYuyCv
         ba4bRGRKr404DAeyd7Q+yUyQc3H69dtDS3VMFSps6FpXFPd2KAsj7CY3wrBHyoEiu2Lm
         gmXWHFaCN3MLvJrfqt/ON7JQ3VITtDsdTNpPBHWvyhysq9Ycuwv3+zVG0oeIILZpZkM4
         k20wsujk59HV2FcaPgLRkWn2i45lzAZ+8gHxvGeh1VgV5czs2m1zfkbZCskZGeG0QI/v
         qeFNmlkd7Wj5kEJs70U8sm3pySb+rQyb58VeBc63W4s0FCZDYmuhi+kmhccOceugvVVr
         FlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781238979; x=1781843779;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VA9Uj7x6YGsbqAp1uyJCms8Kk+z1fYnFr3KjaEsulGc=;
        b=K1m2Jcnu75ae7NlDQCm3KnzeXiNzsE7X5ZcUrEFZLocLWg1WSoizpDyq3OpGdqMkKJ
         KgD/j3rU2HRd1wI+hEL2PZ3+5ZVhifkkMRLwYw5o3sSXvltuekozEyYm05uo2f2op9QW
         fXSAy6WW93LXVlXgTG5UAyCLWhO+QMrTb63DeXWmYr1CEEuT/yswn19L7ZIFBpBuYReQ
         AIVhGna5gz6nhzyN0nEgWa+jr3Cz8Xg/dy+T0bqb4UMfm5FERCShp0c2j9HNIKo3piA5
         Ntb8nKziP4PDzUTUGesIc6xH9CARyCIn5n9F+Xxig/ttQdFUr/wRX7unuuP10YPLjkyO
         GCCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zHPpx7joTGjWAJuB7q36ti+5xAcNv2/qwSrYD/f0xqgXnR9tRACMV9XhdwT3qhrdPYGdkp1XL5I/FeqChG77t@lists.infradead.org
X-Gm-Message-State: AOJu0YxXfid3OBhOg44adgrgr6NeTctmwiKtu4QGoW4DDkpOyn460rst
	g/EtjUkkk7CJnScZj3Mb6Y4WyuiMJLUBoBdYyvXK+WyQiAauONv+K0p1eG3vMgu7q1Q=
X-Gm-Gg: Acq92OHbvuFWxz/rQNBU6lY6cfigkJF4NYAzDRdoB6NKTtHpFPTjVE155pL6yl58XIs
	VQnnzcYl73y/UPVHOf5o5HmyZpPvKzJrq5bn0s0GyOTzY+1jkaeK/159jV9XVAV2Gl4i52OjsBE
	jFOPYNUiOK8GQWwM177TnwmMJrZ9kXkVRomKBcrdCGcTNQgdzcc1WQ0yPeCQI9d+VQPtd4yF/dR
	jXXNoYf4LzmLme/L1VZMFgyHTYNEyz6DxdIR5seinq5quS+6wl3QXqBEfV/keF1mtJjpa6KgE7F
	GlGvjHyY3JwUOf1qqTrunAI6ZKnC8gcwmKp+NU9u82SY5qBTjadHCcLtkUt9qQG7gcLHVHhof80
	0wZ0sYesKjagRraSk7KxLLvEYHcj95KQyKb7dFNdNdLrnyuw5W6pA52m6kSH96XaJM+kRQfVTru
	2HN5ECpFFlAgNTBLnPUaXL6mQZAmFYIjPFMQ6jZ+faA5iVLcpwH8zM/G0/p9K8hJqL35DCBOrr3
	8jWnLBcnlYhyQ==
X-Received: by 2002:a05:6000:1847:b0:45e:ec18:f207 with SMTP id ffacd0b85a97d-4606db9a69bmr1554180f8f.25.1781238979313;
        Thu, 11 Jun 2026 21:36:19 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263945sm2067973f8f.8.2026.06.11.21.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 21:36:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 05:36:18 +0100
Message-Id: <DJ6SIPW6W26P.1UHJZ5UZQ5ZND@linaro.org>
Subject: Re: [PATCH 0/2] ACPM cpufreq with fast_switch support, fast path
 xfer in ACPM
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh
 Kumar" <viresh.kumar@linaro.org>
Cc: "Sudeep Holla" <sudeep.holla@kernel.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
 <kernel-team@android.com>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260612-acpm-fast-xfer-v1-0-1aa6cd2268ba@linaro.org>
In-Reply-To: <20260612-acpm-fast-xfer-v1-0-1aa6cd2268ba@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_213621_245755_3E8A561B 
X-CRM114-Status: UNSURE (   6.16  )
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

On Fri Jun 12, 2026 at 5:34 AM BST, Alexey Klimov wrote:
> The series implements acpm_do_xfer_fast() that does as little
> as possible to make it usabe in atomic context to eventually

Sorry, I forgot to add RFC tags. This is RFC/work-in-progress
series.

Thanks,
Alexey


