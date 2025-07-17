Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9D8C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5xUBrBCpzFPT/Ceifws++OIUGJp175GJMu2Bn4O4tU=; b=ioMxXxbCQihw947Xdeyhb0hulO
	Cq62odre2kpy6MOXZ+SAnv7ke3esgtJpxY0nuVswRSiVPs799+Hq8M36EYKbgUYItM2ccS+PVSxBn
	9zNe7OCMJ2JLdaaSri+LZWphShA/Mi4xC+C+7yv/icIdoPRx5JtvOE5QTa95SWdNP3EHYGuBYE7Er
	6ZxEx86drLzDCEu3LoUIuSu7y1UwtEmDzIQDjsktxb5WNAXcv/OtcbIlBHbvPOrggrDAPxCwXpvtW
	XxBxL52dbMA/li27NhEvEphlHwVroaYAWpinlMXEZ+j6i3gt4s3KqlVr2gxzC+FMhVjM5BSHOKZPL
	VwnraFiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR38-0000000AZMr-0j6g;
	Thu, 17 Jul 2025 16:01:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQOD-0000000AUm6-1ZIF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Jul 2025 15:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F5xUBrBCpzFPT/Ceifws++OIUGJp175GJMu2Bn4O4tU=; b=TigRB03GIqPfurdXvmA9SlqXxo
	HUc+ohpD3yn1P3mztW4Wj+h+KO8RuWi60++byycOs0KR+gZIVHOyC81cypu+4syauz/+4BROVKTDL
	V08vWUtH0k3U4at+6ujv6aqnQLcvqC9ixKVSpPjdSWQ5Iks6bSqE+X8ieDBMcBiEtZrXwRlrigIYl
	mYN0cbNy3tPCDcrD0+wrY9fRWlv1tPkwKnsRpImorocaUtN1V61l6Vl5RsYNbwKkbKHknFt0Xh9G2
	PVVsT9K6sKz0YRY/XiH2ZeJsH+13YtLAs9+ovrFQk2tmYOwj552beh9HBi0bTYLN796RGeA6kPugu
	/rVEw0Gg==;
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQOA-0000000AIbO-2RsJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:19:16 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7e2c1dc6567so70130385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 08:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752765552; x=1753370352; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5xUBrBCpzFPT/Ceifws++OIUGJp175GJMu2Bn4O4tU=;
        b=cI8t/Z8YnKxF/khvfB8kgK+dIjxq3dCwJfhwEJKzkH3ac8W4gfd2Mq2h0ydV890Bpi
         h0PzFJOZPo7cmN20+4YS/gv5GpjpQ4d2EdNWlsH9YjzhqErqx60CsQrskJ5m7rgjlcEX
         phEm7eeAcv54/4WU/Ya1PNvjabqsAjKSyYiDCjBlDEnhkQlU+zfnMQrXnJd7QmSniNEh
         0mD7yA1v+rl9naBCOfDLyro/7lgk+SDTcf/qC+HP7g+Q67qbWRlVfrvx7xwMEHZhwGz/
         +6dk1Y1bkLme7yhgUJYYickurdEtSOTnb50/UCFLZbzcj59sNQzpDgoaFEUpS22HSkEg
         ToHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765552; x=1753370352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5xUBrBCpzFPT/Ceifws++OIUGJp175GJMu2Bn4O4tU=;
        b=M3YbJi3x5uSPioQ2S9vemvN+QsAVNePwmdPQRK40nXRxUn7GLSq2aN1+Bgv9S61iZk
         /sk6uFRubYqVjY8p4fGEg01RwEwhKZxRA50+Q/09M2nts0/VCyL/2Vc7jYqgsg6UdYRM
         hqlnmCw50RbTZAUEvTHtyoCRzbdJdSovJa3j0+f+44w8ORvpQu1iq26kJRF1Rba+sKcj
         LdgovnSjw7zkKxztB3rYN8WwhAnYR3cxX2uS1xJDQfdiOo2Rdf1tZ2TqpaS8/y4KHzdH
         aFFLoiKVmBXE8TQZleNNEN8N7O8fmLlpwjF+mGuCgKnwyizRLP7BcRu9lauNe1B4sQ0/
         yMWw==
X-Forwarded-Encrypted: i=1; AJvYcCWOyE6mu30o7hpPpUKDWRc8jktwGQqO/YAIHHftGYzOXaZelBgbY5ZmrSOGvJHgbZg+cWTF4quc9kAAK5vpYTAq@lists.infradead.org
X-Gm-Message-State: AOJu0YyOdx4ndEWMgfLpkWIrtM57YWfL9m4fdV2SCF8MAvd3mP5fh33C
	0Y+VZ54UDcu5xmzT++qiIUEEKtTsqOdkfX3moMDdI3XcZsKOCuC63TI+sxI8G7nKxTi/xOAKwh8
	z5U8OiCW85o15qlqVXTs726gczQF8DmK9UyonIoOKzA==
X-Gm-Gg: ASbGncsebXcilmrsmv8zbe5YlruXQ5Yzy1F9qFbOg94Jm9s/H75Yir2PO341KedXm18
	Q3rFgIRrmg9qwUPYPH/2wPGIOmzhTY0XeEVtJXqnUbPVeuC2RS1bSlnTnXh3zw1TPQmVn8n8D4t
	8U25VpSoP0SdtANkCC+U8/pgEtUyptqqG7+z+NLBfrcykW8J1Xpko9tpOJ5s4AZv5PNbkyu6WYt
	Rdascd4
X-Google-Smtp-Source: AGHT+IE3X2vck2pgSl2t6KFn5NgHq0p0Hh8fU3rZDbhsrXFgiaKsssOSMAr59vMNLRAJb0iXVxOVbhMl8sP6UXRX7pU=
X-Received: by 2002:a05:620a:1794:b0:7e3:320b:437 with SMTP id
 af79cd13be357-7e343351613mr1118889785a.1.1752765551906; Thu, 17 Jul 2025
 08:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-3-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-3-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 20:48:58 +0530
X-Gm-Features: Ac12FXyPbawu-s2Ss3H3yKP5ugd9T6IetcEyIWyv14Bbl9oa3EI2UsBfWrZcDw8
Message-ID: <CAAhSdy304FBYo-3TZyNhKqtDsUSnW+B=U3ktR5JHLr9+LLqXEg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] RISC-V: KVM: Add support for Raw event v2
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_161914_828547_2A668942 
X-CRM114-Status: GOOD (  17.16  )
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

On Fri, May 23, 2025 at 12:33=E2=80=AFAM Atish Patra <atishp@rivosinc.com> =
wrote:
>
> SBI v3.0 introuced a new raw event type v2 for wider mhpmeventX

s/introuced/introduced/

> programming. Add the support in kvm for that.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 78ac3216a54d..15d71a7b75ba 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -60,6 +60,7 @@ static u32 kvm_pmu_get_perf_event_type(unsigned long ei=
dx)
>                 type =3D PERF_TYPE_HW_CACHE;
>                 break;
>         case SBI_PMU_EVENT_TYPE_RAW:
> +       case SBI_PMU_EVENT_TYPE_RAW_V2:
>         case SBI_PMU_EVENT_TYPE_FW:
>                 type =3D PERF_TYPE_RAW;
>                 break;
> @@ -128,6 +129,9 @@ static u64 kvm_pmu_get_perf_event_config(unsigned lon=
g eidx, uint64_t evt_data)
>         case SBI_PMU_EVENT_TYPE_RAW:
>                 config =3D evt_data & RISCV_PMU_RAW_EVENT_MASK;
>                 break;
> +       case SBI_PMU_EVENT_TYPE_RAW_V2:
> +               config =3D evt_data & RISCV_PMU_RAW_EVENT_V2_MASK;
> +               break;
>         case SBI_PMU_EVENT_TYPE_FW:
>                 if (ecode < SBI_PMU_FW_MAX)
>                         config =3D (1ULL << 63) | ecode;
>
> --
> 2.43.0
>

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

