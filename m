Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC3CE68955
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 11:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Qinma5kqYmuHBjZm6H5Vna/9c51/QTVcMYek7K4+Gg=; b=Waj1tHU3aRgOFUlYQEseD8NMmx
	wB+5rFh729S+grfRi+MoVteB7t/+XO82VTmzayNvBXGVTMkUxskDXPvysuFCdE4GP1sjJueIk9Kau
	xxnnBqPsp1iwKZPNws1ichTbC8pTXHlJhI2/b1984sFlKyMm287ehyaCb+UMl+9SEeXoowDUlKdiu
	wq7edIClKhLxMax1BBjsM6DuXldLZ6eFstkNbbg9iG4gZBHR6YIz+KMjLCdhOVq2Z5RZ7MBNK0TvT
	bf8Tped2qtn0+JsC5Bwi9eiEbWZOyjUEI2Hkh3WYIoIzg+8RQXeFF/6LFynoGL6DM1LzOtcidQd49
	1S0sthjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TOE-00000003OsK-32Gv;
	Thu, 31 Oct 2024 11:30:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TLB-00000003OTN-3Jal
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 11:27:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-37d5689eea8so525430f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 04:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730374067; x=1730978867; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Qinma5kqYmuHBjZm6H5Vna/9c51/QTVcMYek7K4+Gg=;
        b=nypQuMv6Et1/unFkkEAfig3kRfR/O1yKAKuodHBNTKhOM5wYmavmAEKuEcAupYACDu
         X9VqsmniZFTss9VLu/dBRlMpXXkzIewEuKZwjo6cFJTNXgHrKoMifMIHsH2xnD7LhnuJ
         6eyUckU0p5uN4AS9Wjsz9VNioTzSvOEbnHl4ItYzJQgA+suFsZhK4zum3wKDuJlB89HB
         nqGuLitzA6FybeB95Vv9HbBOnMAH1Vr5bZJBGFxdXIlamOb7tXa3GOnPYCjlNxwabJZ/
         QznAR6eqXqpD1wS4JCPI3R5g96cVRMdmeYC7o7sg6VqwAAFZsMT4r0w5YxzMCHRhhG2R
         kJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730374067; x=1730978867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Qinma5kqYmuHBjZm6H5Vna/9c51/QTVcMYek7K4+Gg=;
        b=kmvxdPPx4iQEJ9+QE2VmctNnf6/7BNjBqqg2WV9Shu9CO3CdU921dHrCNyDtH/Pb0r
         xUwhE+jMIhXhlIs2bcUDSEGDUV2nTjya3tfU6a90E8Nbc9X3NxQJtzyK2E07EB41VZsm
         HvcqiRrdS7nWQ/jtaZxv598nXTXe0WNuodRFCSJg6g+7o8fTaMB8/k5UW3OYK2lMADzr
         VhLJO0Qp73cCDEE15pwl65Y4QIEnVla8MYCoxKPMQtbDo+1i5OlqDKQD/R+eOEw/ZCf8
         4zx4VQjHTZ/P/m2itDGm6ScxPazon/mNsS3nAYRGNNnRT9Ay4jAeF//STEEmVjgoqTj/
         rxoA==
X-Gm-Message-State: AOJu0YzyXn5+NrmqAV22Vf42f2YtTHVSmulhQ4c4KLAnaR2an1Hz+F7H
	62PMVcs7UxzEn1lzaCktHoRCGggXcZKMZktDWDqasW8f9REKceUai0SxGuXlFevK58Ci5vJ5FBg
	x
X-Google-Smtp-Source: AGHT+IHMzU32/E5p1uwxhDrq7bFwkszQjYOIXlfcx9OzbVpxpXnCoF3yBkBjLJDocKcQhGQ24Jv1YQ==
X-Received: by 2002:adf:9793:0:b0:367:9881:7d66 with SMTP id ffacd0b85a97d-380612008e6mr13984567f8f.41.1730374067469;
        Thu, 31 Oct 2024 04:27:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e6b5sm1847280f8f.88.2024.10.31.04.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 04:27:46 -0700 (PDT)
Date: Thu, 31 Oct 2024 14:27:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org,
	Anders Roxell <anders.roxell@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: next-20241028: gcc-8-defconfig : ERROR: modpost:
 "__aeabi_uldivmod" [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
Message-ID: <d3903c31-21ae-4ffe-9969-6faa7e430cb5@stanley.mountain>
References: <CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com>
 <456c79d2-5041-47c4-bed2-44d257524ddd@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <456c79d2-5041-47c4-bed2-44d257524ddd@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_042749_848087_D20AB4ED 
X-CRM114-Status: GOOD (  10.16  )
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

Arnd, can you take a look at this?

This patch fixes the build, but obviously breaks the kernel so don't apply it.
I don't know how do_div() works or what changed though.  All this code looks
ancient.

regards,
dan carpenter

diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
index d925ca24183b..e3131f5c6708 100644
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -314,7 +314,7 @@ static u32 cxd2841er_calc_iffreq_xtal(enum cxd2841er_xtal xtal, u32 ifhz)
 	u64 tmp;
 
 	tmp = (u64) ifhz * 16777216;
-	do_div(tmp, ((xtal == SONY_XTAL_24000) ? 48000000 : 41000000));
+//	do_div(tmp, ((xtal == SONY_XTAL_24000) ? 48000000 : 41000000));
 
 	return (u32) tmp;
 }

