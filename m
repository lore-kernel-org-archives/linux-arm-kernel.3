Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F9DCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=; b=h5A17FaetxlI0bdp5sTk5ZDUO8
	CLVPM3uRUmgD4UTcmKcRSkHQsk//kmdR/aL/9hZh/Ho3QfdZ3Gq7UuFuBAaV4R+Mawe4PGABzCDuC
	m4z+rldOimGeumfj1TMmVhnmlLAiXKI6cLJiYcLt3Oh8t3UzNJOBo5qb4n/bDHgIsBQgj6KlMeMVj
	qEG7U52uJYmg7/ueoI9jTJ8ep619bmLqQUhjU520v1ZK5Begnh3EwbdUQJsw2bTLOUHa5aEkkVWgy
	069xrRx3Z7ifJjruwgsAK0Ob6wWU6764nIKbnfSFjXzmWf48jKlCZGnFsWSaLZldw0U8tSOnw12bg
	SHKkltjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8Hb-0000000Bigw-3J7V;
	Mon, 01 Jun 2026 19:26:43 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8HZ-0000000BigF-23ec
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 19:26:42 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-68acf0a15b3so7147248a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 12:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780341999; cv=none;
        d=google.com; s=arc-20240605;
        b=hs52nT5dEP8296crMc+K2VKTUcydQEKB3RzkyUZIYfDwTobYCc97+SwLPYyw7uFm15
         LZkYnhVPYPR18ZdI1fI0zYyUvGir4161VdPVEWYBj4y4BBKxCCrS+mVrjz8JWf9U2YlQ
         8Oa3eEB/FOn76gf/vtEvqy06DILlf5Cfx6UG9ANZ0KGV7axJ2vrRJMNGwBpgyut7lU8w
         jhI7+CTODc7J+g/cai/eFwN8KhoxJle+/uG2hhnAtggyZaUYrMk9fdFj6FbVe2vMVl8I
         PrWfjbh0T7WZoiITPjjWuMC3WoO/uZb4JvL9DzogV4+DNj3BM5+xCuYNQMPhVsgT6Ih5
         vHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=;
        fh=87P/jSXJSM67Ld7ZdZ1jS3B6VohiShq7vXorWMzgVRI=;
        b=fVO4qpyUUmzFJsIJGT1oS+yssMYOKizSNafdUCVi35XADhioJkwG+kZv5kUzNYwxqI
         Aur9RgIL+tSlrfvmMuvZTzee7+rjsznRmGRykK0pTgS/4NEyzfgrtfLd2QT3PpIoz+0a
         jMBjDl3FuxuRPsP1s9e/gX44Gc8rhxbUKxu3xYjTCt74mY6IA9kZNsUCvTUzgnzxNC83
         Q7BgC5cU49DY2cIxafVSwlo/EfmrDAh6HLBgiYgL+Ty4AMSN0BmQtIdXfChURxcsheKq
         6KSFVcHhfl2ghpvoZU9b1vYRmEBw7BH5w65I/FlAHcu4exGezI+XxTVjNf6wOY33P/7Y
         AaDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780341999; x=1780946799; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=;
        b=bjiThTTS5UUwR9/My/GmTT2scpd5CSfIa2EpnllYu3jE/cmYGzLIBlmKHcOePgSKjJ
         mAZryuNcq89zkncOYvkXT1iZnRK1ajCMSiraRIJ6j9lQLyDeoYToWDyeWE+1DCQSDLlT
         OVwoAuvkW3vtJZGSc6GWXjo8ALF4G4RPalhaS3SFSvv/XjK/iF5tw3nrXqUPF46+1u9Y
         33Sc72fmv632LLB73CeiWBfDFvsrXo7Rg4iHJPYj1UnVOWI8/lBr0FgseyG8IHRm8UQg
         ISkS/TJuEOzhmmawRuRpgoPgDGtFmWR74xr9GO5ONkqyaNn0mxHa+0nPtPE21r/1BMx8
         F54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780341999; x=1780946799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=;
        b=YK+lyVJ0GvX/3e3WgnU8BydBWNJE6KN9gVNqF84x52QEnQfVk0Qb0HucYBmzewyyiZ
         JM1inWPzk7mzaYDqQcgm1RLHDcxiQruhEtUp7WX/lIPNbIyduRYERuqwycPDcISJ/MXw
         8inIJVNTJYkbWSFjOqIIhXIp+DYUKD9XCMHJf4g9bImVTMsnuitoWDgTbsxVHUlXLNI4
         XKgORIkv2QK89C9HHhARr5pgsa3TnhJ4iuTt0RWtTNcSCaOwG9vOHvnAxSVqeIQgP2U2
         k2UKog4dfSuOoV5+xwARy137NWosi7pppDY6nlMVQVQ42HE66CZCkeLgS+MfzPq+T1e0
         uk9w==
X-Forwarded-Encrypted: i=1; AFNElJ8jCM2dl45o81IT1lmH/iEg2w61t6vDo7/DQBij0gCY0tJl51st//qw6NK+dIi7GXBoby1tEX8VENJQzcZg2vHd@lists.infradead.org
X-Gm-Message-State: AOJu0YyEdhx8afSFw0xNxgO8pc+w+xCugN8C095nwKPJiqpsN/YUj1Vs
	GH/fQbfb/gQpuKBZa+1GpsV6jtX4SLvH8i9SFNPH0sQGn0a69U11r/+Q+iPTp3watPTsxdpiFA4
	aAbk2BfTirwB9MJniQjJshtIYBbRP/Dw=
X-Gm-Gg: Acq92OHdPlfvc7YRxsZnudQIKstGrS70gCEybu3vSfXKs3qv7st3/t33rZNnvicGTv/
	ut5fudgkyORzHzbJfUm9E4GGYwRAEGoJYfN8go791eiVrJiNGa+h/FBzqOMzzlI4jzUPiNs2hlC
	HliqiMIlAb3vG64EbjyWRsP7l9W4+OP5dXs+iPRO5pwmqmVXtbSvjWaJyFXL4rZMzZMz/PHaru4
	baO7NheD0ThJF8HKCJUjAuHan1FhqadXLXfq4hi7sqJ6+K7BakJBMWwZ4BOpsRsz1PAvhfEM1TU
	0Yd6riWef2tBZurRpFgKOAmYOOrptoqJRApP+EpvQsAwiPQ=
X-Received: by 2002:a17:907:3c8a:b0:bed:9a4f:a42e with SMTP id
 a640c23a62f3a-bed9a4fb3fcmr364036566b.17.1780341998944; Mon, 01 Jun 2026
 12:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260601152707.29039-1-l.scorcia@gmail.com> <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
In-Reply-To: <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 1 Jun 2026 21:26:26 +0200
X-Gm-Features: AVHnY4JJrihr8pVvcJ1S75wZnre1x-GIaJ8orYAbpycsIER2tWpRasMInT2GVKk
Message-ID: <CAORyz2+YG4WsS1ay2UA_S-w1UGMe=yEbiz-FUnRPYR03xaikng@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the
 slew-rate property
To: Linus Walleij <linusw@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_122641_546261_D6205B65 
X-CRM114-Status: GOOD (  13.36  )
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

Hi!

> Do you know that value for the SoC to you can express it like
> this and translate it in the driver?

Unfortunately the data sheet I have doesn't say anything more - just
"Normal slew" or "Slower slew", and I don't have a scope to measure
it. All I know is that it flips a single bit in a configuration
register.

I found this missing property while working on the Xiaomi Mi Smart
Clock x04g (mt8167). I ported the current pinctrl driver for
mt8516/mt8167 to the paris platform driver (adding support for slew
rate and r1r0 pullups in the process) but the stock device tree sets a
slower slew rate for the speaker amp. Without this patch it would
trigger a dts error.

Thanks!
-- 
Luca

