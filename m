Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B2DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMDqtfSsgswAHK2zMki+icWH9z9g6NMe+d35IYgU6n4=; b=iUNgBIof18SaEMgsmIPbupRnQY
	P5uCvOw1vqwEcHuT4xwQGa7QSKOn+UDILfMrNFuPDgDARPaubLBB71ZYMkffilSWkwiavL29fU/LQ
	I6POQrbOuBbP/USHS+GdBaAwWawZENxjXxgWpmjsAvFefw7c8m+JL3kp6k3b5iqL62/3PxwPkz538
	X82BMHRPfNYHS3KLl8UP/qY85bRDAxQDzBEcx1kfIrjO6x4rl6x65VrejoE7Sq3vMhcVlE+e2dzFp
	62zs4JDQ9HXK5f1qwGRF8SYFyCBZoj7chlc9GQNlwFYJwFKYz4gXWTAKhmLptOgk+lgmPUz38Ma++
	7sikL8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u807c-0000000Er6G-24T6;
	Thu, 24 Apr 2025 17:12:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ztQ-0000000EpSS-1wma
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 16:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XMDqtfSsgswAHK2zMki+icWH9z9g6NMe+d35IYgU6n4=; b=FA2lB/8C9ek+LJPwl5uWTZEpQo
	SRJ4lBJyRq2834Y50/cvEhZy7PQv/K8VkKtQDGt6nRsct7qrzR6RNFijXqYntjw1l7TMHINbQ8I0T
	Fv6neUFj53XRe64ZVdEHKJnoKvpv/KT0PN1v1bK94HTd70oOkQZD+iM2W310h+NL1YoQJ5KEyjRTE
	EM8qKTLMMx6ZLDSfc7yp79COJ+U5efiP3/eeaxCZQInP5m8/Wg44XxbqXgRYOp6ZMyPoRk4knueVA
	wSHIzxX1nprWX4kR8MHYbXYG8CZa0rw5xyUhnsBcrQ8bEtBvNSqZW8BduY6i/gnpyCN7NFnaNEfHJ
	/umCKsWA==;
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7ztN-0000000BrmQ-1Ihp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 16:57:43 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e694601f624so1008628276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513857; x=1746118657; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XMDqtfSsgswAHK2zMki+icWH9z9g6NMe+d35IYgU6n4=;
        b=oevzVmkMjDoEUKJ7wGdQz2UMwlWg9gJfIVkcD4N8Ys2yyN7mVVWLH2/N3QETM3NAcp
         As3amstjeBHl5pkUYUPd+Hq/oygD++Pezc/YPwUlGhGlWw/4BPgYGFTSn7BfKXFgQJ1b
         sTlAIGnTE2LDOmEo3RPNj5lPK/kmjsiYb2W/gp6a0G0fjySc+3P4/xX1P7QEQb3c7A2N
         H/VUZwtnxmglfZ/KxoEBQiRriwgbiotTREt3j3XMKfiuWMOjOuMVaUCSEBnb/ERxU8o0
         LqKVgPRcyML9eW+rUtYM6Z3DyD9+wxcVAz0IyJKzNqZHu/yFTXNrzW9vx8d4uEoqiHtm
         hwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513857; x=1746118657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMDqtfSsgswAHK2zMki+icWH9z9g6NMe+d35IYgU6n4=;
        b=uYmaBZAPuJOAT67OxC/r+e+9HZLXDdmfZAnAAmwPqno8mGTkWXEj/xMjBK3JH6YID5
         qnicxsNVhNeFLm59RCf9tqN/U0hupB9jOvFOXnNTY3ACZmZ5fzSJpe878BcjCKRd5esV
         2vp7YGsBNyUeve0sTepdOW6NjZkcOE3qKChNRxG0HcEMQoojwBSl8+ru3DToiHWB1W+b
         Qjv6DIyu7RCYarKafbul2nZvhLlo+OfI/0kcM+j99cSirPwscfOlDL/uX6Zo8qRzzwzn
         x6vfaO6J5YZHbRJdDYhBYjvMfVzeWZ3UqzlXc7SgIyZtHcPrmxFYfszipqohSo/kXebR
         h80g==
X-Forwarded-Encrypted: i=1; AJvYcCV4VjMLE6zRXZsKLtQEt3z3cjMSPEOpcin2ZG0DwSD1sFjvw2kdBedrbBMXcXqT+yGWj+IMZ2Xj3GiOX2rXsxHR@lists.infradead.org
X-Gm-Message-State: AOJu0YwdkMzSxku78CExFgaKU1cv5O8dAPyzaEyALPBo1s7joTtT5mkd
	7ScRk5ziTgKqsdcAeG0AfkMPOaqERkIX40UFA4qiEZSSl+xjVCokNL2NemtUSnejXmv13LqQ8VD
	UWgUJAnzw9TDXT5I4D84hFhaPmi4j4mMcSMdlgQ==
X-Gm-Gg: ASbGncurL1IzqRBOPZFL22lOinLwcI8OmrG+tPWx5yBk9mK4LjReE2u4fRDouCwigBq
	ius+px1MYkqcAogJlFYdMcUL/qTdN2YQBF7EqnxADFBN0OnCsKikA1Rjf+NeQ8rvLuUn4wg/SME
	4vXKz2elp49anOJIr1q39kimc=
X-Google-Smtp-Source: AGHT+IHIsM0JcIVkaYurwu7Xm76aeWCRBd2kXA94L1zA7HY4+kXgxndqZ0iWhzKWJZRbPN5Psmgt3hk6PaDxQyb1LIo=
X-Received: by 2002:a05:6902:13ce:b0:e6d:ecfc:2328 with SMTP id
 3f1490d57ef6-e73034f04f0mr5006786276.3.1745513857331; Thu, 24 Apr 2025
 09:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:57:01 +0200
X-Gm-Features: ATxdqUG-Jb1AZR77fk7uAdSggUmnOFrjqf9oHFUx6Q2HN7mjbQy7Up3T4KB7Soo
Message-ID: <CAPDyKFob2wB=stDXLPG0VG7mBso4Hid32pXpMvaP6WPbL0SyEA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Power Domains support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, fshao@chromium.org, y.oudjana@protonmail.com, 
	wenst@chromium.org, lihongbo22@huawei.com, mandyjh.liu@mediatek.com, 
	mbrugger@suse.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_175741_413987_9716F1F1 
X-CRM114-Status: GOOD (  12.36  )
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

On Thu, 10 Apr 2025 at 16:39, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the power domains
> (MTCMOS) of the MediaTek Dimensity 1200 (MT6893) SoC.
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: power: mediatek: Support Dimensity 1200 MT6893 MTCMOS
>   pmdomain: mediatek: Bump maximum bus protect data array elements
>   pmdomain: mediatek: Add support for Dimensity 1200 MT6893
>
>  .../power/mediatek,power-controller.yaml      |   2 +
>  drivers/pmdomain/mediatek/mt6893-pm-domains.h | 585 ++++++++++++++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    |   5 +
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |   2 +-
>  .../dt-bindings/power/mediatek,mt6893-power.h |  35 ++
>  5 files changed, 628 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pmdomain/mediatek/mt6893-pm-domains.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt6893-power.h
>
> --
> 2.49.0
>

Applied for next, thanks!

Kind regards
Uffe

