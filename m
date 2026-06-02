Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1387CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoL22FIeKfAXh+SYG0vrRqgXDdNNko8Yfwwz9xbVvfg=; b=0e4rRorB6rRcxxFNGubOge2kpP
	p0gH2tIAFgFADAv+Mk7BH6DPwOtYNx70s0EKFkk/woY+XfQXOFtS5I/3gu5u6jIhXqPpX3L2ibScn
	EEnwRZOn5H+v7v4yJPk4VqY4aw+itjjmuEnDT9fXORzVm9XJX6ZP+gsWq+uCvpxZpmDh7823XS1rM
	+HS7iyg4m1/9QBf6+ooyAlHKCPjoGV0NOlZKXcd9YELnYtOTWMnF6ArZaRRawfmHW5UC4Wg68xoWy
	qbaBZmy9mI3mT875EgRKRF6OL6VRoHWxMFRtQ3JOZbDjfSrs1NsTKBR8BiClukraa45rmQkp4wShR
	kAcg6U0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUR1m-0000000DKf5-19B0;
	Tue, 02 Jun 2026 15:27:38 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUR1j-0000000DKei-3KM8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:27:37 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5175d339e8bso551cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 08:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780414054; cv=none;
        d=google.com; s=arc-20240605;
        b=JEGvShVQ/kJcdovvwb7Aa7iHCBx1uppMSNCNE9/qCAI9TSyU3fM6uM7188V37K+Dqz
         IwAWWttabln1iswhLkG1m7qEo3LYYAnDyd6zI7MOJNRWH8iUmOA5Z048LKlYxC3oT3dV
         qlON6x399GzkVkLGQiIEcDz5Ro0IMcGMiKp877SNxWLF0J7pNZ+A7ibvwebqNuhUXCqN
         P1dGT/qEa553SX5Mu/PfSjCqDWfqUKz9y8Eo8vX4lcgaeDxWj1y7tnWJRbAcEm0bseiJ
         yDW0L4Fzb63aEvac5CgcTvhGN6GaurXWTfLjk8oRfQ82w0sVTcszw/w3DEsivTZbyoQi
         Xjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IoL22FIeKfAXh+SYG0vrRqgXDdNNko8Yfwwz9xbVvfg=;
        fh=kRnrvTFvxV/nezvmLhMEtSAJd+pSvYSOwdyH7wsfTIk=;
        b=lNU18demR3nKhxSYhyCppA36TC/EA6WIthV2Lk6hE05GtVeQKjFrtUB4DclZDthclp
         7u869i5KQ0GM/lYtURHKIoRtKMPHx6VbzpFdAJQoveITVL/vGRdJmNtafWMQCo85Jgf3
         S9UkrrTpbpRgC3rXVm33FbwMNwklECeLJ5MC+X2s5WkxHLG9iKVn53L79V91wty9jQC9
         WyZzlT3sT0M+FXLxMfejxHZvSZsvhTY3NpCSLEWRDxNMg6wPwb1CaSdM+H3NngPX/t7k
         xGFz4EgNfMqHZhja4zVjbgAjZdp6KH3S4XakpB2YrfVUut5RCzshMBpSdOYCvCT6O0TV
         OlMQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780414054; x=1781018854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoL22FIeKfAXh+SYG0vrRqgXDdNNko8Yfwwz9xbVvfg=;
        b=jf/bYhbh0zaz/Ymd5qLxLAwBq2TDfa7I8UpGhMHK+quHb5ptd4ieyXWNS98vx23xu6
         +fDM6cHIHAouudjfvjyYGcrAaPMDSrln/WAZ42X/XlttVCEkh2kXN7g4hsuFPPOcDGRD
         Gcg7NrpjjRb427d6wk6otjVddFiPhzKggLHUb4ZOTfladKrbcS0vsGyHvWKgBZlCztl8
         Z1K77XMmptZrfNwuSX3HxKrMA4JTQ611CC36maYt9coUExoMJneZ0KVVpv3sVLTb4O8H
         c9JNcsSgcXHBqJPnBxbBC8Ael9EE0JViJ6nLvKDokPLrQDZCHmkhE1ZIm1EVyFUdca2h
         p7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780414054; x=1781018854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IoL22FIeKfAXh+SYG0vrRqgXDdNNko8Yfwwz9xbVvfg=;
        b=pcYCxFIu07Vzq56pk71H+P4N0OnOTsJ/J07Fxsf7pQg41KJf/RnKJmyHweQcyq38me
         4n+K8kc/o+nxMEWF32vQoCpc9yVcv3JHs4Xkd2x2QxMtBMUTDPLTrKxCw/wGXLQhovTD
         ON7yWkaTT5Z3AAwJJ0zLcbiGGsH6MhjPEXPC05KVfi2h8WSb12Q2EP8cRxSW4GzTFvLy
         oK3ikxw31Aytm+k4JdL6wPLj9DudR7wydLYZrktgDJqZY+eM2lX4ik4dwkxgnmfigimV
         80sMKLxEOyYEdUhv5e6y/PvoZE88GjwW55mWm8Z2kZFBW7/bGpF0GMt2dPYaDoAl3TkL
         E4TQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Lpse8TJl4SuHpUQgiDeJx3UMEE1AtH0/9XMN50na8omB0GOXFbVhGvC9SPqRxgAZBhf7yDdEJ5MSP2PADOQ3L@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4ZP03+Jo/Knq/WlWVVJvTII/i7nOeAZ16qsyoazqfnva37BUJ
	BpfWbcko3kb3bd4xS0zJwe4ZztE/Jfwaoc92S+fRQtf4PEDg0Outc1NjryqesQOmBE23p9wUbP3
	BvGZ6yIwrYuuYL2QBxTcon3+a5cbPWhRtm/Xb6SLV
X-Gm-Gg: Acq92OHym9qfWoSklzo9t8yIrORNt9cC0l5iObK70FlcuKKPSx8GPg6gpKpCnvf5f9d
	JyiYN78Tbw8apWcGBJiBzzUp4u1wzDx2Mzf6MhK/1aDoAehw7xlCqKdWpoO7wAwIvwoXWF7MJqK
	GivuqdqMOCBGCTePWn/29VZyWRUUGDC7+1Nx8PFFjq6J7GfEI69GjtDNYp7OuQEyhdZ0qB7unXD
	ND/WTgNAP0kz5DPrBrs4jHkozt65NHb1uQnRWbmC5bC3z1EFejTWfRRJ4Xh4amTe30nL6nlp5Fy
	Hgzlvm8oSO9teaIn0CAtMyuLUw==
X-Received: by 2002:ac8:5497:0:b0:516:4f62:85ef with SMTP id
 d75a77b69052e-517670ffcadmr12205751cf.20.1780414053704; Tue, 02 Jun 2026
 08:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-10-praan@google.com>
In-Reply-To: <20260601215909.3958732-10-praan@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Tue, 2 Jun 2026 08:27:22 -0700
X-Gm-Features: AVHnY4JtchXYcXtVOWWrA9WzUeBrl1Y_b5SMm__JOC9anLOCtO0FRHxOlKdqsXA
Message-ID: <CAE2F3rCTHZOiSx5tTVmLmubJ4SUDtXvCX6oLqsdEsPAFTKJZ4A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260602_082735_871617_F0F56039 
X-CRM114-Status: GOOD (  10.92  )
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
> +static inline u32 arm_smmu_cmdq_owner_prod_idx(struct arm_smmu_cmdq *cmd=
q)
> +{
> +       return atomic_read(&cmdq->owner_prod) & CMDQ_PROD_IDX_MASK;

Is this masking necessary? Can't we just use
atomic_read(&cmdq->owner_prod) as is? The only place in
arm_smmu_cmdq_issue_cmdlist() that writes to cmdq->owner_prod already
applied CMDQ_PROD_IDX_MASK.

> +}
> +

> @@ -4839,6 +4876,10 @@ static int arm_smmu_device_reset(struct arm_smmu_d=
evice *smmu)
>                 return ret;
>         }
>
> +       /* Clear any flags from the previous life */
> +       atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.owner_prod);

Same. I believe CMDQ_PROD_STOP_FLAG will never be set in
smmu->cmdq.owner_prod. Hence, clearing it shouldn't be necessary.

> +       atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.q.llq.atomic.prod)=
;
> +
>         /* Invalidate any cached configuration */
>         arm_smmu_cmdq_issue_cmd_with_sync(smmu, arm_smmu_make_cmd_cfgi_al=
l());
>
> @@ -4898,6 +4939,21 @@ static int arm_smmu_device_reset(struct arm_smmu_d=
evice *smmu)

