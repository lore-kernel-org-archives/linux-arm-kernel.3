Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E52CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 06:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC3G8Ydq/hH7/R8jIdeAziyUg1MV8Z+nvGhUkoaFFOw=; b=vGfVLqc1yQnLaokxNNjHzfa6h6
	UwX2iNwlJdYPq9bpmv9ftArYodYy3geHJCltD+Rm7E8XQnBB4l639nNhP6MwtKSpBbN4tBGhveWqf
	EZ56CJqk/1eMvTk0Aq2mxN4mnmXhc1mO7aR1gOnBe7GaY17dICcWIhrajf/KOu0BJS8VCaDYXRNGF
	J6SW3C1OWI6oY/v7jdLeY8CMB+EqJcKE5P/2uSZg6ibN0f+aMlxkLqM5V/HWxNPOhXoT3nbVhvDWQ
	aKTNs91axILSjd7a1i4n4r6WT712XJRnu1tOodJ6asmSv52yOyK6WK6f82mNTRO2lYd7LAZZifsE3
	AeAwSe9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnlr-00000001b8g-3PzL;
	Fri, 15 Aug 2025 06:18:35 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnhv-00000001akS-0nCJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 06:14:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso1480015f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 23:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755238469; x=1755843269; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RC3G8Ydq/hH7/R8jIdeAziyUg1MV8Z+nvGhUkoaFFOw=;
        b=Peau/tVMbcwC0AJt1fnbVlcPpQPmf0gfavd+nc9Dv7NN16tP29dWXEScpOzAFs3SDC
         jxWdGjio0M30NwCvexiEHE+NYdxMSL6MpzuYBNLw+OBiERuRYp763DZ4aTsH31TUuFVk
         ykLr7RHrvXs/CCh9prna/Ah00tabMyT3JMhLEwQCku7ZJbKRrIEAuzxBV2eyrwVbFYFw
         5hQFsUhSMiAvB4M9CCHAQ/NAbbT/zLBH6DBBno4wxgnSYMGfbbDklZaatf6V6hNRo/aX
         1VfuuzZlYEZ/NprXVjIE3u4RarQuJGPC/19PVCFb+M5mLGGW2J3d0xiGIrit6SZXlJAT
         k+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755238469; x=1755843269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RC3G8Ydq/hH7/R8jIdeAziyUg1MV8Z+nvGhUkoaFFOw=;
        b=P03kfdBQznlhPsw4bm0iBj9v6bA7hgkkP0QCILTVKlsFVM/vePjsX4SvVmEtpTqPB0
         ot9/4661nUVCHha6ErcmxuqX6AoU5Ed6fakbyfhWGPjNxjBxtH1NJYZ/lvGKNaVKOHHQ
         z91xsrt1v/3nNk8fDVkHQZEC89/AljvtVltp/Ck84OxvL6SpTGn5uhL2IUwOk7VYSrcc
         HM5oiBJP73iWiKjb0mdcKWFoSKbJcum1lmos8cir+ku+G6au7sM2B/mnIBowmLo3kL04
         xOIE87rjIWmwYP8OEDVE65e6Y12aje26TT/qVdPDYPb/qVvR2L9H3YIdDdWcAlhx7hV0
         VDFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/dM1sRB+2SciPW1/eRCTVqHdN5jy6dp7DGgus/Z+NqHXlgUwQGOQ7GNFnSKbkaDsdlqyZCtCwVAbFXoimGTy7@lists.infradead.org
X-Gm-Message-State: AOJu0YwpFU8cCaqWP4IIC3MW4PBt6QwEE81fDHfvxhoh5isVELhY55hD
	829kQ1Tpldn2WWpLMnONWGdKeNvlifpplTmZVek4+hVVEJWHwRxSLJv7qnzs/i/kSHK+nxHCv86
	J0F0iV0SOPqKJDe/YJR+/NPFUC1skPEc=
X-Gm-Gg: ASbGncuKCWusxNALqZpO7aU9Ii0i6ucbzztqwg0nngeSulkiYzSi+pJ8trVa23es0i0
	NkfGE99Cwjr+Xw0V6Jtx61g36mEkO7jdTaNfTad4ebomHi2PoNTFnQqrr/b68idkMetrZguHj2O
	ZZWC5xP16ioTMnt9o3fUzwMd9VG8rCnj1U25gZjdg/KIPYQ6CFNZE9aW864Ux+s8NgekgF/vOfN
	gsqpD4l
X-Google-Smtp-Source: AGHT+IGcfJRbvVjPwlmwrtipABpPT2k1A2y354zwiag+PFS0u1nqei6MBVPlvAO14bH2h8cPLQmeAXffrbKgUI/mnik=
X-Received: by 2002:a05:6000:2584:b0:3b7:8a49:eed0 with SMTP id
 ffacd0b85a97d-3bb671f56demr475473f8f.22.1755238468843; Thu, 14 Aug 2025
 23:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250813175335.3980268-1-yeoreum.yun@arm.com> <20250813175335.3980268-3-yeoreum.yun@arm.com>
 <CA+fCnZeT2J7W62Ydv0AuDLC13wO-VrH1Q_uqhkZbGLqc4Ktf5g@mail.gmail.com> <aJ3E7u5ENWTjC4ZM@e129823.arm.com>
In-Reply-To: <aJ3E7u5ENWTjC4ZM@e129823.arm.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 15 Aug 2025 08:14:18 +0200
X-Gm-Features: Ac12FXzA1cRDanNY9nNRCdMRqZ-71xbNZTcaUrUR9hUEP-TJh9C4NEiHu1Mi5Xw
Message-ID: <CA+fCnZdFVxmSBO9WnhwcuwggqxAL-Z2JB4BONWNd0rkfUem1pQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kasan: apply store-only mode in kasan kunit testcases
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, corbet@lwn.net, catalin.marinas@arm.com, 
	will@kernel.org, akpm@linux-foundation.org, scott@os.amperecomputing.com, 
	jhubbard@nvidia.com, pankaj.gupta@amd.com, leitao@debian.org, 
	kaleshsingh@google.com, maz@kernel.org, broonie@kernel.org, 
	oliver.upton@linux.dev, james.morse@arm.com, ardb@kernel.org, 
	hardevsinh.palaniya@siliconsignals.io, david@redhat.com, 
	yang@os.amperecomputing.com, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_231431_223902_D48FBBB2 
X-CRM114-Status: GOOD (  12.98  )
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

On Thu, Aug 14, 2025 at 1:14=E2=80=AFPM Yeoreum Yun <yeoreum.yun@arm.com> w=
rote:
>
> > > +/*
> > > + * KUNIT_EXPECT_KASAN_SUCCESS - check that the executed expression d=
oesn't
> > > + * produces a KASAN report; causes a KUnit test failure otherwise.
> >
> > Should be no need for this, the existing functionality already checks
> > that there are no reports outside of KUNIT_EXPECT_KASAN_FAIL().
>
> This is function's purpose is to print failure situtations:
>   - KASAN should reports but no report is found.
>   - KASAN shouldn't report but there report is found.
>
> To print the second error, the "TEMPLATE" macro is added.
> not just checking the no report but to check whether report was
> generated as expected.

There's no need to an explicit wrapper for detecting the second case.
If there's a KASAN report printed outside of
KUNIT_EXPECT_KASAN_FAIL(), either the next KUNIT_EXPECT_KASAN_FAIL()
or kasan_test_exit() will detect this.

