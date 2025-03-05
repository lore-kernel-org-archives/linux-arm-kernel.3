Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F961C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wqfxficZrLy3FH8SUQu08tgHcjwZQclNblNbc+7cTpw=; b=xd1lkkd/CNbxK0
	EaH5JegHmmRonelT6OwpRmyYRxDeqtyzfeW4FatVmK65XuLiM9+orMADmg2qcOaMH3T86sRktOdJP
	oswIJUJ548bMvaaJE1aghEnwCBXCzGCcqxsk9EJ1DOAQqEFBTn4TifQoLItwkJfTtwlQ9i9gQec4W
	D5Ik9dNaVuZyG9LbAAsUGwn4LSUiS4/QMm+O6unOkGg/5qCpynEJhf0Hcu9SvOn1qx9BL681TPFRX
	KrNMD9FbSnM3QQU2y3akM8idpxVRIqz6M03GuTU3I1uBOyjhKPk5JUPWbSzpVhYE2rhxfBWHEZtQ/
	JFcJ3Oi2i2qW0ae1I+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvXA-00000009FQh-0tKL;
	Wed, 05 Mar 2025 20:40:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuy8-00000009A1V-1lZ2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 20:03:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43bdc57deb2so25755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 12:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741205031; x=1741809831; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wqfxficZrLy3FH8SUQu08tgHcjwZQclNblNbc+7cTpw=;
        b=k/nqJxXpJlJDAROoIUyQNXt0azY1DjEo7hEybLs9pzrejuISRhu3oi1XJOzuH0G/cE
         e3McKDiLiwNGZsKmz4TrdP6yCoUPYv0CLlOiHVSlnXRuCCQoZ5QA57iH8cDyFe9CKJ/b
         LR2PaAVbDo2yHvfdcL8CJUel/SHa4Q9ZUND/zT3bWZ64SEDFyp4eCkBEVl3A1a7V1OtM
         tEURZcIIxH0pHDnNHf7p4h2VSzK6LDgiIEUPu41SXuseyzvYRDnWQkhOzQMJaZUJdVTD
         KVx5mEaXqCokj7P8doj/x1e3MH2xexYAEFU1bdiD0BteCfatJbZT3Lj3tmK1bW2emHlk
         bKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741205031; x=1741809831;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqfxficZrLy3FH8SUQu08tgHcjwZQclNblNbc+7cTpw=;
        b=XMqUTw+R7ypprThovOchcSCV60PghixoXitrkT35eIDRxoZ3UCf+bCC4o1Zk8qjja6
         n7eVpBfoJIlspi1zPP02hj/2oFNs/JGfvqnxnOMtcuzuzzAN7xLw001BDvrRhl5kIvu+
         N7VA8HOrlQKHWlokdxrXV9ZGy6C8yU9Cw6SocDR+gX/qbnLXyKcVdC2XLsAnTkkRgy39
         hYaNERRrr1iSaleEBJRIbf1Z7vhuLJKW8w0oELrjYM+96PTLT074p8r4d2/hJ+DNrJ6x
         DmJmDuC4igEViYWjLWj6EapWP22NyIrfh3aYEFuVnlqo97BoDHIi2RZwE1eCO9rxpHJW
         Si8A==
X-Forwarded-Encrypted: i=1; AJvYcCUIPpuq8bSAPi1MLFb/pscIzxEro/54NUNIRoIvJRkn1eWo59qvBzzoIqXlRRDu/TPF1G2iDjS4MEt9DIyPTvJi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0cHkzU+M9ZmutBO477S3strDt41+4antG5wEIdzXZzECyuPAj
	ZHfMzwtpKcQSnAeH/apSf0EX37QQiNbmdPtzyCNMbetZ9OPXnoWXuZlZU9sCAjQ=
X-Gm-Gg: ASbGnct7tTvmuZ1434OAj4G4IjLa0926DLInW/pl4d3SzTID1RMvMwaPfnDgbjTu71k
	WdMek6kbnSbMJNgXs+lyO/wnbatxE4UNKQbi7xbPYpEAjCNwqeulz65xRQ6Azx+s4Auj3pt4VZL
	PqKqyEkzSn7gk1e0nKId2kT6hHGPPnSMd0fCdOwcFtJW2RKfuSD0TIQSt22Nni+NCikHARvuOIw
	xQJST7kgcOyBJDk+3SMVQvKhH9yqG9qcPRQ6AeiTn05ARyGES6JBt009ZgJcDG7Teb+wfZcbBYv
	hdurATfFQ9h0YroLOa6nZa6jahEn3JcUKN1ieCpSJtCx6lqo6ZglGJi+zajA
X-Google-Smtp-Source: AGHT+IEDXv5Dyb5QalrXk6ql6emdOt4SDPu4lj7dnIY5kFx1pre2Zvcu2aTh0CK7l9GsPZKlkqv39A==
X-Received: by 2002:a05:6000:144c:b0:391:10c5:d1b4 with SMTP id ffacd0b85a97d-3911f758752mr1548030f8f.7.1741205030724;
        Wed, 05 Mar 2025 12:03:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b792asm21874027f8f.53.2025.03.05.12.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 12:03:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/2] clk: samsung: Two header cleanups
Date: Wed, 05 Mar 2025 21:03:42 +0100
Message-Id: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB6uyGcC/42NQQ6CMBBFr0Jm7Zi2IDSuvIdhUekIjdiSGSEaw
 t2tnMDle/l5fwUhDiRwLlZgWoKEFDOYQwHd4GJPGHxmMMqcVKkq7MYHinvKHHscyHliyY5cnCf
 sVHOz3udhrSAXJqZ7eO/1a5t5CPJK/NnPFv2z/3UXjQqtbrSl0pqqpssYouN0TNxDu23bF2U9U
 mjHAAAA
X-Change-ID: 20250304-clk-samsung-headers-cleanup-c07b8dd50360
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2094;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OVU2xqhorUws16KE9g8vqSH0lbvZUNE4DA37myXzLh4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyK4hZwctbAzba4JB0QKbXAwVRbl4QNOEgos3u
 CJMZxyp30CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8iuIQAKCRDBN2bmhouD
 18maD/4nNwX5HRCdqZWHRrEVVhcMsDDFAy8RuJ3/FryYbfTMY0u9BZpRwVwXH6SogOPF5oP0IYL
 pf8HHOPWPNMjt467fToLT+INiIXjGNUbwe3sm2PrlOG1qvB15VwPRV6VZVjWt+BMZGlLkZLyJuX
 bw7lh27yusKawHyrb3E8uRw4DWmiDns9ceXzAGobVtpL+/lBJLYvuY8+uZoE2bdhh1yQZWmeLwi
 Bf3yX572FrVi8/wvuRMBqmPv0poSdLEzhiYr1tzGRNPzA9LmpNmHBIJf99aXvw1uGB2fUvGzkpW
 gqfWkF25llYKqpnCW0ZAOVNz2SShFUyeL+daQjKIVp+cttr4BNayNOnPkOYb/SxaBzUlvqrARMb
 8DnjjTOy43aFg4EkLs34cDD10vf8gJfYoB0hbsPIOY9TM/W7XRx3lhQlmxKS6IDFWAaKIPhb0Uo
 Ook5xJvB3AwgGFNaqoZDpBYncl0yxeh5lsA7kKm00SvU7v/LH2qlhmKbQKjh7gBBmrFgOToh1CL
 IzFN0d4u4pJNM86Xj3mdLPpHmoSU8HL9n9EgdTKxFWktp6TUyFsZNaJLZqWYTEZ8einwVubTN6r
 Hv8CF0ddS56oqHvKYANoXJh/kDR6gYXb9a4gKLG2qFcizESLSqtg/vWbtsfgmrqvaibHUwDiFLo
 h81U5jNo/wxR6bw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_120352_472764_A981C2BD 
X-CRM114-Status: UNSURE (   9.93  )
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

Changes in v2:
- mod_devicetable.h: also clk.c, clk.h, clk-exynos4.c,
  clk-exynos5-subcmu.c, clk-exynos2200.c and clk-exynos7870.c (Tudor)
- cleanup: clk-exynos2200.c and clk-exynos7870.c (Tudor)
- Rb tags
- Link to v1: https://lore.kernel.org/r/20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      clk: samsung: Add missing mod_devicetable.h header
      clk: samsung: Drop unused clk.h and of.h headers

 drivers/clk/samsung/clk-exynos-audss.c   | 1 +
 drivers/clk/samsung/clk-exynos-clkout.c  | 1 +
 drivers/clk/samsung/clk-exynos2200.c     | 2 +-
 drivers/clk/samsung/clk-exynos3250.c     | 4 +---
 drivers/clk/samsung/clk-exynos4.c        | 2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c | 2 +-
 drivers/clk/samsung/clk-exynos5-subcmu.c | 1 +
 drivers/clk/samsung/clk-exynos5250.c     | 1 +
 drivers/clk/samsung/clk-exynos5260.c     | 3 ---
 drivers/clk/samsung/clk-exynos5410.c     | 2 --
 drivers/clk/samsung/clk-exynos5420.c     | 1 +
 drivers/clk/samsung/clk-exynos5433.c     | 4 +---
 drivers/clk/samsung/clk-exynos7.c        | 1 -
 drivers/clk/samsung/clk-exynos7870.c     | 3 +--
 drivers/clk/samsung/clk-exynos7885.c     | 2 +-
 drivers/clk/samsung/clk-exynos850.c      | 2 +-
 drivers/clk/samsung/clk-exynos8895.c     | 2 +-
 drivers/clk/samsung/clk-exynos990.c      | 2 +-
 drivers/clk/samsung/clk-exynosautov9.c   | 2 +-
 drivers/clk/samsung/clk-exynosautov920.c | 2 +-
 drivers/clk/samsung/clk-fsd.c            | 2 +-
 drivers/clk/samsung/clk-gs101.c          | 2 +-
 drivers/clk/samsung/clk-s3c64xx.c        | 1 -
 drivers/clk/samsung/clk-s5pv210-audss.c  | 1 +
 drivers/clk/samsung/clk-s5pv210.c        | 1 -
 drivers/clk/samsung/clk.c                | 2 +-
 drivers/clk/samsung/clk.h                | 1 +
 27 files changed, 22 insertions(+), 28 deletions(-)
---
base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
change-id: 20250304-clk-samsung-headers-cleanup-c07b8dd50360

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


