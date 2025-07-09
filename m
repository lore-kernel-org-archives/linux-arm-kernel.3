Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84C7C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cz5QQgif2TZ+psnMb6iWbzxnGr67pPa/3dM5Lbz5MrE=; b=d+F5LQlPtuEQ9Gcx4K3/cjM+Po
	ccACveg9RBv2+a6AM3ZuGW3POwEq8WPxeIjg2pROzS0unRDWc4WNiBNSlr96wUQeCnqtUNep8Cefg
	ododyo6a+By7Mj2WU3A/qo/N0a+eq413ZGKlVRqj0vaHUz2nphz5CwNspr8rhkwoD0kmBOysjwKAm
	KOfXlc95gFIzQtDGB68+d2hSuelwyo2LKWJ6xLnjQ1k8aSgTlrKEf7Q4Ecc27egFeaR3x5cFBGPea
	sRZUyKHwsNn44a4AXI98uF8qoRb63SmbeXYeYYEC8WUZZ5l5hOHtBHmEiAQUu5FGKVuhpOhplHCj0
	fzg+y/rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWSl-000000097Hy-0aw5;
	Wed, 09 Jul 2025 15:11:59 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTmj-00000008bt5-3Juj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 12:20:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so4957592f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752063624; x=1752668424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cz5QQgif2TZ+psnMb6iWbzxnGr67pPa/3dM5Lbz5MrE=;
        b=XzIwOudEQHXEpACi96G0utIxdOzpBQxqHVBqZ4fxRVuh9l1LuOmSyTL8VWTah/mkv9
         H1fQsuP/Ve3k+cUN6NvOOwu3YFtrlHdh46vzedRdF4heXgJdyoun++4MfHjnp+X/rk0y
         amXs7gPkA7/IqVXE3bHfar/LBxEpZQ0JRg1LcqzL35MnuPPGNJKnnU/6wDzamYxkLv2S
         xNbZB2yLIoeM97e39lP0F2Di7yh/6/CuvnlL9ah7l3oeStUuEDEW9ElaeSBfEy0IbH2b
         FTVQ+7+QhRNvcsR01Nrd9Mc4nmMlvPKzDxYbvhfW7j1X0AOZbdJmnDiIfYaDINt5IL/e
         xqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752063624; x=1752668424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cz5QQgif2TZ+psnMb6iWbzxnGr67pPa/3dM5Lbz5MrE=;
        b=QbZP2FpkMyphZMGxKt0Q7reEpy3MWfgFx/3ilWllfAJe96ecyCbGrLp2q9s3prFttM
         U1r9gnrKSeqtDdbDrFnyzpZ0fjmD5Z/QPM2sImXiZUjSrybXVUhjmjH8xiwfLC5FkQYd
         91/x0i7KTCpALJga+dJH756695DFSOO+L8LuPxNuPakMXQUnsmqePeSstuIEP7Vg7yB0
         3xmAYgovkydHLVR3f8MhJAVMg+pvKLUhAiBqc1Afhmhv9GCpVTTUM7wNZ5Mno67A8EXR
         ix9ZrtIkIJ5H0+d7zroALm6RBSuhFyDuHG0I8dkraXdU6CQXyzjy87xK0yrix1LE6hb5
         0UnA==
X-Gm-Message-State: AOJu0Yy4RQyBNRDiGNL/kkTfQWG/KV5pPKzJw/GZzaPLYzbE3wirTh4l
	eVaBnuFcA0CIBC4znFDytFV6r2iBojUTd6kMlI/wJAEBlFEBaHrHyWJV
X-Gm-Gg: ASbGncuMcqfuadBN59RcmHlq4S2Dz8tYdKLjZyfRRTkX9OggELA2iRFxvgBEuIkVL6g
	WZL60j4id2CNeZaM272l8aEiEpgq0TKftE+4m86fDL6Q3llXC2SZQ3ybQ52B0g3qU/TliBfNJLz
	frTFSJChUAc4P5f7tZ3soaWal0X4GQimODR1qK/vFU1yG7w3bfcJCBAJ+P7LjjNOq+DJnkNkEIK
	rEQ+Cck/Pf4DoRk/tKgiEVZgJ0C/A1E8PGQpASFTJ3VZnrLqX4PG1BEteDIJbqy8PoNyLgBf7su
	RUjZoKUqYQ8x2E+kkofSEZmGPtRHZR10ZdaHXcdXetqNy+XQSO3gqyzT0ILhoIqfXmu0vBCkdFX
	yTQKYUo6PSU4EsGWz4nTZdd8deKXhO0fgdVsmJ0doNHsow2yXc3aUGg==
X-Google-Smtp-Source: AGHT+IH6QLMupQyvz6K1xZUyeINn+lP3CNsWV0TExX1rWT3sPHY0i+kJ1Ij7hqhRt1VAgldCxPijDA==
X-Received: by 2002:a05:6000:2087:b0:3a6:f30b:2dd6 with SMTP id ffacd0b85a97d-3b5e44f5a13mr1981376f8f.26.1752063623787;
        Wed, 09 Jul 2025 05:20:23 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d0aa0sm16013292f8f.34.2025.07.09.05.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 05:20:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: Use io memcpy to write to iram
Date: Wed,  9 Jul 2025 14:20:20 +0200
Message-ID: <175206361431.1595082.8917361083602390778.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
References: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_052025_854005_70B4B7C6 
X-CRM114-Status: UNSURE (   8.97  )
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

From: Thierry Reding <treding@nvidia.com>


On Thu, 22 May 2025 11:11:24 -0500, Aaron Kling wrote:
> Kasan crashes the kernel trying to check boundaries when using the
> normal memcpy.
> 
> 

Applied, thanks!

[1/1] ARM: tegra: Use io memcpy to write to iram
      commit: 4110a4d95bf0bebd8ccaaeb93988dc9c08bd7d6a

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

