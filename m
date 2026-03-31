Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF54FF60F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyuKKl7mhKF/xTEpwQMmSLKf43fn/HmTygtNoZ9fG44=; b=RVgG6oQG9g+s/Z98MTfUdXn1zV
	0tDCapkTQW9k0Xgx2DNOYGfYpSPbrKR6l1hX5BeI1n5oQjSPKHDDIheiZqGc6GINvhLF1O9YTu1Cx
	NIDRBmsHC1rC3ZNYURDXPOz8+Q2LWTyLmlHUJMEojRddDxjDanANMEWxCRUrs7pPhD/vLq89dRAxK
	59mJZ+yz+lATnT2JeYL6S08QDG3DF/9kGlOoyayQsK5esOnHYJFlNWdeVl3DmI7ctOQZMZnI+goFg
	D4q96stBaZRfIxYnhPck5rQ5qjNkzFsunAIVxdNJKzwYz7IyZVFLB6MBgzGssv3mdcJK2a4cXCEcT
	LGJvHceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VPP-0000000Cgy5-1O0x;
	Tue, 31 Mar 2026 09:29:15 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VPM-0000000Cgxl-0SEQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:29:13 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-509062d829dso411531cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774949350; cv=none;
        d=google.com; s=arc-20240605;
        b=Hzea3Qk4ga651K0Bx57Mx3VzV7/PYvWbpU7Y6aXu8++NQPe4PJnYuEMYblej6C0bml
         Ht/xbGcUC8Wiy8BBhXvIXZQRvnJqLkkS7NGRjRYPY1VchKDUZ7RWYo1ToB5/Ri8bSDss
         4g7Zbe108bHnkG4yi4l4B30BcdH5vZufwyneOEcSI4/TLlHYwjxzEJZKx8X6IOv+ULr+
         +Rcz+VDM3ggZSIbb3fstwtbhe2IIQlHmaHFgug6VGcHiGq/yQHAQC0RYzV8NhkSz+5qn
         XcWlqNlMiU0oBuU8E/bpDrqjh+xmlsr2DHjo3FphvV6APMTPA5qrU4zAGR+DwZKH2n7R
         +Zxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wyuKKl7mhKF/xTEpwQMmSLKf43fn/HmTygtNoZ9fG44=;
        fh=6kry6G8NRAzG3hR/HJtPQn3YAx0XHI11LqrKPrFEWM4=;
        b=TjX6nnScCg4s9riT2RTUQwDojmktQFdb5lavPEtrFlN3He5N727ZXzoeRMHyZksSLz
         eZg8dmayuRF78wv/kRYvoHgy+aO4IwOl3g95Sw+UsTm0CyUWu6RW9YGasJok0OPNPqMF
         SesuPcQLpIQKV4pdNiV8yV/edUFb/r0HH07SlwSezmZxjh2A1GqytqmVS90vC+NtUHoS
         EElnDd1vfzzqHdm0WVXzzEl32K3Wg3nPGZaxlKyksyYI5XxqQIxsHij7GHxaAn/2+bHY
         HlMmtFgg1VxW5Raz8jVAbnjcjWNdgCb3jX3C1YkOO16noUp14f2Mf+wj6rIj9V4O4d9X
         zXCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774949350; x=1775554150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyuKKl7mhKF/xTEpwQMmSLKf43fn/HmTygtNoZ9fG44=;
        b=IaUO8qRfeh5fj7ZoDFoGu3Z/WbxsPLWaV5dzdtFo1v6SB/NyCfCMM6WX/B5imnQczN
         hzmE6Xm/+0IQUEwtDlCiHbcZFtlnhSYyeHJUfU9mER7rDC/AR8BrLFFeJwmVbRQj09xA
         h5gg15+KROXUSa/gPTngNi1EEigKRlkNY0oVZFB0dwMcqQoqSXls47Z0I8+h2EK9jdCO
         QfPPo9fcsc/Vy1NeV796HtKfl3fpdwbNBbx3/ivRNOmOzX+C5s3gavkC/8djJHkIVgbZ
         Xj1oFrvgLBh9Vc/gDINRU9YjTI270hj2gBA41tM1KGkjhj0UhsLL85Gt6VLr3oNDErEq
         fJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949350; x=1775554150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wyuKKl7mhKF/xTEpwQMmSLKf43fn/HmTygtNoZ9fG44=;
        b=UStDvRKonl4vi+YXoArnHOP3vEOIA4KQd/6oAFnqxJMMtY2KEOLBU64VeB1hhNnq50
         SwrlYIAJlLyVYpoAMikTQ/Q4wYKiVRGC7CVEBXwes91jyuncPlO3S5ILD6cLUJDl2gzf
         Y8jjXIb0liXhDdZJMtKwCAaLIGNcJtQ0ahQc4EOnEWmddrcN1Uwj8kyrsWN2LZTY0Apk
         SgJRFh5DSaidYcMN6bATay6RSTcK7l+0xoIhz+GHLqKuJYYcaoiUx1D1I4rBuK0w+uY1
         DBMMFNADJVU3q6VhdpalNbPrfnW0/RpCZBP+TvZo2HMXf5Y9hgGJlam26wW7JCtMLBcq
         pZHw==
X-Forwarded-Encrypted: i=1; AJvYcCWWi1IhCK6UMJkI0KWZLM+JV6GyWxbPooPWtckp4HUCGGKg6pOJbZnIXKuq4cIQttoMLUS+T2OaFE7WuBMEMdN9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/TKL6zsZR/b1y+I57ATfSulI6tGKzkscXPhKL4fFq8HgL550d
	z1ZibCzmMZF00mu8rqHGzkr/lg5Dq5wqwJuomP/jzDY9i44vQ8Q8R0Pj/xd+Jb0D6s+B54UzlrT
	byToM8+UfomCYrc6hP9GpIIVLGVZ0dEuNBdux8Ion
X-Gm-Gg: ATEYQzxc1GBKfiO1t7ruIBfNmgqfyxYynO8x607X60hIuLxslnM4iLvpiwGWeBmAW7J
	nBSyc7D+JG0SxiYKleEAVLVEltnbcQaabVKRsWeHhcTamPtKMU0RyDf93rg7uFeM9/NKHTJEgvu
	WhCct3BY4FSRMH+FDc6zELKMlPJ4qG8cBwr3sg/bE/qr4UF1AxnHod2vPPeyaqmR9w2Imn9BNlv
	CZqVV/NtHPfbaPjYid8GUFz6f5+vDXXAGwSTWxk3a7uVyaAI6JMPq+JW/5DgZ90sKaGcHlz8JAM
	aG79
X-Received: by 2002:a05:622a:181d:b0:506:1f23:e22c with SMTP id
 d75a77b69052e-50d2d5dd617mr13252121cf.6.1774949349586; Tue, 31 Mar 2026
 02:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260330105441.3226904-1-sebastianene@google.com> <acs0Qbjfdmlkvd1e@google.com>
In-Reply-To: <acs0Qbjfdmlkvd1e@google.com>
From: Sebastian Ene <sebastianene@google.com>
Date: Tue, 31 Mar 2026 10:28:58 +0100
X-Gm-Features: AQROBzA0mi-WHSU_4dItH79nF8_VINh3IWNunZim_OnJBlTbzQ54B3kyAH5c3X8
Message-ID: <CAHLR_pbA0W7zhXD6Un=kPzLiCu3GMPa3evx2-2Bb7mBoxAEFHA@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: Prevent the host from using an smc with
 imm16 != 0
To: Vincent Donnefort <vdonnefort@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, android-kvm@google.com, catalin.marinas@arm.com, 
	joey.gouly@arm.com, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	suzuki.poulose@arm.com, tabba@google.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_022912_161890_A48EA00C 
X-CRM114-Status: GOOD (  29.89  )
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

On Tue, Mar 31, 2026 at 3:41=E2=80=AFAM Vincent Donnefort <vdonnefort@googl=
e.com> wrote:
>
> On Mon, Mar 30, 2026 at 10:54:41AM +0000, Sebastian Ene wrote:
> > The ARM Service Calling Convention (SMCCC) specifies that the function
> > identifier and parameters should be passed in registers, leaving the
> > 16-bit immediate field un-handled in pKVM when an SMC instruction is
> > trapped.
> > Since the HVC is a private interface between EL2 and the host,
> > enforce the host kernel running under pKVM to use an immediate value
> > of 0 only when using SMCs to make it clear for non-compliant software
> > talking to Trustzone that we only use SMCCC.
> >
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
>

Hello,

> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
>

Thanks for reviewing,
Sebastian

> > ---
> > v2 -> current:
> >  - move the ESR decoding of the imm16 in the handle_host_smc where it
> >    was supposed to be
> >  - updated the commit message to include the reason behind while we are
> >    not doing for HVCs as well
> >  - updated the commit message to clarify that pKVM is not handling the
> >    imm16
> >
> > v1 -> v2:
> >  - Dropped injecting an UNDEF and return an error instead
> >    (SMCCC_RET_NOT_SUPPORTED)
> >  - Used the mask ESR_ELx_xVC_IMM_MASK instead of masking with U16_MAX
> >  - Updated the title of the commit message from:
> >    "[PATCH] KVM: arm64: Inject UNDEF when host is executing an
> >     smc with imm16 !=3D 0"
> >
> > Link to v2:
> > https://lore.kernel.org/all/20260325113138.4171430-1-sebastianene@googl=
e.com/
> > Link to v1:
> > https://lore.kernel.org/all/20260324135728.3532400-1-sebastianene@googl=
e.com/
> >
> > ---
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nv=
he/hyp-main.c
> > index e7790097db93..461cf5cb5ac7 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -676,8 +676,14 @@ static void default_host_smc_handler(struct kvm_cp=
u_context *host_ctxt)
> >  static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
> >  {
> >       DECLARE_REG(u64, func_id, host_ctxt, 0);
> > +     u64 esr =3D read_sysreg_el2(SYS_ESR);
> >       bool handled;
> >
> > +     if (esr & ESR_ELx_xVC_IMM_MASK) {
> > +             cpu_reg(host_ctxt, 0) =3D SMCCC_RET_NOT_SUPPORTED;
> > +             goto exit_skip_instr;
> > +     }
> > +
> >       func_id &=3D ~ARM_SMCCC_CALL_HINTS;
> >
> >       handled =3D kvm_host_psci_handler(host_ctxt, func_id);
> > @@ -686,6 +692,7 @@ static void handle_host_smc(struct kvm_cpu_context =
*host_ctxt)
> >       if (!handled)
> >               default_host_smc_handler(host_ctxt);
> >
> > +exit_skip_instr:
> >       /* SMC was trapped, move ELR past the current PC. */
> >       kvm_skip_host_instr();
> >  }
> > --
> > 2.53.0.1018.g2bb0e51243-goog
> >

