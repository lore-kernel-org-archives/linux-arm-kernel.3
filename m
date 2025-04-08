Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B20FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26BZYOZea4bfw7CNCFKawdkyJnG29aqqnfgcKzudge0=; b=sIG3y3DruUq2SsW4jZ18algBWO
	q8Na2MWee9WkgVXjZvfdRDjtDGcKaV0bM3V6Pawim+1o8aHKVE1kdaBGKVpy4f5uSC7erDAsjZKbb
	5+lLoMJxtg1u9oG6hktNYbanOAfLUHdL9XxjaSwgy4LWKK4ztv2JZZBQP/mvvYpHnjMkAB3w5Q3vO
	4ac278v7PqCxbFuYaQKUHAGNlB0RCEgN7hnj/MbZp/VvpfPz5jlOzWCqLhzdPWl9vn14fl4kKgAUL
	51B9F94syXqsEtcYKugAvyidhclS90MltlY7rEYlFGgicQ4sjMbSfaM2E5QwWi1CFcEOYy9OxTLTf
	nKfAd10g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2EK3-00000005Ck7-3rPS;
	Tue, 08 Apr 2025 19:09:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2EHb-00000005CEC-2lXz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 19:06:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so4470335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 12:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744139209; x=1744744009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26BZYOZea4bfw7CNCFKawdkyJnG29aqqnfgcKzudge0=;
        b=aftMPAPMKAoMl4WtU73gIXZftLtvHtna67SeLiZHaqYWH7O+maYjlVg9qfaBzKfbSJ
         eecZrt/ckKM66v7BoCaXt9fh6i0Ng7I4BDqcRDa8LZPosr28PuwRkw2DtVNNQrfEI4Bo
         1RFXsocYUHPGnHgmmftwmh9NkIBQaeRolChnae7K+5sc8FBFpZn0UGbx8yZxmLFg94tU
         5RUVsfKY31nPvHSbVPRQphLmzDn7Z3Ki4AYaJJsviARnIIZXIOeqyHAddoPmMjNWzfO3
         JXTvcIooGPVDcQOhE1w4BwwPxiPjRv3vSDNsH8sZYRmEctUcL75R9hiIeaRyOTkKBWqe
         XImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744139209; x=1744744009;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26BZYOZea4bfw7CNCFKawdkyJnG29aqqnfgcKzudge0=;
        b=sgRHwNehpdBRc9WQzpwkczpAwMlsHtC/+S2msmr4YqdBX1XniA+lUgsLxkOJ7n3Bov
         TGOvT2QKRSiJw7LTAODaL8z9NaK992E41w/hToK+M+agz4cKWOJ1gUKkJRl7TvAv4ov9
         TXbUPiTBA7tcusOdGNCpsvvdnnKEL+Z3T6Bg1067kPqCgKjNRhRaSWFqSIDNyeqSFJE/
         3jYikURqFtPJdwjglJOThJMk3vrqYgHX1joFjmQZW3/B3XhH72T/BGF2p2Xj9MxwHk6x
         +642vSOAnze3srYTNRmCo2tE+z1Wl4qZOAnLtPMaBrw6rbMg0E72RXGchoXLHmg2/qsH
         perA==
X-Gm-Message-State: AOJu0YxSbvf06dzal9rqpeQd8TGu03aeB4SgJ0IuPSIgYah3s4aUlWr4
	MoPOp15VZksG3wOADO3FHq5/rEZ/taRfoqJQVrLPLBKPDiXccYQTuNeKXmTtY9dErmZV8mJHUSW
	Z
X-Gm-Gg: ASbGncvbd8C2RpHoJhadX2ZgJh9TThienv2AkwXqvv2KxDUNXcX+uYvfMUwd495PDpb
	0nFeGmChNMKf0N3TSVM92K89W5BFaamrQHMPqCQabIU4yoeir+/7h5dqWGhAiyX0VaOoYNyPF+T
	r+eqULx6EYOHcHgSHW+sfIN7EKcsyN0z1FtI9ir6g9GEO/1gUBx+B4HKCoQ/3gf53oifNSOnxQR
	lQx3fDLc95ueREhvevK2h0neXMe+fa+YY+n5xhb0FI9gXpZufUPD7pA3RwxRMbRDnBS7b5nIlFZ
	U4P/VNcrMV6CLWXe0r2GJ+1cZLUT/n6d/G8KPNHXD+rFoQAV1XQ4pCgkF4SY1dM=
X-Google-Smtp-Source: AGHT+IFEmj19Sjp6m7XUEA3vyo+E8QmKaZA1qZbfv2jh+SPPFex3IJzzYfOY3+icqIou7/aTD5sG1A==
X-Received: by 2002:a05:600c:a016:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-43f1ed660damr1024815e9.6.1744139209570;
        Tue, 08 Apr 2025 12:06:49 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020da17sm15853743f8f.64.2025.04.08.12.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:06:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, stable@vger.kernel.org
In-Reply-To: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
References: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
Subject: Re: [PATCH v6 0/4] samsung: pinctrl: Add support for
 eint_fltcon_offset and filter selection on gs101
Message-Id: <174413920812.155881.15584409813277033669.b4-ty@linaro.org>
Date: Tue, 08 Apr 2025 21:06:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_120651_705969_695DBF74 
X-CRM114-Status: UNSURE (   9.67  )
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


On Wed, 02 Apr 2025 16:17:29 +0100, Peter Griffin wrote:
> This series fixes support for correctly saving and restoring fltcon0
> and fltcon1 registers on gs101 for non-alive banks where the fltcon
> register offset is not at a fixed offset (unlike previous SoCs).
> This is done by adding a eint_fltcon_offset and providing GS101
> specific pin macros that take an additional parameter (similar to
> how exynosautov920 handles it's eint_con_offset).
> 
> [...]

Applied, thanks!

[1/4] pinctrl: samsung: refactor drvdata suspend & resume callbacks
      https://git.kernel.org/pinctrl/samsung/c/3ade961e97f3b05dcdd9a4fabfe179c9e75571e0
[2/4] pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      https://git.kernel.org/pinctrl/samsung/c/77ac6b742eba063a5b6600cda67834a7a212281a
[3/4] pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      https://git.kernel.org/pinctrl/samsung/c/bdbe0a0f71003b997d6a2dbe4bc7b5b0438207c7
[4/4] pinctrl: samsung: Add filter selection support for alive bank on gs101
      https://git.kernel.org/pinctrl/samsung/c/a30692b4f81ba864cf880d57e9cc6cf6278a2943

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


