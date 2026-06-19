Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BD7CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 08:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=; b=wu7ZJWNTF9h63WvUtH/VAwZnUZ
	WNU/QUQQ/TZAXJ0qnm8s2+EPqLYLfCtEGJXAjI0OM7MHd8UMnaPsCpcdXyJLLjC7meLsFLHbASMck
	avtrIfb/ZVLhd+jwzJf8ofuhCo3U9eM3KxnQXXkbAAd5fq1Gg/oFsN03O8+PAjQs6UWz2mlO7wv3C
	w3DUzFSKtIoay6IfJ+wWObl6/flYBKMaSNhj+G3HqLD/DiYe0x7TMAwqMSHaQTsZuonGUJ+wLZ3mB
	zklJY9HYO5RYPNjqj98t16j1UB3hKHfaXp4tWobTFU4nDsc24c4ZUQ6kwwgNucoCq0wTgVHcKR8Jz
	wMRpoITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waUYY-00000002A5t-24Ez;
	Fri, 19 Jun 2026 08:26:30 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waUYU-00000002A5B-2nCH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 08:26:29 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so1176651a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 01:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857586; cv=none;
        d=google.com; s=arc-20240605;
        b=I39WHKfzt8C1yvFST+AkO83vRYVer6o/uy5221C5EIo5a19C9SQ1Nodzjr7n3GDNrm
         v9CfQI6AyZmLf8eYb9Qia1+/+lQoNGIAoZblr7Jza2bEjPc8NKpXMtYxe2TnX1hk2psA
         hBUWUI2LsNwOBNpR2e9hZEOsSYVp7lL4YqG+TduYc/h1tYFfaUnW0PU70QjA+8KXQAxL
         CcjcMZjvSM6mgk905Sx2DEsLrlSI6sqZeN5QziB/qUgmOgM9ofzeHwEBOrC4SL2ZSG37
         3OW74pRfE39YLb0YRrjSEHYSwWugPKa5pem1RllK/88XuIN+LC/per6zkWTR8OALqcKG
         xqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        fh=LlN438IrnDxM0Eew6DgUE/xtN3GrkOwvoKI8tMckL2M=;
        b=Sjk8U52h+EOASW78ccrpgggYrPkKegriscKeOrwD2se5AW9jEuiA9mQ9StI5PuSGPM
         C2NRsYvKAKgzATavD+DLjXCPxq1d3iOugJjyD1soSqJ8vJ6G89mVpzYcDpuJQNjEPS0J
         MXgsYaSP1tf4rSfQ76RzZSTvdy3d4K+KWxU1gyYPsnEmiGXP6KV2m+myQoRbzKp0dWbj
         bkzmJ+gm2YpVnLCyKrCvTFDf0BqqJpYyE04YOivLCZqP1Vxzp4ObZh7TNR24nCK2SSfF
         OA3fQBj75nkYt6ZvyAv9aAK1cjNppldTVqHmA5/BV5uDwaVkSqydcipcWol+UWg7EeMh
         eG0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857586; x=1782462386; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        b=QE1ceRddATFlndeHoeSBODOL6K80L9Dd0FvFLawIXLrDBu9yWOqHPpWg64w0i8Y48W
         OPzNHJ9h2SoqbMY2qOmwsxz4wd+JKufzqVf7O+Y5L/JOH7mAdjxAb1BO2FNahan+UX3U
         bx26SHIAIAyLUdJHhVWN/625qdl5LZ4xOILzGxkfHpRPG/k8YiyKOYXQZJwxwJI7eOqR
         EYvVQ1I+2NlICLa2SWT5opZrucCHMZH7dEMZxF1l5FhDWWiOTz+7g371vtNQ8RwcNn8r
         +ARm97hZdZohrucdJKgInjzDuVHmntxE7bqTf9o4ps+Qj8fRMy9fO8rV7X84b5Z24JOf
         wVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857586; x=1782462386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        b=WY/OmFxPXIVRzKH8lGcEbyxV5cgPUA574YHRRfXJoOdaOmY94TXJ73jUH0fk4XWvoy
         w4VbE4kQIvYioXX91ygMUFsruIejkkmH58+Rb3g+wW1bdj+uZuXsh/xVPDqvFMVGqdHn
         n8R5tPouGPMrQf0DZYV2shOrGEBgw4gFWRZcoGjQ3Z/v0ieDpss3IOexVpfFszhcKj7k
         3HEY6Y6KYj8BVd7VYrjd49t9p0v9lgfw6P0yGrJF8otILuHGoljqWC2Sn2jVDS012CbL
         /ZyWHrZsfKwJMEVfdeK3aOCFylDQ9dSl691qOsNKrgPp169kc5RbFeCnhr7sT7PwPgX+
         WHxw==
X-Forwarded-Encrypted: i=1; AFNElJ+BtEHCSZ7fX8DFfBaH8c/7c6EyrpKKgLKdf2uyxaM2sOTjxTji0JChOleO+0EPVrHx66+3FKzJTP+Z8k2nwpnG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx83EfgE/R5enORRc0ZywSk44sIFMzgUbbXTPGdXT9/3JIEzmho
	loqSrFyHIAhp7vVyy5kHSPK+2250B6DxMgik8qvi+tT6c2kl2yRgvzK4x5MFYj2u2ZxAOvaLCWj
	6nxR5gOZT4fP11YPclb57INhh3NZ9hO4=
X-Gm-Gg: AfdE7cly55ML4QPKzUT8VEJtiKQWp4ib5ipnxy9faHlYYMmir4JtXLs94AZ+NujFRhr
	d9Pp8PoPdySUe8t1cDg1hIADwgEUErDk9bP3Lbd/7x4S61F8obeAq05btzWPs+wdbLDaNuUPrYT
	w2aWw5KNc21IlqnzbMi9IusZtB2uvO1bLjylykDvaA1qyHTWM/ZDyxdH+MxNErMnkPiZ+05BUJO
	Aj8rIQ81gGNStOHXjbYSALAU8UAMCvSOxj+E5CXQt+WDZYOJRW+AEW43SHdLH36ODmXcKwgpWfR
	CluriFZ1XNkyu2wkkZWxmi8EXlM=
X-Received: by 2002:a17:90b:35c4:b0:36d:cc9b:2f67 with SMTP id
 98e67ed59e1d1-37d1e8d2625mr1979109a91.19.1781857585816; Fri, 19 Jun 2026
 01:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-12-phucduc.bui@gmail.com> <ajNud7QkwF369lBY@google.com>
In-Reply-To: <ajNud7QkwF369lBY@google.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 15:26:14 +0700
X-Gm-Features: AVVi8CddXW5ZNLmY1o-M3ykiX-yfQTjv2vw19gnq_6wH9bwOdl1r4oKcoEQ6Mfw
Message-ID: <CAABR9nGVAiUpnmnoszLiNDC9ooXx8e9YFmMhv5aWLfaik8tjHg@mail.gmail.com>
Subject: Re: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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
X-CRM114-CacheID: sfid-20260619_012627_836926_8D719F8D 
X-CRM114-Status: UNSURE (   7.43  )
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

Hi Tzung-Bi,

> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>


Thanks for reviewing the patch.

Best regards,
Phuc

