Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085C8CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ER+F3xEHsxIRSeDhr0LK2pONxqBKiVac5jIT+RvNPAk=; b=B58u1RG33Whs3l
	zkOX0WJT81S7aD/P5XN5ZR6cyEVZVD9WZrTLsJg6NEBd54gqK84J2Uu5pOEoQ6Du8uHqeFo1kqfqd
	7gx1WGtzh/+ouzAXaIB3FwCOSfHXJ/Yq7ZKTuguZZnqGx1/KN91rLdN7O+XmAeQODT5OrROcXM+Qr
	Rqn9go9lvhb4ekMFAMheDlPGEvhbN04auGY+xqOd7oRWSyPspfkF4i441nh5monDPxgUKRQYYiDmW
	moC9tZY5uypexlW9+FRsal93NStBBb3k7AJ+K8wsLLi7jSb+xz9BwoBihYJofMN5CkaH30Kqv7U25
	MOzXklDomMKLcWg6XEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Uu-00000007EDo-1gWB;
	Wed, 30 Sep 2026 21:05:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Uo-00000007EDF-04bj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:05:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C389543B82
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E621F000FF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790802345;
	bh=ER+F3xEHsxIRSeDhr0LK2pONxqBKiVac5jIT+RvNPAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nNAMFkfKSs18dBdBOKggDv3f8LGpv1riN+zyKRjgKs+/NhZ/yTkTCFyWj7B22ZKgZ
	 zI+71q6eAXZaGZ084OInR4ibiW3ae1Dpi5SWyeFLE1wi+cqfJBO0/ITV6vhIkhSDfI
	 gqV6rxdTBrW8K/AW6S9u1C8Yjvg9hPGUb7ANg4Vx5Qxw31Arv7Ujr0QZJzBA+8TCMH
	 S2CNF1m8542qb0q555ADOxWVin6xEh46H/mXQsTBrbZxl3jL4QQUOFeWKTpFlMsRFZ
	 2KtqPUFH8HAQvBSMaPImUHbqGLGJbhT34I69LAv3TFVHygpvHUggQJICH2qgm9NkCL
	 xnKA3+tkcAfHw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba437ee7f7so144823e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:05:45 -0700 (PDT)
X-Gm-Message-State: AFq9FYJxg9LI22Xx+RGKNw2c8jUipJTQ+GY698ukF6aA0tiZA2QrajE1
	Cpb/yXXKeTv04z4Fg7Dnxc4YO5YHJJ1fHywgF0IiXCFVVSgUZ4JUA10FmivA09AHCDeN8fVDVBV
	WXFqSgyS8oHc3+tQyTgLKj7xTNFXTbgI=
X-Received: by 2002:a05:6512:239f:b0:5ba:37b8:863b with SMTP id
 2adb3069b0e04-5ba405d871cmr1080051e87.24.1790802344493; Wed, 30 Sep 2026
 14:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-12-will@kernel.org>
In-Reply-To: <20260918161407.2300-12-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:05:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLmt=anvUFgBiJ+_fCanJNDUjYBXTnzG+5RznVhSRPLssg@mail.gmail.com>
X-Gm-Features: AclHuK8POyE_ScdYrWu5hccCf2RiateK4KazdH0tAmqAHtpYIkfp2xNzMS6U_C4
Message-ID: <CAD++jLmt=anvUFgBiJ+_fCanJNDUjYBXTnzG+5RznVhSRPLssg@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] arm64: percpu: Annotate __kern_my_cpu_offset()
 as '__always_inline'
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> Allow the use of per-cpu variables from noinstr functions by marking
> __kern_my_cpu_offset() as '__always_inline'. This will later be relied
> upon to detect stack overflow of the overflow stack from noinstr C code.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

