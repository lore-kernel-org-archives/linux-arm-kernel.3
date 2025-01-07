Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA5EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C95iLiIsGMfRm8JaUNPnSGMtPKm42hHvd+zXsLNeXKk=; b=C+JncZKNK8p5XL9UV4sG1QYUAm
	PGe2ywHqxFXcqEfXpt5vbTyjZ/bCNk60QrFiwMJUYlDUuFulSEkKzzvZrXUiHM66MSk7h/cCJqOPz
	5m+qvs0C5H2ba9vISVYwabq+Oo6lIQXnUnGX8hCtbKWz1LsRBzVy+5wcPg9UskPLOGz0i9joADwFJ
	7QMiKSpsqNQ2KvkLcTARFXPbByymF82ZxzhjseQYyUMPAc7dfC0DE0Fbja10Nm0wpeYd4ppIkOqcL
	sm6i+272cyYGqzDJfXjgRVlyF+bF9NXR4pFa/ldy0y7c8mhZoxs2+OALuZu22j0mdKawWGVbckp4W
	aD2BRobA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIx1-00000006Y28-0XGr;
	Tue, 07 Jan 2025 23:25:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIvn-00000006Xoc-2Bbr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 23:24:17 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2162c0f6a39so5500625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 15:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736292254; x=1736897054; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C95iLiIsGMfRm8JaUNPnSGMtPKm42hHvd+zXsLNeXKk=;
        b=gmc27UsSZOyDKRuuzE+dwTs/1jKpE1HVIyMo40SBEW3p+bEqnvxRlLygb5Q0Nuf/z2
         GXS5/H3l5L9yOfqiTecgSjderivU+GlIb+cTIYaJ3YE+qy3Ji/jsBFa7iFxiTjck7WY/
         dmdygYgJe1AZpfnjjdq3GSrujMsMHrqcJ6LdxtC39FTk2i9DViVdjDEI3wjRgu4JEHDd
         DcnT5HLpHyN4gK/llMGUE/dxP/R3u91Hv5VOZ0F3yjiDnpPwS2F1YmJ7b+OJnqNtT7G9
         60JdQHauct3QuICj+CIdtXjVdol0nkK9I1qoUGX2MDCFWk/CpD5Fq96hrqIzHw0VhsbD
         NZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736292254; x=1736897054;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C95iLiIsGMfRm8JaUNPnSGMtPKm42hHvd+zXsLNeXKk=;
        b=wnkeBJzi3HvfyIS9DwL7J6fPeqH0N+8G69ukJDqc7jpzDmwb19xiWJ5uux1qhkEUNj
         kNo8cmg1SOHkdkmTJ7gJfJmfNdJUgrVeS5ndyelN4xYfjKh0fYhA3iq3810q3/maO+aY
         kqnKbkoTeGKk7jq3xvDq8bmr+QhXET7UzE630NOlKpcbVBqYcX8XwqG2wugIQ+rhEtQL
         rl1pYmXG5asDZq67qdl4Cx/7Uz+XS0mU9AFC2A6baKnI77bycL93ZZt6pgB4i9QVdSUS
         KlyqHcbNEuNkQ6jQ76F25rPWISpgzAZZo/BuSTGjngXdMCSaJyEFvYR2rn1xm21Ug2iN
         TAWw==
X-Forwarded-Encrypted: i=1; AJvYcCXRZ+lsprPJGb5NLnMYZxq8HFhrL36ERFpyQ+CzgzlbokJiO6/+9Mjixb09y+ltrP1YJPqTEwRrDgrQjuEK38fW@lists.infradead.org
X-Gm-Message-State: AOJu0YySmclLxnKK2uofZQjz0N4pwWvPd8FG0+i2cT+hdyiKSd41BxbY
	yaU4QIR91KV1AwZbC24RiTvl9NypfgExoT2/U7WMNn6euMboJS4jsvmGEUpwLlY=
X-Gm-Gg: ASbGnct+UlM9DkOxCVMx3NttnAoo9nhhWdnIOSX7bMLcN2+Ru/2588X3gJZjEw9Mu/U
	mxqHGvHA/t+4Tacxw7rIwU80C9B55gmdo/cqwpQz+aJZXQ5MqwZbmeBIJ68wpmIcfItP2hKtqgb
	VRUuLc7ALotL1GM+Up7RwKroaANyuYLWFtv5PbYph6bL8ZenlGNHd4ePA0WqPYwVHnVJqk4i41p
	jBzkh2soYRT36ZQ3zaD6o2eOr6MoV9RNa6X84a75W7a9WtOwRZINmg=
X-Google-Smtp-Source: AGHT+IFk3tx493nN+dN4Z7Nw7T6E/L7ddLbTtmpOE9XcEH2hMlTKjR1Fee5FPSBt78FPKRQiKwWsog==
X-Received: by 2002:a05:6a00:a81:b0:72a:83ec:b1cb with SMTP id d2e1a72fcca58-72d102a8059mr8370201b3a.0.1736292254620;
        Tue, 07 Jan 2025 15:24:14 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad81617csm33872826b3a.39.2025.01.07.15.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:24:14 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: ti/omap/dra7: minor updates for v6.14
Date: Tue, 07 Jan 2025 15:24:13 -0800
Message-ID: <7hmsg2b42q.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_152415_558381_B643AA56 
X-CRM114-Status: UNSURE (   6.88  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/dt-signed

for you to fetch changes up to dd504db5cd4a4bb48e8b96159e23ece89bb54d90:

  ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties (2025-01-07 14:59:51 -0800)

----------------------------------------------------------------
ARM: dts: ti/omap/dra7: minor updates for v6.14

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: dts: ti/omap: gta04: fix pm issues caused by spi module
      ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties

Judith Mendez (1):
      ARM: dts: ti: am437x-l4: remove autoidle for UART

Romain Naour (1):
      ARM: dts: dra7: Add bus_dma_limit for l4 cfg bus

 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi   | 18 ++++++------------
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi     |  2 ++
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 16 ++++++++++++++--
 3 files changed, 22 insertions(+), 14 deletions(-)

