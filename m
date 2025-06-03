Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C553C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 18:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muedraecWG3k6sC4BkfWIIfP1Qhn6jm5riTVBMIqDbo=; b=R1R9SAcErVstS+
	+bOi9XVoI8OZBiNRQEED2Q+aorsDCG31RN/MpBSpGBzLgJe1DDtT+0OLLddLpVJFRoigWKzuZh4Nn
	X7s3HIEJukIaJUgtOVc/6MNkOxtm55tKCN2THxq7W460vkcwHon8m9Lpu/+tSeF98W4t7Mermol/c
	UkhwAIXdZFnk4T9VSO4xe0opahJ7smMIvWZ4YHdw4lIpVeJWZl2iSB66esGC4h1QtU50bz7a98ZQ8
	zJyrRwrgavmuMuthzBUXuQxC1jCC5ntj1trVVpAL5r1mvtyBhmG5QnomAhQF9D1E4r0pmvK79sc69
	PpL6P2S37aAvh/WNL2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMWE3-0000000BZO7-0At3;
	Tue, 03 Jun 2025 18:19:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMWBr-0000000BZ95-3gFO;
	Tue, 03 Jun 2025 18:16:48 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-234ade5a819so53527595ad.1;
        Tue, 03 Jun 2025 11:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1748974606; x=1749579406; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muedraecWG3k6sC4BkfWIIfP1Qhn6jm5riTVBMIqDbo=;
        b=O9h207cVOTzYEAHc4l2UK9XmsbvGU4Oqpt7krxWa+9SzIs4dhYKK7o6ZnfBWVEh2G3
         2AbRut3PA/Vr54tTCHmVHt8QIQfG0oBCSgLUgrvVyRc5C0TbFWtaYIcaLJwx/uN4l+Y0
         HqPVnvTJR+YWRijnKLc1SaDRX6oN2EEHQ7ffHLiVqTWIy4hsMi/DFNBPChSXfNV+LpQG
         zDYcf6Q4POSrYMjGTB/G91jIq2q1SWDGpS2FEEYJUdFOL75InZyb5/B/1bYgcGiGjGvs
         o0oMFZwPqPdRfzOzD78/5RCJBOJdc9KHi522GSTvFnsO5SOqwu6+NcO7qGlazI6Tl5WS
         6SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748974606; x=1749579406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muedraecWG3k6sC4BkfWIIfP1Qhn6jm5riTVBMIqDbo=;
        b=VY4DTqGWqxlUov1jTsZvZ88+PF0Ed/dmFk4cwkUGzWZur42bq/m8zpq84j2WzP8uub
         Zb0Di21LGhG7gJnJZx6udJyuM+5Z2IvAi64ELnRkCc0lVZ9Ru+bkeTtw6MaKlLukV6iP
         mavoZqHCp6llBGS57NSzuKcCmcmuxFXXdTlpvBoS45Gig0inBvcYrLZw9gjGbbuUTeL+
         7j8DO/bAuDr5tCECHKZbUd/ohZQUZFEiKFCo3oVEbuVnVxr7kNQeZHxCM12L33UuD0Ih
         FUeTWQZy9nvmHnNK+Sm4rWvzshT7pNVzjFgRJ5AkK3lT1okJdQGZhhBC152OXVRAFMMu
         j6/A==
X-Forwarded-Encrypted: i=1; AJvYcCUBzSUv7SCdJlEgIXUZNErNqGRm9B6z2zeXPfGslR9fuJjoL9IJBGw7GJ1We5gsEbZqv9yqwy9L6CKoftlzGOfbTQ==@lists.infradead.org, AJvYcCW7tH9EADZXMc3+a44jrpHh+erQZA5jO/q07S74dfM0x9x91NQXmgD65/39Cqr8Ca5xUvXgo13ynQ5hAC4N@lists.infradead.org
X-Gm-Message-State: AOJu0YxDiaCkAaXC0djhlexoluk7lv3aIS0FDDbsQv/UK0GDV+P/j/WS
	KX0MIj2Vcv6bZXhUPYo1h7eGg8oDAq4M4Zzv0URYQeG4pWtC82SvEFUiWVAxyCJXtKbCFEJ6+CD
	gfcs3aanA8yisrdE98SkTz04jLDVVKKQ=
X-Gm-Gg: ASbGnct6rD+OQ8+FLBtIuOa9mSchpR9eMMfWBdcMjpU9iBzuuzIdGJPcRN4m2vBV8sj
	zOsdfc5RfP9e2X+gHKAGzdp0/QMhxbASFT93b361oXrJVIicaMTmVQdB8fUP7ATreTFCgWbKP+q
	Rh++TQC9o5pWi7aO+d4MC/lfcr0LKIvUOmnDvN+DWNJa5lHS3PckdUCJOXqhklx+hsEwM6qbwLV
	HCV
X-Google-Smtp-Source: AGHT+IHr9J8+h+AZ8STPC1y2/qEM2ZZcXzahpAeXjwcKczY154NqfHQ6m3ty2wKy8w/H9uZv/VxmB7VQvs3K1RzoMLk=
X-Received: by 2002:a17:903:234c:b0:235:779:edfd with SMTP id
 d9443c01a7336-2355f76c215mr179533115ad.39.1748974606365; Tue, 03 Jun 2025
 11:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Jun 2025 20:16:35 +0200
X-Gm-Features: AX0GCFsq34ioWPbcIqxTayHSRdJ5z4uSRbOfAewoz0GwtzdI-PxfH0Fpo31M6tA
Message-ID: <CAFBinCBSyniWtR5T3XdgohG+n0Ae=6tgmdASSxsnsmoQV4yhQQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add
 missing interrupts maxItems
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_111647_931883_AF16E17D 
X-CRM114-Status: UNSURE (   9.54  )
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
Cc: Nishanth Menon <nm@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jun 3, 2025 at 1:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Lists should have fixed constraint, so add missing maxItems to the
> "interrupts" property.  Since minItems=3DmaxItems, the minItems is implie=
d
> by dtschema so can be dropped.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

