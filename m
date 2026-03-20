Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C021088E6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjWzodMHHiPQ8qpM8gCAfjVpQOUkrpvH4qFscxhdfJE=; b=AiC99+EDTDDCqyW7svb97VDRiC
	enWltKAI+5W5hvQW1oXPg4u2AyHx7mscDbh7S9OzmgJ1OqBbNqfYfCG8CD5CmuV3YN3MssQT8CR6D
	eccrStWu+Dj/+laRUDHnDgEf+NULWwL7Ub3u2DkBk+qsarMwsLKghyuAeWKP6RC0a16lL1f7GV3B8
	vAeRZUz/6jCf0KkD5MNkT1qjOC3UjVxE6owxQYEgJluaZM1b0inzgxRCNF89hMizrPN6UtZZNbOb7
	qXG79/u9oFf+sf9wXATYXYXrWdMJlNUeQkpPpjx0HAlEGUPBOoMzag6UtjYK8dCg3xguqKabGOEQR
	AtZfFGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3W6z-0000000CTPD-2yKp;
	Fri, 20 Mar 2026 09:25:45 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3W6x-0000000CTNI-0UyF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:25:44 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-78fc4425b6bso18208557b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773998741; cv=none;
        d=google.com; s=arc-20240605;
        b=doKOhZo/xjMGGspOCUSEzDkb5LSs58+dEz8brpqXSXNXbAlmvw3ZMW08J9bo5x2mJ7
         3bVIg97bJ4dyzplzle9mgksEY/+PmwW5mv7vt6/tCdVoFEdA3f37v58v1VrWhWhUtYmS
         pyVbdWKESaewnqizkWGanCDtgy2oWBOWSgKstLWBiljNY3SqlRfbMAIk3BRKoWvtFzEb
         uPBcsRZxNDCbQC2mDJIigVgukjE+MD+JcJq57A/UIaiNVy38fa4gM77XD489iRON0iDF
         /MgLKBnU9aRNDTJ3FFVaAQ64kWk7CP8xWD3at2QKebZRtioebhAvA9uYfQ5AVnNvjVTy
         T1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UjWzodMHHiPQ8qpM8gCAfjVpQOUkrpvH4qFscxhdfJE=;
        fh=vUgUAWJnYUFstlSoD0qJe+GjxFWQJe1/7bjxoR3PmLU=;
        b=Laq/V9js5Lt88BwFFG997huU2dww8DcwU5fnQAYcizjUeA9zYBFpU+QX6v9NJwh3OG
         vIvI91upX4Tgca6HN+IMTS7KY7eGZqrrVv6HRVHHotfpfdxCeyB7zpGBf5wzf2BtdZjL
         1/kaK113ZbR8TSkkwWJAGAK5O7Zg+uBx42znGUlI+NMBupb1XIfUlBQsRG26wEqGYt0L
         5xwJtg74pppl9LO9bSN+rJf0O57VPUwzaPGMeP6sn42N6n/ifaIa4tjAvvKlGRH92jMN
         L/I6EcIPDvM+E5bnLVu4bNRsFUiLZ26KsBF1tjuVtrGTlh58A09Y3bjt40V7dDKFwoTM
         52WQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773998741; x=1774603541; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjWzodMHHiPQ8qpM8gCAfjVpQOUkrpvH4qFscxhdfJE=;
        b=JBugrMbg+mDygVZAXskJeFXIfiSHNemlYLdLf4cpjPZJxT3Tz6kiRXToDGTdl+jTkv
         dhN1ZnrwsYBJOXfbOlaRYU0aYua98jJcrw67GIPIabWO3LBUbNVqxvip9EKBlP/0RtPH
         86D38LABLTbDBxjzZbO3WvG7ZT7wTUyrh/O0BM8J/yjJuJcfp2CNyOXL7FnWq0EsAUUC
         EYCMVrTn1J5Pl+9Ve2MYM9bW/wghAdesgMKLT4D2oo6ps9NBxn3fPEHwkNgH8fODewnU
         LFwmFTNzqNWr+TFNWLtQ7XHEF40VF+KGXJqz89nZ6i8WqgqFwj2wmAvyh8fYLHet3TaM
         HQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773998741; x=1774603541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjWzodMHHiPQ8qpM8gCAfjVpQOUkrpvH4qFscxhdfJE=;
        b=EdFfmVgG+h2Moh5qwKHjKDR96ManShFFKdfeb1Pkcmd3e9rmcihzgU4u6nGWGgahOI
         DuxZGXhdkoCf7rSv6DTGuclLMQuLL7rSubJ3CcV5ODRI79mcEOIV0/Cmj5uQJ5tYENQw
         3jx3zehT5myeyjhwS3QNszXpmw2cBQ1BxuxR1V+Nyrv8bEBV2Loc2KJle9WNDY8/cdJV
         D4EtH7VXnseEtHXyY9oNeK2GsGuh9eRDDlpH3l6pnC6863UgNambvLS7moQK0MozHgvD
         d41y1JxKy9zYL9SHEUjzUq2YYV9h15l+rpJdQ0XW1CjalMU5y96UVgZJYUyHiWeP5bnA
         eVGA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ71zlG+n3zvGuKf1G4xzuVEXaurQErQrCr1WcucVq3fEJgQqBOH7x7AZ4KL2fAUALyo+ahF1fzZ+hFPQio0le@lists.infradead.org
X-Gm-Message-State: AOJu0YzV20DlMGefwoqmGVIqTFGFUB6RERBwNQ0QBVhzmtRG9YTErM2V
	eMHuRruVysLWZapAuu4wJ+pp6qtXBC8DPelzqm9dvy0wlZJYQJ5IDkGAbCs1mlgCqEu9tYNqScU
	xK76wZVPnYw8FAnj022q7VxeUIN8eu0M=
X-Gm-Gg: ATEYQzxUPUKtvLf+LzP0QfKoMo/o0gC/LGKFxDxcli34KdsMb4lqAUL9ZI78zw7tPAy
	/fSIxDYe2W48B1/JMWLWuzcxDC6Vd1j1niRaLX93L3P1Fhlu/x89a82p7RYyQjbpBFHuHdjd4Yw
	mRmfYFTsdrT3ImRcICztW2HAJdYwOUB/VmjA6dJYQFZgqUKS87BNFnTU9LGcow8W0mdeF5GgObH
	tgLHzOSmD/r0VWZJbkxRQ5JLoKBb3OKfmV4bj2QcNrdJFKn2yih8oHSmQZMRDb2PS1nNVkeRTkN
	ZzqzZlpWk3HtQleW
X-Received: by 2002:a05:690c:3181:b0:798:7498:4ae4 with SMTP id
 00721157ae682-79a90c21cd0mr21006217b3.53.1773998741596; Fri, 20 Mar 2026
 02:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260319032649.337812-1-dqfext@gmail.com> <20260320091910.GA2048760@horms.kernel.org>
In-Reply-To: <20260320091910.GA2048760@horms.kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 20 Mar 2026 17:25:29 +0800
X-Gm-Features: AaiRm51UgkKJTce5m7yOHpFLNBuXksPYXf9B03a4b3Hvrvl-JqUwcOrWd9BIh_4
Message-ID: <CALW65jb_4WjSGZyp7ruX1b=DvpkL6HyeNfvAyuBzNYizQaHJdg@mail.gmail.com>
Subject: Re: [PATCH net] net: airoha: add RCU lock around dev_fill_forward_path
To: Simon Horman <horms@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pablo Neira Ayuso <pablo@netfilter.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_022543_161033_3F0AC7C8 
X-CRM114-Status: GOOD (  10.93  )
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

On Fri, Mar 20, 2026 at 5:19=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
> I understand from the patch description that the problem didn't manifest
> until this merge commit. But nonetheless I don't think using
> a merge commit in the Fixes tag is the best approach. For one thing,
> it seems somewhat difficult to use effectively to guide backporting.
>
> I would suggest using the flowtable commit as the fixes tag:
>
> Fixes: a8bdd935d1dd ("net: airoha: Add wlan flowtable TX offload")
>
> Or perhaps fixes tags for both a8bdd935d1dd and 0417adf367a0.
>
> Flagged by AI generated code review, which also suggested citing a8bdd935=
d1dd.

Okay, I'll update the tag in v2.

