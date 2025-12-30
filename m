Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53FBE92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKB/MFi2JJNcHgRM1ZVpW/6k+K0ih/df/zx7AJgRywM=; b=cC8jNci7+yuy1Eakejh8r7U6fu
	gwi4tg+NjgZ1Wi0tMlq4Q6agn6+fB695VIrh5ZKvSAW0mEZ4/dgasBHYtzp4n+dPM8fvBIy7hfRQg
	CrTYeBrGjeUSYDiuJPrB1vOhTqD2FwPl8rdn3eanWsNypUrLZQ2iYHVO6Hmlh0HGkdsyD3n+DiOjp
	9HE9LQBhg/MB9EAiGLJJBiZRUmN9xLWa/hlKVZlYYe0l3OSE/8ASLL9bNNrxf+CKVElcEYSRAultX
	9jBXW8it6ForVhYylsZjAhxFLIWkj18lL1WyOI1eKdfjUiv2+ipdjXB0Jaqj61L1URKOevgl6O5Oj
	RJI1nomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPNu-00000004IgP-19MY;
	Tue, 30 Dec 2025 02:22:54 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPNs-00000004Ifw-1b1z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:22:53 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-be8c77ecc63so14730393a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 18:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767061371; x=1767666171; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:user-agent:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dKB/MFi2JJNcHgRM1ZVpW/6k+K0ih/df/zx7AJgRywM=;
        b=Tjn6PeV4Tlwg+crYl11LGOstO9pXaZyP8UIULzUKH27XV1NaFx0bQy1o814Ltpx41+
         ZQuAZXYh7HS9z72VuWLb4zZ9hmLjjKKaF8ZYFIdKhv+TEjk7qU6cOD7LtAi0Q6rxH9NT
         VlDcD0DUTbkB5ACoiuNYbR6SNlEW2LF1abYrj6X5exYGIXxZuSW1B/D3b1d7ExAU2dTn
         sJIHpAftRzAxIoF0/HkJVuvf8pGFXkeU+eHgNvE63yLHbFS0WWMheW3ScIRq/Oww95oV
         uOj+nir3g7yJ8IIyXrY0DZxUlDRDSNouGh39XUDNZIDi+CxYrvZpGAAf0NwF6Iomvrqs
         +ltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061371; x=1767666171;
        h=cc:to:from:subject:message-id:user-agent:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKB/MFi2JJNcHgRM1ZVpW/6k+K0ih/df/zx7AJgRywM=;
        b=HbkBKMsrtbymvqtQdba+vMqW7EUmfU0sIASFEdO5S+NWznhhSlm2tFCGmM5J+V+eLi
         teYv21i1WzAsoT/Xg8pWLZZ39Ra/DNud9/qxnt7E2SLjVEUhYWEL1TZnCEb42jHFbRv4
         iJMpo3cpNz+qizs8UiVlqUB3d2A7qxdMzeGAwIpxUA6AZz/wCI5CdrB3ykmyIdRJju+/
         z+MD6tVshjXbDkO5WKxeEY2lOMBAA9pkEM42YT6ruH7VyGMm1qVZGUMyYI3aAsxb2Jmq
         Kac8R+yZWTyxL/HZon6Ms+byvWOBGEgmCbjpLtbgWAv8AcySZ9bWbITo+fOW3kwAMKvi
         yC5g==
X-Forwarded-Encrypted: i=1; AJvYcCV4piJixj8HJjy7FnanuzO995qWdzuG0Se+x7sv67BcOpXlKURbjA4YYj52tUPUyy5fJ7yfcVGYoXiKtPfAeSNu@lists.infradead.org
X-Gm-Message-State: AOJu0YwtPSQrRc/WT0qnezsaf12ApHR3QdmYeSLC76WPh8Tt9pn7BM31
	OIgAC/2pzNe1mAry/USp9HXS8zARMjHnlVHSVu7S8mMVhLRernp/wX5XaCztOqjzErWiA7Zu3xL
	M0VllkMR2aw==
X-Google-Smtp-Source: AGHT+IELINBMPFmRxNHDW7vHWpdCROA3hncsEtneXbUH1OrOJmjFny3vsrRGMAMBfntFNvUrUIrN7tzzSSsU
X-Received: from dlbsn2.prod.google.com ([2002:a05:7022:b902:b0:11f:300a:a308])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3718:b0:119:e569:f62e
 with SMTP id a92af1059eb24-121722ecbe0mr22094565c88.39.1767061371145; Mon, 29
 Dec 2025 18:22:51 -0800 (PST)
Date: Mon, 29 Dec 2025 18:22:49 -0800
In-Reply-To: <20251205-stable-disable-unit-ptr-warn-v2-1-cec53a8f736b@google.com>
 (Justin Stitt's message of "Fri, 05 Dec 2025 14:51:41 -0800")
Mime-Version: 1.0
References: <20251205-stable-disable-unit-ptr-warn-v2-1-cec53a8f736b@google.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Message-ID: <dbx8ikdoso7a.fsf@ynaffit-andsys.c.googlers.com>
Subject: Re: [PATCH 6.1.y RESEND v2] KVM: arm64: sys_regs: disable
 -Wuninitialized-const-pointer warning
From: Tiffany Yang <ynaffit@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_182252_438915_CA8064FB 
X-CRM114-Status: UNSURE (   6.37  )
X-CRM114-Notice: Please train this message.
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

Justin Stitt <justinstitt@google.com> writes:

> A new warning in Clang 22 [1] complains that @clidr passed to
> get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> doesn't really care since it casts away the const-ness anyways -- it is
> a false positive.

<snip>

Reviewed-by: Tiffany Yang <ynaffit@google.com>

-- 
Tiffany Y. Yang

