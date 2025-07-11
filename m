Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B96C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 22:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRwSwkMCStCK2FyHeopJuqi2qCPQVzMg7D8DapyeF+s=; b=gddG66q4v3fK5sub7XzbaB5oH/
	xifhJp9ibmME9rCl4rCubEyDPlcbhqIUyZ7rxcr48pxzxHh+jZoR6nxgCU1F/jiD7s818pCgn3E98
	qpsiGLJvqP5OenEU3Mll14UQy09sLrMn/RTF06KOdpC5M4LwHuoRZECPyapbZRyg6WBhSBKY2hWgH
	H1VfB9FcT9bkxKpECbKWxLmVQ2mps9pIc04oLQnBj7cgX4AWXz+2AMcFnOr2aFZe1k2vY1/TRF1KU
	genoz9P+PB7PkjLnSgTFbnlh8/XVbgMAqz9pbFCFQlrB7iB9nopNHzaLnzaXTEw+JdidFW6r/mxW4
	3uIuXcPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaM5W-0000000Fwa1-3ETN;
	Fri, 11 Jul 2025 22:19:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwL-0000000Fw1G-2uUw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 22:09:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1587436f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 15:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271796; x=1752876596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRwSwkMCStCK2FyHeopJuqi2qCPQVzMg7D8DapyeF+s=;
        b=TmFDz+D9+2PRLTg+o9UrrfZDGPCiLt2AzWA9GS1OnhydIJPoPhWQu/2YfQ8FgnXH4a
         8JbqIInMCRYIS2EkU2fr0LnqVSmUtqLY6qS8i8u6FZ2M44kX4xOlaE/Obo9yri4yg4Rf
         W+D7uClCNfJtltyf3f/8+PvyUEG/dJGEwtEsKVN4e673acZ6Qf4W6PLYcNKxAk/lIFmK
         sdPjwXXLuAiz24ris8y7bGcxEQDwxVvJE2e/us8HyQHW1VFcXUbPUsOqzYhskC9hGJsG
         ti5VUzODEjXh0G7IUP6blhBMqDzFcnTKqbvLe8blkCSaVAtkBhxoqko29Xyk9gb3XOcp
         w+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271796; x=1752876596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRwSwkMCStCK2FyHeopJuqi2qCPQVzMg7D8DapyeF+s=;
        b=cZ4HsFRJHcz7BbsG+CdYxgn9f0fLehXXSENerJmB98xEml54IEubOW3gpKHVBRXDuD
         TTT+m/D3IG+nP4/YETdph3RCbKna6mdQUZQkYlsXDMGmh07IXTNzVytk+we79+qtVBP/
         MzFhh7GTaSUq+anGQ9ZcqmV/nayXn8xLxGePLx2+xaOlR4epCUCyApz41PdqWGkj4IVw
         P2V5CLF1T95NaSGT64nTBirefDZSfnc4gowu7sdlTSzwijkvAbU/KQnj8fetQmyJVMcM
         vtPtrRqdsiMW3NMy0NqEbnGjYQNLgaKJ8OCoO1zBj10Ea91RjCsrjkkva96kcVY/Rv5r
         vl0g==
X-Forwarded-Encrypted: i=1; AJvYcCX4UIwrkAIjtiOZjW8tgs5OvREXUgMWtcvutcSK0+kJe5/6NyfZ1mm5tvY2rP+31OzfnrOtvcbRkx27A+JTOPFu@lists.infradead.org
X-Gm-Message-State: AOJu0YyClK/k67A52Aub+Da69rcTL1miLiaGMhTE1tOM3gErcOMdOf+v
	CPlmBwOmYwbaRW6rvTwFCqyPdE5lLZv2LmIsjJ7vZLY1vj78fET6pRfN
X-Gm-Gg: ASbGncuPrf1cm0UVfTElQoFZHpJ8fOpQOS7CEIm/LfIda9jeb5B5aF55yyZbfxOHTKH
	uEvqnADJblOIOgmQWrndhbKq08OamVS8FeXf/rLVC8SO2pPlplV3dFpyy4Sxe8kl6Vv4bHdMUoN
	s/DMzRfktzCdgb+3DDYmP59IP6+YBYWoD8iFopUfj9J0jRtGHGG8ugvJSf+KvdgyUmxrqS2l6Vg
	z70I3Ww3PbvLOt42sszKzAOWK8ZcBeSMGY9zg0kuRQEJlVBrslABwlGPZSmHQg0rTnH24sOKuZA
	zza88JPlEAOaLfhLhFHXfJwzD5bZPCF8eXg20A6jr5mQcX96//Bp7JdjprA57VWavsXoGvWrR3A
	0QbGiP5GC4mvGH+kib10z6R7VvQvTyrnagLWUDTG4ncht97dmQJIpqAFBZTPr9o9IKK5MQVY4GR
	/54uXp5kq+HWO3xg==
X-Google-Smtp-Source: AGHT+IENH1hy3RB3Y6IqQfb9Wk7lIQp/dnXlD6dHrZhbvQVNIhOUcU051VDc+cLy6tZHWGLWzJ29fA==
X-Received: by 2002:a05:6000:643:b0:3a5:25e0:1851 with SMTP id ffacd0b85a97d-3b5f1875e37mr4907758f8f.7.1752271795585;
        Fri, 11 Jul 2025 15:09:55 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d76fsm5704960f8f.64.2025.07.11.15.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/8] ARM: tegra: Core changes for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:38 +0200
Message-ID: <20250711220943.2389322-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_150957_735956_6F0740EF 
X-CRM114-Status: GOOD (  10.24  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm-core

for you to fetch changes up to 398e67e0f5ae04b29bcc9cbf342e339fe9d3f6f1:

  ARM: tegra: Use I/O memcpy to write to IRAM (2025-07-09 14:20:31 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v6.17-rc1

Fixes an issue when copying data to IRAM using memcpy() and use the
memcpy_toio() function instead.

----------------------------------------------------------------
Aaron Kling (1):
      ARM: tegra: Use I/O memcpy to write to IRAM

 arch/arm/mach-tegra/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

