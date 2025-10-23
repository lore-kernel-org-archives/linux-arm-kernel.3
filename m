Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BFFCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tTG1pwP7TykWxe8MPff4LTF6nEVfVWG3Z8SQ568z2A=; b=DgjQdJLzChsA5pGuJYebzFxdvH
	aZevQgS8xJqxUgjoLTYxgM/xHHJsv9QVGn8AymtVBNQTeQ7fzeaOxoNikluIpeYMq/jRmBAA/Z1iS
	3boN0PBYqboDLQxRJ+BciVwKEfpXX7Kss/dUTRhAoTO8quD5dShJLZWto8CUUXQp3P3rUqwFdvgoD
	PcK5PpZUnLjkSdQEKJkuRaWBa7oYRptY9hE8SrbgWJjdJZSNOZ5wxm5xuMZ2I5a6SMv+Exv7rnSNk
	X+OUh7qwUNzb3ROe8anOgD1aLqOMb8z70Cd/VsA6UUsHFPOMQpfV3sxG9HHo2kFrWjB4Q2vgeY5cX
	oSoaH3uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2NH-00000007bSH-1FOd;
	Thu, 23 Oct 2025 20:57:31 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2NF-00000007bRo-1uiu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 20:57:30 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-33d962c0e9aso1143454a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761253047; x=1761857847; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5tTG1pwP7TykWxe8MPff4LTF6nEVfVWG3Z8SQ568z2A=;
        b=v4XdmS/X4EwEzB2ofdXjnuaWHvKVAbYZ9AFT7g519+a88K4JwmXw5n8QVp3DgG2irg
         8TpkQQfMpkIILlpOJjWxg2eh9Qwh6XLhzMHMWlbWFqAoc5P/0wHSfcqFZksrOnnDwdia
         OjM6eBmw0QJvFqhN9xUr/iH45f0h2T8M9d/9cPJu0K3LD1sTd3S+AsJBohRrksUTLS3d
         w6q5vSRcvsb4wa3CRGnVMfetNhqbXj9mkwoUwYWCI4+GGcf+dEvb3Y7plthLvDsqpiBg
         eFnHPKue/VHcc7scFReGfRsdq9LQnmnzIGTzelI/mKJj4bivfZt3n7EWVF3imBiRPoJT
         2RuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761253047; x=1761857847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tTG1pwP7TykWxe8MPff4LTF6nEVfVWG3Z8SQ568z2A=;
        b=klV+Yc1BszspsZjRodlqW3OEcDlXJ85RewhJflPQqea9bIClkMbomgF8LeFkiY3ZiW
         24hjkmd7p0UAu9NZt9loyGzwkVzmrHw7AEACQ03wto3DWelaHeI61RddwU/nMIRbiBnm
         ABxwLmgtuxQiLiQA8grOyRUSorPerCrIhUWLURkzGLubGLXFp0Xk+dAOsH2N8FJR5lgL
         gz9EuowXCPYTiKU8B3mrl0TPmXd+tlIT0wwGHa9bMcArtxoQegpz9OUaciKAH8m88Ijj
         iODpaAAnMjAzIpAgukn63RCnZpB6xoGAhrH64Vi+kzxIg/NcAyKWi2VDgxV40wwWAu1H
         HV8A==
X-Forwarded-Encrypted: i=1; AJvYcCXApOpmg5PHcU9SI5EdBB9DT0os9IKsmSPToyq6VpD25qa1n5o+DW+4TYnPYAxcpteZARdTLdJkSoUZlM83HjRW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4BhPxgSWdapn82uk294gG2eTTYhqntCfgtAyUUMs5ltYTunYu
	NetHTjR1sgNLDafMji5ESKg/WjKE1hulL6Btl4V7sOk2u5LJOvdqoO/j/Mw54PoE1w==
X-Gm-Gg: ASbGncvgcmeiaSeinK2JbU43NxXKoj8WHP1Nvs5Y0F4A/BYSRMI/WvjJ+QE1BqJjig1
	KXymusxi4KEFwO6maw1LD8OtmL1DfKbvwPO3wG5VU1usbOl5zWkSOm4oeHkmBVQqKKWFYdl1MfJ
	U41RXkM3Bqtk+R1JoupJAV0BWOdzfhxIrELiHDCLyKmLguj9jSf2Qd2yJKpbIE5QRik8iIgKdY5
	xla8/XuHf/g78/F5Oo+aZ6Op4tozeb546bvIx0/vN/ZDVZqYQglR492j2e8fylbNIVRhwc4apX/
	f+r7/fiFF+CwLivDBGD4JnYBE7c6M1QS9SfsZoD/u2PQ/0YVWppOPQuoLycrY/mn0UVNEXjkIAE
	Dxy+zGzzjDCrv5oldD03hMxkPixhmKdcrS+X72MZtcwHjcZYIIPmSCAaOAHuoivkIkS3t5lrNec
	tT054mEqfyf7qr/hfQTXMQuUutxgLdv3mr9Wh28f0IZSH9S4mdvAVgF0LBbjE=
X-Google-Smtp-Source: AGHT+IG8WEMgflsND+5AmBeFxzQTcqL/T08P5hnlVq90L3tdTnALjw3mEYnO3w9FtfRAZWoL1HpF8A==
X-Received: by 2002:a17:90b:50c7:b0:327:53f0:6368 with SMTP id 98e67ed59e1d1-33fd3a61ad3mr335524a91.2.1761253046760;
        Thu, 23 Oct 2025 13:57:26 -0700 (PDT)
Received: from google.com (80.88.82.34.bc.googleusercontent.com. [34.82.88.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e2090eff6sm3795056a91.2.2025.10.23.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 13:57:26 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:57:22 +0000
From: William McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Youngmin Nam <youngmin.nam@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	John Stultz <jstultz@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/7] Add module support for Arm64 Exynos MCT driver
Message-ID: <aPqWsjUCmplMda_S@google.com>
References: <20251023205257.2029526-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_135729_516683_E18A0DA4 
X-CRM114-Status: UNSURE (   9.93  )
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

Sorry, I missed the "v5" prefix for the patches in the first v5 series. Please
ignore this cover letter and refer to the updated series here:

  https://lore.kernel.org/all/20251023205257.2029526-1-willmcvicker@google.com/

Regards,
Will

