Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B40C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1fJ6z5PudcapFlOuFM3afjcyHz5zpohcRH8pXTkbGA=; b=Gh4fKRGcIukYlGGZLQGvL1G6sJ
	0aOK9OyJUnCc4qxqm5NVt06q47sYSqwOExNa1QgAyPv4FOq83ILGs/NXOeI4dlMwqk6YidDm2MpCn
	xY0pECgEVvGfOucs19ZJLvoogyfaE78EZdGmGcJK+BO1tAW9bbkvw6UL3Seuj4y5K6D4UP3adlH3A
	yOCpbXBKv22BlCfueb35SNlLqcA3P26YrGDfZ3Bf/pMy5hKTQZegT9M/PEj0vIby1xIrDVowAchNd
	a89H+HULUlX1KrixemDJAgP9oLkDqEcSHL2v+I+WMmYaZihgZovLw6ZSqrvCG4T7WEzWnX6GimhMv
	TjmxNiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqacA-0000000EtsJ-3MJz;
	Fri, 07 Mar 2025 16:31:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaU9-0000000EssX-1JOn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:23:43 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-390e88caa4dso1174957f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 08:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364619; x=1741969419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1fJ6z5PudcapFlOuFM3afjcyHz5zpohcRH8pXTkbGA=;
        b=Hp5ayC3CLNI/7fvWwGGLGoGbc6eYvwSLRNfbdMWKKXpErJ4967LPnYhWqkLZrxv8kN
         zr3LINveA2bLQT0VLguWFxfrhevzIHvqgkCQbHs9KXADbg7vZiBRc4XhWOFGegHZhLcw
         xWNv2JuQp5I355iL5OHQu0qej3WEhMCrnE0HQqS+lIDvWtyOM+tAYn8G2gDEPKGKq6qg
         6p6+YNw7JkJgzDHGE8xMQLW+SIoi+xz23C0JcaoiCRb30gA1WbNvx2eqMIkOsgRjYHA7
         GLEkiwEOYZcOIUt678JLAx4GdfqiaEtZqFKAf7KkOW/hub7RazYPVArrEnYyZsJo3x7C
         fd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364619; x=1741969419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1fJ6z5PudcapFlOuFM3afjcyHz5zpohcRH8pXTkbGA=;
        b=tbfta1YUfh+JTB7S5jIArgpzGqRj8Hkym5EvIcRVQmqqVMkMBPIgDfv+a/0uQMCtgd
         d/m+cAN5F2SQIDCkd11n6LFa4TZeBKqZq7cAdpDhRTrSMjVEg5wy5fOIvJLe0ykLLbKa
         sjyNOxe0AyfjbVQ/y39o5SXrVYJ7IhBEWvdhXOHduyRZdVj4JsGbKuE+8wopfdfbG8YS
         4UT2U7yxYDM5tF6DO76R+dweYKP8drkr5xyYxQOhgTgA31dtrS66bZpglz7aZiVwop8G
         IaSWGgwchJXb2G79tM8L9vgjbTRvsZ1KGukqRoBQPBiqWWCS6TNgVYukqL7AQPU/hf2S
         qDIA==
X-Forwarded-Encrypted: i=1; AJvYcCWukXzMvsAfLyS6Ch8YaYu+fC0nZwsJp/FaE9oU9gCvod1fUz+dGgN4YnnnG+LBpxvkaoOXPV02v1pODCyPNLBd@lists.infradead.org
X-Gm-Message-State: AOJu0YxAXmvdzK8k8urZXteX+X1AfsIFV+koj3ppUnWX5wUeKnpsK6Gk
	hyQDwv61HMPKyzTJLk9NOgGUX0YG9sexGVM/b9i4qHppbF6J709m
X-Gm-Gg: ASbGncsaVeOquujNnCQfvgpp6wgobXTNWuY0LVkTIJbo4UdaYYwoLKfn7qWgevcBaxr
	novRfRrsdaNMWf1aGcdHT5IX78Z7dS629f0R8la0i1eIq96b833RGKZKnHadByqHAyH9dK5HhEF
	/TliYEdWb8sqzYtNelDzinkfbmJSwtJ73GarJ0WT5JTcZ0yBsqTnC9Jr/30xluYBS1Qu0WLxDaE
	g79h/7HO9rxK+kJ3y1C2X5qAJW1O/79gJ/CMMI1j7Q5e/F8jIgkBq5yJWjbEmMz4veffuLlR91S
	BWFHhz8f9AuFxbiNIMzmP6Bjh/WXzQ8hu4Ail8k8oHhpwcpRYLgOjnFJ1WqAQmwGkdckJlFEr6y
	iKMYZglXEQwe8BW+1TVeQ+8B3JTJuwsMORgs5
X-Google-Smtp-Source: AGHT+IFkOj93xZE0jxlv4S0NKKZsz5OtPsjG2/EENZKtgykPA6URLC2WRnbzH6v95t7aU3xJAnq7PQ==
X-Received: by 2002:a05:6000:2184:b0:390:f971:4ecd with SMTP id ffacd0b85a97d-39132d957f9mr2154541f8f.26.1741364617951;
        Fri, 07 Mar 2025 08:23:37 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8dbb4csm55995825e9.23.2025.03.07.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:36 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] dt-bindings: Changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:29 +0100
Message-ID: <20250307162332.3451523-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307162332.3451523-1-thierry.reding@gmail.com>
References: <20250307162332.3451523-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_082341_347732_F7BD7792 
X-CRM114-Status: UNSURE (   8.90  )
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

Hi ARM SoC maintainers,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-dt-bindings

for you to fetch changes up to 294630d81ad65333e5d4ad3efcb82dcad6177e6b:

  dt-bindings: Document Tegra114 HDA support (2025-03-07 17:08:33 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.15-rc1

This adds compatible strings for Tegra114 HDA and Tegra124 MIPI.

----------------------------------------------------------------
Thierry Reding (2):
      dt-bindings: display: tegra: Document Tegra124 MIPI
      dt-bindings: Document Tegra114 HDA support

 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml          | 1 +
 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml          | 1 +
 2 files changed, 2 insertions(+)

