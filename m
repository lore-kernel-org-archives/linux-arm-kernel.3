Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872F6C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 10:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xo7iAv+9nI2kaufsKds/53FFNGXfbLXPYtYZ+pjxKuE=; b=3Ca+871kDJeIUmki/HS+SeCLfK
	sEqbsbElrXiST+zrzr59LyILB/RPIHRNLHQ8Jc1tKrtNyh7SS0pONE9EIXoP6gR5vMWgsQSNqC7CS
	82KAIOkrQcpfrbhlBZj2jnWsLqxXTj/CTsdRJ9E1qDsJxcqa6o8af/sJ13WoZgn3NIFOaGNnMfMs6
	6miJZ/PcmkHoYW6vydssagOR+t9I8uAAHKIi5FaW+AmSQHKMBoWOH4xvZPBMBxzn8t3jkoCTG62Ej
	Tu42gDoqCGmAOhRfPqXMYaOFWPYkckazGQv5QL8J+l5kDyMMC+OYrM9o2iZsdmsbMt0PJTQhqQGRe
	YYRRXk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkGI-0000000Ag8H-1a2t;
	Thu, 27 Mar 2025 10:14:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkEY-0000000Afwl-2jKn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 10:13:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so4724975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070389; x=1743675189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo7iAv+9nI2kaufsKds/53FFNGXfbLXPYtYZ+pjxKuE=;
        b=tAny2RE8Gu5E4fu4y87bv1UyvQoJwE3XM2jZOGyTt7Vt+xHPQH8TQSzl4qOOoEhNrk
         CR+XlHVDxnxjT4hXM92mquK6QsOa/9xHvmfAH0ANueBG9NQi+u8WWEb9OjqQ+1ed5Ncz
         xtenA0iDxSbiUK+fzuumdmpWVfCReuf9LM21dzMQY4ms0uUWC3Lf49HYT1UmrIRVjPva
         /Il1buIHr3CCjUcG1GfYFM7wvRI/s5/nWc7fAukbNDeIkSjQqhNIFT5hNqfzLH0XQTT7
         7UAO9qGDQJKwHSvxltpEYX4BvVAq2brQpphXB68jQi8RN7wA9govPrbSDqpWoxf15tYR
         zo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070389; x=1743675189;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xo7iAv+9nI2kaufsKds/53FFNGXfbLXPYtYZ+pjxKuE=;
        b=nagxaAjZxPC39Gc73WXqDeksK4DTYgrytgM5qY0TaYfjKV/TGoAuuiZLpn1nmcCq/u
         P6j6uxLhGPPJHKGKFVXmQHrscnjIQjCEbWqE7RCH3MnBSYX+kXnVZSXD7BaVxfdNzNwP
         IwYr7JHjxV/qSaTwkULpjW9SWWxQm3RHtOwrg62dF8VFLba3EEUKJzI7ECpKIMebPY3p
         qMvmL31gSU2T9PKtfAIPqL9JWUlA8rOECleN+JC5kHdo8njRvPZ22GieGALP6azBhjRW
         VPaQK75FnE3JfqIY/BO700F+kgAjueOXdkW+z+7UNrdO19ONZG6FB8MxcH463uBc57Gn
         6Lbw==
X-Gm-Message-State: AOJu0YyroMEXqBLumfja8N/jf65xbMfdedNg1yYLIP3O0wfKnhJq2Ftq
	LAgEZ85bdleTNbNsrfWZnkX4nmQjPmOIjYGa/qF8LaODhv4nZhcF5LzsOhnwwXU=
X-Gm-Gg: ASbGncth6pq4C6qfe8uMA3sWMU1XDdSSFpaiCxlcIp1O9i9lba3Q5toyjleWyMPiVbw
	4W1XR7diljc/Wu/1kLMOhOpl140gnTZrxtQzNAGC9mZfkaf32BalD9TFV/H742tzItbBhGdme7/
	RmOKB4WdtggHq2sOG/ruw5mn8Ljk9TQps2C+TvxJEqHecxi/RX1u/44oB+5fR7RNzE9XzYiq6Ic
	TwvhhmAR9NmGLB/Q/3c01CIlWoJcdqg43XWAMF9MpY9lNJkcQBrSLOx53l9lQRwzbYDjVfli5wm
	eKZIIeS4a4o8izcE3OTLWOk2anuq1qxFhK1JqIaSNtN6GBb4VlNw/4oIRchldvtNtQ==
X-Google-Smtp-Source: AGHT+IFz+YPLrvTgN7jlfBOiq8HZmmXGzvYjXvGO0VPFIOTzfMvVnsPizrlTsSXhwRlZyW4HwIgm6A==
X-Received: by 2002:a05:600c:4f0e:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-43d8465f999mr27131955e9.1.1743070388941;
        Thu, 27 Mar 2025 03:13:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efebc2sm32345205e9.21.2025.03.27.03.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:13:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
References: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
Subject: Re: [PATCH] arm64: dts: amlogic: a4: add pinctrl node
Message-Id: <174307038828.3221991.15446720184220513001.b4-ty@linaro.org>
Date: Thu, 27 Mar 2025 11:13:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_031310_697036_B488FE9B 
X-CRM114-Status: GOOD (  11.01  )
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

On Wed, 26 Mar 2025 13:17:16 +0800, Xianwei Zhao wrote:
> Add pinctrl device to support Amlogic A4 and add uart pinconf.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/1] arm64: dts: amlogic: a4: add pinctrl node
      https://git.kernel.org/amlogic/c/77fd52e77d325aac301601a18f7cf06de1565a72

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


