Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EADC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yVS2DxvHD6yUudCrkjHs6rrK9Ytf0bOkYEFiIp/66CA=; b=RRa/j5HlBB7lxLqmqAKlQuLW7C
	iHpFJei3aU/Ud+9oEB+SZObqkwGTfm5ccI5KgVBhmLjsqHzPqyxSQqJfBaTBlpz2T6kJuuyj+Jur5
	lyeR2TDxdajcz8uz/08pxpIjCnavyy86Azb8WiMoH5Rm4CRbgG84wa02yYFj1HREizrMA1uxRP0D0
	bIDqgqJDz/RKr0QdAeNSssPlkE+kw4JXcYJ5Ja0BwsRVcuVDIqsU7MM+kGuEY6+Rwt6LV3k253Cj/
	JXfBtm4imRs9Otg0pXmwmXVkjT1VKgPMQifvMHi+WL8ilEXdcgUGiQqh87GhNnev0JHaEFKsSnE5P
	a1BgKafQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGLz-0000000HXkv-18Tw;
	Sat, 15 Feb 2025 11:28:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGKV-0000000HXGY-41HN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 11:27:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso19214765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 03:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739618845; x=1740223645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVS2DxvHD6yUudCrkjHs6rrK9Ytf0bOkYEFiIp/66CA=;
        b=cX+LiPLxTYI2cxqqOHUS8qzcO5es7mhoRGMGiUTEP1FbQk5Ix3cq+5Qh1zLKVQsmJi
         HaeTo77dUfB7qrASS+lQWIxnBHDWBNpyOR+WJRXojd/YtAv0q3rImKQoFE1vHLPebfT9
         6WUFG2mYTRi5Bso1QRrhhrD2EcWj7lafQOg1rdkAtqt3/PYl2iTwkO7DD7tXEOHCkgqz
         5+iwS0PMWmEnzjTFHq9vuZgzDyNElaRyaJn3Ymx1V0A42Ky/+c9HsTWquj0D/f7AfM4M
         qhZamJ0heIB7g68uL2X98EZlyD//RpQEpcSgJ0lrIyJaM+jciEUmLJEu3fWoDOfBZjSX
         VBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739618845; x=1740223645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVS2DxvHD6yUudCrkjHs6rrK9Ytf0bOkYEFiIp/66CA=;
        b=jcrwBGAaiD7bS/ObjmI1AWjGGGPjZBSyXZ4JxNFck8anA2dNIjN/uVq5G16yyulO0w
         RwVDpNo22didp2C3SC/4aTS47sg7fbhdpX1gXFfJbzkdH6t8mtUKOzF8ZRfOcwsp0mpp
         DeVXPICrhdNLVCUP7qSL1wTLpSyXsLXE3eTAjiGySK5EwGzfY0Vu3WwOyzY0u2n5mSfr
         3I33LAcpEnIHrxL2WNjuqFjh3WayIjYH7078SUwXnCC5Ifg1xFGN+/S6jlo9zVNn/IjM
         epeRjMB7fQzba/kA+L/wXEXiWjAD4Xc8SOUF2H5a1chBia3sQTC8RZ4EAQu4bk1sTzai
         PELg==
X-Forwarded-Encrypted: i=1; AJvYcCU8Ze0VoG5u+lbQVWyhJHFYynIPYwiJGbrSfKLCYW6Dtdv3CCfWNUxUJZNg5NtgjToMnZvm6jGH2SLVmDKc+UdV@lists.infradead.org
X-Gm-Message-State: AOJu0YzyTsqlXb5vqd/D+q4fXR6VrQ2RlIw1+Tj8zLF3AlP+Meynym8u
	hCmBbkQtiLnunkING/Li1T0P8U+0JZBqCtpmqibP79P/9VnFiXo8
X-Gm-Gg: ASbGncvzE/dDTpxaQuGZ8L/Ptb//IQs4KrBv+eOoqMPHyEXTcu2qYyXorkf9lNK02b6
	7G8W0fEnLaMn0YMPIZO3ghZ2dAQoJpK4E1rYxxxGxgQi8j7shToxFDXsqEIOmmegomtm9lBiN+x
	/muK+tmE7IFq6NxibsVBi/+vvF+Wn4YnHL7hdL+SiZ5uefSw7I7prUuiFLqITNENMKaQBCCilGc
	AsrxtrmoKfvonL++HbK7zNF85C26V+twytv9jaBfWP7cs3W/G7Ihujyn6qunU7FUXL2ztvKVxty
	i1Vb95HafsdhLmIhqQvwN1OOEq/vr6/y3GynohqaeMheAZk+8jBbfLgMyk7h84yCYcs=
X-Google-Smtp-Source: AGHT+IHqBZSYw3B766xIjrp2tq1OGtdCNjggCpIhHlT6iS+NJOby53CON5BZSmUwfo5u1sxNGPAgvA==
X-Received: by 2002:a5d:6da1:0:b0:38b:d824:df3 with SMTP id ffacd0b85a97d-38f33f2e90bmr2976717f8f.24.1739618845304;
        Sat, 15 Feb 2025 03:27:25 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm7018841f8f.5.2025.02.15.03.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:27:24 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] dt-bindings: soc: samsung: sysreg, pmu, chipid for 2200
Date: Sat, 15 Feb 2025 13:27:12 +0200
Message-ID: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_032728_001243_74150156 
X-CRM114-Status: UNSURE (   9.15  )
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

Hey folks,

This patchset adds support for chipid of Exynos 2200, as well as
documents sysreg, pmu and chipid compatibles for that SoC.

Best regards,
Ivaylo

Ivaylo Ivanov (4):
  dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for
    exynos2200
  dt-bindings: soc: samsung: exynos-pmu: add exynos2200 compatible
  dt-bindings: hwinfo: samsung,exynos-chipid: add exynos2200 compatible
  soc: samsung: exynos-chipid: add exynos2200 SoC support

 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml    | 1 +
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml          | 1 +
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 5 +++++
 drivers/soc/samsung/exynos-chipid.c                          | 1 +
 4 files changed, 8 insertions(+)

-- 
2.43.0


