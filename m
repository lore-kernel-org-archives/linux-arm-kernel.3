Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CE5C369C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rsl4CQivw42ufMV+wmde8cweSZMoL18GRDE0n83zCx0=; b=HCRICQUA170GxsVBVagRGyFxuM
	MGhoA3/0zt0O3zSa74Zr8K5vVo5K7qCkRKnAWfKmvYW2gnVpkmYm7ElibMr3JoAezaZhoZOyjZPnS
	hIQp3SvIiq2w0FSOc/FuWdbMb2YF8+3vOezhk/JezYJS/vxoNSBhUHVQOq4xQ0xXK73cpZw0tIWAz
	uoiTMImbd+2Pk05hNkunJBFEFeir065TI26i0Bj/l+ayDpIoxXdVWGceu21j55+zvhw/4z2prpI8q
	ktutZu5ZFSq0xhoc0FyKuP+tohrJDqMGbzqhUnX4wTthWrQZHM9oC4DtdjDlEn3w37VXTqLlbE+QN
	FzTmvHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55qR-0000000AIkx-0eCA;
	Wed, 16 Apr 2025 16:42:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55Dk-0000000AB4C-24qG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:02:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so69171565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744819359; x=1745424159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rsl4CQivw42ufMV+wmde8cweSZMoL18GRDE0n83zCx0=;
        b=TBumh3VbnIb+2tPYtB5axT/6ugQhQULTdoXZNSA1VV/AEy3kBov1ApkpawUtDgTYIF
         RBzTGFmSRdF9RnUHtv0rxOTYg43pz9fxlTQgJfUoLzlzjdtxFwYC2TP4JYcNKdR68Kmg
         dfI1pIs6nDrQB2l0c6fJHZSzioKOABZSeDN7pr00Y4QXQso7eEyapFKJCUGMAVId2wlQ
         Dju/qCWhYLUe2ZlCgUQg4wlaUUZrkBOgr3f0wpw3CsJGa5h/uQvVQpt0egEJzko0hgJN
         W4PSRNhXLAvD7hJDPrA7tIN5pTjGqKC4MnvhvsL5+px9xjbQUahejg58/KmDmNZfDcei
         08VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819359; x=1745424159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rsl4CQivw42ufMV+wmde8cweSZMoL18GRDE0n83zCx0=;
        b=p7oV47zW/WpPC3pghak7BfwLOHqqJdHT++z9ISWpLY4oIbRscUhElxq+9UHE8hW5Sz
         JcYAd7/MDHyn710aqWsqPV5kekhcSB79mSPvuNYf8JqygoaCXRnLHHU8L+DK5u+1nyxI
         Em3ltoBVvVMsnNZ3ZHP+ruGapR3YMgox/qlL+yuLxgJXbftVegDhjvahGW2nsWNKJUwx
         o7fPCjPbQMWCAw0n41/91/0USJFD3BzDKI2JbY/gTAVidZfk6vAiBxCDRs1XDtESaPAZ
         7N2nhpd6Mc1EDyD34bxrhAZPknHIr1QvULeNsagB1PEG3F5jz3nKqVHQO46ECDSMgW53
         a7dA==
X-Forwarded-Encrypted: i=1; AJvYcCUDQdqBDh/O/R44tqaB468lLPjfiKbaW9AZ+FUerSl+Q0rx+Nbjd6U2mAQW6PF5X58DE9ocUmchIGkYJ4JaAeek@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb00b57NGsl+k08Ngs66iUCgtzoIRSB0R+Jrb6kp8pKt6tVy/V
	NaXz9XzOUhcZFkGUMjLLIhfUYDaSueKlttfgfPEUKjhSw8NW5osD8MQFbf63gFE=
X-Gm-Gg: ASbGncuk0q6Vbn+E2VDcS+FeN2urVwt2/SK7YdReOUkvalZfHYTlToOp/ut/Qo8qnr9
	rFLc4hwI+5Vr1NSWWW3bvndFumnNSXkyjeFuLjAsrEJYSW1tu6T1MKGJG+DbPw+47eaJxOfsvqf
	x75NhsCxPWg733LNaEtTn2FgGtIzBVjwQ9XzQKsfbsgzeWWBrXPWExp+h4U895d0VDm1vglm5aM
	1brQIUqKZlPkKTsAVmdx9PvOfSCmIaqLWiYDZdd1fmyWnPtZrzLuOHWTF3f6WTyxRt5KHNb1p+y
	KMvDr8L2nCpKBM1klI8zFBUn8dPznOudrM4k1zfF
X-Google-Smtp-Source: AGHT+IERWikXw+24LHmvUQeLjVP0dfJ2V4PcYTWDy6gAecuT1JiOnCWraX4intzBqGRCRoec/PI5bQ==
X-Received: by 2002:a05:600c:458c:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-4405d5fd388mr24047595e9.4.1744819357154;
        Wed, 16 Apr 2025 09:02:37 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9621:2787:c462:7dd5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c82fesm25069995e9.3.2025.04.16.09.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:02:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Russell King <linux@armlinux.org.uk>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: David Lechner <dlechner@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Arnd Bergmann <arnd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] ARM: davinci: remove support for da830
Date: Wed, 16 Apr 2025 18:02:33 +0200
Message-ID: <174481934991.14734.3926853082026589830.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407-davinci-remove-da830-v1-1-39f803dd5a14@linaro.org>
References: <20250407-davinci-remove-da830-v1-1-39f803dd5a14@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_090240_531537_052E4E2A 
X-CRM114-Status: UNSURE (   9.78  )
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


On Mon, 07 Apr 2025 09:50:12 +0200, Bartosz Golaszewski wrote:
> We no longer support any boards with the da830 SoC in mainline linux.
> Let's remove all bits and pieces related to it.
> 
> 

Applied, thanks!

[1/1] ARM: davinci: remove support for da830
      https://git.kernel.org/brgl/linux/c/78e6b545e5587ed89b5768a2815861dcfa415101

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

