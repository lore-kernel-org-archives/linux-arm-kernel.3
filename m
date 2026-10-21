Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057B606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LDfeDcaY;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=U/UoBGJt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=; b=LDfeDcaYGOQtK0AagthjBhwWgs
	de6vP/4kMAiQdgbpe9+0kjhHQa5CJ8mVEAufmFgdgByg+yHsJMzVd6iNTV5mYGOjIgiccblDtyaDP
	BF2l5HH+wNpzjFfUg3ks9DA6OS681F9sQWtXl2Q3mwkgrN9u2C9gq5DnNq1OcElqdOAsN/Zyj5ADV
	NjTlvMWQkGxh5qicOa+8qSaRgdzSfe3TSgnznXhqLn0k3HglvD3h3HwjnZuoliowMT7pvIvv9pLHQ
	+l3x+mvefVSN+Jj74xANC3EECoAv3k6ZW0JzqY6f8DcmLp0pT/CKC5xzv50padNwZArcf3SBO47I8
	KAxLIG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXvX-0000000CCfx-49Qo;
	Wed, 21 Oct 2026 15:08:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXvV-0000000CCdw-08nP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:08:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-487049569b6so590739f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792595303; x=1793200103; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
        b=U/UoBGJtVYUqZPgZJH0F+DzJsPu29LvYhKxZbIV7POpl7qnda2Sh8WuNEhcPrD1KB3
         nu2DhtjLl5YPIV15m26NRvy5KHah+uV1jRQhQr6E0Pvzz58SSaWnl1l5E4qJ1uP6v3o0
         cM9PA1QqnKPzaM2fDIFV4XtgiIqSmlYpZtAPe85ZrhalRsxeWelDmtM1N3gtbVUSEbba
         eMUNk3AxeBYr9rjxMz9WS2JKhQnEECoZWs2tsGvH3LF6bNPY3BdGPMQcYyxOTkqZNl7a
         q8uxLdoU0+ztXrGbvnlpMFUeC1jAJUF8SuJCI8fI3szXZWPmVykuNOOUPKNsG3qNwTbY
         pLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595303; x=1793200103;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
        b=rgJq+ePKrAQH3d+pvE+xgPXDL+HivlLkfZgTXJWPn5XUx64Ja+FYTkGZSolEKs7G/B
         bD/caS+be1A8pX6wqmkJRwAOXG3tbzGrjlq3AzPAJTWFi8hPl2TZjOQE1pOGayFp6igw
         a7bWRCamHNZ7ghTk+nhp70zn/u61n9tM/Eo3+yAxaGMD3wbwNAjapXfbVMEQt35ilOu5
         rEKOYehBa+X72+yjykDv2DtRZHW+s5GJCqBwiwQsWfsmi0YfnhtVU6W+BXpc+4s7pgI0
         SSAQOgZqRfxxA56r5zKciLqq+qC18QeH7/H9H++ib7YUFktGSD51g9VP3o93DMY/up1Q
         s1lA==
X-Forwarded-Encrypted: i=1; AKwUvBzlZRnFPJsXG9isg4iDBeBsReRyN54Btvt5IufstRP4Ejs6cDkciFFWmQwTy8ZrpBoyXab1ufXvLx8pit0MoZ0I@lists.infradead.org
X-Gm-Message-State: AFq9FYJbp96gVDyfPh21TsHkcU5YmQILoKavhzw0u1r9cefyCIUCTxX5
	Dd7MK+mM/lG5HkPren5IyU51DCWjMRIAtorkO7ZA+4eE51YvpdJq8YFI+EaMUVioCFo=
X-Gm-Gg: AYBFou1M4iSyUMWaB7pEKRuKu83NYnURZ4fqCkEapTDl2Crhvj7Hh+XOsXXpY1HRb/w
	33Z05PzdgC+9nPeLXCppIcI0luELLXDJIvliiziW6ka8nxhtp1JbQzbBfj4erqTTisFzcW+Spay
	Fy27ktrQTBN76Ajx77AC5E90X8NlHXN1L9ckbHiF0QPbwwpjviaRkU/JNXhYibFR72+nFpzELJh
	rZ0d9HxxCV/uHjdlqMTTsC0RckQchMIQmH7LLbV9d7HLl0tfalk3mTR4tDpW2QcIRRMfBKaioPn
	k6qUqCv8IRaPZe170bDstiVk9/cIwmTGvOWeosKudHUUImEk8lg6rt19rXTsXsoQKzuAZjzi5tH
	j/x39j2DoLtmw21Q8W/7wBG52pz5wNveBAXPAwXrqRtQiwCdNpujI9Lt0tT2KkujS+AQOAkctd4
	cY4a/YgH+DI1479QgkN3TASBJnxAdz9oHJHJ1IsQLYgPVm689f9Pv6YZGyxBkbA8fhLaYpPbRLg
	Vd7Qr/L0N54V2xYllyB7z1YBiIopG8BA5MvqdOqgpze2Xr7bGT0iVBfL86U3DdlfbBR7DtGLsk=
X-Received: by 2002:a05:6000:2301:b0:48d:e61d:68da with SMTP id ffacd0b85a97d-48e264ab2a1mr4944600f8f.20.1792595299491;
        Wed, 21 Oct 2026 08:08:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm6652761f8f.42.2026.10.21.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:18 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 4/5] clk: meson: axg_audio: add S4 support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261021-audio_drvier-v7-4-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-4-2b9aeae9cb8a@amlogic.com>
Date: Wed, 21 Oct 2026 17:08:09 +0200
Message-Id: <179259528986.4070168.1199000664504589178.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=437; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YqvMrgag+SS1YYwbYaYO3LQNDj+WNIZgZH/cwchSYXY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk3rsar1wWxnVjfVDGxa747u6jg0rYvk7MLdt3qiLDcW
 xS2IKGyo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOJUGX4H71gnX/nHxExLkv7
 tJyUPv9053drfe9zHuE8eLKWy4RpN8P/osR9DJwFEsw8Ljx5/LkOB3vFmap3fj1ptnpub2r9YQM
 GAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_080825_096054_A15D3A8D 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 15:08:31 +0800, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
> Add S4 support the axg audio clock controllers, Compared with the
> previous version, the selection of the audio's clock and data pad
> will be designed in the form of pinmux control. The purpose of doing
> this is to distinguish between clock control and pin control selection.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


