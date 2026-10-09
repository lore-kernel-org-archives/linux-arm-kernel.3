Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3C9CA601F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJ9XeYQkqhsjchhR0kegBTiZB6XHwagNviFnMzxLQE8=; b=4+4syY0Ksa0FeVuX7zqlCCUxa0
	BryF1Pb7cDwt8zgDEqPXvckqPlNDxBU+j+oQRnvD1kLNgPp+3RThM0fBzv1s/pnIMIsts+iDtiHrN
	d1L9afmQocg6KXEgrqSjj2hTJ4HnYtlC34+/iiGISsMTwRjaQgKT6bSJsQDoVttNOAdj38Pz0H2cm
	ZEX/MJz2lrD4TexZSDwcYDwx3bBs+gVz/jq2ujUy2PQX123Hfq5pxgf9rvnhgiCajSjAjwSKXdggj
	Hy6rgarZp5ThKfI7AGqIJzp8jIUbb5RTGvBWp589yaLSJ7dz+tt93/qPhqigQAcClWvVKQp+nO4Al
	zxriij3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFEk3-00000006pdR-21Bw;
	Fri, 09 Oct 2026 17:50:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFEk1-00000006pcl-1ZQz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 17:50:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2df8c28a0b1so26474305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 10:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568244; x=1792173044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJ9XeYQkqhsjchhR0kegBTiZB6XHwagNviFnMzxLQE8=;
        b=H6uMo4kHjpFZuLcuZugtxBh5el6ejdMGbV3zwJzGLdOzRLlpje9H5tToz23M+hOXT3
         4NmwcQY3IWhHKtXPhUHLPQj1UzfGIwClIOweGyP2gsRBHsQUJrU079N28qRpP7FRzwpG
         3JEtb0Lh/B1rxiG6I5V7ZE/mmAyYU8Hy8QZgLRrURnN5Wu560YJot7ZH9HLeYdrbY3mg
         a88cakPgZAURwZrW8yTI19Lg4crofTgsiHPfeXoQxaq1p4qPTB70rXj+u9F4Z+SoBJTc
         Jabpd7FvRx6J5OcCuAbY1H+t2CAOKJq6BMxHnW+Mqm5gMloIW3v553WlWWzQFVxapyYr
         kN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568244; x=1792173044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rJ9XeYQkqhsjchhR0kegBTiZB6XHwagNviFnMzxLQE8=;
        b=KpyochkKz9BsF/YLHz9B1SpzsnZw84SWP1nflatTiFj46tE4jKvuLj4oy1P+PBDpjJ
         a2/khB2gTc5n8Kul3DBVDTM7PEJNhmVYG6dwMhowTvvveYI1sT1pPwVgbP0C52vLJ8og
         TDGEB2eOtTQ8N88Cnvvxjs80SW+5/MZLzW+eAbjXiPSCMzyUQ+mXKnM19XAPA0UMsv/a
         tixgqwCY64327if/ZTmwsNYyswdL7X9sH/XeUcF1XT1wM6/R8y7OFT5eSo0LqdgRmN56
         ITlGSraZHCsLYURz8vfsAUYHRHYLro3iLK5YFZg0VW8wOqqlOKlkTClWAfD1J/KMQRAW
         7tlg==
X-Forwarded-Encrypted: i=1; AKwUvBwMbQ65DJo7cf7Xq1wGUiA5yjJ/kpbZ0SFAncEOWLv0teB5WTLPZZWZG5EJARLNEo8y1NTtyzaD1UQamK1FCkkC@lists.infradead.org
X-Gm-Message-State: AFq9FYL8pHbRx6P27kvV84YJ1MtCsg2KsEXxSEzZ1nSEXn/CcJiJU34X
	Kj+I7Qd2Jz6no+VnxbEoIn/gKk1XzWJOjjMNANsXviXk+3Vnvaq4oBz8
X-Gm-Gg: AYBFou37RoQHa+893hAfiD75KVN0ejlGF0WbQkK/yg8AhwhQ07azD8IBMkJEON9IESE
	gVJ/Yat0iM8T6WpS7c4wGfXNc84JSx6dYpz4ZnCCOw11A0/FRuM+QTj6IVKLGhktKn4SQ1h39xk
	DUSN9x/YndhrB5RhoNBidAK5YKSLHHbgP2jGzw5cf4/mKvrzzmQ/aF3TRfLaJTZIK+3e8T/PIFt
	pS/os3jFOBjTOvjT3pBfugFvxf4mVPXkMooUqOpANGuWBO5TfK9U676gq/bBqIlL+bxxjJvQhjW
	vxVdurIr7RVTo6gelXojUFUApyR9KZbdw0i2JHNpo047bjuswC1Oi5zZk+m3r8fDvM9CwjwAKzh
	ZyUh7ASFviLe/q43i33fCZwq5UW01rzNI6jZXJ8yfW5dVW3Ngpx1I0C6toOEaEilb9ergSCjp7r
	IcrHv0uw8TVl+wFhYDOe2YvaUSpLZXnQaw8zSIFFIsPynPYlHT347X5Le2M1grpnNh3rifQH4AY
	RxaN4G8ziCrSXP7/2j4/XrM2VkNXNExgFpkdepg5xf2mA9wduIWZMuhlndNRh4B6wUyuT9GD3/d
	rZzyvyQ7Ti7H7f4ocJKG64WIfVw5zrsZtTwnn8BGayyv60unAxxUgyxntAVcpPQtAQnP1ukcRnU
	3Ht1+mHcjCrrYlV5x
X-Received: by 2002:a17:903:8cc:b0:2e4:b218:f689 with SMTP id d9443c01a7336-2e842abfe6fmr19557115ad.53.1791568243896;
        Fri, 09 Oct 2026 10:50:43 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:d58d:323::50:f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1562sm14512165ad.34.2026.10.09.10.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:50:43 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/make_fit: Ignore schema checks when decomposing DTBs
Date: Sat, 10 Oct 2026 01:50:23 +0800
Message-ID: <20261009175024.2212-1-ue081723@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <CAFLszTjiX+oiDBsm7MccvZqhcMae=4Dh5x6ULHSLDRMQN8NwZQ@mail.gmail.com>
References: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com> <CAFLszTjiX+oiDBsm7MccvZqhcMae=4Dh5x6ULHSLDRMQN8NwZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_105045_415557_B78BED9D 
X-CRM114-Status: UNSURE (   9.36  )
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

On Fri, 9 Oct 2026 at 08:13, Simon Glass <sjg@chromium.org> wrote:
> Reviewed-by: Simon Glass <sjg@chromium.org>

Thanks for the review, Simon.

Nathan, Nicolas: recent scripts/make_fit.py changes have gone through
the kbuild tree, but I did not Cc you or linux-kbuild on the original
posting, sorry about that. Would you be able to pick this up, or would
you prefer that I resend it with linux-kbuild on Cc?

The patch is here:

  https://lore.kernel.org/all/CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com/

Thanks,
Ting-Han

