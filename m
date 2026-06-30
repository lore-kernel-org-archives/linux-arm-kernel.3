Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637B6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=; b=s1voEnU4JbjuK2EfJ2gFk+s9pE
	38kRjjbpN3QEnsytiD4LtQ0b7LnPSRoanypJcDD/5rVb8SnuV1HrDk8ncCP3JDkIrsjhNKX4uPcXV
	av9N9LYmrBFala44VtLa6OKjUErEX4lTJubiE+kklU3dclGqA8vCP5Sim+ogueeszJY1kfVdyUvni
	SmFOJ02WsUaSB3V8SfJlekToLlUppkMnmSZ7rEQpuHYVt5oF0dznQ5Ij4leg5cVbmiMgfDaYWtvWi
	5Cu8SS9RyDAQR4utF6Zrwuso/0aU64QpoyTcW4cmFDeT4xHpAyhOYN5IJuovnq2cAZ4joRhTXRzuU
	XeCoi0Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWFB-0000000Gliz-1Xs6;
	Tue, 30 Jun 2026 11:03:09 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWF8-0000000GliH-3m1i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:03:08 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6983f8b0aebso721366a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 04:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782817384; cv=none;
        d=google.com; s=arc-20260327;
        b=VxYMHxT2OsNw19u3PUYfMzKd/Al2yitEikiOBB0AHWxQccnwxoO9cSNhoWKbNQ0Por
         Aw1FNEkcXbhzhgM2FoFDNPlOfQpFdsVT2WwNcJ6Wr/KfMehlgc7H9w6qJWIjfr3f+8xE
         5QB3Yl3JOyNOqu/y0wg0aVFMIpSPgGUgCwrk1tTfMb+c80wjaF16QqwEMkOdO5uk9Eu2
         ijzbEBeR9jZK5T/OuwIHlwwahqji6jkkcY6KbNIjlF/7oCnWW8HRnTauoZoNzOohwtki
         ZmKctnpjgHO1wGVRQ8dAltgwfRzfoXqpA/MV7IuxkUqjYm4+J9ivuAabd7LxLFIq+a22
         +GEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
        fh=HwX36oYimxeaCzL0cMaWb08S957lWN/u1pOTqapHzPw=;
        b=jKPHXAt8eFZvvGHGt2NzosEi3tjPbdJX177NgxeoqsPtY+ILRHE/7nYTNilt/GKNsw
         yisoP9PaR1xCjB9wSyENZX834NvdvhXKOnNHP8Hq7pSxexF0H5JCp/WBpoUDJYg/2peR
         IHZktoXzIc5NG37R8NNkTiWX8xZ+SwHvqBzLf+cuej00o2bWPYbggDdWRUKk/nQNgT/E
         i6I/VO+ytncD21lZonDJ76TXw2xV60ufzNHfE7csdwq+oJd7h6qcL0/sD8KLo5wuT2nH
         ckebuw7MTffxOFzX15z7r5rOF6thByKwBDcnZtSU3fqYjwnXIdJY7uTDP++CoqTL/gtS
         RjYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782817384; x=1783422184; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
        b=zEGIoOE6yWSXDFkKpymXKLGfm9ahoZMlZBgyxm1pd7wJ2eELlVLbdnLtKcoSYaUdDp
         s8W80jajHZWFzC/sbIKI4BtBqZaX4ClcmROFK2UbmW2cM47bYovwygYGzqELKbaAjpRR
         S5MLfQKUpZ3/bHpm+j1vuyzaEoXZeqMmWrS2NHA1cvKaTMPKU9WllfAvEEze1EKjBxiL
         1u7xsdzOc9evc3N36OWHZG1s+OdFYCSeEWRS/3SGRrgNKHSiWhzHqx9VzthnPgrum21/
         t0IX8q9CHyMtLQS7aX3PYJ7U3KchhXZPZwOJQbRb+iQ8igvjJ9WvS44GywSRcG2ojjDk
         IfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817384; x=1783422184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvJH40d0IrIetecFCQlgRVfs0FrCD/qnuQhwohU6QjQ=;
        b=MMsdg1wiWMwWpgMeSZS+//KlDal+F/z4Iz9f8B3RzJ+hD+0jQjlTlNVK2Q9zXE9/Bd
         4gzEO+EJUzO2RiNuPX+xWYqvkHbLvzaisepewhv+UhvCzyYomY6guo2AzZvBzzuwnp+h
         Lt5E1MJHdxj0Hl4rzftNjIE2IkyfnG9Eb/fcpAY39Vd1eKrBdhrk+skL9NlQhOBvJ2ec
         pH6lSsZA/ZnHS0I1NWrHGurxvWx4H/sLf5EJJnomx1DgflXf1YGWsWf2nui7m+QBuOfN
         vRDCQVOT9ACFyz2gYpqObkXijBGQKpMbePKzyqcLBwQN7CJ8Rlktvf3+0StdtZ8zZLfZ
         kogg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4FtWDki2rB+yYNot3+Drw1DvxaSHyAK28Amuq/mS+NHKe+9Vv68Gk7gesrFDY5o2ZBuyM5KYkqn0Svx7SL1Ri@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfsd8UX1Laz+2C/tKviF94+P7Sq0jJ+Eb85240C/FmBI2fKBE3
	y96B58EO1Y/8TWfcAAgst7hSwRi86Nmqy8YKZp7wJdS4lRKqccuachsSkGShaBelasZLUMBzdAR
	XRIlM6lZ1HpuH+eQCeNyN4GZAqntjVjlqCZmy/98YDw==
X-Gm-Gg: AfdE7cmiYasRnYWjdWYLmOP7tx76ZemzI+1PnSYI3hnNHEPeqG2rlvBkIJUWsT7ypGR
	sGB3mMX7Oj18M7HVpdthrs8eJJwe55un5L3FUEYfcw3JbdLSaTPJYh8GPyuwempM9Yja5Fg1ywy
	21aID2RTZowXdAk3Qltp4KCLQu4cauGPWxU0BoOV5965zo0xgmMjE91n0no4KVvfmMU0BPIj/gy
	ILSNlYTN98/nxancLi0tkFfmV+k20KK1NUipKazGANz6EtFJqNos+WQAhABlf5C0cFIXK3dAdyl
	TmRDJqYLDmlSKOrSaUBhy5DJTafubQ==
X-Received: by 2002:a05:6402:2695:b0:697:fbe7:2028 with SMTP id
 4fb4d7f45d1cf-698819d524fmr695334a12.13.1782817384224; Tue, 30 Jun 2026
 04:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
 <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
 <CGME20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4@epcas5p2.samsung.com>
 <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com> <0f1e01dd0844$01190c40$034b24c0$@samsung.com>
In-Reply-To: <0f1e01dd0844$01190c40$034b24c0$@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Jun 2026 12:02:52 +0100
X-Gm-Features: AVVi8CcnyhJ8d9gnBSRZyCKu3M5tPQ4ftaBlF7F7oCbmkRZx4xm5fGDGZptwHa0
Message-ID: <CADrjBPoZ4G09WGC_b59YWq3_EfTaPFyp0dD7VizKLYBW_eFk+A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_040306_970964_93969C85 
X-CRM114-Status: GOOD (  23.73  )
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

Hi Alim,

On Tue, 30 Jun 2026 at 04:53, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Monday, June 29, 2026 6:02 PM
> > To: Denzeel Oliva <wachiturroxd150@gmail.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> > <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
> > Alim Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> > <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
> > Masney <bmasney@redhat.com>; Rob Herring <robh@kernel.org>; Conor
> > Dooley <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org; linux-
> > clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
> > parents
> >
> > Hi Krysztof & Denzeel,
> >
> > On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com>
> > wrote:
> > >
> > > Correct eight PERIS gate clock parents to match the hardware clock
> > > tree and reorder the GIC mux parents so mout_peris_bus_user is the
> > > default source.
> > >
> > > Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> > > ---
> >
> > Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> >
> > @Krysztof: I was thinking, maybe we should establish a new rule/best
> > practice for Samsung clock upstream submissions whereby patch
> > contributors should link to the downstream cal-if code for the SoC after the --
> > - line. That would make reviewing the patches' correctness a bit easier, as the
> > downstream cal-if code would be readily available to the reviewer.
> >
> We can leave this choice to the reviewer if they want to refer to downstream cal-if code.

Generally I would like to, but I also don't have time to hunt around
the internet for a downstream kernel tree. My rationale was that the
submitter is most likely to know where the downstream code is, and is
likely using it for the upstream clock implementation. So, linking to
it as part of the submission should hopefully be fairly easy.

If it is a Samsung SoC for which no public code is available that's
fine. I didn't intend this to be a hard requirement: "you can't
upstream x,y,z unless you link to the cal-if code". I meant it more as
"best practice/guidance"; if the cal-if code is publicly available,
linking to it would be a useful reference for reviewers.

Thanks,

Peter

