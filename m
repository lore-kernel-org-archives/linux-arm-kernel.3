Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7F8C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 08:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxwhW/LgIW3LqcR+Fr+P20a30aa6bLS3i9JEuWlpNNM=; b=n9jgbSoRaEXZlkq0l7e0rf8id9
	RrrCsKUf0g4Z7YKGjijAPzRA9aFxy4nHlkYqqLljHFzc970cz3KNBgXoB//rgTMyRJneK6DmdfogD
	OkFxuZyEAt5zBTDZsZPs3wTpHxrjJYZlelsnVr/9P2VHDs+mQNMTBR17OCkkAdAMF43UC1cf1iAiy
	8J+UDOg3MhtJtLpG79iIoyHNM5T/AzdyUmHjGo7zwlZMnsZ4/ftqUY4kSHqHhiuu5OdmKwkiVa/dM
	of4DZtUoHvPuD+shlOWwTwxCb+kU5OiEErxN4/JUIjhZ11kvWJmoepM61On/GtlFDChG2GhOslJZT
	rgsyoWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZ9i-0000000EaoC-1znd;
	Wed, 06 Aug 2025 08:05:50 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZ7C-0000000EaVy-3btK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 08:03:15 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b34a8f69862so3850234a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754467394; x=1755072194; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxwhW/LgIW3LqcR+Fr+P20a30aa6bLS3i9JEuWlpNNM=;
        b=Lxxs0odpNbc0IrEk9ZEU9B9f6k1gR00I2VlZsEWIaj4Bz0fqAFZ1rw9bdlsp0qYrd7
         fxACzFYtbzr6o9Z2BlBxvzTMVjpvdm2KWKzpIwjkk/MZkh52piCeUNacfKEPYNMm4/nS
         CHAAzNVta10UuNnG0TXuPEDfp4aow+C0Jw0XvZHPl+VA2T3zuD78s/Q5rk6R1pL0O36+
         0Xirutm5XtdRneZbRFUIQd+WR8dqzBfD31Yd7Fd3K430aX4hB+/S4iKCFyKIYGCLNc6k
         VCusWNLPAczToivkFxpDLFdM4DyRLI1Q2pkzEHHyWG0+i8/zma9wABD0zRI6v2JhVWTa
         +dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754467394; x=1755072194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxwhW/LgIW3LqcR+Fr+P20a30aa6bLS3i9JEuWlpNNM=;
        b=CR2MQ2dpA7ka0iElkLVb5PxjtO1NXd7xV40QkkXTWF7xC3SGSRFJi3vKisfKr+VEKz
         /I1OjBD/qM/a16JSdYwLcyFczy9u78JNiW2jGuouvhzdCsYSx23iBsnH+ueBh7r+kDGI
         vny1V21AwQfwPJ+1y6JvsYyplSNNOxUZuDkT28ydYNt3zolByTib/3qCbYYpRjOK0WfM
         Lu91lXLMMF3YXGjzjJr2GircmPf2pvv/q4qmHy2G8fbcjxAK8vEQCEF5EucnteUAV3JB
         6PPTNQWcwwV72QDGq2rwdp0X5B9qt9WSk2ekh3YrSsneNpm5xxcMy0VIOLKv0H31o6PN
         s5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+ohTNctt9GPG6Fttw6R+CU0zmQGUgsHjU6ptslcUo9fMdll+/AbWWCI3WfaDONUOiOSOdFWtqlu3wBNVIW2dC@lists.infradead.org
X-Gm-Message-State: AOJu0YyF1IxFUQTpyYnYnYcVRQBPAqzc8oJvRaGySFtA2FG+JkNUzvTt
	i8Fm0TrY3D493kjzUKCHPQpeo4YoxAb1OfXFrK3TPTqIiA0uVldYY2Hj5HAx3mUnSPlEYN/hGfR
	/W95d6yUMXpfHBMUbJ9fwCgajNNCJh6g=
X-Gm-Gg: ASbGncv4eMH3+vMQbeUbovICGkytdRtR65qxYAFKOXD4liR9BU0MUtdAuIC3AHKNfJm
	hhWDFMg4rj/mXRR+b9SXmkAZv2J4+3KSykXA94b4PBtsvcBHTo6yPyikcBEve6+wAe69cTNEnGC
	6RKerPIaMJkXXQJ2NdqX3ICfiAUccZBxAUvAp9FvXiaQ6NWC1u/bDzUslaaqviC9jvvfHO2aKAj
	qR3
X-Google-Smtp-Source: AGHT+IGN/epxF1k5Rei1FpC/BRWg+FClZI6Re5L8Wi9/3SOxZcU722vABqtiu3JL1q5hOj1GSrOTay1RynD3blfSsQ0=
X-Received: by 2002:a17:902:ccc3:b0:23f:f983:5ca1 with SMTP id
 d9443c01a7336-242a0ae476bmr22183395ad.12.1754467393754; Wed, 06 Aug 2025
 01:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <pndpldam7tf.a.out@axis.com>
In-Reply-To: <pndpldam7tf.a.out@axis.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 6 Aug 2025 11:05:18 +0300
X-Gm-Features: Ac12FXxwVAvTH8GuNuBL-sO0VmVAVyE57Kp1iye_BVOcxHVgrYKsjiw7CFUOjY0
Message-ID: <CAEnQRZBpG2gVGG3Tp6yLcueNFw7R+KKLhjOmwRa9j8rw4QRuvg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: SOF: imx: Remove error print for devm_add_action_or_reset()
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, kernel@axis.com, sound-open-firmware@alsa-project.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_010314_895204_32870093 
X-CRM114-Status: GOOD (  11.96  )
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

On Tue, Aug 5, 2025 at 12:33=E2=80=AFPM Waqar Hameed <waqar.hameed@axis.com=
> wrote:
>
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.
>
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

