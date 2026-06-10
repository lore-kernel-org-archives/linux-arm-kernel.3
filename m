Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0C5CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9fLXZ+HAybUA/N6IRMYmSl/iEezzjma4TkH6ONidf0=; b=4oBXv6XcIboExFHXc2r3YKMKmq
	6RD7H00WYVKRBzVUIWyof0Qa/BcaQuEVfIwUNbGANpIilaaW/lC0UoEmElHgYNJPeNxanYiDZ5Ib9
	SHqFAXQVw2zgNJPM+PGJ2ZLgXbeHYXkVD/KmOpuesHWCYj82xlbT6SSJTQnsA2rBeRLyV2Wco/ECf
	WfWMBMpGPGwNfMGi3a1cZgCcFh2ZSrxKMtDyu7eiXzop34odJaBowMewbFTMi8671b6SCff2kGkkx
	OkjDX5GMLZeamJ5BLw76atW+1LgUZuN50V33yTB4ECWaE9rPw8KiJWvcj/Gi5ntoi4qA0/TlpaS6X
	1L9tBt+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEZ0-000000077LX-3f1t;
	Wed, 10 Jun 2026 08:45:30 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEYy-000000077L4-2EdC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:45:30 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1382533d428so352358c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781081127; cv=none;
        d=google.com; s=arc-20240605;
        b=CSMcwQS7D7KQipdbmpmjuBCMDqCoLzgt+x6VMNhcltNShEcQzXfntW8zhZFI2/y0WM
         sWAqXL8MLEq3HoZhl3n8rHQQDvxpMwWLQsnhHL+sETDk2/ZsfsPvsJfH0Sg30UqSpR/B
         SZQkX8tlrY0tTKgp324hy4O+OnOzyD3+cyTsjPl928N3yqF8B2jV2g1QsQRJ5gaGebfL
         jPcwbDtc3uHapSL1WAxPBhivvVfmdbZihC7zJ1Sv3Z0I5dcjn8unK5tnlhaWnmtvE0cq
         OdXSOotNJbvCZyUktL3FTSZKrANlmf4/FLdsoH0sh0KwI7yT/6i6RPKTVwc8mr6oyKl/
         hUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C9fLXZ+HAybUA/N6IRMYmSl/iEezzjma4TkH6ONidf0=;
        fh=YxgWgcrZTVINkncVPLN1IvnWnw2bWzWls75Rx4mbdcs=;
        b=hoxf37KxhA5mwO9RqNrVXSJOTtguO+VBSHRayUJTJCoJxEYC3RZO+WdsS3koUsBbaJ
         EWX0cqVK34CKoKqvN3/tA2fNt9JXkUJ2E4U2gDCXo6TB+m5SjTEGNeZZ+kIeSoEFfEPw
         mw5AwXnzTZ5/sDeziloOvgjG7a5zG23P+PSf8dnNB/2zdVa3LTpzkRGragjwnST+T2CP
         3isRjjT+DKaxQzw7PWAEv1nYcIZj1aC4UK2CSUKRCxvemIt6eECCLWVd9l9g0f487y6L
         9p6jNIwrAuHhRG/fmc6J7YGTNC8QFifNrHZ8iYKv+La64SoDkXMFGQyhPA80UmPDeERS
         gdPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1781081127; x=1781685927; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C9fLXZ+HAybUA/N6IRMYmSl/iEezzjma4TkH6ONidf0=;
        b=ahAlN2yjuny0gGrUoZ/AymimPts0zr3FW6UjYUrrusGeZM+qNRaJ7yLpozmzRwBi9N
         ondmdX3tUC+90m/ubtifIzmY+uFlXj9gxyXO9XxLL5uxXbKS0C+jQcBdk8CMDT5+l6dH
         cm4HcjiKSbcGGCVfAdvcQO5rLXgbkAFTs0BVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081127; x=1781685927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9fLXZ+HAybUA/N6IRMYmSl/iEezzjma4TkH6ONidf0=;
        b=rcpL2IKyyanTGT8mgGV8NScF8nYf2zhYmVK+/bbW6eAgPiqWmIWfLg8GYyooYP/wFJ
         RkmLRLr5qYRDh5QbfFuFIXcU3MbmAsEb76G4JvNq2LJ7nxfSKbZpmED2H53fvzdX7+lx
         b50GvpwCUJ5v3C/QOoC9BiMPgVIdn+Wg8pqB9XhfP8fDrrir7qxRFPkdxS7rUmNW+F+l
         ywP9gSJRrCdwMJgD0abXw/o1OqtmtClcbd2a1khI7iI2nRkrwuR7+Z6+Y/GBfvvet9KY
         cTLhf6goq9X1yct/7pL9n09wshR/e/dwyBdb+7f+efHlkewzwNMj8sBi8Toa/ZyMk2WS
         DvVA==
X-Forwarded-Encrypted: i=1; AFNElJ8QtKVRgLgSGOStZCGg+VDY7/M5M7A7rYA1LkNWOIZ/T9Bo2ADpNb4XODGrEAuyDo3kae43dt2XAT99X8cAtdMY@lists.infradead.org
X-Gm-Message-State: AOJu0YwKlNAQFkLrvXYVowA7EtIlWTEfVIJGCv68fQs3VDQ/gNl/FF8g
	/+W2r3EKabx2cD64htBgzkXrJyeuh5rtyfFJbUwtc0/vBkRuymUv40kQmaPA5QGPu3szOZGNkET
	UhygCHKMtaJpdEwb59LEXdkpm/lR5EiHmqqhptJhMhbfTGA3FEm1J
X-Gm-Gg: Acq92OEISpZQF9BYnrFAh2u1/r6910WYceVmDBvAUZxkdBQ5/3VUBL4omGhKA/8sZ+9
	GIiJ1BOWVMVfaP4iLc7i60su2IUGlUJvK2J0jfxqOmkHRt2ROQv+pMyFK7XX/x4jQ4nDpvCNXuM
	pp7G1ouyWNLb/h6xNeNME2hhDVcLgT6jBA6H1AyAfkyp3nF+Kk4xCqR1y48MMKTY4/p7MiXNSPF
	/k89kdmreUYXpID507fQnwnppJdZ/tOrQWzM3h8wgnK2JqekytxCgpg5efzSpd+HyEZeGbd/JFt
	aX8lm+YFvtgBwbzARrtvFc4mE1vpPUYhbADDzbQwuADcbkbF2SLVAtvp6Bfc
X-Received: by 2002:a05:7022:ef18:b0:137:6781:7dd7 with SMTP id
 a92af1059eb24-1380670b7aamr12636468c88.20.1781081126753; Wed, 10 Jun 2026
 01:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260610053312.2267307-1-geoffreyhe2@gmail.com>
In-Reply-To: <20260610053312.2267307-1-geoffreyhe2@gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Wed, 10 Jun 2026 17:45:15 +0900
X-Gm-Features: AVVi8Cey_buC_IQedEW4cK_QTFPRYPSiRQYTe2eqMHRQJL8DOXfXOTc1lTLD76U
Message-ID: <CAFr9PXkEH6k=i7Pb237s6DEz9Xi8ipGg3itvonMqOyG9VGQjoA@mail.gmail.com>
Subject: Re: [PATCH 0/2] ARM: mstar: fix two device_node refcount leaks in mstarv7.c
To: Weigang He <geoffreyhe2@gmail.com>
Cc: Romain Perier <romain.perier@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014528_794547_0A3D2072 
X-CRM114-Status: UNSURE (   9.51  )
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

Hi Weigang,

On Wed, 10 Jun 2026 at 14:33, Weigang He <geoffreyhe2@gmail.com> wrote:
> Found by static analysis tool CodeQL. The series is build-tested only
> (arm, multi_v7_defconfig + CONFIG_ARCH_MSTARV7); I have no mstar
> hardware, so runtime testing would be appreciated.

I can build and boot test this but as far as I'm aware this is non-issue?
I have one device running this code stuck under a desk that has an
uptime over 3+ years now I think.

I guess maybe merge them just to stop another person from sending
another version of this?

Cheers,

Daniel

