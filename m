Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0982BCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAIc6gY01YpxCcQ99z0flPHCre83HKOO57mvnvOjC0A=; b=fAF4Pvi1W5Gj3pc/FVS/b8IPHo
	xaBONTEYlk07ELYWMN8l3UB0qra5sROc4sHdnocL/8LIon9kp8x4J+TVVjoKSDueMi+/887p9R79V
	AgomkdwIpLymuyyXPbqavjnDNWrd1cl7ebudGYpMJyXfpmLndmxdVdeLbb0RQvuYolFxluERA3qcD
	tptoYMiyc+LcXCFxwBiBtHuut7p7S4779owH1EVnAB/UhBoOmCVOIPrkqah/k3eZMq/wVHJ1opaMc
	9mil4Txo+MiH7/CRxR0AN+vx5vBophtG/VzGV7Y8He4De2nTgPKzUQybZeAUPT3p4OKxnGf5yDFR3
	XtmzFjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmoW-0000000CkzW-0UiR;
	Mon, 20 Oct 2025 10:08:28 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmoS-0000000Ckvn-1ycN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 10:08:25 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b3f8d2180feso63868766b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 03:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760954902; x=1761559702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAIc6gY01YpxCcQ99z0flPHCre83HKOO57mvnvOjC0A=;
        b=QVsdGU7ibBWifMYjKDDAmPIX/WwzykRsIk1vYaQIsRSuGESpWpRajHG4+FBxtrMiys
         vTkB/C8f1Z1o36iCEoNAtmEc14M+FCzT+1Oer3RYKdlN9Yimwo4Bjnx8AAt3nnlPZp/L
         eokce+HrQJ/1ifgRUevAG/NkLCP7ykhcA5bnWj+XF39E6KAfDaLajDrFnp8cpeWVws5K
         IHI25g0xLSYoh+m4q3Y8UttS2QkvsAHh1wipdUwq8Ee/GPwJaFBRPo89SAj42oYrVBK3
         qxCe+3PoKiB7+vqd0gOUrHF0WyD8ZncVjC3KXJdrlD+FD5GjCaA9oIgUvQ66NNb6s5A+
         DrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954903; x=1761559703;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAIc6gY01YpxCcQ99z0flPHCre83HKOO57mvnvOjC0A=;
        b=XJf0GMecO3QPrd3z+wuByHFAIZg2FetL76IV81pk7r0v/tkZOe4NrSfOaAJM2FnlqZ
         +NWvEnJFPM/qjp/cB/CSF3LHWE925hZ1UVaKy8e5ZApSxRRbew6gBu5j+jzRfsxN6inJ
         nVlQbNuXk39/kLDEeXmih/uLVg4JNnKjja50OmJKDogSR2YDSrtarQy6e1DAtroGJwbn
         530THacAGHO0M+gvyZuZOBfHCvwfqTc4eR2h0uu9uG6FDPD8y3j8UNNNZMP0ft2iob+g
         hQ0ToMBswKBuioTSSYVvRqoyzD4kUUsx6G0ewgmTijjjv9FP27w82Ox3dU6ewpzFAhWr
         N2iw==
X-Forwarded-Encrypted: i=1; AJvYcCWU1EL/U6x4ptJwFAP4eaFN75YY0Vbn8X9XjX3YtpcgU4kBjw4z+P621ZfKTc2vYFJy8jgOlILQihkRfy4xP2Hz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbb8PHVrI+dWoWz+IS8EEvzJ4xX0fd38sKM7+0/5wosTnSI857
	+fcYEThKMaM7/KAiWnOKB/R6xfEI3/wI/zK8yR/Zd28h4N7iA1CGVmmxa2O24vYGsMQ=
X-Gm-Gg: ASbGncshZX7sPm2mQbOTckEvSq0LSazS/gUGSpRunc1MN1Octi66JtqecTY6o10Pn4j
	KG1g6mPioOAmRCZu7u5h5kNXcQnX0JQiVNqb5HfVYxb50ie1mNu7K3+ZhCxeh/KHKWuKzYGA1je
	1dPZEgr890bYmlGX79SjY0PCNA0BRKGK7jagrTVrjGGqUWpkX+klVptaCeFcR5Qr7NYrpjmjP6U
	61/9U9dXO3I1mSTgywK07ipOJviOwGLnEitV/cPUZRlZAD8FJ49E7brvEByt/GpejnragCCNl9o
	zmNw+tVMUgYrIs3xoPv+udgpCmnP9rH4hRDsZGV//F2c3EC8ItFLGcKSJodmKnAsPhKTvB2+Nxj
	KGd7JQwh6eynpA7ofXM5GnU3LFY3BjMIrtoW09Rgkj7qF+RiTBAhS2xRNEvVgLgYHP9atlLq40f
	zgYv0p42kpw6C0w/af
X-Google-Smtp-Source: AGHT+IGbEPDs6ivtDg6VzwLTuv9vaft0NZuSPujUXbh434PC4DZqXM9ezasAKoGltsR6KlNX0oCeaA==
X-Received: by 2002:a17:906:9c83:b0:b3e:c7d5:4cb9 with SMTP id a640c23a62f3a-b647395aab0mr801507466b.5.1760954902572;
        Mon, 20 Oct 2025 03:08:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da33dcsm753414466b.12.2025.10.20.03.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 03:08:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251010-power-domains-dt-bindings-soc-samsung-exynos-sysreg-v2-1-552f5787a3f3@linaro.org>
References: <20251010-power-domains-dt-bindings-soc-samsung-exynos-sysreg-v2-1-552f5787a3f3@linaro.org>
Subject: Re: (subset) [PATCH v2] dt-bindings: soc: samsung: exynos-sysreg:
 add power-domains
Message-Id: <176095490095.45974.5198951258133478877.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 12:08:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030824_526039_9923AD50 
X-CRM114-Status: UNSURE (   7.95  )
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


On Fri, 10 Oct 2025 07:29:01 +0100, André Draszik wrote:
> On gs101 only, sysreg can be part of a power domain, so we need to
> allow the relevant property 'power-domains' for the relevant
> compatibles google,gs101-*-sysreg.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: samsung: exynos-sysreg: add power-domains
      https://git.kernel.org/krzk/linux/c/ebd2160ee6ff3e8e4c7b17b45380900307a34b6b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


