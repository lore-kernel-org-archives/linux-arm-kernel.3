Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5577FEFB819
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFMF1p/NhgPyfcfJVx2kwxOkhOs0n4JLtEKgCarBr6g=; b=hTcFqrEv+6n5Vpt52GhrYHAznn
	KqbuqOSviKPuCt+dZerzgJoSUcl/D1QmeFwVWu+0Y7TImsSii6tNnMiRTykc1ogH3ghNZjuvYwK/O
	4/P66AMI/WsPOXDWMEB+4jAxTNLuDsqYtVJsHvPRbRUxO3eJ1H2ECM0E7WR+ZxNjJ1vth1cOva+wn
	VxbmLP6xSBQEKkBs0dzbQY7daDxPcPv4MmfOFk8ncR7O8E3sqN3ze6JCWxQMpswvSGH9874ABcRjk
	y0BQoZyvpLWZ3A8eM8858D/g8sIRsxSJRmRZmfqYr6MCPUM89nGxYZ9dDBS3/t8a85oWa0pXaNJgH
	2jj/iskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo9d-00000001fs1-0oet;
	Tue, 24 Feb 2026 08:52:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo9b-00000001frC-2mVo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 08:52:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCBB1444AE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 08:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA40EC2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923146;
	bh=ZyS0H8QHSpm79D9MEZf7/yBV87yLDH23GUMf+3RQhgw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bdZLfJFYe8+5f4w5dXjUq9zEPQylxyYsRi7aQI4Yxc5juIhLOBp520VtFeA83PFJd
	 GVwiB9H4EWldl8WbHU250eVz8ODEGFRMNYw3ewblcpqchUwYmA1q8k3cjpydaXVyDm
	 NRMlWc7PSCLznKCKUKrQzEP37Nm8pTMwxIEiffhvLab5Wq1Ve/rRm1hO+XNvR0NLy0
	 chmQteHW114LSglO1tBEG6GRYYM2Z/vyWAjDvtimBlq1J5xHBpv1a0bt3yGAiEL7nN
	 qjshPEk7p4V9BEel6nsvxOaSZVKi5VOFQFXkpwWOBYSHYVpi+TUXff+LhqfX0wILo3
	 S8Z1JbBSNq0Jw==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7947cf097c1so48402707b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 00:52:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXy+HN36hwr0dJghhkEJAumlvc3maVp9ZElYrSahnRXl/g9q1//hWmN64/qFFjFU5gVn9QAHfrnDbebnBTPO+VI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb5RgFNysQb7lNWsgSwb8HYnVcLdKl21qOxwlQ0EJ6/jusTW7X
	QTxPdPsrTdKn+Lo7Vk6L2lpQ4qKwDe6EDLry2aYsB/Z8TfjR6BnvU8pCQr5foM9cDI8ZE4bAIPL
	FR7X3AgEOKnzxOoQxxpL91Zpol4qOE14=
X-Received: by 2002:a05:690c:6d12:b0:796:55b1:a141 with SMTP id
 00721157ae682-798291429d7mr103365377b3.55.1771923146101; Tue, 24 Feb 2026
 00:52:26 -0800 (PST)
MIME-Version: 1.0
References: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com> <20260216085838.71518-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216085838.71518-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:52:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLnBNSMC2i2JSZaB1bYuJxScjNNB1A46hQbcxoJ1wzP4PQ@mail.gmail.com>
X-Gm-Features: AaiRm535ELoqE6GjQBWumJZZYU3O-QZV3s4JmiiXSufeK5gb-Em4xaITPZHJBsA
Message-ID: <CAD++jLnBNSMC2i2JSZaB1bYuJxScjNNB1A46hQbcxoJ1wzP4PQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: cix: sky1: Unexport sky1_pinctrl_pm_ops
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_005227_726448_8CFB2A4E 
X-CRM114-Status: UNSURE (   9.60  )
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

On Mon, Feb 16, 2026 at 9:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> File-scope 'sky1_pinctrl_pm_ops' is not used outside of this unit (and
> it should not be!), so unexport it and make it static to silence sparse
> warning:
>
>   pinctrl-sky1.c:525:25: warning: symbol 'sky1_pinctrl_pm_ops' was not de=
clared. Should it be static?
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

