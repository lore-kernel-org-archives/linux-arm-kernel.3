Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C654CEB2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otQqz4O6TNg9CZvBwxUyiMUDuV9EeqUVPJurKYQsz4A=; b=L2RcQl8ByZodrwXwzKOzomMuGk
	BAQ/OMPkneHa0F81tPrhFLH1J8N5yBE8Oa/CN4lbgV561jS3mUrky8Rg4gb0Nh5Wdz3WGtWwSjtKH
	rmBdpvxmgSBLxhp7wUSfjafLfS4sU3S0SpUL5LKBjQ4XzuUpT6fIDNqrFrHWLBEvcuXPIPPaxZ/+9
	Q6+7iwPdmGGwS7M5Xg6xI23e1C0zryIMW/6QsnMQKCeFldCyMawAovZOlSS4R7GwOBbT2Rhy007Mf
	TxYDMXWjEArsLla4izqtPiV0ZrxaOiiP7xU8ujpqqNv/xkt7Xis1pFWtfj6p6l7WFpzUsnVpApZsD
	wf/tfiRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9b-0000000Dc0R-2dWm;
	Sat, 15 Nov 2025 09:01:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9X-0000000DbxP-03OZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:01:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so30884445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197261; x=1763802061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otQqz4O6TNg9CZvBwxUyiMUDuV9EeqUVPJurKYQsz4A=;
        b=h55bI27yWxzG355RgaHl7Uqv84V3k7F+KYFy+vyOZIE6bRSXYA+JCkeVSFwqwr2k2p
         Xqw+Hm/wjNlFMcGJgWfoPTeSS2ELT08umzbJPdFZ8Gm81K8rzzhFVTnBl1qvt/7xoMYS
         8U6zMHj0ReOShjfY/Ktt2fMHV5WcgrOgWyzjLlZd+tGSzGSMz7OUjjYRThT+8LWrjZuA
         +kVUjnCIf1PGarWzcIpH+0UF0o5pWvz+PMyxMsWsBLhCO6sifA93237+ziULtRWRYht6
         r70LVT5Gt4+kUxQAiyFDL22kMWiqxh4L2OG0zjvki8OBhYFKtUtAyLAxhq7Jx7T2TlpK
         YQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197261; x=1763802061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=otQqz4O6TNg9CZvBwxUyiMUDuV9EeqUVPJurKYQsz4A=;
        b=XA0qicXFvC4FKieeCBmbTVlaCRsTuVfwXYhHm7it0zpMAWHCd2p9MFv5OA+0iOi2tI
         VJi2A+M6c/o7aBMMtn9uLel0PxjIRUTTD3BVt2CT+fYLmYQx+54LJOjI0TNbGc7o3hht
         YGui85m+jr50+EIbIMvmAW8glOlX8V3fF7uuOIALBB3pC9gtQIOY4ciqDERcK6vPpdA1
         Gwq0p5algZGGdM6Sf9AegV44SJK02DG+fxZIr/qpJbyiLzdyrMrWOyF72/mOlNxSAjBJ
         PhhUPgHrWf/n7Rlt84XuSppeLENpwFCepccEjDdoO34iaHDnQFDnpmqDDebiHpR9mn8R
         5kXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUucTMOrIPcXtmyFL5CINQVHPhNkFiqfbUf2QoW9ONodrDLH/zMbQ6UZ40ay9g31Sak3svqh8l52os6PNbW35Si@lists.infradead.org
X-Gm-Message-State: AOJu0YwwPydsT9HZVPl8RpJe8iig5zVWxfSPJbDBAdS+tbWfKD9yxgOu
	xOk++xw/1vkUOzqbWmcs6geoHiD7Hi5eT3YgoOcAH7otq8J6WOygT3ZY
X-Gm-Gg: ASbGncviqA4FtvymMJq7AXbOIbHDUNkMfKMEIlSYwYxhqgJmQfq3DYhSon3Ie18OlAW
	HBKFFDoWMIQ4YqMmIyRQSF9U7AIzws9dPTBhwMdRIF8XEsijQrHdiepTRZ+1LSoj1Esgjrd0ayy
	byUo1IQtfhRC0vQPIcaVu7GpAe7jLSUgRZO2t323sE4hHV3LyTw1ANf6/4EaZ5JxiVxjgdl0SFq
	DCNS4oPlkrkSfqNyOqS7uh0HmHhKMpLkGA0dQpCd16ZiLCsAEqrGMnRXnf8EasuN27SfDZAv4EX
	l4W2fq5JFgSIZh4wVhpqSfYRyqrr6t3mCyOoMDB89VM6U09N4gKKFPFug7GCWQqf+hyhIWYTpMD
	JQnZVZDj2cTAw9lb+S82bQPcYUWXeIUrOVc5M9OxYzpduXw1tvqTXnOScnugANWI+HhIpqGpn1s
	v6c5fSr8tFR+cV5B9TIRJSHkzEwePoLeOY/MSaPZGMFQqPlmBYhyu4fjqy/HtPGAoacrAN
X-Google-Smtp-Source: AGHT+IH1PM8xyj5yEL7gAjaZXMZK2RgMF06dvQKC4vQfddhPGZGy34EPxlJte1WyAuPL9BFCTP4JhQ==
X-Received: by 2002:a05:600c:4fd2:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-4778fe4fa18mr57188215e9.2.1763197260712;
        Sat, 15 Nov 2025 01:01:00 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477975022ecsm32259215e9.4.2025.11.15.01.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:59 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/8] ARM: tegra: Default configuration changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:41 +0100
Message-ID: <20251115090044.3140331-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_010103_085170_B3350679 
X-CRM114-Status: UNSURE (   8.91  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-arm-defconfig

for you to fetch changes up to 23a29a81b44e3a7a139fee4d3eada5f299d8985e:

  ARM: tegra: Enable EXT4 for Tegra (2025-11-14 18:05:14 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v6.19-rc1

Enable ext4 by default on Tegra to restore systems booting from MMC.

----------------------------------------------------------------
Jon Hunter (1):
      ARM: tegra: Enable EXT4 for Tegra

 arch/arm/configs/tegra_defconfig | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

