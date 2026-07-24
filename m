Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2985CC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mx6s45pl8ce3+CQXW9XOk7a9VTEgFWz5r4/41IBqtcM=; b=mypwUcm2mNw7pt/S9phVHR+dCa
	kfcarAXv1EVXp/3TdaCX+nqU4SQFMXHYD2hUpzd4TQoMLqSMdgbnkybcFk5IbGDcw9r4aG5xckNeS
	7GT+g2Ib8odBHUMxjwyUcEZqV8n065dfrQtxUEIT/tGTjjJZNeTLlg6pMQKtn+YpgUzA7npfb0gF5
	MhkgKNHntuDVPPKuX68dAOi4RAD8PvjOPV6NOOx09v068fEpz+q8TNkl3vtUJ+Jn/YOgnYczchR0b
	6A5OczhuuIXowiLb7ojZpOn73achhybz6Ii6yJhqnw6XDkdxna8TADPuwWdr/YYm4x2zwh3lq0L7h
	TmM+CMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAgG-0000000FjJG-0xxy;
	Fri, 24 Jul 2026 07:50:52 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAgE-0000000FjIX-39Ui
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:50:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4954d383e64so897065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784879449; x=1785484249; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mx6s45pl8ce3+CQXW9XOk7a9VTEgFWz5r4/41IBqtcM=;
        b=BRy32X07ODk7L96AzroRTraksUUUgZ62RKnYsQpcGdopZbZIYJl71ovLf/ww4GWI2g
         SAultWdPQHzMwsOakfOwRtUL0AftgqgEerdz+HR+HUXFQP07jpIatbhPGnVkLRuGyBhO
         qoYG+d1s33zcMMnjyv/Gm/3wdqRgNeNVaQbPr0V1gkbwrVkcokz/dJPqt4jdAZU2xatv
         lp/Q5pRUc0c1TM3Ir++EuQ/T+y5J9No5+nCpIAdEd2sXr4sNnDexnh84LJ2vUtnkjHyw
         A+AyHeDS9JdC7SoqS1XhrudXOmdks9mBTxkH42q0HxqeI1/9Bbdf0EjjAyGMagSjcI1X
         UL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879449; x=1785484249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mx6s45pl8ce3+CQXW9XOk7a9VTEgFWz5r4/41IBqtcM=;
        b=Mtff2A4XkkvwqJMbRDE5Q/31eDEX5icZsMVDZzEONlIU5E7OUAngsrglxRFCeNx107
         fUudERSduMxs2fHiDDlQondEZCUh2W2aEM6WqMYiiDZgBQ8cAWzEOu97CWrpr8SbD9XP
         xupdYFSVa2pdHKOR+dtzX9g1+NvP+nfiWwLOwsk8jSGumkERSJ9dwf3HpqRlufy1O0iP
         yRTW852i1/EsbpMGgThpLhMWR4oi0LQEZFb5p3WKQA2DsBbyF6OvlbaJwkWaL1mWWAjN
         vhtAiVen7UqisNXqi8K8LNDk5PlxV+aZovuYQ943qBwcjArGnCKI20rLDtt2/Qr2ZX+e
         6DsA==
X-Gm-Message-State: AOJu0YzUJVflldPy/9U9FAGhA/UKuWR3+UWhQC15MyXabK4pz7p0OnjO
	gTrnOBueFUMx6OyZ4rbe6eV9tW2fRsgTaIWJH1+3kNumzQ4DRd8TzWTr
X-Gm-Gg: AR+sD13B+CaE+Ymub6fuKhrkI+xrXG/fh7gaJfQ4tPWPbUXLr8EeUQ31GXWV9hOPHKx
	V0zqOX8bCjlI0g37VoKF6k1Z2ak8uN+9s5tX8zYs0DOEw7VetQR5rblZkdzeqiEK1YDca/h03A/
	02B6q9f34B92Rjzv0WtOfU8k0UqPKOJHe9bb9MRScVD2v7kBrzQ7mGmajmBVW4Ixb+uVW9z3fAv
	+0L2/BOkgB5XLzw07F8pnqrXh7nszISS083DlG1Us4rVK52edEXqi9Zn3pDm3sDOd2lmZOQiSUH
	VQLNs37iKFqMWx5Wp914IhGUlTK2eSS4K34jLAGA8R6M180ZC+2rPtVUmynkUCKktwgXsF3qFsr
	HYogeugOALSLf8srvwTYFfaOITuG9lUVwnSoVQR4rDj0mOc9ZVVCkHjG1rY0c5Gr5NhRE67CUmT
	YWuiZzhYZcxv7l5m3Im1w8WZRYEh1kInl7xvkZTjT6HkZC2vl7etTWUD06m92FFYNtSwwbIAZcB
	VKttZENnrU57t5YwhjTUgtX4F5vXXNScxvIOBb2hw==
X-Received: by 2002:a05:600c:6a8a:b0:495:4491:b8c2 with SMTP id 5b1f17b1804b1-49573cbea1fmr51633015e9.3.1784879448261;
        Fri, 24 Jul 2026 00:50:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-077-007-086-196.77.7.pool.telefonica.de. [77.7.86.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f99fa7asm11730455e9.2.2026.07.24.00.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:50:47 -0700 (PDT)
Date: Fri, 24 Jul 2026 09:50:16 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Kevin Cernekee <cernekee@gmail.com>, 
	Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH] ARM: set MAX_PHYSMEM_BITS to 32 for !LPAE
Message-ID: <amMYUsd9vAZIzGz0@gmail.com>
References: <20260724063048.12565-1-kmehltretter@gmail.com>
 <3c79d2dc-8fbd-40fc-8b2d-9d1b4f8ed34e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c79d2dc-8fbd-40fc-8b2d-9d1b4f8ed34e@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_005050_805197_24295771 
X-CRM114-Status: GOOD (  15.24  )
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

On Fri, Jul 24, 2026 at 09:23:45AM +0100, Arnd Bergmann wrote:
> When we added the 36 bit limit, that was specifically to account
> for CONFIG_IO_36 on XSC3 cores, see commit 23bdf86aa06e ("[ARM]
> 3377/2: add support for intel xsc3 core") and the thread around
> 
> https://lore.kernel.org/all/CAK8P3a2MCdUbN0QSb+M3g5_6HjPsaQwtKxFjADMZWomdry4-Ww@mail.gmail.com/
> 
> It's probably safe to assume that none of this is used in
> practice, as only PXA3xx has this CPU core now that IXP23xx and IOP
> are gone, and PXA does not use the high addressing. Similarly, we
> never had any platform attempt to use IO_36 on ARMv6 or ARMv7-A.
> 
> Can you update the patch to also remove CONFIG_IO_36 and explain
> the dependency?

Hi Arnd,

Good catch, I wasn't aware of that history. I'll do that.

Thanks,
Karl

