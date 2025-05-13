Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6027CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DolSbnwhb7CK4zMm/bekFzKF/EXyrPh2OwEX9Ve2GUk=; b=OvqSkc+yyv4ebCssLfeEZpiaaU
	NGTVRx+RtuyNN00+UN84N9wuIPVLLkCmVb38B1UpDarxMkMthWuCbUAs4ATEICruBuJ/wLXEibAJZ
	uz98w8qajEKofJOs3olHSCKMa8BxIPBFTLzNYyiH9qGhflBb/WdYYCLgjC3FS6UwPZ90dS7CdDM/Q
	MpIhIKFzeWXq7Cb+VIRhbXNhHdZqTj6hq6j1rnD/eDt87s/wUHSail4hcnJuqIukoTjh7FY/3wzkL
	wLzS+biliR4JMhbBBlXpyQPmlWukJGlLhpOydz60+bJfBCNm56uCCUFWAvj0ytELQydJBc9jPy//+
	5n8446/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpna-0000000CVNS-0van;
	Tue, 13 May 2025 13:35:58 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpk0-0000000CUpO-1LQO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:32:17 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e78f44034ffso5059941276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747143135; x=1747747935; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DolSbnwhb7CK4zMm/bekFzKF/EXyrPh2OwEX9Ve2GUk=;
        b=Mo4Sfq5In7o40H25oGfuVQX/c/7nrTs1xmio3bc023CV8LseUKuIlEsqQ3EeLaIwrr
         zmHKG1hfBQgg9Yyq8rrSceuYg+nY9mf3G0jrowRPCcH3bC3PsJeNxWVATeAOe2PbwsFi
         aL8eIGNSrsS+tNIjQHO4Tm+cIz+eGknMWvwJK4YvunBHn/6Kdc5oTMF7guErWFBpOJ7d
         7o5MNNYAkO/AOTFQjQN577uMzNfnzV85sJdgVJCgm+cW7BdolO4K685W4J0HxqLnIjZZ
         KcCIuZL4nHdnMHlR8ckqe3WPvsi5fRZ0BGv+g+8dDcz0YHfUZDstH1IwH2c+DTMIitN4
         UHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143135; x=1747747935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DolSbnwhb7CK4zMm/bekFzKF/EXyrPh2OwEX9Ve2GUk=;
        b=RkYAquhrYrN20VHjtQ7WLz2OkRq1QH+2Ro3ZTb2kq4zPro091H4OE3gTcLVhKjAu0K
         +mgqa0evfxg1+bYoRiMUPciWvpkxlp7wBAtJdigX7rTovQgcG10ZuxjRikwea+hgle0q
         g0s7T+C52ia4QLxpOHchpLoor/luyNiwsdhPFctJJVgJ4fRLT1MDEvRVGuAM0MCBs29c
         KWPvVBm+c/B3z8W7FXUuFbMNbsZRGQYujmNcbfL6yp1GhzSXFuc+BeT8OxN37n/Ap1cC
         d3VUuXdQ0CItyhV7ggaYHSPfUoKtuYjsRz6byLGnq0BEArbxpyacRhsqSkRtyq3vFO2w
         B0Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUF/LIJaFNuqjS7FnEFWZUYgDJE7fyyFkGusFDvI/qXbHqXf3kWdz0W+eR2X521cl+USvhoDwgSN+Aew+CsRABo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz05BgE+vlqMR6TS2F2T/2Ss8pl+wjWzcSkSWs4RCIhDeKQpjMj
	mrDuNR5p1XpY4gwX1Cp/FHz9JgMmUIpoc1iyBAtEYhTUXMoAM7dQHu43muJVguUacGgmK3Pd2EF
	nzDE8YC6UT++13eCEFnq79j+CGAkISTJZLT4jIa7IZW/n+HCsppM=
X-Gm-Gg: ASbGncvlDiFFmwQjEue00Z2SmNeN5uUU0+LNMNd4NrjM256WivPhj3X2//U2nOpdEFz
	1imtuNCiou60N6ovVNxM3Q3VYH1WY38CQVDDL4fCTk6S+b3ZsJtO6vBVhvukufzS0I9gRf+K+Y1
	PUohuFj55QgrWnGbWIVRzoFocOV8JDu+uK
X-Google-Smtp-Source: AGHT+IGiybJfQ+z5Jn7pmSBhMFaRx94JyxJ/gdqDm6nzTQPskCAu2xeEpG8J7Rdc9VcKIJc2nXp+xlFh+U2qXZzoTJ8=
X-Received: by 2002:a25:a063:0:b0:e75:607f:434e with SMTP id
 3f1490d57ef6-e78fdd2ddc1mr16588046276.36.1747143135013; Tue, 13 May 2025
 06:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com>
 <20250511-i2c-pxa-fix-i2c-communication-v1-1-e9097d09a015@gmail.com>
In-Reply-To: <20250511-i2c-pxa-fix-i2c-communication-v1-1-e9097d09a015@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:32:01 +0200
X-Gm-Features: AX0GCFtjrC7TvruGjGxJFmXvhSkIZU0U-gCg7r4ao7poGNibGwZebdwuLG5fs_4
Message-ID: <CACRpkdYB6sjp4PwHumkj1kj48oUzSZOUFQTX1i==P8V2DJBx1A@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: add init_recovery() callback
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Robert Marko <robert.marko@sartura.hr>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_063216_363374_3FDB25C9 
X-CRM114-Status: GOOD (  13.74  )
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

Sz=C3=ADa Gabor,

k=C3=B6sz=C3=B6n=C3=B6m a patch-et!

On Sun, May 11, 2025 at 3:31=E2=80=AFPM Gabor Juhos <j4g8y7@gmail.com> wrot=
e:

> Add a new init_recovery() callback to struct 'i2c_bus_recovery_info'
> and modify the i2c_init_recovery() function to call that if specified
> instead of the generic i2c_gpio_init_recovery() function.
>
> This allows controller drivers to skip calling the generic code by
> implementing a dummy callback function, or alternatively to run a
> fine tuned custom implementation.
>
> This is needed for the 'i2c-pxa' driver in order to be able to fix
> a long standing bug for which the fix will be implemented in a
> followup patch.
>
> Cc: stable@vger.kernel.org # 6.3+
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Clearly, since the same problems keeps appearing on other
platforms as well, this is the right way to go!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

