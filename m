Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743F8D75E5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4ZH4hse3qfhm3J5KjDY1bc57PZTgGnGOXIlR6oGR3g=; b=ZhFYiuQJWlxNpr
	twNTySDtqmGuqhwgwb2WmO+ZOjhA65GRCL3Nydmy2iDyZ61k/rPMb9O5DUIQe9ZYZxrR7a3IE9tkM
	/9pu3Q+MkIsyTion0IvKB35L9HHnJFOobIF+yRvA2TFNiNURKgEDCgob5pHLAWEMqgua4WUPAYM/E
	sUrbMurRKlv6uQC05n5qj29U1cSFLbSseQIAGuysVGyytCaKyD8MxyPVDRahl+HtdkFxnGc4C2E7V
	xJ+Wiq7LxoEj4Y79PXRS6nqfPjYSar0n8LFyOmVccMwpS8bIcydtrU/oC8AOrPqxtA8s5fIpHkrJR
	LuD0hY5TfbSYVF1Mh/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEV2I-00000002fjk-0qm3;
	Fri, 22 Nov 2024 14:53:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEV1K-00000002fdN-41JV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 14:52:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43159c9f617so17965425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 06:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732287148; x=1732891948; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4ZH4hse3qfhm3J5KjDY1bc57PZTgGnGOXIlR6oGR3g=;
        b=nZbt2NmCGrRmxxCuPq6ZA4bvkDl4Elvza4LpGdg7jWb4pYXtfbxOGyfI9NsCmC7EWy
         WPcxfTa8xc7+cp1FIq37zUL6sINbVHtQtQCPvQvG58spKC5pSmOiwNL1QDlBHPfNDylt
         zEsVfOJf/1/koySzLAuruFUrZZ070X9XxAvhNPbrCRLPyxFJh1Kjb7r9fhdTUXKt7stp
         sj3EDHVtowSp+EbhgUe+472LGFe24D6rhqnelbY4uwjFfRuTWTWJeqPJ6Kr548MJOrv9
         bW+acWox82ip43Ah/dXlT7OBKkK8rY6J3LxDSGnqdotJQiyj9/omZ+i6+XrAuU1zUSYu
         IbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732287148; x=1732891948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H4ZH4hse3qfhm3J5KjDY1bc57PZTgGnGOXIlR6oGR3g=;
        b=GnxCNp0l0FQGQ3tG/pBeLTjuCHYkmkSp8vL97XUYhsPAKumlIXR3OUqzuZsBGr47Mi
         aGtaVKfHoJACva4XM2cigHD4prDxYWpL4pYyUraSdAQ/WXRzorop9psqBiEhPFdgU+1M
         Co1C59UMYZewUZCtS3xMMqKtSzZu8CGXFDk/z70NcjlL9XUNeUgxAk4iVdMV4hXnYixc
         Ac/+LRQL//QUYbNEtSmAJMNWxOZgM34OdGFDvwlkynGnjMfDW/MwiWyLQ3ulqcufSsZC
         tBtZosS3ndT4ewg1eDsJxB0D1xCQm/d/fnRBnRAiJP+qe8Uo5H69H/krMAYWDuR65tvY
         KZOg==
X-Forwarded-Encrypted: i=1; AJvYcCU8jFLYsaY6kPXYo7c5sRIYUxRdswa7snyZntnX8jNoGbO7SkMeMKnCSSXdnk8IEuQjyTmjDlm02URNNntLTXRF@lists.infradead.org
X-Gm-Message-State: AOJu0YwIyxOs1WjyJJvUVr+/uGQYuqbifGTzYHrgEXMe7Gy5sCYRvbWM
	qdkR895Kn12naln+KJkpSPOtxkMEyZT4dP3cjfnaVkhijhQsEr+utdEMMMKL10I=
X-Gm-Gg: ASbGncuzdw8Ts2cwOQuFNQAcPryxIfX6hLlWh08egtBBkMgMyejbZ7zOYMgfZ0SMOoq
	58XOrgozwzFBY9XESSKbp62IBchBNwCyy25bw2NEy5lud7T9m6m+G5A0/LvjDX8KMJ8DUqHYrA6
	kQCsffGHe0ua6wDN293exb3VV6HwmN/lR+2eCiRpxIwX/X3BXiEav3Hkcjh2U2DgxOX2k8Eb2Ds
	lZYZndy8DAJJy8et6QDQ84sXdAGv3bb4XER//WA5Vlp9087dyaXOxK8Jg==
X-Google-Smtp-Source: AGHT+IHsjxLFgEV15mKQiBicElXEUDVmwQhGml7xxTkNfAnsEvktBECCBV9Of39mNkEwnuKWhKEvsw==
X-Received: by 2002:a05:600c:34d2:b0:431:4f29:4a98 with SMTP id 5b1f17b1804b1-433ce4c2319mr24740675e9.20.1732287148506;
        Fri, 22 Nov 2024 06:52:28 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432f642f15esm117534725e9.0.2024.11.22.06.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 06:52:27 -0800 (PST)
Message-ID: <a326f5ab-f36a-4210-83ff-0f2ae9fa830d@tuxon.dev>
Date: Fri, 22 Nov 2024 16:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: atmel-quadspi: Fix register name in verbose logging
 function
Content-Language: en-US
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241122141302.2599636-1-csokas.bence@prolan.hu>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241122141302.2599636-1-csokas.bence@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_065231_308250_9EC2F936 
X-CRM114-Status: UNSURE (   6.42  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 22.11.2024 16:13, Csókás, Bence wrote:
> `atmel_qspi_reg_name()` is used for pretty-printing register offsets
> for verbose logging of register accesses. However, due to a typo
> (likely a copy-paste error), QSPI_RD's offset prnts as "MR", the

s/prnts/prints ?

> name of the previous register. Fix this typo.

