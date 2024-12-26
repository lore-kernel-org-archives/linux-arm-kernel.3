Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F4EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 17:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOKmxq7sfOT/dN+VcRhgWDRuv9FZCWqojz7j41kMClM=; b=lxtBEpKXycSwGdgcp0OT0leSTb
	uCwj4FDC4xZzYOkFqExFjZO6yFhnmFxLgmGZY8cP4rB8Fl7U7ty3Aank8yDqWQcZ1en0OVQu0bHaf
	v/ozJd+tTckqSe/7rdoPCjRmvMwe6MSb4ulRL85+pqBmZFQ1EB6o5NcdjY+YUgl4Gg5AUjjuiUbdI
	fpKw43Aj0dnRl+aKQNSeeL3e4oCLq8EaQzBqB0YQGwxy/QmK+yrLxI2IW0bMskF9QYNTynYH6CVOY
	4lAtvjZ+Onxu1BKjtWGMzR5aADSCy4sIyiRS1E2JBaTfXXtdYkObusPX58ryDpZSTSUlHPSSkXI42
	+JyHpL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrik-0000000G953-12D1;
	Thu, 26 Dec 2024 17:32:26 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrgQ-0000000G8iD-4BdL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 17:30:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21675fd60feso101453615ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 09:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735234202; x=1735839002; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iOKmxq7sfOT/dN+VcRhgWDRuv9FZCWqojz7j41kMClM=;
        b=EvOviOVOQ4eiFF/vjRoZ7s1aHe9GA3c1MjpSVWRhFA6i+1qO20Z3rLfKBzwvF22sxe
         /fQGSj/Rmbuw8fX3kRbR6U/TvSua+qsRCySQqBQL/GlmcT4ShBTqtZTLzkrUdjq4VKXg
         6AwYmy712EADWnh4y4FPRZZpfIqG1AzWsL27cdHkEbqwJ+VYOzqpJ3+bTMpytVkLLFr/
         t/Cp8eZcAmwtfiGMtGyvylDJkTGjO6Ok2n4VXaqC79qHSu2itaHxSYmYTWYjJkYMhM9c
         4/sSkeQQDChVctQlQSo1zo/D0j+OU3QtoiAVHGIUiunOiiWGi3gqgKQx5kVt45S3fHl+
         Uusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234202; x=1735839002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iOKmxq7sfOT/dN+VcRhgWDRuv9FZCWqojz7j41kMClM=;
        b=ReCb3zCm8WA406QK4BwxPynuRGzefguURULJLhm7nUufUiIRlEZztIuA4gddtuDiny
         UCUHVpsAdwWKmnDPfXWyVNSELsm1/wo0e589j+zdqMm37UAt5Z+P9ShiQ9j07lcUSaOh
         2Jfmunx/KaidpKnVBhny5DY3ermUMGiZxnqbs95P9HXYQ5962kkVb3XYfpeoLWPklaUX
         /y8Q4pSCaSyspQotT/dfkWCxtojnsX8GewIknfVmQuyqOaw0J9tF20qGs+ksaY+81uLs
         pNF6nvA0HqMPjl0TxglmdZcOGhtK4UrhLJ8QN/bsDWD1iGNuU5+FPxPOXHQ1nrWNaF8b
         n/5A==
X-Forwarded-Encrypted: i=1; AJvYcCWO4L9GMGi3Jf4i5Y7AR49rE6jBdWLo65SlhIJPkPx4A/m7ZrDnHwTVxFMubQLGlkgIdtvrXyVd5ybX8+SUV2cj@lists.infradead.org
X-Gm-Message-State: AOJu0YyF81kJN2WWBHaEnoo6HbBDfIrUoSp+/HE0NDg5s7KbltGTatxB
	v7conCFpjXWDVrH5oqbSsEG4f6RJORwRcCm9JEUBj9jnW3VufM9VxG9ly2gO5g==
X-Gm-Gg: ASbGncsUmBaYrWUoXfT4huSIMLF822EamFhnKWX3ChNbGXhxCQ27D8sVRbYBz8n0Re7
	n7VbYm+RHQ/l2gQn9SVyAR0TQmDjF/tY+OVfv6S8gzG+SRCIzpBvnNiVELESSMNY+FiycWgssTU
	1T05abcv8DrmcEmwFFuOfzdbE0A3VEsAshN3SwftLJ+LdFLxLFwt7JhwjMcyKbqpa+JFf+P8h7A
	ycDnKZ/u4qK2IwYyx/MDSdpHXox/u5ZuvGAbK9JTicPdwHGOfKdbJxToGaGGOGgQS1SH/TnlHiM
	1Rd/RJ5PAJpymI2obO9nzoQe
X-Google-Smtp-Source: AGHT+IG3DI35X7q9+bCJb3UUFJu2GLGQZKsBEiV2vr18nzsLloa/+8mEp5KjjNsc3tnSau1Pvhjxmw==
X-Received: by 2002:a17:902:f652:b0:216:4676:dfaf with SMTP id d9443c01a7336-219e6ebcb75mr320751155ad.34.1735234201256;
        Thu, 26 Dec 2024 09:30:01 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962961sm122281025ad.13.2024.12.26.09.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:30:00 -0800 (PST)
Date: Thu, 26 Dec 2024 09:29:58 -0800
From: William McVicker <willmcvicker@google.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/7] phy: exynos5-usbdrd: convert to dev_err_probe
Message-ID: <Z22SlgYsmFbezV-0@google.com>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-3-f5961268b149@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-3-f5961268b149@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_093003_041441_0F7545DE 
X-CRM114-Status: UNSURE (   7.68  )
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

On 12/06/2024, André Draszik wrote:
> dev_err_probe() exists to simplify code.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

<snip>

