Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE1FEA71B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 05:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnhSCmbfUKtTBCG10CK6AP2glfPB9B2oYK5ulnOE0KU=; b=jzdqmUX42i0JvNEtzWT61LNRQf
	ok4VsdUPC/Hu1iYzbe4mDi46zGoPjPDOOri16S7VyA8FeXJNmNYNlT4WHxPVGhVjD7R4A7mPz5k8/
	fqiiKwD3uTupWsyvd/xZbAONy0ALxcMMDJH4HE04oueGk1JWMwZxF0mzD3UPBUpIvQ9GqFcsD3hU/
	BD+jiTTI5nnqgJgGnKbaqzhI33RhaBkn7tZJMTocIo0GASPezTool8AJyRLbMB4lXakCH7Y8D3XMJ
	RB+xktGQ5a3DTo/7Rw6GeGE2fNyCvBH4Bd/HrXPFYFdiK8OHrWZBWhRRDJQhjmtbegG8T9JN9Ic6L
	EGEYUc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEgof-00000006Qe9-2A67;
	Mon, 20 Apr 2026 05:05:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEgoc-00000006QdQ-3cYw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 05:05:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43fe8bda8e9so1156320f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 22:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776661497; cv=none;
        d=google.com; s=arc-20240605;
        b=afmzRxRBFVoMHbYbevkoXPLVvmPxlu3OFfc4h5Un80hzgL/R7AV/57hto9mvOyA5qu
         nOaC4MkL7E7iv2+4ccsxLKWmda97m1I12GppiIEwHjtTj30KAqRd2oQ3C1wQ5e5fHg7G
         qgDICump76MK1JzZwgXK5FbAVoEXRri5IwOscMUl1xvuwz1t7rpycJCd4e9p9Wx9r8mR
         FZ+ZDTvNOh80KZqIfk3gnyt5PiprxRuwB26K7/MEbPMckw+i/NmVf3BT5yaHrDk+bs8p
         je53Xz+UwMEOE9RUzKwsJFNpHotVhCq+vmL0JQJH7hwZPS3M0PIAF7BDim1NNDvTCU9h
         bPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jnhSCmbfUKtTBCG10CK6AP2glfPB9B2oYK5ulnOE0KU=;
        fh=9P4y/h0/151oApu9fRLcsC6Vl5Q6RfUw9u65xGgJg9Y=;
        b=N7mD+nO3fdU5h2nbv8LnNXo0j6QBqSAVT/Dedfwh7rdAsDpRpTRQTan5dJNDzyy8Re
         CCz7vr3Dls10CG5hmg8JRY03rN2RuMNmV4cUyaGO/ztHSXIdgUl353WJ66/oKE2fkDf1
         uzvlUK8DIo3/apz/V5Uh7HJDUtQlf6EzOUfj7fkbVQzoY098ql3AyeHC43kpRrhy7iyy
         yetjTACh8Q+ipTlAscDgpmDDg/T9XDgaJIH6zcEBe5kPhGlpzm4Q0yBBP6Hl1SjJHtDx
         TUnQTj7gk22VDJvlJWEtlo6kTL81S4D2N2KW1R5DztJL/wg1RV2uWKGokGmKB1DeU07f
         6JZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776661497; x=1777266297; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnhSCmbfUKtTBCG10CK6AP2glfPB9B2oYK5ulnOE0KU=;
        b=Ss/QwtRNsnQQ9aNy0XwZ0KszXyqKigjGDmsrguep/Pn5ClYce1Ar93h6KshXb8DIGF
         JPHEYW8IWAxb8Mlp1r+nWrKD7i/ODDOkpi3cIFzSWviBaNlRjQ6uOP8K0e5f1zeFInsQ
         5t2L6C5rWTt3f6wTwjBWhFzRGpvyyydNqhWNUMlrSuCOjEgXiA7n2EQtL/MTWj3P2IAA
         L09Q24JqGgjLpt3K+0UYfD0tsYxbRkZSHAqdolvUS/mMatUU1kSzXl23AiHCM2E+p2Vv
         90wyuKUNK+3BWdOuv26/+MyNNpCFvo0DDH5xCMLAGEYx0ms2x3pcs//WZ45d35IFTU8J
         vx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776661497; x=1777266297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jnhSCmbfUKtTBCG10CK6AP2glfPB9B2oYK5ulnOE0KU=;
        b=ovFs1rO5IsptupZOcNkzAcZtEZJQgt5w5CJ4Sq7T0p9mubGVre99QfNs0hB7CwkrZE
         jZB+qNSvJZrzN8mqpO/809caMv7O+3OlxD4ft1J62ArTBam++qg+uuFAcpTFgVKmMVPN
         w24s4N3ZJ7iFVtM3LAO7OEkBdHCDwNtHgi61dStaDBMOsuEqGnVJKoy6vqusBqe++1EF
         qaatbaMn4WLog6DAb6KqPWCPAYKkUt77s9wTN6V86uvjbNd7ZvWggreozFUO33ii16OM
         NjXernkGFF3J0Gq2FYq88bxJ3o7B/9COzb0o0/iiXOopzFrM7Iqm05MTmUjtQX37cdeX
         7Zdg==
X-Gm-Message-State: AOJu0YxQDSaElYi59hL8d+X8+Wq9xjbpcM10hF3rsrf8T8U1JOh/78qS
	4Ls4/Ry5ETVa1/JCYiXqXtn4ZjFpvcVa7UbBbMCq5+wr4btNdaQPFZHdjNhSRiRzH8LO9k76AQW
	mNgKPgitYFTBoE+wW+nMcJndSTO0BgRA=
X-Gm-Gg: AeBDietLrdRHvoVdnnN8DCsrf5eRK76m/jFwB8ll5BSEEqmrxJezJ/GXdiPsQHVCVoa
	XdAUBMI/G+H0VUNw5u0Lvc0FbD2LKCErRmAyw8FgNvkZOsv77uhr/ikNKqww2IqqWQJyQmf1TNu
	3byZS+ZEM/bXKGsuaksd6fpbJU5t69lsK2pMU+QotUaQzPZuwMUC12iHLbH4AHaD98zkgNSEoNO
	HlDwCblwE9MXwfGjdxKO+L2QPJEJAYjC94tNjewNo7TEdvSSUAVXfLbB2JZia4G0/38VCt8mgHj
	0qZI+YGU+TxECdHJlA==
X-Received: by 2002:a5d:4b81:0:b0:43f:e721:76ca with SMTP id
 ffacd0b85a97d-43fe7217864mr9514204f8f.45.1776661496515; Sun, 19 Apr 2026
 22:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <ac9Zd3K+PQTGBZAC@adminpc-PowerEdge-R7525>
In-Reply-To: <ac9Zd3K+PQTGBZAC@adminpc-PowerEdge-R7525>
From: Austin Kim <austindh.kim@gmail.com>
Date: Mon, 20 Apr 2026 14:04:42 +0900
X-Gm-Features: AQROBzCxgp-SAqlYUtDUNyejTxUw4XQ3zEuThJhtgDCwEBxIHfqU7zUntQOLZZk
Message-ID: <CADLLry4NTisZf+cJ6oSmFcRgEuyg5pO1qGchUPG2KBMq=ieMVg@mail.gmail.com>
Subject: Re: [PATCH] arm: kernel: add NULL pointer check in early_mem()
To: linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_220459_200937_03A887EE 
X-CRM114-Status: GOOD (  20.51  )
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

2026=EB=85=84 4=EC=9B=94 3=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 3:08, Au=
stin Kim <austindh.kim@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The 'early_mem' function handles memory-related boot parameters.
> If the parameter 'p' is passed as NULL, it could lead to an
> uninitialized or invalid memory access during parsing.
>
> This patch adds a NULL pointer check at the beginning of the
> function to return early if no argument is provided, ensuring
> system stability during the early boot process.
>
> Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> ---
>  arch/arm/kernel/setup.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index 0bfd66c7a..b718a7df3 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -830,6 +830,8 @@ static int __init early_mem(char *p)
>         u64 start;
>         char *endp;
>
> +       if (!p)
> +               return 1;

Hello, Maintainers

If you are available, would you please leave any comments over this patch?

BR,
Austin Kim

>         /*
>          * If the user specifies memory size, we
>          * blow away any automatically generated
> --
> 2.34.1
>

