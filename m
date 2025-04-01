Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA744C36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vXhLpKVjnwBdZ6H+LETE03eu0VWJLVcdTshCBskUvJ8=; b=yFxzt3tgUSd5+b2o87y/P6/GW8
	leEFe7HP6kt7MaffaMHnbxt07Wglf8ygtvWOlOAfgJzDQIlBF3ztQOEXANz+Uh6bv7I+zh0HlkR6f
	SiAeT+Bw0MtEYQXJa0bWa7qq3cbDDbgcXHJCDcfyCySThjPMUkxVpb2mUOUxcaCB6sJ08eTMfYVw9
	uTXGJiBugiU/eogYqyvXs0rjB+neyrc4ulTqvD+Tyiq7GuwXS2T6pEeYEzNNG/AtAXCQo3MWuzTAF
	fNHcpG6JTEs+++nNNPWIJdBg/jyW1ZY1AYWdy7h272e5MrgOt2QQPZvZYttDab7iZrMZHsXRi8dCW
	hUEf3FiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXd3-00000002Q9l-3EqK;
	Tue, 01 Apr 2025 09:09:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXVT-00000002Ov6-1FHl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:02:06 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso40667865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743498121; x=1744102921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vXhLpKVjnwBdZ6H+LETE03eu0VWJLVcdTshCBskUvJ8=;
        b=UPWXliVjKzC1K803B8ROUnUCxtPRjJw7zN89fbS0jZwKU7q5XmbJjU4J5cXDJ8F1Zm
         kSnU5d3s3Lu8T2WYG0gtV9+3QpmzegkOdq1tLG69rJZPKQ63NgCOP2QdYwMY59shX+xM
         QYP0GVAdeG6HfI0s0hSQqNtQ6knIXH5BM2NtfrhZWvtxaVJqZUrpRLCe3DGPW7hTpjY1
         Wwg7n8NnLQ201Otr+VJmehb9gCZkzSD9Jwzxkb77IViqsHZVYTtacKYg/5cdDOdIZPmN
         FVlpBGbXmHmHETSuYR3vXXn4lTrelhGIdeZYrCkOfKPq2kdN5q1oqarzNSOifZY9lYHp
         TrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498121; x=1744102921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXhLpKVjnwBdZ6H+LETE03eu0VWJLVcdTshCBskUvJ8=;
        b=q3nyT83GP1BYT7O4RolmT78G8wqCpEgKEdOJXDeNn53J48zfyhX/1qxcF/ckaGx3y9
         EvVmH9Ix/NIMmKPELL6p8K6K13EV9VButIYZ7Bxyw/RZ2E0WShzalEJwiEGVAsUBV+3b
         tUf6+ImQrwbdtAKE3HAW0p4EUNGNR2TzXvkuHTJi/Ij0pJMiju1C9BdiEpwM6YR65EjY
         vZIyR+Gd/RglrCcekc5iAQ9mq8cXyEkKH248hk3qDmNrSu7/F0JkhY92IBWoL42TjV+i
         Ig3z+BY6C4iN2n/8j7Yz/FIROnEJjaDfkOME7r+OlkWGYsGw0VtEcmYNhNCRK8UO5VC+
         MAiA==
X-Gm-Message-State: AOJu0YzclpTJLUBS82Q7f3hVdRWM/6mPaDPomIRXHpxn3bA8+JBugC8F
	uCYptxjVXqa1nl7WhbJYIaXfWDUowerhWuNW6wtuD/dEXfX9gkp3
X-Gm-Gg: ASbGncsTpn8uadbA/Y71NJIYH34huwO11keBYJMeGtccck/HBD9hQtaLmKKReBnBo2L
	lnD4SsoO46sxWYVyKSREsmdfMvDL1W2UAQRI2OWs2fqCgJ4S7nyQgAyp3sMbCsyahAPL8ofoeq/
	qM09KuujHKOuq72vTbq3OOD3AfiOhXw78VGO9cQh7tMWJoYrsVEf7ZWcRBLMsQt4GZlgAx8X0uR
	CGBjrYC6ZeXQFCnWJiP/YhRCwuO9lkF3JuwBGlkRkRn/NJY2Mo0E8IZeQVtuKcYkhk+KkZvd76/
	04TesIUmR2K/3MKWfYpaWOdzZZt1lkNpztYc2f4KtM0FtddtY3m1Eo2pWAGsLOdT5Mo27Q==
X-Google-Smtp-Source: AGHT+IEbDdByftUuB1De7ADpvc3T3jH/tL6StJDvnUvXJU9t27T8dcC38/SRewNGsYVLRwVfe0oXnw==
X-Received: by 2002:a05:600c:8718:b0:43c:e8ca:5140 with SMTP id 5b1f17b1804b1-43db62bcfeemr99251765e9.23.1743498120922;
        Tue, 01 Apr 2025 02:02:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:cd7b:4630:9a98:b82a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd0738sm148391545e9.19.2025.04.01.02.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:02:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Russell King <linux@armlinux.org.uk>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Simplify Renesas SoC Configuration
Date: Tue,  1 Apr 2025 10:01:29 +0100
Message-ID: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_020203_692124_A7F7F20D 
X-CRM114-Status: UNSURE (   9.19  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series simplifies the configuration of Renesas SoCs by enabling
all Renesas SoCs by default when ARCH_RENESAS is set. Since ARCH_RENESAS is
already  enabled in defconfig files, explicitly listing individual SoCs is
redundant. By removing these entries, we streamline the configuration, reduce
maintenance effort, and ensure consistency across different defconfig files.

Note, acks from Geert are added to patches 2-4 which were reviewed here
https://lore.kernel.org/all/20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is set
  arm64: defconfig: Remove individual Renesas SoC entries
  arm: shmobile_defconfig: Drop individual Renesas SoC entries
  arm: multi_v7_defconfig: Drop individual Renesas SoC entries

 arch/arm/configs/multi_v7_defconfig | 19 -------------
 arch/arm/configs/shmobile_defconfig | 19 -------------
 arch/arm64/configs/defconfig        | 23 ----------------
 drivers/soc/renesas/Kconfig         | 42 +++++++++++++++++++++++++++++
 4 files changed, 42 insertions(+), 61 deletions(-)


base-commit: 7b7d0894c66154494b8295a2e73cfb5516f65756
-- 
2.49.0


