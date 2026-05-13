Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CD0CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OjILpIxhty0m5xDC2n3oCru1zYqs+0xnRTwGa41TTw=; b=syMcL6MFj0ReW4vI0OKa1ReuU9
	N0ML3x04CAiGsFnwbtheQKqx0cfmbRtczlcCCjn0AAODRkJd23pHV7SCKRvsY8lZayytS5tGJF4DG
	0dCSdZu0DXA/VdD6CbFfvUfSTtYLHH5vSs0lGmcxoWtS+qjF8583P6kXA6A1utveICPsmeyWZs4HO
	vI1p9wIVqyZTmzlhezkGRZSv1/Z8LOvTuCiTuW4SvUO9sO4xikkq9qTBqbhotsPhoousPfQ0w4SP0
	u1JSkc0elzFJgbLE3wuof0WQ4Klq//uoD43kUrsKFZSIc+JfkFm9ul1Ia+cG5BBNQPLzTapjVKY+x
	1Uh5lDAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8pp-00000002VUU-2jgs;
	Wed, 13 May 2026 12:37:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8pm-00000002VS0-1Zaj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:37:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so60114155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675824; x=1779280624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OjILpIxhty0m5xDC2n3oCru1zYqs+0xnRTwGa41TTw=;
        b=p6uFXVreZ0QNXgB2aaSoUXOi3q5d9pYTUEtMCvlucrDTuWEJjp+DYneEQGeVJhlDKz
         x7pa1qF7oeabyE8UPLY3yQeXVPv26QqoBFBXRnBIuRYbKvavoatOC1Z7vkDyTOCIf0gM
         o8cxrBGJjtJnckZk0jj0VQXehkEjRCKN3yDyYPXp7Qy/NTRsm1kOm1gXHGOb5Th6hmbe
         rDXOW6smVaDSDBerM4PuGdKrfxT37LxES5T8wO5mB5ZlGFQaZsnl18TDE8LVjXPhDAUw
         NXzAq26dWgzPtlEOvHWUoSXZc1R6AWle5QKP5Tcuuo1utU18uMrkAG9vHX/w5Vbkl9sR
         4PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675824; x=1779280624;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0OjILpIxhty0m5xDC2n3oCru1zYqs+0xnRTwGa41TTw=;
        b=Dgw3yw15RR0fGBdGXIRRleeiJq5JvFo9bnFwKsK4vmE6o66uY3qOBp/KnvmpjmUcbY
         PLfhihACgXyQrr2WqcKi9LZDDTWHU480Dh2lUw2e4ODY7Kc1OBfczW0RpJG60aOIseus
         OEM7LDFY0pp5pN1V9Am4jwmenrt3Ujbl+8zWrWkcIHdf0sT6Ljs7hIRbDV7ZOp8qxziC
         i5DtCZYiQc+WC9kbtGKy5bVdwp6vHBsgjoLY+44aSdtqGHYo5jWWYM1n4OZoTHfqPpLL
         Cnz3tVq15jl6F1sJxXguiKnJJ109tEZ7TfT9mZl+qxltz21tVv+78lvr8JIEbVlXEg85
         h1Qw==
X-Gm-Message-State: AOJu0YwMD/pP7d9DQFjNvdEwG9uhKvOLHc2mS4i2YG3GJjbAgATSg/kC
	kbwXYlHoLiHRISri1AQd4GduPMPNdNCxBZzm1yk4uf/ttmEV8yt2lwtWdaz3VMFDjnJshpSiBgQ
	W7U+Ru3s=
X-Gm-Gg: Acq92OGaixY9EiKQp7Yv8q5j0tF435W+5DfCWaZNEkFFkHpxG0MfwiVvq1j0Qk/mYps
	qewIonTNW7SXCq97EIEgWnhyQPu94JiLk49K5UnS07hY53bPLaJF0SoI9jVGSJk9t2AYPzKl1cD
	7/QBntANkqPkPzEz38D0Ni+ThiHSUDjtppK/D/qoUGTeg7WWxHwHDf8wEu5jO9eQfBIPUsivksQ
	bx3MxA0G7AzHm8bpo6/9fqVxaO+UgHN9nvffcbnuYnM4b1Ur9i8+jOjgUJIaiB75aOgT6tlVc5c
	avO29Er7vCp9zBF+p91eGuV5Lyard4M2qDh1FLxtG3USeu8IzdngwyPKCFbBno1V29GWIbsX2B0
	05BRzFnyVKmo4ZpZeUfwP7vg97KAkaoNVzSaklBniRmFIe+YVpNgMq/8zNYP9F2zebKnR0kjqp1
	wWZ9le4z6Tfcy0iXQzcXx8Aq8IvOCa50NPta7hHHwBV4k/
X-Received: by 2002:a05:600c:5246:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-48fce9b5f95mr42872205e9.3.1778675823502;
        Wed, 13 May 2026 05:37:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d74536sm75006895e9.15.2026.05.13.05.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
References: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
Subject: Re: [PATCH v2] arm64: dts: amlogic: t7: khadas-vim4: Remove
 invalid property
Message-Id: <177867582268.1433419.12828948814232574314.b4-ty@b4>
Date: Wed, 13 May 2026 14:37:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053706_453277_2B684A9A 
X-CRM114-Status: GOOD (  10.74  )
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

Hi,

On Mon, 30 Mar 2026 14:11:21 +0200, Ronald Claveau wrote:
> Fix introduced invalid property for Khadas VIM4 sdcard regulator.
> 
> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not allowed ('enable-active-low' was unexpected)
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.2/arm64-dt)

[1/1] arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
      https://git.kernel.org/amlogic/c/6f14ba3c3fa3d67b72e052f431f6776470eb2cbd

These changes has been applied on the intermediate git tree [1].

The v7.2/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


