Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B4DCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 23:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5g2st9wc6PSphLv2rTXtzyso52RIhR8FQuQh5VZ2AAs=; b=JsYOMgPwHJqSDs3Y8sS+1P+fGt
	EhOWWAHCzGz3fBtCTLLsyuIpkq+AzTvhk5UZpW/eJ2xhhgx8huwbPHaSq3pICpszjV/HidhFl1PKp
	qiOyHCEqd6ix+SvynOnARiinkTddUfcxTHxm5UclINuO7Totax2gB6M+AwIYqFHpQ8YngW/LbA40a
	ykWMK89r+KFEg2n2vl295R/xBBWh5qy0IFL/+jYGa0Twu87fo/VD/Q9aHyG71nPJMWi2PrlYt/PMf
	Vu98rejVjZLKAjRVj2/LbjAGUE5E/FCM265PLf6E7IOxw3bMdabID2IiJah9Xn7XS0F/Yk5cJHRI7
	GuogZ7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIarv-00000006EKz-1nLL;
	Mon, 10 Nov 2025 23:00:15 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIart-00000006EKe-2UoR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 23:00:14 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-63e2cc1ac4aso3225529d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 15:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762815612; x=1763420412; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g2st9wc6PSphLv2rTXtzyso52RIhR8FQuQh5VZ2AAs=;
        b=kNo8xFmH8LaYWiMT5XoPEzf971TZLZf9chQvqNXEKW36ih3rnRFlC1b8plEfyAJ/uD
         AeHt4I6oTPsjHHwGLKHWAjKtC7yWwkffYubKnpXMN+2uywXueLqixn/6+Ui4P5D/1zoe
         r+y0/CeXE8Qw0EVC2YeBQRBC5BjaKXswQpUcZAQ+ykFmmcs8SNHi1FUnZnL/lkiJgxZz
         QqbLPmwGeLVcIZgHAqZTewrLZy/Xb3XZtwOdPoyOt6FqgOeTt1KNXfWsArrs0ROSAn/k
         J4U6szCrXw/PU0tBsHwQQuWaoNNj4P4aFGhK+yENsJ+JEVswWHYA6XFj1mjO+viR/gEd
         rdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762815612; x=1763420412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5g2st9wc6PSphLv2rTXtzyso52RIhR8FQuQh5VZ2AAs=;
        b=K8QL0wEY6OrpvSdSWPjYm+KWWSnKU3nj6kFH2jxzJuYJDxTnRggATRNxw9XIyh9ygZ
         tDSHhfz9gDoRRwZxygtowG+Od2XpXa8VpDsSV8tF/IZ5AQ6xDMGJ9+DAhkVNyWDHdapu
         pC58FdgBprKJiTk9l4S3zctiGSrJfzuB3Dk7FaD1JSkgD0Wndyy+MFgKLcHdAyKOzLDe
         PJD2zIV3Madf6SgBSvCWW8xg5pylz3u5FbGmRD43eXASx8pSjubTarzFR0F9R5Ohfi/v
         zFyPxgM2CK5eC9+6v4+FWD8Gcqf616UCxI+BnVmfsiy/6yAAVvL4sI4pVMUli2jdgnqb
         DxeA==
X-Forwarded-Encrypted: i=1; AJvYcCXY0NKeq+iFdoxxVOOGSNJ1GiXTh8ej6oigVoa6i2R7TPQpraeDqxBDX/DDIPoiQWWLcWZFSg3u7zCgIMbe4Si+@lists.infradead.org
X-Gm-Message-State: AOJu0YzGjBu3YETZFaSZHJhq0e/oZ6DuTQV8BVFjGXXFoKD9s0J4SgTf
	28oSi72kZeCBOK8Vgvvv/nJUTP3b71dcuR4c5am5N8hXSp3I1G2ogkHnGRbSxTfVtpOZNNGvG0D
	lfQyMX+dI0ucuKTydzDznngLgZqXoBBlDMyw4UjiIRg==
X-Gm-Gg: ASbGncvVj+JRhwhi6kn/yKUK9B9EdNQGQfbIGhzzg5SusOqT6rZw93P7NJPL02M+bqH
	8fMSsx0o5tc7BawR7vBC3dvsrj2tUpwFw4tClw5s+wP9l3AdxXK2D3vnT1TD+Q4VIrwRjT00Y1L
	Vkyx1T8XD7WlEXz/fgc/Ifi0jOGm+/5IMPNUIbmJRdng8nNznVNM62pQ7sjQdi0P+aBW0Znz6rt
	SrbdhuCf280Daz4b1Mwn3s44Z+UbFOoalwkRYauxsnDc8Nx/5CSCoBCIiwhG8d+9cuNi68sIE1P
	CSBUTg==
X-Google-Smtp-Source: AGHT+IF8ly9VGsM78kkecljV7QbSku7Ug4S6qy5rbzWNA7QZtQnG4yF7xb8sJiiWVsPr6iJZaHBVJJja0GkrFNx95t8=
X-Received: by 2002:a05:690e:d41:b0:63f:a3bf:b7ff with SMTP id
 956f58d0204a3-640d4521905mr8009773d50.2.1762815612050; Mon, 10 Nov 2025
 15:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20251105-gpio_semaphore-v1-1-f73de44310dd@foss.st.com>
In-Reply-To: <20251105-gpio_semaphore-v1-1-f73de44310dd@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 23:59:21 +0100
X-Gm-Features: AWmQ_bnOOnJKFTCi7QK6iL3YzdjswL_EdXBkwAsVR9l7bqs8icN9mSLR-Gbon98
Message-ID: <CACRpkdZcqM5JzvoTUk+cAFrtvQjHdRiaV0MF8ZipPTWxfqBxZg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: handle semaphore acquisition when
 handling pinctrl/pinmux
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_150013_669414_511A3E62 
X-CRM114-Status: GOOD (  10.29  )
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

On Wed, Nov 5, 2025 at 11:50=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> When a GPIO RIF configuration is in semaphore mode, and the semaphore
> hasn't been taken before configuring the GPIO, the write operations
> silently fail.
>
> To avoid a silent fail when applying a pinctrl, if the pins that are
> being configured are in semaphore mode, take the semaphore. Note that
> there is no proper release of the RIF semaphore yet for pinctrl.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Patch applied.

Yours,
Linus Walleij

