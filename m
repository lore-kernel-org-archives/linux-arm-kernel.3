Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E092CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W25ew7OtPq3XBskzl76qlbOu0FGmIC+E26EOjAY+RgA=; b=I72CodUvhoY/n3X/OtJhvhLEFw
	P6ZMbhyARn/icZq/W6q+bOW3HhsfA9iipQUdgoHKBYxWer5Pz1yR52BxHXl+l3Z1PTLNDYZv1pmzJ
	APJPMuRL6mOSBuWgF6PX3gSJkL16BsWg9HwkzgCR/O6vlqgNMzlKvxVxyUXtdInRXWBRUjzfzujRf
	ssORBLnW+bQayHGM/RY88QhI3DF9lfx38wYsTLAtBwu4EgOSTkv9Zrhz5SJ5C2Pobft9mLPoDi0wy
	VXuIplNd5+WUJU6ae7uj+lpzdGsviatcQ2SO1O+ggA0LU19OqdI+KeMrCvX4TIobE3mUL06mpKxqg
	FlD5VkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgxN-00000004OJN-2QCS;
	Mon, 08 Jun 2026 20:52:25 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgxL-00000004OIz-2w5S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:52:24 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-68d232ed3f9so7799508a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780951942; cv=none;
        d=google.com; s=arc-20240605;
        b=SCKzMvO5jRREBAx+feJmmslETGZwP2oGJ3RmgJUCm9Culd7rl87FJAK/3RywoAv2hp
         v0QIQ8rFFAHVoNIxlPgQeY/8F6mlthnYMUpFQMCvVE6Nuha3Xl7RcHc7KzKPbLfTcorb
         O917EVCCgTsKDT4GjEER3owp7ZDPsj8ptu3fz8jw4waayRJZTutKqbY+D2tIk8G7D2Mk
         mIA+vS6oWLdfEYZPXGM3h5+GIo9zK84UKcHm9r/8P71knJFt9yN0w7r+bQBVNNobbH04
         7i8JVb77gYGkeUr8SdG1MRgnL+85XYmGs72koVybsFfzprtjpZYmK9fyartwAc0eP6Dj
         Wrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W25ew7OtPq3XBskzl76qlbOu0FGmIC+E26EOjAY+RgA=;
        fh=aJ5K3QoQy7++QiPBHtjgqB0bJkcN7vd1f7U9Jp128QM=;
        b=Lr1aBCRAzRAgcMnpnN8u1BDcM1CHpGIi3TNlWX77N2jykIeTmrmhDDgLBJhES+ex8N
         a+YvoHVS+ifdQQnjOLj15Pz3eJWGfUNlzvA1xanhYPG6HyC4ai0OWkwHQyDS9d/rRH6i
         pHMg0bHBVeYPhMwNJkSeeN5fn9ca+b5qfFuAIRCp1PMHye5PEJLRICPHliIRn9w5mXqh
         jkwsoh79ieIWYxgX8nfYePfFj++P/Zse/lC1kvatKFCz594ZqoULE7lg3u5rUr3eyXRz
         bO/1TosoM0tZTs2Hox/CcTEVNvUBPhhXV5WfKTQ3ph8uzVDiT6eVsX4ZljWmMne0s/uu
         3GMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780951942; x=1781556742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W25ew7OtPq3XBskzl76qlbOu0FGmIC+E26EOjAY+RgA=;
        b=kS9K5FenycvSR2GGOuALX7DjBuOtGHg2gTq2x1ADCK34FwAIGch056diG6xzAhorZb
         BShUnmBd5l9x7VmHhVS4maRDH9yQsbvil+xaw4h2CgIfKZ37ootDnvOjhrFogrgivHCS
         ninYjnIihU0MLpbyBYr7ENPubwko5BNLLM14mtvJ0HQ3UoBovS2BRBXp7veXfrnVw26X
         IHJQh0s24EIeXDU/VOCpr3yQLRg7xVMfxy6/PdeDmQD95YGH6WjEtIPDgUf8VOeVh3Ww
         k0/5Yx+cZiCACdoOzdNGQNByuaU4DE3nBZuiGFCbxM1ggTjqDMLIN2dvSsEXb3DIDyaV
         fI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780951942; x=1781556742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W25ew7OtPq3XBskzl76qlbOu0FGmIC+E26EOjAY+RgA=;
        b=nGiowqZjq7wm8UrnrJmJCTr21o3rkoJmctlmXRirngBWmDnqt3oAvWD2hzfKx+eR/w
         7/vwAO7A9eRrtHl2B9uAbHrXeNCic8Xs42kuBuF1dXFFs9vH8+Abogj+Eiry+Q0E7CwZ
         OYtKMRzIZAUqWibGe+8C+hn3B7jldra4tMhnmllI8MHteouLVpZ9laxZtrs9pGNjwGne
         ErHZWuARAzX4Y6aPHVVov9/LAd8L4WRzjI0HaSfjOWQUyTys2wnrQBHuVT/dSUfpxJiS
         ymww1rchgiXj+OTpkIbzn9AKSIJjTKq+JvJKatEQIxHq/mcHAjxQwacbwE82BXzNXvgg
         yWnA==
X-Forwarded-Encrypted: i=1; AFNElJ9NLr5AHLp4wQacFIyIWlX0UuqeSYipfnfDqWx/JeRJm7OeuXyBNBOhT/GqtHKhEJFy/Zlf5ahUSWgOaSrTtlkG@lists.infradead.org
X-Gm-Message-State: AOJu0YxKU3DQg+n+ekGGTBo1Ac758Gwtvu+bvm5eXylGtrlipV1IjsEW
	9OL3V8C03aQevhRXA8bwIzthPwjGbc9bqGNjDXwQXXeEbFgyWUjz6KJwWbPIu9RVhY4j62Hu603
	3ajn2BLp9Fck4HvJ4AHBPZO9Wu1cgctE=
X-Gm-Gg: Acq92OETf0xazp30JCasD+WixoB0C4Mfo0h6xekdK1oBntuzGVLIyCMbC3JRMw/f1+F
	3vi2DofIVVoOt3VhhIeyxXOTf+T+i7rjRK0ORF1UMQbD2VMtqLBSZOqdCf5o3+X1qd4pOYlbiHG
	znUSbH6WROcGYJuPRWl9HOR5QuROpP1Iw4iSMv3cGizWxLU3HHOXTGPKJnC7Ta3VqCjIzLqoGMf
	jCS1Cfulvm5ZWttEmuhhK/XpE2UgHoV/NNYHWlAODsmZd3OBWCXv9hLVBAtuUtv0Jnj1RMLzkCi
	zkBFdJm5a/OKvElHRrwEcqj62DfOdP9NfWgAidAEwXUWCGvhJfbiCyW5ibc83WrHPF5Qtt369MR
	rYWOs9P0WivP8TdpXmvsi82XHiidcXa1x3p8YhkALb77cZZT1UcjahMTvnOqkrxe3XY+h
X-Received: by 2002:a17:907:989:b0:bed:25a6:1c89 with SMTP id
 a640c23a62f3a-bf373407e0amr899008466b.25.1780951941373; Mon, 08 Jun 2026
 13:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260608051829.7390-1-rosenp@gmail.com> <aibs9gb5M4-gbCFY@SMW015318>
In-Reply-To: <aibs9gb5M4-gbCFY@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 8 Jun 2026 13:52:09 -0700
X-Gm-Features: AVVi8CfU092ys9IKRz0NL8aHFjs8GUJHMrxAGBkw8vKo0ocK4JDhwLaodGN_EAA
Message-ID: <CAKxU2N9cTuhj4WAu98+6m3qb4Yy5NwZQHcnKUa4ra86+M-S-cg@mail.gmail.com>
Subject: Re: [PATCHv2] dmaengine: st_fdma: simplify allocation
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/STI ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_135223_755455_16A71138 
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

On Mon, Jun 8, 2026 at 9:25=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> On Sun, Jun 07, 2026 at 10:18:29PM -0700, Rosen Penev wrote:
>
> Nit: dmaengine: st_fdma: simplify allocation by using flexible array
that's in the description. Did it that was to not have it as long,

flexible array member is the proper terminology.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> > Use a flexible array member to combine kzalloc and kcalloc to a single
> > allocation.
> >
> > Add __counted_by for extra runtime analysis. Assign counting variable
> > after allocation before any array accesses.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >

