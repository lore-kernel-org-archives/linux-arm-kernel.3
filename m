Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69315D3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 03:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1EIzxLBPat0T1PkHfmxq4YSFbyP3nvn4kDl2RoL1+E=; b=ax6QKG4VVja1c4x60FZzq3HxIM
	SVCrxMzqAeCa/Vpwt103mvKSuXtyErZI57DU/SDPVsqsyebZ7A0n9Hr+I1tWq7iT2/ZoTI4L7LDAm
	ihM0VVr5u/YMU5/s1qsOm5to0FgtKFlFR+DhlPQBfEI9LBAOBj5vCK7mPBPfMxX/L4MXXqP807XAE
	WI12ry2V61rQ8xyqgIuUQGCWn/LWlnkrOI14BgH0ztzDavwA+1FaAk9n/eOyzuqdSHMd2vwIyX/cQ
	UQNBKR3fDgC5UgZeLX6bt3Mhl3RQBjp6BMp8ZjO+pdKWBIHUGQwtFyy9qdydZ88PJUQZ0+tNDXVjl
	M9O8zm4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXbb-0000000GAyS-3dZF;
	Thu, 11 Dec 2025 03:44:39 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXbY-0000000GAy1-1bWS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 03:44:39 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b76b5afdf04so80660666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 19:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1765424671; x=1766029471; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y1EIzxLBPat0T1PkHfmxq4YSFbyP3nvn4kDl2RoL1+E=;
        b=PaKoZxXEDSLDm7RDq36LfiyqpEUvqa4SZlLAvlvB4sdmeTNgrGblt+4ggRLc9TOw7E
         uKuEah6agTlu6+aV3ECzDKBNxNpwExxvs45IxM6iSVdxNyzzu57d9rquqoC/pl8wyUR7
         3osNznYB9pg71qe0Dk9PJhicMzwjncGiKSFrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765424671; x=1766029471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1EIzxLBPat0T1PkHfmxq4YSFbyP3nvn4kDl2RoL1+E=;
        b=sboNxXlyEeIXCuAz+tZn8qM0XZkT52fFFh5Va8Jf7ROVnXOV+Z1UwMGJ0f19zRShUx
         NERtkMe6TYIIKU4rcE+BI0w56YRvyETCWqqoyqNMs1P9yfHHjqIg3HCALa8vhfnBBL/x
         6oEvqTkgbDPLPIevP1z8iufY2Njgw/3/m7PyuS2My2oV0Hyu0E+CvdQvwcJMNMpyglJF
         XL8vQp920UUL9pUyEhWK55Zvwyaf0QrUIaTUmjAvZ+nSsU7cl5oLbxAhOTSPWkPPu/89
         LBzZ7HG6e5lXU0WbFeEODEVSIrO71vpZLJPNU/VBZpZptyfXQtE6TjJ02ubHzhxI0El6
         qp0g==
X-Gm-Message-State: AOJu0YxU/RucVkOUNevpPP7miTM/CUZ7/o4TioRTWw0zZB7z5ImAXiGA
	RJVDJ7KDHt/hDgBfRlovGcMhl3E9hdZjzGYmZmfrMfLuQUfDusBwZ+LisL7Y0DJu9O8W/8oh6cP
	wYCy+sQRelQ==
X-Gm-Gg: AY/fxX7CccPtQL9UNPBrQGjEMpf+NoLuNqw+MnsNaD+9h1vk9Xz2J7bWcJnlwto9NDj
	bSWebhjceR4hKlLgSplvatpC+Gs7ptp4bipiFgcHWOkcKU69EOp0BLEVDdMeyrI4Fh+kkO9Pqjd
	FsRkQUIYseIr/yLvP86iulSg10vTpJtOgWRwsuJqaEc4UvpGeCcvFyIyoU4VBDncmTWzXfoNF7f
	KLJtRXKeSDMitpUmBOXgVrKu1UgZSdJ7jsl/ziXgiU3LWTygHFnAh1dgOD9wxUNOdW0+oLIZyoH
	ZKqVwAJWhWk0bgR/8coyL/0/KKJvaLHBeOBH1vhzP5AKvHPvYEaQ63tUX6kMSSynDzdIFKTTkVj
	y8sk/aNsiDgoo3MWL9PDhoDoDIFdzb6VeDloW+zgRQrhAdQKR+rsZO6O5V0t8IOGfXmTWUtus4U
	9O351zAnPeYC4Vycd/8laQ4AMGqEY0mBKX6bCT6S7avA8NONiaAi8sjvoVGCZW
X-Google-Smtp-Source: AGHT+IEeWSKlHuGRrtsU8I3wZavORL8L9g4hGZeBO0pGiu+ev06EPpscqFL5D5eij2yMrpnygQqWJg==
X-Received: by 2002:a17:907:6092:b0:b7a:1bdb:30d6 with SMTP id a640c23a62f3a-b7ce84c2a8bmr532386766b.62.1765424671246;
        Wed, 10 Dec 2025 19:44:31 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2eb9bbsm136757766b.25.2025.12.10.19.44.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 19:44:30 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so943066a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 19:44:30 -0800 (PST)
X-Received: by 2002:a05:6402:35cb:b0:647:57c5:549a with SMTP id
 4fb4d7f45d1cf-6496da194dfmr4457731a12.20.1765424670271; Wed, 10 Dec 2025
 19:44:30 -0800 (PST)
MIME-Version: 1.0
References: <CABb+yY0Uvkc4g0=gi79j+CCJzKkeuHGD9u_6P5ScAFkNS0F+2w@mail.gmail.com>
 <CABb+yY2or-wT46Z3jGZ_ks91tHGM2D-1OYeL0xtHfuZURatg9A@mail.gmail.com>
In-Reply-To: <CABb+yY2or-wT46Z3jGZ_ks91tHGM2D-1OYeL0xtHfuZURatg9A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 11 Dec 2025 12:44:13 +0900
X-Gmail-Original-Message-ID: <CAHk-=wiCyKE3auGX7tTpQnnXNH3==6hzCWNqQvwLxzuAKivQjQ@mail.gmail.com>
X-Gm-Features: AQt7F2rbNImZSP6ZjJ3ETyH5qW2sL6Rm4GFCkFhfPlLZMekY5FEj0mEXQTKZUU8
Message-ID: <CAHk-=wiCyKE3auGX7tTpQnnXNH3==6hzCWNqQvwLxzuAKivQjQ@mail.gmail.com>
Subject: Re: [GIT PULL] Mailbox changes for v6.19
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_194436_430339_83E9AD9D 
X-CRM114-Status: UNSURE (   8.60  )
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

On Thu, 11 Dec 2025 at 12:29, Jassi Brar <jassisinghbrar@gmail.com> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
> tags/mailbox-v6.19

No.

This is now the second pull request I get today that came in late in
the merge window. Rebased today, because the first version didn't even
build.

Do it right, do it timely, and don't send me crap that was rebased the
same day because it wasn't ready before the merge window started.

In other words - do it next merge window.

          Linus

