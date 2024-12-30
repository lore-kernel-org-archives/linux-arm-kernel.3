Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E09E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 07:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cxUukmW/HtO3A5IzMy4WhojBdo49UTX8VOBptMlYK0=; b=ampIqU5C2UA0gdqfbVOs5TLtuP
	EIr2yQxLf29xdcgdsDkS0aEQJrvurMOwUA8YLmPVIkFM4GUhjd37rsYytT8iwJ5eZCEeYkaQv7PYE
	vBpszLeBGdRopjDaxmoIpzhToFeXVLyDhylYdPoaqBgGCpwWolprRbKPPyRzcMoSdyzzXv7IFuSpn
	p4yFRjMWNSchK9Wbxg2yOO+8uJh7ZPsgo99cekroG8XozVq8TQhi1aDb12hh/8dr7UnuMZcrFgpnl
	7V2qgFKnKM62+/P5RQ2IYMMqbxhU/+8hWsmX1nYITP9HGvuTt985u+n7gjvHDAlxes5BIUwsxnqQM
	pkQm8Xgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAGK-00000004jgo-49pz;
	Mon, 30 Dec 2024 07:32:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAF7-00000004jZB-0q31
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 07:31:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3862e2c9bb5so516893f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 23:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735543871; x=1736148671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cxUukmW/HtO3A5IzMy4WhojBdo49UTX8VOBptMlYK0=;
        b=Ldj3PBxQfgBVitdrfc2ZynxPPJKeydyMWrQir5Q4NbHhv3pbZiy0YXrZY7B+qmofD+
         QMW4guqMmeKl5qkgQ6VcM5Z2hIN2Jvh8NNrwRu8LV+9plEoFW5dUA3l6OM2YAzRgeaJO
         FDa61u9d7oYcry3MjrA9Z4eLxd3nVt9S2CpinRxC1MiGUvJv83mh9qT5rKEe7M8F5rJB
         dlE2o2gpdCyeQ1pm0TLjt1F4QpFGNa2y1yO59L4NVVRjBSYZqK4fspVKh+4ADQX6v5os
         +M/KAPhS67RnfHSUUGkwoK8bUIEqtJfthVXPKPHDMiG5RWSNR9qqg9f46AvI5zLuTCC6
         CUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735543871; x=1736148671;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cxUukmW/HtO3A5IzMy4WhojBdo49UTX8VOBptMlYK0=;
        b=f9OseC7tyrKBTdMt9XnWekeyVuf+iMmXfbu4tXhwS7dIIORb4J2bYFuyTGtzItZ8+a
         zbEHpehyVfCaD9PpnnRkOaK3ZL1QRPJwbfHniZikxnWHxlxukheSTliLHSkjs90Eol3J
         zK2QQhuxjPBXX0VRaj3Im4sxEqrUlcjeGvCAtBYP5TZUTx43GXtVFp7erBxxPdPsKa6/
         eop8zLxycC3UKTlpivuKOcdV4nWCVSIlifUr8myYGiGT3p+9k3bk9ZahYFnbyx82UItT
         o8a7NnApwTUJU8Gy/OoB4Str9FcXck8rlzZLhHnnXi2PAV/b5KSxZrjLHlWis6Lz1gZK
         4tng==
X-Forwarded-Encrypted: i=1; AJvYcCWz2+adOCug+SrverJE8+5HTIYBOtfx2SMXt29wGxvyr2ptVoVJJ5FyOu13tj9JG7GQvX1YOtHQpa1JkzO96kLB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1BsL3d01M6H0D5HMnKLW/K48MWQ/gRbM59qUMuShBhXFg7Rfx
	dMd6w5mhyJKhmKCrfz0K2zbBfWky8WwzB+voxE1ufqQ5heq+97QDOXAYD3xZsQ8=
X-Gm-Gg: ASbGnctVyrQzFJ9wi495+BOXom6gehs+XAM+9CMBi7AEk4f0ZlSH9OP7LvqwbdrMXiV
	/4pTqplecuN3VvZ4jvXHKaI6XOsuvyYpIRAQsxeudW4xH3KEd/I/9mRhhPkGv1ARz8/ol3MML2I
	FLWdo6CbzGAOud2fSUF/WVKBGyG98bmurnanGO+Uj4bUORqLbLjx2ahK/IniTxWBlN8zuls0Mx5
	8Pqd283UZP/pqLj2Rq4n/C5mkKVeBtBxDz9b5UqcxkUoRVszXzdixWO8HqBOnUU/dQ+ChuB
X-Google-Smtp-Source: AGHT+IEIbHfQQXjbtACZcOl/EYF1eksRr4G8aqfzGRbLMEkVZhWKVQt3Ase4890cxIGZ0+c7ItcJyw==
X-Received: by 2002:a05:6000:4022:b0:385:e374:bd4 with SMTP id ffacd0b85a97d-38a221e1f74mr10283672f8f.3.1735543871026;
        Sun, 29 Dec 2024 23:31:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm29439462f8f.44.2024.12.29.23.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 23:31:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241221152803.1663820-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241221152803.1663820-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: exynos8895: Add camera hsi2c nodes
Message-Id: <173554386976.7938.13644139958887004032.b4-ty@linaro.org>
Date: Mon, 30 Dec 2024 08:31:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_233113_336520_A5DC9390 
X-CRM114-Status: UNSURE (   6.09  )
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


On Sat, 21 Dec 2024 17:28:03 +0200, Ivaylo Ivanov wrote:
> Add nodes for hsi2c1-4 (CAM0-3), which allows using them.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos8895: Add camera hsi2c nodes
      https://git.kernel.org/krzk/linux/c/f424523b1b516b3f0984feeb1d8218e904d17a97

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


