Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED36CAC594
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 11:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xJlWH2NF0uAVXDd2hOjwwBf+YceXcdwvPtJB2tgstmQ=; b=PSaE6xF8/e8EcdjRjamkx09yxe
	qIkU4R1Epc/5wsGeViGOlK8JU6IMoL0EzHiwvLqxpAjZf5dk5B1YmTZg0WaKjqEFtlP1Q+NCpp27/
	NcpKf6hA88MLrhsSFPa+b/PTHaW3Zw++dWy1STAJJA1/x7daCPvPpnWxVuxlQRPfqwQO2pYwkV+G1
	0wVOjabzl1W57pt9bT3Ig6GF/JRPJSVlv6NDM8gNi/ofibc62nHiX+H46sUiJS6w4LFm/O5GCXLTn
	bZt5S8jR+eu2c0SbkDZ+b5dZ2tM8NdvFTt6EPHaOFyGJAWildZ/kTvk4jlBc7hHXqqGRAT2M7RdUu
	7RXMEjCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxkvX-00000000xCE-0y0X;
	Sun, 14 Sep 2025 11:29:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxkvU-00000000xBK-2pBl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 11:29:49 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3dae49b1293so1827045f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757849386; x=1758454186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJlWH2NF0uAVXDd2hOjwwBf+YceXcdwvPtJB2tgstmQ=;
        b=VVKz8dh+lO519ATBA4FvBz6YIuuVbr3IsYENvHffuZ8SygA6Vb6COrVUpcvhXrR6AG
         qM+VEKxz0sEbbOyHMRmzZ+rxVsTUSWyV+5hIZBkmq4izLbpcEEVuIfNChe21v84Ge67z
         MalVjbhc1FgMSPRekguHbP0UcDORMht5TT9CBSoPvZjzymw891K9oeMqh7Mg7RdXHvhd
         w7mhuVdvTlua8rx5fZpdhCmuThjoYoCFETR9HzqI3HUkSscxUJAV9tWGxpvD+jpxlNM8
         EBXJLtpb4Ko74KoR9j02/AARjXd20DRxas/uJ2bhsgXuPRYiIVjn75El+bvbbKrLNemb
         yekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757849386; x=1758454186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJlWH2NF0uAVXDd2hOjwwBf+YceXcdwvPtJB2tgstmQ=;
        b=ilyOsog7e/e4Wt1a7bnxegtkXHMakHSRzbyvMEB1MPFTdTZfNbl7q3y58mVTHdW6ai
         nn/TL5Y4FoKY/YkHsOjrsum6AMEf/jcWuhYobOyKs6efYP8PFbVrAF3uLtSYrN1Z18gc
         Od+/PiBapGcZBdwQWGtR1zC17qQXH2VPRircjqOJpFkVF8lJGg9KU2okWXeS3EUC211k
         taqIBMBgGq3OguPn6gUJK0nQ6oxNYuEAx6H3wv8NUH6LH4PpLGIqAP7kO8/UqEpwNk9p
         dg9eeNP6Si0eWhooX/sCJ7W6NzgUGvX//0kHqwAGDaTLFim/z+J7ufjSiI86VoJQDNsR
         IXCA==
X-Forwarded-Encrypted: i=1; AJvYcCUEkc3WEXOkX4M2UfoklsTytLYgXEqSiaawo8PUfT51GhZdYaN4tY6Cm4iO8rppUJqUQs/I55mge5wsVTLWGB6d@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2TutQ+xG/J+UpLp5dYEVmvlBjQd+IDHftqyII3WOgGH5gmYqG
	ZfLKrEU1Ffakb0GrYzbV5C/Ym6VgTicyah7gQpBCgrEAVDr8zKkxpzg7
X-Gm-Gg: ASbGncvV23z5S1KhtdQpwVS0NJD8g+hE4ZYnf50MziIRxbr8knu5rf/NfJ85aQQs8+h
	zDfY93J9zvwAYdLKrkzubLqbnbZ1QAiNNUIkMuU5N9pwEKF6BwJfrC1ZRnYR9wyyPNYvvj2N9SI
	Crzws+mB8vMJ7jrNsSKigxe7IL7SWtNFSI55zfx5mrAmS1OwTZxcKHQk7o5Q0Tal1/q2jsq6hGT
	dBwvwzpM3EUqCDJlOMWuR3JeHeYrTP9SE0+P+50Vjudf2u2SWdRS5FflX+ko1ZDriWFkD6t4wdg
	dRCw4DS+h1crnq5AsHT0QOSAP2Tkd2Cva3JQc/CbrxO+OKnSNqiZm4v3JfQWYip9rBUFsjVUw9n
	wYVWUuKLm5YAxO3ySCiKpDXPEwDinsRZhnp6kT6AZktIcZCMcoUuVvEqKEXT+xmmCAhNZVY1bCw
	==
X-Google-Smtp-Source: AGHT+IHKyE6+dfEzUKtwMYtSktS2t1k/dj5Sb6gy+vyqw/6+wKWpZmtEJ/3gYkOAFEAedDqhzO7M7g==
X-Received: by 2002:a05:6000:2210:b0:3c7:308e:4dff with SMTP id ffacd0b85a97d-3e765a3e492mr6682868f8f.57.1757849386158;
        Sun, 14 Sep 2025 04:29:46 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e8346defd3sm6591268f8f.1.2025.09.14.04.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:29:45 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] soc: samsung: add chipid and pmu support for exynos8890
Date: Sun, 14 Sep 2025 14:29:39 +0300
Message-ID: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_042948_720468_973515E9 
X-CRM114-Status: UNSURE (   8.46  )
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

Hey folks,

This patchset documents the pmu and chipid and adds support for chipid on
exynos8890.

Best regards,
Ivaylo

Ivaylo Ivanov (3):
  dt-bindings: soc: samsung: exynos-pmu: add exynos8890 compatible
  dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8890-chipid
    compatible
  soc: samsung: exynos-chipid: add exynos8890 SoC support

 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml    | 1 +
 drivers/soc/samsung/exynos-chipid.c                              | 1 +
 3 files changed, 3 insertions(+)

-- 
2.43.0


