Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4252AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 13:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJ+Z1kfUBwbn40YbG9rlTaU9zO9y3+iqV9Uwb36hGeo=; b=jM0KV+83Q8AMngm0ragqf7vJ3A
	VFei5olnVi5VkNYRvSGU10Yjatb/iyfDlI//fh0kLmhA09xEazF5J6jQq7mzL8mzC03uo95PT6EGJ
	E5etB2lGL8YSLRL+fMECN5ILZKjqt9SBYVYh2OejaG8qN/7DsVpCI26pxLKTJQBu/Pm1rsQhUKo2K
	3yKqTIJ6r3trkXJLYoQyGE4ynmqz/ZNN+Jiq6ctbHEHgB/acmwYdkVSIXzazfIdSEZHF6DjpickxQ
	x2Ohh2lK2/SJvJX0vkIHKjtqOlxqs587kEbGpI13ajt+X22YgihvfbdIMC/891JWKTI1bwxD38F7P
	gqdgY6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAl4-00000002mhD-2t9s;
	Mon, 17 Mar 2025 13:43:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAc9-00000002ksK-18n6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 13:34:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-225477548e1so72429405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 06:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742218484; x=1742823284; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJ+Z1kfUBwbn40YbG9rlTaU9zO9y3+iqV9Uwb36hGeo=;
        b=eWR38pFRhiSxiUh3Hxl4spodvOlAipIlvcUoNFtgb/TPX6u+gwgMGfjdsTuSFTR5pH
         oUT9C5tCuBrmTvjnUSX3y5qLttR70RoXcUCd26zztTRc7QNeDxbzTi9ekmRr3VYDoQC9
         x8LDZnJGy/n2Oowu2YQPK9MLzGAsA5yZJSe8rdXy0FAEu0ibSlcBsEbxK+C5rT7BG4P7
         PVqxHy8P/eGphW7tSk07X74BIEMIbJtj78gB/XMR3dQQq6SeA+KYT2v681nQyfkAcSQD
         dBSnMxq38KWB29idhsDkBhfDSLknFNphDNP7iQol1W0NwbErghHqdNJbEesLS/lFXfDZ
         0bOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742218484; x=1742823284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJ+Z1kfUBwbn40YbG9rlTaU9zO9y3+iqV9Uwb36hGeo=;
        b=QOYivrWpEpzR1Y5gH69CzNuG9TEbGTjyUqs1mRs58GsrCE+r4EDNZJBkWA72fXQQp6
         MtM7c2vYbSFsurVixp1HXhbwbwAZOl4OLK5o7eWLDuXocoWTSpQEmktBbDr8i7T87Bjv
         /XHj55c/eYL+e71cd5n0xvWtTyR6Ol9zwS1QcAht7al56pSgecQqe77WnktQv6JPjzwg
         g+xMq90uJMPlJi9vgJtPkwZmGF2eV0McVhhfIg1kaxsG+iVb55iJTazp621HCQ3n9fuN
         csf1hcyCQkrpm+iVzKFHhfXV7+i3M15ZwDfVe+H0ail5BCBsXtS0yZnlMHrzKski9m+d
         yGzw==
X-Forwarded-Encrypted: i=1; AJvYcCUbW/qK8Np4HOTWOdLq0nnSzl3rXP44Sn0tf7dWrKEDuF8Q9WJF3RuPelFCRCobgxfSZT1p/DVvPf4EwAOSl9mC@lists.infradead.org
X-Gm-Message-State: AOJu0YyJzkBKNA7NGl4Tk1ZvzOs5lfb/rhu/gUun9GtvgnJnHh1GZQMH
	i+AVuFB35cyp3j7ef7yERwfznKASTNRm68qlUGkeNrdpw2F3uKbHhUiTJbGSW2UEusJkdtJMupo
	p/FKIO9ifl03iwZ9ZcchC9ahgiNU=
X-Gm-Gg: ASbGncsyxrxa+i9prrEUJ1MKU6hVKWa1tWZ9EOZ7YUBv9dvM8psW3+1IOAx80GnWbBJ
	Tve9vHXtNbGc8oizssL6qxzs8Z98gb7G1JNEhAMiQmeVgeSnlNc+QtKYHYe5SPQd1Yus/04ZRbN
	c5Fpxe1BQ2AsNg2quISbKXk20=
X-Google-Smtp-Source: AGHT+IEeqZ0cJAHn3Brc0MOsXlDdCz7IeLznbTYmwKzft6JI2zwV4TEg69VCl0Ay05c5C9QobxSkS+DMqCY1QxY4NlY=
X-Received: by 2002:a17:90b:3b46:b0:2ea:3f34:f18f with SMTP id
 98e67ed59e1d1-30151ca0bf3mr14263755a91.19.1742218484066; Mon, 17 Mar 2025
 06:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250317111853.43708-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250317111853.43708-1-krzysztof.kozlowski@linaro.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 17 Mar 2025 15:36:17 +0200
X-Gm-Features: AQ5f1JoJB5F4azgy82hI2MMZ6wYjl0ACVtNOlaZnQbewllSkYy5wctWQcui4Ius
Message-ID: <CAEnQRZBorgPS+P8Yt8irKm=CTpbY3hUdkSpOK5if5xaTpzikuQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nxp: Align NAND controller node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_063445_311249_E0570BA5 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

On Mon, Mar 17, 2025 at 1:19=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Bindings expect NAND controller device nodes to be named
> "nand-controller".
>
> Cc: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

