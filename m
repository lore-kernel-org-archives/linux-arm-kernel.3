Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE99CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfJm/0K/IK+TFySYahec6wkbZ/mH3F/d8fqO8oHuTx0=; b=rHwV5HqONPMMdouK5ICmqJoapj
	EWF+km59O0DDR+5Isr99z0nWgpUHtmHWHIMbLlNR8fQtylBhl1s3RDjM5RCU4EnUoOmU/IktW4UrX
	lE8H/kCQNz/11uaAI6VyLu3hiyCssj0EFQDRTCubX2nc84x6mJMpPpzAsk1G2MtakGEFAeAefTiXh
	p1LfA5IVlpvMdMuuUvFGZcYKKuJv2PAAQQeNUSyEULqwDx34nrH6mZLiv5Et0vgXjw5WPtYu9Q6RI
	f2lyUlv7IA4NAheqMGl2Df8+YJQiEUXPz90aiT3s904Eh2BlcPIl5BfdYz0b8HyO7JtjQ04DQ0hMG
	Hi247c6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyD5-0000000AP7z-2XyE;
	Mon, 03 Nov 2025 17:19:15 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyD2-0000000AP7c-2cRe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:19:13 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-362acd22c78so41320721fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 09:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762190350; x=1762795150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfJm/0K/IK+TFySYahec6wkbZ/mH3F/d8fqO8oHuTx0=;
        b=K5NTiD5ffCD1EqZMcWfGvn3HbSuZ0mfsIkEbLDj73/tFn5LcKWgxH+tmUGVqlCsuhb
         QQdF9q7YzzEL9XYhdpWe+mgPORDInaUljA13OZ5tVOepIdbxJGCtdgusvTM1KrN1Fj7F
         kGYZBYO980q5HbI0SNBJFzz3i5EMnB3ucGKwMvqUSRahb5xTTckPc7nrlqnz1Kpu2I8p
         dTu+Hpgd3I4VjCrZALtW6CILF9m5iXjpjnwUD7BnDbWOGIEAEpo/AND4ooucID4btVtG
         4Wsur3fyJ+hdVXelIW60PdZPcV6Kg/hsk3UI1nnuOEqPwpwMyGp9wyiNzPkalrMstQiC
         8Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762190350; x=1762795150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfJm/0K/IK+TFySYahec6wkbZ/mH3F/d8fqO8oHuTx0=;
        b=cgn3QKKyYmXg4r51bG2liK6qhO1QqfPl19esAGpPFXOTiNZ0CLEGYJAFWdRhy0ij8b
         L5cDUxne4j2GdLyY8LC5ghXiAxOOeY1s3FtjNBalAP5qHlGP0H+9d9J5uMwoNvJIGzlw
         mkvZXuIQmtkbLm/KtlSbOnrPRZgPiV2azeA3dSGm24P0z6I9+tWXohXRkBfpJTfXM9Mn
         BFCTiUMGXQixahirs8vR68waxkaiC6JMWgMnNj4A3fBWd8h7Fd9nK28QRTc4tPumZtTj
         LAgQz0XQ0gdNA15hH50OTFsrkLW2yk0FtI1XI6W/YVRaHdzwXgDSLjZKGBO30+mVERu3
         yhjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqBgMqsM6mBZXBNlC13wRpFi8/SX3nN+lxmRym5QuwaYyC0qi0ueJg82o5f68wUtzXVgkcrjAvD/3mpadlIsw0@lists.infradead.org
X-Gm-Message-State: AOJu0YzfbKx0ZcXUSXa/KGQmTvcgNIlSHXjrPtX/ooYdQwvszNBNxOYC
	ob3DT2H+cDjGITKVEspXltNzbVla/3i8VSDd54TCWRtEr78w/dunxhVqAw5X7RcBZ42oJpjOc+2
	P83q6IfxG91F827WvGyTLMWg+DAUIhl21uJdme9wBvA==
X-Gm-Gg: ASbGncv0UxLIXPfLcV8x5DgmzPQvpjTB5s85sl1AFe+mMFCEOsV2yoK+2Mlp6m7s2jY
	wdPwnuyAxXRdmHrvyLUEUpl+/nxCNhRHBk7FVe7nWWsXlxDbB/TMzyOWZsuFT3bcGc6f8MqaFdc
	Xs3Gaj2C6Ofh1+kAghKjMvgr2gacFThusnuw1CLj/u/HeKQbKj/RjkRgJRTq1cgvH0877UVn9nZ
	ze4yNHg2fRZHdDSHPZ3XXa/YV8TPrBQsKCZA3hHTmOU+LmWOz+enjemy+xUrEmaAHH4R71I11du
	KnKdve7StIpeCCvKJXvKXwrJNOA=
X-Google-Smtp-Source: AGHT+IGyFfYznWtlzK+1dscg69T3Xfj2HXDxx8skS1npII5281AQkb1LuDH6QTamNOOg1pxOfm3nDu+XQdPeX9ecORA=
X-Received: by 2002:a2e:a546:0:b0:37a:2c57:579b with SMTP id
 38308e7fff4ca-37a2c57588dmr22924761fa.7.1762190349831; Mon, 03 Nov 2025
 09:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
 <20251027-qcom-sa8255p-emac-v3-1-75767b9230ab@linaro.org> <20251028-wonderful-orchid-emu-25cd02@kuoka>
In-Reply-To: <20251028-wonderful-orchid-emu-25cd02@kuoka>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Nov 2025 18:18:58 +0100
X-Gm-Features: AWmQ_bkcWkBdzid9BUjDSUzrVzjV4d_nhcsRcb-w2ymlO8H-z-8gOwTsZnb5fIM
Message-ID: <CAMRc=Mce_1O5fRn8xCu5GRc_hFUtMgotx7ZK1EHF4xZMoWsawA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_091912_671656_095F5E1B 
X-CRM114-Status: GOOD (  11.15  )
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

On Tue, Oct 28, 2025 at 9:16=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> > +
> > +  power-domains:
> > +    minItems: 3
>
> maxItems instead
>
> But the other problem is that it is conflicting with snps,dwmac.yaml
> which says max 1 is allowed. You need to fix that, along with
> restricting other users of that shared schema to maxItems: 1.
>

Just to be clear: snps,dwmac.yaml should stay as:

power-domains:
  minItems: 1
  maxItems: 3

But all bindings referencing it, except the new one, should now gain:

power-domains:
  maxItems: 1

>
> Shouldn't phys be required? How device can work sometimes without its
> phy?
>

Actually I will drop phys, the serdes PHY is managed by SCMI.

Bart

