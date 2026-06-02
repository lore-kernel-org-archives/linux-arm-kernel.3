Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EE5C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 05:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cw9pwdfqXs7Uf8CkrG+qExWtYc7my1Wo0i0PCQb18Vc=; b=w7JhiunmnkMUz+gNc9lXFOGSDV
	p3dUR3yr9oAQFgxnAypIwavMEmVoIDQJt4IeuX2h6QmtrUxD6pNTvqVYwk5mAlnbnBwOWSCyVH7IV
	XIbyj430xXDD27C8Ci/X4vhslha+6D3Nihp/JbqI8M5mR1jaTRFqQi7OlVTjY70BNfaVe7ANkJ1v4
	EBlVe/dS3dwtc+IRJAcwvrRMjQHtgYGWma4MkuEYXcgz02RO/97EOVgXpp7k35pO4r2HLePwkIUVI
	Elpp1a/I1o6ylFLjDbb74jtd0aCH7YqBgMIOlNRwy1xomA4xX3vgj8UgDkXP1gN8OhiOXHIq+bz1B
	KhNN5Jsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUHZi-0000000CK06-1GzM;
	Tue, 02 Jun 2026 05:22:02 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUHZf-0000000CJzg-1Shd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 05:22:00 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-51765331535so6911cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 22:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780377717; cv=none;
        d=google.com; s=arc-20240605;
        b=TrriKkus2QWuuTC5EpUR9kni2X4qUZ9olwKpKxLF5rGDmys/5yJSBWsIcUiPy4nsY6
         8eK7MRrIFPkEL/dT38jX/5qe3IuDyjzw4d7//PsVFB1f6yxf8pbRaFk7BgWF6NW4Rf3J
         8vu09WQbbrwv+pne1VSe4ZWta2Dn/qbArng7pn7h8tabBJf1vG0LJ6dLdfYBUXspf9vC
         wcE+aPHb19jfGYOuEg+HqbvfyywgYB7WmVNlvfgLMJSuRoyQrLPzXjhRm2PBdrRmA7vE
         OVEFp6HhWhi0x2qRclOKkOo35vWzzio2WoRO5DHt2lcTSWMFGI3Vzz0e0lau5e5oB9h3
         CG6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cw9pwdfqXs7Uf8CkrG+qExWtYc7my1Wo0i0PCQb18Vc=;
        fh=8gDYvmT3fO1n5vPA9qEUs+jNZfXr/y2ELP4+FK/lseI=;
        b=UGoB7cdxfIf84mtpUm8BV1xEOmg8otGYorJF3A2MM+PJEDlnaGWJo6RbCzWvdO4kQj
         pb67mcYnxgAEucSOYeGkEFYkHNx8o8NkQX6LQzVg6TkjlPGxTu1p3SpoPLyZmr/Z8rVW
         ko6nk3txpehR5erF4Fup3MxrNohtCVm6ac8aY6csSmkPQozzN/uFo9xaObm92GJX1MM2
         lCE5OfKleqvSLd+MrSmskhW2TQ0ccJyQ79OzgLGfajEqISxlU/WUaUeOWbaKP1djXBV4
         hLQ3N0e56rE7OllmpcvcLQROU2M8dzHgFwGEtJTMD7WkOGj0zWBG+d88D1Nb+M2g3s/0
         4abQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780377717; x=1780982517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw9pwdfqXs7Uf8CkrG+qExWtYc7my1Wo0i0PCQb18Vc=;
        b=lDIFtNDbYYbplpUQQMlgEZaxg10bAzPRuZyjGocMn5piZcyPpzoD8990bg/ifaNU3J
         DtFaqiJSOm4/bUYcu4NZou4QwxdLv9lr1ggEJWe6sF4KNeNPvMLpNyHRfjxhhfLItSfI
         3gUebvkp/A25evtXO/djiLQQ/PnWyJzTwAacCz31kp3VfAhffXKHPW1wO6fgWhladR5V
         7ZbuFmSbE9bZ8D7wyQ3OvE00KrXg1yz1DSFCJVPo+IBUKbzQKewA93k339a9o7dbuSAH
         aDJlc+xPKXm+TCJJEQ3981/ewsNNBA+0ZZ/IOSBjRwnueK1iJQItZpYGr71zdTXbNOZJ
         Aw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780377717; x=1780982517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cw9pwdfqXs7Uf8CkrG+qExWtYc7my1Wo0i0PCQb18Vc=;
        b=DZ9aGbwe7DTsRzL8yrsh2NQ9u8vhRfJHKiYK8XNyyMMHFIx95/TYFUXZS3LlhKqFYs
         WxxWag9uvaaZBY153/aeBCfPGakp2Au2GNuDujw2XvVFuyFJ06pioqbcI+lM1rnBQW6y
         KPxofhaDcte+n5A14QmDTgzTAJqRvUIVq52QtJQ+bELCAi3DawEo7REvQCONNLfSbLzw
         Q/ty5pyEoVepiEOX/m4+ax0S6FVJX2HLcu87KREvzRqNtTIZUOv89e6yAAxKeqqvB2i7
         zP8cHv4A2cP0MCTrbrBxe01nyoClzaDi644gYVqyll7GzLPBuYeU7mHlDaYQlfR9Ei+q
         Lorw==
X-Forwarded-Encrypted: i=1; AFNElJ+kVP4j3/JCUvsRM2M+BSAQCF1Dum9tkbI4P1EC5Kv9VTEP7lbcNqCczWo2pDe2/HBFO3kXH9wqta2JQ4TmduP8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1H301qYZN846E+4vXgUI5TGblDo7BCazur0fWDCHtsIx6GCTr
	kemms5PYD9oWMqA3u3rNQKnsguiRFfN3oZp8kr1Ag7MSZ0Z4IsP4s/cFN9gD6FIklziJRcbzqR9
	F6QaTBhaMWhxlr4/pRm/PZ0Qo2lNUDlMEY9zfZlw8
X-Gm-Gg: Acq92OF2hDoEyyT+1PJef7e0refihuw/LOFHxyVBGurwSJlYQRfL2nJRU+EO0CAydtw
	OKKAItbrU8EWoOVblP75JSdFnbDsK+V67Q/6LHNmRcfI4I9yU736uwkCWqGz2/+lUGvtmx7x1xA
	RVUc+dO1yf91jK1lCs7F1SUKwwkAx17tUBB7c+fwfPvtw56Rr9LJOzYaP577CFZx9jBPcg2AL4/
	N3SMT0HYn/JDscz0nz+3l08FOFzsOaeSZssEOCSiKpmeEWdS17l6200e6Q9ZrlhS2JK2xe/A/hU
	SOpRoJv+mU9kbpU=
X-Received: by 2002:ac8:6a09:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-51768e2b6acmr4774221cf.1.1780377716459; Mon, 01 Jun 2026
 22:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-3-praan@google.com>
In-Reply-To: <20260601215909.3958732-3-praan@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Mon, 1 Jun 2026 22:21:45 -0700
X-Gm-Features: AVHnY4I8YiX2irsMsb5ee3Kt3CCMgiXw2RB4C0Da9k4MnZupiKHlGq0wTuwc3Dg
Message-ID: <CAE2F3rDmhUcL7N+aAeK3P1uYHxuRVQidGH-o6_iz8Z9UE3zMbw@mail.gmail.com>
Subject: Re: [PATCH v8 02/12] iommu/arm-smmu-v3: Add a helper to drain cmd queues
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_222159_456120_51EAFFB0 
X-CRM114-Status: GOOD (  13.42  )
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

On Mon, Jun 1, 2026 at 2:59=E2=80=AFPM Pranjal Shrivastava <praan@google.co=
m> wrote:
> +static int arm_smmu_drain_queues(struct arm_smmu_device *smmu)
> +{
> +       int ret;
> +
> +       /*
> +        * Since this is only called from the suspend callback where
> +        * exclusive access is ensured as CMDQ_PROD_STOP_FLAG blocks new
> +        * command submissions to the cmdq, we can skip the cmdq locking.
> +        */

From what I understand, the purpose of this lock is to ensure that
only one thread updates smmu->cmdq.q.cons. The flag
CMDQ_PROD_STOP_FLAG might block new threads from submitting commands
to the command queue. However, other threads might have already passed
that point and are about to update smmu->cmdq.q.cons. Hence, this
assumption might not be safe.

> +       ret =3D arm_smmu_queue_poll_until_empty(smmu, &smmu->cmdq.q);
> +
> +       return ret;
> +}

