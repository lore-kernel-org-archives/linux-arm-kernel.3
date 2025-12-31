Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D49EE57CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 01:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/c6SVq3C/6p3QmBlE8qRyzuxT87KjBEE1uJ/bQ91nLs=; b=FPUzWUNj6jen2Xngn+6bgfhU9w
	fLbB/hIiAezGE3ka3h0T/QRU98pzZ+EzpB6YilkSPlpckMS4Y8fIyuiHcagcAuDvQI0nDRwHZvuEt
	nLQDSQLceG6t76pjVokTlL2SdC8dzonyFc/ppsH0rIua/5qz1Gy4MtQ3jj+s1jOQefE55Vr7jjYUk
	nsQz8chNT+g+ZZMDwyEmC5ylFsoBvThvSi96vSc5C32flwYhsl2rbEMbFYkrve2kqKdd+E/e352ah
	exJ8YpUiCr4FSW4hoG3T2XXlV2D/3Hho6tUqBZLpUglk3csu4UiUECtdIz6mhINxXJ62tI6Cfhqdc
	R7hK45WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vakzw-00000005WX7-0fOQ;
	Wed, 31 Dec 2025 01:27:36 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vakzt-00000005WWS-0ztK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 01:27:34 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b804646c718so1118107466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 17:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1767144450; x=1767749250; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/c6SVq3C/6p3QmBlE8qRyzuxT87KjBEE1uJ/bQ91nLs=;
        b=IEN41nZOpEvz2GIvr+k6UmWAIZe7WvWG7yyoyK1JQ07cC9UuDzaI4s4DjkVfWlPIaU
         lHvxQujfhqqN2zw+IHak+UlA3eHoRRPGVeQrpaMOJvdKkcTPJ4SmjLB7TBKf9ReN//1I
         iwOK6iMQirbEZjuu3qj1aQuvlpSOoK+GaOahA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767144450; x=1767749250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/c6SVq3C/6p3QmBlE8qRyzuxT87KjBEE1uJ/bQ91nLs=;
        b=W9p8m6SI0chixJ+FnHV0Qp35lEj3+uIgdmCMnm4pg8ImOifHSp2cN6cK39AZz63GwA
         xSwnDl5BM6kIL0d/PcAIN1uk99waIcXJ75ZwZFEY9JgWsSIPmQdaok88sbMY5J7qPClD
         ygjYbK7GRwRKm/kQaPurzrKWSsL7u/Lp6HE5U5MgLFLKBiuw47ipibsvO1MeJvn0PChY
         MgLaGMs43RWq/k+pJ5C5UZuFms0NNJEDwHPa0BN7qmJ909YqUm1AtJxUeqvYKDH1sqKs
         KWGvpUB50iPcTA9CusrhZuoV1XMFbTKaM8Jh4q+2/bnhlVSlTYTOVZpzJoDbn/CO41KK
         uSlg==
X-Forwarded-Encrypted: i=1; AJvYcCX76ART95gr4PVNTO+eMNNPg/o25dvIDaokGJccSVPxrSP6jo6que9XwIoPXJlodx90NLuqLvj8O16YED4vBAlm@lists.infradead.org
X-Gm-Message-State: AOJu0YxdksVB0nZE8JgDDkiJYLxCDewrEwl3/JvmKZDsjyt3+EHvWfaN
	jQYfrR+bpW4L1rz2BhkxdryE9dWukug9eqS3htPmvmP9ojaRQQgg38qwqRLBwKtUEacYwBM8AjL
	Ruoa89XE=
X-Gm-Gg: AY/fxX63sFwJRHdiA+nSLdBcAk0dky4at3/jmh3hDjmwqFh8CV8C/8Db1Bx37elFo5D
	FkvmAMmtct7F0yFsU8ko0JRgQKsqIPyKt1KvZWMqHjnVArfsJ+1MwAboIBVn5PlK9wEZf1ulF3x
	vPQIAvGy3FBaC7KaPvT7M4851BR58OsXbq44s6dFhLz81vpsRn/tJbWKRJHU7sE6qRhmGfRucpt
	dZuE3q4k9q0xXpuLTW9FL/S9o2w+rhI4OCpVog6zPtWL+6VXLc9GLPPTpbptl0vHg4ElPuIPLi2
	sL+voTHOslspEig6MlPhLPRY6xQMYgl3VmdrJWrem+stZLWaZYPRXDKNiEoarTV8KCi3YG9ovsD
	XDNs0vWXDfUtf91+hF0tdokLLzx8+u14bhcX+OgtI5vUISNDeldVYWsGniYeEoMhWXuXdpRyUNs
	MIwd7ziUjZcfIP/xu08eIn8LVlYVLzyN+5kx2b/4KT7FlhRNuPRruq1bZ0PU+F
X-Google-Smtp-Source: AGHT+IHfGMN1Sgm6keLs2JZWfKRVhr3AaK9ftyk1BbseF3HKTtA91XIs+qlDGTkhtZ4ELlEF4ve58w==
X-Received: by 2002:a17:906:eecd:b0:b83:7b8c:7c5f with SMTP id a640c23a62f3a-b837b8c7d0fmr696528966b.1.1767144450387;
        Tue, 30 Dec 2025 17:27:30 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a614b7sm3854410066b.1.2025.12.30.17.27.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 17:27:29 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b713c7096f9so1643145466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 17:27:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6nXz87OWxqkpQnqEn759SCP5+gnkXTBuXvDrDDfk/vShcx777sSdPb+jb4VQeqXGNe+nyMAfZWsXC+9pBdX3l@lists.infradead.org
X-Received: by 2002:a17:906:c108:b0:b6d:6d66:e8e9 with SMTP id
 a640c23a62f3a-b80371f98e6mr3867217966b.61.1767144449430; Tue, 30 Dec 2025
 17:27:29 -0800 (PST)
MIME-Version: 1.0
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
 <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de> <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
 <6fc04df5-b753-4b2d-b978-0e59a7f48ff7@linux.dev> <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
In-Reply-To: <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 30 Dec 2025 17:27:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh6WP0Wq=rbC2Md6vsFrV-+nvDjxgfx9NpMzUmVFNkJ9A@mail.gmail.com>
X-Gm-Features: AQt7F2r8OZntlpbgM6EMdT1QVs39OIAPruiONmqMbrsqySDpE_sREcU70uzNBZw
Message-ID: <CAHk-=wh6WP0Wq=rbC2Md6vsFrV-+nvDjxgfx9NpMzUmVFNkJ9A@mail.gmail.com>
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Eric Biggers <ebiggers@kernel.org>, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Mario Limonciello <superm1@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, quan.zhou@mediatek.com, 
	Felix Fietkau <nbd@nbd.name>, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	linux-wireless@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, 
	shuah <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_172733_342710_CFFA2DA7 
X-CRM114-Status: GOOD (  11.90  )
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

On Tue, 30 Dec 2025 at 15:57, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> I would recommend reverting f804a5895eba instead of trying
> fix it. Then find a better way to eliminate extra newline that
> shows up in dmesg when firmware build date happens to have
> a newline.

Yeah. Let's revert it.

And the way to fix the extra newline is trivial: just remove it from
the "dev_info()" format string.

Our kernel printing logic will add a newline for the next line anyway
if it is missing (unless somebody explicitly uses PR_CONT).

Can whoever saw the problem confirm that just a revert and a "remove
\n from that dev_info()" fixes the output for them?

              Linus

