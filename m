Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E1CD46BEE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 18:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGOxMm1K5WN+JT4uUn9nzJwvV/NU3i9BH4DGHjnCuXY=; b=13eequZINZva3Wu+0Ng3vYiXYg
	b0iCsZQMJux4qTGZMcBoDC0CgUr0ym6M+WK/zOFR2L+30147tqmH9yCHBpBNrERDXL71tk2sihz9v
	n1su/AfL1MLQUbSwNisYty+JYVs4dHGOk7c1tv3GBpDdfoczdJ1VoNbYRQuzFhPA4eQA6uKtO1GBc
	M5lPqAFU0En3slf3Ub+cb1IyXbIX4/MFXmAz4DlF6MfVEHixZZwA5VgtM/Jm0egSQlH4DLu4Ct0+A
	tjGAdExao2c48Nzg/uEO8WE2qKFbC7JrKxn70CPryVybzMFEvctod6f+i6Y2sHjxXVUn9iLvRurxL
	tC1NU8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAbg-0000000GdyX-2APy;
	Wed, 28 Jan 2026 18:49:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAbd-0000000Gdxy-1iqZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 18:49:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso1644255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 10:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769626171; cv=none;
        d=google.com; s=arc-20240605;
        b=esKxEmqhJzwAs0nWb8eMZeX6eXt27+R3sgYftwkz5FisMBMKP0mHE7dWQhgwxZTpSg
         liUFoqVvw2BROWB1mWZybGrC3QwZH1/BRmbyDhoLa5JTwyVjsB5Yxz6N6NRzpjCm1QhO
         7/v2Xn2aduI1TPpxB5IlZtuFSoyNwTc6lC73ZWWzy7dWyga5Kaqcykv9Axy9NruC1ueF
         vyXVw+PMAQe+GqY53pBAjtR4yG0xRkEc8uCJmt/W4G02ozglkhariH7/vtFtGnP6jxQa
         QO5NN2jQggKn1eBRf725yiWsChPU9Rwbz2ENUQN65Y61Bewrll01WdgH09UZGQnlVVlm
         6czw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qGOxMm1K5WN+JT4uUn9nzJwvV/NU3i9BH4DGHjnCuXY=;
        fh=PPUUIOgv4XYTaECoglgoWqUMvBfSnD0JZlHHHz0/Etk=;
        b=Ca6Y1ZDEqplnzSFG+Kt4ce4xA6iN2oKxOYP07sAxXmdYT/NJph/tLr2jC0pgTlqZT2
         lgXTmgGJw8FsOfwbf+Zpw4E/EfDrgS1HqDMtvYD0fkk2YT2rZrMfm84xZKEQae2HWD6P
         hAjP36O09lMFy68qp8z8onWaXHq6lNMgfnxy4HNxqy0vXSp+EHUZIIL8ZBxITzUtT3qp
         yEr+nD3LWL0DxLPmM8IDT5uHLonUiybJX4QOh55+dYRp9kLWLKL3Y9HF8yllNfkkXr6L
         sUcFWevsMrcs8hqyiqAM2RVTuFlRkZC1YNBUocO0Xysoj95xIRBwljj8mcsfPeiZ8IJv
         +twQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769626171; x=1770230971; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGOxMm1K5WN+JT4uUn9nzJwvV/NU3i9BH4DGHjnCuXY=;
        b=Uq+kF3P4Hhjs0skfZquokwURMSPKu7bIyMjpJPuW1ujjoGRcixayS6D1iM0JWmp7yU
         gtjUl+y3QeS/WVuLlNfm0lj7x7yzbgpYXNMdzQDo2oRkNe4ZsLV8l2Aj6yWu52CsosQs
         hh80G7mx3ZoKGpk3qu/RETptHnG6ZELgCh+aJyhr39sucxsslMshBf4b7uAvk9auRLXL
         LzqOys94F4FFWW9efONA4xzbyFFW7McDborgxZ3nS0Mz2/0bb329YxzGjOsD/EuQktLv
         HlG5mOzwOruUddl9ummFsFiPWd4jL2ky5F8fNkmqZo3xEVwmtVCvV9/bTTpi6fbHZgX6
         PAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769626171; x=1770230971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGOxMm1K5WN+JT4uUn9nzJwvV/NU3i9BH4DGHjnCuXY=;
        b=uUz1gxlYS41URXHZAB3wTDlGEJUuVcXw9ycu78mngp1nPDCGTUrRmQab/qV5h86qKP
         9cEIIj+pliXMn+A8j01U6xIPskm/RGp81Njhsl7TngLZzrjEDAW9dE3VALPn87oaflXq
         Mu9WB69BRaN2wqbsH9YiZd0d4uVM0egQ3XsQpLx8+kSnopCwTfvdI2gIxZrLHnMKWUTW
         LHY42rTCIsHigFZteOiPPCJrBb5vYh1mwQazIKFgMWcr/ucSWrKhn5enxtmCL4wkYyxD
         qiuiQvTN18UAqHQiqUtzpuv1lpH91t1/pwcV8qAv/9/ajp0SnFrcKAURgFaZjIbn1l41
         H4zA==
X-Forwarded-Encrypted: i=1; AJvYcCXWsofquxz3y6nd7AelP+c90JShTq1cj/BLG21rTFzcNZFOFavLjE0mJ+5ycKw6tCNR0GEA7sPSjS+ThYvqoznb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi/L3dsUS7qGBJfWbuWcMkdqzjACspoJPRt5C3ubR/qpnADcTN
	W10s1FzW9VikX7z032T3nF5JGkukGhu26Evp+s+mGOxxwM6KiyVOf+xfuLHI9A4bV23e+e6udzt
	i91QswsHOMuvBkktW9zij/PLpfDeJYGI=
X-Gm-Gg: AZuq6aLFChR66hdKPB9Ye6klbal6zRaUt10IEtSRCBnKFV9xSfjk0FP8t7N0BvbIOMr
	uDkY2nnlhtOpJvGW3bhlwzd6cvOaZapZPmYOJiTu/h2DwxSIxQs73s8i5LuZX/LMLw9s1ieR6Wd
	5kq6bLjdOG+hecgtSM/vBNz7c/7lnMClXr5UmHApNaTGNwK+jmxKRIA5SfMRwU3ed/RIwY3BhCd
	Mmyl3SA/F5j7kIJ33t/hp4ejV3FU3dRBbAO83yxRNv/07szpShQX1fwEGNoUHm/58HjZsDHi6eW
	2mSeF8xCkqdnmpm4W+Tkvc2EWdDUD2WU8PfGnmOCcXdhxPL3YfioIY4EFfN7nYNk67wcP5zPCFD
	4qXBSaXq7T95ulg==
X-Received: by 2002:a05:600c:4f82:b0:480:4d39:84b3 with SMTP id
 5b1f17b1804b1-48069bfabe7mr87977985e9.6.1769626170838; Wed, 28 Jan 2026
 10:49:30 -0800 (PST)
MIME-Version: 1.0
References: <20260128150112.8873-2-leon.hwang@linux.dev> <e64c4137e7f262e6fdab272e8ee44c8a129a36eb6d0186914375d6ba20d88474@mail.kernel.org>
 <65231eeb-1f00-4af2-9234-a290ea3f6585@meta.com> <a10afa70-29b7-48ab-b241-8b0f602abe2f@linux.dev>
In-Reply-To: <a10afa70-29b7-48ab-b241-8b0f602abe2f@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 28 Jan 2026 10:49:19 -0800
X-Gm-Features: AZwV_Qikusk2Q6YhJBvTgmuieIgLLJz7FiVhBc9lpkAd7bZar_-wkLjd4ZlAf6c
Message-ID: <CAADnVQJV=e2VgQzkpsUQwexhaVZMs7uXHCe1Fa6VwbVNUMPghA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Add bpf_arch_supports_fsession()
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Chris Mason <clm@meta.com>, bot+bpf-ci@kernel.org, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Menglong Dong <menglong8.dong@gmail.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com, 
	Martin KaFai Lau <martin.lau@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_104933_464391_71F44205 
X-CRM114-Status: GOOD (  18.42  )
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

On Wed, Jan 28, 2026 at 9:34=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> On 1/28/26 7:35 AM, Chris Mason wrote:
> >
> >
> > On 1/28/26 10:26 AM, bot+bpf-ci@kernel.org wrote:
> >>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.=
c
> >>> index 5a075e06cf..070ba80e39 100644
> >>> --- a/arch/x86/net/bpf_jit_comp.c
> >>> +++ b/arch/x86/net/bpf_jit_comp.c
> >>> @@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
> >>>  {
> >>>     return true;
> >>>  }
> >>> +
> >>> +bool bpf_jit_supports_fsession(void)
> >>        ^^^^^^^^^^^^^^^^^^^^^^^^^^
> >> This is the actual function name in the code.
> >
> > Ihor, I think the script parsing review-inline.txt chopped off the
> > part of the review where AI was complaining about the commit message?
>
> This is the email body pre-processing in KPD, yes.
>
> At some point we decided to remove the commit message before sending
> an email, but now that AI reviews the messages too, I think we should
> just send the generated review-inline.txt as is.
>
> Alexei, wdyt?

I think KPD is only supposed to trim the header until 'diff ..' line.
In this case there is no 'diff', so I'm not sure why it trimmed so much.

commit sha...
Author: ...

are useless in email reply, so we should still trim them.

