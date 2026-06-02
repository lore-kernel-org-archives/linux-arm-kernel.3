Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A62C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 05:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUr/bDGg9l6+S25kggcGIvYETcmzBiihCI+mnqh90MM=; b=Hebn/Wh8oeFL2UOhuXQ3OlV5hs
	dLnlw1y5unEiQE4ZfQ5AHKhepDNjsPeg/li0mtEYgflvquF+fN3MSoxMfX3nVVlUC6CH3XBB55qbm
	cPmnNaVRXpiBdf/qblNYGR6q6qDq/dO7sZodamjwciS0NsZy6o+JbjQN7kP/4dZ+4h+r+IEkzsOZf
	H75upU5wOyCRfr7Mya06FE8xYH9xroL/S1zgUuy8l5EPJjY6QgX/z3aFJ4yxEhCc8n4HMRKTxRqfk
	URTBVmGr0E7taJlq/JnDdMVKZk9X2FZ4LIEAbkWnms0cgVqHRkYm0M3CSyugJfvAGLpswzOsVXpAd
	Yb8B1frQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUHdV-0000000CKCA-31sg;
	Tue, 02 Jun 2026 05:25:57 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUHdT-0000000CKBk-0Tev
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 05:25:56 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-50e61648f10so331cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 22:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780377954; cv=none;
        d=google.com; s=arc-20240605;
        b=dYcLcSqWh0ID73Ad46zWS0QF49TRWTBrHKxniHoPV4/x1RkohYDpa1AJapnpoTZ783
         OVu8QEfaoOm1XaDZhxACfBLPVsk1e1wZWoVhqidYSlMK4TzVEHdM+qw8AXeVZd73euMG
         Cz0wMpa1APzfZBVz2pwjlVL+BXRGODaVLieAw4mGNXPSuANp1GInChdYZs9D0pbXJALe
         mH4zqjL7z+t5RPPBIU2aR7cSMsgzWwR//FZXrcn1XOFjlPGRRpsyQ7GpNwcFhBKrcDGZ
         aJ88Y+ppBgCsh0frBP9/hgAQmBPhIlP14IgKbK8C2i8iMKwZWQSUQ/2ssR5Y8N4/mIk9
         xmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dUr/bDGg9l6+S25kggcGIvYETcmzBiihCI+mnqh90MM=;
        fh=JrUUeFhxL7WufgAc1vyD+4WUoZN3NagBF60h78sWvak=;
        b=lF/pIH9niPC74D9oV60buAQikJNZtgjt8EhLSvC7QO4akNjI31RaoBy8YVRm3DxsV/
         EX2LOIb65/mXMWiIwaP48PudQL5VOe2d/JR3nmN1LhMvGFS3r4xgdfJdiwLqXfLFDpQl
         BRHV7VY4CjtPs1JgLs7/YRtHwcHgUrmPDbLGcYnbCpTQa8AT91lnRBzmf0ugrPRcKkcP
         91YyBS4u4vKmJK0EIksUxPgXrltsTw8NCUIQCCH7qyhvkMx+lspdSrehIEzyoMjyWINh
         P6rdA2nr8RokfiDFzFzAVUfTvUOr93mYrtY9+mmho9NgULmlTWYkkrV+wxPn8IRT6l+q
         1aFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780377954; x=1780982754; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUr/bDGg9l6+S25kggcGIvYETcmzBiihCI+mnqh90MM=;
        b=NyRESQDh/g68FYXND/ZPip/x1fpTz8CTSUNnTLodWD2xD2ZO+3CJOy3Cly0vpRF11l
         ss/CMkn+s0MoZe698d/j2nmHXXyjCzpnao0dQyD2OlqimaD90FqbT347zA1bcjLv7Wn3
         dEPdk/ILenQrtFc70nRCOK5nZKb+3f/hOzto34FDEoJBz0PiX0W18cZ4VftuafgUk+XK
         +WyYG4pyr/+ztyDMVBu0QZ7/ZKrQUjZSSMvp0EouohS5MZkBAxPjxVOvwMxBlx2xQ9JT
         akJIdWOwMzUKpvjm+uwr6Oog+3XI6GXWE0WA20G2cdEgIktubA+fDD5a1LVhFrnOemQ8
         c8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780377954; x=1780982754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dUr/bDGg9l6+S25kggcGIvYETcmzBiihCI+mnqh90MM=;
        b=OsXoRCT+8DZU10i80pMkxpyrtziVL2GKpr8kXlpVKytkZKrv7xoX/ltKDaPubpfzQY
         VgS1OGQl11ibExiaYl/ZqPWB29izMwsDNqyZFcnubwnUpJANRyzunN0fOj5JAFPDeeB7
         2g68Crj9vGFiAjFVkh/2UHC2YblFUKjS7YbULqv9n1qlZq6OHvjXl0j+FyM0K92xYj5g
         Y3uPKrrCmME7cPNqRF6H3T2uc0LOn3B4eJrcMmSkfJfcDxZ/h1rDlwvKmqwxxDBTCZRv
         MfOQJDWKnde104juFw+qZFa3iTkZd22iSDpnwYLdErpxwF+8+HPhN7EXO7RCC8xLSKs0
         tOxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9N8eUhTc3xUJ+l17O+RTlQUMGKyr4Xlrc4Ma+yFj4HeCX6A9+riwM+sYuDlQtQ2iqAuaZEyajRLwdjWh8DLe+6@lists.infradead.org
X-Gm-Message-State: AOJu0YwqGgqe0XMVZrj1hoZRhMnqmQrI9yTIBOgGhBN07RmNUtjXX1RI
	ruI/85Q0TrIR78wgspVbamqyyi47fBIbXeV5dNtb+/objgcP7J8/c6zjja5UuboVDzUXqtPmEt7
	r90AEf6ljWpMFmnr4pOOw3lsG95mJUHwxTz3oNZXY
X-Gm-Gg: Acq92OF0cqtX29CjuahAfIL11D72UY+3mEcRNX+sbz0fOnvn6Zl3kJOTBQk2Esfibz3
	DXyYOsbf/Q41hh7MB8tTeA7QO7G7EWOxYJOR8/F0gecWihILhfPYIzQ8ixWyKl18xq6irMRO4+p
	Rjn/jQ4ybW+2rTD2c7CPkMYqxqF5CbNxGsZNOtaAiXU8IwgiReh1sFA5pRt2lRlKYSDGS/qMCvC
	0ksccGlGsiLBJv2YJUtIRKNU8UZ6AKZgEy71Mb6L4W6k6/TRqR38F3k4ZW2gLkg+ifzY6E69mZ8
	cBdcYOW+NOyUGmA=
X-Received: by 2002:ac8:44ca:0:b0:517:5ec3:b59c with SMTP id
 d75a77b69052e-51766ef52aamr6504621cf.2.1780377953476; Mon, 01 Jun 2026
 22:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-10-praan@google.com>
In-Reply-To: <20260601215909.3958732-10-praan@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Mon, 1 Jun 2026 22:25:41 -0700
X-Gm-Features: AVHnY4IfYeAAnGDfZFtab7X_lZydVua3zMR87OUc2sWsRLSKLKQf56joUBM3Me0
Message-ID: <CAE2F3rAYWMq6DO5k20e4iMtPbh_X9JeiU8kUfw8nsS5xs42F_Q@mail.gmail.com>
Subject: Re: [PATCH v8 09/12] iommu/arm-smmu-v3: Implement pm_runtime & system
 sleep ops
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_222555_204941_9486B6AC 
X-CRM114-Status: GOOD (  11.41  )
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

> +       /* Drain the CMDQs */
> +       ret =3D arm_smmu_drain_queues(smmu);
> +       if (ret)
> +               dev_warn(smmu->dev, "failed to drain queues, forcing susp=
end\n");

Can arm_smmu_drain_queues() be called after cmdq->lock is 0? I think
that way we can be sure that no other thread updates smmu->cmdq.q.cons

> +
> +       /* Wait for cmdq->lock =3D=3D 0 to ensure last CMDQ_CONS_REG is w=
ritten */
> +       timeout =3D ARM_SMMU_SUSPEND_TIMEOUT_US;
> +       while (atomic_read(&cmdq->lock) !=3D 0 && --timeout)
> +               udelay(1);
> +
> +       /* Timing out here implies misconfigured Runtime PM or broken dev=
links */
> +       if (!timeout)
> +               dev_err(smmu->dev, "cmdq lock !=3D 0, forcing suspend. Po=
lling CPUs may fault.\n");

