Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50C3C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CiRRBGhgo+/JNW8LKBdu7urL+eWjfJ9C8Tc+eH+pijs=; b=YCaLOfLqpqifWi8bkjVlKAhPxC
	5rG2gbGki3eYoya/tTXCVlLuAWUefXkQqw9Q4sX3jY/4rhXvQGfmNfPI8ApnCjPtOa+YLlklNk79x
	NwstUjByTitNT6t78Rcq1cOPa8OYy5NdGHENublMnfoGOju3G9kCg1AgPVmShoLdAs+v7HPEDCMZb
	RHx0H/64oGAiHF7hf8Efna5CMX9mqFZOcK7968+i4lXuIWTn0eg++M0EaEpQBv4G0hDnrMGbH9REU
	ZC+4T/ap1gIDoXf7zTYVqNFeVzHcrbxylTxq0q4DFrlKKq6D+3PEM3Gm9WnA/PaElKsnQ0T5M3Iqn
	ZdJqo38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsKD-0000000EDJi-0VAj;
	Thu, 23 Jul 2026 12:14:53 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsKA-0000000EDIw-24di
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:14:52 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51c01c79467so242151cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 05:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784808889; cv=none;
        d=google.com; s=arc-20260327;
        b=QVINgh10arqE0PtwT61MToRoZZFN80rtIw8mBTYMMvZgvcdKzG2e9E1ZT6T0HKoXLC
         rWyH5563t0deP358BDxDYb7UnXPtheVVDvGfqRq0fWT+3j/gPXDnfBZJ/RR0mRp167Ht
         6nC3zHNtYq/DQFTHDnz6k+wAz6aXi30J5yyzcZB8IamkoMzrPYmePShwG0W21y2uiVvh
         npLvf9UGoHzhoDD9AfwS2Nd0yFxrgM2yMOG7Fob0NpOVzIR66RUNsN+7/F3a42bJ4o+J
         Mv1a4mnOCSROyVpJvs51nHa3bCWsHvFcwoMxdTcaNnXPyCQg3Nb6qLBmbedz2zU/rLxr
         O7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CiRRBGhgo+/JNW8LKBdu7urL+eWjfJ9C8Tc+eH+pijs=;
        fh=7fJ00OUtXpr6ZcciLmQJefD7tnV/OlhGJtfrsd6fgdI=;
        b=bkNeDqhjlcrvrAyMi4e8aPIAkfp1DaRVJ+d2kjzc48FIZU5F4Ve1k5aAcWxsobQhIz
         2Gf6gH4b7sOr9MEgGdJ6Cjj0xMgE6+11p+U32H4nTRQqVxIIyCJOpDUfsFdAObMwtOF2
         SpgOk7FW1xaiRHHr6Srvsf5S7kklcQERq7gJ9avT6QajsZWOqMUVi5vadDKOS6sSzpLf
         ftTP4jzkiqk5v3A7xfVtRZpNw8qiiqPWCmM39OwO980aGePxSqUlsfrJ4Cr6MoLiSeOj
         DcfbeaM8Q/iy0Cc93hNv1BR9/wa9dJYkgwEdzv1UBIoNSuZ+oBSi60TjJ0K8zf0ewEnD
         H3Jw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784808889; x=1785413689; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CiRRBGhgo+/JNW8LKBdu7urL+eWjfJ9C8Tc+eH+pijs=;
        b=DQwJBwkfGEUo6B78a0yE4VBbigzeHeD2KNauMbiCV33a76lGmdc55TcSnys/fiJj0G
         aEtvoqxqUiq0opOSHuTD5xYvvOkaPZ8h6W7azEHmvpVDZBj3T5reW/sFQHK50/V3Bn/s
         qPwwo24cHN7TmYt76PtHt7n/fwq933Pe+KrygmSGHRm1fZORsMnnz5P1nzd6Lkpg00Jv
         w6ut40PfeVhJ4xgA0h8YwM2hX59A9QglpLHLObkZy4LXX5EHtB77x8FxYnA7utHmgi/h
         EZw0dhHnw+fErrwE3nFoZjQmD+yGibkLQItq6S51ZJS8Z3ogsw6VIdtoK6NRp1xvFvxc
         Dspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808889; x=1785413689;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CiRRBGhgo+/JNW8LKBdu7urL+eWjfJ9C8Tc+eH+pijs=;
        b=G873ReBrDIM5tCDo0Td3ff7c5P8gX3CYhnAlAfy0cijQTTH3PfZMojGDJnNaUmdBIl
         kHYdE2qZ2tCQjGZz/ESM1WtjVRxy3w6yWoNt5qZ5eUJR0a6fJLhBssyk9jcopCnsM/xc
         IHTGQex2kMDpefmy9RLUqGq970NLxeaSlvHZ4+v1OxcBr6nXcyCgGaS5h2TvpGj2Ohh3
         GJa6SmRwNUZo+fdcfCVAmFykPFAt2U2I5VAnRin2XUtHyNIrBtTaMhUZVSnh0bTwA4bF
         PhFYcaYk+OBaZnfXS4hgSi2Xsau4Xk+5yDfulnu0atWNOeTZJ+24ODvGNbNHgl6qVWnA
         GLsA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5SjXeTPdyt5qCqIBGV/1dl+Bt8Les8j5ryb8J1FCX3bXHpfeUu3fYIKvooGtFyhPClkJSx/incIswC4bMt18i@lists.infradead.org
X-Gm-Message-State: AOJu0YzSBmjoqY6EqmNnD/uVo2A55die0N1RVPV76O+efFgZxupGoeL5
	HQSQnX5y/lgKnqN8244V8GhJzhCnY9FTaozigWsUjBUQSV0Zqk/tULuf5FbiLRdvXDEKKsw6sEZ
	WHsp5n7s8j8nU2f0WYSeG5aJdXk59Yz++PLNMg/1u
X-Gm-Gg: AR+sD13QM892UWEXfI1jV1b96qCYLHSBqtJ7VwZm2U65GHx6Wh6Gmzc9Bn/+Isj7+US
	a00jx3wteF/J2iYihcwKZU8KkBTSPQ6iaxn4a6MMJxUwdEqyYRal5D212nnTUq7qfT5mA1GaUcd
	3hsG7n7VlHzNeKESY0lhMXWGMsVk2/7qlEvQ/KjOFNaqc/JIBSSs22aG7u8/8+7w7/8vPA7e0hC
	LN4VLsRVgReHeJuiUGtARnyncZWS66iuYZ9AYZGvlQI4UBLmgzWom9SWKbWmoyftdFvTA9Z
X-Received: by 2002:a05:622a:aa4d:20b0:517:38aa:c2b3 with SMTP id
 d75a77b69052e-5283bb02792mr9318891cf.14.1784808888595; Thu, 23 Jul 2026
 05:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com> <20260720171513.1415357-14-vdonnefort@google.com>
In-Reply-To: <20260720171513.1415357-14-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 23 Jul 2026 13:14:10 +0100
X-Gm-Features: AUfX_mw7x-tTweQMnMrY_kzHt22RrLf9Q-xFkE3Gv6ElRLMYqmF515Q8iWNUSK4
Message-ID: <CA+EHjTw7t6KHuQwktNN5_dJgZCxeWejcoQMz3pe6wUuS=R+QtQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/17] KVM: arm64: Alloc pkvm_hyp_vm using pKVM heap allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_051451_263522_8F026C46 
X-CRM114-Status: GOOD (  11.40  )
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

Hi Vincent,

On Mon, 20 Jul 2026 at 18:15, Vincent Donnefort <vdonnefort@google.com> wrote:
...

> +static void errno_to_smccc(int ret, struct kvm_cpu_context *host_ctxt)
> +{
> +       struct pkvm_hyp_req req = { .type = PKVM_HYP_NO_REQ };
> +
> +       switch (ret) {
> +       case -ENOMEM:
> +               req.type = PKVM_HYP_REQ_HYP_ALLOC;
> +               req.mem.nr_pages = hyp_alloc_topup_needed();
> +               break;
> +       }

Sashiko raised this in a different patch. This turns any -ENOMEM into
a top-up request, but hyp_allocator_map() also returns -ENOMEM from
the pkvm_map_private_va_range() failure path without setting
topup_needed, so nr_pages can be 0. The host then handles a 0-page
top-up and the while (!__ret) loop in pkvm_call_hyp_req() just
re-issues the same failing hypercall.

This might not be reachable today, but could you make it so that
errno_to_smccc() raises the request only when nr_pages is non-zero,
and let -ENOMEM propagate otherwise?

Cheers,
/fuad

