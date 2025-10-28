Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BBDCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyYFRQojunl/tRzwlh+ac2kk1NsYLl4yZPYrY+iaVBw=; b=lzu+L3gdg9scqtcpqyaVbxOcH3
	UOTfTEGrnEcHAyMtaMQQSdPPA9OE6EMz01BsAt+7JA5nIB7gJ3A581flTIM6VpjDmnSsxF6+taWOe
	BlKWaTXRTT39410C8FJd2bQBq1e8Sa6Au6g2cTNH1i93P7AsxPLMpfXjqoAfautZxt+2M3CYx6LKo
	WUa8i4xXpOSePAUlFNvThjR0Dz0PCchLhghT7EgfNzVB0zVKL16R97G6Z0GEepEi7zY+fXRJFGM/4
	mIBYOb5creGYIksqrinRQ29PTdRjw6PAd89ho5vWI7V0xNpsuGIAl/KgWPTHD6n3cQcMjJFfhGqBa
	HvCkDMCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDh8p-0000000Fm9K-0fr9;
	Tue, 28 Oct 2025 10:41:27 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDh8l-0000000Fm82-3Bob
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:41:25 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4ed0c8e4dbcso125711cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761648082; x=1762252882; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xyYFRQojunl/tRzwlh+ac2kk1NsYLl4yZPYrY+iaVBw=;
        b=ewON7gnAn5yVJFMCzUYHB4F/6R451kYeIjn6CAShBv9SyB1AIXIBVhDjCNGu7z2st9
         90SGdKFNyPgeDcF3DG7SjvFglhE4AATnOHXBvrh3svZxPu+mUSy/wlupmhnN2XsR0Olb
         +FkAXFHKGgGAlT1ETXFRgbL9hbPi2e1WbgtwzHVm267MDrWK4ObGFC6LRkCArXOsfom0
         tUKoUaN+VgLJZXL1cyGE+lUyqxgWGE1x9qREeLvWm06lUxT5UAClkHX3z3JT2GLYqgZx
         XdrDvZdejkMYpwTPPWE1/7XqU6fRGyaYqpk3B1s77yIbGWThrSAERNEBV6YOFPBWI39/
         gCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761648082; x=1762252882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyYFRQojunl/tRzwlh+ac2kk1NsYLl4yZPYrY+iaVBw=;
        b=cO1IOuwEoHn9OxuroIdpXFT9eUZBXEWqu8TG7n76auI9qFO+PMao9Ex1vzDvyVFs/G
         QFKdAmifjJf0+rvg8aDA6YD6Oql+MZ7pwHESBlT1YpI/bDdIHC070U+uo3leb+yhhPK8
         s9oeO82GmOOspMVwmCx1Xd+OF4CPvYDGdmruzCH4Sq+L7Km5on2Y5ws3AftzqtsRB4vf
         CnIhreAbnLpIiij23XQ0JDrwQ7xFkU7iQv3AM8JrPfk+QlWIJ2pWagWOmlrqGGbk5D/Z
         R1G6TMz/tLq+R3z9xifEMUmTPuE7wREsLS+0an3JsXzJsercaPtRFji+DCXJI9AjqT4Q
         aDPg==
X-Forwarded-Encrypted: i=1; AJvYcCXf3uObgQz70jPzcCBgAoTQeupXjF6GaDeRXEATp298X0CHqabIjEqK4WlnAxosv3MB222jCi7BeFoZFdermYLc@lists.infradead.org
X-Gm-Message-State: AOJu0YzY9AWFxptOJ1cI9+dPcsbVwsAIyEKzgqvyzd9soONTTj6yKLJ3
	V9ImQy5HgB9/y/76X0Y62CA4gHEvOxuv1K57mPYtC/HbH7XwGdYq6gtpRNbp/9DyJ+Rwe2TmlnO
	c5FDhWpHk6veoMCD1wS52DuhfndKQoaQtzCgGfTrTXTP/jT/TGx43US1VCv0=
X-Gm-Gg: ASbGncvnixE3hHmTibzhS8Zd+di8PeKXLctqrpXsWECZhxq1pBg2m5f5D4ra3jG/C34
	S8/eLhVXdEaJWxh4OCoeryz8qIpS3VtczIFKpK7z81h54g18nzV/0F0ZZ+jcjnplYDkYuwyCofD
	lmFiNrPXC1H2fzppUW3gI3xWfPVxiJiZdOQfJ/hnor8v2TigVH3Y+I1apxzSot2d3UZf+VDQUq7
	OpWda6zUMcoqNAlzamE6ZewfZKLxFsTkQeJ5pk8cd1lC8GHfI5Q6yjuooqUXaPih63GK2CuFtSD
	asoppVSoDaJXqxV6nYP+BhaU
X-Google-Smtp-Source: AGHT+IFFXfImVcBC1aHOTYgWrMceC2H6PeDXVpaOsr5+gplZ8eX17JiVPPiMcYOXVyoXKBIZ0HHBi2NKdR1/MprdqkM=
X-Received: by 2002:a05:622a:5a98:b0:4b7:9c77:6ba5 with SMTP id
 d75a77b69052e-4ed09f7cbd8mr4751271cf.15.1761648081564; Tue, 28 Oct 2025
 03:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251027113943.1282568-1-tabba@google.com> <20251027113943.1282568-2-tabba@google.com>
 <86zf9bux8m.wl-maz@kernel.org>
In-Reply-To: <86zf9bux8m.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 28 Oct 2025 10:40:44 +0000
X-Gm-Features: AWmQ_bkrWFTx10BG9y6-HIb1BAzsBhsUUbx3Qvf6bdqolNIIlbJkOOCnpYFIwQ8
Message-ID: <CA+EHjTyBSmKCpiBQPRV4joY6Qxrjywi4zseNzqdXejr+KmPG+g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] KVM: arm64: Switch reg and val parameter ordering
 in vcpu_write_sys_reg()
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_034123_804869_A6ACEF13 
X-CRM114-Status: GOOD (  15.08  )
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

On Tue, 28 Oct 2025 at 10:38, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 27 Oct 2025 11:39:40 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > The vcpu_write_sys_reg() function previously used the signature:
> > void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg);
> >
> > This was inconsistent with related functions and macros such as
> > __vcpu_assign_sys_reg() and __vcpu_rmw_sys_reg(), both of which
> > have the register parameter before the value.
> > '(vcpu, reg, ...)' ordering.
>
> On the other hand, write_sys_reg() is exactly in the same order as
> vcpu_write_sys_reg(). I think that's the model to follow.
>
> The __vcpu_*_sys_reg() helpers are internal things, really, and if
> something has to change, I'd rather change those.

Sure. I'll wait a bit for additional comments on the remaining
patches, and respin changing the order for the __vcpu_*_sys_reg()
helpers.

Thanks,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

