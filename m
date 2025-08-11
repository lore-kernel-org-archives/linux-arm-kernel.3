Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DBDC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lAJkrzYbYXDdUOmXoNrO2X+aQxNISX0LyszDf4L6FM=; b=ML8sejUmGjab7XzVbBglcKGiS4
	gPHJFY/zzTo6Yfj1dC1TqBnKhAHOkTT/QiljUUX5Xd2ZLYTL9bd/AyqtWwGyhmiBdsuXLcKf8LQ2c
	4/msjoAYVcpzI7G2y22f/ItCEUvuMJvk4HAEs/ZLf5sZjYjcsbhi6buXG7xwlcKv5hluOr8JBf+BO
	iMxtyK8nkjiBGmkwnAXoH0dbm+sPE8fwl85ponCUkksoBBJ9INNoguhyw5gHrNJBJrT8JBA0JaJYI
	RJAgAaVQ2xrS+VolEEFNCuqCgxk7iAaESFD5j6lV9zODCQQtkiDg5/D/QyyIOQHXnRo+Y/PU+VqX5
	ytB6wZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSA0-00000007kdf-0YyH;
	Mon, 11 Aug 2025 13:01:56 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulS2u-00000007jYg-2Z8s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 12:54:38 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6155fbff3caso707614a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 05:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754916875; x=1755521675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lAJkrzYbYXDdUOmXoNrO2X+aQxNISX0LyszDf4L6FM=;
        b=JQHWTH9aTDS4ioV1aDgbONo0hwUqqbXdwIYfb4KAeYD3Bpu5/2gzoruBrb4Vp8Z2TC
         MuO+UHs90YPbvKgBkLuqlHvcs/yT9gYgiie4HU0Ev1uaoz00Qo+Xpeo1tXCgHvQq+lmW
         VmqAnMiKIspmPMSSzFKSqB0zkhJASRkzhjgyyVrUuKlmK3qvyypXaWerrHDaTUY68b7e
         tD+dxyOB/fZJJnw59aUlpmVJKA3ZoOpPgPOctrM3pfC9qg8JDdunN0H9Z046j6dCl9RG
         tJ2aTTZ7u30ItZmbrmnA/svw8bjgoCtc9rEZjLhSA2q07wC5SR2alnfO+/w57Fy7npbv
         fUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916875; x=1755521675;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lAJkrzYbYXDdUOmXoNrO2X+aQxNISX0LyszDf4L6FM=;
        b=vjGgJ3eBSCP+7klxtbrSnT4raJh3FsZSs4kcoLhYg0T7yWj5T4aKT62cS9zJ3d2UjX
         +ZZTpEZ7FLROTGEWCFoO7BEVpib4Wu2+QGtychhEVpwkGSzqB4fWd4jwYku9jrzmT+jI
         5XdifF4XxERTZH8J9IGjfCkG/196J6xvd0BW+9KZIBmtn8xFTb2TGpiDqpCHQnNHWfex
         0/Hb2OWHNeGitr69Z5SVyZH7tCj2ckRCUm/LlCGyUQ3RsQwDT8VAbn3sdPXgWdwV3QEI
         tWcH/LMACTTYMlchyyrh/I3FvcNYfHK11nvRUvIs4KDv0ToF1pOIWPsdz4QyLIi62bgY
         4jrg==
X-Forwarded-Encrypted: i=1; AJvYcCXFwQUzAWMEmXY9VZhUmBjMRbjU3t+e7RjXyo7h6CGAWU9NGQf0787BLZYTT0WEZQyiQHZNg0zQOx6A9OV1pBaN@lists.infradead.org
X-Gm-Message-State: AOJu0YxnvkW+m75aVhxbi4SlpFsQOeJC19P+0Llw6yHZPntAe70OHKma
	5fjB/LIKC4//vrhnAbv5BifgW6CwTGIWz4AdRFZ9jhfCe2/xADRoLcCAiUEQ7ut5LXHdl7eQ5pP
	cU4M2
X-Gm-Gg: ASbGncvgLNqAa5/2B5Ce3Bc1NFrQUwyQRgQwWIDEvpcOofP33WQnxGYN6rPOZsaa+Mc
	bbjBRl9tBunjxztc7udkrcQ+PpYTcZRdZsPY6qt6PcBmEb3NDgPFfexu3SBUfrkILcJgJKIFD1O
	ZGxxCkZs7gHUHAjx2VaYe9PVuLWgPoVwSv9zhvfqzsreggsIeZPS+0DFOp64oNT8OkSNguK7x96
	5uucvjgYc+r6YKEJmkjqAaBfOMc34JJCc6i3oagci7/YQ4yx2F0pPixikx89gk99PNLkQFHUglP
	p0XpQY1SbeiGvMkm38rlTD0Vfls9GIbDQLlRke5Qx5F3hg5bdABbY7pVAXbymkjdhH4XgDI1PqR
	3NY5IabqozQSJcXhrkRHFTbEUKywrOf7aSEdj/50=
X-Google-Smtp-Source: AGHT+IECY43uJOlj+dSXwBjNh9vS3ub+xUvRPR3BQ9Imlbk17n5tAWIN4VtFPlQp6xo6pwqAMMQMiA==
X-Received: by 2002:a05:6402:40d1:b0:617:be23:1111 with SMTP id 4fb4d7f45d1cf-6180afb0786mr3247729a12.7.1754916875030;
        Mon, 11 Aug 2025 05:54:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18727470a12.13.2025.08.11.05.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:54:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250807-upstream_omm_fix_req2ack_test_condition-v2-1-d7df4af2b48b@foss.st.com>
References: <20250807-upstream_omm_fix_req2ack_test_condition-v2-1-d7df4af2b48b@foss.st.com>
Subject: Re: [PATCH v2] memory: stm32_omm: Fix req2ack update test
Message-Id: <175491687378.136727.8468527575102760404.b4-ty@linaro.org>
Date: Mon, 11 Aug 2025 14:54:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_055436_659723_2885AB26 
X-CRM114-Status: UNSURE (   8.53  )
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


On Thu, 07 Aug 2025 09:34:09 +0200, Patrice Chotard wrote:
> If "st,omm-req2ack-ns" property is found and its value is not 0,
> the current test doesn't allow to compute and set req2ack value,
> Fix this test.
> 
> 

Applied, thanks!

[1/1] memory: stm32_omm: Fix req2ack update test
      https://git.kernel.org/krzk/linux-mem-ctrl/c/d140f3ba76ac98faad7f9b37ef5a3dcbd57f59e2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


