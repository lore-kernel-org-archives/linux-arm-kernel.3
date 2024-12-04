Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8878E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEUqUVDAtEDFpVNs6Rzg1P2gfpOhXD7qkRTRxtajZNo=; b=AoDPXFGr+jHNWBpapJUIk6sabz
	Tay9vkSSDYFYdNUhLm/NkpsszLEPrhPlGz6bmVGMnRhp8lpmkWsjakk54sNyMTCvEWdUfwGrdo+I9
	t2CYHBohkR9DNU+0En8o579NnWfThGk6xYsh6UwT1OZ/egzU/2Q9kIhx87YGhDhG8MAAeaR1KqD9U
	J+kOBhJvqAXIY9oJ3RZwIOOrzxu+Z0xzoyqetJBsKpWaUwV9zTH3q/vGGhDp3jjRV8hDfIzsBJXqS
	Gev6VGESfmVa9RaNufzleg0Rr2cPePU+KouAing0NO8PWGj4s9bmnDf8Gu6Gd8KE7wn5KQchURAMg
	QdiE1Y/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIq1z-0000000ClcO-1IYX;
	Wed, 04 Dec 2024 14:07:07 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIq05-0000000ClCU-0VEr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:05:10 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6ef7f8acc33so38073357b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 06:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733321108; x=1733925908; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEUqUVDAtEDFpVNs6Rzg1P2gfpOhXD7qkRTRxtajZNo=;
        b=zQBl2hgG28ZzEdDwDwlSSlZhDw3Fp2v3oeohr7dsnMG9eeSbCGi7rnZOqiOFOJHgOr
         i1KBwyMzJp4Eb0BWqgmplyLnzOwGbDTdi/L6CbkqpAtgo958z7lXAvEZuEotXsJOt5ub
         jYDfYVn3CZsRH8xQt9gaxjMwXhsZWrD2RZtvjMBqVxE1g/wnuuDnDvXVO7MiQQWJQdjI
         0lLVYgR3U1W15ChagseGugxDah2r7XTubDpGGqEyTXDK1BOVrGDBHrn0kLQS/zuNO0+Z
         EJvQGYbFTQOwg9eDmzVAN3jnF4JcjRBSFXl1R35GKbwbvKOblteXXjcOrQ0bfAbCYJDz
         CddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733321108; x=1733925908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEUqUVDAtEDFpVNs6Rzg1P2gfpOhXD7qkRTRxtajZNo=;
        b=kb6c6GN3fvN3lzjBP/pdC8FTmoSWnPqmbrS85Nb5J/aEG1DKnKvuGK052vkIy3gVB/
         JKpQ0dgSZi5KJGAjNHwn+cr5XWZG7sKbJJUh7nCqeDfUchHIoC+CyS4p34RgqFbGu2jF
         b1hVrLRJ8mBTZ6bP+bMzDIYust2TuJIQbR6Fp3sD74YvwLcHQWATn+WwEuTn9t+f1uA8
         VvIKEGo+NwFho1np4lZZ0bwSP1ivtk/ygGYzTW+CgvJHU/MoIccFv4igkLM0+lTwQUbk
         PhRLFWdhk2nw2S3SqCL+g8nAf+cE03ypGOK8LH/+DLlOZlD0xdJxpG2tqkISAwNYS8jy
         g44w==
X-Forwarded-Encrypted: i=1; AJvYcCXdQ+T+ll+pRhaQcyrO98clSCR3ann459jIVw7z6Ht5diRnRAdis3gOV71ZH8E1fWhYVRatTukvPdaX4C9frW9Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwFqPcYsfvLd6eYN6x+kcBYPZXDvEnoET70pgYCZTITDi6bzHiM
	V2l4HNlGQnsi7AtCXMuzJN5/0rnNBniR0htYuHev2Hif6yctMzRdwwEXvQXrB8WZVnGX9oVxTJI
	9PahNz1iG4IHQSAmhQxbKL/NfoQHPXDrZzlbzFg==
X-Gm-Gg: ASbGncu33ezfFprWvFyq/kd9CWD7EJxFDSSCnxF/YySnuWwcoqWEgyAH7kS1HaSMRTn
	a3gIa/cXiGrtf0hkaAgRmNKyXIlS6RQ==
X-Google-Smtp-Source: AGHT+IHZLIY9WYZ9kTv9UNMITDDjd1m2vqhMpDylIYJF+rqjdSTk4X356+sJeqPxxX+hM6evy+9rhDmuqAcjgSFS+PQ=
X-Received: by 2002:a05:690c:370a:b0:6ef:6536:bb8c with SMTP id
 00721157ae682-6efad1c77d0mr70490967b3.21.1733321107797; Wed, 04 Dec 2024
 06:05:07 -0800 (PST)
MIME-Version: 1.0
References: <20241204102904.1863796-1-arnd@kernel.org> <20241204102904.1863796-7-arnd@kernel.org>
In-Reply-To: <20241204102904.1863796-7-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2024 15:04:53 +0100
Message-ID: <CACRpkda2JoofOaep-TG90qi_Nik72a6ovuVCp-MRKQ6_U_NSbQ@mail.gmail.com>
Subject: Re: [PATCH 06/15] ARM: update DEPRECATED_PARAM_STRUCT removal timeline
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_060509_155170_520E9FC3 
X-CRM114-Status: GOOD (  15.11  )
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

On Wed, Dec 4, 2024 at 11:29=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This configuration option is for the older boot method that preceeded
> ATAGS. This was scheduled for removal back in 2001, but the removal
> never happened, presumably because nobody cared enough to actually do it,
> not because there are any users left.
>
> Add "(DEPRECATED)' to the Kconfig line and update the timeline so we can
> remove it next year along with the other options that are not scheduled
> for that timeframe.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

