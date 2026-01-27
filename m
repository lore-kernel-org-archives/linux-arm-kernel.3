Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E3CD2FEE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 21:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVg2sq0i2FG6o9FjCNKPhQuA6q+fa0mYRD/1zcVfWOM=; b=iGP+IWMgaydyYfWtmCbjM6rqhy
	U5K+NjkfKtQxmy7hqQptpbADKRQUp4SI3Vh4UjWHdkLkLl/G13t37Qahz3YFzCfUSREI8LBK61Zir
	mkx0wvcN3Zr7dl2vbyG942CgaBAliKcXjSqHXQSooD0kFdnvVp0PmZwvPRYLQTkGNyvelY29SkmOn
	G+xVLkvX43zu8GT36cyFYsUQ4xi8giz5uMp3BLq668bUKC4WJhonnPMiLpQakt71RkrO5vvk4y7Lb
	jAg/CR4WPBLV6HUToM3cn1T/BLm4r90rs33ZirWKj5QZFcGOMlE65Ir9tKuKXNZ/fdn0cDs3XyVaL
	g/AFJF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqYn-0000000F43I-38bJ;
	Tue, 27 Jan 2026 21:25:17 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqYi-0000000F42X-3xmb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 21:25:15 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c0c24d0f4ceso2195653a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 13:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769549112; x=1770153912; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jVg2sq0i2FG6o9FjCNKPhQuA6q+fa0mYRD/1zcVfWOM=;
        b=oiW8/6HeXBRnRMuRbO20LhOk8wBR5LMSifmjsaI+SyHBBZDC0CWeH4NlP3qDUTzeUt
         AvW1/PXaxskRjdQZoyIDnAi49FPhp44KQJCYvcMF0ziWabg6OroSWBQrJNMtsUXZ0Z/f
         WHAWEmfrRbpV1rxwkK+r57gFPF6DKMKSF+Mz7FKy7x2j0xSbx15VqQVdFYqETfhYLHGU
         0DAqZBbqNIIBpXOAB9fJ5j5oxHHQoa5haKnbDNTAhLCuittEOTdbwRFDDDZe/rXF7y2r
         vCuvSzbtvwP9D/+wCe/tLCwFkHGXATZQNa9rPOKYUXtcYkOq5G8nohqS4H6rD2Jq5Blz
         +Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769549112; x=1770153912;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVg2sq0i2FG6o9FjCNKPhQuA6q+fa0mYRD/1zcVfWOM=;
        b=FFZ9SdCc74mG79/av1Ug9FAosJ1Hv8ZQKCQAFeMgHx5q2+Rda/g3b7EZMSFJTpsy+E
         ++nHIYJA8yd0GsnqSEb7oeiqG9awNxZEepyraxFlWxbpXrhrTMuCkJk56HkdVuK6u5mx
         v5OiMoCS0/uMm94AQBEW2icz4N9k7BU9JY2AuMAsSLG2aA10sl+kFRI50Z4ikuGo4HOW
         8aTBNKZVn3cDpm9FlAIo1Wz4hZBieezZaCvSC7NoDPqqS0yO5d6J+njf/gsyaErve7zf
         JdWq+W1ESi5QZdq0Kcf15PLAisGs1L8cnJNT13VUzsn060sM3kFkIZatJDNrtPfvFLdH
         Thrw==
X-Forwarded-Encrypted: i=1; AJvYcCUsoZaX+4u39AcvOsH2Sg9Dt8Lpf+L5Rzptb+2W8EXOpqAl0hbEv5gWGghCvKFd/GkIPTJBAWpzQ68e7V5UfbxQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyEC1slZnHI9WCvvk4UeHONOHyQxuD85GPITuXRAVt+ZwgMBIy9
	yaVSjMxWVNPl3tysruZYLLFrwDlcQAKw4Za5SB5FvAu4Gguv7KN0C5kZiwwfhITEnkY=
X-Gm-Gg: AZuq6aI86lC7QSZI8xmxx405MX69ZtwwNHUj3Tqo8ljqewE7pi+59LBmruntprux6cO
	1ZCR4SGl21g/0vITcwUQyK4+p7Nf8myecmuqwAwhwHDGOaJWCC1ko1I2ot6BBDjTBUB2ctUb9wI
	9t+SIb8yeSX3N8R0rt1Q/SBTL5X+6bG0LraqczlmipvLPMx3TQq5LdzvPF3rySVSv1/eDc2FU4+
	jz13RQKBvpatGAHvCDZw4yl96fXrsX0bV7qJNs1usVmDTEuX+7NvcQjAS252VHlQFzVU6L7WUTY
	nGW/4s9e+us0elGCC/8nYPw66INYsUQvgLyGOwBFUWBeZFWFkiC+08xyAzjyJGaqhk4md6a6Nn3
	wBznrnMn2OmUzhP+et166zlgRdW8zoXfCXA/Rn/86M9gWOi5P861we7YUjUKUfkUvtHe7c+x3xC
	c/zypBqYfJ
X-Received: by 2002:a17:90b:3a81:b0:34c:cb3c:f544 with SMTP id 98e67ed59e1d1-353fecde876mr2663861a91.14.1769549111946;
        Tue, 27 Jan 2026 13:25:11 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61dfac1sm3475922a91.9.2026.01.27.13.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 13:25:11 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, Dhruva Gole <d-gole@ti.com>,
 linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] pmdomain: core: Extend domain idle states debugfs
 support
In-Reply-To: <20260119143121.161583-1-ulf.hansson@linaro.org>
References: <20260119143121.161583-1-ulf.hansson@linaro.org>
Date: Tue, 27 Jan 2026 13:25:11 -0800
Message-ID: <7h8qdi6954.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_132513_232814_E87885FE 
X-CRM114-Status: UNSURE (   7.51  )
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

Ulf Hansson <ulf.hansson@linaro.org> writes:

> This small series moves around and extends the information that genpd shows for
> the domain idle states in debugs.
>
> Please help review and test!

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

