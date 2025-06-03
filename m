Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8C4C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oihVtB+1SEPxR6wMy6kxrIZOmkj3G4LorB9xvDbO3Qs=; b=jq+wzXFcgT71d0CHqqaG2vHROd
	RSQK6S+bxmXZEtU9WaUwWZiDZ4gtN06L4iX7mKt/X7aeG8DZcTR/IB7/A8fqGfCGs54ISskcj5Sf7
	KnYh7L70Oi4zfLbyr9yfGTxZaESXlRs9sPArJvIXLMbjytj0v1A0HFgvvBsZJGQsrsG0EBbjx5vrh
	vLHQFVQk4zl8ciTsyculRy2v6u6iZLq5jcZ3B+H8Hy2Ujgg+4QxtOXYCPkBZwztNwL+6DAIITYW9M
	jGcPbUZ4EfC3DhMIx93pV+a46IbyNdUCeReXpORYpM9zLdx0bkUvN4OIFWSgqf9ZMM/WXZdiDgiEj
	NlBZ2AIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRhi-0000000B2E9-0Pl6;
	Tue, 03 Jun 2025 13:29:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRfV-0000000B1yu-3V0N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:27:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-450cf2291bbso21322435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748957224; x=1749562024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oihVtB+1SEPxR6wMy6kxrIZOmkj3G4LorB9xvDbO3Qs=;
        b=JB07zlmuI+Zrfsq1xEhmCkjdbQLjmC6WZ3+lYhlUeKwwGQs3OXseXB04cZ9YpkRg5z
         Xp/d5gEWnrqbIHfoc4Z7fj8notY+jKt2yKltC0PKrsW0QcfURudy7hoOmOL/klNXTrSn
         k0Taxgy8/0xEwjedVI8AN8f80j/gVBC9nkMLp4+qOMcM+TJIXRQYTs0p6X5YjIV2VbEL
         CyTml7YAzxCmirn6nLXlVujUFMGbjZ+UtMxH38ybVzVGKtNo1aGO/DW0fHH5lLwCiAbd
         M0CIapUDzQBpVJkEDtXcXb9ae7dCLzSMwVDvjtC4bc8QJUTCA2nm8ufcV8xr6pZ8gW3R
         sF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957224; x=1749562024;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oihVtB+1SEPxR6wMy6kxrIZOmkj3G4LorB9xvDbO3Qs=;
        b=bJNdvnhvgdWVJWU14gIoKKlzrZkso/sZWWwUwp8kG7aPFw3MJWFimXp8UBWuHgE+zT
         1VKt0/WLKVULOafhBFrZbt3WMFIRFap2nclslhbuFyMvGjkfSxTG3s3yN2prRBfr+dXx
         EkaHyKtBSL1nMeWB+aEJEjsF3EKA+T3WDS7Gm+W7tMoExRNGzRRkUkDGQudebTnC8tVj
         fY4SgguBKQfYAgofEdPrdtKjbM/BrZLLlCvfIwSeqdTt184g7dE6ZNQQlMxSUTMELybh
         Uxj6S05Xdsz0hySdV8jaFlsakygFFo+DmRl7kOG9qRDYP+QdaT2+xoeheqjm0jS2jrfr
         YOrg==
X-Forwarded-Encrypted: i=1; AJvYcCVJVwoulzWtFoxGNZouEHmRVMnm9AGCfzowX+9ef0rymiqQRDHuAaDUi+hSftuqvzhuB/8tZaK6Y3kkDXm8zqV2@lists.infradead.org
X-Gm-Message-State: AOJu0Yymcm0/OmFp5e5s2jL8+DvRZuooHE98+tRhaC+ot3fPFIvvmpDp
	4HehwENaFD0GaDBocDCJf32vKYozWmaavq1A6ETYfgLT7y9lb7VM9pumOSQwrKKIiS4=
X-Gm-Gg: ASbGncuLOHSpxkZA5q5yN08CCohrvuojo5SfJfizBxebVod0FeqoTjB2joEGncD5Jxr
	tMh4SKMMroNfCY2QYkUGWsS5jILd7IoxKdC7Q7jVojhbMo7PWg/kDed3hAW8owZyh6iiWulHWvp
	SIAV9PDY1EJ3oCfJYXfG6d+Vw1ykuVK5s7AlPt5RelqGdHC30HzyUcM2IwhgWdy2+LFUk8pWAV8
	A0v2V/kwu3A7CiZfwjFUUcGhaIQByPLuEz2MN01jN9ehV7GXZgKLji21Jvrx8qh+VszSmsVsJGl
	OE9iAupfE2UBEtMKjGfCQHWN3OiMyxtFDk54OUswapTLPPgT2zSnopLfuF8/Z5XfsTTOWINjfHy
	C3GGSMKI=
X-Google-Smtp-Source: AGHT+IGa7mbwcZXtdjmxN4fEKLTzriqSJh2XpWZKE/sUSl2iqQEeeTppliDDInLxLyB5zAkgBnX6bQ==
X-Received: by 2002:a05:600c:4e0b:b0:442:f4d4:53a with SMTP id 5b1f17b1804b1-450d64c322amr189283025e9.2.1748957224078;
        Tue, 03 Jun 2025 06:27:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000d8csm161701305e9.24.2025.06.03.06.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:27:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
References: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: Align wifi node name with
 bindings
Message-Id: <174895722336.2922018.7146209463305009352.b4-ty@linaro.org>
Date: Tue, 03 Jun 2025 15:27:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_062705_887205_A2BF6A64 
X-CRM114-Status: GOOD (  11.00  )
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

On Thu, 24 Apr 2025 10:47:21 +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.17/arm64-dt)

[1/1] arm64: dts: amlogic: Align wifi node name with bindings
      https://git.kernel.org/amlogic/c/117993fc40d96ee3a7697d916a2a0424467e9dcf

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


