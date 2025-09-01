Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E7FCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPt66DDRCZrwGE3OLt9r6bRhgkx900DOxgcmH6PwUf4=; b=eWhLghDHueQ9DwN95FG/QfoRCm
	TK/f3xztgee7cZEmMEU6t93yePO6sxOKBvQJpLEF99BUf8owK1LQXNFYTe/Os4QuMtN4E0irJuwtZ
	FduQUkWC4QdKGZVrYQX7KfokbygUUtdUhBQrQO0143VRN01Uwgsmo9R5tBwCHm5yXRAYEzTrwduLo
	LPEJYINEJPeRcNnhID/RX+jhG/LjuSU1pV0srrP1slsjVWxcHJ12H7q7QlPx+WacbpNJJGAb6AfVd
	vEtrPFGujWmHPWWRbL72eMKSxFLhltj2HQtlRlOPHq+zHmNyTjx4drxEOJcDlNgakCk73m426otrb
	4wpnOacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0GI-0000000BdsX-40TT;
	Mon, 01 Sep 2025 08:51:38 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszwc-0000000Ba90-0xDq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:31:20 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55f7ad815ceso901055e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756715476; x=1757320276; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPt66DDRCZrwGE3OLt9r6bRhgkx900DOxgcmH6PwUf4=;
        b=TogEIps51Krcd8Z+R42sM3sXtdc/uiVDWSVHnZEEiONSdxXJqjb1ce+D0lKDDn6rgl
         JBCyKhbCS99o1GHCTkQrkzIThBdFDfhvENcKoz6xqAAO0+fqGkjaBHjIAOlGlJEfR0EH
         QeTYq2w0cAIA1gf4X4JU1fXb8sBCljQxCF5zcbqW7+s/3GnEbGz2fbnQtxSgYazrYcVe
         8rnhcWdVmptiVPt0nzoNcwRrJzfoi+tmHeMJoiO/m7otp6Zc1IFwEFXYuX3PXkNnPN+X
         PiBu/JoNFYa2vrP5vRiBTpCkidjcdTLtFKI3zyMQgy0a9ZPmjNhbpNk0LcL3DdjDE1y8
         vaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715476; x=1757320276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPt66DDRCZrwGE3OLt9r6bRhgkx900DOxgcmH6PwUf4=;
        b=UvfuPy2cJd0549N1Nc1OPVNoG89/xN97pGwQGSbdvGdT8jqFzw8CKkgEEW+x2SpC7P
         nEcCaKUsmnPu4nN3MOshXCmGkGvWQGn9i4aLHckyo1FUck0e7tv+Hcyzmo7yqyzLnwuU
         nAumlxzVQYTn9UDM4KHn7nVDa54hQ/wHHe2bdlktjERki/mJXQUelSRTKmTUM1Xq8pmf
         azj0pB7jJ8uVKyNUB63ECiZzPI8oXbubU9RKZ3JaLMoT4/L3hkCv2WIHLO5FtCpalc+p
         JGIr6YCRT5SBHNXr7P4AmzYE+IJyZgs7A0Y3jaGn4BcaAf1BOYt4BWv116NK9NsVvHBv
         7Zxg==
X-Forwarded-Encrypted: i=1; AJvYcCVK5byRDGMqt/qffTDYjhfocO2+FC3++CwTe1HO3fJRtqkvVo4A53zqvOEvqRPUJBROoCYESqmGSL6NMiY181+d@lists.infradead.org
X-Gm-Message-State: AOJu0YyU/Fty/EDy4axWMXTTC2Ul4fPBII8zY7f/0ZCLRSMvJNyiiUpG
	qGS/xqDWWaJxMnplpEny722XEOC5+DJAV4xUDL/JBjkdHjzKlHTtqbMLMCZYWiN+uK2kuCnDjXd
	F94GMo4iXdCrxULE0fEaxbNMxu3EnWUlcC7G5oI69/w==
X-Gm-Gg: ASbGncu0zxIkHw6R68nS/E7Vs4S9sESLd4+fNZvwB1SUAxml8F/QVTL5TBHvHzb5bL1
	vIRIC41u2zJtwM7hcsuc7B5rOFz87vA+39h8CjitkKxU92RSfOlevDJd3yud4amFiVSo6wPRcXD
	t/T9LiFmTAK2omhKqzFiXxCtFIqHzmOx2jWNiR+xKox6sEsWfCW9z4fiMFaITaJPXtrea8BAGuG
	QqqVLZTB/ZzaDeBQQ==
X-Google-Smtp-Source: AGHT+IFjIM62b+Dh591DDQeikYoO0Bq5o+1crRy46saHdttAn7TZIuFwI7LaPkugtAriquF8Dprb2fu78RsgWNwB+M0=
X-Received: by 2002:a05:6512:3b8e:b0:55f:435e:36bd with SMTP id
 2adb3069b0e04-55f70567d11mr1985011e87.0.1756715476375; Mon, 01 Sep 2025
 01:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org> <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
In-Reply-To: <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 10:31:04 +0200
X-Gm-Features: Ac12FXz3bfOtDDl17XLoOiVe4AoZ6uU4YLHPuJBLjzKvzkaSyj8p2a8ItuvhVxc
Message-ID: <CACRpkdZcPwwpie51D55AHTQRSqG_EQ=tVG+0aMJpHhYZLGq1yg@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Andrea della Porta <andrea.porta@suse.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Shevchenko <andy@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_013118_302538_EEAD7381 
X-CRM114-Status: GOOD (  12.90  )
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

On Sat, Aug 30, 2025 at 10:19=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Note mainly for Linus and Bart:
> I agree with the patches 1..11, but starting from 12 needs more
> discussion. That said, I hope Linus can apply the first 11 ones to
> make it easier to continue with the rest.

I applied patches 1 thru 11 so we get some traction.

Patch 12 would be nice to have finished soon because it is now
a prerequisite for the STB pin controller which Andrea is working
on.

If it's not serious semantic problems I would like us to fix up any snags
in-tree so we don't drag this out.

Yours,
Linus Walleij

