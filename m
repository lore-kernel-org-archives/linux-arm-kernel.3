Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7D2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zluAZksj0L8x1p9l+OOtyBpDtW4al/9Yh0L5sEpVqUs=; b=ozto/BdUbHfg3Vmse2zs2Pli3j
	yyn1g/ZzeA8pwJxX1+xfrE8csCGgbGQAgzTnBQohg8/bWkkVwKOYtiQx16ZW6GvTgbN0U+AzOcf/O
	FlSsiSBmcnbkBh1FTZuwWYB/HBRHzIc1KEtRaWwJkc4x+D6wyku7Yl1g9TERkSRh9ugGyMx4IUvZS
	59AVXpe4aNHvuL1MmqfvQ46EpDFpfAsLaULqEeTJIu7ycKaTK759RB0t+tZT097ZpoGKwblC6bmd0
	GavPkzRikp/grv72D88GNbYTJGFY2+axNkJEvulMDcP6y/wbt9j85w0xZLYZFFT/I2U6wAQzhmFaW
	sQC7sEqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXZ6-0000000DZB0-1h1S;
	Tue, 17 Dec 2024 13:24:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXXf-0000000DYtb-4A4A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:23:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43622893c3cso39515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734441794; x=1735046594; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zluAZksj0L8x1p9l+OOtyBpDtW4al/9Yh0L5sEpVqUs=;
        b=p8B25/MDY7Ls9ckkinjqTh3POnXulY7kn9HUWRPVtpFgzepmA2/i5/xk54QlbHu/UN
         eIaO0LlBGQgf6C1K5asFmxMSa2welpTPEQ6WCXlnOdKnYLjZv6pdNVTzF+vgtNCTsfYF
         MsKO+WkYJcNf4uirK8MFH1Po7EIHRnkvGimaLLy5y5rEdEMI+geYbTR3d989X4b5g9Lo
         aRaMWLxDoNikmDYfkORaxhJEGdIWjvMy2SGBsegzgp9FN3h0yuU+f6wB0v+zO1VqVAVt
         e/btnBbDYXOyuC59h/4SStIT1ikpvqMBxad65u3MGP0dAz0fumIQaxHWF/nRh1wAGiao
         3fLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734441794; x=1735046594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zluAZksj0L8x1p9l+OOtyBpDtW4al/9Yh0L5sEpVqUs=;
        b=u7zevn5kpBUZRRyIeTnsOv3lmTlJV8knU1hPK5RAcykVRfy5NzQFiUtK0oHc4YGuR9
         OB7c+4FWyWnEZZK9FC8m3x5wfi5gX7/OxwPFGZSJ+tebd6q0kOa6J+a9u810/dUacuMg
         /dM/jAolBsFWjRdT16kVvdgF5dvgNDD87DI4Pc0xwuymMwU0hC/juLMVVc8X71ESq7Ic
         s3Knf5Oy/CLYEgG5Qq3InFWL5BbmNkVhSvPQ/Nkehs6YD7Q9rrvw8IheaqbxVWgMZV2D
         5RSLAuGwQ2DDNPYDKYlfFZ0Vrq0wYbKjMQHGAhxh8PgGiLQWyVX6YTU3vHLbmr1r/N0k
         pf5A==
X-Forwarded-Encrypted: i=1; AJvYcCWVtYQRkknljkjqFs8/+l77JAdw8fzu0g2F45s/6/WKfUpHiNtGGjvfAo9hJMeqAgmeqyT1l3kJls5IK1ju43bP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5qvjPgQSsaHw1Jc9nfeDEh+K9BPhOzb0TDjq7l3e4IYOkwHWO
	Ux1LA819HTMftjjyE73o5WL9XtxTa6A3mnahhokVFiv/NIu0+RJ09EG3Il5E0K8HVs/GAwmebM8
	mrFoarOlSG8Llu43rNGZ1c0yQeXVmk+3Z1kSs
X-Gm-Gg: ASbGncuXns4Gv32dbAU0qQEQ8hXxNTQm+EgqrteHAkmVbW/WLBln10Nk3mVdT8OeQiQ
	AWRcYBiqsnYMQ6GDNB0+FFNf+zzxmc5Txs1UchYBQB+sJ/RQedwPv2Sg6iSESEnUsc0I=
X-Google-Smtp-Source: AGHT+IG5ALWJj0ksNk9sQYWDvuIBxfw/FZ03jE5oquPujoQVSflCn5++EfO42GLq+XkZqgVWsqivlsN1K0ssWL87W0s=
X-Received: by 2002:a7b:cb19:0:b0:42b:a961:e51 with SMTP id
 5b1f17b1804b1-43648ca90ddmr1215695e9.0.1734441794300; Tue, 17 Dec 2024
 05:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-12-qperret@google.com>
 <CA+EHjTxRt=XoCZbRLE1UjMg4bzgoLYD9Lh0nzmjvPZ2Q4xQOkg@mail.gmail.com> <Z2F5KboZewSDClKg@google.com>
In-Reply-To: <Z2F5KboZewSDClKg@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 13:22:37 +0000
Message-ID: <CA+EHjTzmEonAUNNHM8X__6XHLko0fksjT0_ZVHhKRVsZp0zQCg@mail.gmail.com>
Subject: Re: [PATCH v3 11/18] KVM: arm64: Introduce __pkvm_host_unshare_guest()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_052316_030982_CF1E81BC 
X-CRM114-Status: GOOD (  12.88  )
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

On Tue, 17 Dec 2024 at 13:14, Quentin Perret <qperret@google.com> wrote:
>
> On Tuesday 17 Dec 2024 at 08:53:34 (+0000), Fuad Tabba wrote:
> > nit: This parameter in this patch, and others, is sometimes hyp_vm, at
> > others just vm. It would be nicer if it was always the same.
>
> Argh, where specifically do you see inconsistencies? All changes to
> mem_protect.c should use 'vm' consistently in this series now.
>
> The code in hyp-main.c does use 'hyp_vm' consistently however, but
> perhaps that is what you meant? I did that to follow the pattern of the
> existing code that uses 'hyp_vcpu' in that file.

You're right, my bad. I was looking at the code in the patch, not in
the files. Sorry for the noise.
/fuad

> Thanks!
> Quentin

