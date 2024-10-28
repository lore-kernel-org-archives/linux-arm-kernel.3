Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6A7D33994
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJVoaxehblCKmdHBph6FbwKv7y3g2I/GW3hKFWio3YI=; b=akX0HacrfGr/cDazNOc9QI6GAs
	PXu+ZQnWj/ODLc2BXu+rI6Lt4T/QZB8fm8vYiJeh3NfYD4Y/H/YSCpv80J6Dr/teSal4Zow1TWkSK
	wo+FV0ZbrzpPcKZE1nban0+HCR3EDKWZQmBWtNwlJgCw+LLku5dkb3CSXIedJmmhUujTrd0abmQ60
	XD95wvsisleKudSShM0BWk0Cmae0zePk/93NYw/Ohuz0FXIem60NlmjkPBvXuTdcrdgMpDJuFhNNq
	0hp+jzlb3AqxE4u3QSuWnq3M7MY2fGntyUwlEx5bzN5J4ZxBsvtskK9EewDY8HqeHl8Q503c0UnkK
	mQBO6M+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RKw-0000000BFVp-2QvT;
	Mon, 28 Oct 2024 15:07:18 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QsS-0000000B9CD-2v7B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:37:54 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539fbbadf83so5568781e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730126270; x=1730731070; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJVoaxehblCKmdHBph6FbwKv7y3g2I/GW3hKFWio3YI=;
        b=n1iIuF658+vKOHrLtxcQ05SeRrOeAA+SBO/jxJMb9cTj+CKJB3tQh4y5bIiYrDLpLu
         SBLqc9G5kfGgnXfZSU1VG6SgS/bLrL78zpOgrelW81D55vxZVKfIt44Y8KRKCWoLQpbo
         GTBLoya6wXliZg926NlOXvO2ZKquv7rC+4jdD40OBJ1aQt+8nvsn7eGOfUAwLKR0QOsk
         OvC8BDGbZMumX4+ne0ZtSVbQ98pqlHUR1fMu6pWasxPmxyg/g5M0xk5B713arsefsiZo
         8DIqmRmJHiVO18C91ry2eY1YGKroUrMAJhsM/r7LA6SUQuUDAO5T6XY0mxtJrdhBBUFa
         JeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730126270; x=1730731070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJVoaxehblCKmdHBph6FbwKv7y3g2I/GW3hKFWio3YI=;
        b=hA0nHv+jzrv/eiydZGdNwBrgL7EofO1k7P37XTgW7rZB3mw8DKOAR5OmpESredlWSY
         yvAP8LmTf4x1YVdAjfLoTPlq0h/zIOyP5BKIsPIwn71K/KEkBPK2M5SW/PvdkYiXmX7r
         B9c3OsYhemCPHrx7gQFCYPsoJv65/fXMDrZ4qQ6KGLbNJ93/vZk8OVZlb6RGOG0cfXFl
         Pl6pExZLZ/bFjWU1QFVAr/nbOj059F2fAt4vFyC6XWnRAqDie4DUZxnxE2zpiUfMy7Mn
         AJd75mG6dm+S7hlEbPnJUVS2ySiWjCl8U750ab1gGJWCAKZxgr7KuBWOcdW+MyZXtfFx
         V63Q==
X-Forwarded-Encrypted: i=1; AJvYcCVh16RsgyR5VitN5Hj1xia5yJ9Gar63lLiLtHC4NP4kkSeU1e6TzZZqLklagr4FoNwE0Vung65tTV1l6ChiJVnH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3HBUDE70OemP/1gPWjA3bzaLXZcURy6Pup/8q9Bmdrqtwf00H
	VFtNi52yffjMjVPtdbkukLmpe+q3tLwAHJuUiFDYHmMm9YyMmLxhOTRHykKWheh+Rj7TwBXLn1m
	vG5hdvMvltlAC+r7yHfCknkVZNgc2qWkvzOVIUQ==
X-Google-Smtp-Source: AGHT+IFM0/yV2rcX60bAr1jwz7/ljMj4gRvX4g1B3bqoWSs6hvQQ1s7ThycVBCr4zTDLzqa054swjVaA1m5A272EI3Y=
X-Received: by 2002:a05:6512:3f03:b0:535:6992:f2cb with SMTP id
 2adb3069b0e04-53b3490efc1mr3742461e87.42.1730126270080; Mon, 28 Oct 2024
 07:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-5-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-5-040d748840bb@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 15:37:39 +0100
Message-ID: <CACRpkdZONPzUOzYiN0+kd_wFdiF-2Vk+wKC1psmR8P9zF2c=AA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/5] selftest: gpio: Add a new set-get config test
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_073752_745472_FF76ACF9 
X-CRM114-Status: GOOD (  14.02  )
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

On Fri, Oct 25, 2024 at 9:46=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:

> Add a new kselftest that sets a configuration to a GPIO line and then
> gets it back to verify that it was correctly carried out by the driver.
>
> Setting a configuration is done through the GPIO uAPI, but retrieving it
> is done through the debugfs interface since that is the only place where
> it can be retrieved from userspace.
>
> The test reads the test plan from a YAML file, which includes the chips
> and pin settings to set and validate.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Bartosz needs to review this too.

It also looks good though, thanks for expanding the tests!

Yours,
Linus Walleij

