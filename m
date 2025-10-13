Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF596CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qskwUA9a0ZXAj9gIGOlNM1CbPhOSvyaPzijPhKtGdE=; b=QGjFH2ZPe1d0QxzoVD2Ddpn6qS
	zAIaDGhQ2rthipCBnszqSuB1wL3gHR218XADQvwOSRpnNxzHUwo77tG1w4tJvlQFQDCEZPClFYBjj
	vMB9njc0PdN5dy60l5QSaugR1fbYL970q1jvRwdr2f/9AWtfhgIkhy3pmoRcTlE879K8UZmJOEx1A
	ODoiNfENxQ3l2iQ3QQ2c3szac1jxw5B9wGZ9oIEbZGZwNr0wL9M5PWrS3rgfocZz4eZEc3Arnh1e8
	MLcB13JAtASnSW7HsB1Gy8fGS7R13z1yGvFwXvTuLG21WOF44rFbYFTvzyJAvz3Z7YjYZaVbi5H/x
	Fh2zQeRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86xF-0000000C13x-3SCK;
	Mon, 13 Oct 2025 01:02:25 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86xA-0000000C0zm-2V7F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:02:22 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b47174b335bso221611a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317340; x=1760922140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qskwUA9a0ZXAj9gIGOlNM1CbPhOSvyaPzijPhKtGdE=;
        b=UaI0BMAFHe2sTv9U9Df4JDKq2cjccB+QFlGLbFKlHhfLU7t7g5Qi57qVpTMaKP6C9g
         +x760ZOkqkOHvDYRv9X18f/URslj/I9P1/50aYouJ1pT6wEBpX6qajp60+ubNCXDL8i6
         VAUSMJ3+wvSGToMm7wzoChTPWXUk+xd2AcG++tfjVeC8WMEgnMFsJ4hh1ZpB9P4RiVD5
         ELwpXMEDM5RR365geotAK6XAPUL3MDyE/pKxqYcY05tggT2eUEN399lUj+SdlcPqNvjY
         WK3norYOunYgzW39j36R50HljM76MLXaK0V8ndqZrpAade7KwXnE+15QUW5YxS++CZDQ
         +dAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317340; x=1760922140;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qskwUA9a0ZXAj9gIGOlNM1CbPhOSvyaPzijPhKtGdE=;
        b=fQbGSHP0EnMPs8IkI5eyh3UkhUuxc9JJB8AmeqgJqrdr6fV4PMo5H0cVTw1siXAajX
         MCprXuHnESoNCWdpO86qiZDWL/W69TRErAvH1rhmhc+RAJqKPSQ08v/lBMlb43KxnvDv
         HotsHTDvyi/9Ai/reQkQsRuoHg+/MffjnZP7i+nhvJKBrwZxZR1mUfIEOqHiY10gm1Hp
         x09iyDA1cqcyZ4wvmOJZXevvemjkjFCRI6miy54XkG7VnaK27KG9wQmpSzi+qbMmHuYI
         wmRKQL2DR1Ie3y4ue+y4vwslijvLQBHPeUxNlQFg/j47HwYpo0juwplhEJbHAwmlsG8h
         hhmg==
X-Forwarded-Encrypted: i=1; AJvYcCXCWEY6FIS26CqO7gPFX9qwstJcj+gGJwBkh++M9M8NKP3cA3npwRrvjOKWQaLN6s7GEP1g3B8ZAVOy5+w5z8nr@lists.infradead.org
X-Gm-Message-State: AOJu0YzeRKFcnpz3AnPGS+tlk4hO5shU66i6c8zqvofZWLZWnf5QAf/S
	90yTvKCvzMGcq2ixKTLGk6gK8/Ny5m+FsDOTitTa/pLoORKNcITE60q1blbwNFjRL6g=
X-Gm-Gg: ASbGncteMI6LfWuvGOcXV+ZTNRtQh2bYUjtKihIt6w/Lgx0/X5rEIsK/ZatWQUyGyAl
	JUJlIlU86n0bu4SvqjKRuihBq2GqxK4XdJ5EzvVcm9M0kPSNcM4Afwut+EztKhWenkzbZBlYdJK
	jNl9dPh7ODxC/DtgakniIHCYu7tEKxg56amqLuHA2HmcQ+grEQAYoZj1wO6D/3ujART+9Ipm0+W
	4QzCJTIQUA9D4s5CZshbouvRGOfhbPJ++VJ5Ht+PUwS1HAtylPWDOoKxtCKHOiUll+163y49KiT
	ysIL7A3lWZ6Hq4N9dLcM5DfUm1mAvWWL7R5DJvWitxVTf72E6fv0LVtJmHyvEuRlUaTMxIjOgQN
	XR2suZe8YCS/O78rzlixC3vv/d/H8JT0okPTVYa71J5Wzo8me7N40OQ0daTylBAqmUN0HbvM=
X-Google-Smtp-Source: AGHT+IFCIddCK26dec4n+ytGNYUXqJLLuulmf2agh5auUmkxLNW5WchdvaXA+14Zkd33rJWFKcoCRg==
X-Received: by 2002:a05:6a20:6a1d:b0:2b6:3182:be18 with SMTP id adf61e73a8af0-32da7e23aa5mr14077202637.0.1760317339798;
        Sun, 12 Oct 2025 18:02:19 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:02:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250905173717.34240-2-krzysztof.kozlowski@linaro.org>
References: <20250905173717.34240-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Annotate online/offline
 functions with __must_hold
Message-Id: <176031733717.32330.16031922861063779323.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:02:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_180220_637358_9837ED3C 
X-CRM114-Status: UNSURE (   6.83  )
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


On Fri, 05 Sep 2025 19:37:18 +0200, Krzysztof Kozlowski wrote:
> Annotate functions writing to PMU registers to online and offline CPUs
> as __must_hold() the necessary spinlock for code correctness.  These are
> static functions so possibility of mistakes is low here, but
> __must_hold() serves as self-documenting code.
> 
> 

Applied, thanks!

[1/1] soc: samsung: exynos-pmu: Annotate online/offline functions with __must_hold
      https://git.kernel.org/krzk/linux/c/326312707492c136ba44cf96730e70aabc959da9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


