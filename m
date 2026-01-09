Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26B7D167E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8VIBeC6YWBmPy5MPPpmcXKww7Ylkwuah6DNxd1sOv0=; b=AfgdzP5qtkGmZlqkywU9tDcvar
	DtFKmwI5O482T8rT/0WjujrVSpUrG9dHDom2yfAtCEObdyDTyDqdqy98OFoRUqaudTuliXLryQPhR
	1ySeIC/05I7vk9Y/+1Toq7jJ9Mq97E6GvEn9heLU2KEKvB6WQ2g88zZ2Iuz2SV9ipxPPaNGZ4bb9l
	12O2eMUfuF4Q/zX0xdNnQjEhyQgNgv8qyqvXDGEmwjBmgw4BWH5ox+/p82KvOM0bxKQi05x6W883g
	qgMDQJkIespgjF1CgneCL/aTBigiw39jo0t+hqtF3lefaQwXrPjeB3tuoqKKaVUDWO/u796LIcXIH
	iGe29b/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8qU-000000021Sj-3DYR;
	Fri, 09 Jan 2026 09:31:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8qT-000000021S8-2aHO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:31:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1AD16016C
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8937C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951108;
	bh=i8VIBeC6YWBmPy5MPPpmcXKww7Ylkwuah6DNxd1sOv0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VD2XVB8gR77YjmtGc7SYxPku1BqTWNGM1CoCwkmQHN/NQy6b9hlPLQMJTswbWUCbj
	 rj4MKJVzlHyWB5HgZnVSYLZpzYJ6zTBDvgH9B4sV0xEVbsK9c74g76WdNb1yxdUgAO
	 JmFeKLIpTgIy579tAbdzHPSwIfIvy8mFxzqcKNmVotcGHUPF/Ffi/ZYO4CzLn+EjQw
	 Ka1uFED/cTCLrWqToD+WUhUsB3JeYogC9buAb1rtcWaeL8ymPrchihNIyQwpesk1/M
	 kZ2xdE+6/m1Da2Ok6l48fQYmT0k8eHIttIEdjLUeTfDyawtV+wCptR4BcKMA6849z0
	 tZXJBxDQzB6uA==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64669a2ecb5so3456025d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 01:31:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVr7NMmlHeu/qEqi3E4RXJ4eCGUPEKNUkMT0lTn+81O9jKU8zy5xX6B9pymxJ/1s2yFdKSlJYC9UQ5reXVVAVjo@lists.infradead.org
X-Gm-Message-State: AOJu0YyMQtO0zLlwFP4Rx9EvBG/5cfsHAYkQoNWCfryJ3fqcXIekHGcy
	11Q3bpjDtehURhXq5rpMIvaP9n2qDMjYlvvJotbWbSKfsU7pyFoE0qXGsR2sdQWXd3PitdI5SSl
	3QumuErBd9qQA3A4jwTylDYMdbVvEBIM=
X-Google-Smtp-Source: AGHT+IEVxRShfaHD0ACu5gHbuU5njT0IbHJwXmzpDS9YK4ozZXnCMvqtMD62DrL8ET32u79jZQhbNPBVY7hyz2kavQg=
X-Received: by 2002:a05:690e:130c:b0:646:5127:a024 with SMTP id
 956f58d0204a3-6470d24397bmr10185146d50.7.1767951108033; Fri, 09 Jan 2026
 01:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:31:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLn1=5MDWjsNTZzbEVEF4QCp+pXZuu+JwdY-JXzufXDhow@mail.gmail.com>
X-Gm-Features: AZwV_QgAZ0_KDvNKwjEgDlRuSPhE9oJseVMZ4hVMx_2EzdTWDrNwZVkeejwtld8
Message-ID: <CAD++jLn1=5MDWjsNTZzbEVEF4QCp+pXZuu+JwdY-JXzufXDhow@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: extend build coverage with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jan 6, 2026 at 9:55=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> We currently only build these drivers on ARM but there's nothing that
> should stop us from building it with allmodconfig on other
> architectures. Extend the build coverage for all meson drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied for Linux v7.0!

Yours,
Linus Walleij

