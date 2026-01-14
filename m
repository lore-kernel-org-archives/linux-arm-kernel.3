Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA74ED3CC87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 23:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zO7/rwLXC5yGRDXneYIJQs+eB1xaWdUmRL6MCrxGUVo=; b=dhLI2kWJQV5HY4xsIHYG0+BJmp
	dFqOx1n9U8EqvJVWvXqIu42W8roeuC4lAEhK0ACNE5SyLFagPgDFwd7aIC7556krzTyjATTCRlJlz
	pCpKznBkeRXzxKd693dMg5QsEnE7RNKO5yQ+1yfAiWHSKjxKr60tNFhiqtDgu5u9CxsOpgfgvGzN1
	wrdKfCK4r4BiWPvX0/kH3KUPzGZiWc4nnc14H4KrtM6zOSqenCaCGFWjHEu4LvM+46DIKLqE7UiKd
	nD/V2oA1yD4kmMAhDWwdq1Dc1nbKsRpAqA5pyBb1TCXD9lxs9epjYw/4sofIw6ZQo7yRVVd8lYWsn
	DQBDKqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgAH0-0000000B5iH-3Upw;
	Wed, 14 Jan 2026 23:27:34 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgAGy-0000000B5hn-1QNG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 23:27:33 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59b8364e4ccso386559e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 15:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768433250; x=1769038050; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zO7/rwLXC5yGRDXneYIJQs+eB1xaWdUmRL6MCrxGUVo=;
        b=l+7HqnX7xpWptSPjXlQGmxd0X8hWEgnboNZpN1JeqNrnP29eDPO3Qs7e/wgGaqZONt
         CzEbKyG7vSMCnjXZvl6XAZs6I65+fIKEFwyrrflizeRyHO1AEPeBQM+zI+QfwkJ2yyZE
         jTAx2l1QvXI6eMaR0CBa925PMLzS5qQ+HVIJLkTGNviuM4SWNp8YvATf+UXcf9WsYqkf
         T0X0m52hruXX6Dl0sDdsH/SGvdF5YUf9T51b0lh3Lq4RjitTDqkHlx4HIf/cdkXAM702
         /olQxG/mTIrmE0/66RV6IHJhx++u+tao1nkk0FJ3ngqujLQg+JFqVUJ6kpKRHpkQLsNd
         5suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768433250; x=1769038050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zO7/rwLXC5yGRDXneYIJQs+eB1xaWdUmRL6MCrxGUVo=;
        b=a+n8yZYdtHaA5aa4JTyeEEDdLwf9os33MvUI7r0N8gxIOdl9gTohrOv4C4wDZAP0k9
         vwtdgHq8b6cTCwjvv1IW74sAdr/ruFXRkKvRL0QvQ4ej1qn2ZIt9fgpOcc0Q4Bc/2Vkr
         EKIsytOjvqxoqsaZpmrIrTq9qRo2MA64R3w+65dDhnQCWOBx2kmYwEWh6WVct1hBRMrM
         VsJtvN3nUVZYesalY9U+BcJWQ9GiI1BpuI7drRcRErGXlMp1svHaudOGeT7+EBH8NqhM
         s9+3UU16x2BEL2xAo/i5+NYY2/7lJled8E6k16jVnxN/SHnkDY3/TA1NTfuEg7twcthm
         WdMw==
X-Forwarded-Encrypted: i=1; AJvYcCUOLEbX6+6UBcxdunrbxH+GsnurzO9dZd0Xa6LhLx7apKXcg2nyWnPxsBH0maLUmLx0EVNG7PocmIjmfKkKnEB5@lists.infradead.org
X-Gm-Message-State: AOJu0YwaFbwUiQS9DqADtE5U870ZfSssYhw7JRHBaK5HxQTpA7ffK9Om
	5niftKjtTt7Z49MFMNbKqSDJmLqDzmR+GPm/SJqkFqFyp/SKXxqgvPciZwc5LAdF7wuaFhMcYu7
	zDJ9xDG/7x2VGhKOf4RNPiQYTObWETqY=
X-Gm-Gg: AY/fxX4PMdB9biPfMInYjO/vN2Ktflq6LfYhmPR0XFnEz04FLBAsXuS7Yt0yHtTMdp2
	EFapFPQ1ePBECL5hcbOmbFph83BuvoV92VrjYXlsBXy+KfMd5FQIhzq20o6Uyr0pFMSrkFU/wT4
	Lge9go9oFi5EXHeM73r7K3vK65jPRU++EOlQgDnMfjLvGWDbM2knpGgn1bLq8fcYS7fRQycvHqE
	G40kR9S9Xu+ROXzQQs5bcUVYrrgmWA01pPjs3OKFr87kPq2wh8mDC+j3lo5AVpRzEoRdCk9ubsI
	7TlL5Gco4+nSM0FRCgTIWoEcdYY=
X-Received: by 2002:a05:6512:b90:b0:594:25a6:9996 with SMTP id
 2adb3069b0e04-59ba0f5fd8bmr1478472e87.10.1768433249392; Wed, 14 Jan 2026
 15:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20260114-mxsdma-module-v1-0-9b2a9eaa4226@nxp.com> <20260114-mxsdma-module-v1-2-9b2a9eaa4226@nxp.com>
In-Reply-To: <20260114-mxsdma-module-v1-2-9b2a9eaa4226@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 14 Jan 2026 20:27:18 -0300
X-Gm-Features: AZwV_QhLF-nZE9rj0D3-1M6Zo3V1EfOAoeRCu5Cv2BQMtPfiN1SS9FZTgf1Ap2k
Message-ID: <CAOMZO5AF5-=-2F2W_U9=VbkwtBp2_hzKkJziefLeufD97xNj=g@mail.gmail.com>
Subject: Re: [PATCH 02/13] dmaengine: mxs-dma: Use local dev variable in probe()
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_152732_388954_6439CD0B 
X-CRM114-Status: UNSURE (   7.77  )
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

On Wed, Jan 14, 2026 at 7:33=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

>         ret =3D of_dma_controller_register(np, mxs_dma_xlate, mxs_dma);
>         if (ret) {
> -               dev_err(mxs_dma->dma_device.dev,
> +               dev_err(dev,
>                         "failed to register controller\n");

Better put the dev_err() into a single line now.

