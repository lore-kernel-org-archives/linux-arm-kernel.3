Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EEFCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9H38XxmVOscTdAXBIMgyb10vFFsNxVOxLuwwMxDzMg=; b=f96v4bZ61PKAh/GK9zDmyb/sxr
	kxKOJd8PLdBtIIYS/2r8KpG1A6QD5K4INdjDDoas4PlRmqIsFZnvS3pGZfPkR6feJEPjSpTYpl+TQ
	8rD62JObhInqXlhi4Zj8W6dJpABnsJBEAKSGzTs7cmWznmgSCjHLhelVQccAGwOBhTAMDNu0YdJ6d
	sbWwIWnfSUNDFAvX9tV7fA8PmzCq7Y0XJGGe5TrJcaAJMqIzaU6U2WdvEyjAH9HZQ4j8PmnV9wuxG
	y6Gr+XMx329jrNTzblr8cvH8oVjRP6DHGmkOL8UEyS6edRsjmT3esxkz3zLQygV0pniHySKksOwB+
	jSEoUYGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVQf-0000000Epm6-1uOW;
	Mon, 27 Oct 2025 22:11:05 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVQd-0000000EplZ-2ju2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:11:04 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-36527ac0750so46506741fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603061; x=1762207861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9H38XxmVOscTdAXBIMgyb10vFFsNxVOxLuwwMxDzMg=;
        b=UQ5HLwpg+kp2gM/gattSpE/sIctsXP1NCK8NU2484ZtvNjSU1rM2tygeItOLMFhej2
         aIjlIRQSu9WZZkQp7mWzinLP4CPZ5KvixARctS6GQDi1KCdm0bSkC7jHV2bmDCRVw6so
         oZ6gEycI6BBg+c6vP3DsxM4vEcbHaVSNivNE1zB6+jQ1PCIuj44eAK/k4yOGyfLgZZqB
         fpoSvMO3bio5ibb9PzqIfICiIbSAjauiF3lFzcSrZ8UihvxYZBJmGDahz9VL14BHtLL8
         WdW7Lb6KX2Rgu0Anr8D7M5rNaWceFIcU3pVuVloy6wGHHVRu79bRbP4KHDIOSC3n3UwA
         ozow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603061; x=1762207861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9H38XxmVOscTdAXBIMgyb10vFFsNxVOxLuwwMxDzMg=;
        b=e/eKtbvuKaUsTlrlGWIHCqCjuElZlO73HvZ+WLmUIdhD6/jc8L+TuonNuio8EaHzkR
         P7jqpoZ4qJFUnDUeV7rO9M42vBBVb1iLhicibN76Fb/ulGz4OjdxrP34e2lMkBu/Y0E2
         lSuHVfVq6V3VySWnX8EG1ln7/7D2qyP/kZD7ZFS9uMu2towhBNup5AAe3B5N8E935x/K
         ChTbWJ3KikBZ86odJZVKJGifk5VFStXhInLFj0tMMktZD/pYVCqk6l14Ld5ynTLsBNyv
         2HRg4uCWWQiPVKtxZd6CDAzetOR1WPraQrqI/Yw/+wvbolIjSnciZUDrkhyR1c8P5EaC
         WNRA==
X-Forwarded-Encrypted: i=1; AJvYcCXngwmu9qgL1oSeA++RJdmFgaLm66HajwdT9cGVW1KoW0uoQNdb5OjhxGIUJ/tQ4mwLxIGgkNWxI61O5rJkRti0@lists.infradead.org
X-Gm-Message-State: AOJu0YyN0jjjL6FN3bMc906JIjQ3q2F6t/rOsrn/d/cS7G+ZPMFy+DuX
	lBju1983dIqCnzwdyEBEyj1bgY3Xkv7MFYPk5ZsW6IMuNjH3VDg9vZu7XLM/bcy0bq1iEgKMvgZ
	OiByFoETetT7jtTUbf0dveiJ0IkLlub+dmdpjW0INkQ==
X-Gm-Gg: ASbGncvLvtqaZwzjQJskQmd6jG06d/MM663Man6AQboVhB8IzNloLYVIb7zycSgmGdx
	Nk+yLvnv0RIkYYl4P2xjqdi9IvdWYMFEBt4UmPpuTyvysNz9LWxD2DBlix4Tj4+uyKVUuV+FRf8
	bYCX2XjBCyOy2XOB+De7Z/ujnr3H1xmkHEEa7MHPO21gOZEgFw6Pn/W2kva/93HjvbwKBZaiLEK
	UAWFUfSMvh3lWyt1Ab2F4uTv7VyRvWN/XDR2ccsYcW4Vdp+QmVYkiGrKdsn
X-Google-Smtp-Source: AGHT+IE3B73ELbUQavOS3+9V8O99ObkxGs1XUoqNSIUdKZBsD2NXFZZaX5rjgwqiz7ABPv8TjN+usn9RpujxaCi3agw=
X-Received: by 2002:a2e:bd89:0:b0:378:e097:e195 with SMTP id
 38308e7fff4ca-3790775a094mr3319331fa.33.1761603061549; Mon, 27 Oct 2025
 15:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-4-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-4-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:10:50 +0100
X-Gm-Features: AWmQ_bln6fs42YRtiqP8ik_NX7rcLNvMO96ITfFJr8FlYTKtoHQT9TbJlFukMl8
Message-ID: <CACRpkdZETuUGn47foo49xhj5krfE42sJ09vYf7EuKzm7J7kfUg@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] pinctrl: pinconf-generic: Add properties 'skew-delay-{in,out}put-ps'
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_151103_700051_416CC7BD 
X-CRM114-Status: GOOD (  10.00  )
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Add the properties 'skew-delay-input-ps' and 'skew-delay-output-ps'
> to the generic parameters used for parsing DT files. This allows to
> specify the independent skew delay value for the two directions.
> This enables drivers that use the generic pin configuration to get
> the value passed through these new properties.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

