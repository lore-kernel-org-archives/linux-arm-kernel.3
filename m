Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7467C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 18:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxSYqjpXn9L3rh86fmrKHlYewJDED4m/ZxVyWxEHBJY=; b=ZEqZ2O+SdO5VywkmDnppRBVew2
	QmbLHqXrjnjzIPZpRcUe8jmgfoC7TLJiO7wzL657dgpIXiwwoocEZVFhEzZK3OBPz6Hw+HetEtqUJ
	yUHEEV8uM+HheZdCehOZtnDDzoapdKT79zEJslyhOCEtNXrye+uAdUQ9sQlJlRW6I4TF0oJCOwC8l
	kFKkno73pLpM9VFbq0xgrcL6kDvy6Mg0oJ37/95VcGH0dFe3BzFQq1ryam/S5vXcJEDqFxFW+Jj3E
	G3dpHDFieUJuWqBZyvXfrwZXnyYx4VlhdKNvGjM9xH2OjdteAdf+GhGawYv0htqnoGuNRsTIi370L
	TveWccjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ePj-00000007cEj-15fP;
	Mon, 07 Sep 2026 18:49:55 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ePg-00000007cE8-40Xv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 18:49:54 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eefae4so1108515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 11:49:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788806991; cv=none;
        d=google.com; s=arc-20260327;
        b=e9rMGFB0BIGJapPCndyTOkmYhCqQmiacR/C2fSLH0GcyaLOQ+Csr9n9XHY4NWtWr6L
         VsLC/qBmKPoSKjjSFXDnXCP8uEmoys0SBuDdm6VcfHYozQidDaoSLg64aocY+BX7SxUx
         G9RBwXt4EhMTuZCpuYv7G5b49+uvkQwg9FRoKxVLl3ppnONrCCBdqNssV7W8NeKKYGEH
         UR5klHw2kxsUertlQL32cou62LjSYH6lFV2farJyeAuijXOkSDozIZtWPgEEbMYtYQYO
         Oo3o1AhnizsAkfyJZdMtwxFgRIqk1nmBmSmzXGq3sw8eKhX34OD5ctm7f5FhiPjVYPWH
         UcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JxSYqjpXn9L3rh86fmrKHlYewJDED4m/ZxVyWxEHBJY=;
        fh=uYMtK+K4GSPbRuPrrKJF4xN6YZx9hTvm9Pwe+8nL7nc=;
        b=CVf7lVw/xB72z3BZ52ceCQ5c3ArjW3XnxKmXircOc4GAL+8I6sPvN44U7eQhZtG8hj
         52MNmFxIlAI5lnG1Gbb812+Ddz4tZVPdyUT7Jh4GSwcY/6GZ/F8Q6D1Yt1Yp6xvU4rjh
         epA79NTAgJHoBaNwHfRbHi2DTgQqAWFHkx8AV8bBaPJQgNZtPCIjJMMKqhzth4ylt64g
         RxJxmjAx6zRiR+rpkNS8znhoFIWrw4bhdClRpu6kfALVQ1j2C9hBPw56OnPx40ghQtlr
         Kc81jsM0idEK+p/t951tobXXrBAvcQBkXSs0V0f3VjfDAHPLWac3VH+KhXHb2W/mgEmX
         KP3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788806991; x=1789411791; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JxSYqjpXn9L3rh86fmrKHlYewJDED4m/ZxVyWxEHBJY=;
        b=jjsA+AHK1JUnuQL40hZR0AAzo0HJloWxk7TAEw12529UqXh1DNQl0F2fBpOY9QhqvF
         p3D2S4Ukvnsj3Sx0XNEG4H8E0wkfJ/AQsJPZHYXRV7MXqXt4fAy65lVd4BVMSbgIZlta
         e1dPvOoS0yTk/1qJGNHmSbQqCMc+feuZWEqcZ+vt2nRUommnPsi8uDKZxct8Ebzpkwa0
         jpJXWp650z3pb3zdij9o84iYT5UFKYUuPxa/TJ61YggTWcrGfExhEM/Ub3n5tNsyfd3g
         +8ShlkA2e4GYxJLK3RxSlFiys1e54P8Kq6RlGGtQ5eB2QAUsYq22k35C6tj664MMxa7Q
         wkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806991; x=1789411791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxSYqjpXn9L3rh86fmrKHlYewJDED4m/ZxVyWxEHBJY=;
        b=DgoCtDz9fFqGcs4BM7roorPBBmDUr8/8+MaH6BJWQ0fXSkr8ifROrRqXAssIIyuCff
         xXQEacakVl2JHJ5rmw8AQHgrDUD+oNDAmMbonycpMdTUHJQLalznjrbp7LWkym7f8Dlo
         aJY6eFiZMQzbImjnFZPFlt1UdL0cl/2aotFcolUv7R/UMgnNVIsNW8OjzOE/MhOy48Xf
         cl58oX6x5xDe23N/VQiNZ7NuxGcSQ7h/J6/MmUpzO3OYH0cQc7y1GqX85uAe9/sSQTbF
         Q4EkoHVnU4xNMc2TKkPa7u0vIvupy+OBVrfTqX4nQjxStlIqQL/Hm72FBvaSduCBTNgr
         WZzw==
X-Gm-Message-State: AFuF++mpKYkN4YcedXPc0gqbkvjOeew7IsCGCsC21JE+t6d6xD4YXJ7O
	sVlD1N0TURHkJHriRj4T5oTcN5PRb+2c8Isf2veRP5bBlANl95k+/39oxPOe4GodqYAfIyNxO8S
	OFbiuVD+vRL86M78jknngKpPyVsG2mcc=
X-Gm-Gg: AYBFou0FKcxAu/oT2GCqilfY3xbR3Is0E4tbDvLxSw28P5sS7cPPNqBIfbNRADYin9V
	YOVUGr31iMeJUdQ2qASZNroHMxDpzi3drQKi6BIIkMxbMCQQRlOwTFGBAS2wFpnuhORpfewc57A
	2s2TnM6EHM8+j8CsFkrtShI4Y82LAqpWIxeWYpPJgOvE3w0W4Cktx+NUHA0vZndqsSFOMcsbi8d
	Q1mlwgnHxzCXJ/rY+qncJn+Y/bnc5b+NpYTMG+8qBUMOdhxohuzHE4NStnc05R/n8T0Wtr84gIr
	FQqYQZXE5b1LKimFoClfsqE7fwQ7oMEjoVp/1GiGV6U2/7qpGzVKL59PPo5CDexrSqpmG5cgI6r
	BlRPW9zQBUlnpjjpI7oWn6hmg0Bfix4DRa+f8wb4=
X-Received: by 2002:a17:90b:5743:b0:38e:c232:9d2c with SMTP id
 98e67ed59e1d1-39b8bc9422emr2061387a91.2.1788806991520; Mon, 07 Sep 2026
 11:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260907163726.17104-1-will@kernel.org> <20260907163726.17104-3-will@kernel.org>
In-Reply-To: <20260907163726.17104-3-will@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 7 Sep 2026 11:49:39 -0700
X-Gm-Features: AcwNN1UCBGzNBkKYzPqBLzfBywiT6dWM48M5nh8JX2eYcmjL_a0phc-s34IGjM8
Message-ID: <CAADnVQJN=9SMCoFyG1-hLMKyCdZ2mf0Xp63VZDNE2oddaeifFw@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] arm64: bpf: Remove big-endian support from the
 JIT compiler
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_114952_996172_AD8AAB57 
X-CRM114-Status: GOOD (  11.38  )
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

On Mon, Sep 7, 2026 at 9:37=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> Big-endian support on arm64 depends on BROKEN. In preparation for
> removing the dead code altogether, remove the big-endian-specific
> support from the arm64 BPF JIT backend.
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>

Acked-by: Alexei Starovoitov <ast@kernel.org>

