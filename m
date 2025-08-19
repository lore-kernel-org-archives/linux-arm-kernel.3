Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BECCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 23:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xa4yNFnEl2+GCJiVXv/vbsFbdWUzJ8PFt4Rgx/UrWQ8=; b=gVOEWNg5HYlyTZ
	lVXiwOAvX6Jyn3dj5D08A7fbCKR5BLMEHkZzcHq28DtYx3achJZ9gJA2SMYmVak74CBdZZRKGx8EJ
	ibFHIrXbkxgS2jEJONMzQz10JdvfgVWGUqn1mculnBbrxYEnXzKn7x0ZlkWvOjNn/eLztoh8vE7Al
	R3fSh2YIoi/K6oBqLTPkOH2PkDh+m2O9A6/u7rslDpo6WEsvktJqlI9la5Cv8+rRrH25R0EVKrtLF
	4MShevgRyKwwsaq4gEVFImGEbJ32kTXXpZfeUDTd03j0+qyhJzjqtOuwzZdPq9ZSstuASLBmxjWcY
	tI9mVYRJ1pFHOZ56VLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoVoH-0000000BrQi-1qgn;
	Tue, 19 Aug 2025 23:32:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUgF-0000000BioJ-2PXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 22:19:48 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-76e2eb4a171so6923287b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 15:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755641986; x=1756246786; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xa4yNFnEl2+GCJiVXv/vbsFbdWUzJ8PFt4Rgx/UrWQ8=;
        b=LGJcJCJftFZJSl97fV1r/JMoHYwjNqury8Sg53WOk27aZXHw1eGnDWqvQL8hSaXz3i
         w5eojJauANctf+PmuwnfYaZ18YFwyEKMbBYfCTpZz7bMyIXm3E+7xQvvqmrNDsXfVfqC
         gEkZWdK+6rnxet0DgGvwF6/QAG2zQd03/2nE9p0o48uGwPe4f2gmRafKklVXV5WDiuE/
         emBHBm5L4zl2gKjf6QyxOfg6pvVtH9x5FoN5OIDvlMd3NHHpkmItNfenk/WJUU0zOENr
         owgsmzALBTAfxCzu5KEruHL2LAsICg/7WFLO7Ns6mkU8bgIhxJM2y3VsabZwjdrTZ3E2
         0cEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755641986; x=1756246786;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xa4yNFnEl2+GCJiVXv/vbsFbdWUzJ8PFt4Rgx/UrWQ8=;
        b=h0sCxVAGVt4d8PyzJRT9xuaZcRlf7Q0zqUfUTQGLZhKCvo5f5YcpTeZEtGN0Io10c0
         wdMG9pwPM0LS2893J+dtYWq2PajtQFURAgAWihPeCN4byTAJbAhSDDFZ/V0aaSyJwE+0
         Oc+i0sWjMoRNgiJbo97HeVb3/kO1BQQVAhO5a1zczHLr15U60IbPMV64pXrB3Tn7zbXt
         C42EE8jZOfGOuauBXW1N4AQ8OGxr3joa3woKnmmHaO1G7ds1fybra7T54VtmqzMA726v
         MwPFTEJh0h3nLVHbM3wbAco1/HpBXuaUiVoWbKGwgAwVcFH8S8iyzLkR5EGhH7Tk2taT
         aGSw==
X-Forwarded-Encrypted: i=1; AJvYcCXVtIBJLfPU3nFBNvKvuiW7vrJJaGL6YXhUuuvklXbzCuG/rD8zm9kYAh6Zt1z2YL6A4o7noBYZbZP1OWIhdw6z@lists.infradead.org
X-Gm-Message-State: AOJu0YwrEZmxzwRykLu90AR3hb7Fo2nUjKfPaG1kR3NTIeDqTa9bArgl
	CVGMRAmTYTe+16JoDULjT78FAP1BMlQzOFvzysFze44LuOWvqOn4MnN1
X-Gm-Gg: ASbGncsLWGB1j4XcBllpPbS6YL57OPZLiTPZ2aszDtux801bRcdH3pPPMFdDJ1F6sdb
	y62O3iy3dwxY18NnGYK8vtmCqN9ywErVzGiH0EQNoPhgPM/RsEmNqW2f9pny6hwV1R4GBEfMAAE
	cGWDZCXPjx2Y22032ABy7fPooWKxn0MuCDp1aiXTNW3/67fApworNOIUnpMzo2lBrMRkDI5IxlW
	g7yqUXQMhb3Kngz18rK2LkryjXychvSeCFu1J0AhE71cUDpCv3hSkozfRe3XnMl0kgk425tVV6J
	vaJHaRwMXPLWRcoTZUw7tMXUimV76QawNZYUXGER4nU/C4A0tQCcNYA7IHnMq+hr8i8/lG8TuPp
	b7sDwUI2wQVTYMS8rxpjjYyLIcT77qN3MVRUKZFgQa5ly5oo=
X-Google-Smtp-Source: AGHT+IGKAGY0PBPZKHCkHC28OiWYdaexqUW3c63hGO/z977zliS7OCS8eRNBxqJSK768+D+wCJy0DQ==
X-Received: by 2002:a05:6a00:194e:b0:76b:ffd1:7737 with SMTP id d2e1a72fcca58-76e8ddd18c2mr905568b3a.22.1755641986361;
        Tue, 19 Aug 2025 15:19:46 -0700 (PDT)
Received: from [127.0.0.1] (aulavirtual.utp.edu.pe. [190.12.77.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f76b5sm3431545b3a.59.2025.08.19.15.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 15:19:46 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH 0/3] clk: samsung: exynos990: CMU_TOP fixes (mux regs,
 widths, factors)
Date: Tue, 19 Aug 2025 17:19:35 -0500
Message-Id: <20250819-2-v1-0-e84b47b859ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHj4pGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0NLXSPdxCSzZIuklDQD8xRzJaC6gqLUtMwKsBnRsbW1AGSoGL5TAAA
 A
X-Change-ID: 20250819-2-ab6c8bdf07d7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755641982; l=1033;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=9xnTT004xILa2UhRGzJrZPOdnh0XmNdq4Be712m2VvE=;
 b=8MVLXZojb3zm1GhzaT8ctC5m5NWK4ZNxXo7JbD3tlEiHyK6JCcNfUZfaBEO7MR8Yg+qe0XTNt
 m/0J203ote8DAIN8TGNjqFQrn8eYRIuCCsT6AqtRQsY+3ZKyZVLGCl+
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_151947_621761_396703A0 
X-CRM114-Status: UNSURE (   7.94  )
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

Hi,

Two small fixes for Exynos990 CMU_TOP:

Correct PLL mux register selection (use PLL_CON0), add DPU_BUS and
CMUREF mux/div, and update clock IDs.
Fix mux/div bit widths and replace a few bogus divs with fixed-factor
clocks (HSI1/2 PCIe, USBDP debug); also fix OTP rate.

Please review.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (3):
      clk: samsung: exynos990: Fix CMU TOP mux/div widths and add fixed-factors
      dt-bindings: clock: exynos990: Reorder IDs clocks and extend
      clk: samsung: exynos990: Fix PLL mux regs, add DPU/CMUREF

 drivers/clk/samsung/clk-exynos990.c           | 154 +++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h | 402 ++++++++++++++++++++++++++++++++--------------------------------
 2 files changed, 297 insertions(+), 259 deletions(-)
---
base-commit: 886e5e7b0432360842303d587bb4a65d10741ae8
change-id: 20250819-2-ab6c8bdf07d7

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>


