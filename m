Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DF8C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2B+PdwnV07kNbcJNhPLT1/ZZi6u4wFzi0KY+3/EKxhc=; b=kK2Y2uuVth8vWhnjw3CeVbOkT8
	h/4qUKfVl+bbsPqi0K4PnBPY6Xxmvl442JhmDh62BoqbOXpR3vsMPVu9bdVzB5uTnsPZVnCTA324J
	jVCrgdu2dC4YjcBHJFSHH+OhXLRfsCF0fPWToudjmlscOGGGA2lKZ1SQ3svIXvn0sR34aYOs+zHkv
	2SvJKYnFYZc7NuWuUT3wTOlBRw9+CKiJqjEAbSbmyjyhS1HUkxucMcTf4D+Zc7udpB4xnjPDHHaem
	1UtsC09z3LBgw7KFG878P5rSTr8ylIdAIJbKYL9B6FsLfQf8cAdnvEXuv+lLt8SJGeuPj7brEtVh6
	JDl+w3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNp9-00000006qHV-3tca;
	Mon, 11 Aug 2025 08:24:07 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNNy-00000006lyA-1LkG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 07:56:06 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-61794547ab4so510330a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754898960; x=1755503760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2B+PdwnV07kNbcJNhPLT1/ZZi6u4wFzi0KY+3/EKxhc=;
        b=ClIfpGCl0Y+QWEOKMlHXxj3oIIuz4oDVq32lKBU9XD3brDijP6nKJJpG7+GnQ8KuE0
         fW1aCsop27VlqfoMyGI7sP1w304toAnT5FUdb66qCwfWAHvsyG6NMomImL838diwzLJq
         gbf6ibg+pEBuz4bq2wyTZop06qckPHrqBmYnq1i7LF5eT+8dgd0+Ihe01EyG/RGs/4v+
         UoazMB55j2/ilf1LvdfhoPznrq2u6FcW+qRIiI3kmS++pEptGEl9xAy9JNQZ4krK0v6u
         M/9fJLQpE+6N8QTIPXBH1+1z0bnQTj+Rpa2FJ3XAHZdHwE8MXOhZFGNPvUVWt8IT3j0N
         Q2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754898960; x=1755503760;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2B+PdwnV07kNbcJNhPLT1/ZZi6u4wFzi0KY+3/EKxhc=;
        b=af7Edn5Ek9rydH+0fUbtQeIf0ceOr03OZWvqDf/rN3DQcMpgVpJ7mjFAB2xWHDWuH+
         K4o01A52aOy3IuJIWV4rR8Eu4jEqtd5rXYCs5fnuSpxidFg7dNAHOF0TLbD7lkL2JHCC
         DDDMIJV9xpfTEroV95raZQyiiLzJ2Zf+4z0ICLPhMLxeWOCr5CGShGB8Xhtq2CM8ZVTH
         WSawpvfPjIPq72nBTdLBuOGj4vChIoL06OOpjTQ2KzdKbp8luWgvCwi1p5Ywsfd3HlEo
         2dch3dIo0ZttlKNU7CKR2YgjJBLFj8cnoOgoDEz+h/fx+dYrm03wS/pgRivn8dmOyzKD
         fA9g==
X-Forwarded-Encrypted: i=1; AJvYcCUTRkewiBoPzMT408WNOtQ4vj+iO1qGqfo5GNsSVCei+KojLCwexgImm2t9sm9YlG7vnxttQS4+1vS4AN0fcYAf@lists.infradead.org
X-Gm-Message-State: AOJu0YyB1zVvnbbHuhACapJ9gba3ctq5KFvKZ7i+be4/OT+z7+4HEhwA
	aoknv9abb5bX4wfDPsIgmzxF5/V6DPRoetepapYzYt9hQP5MJPUQBm9bhGTyRqT8AtG1ldEogrJ
	3yv26
X-Gm-Gg: ASbGncuL1gb9szeXWJpSyD8m0lX1QoDsz852Aqy7fhtNOxuiS4Vf1lfKIo7RFpTIxSp
	U5HE3hc3ENet7+S521+hLzVwEiKTYVTfGczmX1AEYmsLYKlpwf7liAF+95aCirKU1jP15WSHjJY
	DDu1yHW6DlgwnTBwatxJW43mpqQoYIyGeRGsCtejuIqpLIe2d+fR3C5jzyruM5B/GDl4eVHF5et
	J/lgb9tEqDDjT06c7xybnKmiZbqQHnT6G4G+a4kwRNHaed0FXZ0llBSX5/AP5SypcxEvMwaPCtq
	5adKtRRzEHj6Wiw+k3BJiiUzCxwk2Mq5ZPfczEFEJV5ayipdD+QYhr7ZfL5yFtExlr6gErFHUZl
	6LfL38SRiBPaj09I4gUeziRjsRYLX5wCNECV9Wf8=
X-Google-Smtp-Source: AGHT+IGNmkXLXrR7zQMQNPjPvO6Wbeyt1MjIJrWklNZfntMizipUD1DSUNe0TAxm0XQdiwqXZymfhw==
X-Received: by 2002:a17:907:720f:b0:af8:fc60:5008 with SMTP id a640c23a62f3a-af9de994749mr316980766b.4.1754898960200;
        Mon, 11 Aug 2025 00:56:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23fec4sm1979741466b.121.2025.08.11.00.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:55:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250730072730.1882549-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250730072730.1882549-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: soc: samsung: usi: add
 samsung,exynos2200-usi compatible
Message-Id: <175489895870.26398.4695794885978749604.b4-ty@linaro.org>
Date: Mon, 11 Aug 2025 09:55:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_005602_370764_4455681B 
X-CRM114-Status: UNSURE (   6.38  )
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


On Wed, 30 Jul 2025 10:27:30 +0300, Ivaylo Ivanov wrote:
> Add samsung,exynos2200-usi dedicated compatible for representing the USI
> of Samsung Exynos 2200 SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: samsung: usi: add samsung,exynos2200-usi compatible
      https://git.kernel.org/krzk/linux/c/187a3426a664737381a70a3fca3b8108f2300de9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


