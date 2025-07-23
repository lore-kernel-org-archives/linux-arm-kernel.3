Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E63DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWJ1vaC9mhdphahBr4AxdkgQcamHOy69P9zg4SNDFJE=; b=Uw0IGz9tMNifTTphTtKOUAHrkk
	1nfNGD8mew7SLKbSkcExCTIzT1RLpJxVzBkJIOyYRoJ4Z/N/XP68//1sS71z4ar7hyPBtTVHWoLuH
	JZD09wQgGM8QltJJTuv+2egmiZTeJ+vdEmyn6uJnt3RxxZhhPy5qDS2PETOhTL4c4FFyIzxXh/b3v
	UsxryIGRkLRxpr22sbV6WX629jw1WVkkqIBoTzER5lbRkGX2pnFNe458/PRlWCkRhK+NTxOCNX4zX
	fbxxckoZkxxdVupenl4qnG4c8+P2MX2QpMOSv4WX5P+M7BoCotrp3/Bug6EY69PlrDtbncYaduzVo
	poHARnhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYuU-00000004waF-152m;
	Wed, 23 Jul 2025 12:49:26 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXib-00000004ojF-2ZYw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 11:33:06 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55622414cf4so5734914e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 04:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753270384; x=1753875184; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWJ1vaC9mhdphahBr4AxdkgQcamHOy69P9zg4SNDFJE=;
        b=A1ny37NXn8/xYQ+AJwsidc0dENQD+8kF1fnStkIjIXhIoQ/HSrR2NcX9PwmIVqL6iq
         SBnbAPKuiIaQ1L2E/Cv6kw1b6nemxj5yW0u0tNgKdUw6QXGRUYEJuzQio2defdgiTDYm
         lthMMGw6vHLz7UhZEv6KlnRssaI5FtdwB1oSDyemydcSUkIv9wk0zSuCgG3wnmEcZbVi
         TASLDHJIkt3FjuVj+YMViqMRHNUiG+ipDhkBvwOLinvCR1KddVq+XM6zUviuIjSKUkgV
         kbYp24LcgX2Z8TKdSuzm0u6Rmss8vqJC/zfVvjqYW8791rz+VjJc3LQ+bGN6tFjMDl7Y
         KpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270384; x=1753875184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWJ1vaC9mhdphahBr4AxdkgQcamHOy69P9zg4SNDFJE=;
        b=kNVWFX2xSAIPds7wKad2lqtqxn3/C1WeoQiKnF4pQMhL7nNhYERzXpJtc9yE4S+7Xj
         kpcjDlvW+kUHQfvn7W4Fa7N/FwdVvxOukpe6KdFwGkYigIai3f5B6oBxCAmqmWZMBdBm
         RNBjhjQb4dl/xqsfX0nlNv8Ax789Q3bYpRnpNdcGoHCDgrp258UTlyOfqxrWuDeCXG2n
         eyRpVNDOxje+vC8jx6EBXDJeg0+AIR7TxEe4rjgDziF4EBDYK5/q0TsWPvR+bi6hG0s7
         QDqejSLFvbFEU5u84vZX/AzwryfWZT4iu93rUzmtlja7ZVdXndL/ChRbNSu7acpMc4Jo
         /kzg==
X-Forwarded-Encrypted: i=1; AJvYcCUXgCbeovuNrdUI8XYmAb3RVkPPa/6UkHgebbvVSRIqaHThf6DDywnI3pXtSFCp5/s/QtQHzmWcQ5kfiRynsL0E@lists.infradead.org
X-Gm-Message-State: AOJu0YyOjlwqeo6GYUw4GEgg7MMVn+O16VjyQtIHFt1J/vMAzy2V2IbB
	uMRoDR2rU/JFhdcFS2SrBIUzudAXrW7Z7SgpmPEZqHzJYp6FMKkgz1MGiqipY0Hb8XBqcn+E5Es
	cruoxKMfsV37lDhCY1QBvR0J7441LU/wJEm0pzsylEQ==
X-Gm-Gg: ASbGncu6t0uo4+eCao561fMyxhCtt9/To/G6AES/F3abUgZxICl172E6oq/q/dHED61
	g6pnoKh51Hf0ZXjJZP1bUifoNayyfUcfm8GSxwrpOFwTJLP9bxGwBd/Dtc/zDxHm6UCfFNShR0O
	S/uvk4L2pIv953yR/8Cwj6feaWZ+OlRlh7pJIItSMJbWx+0mf12ArZyxwi+S1tUo9FkToVZzoCf
	hdoV8s=
X-Google-Smtp-Source: AGHT+IGAxN/JXh1EsU6InJKjwWnNX99YeFSCDuYAjM788AXYCd+mzZfDQU6t+N5nE5+MTj/X0VenBnfY0SKgi/lR+VM=
X-Received: by 2002:a05:6512:3e1f:b0:55a:826d:fa31 with SMTP id
 2adb3069b0e04-55a826dfcfemr569462e87.37.1753270383732; Wed, 23 Jul 2025
 04:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250717063042.2236524-1-christian.bruel@foss.st.com>
In-Reply-To: <20250717063042.2236524-1-christian.bruel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Jul 2025 13:32:52 +0200
X-Gm-Features: Ac12FXz0suPsP2VK94jurXo8uzOTltHa9LM0UQkrYO80w5wNLroNiLg4heFForw
Message-ID: <CACRpkdZHw8am05Qcjp7FJyo7D7bZcvzZKVjdB7BUCq3FuQCy8A@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/2] Add pinctrl_pm_select_init_state helper function
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-pci@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_043305_647979_0EED4DB2 
X-CRM114-Status: GOOD (  14.73  )
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

On Thu, Jul 17, 2025 at 8:33=E2=80=AFAM Christian Bruel
<christian.bruel@foss.st.com> wrote:

> We have the helper functions pinctrl_pm_select_default_state and
> pinctrl_pm_select_sleep_state.
> This patch adds the missing pinctrl_pm_select_init_state function.
>
> The STM32MP2 needs to set the pinctrl to an initial state during
> pm_resume, just like in probe. To achieve this, the function
> pinctrl_pm_select_init_state is added.
>
> This allows a driver to balance pinctrl_pm_select_sleep_state()
> with pinctrl_pm_select_default_state() and
> pinctrl_pm_select_init_state() in pm_runtime_suspend and pm_runtime_resum=
e.
>
> Christian Bruel (2):
>   pinctrl: Add pinctrl_pm_select_init_state helper function
>   PCI: stm32: use pinctrl_pm_select_init_state() in
>     stm32_pcie_resume_noirq()

If Bjorn Helgaas is OK with it I can apply this to the pinctrl tree.

Otherwise I can also just apply patch 1/2, but that doesn't solve
any problem.

What should I do?

Yours,
Linus Walleij

