Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7282BCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 23:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHSamikVjrVol75rYdX/wA0TP+ZRoamzeKbRQET/Fto=; b=AVX4x2nlShfTAH66Dy1O+ROd9w
	st+QEnEp/dETtDB3/79K/T7B34Q42vEV8LwCjiae/TLPf/i+TkTRkBkdbW596Y3Wa4jIoOKQiSIXJ
	m9ggpaV/1DVN5M2QLLDzQspdYZ8qVwxtXJQbDL7pJdGuY/dD+Ig6Jl4iNXjnzACAEc2zuAOzfFofY
	IAZqotMMmwP1VtnBwzjy4zFY5SHdnhcmNALES76K5Uoia4hvnlxoPNLCHPUZc07YvnvswNLUdx/oq
	jGWC9bPWpBghYN4qxCeyNkvczGorURd5D2wRkHxNu6BTk6+XW4kGdgX9WHNzesd12VdnERzf754SU
	fxjZvIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQ7E-0000000CjD5-04su;
	Tue, 04 Nov 2025 23:07:04 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQ7B-0000000CjBj-1car
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 23:07:02 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-ba599137cf8so92334a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 15:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297620; x=1762902420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHSamikVjrVol75rYdX/wA0TP+ZRoamzeKbRQET/Fto=;
        b=b5cVt7gL0dK/cYHQseqn3Tv2Ai4UvbY6H7eg88WND6E5ayfeb6bBfYPMESrYXizt8d
         1wk4vB9hsGslOG+EBD8//BYThX2YXczGlThwSIkzxUbwLBc30/QFCyBGZnyXqNAkC/1V
         /rZEcGVi1++B4PgikrHsHV19PSvGwPHbkAwjOYMXzZnTpx0kIfQAAdifzFHE+0nDVnqy
         pfZ5l+Oeu9FyrOo6fabMJb/5ifmZlL7aTwG1/jkys6cjly89tLKyfQbdw2oNTROpMbqA
         vbhW/z0KXZCjmERWXsVa1R/r6hgSu2sS1Gu8q6DKen1zgwk/V2FfZhV6EFz03L1kDV/V
         bELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297620; x=1762902420;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHSamikVjrVol75rYdX/wA0TP+ZRoamzeKbRQET/Fto=;
        b=RW214VTY4ilpi2MO+iVTQ+oNfm9B28gT8SBgCx5QDKe7hrbJ6acqyAr0vLfGfq/fuJ
         31Ggz2AHiDekUhQUHfzoxE2W/8DLlNUckmPL4pZPbNEAWwXuNn2VALMhij6F8HsS0MEs
         dpaLd7tQb+ijFAHVuG6C0dIieod/HjJiKZ/Q+wE8PX9Ab+dEua11vK/6j4zXzKJMwVQY
         LX0WBlpGJb0tRQnd2xaqXc0R1aPueQieloLKeUgxRNjoBO2q3r3MyrfstxuedyAdLZJt
         +JH0Lf235OLokCZ2VoITw1VMUCpIrbYZAV7irGwQXFCH30Z4Fs3vyQI3c1gybL8gIaA3
         foLg==
X-Forwarded-Encrypted: i=1; AJvYcCUxVIVvAY+QIlsIzoJ6DPAKV+2fFyV5ulBIioYzX78hGiFbYlNCcUaEs5sgG1Lh8VdvbpywcfTNHXsc0OFzVNTA@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq+QfgIOt74W09hYjfjMIB8Ma/GC+sjjryQYkbX3/aBEknCgk9
	aiArsPa5XftOxjlyEubsLT2S3jMJHIumnuxe2Kx51zg1Wn5m6xxhEq+Nh5AfyCoH9fw=
X-Gm-Gg: ASbGncvIDixGru9e5Um2ERc5FQ52yXkEhJ/zMSyuxhlvorm4d/paeebOMfvDm4yIlc1
	Y6LZn8wh2NaHxbBEO4qjxHcAuSLxnq5vTRUNshlV5gEFOXSlRyJCwMwfBbJRhEhZXOAOWoqVAg7
	AMEcW43QLfAKEismmQV6JL8FqGYOHjgthBT2PzE7wX9Ycx68GbfqHvZae+MlDcyZITHcjy0GYHG
	YPQxZpYkuSPoQ/di/uK6vWaoDq2+9w7RVR1oxGcXxkyUIuWr4yyQULf3LdJYapAo09qFp/kgxRb
	crjo+E/PasmXpArgugXYlqMqsYx6sJf0bRy/ifzvZgu8ZQmXp392jm5zs5cTl9XfUKqVnAA72oU
	FSyQ3Cfw0ECZexaPleGVvY3/O0YeqJv5H/3wg0/OmeFYDczkzgaD+i5JSCBu2XxXXvUzFL4H2GA
	==
X-Google-Smtp-Source: AGHT+IFwaQTBRp6clVlgeUdPBLrNZliJRL42mTKXc1D1BNOKkI6h97kjY4cM1NfLKF6HAWHzWlKceA==
X-Received: by 2002:a05:6a20:9185:b0:342:c634:e272 with SMTP id adf61e73a8af0-34f729aa687mr1756746637.28.1762297620628;
        Tue, 04 Nov 2025 15:07:00 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd624030esm4104328b3a.53.2025.11.04.15.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:07:00 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, rogerq@kernel.org, tony@atomide.com, 
 linux@armlinux.org.uk, tytso@mit.edu, lukas.bulwahn@redhat.com, 
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20251013120753.101582-1-andreas@kemnade.info>
References: <20251013120753.101582-1-andreas@kemnade.info>
Subject: Re: [PATCH] arm: omap2plus_defconfig: enable ext4 directly
Message-Id: <176229761977.2840692.1048568589731485574.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:06:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_150701_452541_CD036B16 
X-CRM114-Status: UNSURE (   7.99  )
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


On Mon, 13 Oct 2025 14:07:53 +0200, Andreas Kemnade wrote:
> In former times, ext4 was enabled implicitely by enabling ext3 but with
> the ext3 fs gone, it does not get enabled, which lets devices fail to
> mount root on non-initrd based boots with an ext4 root.
> 
> 

Applied, thanks!

[1/1] arm: omap2plus_defconfig: enable ext4 directly
      commit: 810c5ef6efe9a2be3203a50de781d9050e8b9920

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


