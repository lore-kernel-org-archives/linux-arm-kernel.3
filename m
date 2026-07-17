Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFB7C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9JLMkioJnN0QXjgGUJz/nVcjRGbLr8tJwMUzl8BySM=; b=gjnpYQXIg+kLvsqqIfxEm4VDfQ
	whaIhI033KxjmOCzgdhjVdNfG4fMSMkilDKZqpzN/yqREqKgHV8eJBYltX5ruDoy4tA+EH9CEL6qS
	zZSEu3GakgL9S7evkBtwncGpGrK0kLqnT7j1B3XRMg8nMUfJBcQgmg3mz4T3xHgtpmLDz58/rSduA
	iM7HNVr2ovf6zR2vLdhFuzL9ULgKXGA8y0m6UuouTOWXFhdnFLp3HavujOEgGPBuHJfZwGwjGVFo+
	6jC+5WUd3/Fm2D62MM4/GfoclmBBt7Ng/Ef8gE6VgY5vTPiMVkgg35dnqqIrftfallqtrt3tHslMT
	g3PW65VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjon-00000002VoT-1a9s;
	Fri, 17 Jul 2026 14:45:37 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjok-00000002Vnn-0ylq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 14:45:35 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so7659897a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784299532; cv=none;
        d=google.com; s=arc-20260327;
        b=lqP/lxXCRAc0abpsPaOnh5C5fop9PKjOjVDblCorM6Uthamk/BiRLgY9nzfEY0y6LF
         CGYF6se5LLAlhdP5Zn5W/hlH6upBFCitVDu9Q8FyIblXrD0vr8aiPiVhmkeRCCZh6107
         G62Yg5lKeI1VcxW3QEDaDD97D1Cev7dkduixj+0QnKVTndgvY33LYZcAqswQ92yRQLs6
         CwGAzB2iQ/rZo7N6qe8b5AilzYFLMnDUjDkDERERT5gtihOZ86EjwisE0AXQZEUH/5bC
         IR9qcnCJWaHWu767f0IARppM/aVMUG5czfqihylFbdJ7BqF7Aud1pcDMMlwqvJWIwisY
         fsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R9JLMkioJnN0QXjgGUJz/nVcjRGbLr8tJwMUzl8BySM=;
        fh=u1DMF56LXiLRYIdBBXF+tQFkw6sS49jxITriMcylFF8=;
        b=d4wNq63CAAIiBEL6d9opN61e2xDoBVpwbcJJqtfFSR6U0HNXGHtcRuzp+2XuPxkqtT
         fG+WOgZQGMbKOfTq6u9ostFqqJn7Rdc7yLSM/Gg+/+cGfq7YBT6FmsT2RJO3O31KP+u1
         ClnXEUVxiA2nCZw/mdJ/p34UApiLjCafShussnljfm4Zd2Kn9gDbdtMXUfC5rL8dyXby
         gwTy9n6vDn8/czZTM6DTRlYJMkIm3oNZ/gEuuZjm1dagiMX1+zjqIBta/OUf8Egskl8E
         f3YgFgHM9SoQ3JXCN3vJE8AZvjF3fvEmBYvFXEpHOLvQbKGbdKtyFV5Tm1XWYdkdFmL7
         kUow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299532; x=1784904332; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9JLMkioJnN0QXjgGUJz/nVcjRGbLr8tJwMUzl8BySM=;
        b=Yv1P8Lj5/OMLBMVwLvYYDZ12/OGTOF1mIQyJ0RIB7PQsFhF+WYFkhWYZi7YAlHyVxV
         pHOPFZJVWcxmg4ZnJ1p+PUimScGx8IcU+9Ht9d3Brvfr5vzkayaOPjuHVl0APTKbQW7d
         X7taVSFgJ+8b+OhjaTDG+7UN6okQqTumzrGJQPvCEKPhxR+mNUnrMFHCJIF//2BYTm63
         jKb/9X/dTyMaw5/faiL1mnq7UFxg84keNjDXVzdHNoVLAcPG3u/l1SSY9Iv9z3Oc9hn3
         rpJWXywwT/n5T7/oEcDYebUXp5ACFW0NIlbRDln2OEMnDTqlSk1AljyHgzOH8AVL9ZHm
         dTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299532; x=1784904332;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R9JLMkioJnN0QXjgGUJz/nVcjRGbLr8tJwMUzl8BySM=;
        b=UCwHdC5ap5kIK2c+I9vaKQjwoEiY5POW6LcBXpAx4GnMT9UlxmyIMgXxBeJsR99Kxc
         /1TIzx8QlWY+uwlxLzdCrTWwoe1Xg13DIJk36mY22h1470it2UFX5k1f4zpdJwwS9yz/
         QfcBb9Z2dNgZWfANWfnvMkps5Sw5vaOvGBfkSyNEtPq8I1oo3akHTz96Os4Heknf1zcT
         UDEI7W1xr14o8NyD6qy3XVnXroCrDFKQUUGLv6pP2gw65qEpRntJLvBqonAHHpBl229l
         uNgqmgXz9REhS73Ox9yfAp0R8PDE47PFF74WQjZQeZczocREO4zqwwmOYCHzjp6dfGG4
         1Wrw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+GATh1HHOUpIlwVirILS05YjyoFFh1bGHNzWCp5FILav7dMbwWK0YEpXjrIk94w5ic5YPimWIj1qw3Q61Bkl8@lists.infradead.org
X-Gm-Message-State: AOJu0YzL9VEwGQVd2C5TMP8xxdvjEB7fi5Vduyc3p7kzlEbOk8VF9oFX
	amCiln24iF4T8Xvn1fBLkdm3/FOJFly3vWaCel13Wzh7PcyejA6A00GaMbptriHi4CFVCDu+DQZ
	EunGQW5OVY94d/D1gvy0NSzYq0AzFJZQ=
X-Gm-Gg: AfdE7cnqTQM1go1sg7uGh/lgRiz10zRf9dmD98yRZaEAIg7Ds85MwW1ziW+TQ4KVWFa
	azc/r/gpjsV/s5F4cvhj5EkG0RzB3cgdVnaYL8AdNSyzRoanruGr3aBvfhki+X6+OLoiigPKpWT
	6+JkqqjyTMRwAUIEPqpWZBd/CWS8a2qvllTSqm7gvXd7nqledybzz4wwTdrRJ6Ov9M3Vbac0xIe
	LnedMMx7wZtcMnef0uVMDa6eA/w1ELoZfwUgvcC1e+oK4L5xgaQJtPD+8A+fEedUt1sh+x4FSvn
	N50JIRQ7wCfl40MZ/FGg5Dt0N8xp5K29ylE02acQAA==
X-Received: by 2002:a17:906:6a24:b0:c17:cf99:6154 with SMTP id
 a640c23a62f3a-c17cf99625amr101393266b.16.1784299531705; Fri, 17 Jul 2026
 07:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260702230744.91169-1-dbgh9129@gmail.com> <aljL_HSIc2ZhVj07@willie-the-truck>
In-Reply-To: <aljL_HSIc2ZhVj07@willie-the-truck>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Fri, 17 Jul 2026 10:45:19 -0400
X-Gm-Features: AUfX_myaGRrmmSMWOxgj9sP-eefK2jevdqq9Y--2ct0cKEeID7Fw27bthF9X1OY
Message-ID: <CACrCO_X2JTb8VOxVUhwtmvh50PuW0Sx7c6_VcwsZLvn2Try9jA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: cpuinfo: Fix sysfs cleanup on failure
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Yicong Yang <yangyicong@hisilicon.com>, Oliver Upton <oupton@kernel.org>, 
	Zhou Wang <wangzhou1@hisilicon.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074534_285943_308A25EF 
X-CRM114-Status: GOOD (  10.84  )
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

On Thu, 16 Jul 2026 at 08:18, Will Deacon <will@kernel.org> wrote:
>
> Why is it a good idea to remove the entire group if the merge fails?
> Wouldn't it be more pragmatic to continue with the group that we did
> manage to create? I don't really get why this proposed behaviour is
> better.

You're right. Removing the entire group on an SME merge failure is
unncessary. I'll send a v2 incorporating your suggestion.

Thanks for your time reviewing.

Yuho.

