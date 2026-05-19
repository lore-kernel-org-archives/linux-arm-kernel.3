Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617B1CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 00:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IO1oTJwzLNJtEnpvkOX47eamVFbSKbRcWswCg+dtq2s=; b=dNjrIghu79v/IdtJfjo5pt/JqJ
	LfZdeFUNCTUJzFci5ncpW41OwsxxtloABL24TXGWhAzJvWMpqVPZFF4Z/5QzobIY7T/aPsSDyvggF
	1UqqmFrf8a3Z0MBZjvY6q6tAitANjoGHmbQhSvQEf61MTh5ua5vLV4Lb4RVMlPTBuj/3VI4asX5R+
	rWJMrQbXcT6Doh4/alFxjcP9zVKBOVmB2QWstN+1LvoyeG22nfU0nabwt/8x57P6WzBIydPwo6zxO
	qCd+KVorhw7Le1wic8Lqav22pXgyWvFrm1dPQTryNgvFgIvHpK0TiCaa+zDU5lzguiBjRYwQzbUNH
	gElIoT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8Ik-0000000HGW9-2QRJ;
	Tue, 19 May 2026 00:27:14 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8Ih-0000000HGVT-3q9b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 00:27:13 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-65e170f1ca5so3015132d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 17:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779150430; cv=none;
        d=google.com; s=arc-20240605;
        b=S4nbs8L6UgTQTlSOn71breslVBuk4rJ+1G3BMQZ4j0brbSoDyiHhjkwydU+8PWYN/I
         sD+rZYVS26Uz+yl7rEJBzF5aX7kDVoqgN4zE0GSF2bOIpvpWw9NeP50kdPzovHryCQaO
         ieOalXrieCyWGTwgmwqgVp+3zMgcNjbzuAOiYYTWQT88z/PXs6miYtTGU1yjnVMaMtZC
         1O/mpfaVbCjuePVGqxNKhV7kc0WaWSlna9Fxraay3fOrNpdRUmVa5RCR4MDkq51j6s76
         +rP+Uzhf3MvL0L+6mscGLfB9FF5Y2RgKIKfzKoWGSc0t7aArFABhR7U4l7XQ7yLi8xNt
         sDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IO1oTJwzLNJtEnpvkOX47eamVFbSKbRcWswCg+dtq2s=;
        fh=9J/TxxZO4DSN1ki/6YVT8qu+O4SU+V9tsEzhzyZn9fc=;
        b=WquPPd59sYjZeyfI+rBLa+ZziduJWwLl25JAveelA6upnd52IRKH3vLKoV39Le7LsD
         hZk3d0TGxA4G23YY+tLm5rtYScVRNgIgm8X5G5NHWvrtyTzF0Atit2dhMY2dgwHR8Gi6
         ifu258Bx6eOWclNGVPzB9AUZUnWh7QPYBNHOP+T/KJFdLL82KuOiyQYwiLntF4Ebdkuk
         5MqiMXB9KcMtkDMN/6m6LadA8uAioQM8wvhOgvM/16O75T2ngUgUVR3xOoM86aJMBo+K
         DMPhS6ucATVq8Rl72PLIebHPAeQHQ0IbYTNaHUUkg0OTjaKVIpvkZnHSxOVa1h+lVG6T
         TfIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779150430; x=1779755230; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO1oTJwzLNJtEnpvkOX47eamVFbSKbRcWswCg+dtq2s=;
        b=DBQEDmSQfhBdwTHQkB22Gy7sTPXbIrnS/3yVMn8fjgpdcI3K67MUkYUqLcy+9L+xpk
         IxhuOpMnRSBg4DGeDOI4PkkSyR904JuEwQzI5MPIafOium3jW2/eE80bNdtZw99i52oM
         bIuoCJAymCCt8r3yWSVHzxJzjYcV5I/DRcpeE4vKDxZfGNp1JS9x3oic5/IrNrr9yDuZ
         +jMIAsv0LFuR0GzaXNP1mwtQ9WWw/t2E/YZJY28281h6B1kjNelAqTjUI2AFcgYc38Kt
         Vo51SZPkzn6YLqcIexhhEi+Aiv5/TXxn5Ae2Ii8OXMd6oGUMK5gydx8ZkP0vs/+tPy5R
         SimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779150430; x=1779755230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IO1oTJwzLNJtEnpvkOX47eamVFbSKbRcWswCg+dtq2s=;
        b=VyfNaGohomBSH5xg3h36cRs2Q2PExSmMe/ZXEhWjPcSci8ewY+TKxk9HY9a34phJ+N
         6aUgwtnerZkdVlvDbflWqX63/pDUG9Jesvi7R0I4if8PQ0jqSX3wvQO0MXVMpyOwHU4F
         SUU3j5Yv/DRXpwq6S+A1Upnbfb5c802YrT8VruQoYdzsHWRlwf64czAa1J7ztV4aGp3e
         3lao2dRnW/Nx1Dc3+gm30cDTZWYNZMfMaA+678nnN2GnBpCy1VJcRd/GwN2eXFs8FTYk
         Ob00paIX8XzBWgY4or2sEN8ObI/K56fbZw6hzoBiDn8zsXeZjE5wIW9SIRqOiEXsA5kr
         a6AQ==
X-Forwarded-Encrypted: i=1; AFNElJ82sAWQj0ZZWDZCqGy9yszOEUIhToh7WyIbCZdCB6IKqbKIcMKprCHr54JegKuUOUd22MLlVQgqBF3tgWvdkbUL@lists.infradead.org
X-Gm-Message-State: AOJu0YxHrsjoB+3NKfXAAV6mGCbU4zurQyQ6zjdOkJce+BCHphtD9JTU
	o0aOoF10MQY2F6vNVxzk/1sER7kMHDG3Dftb/E8/N6OimQ41lCZMYrsu1Iu8kkMM4KabZlC18g6
	5F6YWhMqvH7NlWCT+IgVVpph//TPgYZA=
X-Gm-Gg: Acq92OFOyefozj7mChmv6A3Vr50lv+AuKoLgIoTdp44MmP/ju6vrL2x9mZeaviQgS2u
	zzPUBsa0JqHx3VGwFViPVU887VEfAWpcCbq/OXWij4jv+JFDUs3bUCTlQ6c8FNTOY5wC+HddBFR
	zgjp7Jw9zEO8S/QgwpTxXIbLfl+65Wu+9smZrDi5wv2luRvicvFbmLlNdq1Nn4cViJln+kdZ20i
	lytBf3nYYG8f+1YjFEedoT+u06NXIFEQ50TQxFlXgXngPyLNmpc9DyU9txojAQFEdlJUnz+s1tx
	wpZwMkWe24OgDDb6KRyOQsdpFIcyKen8U9woWkQlTZxMVog=
X-Received: by 2002:a05:690e:138a:b0:65e:4447:da64 with SMTP id
 956f58d0204a3-65e4447db02mr9902073d50.50.1779150430274; Mon, 18 May 2026
 17:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260517181331.367676-1-michael.bommarito@gmail.com> <outz3fxn7c5tkfz3adoilikhtyjbii7qwxmknh2l4pdf4kv5bj@54lpduy2fuj4>
In-Reply-To: <outz3fxn7c5tkfz3adoilikhtyjbii7qwxmknh2l4pdf4kv5bj@54lpduy2fuj4>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Mon, 18 May 2026 20:26:58 -0400
X-Gm-Features: AVHnY4Ku9jWfRwvIo7-h4T7kNEOsQvNYU_4O2yUmyt-qJls2SXN9VP3G8jsJ6CI
Message-ID: <CAJJ9bXyHRVqnL_n6wwyAXDK=1GmaKgDy41tjMRhXjTObbft7gg@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: vgic: free private_irqs when init fails after allocation
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_172711_990830_9929F44F 
X-CRM114-Status: UNSURE (   9.76  )
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

On Mon, May 18, 2026 at 1:31=E2=80=AFAM Yao Yuan <yaoyuan@linux.alibaba.com=
> wrote:
> Ah. One thing I forgot to say:
>
> Do we need a fixes: tag here ?

I struggled with that a bit.  Will's sister commit in 250f25367b58
didn't have a Fixes: tag, but if I had to pick, it would probably be
this:
Fixes: 03b3d00a70b5 ("KVM: arm64: vgic: Allocate private interrupts on dema=
nd")

If you agree, I can send v2 with that added

Thanks,
Mike

