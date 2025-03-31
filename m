Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BDEC36013
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0EIRXaMi7x8XYwlCWwiW2XCs1AbE7FrNvdFZNLIYyY=; b=M5VGS78pjPu2Mfqshh6ePM2jwp
	sOJDgQdvi06AgE4JIQeuHzVfmIE0Cx1qzqq52A5g0bJs3SnFz7ClBNrJ9ZX4zGOn0dadLru6DEVMS
	2c/SkjxbJ0NVVixePrZKCVBAF9HEacFPpq276RKq/qUAdpdEYAQZJ/0A7mlBiWdX4WK1YRMx058K+
	HR/YV5wE//pHqL8mJNjN7WCLzJhuhh7dR1u2VcVX3n5fDh7eON3+lMZ+AXhZaq1m0qdQz2d/8Xcpm
	winZR+5tQmtCify+EIjmpyKFgNBsyesz9+rUdF+j07+aQGzObDGMvNioDliaUzWtTA+zOM8g9rqk8
	idDLIHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9Bu-0000000H9qw-1f5a;
	Mon, 31 Mar 2025 07:04:14 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz99S-0000000H9Uw-2ZZO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 07:01:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1478789f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 00:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743404501; x=1744009301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0EIRXaMi7x8XYwlCWwiW2XCs1AbE7FrNvdFZNLIYyY=;
        b=b2QttzZ4K6HC7SlpUnt1JEcvoMZRirwU27B8HGRWvfoFkbUmAKNayCZ+ilEr21cb8s
         0om2VlnSWRjts+sUHq29zGJDrZqb0998O+7EP0Ly7IYU25qxPNO//SYhQcxvZBqbbxMo
         5XTFG2tKtmK3Krm+hsANjIvBza2JPcMCapu/NYmaqPKFJd3wIGXmpnnjeNlMKSJDnlfx
         35OlUI19+9kAy7C2/3Xb8q0CDlOjXVyq/6kgppnqGxVsJkeeKWnZZHIkDjikQXaqNJ+C
         zWfEeJj8hl3mXbucBM7GOZWNmX05qiumRBpAjqMKMsmZq35puZWjCLmrjtfuofHKeejf
         Q2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743404501; x=1744009301;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0EIRXaMi7x8XYwlCWwiW2XCs1AbE7FrNvdFZNLIYyY=;
        b=bLMakcl4P3cr1VaezwTyOtXORBoMTCgacW7aGZ0JfT5TlTow7YeVWP+b9KHrSAsVva
         Aim05TYm/YnQAhbRSrRpc3qdzAnE7oH9EOHFu8e5soXMlS2aK+CvRG613zj+Rf7CIOT+
         SPCY48wswc73gOKITKZgKz9BllLKyDSNuDS/9lZJxB8SPid+Lc0Pnk/332u7cKrHvdnl
         bzYqZCIiSCY0loYTwrVsK/GzVaiQ0MtrO/A2cTz1WFIMjkTIC9B2r7NAvrRTaibdrNXa
         oNZh5ujmUv3EsKEnoo/+7+9ziJCoU2wupN4X6c/eSONop96JOPyecag5nc2Dayf0cpJ8
         yE7A==
X-Gm-Message-State: AOJu0YyXTYdJXQPj2RmqhcKkoVjv40yfFwf/NiS0NLuvSAwsVoAy6YvT
	CXW//7BPTLPkiyUOIAek7p1c92p/jdwAGxyAveDO9Bw32BNsE2GDlH8IdOcoGp4=
X-Gm-Gg: ASbGnctDokwKkVXEgpn9tZnDKgp6gbcCS+y+9kTt/YhU8rHig/iLI9piFqb79gph/dQ
	to3pUDqN020z5jUIRsdUCN+kccsWJrrt3T0AL2vrZdH2W3N9TR58l5f7VG1YpqLqyusINY4bDQt
	aPzvYLwEpiS4QNVAvlTEYpFJ/CMSHb96/Bn/ZYsOSlazjExI+nfFKXQsqlyXhMgct3F0nCPW50f
	Ti/55DLaXl++n3cx9QPSRPkLRqz2Vq4nJ6+s1NITClY7YltX69nUrjrAljf4UrWTHQ3enDlw2a4
	x2UvrlV1kwCDwo1+h5lODQRtwx2kSLuroLeRIcZpfNVLiN4SFv/b92UbgDIgQxQlcQ==
X-Google-Smtp-Source: AGHT+IEeWSQJLYKN04bNEh+7lHsUNrdL5zsVbpE6bLIsWK5/LcK1CEV9vqu2gqFuUvmhYfQrRpRW/g==
X-Received: by 2002:a05:6000:2183:b0:39c:1257:febb with SMTP id ffacd0b85a97d-39c1257ff09mr4622649f8f.59.1743404500748;
        Mon, 31 Mar 2025 00:01:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ab48sm158442325e9.10.2025.03.31.00.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:01:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, jbrunet@baylibre.com, khilman@baylibre.com, 
 christianshewitt@gmail.com
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/7] dts: amlogic: enable UART RX and TX pull up by
 default
Message-Id: <174340449998.221709.10827817044945834716.b4-ty@linaro.org>
Date: Mon, 31 Mar 2025 09:01:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_000142_667294_F77E565F 
X-CRM114-Status: GOOD (  14.63  )
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

On Sat, 29 Mar 2025 19:58:48 +0100, Martin Blumenstingl wrote:
> On the LibreELEC forum there have been reports that Odroid-C2 does not
> boot when UART is left disconnected [0]. It turns out that this can be
> solved by enabling the SoCs pull-up resistor on the UART RX and TX
> pads [1].
> It's not clear whether that specific Odroid-C2 board has a broken
> resistor, the resistor is not populated (either by accident or on
> purpose) or if there's another reason.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/7] ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/cfd9d2466ed2891bacb6319bcf9af55f21d0263e
[2/7] ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/7374b06e8099ce7345ff3afd4bb756dde25971c1
[3/7] arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/b00fe005612080772fe4f00c61e2fcdd2dea18f0
[4/7] arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/bbeb3017f1596a0551ba0ee40866f8b4e0ca2d3e
[5/7] arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/867c3760da4ebd760115f17eca0b4bd3b668941c
[6/7] arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/48d5da715331f2fd5e17e64f9e75e74248223b66
[7/7] arm64: dts: amlogic: a1: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/b85aae3714e65d7b92a6c2c28f62cf66393dfcac

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


