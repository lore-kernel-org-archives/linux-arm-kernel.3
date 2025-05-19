Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9763AC54795
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGruH2OWyN5Kdhy7bKxvrOX/NNRx5g3JGk/NfDWwg9E=; b=P3mW+TQEKT24OzshMKrVh+x/zB
	KUay+QjbQTkvMC+hrebsGvgERtHbcEronkejEc+eQlqcovvLBGEdr70jG1jycoSxFxtsLBq2NFVqf
	waGPcLN/0+06lLEBTFpXN5YKC0jx4/DWrfhEo6lvGc/U/WgM+Glnr8R86oVvjBdWoafG9bZ1EjH7G
	5n4Op+8ulkNZmznRZncQM07cHobMoMqXaxJvZ5bHB9oJp/UaQJfMR9eL2X1ZAD12Bp8M9X+XO78nW
	extAgCDRT9ohnBh5VpSQz0eckGo0FHgPGbQ/Eshf5vjgfjx9aw5Knka9X6bqgBcZgG68HsPsrZIYO
	H9ToCLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzuY-00000009CRt-2qMD;
	Mon, 19 May 2025 12:48:06 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzkE-00000009Aol-1Cq0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:37:27 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-601968db16bso4124036a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 05:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747658244; x=1748263044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGruH2OWyN5Kdhy7bKxvrOX/NNRx5g3JGk/NfDWwg9E=;
        b=QIj9SF+DOY2/9I73xrudBKshkEUepVBPXwtHsbfxwonPsjLb9R11/wKOQ1TYCYkjb0
         6KBzZKTIhsvruMgVxJ1DnwPlB3/6vI510uEzJHrkdByy/M2EAbO8unIl0TWJhsdroZKO
         0X5WIBeynZNi4H4smblPPKIRjyIiZm37kuFRGRnTh4Q21KVr4ZrHzZXt2XnANLfgBupJ
         dK8C8gnG6SRmtUZ006OSuYUXxDrA3eidsN4se17JGib3xqAlmFOdQUPA8YgCOCZgOsXi
         cmAELB+zmCzwwoIb1D6K9X2SrK35CCYKSSoInOwlNVve4GdCD3UDw7SOCzKkegiAl3Lx
         3uYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747658244; x=1748263044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGruH2OWyN5Kdhy7bKxvrOX/NNRx5g3JGk/NfDWwg9E=;
        b=kgCNwWYCWR8eZ2/ECIIaDCKI0dD+YNDPZjZ9dcPGyb+pQtVgYZ6q5JkjIbXF5KyFmw
         Kl2kluCysXCtW4UFWL0iBfISdUVxwZDlQECFU6Hqo6PqZgWQUAwCsIXi9R31fRLU0nI7
         pZMs6xqM6PvhyHaPPhDBgeNE0B0M+oWcD6G79py4bQzMdnOs4mHmOlR9/hmmg60zhLj7
         kgocg8YRrRBqkh0T3fiut378i7WqOjK8/a0l/Uze+JNgpA05Ev+ZY/ensqcr3aOht0wL
         Oz5hxIbu3oYHQ4uNKx5nM/Bk+qNe43kuIBNqC8abBQgsuNJWa8hLqy/dt1vfsVeGyXq5
         PQUw==
X-Forwarded-Encrypted: i=1; AJvYcCV4JZRBYRlbVG7i9wMp/m7fMYy/K+9W7GVfx8HD1WHLur0d6f4ABAUnhNeGxF5cTzGSOf22dFzU/0XvbsRAZpGQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwjMhEO6BnLE8gjRf2gUUVDev50OubdmFahe73dAbiIGvBUWkub
	tkY2lmsd6SiewWu8IsXWdkpDeFxQxIHxDvZT4R8kkQozUvL3RtBQQaXhzb/jm94u2w==
X-Gm-Gg: ASbGnctIXe6fvpe8jQY4gv+oY8BHtxCEjGN0djL1KQW6C+MgwbJAvaatZtNhz8mHCgS
	+MMsF0XB3SXMmBHnJDKWSY1nhBD6IdrPlor2QsJgBOIsCIQ0jr9Nq1QpF1jjL69iGmgbx6bOiE1
	egl2c/bRpCErhER9R0XToaHFDiW3QVbQD5T12ucgUddREOyVcvFA3dfayn2K65WAOBdYtNaSoCf
	RCkfL1+vrNymMyLHbFnxqnhvN/Y1Pu3uQNW0rXuN9wswquhXVSluanzte2u2G7gvB6sgoEOUchH
	L7sYjesigPYlYVLqLUINk+InY0bt4ZK1qQbe9i0e5+1aeTcVrRwOVt5MLRDtyibMHcPkbZFdsTp
	7JTjZROWZFC+skX3cB2Tx+W/JrotsPLyowwcEE1S5zDAnPPJrfMsUkBiNx2j9+FZZSR8=
X-Google-Smtp-Source: AGHT+IEJuSH8cyFiHfFYB8+TPURo7EpATg7AlDroWHzASyTyrwqYV4s/mzXF21Rux5m6FuouAAfVig==
X-Received: by 2002:a17:907:1b0f:b0:ad5:5293:f236 with SMTP id a640c23a62f3a-ad55293f282mr759959666b.3.1747658244437;
        Mon, 19 May 2025 05:37:24 -0700 (PDT)
Received: from thinkpad.homenet.telecomitalia.it (host-87-20-215-169.retail.telecomitalia.it. [87.20.215.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4967e2sm580970466b.128.2025.05.19.05.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 05:37:23 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/4] PCI: dwc: Link Up IRQ fixes
Date: Mon, 19 May 2025 13:37:18 +0100
Message-ID: <174765807809.8857.13152215627311569796.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506073934.433176-6-cassel@kernel.org>
References: <20250506073934.433176-6-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_053726_328305_16E3F4DA 
X-CRM114-Status: GOOD (  12.49  )
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


On Tue, 06 May 2025 09:39:35 +0200, Niklas Cassel wrote:
> Commit 8d3bf19f1b58 ("PCI: dwc: Don't wait for link up if driver can detect
> Link Up event") added support for DWC to not wait for link up before
> enumerating the bus. However, we cannot simply enumerate the bus after
> receiving a Link Up IRQ, we still need to wait PCIE_T_RRS_READY_MS time
> to allow a device to become ready after deasserting PERST. To avoid
> bringing back an conditional delay during probe, perform the wait in the
> threaded IRQ handler instead.
> 
> [...]

Applied to controller/dw-rockchip, thanks!

[1/4] PCI: dw-rockchip: Do not enumerate bus before endpoint devices are ready
      commit: c1c9c4b6130defb671c45b53ec12fcd92afea971
[3/4] PCI: dw-rockchip: Replace PERST sleep time with proper macro
      commit: 9ad44a6f6f8775786a9543427c82625d96a340b4
[4/4] PCI: qcom: Replace PERST sleep time with proper macro
      commit: be0b42befa87d81780aa0f003644b0ad520b0234

(I do need to change the name of the topic-branch now...)

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

