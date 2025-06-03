Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ACAC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edqc53WVwam8+kme4BDmyEiA4jyp5xhT2nRH1AvpxAY=; b=rPTECrfNHjkt97ajL7I/FQ0u7+
	2fMzRapLo8ey5f+HL8UxoeiX9v2U0axQH2oLV2PlGiYA2t7EYxRjR2TD00Cf2L+L+egwh0LBGVWQ3
	rMOxX8VLI4ZJQZCqG5QG3ekaopxm2Lv34eHrRHFsF+FsqqS8S+poYvb0kKlPLObsNu3UXoTnS3ow7
	5KRHimFRswd/jGI7GL2pXj3B4M2MywHQinvzP8C/yXPlxZkaEIGTBU6swGjP1yxm80UerRrJ2gEcN
	Hc9zNT5bjsyEud98wGIx1W3Qiom1JLbW345RMxXFxNZ5GaRpMo3521toVBohSgCI05d2jipk5fGlu
	aXvc1yCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNaS-0000000ARKL-3WYz;
	Tue, 03 Jun 2025 09:05:36 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNYH-0000000AQkO-2eLI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:03:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3726810b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 02:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748941400; x=1749546200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edqc53WVwam8+kme4BDmyEiA4jyp5xhT2nRH1AvpxAY=;
        b=hFHHyVv3/wdszKim0H2gKLRsHu1DMIAvmaDCd/8Wz+y5YbT0eh+T48mdPjFt7laX3O
         BsCHFcFdSxdB+MaomMN47maLSEvgZ4F1PZQ0DdgOojX6ovTJTJl5wmdSjk6QBRZuKJbF
         5DhaNJZN/6bA6I7zdUPC52RVRtckMFbi1rs54NjUqdLqAkYEJeZ5Mfj8D4W1oqLX3mN9
         OP8dW9kxMr6hV+hzgS8zh15UewIwFQfdPXMDCrI3iUAMP+zxnjIKHLRfdYLebVu6+WQq
         99ox1JZU0puz93UhHAJ9+RiK9830zJr+/5N+i15IVIjShZCLasRyzsCmxK2i0+7yjXpO
         cBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748941400; x=1749546200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edqc53WVwam8+kme4BDmyEiA4jyp5xhT2nRH1AvpxAY=;
        b=MteeIbrymZCZtpkGByACssQYTL2f8y1rXqmHIBWr3kvYIEylDw/hjtDw7CvfQFd6bF
         cUUhK24b+o44UBw8MsW4GEmq8MGJSZtgPJvRiBPOLWZlvUie7Qz2jlzNuL2s81POEr8d
         DYcGg9SMzhSzjAK0RztMCUOBy9eiv1vbgzQO0/TREiBSy6p5Glepj7Kxd5cC0lN6/LxX
         gi373jr3XA1aAEZWGUl4pb4T8tk7ouXsMZyVDUbtcifz7wuMfhPYa9XQsFPJiOm7pc04
         kksz/9cS+vHvAhPNC2IwW9fClH3r/29cT9BN1KHo/NVUa1uqHAVoQAPQSZItHkrctPxV
         RQiA==
X-Forwarded-Encrypted: i=1; AJvYcCV4idUCUYJECwU88IcVLlMxtG2YEsSx5/zimy50hwndkbVJ2tXtUIwslk27heO/2ShuW/+JpemCtDDr2wO+EZmr@lists.infradead.org
X-Gm-Message-State: AOJu0YwUzsqX1xIC/kchGjdU/yn8n64Ks37tYIohPZnEhLTCVJ8Rxf7u
	luntyTiUjfgHJRprPOmDSQmTvtFkNXJQw6vPSBQvoeXP3S8PsenTaCJ5+Ew4Xw==
X-Gm-Gg: ASbGncv1a9EXyqE/7F2RqV3TDcl+F/ityR0164DkfOyjrS0AhSGu0f/0dkFNzuEZ8Xk
	lB+jYFdS//vRzAUjGIhWGJvhcwO2zGm1RprMabQoAo3wM9qAN177EwkRPtE6JwKNnRfmBU97SPq
	8u3G//qOqmD+e0HrzlK6l5e6JNZmLXwAHNALZgwZ2oepEvxNB8Ttra4NR6jn9qnlYGK2k9vxc6X
	eJXqw7Ig6cBWnZIh8jNQ96CASB9HD0/xl47oBSIpD82pwB8xB6bSVfD816VfBNc9U1jOIT5+w78
	eabvY/7C3kztoovLg75uHwS/9P39nLZRdhVEJyjjIUrvp+LqTQjDHCeaSsPDJLokgbbjSo4n0qN
	6cgb6/WvTrEdJ23pSiknbVc2ts96T6jT0
X-Google-Smtp-Source: AGHT+IFA1Q2lNH+gmspD70SzLf3+pSWEj4qJ8Zsz7JMouVmhAnXVdN1MwMEGMK80uGskc8co5Y4iUw==
X-Received: by 2002:a05:6a20:93a1:b0:1ee:dcd3:80d7 with SMTP id adf61e73a8af0-21ad92b8f6dmr24111773637.0.1748941400229;
        Tue, 03 Jun 2025 02:03:20 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.local.valinux.co.jp (vagw.valinux.co.jp. [210.128.90.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed4399sm8963618b3a.77.2025.06.03.02.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 02:03:19 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: mhklinux@outlook.com
Cc: fj6611ie@aa.jp.fujitsu.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	pmladek@suse.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux@armlinux.org.uk
Subject: Re: Problem with nbcon console and amba-pl011 serial port
Date: Tue,  3 Jun 2025 18:03:13 +0900
Message-Id: <20250603090313.126850-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_020321_668760_327134B2 
X-CRM114-Status: UNSURE (   9.43  )
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

Hi!

On Tue, 3 Jun 2025 03:18:23 +0000, Michael Kelley wrote:
>The problem is timing dependent.  In some cases, the "pr/ttyAMA0"
>thread is evidently able to get the message out before panic() calls
>pr_emerg(). In my case running as a guest on Hyper-V, the pl011 device
>in the guest VM is emulated by Hyper-V. Each pl011 register access
>traps to the hypervisor, which slows things down and probably makes
>the problem more likely. But from what I can see, the underlying
>race condition exists regardless.

I believe the issue is not amba-pl011 specific, so maybe John and Petr
better be Cced as well.

Sincerely,
Ryo Takakura

