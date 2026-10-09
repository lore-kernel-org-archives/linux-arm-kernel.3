Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9D5CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 00:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfAyWJyoYAUZVrBF2564jVEKZBur8MkqHqXOz3xZdYU=; b=Tb0ptsjeUp+FwcmBIWfZWNHPZX
	iZiYLnR4xcHfzHBVXe6VDko9jKx5G6UhyYg1PYncppIb9QmXlsmVeclYuvP+mQh82c2o4kz3eeIPD
	JlvLN6CUPWiHHI11XXjHeiNBt8OqI2NPaXOjkOBSzxJUE1mk43a5p/5u6INBVm+ilNQyYtnnfbF++
	eJEsJlSC0QwerZ+6wjYI+X20ZYzQZFSyxqve60x+7+WrIzs5jnBdzlGRWTw+5vrY5sNxf7JG80fe9
	CZPpXz4CYiBQ1O49EO6Fyx9LsTmQ4LYOuozE7URM8uhkvXqYOhKdNqm0v+GJ0/yr7ECP9/0Xg/kHq
	tGMHHcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEy5v-00000005B8U-1B3v;
	Fri, 09 Oct 2026 00:04:15 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEy5r-00000005B86-3EMW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 00:04:13 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-8ab43af5e97so13824377b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 17:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791504249; cv=none;
        d=google.com; s=arc-20260327;
        b=Atu2fPe5zQCQZGG4a+KX6AWEhamietuoVLihYMc1YByCTx6T8dfbZEKcxE5faWVmDk
         SjWTMtzwVEIAkYq0P93PDeEC7oZHOSaJyboz+OzsIuYhsYXSs1xBatORvEQLvNXyKlfm
         S1jtTdpFnp6mfvZCnX/u4GlHZHApfTuaBSYFf6vIK/IXRhLxwmKD/X7vjddE/WTkMoKS
         9NQ9KRreBDjmj3cUn1EHMIStH5Asv4HsqgrKkY2YY7Mxev09AwVMyYBTfYRKaoqpcVCH
         dbdoB5PR1Z/raew2gHd1SKJp1GXZYXjpFPkBmi46rv0wR6FThvxnfCjDq41te+YyueIG
         KKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AfAyWJyoYAUZVrBF2564jVEKZBur8MkqHqXOz3xZdYU=;
        fh=CjB3RWKV31ISIz+c77wlLyzRdtF/qFzJv0IFRvhlm4Y=;
        b=nPUTxtXidfUsSZXYJYHI5/p0bc+ff7haEWOP5TDe7W/Y6lfbGS0TKOkmRWqz0r95XW
         p8Af1WVSaVIDIz1wfVkpxA9c6HPkn9BMgp/cSy+7REn74NtePI8Zdjlu19KCGeyoe5Up
         9WC+tYRvthRp3b40pBYkv6o0xsP7PtPzXFkR2EhOv+7Wy4BYeFue82yaXdPW9qhz+F1r
         LK46TazAO8t1IecJF9GppFYWUc1Zt+8Q6T8gRqqZna0PY4sK9zTza+noWEWmSnv0zNtL
         h4uXpHPk8kxEkIJSbf1jKHYc/v0FP+Hc5mPInH9wYrqBYwFBEpCpCm50p4y5r0TqeNtk
         AShw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791504249; x=1792109049; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AfAyWJyoYAUZVrBF2564jVEKZBur8MkqHqXOz3xZdYU=;
        b=BQMI71WyKNr/b0UA27v5ghjJs+wMizhq7wbU+IYU0qjZtXARtx/KgBr07+DJySTJJe
         84l2pYJ32dF2ptM5BHtE0uVt9rfsaNrQ6NmwI5teOMlzVi06YvJ49eYvJbo3NmHJdRh9
         6RD4xz7apzvUJfB5A6FaHVcLVUjB80tKQuSyniLBRILtEj0uZ6wd4H1DE/hR5/UK2Qsz
         iVlpt0Gq5IzW+yikhSGPTshvmKGyDQLHt2zfwsBpB+kFUqQE8ZfAiUdKvniOfEp+UK9A
         2LYEgk/OEsbEZ1g4zhJus8782/PSPketxyVmHneLjN3/KKIUjSgIggLP/67h7Bi+J1AY
         Clgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791504249; x=1792109049;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AfAyWJyoYAUZVrBF2564jVEKZBur8MkqHqXOz3xZdYU=;
        b=NRdTiuJcRo7BPO+1KO2AzWDOd9B5yVhpCiDfLnETbm60wOr7ZG1ZJgV72SBa2VKPsT
         6lxFDFmwECZfXQZ0oOT/cKnCpaGyEIK1XaCeFA7OgDNOa5mO+TS5FsYVnRv9zW5FEUUk
         De30tf4VUV/1FXDfYWqJ6XhrA16ILHuNXECsWRC65Xbb2WVL965Et5jYc+FpvvBZrzhQ
         E1q/Azl/TPUsEx8hMtndn431Ad+gMtpTnCrfU3gpTIoOTYgvhn1BGkjAkDVqaBQCB5PV
         Tu4qxjhUf0hDtTfG9yRoa2HZ2R7OHKk5/dKjO0aNsUWgEnOOIxRKwzZjvbHGw1mduDFm
         saZA==
X-Forwarded-Encrypted: i=1; AKwUvBxOCWB5K2wH78ZAX33eDARYwubvZtDMN6eYs0zvW2nm7WH/dqU/u7kwlPEjMo4Qaz5FFgjMtWD11zFiyO2Ia8/g@lists.infradead.org
X-Gm-Message-State: AFq9FYK8xQWthyETZNRTKYzPs9Vz/Gng9BJlfrpvC3IAxWRsUJSp6vd7
	LJXm2Ie8QxOMWywBiBbQpK5pWH2lvnJGp3tIpRdVmfMalzGWsWMc9l6LGSxVKkZR2tM/DwZUubQ
	LmDk6vp89BOKT1beE0sC3WItZH2LZtFY=
X-Gm-Gg: AYBFou0Gkat6NmtXjtA6k9TMR2jsyif5saUD2E2lvHXfQ2KasAU0UZNfuEzVLaSNzZb
	sJKsx63LzeHYNyaBvA13A4Ep3k2P6BIP/AEo/JXVYLr717XHVAuJtPucU/iMYdGjnqOthSEXg/R
	rwT4YYyxKMU/osciIplBBpMbKB/ociE8SVWahj9nVccLRDyCjT+Sny4sCYIuFOPVfsahCoIEt1c
	AwAPz8cjyxjakYCyXGMEM7n1fDpEhxUWpKxfiUC60wcmht4VXMh5/28SFb4lIOD3+K3+PuFRJoO
	dwxkSjMJt8GkzRWMQxFGG+L+npR9hhKlmKB/4dGkq9e0+0IuEfJj3fPlBcWNgphLDYT9WBCMPST
	rCJMdgjQNrA==
X-Received: by 2002:a05:690c:6e81:b0:8ad:7131:9178 with SMTP id
 00721157ae682-8b07d3bee19mr2337247b3.12.1791504249249; Thu, 08 Oct 2026
 17:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20261008-apple-m3-m4-kvm-v1-0-7bb4cbf3d63b@gmail.com>
 <20261008-apple-m3-m4-kvm-v1-2-7bb4cbf3d63b@gmail.com> <86cxtk2utm.wl-maz@kernel.org>
In-Reply-To: <86cxtk2utm.wl-maz@kernel.org>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Fri, 9 Oct 2026 11:03:57 +1100
X-Gm-Features: AclHuK9Ag9bDa5bK4MghchktXbtliwMAsOllt0WW00_OPCRuwhkusEjtb_E3AmA
Message-ID: <CANpmGNv4uYRLALMLKZn-HJwTiqJO90Fx23DOO7K7d-PfSWn=2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: Apply existing Apple CPU workarounds to M3 and M4
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Myria Sarvay <myrialsarvay@gmail.com>, Yureka Lilian <yureka@cyberchaos.dev>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_170411_863027_586BDCFE 
X-CRM114-Status: GOOD (  16.35  )
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

Hi Marc,

> How have you established that these CPUs suffer from the same SEIS
> erratum? I'm all for working around bugs, but I'd like to make sure
> the new fancy stuff is indeed just as broken as the old shit...

We tested both the PMU and SEIS fixes together (as in 7.3, both fixes were
combined into just the one apple_cpu list). It's probably a good idea to test
them in isolation, thanks.

> For the record, the EDKII build in the QEMU EFI package that was in
> part of Debian Bullseye was able to trigger the bug semi reliably
> (series of writes to ICC_EOIR1_EL1 for interrupts that were never
> active). This happens on handover to the guest kernel.
>
> I can provide the binary (and a few scripts) to test this easily.
> Should they have been fixed, we can always create a second
> implementation list to cover the PMU.

Can you please send that so we can try? That would be much
appreciated, thank you.

Thanks,
Michael

