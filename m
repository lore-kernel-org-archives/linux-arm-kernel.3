Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B3EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 10:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jd6d/YrQJp7u3Y35vAF2ccKmJq+B0QJtfHp4EK5whA8=; b=ZLGwNL4SucmLcM2+1LHCnAnGIJ
	WYUuq05I96LpDTZndm/paWflwi09S+/fgLXqstTAMhwj/H7T6VzU/E1zgR/v7rFL6oS7/sXRXTTPV
	ffKiPGt0j/aUYeUXHlTKAc/YVfXthm9fjStISqm9ssSrWBKa8qKKeAydFs60tKthGWZN5nfcRDBDL
	DlRcx9x1LlnjkMDbzocrEdf5qDMc+JUT9/tA9hEXCmajWVKfQVQDnPMGckxCS/MvSit1CyjfzY15n
	pmIzzXbTKji8Pz0qAcmcYwEl0ICdkyq1qAhYx3z1pxwv6qJmA3NM2O/9aPjAliOhnYTrGXskP20jb
	CNlBvdIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnExC-00000003M7J-0Kut;
	Wed, 26 Feb 2025 10:47:50 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEf4-00000003INK-1mNX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:29:07 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30a28bf1baaso58377521fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 02:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740565744; x=1741170544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd6d/YrQJp7u3Y35vAF2ccKmJq+B0QJtfHp4EK5whA8=;
        b=j/N0WPrmrsk+Bi8NM1Sm4XJWa01q0CVH2rWBS4pMmphtf0t1SGJd2JsNn8l4FiU+sa
         +W+KubSn8os6ulMj6xDTcbH555PDcLCqa/XOq6uQpGAzawCuPrJiLvULmO3dpjxRec5n
         xPbX1gAYeikz42mXGSj7iKWjNdlbrEPfUCDLaLPftMv2j9Pzng4l57eGBE9HzC4e+X/A
         NH0A+MwUejV0JrM+tMJ3pWJfRn5VlpPFrYnhHzdf3zf9rAzcViIJnA6qu6mwLpGAvhMz
         xFig3nahQjQAIRRUSiiRgJuES4CKIKZsGFhuykQxg5q90cx/BQ+RSrBsnvgqwH697El9
         nxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740565744; x=1741170544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jd6d/YrQJp7u3Y35vAF2ccKmJq+B0QJtfHp4EK5whA8=;
        b=itUAqsgaPmaNlJMuycXOBBmZspT4fCb4TNasr9U+iB8HFXydmOXKscIguSTtnzobDB
         pA9JbHb896Ly+id+rTlQvx5BjSt/gbmE48kLZtbZxzh4Zq7HFlye1vzC+fL3OSRfacqZ
         NJc8o1ykYnwfEqASbhFaCXZq9SrO7aJm3jcWTiZBEI2dPEPInkH24EkOGAwcgoZ1bgdl
         ZoZlNmESkO2jXSMpBI1cTccZlKXT7SkZowAGudeJ8JGqz8LA1JsykF8qLKsASn+JFxEK
         AsfnwxL7Ota0ze44/hFE5w0v4OZtpGV+1mDee1kZs3WoZtLpQedJLa4h5jh45PtaKzx3
         Q4Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWBf8Qw1H2u1iNQrgHdcToLyfYVX75Hv/h3BtSb9Y4c9dlyIhjRHusdFR33Js9IOOy89IWDHoBW2TTyBMyjtzqE@lists.infradead.org
X-Gm-Message-State: AOJu0YyfI4GTy/BxoYse4natzNXhHLS2WA1rreFC3YHxnFMaR0/I2g7i
	Mu3VyAteTQIuuVKq00u9NNj3ygYCqlP0IEccryLdOOmtNeW/dHt2fd9DHgAYoTwC9N6yH7ousx2
	dqGTiJP9JoD1ZASCzh+uLgKDfCz7SM/antgtt7Q==
X-Gm-Gg: ASbGncsPlpVhBP6Q31ikL4E1xw98/wsntxUEMRtzSIUr/zf46G8q/9MgO/CGimaH8ac
	ucB9W78huO6ZslFx6iKeF+nJDzLdDdVAcovzBmiSlAEmcpjUDBgawxc008Po96rU6mzWAUpmND1
	4JPz1RNdJUGibytqKeV2z6KOqHSS1mFN7YXBJ1
X-Google-Smtp-Source: AGHT+IHHpGE08k0eF3GlP5E4RiiF0DoICSftFLqWpeYwYEYJllw2uhxtszoAU4mx0vs+6OEdCixULAjPR4Rd+B9jS3o=
X-Received: by 2002:a2e:98cb:0:b0:308:e803:118e with SMTP id
 38308e7fff4ca-30a5af477d0mr82028861fa.0.1740565744057; Wed, 26 Feb 2025
 02:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20250223121931.579031-1-salah.triki@gmail.com>
In-Reply-To: <20250223121931.579031-1-salah.triki@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Feb 2025 11:28:52 +0100
X-Gm-Features: AQ5f1Jo2WoZUN5CqFOCb6NBQfPETkTmOZejfsXHK-3TG35mQ7MQv0u6erKTTILU
Message-ID: <CAMRc=Mdn1NNKz+2-aA6qCcu=TMDvD8KcbWYgryhi6XDk72Zd1g@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-stmpe: Use str_hi_lo() helper in stmpe_dbg_show_one()
To: Salah Triki <salah.triki@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_022906_463956_E26BEC23 
X-CRM114-Status: UNSURE (   7.75  )
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

On Sun, Feb 23, 2025 at 1:35=E2=80=AFPM Salah Triki <salah.triki@gmail.com>=
 wrote:
>
> Remove hard-coded strings by using str_hi_lo() helper function.
>
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---

This no longer applies, can you resend it rebased on top of current
gpio/for-next?

Bart

