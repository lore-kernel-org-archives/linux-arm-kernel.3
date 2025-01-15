Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58547C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=plabT5XOu5+ZpcIlnaN3N88l9zG6oPXBDVLA38xbJrs=; b=e65cicllGPJHWMyNb5JVdisIad
	z2hzJUW2zP14CJramwS3fIWqMkZaFpDMgiG8c5A7HTwPxhFVPp0mYqqUW2/HXUvVeH48/xTZAEhXs
	D6aLf96gsmFiTfJXEqMNzhjQmGHoPHDgLkrcmSprJz0gLo6t7RIdbFsb5wyQUH3GrMpewYaXD6VGb
	JYT7EnFfTTY3DLGw6zg0x3NxmtI+qrDU/455lv580f07VGKN2vPxpGY7RWCw/f2vWyrjn0RRhhduH
	+O9jVoQpKiTK2qAAYvDcx+andWQM9x5lphPhVwNdmgKNS/HJ/apVA/dpZVt2TCfUk/Slf7nduhMpl
	85YpazaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6Gv-0000000CRum-4317;
	Wed, 15 Jan 2025 16:29:37 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6Fd-0000000CRc3-3KBS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:28:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so3800057f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 08:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736958496; x=1737563296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=plabT5XOu5+ZpcIlnaN3N88l9zG6oPXBDVLA38xbJrs=;
        b=h8Cj4gGyVeYeplVJYYNGnDix66LStXv0WCjF0bu487XUigUIgaY/1fklI4bJ0msMc9
         Zmm8R3T0dYSbYOU8MjgIks2l3Kj1ZoDVrhD8djvq+V6V1vllUFv6qXKa05RwJolmE6uf
         dmeFuxYUnKv4Nzdb7obYtCHGJjjVTMwX0p7Uc8ZwkQ2DobiLn4h07CGZuUKpA2oK36Pj
         H+3zXodVcmvyn9Uj+fXzyCcRorS2N4i8MQBt1xowpOBeL9iFenK7Pq6p3SKJqcCO2IPr
         bJbg9kwfMWBK4wtpLZO74f3ZjuKgvQh7RDjVcnFilFjHS4HJktJ2QVad5PeUi3UrmX06
         kqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736958496; x=1737563296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plabT5XOu5+ZpcIlnaN3N88l9zG6oPXBDVLA38xbJrs=;
        b=p1EKOKaikat01X79EgxK3sgI42Oi1Qj455jz2lbm2kuabUs3M35W9MUU5HrK/WQ4Qs
         e3BrOXlofdb3ll9AL1gg6F9x1+K9hAlFipc6jUBnNYyIjlejcP3Y/L4yYM6DPzbjOuSD
         kaxN4sDEWQ4f5nJv5CaTVkMeL7TuD/9AhXFtpQg48GECv+CnliC2+WDtG7hyaJvfRmAt
         xWVfbwAoqP92/rfUmsGP0WPk6O7edoqfjdie/5B3aFLNDAr6V7jFsoHdViVNn5dY/gSh
         1yUgBU7KEhx5qXRhRxcQ0kp5Gk5K1QBYf55OXKISc/WPyWt2aOhOfaUZoPsGaDgpbLgF
         Cf0Q==
X-Gm-Message-State: AOJu0YxnSMgbbvqDdTExBk2fECSRK0QO3y7lmNhBYW7o66nxbVnOQ8XD
	U+ZfbUJysRIKv7E6LOJzoKkFNLyVKcASG298GDv+J+beH3ATzUNSUkBvASHKJxqJdpRKfbnzWiX
	j
X-Gm-Gg: ASbGncs7FQCKwA5QR/ouMwazxMJn/Yx5iLnUKWVXRoSQ/syyIzw7JshbFMAA0ADqcz0
	vY1Fnl0C9O+Fc/mH74f0eL5BXJxUDwf+uWIMkCTjXcJKWrA+Lr3V1Lcsxf25fdri8gY1uZr+s5o
	hKsgvXZKAtvBpEHjFqmguXBoqXv0hMwevvRYqvEQQfH6453O+GsQMU4F5k/gk3HSrbBCN8FhEPn
	qS0+3Af65tATttp20t5pRS0EGL8I1afpYwqw9xhOmZCd06h9NYgD0E=
X-Google-Smtp-Source: AGHT+IGNo8LXpgSgdL9clzeN/N/p3MAEgP+iCFETpGf7EdJHOdrmZQh4369rW7qAYW0AC7M0NetGKw==
X-Received: by 2002:a5d:6d87:0:b0:385:ef2f:92ad with SMTP id ffacd0b85a97d-38a872f7f80mr27383119f8f.10.1736958496035;
        Wed, 15 Jan 2025 08:28:16 -0800 (PST)
Received: from pop-os.. ([145.224.90.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ac61csm28620115e9.14.2025.01.15.08.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:28:15 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	broonie@kernel.org,
	maz@kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] arm64/sysreg: Sort sysreg by encoding
Date: Wed, 15 Jan 2025 16:25:54 +0000
Message-Id: <20250115162600.2153226-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_082817_885562_4718A394 
X-CRM114-Status: UNSURE (   8.56  )
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

A few small fixes and then sort and ensure sysreg remains sorted due to
the discussion here [1].

Applies to next-20250115 for the review but I can repost after rc1.

Changes since v1:

  * Use same matching mechanism for both opening and closing tokens so
    also collapse those commits to 1. This now allows trailing
    whitespace on closing tokens which may have been hard to spot (Marc)

[1]: https://lore.kernel.org/all/996c7843-7f51-49a0-9122-e688e37f9902@sirena.org.uk/

James Clark (4):
  arm64/sysreg: Fix unbalanced closing block
  arm64/sysreg: Enforce whole word match for open/close tokens
  arm64/sysreg: Sort sysreg by encoding
  arm64/sysreg: Enforce sorting

 arch/arm64/tools/gen-sysreg.awk |   38 +-
 arch/arm64/tools/sysreg         | 1010 +++++++++++++++----------------
 2 files changed, 529 insertions(+), 519 deletions(-)

-- 
2.34.1


