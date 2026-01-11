Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E28D25031
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 23:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/ENBQX982lICCo3cjSQ7OsIstGG9Mk6/7pP55Ji4uo=; b=BbjYmqGHI4xB+OkJbdanDoW/mT
	G6HgQFUlDBYtG4UysmN4Ul6dPVmUiPkh42wy7lEqSc70/9W62yJXoI0jvHifu/JGKaDwAoIsZtHn0
	9FdiwtoLXI7jaSUy6bNia/gXJnzE0r+M7C+G75e9/e6ETQIcE62jSSjOLc8bL3j3/AOdvPZ80mvxJ
	Q+ln32ldlC6Y7tyyuDnjO2Qzndu8/x7p7AplMN9GUUTegp/aBg7WMqEH8MresBqk8pURCh+I4AhgZ
	ldtliYgbuXKt8XlsfdmlGdDXVPEe01wxVAeTayUpjs3O6ojWXAlcIUJx3v/nZ6lIyyZIC88095P06
	HByZ3Szw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf5Df-00000004ZtF-2dEz;
	Sun, 11 Jan 2026 23:51:39 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf5Dc-00000004ZsS-3jM8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 23:51:38 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7ce229972f1so5480869a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 15:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768175495; x=1768780295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/ENBQX982lICCo3cjSQ7OsIstGG9Mk6/7pP55Ji4uo=;
        b=jU0Hrw4Mw2jjNn5/gA7SVEgb6RbVLEDGy+bhS/z5RlM2h9tyb9iMB+fmShIhisUHyN
         hJ0zPQJZm2pTeaxT7812qf/9g3mVI/EuHpQel88OEB0GobK+nRcu1J4XbkoSFv2lveZ8
         9+QPeoHqv23gKHWoUN9N8/u9rw52L1RbaQQM0pvc7EQGWR2ckgSmYDCfSoT2APwiQN4n
         a0cG4QeqtYbDJ8qt9mwAzHxZeE/mHpjVVbbcWgu7wqJHD9yaQOhQ5tRJWKegkiAMk35l
         DKSsxGeU59Yp3lyt3el3ePBv+4kZEjdmgtN8V0nJ11IndFNm4cnrBnAY2Epyzl/cthhJ
         4PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768175495; x=1768780295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D/ENBQX982lICCo3cjSQ7OsIstGG9Mk6/7pP55Ji4uo=;
        b=pszkRT46pEwzhqacNHNL+Uwc8h0YQ7UDix9ToFQBDc7YRUADV4TWhWSZdpzNBTe8Iv
         uCx23LlcvTFqLor8WvuObLq5WN47QmJfg5we1mrr2NeuPDFlKOh1enxT2WbBKB4N+YBO
         +NS4l7Uk8/WSyC6iV7qCZoTjwZJ57CSR6u7xeJ7wUmQy544pm7YRzk2t1O6rttSRToHK
         rFescWZp27zxAit9ozaLvo7RTRsIe8+VgeZE1ILHrYiiLyYDOu7ecw2k8l43xXJIGakk
         pLykLSULquTji3YqSqCV+0DIm1rRPFUOIoN5IUsXznnvPuWOyyeBOHBcAF13J+00Rs8g
         QL2A==
X-Forwarded-Encrypted: i=1; AJvYcCWAB1e9irMSGpdDv/izV69oZfJbwcU+owyJy5hRYZQy28RyuZ2CIoNzYrtV4tNAve76ZqGWrDW5jxcVOX3SRuhK@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc0tF/DTx/POHcocruGhur/MXKJeY6V3yjcbF/U1vWFS0i8X5b
	Feq4CKF1aKcDheOKDQKhJsUMf00jrNVr7EaaL7c04N1qO/fbBKCAtoUR2q6bhQt4jI6DfA5kL++
	Uu1285YlohpC2pe9fBy3nqJt8g8jnWoY=
X-Gm-Gg: AY/fxX6+mY39HYuj/ByYZ9bJwIXUqsgAhkHkVfrKXS4SpO9mJTIAR3Fi0fvURDoD7pl
	76hbZCZsT6PB5c22ejCQ9sLMOXJ7cUkdpGcPao/WRYpny8aD6vR6dDoN5p2jlnuz+LHaqcYkqeg
	LD8IlDlO+fNYCE3HvEiKnU7DfHI4HgC2Lybuu/DEQAcBcHiz4ToqPQ3DmcsatcxP/iqMpC64Qqa
	gWL5snC4QkJYtLwyMLoLpKy92NO6HQcjO2gu8EiZVSs2ZPL56d7vBrcE8P6bEDVOGAlC6ZiZxX5
	XldLGq+Wo0Tw5dT+yODtS4uU/8M=
X-Google-Smtp-Source: AGHT+IGlge53U08ebFfe8r244rsrE6CkWTn00e+I2aSY3bW6BvjGm0i6R4xXCnYggHKHg3FXbw80wZStXmjolJVgDDY=
X-Received: by 2002:a05:6830:4111:b0:7c7:6c9f:bb06 with SMTP id
 46e09a7af769-7ce50b7b138mr11464374a34.16.1768175495062; Sun, 11 Jan 2026
 15:51:35 -0800 (PST)
MIME-Version: 1.0
References: <20260110010715.1610159-1-mschirrmeister@gmail.com>
 <20260110010715.1610159-2-mschirrmeister@gmail.com> <20260111-melodic-chestnut-coua-73e6ec@quoll>
In-Reply-To: <20260111-melodic-chestnut-coua-73e6ec@quoll>
From: Marco Schirrmeister <mschirrmeister@gmail.com>
Date: Mon, 12 Jan 2026 00:51:24 +0100
X-Gm-Features: AZwV_QgRXlN1CiuRYVEhXNkMAqD9Aoc5N6ROQBHLSJhP77NnrQn6dbThJj_qUMM
Message-ID: <CAGJh8eAWNe0JzC7BdA2Rw5etCYgGq3O5Zdgk9zSzsLNv18k=ag@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: rockchip-dw-mshc: add rockchip,disable-runtime-pm
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, ulf.hansson@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_155136_948987_1C8EA6DB 
X-CRM114-Status: GOOD (  14.86  )
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

Hi Krzysztof,

Thank you for the feedback.

On Sun, Jan 11, 2026 at 10:41=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> > +  rockchip,disable-runtime-pm:
> > +    type: boolean
> > +    description:
> > +      Inhibit runtime power management. This is required for boards
>
> What is runtime power management? Like Linux PM? If anything phrased
> like that is it is a clear no go. Bindings describe hardware.

You are right. This refers to the Linux PM subsystem and describes
software behavior.

> > +      where the bus timing becomes unstable if the controller is
> > +      runtime-suspended.
>
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.

On this board, the bus timing becomes unstable when waking up from
a low-power state. This causes a constant retraining loop.

I will move this logic into the driver and handle it as a board specific
quirk using of_machine_is_compatible("friendlyarm,nanopi-r76s")
instead. I will send a v2.

Best regards,
Marco

