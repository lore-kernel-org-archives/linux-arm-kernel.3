Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB91CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYFaoUaPqBFs4zpnq3Lm30Kel2vQ+Isi1f4CetV78uY=; b=gbuG7g9r4uY6m+DqsgAGXOj+43
	U51Jp2hGK+3mm/7tmgulavc28Ikr1U+WvmHpQHJ0xkapyqdTp8kDdWpkWTwlNY0mNg4SPftKmNkIw
	8OQqtcLU1aEwRR8JbWIYvU9ObibYsZZyVSCMG9SAfsw609QC3T0/27/fndy9teXM6mVCXLmGM/SV9
	2aL8iH6ZeoqNQ9Bk4xAaE/igJJJYXfQPpWzSckLnUq78jQrce7QCHkdCd+77o8iGcMiNFsNoJU/q0
	W37iO1PbL6YQ3mf7Yj0E73ltXQX3M44c2s0ACwD6/AwNfYUnnAPsPS1tLZlKgubYcSX/+cxNPJkYR
	wEumnPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0kl-0000000FfwJ-0l03;
	Thu, 06 Nov 2025 14:14:19 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0ki-0000000Ffv3-2WZp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:14:18 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8906eb94264so101126985a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762438455; x=1763043255; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KYFaoUaPqBFs4zpnq3Lm30Kel2vQ+Isi1f4CetV78uY=;
        b=FTCm//A/q4l6iKOsSt9l/49p9aL1OfeREOqdzAxUGa73xGnlSvkYsMR4z8e1YSpzmi
         Up4bv1nXk/5H4NFz0IhDlTJIFohg1anH9II5OU6J+0PgDL540eE30sZuvPrRirzRK7W7
         tEL+RO6EulWEXFtFiM8rV0RRPTJGHln4p7Ht/VfngPDtWw+G1c8U/gSBi4r1hDwc4vjd
         JvP29jbI589IJ8zoKKOZ5ZmC5SECg63oq0WzZfsE4MEf51wuNnez44BxVmrderD64Dfx
         0HIciUnp9FUSvOR8L0mk5IjgWHcEw0g4Uq/cktsw1VPkT3O5ZHtnS4hOlznDAiFr31z8
         UfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762438455; x=1763043255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYFaoUaPqBFs4zpnq3Lm30Kel2vQ+Isi1f4CetV78uY=;
        b=XhrrCNvk/udwKKFiwktfR4PHwc941Bs+CG2rVHK87Y+jK8gxxb5XnXmoz8CC1TPIrE
         UkwDehdx1X/v4zTzWN3xyGb2A1rmLx6txfy6Oc7ga5POeCvW9MX7LYRfhoHtBtPPJZ/u
         1UW9fwVLry02tPpfXISBBikFZ61/SjaHS60lMvF4nyTLC2c3q52Zk16/XEfLa9/YDX0D
         egVhM0MHcIklKX7eN9lSAMHQ2xl0LSVt29baz4gRxwbjycgz3p5ZW0urRnlOj+tHR7NE
         AApOFCnRFoyV6LyKjWUftlyqofffVU1aO0eKmAT90/j2IKHzC8rzNH039uLquXKHJgN3
         eWDA==
X-Forwarded-Encrypted: i=1; AJvYcCXPCKKVVlGm6t2u6hvddp8VpCkpRm1vvXMAK4UPiq03lS2uaf9Jx38vL9rrtShLbARQyp2CF2QzjEKzvr6gdnuT@lists.infradead.org
X-Gm-Message-State: AOJu0YzBjo02eBZjp8MVW6MIF51PxT9sCFZZaKvGlP3pY5zi7CjRzFdl
	+Os1d4hg4YzZBFctJhaIhrsp/sBM2Uk67gEF/X2ndvFJzz/tcO8I6CPRKEF7Z6Dl5vGVpqO85cF
	AmSagYuiTIk8TcYlBWQACavlab2wD6gltEoqmB3fL3w==
X-Gm-Gg: ASbGnctuWWnFY8Q48fFyXAKEeG8B40P4gymy8NeEwaV4Y6ri37QLHJq8TjIspA+jIbS
	0MGdFHJkhBx7sSrcyx9ANNAhauo58XcLOXYcyv5hla6dXqAohvnXqDKGApWh/WRX0SR5IPE7flJ
	AJf1Vhfzzs86Zf8RHFXLfflILaxHaxXoS885ySWjVP1nw3hXmEqQDdFaBvE7Ru4F4uPwYe5Z06D
	0R9FX6eTKHsZGPTygXpQpVvv+zmmywKP7xXzzvWXytiZDncRqTaDjLrfZeNE7d6ppodMKOe2uhw
	cYlGJqwdK1SSuaYPDRPWQ1jPjMsy
X-Google-Smtp-Source: AGHT+IEL/OjdpCudnpto7EM9lmyvDKegeMK7BC71b7SfH+up9yag/BCWFhn9z12orK4BrZX5VPjYqt/GlifmAA0brpU=
X-Received: by 2002:a05:620a:454d:b0:8b2:294:1cf1 with SMTP id
 af79cd13be357-8b220b1c9b7mr943868385a.29.1762438455191; Thu, 06 Nov 2025
 06:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com> <176235893222.387743.2128022832743502879.b4-ty@arm.com>
In-Reply-To: <176235893222.387743.2128022832743502879.b4-ty@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 6 Nov 2025 14:14:03 +0000
X-Gm-Features: AWmQ_blBAvwJrBuwMN552m9J7iG9zQVh_LDuoQgBSibOW9xk--Ct5-VQl5IDv-s
Message-ID: <CAJ9a7Vji3fFnc-XPhdTxh00QW+AjqLqJo=zt+SMwovttQRwR8Q@mail.gmail.com>
Subject: Re: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Linu Cherian <lcherian@marvell.com>, 
	Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_061417_031081_44623327 
X-CRM114-Status: GOOD (  16.89  )
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

Hi,

Is this fixing the correct problem? If we prevent the buffer size from
being changed while the sink is active - which is probably what we
should do anyway as no real good can come from allowing this - then
the problem disappears.

Changing the buffer size while the sink is active should return -EBUSY;

Mike

On Wed, 5 Nov 2025 at 16:13, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
>
> On Tue, 21 Oct 2025 16:45:25 +0800, Xiaoqi Zhuang wrote:
> > When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> > and enabled again, currently sysfs_buf will point to the newly
> > allocated memory(buf_new) and free the old memory(buf_old). But the
> > etr_buf that is being used by the ETR remains pointed to buf_old, not
> > updated to buf_new. In this case, it will result in a memory
> > use-after-free issue.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] coresight: ETR: Fix ETR buffer use-after-free issue
>       https://git.kernel.org/coresight/c/35501ac3c7d4
>
> Best regards,
> --
> Suzuki K Poulose <suzuki.poulose@arm.com>



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

