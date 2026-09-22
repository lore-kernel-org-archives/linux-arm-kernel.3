Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2093C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvmHxqXCLy9EWZ/6cZQhXtH5A4Fz3V8fxmDhtm5wIEY=; b=K2VgiXFB9T3Jbs5d/aGJkp5DRT
	1pJ7s331WcqFgLWrSXKSw444ojIVyB/VE8vtkUp/2bvZgFYNkBf6cnG98g+AMIBnd4rENAvGmP7dS
	+t6DtNW459a1v34aPuiCxWrqdKBzSEc+2zLsQv22032zhpqG/UUPaT4Pt/7geNeXIbprn/SMWUjiY
	ZcVMK/lKTY3a+ro/HRXebo+I8Daau+tWABCKuiBD1Ogd7NzdNn5bhg/O0tAfzsIAeGLp1eLAmDpAR
	4MbkveNhkpZ4ENbKI1VT55ffTwudNh5KA971MJYtYMWBacpSq13rXrVmqxU6kLDUb6K4lZMBiOoB4
	HSIMelgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vlr-00000004ewa-2bIZ;
	Tue, 22 Sep 2026 08:22:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vlq-00000004ewS-2ksO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:22:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EE2B60DE9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C712F1F008A1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790065353;
	bh=EvmHxqXCLy9EWZ/6cZQhXtH5A4Fz3V8fxmDhtm5wIEY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=eUQDEo/VyBbty7zYwjUEuWbUnVXyxrpFbehq+ywlN21JMUY5QY5LQyol2y8nxGy6M
	 IFq4nNCNdU3YaoVEDrvipjNLXDzlOYWXTZ/bwFUEKnefzc+jvK2Z6XWkQf0o4BjWWv
	 pL7h6Q14BIpmO8cuK2ybx54SzbuJpYlhtycA9cGoks05pERHJf/B71L/kpcz1oYBQi
	 usl1PJNdfmXOYVJPWQN2SQuT6t7r0mXXHizDxoOU1pKAy2UXkdOlR7f2BOij2nL/Jf
	 z62oKFFafcy3tUsGkSIkPhMt4u6pGgkXRVBmfCilFJ8FhC1nOhA0pioIvsbao0Kmmq
	 EWvYD8/FEBiGg==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5eso33610081fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:22:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwnFCjVIKbw0Z8PTnk3L1+JeZMwnoOe99sX6OcwRt18gGUY2PDcBZzcYikaZ2QQaeYdMg2cVcJu0nErX6mH4Haw@lists.infradead.org
X-Gm-Message-State: AFuF++mLROpyJGYzRe5cNb/uPYP4ZrGMlFVVDh4ZHTxpwYEvibIAzf0/
	+ELhHD3exKHbekF/uUqdKYghOilkAQG9vCMeulNxJiSFfES1TpMT7JzBvm3bXf2Mr9t6LZFfCHB
	kqFLZZSpHlBBlEojO/4cv7reBarnYXaPIOJmSS5TQOw==
X-Received: by 2002:a2e:bc16:0:b0:3a4:95f0:c5b7 with SMTP id
 38308e7fff4ca-3a5fbebf807mr28969311fa.3.1790065352455; Tue, 22 Sep 2026
 01:22:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 01:22:31 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 01:22:31 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 01:22:31 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdWZhLy7AXd2OiVsaT92xTh1EF+B+LNo2b-1D2TO3rAmA@mail.gmail.com>
X-Gm-Features: AcwNN1VBTSPEWx1h-ie8zLso64KBEpFrX6miRGn5DdROKODYpn6wzkN3-uBIp-k
Message-ID: <CAMRc=MdWZhLy7AXd2OiVsaT92xTh1EF+B+LNo2b-1D2TO3rAmA@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] crypto: qce - Fix crypto self-test failures
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 21 Sep 2026 14:58:09 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> This iteration - in addition to the previous fixes - proposes to split
> the QCE driver into a core part necessary to bind to the QCE DT node and
> enable runtime power management in order to allow to drop the
> interconnect votes, and the crypto part registering the crypto
> algorithms. The core module is then enabled in arm64 defconfig while the
> crypto part stays disabled by default. In addition: the actual
> registration of crypto algos is gated with a module parameter that
> default to false.
>
> Note that remaining reported bugs will still be fixed in follow-up
> series. This series addresses self-tests and disables the algos by
> default.
>
> The QCE hardware crypto engine has several limitations that cause it to
> produce incorrect results or stall on certain inputs. This series fixes
> several bugs and adds workaround allowing the deiver to pass crypto
> self-tests.
>
> The failures addressed are:
>
> - HMAC self-test failures for empty messages
> - AES-XTS returning success on zero-length input (should be -EINVAL)
> - AES-CTR: partial final block causes the engine to stall, output IV
>   derivation was incorrect
> - AES-XTS with key1 == key2 is not supported by the CE
> - AES-CCM: partial final block and fragmented payload both stall the
>   engine
>
> All fixes were tested on an SM8650 QRD board with
> CONFIG_CRYPTO_SELFTESTS=y and CONFIG_CRYPTO_SELFTESTS_FULL=y.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Herbert: Sashiko still says it fails to apply. I have no idea why, it applies
fine on top of current linux-next.

Bart

