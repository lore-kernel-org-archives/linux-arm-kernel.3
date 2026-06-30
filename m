Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71916C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=; b=XwDBx7hRgnO2GaWzZ+ZnSqUNkI
	7/Dins/a/z/UqWXB5tDk+S/odhDmXb+JY7Ck9YFu8zhHKX570HtUcxygjfgVEOSS5egQvRP/4RhVe
	AvBww1ahaTa1kvl6/q1UWJR9JYMTnkeezXBSDYTqLQdYlEUzN42fuk97I8c7kObyl6S/oT5K1wUTz
	L27EsHQ47+kYDL1ipvb/loKH+LXH6GiRK2o0mQOROtFBk15aaAZ2s0CDbPmOWTK5uGV15ZOGmlZM+
	1waJsRdV8646fVwYPIgi39HzG6/W+h5cRr5vP1vgkJrnYiGhPMl4dZ1zjpIhdzhajv+xOUsemH+OD
	d/ByfkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYrj-0000000HDDO-3HLB;
	Tue, 30 Jun 2026 13:51:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYrh-0000000HDCX-2cfU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:51:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c9e89fded0so21706475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 06:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782827465; cv=none;
        d=google.com; s=arc-20260327;
        b=A12WXA7xluI2+OxWPe/B3dLbX4oCla+s5PWe26JJ1OZ8yvnNHwj7jaWVJddqaigcQf
         /zoRvNh2TmK/RUrLMYlkz5y2nFB8P+bQVvamhaeRcZoSC64/ctQ2KHr0H6yKqlYyW0d7
         KzfRklu+j3r/czhdOfFTM5qtcVo5cTducySyxTBGZs8L/9x2/B1gwumJ2NDZJBVKhlUq
         VrdncT/mD7XFi0NXXqBIEbFs46l+D/lJncEpB6ybszazw12WWHoNgtWmCTCnsAshhJ43
         Y6mTKo39U+hslntlF9uXe4XCurjx/u7VcHLkY0jaYkhuBe9JPgQcQfTmkCf1WSMY03mg
         RlVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=;
        fh=UWuImj8qG6lrGV9ze3GUwSFrVn7PJq8ho9MnYsNEPcc=;
        b=ArDpK/CcD+qTvdpyS38MjMrl38qsqW4s/z3p39roiJd7R66P+i7QnvoAOqxPTPcXHn
         zDrFSDZKxFOf+w4nwZn3Cdr4RndNE/eyuaJeugncIXwkUwOirNL8q6U7Fkgb+eBbej0h
         Mgi9YFb8Na6p0qxwsU33EnOtbW9q80dAt0e3xHuo1QhIV0r2SayPgH5t2GgM5u4SetGl
         x6rlvEwDBeiq/67/ML4MPou19kT64Wh1cfuu1NPcwr/JWHuwfT4Rg2qaiaGdHemCSpbr
         ZjDrm/WwQwEa+JxwfvpAhIL/xb/9hNZ/SXUuWUUw1hgfy5kXOzLu1q+FQ9GGqHOzHMUM
         9yUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827465; x=1783432265; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=;
        b=DJtAoLt27ujmP8HhvpWWDlgPHhV1dp8Xh9HJ0GW7wMKhIpZo8KobCNCUfCF0b0j7Lx
         1s8/K4U32ektm3VzcGSWvOK2bgW+nAwpWDsFVnHkD5JfRw8XkLqvmuMDKSlkExzwpZSK
         ehdC/qXwO6P5Cpvx2Cxs45Yzlh6OwyoLlU3ueYp+ad/3yILFqJRvmVJ0+1ZKwqwHtSwy
         HHHVPRJonRTOdSjoEsYfXCVjU8GW05cWaoI5oXRDurUJgDxZ0ysI/EQR3cB8gjRwQXGO
         8ePdqAyVQBaRdrPbg1icpjS8bLZYUH+4PPUx0/E+FfSfVns4stBybQhIOveUwXtNv1hN
         zl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827465; x=1783432265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=;
        b=h6Rcp1GEI5MgMQQ2mv3/rc2fC/aeJc+t4FT2+SNu2wuZzSoKEsvHyrNMeLCmZyoPyn
         HXa7gMp+v1CQRu3WD1ABKOcsOhCGt8Ttx54jPR+evOyxuwm7WER81bYisjYNnvGJ7O87
         +m9wsvhc0HAZIM+vcifWi4Y4cIpZ2I1VcrPycIoh3W8YcltIFdGtvnSslyIqDSB+csk9
         K4dwVlUkx/tFats+QFDNMMcREaV65Zejj2ooCa++M/ApIiUEB6AzGEqRCph+UxNZi+RS
         E3LMKATGzLrzOy+Jam9/ZD4kIG3ENiatH2wShTTXqUmyAJVJNFQKZg7F8o3vhYsf48MB
         AICg==
X-Forwarded-Encrypted: i=1; AHgh+RpoOc4209fvhP8GWDHxaN3SgvqPU3+2NPmwic87qkMjvLnC4SPGlboCbkrdQKdyX5DgThEvBDQwFXswypHZCkJY@lists.infradead.org
X-Gm-Message-State: AOJu0YxnJZI6qZP45wYk957tge2468CN0rQ/SBbbq23MLUwJSTyGucps
	6LhKW4n5uJjfnE5AiwgKLsJ+aHHbPpGzOwusTLP2angRsG4i6yM+Fr7tFJx1jtXmhgo4ft2mrDa
	FPX7pCLatixxc5CFET6Jnh6OWSsecmkU=
X-Gm-Gg: AfdE7cn9/1QV8A5qzcdKCZVsfkiPcO17GxQj/jS0B9dLzxDo7HubXwzw0NAqNPO8tMp
	W82eeR6z3pEXzJKNu7cCb7AgJjCIVyPqhT3Ze8Il0lihawQEgpw/1Yvx5c2+61KSArJ/qYG6JrI
	/MzUIVDP3xvcsfeO2jtW3Khgl/sBPYPxPdrc9spGsypvc1Qq1W4RfXj2d/i5Lov4mHH2oOwgyR+
	kuoM1D0UAY0+FQJWxm5mBPWlwJouGhGgZ+6oY9Q8gwBEvydTiSo+vApqtsE5c858pJRs+L0+n2N
	5ZYoFj15g7dAJe+SUSnLeXX/KKu+MohNOhM6NQNdjOZtlJusYiWJDfwxoB0KMQ==
X-Received: by 2002:a17:902:e947:b0:2c9:c517:d078 with SMTP id
 d9443c01a7336-2ca2ea32743mr30876155ad.36.1782827464698; Tue, 30 Jun 2026
 06:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
 <20260630063449.503996-10-phucduc.bui@gmail.com> <20260630092821.650c30ec@bootlin.com>
 <CAABR9nG5Wo1Wb+2_T6dR+6XTw8Vs9awSpQrSZ+k6=jp_ogoGCw@mail.gmail.com> <f5ab965a-9640-4df0-8108-7877f34b6950@sirena.org.uk>
In-Reply-To: <f5ab965a-9640-4df0-8108-7877f34b6950@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 30 Jun 2026 20:50:53 +0700
X-Gm-Features: AVVi8Cc6YVwHmJJJBcmL6xlBLsZj8Ul3JarMT_3ATDvT8NUt9u8sy29ELCp0KAM
Message-ID: <CAABR9nGGTRTWTSDmzZ4OcXmQ1zmWgnm8yPN5vM1DFLyn=AgwOA@mail.gmail.com>
Subject: Re: [PATCH 09/27] ASoC: codecs: idt821034: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Takashi Iwai <tiwai@suse.com>, 
	Nick Li <nick.li@foursemi.com>, Support Opensource <support.opensource@diasemi.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Srinivas Kandagatla <srini@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_065105_659420_32F2533B 
X-CRM114-Status: UNSURE (   9.79  )
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

On Tue, Jun 30, 2026 at 8:29=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Got it. I'll make sure to trim the unneeded context in my future replies.
Thanks for the reminder!

Best regards,
Phuc

