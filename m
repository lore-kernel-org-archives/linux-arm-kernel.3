Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF8BCA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPgmINCV8SVNtxSwxWT/uE2/pfejEYPQvV6kz07ef0s=; b=2p9Wc0mHq6i4eI23LMHsYUqNJO
	kIGjOyC12wItgj6TUavMrwnnYNCsiJtZpqMgWoU34CSVSXP+HPYGI3sRhhlXOwlA6FeM4ZIH660gl
	VcIUKfyH2smzHyn8KMJ1QmQrmvXnd9PR1FiA9nHED9c5tS3zfkF7eHRHcg758d1iJZfucEKN1pQEd
	QYubNT2hDPGmF5NjIBfIW6IfGrzk0wsAr4ACiMBvGdYHlUQqJJxtXEQVH6XEjEptj1ZosAX0j4eLT
	pSf4/BE8QIxWt0yT3cHY52U9w0fZebpfHKNI5XfG4OJF1tlVixm6zFWBVb+3drqGIgrBdwxagaUZv
	EM3xyfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvvY-00000006QrH-2Exz;
	Wed, 30 Sep 2026 15:09:00 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvvU-00000006Qqh-2Use
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:08:57 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 46e09a7af769-81b15bca7dfso2969603a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780934; x=1791385734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPgmINCV8SVNtxSwxWT/uE2/pfejEYPQvV6kz07ef0s=;
        b=hKaStjpaR26Ebg9wxaE6hKsAyChUgwNbrQph+eqqM94v8Z9OeveLWGOp6ay9VG2QxC
         yWEUl1nlzwslNDyJv3v8e1lDvyG2uYig0mbz6vHiQsp6hrDBTbepyZQoI+lL8xZF+hO6
         VocU+o0FOv5bZDORKJv2IaqsgV5W3EbobFzFW3S4wq74aXJahyNB8FmuFNMGqz5mia87
         LfT4f+L1U6mZ3GLkiOYT/pw6vdqs85Nw0JLXnpJk8uEZJTInYUb86sUGdzGxPpir6IMH
         UklunYHHKj+Jdclc5vF5eyjb9F+5vbWA1S78YR286U3fNuLhwgJk/kT8KxSVn+ZTLsd/
         KLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780934; x=1791385734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPgmINCV8SVNtxSwxWT/uE2/pfejEYPQvV6kz07ef0s=;
        b=WBAYKAgK9rV/5dYpf3OJOZtzjMul2AzKVpP6ra5bxWW/8aonlYZuRt7/ECUMOAJL25
         E15RvMm9wgK5eOWXmWLj53H2p/Z22IFHrgFLgWZ2GmTbJ23Sgdhtta4GS9d8kUPI0OB2
         jTC8boi8qRv/99cXVWm93Lx+Gs5YMYg5TyJF9bMAbRwPA8QtAvAPwuzoNpIzSAKQ08xQ
         JMTVMkB1A4opGSGlKlAeiUUsPIzUK8r5g9KK2cZMAbDn4rSxC8MUL8Yn+gmPG+U6ftQy
         UeJZBHtYE9nFGcK7FYuz8H3pk/UEN4RYDykXzdil/R1sDv1MbmcJ/lmOXIruTIfpSGfl
         z+5w==
X-Forwarded-Encrypted: i=1; AKwUvBzQ4JvYfIBu65a1epczp0wnf25A6NRDJHh76hhY9UhQ8hOC1GpYosKiSHQpiMNNZZ7ZLTZnPifRbA1IckMZV21O@lists.infradead.org
X-Gm-Message-State: AFuF++mnlagb6Oo5eLTUaVCvKQVD4DL7W//GPpmwj8+h4m5xzujkt5ky
	73phmnsAWZ1tcxnC6xt++xa8LR+U2+mMk2pwUpBY/Lytou80zxkchbOM
X-Gm-Gg: AYBFou04NYggyUL6xQ3E983oAUBE42G1n0p6Nm1jHtPg0HYWvx/bKtbBMiRBfCvr58c
	YPmV2+/w/mVonrlyxLkGQKvVFrsl4xptoSyNoTvohybgDpcSzvuwdyU6d5WZbpcBGC3qewG4T/l
	EPFQfZx3RBnlNjgbVFKf8EAmWNWm0gx6IvPJLkN8ml70wOxM00zY1pgj9QoCIZPoun82aijo4mZ
	sCb6kdeai/fHJmmJbxwOdx4rT8IXYqK0rliIbJfABUQDTPFk1KYVqN2ZnhUT9PkqKbeCf7dFjAQ
	h74qlyRVpfE+beTc/9v2oVTuNq5v5cg6O75zZUc7qIRyBl8rcr6SBUVotOJxLa9uCKajvyulI9o
	BeoJz+CAbgFie0Ztsobyxy1ey7pPUfxfSpNfVTFLC3jhoUYdDtlUUjw9Y+YozJW/UlWlzVX4fzo
	LdyVuF12GeGYe6DzlLyOzlv471h5PNXdoipcoski3KneQouUvUrjCnLDEkXa0ixyc2/giyfhXxv
	QA+wR5LD8CI/lapuIJi
X-Received: by 2002:a05:6830:3916:b0:7fa:5c68:d04c with SMTP id 46e09a7af769-8204b5c2093mr2071820a34.22.1790780934250;
        Wed, 30 Sep 2026 08:08:54 -0700 (PDT)
Received: from localhost.localdomain ([103.179.231.92])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82062ccb8c9sm1087165a34.6.2026.09.30.08.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:08:53 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: linux-pci@vger.kernel.org,
	ryder.lee@mediatek.com
Cc: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Wed, 30 Sep 2026 15:07:27 +0000
Message-ID: <20260930150727.2897-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930120539.4967-1-sreekuttan2156239@gmail.com>
References: <20260930120539.4967-1-sreekuttan2156239@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_080856_717714_B7F9BC40 
X-CRM114-Status: UNSURE (   8.10  )
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

Hi PCI Maintainers,

Apologies for omitting the revision history in the main patch post.
Here is the complete changelog for v4:

Changelog:
 - v4: Fixed struct device pointer access (pcie->dev) for dev_err().
       Verified build and passed Sashiko review checks.
       [Subject: PCI: mediatek: Fix integer truncation and handle
       oversized resources]

 - v3: Replaced clamping logic with strict size validation
       (size_order > 31 returns -EINVAL), added !size check, and
       updated size calculation to fls64(size - 1) to handle
       power-of-two sizes correctly.
       [Subject: PCI: mediatek: Fix integer truncation and handle
       oversized resources]

 - v2: Added size clamping for size_order > 31 to prevent overflowing
       the 5-bit AHB2PCIE_SIZE() macro mask.
       [Subject: PCI: mediatek: Fix integer truncation in fls() and
       clamp size]

 - v1: Initial submission using fls64() to handle 64-bit resource
       sizes and prevent integer truncation.
       [Subject: PCI: mediatek: Fix integer truncation in fls() for
       resource size]

Best regards,
Sreeraj

