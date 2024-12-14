Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E72CE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 10:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCu7mGEcGuZR4M289VbKgMqdsXWF4jg/m1f8T15J6o0=; b=HSpPvOsa6IaXky5Oezs3UHChmo
	vxxdj1yOF+A64CUZr6M5GfhjlKyd2eMa2UY4/lyxZo/u0Yabsl+vteqsx2Rk+x9kQ2YXmmEA1cNQj
	gQLmoih1wtVc4m73uisW5fAK7bU0SwKaKgB0WvD0GB8BJ8ghMYLIvGAFY+J/8qPPuKTigD6TdnWXO
	8OdTZyFTM3qGMd6JC+D4Z7Of6alLJHI6gud2LLc3ti+s7zOVdIFWFTPTHi+PVOXit7iXP3qrzlIkG
	UDmNJ5MWOFDjePr22kAn2QbGz82nKJKrWbsQByfuxQdVn9W1bxNxu/EVpa3rT6SUeHrJlohPeOB+a
	E81ohuoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMPji-00000006CbH-1M4J;
	Sat, 14 Dec 2024 10:51:02 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMPic-00000006CSQ-3zGc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 10:49:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385dc85496dso174489f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 02:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734173393; x=1734778193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCu7mGEcGuZR4M289VbKgMqdsXWF4jg/m1f8T15J6o0=;
        b=gnCtg+RgPdA7DmdMofTybBXBvuW9UxEjnxNigMK+6wkucRu0+lNA90XsYlaBGnhuCg
         9VRQ46EvfVzx4AwtPYjd9pMqoZC4pVstRblPvLIp9H3/1vABklbC4IM6uFwkUbyqIUqF
         GkfixIEGCiymfY9nmUmHF2iYdZU9e7DRR93QJ/3ZUNYf9vMNbfTQox6IPSu0gs4BvFhZ
         k+u7uMrmtM/n92vBAe2ah0p8AGwvjalHlurJzM7tpUIxDBV9uB9Y4qLdyB5rbyCgbY0A
         k6jVMDlY2s4MKs23p69sgAk+DgQzQWc1Nrwp7zLg300YaASMPYWawshrnKHFC5uB8nzn
         4ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734173393; x=1734778193;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCu7mGEcGuZR4M289VbKgMqdsXWF4jg/m1f8T15J6o0=;
        b=K25Ckp7CBsF/ejPMzP/b1FwdCoGE4BFTp8AEqResSGy8J7wIctDqZiYGxuyd5o5Rj7
         nJ+/qgkNNV2rA9KBspZLecUIAemom1TQw2rOyThiTXIUJ5QF9DpOXgQIFXtQAI5ugu/Y
         Zx1GfmTMyPm3nl7uso2vXZLK7IVuRQ/44SAL5AdI1m5gc2sKRo/yHI8IUMojZw+SI/lu
         Ufey8z1inVH8zYi7YOw6wryHR4Dr0vbs8VH+8lHpNLtBRJcGdi0qf+c9BPJH8gGBmZn/
         GiNVynH3CtHHgZOxujnmEAj2r4k2eWKqYu2oD6yUYgV4zPDeTRxztd/Hnj+cruTeyZaF
         neNw==
X-Forwarded-Encrypted: i=1; AJvYcCXeAffvJWhX91MuLBmU2Mhu2Cx6BOXXzYDS3JMUXC8ymUu+cuFGFYwhmmJguM8D/Rt089uNfugVKlqiSl4J7l2c@lists.infradead.org
X-Gm-Message-State: AOJu0YyCLnpvveGm3KR2+o7Net4plabBPqFNQ2nwfrJ99lX8klCQcqda
	4xAIKpDolErgEG95PdZ3m9uawS9e+M8kfW8APWo1kvpSkMSGhimpUrO68Q/4XM0=
X-Gm-Gg: ASbGncs92MLd2Z0vV5KBUnqSMW4xZY7Kv37VBjYIzUHLnSzGIwFB3eefqXJESmKN6ZK
	Wp6JHyG6HHq7v3p9lf998DTrS3AWvC84ZDK0Vmn8O18P8XSMSKjzAqybjBq8GQKwmuoQel65CoU
	wlAk8Rt0jcEBoKQAmMl6N+vTObBGeBeQFFSQY1OBdcLYcFMDa3AZsk5dz3CYnim1fW6eMTywNj5
	3p5K8lCCMNMpuiyspsPCo9qnFr2wtt84dXY0uXQkUi2mapcbVRJjm8q+LhJV0NnrbzKMOpr
X-Google-Smtp-Source: AGHT+IG60/SDW50bjYOlyujtW1hgk8AP4csKyjJjFAbOcX9BOwT0+qYQksL5jPVErRvwdcdnr/TL9w==
X-Received: by 2002:a05:6000:1a86:b0:385:eaeb:929b with SMTP id ffacd0b85a97d-3888e0f3cb2mr1878768f8f.10.1734173393064;
        Sat, 14 Dec 2024 02:49:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8049facsm2256481f8f.79.2024.12.14.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 02:49:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241211162942.450525-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241211162942.450525-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v2 0/1] arm64: dts: exynos8895: Add m2-pmu, poweroff
 and reboot
Message-Id: <173417339174.24605.17029736808266427756.b4-ty@linaro.org>
Date: Sat, 14 Dec 2024 11:49:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_024955_817513_D45ADA0D 
X-CRM114-Status: GOOD (  10.57  )
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


On Wed, 11 Dec 2024 18:29:41 +0200, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This series adds support for the mongoose cluster PMU in DT hence
> a compatible for that was recently added.
> 
> After this patchset, I'm planning to submit patches for more hardware
> support.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos8895: Add a PMU node for the second cluster
      https://git.kernel.org/krzk/linux/c/8749e19c133e6790254252d6dc4fd16d67f7edee

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


