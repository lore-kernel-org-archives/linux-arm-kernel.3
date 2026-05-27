Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5F1CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WE1uFjLQahicP6Pul0+3gr6Dj3sANOaIDcF9iPOsssE=; b=wZGorc73ttcrsX
	H2OdH3vhEa0SymCQQmms72xMl+bmrZfp+EA0ZLOkMoKAMXg/Jkjqvkeye15cjqdfC28kdiqXYARjv
	soayq2s1B4O0HEbLZFPkO3V70ctnc6M7amvwa0vn4P3LCc5OjX4l9CwIb10dE6ezmTjkdMAHbNKGx
	MD+/fkZUOSS7fAUpVZ1hNlDY+fuKMifyX33Mg51qE3V+Wxuc6EWlqxSbv6l14VX0h4g6Royr8hAIE
	okXNZNRktpat19gC6TKg5NgLlrm/lE1uB/0OlB6/nlmOyeUGonqqIDZmTXyEBgkjsLmguDPhbuPwa
	K0uS3CWgxD2u1KfgKjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEm2-00000004FQS-3nvl;
	Wed, 27 May 2026 13:58:18 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEm0-00000004FPJ-0dtM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:58:17 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-134fe980658so13406781c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 06:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779890295; x=1780495095; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WE1uFjLQahicP6Pul0+3gr6Dj3sANOaIDcF9iPOsssE=;
        b=c4eEnAV0HaoYV1N0WUgnNOo+dfkAJfK6eb4+pIsfKpFd0MbMkni1SyJcBoANnCL9Ra
         ZoRc4toGgkBKfYYdEcqj/8n2qZSk4rItBne/JYVyghWJ52/LUnJnXzI0UobqZ1TE2uwf
         YY7b4p5QiTsRHDQmW75EQXxVgLvvpO7mW5xhz3uEOZHRlk8sWsibGHT2mY3AX9CahjQW
         ixzSHT3jXLxV7tU5dWe1b3Tv0G+3kRi82GtTZhtpP5n2qTx2v9/BjfZXo6FgBbX5esOa
         eOGkQzs94lLdes+rg9k/9FBRJIcotQoZyo9hAT5tZ4xxFeay16dHq2RBgIlJObf+6Lyp
         BlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890295; x=1780495095;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE1uFjLQahicP6Pul0+3gr6Dj3sANOaIDcF9iPOsssE=;
        b=ViYO7+WpVx7XIf/iwXKlCk9VzeaL8NnUb++bkCGcxMXa/TdLgi8N0qFaGkT0riScK4
         2qpoY6NzdqbIagpnfvcXWZrBH1iuhvXtE7CX7ION8r4rpBlly9VWnWNhyLpgwINhMhR+
         E+FICj/pvboA586qMOv49NA4KO8dJ0ZjVKEBtPs7hqnzryfeMd+e6cRY4GupJZT0yqSL
         nRNaCtRxfTCz2R7gsZjppFn+n6aqvt5wsnGld5Z0Ol6AujeQEK3MqJiyH9phX/F6XNgE
         OCMh3aZ8q0H35MZln7JkXNCiIesQm5bdp21gQ16ov08p5vwl6wTlMh3hxKZh6BuNuqrf
         1oMA==
X-Forwarded-Encrypted: i=1; AFNElJ+2eql3o5oCzUqQWJF/63Cl96UOEeBYY5PNG05pZAc5bL3uPX6w3xco4FzI+rBfekfIjbFX4aYPBzgQprQtAZ4y@lists.infradead.org
X-Gm-Message-State: AOJu0YwfexVS3bnw5M64xt2ajNvW7u6D3P/sGKHT+SmO36ABhvFBGYLa
	0F+c+OgdiuHoj0xP4VXce3FAgXrjNp7gcHNJP05JWIU2DanfXMAglfWn
X-Gm-Gg: Acq92OGehbQZuaCG0z/eJxAdFlafFbrxnxYMwv9zYbrAi9TUPMd1LiWDN+q8pZBWY5E
	iBtR0/tH5vmxrXyxMcxydrbM6/9kd6TZwOKJeYaQKRInz6S0jbski/X1whjpXiysAfiUpIzX3u1
	UwFJLF1NjPvgy+Fnf5aC5lijci+TBldx+j/TI894FjGk+P/X8x2FWWtBlkBZc8JZJkh1cuCOvGW
	qchCea/ysfp1xVZB4/lNcKkZh2cVEa5oig680T/AdMR5+15uhedhrgi2PbtPJJsppijFPidrRXr
	3pKG0BvJNjFzPRRCYg4ljF8CYnThOq8Ry4K+axO35FcNizh26v5MbbCp0kki3yeauxl1SlhQLFI
	BohPa68qGlCH+uugiXMS9H6X8wiuxdCPv103FOOk/13IsJEEpn4XP25sJMyDxPxuolVJTE+Yhal
	1uZjNcmbdXqZY4nt0dMJ7VozCF5+Ze112rqgTTtZz72oowT8dysq2l3r9KcrovZHWgtL2C4L1FI
	YQZBVyS/ka7
X-Received: by 2002:a05:7022:20f:b0:137:546:9e9d with SMTP id a92af1059eb24-1370546a30dmr3647362c88.23.1779890295149;
        Wed, 27 May 2026 06:58:15 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aba2b9asm13013788c88.15.2026.05.27.06.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:58:14 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ASoC: mediatek: mt8192 probe cleanup
Date: Wed, 27 May 2026 10:55:45 -0300
Message-Id: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4auQWTsJTMOPXsWwKGWKY7RtOmBMC
 He36vJbvLeDchZWuFQ7ZH6JSgwFzakCd7NhYZS5GKimrm6pQ6vR4XMdmjNhynFidA+2YUto2Pf
 kzcBmbqH0KbOX9+99Hf/WbbqzW79DOI4Pzadfxn0AAAA=
X-Change-ID: 20260526-asoc-mt8192-probe-cleanup-3ef72f38e3d5
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=6N+ANPMgefHybKMAFexpaMVcK8mi6ROi1nROc0wifqk=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliP4q4WNfnRvVybPEVCw8X7y6/cUaq+uTreaterYh6p
 6a/5mhJRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzk7WaG/ykizCedV/beSnb3
 Pr8iTL/pXimr0hT9p+eyjzK2chScPsDIcDEr+pIXS5BX9/a5PybZy4tPNFgQbPfKsvfgxMYa9WQ
 LVgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_065816_195620_0547DB4D 
X-CRM114-Status: UNSURE (   8.66  )
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

Fix two MT8192 AFE probe cleanup issues that mirror the recently fixed
MT8189 and MT8196 paths.

The first patch registers a devm cleanup action for a successful
reserved-memory assignment so later probe failures and driver unbind
release it.

The second patch checks the temporary runtime resume used while
reinitializing the regmap cache and makes the regcache failure path drop
the PM reference and clear pm_runtime_bypass_reg_ctl.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ASoC: mediatek: mt8192: Release reserved memory on cleanup
      ASoC: mediatek: mt8192: Check runtime resume during probe

 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)
---
base-commit: 93f1bbc69dbcbb29544769c4d6f3456749ad9013
change-id: 20260526-asoc-mt8192-probe-cleanup-3ef72f38e3d5

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


