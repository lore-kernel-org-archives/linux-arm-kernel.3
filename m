Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D57CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 21:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag5OJvTMxXJDeRviaTg2QX6h5X6prtIOT5+vV3Pl5pc=; b=K+10rx+0Q0mgooE+JCB8C0A8Xj
	8OFAdddFdmzV7UIj+zDyf4C9C5/5nPtYMymuzkcS+/c2aT+AfAAAbcvOFWWPWVS8mIArWBOKrB0cJ
	COjlHlo+zk0/Kc+gj0aYdTh9oRq7rlYk5crieVCdjeIQvekc/NXyFkaKkBGMnZxvlW0/cAzAa2Sl6
	FogucDKVbNTH3WdaUwUMsmjkVOgZS+IIl7h9YHuro327aAPvKi4uInW6YqEm0LJvG3VErx8ctTlrT
	M9u/aoRsNDBj1QEjVELZh+XVxT9n6JWywCFIqiOPHr5QYbwN8wu8dJMMppFNx+ZLUoFLqwXbpF6/v
	FQU7vuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2zNW-000000009uU-1dN4;
	Sun, 28 Sep 2025 21:56:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2zNV-000000009uG-18Rh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 21:56:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 642C6601A4
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 21:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BDFC113D0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 21:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759096580;
	bh=Ag5OJvTMxXJDeRviaTg2QX6h5X6prtIOT5+vV3Pl5pc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UAWZuSOYJ3j9hQ0fWorFNYqEBsdus6cRQrTLw3KiJj0mUCPOHD22dEawatpChR7pL
	 zzbOi1CxWDKrhE1/uMPXpHeGXxzlcoWg31PTg/0mhiHowjY9JWhKlOVB0dfgyT8r+B
	 53D4w/py+/LWGXEmrea0tuBb9gBTJU2R3A6C2tXCuoUOlh/RLJeM64TfpFFdhBn7Rt
	 N5PgqfNxjfRR0hMe9oUSTb7aBpy3wt7e9GFJ3qToxV/wx8xQcyyXRTCrYUwfZgrhSQ
	 AurjXItdn4/usrZ0TYB4UoDcOisUFS6GAtc4AvlClRMKdDqH27RmO1Doq4Le02wZQ0
	 OGXH6+fNP4Xpg==
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27eec33b737so36721235ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 14:56:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzhzqjyOeAotthwrxYmoISxxYqxjf9SrMLwC4TAT70h8MmYiPO23HsEOkrz/SA7P6mpohTsdFcgWf7Ii8KcMcy@lists.infradead.org
X-Gm-Message-State: AOJu0YzWzDHUmcwuCD+q2fSrUoEUNLXBJyx/Kj6nFRu5e8zNGHZYuBjJ
	lYoyidYQB3hTojFqLAghDZAZ/BkbN5aJ4kOCvLKDv4LHKRrOfu585V6O0O/H1c8C3P18WlZvQAw
	3vTrm2s5/Aa837nAPT8vduCiIKdRh3pI=
X-Google-Smtp-Source: AGHT+IEmvEYVOc//pmIHeQbDnEcLXjslRWP9TUnzYJfx2tg/laNf7LCCb9RFTpKOInRVNDKY0Rk2d9ibGpbC2jNixjo=
X-Received: by 2002:a17:903:1aeb:b0:27e:e77f:57f3 with SMTP id
 d9443c01a7336-27ee77f5934mr118692055ad.14.1759096579693; Sun, 28 Sep 2025
 14:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org> <20250928-exynos7870-dt-fixes-v1-1-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-1-a40e77a73f16@disroot.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 29 Sep 2025 06:56:08 +0900
X-Gmail-Original-Message-ID: <CAJKOXPf+fASV2WP+ix_6qb+L-0WqsqLAG7K7FxeQgscsbOUsOA@mail.gmail.com>
X-Gm-Features: AS18NWBY-JzZiyqDsQSGva_Q19zCpOwf1vpPOKC71sJ3_Roa16ez0Y1PkZhVmYM
Message-ID: <CAJKOXPf+fASV2WP+ix_6qb+L-0WqsqLAG7K7FxeQgscsbOUsOA@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: exynos7870: relocate ${x}-names property
 after ${x}
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 29 Sept 2025 at 01:44, Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:
>
> All ${x}-names properties are conventionally placed after their
> corresponding ${x} properties. For instance, 'clock-names' must follow
> 'clocks', 'interrupt-names' must follow 'interrupts'. Make necessary
> changes to follow said convention. No functional changes made.
>

I don't intend to take such cosmetic changes, because they interfere
with stable back porting, unless we have a tool for such cleanup. Did
you use my prototype tool for that or some other tool?

Best regards,
Krzysztof

