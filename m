Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F4F606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ZY0FkcH;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XWsI5sJb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9m8EJZJphILGcBqQZQvehuU/fPhn1XULUzvAHjdvFco=; b=0ZY0FkcHscnuUoqfPOPdNUKwv0
	nl8POjprwu37JZfELi7gBVcPonv+rc1gDzoSYvjZjuac64mKiO456VPgmgPl52qJ1dQ399uv2MWhK
	5I0XFgDEJZqDOMUMXWECxGcP27FJQldOGxYTZe5frsPHQPA9XNj2gD34lpvmGabxZqIIXT0vgey49
	w+ExAcrAW3k7HmtCzUsV8ehKCqU9nQ9XOC6T84194d+FV5schH7G4/u4j1SJCjC1MyzFloOqk8k4g
	XD+sewRXNYGVQAdWHiohMLWo7i74gDlVq5+uhbxSAd9H/jvKbifWUwj2gqh26qm+wPcwGUfCVoDut
	fY0A2z2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5jd-00000009FsI-0rLP;
	Tue, 20 Oct 2026 09:02:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5ja-00000009Frx-0yrn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:02:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso3261035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 02:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792486932; x=1793091732; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9m8EJZJphILGcBqQZQvehuU/fPhn1XULUzvAHjdvFco=;
        b=XWsI5sJbmYHSZ/yLGG9Pc7f4hG1/TERzHXtTfcYZdiPrZnlKDNam9zBNtUjqnij+33
         3cXLSXD2fWuaLypFhZ1yK5bIBr4FHq1SZzhr+hjJHD4qb7EhIai1X3qPAN278tyA/Rl+
         xrq4QqGhSF+Z/Q4TFYhh45NHBJz+EC0Y46unpye6EKR2lQxyYz8itYem99xNQtDgFdKm
         xHmE/wQY9wzBjuq9ODhonh37lelmG8BdhWfv3+SVTv0cim23YN52C+ff5/YMAfJ/5JfB
         2FT/RrEroVh5VXgeMRC6o1xWRzAsOXqjlBoPj1FrMT2V7L7qQTO5w19/82T80r9BlFJ8
         975g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486932; x=1793091732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9m8EJZJphILGcBqQZQvehuU/fPhn1XULUzvAHjdvFco=;
        b=X/mGh7XUtg4Hoi8QHeUA7j29ozZp2/3eHOMEVeYJp+kaPjhI49OTXGbCTnOaUkKVWb
         bzjHZRXYQRw6xVD/u/9oNYf7aL+hE62UTobjfpd6mBLDgxgD5rNR+Ne+GNW0X7cazKKn
         JzCjI+lHoMov1wujZHPZjhNECfaT9VJByhe93ULVFUcHQu1toq0jGRfmkNAcDMmUU9Ys
         KG969DHTfIZG/PYwwLXB/c2meUOXljdIf9h2kVLDXFOGBnBYFkE7RGiULnW6E2XDTY17
         cWjsQilPdVp8cvI4EPnx1fktmSdT+Qjr+q90xNeEMonCudtLxO1XF3k8bhbrKmCQdyUj
         FfRw==
X-Forwarded-Encrypted: i=1; AKwUvBxhAR4eYUM1sg9Iuo1A/DXsT005qP+WI8c/a1nDvSdHNK9YOKUUp+1lz773GL6wNo+wYZQhV9dqr9XVqtCXDxPR@lists.infradead.org
X-Gm-Message-State: AFq9FYIjdvjvQfLZDua2mRcAV9MR6oVhjHe8KgQOILW0IpFLG9fPVGB5
	nbpf2j09Q8CjqZmX29mtYueoVBbMp6BSzypsGE0+gU1kXcqOciocdPnwWGMbdz+ZqA==
X-Gm-Gg: AYBFou0II0HfG99EG1aYjgNGrNh1MudmZZ0FeHzSyNL0X+frZxhV4+OVSSaBtyVAjR1
	cRV9rDN9hB59hakNoMD4xClWCdAmVvzNWFwh1txsHiwVMMx3x4Re0ZVZ+P8ZuL6jMddui7Z8D+/
	8pjhlEUpgsvxwn4DRRIZe+/+XGTUIUkVTCZM5VTtXDtZNtCW1VYfTFnqgdf+rqDPX2q00ocebaW
	9opMwKlfsb5GPaAR+upUlHxy/4T98Z32HoT6ha89i1avL1/KdbX7jmetDHUWDD+Bd04a/Sg1ggO
	8fVQKy/ptmOrJOzrZPEzaXSnOygJzZSbYC+Jug9xqr0jrh+9wb2tCR+XTzRHP6A+TfZZ9V0xQgE
	aj7ABD9M982ChItKSybhmxa/og6b7xCbdzfJklxpoxJzja5mu6d2zupja2dm4LMXFIQzNTAb1l6
	IpzlR36KdlUzCICwVoQ+wRqCrNIQlAuMYlIWkzj6BjDJHMRDEd6nAM55uUIGLeswV1QDBuJ7ltd
	Gg4IkkoDbOWt12gZuMT2qjRNLwGgq+vnlBMsdfmReo=
X-Received: by 2002:a05:600c:4743:b0:4a1:d899:b62f with SMTP id 5b1f17b1804b1-4a1f45f8877mr30834125e9.0.1792486931667;
        Tue, 20 Oct 2026 02:02:11 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca30aa5sm33064205e9.2.2026.10.20.02.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:02:08 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:02:00 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Snehal Koukuntla <snehalreddy@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/2] KVM: arm64: Support FFA_MEM_RECLAIM2 in host
 handler
Message-ID: <atcuCDHAAKZJEbHC@google.com>
References: <20261016082341.4030770-1-snehalreddy@google.com>
 <20261016082341.4030770-3-snehalreddy@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016082341.4030770-3-snehalreddy@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_020214_345478_54D79EA4 
X-CRM114-Status: GOOD (  15.87  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 08:23:41AM +0000, Snehal Koukuntla wrote:
> FF-A v1.3 ALP5 (DEN0140 rev J) adds the FFA_MEM_RECLAIM2 interface,
> allowing an Owner to reclaim a subset of pages from a shared or lent
> memory region by populating constituent memory region descriptors in
> its TX buffer along with a starting descriptor byte offset and initial
> page index. Upon completion, the Relayer returns the number of 4K pages
> reclaimed in x3.
> 
> Support FFA_MEM_RECLAIM2 in the host FF-A proxy handler. Validate the
> register arguments, copy the constituent descriptors from the host TX
> buffer into the hypervisor's TX buffer, and check the descriptor bounds,
> the total page count and the initial page index on that copy before
> forwarding the call to the SPMD. On success, unshare the reclaimed page
> ranges from the host stage-2 page tables.
> 
> Link: https://support.arm.com/documentation/den0140/j
> Signed-off-by: Snehal Koukuntla <snehalreddy@google.com>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
> Changes in v2:
> - Rename FFA_FN64_MEM_RECLAIM2 to FFA_MEM_RECLAIM2
> - Check that the sum of pg_cnt across all constituent descriptors
>   matches total_pages, guarding against overflow (Vincent)
> - Simplify the flags and offset alignment checks (Vincent)
> 
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 126 ++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>

[...]

