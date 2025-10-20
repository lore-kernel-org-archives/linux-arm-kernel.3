Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4010CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 21:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhqFHrRS3d75eDys2Z+xSehOZAf3EsLGfFSB3bsNLdE=; b=VZ9hJkNrv3DPVlNwNC5ewa5ooq
	mslPBe6+6MPa+aSK4dMwq6g3DfZjcomgi0EPHukh9Cvnism6JS3Qop7rMmrDPFcIGSIO5z2lu892f
	7y2V/vx+T0ydaBE2ESiLSsr++pJz5s8Vj8pm0lBwb2CDk7pYib0gBLg23utUjJVyPEtI5zE9UAPpz
	Up/oRPBWrgEnNqOtqX9ir93EWOxbYNoMUTBizEoF6jwfHwzBznIHbLeoD2B4RCic5UhAyvxqcAsow
	AeeCwewlPNcog30PTwDia9mFfwA3C8TpTFOrPsT2Yhx+dFRLdfE7JMJYmpH5wXFVkoHIxioMv+TGU
	oz/6Yatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAxKP-0000000F5ea-3Vsd;
	Mon, 20 Oct 2025 21:22:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAxKO-0000000F5eE-3q40
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 21:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vhqFHrRS3d75eDys2Z+xSehOZAf3EsLGfFSB3bsNLdE=; b=IRnD59yFF7Cuc/M6r+KmL9L3GL
	YR8YJ/Ou0pMPNPIXc2jezvpNRcZYIgWCX1y75CDg8LaQyqPpbup+f/2UTpzPvoGtSoVuZr3b4w602
	qqAR/NLICdvHmcHRS5vmLZg9lhUogKziiBqZ/isAIxpRhpBkS/WkdR9vZC1gadm/zmiYCLJqRnNrd
	/T0+1N6bf5/k2BSzV7iAKzM/aNuEsQgtrYellWOHbn1NB60KYsDkkU+SfSobWn3pDITGEYrMro/+V
	JWws2YhmQGt2NnCTRqad0F6FxEwcpRpuml/IDIG/cxyJxL5tl6czqMWNymgbGwK4ktuuP46CmA9NN
	HFbWLQHw==;
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwQd-00000000FNJ-0NiZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 20:25:09 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-63e35e48a27so1620557d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760995125; x=1761599925; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhqFHrRS3d75eDys2Z+xSehOZAf3EsLGfFSB3bsNLdE=;
        b=xP5duJnP7/j2v7ztjy9LTGR3c7awQSqR4y2L3YRLJjG0PKJnnr+1hNevln+IGoAqvb
         er3mKEDyjvj+ifpAyH6jovtFYv7NOWmsSW8uan/rM8OoSCcyqC9XT5e4/e4XVeZkYdc0
         itZatT1hwBjQFXfy4S/Mi+M3YNZkVhqoZQJNj4BmuIVXY8M9AtJi7HaOKXuBwbkhXd18
         vygGdlGhXBOJoIUqYrJgyWNCFqV3ENvXj2KDKANdqfzdH+cZIIjxnB79dI+ZBGwK1wO1
         q+T8Z8AOK564nGU/0aITPFIJ0ly3ZuDQwSHiCrWzN79qEISzhTq9Rsij2AjNQV2/5UCO
         Twlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760995125; x=1761599925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhqFHrRS3d75eDys2Z+xSehOZAf3EsLGfFSB3bsNLdE=;
        b=UjjCcql65e1RqoZEvlelp6dE5swduOtrGEBgorcnRT9+eCiXY6cikd6joFVPzX7Bpq
         x8WrTUvLkZH9sjBoHLeRWgrKUxtnTeeLXRO1HCTzK3BsuAKyOys+amd/r0pLslGr5tri
         yYl2kEgWG2M6R2WihF2ZSUi3nAnJYaL4azpgiHaO3eJ42kjojL94i5uQaGEFdOqqqugj
         aPJrChuP6FnRi3ZjPohml4UBqfrxK7YBhwDPZ9yibT0dKPQELUmiGmvO4j2Lo5XRx2Wu
         osbsb/0pbVkelGSNaZGt34nIS/q2QLPvsjbqD8epfeDPnyZ7Exz9I+ReWWbKDGGaO/DH
         Ul4g==
X-Forwarded-Encrypted: i=1; AJvYcCWOxylIrGkk9lL9T3B3YR8jObc3f6TaTFUC2BXlduCCK8bmbbwuB4/XjoeD81MDR+CuXtNDfxsUnpP3MPXwPOb1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx9dQE+zv2NdqaLMEcD79AALIqh3H/Jr0ujhNTFNM31ZEZiMEp
	ueQ7iz/FyPG/6bFyoW5VE80WYlN5xzlb539yfspGLeo2Y6A1nR0A9029MCkvES9diN1j2CjoJjs
	gVFZInyMPsUqSc9JLO1cx9Jtbne21m5q35LGu+0kjTA==
X-Gm-Gg: ASbGncswSY3in/3TwosNghIoIUK20LsnxiyO8VmEOjkIhY7jTLy3gNGDCWw2Uvhnv/w
	+9+SBLkjk5j/TD3EOK5Xoo+CeRSKyQP4PHS0JfbT4AGCKJuIQ1yVTkLjPQ2bThJFrCt0eivsmQN
	vpvd1uoBA+kXKy/4lC1efFP/Ig7r9zvly5hWzOeiOpJzh7Bl24vU60Cblwb6Ddi2xvM4ttGB9hm
	YXBqWwnROogjzwtxDeE9y5O7VzqunsR8SOOGgFWqxaAQwNq5Ym65z9pcCc9
X-Google-Smtp-Source: AGHT+IFFZqDcL4OepPtxgrUsn0uFlGAddlKxRV2+t2Mk3zg4gYMTrsR7MP8K72yAWcdPfCwzSDaFW6FFblpoxw0wji0=
X-Received: by 2002:a05:690e:4146:b0:63e:2ac0:9019 with SMTP id
 956f58d0204a3-63e2ac093a4mr6782178d50.11.1760995125154; Mon, 20 Oct 2025
 14:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
In-Reply-To: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:18:32 +0200
X-Gm-Features: AS18NWB4E75rklCBn_aAVgvDZT7FC9Ws_ryqXE76wQ-YtpEHMi8QbWqbrDo34Yk
Message-ID: <CACRpkdbLRKUNUT8HfOPN9zOa6u3JyHO+K_tn76dW-CQT7oyoaA@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: aspeed: remove the "gpiolib.h" include
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_212504_044207_BBF1A9B9 
X-CRM114-Status: GOOD (  10.11  )
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

On Thu, Oct 16, 2025 at 11:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> gpiolib.h is a header internal to the GPIO core. Drivers should not
> include them. gpio-aspeed only needs to be able to determine the
> hardware offset of the GPIO given the descriptor. Expose the relevant
> symbol in the consumer header which allows us to stop pulling in the
> private one.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for cleaning this up!

Yours,
Linus Walleij

