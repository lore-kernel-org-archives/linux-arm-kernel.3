Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F935CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 02:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aO7HAaieXZKl5Jbk/eJYtrPb89oZ6xa9v0C5IFxSeHw=; b=4xKif9lrGpgMQz6Bj7N2Qg1RS4
	mw9q4SEsVyvG8e9DRWcPbeegpZLLUU8LqViSElwvGj8xifivVePPN2q90eq4L5kLfzxuf59xAdfUK
	bCBmr7yNXb5wD2jebrb/7uRmiOc1dlQlh8K27eyS75iGOohrmaWA7vQlTTABjiYR5HmI6AXw8SUy2
	ugifWUR03M/A88i70TefbD58J3ldrhDO6Reuosj/1kB4ghAXXrlB1b7OTw2BMSIUcJa4LI+Wu1zbM
	FwXE7Xs/F1UmRtOFa6UIVoMegXmB2xPv4d1R/Y6P4L41+J4iiww5pCCwzHJOv8PFa2ZirAwsNBBgk
	NyVHwnQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwUc-0000000AJDP-3vtj;
	Fri, 26 Jun 2026 02:40:34 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwUa-0000000AJCp-1NkL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 02:40:33 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c1214dc027cso42577066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 19:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782441630; cv=none;
        d=google.com; s=arc-20260327;
        b=r7FABk05AWxp2hHTkGc9jHWG+3if0O+cI+pl6m5YzyKS0TlkW9TlWn1Fd+WbD8BJIW
         DrcfU+uXIlhnddesAi3/uvs3DmUyDgw1NEh9NrqSDqVWOjNiipzLJPtYjnnyDEt3jVA+
         YcS4vuemkl/iRtd0SHDXeWoUan8ZzYfbIbgksPyc0SJ9A5N9uDSvLypQsDFgziWfrjwk
         dv9ehLU0A8G8uSBXIdpE/qHRXyykqPv5QcsyV7rCsPnYdLelbUfWQy5Eg1Bzz0FiA4hG
         PxvA7Z3lbbZd/qZGa8qQhv4re4om1bBzggc/4Q0sb96aT8p6dhIiywHs+dh3wufBQdNB
         OWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aO7HAaieXZKl5Jbk/eJYtrPb89oZ6xa9v0C5IFxSeHw=;
        fh=4R/vpvwn6fOueShcgmgE2zJkdxLsNn9v/PRO12yelkc=;
        b=kRSSOtSdvpE/vUMU3Mnu2r1c6o6KDuPu0yWI7AagKn9SaOeAhlwBqBTZ2Fd4Vg0y4P
         wFmTvkC8bLW79cA4Z65KdnY6dU6ZeBr9WSNd+dYapI2UTuo2scz8OvexUvUNYHm84d9U
         J7JBx5vMlQwIi91ynJvKTXFBIc+kSb5YphBePD4Z8DO0mQCZ0jPP17EUOj0NiJutdRpi
         Q2fkJvHQY8j5LZIB/R+ZO2mBjeaID+cM95Dk3Q/KeRbGy/PUre30jug+lbz4ygo7M39i
         UhkEllJlFtP6OB3Vx7KQWNrPjzpkwfGQDh1uyRossXLSww8Rfrd6cgV3d9QMuPFOp73u
         NzKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782441630; x=1783046430; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aO7HAaieXZKl5Jbk/eJYtrPb89oZ6xa9v0C5IFxSeHw=;
        b=SQuycwqD+4uLIRIxK30DopY0rKjCqIm+9hrbbWMlLvKPTAjNqlTBqq7cZvyHrJNWbG
         GEWfWNzwbVMr2764yKF7b3KQRPDhuq42Ac0KRPPVA265gQPihYTjOozSvK6JVpluAWil
         9yjkrUS4Cwqz12epUKzZLFr8QKSSYn4Y1vxDXoyEQJQOxXad7bkfC+0li8DwDLmO2rXu
         1XBhmCPSZnewrz6NlArE2vh5c1xtZam803pXj6qQ1gynGGdV8B7bz20U1mxvrDVNemtw
         PBllvbPHbNJ5bUCcPj5kLYEMkS4muZN1NHOStowHq0rmxVWmyzOmKenXmcs1BgUqKhCb
         44Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782441630; x=1783046430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aO7HAaieXZKl5Jbk/eJYtrPb89oZ6xa9v0C5IFxSeHw=;
        b=Eb1Pb7DxV3rqMQVFutYc7D/p5YLpahzQbOx0QF4utElnd9naTag6SnJY6sa2hmgmop
         CVxJSzdE5mE/07kpHrHu6gyIf4fS/W1/qe4ZJHdDqf/xBht/Q/f8IoVTMTC00Ck8RTMA
         Mmj2kcWnifhCUeGUQNGujvpv22OrETwYhIxTt4iRwVKCAw8fzMw/Rm1yQY9LpTa+Rqv3
         UxgekCADBezzawoYxTx8S2MXf28yzNFEr4XQVZwevpx/vObE9Z8Ar+zWF61NcJHYTEax
         Z6Y1QmGQE1qWjuad5HMZSnXqx0r0IeEKcNogfCYbr0p7zjrVeIT50r22+HX8IKzJwre5
         uc5w==
X-Forwarded-Encrypted: i=1; AHgh+Rp8jYHIeTnXBNX3ig/5o4ELeRqOcQPmRoZni9npL9jUgH2DIli2ZXog/0dNNDckRengBYnOkPvjrhrsBu4ZI5Lz@lists.infradead.org
X-Gm-Message-State: AOJu0YyX+IocyJuJ7krmsib53E0AtRw8/M3/fUke8yiD9uRe0YhWWrsZ
	Ngpk43cBDkpUbVUhXpuPU46NyYo1zbZY8rQ+W9MLkTXt/mCWY/4gW8gQR74ZY/gT0CvtdrGthdz
	kcco2jOU6uXgGP5gO8lE8dzbDH1XNZhI=
X-Gm-Gg: AfdE7ckGWakMyFyWN9QWD/SJKogtYXOMGqeQCJz6jADjxgAUfReuzQI81SGpJwbkLK6
	UH/YlqZgLxZ9wMpXAPxqfdUXdyx++BFiWS5iVzPBbHy1KpCN7JbaW5Au0HekvM2F1ANupOgUOH4
	ttTXVxft1Uu6FPA22p7uPJFVfskjq3eTPTVi0ccLxPfyVEIbsA1XCc/F8qLjbABpcoQe/NZ2o/L
	7Hua99m3C9g2Xt9HNd5rFGYEQaEdkKm9UFTHYrw3PHZfUgWvu8+Sikcz6Rs0tiXhMQdgSBI
X-Received: by 2002:a17:907:94c7:b0:c12:2b09:6c83 with SMTP id
 a640c23a62f3a-c122b0985c8mr14150066b.33.1782441630203; Thu, 25 Jun 2026
 19:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260619185808.1090575-1-dbgh9129@gmail.com> <877bnt8u5k.wl-maz@kernel.org>
 <24e2da5b-82a4-4889-8b62-5f445cec9657@linux.dev>
In-Reply-To: <24e2da5b-82a4-4889-8b62-5f445cec9657@linux.dev>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Thu, 25 Jun 2026 22:40:17 -0400
X-Gm-Features: AVVi8CcSDw38iXU3lFIzIb0mZHU9FrMAV9-WNQC98wuHtZQ7-9FEbpQx1c3iqQY
Message-ID: <CACrCO_XLNF=1ptxkNR8+E8NWjKVZPeVz0i0ZMkzxo+VRX4d5FQ@mail.gmail.com>
Subject: Re: [PATCH v1] irqchip/gic-v3-its: Fix OF node reference leak
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_194032_401559_62ACE7D8 
X-CRM114-Status: GOOD (  10.47  )
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

Thanks for the review!

> It looks to me that this issue was introduced in fbf8f40e1658
> ("irqchip/gicv3-its: numa: Enable workaround for Cavium thunderx erratum
> 23144"). What am I missing?
>
You are right; I used the wrong Fixes tag. I will update the fix commit in v2.

> > Please consider using the cleanup infrastructure instead, something
> > like the untested hack below.

Sure, I'll update this in v2 and resend it.

Thanks,
Yuho

