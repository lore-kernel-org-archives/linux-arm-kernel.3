Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87DEC5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 11:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=; b=UgL9jj2fk+L4/05DzOCbYh7mUp
	moJ5kWbZ/seeUHDWBwQQd80NyBC6NwAeecUPa1ljW0/W7l2XhC8sfF5CGyWiGa/fuKACxHjAzAlrv
	e5MCYyNuZjN8mcauGEtW0uT0H/sGwlm8BA1eejqM0ppj+Qu3uMto6SFg5e5bqULD/ZSUvww8MxB38
	xQqt2ry7UrPp8WuT+TOMjR2YIMcToie+TJmeJwSW2g7ecVc85Ep8HSDLVTE2nazD5XYYCIGTJku2h
	a9wAXpHFYz76XpKvvUs5CI51JgHxknkMHYgbLc4UfduUqqeASfG042h7Yrj1EtPyIUl4Byp1bBGEW
	kClNorYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuq4n-00000002aYb-2P2Y;
	Fri, 14 Aug 2026 11:27:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuq4k-00000002aXm-3hur
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 11:27:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso4287695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 04:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786706868; x=1787311668; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
        b=nmQPtw9+O6Cudrpi1VbhjWgle8ogkXx5EDZd7oP9cFQD6w6cW0VJ04AIt8II6Z2+er
         JWFz0N4xpEfOpBMX92TEzt17+5GUtO0sJgg2Bbw0AUFZv7ajsQpc01PeGZBzHSEILAmh
         rwwRrnF+KmOept90DgMToo7774PRDeptZWwBpZqs+zdl4o8I5LxOwQa9xaxdW2+NtI2J
         UNtcZpzsg9zTMVk6vXfU5KgKp5l99uSQQn6EzBaF+pG9VUt0ID4pQgGRCB00pJ9T1J4V
         WOX1tfNpXfzKN3NttStBIK6Un5nvDDNOYRRajd5kcl7IPL7AZaekOR64AS3rRHEJMu9/
         inOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786706868; x=1787311668;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
        b=NvyBpVtBxJimpbIZsxKxUrhqc3qk6AbhDtUYvUzVgEu30z0vobYhwdvoEc02gg3IcY
         HnONly0WiW291q4BzTxctWwyIHgNnqnIu8A539/FrdMQuxgqifOMi8eGB0Um6gNhOzBR
         im86bZMB2iO7fzOGZGvHDDECNPhpr8vhnToItyBnbPOUzRR8ybhwWJ0LtOv91V7yhtpU
         6Ua5GVV8mRdLyidZNmCK+Z3/jPicbhi7sucQp8ZYqhI9A2ASOn3Sm8KwEAgEXR1bagBZ
         zLsQpzyW6pYCItfyWDYiABFy3CV0ldygjbpo8gyPSRqxIOWPjg/3PXwQuc7sy3xYZTdB
         H5qA==
X-Forwarded-Encrypted: i=1; AHgh+RoPY7+CA7cbrv7sfAOAOdAgcLLUCHtdcMffdv6vfh4TEqjTApyehO2gFhI0LssXHqipAmFyIkZp5Yjaix6E89wn@lists.infradead.org
X-Gm-Message-State: AOJu0YwxSCNqcTdSnT6P60cVVVdAfhj2da3/IVlqLEdFLi9mPmVpAyHQ
	l9wdYX0lvO2wxyN3jOGNIMSnRSv4QgBdN4cA1Z0qyn6yYmNLYHS/YxD+8PrTFlRvoyI=
X-Gm-Gg: AR+sD11ULZsJaHbCSE4iwgK7uItCR1PVV+GqmAJ27QI8rSM5XbcRsi7AqzghZfaoAkX
	TQwxyc++vGG5ev7mfHPUsWqF8LmcgWGTFkxalJ6is4aQTq6ry4dNdXl17mk32t2rgXJ6kZBtYFQ
	5Dyw75cu1OhJ51hS+/Ccj0Zkrynv3cPiYvTwz0zGwfgGqTTpdHO+PnRC9vELYmoi9A6mdPjQSlw
	LAu+0rTKgQ9PGQzUyhC9XNdCWnwMXZj4E6fjln7aBR0dogyaz/eVMhIzuqgmnnUJMdXK5gAlbJT
	flclfcSq8E+z0N7nVR+szuPGv+8/h9as19oUTn2kBUxbbOMKGQdJ+7/TOT7xTDE8XtZPXXTksxG
	1hQUgWk3PR7WpZVX7z7qBw1lCUPNvYNr4zwhvid4vbhr2jk00H22Sbvl+7trUSRfg++dvfrw+Yy
	x6aV20tb2BXTp/OMorGj16/WbAdLav3Kv7EDCAuGK7Fn3Ax3jsFg9tk2E5nJpII0EP9ujNYg==
X-Received: by 2002:a05:600c:500d:b0:499:86f5:9e33 with SMTP id 5b1f17b1804b1-499879bc10emr72416975e9.18.1786706868594;
        Fri, 14 Aug 2026 04:27:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9886:6a22:ee2a:d5e1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499899b5ad0sm22278775e9.4.2026.08.14.04.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:27:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: meson: aiu: Drop redundant probe error messages
In-Reply-To: <20260814094211.25151-1-phucduc.bui@gmail.com> (phucduc bui's
	message of "Fri, 14 Aug 2026 16:42:10 +0700")
References: <20260814094211.25151-1-phucduc.bui@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 14 Aug 2026 13:27:46 +0200
Message-ID: <1jjyptc571.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_042750_930190_00615CA0 
X-CRM114-Status: UNSURE (   8.94  )
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

On lun. 14 janv. 2008 at 11:42, phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The functions called here don't log the error themselves, but the
> error is already reported deeper in the call chain, so the dev_err()
> calls are redundant and can be removed.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

