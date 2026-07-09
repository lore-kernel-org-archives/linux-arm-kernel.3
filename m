Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB621C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 02:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=; b=UE5L1FWL2Rg4upKTnaGBCq4Nk6
	HmcTKfy8T+cNgeBjBw6LG9N8LtOeGnv/eKAxUB8HvvK6XqyXL6uZedPZmWhBnYRFFKt9s/5XLfH8h
	11orpjIb/lKE/UZX8AtRIenjEqdAmF8kdcF6K3RD7mVsomwSUyHLlXQ0B/lpBEtNoY1bK7mm5wjXz
	NulLtFJxSLImzD59BE+Tb1XabkBlbtV0Soovkb1SFIaS435TNk7vKNKJYyReWeK7zrET44SIC2ZbL
	hO8trnpYNvyohVOJmfHIV33Rpwb+m1Ldk76E2j5Y5ex1Dc/CUqEqrvl722jFeawFQ6sng/bOFjE3m
	PSbENA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheaU-00000000pyW-0p42;
	Thu, 09 Jul 2026 02:34:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheaS-00000000pxk-2C0n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 02:34:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cace91f112so13926875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 19:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783564444; cv=none;
        d=google.com; s=arc-20260327;
        b=CAR7vpu3PLPXogzR3r3OKiRMucCe2axm6Tc44WgD9NTf0qzWVV1U0NjT7USGCgNfL+
         sJhlx3fa/WXvclcLK5/j3j7wgKq8OftEG9TkGGg4vjUVocypbTsnXKjjNMrhvtJha/Ot
         ZBXa19yag3q4eQnXhf934x2NUzGQOkPhFoTy5/CIdUIK9Qnr+V8IyWTlPQle52auYV4c
         XzyJDKhAOejPC3YbxynCPbc0Ii4QxznJ5rrJK0KpXdQeX5GdQKs0yoRg3XRUxF3EjGlm
         1LHa4XT072yFVRZVl3c7v3K17dSVQKUQSnth3NLbyPUi0HCUx1pSJG6N9h+qPNhVebAk
         lpsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
        fh=1ZYRILd5FyLyBOQohuGZcykJM7eRTTvd5nOCowDqDdo=;
        b=D4pKYUXzaW1GQntwKIP+qf+Hg3w+bzffN/tofNrbVZhe79bxGvLQDBHLolsla0JviR
         4/7AFJcftsrLdiWb1JJqCKuh3DM8Ov1eOpwOQEcm70zpbQpCGFBMQNPUVO/Nd/bRAS1t
         XmJNiw74HbzU1ndWN7wiSNT0YErzwISGQMFdjWI1DgxFLROSwweAQHzILtPDytlmHsn1
         gVN18TQVzH1kNKWP7RKfZhKU8wdtbcCbPS88H8L3pZIBl0PQOdUoq1Z5opYbij/uoM13
         Fk70zNXf999jZgkuie/CHkKkmD/GZc/B5oRCIUszH84HRs5hK73kBjGUmveCLLnhlln/
         MBEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783564444; x=1784169244; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
        b=dmfb7M6HFIo9jCH2WwcdZ1XZnQAZGc0Voar+j9ub30OJovKsamzu/xbem0BwYSjORd
         tiFWDDNQ1nYR8t1NKKoNsAoEbihZYowizD/V0cTH+v29Rz8Gw5sUx889kgT/FKfu2/p5
         dO3d/vZv0LX+uwAJpbH3XbDJThBGvRz8rJQreIxEGvMOiwairsxqdNq0vGv5W60w5s0i
         dEF942p1n56gYIEVZEYS/lch7cABcWkY4erjnxOPOJY8lWi+zYSoD63NzQ+ci1ef+UB4
         OjQYmUCB4VGnUgaGywIAq4p04vukrdIuq6sgHTRaLf+aQantz3vxRj0ZYBKcYC9fap4C
         rZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783564444; x=1784169244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
        b=Qbj7FJ+T+96Qbj+nqvA8B7P8BhLJiLP9d+BmY02llWMVV7NuX5AWf1cjZ1Dq+V1J/Q
         OOhRvDTQskvRFcQV+bG0j/LmNrdGylsYdH4W0P8PSDAhhYbNsli59DHfRh4+w+woun8d
         Q2MFbv2wLW4Zefo+OOXiIOM3FjvFIqH4U7nNkDESCmaZkIf3wB/QXK7cWDR/Z5ScnAXw
         t2OXEAWpZ13F0ktIZG7qtAfxNRkU6aY5QzjtUwbDOWd1kl4POYsMskLNMWzsU4eZx3du
         kwnw4AjSwh27ENNaNGRzBVQW4ER8o0CzyjZYYQzpbLo2AylI2kQ2uZHfAndBSvZQ2jtb
         WI8w==
X-Forwarded-Encrypted: i=1; AHgh+RpqzZZCBUguBQ+49lkOzJNCp0lqzbbLWH3BnG4mY+ejkdPkk9vNZrqOBHuwG4avoj8lv7ctDZOteqsn0U8seNjs@lists.infradead.org
X-Gm-Message-State: AOJu0YwjToTdMa3X+iaUSZk6zqcVdLBK1A95/9eRcDzUtNo1V3ghzI0i
	EDGZVP7bWjye7FDD3oWMtDU3Qn8FwUmrAaRYgVKbmiUDIIf1GDBKGpO1i/F1fb8/nCqLGFPBkf4
	kQyaDt7okmRojmARo83JK6gcMOVZVKeA=
X-Gm-Gg: AfdE7cmAt/Pv3zwsy89uaAuywFcxzK2FdWs28i7uK3ZqwpI8zyUJbsCOsnlSt1MnUDM
	boF984Bl5ZejlA/YBH4c6ov9asEerfgQaTb+yRZ+rupgpHTBqb6tzez3J/5Q7JOf5Jq4bqAeoNu
	+JgO/4fzGrljeEUZK7D90KIh/BlcvlkcGnOSKZ4W1G+vdelIoBPz/7iV3g/vOh0nY9fscjNaHQN
	QQG5V65NzFeOIoNWy8/yxt7js/0+eL65AS16pvvJmNANHvDW6sDJND0qjgtK1gmvNJCLPbGni2y
	YABF9uIBMn4BlQDyGbVYNQnXihM=
X-Received: by 2002:a17:902:ce91:b0:2ca:ec6f:aeca with SMTP id
 d9443c01a7336-2ccea3847b4mr47728935ad.8.1783564443676; Wed, 08 Jul 2026
 19:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260708141734.578926-1-phucduc.bui@gmail.com> <c9f7eaac-9bf7-408a-a4a6-56f3ec6177a6@sirena.org.uk>
In-Reply-To: <c9f7eaac-9bf7-408a-a4a6-56f3ec6177a6@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 9 Jul 2026 09:33:52 +0700
X-Gm-Features: AVVi8CfyewtsE3QT1H6Qb0mhvtRsc5zTxpasaNVBWAckYMH2ZTVpwhyO0FrCTdA
Message-ID: <CAABR9nEjwXufG5FyWm=ExiDEmpO50U8Tnr6yg=CSFPo3SWrJJw@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] ASoC: codecs: Use guard() for mutex & spin locks
 - part 2
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_193404_561972_F1CDAD47 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi Mark,

Thanks for letting me know.
>
> This doesn't apply against current code, please check and resend.

I'll rebase the series on the current for-next, check that it applies
cleanly, and resend.

Best regards,
Phuc

