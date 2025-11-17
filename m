Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE93CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dSZwG+Ut4tx3N9fD6TcZFfeIFY+rAbw7tsG6scq/hU=; b=HLIgtE/WnmrVUxuT3eGJdeKMRi
	+nybf6jONQZDR5i/kfutDByBMa3maII36GxALD/otVPMDhYu1Pp2qMvyrJuOFRWpA0YjTQ4BXHM4J
	Sb1eQoJoTPLNLTGhrYgv6XqFadervulbyIguza65jbfLTa4/xEsb4A27IBvcQXkfC/r0p/iCYnObl
	x7Add0zWEvYULUo+VrBTIcl7jaJ8g0EyriaIU4XLhzqBHcsYKfqyj0f8XfRP88xotxRqdzKJQnqWe
	XXkcSuya/wqed5k/ygBETynb7tOGBtvxRjr2vCvGqIyEHs5mownQ55RMONYUPO8pSgJXDdpAvZmVU
	MQQ5EUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwKD-0000000Fs8C-37Ns;
	Mon, 17 Nov 2025 10:19:09 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwKA-0000000Fs7k-2pgQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 10:19:08 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4edb8d6e98aso653571cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 02:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763374745; x=1763979545; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7dSZwG+Ut4tx3N9fD6TcZFfeIFY+rAbw7tsG6scq/hU=;
        b=j+Gbu/JdBdAvovyE14jWKwlSCxp3d/AmRECkpy7EmOtzrqg33m4MizJpGtjQHs85Rg
         vWOJa5rGz51f9b3hgWHNsEoJKQ80nQ/gn7wxbeznTLi5HjQSRutIKtbZu0RiUrPUsTrG
         gG+55fHtahRNxYL8nbZvDDM4804QVhN8M/NwpzK6O0PuNNPp30GVpFWR8UJ/Z6ZJnTYQ
         0CawCtYo06ru8jDQiV7jffdFpc6CbGmXVRJJVD9+vvIobsnC258AvgiWnekvHHtyWv2k
         xYrWr7Mg/s8UXzp6M4ReDsZxjVkXf6DlcTOdrZ/ZWaHYHNae6Z6Tvmqyio8qbidSmRP0
         KWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763374745; x=1763979545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dSZwG+Ut4tx3N9fD6TcZFfeIFY+rAbw7tsG6scq/hU=;
        b=d0Trwx1ZVnZtFClmeTMUGM/A6xSYj8eDBZCBtFWZyE8K9tAAqVdE5k+azvJ8YD/9JE
         c3g05n7oD7e6uHamkz4Ac6zO+foc74ITaKQLzYVZr4bCKptDuV5coy1ZQ5KDk6GSZjZd
         FdknlMtKI/S8mrvm6tjPYSf/YldnkbhTyedkelVzB3FXf9ChPMQ66FSC0Mt9LRfeHvLu
         pLEBZ1PYyVr7ktuCA3dF8OWRvbNUO8Cidvz7Yx3NrlOY9if6d+L0NLKv2AK5T0AQhmQ5
         jHrQiyQuuTFwtogtJo5rHQia+tXXo/SUFRxlhTOb1IhGQoomebt0Nr7wd4smW6Ebim4G
         baJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvP+ikgItwmW4GKUtW90F+3dTDcTFflflXP1byCV+zhjcOlij5YQR/faXBjpeyBIOcNXBGkrDWua99Ktgxpaio@lists.infradead.org
X-Gm-Message-State: AOJu0YxbTFT5exQDUShnKh7t0D/OR13zcvZ4RYdzrw+7zyN8L3h6jb5e
	HD6M7r08irikP2NfU8LubHbv7VH+qBYbwiSwMOp/u21e8ePw/7RXEeSHKW3MD8Vs7odBgD1cdkH
	sCQ0M5TkoL6pOPT5bL868IXIW1bM39TQMCcXrpdc5
X-Gm-Gg: ASbGncuCjQp0R6aZad+yeiemZFzjT9jBByyHcIy+qbKIXdP7YwGPTqArlDSUCe0kysv
	qaG2wZ4MLniXuQnFqC2JFF5MGmiCbAV3DzggoXGVacan4l6nlnifSjuxXhRqulSaG+8r8HumR8Q
	2rQwh85duJrHEPaoXx4rr2WAc4NUanNPxw81oGk/sVjg9y9A7Tad29wN/NJ5AoS+JuQmTrqET/S
	mRPjHT0PbiN9mSnOeT7pWxCXZKZa/VRzJGlSwnBB7XM//1fg60p2l9E5APZP6KrBpmk5exwas//
	TjVfHQ==
X-Google-Smtp-Source: AGHT+IFNmczB2ds9iTzz5FRf7oU0BYqq8SdTaWadzkP1SRAFOc8Pnz8a3JfCCCKf6Zz2U+3uKM0Q8RAviooSDsFqVnQ=
X-Received: by 2002:a05:622a:9:b0:4ed:70d6:6618 with SMTP id
 d75a77b69052e-4ee0292790emr11283261cf.10.1763374745320; Mon, 17 Nov 2025
 02:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org> <CA+EHjTzudrep2hEno4RPwh8H88txiVYFoU7AyJYVWG9SFSk87Q@mail.gmail.com>
 <867bvpt25u.wl-maz@kernel.org>
In-Reply-To: <867bvpt25u.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Nov 2025 10:18:28 +0000
X-Gm-Features: AWmQ_bkalvPmo1B-rqo9IVXjMt6TjFkbAXf4VPzF4RKYlhIEuPNWjQgsoTvi3Ag
Message-ID: <CA+EHjTyLGFUDbyr_B1uj5ZpxQA9ypCBy0ZUNRQ8M8VdLmXimnw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] KVM: arm64: Add LR overflow infrastructure (the
 dregs, the bad and the ugly)
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_021906_716929_ABE3C163 
X-CRM114-Status: GOOD (  19.76  )
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

Hi Marc,

On Mon, 17 Nov 2025 at 09:54, Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Fuad,
>
> On Mon, 17 Nov 2025 09:40:47 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Mon, 17 Nov 2025 at 09:15, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > This is a follow-up to the original series [1] (and fixes [2][3])
> > > with a bunch of bug-fixes and improvements. At least one patch has
> > > already been posted, but I thought I might repost it as part of a
> > > series, since I accumulated more stuff:
> >
> > I'd like to test this series as well. Do you have it applied in one of
> > your branches at
> > https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
> > , or which commit is it based on?
>
> I just pushed a new branch
>
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/vgic-lr-overflow-fixes
>
> that is based on -rc5, kvmarm/next, kvmarm-fixes-6.18-rc3 plus these
> patches. Let me know how this fares for you.

Great! I've applied the pKVM patches on top of it. So far so good.
I'll test this series more thoroughly and review it as well. Stay tuned...

Cheers,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

