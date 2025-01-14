Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EB9C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 12:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=; b=HuErE28yVumxijOpbd3CfJl16G
	Tv8N/Bm9GP7v6t72ze12cJRkyAhxamKnmO8MjgZZuC/d6o0gB44onTjp9yo8uYbCxpDhJCDRUU9Gn
	axH7R7VILqhQgL1RnTPq9FZV0cXZsJpiMdul77GS+wxoZszKmOqOpS+wGMoQO3bom6p7aQPdDJ10U
	PjDnxapeR1/RvWUgpTIbm7TN2CvVUvS8rXvUJGip316zsw2IMOd2q3MjRTa3HEKtjk2F3ATrEqIqb
	6Upq/hjODr4jpMFpGbW0vcboC+1pBZMHvrVjAFrvkLj+wpHr8tyt3KQmYHzsaDdZaA8qpcfh3I25d
	w26pyqyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfsQ-00000008N36-2Vb2;
	Tue, 14 Jan 2025 12:18:34 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfrA-00000008Mns-433X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 12:17:18 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5401c68b89eso5851167e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 04:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736857035; x=1737461835; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
        b=C/iNPQT8ICeyj2uvvUxKfWYKkgfa6tYd1GEtUTQV3/5ZKpN8YM368C/vi811yuBGeh
         Ga1zWTH8y7ZAkzUfV4fJ20cCmIEnq2p95/vjTogsG1HUm9JFIqHzBciIkmw0SQxkDzgh
         CckT4Kn6estK8mTxrCtn/YhXmaY8VAqc+zrfw120sfJWyAunPvjNF8FhHtz6RrfLubZ/
         wTJZO7RIFJu6YSXpQAu8hP33TzZeWDb/QAxY86ZdeEL3x2EuRCqDgkGaFHMNsPze7AQ6
         6CBTSFyLTNWhA3xurMvBxfuNXpJ+Zf6ZW2dJ7AwwcL9YaA8e/dsNKzb57iDisA17A2ps
         SNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736857035; x=1737461835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
        b=gRXLhcTn2yh+FchqW9cqs4Cdb/Iv8Ol8uV71ruNVGDtb+PQYhTtx/XYMAbGaVa/MFX
         ITYUc4UziTGlVir5pI2MMdrCHLIzk1OYU3g8pMWMdDQEESNiH26z4FAeAN1WSPzZp8vL
         zgIEj393H8E0TMcScZqRxR/iniEtk14tX6i35YdneNlLY7gyYO5mOhjRZOG+oPRTUuLw
         oYHmB1KntPMdyCDSRK/VSpOzMutml0DiOJW0p6pxAwNb2nuGsRUgT7lIt/NYZdSCax9d
         RO0JO43stjCiZyWvXTlNoCVhCY8PFeHI0+K0DOU5nFCJJvc2GIFyDFZqW3UGtAlWFl7r
         C38Q==
X-Forwarded-Encrypted: i=1; AJvYcCUP5I+x+O00IqilfT48nv98tO2y4hP6lQNkLQGN2tUXfOxIklrCMCjPx/DCDLuJSfB+a9QtgY3lsDX6QoeQh6YT@lists.infradead.org
X-Gm-Message-State: AOJu0YzEEd5Grc8nGV238uGuj8tB1Rpi67JmB6j/ZWYDBI1CsB5Y0zIi
	buFpLa41z+geqUp8oOFm9r20fGNFpq00nyn6TVXDModPAm4szMVb3bT4JC7TgJxqDUSo2+Fwyr8
	0kQS8z36ygMSXf/gxt9zNjv0ZBVfi6/mJqQUwYQ==
X-Gm-Gg: ASbGnctoC7CTVDVvfzxcaC1BFrNix6tYIEhnGYWNbhq0S92gMq8zjOAW+ntDTgEDTgl
	SN+jAaPsA4L7M1npMW149KpzzAfIOQ/pnjdUL
X-Google-Smtp-Source: AGHT+IG/nVzJ4usllSB7WeL3esJ0/+hz1rQx2YNWDFn17mueoKalfz6Uj0tzGOzfhZRqk49pDpDqslNG3Jdx7c4EaqI=
X-Received: by 2002:a05:6512:b97:b0:542:986b:de08 with SMTP id
 2adb3069b0e04-542986be0a1mr3961478e87.26.1736857034594; Tue, 14 Jan 2025
 04:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com> <20250103-wake_irq-v2-9-e3aeff5e9966@nxp.com>
In-Reply-To: <20250103-wake_irq-v2-9-e3aeff5e9966@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 13:17:03 +0100
X-Gm-Features: AbW1kvYSSgagqOIiggVP1rEX84eySXcyOvS8Yel1NcZ50o6oIQlw1NaD7KnQIZM
Message-ID: <CACRpkdbFtLhGXwSbCF+v54eEdm0w=sDsseUPiRfc=xmak-DbhQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] rtc: pm8xxx: Use devm_pm_set_wake_irq
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_041717_010478_B56F5028 
X-CRM114-Status: UNSURE (   8.50  )
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

On Fri, Jan 3, 2025 at 9:42=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use devm_pm_set_wake_irq, then the 'driver.remove()' could be cleaned up.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

