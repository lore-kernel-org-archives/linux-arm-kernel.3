Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F47C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoxMGI0BVuk3x6WyDDntBseVyfJ89DBJ4oPAJpDJ4cE=; b=MjTyflSDJNjlofewEASmifUQMC
	evqhLE73TLkfUMDhWkQtNFHM4sMovURhUQWm6VcwY+f3HdU9xJH5XPfy13deZp9W8H8k3w823bjhe
	thsxmxndWYiqDRBLog9eQ5Jdxk2bYBZwC2WXIHhSyd+Nd3H9iNKbEdF3BOV+aKAqLdNTimGYW0UA+
	W9Lc2Km2Q/wDF1FfKZKm4r9u+Ondd04+h/nif6aYvt+GZ6fEBv+EfBvxXmjUsYCjQs3/qy0MkoJe4
	TSX1L4CXeCXEdR+JC2nvSeuh3rmiHQOhIlm+n1UsJ1yefjBaUOWMf1TbsuLJdW0JK+s4iiGWTa6aB
	nPKTzw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8N4-0000000EAq1-06UD;
	Mon, 29 Jun 2026 09:33:42 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Mv-0000000EAnJ-2MUt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:33:35 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-472055b0efaso1228591f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782725612; x=1783330412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoxMGI0BVuk3x6WyDDntBseVyfJ89DBJ4oPAJpDJ4cE=;
        b=U1mEJo0zuMHu5F1L0vs4ApKMoOXjFvyJEn+MAt1caxuQiDae7WMesY90jcVDnjQJbx
         g0OYd6dI0vVlYkFyz6tcsSFsyZBrf1NOemu6sCZjjNzAO48sAFzyI8mgbo3rYRJ3pJ9d
         D4KQPOxIA8TqjhlwwXRoMvJVanQ6E4SYtRwWm8gjcHQOQCCZFRODntEsYUf5bs650R/1
         T+S7//HZz9ZVAlkucz6/U2MG1jAP5X+Ujcmkj8S5wjHS1IHJgBWvkQRpEa+MY/4Fd2d/
         L9dMrbuk2QzOk+yfdAzXuCRmTqN/uWdUmhC6pKltNDB9rZZkxwyT0izFD/vrs7e774QF
         7qKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725612; x=1783330412;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WoxMGI0BVuk3x6WyDDntBseVyfJ89DBJ4oPAJpDJ4cE=;
        b=eL/SxCIGLx5mGdc4BAEqlXTWkC47TMsPn3swinYDmcHd709SThb+hL7VVfLAu+rYAn
         iJBXzfq4FB27Qv3vzBSR5Hs8xgsKF53sZin4WEh7l5bceHCwxOiT9yd5FNax1T442XYl
         LkVHfchfSpTovjtfdMPR3X38xZPl9Cf9tT9slnF6+hRHSKbRGbUm/F9D4+vtzbmBEddu
         6sNJZ9T/l+kRe1cnVz+cN7DIL0SZUefM7F3mKeseikQ68yd9+FJCIc+4Hu70vtf1w5Tf
         MTpT8hAWvUNQhe3bz9PvvejxuV4rLEGO6cz6kVRJMGtO7IilZJ/nYJkfvmgvfr9rWtoV
         tfIg==
X-Forwarded-Encrypted: i=1; AFNElJ/acRrQ5qp5Sub6MD4VJlLN2FRNGhVpfAjNuj1B4yDwwCfqdSfvokNFgWMM883l9y+unRWMFN/4M579m0oK5YHe@lists.infradead.org
X-Gm-Message-State: AOJu0YxDPQw23TdiXlWZhRYl30DcBl9x3k8f0889BTThabBztJRsUmvT
	687oEj5UtZZ2QBritZj/MFzovwGmIqFWPsUMoJkHXqFsJuJqnkxd8FwC7oSPkypQzWPBER1DKBe
	GEd3y
X-Gm-Gg: AfdE7cmlYj05PMs66YWlxAtcS3mGhiSdxuTno3uut90u7ODkgHhVTl99Ddb2q5jx6Lb
	lTP3+HQ2qpILe+AobxTDbTEQSMMfP2rzPcuW6R97lsf3Az93RyOr1DsAS8pwiKdqnIs+8E1bf1W
	SOZP3xwFE5oWMGVhmymdsJYIRLKIL68aNtk1JQl5pO14H2dn/BT+FvYFS7A6aTl8Ten0hC2XRMR
	MqbsKBuJHeRG1HEsyH9Vv/oCD2GhRQxafE6f7dlvUaNC+AzyWN7X0TnWxjEiox5J6/H/ixm7SsB
	2LtDK0sFcbwiSkBXnStvdkEMfg1OnyzvDetzAR/Cbxmvix7iNfc+qN18Wf94pJ2ERtEN5XP1XiY
	97Aq9dg32eg5UkKo9Vztji9mjf1Ke9sLp7B6gWZf/7N1M0Ac1Lm23CZ4hYdT5m1Ig6nhSxayoV+
	Inp2aeaGhr0g5e2VUDvO4erw==
X-Received: by 2002:a05:600c:154d:b0:493:a6b7:cae5 with SMTP id 5b1f17b1804b1-493a6b7cc46mr73697705e9.28.1782725611965;
        Mon, 29 Jun 2026 02:33:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926c2954efsm197764055e9.2.2026.06.29.02.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:33:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260623-a9_aoclk-v5-0-c7cb1ff9ebf1@amlogic.com>
References: <20260623-a9_aoclk-v5-0-c7cb1ff9ebf1@amlogic.com>
Subject: Re: [PATCH v5 0/2] clk: amlogic: Add A9 AO clock controller
Message-Id: <178272561000.2490611.2050441945204527084.b4-ty@b4>
Date: Mon, 29 Jun 2026 11:33:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_023333_609929_EED53851 
X-CRM114-Status: UNSURE (   5.33  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/2] dt-bindings: clock: Add Amlogic A9 AO clock controller
      https://github.com/BayLibre/clk-meson/commit/d425596035b3
[2/2] clk: amlogic: Add A9 AO clock controller driver
      https://github.com/BayLibre/clk-meson/commit/a1b4c3a63a7e

Best regards,
--
Jerome


