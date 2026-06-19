Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA7FCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=; b=uM8ioAHmOTBfW2ueHijwRPaZgA
	8wNHbfa7A1rhKJ710xOb9DllONnYRmroxSi4mP1nqVkjokicBC1XxcsW8kmwkgFCuk8g5pFbBR+lb
	lQnObAIMVV3qZx4hVz7tSI4ZsnvfS/uqfRLRqnD3mRiJBJJoi6siseS8KD2H64I+stcqxGU051cyt
	Bwc3WrNMJWqMN3f7H2H2PZ5uPcYRpCdt/IzT1kDV2ym+kl3P7Tu3qAhC1u+hZA9fIL//Vb062pSQk
	ZqXPL9g2nqyfadap1HOViAuKcf3CgGeb405Da9NGPDa5DgFZxTH+zJATSU8P9NqgrnL2XV/1bDME+
	XxuqlXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waUT5-000000029nB-3hbJ;
	Fri, 19 Jun 2026 08:20:51 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waUT3-000000029mB-3M2X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 08:20:50 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-842338c18e0so1306130b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 01:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857249; cv=none;
        d=google.com; s=arc-20240605;
        b=IHoDINMBWEZOuYTk6+cdHm7C0PhtBUv6sNmUolzOa/q/hvecAro4mBVxThy13Ntsa8
         IurH44YNyxVHNHXTY4EUTPWN2O7HRAWb7hXszgbu3CJ+DdcckZw6hTDZ/MPzNg7oVavP
         /GxQQEY9AmLig3otXBpqx6DX+KAv6x8PsME+vTUW7a6Qh3BADUgv5JrSX9S6YsAA0Ahi
         ibzVX25RC0mnu3tTF8Ladw/EKdAKY9/EaP98HnJDeLebtTaGczF5AEpLvmXS9Xw8BaUd
         l0H/dgiFrdYuySVV0TE5VkCe4IztkOgGNqmiEObXWSMcpRyL5g1gGDucM4NRNnLAMcjj
         VHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        fh=BkAj++S+KlV+VIVsC+P0gulfOUdifw7cfS5fyxA9LJo=;
        b=ZaOOLeUxmKRolgMiYwTwcNcE+T75KixDFgRcMkHnEYE+Drck/LymPtddiKX4giep1s
         kU/mWgReDzdYgFTIWEAuPC3xgKgE2auipZnetFBcmp+NdJTtk6aIfvVaVOAup32n/gcQ
         q+Xw8HJCzeD7RbpKk2HOreetuO/MLGHX6eK6xsw+EFA8PlU1sAh/9SWxUHmwtaOxVI+s
         Q62Vi1nlpVSeGJ2SXDl6pyV9j+pl9RV1pMk+ClymH/kj4lirH+LFPl/Q+iAOxcpIv/JZ
         9/egHITPo2UHz0BnbQUnEBz1OY26ZzmiWSPtfr4U8NuM/o3Emg5PJ+lkzTQptrhOHBkp
         pXGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857249; x=1782462049; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        b=bgmsX+6L6BaN3tbpdj6QFj/RONp5URMdTG9qMLYm8ayFT+3/xcjDQVJAtEnuCmKIQV
         7sginPFn70T4WYORw+VcdPBDw7oT4XpYFJxbWU7Sz3I+cneub99naNd/hBLjKjWRJpnm
         7r3katNMCDwBytLI3UGSr061rNqbftVIN3LkHqJ7wMgEPviEcFBcyG9rRY0eHJOqfILz
         i9DYubwALuiSrrrnKNPtiAp0qs6uTKI3olsWUMO6KCrPC0thPHcxhJ4zM95E0+x3j7qn
         MdOzXWERmizH+xN/eG0vpdMI8RRGWfYC1T1SPpx4kmfKb37dtKMD0QFU4rpUCAAgwKBz
         Dmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857249; x=1782462049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        b=iyK906BZc686wUOeaFbKLdRjvg1eqRzbx2XZ/MNGRVKHeNFR8eVVxpzitABGULDUi6
         NQHzO1ie3aDPK9Ugt1oZdCffvXrgBtMIQA8IfIZBmqZTfHNnAxLBesig40StgIWpPHsN
         dmgQe3NVTd3m6az+//0qlxUUxIBuKNoHFzuJ2P13pXyj6X1hhOvgMdYATYnBMoDusOGy
         0dDRINjaVa/7Qnyu+yoefuWmpfxWemYCFP+w6eNCAAf8EuT8HJ2G94f6F7nE1gYnI8Go
         C+ByO9joBhfX3AlPU4+FO914wkLFCSzjo7HjeItx5tlBOjeF/XYGLThTyqtRuVp9Kr0m
         pcXw==
X-Forwarded-Encrypted: i=1; AFNElJ8srEEx0MPgPnFYEGpOClPoWvoMnh71ZQC+WbeXuYmU8961n0bje95+3qdSQ+9X8Tj4t7O6xXVf0mi6eZR7vdVB@lists.infradead.org
X-Gm-Message-State: AOJu0YzQsu0H8cdZv7VAfK2pL7dd6UdWBjZH15EC81VrnNzh3tczOMeH
	QZEhCaMi+Ap7pzsMyeADpDaxTv00zDZj7Y0iFdNf6qIIQRF1CJHqNCjvAqAFoOIyPjMFXoaKSwT
	/OXINGUk4wEV3IQSGn+rnEKqV9MS+K9k=
X-Gm-Gg: AfdE7ckUI67Azu9w9m2GjJfWdmQ572C7jAjClWkOHHDHc9RWJrbi+il147JlchaeFjj
	RkPuBoFR+Cvp6hN3xfWJa5TSE+Duig+YuAEZm8aZourVKvGLHacYbhD2CLSrQgw1nb6AXnJyiuZ
	0+eHJTEpbc4Axy7QeL54VxLmGv6jVMUaCALs4G+5cqeSIvwypWR0O7WJxEujOtw1gJthf+/j7qy
	fbsYwITUuXnsv8exIHToUKftNp9B76H+5X1eJHG+EpoRvrhsAnCi6KMycRYNgb9hBkPreclLD16
	rRwaXhkXNGz/uL/1AgiOpg7mPh1RyaVHS8is+g==
X-Received: by 2002:a05:6a00:3cc7:b0:842:6a97:52fb with SMTP id
 d2e1a72fcca58-845507cb50emr2639722b3a.18.1781857248942; Fri, 19 Jun 2026
 01:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin>
In-Reply-To: <20260617140209.3f89706c@pumpkin>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 15:20:37 +0700
X-Gm-Features: AVVi8Ce6D0PT5nT0JZlv3l3sVJ8JLAPJbKAWX5-seLq2FMr-NiEk00n-taoSGeE
Message-ID: <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: David Laight <david.laight.linux@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_012049_838278_3F31E024 
X-CRM114-Status: GOOD (  17.54  )
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

Hi Charles, David,

Thanks for the review.

> >
> > I believe you have to use scoped_guard here, as there is a return
> > from the function above, if memory serves it attempts to release
> > the mutex on that path despite it being above the guard.
>
> Indeed.
> I believe clang will complain.
> That makes these mechanical conversions of existing code dangerous churn.
>
> While using guard() (etc) can make it easier to ensure the lock is released
> when functions have multiple error exits, I'm not convinced it makes the
> code any easier to read (other people may disagree).
>

I built the code with both GCC and Clang and didn't see any warnings.

My understanding was that the early return exits the function before
the guard is instantiated, so it should not affect the guard's cleanup
handling.

Could you explain what issue you are referring to? I may be missing
something.

Best regards,
Phuc

