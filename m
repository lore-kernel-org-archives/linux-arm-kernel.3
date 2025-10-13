Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7C6CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 22:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtxL+uYHTrxBSaf2VJ6n4z+smdSSDd5JBl8pS6dLFSc=; b=JnKNXa1xDliczJPP1RMntTx+5x
	dDjRTq2xxzxYm8X9rRnmdgpeLsxoxluNBSj4jJjjpTbd4eqtPQMb89jdMc1iQf+TnnbJVf59yNs87
	Rws8o5qylLy6yu9/uoXpkAio7VbhjOQQxfT7h51YnJ2XGzA1fUCBbiu+dv920Daz+ukMDJ1Uz8Yuj
	BDGtnqpE31dg3SyLlmpyzT6yUQymGFdugR0NsCHOV9dk8abKW4YCXXSLsWgLjXvzqP9vQpLUNUOfS
	gmqfBEZrA8ItXvXtcXMc6kKJcGox6VDV+a1wfX4Gntp/5f8ghmq0x5JYW8tMOHLphCerNAD2j/Fox
	GcP9kB5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8R8p-0000000Ei0o-3vK9;
	Mon, 13 Oct 2025 22:35:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8R8o-0000000Ei01-35PE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 22:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gtxL+uYHTrxBSaf2VJ6n4z+smdSSDd5JBl8pS6dLFSc=; b=l+UHxMq1LIDks94fKMkabwQAxy
	iRDIVebyleJ98XLecHP1o7c93ECkIwRISkC5X434c1alA1otPHw6TueUiqAjfrwijC+tkJiHWBeWC
	zOVaWVAnzLmuDSLDTlVb5j0PXzvWW+ATdhsP5Hk2tMYAfxsX/0bBIbe9zU/q4JxbnigfAYhPuZ7tX
	Fg8FqAUvAzLxAJZTVYQ/z8YG0v9lt9coDM5PF0x72KhW+36PXWXwjyJMlNRMbdKF5TNgisRgNsJQ1
	+nV3q02JwBIEmUUs0IYi83DGjgNMpJvLDGv/rc4QOVec5XXvMfvbV7pjXdmkFEKZwlLO9JL5pAM8l
	l4KY8cQw==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8R8l-00000004hyh-0SCR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 22:35:41 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-77f1f29a551so6039297b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 15:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760394932; x=1760999732; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtxL+uYHTrxBSaf2VJ6n4z+smdSSDd5JBl8pS6dLFSc=;
        b=SVuSbYgVtbXkeJB4q0tGYrQg4G4twDwyf6C/PSlo/slHP8ibn9YVtSJsFNgKWRJ+K/
         90Nw8tRgDsSp/65sdRY49FBt4ZTMAdUZ1uWYpDMASVxmtYGhrqYgpaBRKZqwvuI1ZFVu
         XGNJUBsrtakzMY7qeQOmUib5nnjx5ySaNjHOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760394932; x=1760999732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtxL+uYHTrxBSaf2VJ6n4z+smdSSDd5JBl8pS6dLFSc=;
        b=YbMrJWo+W82xdAGLkcp9DseZagRmzJL3LmperUQ4NrtnY/vm8TsYUBPxdwfOIlGYa7
         lThHH2CaU7DwuzsU40AkaltDjXxaggO1CMKqGvI7Vl0/olHVCi6kdGQpn01qs7WbzZyw
         XFwhcj1tZBICFbqqQblaTwL8+6bfE9iNyo87FCQOr7PAgO7vOGBZ5jRj4tDvfzC+vEFc
         RI6JLj5nWxD79ZRb0Ibu03HxyUhMok2bLhQxtx+sg/ZoDyxnNQ2PvAMsmirKjFpduC21
         h+PW3MZ19BMUJlhMy9rs++qk35vsxWyWw1p9SJNyCjfx7JhS/AEeKS4LvRD8WpuejqyB
         i+PA==
X-Forwarded-Encrypted: i=1; AJvYcCUC8PSgEkKWeVl4wKU2eYaYI1DNz/EU671Se/pmibtJFVfRLUzfkHuN3S03jde48XOdypVckYVSxfeMmKF0KYNk@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf7Z35f4DAmuw1+Auk2KDn1VMwAar6Qd0nqWGaW0jJztfyt8VA
	s+d0LxJLKn9rvxSxk2U7LpEiLjw77EVr8pbJAFNWOYr+u65zH65Pm+y1KDxcJRc1mKB1nPi1Qjt
	lkiE=
X-Gm-Gg: ASbGncsciJwWHpdcQmLt1NJ5ozg9D5/o5MoXisJQlqvbZz9CT2DJBBfHD+XFVIIa8KT
	ApF0ytAXGF4LpykYF0lLLrTyGkV4hVQbQIbm0GbGH5tsGrFyBpJuaqtUHQUpPDkQzA5N0mZF/jw
	jGqeb1OpAIpdCk9QyS0yd6BHXlnRgq80zwDeN312ml9qX0ZZWy8JM8WBOFS5wHm0yVgxAOon6Ax
	588vpkjl1whDn1kpnlS6TKfp13gfnQR03A/SVzD8sLKRYQrZFYz3/NIsCV8c6mXrenh7wwa+fcM
	MYe7kCPAXBP6QshzJWqG/NJ6Ka/qGPjsSbwMAQzb7Y2mibEY6isgJfY1ajAQ7HyWnsrgDM9i8D6
	JTsBOO1rYtKz5cZuNh0GslHqIieMDeLTe2N5fAjBwXmis1VFgsDBeImZZWfjXzSnw87a/6J9/yN
	4KvL291vY6iuQVTmdPUy0=
X-Google-Smtp-Source: AGHT+IFvZJZ/zS3xlUaN47EQIWRaEm0mZg1Dg4GMyI0dSMSGmy1lkDt3WWGhvKah5vsI45s+amer6g==
X-Received: by 2002:a05:6a20:430e:b0:248:4d59:93d5 with SMTP id adf61e73a8af0-32da84edde1mr30232472637.55.1760394931793;
        Mon, 13 Oct 2025 15:35:31 -0700 (PDT)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b065c40sm12775656b3a.10.2025.10.13.15.35.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:35:31 -0700 (PDT)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27c369f8986so43134895ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 15:35:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtB64K4QL24pewlkH4B3ujfWo5oQkPHRj6EpCvnK0YzT8axXztOFEpM+3en+y2JkdMdK0BtVHdyDCGZMGsU4FB@lists.infradead.org
X-Received: by 2002:a17:902:ebc5:b0:267:bd8d:19e with SMTP id
 d9443c01a7336-290273799f8mr248133945ad.22.1760394928761; Mon, 13 Oct 2025
 15:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251009032838.63060-1-cuiyunhui@bytedance.com> <20251009032838.63060-3-cuiyunhui@bytedance.com>
In-Reply-To: <20251009032838.63060-3-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Oct 2025 15:35:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XRp9=5yxR3Q1UhJhBS-wm59yssozKi55W7HGk+S94AjQ@mail.gmail.com>
X-Gm-Features: AS18NWD-PlH4jDf4beOYtPWdSx7chQ77jPK1vKggaxR4OltLXyHgtJF5jyN2qPw
Message-ID: <CAD=FV=XRp9=5yxR3Q1UhJhBS-wm59yssozKi55W7HGk+S94AjQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_233539_382874_1A069E7B 
X-CRM114-Status: UNSURE (   9.90  )
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

Hi,

On Wed, Oct 8, 2025 at 8:29=E2=80=AFPM Yunhui Cui <cuiyunhui@bytedance.com>=
 wrote:
>
> Enable the HARDLOCKUP_DETECTOR_PERF function based on RISC-V SSE.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/Kconfig           |  4 ++++
>  drivers/perf/riscv_pmu_sbi.c | 10 ++++++++++
>  2 files changed, 14 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

