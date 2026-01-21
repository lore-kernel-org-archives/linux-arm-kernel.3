Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF609D46951
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrVrJ2R0M9gIk1FFgofj0nCEI69CS6cLVCdJv2vwzhw=; b=y1hWmiWQ8ZPk2SGe0T1yJibWS3
	InMD6aDHg98Su4XTJpMUOC0U9ADs5a+pbIFpFYrLivbCbKra+R2A9XZ0hs6mHLo+HY3RdjBIRTxE/
	LausShlo7CkijPGJ0ZzHgmDAQNn2dXnsJn0EuCBqA/5/Q0FY8DLW6QD3AMLzw33vPUUKtOAbihPtl
	O9FUujnVzxzo1iSWBjrh8hSbdpGlPxJYMkv2tfBUdOmlZzcEeZT3OZroOhPXIc8dWETigtoaD2iMj
	5e4IMEpr11EhXI3RlEIOGMEk9nWN72J7RUTsBVsNLYxfmMHvf+5LS6KvzfSD7Huo5QuuIoy9S13GD
	iSQCIFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibKV-00000005oox-2rkW;
	Wed, 21 Jan 2026 16:45:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibKT-00000005onr-0vT2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:45:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so494005e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769013911; x=1769618711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrVrJ2R0M9gIk1FFgofj0nCEI69CS6cLVCdJv2vwzhw=;
        b=IUMsdJ85NSwnF7Bws+r7fogQ+M27w6uOWyPi1T3L8WDC/VVh5GHMGcfQnyo0oo44q/
         u0CJyPAy2Zj4si4a2lLwSDS1Po3JrYQzXim76TBsr4FALJewVvO0F4JLjFip+NU7EZk4
         gPsE6VDLBj19ZQmx71aCDpHBVCT1SAEl7lm8W/9OobH5Z1o+0vXfV2GHzYMqgvylPYw6
         gvrKPVa1eXiQ/Fh7Ms7u8Aj2sblofyUenvSqLEKqASgd/0+YMgaTmdpM1Bqx6xzGQiVA
         eHCgfTd00puTbzNvo72dJosIP+Q/bWWrubBVjnUwb/nnVSjy5O7/Qu5KHClbZK4K5wdQ
         LMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013911; x=1769618711;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MrVrJ2R0M9gIk1FFgofj0nCEI69CS6cLVCdJv2vwzhw=;
        b=q5n6TRUCDmonfOEQV4nbhI99gKZHLSR2MnTiaHLztEPebnCWkO6Kz3Jn7rukFltSOE
         /+l/ILwD7MhlYDHUvI46QbipufgtJIcO/Py0yFMs2b815ot9PQ0rfq95K/HFCdBKa1vb
         OwT+F9e58qLU4ZPOi2Xp3qhwTSXmpabNp9aqpnRuDZBjNr5Q+KlIiItmBiI85kDWi+OC
         kEOYz+4XHg8YxEeASGu689L7NpflRG042at5uN88K2AQwhjtCJfSIAgS2FtS34o9+hzm
         ei23oF7IpohbMFfOeckJGx9wwM6C37E8M2mkqeD36wZB4FSK9SoXUGz3VdRP9CnYxKir
         mVqg==
X-Forwarded-Encrypted: i=1; AJvYcCWnhtYMI81lk0tP1GQrCdk9rRUjHflt3MtLt0FYzOhxFVg9W2hYVng0Py7EVafOBjSs5L0nYk2LXWW3fWTaiwxI@lists.infradead.org
X-Gm-Message-State: AOJu0YysoIjClLb59W5Joa+7OCLyOhqoaXc4DVo2GjE4UcsJaCqPZR7A
	COfcfhj51DImT74Kx5Hm5otzVN9owaqqsF2kzc7wZ0TsJR6js+SOmLTZyl8lZ6rNNO0=
X-Gm-Gg: AZuq6aKA33rSuj+D6mCaRZGlxVEdkZO5QgzjbMdEbRLlRINbybqtEKmWtPRd5fAPvfd
	V+XaYm5QTqi1HT9LQ93r/ExAK3KgqeYtfqgf39JJJHmR/s6/icrrViJjIT60iy05sfh1SqPwFtU
	q/irnbQMB3P/KTvNVNa9Jw35EnABESh0DYW2GmaXPWHEJuXDeNQXf5Rm4cqEOQxr4tteAAqoBgk
	S9lgw4EpyuV/mXd/GAzHuoQJ/WLzhOC7ZrQTOOT3bcP4VVf2Ntj2+/Aztf2SQrfAixe2sQdSkzN
	QClWYH8za2+jxaK3PMUCr/tKjbUo/NRh4VU/wtW3O+dciMbvg6K1PT+aE1ycEqjx2hfUX/0NLYl
	QFRhhrP2XrQkr4QQoXoSNiHKtwyM5Z/RNbPqgH5OjaY8U3usGezl0yQIiejsRj2OGBRnObPoCdz
	FRk6OpVUhj+fWqBbFgVqvvJkrefZImFaY=
X-Received: by 2002:a05:600c:3b17:b0:477:54cd:200e with SMTP id 5b1f17b1804b1-48040a258d6mr85202485e9.1.1769013910648;
        Wed, 21 Jan 2026 08:45:10 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470401cbsm1211415e9.4.2026.01.21.08.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:45:10 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 xieqinick@gmail.com
In-Reply-To: <20260121014725.122722-1-nick@khadas.com>
References: <20260121014725.122722-1-nick@khadas.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable SDIO interface
Message-Id: <176901390954.10662.8672885431997370730.b4-ty@linaro.org>
Date: Wed, 21 Jan 2026 17:45:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_084513_284442_2834F1DE 
X-CRM114-Status: GOOD (  11.08  )
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

On Wed, 21 Jan 2026 09:47:25 +0800, Nick Xie wrote:
> Enable the SDIO controller interface connected to the on-board
> AP6256 WiFi/BT module.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable SDIO interface
      https://git.kernel.org/amlogic/c/854583f9992671411bad28bd8a3867afba7cce77

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


