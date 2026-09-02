Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C289BC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 06:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lW19me2kn54UPGQZfTKDH2CoL8h6BT9VeZVPGdecB4g=; b=jCFrElL5YWIkGFCttiw1YPmfX9
	SvFMKD+rUBYn2weJaRhqnvQcXIHHzG8akvySASGLd79emivWpeuiqWEByvsWZVgdzF+ditajUJfNl
	C6uvPU/TgJxBqaj0nbDFRz8GNnpoSwakKUxhvwvoJTVdUaltOjLsEZ3I4I8pVl7YYove1fXP2zDfS
	ewxVQdm7+JgBOm/pWWtWAQhcTEVE88n9cj9PvUAqKYG5lkOO6dYfPZnwAI/HRIqvDpgPnx9arp0DJ
	FrCV4sTTfKQCr+iyyEj31Z6uSCfLtIyLtkHoqLdVT7D635BBO2HmBKQ6QLud+REnrragjFjbqksqD
	3bBQPJBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1epJ-0000000Dsx0-3l5w;
	Wed, 02 Sep 2026 06:52:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1epG-0000000DswL-2kSl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 06:52:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so7321835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 23:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331920; x=1788936720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lW19me2kn54UPGQZfTKDH2CoL8h6BT9VeZVPGdecB4g=;
        b=VnZrOVi17Xmg8OlpU3s5BCRuJ5MHeVMH3yNFxJSH+EfU76AHiR2+UGTID+br4iLKXi
         HcWG+ajxnGLGgOqvfd0li66YLyYvpqcVAiN/bab0lgq3pa/iq65NeVXDycpDQPuVhfRq
         dIJ7gHy74o0w4TEJUJNGRXDYZLSOgsasRwzIQy4c21kTffG9VGwq6cOx2/cCoqTd10v/
         qsuRAOsP0VF2vKhpjq56XXoKIVF0XOyz+DePpKX0ZwC5eUe5aUaQAHU0xtc31gHgfGqf
         amAa5gx62lFQ+ofnLN8PwTTa9yDn3m0Ws0mrZ6pVWF8u9FaquwWhNc6ACso+sRkH6B5j
         dPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331920; x=1788936720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lW19me2kn54UPGQZfTKDH2CoL8h6BT9VeZVPGdecB4g=;
        b=DjcTVk6hDCOwXEqzfkw1uHDLMjkkFriCgOGmwN/MYR02eoZocCyFlrB8ATV7b1la7i
         SddpMsqTrQiCgwGZ14otEJ5Dl2PZ6RzwnqYNHk5zcBSBlj91VqU6J4563xVJKH+0PoPj
         TOL9HR6tcP18MOG/vFpzMUn8l9qzqZ5DyxlG3b9zfeHCONZrdtGy4YGPaEuSJzH2NmLD
         Fc9Z2lHXMrEvIeSWE/zcKJ952kO7gomJ2omQJDR+L2Se9TwjXCDMkvN13zTsqZlYbmk4
         FBv4i7CiXyhFO71tpxYkwTrqavy8JE5kBmbtzsjVv9G5NEsMH3ifkPZlM4DcoASIvr3O
         LKgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLY0e5XdPiYfVAe+Ok0g3Ng7zEBa8WmfjKtjh3US7r9hfm5mH5CkGp1HZ9xeU7/aOa0XebeDf0auaABvcdEGbu@lists.infradead.org
X-Gm-Message-State: AFuF++lRv0dFQhLUDe1Cl0MKRXlXP7GSlHKZap3V1G8E6w15/FID7uBP
	5EMFL8oAm5UwWdcgAdooXaaJo/ZbbtwwU1bgWZlk9k7MDt+f/+VefLNe
X-Gm-Gg: AR+sD10gofrZzB1WWxe3TD+aEli0J+HY2LtnC83pWsJwLXLrLyMYfv5ha8aAk4Mlh6f
	Johi330QYe/MHFGkHd/95Pfy985r1rwfV112pzPAP0VrM8Tp+Pct40q3i9iw89LjnTgEEhbpm9E
	hmJ6kw7cyJ0syLicfE735MA78mKpHjI+aGy6AXgLD8DhlzPbz4nAV+em0RuIUguUq8xHYk63NjF
	Tbvev0NMX/E/7Y/n67GheRyaXVvH4vS8LZX1sAu5lEC3rebgxQg5XXMmT93o5iJAjwK9OHu1Dt/
	T1Z6MESsEyh2UIGpTNzn8qLWsKj7dyKoJqK190zEj5NtxMnfKg/BSGf6rBmlFSOOnRQDjFBL6lp
	oo/L5hYROFBAM4CmnLlqMPdbRdzbhGiFrE8oN6v5QQb/loGIZw3IpXuOz9Qo48hNdL3V2RgjEvL
	//NcZoYBS5ErK5XwJ7+T4R5lEqYCIKeRHKnn56xJCCUaXUH1qGBq7xGbwpVnFYHYIKFg==
X-Received: by 2002:a05:600c:a0b:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49ce5818612mr34637765e9.9.1788331920540;
        Tue, 01 Sep 2026 23:52:00 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm124677705e9.12.2026.09.01.23.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:51:59 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: sashiko-bot@kernel.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 08:51:57 +0200
Message-ID: <20260902065158.3617522-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902063739.A89F01F000E9@smtp.kernel.org>
References: <20260902063739.A89F01F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_235202_834743_2E65DAAE 
X-CRM114-Status: GOOD (  11.96  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Medium]
> Is it safe to extract a parameter from the incoming *config pointer?
>
> Looking at imx_pinconf_group_dbg_show() in the same file, config is passed
> to imx_pinconf_get() uninitialized:
[...]
> This appears to permanently trap all subsequent loop iterations into falsely
> triggering the generic decoding path instead of returning raw registers.

Correct, the group dump reuses an uninitialized config across the loop
and my decode turns that into a sticky misread. In v2 the debugfs dumps
will read the raw register through their own helper, so they never go
through pin_config_get() and never depend on *config coming in.

> [Severity: High]
> This is a pre-existing issue, but does this correctly handle generic queries
> on SoCs that lack the requested masks?

Also correct. Once the dumps no longer use pin_config_get(), nothing
needs the raw fallback there anymore, so v2 makes the callback answer
only the parameters the SoC declares and return -ENOTSUPP for anything
else, instead of handing raw register bits to a generic caller.

Thanks,
Mehmet

