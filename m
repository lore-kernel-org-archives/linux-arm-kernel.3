Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC40CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weVpY5S2PB5qtPhKTuvCTrn7esiEfFzwXr1/dTkYFP8=; b=vIcAzMDj2fx8oNMcuCLcw36Bxj
	yni0vvdjlHSleyAN6kbSWxGRctkdL5s89hbOWMJGxfA1sfqDZ1zBU9Ud/NtM8Eze8t6oXbGPgG0kg
	esfkoJahJD6a27o3kSx5I9C1mIKtBorGn2WuC/AM5qL2ya5Yv/2qTMHpQydasZMG6SEaC9GljM1sF
	v+4q6KFj9g2r+PdF9UO5mYVLhRPF6pN9BKwOrYPvxHa9TCg/gFapRMMYbbUmQOnvoShAxQg/9LR1D
	4a2lJX1M6qYJlvnsW1zI4oIj74r4c8I3hP1tWgCiZGLJHLLYZZsbMBkdinMmS2ItCeiH6tiabvHZT
	km5fdTXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytoR-0000000CZQQ-2iDI;
	Wed, 17 Sep 2025 15:11:15 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytoM-0000000CZPC-27OG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:11:14 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b54abd46747so5041985a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758121869; x=1758726669; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=weVpY5S2PB5qtPhKTuvCTrn7esiEfFzwXr1/dTkYFP8=;
        b=FY5t0NCMLNXFuAdkB815tDm4pGyXufTI/r5UcxGiLhnjrKtZdm52NgdTJJdQ+B9K4M
         RMdKELbaA54X9d2P5ZFbxUeORuZPbTyH3zoykuvyR3AYTUUty1Fl2DSf8LB551Gb8wtm
         MzOUzJnZTxUbXtuwMYYpTc9/7e9VEuPiuK4o+eWzHwoYsdZio+Q+o+U0HVikYc+izeA6
         X1MHnVkpxdxa1mQCXRQOQ2I0UDxkzICEzVzSbgWF5NbyS8Eeas+pEvL2sf0TGgGl/9vW
         xHG7j5TMW2mwoX9a0BbwNgJ1XcIYsnElJYkENcqtFYxrX7lUhch+FzOjvKHo5npvFGA1
         jwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758121869; x=1758726669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weVpY5S2PB5qtPhKTuvCTrn7esiEfFzwXr1/dTkYFP8=;
        b=b2+7sC3FwmXnXag9VFTyASFIcXKSSruerOJJCpfL71GV34wWg0lcx845uvXxtcEHns
         sllrhud2MOkGUIqu/Zkn0r7YLY3jjNC8EUP8mJoFzbeprJEBbpQXnRujJdNn300p4Vyi
         3Bux9jxfJqjLz1AKzdw+Gs3NURXZhmcqZGIN8pYwZlW9aRHsidIpdcoy9f8ha/YR4NrO
         MIxVuHQlHNaovVtGNmtaCHBQeU1+ZHru/tKO4GGb+6zkoCAN0/JX3gbfEn3aAmnsBtA1
         dqDFlCa9yPtMQV+jBeIyuhH2RY/dVqgqvN8FMp7vUc6AzHHVFqAv3y2S7V7Am5jh1VRD
         Jt6A==
X-Forwarded-Encrypted: i=1; AJvYcCXLAc+6X9eg3RGcIuTvw7K4U6H8zOXsDIhUKIROLgGlb2mDEncenBFb2aLiF1zLu/xBEl9CWUIYarTpRCs1O2aI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2huBX6PvSe+1JZGPC3HKBSRZr50XWsJujLcRyCMl4hCPrX0K1
	fT4hSPH3bD9VUJyVhS73pkMzvvbe6+ngOKowvEuKi15LDBxOqL0oe2/kSFjazFSOOlQ=
X-Gm-Gg: ASbGncs3TV4vXrIGxKbCSYT2b6pO1Io0SkssHQlKMF1L8rwtZkLgUJ6PPyBB2osZsv3
	K5X1hxJpsxCU7nZO6KEP4lCf42npyB4ILB1ZXJYtbJwfwrGprfYv0Hk34jpFJAGxyfpGAjAd/JT
	J1MJQ6Ca+oKTDpiCJgiL2u73dQoYjr6RKTWcq4gzysbnxrqesC60AT8TSPAFJnhc1uVSTVZ7/b1
	zp2NGbBx02BSB/bcNLLYCn+H83LCc75WOSq0NJG3z+HS3XFg6lC5aY8p+2QzCC2Tjsx8wp3dNT1
	gF6jRQ9p4PNdORCllr4PoBww+MTObMgl2F3wywMN19Jy4X7jGCYGaq6m1o5aP5hYu/opNIYVt7n
	VN/0hfZM=
X-Google-Smtp-Source: AGHT+IFmYE7qlDUFZiho9mEwR2DSnCEfJp/r2TtZAeVeo8f4CW3I/2ig+DnSXAwTVwkjjffoimql8A==
X-Received: by 2002:a17:902:d582:b0:25c:9688:bdca with SMTP id d9443c01a7336-26813bf1f32mr31633255ad.50.1758121869329;
        Wed, 17 Sep 2025 08:11:09 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2623fd4d163sm127041555ad.80.2025.09.17.08.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 08:11:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uytoJ-00000008NeJ-3muR;
	Wed, 17 Sep 2025 12:11:07 -0300
Date: Wed, 17 Sep 2025 12:11:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH 0/2] Move io-pgtable-arm selftest to KUnit
Message-ID: <20250917151107.GF1326709@ziepe.ca>
References: <20250917140216.2199055-1-smostafa@google.com>
 <20250917144435.GE1326709@ziepe.ca>
 <aMrNJw3obyu8IvBL@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMrNJw3obyu8IvBL@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_081110_546606_B4B22A36 
X-CRM114-Status: GOOD (  18.33  )
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

On Wed, Sep 17, 2025 at 03:00:55PM +0000, Mostafa Saleh wrote:
> On Wed, Sep 17, 2025 at 11:44:35AM -0300, Jason Gunthorpe wrote:
> > On Wed, Sep 17, 2025 at 02:02:01PM +0000, Mostafa Saleh wrote:
> > > Instead, we can remove the __init constraint, and be able to run the tests
> > > on-demand, and possibly compile it as a module.
> > 
> > I think you can just put the kunit in a module to avoid all this?
> 
> Yes, I don’t see the point of trying to run everything from __init,
> relaxing that allows us to use more of the kunit infrastructure.
> But, it’s more code to do so (it’s just longer to explain :)),
> I can add a patch in between, modularizing the selftest before kunit.

Sounds good, also it would be good to include the kunit.py
instructions in the commit message:

Eg this is one from my iommpt series:

    tools/testing/kunit/kunit.py run --build_dir build_kunit_arm64 --arch arm64 --make_options LLVM=-19 --kunitconfig ./drivers/iommu/generic_pt/.kunitconfig

You can run that from x86, which is really how I'd recommend anyone
actually use this kunit rather than booting a live system and trying
to run the test before the system boots enough to explode on a buggy
implementation :)

Jason

