Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8B7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2iPJI5Pfh78RwJ7NO/ObtKaRz1jBQUIZUPPXGPcrds=; b=wr3GhjXq7E8poySaAWIJj94Pn9
	BLXCV6kx/b4r9Aomeq5XBgpLklnXM2TGundpXrnDheJLnd0GujBT/7hnzKvbAh8oGvAdLzSS2Kwkv
	ufzQ/Oq+RPM0cnCcVPSZ1QbTlON9xIdJbJVHPF9jOTTSssbZpn7bqEDZoJUozWET91rWeOftlPYdR
	ZR2ZWqa2mnLp4/1Xapi4ZoBnoWXgvPoAFzat6pZ+tutAJFr/EYFrh8koYC0oa7qoduD2hkbgRypDl
	/l5ZB5T8fpK6ZiHcAbcOIWSt2hjBqgXXt2kBRvvsofcJbuHG9aJ+Dg2AkTxFPDO9noWY5kwKYLyPl
	mTie+FoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjqO-00000000lCj-0moa;
	Mon, 06 Jan 2025 09:56:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjpB-00000000l3O-2Afl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 09:55:06 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-385d851e7c3so722728f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 01:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736157303; x=1736762103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2iPJI5Pfh78RwJ7NO/ObtKaRz1jBQUIZUPPXGPcrds=;
        b=ZqR1m4ilR4ctkYJPz0J14jMUkOTUE6TRwSjFNuF/zqS5ox/SrTB9pGQU4gxL/sv9PA
         0paPo0o/md8Q7sWToqOzAK1ea7I7PJK+F8HvLUSHYWw7hI9+8+OXsXL+9kOi7NmML8re
         x86Y9HodqkepD738yDJE/LgR6oWN6a2wrlRBuqxRzPODc97X6hpE10tTryfyym143cbf
         WKqm4QVrMIw3KuTux+4P+o9maQ+9Jf/8zIk9IMEZE26251LDUT0ckSsk6XucLsE0G9Dj
         N085XInLxVO0t57WAH7uBu+UTnH8lUl7dcEoPDvl9VbJV62pUlcfbIZ+ZCA3D4ARW4dG
         afdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157303; x=1736762103;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2iPJI5Pfh78RwJ7NO/ObtKaRz1jBQUIZUPPXGPcrds=;
        b=rtoApCQW7z6Bm/Wb8FpO7yGE32WlzL6U4VTftyj6gbA4Knl3sHRCd2LT+7xbPHMz/y
         gDA95ohFfdO9FxF2PYT+rSje7Cj624As+z3WjpEk6NCscdaVhXIsvbyCk4n7MK8QLsy4
         Jq/wiysax7t0pb8ubeKaH7cd1OUhRC9+SjyBgq9OtjVCMGqoRKksx7b9+hJIYq7V7axU
         XR0Jwo8ZklBB/ccK6WkFPI9odmUfHRrzIKUfF3CNwHBv0wn2kHbDb66bWT8yfd3TbhgI
         Ti1VDVKiUcJkFzKflI7W6JD52zkV0z24wdhYrZp4KU/f1FyUv4/nKak58fKXjgH7lQ+N
         zgag==
X-Forwarded-Encrypted: i=1; AJvYcCWBd9psAlexjoZAcKJaAaaQ+08IKNJrfJsALrsZ9QgyDgULEnLpvMyfVQ9VWKV29ln37pEifJ4X5LkJlUZWGo/u@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8x4FJIxk+s4V3v00b5Hu7nzsh+dKLRnLbRFtp4BQc6jaWQLGP
	nOJz7UxlLh5KL5GA82FNbhN4ZelywGS5b5wQKfFJ622dHrb6bp6KubpfBP3yhEg=
X-Gm-Gg: ASbGncvlJtuQ+uApoEL6BfT1TUCvVeyIAt5FThhvm9K2JGGpwtvi+1Blv7uEJ8fgPjx
	GxfRvxEz2pEBB9TsuuM8/YN+UFRoxPN50HgPF64vR291lXiRsctNJxUO47vJlqbJMFK13Vr0jtE
	2xp9vpB2n/HuWrkqVRd/uQEp2ALgAjuD9DZPDm0Zox6VVBVp+dC6+MVm5E9sVwTZcJoqK1rx0KC
	ejMHfhC/HRWPlM3ypHi9VzADe0pJy8E7XPaKcCb9R6WKFu6sGOAKLuY9WgvvLofTSHZcWCN
X-Google-Smtp-Source: AGHT+IGhzA81lWQR5haiIkxbk3kEop+JMPG5/OlSuDW4aLrYxnYZOj1Kch9Rz9kWVISox4P5OqqHAA==
X-Received: by 2002:a5d:588a:0:b0:385:f79d:21a2 with SMTP id ffacd0b85a97d-38a222070a3mr16327253f8f.11.1736157303498;
        Mon, 06 Jan 2025 01:55:03 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c6ad3e3sm49080520f8f.0.2025.01.06.01.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:55:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
In-Reply-To: <20250104135605.109209-1-krzysztof.kozlowski@linaro.org>
References: <20250104135605.109209-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix uninitialized ret in
 tensor_set_bits_atomic()
Message-Id: <173615730230.114023.7997873261724277424.b4-ty@linaro.org>
Date: Mon, 06 Jan 2025 10:55:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_015505_599418_4A258F1A 
X-CRM114-Status: UNSURE (   8.39  )
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


On Sat, 04 Jan 2025 14:56:05 +0100, Krzysztof Kozlowski wrote:
> If tensor_set_bits_atomic() is called with a mask of 0 the function will
> just iterate over its bit, not perform any updates and return stack
> value of 'ret'.
> 
> Also reported by smatch:
> 
>   drivers/soc/samsung/exynos-pmu.c:129 tensor_set_bits_atomic() error: uninitialized symbol 'ret'.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: exynos-pmu: Fix uninitialized ret in tensor_set_bits_atomic()
      https://git.kernel.org/krzk/linux/c/eca836dfd8386b32f1aae60f8e323218ac6a0b75

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


