Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7B6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ArM8tPrv2uh4KdQHEvgTbozMB6b4jdDuY+KtgYWF/fI=; b=yqlXQxt0i3Swat
	PYrfvqsjGH67zvzAsYjX2MPeh44BfERvR0q9SYhSPhaWSqTYmZyMx4Mb3Iltpq6q92bGVRm5l8J2A
	1QAXw8EDc73NhgShci/MG0HWeT2oc1gYHnZ18W9Nq7wuzD3mDcFAdNnttzVy/UW4S83WW8d8/b6NY
	lyX8GwDvGOkSA/0h3JVdUm38+Rqqs/UEou5sAoijCfBmtiUzBqpiQpUsZHuQ44+BdvHAh5Gtzsi8l
	ff/KZvU03n11hrqEM32d+5e36dW3Q4Y8Wd94lDO0GHpMgs+ltKOBCaP/MilSA26r2VrIAvx75j1P+
	GWUXjw2H1Xc6hcNhsXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOava-00000004g40-3py5;
	Fri, 20 Dec 2024 11:12:18 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaCa-00000004aHQ-1Z3A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:25:50 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-386329da1d9so846475f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734690347; x=1735295147; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ArM8tPrv2uh4KdQHEvgTbozMB6b4jdDuY+KtgYWF/fI=;
        b=RfmLlkdUCxzWJTMPWHQTdNdR3n82L+QQ6KmHRGiYoQPtGk+6rgF3Jv8QA+aNnp23F5
         qwo5iafC6id/CjFZCssE+PPiVi5mnEdDP7Ww6zWmF7SlqrpWj8oB5QmLQzAuFDG2Vk8b
         +Le++SjZ/V0gt9wx3btKCghfKNtLuBjgHT60Ljr7Calem6kWRkgj8uLZa0/faAAdij64
         EqNYhTrTP0ddbzos9E2ayrDT99Qhi2Rb20SH7c5dClbtYQyMWoF5ticy/2NqGQgp+xju
         DuLt9U2zDa47zLaZbh1CgwiTWx7U/NxhV4WuZEObZr+u9val6YN2nFpU0+fjxwMtkose
         QMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690347; x=1735295147;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArM8tPrv2uh4KdQHEvgTbozMB6b4jdDuY+KtgYWF/fI=;
        b=FnsN8vKvB9kcxQdG77bG6PgozzvHXLUi1wQNqwcxP2Hu3dVOO0Y1DS99nAKsM7Bz1U
         pjDnB2wu1rxqYoGFOL7ELOl61uVhu26hOlbmNFR6FK7DD0JtO+XenoDyz3F3wGqRw9pQ
         ielLTMBDi89KXOlqhdOIn+jqr1h1TwQNSBxHYZr15ttV64uzcBdemgE2kLz+BjPYE+S6
         IRr0jq67b02+3Z4AyLLXavkeVhvF0E3uuA88RuNlFSLEmSVN7AszDmhdFOSBDsJuIM/j
         x23rnrE0pjib7fR1YqrLaqISdLpFq9gxjUz1FQM9rFw8Ct0TQe9cXUOyZN5KpP8OxwRS
         qH3w==
X-Forwarded-Encrypted: i=1; AJvYcCUGZTKawewMZUq9bmOKt11xVbtR1RFowKhJqd59aV0iN9jR3nYWSc91VXBoak5/nDIPyKWzf/CovC1yo0SVfd0B@lists.infradead.org
X-Gm-Message-State: AOJu0YwTg08Hnb6hf6TzSlMhs6uhP7WcIBiM4dTuqNk9OgopVTfRpeZW
	7+naD3FHEbK3jtd9jSvrf5xQlYLgk4g52Kg3n5j0UD/oQXxYsMNqhGXHj7F9QbI=
X-Gm-Gg: ASbGnctdqDKxfQNtuJ+ltlkx+cHVDNLZd7YjpMtADCv0wztBWkhxRG+YXrMGfejYbHt
	pG6ipmFofE+xAn2brsiz9sRNgL+JbMOEllokzu7YGiC61VKRPg/B8Qfb0kHLMR87igdfIL+fOTU
	ojx9/lcLFuNGyLV0BgmAypn/RZD83Pf/+JGxINF1QxN/MLsnGPxUSRiExLpMQfADsD9DWVgOBm0
	hSy1jt12eE6raiih8ha1zWS/TDio7GB8vj+kVPTULEwA7lSGkzFAcWYnGgeCghNEFpqtjE=
X-Google-Smtp-Source: AGHT+IGeDU6I3JVYEfSem+J2xV0n2Yi6xG+7TAsB45iwjjwGCMNga20LBdZ8QfC+b384/f/a7wLSjA==
X-Received: by 2002:a5d:6d07:0:b0:385:edb7:69ba with SMTP id ffacd0b85a97d-38a221f2dd7mr2392065f8f.1.1734690346496;
        Fri, 20 Dec 2024 02:25:46 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2b0sm3752071f8f.82.2024.12.20.02.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 02:25:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] clk: amlogic: gxbb: 32k clock fixes
Date: Fri, 20 Dec 2024 11:25:35 +0100
Message-Id: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB9GZWcC/x2MWwqAIBAArxL73UKtBtlVoo+0zZbsgUIE0d2TP
 odh5oHEUThBVzwQ+ZIkx56hLgtwy7h7RpkyA1Wka6IKxy0cXhy6sKK/rUVFK85yc0KjW2Vt08y
 tNpAHZ+Rf5L4f3vcDFiBzjmwAAAA=
X-Change-ID: 20241220-amlogic-clk-gxbb-32k-fixes-9483bb55f849
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=613; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Pxn7QMrh2zuVgh1mpm3H2Yh7TIOIErliMvP1+xrWdOU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZUYmb2J+gSyLdTpK/sPBj8t4x//U4xeaezkCp
 /ZLXARVyCuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2VGJgAKCRDm/A8cN/La
 hSLdD/9Kgjb7cIL/hb3jwTRyvjkgd/W7LkpK8NCMvuA85C3F+hQDQeMyrQZWvvJfR+4N/DNpT1j
 tRqAZHv5pHo1vqPdKxn7CbLquoFZmaAqyjFrmb7sWcOtTCTMHsopVtVEcxaGcvgRN9GiOR+t7l/
 MDIKskgOhs6OKDvMTv2UHir6XvHDpJxHXk+YoX4WhWVyhVMzRUUBOUHWp17LoXP2CJhpKcWOrca
 ViNaFH+oI1syRkM+3RMuVySnyMlrKQOUD9qvxKRzOdDUv5JdiVvciHZ1Fal0Bs7j97e14Kt8fwv
 T76UZtZ5CTTJ41IJdQ5LhgeEdnyp/x+Pnf+118AWQAonf2igoJTG/jUI1je1A/YDBo0d04Wza7P
 co6KEJhWARwtybHrTt5oxVLHRMJYjpAA53M409YhVvngU00gdN+e5YHCtxmIWKCb/04ncE1/QRs
 dOLjHfqDlIlx32dBdovOqcvbroEJ1PQHpTMry9Q53W1o1Q8fyq6Fl2exWuTab45qr0NGQMrdIqh
 yr2XdHkcUxK4Z/4gvNUExaNbYjOuz69JY7nGuq70m2Cbt1CzS133ift2Is9BcDXPQkeDZ1jxf7S
 5+fRqOMkdInSvmY/12eomvPJL6MO7wOdV7GzbmcWg5qwpi/dZyTzbM+eATC0qwN1hGTffyr73FC
 yTDuQaEp4JqosAw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_022548_411962_7CB847A9 
X-CRM114-Status: UNSURE (   6.85  )
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

This patchset provides 2 fixes for 32k clock of the gxbb SoC family.
The problems were minor enough to have no real world consequences but still
need fixing.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      clk: amlogic: gxbb: drop incorrect flag on 32k clock
      clk: amlogic: gxbb: drop non existing 32k clock parent

 drivers/clk/meson/gxbb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
change-id: 20241220-amlogic-clk-gxbb-32k-fixes-9483bb55f849

Best regards,
-- 
Jerome


