Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A515C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0fTEoeFH2CCKRZ2GxYERj8nq+92LKFVKj9HqnOJJLg=; b=B45oQ5Krc/ls6kwNwIxFW5BsWa
	M+R9CFGBD6ZHwB39pjwBAGqr8W0lSdwCbYkfq3JSgudsP6oAurf+o6ikXqWT268X4PptPdQ1/qYu6
	idjGxyLiqgU4WIRcpniukfDBPdFJZoeYsMa5HKeKLgslhQ+PsRbAdFbpJhZIoeZLpm6rBHy8JJX39
	5jjvFWfYDa/LTX9kU8BTQw7muNrPgLvQ1aYFzYTtidvg0U/zPFk1xy1GJMNJYFngKXoTnkSU31QiF
	8p7/B9oopBllK2cPYy3W/135q0ljzCuAxAjlZO4bOZY/Ciy++JYkab2GLxPxcSrSxqOgBp0+CPacd
	w2fel8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiCQ-0000000Enst-2Z2N;
	Fri, 04 Jul 2025 15:19:38 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi4P-0000000EmPK-0FhZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:11:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a575a988f9so641838f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 08:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641879; x=1752246679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0fTEoeFH2CCKRZ2GxYERj8nq+92LKFVKj9HqnOJJLg=;
        b=YFDOz3VazxCgrPtrm2sha1Zucj0emFZWBYq9Et0rDfEbKx+tyLf1xPMKN/wwFRTl8/
         V8mZ9tpvtb8m2uDXwpBxP2mG0ruGL+2MqxP0FAOpBUTz4bCWcTHebO7LWXqF2k7iIDPG
         CQzoiUDCyNDV0fNs0bibVmK6QJptuGznuF8bFn/ILY8qvNDyMSwQz6Ur6aiHwym0bhBB
         7rgZDHWZvt4C/HOf8iUtz97x0NkTY6lcnytbiiPX0qdJrllen09H257zd3ET31F4eRyh
         +GEYdvERxJ0ppOU7VK+Z9iWDxUS1vkLVjhJQJ7iraZJ4S/+jKtcSo93kGRdO0xayiLrZ
         LELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641879; x=1752246679;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0fTEoeFH2CCKRZ2GxYERj8nq+92LKFVKj9HqnOJJLg=;
        b=DuHKYSrIpPeaIIcvQ968nNzexC/bsZ2pcE2tK/VBIDOTA5CbJrJLUHAq2dvznReESN
         bho+F0UQh71TybkGhQU/hTsvVtrT0BZlDz8LC1O6sesAaM5SPsIcCrRY6u9RESi0W4V+
         hQCYEqMOO0He7Gqb38snzfeEfZ1apI+9lBptcd4H4Rnq+aT7hJhQAmDqSiHHiR3PGmmw
         vY+IzklENi9uNaihzqtRuU9+F9ypPrdOEwQ42Tyw1TxOwGiJz4saMlKQpPSAegReSS/1
         V2HsFKtoVY8ZnS6Rf1+4gfqrvlQTmwuBLkG8Z38Gn0izU5bIZTV5otY3Tv9mb3lAODkb
         Qw+g==
X-Forwarded-Encrypted: i=1; AJvYcCVCnu1UArh3+BMvoKpD2ibHIbrAq00qtFo7oj0Bdlh037/0fD6ehwFWNDfKvixjiYOfSaO1HM+xgBCLGvSjdDjD@lists.infradead.org
X-Gm-Message-State: AOJu0YxBHgBKCBqbdMcEx0lqNQ2PMjhLN4R/zwWj3+JI5YiP/pJXv5qC
	wiQVbe3ntIiDpaJ4PeluPmI6HB5mdu64VFYaqhhsdOsAcOTb5+TlbDT2nn0hQvV/icE=
X-Gm-Gg: ASbGncuNFp8eYlpSk95U8mQRFsHvtHvJ8j0H2UST4Gjjw2IZxroBlAonizZ/89Lx1Mn
	0Fua1hlKBAuqciKE6BXi875pRJw1Kve8kxfnSzo4s2ct1U1cr1NcUFNnYgcElzjAbn9p96YW0iC
	Zt4gG1W+qToAgoidG3NM78BJR0bLLhdUjPrisuS6hS7qES9muwP4lYs4jgWwv1/Wm9VKrGmIprK
	aieDvtgE3FeRXLqrG0iVNocjdvy7eF+bAxhgwBU/xhXKBVDY3sYLCnOMUi7xozTTsNPqgQdGxBy
	vr/ogcxzMAOjRQ+3F/570+nPTRvf7JVKbzL/a9pqX1wZioRt3OxDkaCPv8oQcSFA0cZod1T+gJ/
	eCoV0dlw=
X-Google-Smtp-Source: AGHT+IEK4aTwZb/t+iBAfYaNAla4w2TjyMyeRG101P7FjyngDibQMih+NwFX/4yVby7V0AceGcPGpg==
X-Received: by 2002:a05:6000:1a8c:b0:3a5:8905:2df9 with SMTP id ffacd0b85a97d-3b4964dc1famr2429125f8f.37.1751641879342;
        Fri, 04 Jul 2025 08:11:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470e928aesm2675416f8f.44.2025.07.04.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:11:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
References: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/6] Add support for Amlogic S7/S7D/S6
 pinctrl
Message-Id: <175164187861.2868628.1382846991470897290.b4-ty@linaro.org>
Date: Fri, 04 Jul 2025 17:11:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_081121_119862_6FCEB30D 
X-CRM114-Status: GOOD (  14.53  )
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

On Tue, 27 May 2025 13:23:27 +0800, Xianwei Zhao wrote:
> In some Amlogic SoCs, to save register space or due to some
> abnormal arrangements, two sets of pins share one mux register.
> A group starting from pin0 is the main pin group, which acquires
> the register address through DTS and has management permissions,
> but the register bit offset is undetermined.
> Another GPIO group as a subordinate group. Some pins mux use share
> register and bit offset from bit0 . But this group do not have
> register management permissions.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.17/arm64-dt)

[4/6] dts: arm64: amlogic: add S7 pinctrl node
      https://git.kernel.org/amlogic/c/9291207753c733dcd9f1c08749950323f7f071e8
[5/6] dts: arm64: amlogic: add S7D pinctrl node
      https://git.kernel.org/amlogic/c/bd42a25d696e0d5ccc9e27de388d4ca9ff52f710
[6/6] dts: arm64: amlogic: add S6 pinctrl node
      https://git.kernel.org/amlogic/c/fb183c8d7a5a90cdee953701d8a5b92642a2e917

These changes has been applied on the intermediate git tree [1].

The v6.17/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


