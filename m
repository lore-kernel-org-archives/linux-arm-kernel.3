Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468E6C61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JL8FfVObPRfzmPLrYv9XOcmMQBBUynJpo83SRKzY/PQ=; b=gmj4JCEnhxxTYWWlultrJ5NpU6
	ozXfuvgjHxaMdRfYFBP3LMKSn+slnQchFrAkVCuTEqY91dwfyelSnToc/CAb/rgngWMuGC3RzufkF
	XBBdVWAJhvJTnLPqHbxMm0bj+r98WOSV0fTNaQy00sr28WtVlxM3o5gyKUkl6DB/BaFEgon02BFmg
	iPf59Ola4RbB9SYm0iftx5DIc3geddo4crh7NeBDvy8pVrZj9DOGCWO7JLWr6tSl1HZhyutjaEid5
	07TsX+PWxoypt9+G9q5CpBygBJbxMaerr3WIADywxLL+PdbHYvjPOld2L0BSLspwu6vEE/Cg3M+G3
	NgYFnqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymcP-00000000OVV-1Pg7;
	Tue, 25 Aug 2026 08:34:53 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymcM-00000000OUj-48RH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:34:52 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cbeea240819so2692104a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787646890; x=1788251690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JL8FfVObPRfzmPLrYv9XOcmMQBBUynJpo83SRKzY/PQ=;
        b=hkIgak2UZQjwQ1Ed9+6C1nrZFojgRNaMKU9QitmsgQWr0hA7wWh1HhfYz/V61CcZ7y
         zG6EY17XyMYS8HaEDM/xOZkg3AC75m5PZtwAAD4K5mu+RwkL2ygIsVCVcZLHB15j4Wvy
         +vwEZXJgPesbI7JHt8dH1CkiUJ/B6yasXzB/3hbLfQUrAU1LLgPWyngrIH1HCC8o2ejg
         vf8Y8mhwuWB8HkfAj7bCf3Cw1jMtFOOyWHq4d2m+j2Rym/7AN+a0veAMX4bnxV6KyOAT
         XAZVj3PFpu/eVCy/qUnYUZJr0ekezFIn7Wgo3wDqIe0/sE2sm/+a9xvvaVF54aN5IUD5
         YDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646890; x=1788251690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JL8FfVObPRfzmPLrYv9XOcmMQBBUynJpo83SRKzY/PQ=;
        b=S7Sx//nRAt3Q9PPpWV1paqKgElhBuympMH7J7gWwOShUuIZZ6P55Le0r9y7t24eTdQ
         hn8zXLzMEcn/gsDZBlmTGg7/7Ct9i/uNxrTyoKYcNbkGIASf8zuK4FGobxszDYBWwwA/
         A4l7npaHNgXSR0RJe2cZBI3P9KL5VwDZ/OssDYmB4ly5X3uTiMWOPFU8zdI/yUslmVnl
         0Z1OipYYYvHrkZtxvBlpaGNCIR6MM2aZwDpNw+HeOwFzKJZGomgHt0/W3UUo0iuR/ESz
         Tc4ACRV2F5sEoo5sykcxpECI4xg+ymifys6lUnmc40RfSKWI43T7qZ6gTzTHu7Ofrnmb
         21QQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1pSIMz9sqMTJTk6ju/RWMWgslDlbmFwlhT5tlqyJGuCdQ/gIgIl2Fv0FziN8GB5LdhcIsjf29TKbe06Kt5cMW@lists.infradead.org
X-Gm-Message-State: AFuF++muL2JarS1RIoEtxDCQiyzp2pceSWeedkaJtObvlfZJYUVrwF4F
	7XARjO/JiFEvTd9oUaTm7tQVBGpAbNZJeaCk/5/ATQNdcVNEE3A8GEs=
X-Gm-Gg: AR+sD12ZTxI+J6Mx5022u9KRBpAnXTC2tiJ2zreT5uwwzgZQ77sEcWxJvqvgii6r2Ft
	dCXM3tRa7edhLGOb60NFVOln8IfsKJnXQxrNfRFuzuDdzKPy2BUqo97BZ2oFiA93K2Jl3aYO2iU
	R0KDR7wYC/ONlh0+q40NuORHJ/OnrzMk2bHp61QRSfAdKVUseV02yRmtR2+JYgMJLEmjgU38KZh
	frwICyKoYHYELpKnm+ZdIwgGyBJODZs5fiIwIFJ3MDVPCYypyPsle+WPoD6IH/TcomosMWO78IR
	PD3180hhCIzQECgtEeYGI3hr+YHe2t7Of0PC0P9e6oD3Gc6ynNvGE1chw/gl+CueJEVev7EY1HR
	gS1YGqNb8/w7P4eJ1Zz1pELeFqJnuTpe+B0Qw44MUNE2akpuYtXoNvgC9yO3O41Pwf6JthSUUQz
	JHFSqkbcQza9sMIJ99A1HbGUishQiNhGWZ0zvhCi3UqMZ3EQe2k47Vth7mlBKPBAzlt4gZIV76i
	w==
X-Received: by 2002:a05:6300:67c8:b0:3cc:3d08:da3e with SMTP id adf61e73a8af0-3cd2fdd1cfcmr63045003637.2.1787646889730;
        Tue, 25 Aug 2026 01:34:49 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc19f39d4b5sm1517520a12.8.2026.08.25.01.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:34:49 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: miquel.raynal@bootlin.com
Cc: krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	triet.hoang.dev@gmail.com
Subject: Re: [PATCH] memory: pl353: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Tue, 25 Aug 2026 15:34:45 +0700
Message-ID: <20260825083445.249154-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87ld9uk482.fsf@bootlin.com>
References: <87ld9uk482.fsf@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_013451_032815_6FEAC202 
X-CRM114-Status: UNSURE (   9.60  )
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

On Tue, 25 Aug 2026 10:13:17 +0200, Miquel Raynal wrote:

> Here is the occasion for sending a v2 with your two patches: wrapping at
> 50 chars is abusive :)
> 
> Other than that, I guess the diff is fine.
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your review. I will correct this and send the v2.

Regards,
Triet

