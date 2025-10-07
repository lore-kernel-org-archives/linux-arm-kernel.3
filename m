Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D962CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 20:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hCZP75SmDHrCZY5PWLz8NOVMBMSMd1PrqQADWHi6tM=; b=jTBYkdrLaX6pSFpt1Osw8aiQQI
	P1AXkXGxRM7tKTatpt2p664frItfwcPOZ8gv5gXnqMn2XiRwUKT7jGpLuFVSjxpKOanVCYrgXKl80
	XoqEtRrINbgHV63vEzfRoyTqtXUQM1KiIsHInx3Zk5lOzWJYgNnBkszuarBiB7ztzxqcD0oOiUbS7
	kmmdsRucXOnvnsAheqxAQJQqPciHjWhMARnUGWzc8tfc030XUTHaBsIMex8RRCn2ticJ34IzcOc2e
	kXL/IyGvVMw2Y5W05u4GkIM8G61o9+7QJ3SJk5lC97iKzy8yS6g581Jt6l5tCZmkRAiHuYA6QN6iV
	p6ZBCw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Ege-00000002maS-3Fsr;
	Tue, 07 Oct 2025 20:53:32 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Egc-00000002mYo-0Nos
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 20:53:31 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7bdfbc6ba5cso3106388a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 13:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759870409; x=1760475209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hCZP75SmDHrCZY5PWLz8NOVMBMSMd1PrqQADWHi6tM=;
        b=GUhFHIRNWDjOexV+Fbx9ARmRhSi+Jrpwz956eeaT2e4wPCzZyg+TyMw4WoPEYztuTh
         Z2zJDTYgIWVGGwT2RQQUL4WAFrRu3P8JloikFSu5aRJBsrd0GsGZaBPTn0HxCuPleRms
         KM89IqqffB8mwyJ7NcION3az8j/+P74KqshNV1TDEmg74iCDVxEi0jGxhFIS3sIS9pfk
         NGfnt8MCCvAzsKxeaLkBa3lfW+uStP3cN7qgs/Ji05gpWddLYcyLLJKBesqA4l6sGcA6
         DoWH0JqHm/ujO0L7pdoB/FLdTgWxEPz1irOenYhu6h0baWhqPSCdooqitq5Dbej+eYb/
         WBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759870409; x=1760475209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hCZP75SmDHrCZY5PWLz8NOVMBMSMd1PrqQADWHi6tM=;
        b=GqtaCE180Oo94XNQW81vbZHAJ/r1rPNu5FQHE8epqCxlNTm9JjrywuLqK/AFseql6U
         WfgXwjR5PTZwT+Tbmq0op/n4KzETpxarMVIB79b2ZHzWLGbt2D0pjgHFPiaL3j/JgNeW
         Bh80CokHKIPH2kjf/1D8BVSSTto26KoDJyRWWy0PgBU3MFJOQLVHSx1V3KapTfgQ/Jbz
         3PMLpAb+b+cCbehncJ9KTD0X5onBVHEraypRWHczTnuFtKtP1nTsEMPfucFDyFWCbKGQ
         JSi7tPc4IqG59DewiFrjmHcZ4pWCjvLdK2sK4n8p2iw043GG230Xc8zLN1MLvm+B+QkB
         rGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkK6TSW8Y+C53CztSq0NoAT//5N32uvdt7BOdwRBDGdDn3rf1eJtmdm34p48JVCQGcrbzkP7fW1manlc18ye7o@lists.infradead.org
X-Gm-Message-State: AOJu0YxK0M95EFI0GKviRgnje6976GrXsJFqUm0stHmMB8OaR+H7PVIw
	46EX8xBGbRPM2/4Q5ZXWlDzS02SiTrfMws8wkJquUqZQYIXFbR9Y3ukpbc9ZlMtrr7KfCSG4Me6
	Gkk0Sjr05NhSbUXpRAAoPKc2LMxo9ea3QpvSbiLvbYm8u3VCi1fCHEaQ=
X-Gm-Gg: ASbGnctgt5DfNpL9gzOcxb4a++qogshA2TfTm2YwsXiaDe3B3Uj3n+2YxOW1HzLDlnX
	fRB8mqaDkVKqFPSECnkFguIoQ9L6tdI+uwDmUeO+kQuoMPA2lkqlnVWFcMSul5TvGBTO0wYVS96
	2hk5Jm/pknoNiJG6wXBrCys0fJBDt708VZ08wvzw+QlPkgmsOgdkapV4ItPY5M6I8f/OAbQJeaQ
	zcZ1M8ZUjhVcLFn09eCu1EB/lJNjC31EpUDSw==
X-Google-Smtp-Source: AGHT+IFQJZVs4LBnBVbWSGDsdN3906KKw4UjF5sMiH1fvSeD9gn0otajPAH5kYHA1+VAEseWAd1TdVpRyCmSlYYSQ1w=
X-Received: by 2002:a05:6808:1988:b0:43f:57cb:7f83 with SMTP id
 5614622812f47-4417b3e3209mr436998b6e.46.1759870409126; Tue, 07 Oct 2025
 13:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org> <20251006-gs101-pd-v1-3-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-3-f0cb0c01ea7b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:53:17 +0100
X-Gm-Features: AS18NWAUUQxOHKEKFHDJ43bMyMuc1k66q_SOXE8Wv3pAaENJrBaMTokvZjBYJtQ
Message-ID: <CADrjBPoharrk2BwLuFaAicErLxZXre+gSSqwws6Q07E4C9f8nA@mail.gmail.com>
Subject: Re: [PATCH 03/10] pmdomain: samsung: use to devm_kstrdup_const() to
 simplify error handling
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_135330_132350_9E5E9F6A 
X-CRM114-Status: UNSURE (   8.72  )
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

On Mon, 6 Oct 2025 at 17:43, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Convert to using devm_kstrdup_const() so as to simplify cleanup during
> error handling.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

