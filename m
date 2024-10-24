Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21333D1038D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 22:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGEbKYgOX5rc8HvwKP+HLvbmqzBX4NlMnm5BCSkGUCA=; b=Mig58dLICPH5BCGFz2K5N57RJB
	591iPgPYFvXSgphu0IDwkAzTqamBC1Pu8L4H5XflX/o3Z/BPEKzHSG0301RQTEwPM4j5DHjDauwpH
	pNbeP6xiYLRTf80mDxX7OIopWcuxSqJjTjCetT1vPkqnF7oVwGj/ycwXDNqeFXgc1/12LUdQ944kT
	zmWldnK2Wln59o4J6t93DD08jHq23fJrSQLvJIGBmGCkxJi8K7PirrgwAKwPcclCp02WJLcLr3fLT
	qTDtgaU2nkWJWGVJ/uvYOL5qCsnWcs3tIvrFmTqs4pe9wSyHD/pvOhAHeGKQPgYOeCw988RKu3ich
	uty/xf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t46ED-00000001wta-2NBd;
	Thu, 24 Oct 2024 22:22:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t46Bs-00000001wXH-0Pkd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 22:20:25 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53b1fbb8be5so1661508e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729808422; x=1730413222; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGEbKYgOX5rc8HvwKP+HLvbmqzBX4NlMnm5BCSkGUCA=;
        b=Qpsc22KVp70tMFK0MmbXxJsXflbySzpS35OQASYYROCuf77rhPfS0CG+hCFkMFjMMa
         +LsrWaavU6f4o05qSvUoFEK+Oe5onepPJbHZVhQ2cyzp5QJPxGEsQp+NV8wyH2DWYtEG
         UZg0hP3x1HC+WZLTHn8TKmqSFcEBZ38q5sqmjiGsIE4nFNlcNeoxplQ2M98cFjU9Wg/F
         b87n82viFsAjKTFLavTf/QkUXiFisw5qxZJ7Nlty2hQwpy13G6azKkM55bDWOnojUZsM
         Gc3PfgTTxEeX5dn/6WYDXwAWP6u8ii516LerkGsIhdApUKbCqT7Hm6Vw7bh2GG0Szfqg
         oviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729808422; x=1730413222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGEbKYgOX5rc8HvwKP+HLvbmqzBX4NlMnm5BCSkGUCA=;
        b=XGcJt0mJ60O/YjAdQWV98wYxoFuAfChv+uxUXm1KXkx1Qt0V10/OrWjWT4T2gHkQ6l
         UCjS/WSwMCgIvaZDlHSS96QwPDoE3EwFtcngkrP8FZqYrOQzpTI7QhVKSVrZprmaRmul
         Rv39iMFJWTsRrCedHbMyErqLeNU+wFlu0TuvZzcxrodbdNP6Ts7HIvnTlZ8qa2qdwbZZ
         M8uGtyzbnKHUGB0w0BFngX7jO48MBWlrjsjRSh5OAI4XrwH2X16Ean2UpUexOcRVXKFZ
         Rag+90LfcUVzidoRH/gSmfCZx4zO9PqrsQ8GrHpagmd02Ze5fb/AmMpOIJ1IqpZEhNiD
         OtBg==
X-Forwarded-Encrypted: i=1; AJvYcCXm/kPv7GUGfeIxpmem8taK6bFye2sqcqYGm37gggrwiVmiPFUnWFQGT24/Cm5fj5KtAGG2keWGJVCxhjGoDRnK@lists.infradead.org
X-Gm-Message-State: AOJu0YwjOudLLzwxGyhsOc2j/fCppikJsMvHOA7g4WtTAMzTsvHI+vOH
	dMTG2AFbX4a+BYK6rlB2FUGD5gOwYel4onMZL2TlyKIKuQMROYbcSyMZLSOlEeaFi3nxm5nASlK
	Q1ZmRBq9HVdvIynKwqABIJ9EVE1edxK9EHFKuUg==
X-Google-Smtp-Source: AGHT+IHGIsrqaQ/7HUksQWKQu+JFY6k3cD9zvm7NsmQfaV2x40ET3jcwxFaCHaKIFyRB5Uq3hXr7QboUps1FaB+xBco=
X-Received: by 2002:a05:6512:110e:b0:539:fbba:db71 with SMTP id
 2adb3069b0e04-53b23752862mr1167501e87.26.1729808421764; Thu, 24 Oct 2024
 15:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
In-Reply-To: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 00:20:10 +0200
Message-ID: <CACRpkdb=-gw0ryP1H+K9BQS_kUrQG9STLQMSrVWs8BZ=QejV5g@mail.gmail.com>
Subject: Re: [PATCH 00/14] pinctrl: stm32: Add new features and support for
 more SoC
To: Antonio Borneo <antonio.borneo@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Stephane Danieau <stephane.danieau@foss.st.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Cheick Traore <cheick.traore@foss.st.com>, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_152024_162089_B1F0BBFF 
X-CRM114-Status: GOOD (  13.65  )
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

On Tue, Oct 22, 2024 at 5:59=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> This series introduces the support for the new SoC
> - STM32MP215,
> - STM32MP235,
>
> by adding the support for the new functionalities
> - irq affinity,
> - Resource Isolation Framework (RIF),
> - Reserved (RSVD) pinmux function,
> - IO synchronization parameters,
> - compile the driver as module.
>
> Some minor code reorganization is also introduced.

Overallt the code looks good to me (I see bindings are being discussed
and I might have some comment on that as well.)

I wonder if Maxime can look over the code as well? He's the only
STM32 maintainer who hasn't written any of the patches and I think
he knows the driver pretty well.

Yours,
Linus Walleij

